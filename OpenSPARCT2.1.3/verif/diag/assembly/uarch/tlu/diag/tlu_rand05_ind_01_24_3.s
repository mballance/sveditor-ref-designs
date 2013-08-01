/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_01_24_3.s
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

#define H_HT0_mem_real_range_0x2d
#define SUN_H_HT0_mem_real_range_0x2d \
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
# 717 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_unauth_access_0x0b
#define SUN_H_HT0_IAE_unauth_access_0x0b \
    done;nop
# 722 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_IAE_nfo_page_0x0c
#define SUN_H_HT0_IAE_nfo_page_0x0c \
    done;nop
# 731 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 12 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!! START of Interrupt Handlers !!!!!!!!!!!!!!!!!

#define H_HT0_Externally_Initiated_Reset_0x03
#define SUN_H_HT0_Externally_Initiated_Reset_0x03 \
    ldxa    [%g0] ASI_LSU_CTL_REG, %g1; \
    set cregs_lsu_ctl_reg_r64, %g1; \
    stxa    %g1, [%g0] ASI_LSU_CTL_REG; \
    retry;nop

#define My_External_Reset \
    ldxa    [%g0] ASI_LSU_CTL_REG, %g1; \
    set cregs_lsu_ctl_reg_r64, %g1; \
    stxa    %g1, [%g0] ASI_LSU_CTL_REG; \
    retry;nop

!!!!! SPU Interrupt Handlers

#define H_HT0_Control_Word_Queue_Interrupt_0x3c
#define My_HT0_Control_Word_Queue_Interrupt_0x3c \
    	mov 0x20,%g1; mov 1, %g2;stxa %g2,[%g1]0x40; retry

#define H_HT0_Modular_Arithmetic_Interrupt_0x3d
#define My_H_HT0_Modular_Arithmetic_Interrupt_0x3d \
    	mov 0x80,%g1; stxa %g0,[%g1]0x40; retry
# 39 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 53 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 153 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 156 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 201 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 204 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
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
# 694 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 277 "diag.j"
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
    set retry_with_base_tba, %g3;\
    jmp %g3;\
    nop

#define SUN_H_HT0_IAE_nfo_page_0x0c \
    set retry_with_base_tba, %g3;\
    jmp %g3;\
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
	mov 0xb4, %r14
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
	mov 0xb1, %r14
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
	mov 0x35, %r14
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
	mov 0xb4, %r14
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
	mov 0xb5, %r14
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
	mov 0xb3, %r14
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
	invalw
	mov 0x35, %r30
splash_cmpr_7_0:
	setx 0x74f34ac25ca2d18f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_1:
	setx 0x5e52aa3078728765, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_2:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 3: RDPC	rd	%pc, %r10
	.word 0x91d020b2  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_hpstate_7_3:
	.word 0x8198274f  ! 5: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074f, %hpstate
donret_7_4:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_4-donret_7_4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x115b, %tstate
    wrhpr %g0, 0x11d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (7)
	retry
donretarg_7_4:
	.word 0xe6ffee7d  ! 6: SWAPA_I	swapa	%r19, [%r31 + 0x0e7d] %asi
	.word 0x38700001  ! 7: BPGU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_5:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 8: RDPC	rd	%pc, %r9
	.word 0x95a409d4  ! 9: FDIVd	fdivd	%f16, %f20, %f10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196c  ! 10: FqTOd	dis not found

mondo_7_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d93000b  ! 11: WRPR_WSTATE_R	wrpr	%r12, %r11, %wstate
splash_hpstate_7_8:
	.word 0x8198211e  ! 12: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011e, %hpstate
mondo_7_9:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d950001  ! 13: WRPR_WSTATE_R	wrpr	%r20, %r1, %wstate
	.word 0xd80fee7d  ! 14: LDUB_I	ldub	[%r31 + 0x0e7d], %r12
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_10:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 15: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa9840003  ! 16: WR_SET_SOFTINT_R	wr	%r16, %r3, %set_softint
	setx 0x8178d0a10f016654, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a00171  ! 18: FABSq	dis not found

	.word 0x91d02033  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_12) + 0, 16, 16)) -> intp(3,0,12)
intvec_7_12:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_7_13:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 21: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902c94  ! 22: WRPR_PSTATE_I	wrpr	%r0, 0x0c94, %pstate
	.word 0xab82c007  ! 23: WR_CLEAR_SOFTINT_R	wr	%r11, %r7, %clear_softint
memptr_7_14:
	set 0x60140000, %r31
	.word 0x8582bd72  ! 24: WRCCR_I	wr	%r10, 0x1d72, %ccr
	setx 0xf39ad2d5d33c4838, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_15:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936960bb  ! 26: SDIVX_I	sdivx	%r5, 0x00bb, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36c28d1  ! 27: SDIVX_I	sdivx	%r16, 0x08d1, %r17
mondo_7_18:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d948001  ! 28: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
mondo_7_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d94400c  ! 29: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_20:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e009  ! 30: CASA_R	casa	[%r31] %asi, %r9, %r11
	.word 0x95a249d1  ! 31: FDIVd	fdivd	%f40, %f48, %f10
	.word 0xe2800bc0  ! 32: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r17
splash_cmpr_7_21:
	setx 0x9353de7640a46acc, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a00173  ! 34: FABSq	dis not found

pmu_7_22:
	nop
	setx 0xfffff596fffff5ce, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_7_23:
	nop
	setx 0xfffff850fffff3a0, %g1, %g7
	.word 0xa3800007  ! 36: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_7_24:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_24:
	.word 0x8f902001  ! 37: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_25:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 38: RDPC	rd	%pc, %r18
	.word 0xab80a390  ! 39: WR_CLEAR_SOFTINT_I	wr	%r2, 0x0390, %clear_softint
memptr_7_26:
	set 0x60740000, %r31
	.word 0x8584ba0f  ! 40: WRCCR_I	wr	%r18, 0x1a0f, %ccr
	rd %pc, %r19
	add %r19, (ivw_7_27-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_27:
	.word 0x91908010  ! 41: WRPR_PIL_R	wrpr	%r2, %r16, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6a61ea  ! 42: SDIVX_I	sdivx	%r9, 0x01ea, %r13
intveclr_7_29:
	setx 0xd94a53206f4803d2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_30) + 40, 16, 16)) -> intp(0,0,7)
intvec_7_30:
	.word 0x39400001  ! 44: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_7_31:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 45: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196c  ! 46: FqTOd	dis not found

	setx 0x0708503a53015acc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_33:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_7_34:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 48: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_7_35:
	setx 0x5e50874af0926568, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 49: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_7_36:
	.word 0x81982315  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0315, %hpstate
	.word 0x9ba00165  ! 51: FABSq	dis not found

	.word 0x8d902aa7  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x0aa7, %pstate
	rd %pc, %r19
	add %r19, (ivw_7_37-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_37:
	.word 0x9191c001  ! 53: WRPR_PIL_R	wrpr	%r7, %r1, %pil
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_38:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 54: RDPC	rd	%pc, %r8
	.word 0x97a00171  ! 55: FABSq	dis not found

debug_7_39:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 56: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
splash_cmpr_7_40:
	setx 0xd861b9abf056466b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 57: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd31fc000  ! 58: LDDF_R	ldd	[%r31, %r0], %f9
debug_7_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 59: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_42:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 60: RDPC	rd	%pc, %r13
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_43:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 61: RDPC	rd	%pc, %r12
	.word 0xd537fc6d  ! 62: STQF_I	-	%f10, [0x1c6d, %r31]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01974  ! 63: FqTOd	dis not found

pmu_7_45:
	nop
	setx 0xfffff7bdfffff6c7, %g1, %g7
	.word 0xa3800007  ! 64: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_7_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d91000b  ! 65: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
DS_7_47:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd1300014  ! 1: STQF_R	-	%f8, [%r20, %r0]
	normalw
	.word 0x95458000  ! 66: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xe0c7e030  ! 67: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_48) + 48, 16, 16)) -> intp(6,0,9)
intvec_7_48:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_7_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_49-donret_7_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xa00, %tstate
    wrhpr %g0, 0x9dc, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (7)
	done
donretarg_7_49:
	.word 0xe0fffc6d  ! 69: SWAPA_I	swapa	%r16, [%r31 + 0xfffffc6d] %asi
	.word 0x8d90229e  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x029e, %pstate
pmu_7_50:
	nop
	setx 0xfffff2bafffff047, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36876f8  ! 72: SDIVX_I	sdivx	%r1, 0xfffff6f8, %r17
	.word 0x91d02032  ! 73: Tcc_I	ta	icc_or_xcc, %r0 + 50
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_52:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e002  ! 74: CASA_R	casa	[%r31] %asi, %r2, %r11
mondo_7_53:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 75: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
memptr_7_54:
	set user_data_start, %r31
	.word 0x85802537  ! 76: WRCCR_I	wr	%r0, 0x0537, %ccr
splash_lsu_7_55:
	setx 0x3da5694b8db3cbb7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 77: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_56:
	.word 0x81982d05  ! 78: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d05, %hpstate
splash_cmpr_7_57:
	setx 0x52e1898c47c2b69b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 79: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 80: BPGE	<illegal instruction>
pmu_7_58:
	nop
	setx 0xfffff8bdfffff443, %g1, %g7
	.word 0xa3800007  ! 81: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_59:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 82: RDPC	rd	%pc, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01962  ! 83: FqTOd	dis not found

splash_cmpr_7_61:
	setx 0x139c85866dbeae04, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 84: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe927f7c3  ! 85: STF_I	st	%f20, [0x17c3, %r31]
splash_tba_7_62:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_7_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d92c00b  ! 87: WRPR_WSTATE_R	wrpr	%r11, %r11, %wstate
	.word 0x93d02035  ! 88: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa7a349c1  ! 89: FDIVd	fdivd	%f44, %f32, %f50
	rd %pc, %r19
	add %r19, (ivw_7_64-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_64:
	.word 0x91950009  ! 90: WRPR_PIL_R	wrpr	%r20, %r9, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_65)+8, 16, 16)) -> intp(7,1,3)
xir_7_65:
	.word 0xa984ff18  ! 91: WR_SET_SOFTINT_I	wr	%r19, 0x1f18, %set_softint
change_to_randtl_7_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_66:
	.word 0x8f902002  ! 92: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	setx 0x1a5526b578421e96, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_67:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_68) + 56, 16, 16)) -> intp(2,0,29)
intvec_7_68:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902b46  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x0b46, %pstate
	.word 0xe08008a0  ! 96: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8d9031bb  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x11bb, %pstate
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0c7e010  ! 99: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r16
	setx 0x7f08aacd6eba9a28, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_69:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_7_70:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 101: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 102: RD_STICK_REG	stbar
	rd %pc, %r19
	add %r19, (ivw_7_71-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_71:
	.word 0x9193400c  ! 103: WRPR_PIL_R	wrpr	%r13, %r12, %pil
	.word 0x99902004  ! 104: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
change_to_randtl_7_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_72:
	.word 0x8f902000  ! 105: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_7_73:
	setx 0x0c04ae6a133d9f3d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 107: CASA_R	casa	[%r31] %asi, %r10, %r16
	.word 0x26800001  ! 108: BL	bl,a	<label_0x1>
splash_hpstate_7_75:
	.word 0x8198277d  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x077d, %hpstate
intveclr_7_76:
	setx 0xfd8f11cd22754408, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 110: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe00fc000  ! 111: LDUB_R	ldub	[%r31 + %r0], %r16
donret_7_77:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_77-donret_7_77-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xa0f, %tstate
    wrhpr %g0, 0xc17, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (7)
	done
donretarg_7_77:
	.word 0xe0ffe388  ! 112: SWAPA_I	swapa	%r16, [%r31 + 0x0388] %asi
change_to_randtl_7_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_78:
	.word 0x8f902000  ! 113: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f8034e8  ! 114: SIR	sir	0x14e8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76ae95c  ! 115: SDIVX_I	sdivx	%r11, 0x095c, %r19
memptr_7_80:
	set 0x60740000, %r31
	.word 0x85837dff  ! 116: WRCCR_I	wr	%r13, 0x1dff, %ccr
mondo_7_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d914013  ! 117: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
DS_7_82:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 118: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	setx 0x79c5fa59f72a1a59, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d930006  ! 120: WRPR_WSTATE_R	wrpr	%r12, %r6, %wstate
	setx 0x7762bddfef9a146c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_85:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902004  ! 122: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
donret_7_86:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_86-donret_7_86), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1bc9, %tstate
    wrhpr %g0, 0xe54, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (7)
	retry
donretarg_7_86:
	.word 0xe8ffecb2  ! 123: SWAPA_I	swapa	%r20, [%r31 + 0x0cb2] %asi
DS_7_87:
	.word 0x99a4c9d0  ! 1: FDIVd	fdivd	%f50, %f16, %f12
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5140007  ! 1: LDQF_R	-	[%r16, %r7], %f10
	.word 0x93a28831  ! 124: FADDs	fadds	%f10, %f17, %f9
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_88:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 125: CASA_R	casa	[%r31] %asi, %r16, %r12
splash_cmpr_7_89:
	setx 0x8a2504ab49738e40, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 126: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_90) + 0, 16, 16)) -> intp(7,0,5)
intvec_7_90:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_91:
	.word 0x8f902002  ! 128: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_7_92:
	setx 0xab0f121d0d543b31, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x638, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb087f2  ! 130: PDISTN	fmean16	%d2, %d18, %d44
	.word 0xd477c000  ! 131: STX_R	stx	%r10, [%r31 + %r0]
	setx 0x769d841d0e27067a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_93:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 133: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_7_94:
	setx 0x498614a756db2d47, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_95:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 135: CASA_R	casa	[%r31] %asi, %r10, %r10
	.word 0x8d903bcc  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x1bcc, %pstate
	.word 0x99902003  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
memptr_7_96:
	set user_data_start, %r31
	.word 0x85842c76  ! 138: WRCCR_I	wr	%r16, 0x0c76, %ccr
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_97:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 139: RDPC	rd	%pc, %r8
	rd %pc, %r19
	add %r19, (ivw_7_98-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_98:
	.word 0x91900001  ! 140: WRPR_PIL_R	wrpr	%r0, %r1, %pil
memptr_7_99:
	set user_data_start, %r31
	.word 0x85843d87  ! 141: WRCCR_I	wr	%r16, 0x1d87, %ccr
splash_hpstate_7_100:
	.word 0x81982107  ! 142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0107, %hpstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_101:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 143: RDPC	rd	%pc, %r16
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_102:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 144: RDPC	rd	%pc, %r18
	.word 0x8d9023b3  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x03b3, %pstate
	.word 0x3a700001  ! 146: BPCC	<illegal instruction>
    set 0x266f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b447f3  ! 147: PDISTN	fmean16	%d48, %d50, %d10
splash_cmpr_7_103:
	setx 0x78d74c38fb7a958d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_104:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa15cfe08	! Random illegal ?
	.word 0xa3a209c3  ! 1: FDIVd	fdivd	%f8, %f34, %f48
	.word 0x93a08820  ! 149: FADDs	fadds	%f2, %f0, %f9
mondo_7_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d904008  ! 150: WRPR_WSTATE_R	wrpr	%r1, %r8, %wstate
	.word 0x9350c000  ! 151: RDPR_TT	rdpr	%tt, %r9
memptr_7_106:
	set 0x60740000, %r31
	.word 0x8584b175  ! 152: WRCCR_I	wr	%r18, 0x1175, %ccr
	setx 0x84ea08b62502943f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_107:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9814014  ! 154: WR_SET_SOFTINT_R	wr	%r5, %r20, %set_softint
	.word 0xe297e010  ! 155: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_108:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 156: RDPC	rd	%pc, %r8
	setx 0x257caf5c0c5ed1b0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_109:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93480000  ! 158: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x95a00166  ! 159: FABSq	dis not found

DS_7_110:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f28, %f28, %f24
	.word 0x95b30312  ! 160: ALIGNADDRESS	alignaddr	%r12, %r18, %r10
	.word 0x2a700001  ! 161: BPCS	<illegal instruction>
DS_7_111:
	.word 0x99a509c1  ! 1: FDIVd	fdivd	%f20, %f32, %f12
	allclean
	.word 0xa9b0c30b  ! 162: ALIGNADDRESS	alignaddr	%r3, %r11, %r20
debug_7_112:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97693fcf  ! 164: SDIVX_I	sdivx	%r4, 0xffffffcf, %r11
	.word 0xe897e020  ! 165: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r20
	.word 0xe8dfe000  ! 166: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_114:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 167: RDPC	rd	%pc, %r12
	.word 0xe48008a0  ! 168: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	rd %pc, %r19
	add %r19, (ivw_7_115-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_115:
	.word 0x9194c003  ! 169: WRPR_PIL_R	wrpr	%r19, %r3, %pil
debug_7_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93d02034  ! 171: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_cmpr_7_117:
	setx 0x70077c8973ab5295, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_118:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe457fe3c  ! 174: LDSH_I	ldsh	[%r31 + 0xfffffe3c], %r18
tagged_7_119:
	taddcctv %r15, 0x199a, %r6
	.word 0xe407fe3c  ! 175: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
pmu_7_120:
	nop
	setx 0xfffff3c8fffff230, %g1, %g7
	.word 0xa3800007  ! 176: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_7_121:
	setx 0xafbbbae98f918160, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e0] %asi
	.word 0x9d950013  ! 178: WRPR_WSTATE_R	wrpr	%r20, %r19, %wstate
tagged_7_123:
	taddcctv %r17, 0x1b79, %r13
	.word 0xe407fe3c  ! 179: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
	.word 0x93d02034  ! 180: Tcc_I	tne	icc_or_xcc, %r0 + 52
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 181: LDX_R	ldx	[%r31 + %r0], %r18
debug_7_124:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_7_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d918002  ! 183: WRPR_WSTATE_R	wrpr	%r6, %r2, %wstate
	rd %pc, %r19
	add %r19, (ivw_7_126-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_126:
	.word 0x91910003  ! 184: WRPR_PIL_R	wrpr	%r4, %r3, %pil
	setx 0xfbb343b1e0d12560, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_127:
	.word 0x39400001  ! 185: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_128) + 32, 16, 16)) -> intp(3,0,23)
intvec_7_128:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00162  ! 187: FABSq	dis not found

debug_7_129:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 188: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_130:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 189: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_lsu_7_131:
	setx 0x7b08ca8fa6c710a2, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00160  ! 191: FABSq	dis not found

	.word 0xd0cfe000  ! 192: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
intveclr_7_132:
	setx 0x24399b5c25a9df1d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 180
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_133:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 195: RDPC	rd	%pc, %r11
splash_cmpr_7_134:
	setx 0xb0a0b94f51316246, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_135:
	setx 0x03424d1c49496208, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06ffe3c  ! 198: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe3c]
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_136:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 199: CASA_R	casa	[%r31] %asi, %r9, %r16
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_137
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_137:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 200: RDPC	rd	%pc, %r13
	.word 0x3e800001  ! 201: BVC	bvc,a	<label_0x1>
intveclr_7_138:
	setx 0x07c87daea57e2e12, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 202: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_7_139:
	setx 0x7285e8f66bd3379e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 203: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 204: Tcc_I	ta	icc_or_xcc, %r0 + 51
donret_7_140:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_140-donret_7_140), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x18b, %tstate
    wrhpr %g0, 0xa4f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (7)
	retry
donretarg_7_140:
	.word 0xd8fffe3c  ! 205: SWAPA_I	swapa	%r12, [%r31 + 0xfffffe3c] %asi
splash_htba_7_141:
	set 0x00390000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 206: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_7_142:
	setx 0x98130a63d2e3e4b4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_7_144:
	.word 0x819827d7  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d7, %hpstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_145:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 210: CASA_R	casa	[%r31] %asi, %r9, %r12
splash_cmpr_7_146:
	setx 0x2c91ea6c04fc639a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 211: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_147:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 212: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0xab80f69d  ! 213: WR_CLEAR_SOFTINT_I	wr	%r3, 0x169d, %clear_softint
intveclr_7_148:
	setx 0xf0d1485a233f1730, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_149)+0, 16, 16)) -> intp(7,1,3)
xir_7_149:
	.word 0xa9843f7d  ! 215: WR_SET_SOFTINT_I	wr	%r16, 0x1f7d, %set_softint
pmu_7_150:
	nop
	setx 0xfffffc39fffff0f9, %g1, %g7
	.word 0xa3800007  ! 216: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_7_151:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_151:
	.word 0x8f902002  ! 217: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x26700001  ! 218: BPL	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_152) + 8, 16, 16)) -> intp(1,0,20)
intvec_7_152:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a00168  ! 220: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_7_153-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_153:
	.word 0x9192c003  ! 221: WRPR_PIL_R	wrpr	%r11, %r3, %pil
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_154
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_154:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 222: RDPC	rd	%pc, %r18
	.word 0x91d02032  ! 223: Tcc_I	ta	icc_or_xcc, %r0 + 50
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 224: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_7_156:
	setx 0x64ef62494569b17f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_7_157:
	setx 0x5ef98e28d26744b3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a00174  ! 227: FABSq	dis not found

splash_cmpr_7_158:
	setx 0xdb0a57aff7c56b72, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_159:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 229: RDPC	rd	%pc, %r17
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_160:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 230: RDPC	rd	%pc, %r11
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_161
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_161
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_161:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 231: RDPC	rd	%pc, %r12
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_162
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_162:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 232: RDPC	rd	%pc, %r12
	setx 0xce7e2aad85b32e2e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_163:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_7_164:
	nop
	setx 0xfffffe5bfffff63f, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x9c49aa06aa594613, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_165:
	.word 0x39400001  ! 235: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56aa62a  ! 236: SDIVX_I	sdivx	%r10, 0x062a, %r18
	.word 0x83d02033  ! 237: Tcc_I	te	icc_or_xcc, %r0 + 51
mondo_7_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d918001  ! 238: WRPR_WSTATE_R	wrpr	%r6, %r1, %wstate
splash_cmpr_7_168:
	setx 0x12dfc16e572cbc49, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d910002  ! 240: WRPR_WSTATE_R	wrpr	%r4, %r2, %wstate
mondo_7_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d944001  ! 241: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
splash_cmpr_7_171:
	setx 0xf737345c837b863e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 242: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_172) + 48, 16, 16)) -> intp(6,0,25)
intvec_7_172:
	.word 0x39400001  ! 243: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_173:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x9ba4c9d0  ! 245: FDIVd	fdivd	%f50, %f16, %f44
	.word 0xda800ae0  ! 246: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r13
splash_hpstate_7_174:
	.word 0x81982bb4  ! 247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bb4, %hpstate
	setx 0xc58fdcafc00c218b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_175:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_176:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r13
	.word 0x91480000  ! 250: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xd64fc000  ! 251: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0xd60ff241  ! 252: LDUB_I	ldub	[%r31 + 0xfffff241], %r11
	.word 0x8d903d62  ! 253: WRPR_PSTATE_I	wrpr	%r0, 0x1d62, %pstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_177:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 254: RDPC	rd	%pc, %r18
splash_hpstate_7_178:
	.word 0x81982f0f  ! 255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0f, %hpstate
mondo_7_179:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d904007  ! 256: WRPR_WSTATE_R	wrpr	%r1, %r7, %wstate
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 257: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_7_180:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 258: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0xa7464000  ! 259: RD_STICK_CMPR_REG	rd	%-, %r19
intveclr_7_181:
	setx 0xe406f716b0a34bcc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1a4c9c1  ! 261: FDIVd	fdivd	%f50, %f32, %f16
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
	.word 0x97414000  ! 262: RDPC	rd	%pc, %r11
	rd %pc, %r19
	add %r19, (ivw_7_183-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_183:
	.word 0x91940013  ! 263: WRPR_PIL_R	wrpr	%r16, %r19, %pil
intveclr_7_184:
	setx 0x78ecc640480f02cf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 264: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_185:
	setx 0x9b50afef0a3963bb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 265: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_7_186:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d90c005  ! 266: WRPR_WSTATE_R	wrpr	%r3, %r5, %wstate
	rd %pc, %r19
	add %r19, (ivw_7_187-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_187:
	.word 0x91948000  ! 267: WRPR_PIL_R	wrpr	%r18, %r0, %pil
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_188:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 268: CASA_R	casa	[%r31] %asi, %r19, %r13
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_189:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 269: RDPC	rd	%pc, %r8
intveclr_7_190:
	setx 0xbfc99612a5cae7c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 270: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_191:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_191:
	.word 0x8f902003  ! 271: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
DS_7_192:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 272: RESTORE_R	restore	%r31, %r0, %r31
mondo_7_193:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d92400b  ! 273: WRPR_WSTATE_R	wrpr	%r9, %r11, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_194) + 32, 16, 16)) -> intp(5,0,26)
intvec_7_194:
	.word 0x39400001  ! 274: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d91c004  ! 275: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_196:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 276: RDPC	rd	%pc, %r8
debug_7_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 277: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa7500000  ! 278: RDPR_TPC	rdpr	%tpc, %r19
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_198:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 279: RDPC	rd	%pc, %r9
pmu_7_199:
	nop
	setx 0xffffffc4fffffb45, %g1, %g7
	.word 0xa3800007  ! 280: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa5a00164  ! 281: FABSq	dis not found

mondo_7_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d93000a  ! 282: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
	.word 0x30800001  ! 283: BA	ba,a	<label_0x1>
pmu_7_201:
	nop
	setx 0xffffff0bfffff7c4, %g1, %g7
	.word 0xa3800007  ! 284: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_7_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d91c00b  ! 285: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
DS_7_203:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
memptr_7_204:
	set user_data_start, %r31
	.word 0x858027be  ! 287: WRCCR_I	wr	%r0, 0x07be, %ccr
	.word 0x20800001  ! 288: BN	bn,a	<label_0x1>
pmu_7_205:
	nop
	setx 0xfffff60ffffffc1f, %g1, %g7
	.word 0xa3800007  ! 289: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_206) + 40, 16, 16)) -> intp(7,0,2)
intvec_7_206:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_207:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 291: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8d902df5  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x0df5, %pstate
	.word 0xda37e0b8  ! 293: STH_I	sth	%r13, [%r31 + 0x00b8]
DS_7_208:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 294: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 296: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01960  ! 297: FqTOd	dis not found

debug_7_211:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 298: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_7_212:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d918003  ! 299: WRPR_WSTATE_R	wrpr	%r6, %r3, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976b7dc0  ! 300: SDIVX_I	sdivx	%r13, 0xfffffdc0, %r11
	.word 0x93a149c5  ! 301: FDIVd	fdivd	%f36, %f36, %f40
	.word 0x8d9030ab  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x10ab, %pstate
intveclr_7_214:
	setx 0x8942950d7b4c4d7f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01974  ! 304: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_216
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_216:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 305: RDPC	rd	%pc, %r8
intveclr_7_217:
	setx 0xa0a94ff8988f9e89, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa3500000  ! 307: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x91a509d3  ! 308: FDIVd	fdivd	%f20, %f50, %f8
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_218:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 309: RDPC	rd	%pc, %r13
donret_7_219:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_219-donret_7_219-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x886, %tstate
    wrhpr %g0, 0xf47, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (7)
	done
donretarg_7_219:
	.word 0xe6ffe4a4  ! 310: SWAPA_I	swapa	%r19, [%r31 + 0x04a4] %asi
	rd %pc, %r19
	add %r19, (ivw_7_220-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_220:
	.word 0x9194800c  ! 311: WRPR_PIL_R	wrpr	%r18, %r12, %pil
intveclr_7_221:
	setx 0x035f458bad324760, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d944007  ! 313: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
	.word 0xe68008a0  ! 314: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x93454000  ! 315: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
donret_7_223:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_223-donret_7_223-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1397, %tstate
    wrhpr %g0, 0x844, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (7)
	done
donretarg_7_223:
	.word 0xd6ffe4a4  ! 316: SWAPA_I	swapa	%r11, [%r31 + 0x04a4] %asi
intveclr_7_224:
	setx 0xb70b79943aa047e0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 317: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_7_225:
	.word 0x8198287c  ! 318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x087c, %hpstate
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
	.word 0xa7414000  ! 319: RDPC	rd	%pc, %r19
	.word 0xe607c000  ! 320: LDUW_R	lduw	[%r31 + %r0], %r19
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 321: CASA_R	casa	[%r31] %asi, %r20, %r19
memptr_7_228:
	set user_data_start, %r31
	.word 0x85807148  ! 322: WRCCR_I	wr	%r1, 0x1148, %ccr
	.word 0x93d02033  ! 323: Tcc_I	tne	icc_or_xcc, %r0 + 51
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_229:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 324: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0x8d902778  ! 325: WRPR_PSTATE_I	wrpr	%r0, 0x0778, %pstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_230:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 326: RDPC	rd	%pc, %r9
mondo_7_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d94c003  ! 327: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
debug_7_232:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 328: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_233)+32, 16, 16)) -> intp(7,1,3)
xir_7_233:
	.word 0xa98221f9  ! 329: WR_SET_SOFTINT_I	wr	%r8, 0x01f9, %set_softint
DS_7_234:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 330: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x99902003  ! 331: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
mondo_7_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d930012  ! 332: WRPR_WSTATE_R	wrpr	%r12, %r18, %wstate
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 333: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_7_236-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_236:
	.word 0x9191c005  ! 334: WRPR_PIL_R	wrpr	%r7, %r5, %pil
DS_7_237:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 335: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd01fff3e  ! 336: LDD_I	ldd	[%r31 + 0xffffff3e], %r8
	.word 0x8d902066  ! 337: WRPR_PSTATE_I	wrpr	%r0, 0x0066, %pstate
	.word 0xd03fff3e  ! 338: STD_I	std	%r8, [%r31 + 0xffffff3e]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196a  ! 339: FqTOd	dis not found

	.word 0x8d9039cf  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x19cf, %pstate
pmu_7_239:
	nop
	setx 0xfffffbb1fffffb85, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_240:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 342: RDPC	rd	%pc, %r9
mondo_7_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d944002  ! 343: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
intveclr_7_242:
	setx 0x1f59e70ed4eeb36c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93454000  ! 345: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
mondo_7_243:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d914011  ! 346: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01966  ! 347: FqTOd	dis not found

	.word 0x93540000  ! 348: RDPR_GL	rdpr	%-, %r9
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_245
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_245:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e001  ! 349: CASA_R	casa	[%r31] %asi, %r1, %r8
	.word 0xa7a00171  ! 350: FABSq	dis not found

memptr_7_246:
	set user_data_start, %r31
	.word 0x858223f2  ! 351: WRCCR_I	wr	%r8, 0x03f2, %ccr
	.word 0xd477c000  ! 352: STX_R	stx	%r10, [%r31 + %r0]
	.word 0x8d902234  ! 353: WRPR_PSTATE_I	wrpr	%r0, 0x0234, %pstate
memptr_7_247:
	set 0x60140000, %r31
	.word 0x8580bb20  ! 354: WRCCR_I	wr	%r2, 0x1b20, %ccr
	.word 0xd46ff8e6  ! 355: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
    set 0x2fed, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b007f1  ! 356: PDISTN	fmean16	%d0, %d48, %d20
mondo_7_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d90c00d  ! 357: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
	.word 0x26800001  ! 358: BL	bl,a	<label_0x1>
pmu_7_249:
	nop
	setx 0xfffff94bfffff1d6, %g1, %g7
	.word 0xa3800007  ! 359: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46ff8e6  ! 360: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
change_to_randtl_7_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_250:
	.word 0x8f902000  ! 361: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_7_251:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_252
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_252:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e007  ! 363: CASA_R	casa	[%r31] %asi, %r7, %r10
debug_7_253:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 364: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99902001  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_254)+16, 16, 16)) -> intp(7,1,3)
xir_7_254:
	.word 0xa984f1f5  ! 366: WR_SET_SOFTINT_I	wr	%r19, 0x11f5, %set_softint
	.word 0x8d903f0d  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x1f0d, %pstate
intveclr_7_255:
	setx 0xb7bda41a824bef5f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 368: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa950c000  ! 369: RDPR_TT	rdpr	%tt, %r20
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_256
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_256:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 370: RDPC	rd	%pc, %r20
	.word 0x91500000  ! 371: RDPR_TPC	<illegal instruction>
	.word 0x9345c000  ! 372: RD_TICK_CMPR_REG	rd	%-, %r9
splash_cmpr_7_257:
	setx 0x206f7cf982dc95c2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_258:
	setx 0xa61f18b8ba984c49, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 374: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xc5674bc550abcce5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_259:
	.word 0x39400001  ! 375: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97480000  ! 376: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_260:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 377: CASA_R	casa	[%r31] %asi, %r7, %r19
mondo_7_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e0] %asi
	.word 0x9d910007  ! 378: WRPR_WSTATE_R	wrpr	%r4, %r7, %wstate
intveclr_7_262:
	setx 0x8a3cd3c02fd413dd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 380: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe68008a0  ! 381: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe63fc000  ! 382: STD_R	std	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_7_264-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_264:
	.word 0x9194800c  ! 383: WRPR_PIL_R	wrpr	%r18, %r12, %pil
splash_cmpr_7_265:
	setx 0xe9edf7254069e188, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 384: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 385: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0x0ae86d16470ca2cd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_267:
	.word 0x39400001  ! 386: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902ebc  ! 387: WRPR_PSTATE_I	wrpr	%r0, 0x0ebc, %pstate
	.word 0x28700001  ! 388: BPLEU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_268:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 389: RDPC	rd	%pc, %r10
	.word 0xad8138ee  ! 390: WR_SOFTINT_REG_I	wr	%r4, 0x18ee, %softint
	.word 0xa7800006  ! 391: WR_GRAPHICS_STATUS_REG_R	wr	%r0, %r6, %-
DS_7_270:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd530fd2a  ! 1: STQF_I	-	%f10, [0x1d2a, %r3]
	normalw
	.word 0xa7458000  ! 392: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xe537c000  ! 393: STQF_R	-	%f18, [%r0, %r31]
intveclr_7_271:
	setx 0xe4bec613cb00c179, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 395: RDPC	rd	%pc, %r18
mondo_7_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d914001  ! 396: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
	.word 0xe08008a0  ! 397: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x26800001  ! 398: BL	bl,a	<label_0x1>
splash_cmpr_7_274:
	setx 0x70cb5f47cdb6aead, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5682364  ! 400: SDIVX_I	sdivx	%r0, 0x0364, %r18
DS_7_276:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
intveclr_7_277:
	setx 0xc37d467b03b52b59, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 402: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_278:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 403: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
pmu_7_279:
	nop
	setx 0xfffff1a7fffffc20, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_7_280-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_280:
	.word 0x9192c010  ! 405: WRPR_PIL_R	wrpr	%r11, %r16, %pil
debug_7_281:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 406: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_7_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_282-donret_7_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x198d, %tstate
    wrhpr %g0, 0xd4e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (7)
	retry
donretarg_7_282:
	.word 0xe6ffe2b9  ! 407: SWAPA_I	swapa	%r19, [%r31 + 0x02b9] %asi
mondo_7_283:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d930007  ! 408: WRPR_WSTATE_R	wrpr	%r12, %r7, %wstate
splash_tba_7_284:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 409: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa780800a  ! 410: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r10, %-
	.word 0xa9a00173  ! 411: FABSq	dis not found

intveclr_7_286:
	setx 0x502ee220313bf249, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 412: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_7_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_7_287:
	.word 0x8f902002  ! 413: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_7_288:
	tsubcctv %r22, 0x1f7a, %r26
	.word 0xd207e2b9  ! 414: LDUW_I	lduw	[%r31 + 0x02b9], %r9
	.word 0x91d020b3  ! 415: Tcc_I	ta	icc_or_xcc, %r0 + 179
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 416: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902658  ! 417: WRPR_PSTATE_I	wrpr	%r0, 0x0658, %pstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_289
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_289:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 418: RDPC	rd	%pc, %r18
tagged_7_290:
	tsubcctv %r16, 0x13a4, %r5
	.word 0xe407e2b9  ! 419: LDUW_I	lduw	[%r31 + 0x02b9], %r18
	.word 0x9ba00168  ! 420: FABSq	dis not found

memptr_7_291:
	set user_data_start, %r31
	.word 0x85836e04  ! 421: WRCCR_I	wr	%r13, 0x0e04, %ccr
splash_cmpr_7_292:
	setx 0x197c74fd366e692d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 422: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_7_293:
	.word 0x95a149c1  ! 1: FDIVd	fdivd	%f36, %f32, %f10
	.word 0xbfe7c000  ! 423: SAVE_R	save	%r31, %r0, %r31
	.word 0xd8dfe020  ! 424: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	.word 0xa3a449d2  ! 425: FDIVd	fdivd	%f48, %f18, %f48
memptr_7_294:
	set user_data_start, %r31
	.word 0x85823887  ! 426: WRCCR_I	wr	%r8, 0x1887, %ccr
donret_7_295:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_295-donret_7_295-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xf83, %tstate
    wrhpr %g0, 0x65f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (7)
	done
donretarg_7_295:
	.word 0xd6fff6a7  ! 427: SWAPA_I	swapa	%r11, [%r31 + 0xfffff6a7] %asi
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_296:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 428: CASA_R	casa	[%r31] %asi, %r1, %r11
mondo_7_297:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d948012  ! 429: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01974  ! 430: FqTOd	dis not found

	.word 0x97a00171  ! 431: FABSq	dis not found

tagged_7_299:
	taddcctv %r7, 0x15a3, %r5
	.word 0xe407f6a7  ! 432: LDUW_I	lduw	[%r31 + 0xfffff6a7], %r18
	.word 0xa3a00171  ! 433: FABSq	dis not found

	.word 0x99540000  ! 434: RDPR_GL	rdpr	%-, %r12
splash_cmpr_7_300:
	setx 0x8ded98071f8d23b4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 435: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7810014  ! 436: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r20, %-
	.word 0xda8008a0  ! 437: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_7_302:
	nop
	setx 0xfffff42dfffff4a0, %g1, %g7
	.word 0xa3800007  ! 438: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_7_303:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 439: RESTORE_R	restore	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_304) + 32, 16, 16)) -> intp(5,0,14)
intvec_7_304:
	.word 0x39400001  ! 440: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ff6a7  ! 441: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff6a7]
	.word 0xda8fe020  ! 442: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r13
intveclr_7_305:
	setx 0x187f31860d4b6809, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 443: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_7_306:
	set user_data_start, %r31
	.word 0x8584a9c7  ! 444: WRCCR_I	wr	%r18, 0x09c7, %ccr
	.word 0xda6ffae0  ! 445: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffae0]
intveclr_7_307:
	setx 0x708ab259cf5be665, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_7_308:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 447: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_7_309-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_309:
	.word 0x91914000  ! 448: WRPR_PIL_R	wrpr	%r5, %r0, %pil
splash_tba_7_310:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 449: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9a489c2  ! 450: FDIVd	fdivd	%f18, %f2, %f20
	rd %pc, %r19
	add %r19, (ivw_7_311-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_311:
	.word 0x9192400a  ! 451: WRPR_PIL_R	wrpr	%r9, %r10, %pil
	rd %pc, %r19
	add %r19, (ivw_7_312-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_312:
	.word 0x91948000  ! 452: WRPR_PIL_R	wrpr	%r18, %r0, %pil
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 453: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802c33  ! 454: SIR	sir	0x0c33
	.word 0xd46ffb56  ! 455: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
	.word 0xd46ffb56  ! 456: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
pmu_7_313:
	nop
	setx 0xfffffe31fffff918, %g1, %g7
	.word 0xa3800007  ! 457: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_7_314:
	set 0x60540000, %r31
	.word 0x8584aae7  ! 458: WRCCR_I	wr	%r18, 0x0ae7, %ccr
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 459: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_7_315:
	setx 0xc01a222d9d5c5efd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 460: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_7_316:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_316-donret_7_316), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xac7, %tstate
    wrhpr %g0, 0xe4e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (7)
	retry
donretarg_7_316:
	.word 0xd4fffcce  ! 461: SWAPA_I	swapa	%r10, [%r31 + 0xfffffcce] %asi
	.word 0x9191ed1f  ! 462: WRPR_PIL_I	wrpr	%r7, 0x0d1f, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 463: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd53fc000  ! 464: STDF_R	std	%f10, [%r0, %r31]
	.word 0xd4dfe000  ! 465: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
mondo_7_317:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d94400d  ! 466: WRPR_WSTATE_R	wrpr	%r17, %r13, %wstate
mondo_7_318:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d94c000  ! 467: WRPR_WSTATE_R	wrpr	%r19, %r0, %wstate
	.word 0x91d02033  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_7_319:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_7_320:
	set 0x60340000, %r31
	.word 0x8584753d  ! 470: WRCCR_I	wr	%r17, 0x153d, %ccr
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_321:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 471: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0xd537f470  ! 472: STQF_I	-	%f10, [0x1470, %r31]
splash_cmpr_7_322:
	setx 0x8bd5886ee70ced5b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_323
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_323:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 474: CASA_R	casa	[%r31] %asi, %r0, %r10
mondo_7_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d908010  ! 475: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
splash_hpstate_7_325:
	.word 0x81982f87  ! 476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f87, %hpstate
	.word 0x95a009d1  ! 477: FDIVd	fdivd	%f0, %f48, %f10
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_326
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_326:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 478: RDPC	rd	%pc, %r12
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_327
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_327:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 479: CASA_R	casa	[%r31] %asi, %r13, %r18
	.word 0x30700001  ! 480: BPA	<illegal instruction>
intveclr_7_328:
	setx 0x75a8999c1fbd7269, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 481: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x27b3153692492b24, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_329:
	.word 0x39400001  ! 482: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_7_330:
	nop
	setx 0xfffff448fffff276, %g1, %g7
	.word 0xa3800007  ! 483: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_7_331:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 484: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_7_332:
	nop
	setx 0xfffff66dfffffa4a, %g1, %g7
	.word 0xa3800007  ! 485: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9b480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xdb27c000  ! 487: STF_R	st	%f13, [%r0, %r31]
pmu_7_333:
	nop
	setx 0xffffff10fffff1c7, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_7_334:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_334-donret_7_334), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xb84, %tstate
    wrhpr %g0, 0xe5c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (7)
	retry
donretarg_7_334:
	.word 0xdafff470  ! 489: SWAPA_I	swapa	%r13, [%r31 + 0xfffff470] %asi
	rd %pc, %r19
	add %r19, (ivw_7_335-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_335:
	.word 0x91950012  ! 490: WRPR_PIL_R	wrpr	%r20, %r18, %pil
debug_7_336:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 491: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_337
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_337:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 492: CASA_R	casa	[%r31] %asi, %r12, %r13
memptr_7_338:
	set 0x60740000, %r31
	.word 0x858364c4  ! 493: WRCCR_I	wr	%r13, 0x04c4, %ccr
debug_7_339:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 494: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
	.word 0xda8008a0  ! 495: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda800ba0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r13
	.word 0xda97e000  ! 497: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
change_to_randtl_7_340:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_340:
	.word 0x8f902001  ! 498: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    set 0x1a21, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b447f0  ! 499: PDISTN	fmean16	%d48, %d16, %d8
pmu_7_341:
	nop
	setx 0xfffff9e1fffff0e7, %g1, %g7
	.word 0xa3800007  ! 500: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_342
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_342:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 501: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_htba_7_343:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 502: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_344
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_344
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_344:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 503: RDPC	rd	%pc, %r17
	setx 0x8de3997996742512, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_345:
	.word 0x39400001  ! 504: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_7_346:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_346-donret_7_346), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x4c3, %tstate
    wrhpr %g0, 0x654, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (7)
	retry
donretarg_7_346:
	.word 0xe6ffefb6  ! 505: SWAPA_I	swapa	%r19, [%r31 + 0x0fb6] %asi
	.word 0x91d02034  ! 506: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 507: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196d  ! 508: FqTOd	dis not found

cwp_7_348:
    set user_data_start, %o7
	.word 0x93902003  ! 509: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
cwp_7_349:
    set user_data_start, %o7
	.word 0x93902003  ! 510: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	rd %pc, %r19
	add %r19, (ivw_7_350-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_350:
	.word 0x91948013  ! 511: WRPR_PIL_R	wrpr	%r18, %r19, %pil
	.word 0x9b450000  ! 512: RD_SET_SOFTINT	rd	%set_softint, %r13
intveclr_7_351:
	setx 0x17f522cabb62c88a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 513: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda57c000  ! 514: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6ae27c  ! 515: SDIVX_I	sdivx	%r11, 0x027c, %r13
memptr_7_353:
	set 0x60140000, %r31
	.word 0x8584f870  ! 516: WRCCR_I	wr	%r19, 0x1870, %ccr
	.word 0xe4bfe44b  ! 517: STDA_I	stda	%r18, [%r31 + 0x044b] %asi
	.word 0x91d02033  ! 518: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa5464000  ! 519: RD_STICK_CMPR_REG	rd	%-, %r18
intveclr_7_354:
	setx 0xa8272b1784c296fd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 520: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_7_355:
	nop
	setx 0xfffff62ffffffae4, %g1, %g7
	.word 0xa3800007  ! 521: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93a249c2  ! 522: FDIVd	fdivd	%f40, %f2, %f40
intveclr_7_356:
	setx 0xb659dfeb61117a0d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 523: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 524: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
intveclr_7_357:
	setx 0x242cf7173e387b9d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97500000  ! 526: RDPR_TPC	rdpr	%tpc, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_358) + 16, 16, 16)) -> intp(3,0,3)
intvec_7_358:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_7_359:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 528: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_7_360:
	.word 0x95a189c7  ! 1: FDIVd	fdivd	%f6, %f38, %f10
	.word 0xd5307357  ! 1: STQF_I	-	%f10, [0x1357, %r1]
	normalw
	.word 0xa9458000  ! 529: RD_SOFTINT_REG	rd	%softint, %r20
debug_7_361:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 530: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd08008a0  ! 531: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x9b450000  ! 532: RD_SET_SOFTINT	rd	%set_softint, %r13
	.word 0xe26ff145  ! 533: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
	.word 0xe26ff145  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
mondo_7_362:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d90400c  ! 535: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 536: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe2800ac0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r17
intveclr_7_363:
	setx 0x22f02614ef007cce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 538: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d930010  ! 539: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
	.word 0xe21fc000  ! 540: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x99902005  ! 541: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xe337f145  ! 542: STQF_I	-	%f17, [0x1145, %r31]
DS_7_365:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 543: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	rd %pc, %r19
	add %r19, (ivw_7_366-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_366:
	.word 0x91924014  ! 544: WRPR_PIL_R	wrpr	%r9, %r20, %pil
	.word 0xe247f145  ! 545: LDSW_I	ldsw	[%r31 + 0xfffff145], %r17
donret_7_367:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_7_367-donret_7_367-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x18b5, %tstate
    wrhpr %g0, 0x20f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (7)
	done
donretarg_7_367:
	.word 0xe2fff145  ! 546: SWAPA_I	swapa	%r17, [%r31 + 0xfffff145] %asi
mondo_7_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e8] %asi
	.word 0x9d90c013  ! 547: WRPR_WSTATE_R	wrpr	%r3, %r19, %wstate
DS_7_369:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa7b00305  ! 548: ALIGNADDRESS	alignaddr	%r0, %r5, %r19
	.word 0x91d02033  ! 549: Tcc_I	ta	icc_or_xcc, %r0 + 51
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_370
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_370:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 550: CASA_R	casa	[%r31] %asi, %r3, %r8
	setx 0xae5d3f4d28f8abc2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_371:
	.word 0x39400001  ! 551: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd09ff145  ! 552: LDDA_I	ldda	[%r31, + 0xfffff145] %asi, %r8
splash_lsu_7_372:
	setx 0xe3b46e0c03bd8882, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 553: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_7_373:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 554: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9769f479  ! 555: SDIVX_I	sdivx	%r7, 0xfffff479, %r11
	.word 0xd137c000  ! 556: STQF_R	-	%f8, [%r0, %r31]
	.word 0xd00fe46f  ! 557: LDUB_I	ldub	[%r31 + 0x046f], %r8
	.word 0xd077e46f  ! 558: STX_I	stx	%r8, [%r31 + 0x046f]
	.word 0xa7814001  ! 559: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r1, %-
splash_cmpr_7_376:
	setx 0x40965c4b00ace7a1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 560: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba509cd  ! 561: FDIVd	fdivd	%f20, %f44, %f44
mondo_7_377:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d924012  ! 562: WRPR_WSTATE_R	wrpr	%r9, %r18, %wstate
cwp_7_378:
    set user_data_start, %o7
	.word 0x93902005  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_379:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 564: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x97a00171  ! 565: FABSq	dis not found

	.word 0x91520000  ! 566: RDPR_PIL	rdpr	%pil, %r8
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_380
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_380:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 567: RDPC	rd	%pc, %r16
mondo_7_381:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d950006  ! 568: WRPR_WSTATE_R	wrpr	%r20, %r6, %wstate
mondo_7_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d904014  ! 569: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
	.word 0xd03fe46f  ! 570: STD_I	std	%r8, [%r31 + 0x046f]
	.word 0x93a0016b  ! 571: FABSq	dis not found

	.word 0xe06fe46f  ! 572: LDSTUB_I	ldstub	%r16, [%r31 + 0x046f]
debug_7_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 573: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d020b4  ! 574: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xe08fe020  ! 575: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r16
intveclr_7_384:
	setx 0xdd26b5125a8ef309, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 576: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 577: Tcc_I	te	icc_or_xcc, %r0 + 51
debug_7_385:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 578: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_386:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 579: CASA_R	casa	[%r31] %asi, %r10, %r16
debug_7_387:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 580: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
pmu_7_388:
	nop
	setx 0xfffff9c8fffff907, %g1, %g7
	.word 0xa3800007  ! 581: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_7_389-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_389:
	.word 0x91914005  ! 582: WRPR_PIL_R	wrpr	%r5, %r5, %pil
change_to_randtl_7_390:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_7_390:
	.word 0x8f902000  ! 583: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196b  ! 584: FqTOd	dis not found

	.word 0x36700001  ! 585: BPGE	<illegal instruction>
mondo_7_392:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d904002  ! 586: WRPR_WSTATE_R	wrpr	%r1, %r2, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936ab8b6  ! 587: SDIVX_I	sdivx	%r10, 0xfffff8b6, %r9
	.word 0x97a00161  ! 588: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_394
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_394:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 589: RDPC	rd	%pc, %r20
	.word 0xd0dfe020  ! 590: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0xd0d7e000  ! 591: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	setx 0xac278163aeb8b07b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_395:
	.word 0x39400001  ! 592: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_396:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 593: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_7_397:
	setx 0x37d7aa1614fc0a85, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 594: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_7_398:
	nop
	setx 0xfffff369fffff282, %g1, %g7
	.word 0xa3800007  ! 595: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d02033  ! 596: Tcc_I	te	icc_or_xcc, %r0 + 51
intveclr_7_399:
	setx 0x598b8ed47c69386d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 597: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd03fe06b  ! 598: STD_I	std	%r8, [%r31 + 0x006b]
debug_7_400:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 599: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_7_401-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_401:
	.word 0x91940009  ! 600: WRPR_PIL_R	wrpr	%r16, %r9, %pil
mondo_7_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d91c013  ! 601: WRPR_WSTATE_R	wrpr	%r7, %r19, %wstate
	.word 0x95a409cb  ! 602: FDIVd	fdivd	%f16, %f42, %f10
intveclr_7_403:
	setx 0xb28c981bfa9a3544, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 603: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 604: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 605: FqTOd	dis not found

    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 606: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0xe737e06b  ! 607: STQF_I	-	%f19, [0x006b, %r31]
pmu_7_407:
	nop
	setx 0xfffff629fffffcf9, %g1, %g7
	.word 0xa3800007  ! 608: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_7_408-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_408:
	.word 0x91910002  ! 609: WRPR_PIL_R	wrpr	%r4, %r2, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01971  ! 610: FqTOd	dis not found

	.word 0xd737c000  ! 611: STQF_R	-	%f11, [%r0, %r31]
debug_7_410:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 612: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76a3fd4  ! 613: SDIVX_I	sdivx	%r8, 0xffffffd4, %r19
	.word 0x81510000  ! 614: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91d02033  ! 615: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_7_412:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe88008a0  ! 617: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
pmu_7_413:
	nop
	setx 0xfffffbe1ffffff54, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99902003  ! 619: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
splash_cmpr_7_414:
	setx 0xaf8b2d7987ef6d57, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 620: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_415:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 621: RDPC	rd	%pc, %r9
splash_lsu_7_416:
	setx 0x61898cb2b88b09d9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 622: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd477f103  ! 623: STX_I	stx	%r10, [%r31 + 0xfffff103]
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_417
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_417:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 624: RDPC	rd	%pc, %r8
	.word 0x91d02035  ! 625: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_7_418:
	setx 0x5bf8d5b205803dfb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 626: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a289c6  ! 627: FDIVd	fdivd	%f10, %f6, %f10
DS_7_419:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 628: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xab808000  ! 629: WR_CLEAR_SOFTINT_R	wr	%r2, %r0, %clear_softint
splash_cmpr_7_420:
	setx 0x8a6c1e8c2a932757, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 630: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_7_421-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_421:
	.word 0x9190c002  ! 631: WRPR_PIL_R	wrpr	%r3, %r2, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_422)+16, 16, 16)) -> intp(7,1,3)
xir_7_422:
	.word 0xa984fada  ! 632: WR_SET_SOFTINT_I	wr	%r19, 0x1ada, %set_softint
mondo_7_423:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d944005  ! 633: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_424
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_424:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 634: CASA_R	casa	[%r31] %asi, %r3, %r11
debug_7_425:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 635: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_7_426:
	setx 0xc9429dbb82061e8f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 636: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_7_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d94c006  ! 637: WRPR_WSTATE_R	wrpr	%r19, %r6, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9169bb60  ! 638: SDIVX_I	sdivx	%r6, 0xfffffb60, %r8
intveclr_7_429:
	setx 0x64b0f465bada1654, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 639: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_430:
	setx 0x0d3c73b81d0c703b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 640: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x78110cb1ce17434e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_431:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_432:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d934013  ! 642: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_433
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_433
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_433:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 643: RDPC	rd	%pc, %r13
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_434
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_434:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 644: CASA_R	casa	[%r31] %asi, %r4, %r18
	setx 0x87e8c894f1b6b188, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_435:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_436:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 646: CASA_R	casa	[%r31] %asi, %r4, %r18
splash_cmpr_7_437:
	setx 0x4c64fef564dffbb1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 647: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_7_438:
	setx 0xa74e73b88e060a4a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 648: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 649: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
DS_7_439:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x91a0054d  ! 1: FSQRTd	fsqrt	
	.word 0x97a5082c  ! 650: FADDs	fadds	%f20, %f12, %f11
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_7_440:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 652: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97520000  ! 653: RDPR_PIL	rdpr	%pil, %r11
	setx 0xcf30aff58f2a5b25, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_441:
	.word 0x39400001  ! 654: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_442:
	setx 0xa8667855892a5216, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 655: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_7_443:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 656: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_444
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_444:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 657: CASA_R	casa	[%r31] %asi, %r9, %r12
memptr_7_445:
	set 0x60140000, %r31
	.word 0x8580bfdf  ! 658: WRCCR_I	wr	%r2, 0x1fdf, %ccr
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_446
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_446
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_446:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 659: RDPC	rd	%pc, %r13
splash_cmpr_7_447:
	setx 0x807745f45d57774c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 660: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_448:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e009  ! 661: CASA_R	casa	[%r31] %asi, %r9, %r13
	rd %pc, %r19
	add %r19, (ivw_7_449-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_449:
	.word 0x91940008  ! 662: WRPR_PIL_R	wrpr	%r16, %r8, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01972  ! 663: FqTOd	dis not found

	.word 0x91a00172  ! 664: FABSq	dis not found

debug_7_451:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 665: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_7_452-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_7_452:
	.word 0x91928012  ! 666: WRPR_PIL_R	wrpr	%r10, %r18, %pil
	.word 0xda6fe48d  ! 667: LDSTUB_I	ldstub	%r13, [%r31 + 0x048d]
	.word 0x9f80255f  ! 668: SIR	sir	0x055f
mondo_7_453:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d918014  ! 669: WRPR_WSTATE_R	wrpr	%r6, %r20, %wstate
	.word 0x8d903668  ! 670: WRPR_PSTATE_I	wrpr	%r0, 0x1668, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01963  ! 671: FqTOd	dis not found

	.word 0x95a409d4  ! 672: FDIVd	fdivd	%f16, %f20, %f10
memptr_7_455:
	set 0x60540000, %r31
	.word 0x8584e01e  ! 673: WRCCR_I	wr	%r19, 0x001e, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 674: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_7_456:
	setx 0xf3d3efb2df1e5510, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 675: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xbd49c341271c7618, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_457:
	.word 0x39400001  ! 676: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_7_458:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 677: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_7_459:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 678: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (7+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_7_460
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_7_460
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_7_460:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 679: RDPC	rd	%pc, %r17
	setx 0x3cfc72efad9b79c7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_461:
	.word 0x39400001  ! 680: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_7_462:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d924009  ! 681: WRPR_WSTATE_R	wrpr	%r9, %r9, %wstate
    mov (7+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_7_463
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_7_463:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 682: CASA_R	casa	[%r31] %asi, %r17, %r16
cwp_7_464:
    set user_data_start, %o7
	.word 0x93902002  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
debug_7_465:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 684: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_7_466)+16, 16, 16)) -> intp(7,1,3)
xir_7_466:
	.word 0xa9843a7a  ! 685: WR_SET_SOFTINT_I	wr	%r16, 0x1a7a, %set_softint
	.word 0x95a00167  ! 686: FABSq	dis not found

debug_7_467:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 687: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97464000  ! 688: RD_STICK_CMPR_REG	rd	%-, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_7_468) + 32, 16, 16)) -> intp(0,0,21)
intvec_7_468:
	.word 0x39400001  ! 689: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 690: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_7_469:
	set 0x60340000, %r31
	.word 0x8584eb76  ! 691: WRCCR_I	wr	%r19, 0x0b76, %ccr
splash_cmpr_7_470:
	setx 0x5cca43ada0df625b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 692: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_7_471:
	nop
	setx 0xfffff614fffff5a7, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_7_472:
	setx 0x2f3f49116cdc2a1d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 694: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x1b3896c576e8b65a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_473:
	.word 0x39400001  ! 695: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_7_474:
	setx 0x1ecefa475e595431, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 696: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_7_475:
	setx 0xb8762fd24be40d2f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 697: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_7_476:
	setx 0xab3461a34174e58b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 698: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xf9d30a19b7f78e8a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_7_477:
	.word 0x39400001  ! 699: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a149cc  ! 700: FDIVd	fdivd	%f36, %f12, %f18
splash_tba_7_478:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 701: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	invalw
	mov 0x35, %r30
splash_cmpr_6_0:
	setx 0x7786fc601c500f5b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_1:
	setx 0x3ec1cae2d1907cd8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_2:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 3: RDPC	rd	%pc, %r13
	.word 0x93d020b3  ! 4: Tcc_I	tne	icc_or_xcc, %r0 + 179
splash_hpstate_6_3:
	.word 0x819823ad  ! 5: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ad, %hpstate
donret_6_4:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_4-donret_6_4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x44c, %tstate
    wrhpr %g0, 0xd4e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (6)
	retry
donretarg_6_4:
	.word 0xe6ffee7d  ! 6: SWAPA_I	swapa	%r19, [%r31 + 0x0e7d] %asi
	.word 0x38700001  ! 7: BPGU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_5:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 8: RDPC	rd	%pc, %r16
	.word 0x93a049cd  ! 9: FDIVd	fdivd	%f32, %f44, %f40
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01970  ! 10: FqTOd	dis not found

mondo_6_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d92000b  ! 11: WRPR_WSTATE_R	wrpr	%r8, %r11, %wstate
splash_hpstate_6_8:
	.word 0x81982694  ! 12: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0694, %hpstate
mondo_6_9:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d94c012  ! 13: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0xd80fee7d  ! 14: LDUB_I	ldub	[%r31 + 0x0e7d], %r12
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_10:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 15: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa985000c  ! 16: WR_SET_SOFTINT_R	wr	%r20, %r12, %set_softint
	setx 0x9264d5c0daf7296f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a0016b  ! 18: FABSq	dis not found

	.word 0x91d02033  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 51
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_12) + 24, 16, 16)) -> intp(4,0,22)
intvec_6_12:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_6_13:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 21: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d903d7b  ! 22: WRPR_PSTATE_I	wrpr	%r0, 0x1d7b, %pstate
	.word 0xab848011  ! 23: WR_CLEAR_SOFTINT_R	wr	%r18, %r17, %clear_softint
memptr_6_14:
	set 0x60140000, %r31
	.word 0x85842df8  ! 24: WRCCR_I	wr	%r16, 0x0df8, %ccr
	setx 0xeb01f3a0469328a2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_15:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56c23e5  ! 26: SDIVX_I	sdivx	%r16, 0x03e5, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b69b553  ! 27: SDIVX_I	sdivx	%r6, 0xfffff553, %r13
mondo_6_18:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d948003  ! 28: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
mondo_6_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d908000  ! 29: WRPR_WSTATE_R	wrpr	%r2, %r0, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_20:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e009  ! 30: CASA_R	casa	[%r31] %asi, %r9, %r11
	.word 0xa5a0c9cd  ! 31: FDIVd	fdivd	%f34, %f44, %f18
	.word 0xe28008a0  ! 32: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_cmpr_6_21:
	setx 0x4adb994dac2c2ef1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba00170  ! 34: FABSq	dis not found

pmu_6_22:
	nop
	setx 0xfffff495fffff82f, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_6_23:
	nop
	setx 0xfffff86afffff070, %g1, %g7
	.word 0xa3800007  ! 36: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_6_24:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_24:
	.word 0x8f902001  ! 37: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_25:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 38: RDPC	rd	%pc, %r13
	.word 0xab8175e2  ! 39: WR_CLEAR_SOFTINT_I	wr	%r5, 0x15e2, %clear_softint
memptr_6_26:
	set 0x60540000, %r31
	.word 0x85823322  ! 40: WRCCR_I	wr	%r8, 0x1322, %ccr
	rd %pc, %r19
	add %r19, (ivw_6_27-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_27:
	.word 0x91904010  ! 41: WRPR_PIL_R	wrpr	%r1, %r16, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16a272d  ! 42: SDIVX_I	sdivx	%r8, 0x072d, %r16
intveclr_6_29:
	setx 0xcebef6e4bbc623f3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_30) + 32, 16, 16)) -> intp(0,0,12)
intvec_6_30:
	.word 0x39400001  ! 44: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_6_31:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 45: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01973  ! 46: FqTOd	dis not found

	setx 0xcec9a0e2d6fa5df7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_33:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_6_34:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 48: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_6_35:
	setx 0x6fb4b097be8df13e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 49: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_6_36:
	.word 0x819829a6  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09a6, %hpstate
	.word 0x9ba0016a  ! 51: FABSq	dis not found

	.word 0x8d9038ec  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x18ec, %pstate
	rd %pc, %r19
	add %r19, (ivw_6_37-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_37:
	.word 0x91940010  ! 53: WRPR_PIL_R	wrpr	%r16, %r16, %pil
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_38:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 54: RDPC	rd	%pc, %r16
	.word 0x93a00162  ! 55: FABSq	dis not found

debug_6_39:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 56: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
splash_cmpr_6_40:
	setx 0xfce5034ae8bfa0f9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 57: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd31fc000  ! 58: LDDF_R	ldd	[%r31, %r0], %f9
debug_6_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 59: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_42:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 60: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_43:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 61: RDPC	rd	%pc, %r10
	.word 0xd537fc6d  ! 62: STQF_I	-	%f10, [0x1c6d, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01967  ! 63: FqTOd	dis not found

pmu_6_45:
	nop
	setx 0xfffff409fffff7d8, %g1, %g7
	.word 0xa3800007  ! 64: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_6_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d90c005  ! 65: WRPR_WSTATE_R	wrpr	%r3, %r5, %wstate
DS_6_47:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe5344001  ! 1: STQF_R	-	%f18, [%r1, %r17]
	normalw
	.word 0x97458000  ! 66: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xe0c7e020  ! 67: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_48) + 16, 16, 16)) -> intp(7,0,23)
intvec_6_48:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_6_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_49-donret_6_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1695, %tstate
    wrhpr %g0, 0x51d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (6)
	done
donretarg_6_49:
	.word 0xe0fffc6d  ! 69: SWAPA_I	swapa	%r16, [%r31 + 0xfffffc6d] %asi
	.word 0x8d902caa  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x0caa, %pstate
pmu_6_50:
	nop
	setx 0xffffffb4fffff4cb, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa769ae7d  ! 72: SDIVX_I	sdivx	%r6, 0x0e7d, %r19
	.word 0x83d02033  ! 73: Tcc_I	te	icc_or_xcc, %r0 + 51
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_52:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e002  ! 74: CASA_R	casa	[%r31] %asi, %r2, %r11
mondo_6_53:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c8] %asi
	.word 0x9d944007  ! 75: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
memptr_6_54:
	set user_data_start, %r31
	.word 0x858520e3  ! 76: WRCCR_I	wr	%r20, 0x00e3, %ccr
splash_lsu_6_55:
	setx 0x924714b938bb7ef2, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 77: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_56:
	.word 0x81982acf  ! 78: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acf, %hpstate
splash_cmpr_6_57:
	setx 0xf65ea35b05da661a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 79: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 80: BPGE	<illegal instruction>
pmu_6_58:
	nop
	setx 0xfffff01efffffa58, %g1, %g7
	.word 0xa3800007  ! 81: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_59:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 82: RDPC	rd	%pc, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196d  ! 83: FqTOd	dis not found

splash_cmpr_6_61:
	setx 0x17bce769d7413d08, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 84: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe927f7c3  ! 85: STF_I	st	%f20, [0x17c3, %r31]
splash_tba_6_62:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_6_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d930008  ! 87: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
	.word 0x83d02033  ! 88: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x99a509c2  ! 89: FDIVd	fdivd	%f20, %f2, %f12
	rd %pc, %r19
	add %r19, (ivw_6_64-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_64:
	.word 0x9191c000  ! 90: WRPR_PIL_R	wrpr	%r7, %r0, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_65)+24, 16, 16)) -> intp(6,1,3)
xir_6_65:
	.word 0xa98467ab  ! 91: WR_SET_SOFTINT_I	wr	%r17, 0x07ab, %set_softint
change_to_randtl_6_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_66:
	.word 0x8f902002  ! 92: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	setx 0x86ed44f819aa2389, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_67:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_68) + 40, 16, 16)) -> intp(2,0,23)
intvec_6_68:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902482  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x0482, %pstate
	.word 0xe08008a0  ! 96: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8d902139  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0139, %pstate
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 98: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe0c7e000  ! 99: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	setx 0x999865c7989bdc93, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_69:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_6_70:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 101: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 102: RD_STICK_REG	stbar
	rd %pc, %r19
	add %r19, (ivw_6_71-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_71:
	.word 0x91908007  ! 103: WRPR_PIL_R	wrpr	%r2, %r7, %pil
	.word 0x99902005  ! 104: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
change_to_randtl_6_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_72:
	.word 0x8f902001  ! 105: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_6_73:
	setx 0xd10829cbd5a2faf5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 107: CASA_R	casa	[%r31] %asi, %r10, %r16
	.word 0x26800001  ! 108: BL	bl,a	<label_0x1>
splash_hpstate_6_75:
	.word 0x81982b2c  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b2c, %hpstate
intveclr_6_76:
	setx 0x811fde2f5489858e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 110: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe00fc000  ! 111: LDUB_R	ldub	[%r31 + %r0], %r16
donret_6_77:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_77-donret_6_77-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1c31, %tstate
    wrhpr %g0, 0xe15, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (6)
	done
donretarg_6_77:
	.word 0xe0ffe388  ! 112: SWAPA_I	swapa	%r16, [%r31 + 0x0388] %asi
change_to_randtl_6_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_78:
	.word 0x8f902000  ! 113: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f803eae  ! 114: SIR	sir	0x1eae
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976b2e83  ! 115: SDIVX_I	sdivx	%r12, 0x0e83, %r11
memptr_6_80:
	set 0x60740000, %r31
	.word 0x85812cca  ! 116: WRCCR_I	wr	%r4, 0x0cca, %ccr
mondo_6_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d904006  ! 117: WRPR_WSTATE_R	wrpr	%r1, %r6, %wstate
DS_6_82:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 118: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	setx 0x64409bab51455549, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d910003  ! 120: WRPR_WSTATE_R	wrpr	%r4, %r3, %wstate
	setx 0xe646a0123e951c49, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_85:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902001  ! 122: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
donret_6_86:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_86-donret_6_86), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x122d, %tstate
    wrhpr %g0, 0x58c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (6)
	retry
donretarg_6_86:
	.word 0xe8ffecb2  ! 123: SWAPA_I	swapa	%r20, [%r31 + 0x0cb2] %asi
DS_6_87:
	.word 0xa9a149c0  ! 1: FDIVd	fdivd	%f36, %f0, %f20
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd7100014  ! 1: LDQF_R	-	[%r0, %r20], %f11
	.word 0x93a04826  ! 124: FADDs	fadds	%f1, %f6, %f9
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_88:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 125: CASA_R	casa	[%r31] %asi, %r16, %r12
splash_cmpr_6_89:
	setx 0x97756f07dd29872e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 126: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_90) + 32, 16, 16)) -> intp(0,0,20)
intvec_6_90:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_91:
	.word 0x8f902000  ! 128: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_6_92:
	setx 0x97400d9d60b17f3d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x42a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b047f2  ! 130: PDISTN	fmean16	%d32, %d18, %d20
	.word 0xd477c000  ! 131: STX_R	stx	%r10, [%r31 + %r0]
	setx 0xf0d87f807c550964, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_93:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 133: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_6_94:
	setx 0x51d8725b616b22d1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_95:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 135: CASA_R	casa	[%r31] %asi, %r10, %r10
	.word 0x8d903bd0  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x1bd0, %pstate
	.word 0x99902000  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
memptr_6_96:
	set user_data_start, %r31
	.word 0x85827e44  ! 138: WRCCR_I	wr	%r9, 0x1e44, %ccr
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_97:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 139: RDPC	rd	%pc, %r9
	rd %pc, %r19
	add %r19, (ivw_6_98-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_98:
	.word 0x91930005  ! 140: WRPR_PIL_R	wrpr	%r12, %r5, %pil
memptr_6_99:
	set user_data_start, %r31
	.word 0x8581a746  ! 141: WRCCR_I	wr	%r6, 0x0746, %ccr
splash_hpstate_6_100:
	.word 0x81982517  ! 142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0517, %hpstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_101:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 143: RDPC	rd	%pc, %r16
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_102:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 144: RDPC	rd	%pc, %r17
	.word 0x8d9031bf  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x11bf, %pstate
	.word 0x3a700001  ! 146: BPCC	<illegal instruction>
    set 0x332a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b047f4  ! 147: PDISTN	fmean16	%d32, %d20, %d16
splash_cmpr_6_103:
	setx 0xa2cd3c764d39d3ca, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_104:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x9b4f66d4	! Random illegal ?
	.word 0xa1a509cb  ! 1: FDIVd	fdivd	%f20, %f42, %f16
	.word 0x95a1c831  ! 149: FADDs	fadds	%f7, %f17, %f10
mondo_6_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e8] %asi
	.word 0x9d940008  ! 150: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
	.word 0xa950c000  ! 151: RDPR_TT	rdpr	%tt, %r20
memptr_6_106:
	set 0x60740000, %r31
	.word 0x85802991  ! 152: WRCCR_I	wr	%r0, 0x0991, %ccr
	setx 0x24c2829196f78f64, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_107:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9810011  ! 154: WR_SET_SOFTINT_R	wr	%r4, %r17, %set_softint
	.word 0xe297e020  ! 155: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_108:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 156: RDPC	rd	%pc, %r12
	setx 0xbbd5f566af03bb13, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_109:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93480000  ! 158: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x97a00160  ! 159: FABSq	dis not found

DS_6_110:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f14, %f2, %f2
	.word 0xa5b34309  ! 160: ALIGNADDRESS	alignaddr	%r13, %r9, %r18
	.word 0x2a700001  ! 161: BPCS	<illegal instruction>
DS_6_111:
	.word 0xa3a4c9d3  ! 1: FDIVd	fdivd	%f50, %f50, %f48
	allclean
	.word 0x99b34306  ! 162: ALIGNADDRESS	alignaddr	%r13, %r6, %r12
debug_6_112:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96a3553  ! 164: SDIVX_I	sdivx	%r8, 0xfffff553, %r20
	.word 0xe897e030  ! 165: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r20
	.word 0xe8dfe030  ! 166: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_114:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 167: RDPC	rd	%pc, %r9
	.word 0xe48008a0  ! 168: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	rd %pc, %r19
	add %r19, (ivw_6_115-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_115:
	.word 0x91944014  ! 169: WRPR_PIL_R	wrpr	%r17, %r20, %pil
debug_6_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d020b5  ! 171: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_cmpr_6_117:
	setx 0x85f3ba8e109f6a63, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_118:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe457fe3c  ! 174: LDSH_I	ldsh	[%r31 + 0xfffffe3c], %r18
tagged_6_119:
	taddcctv %r12, 0x1cef, %r8
	.word 0xe407fe3c  ! 175: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
pmu_6_120:
	nop
	setx 0xfffffd84fffff830, %g1, %g7
	.word 0xa3800007  ! 176: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_6_121:
	setx 0xef582027a8ed8789, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d94800b  ! 178: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
tagged_6_123:
	taddcctv %r4, 0x1d28, %r12
	.word 0xe407fe3c  ! 179: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
	.word 0x91d02035  ! 180: Tcc_I	ta	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 181: LDX_R	ldx	[%r31 + %r0], %r18
debug_6_124:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_6_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d914014  ! 183: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	rd %pc, %r19
	add %r19, (ivw_6_126-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_126:
	.word 0x9194c011  ! 184: WRPR_PIL_R	wrpr	%r19, %r17, %pil
	setx 0x7051950c08c56d78, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_127:
	.word 0x39400001  ! 185: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_128) + 56, 16, 16)) -> intp(3,0,25)
intvec_6_128:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3a00171  ! 187: FABSq	dis not found

debug_6_129:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 188: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_130:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 189: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_lsu_6_131:
	setx 0xf44435c93e3024b9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99a0016a  ! 191: FABSq	dis not found

	.word 0xd0cfe030  ! 192: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r8
intveclr_6_132:
	setx 0x37b4df9fa5e75aa8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 53
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 195: RDPC	rd	%pc, %r16
splash_cmpr_6_134:
	setx 0xdcd0969863580eda, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_135:
	setx 0xcf13e89019136cd0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06ffe3c  ! 198: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe3c]
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_136:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 199: CASA_R	casa	[%r31] %asi, %r9, %r16
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_137
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_137:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 200: RDPC	rd	%pc, %r8
	.word 0x3e800001  ! 201: BVC	bvc,a	<label_0x1>
intveclr_6_138:
	setx 0x8f0551ab41187043, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 202: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_6_139:
	setx 0xf5e9cea2d99b054b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 203: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 204: Tcc_I	ta	icc_or_xcc, %r0 + 52
donret_6_140:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_140-donret_6_140), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xd61, %tstate
    wrhpr %g0, 0xb8f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (6)
	retry
donretarg_6_140:
	.word 0xd8fffe3c  ! 205: SWAPA_I	swapa	%r12, [%r31 + 0xfffffe3c] %asi
splash_htba_6_141:
	set 0x003a0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 206: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_6_142:
	setx 0xbfa0c9e7a3efb2f2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_6_144:
	.word 0x819820d7  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d7, %hpstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_145:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 210: CASA_R	casa	[%r31] %asi, %r9, %r12
splash_cmpr_6_146:
	setx 0x97fbef73121c435a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 211: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_147:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 212: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xab846da6  ! 213: WR_CLEAR_SOFTINT_I	wr	%r17, 0x0da6, %clear_softint
intveclr_6_148:
	setx 0xa2ab2ef5f95237c5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_149)+8, 16, 16)) -> intp(6,1,3)
xir_6_149:
	.word 0xa984e2ba  ! 215: WR_SET_SOFTINT_I	wr	%r19, 0x02ba, %set_softint
pmu_6_150:
	nop
	setx 0xfffffacafffffb90, %g1, %g7
	.word 0xa3800007  ! 216: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_6_151:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_151:
	.word 0x8f902002  ! 217: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x26700001  ! 218: BPL	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_152) + 16, 16, 16)) -> intp(7,0,23)
intvec_6_152:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a00160  ! 220: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_6_153-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_153:
	.word 0x9194c003  ! 221: WRPR_PIL_R	wrpr	%r19, %r3, %pil
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_154
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_154:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 222: RDPC	rd	%pc, %r20
	.word 0x83d02034  ! 223: Tcc_I	te	icc_or_xcc, %r0 + 52
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 224: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_6_156:
	setx 0x9d7309b01836a6b9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_6_157:
	setx 0x63870e1ff56b5bff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91a00168  ! 227: FABSq	dis not found

splash_cmpr_6_158:
	setx 0x1445f75dfbc32503, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_159:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 229: RDPC	rd	%pc, %r18
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_160:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 230: RDPC	rd	%pc, %r19
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_161
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_161
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_161:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 231: RDPC	rd	%pc, %r19
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_162
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_162:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 232: RDPC	rd	%pc, %r13
	setx 0x013f8b1a6bcb66fb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_163:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_6_164:
	nop
	setx 0xfffff845fffff672, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x70bd9677222d8c7e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_165:
	.word 0x39400001  ! 235: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b69b46d  ! 236: SDIVX_I	sdivx	%r6, 0xfffff46d, %r13
	.word 0x91d02032  ! 237: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_6_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d928013  ! 238: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
splash_cmpr_6_168:
	setx 0xfafc7a1331e6e578, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d94c00b  ! 240: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
mondo_6_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d904000  ! 241: WRPR_WSTATE_R	wrpr	%r1, %r0, %wstate
splash_cmpr_6_171:
	setx 0x9f80f519a4c64de3, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 242: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_172) + 48, 16, 16)) -> intp(0,0,2)
intvec_6_172:
	.word 0x39400001  ! 243: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_173:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0xa9a4c9cb  ! 245: FDIVd	fdivd	%f50, %f42, %f20
	.word 0xda8008a0  ! 246: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_hpstate_6_174:
	.word 0x81982abc  ! 247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0abc, %hpstate
	setx 0x3f50c69fe7782dc0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_175:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_176:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r13
	.word 0x91480000  ! 250: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xd64fc000  ! 251: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0xd60ff241  ! 252: LDUB_I	ldub	[%r31 + 0xfffff241], %r11
	.word 0x8d902a0f  ! 253: WRPR_PSTATE_I	wrpr	%r0, 0x0a0f, %pstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_177:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 254: RDPC	rd	%pc, %r18
splash_hpstate_6_178:
	.word 0x819821c4  ! 255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c4, %hpstate
mondo_6_179:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d924002  ! 256: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 257: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_6_180:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 258: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
	.word 0x97464000  ! 259: RD_STICK_CMPR_REG	rd	%-, %r11
intveclr_6_181:
	setx 0xa15a50ea17fc24ee, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91a409d3  ! 261: FDIVd	fdivd	%f16, %f50, %f8
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
	.word 0xa1414000  ! 262: RDPC	rd	%pc, %r16
	rd %pc, %r19
	add %r19, (ivw_6_183-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_183:
	.word 0x91904000  ! 263: WRPR_PIL_R	wrpr	%r1, %r0, %pil
intveclr_6_184:
	setx 0x3989376654cbfd8f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 264: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_185:
	setx 0x98ce6ae9cec272dd, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 265: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_6_186:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d940008  ! 266: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
	rd %pc, %r19
	add %r19, (ivw_6_187-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_187:
	.word 0x91944010  ! 267: WRPR_PIL_R	wrpr	%r17, %r16, %pil
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_188:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 268: CASA_R	casa	[%r31] %asi, %r19, %r13
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_189:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 269: RDPC	rd	%pc, %r20
intveclr_6_190:
	setx 0x0db3187f96bd3996, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 270: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_191:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_191:
	.word 0x8f902000  ! 271: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_6_192:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 272: RESTORE_R	restore	%r31, %r0, %r31
mondo_6_193:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d918000  ! 273: WRPR_WSTATE_R	wrpr	%r6, %r0, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_194) + 40, 16, 16)) -> intp(4,0,15)
intvec_6_194:
	.word 0x39400001  ! 274: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d91c008  ! 275: WRPR_WSTATE_R	wrpr	%r7, %r8, %wstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_196:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 276: RDPC	rd	%pc, %r11
debug_6_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 277: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91500000  ! 278: RDPR_TPC	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 279: RDPC	rd	%pc, %r20
pmu_6_199:
	nop
	setx 0xfffff3dafffffa6e, %g1, %g7
	.word 0xa3800007  ! 280: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa9a00170  ! 281: FABSq	dis not found

mondo_6_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d90c008  ! 282: WRPR_WSTATE_R	wrpr	%r3, %r8, %wstate
	.word 0x30800001  ! 283: BA	ba,a	<label_0x1>
pmu_6_201:
	nop
	setx 0xfffff56cfffff86d, %g1, %g7
	.word 0xa3800007  ! 284: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_6_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d950007  ! 285: WRPR_WSTATE_R	wrpr	%r20, %r7, %wstate
DS_6_203:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
memptr_6_204:
	set user_data_start, %r31
	.word 0x8582a685  ! 287: WRCCR_I	wr	%r10, 0x0685, %ccr
	.word 0x20800001  ! 288: BN	bn,a	<label_0x1>
pmu_6_205:
	nop
	setx 0xfffffa60ffffffff, %g1, %g7
	.word 0xa3800007  ! 289: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_206) + 24, 16, 16)) -> intp(6,0,2)
intvec_6_206:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_207:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 291: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8d9034a1  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x14a1, %pstate
	.word 0xda37e0b8  ! 293: STH_I	sth	%r13, [%r31 + 0x00b8]
DS_6_208:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 294: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 296: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01971  ! 297: FqTOd	dis not found

debug_6_211:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 298: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_6_212:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d904004  ! 299: WRPR_WSTATE_R	wrpr	%r1, %r4, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36ceecd  ! 300: SDIVX_I	sdivx	%r19, 0x0ecd, %r17
	.word 0xa9a4c9c4  ! 301: FDIVd	fdivd	%f50, %f4, %f20
	.word 0x8d9032f6  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x12f6, %pstate
intveclr_6_214:
	setx 0x29bda401d807e93e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01974  ! 304: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_216
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_216:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 305: RDPC	rd	%pc, %r20
intveclr_6_217:
	setx 0x9edba39c92f86767, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99500000  ! 307: RDPR_TPC	<illegal instruction>
	.word 0x95a289c4  ! 308: FDIVd	fdivd	%f10, %f4, %f10
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_218:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 309: RDPC	rd	%pc, %r10
donret_6_219:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_219-donret_6_219-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xbfc, %tstate
    wrhpr %g0, 0x604, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (6)
	done
donretarg_6_219:
	.word 0xe6ffe4a4  ! 310: SWAPA_I	swapa	%r19, [%r31 + 0x04a4] %asi
	rd %pc, %r19
	add %r19, (ivw_6_220-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_220:
	.word 0x91948005  ! 311: WRPR_PIL_R	wrpr	%r18, %r5, %pil
intveclr_6_221:
	setx 0xf609639c8e58ba7c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d91c005  ! 313: WRPR_WSTATE_R	wrpr	%r7, %r5, %wstate
	.word 0xe6800c40  ! 314: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r19
	.word 0xa9454000  ! 315: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
donret_6_223:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_223-donret_6_223-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1fd, %tstate
    wrhpr %g0, 0x34c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (6)
	done
donretarg_6_223:
	.word 0xd6ffe4a4  ! 316: SWAPA_I	swapa	%r11, [%r31 + 0x04a4] %asi
intveclr_6_224:
	setx 0xa0aa1ae2d7ba54c8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 317: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_6_225:
	.word 0x81982786  ! 318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0786, %hpstate
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
	.word 0x9b414000  ! 319: RDPC	rd	%pc, %r13
	.word 0xe607c000  ! 320: LDUW_R	lduw	[%r31 + %r0], %r19
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 321: CASA_R	casa	[%r31] %asi, %r20, %r19
memptr_6_228:
	set user_data_start, %r31
	.word 0x85802374  ! 322: WRCCR_I	wr	%r0, 0x0374, %ccr
	.word 0x83d02035  ! 323: Tcc_I	te	icc_or_xcc, %r0 + 53
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_229:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 324: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0x8d9033a7  ! 325: WRPR_PSTATE_I	wrpr	%r0, 0x13a7, %pstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_230:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 326: RDPC	rd	%pc, %r10
mondo_6_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d910006  ! 327: WRPR_WSTATE_R	wrpr	%r4, %r6, %wstate
debug_6_232:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 328: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_233)+56, 16, 16)) -> intp(6,1,3)
xir_6_233:
	.word 0xa9826a4c  ! 329: WR_SET_SOFTINT_I	wr	%r9, 0x0a4c, %set_softint
DS_6_234:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 330: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x99902000  ! 331: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
mondo_6_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d930010  ! 332: WRPR_WSTATE_R	wrpr	%r12, %r16, %wstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 333: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_6_236-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_236:
	.word 0x9194c011  ! 334: WRPR_PIL_R	wrpr	%r19, %r17, %pil
DS_6_237:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 335: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd01fff3e  ! 336: LDD_I	ldd	[%r31 + 0xffffff3e], %r8
	.word 0x8d9028cc  ! 337: WRPR_PSTATE_I	wrpr	%r0, 0x08cc, %pstate
	.word 0xd03fff3e  ! 338: STD_I	std	%r8, [%r31 + 0xffffff3e]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01972  ! 339: FqTOd	dis not found

	.word 0x8d9026a3  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x06a3, %pstate
pmu_6_239:
	nop
	setx 0xfffff891fffff621, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_240:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 342: RDPC	rd	%pc, %r11
mondo_6_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d94c005  ! 343: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
intveclr_6_242:
	setx 0x30545efce8c8c45f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93454000  ! 345: RD_CLEAR_SOFTINT	rd	%clear_softint, %r9
mondo_6_243:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d94c005  ! 346: WRPR_WSTATE_R	wrpr	%r19, %r5, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01968  ! 347: FqTOd	dis not found

	.word 0xa7540000  ! 348: RDPR_GL	rdpr	%-, %r19
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_245
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_245:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e001  ! 349: CASA_R	casa	[%r31] %asi, %r1, %r8
	.word 0x97a00163  ! 350: FABSq	dis not found

memptr_6_246:
	set user_data_start, %r31
	.word 0x85852be7  ! 351: WRCCR_I	wr	%r20, 0x0be7, %ccr
	.word 0xd477c000  ! 352: STX_R	stx	%r10, [%r31 + %r0]
	.word 0x8d902856  ! 353: WRPR_PSTATE_I	wrpr	%r0, 0x0856, %pstate
memptr_6_247:
	set 0x60540000, %r31
	.word 0x85807a1f  ! 354: WRCCR_I	wr	%r1, 0x1a1f, %ccr
	.word 0xd46ff8e6  ! 355: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
    set 0x921, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b407e3  ! 356: PDISTN	fmean16	%d16, %d34, %d42
mondo_6_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e8] %asi
	.word 0x9d94c014  ! 357: WRPR_WSTATE_R	wrpr	%r19, %r20, %wstate
	.word 0x26800001  ! 358: BL	bl,a	<label_0x1>
pmu_6_249:
	nop
	setx 0xfffff304fffffbdb, %g1, %g7
	.word 0xa3800007  ! 359: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46ff8e6  ! 360: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
change_to_randtl_6_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_250:
	.word 0x8f902001  ! 361: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_6_251:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_252
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_252:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e007  ! 363: CASA_R	casa	[%r31] %asi, %r7, %r10
debug_6_253:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 364: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99902002  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_254)+48, 16, 16)) -> intp(6,1,3)
xir_6_254:
	.word 0xa9842a48  ! 366: WR_SET_SOFTINT_I	wr	%r16, 0x0a48, %set_softint
	.word 0x8d902cfd  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x0cfd, %pstate
intveclr_6_255:
	setx 0x87627f443590f6dd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 368: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9350c000  ! 369: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_256
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_256:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 370: RDPC	rd	%pc, %r18
	.word 0xa7500000  ! 371: RDPR_TPC	<illegal instruction>
	.word 0x9945c000  ! 372: RD_TICK_CMPR_REG	rd	%-, %r12
splash_cmpr_6_257:
	setx 0x8093b22e75430eb1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_258:
	setx 0x104b329f5bc5280e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 374: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x74d570ab199d73e5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_259:
	.word 0x39400001  ! 375: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3480000  ! 376: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_260:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 377: CASA_R	casa	[%r31] %asi, %r7, %r19
mondo_6_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d910012  ! 378: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
intveclr_6_262:
	setx 0x1834802c334b9a31, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 380: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe68008a0  ! 381: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe63fc000  ! 382: STD_R	std	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_6_264-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_264:
	.word 0x9191c012  ! 383: WRPR_PIL_R	wrpr	%r7, %r18, %pil
splash_cmpr_6_265:
	setx 0xbbd70d7966ee1dcc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 384: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 385: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0xaaa47990759ae8e5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_267:
	.word 0x39400001  ! 386: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902dd6  ! 387: WRPR_PSTATE_I	wrpr	%r0, 0x0dd6, %pstate
	.word 0x28700001  ! 388: BPLEU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_268:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 389: RDPC	rd	%pc, %r9
	.word 0xad813a46  ! 390: WR_SOFTINT_REG_I	wr	%r4, 0x1a46, %softint
splash_decr_6_269:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r13, [%r1] 0x45
	.word 0xa780c005  ! 391: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r5, %-
DS_6_270:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe732e184  ! 1: STQF_I	-	%f19, [0x0184, %r11]
	normalw
	.word 0x93458000  ! 392: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xe537c000  ! 393: STQF_R	-	%f18, [%r0, %r31]
intveclr_6_271:
	setx 0x5e0290d19255086b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 395: RDPC	rd	%pc, %r17
mondo_6_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d95000d  ! 396: WRPR_WSTATE_R	wrpr	%r20, %r13, %wstate
	.word 0xe08008a0  ! 397: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x26800001  ! 398: BL	bl,a	<label_0x1>
splash_cmpr_6_274:
	setx 0x1f00aa616bbf5c34, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96aa9b2  ! 400: SDIVX_I	sdivx	%r10, 0x09b2, %r20
DS_6_276:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
intveclr_6_277:
	setx 0x39383fac17b8bedc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 402: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_278:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 403: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
pmu_6_279:
	nop
	setx 0xfffffff0fffffc3b, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_6_280-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_280:
	.word 0x91944003  ! 405: WRPR_PIL_R	wrpr	%r17, %r3, %pil
debug_6_281:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 406: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_6_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_282-donret_6_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1c33, %tstate
    wrhpr %g0, 0x344, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (6)
	retry
donretarg_6_282:
	.word 0xe6ffe2b9  ! 407: SWAPA_I	swapa	%r19, [%r31 + 0x02b9] %asi
mondo_6_283:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d90c00a  ! 408: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
splash_tba_6_284:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 409: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_6_285:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r8, [%r1] 0x45
	.word 0xa7808014  ! 410: WR_GRAPHICS_STATUS_REG_R	wr	%r2, %r20, %-
	.word 0xa9a00174  ! 411: FABSq	dis not found

intveclr_6_286:
	setx 0xf5e2b2b9c140faa3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 412: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_6_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_6_287:
	.word 0x8f902001  ! 413: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_6_288:
	tsubcctv %r21, 0x191d, %r15
	.word 0xd207e2b9  ! 414: LDUW_I	lduw	[%r31 + 0x02b9], %r9
	.word 0x91d02035  ! 415: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 416: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903863  ! 417: WRPR_PSTATE_I	wrpr	%r0, 0x1863, %pstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_289
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_289:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 418: RDPC	rd	%pc, %r19
tagged_6_290:
	tsubcctv %r10, 0x1ce9, %r14
	.word 0xe407e2b9  ! 419: LDUW_I	lduw	[%r31 + 0x02b9], %r18
	.word 0x91a00163  ! 420: FABSq	dis not found

memptr_6_291:
	set user_data_start, %r31
	.word 0x8584f2c8  ! 421: WRCCR_I	wr	%r19, 0x12c8, %ccr
splash_cmpr_6_292:
	setx 0xf061b2fd798dbedb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 422: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_6_293:
	.word 0x93a149c4  ! 1: FDIVd	fdivd	%f36, %f4, %f40
	.word 0xbfe7c000  ! 423: SAVE_R	save	%r31, %r0, %r31
	.word 0xd8dfe000  ! 424: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
	.word 0x9ba309c4  ! 425: FDIVd	fdivd	%f12, %f4, %f44
memptr_6_294:
	set user_data_start, %r31
	.word 0x8580b534  ! 426: WRCCR_I	wr	%r2, 0x1534, %ccr
donret_6_295:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_295-donret_6_295-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1509, %tstate
    wrhpr %g0, 0xa5d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (6)
	done
donretarg_6_295:
	.word 0xd6fff6a7  ! 427: SWAPA_I	swapa	%r11, [%r31 + 0xfffff6a7] %asi
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_296:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 428: CASA_R	casa	[%r31] %asi, %r1, %r11
mondo_6_297:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d918012  ! 429: WRPR_WSTATE_R	wrpr	%r6, %r18, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01967  ! 430: FqTOd	dis not found

	.word 0x91a00172  ! 431: FABSq	dis not found

tagged_6_299:
	taddcctv %r4, 0x1cc4, %r15
	.word 0xe407f6a7  ! 432: LDUW_I	lduw	[%r31 + 0xfffff6a7], %r18
	.word 0x95a00171  ! 433: FABSq	dis not found

	.word 0x99540000  ! 434: RDPR_GL	rdpr	%-, %r12
splash_cmpr_6_300:
	setx 0xc46e9042f59ef9b4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 435: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_decr_6_301:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r15, [%r1] 0x45
	.word 0xa784800c  ! 436: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r12, %-
	.word 0xda8008a0  ! 437: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_6_302:
	nop
	setx 0xfffff807fffff04c, %g1, %g7
	.word 0xa3800007  ! 438: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_6_303:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 439: RESTORE_R	restore	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_304) + 24, 16, 16)) -> intp(5,0,9)
intvec_6_304:
	.word 0x39400001  ! 440: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ff6a7  ! 441: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff6a7]
	.word 0xda8fe010  ! 442: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
intveclr_6_305:
	setx 0x8f1d02b91d7ad91d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 443: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_6_306:
	set user_data_start, %r31
	.word 0x8584a6a2  ! 444: WRCCR_I	wr	%r18, 0x06a2, %ccr
	.word 0xda6ffae0  ! 445: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffae0]
intveclr_6_307:
	setx 0x269964deadcdd9e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_6_308:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 447: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_6_309-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_309:
	.word 0x91950013  ! 448: WRPR_PIL_R	wrpr	%r20, %r19, %pil
splash_tba_6_310:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 449: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9a489d2  ! 450: FDIVd	fdivd	%f18, %f18, %f20
	rd %pc, %r19
	add %r19, (ivw_6_311-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_311:
	.word 0x91940001  ! 451: WRPR_PIL_R	wrpr	%r16, %r1, %pil
	rd %pc, %r19
	add %r19, (ivw_6_312-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_312:
	.word 0x9195000d  ! 452: WRPR_PIL_R	wrpr	%r20, %r13, %pil
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 453: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802de7  ! 454: SIR	sir	0x0de7
	.word 0xd46ffb56  ! 455: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
	.word 0xd46ffb56  ! 456: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
pmu_6_313:
	nop
	setx 0xfffffc5efffff4e1, %g1, %g7
	.word 0xa3800007  ! 457: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_6_314:
	set 0x60340000, %r31
	.word 0x858437e5  ! 458: WRCCR_I	wr	%r16, 0x17e5, %ccr
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 459: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_6_315:
	setx 0xf8ae784e553af510, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 460: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_6_316:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_316-donret_6_316), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x42d, %tstate
    wrhpr %g0, 0x5d5, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (6)
	retry
donretarg_6_316:
	.word 0xd4fffcce  ! 461: SWAPA_I	swapa	%r10, [%r31 + 0xfffffcce] %asi
	.word 0x9195398d  ! 462: WRPR_PIL_I	wrpr	%r20, 0x198d, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 463: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd53fc000  ! 464: STDF_R	std	%f10, [%r0, %r31]
	.word 0xd4dfe020  ! 465: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
mondo_6_317:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d944010  ! 466: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
mondo_6_318:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d92c010  ! 467: WRPR_WSTATE_R	wrpr	%r11, %r16, %wstate
	.word 0x91d02035  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_6_319:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_6_320:
	set 0x60340000, %r31
	.word 0x85802566  ! 470: WRCCR_I	wr	%r0, 0x0566, %ccr
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_321:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 471: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0xd537f470  ! 472: STQF_I	-	%f10, [0x1470, %r31]
splash_cmpr_6_322:
	setx 0x94c0dc272d30f8b3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_323
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_323:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 474: CASA_R	casa	[%r31] %asi, %r0, %r10
mondo_6_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d944011  ! 475: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
splash_hpstate_6_325:
	.word 0x81982f8e  ! 476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8e, %hpstate
	.word 0x95a509ca  ! 477: FDIVd	fdivd	%f20, %f10, %f10
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_326
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_326:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 478: RDPC	rd	%pc, %r10
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_327
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_327:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 479: CASA_R	casa	[%r31] %asi, %r13, %r18
	.word 0x30700001  ! 480: BPA	<illegal instruction>
intveclr_6_328:
	setx 0x781503082a0f6e84, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 481: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xab05ae9ac2ced7a2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_329:
	.word 0x39400001  ! 482: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_6_330:
	nop
	setx 0xfffff86afffff7db, %g1, %g7
	.word 0xa3800007  ! 483: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_6_331:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 484: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_6_332:
	nop
	setx 0xfffff9f4fffff530, %g1, %g7
	.word 0xa3800007  ! 485: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa5480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0xdb27c000  ! 487: STF_R	st	%f13, [%r0, %r31]
pmu_6_333:
	nop
	setx 0xffffff5ffffffb9f, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_6_334:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_334-donret_6_334), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1d2c, %tstate
    wrhpr %g0, 0xf85, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (6)
	retry
donretarg_6_334:
	.word 0xdafff470  ! 489: SWAPA_I	swapa	%r13, [%r31 + 0xfffff470] %asi
	rd %pc, %r19
	add %r19, (ivw_6_335-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_335:
	.word 0x9194c012  ! 490: WRPR_PIL_R	wrpr	%r19, %r18, %pil
debug_6_336:
	nop
	mov 8, %r18
	.word 0xe0f00492  ! 491: STXA_R	stxa	%r16, [%r0 + %r18] 0x24
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_337
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_337:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 492: CASA_R	casa	[%r31] %asi, %r12, %r13
memptr_6_338:
	set 0x60740000, %r31
	.word 0x858173a0  ! 493: WRCCR_I	wr	%r5, 0x13a0, %ccr
debug_6_339:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 494: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xda800bc0  ! 495: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r13
	.word 0xda8008a0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda97e000  ! 497: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
change_to_randtl_6_340:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_340:
	.word 0x8f902001  ! 498: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    set 0x265f, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b247f2  ! 499: PDISTN	fmean16	%d40, %d18, %d12
pmu_6_341:
	nop
	setx 0xfffffdfffffff505, %g1, %g7
	.word 0xa3800007  ! 500: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_342
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_342:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 501: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_htba_6_343:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 502: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_344
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_344
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_344:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 503: RDPC	rd	%pc, %r11
	setx 0xcaf35c308d9c8cd1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_345:
	.word 0x39400001  ! 504: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_6_346:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_346-donret_6_346), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xb71, %tstate
    wrhpr %g0, 0xd8f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (6)
	retry
donretarg_6_346:
	.word 0xe6ffefb6  ! 505: SWAPA_I	swapa	%r19, [%r31 + 0x0fb6] %asi
	.word 0x91d020b5  ! 506: Tcc_I	ta	icc_or_xcc, %r0 + 181
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 507: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01960  ! 508: FqTOd	dis not found

cwp_6_348:
    set user_data_start, %o7
	.word 0x93902006  ! 509: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
cwp_6_349:
    set user_data_start, %o7
	.word 0x93902001  ! 510: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	rd %pc, %r19
	add %r19, (ivw_6_350-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_350:
	.word 0x9190c011  ! 511: WRPR_PIL_R	wrpr	%r3, %r17, %pil
	.word 0xa9450000  ! 512: RD_SET_SOFTINT	rd	%set_softint, %r20
intveclr_6_351:
	setx 0x89c20a770fc693bb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 513: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda57c000  ! 514: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36c36a4  ! 515: SDIVX_I	sdivx	%r16, 0xfffff6a4, %r17
memptr_6_353:
	set 0x60540000, %r31
	.word 0x8584fde9  ! 516: WRCCR_I	wr	%r19, 0x1de9, %ccr
	.word 0xe4bfe44b  ! 517: STDA_I	stda	%r18, [%r31 + 0x044b] %asi
	.word 0x91d02035  ! 518: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x99464000  ! 519: RD_STICK_CMPR_REG	rd	%-, %r12
intveclr_6_354:
	setx 0xd2ef6b93290804ec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 520: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_6_355:
	nop
	setx 0xfffffa01fffff972, %g1, %g7
	.word 0xa3800007  ! 521: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93a509c3  ! 522: FDIVd	fdivd	%f20, %f34, %f40
intveclr_6_356:
	setx 0x375249bbfd4e9f30, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 523: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 524: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
intveclr_6_357:
	setx 0x46b5ddd92922d62b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1500000  ! 526: RDPR_TPC	rdpr	%tpc, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_358) + 40, 16, 16)) -> intp(7,0,13)
intvec_6_358:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_6_359:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 528: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_6_360:
	.word 0xa1a249d0  ! 1: FDIVd	fdivd	%f40, %f16, %f16
	.word 0xd931f4cc  ! 1: STQF_I	-	%f12, [0x14cc, %r7]
	normalw
	.word 0x9b458000  ! 529: RD_SOFTINT_REG	rd	%softint, %r13
debug_6_361:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 530: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd08008a0  ! 531: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x95450000  ! 532: RD_SET_SOFTINT	rd	%set_softint, %r10
	.word 0xe26ff145  ! 533: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
	.word 0xe26ff145  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
mondo_6_362:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d90800c  ! 535: WRPR_WSTATE_R	wrpr	%r2, %r12, %wstate
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 536: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe2800a60  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r17
intveclr_6_363:
	setx 0x1cb7e2600833821a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 538: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d92800c  ! 539: WRPR_WSTATE_R	wrpr	%r10, %r12, %wstate
	.word 0xe21fc000  ! 540: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x99902001  ! 541: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xe337f145  ! 542: STQF_I	-	%f17, [0x1145, %r31]
DS_6_365:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 543: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	rd %pc, %r19
	add %r19, (ivw_6_366-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_366:
	.word 0x91948004  ! 544: WRPR_PIL_R	wrpr	%r18, %r4, %pil
	.word 0xe247f145  ! 545: LDSW_I	ldsw	[%r31 + 0xfffff145], %r17
donret_6_367:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_6_367-donret_6_367-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xe90, %tstate
    wrhpr %g0, 0x706, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (6)
	done
donretarg_6_367:
	.word 0xe2fff145  ! 546: SWAPA_I	swapa	%r17, [%r31 + 0xfffff145] %asi
mondo_6_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94400c  ! 547: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
DS_6_369:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x97b34307  ! 548: ALIGNADDRESS	alignaddr	%r13, %r7, %r11
	.word 0x91d020b2  ! 549: Tcc_I	ta	icc_or_xcc, %r0 + 178
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_370
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_370:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 550: CASA_R	casa	[%r31] %asi, %r3, %r8
	setx 0x29475ee07ff6b037, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_371:
	.word 0x39400001  ! 551: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd09ff145  ! 552: LDDA_I	ldda	[%r31, + 0xfffff145] %asi, %r8
splash_lsu_6_372:
	setx 0xdc29276a235fa2fa, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 553: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_6_373:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 554: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6d2fb6  ! 555: SDIVX_I	sdivx	%r20, 0x0fb6, %r13
	.word 0xd137c000  ! 556: STQF_R	-	%f8, [%r0, %r31]
	.word 0xd00fe46f  ! 557: LDUB_I	ldub	[%r31 + 0x046f], %r8
	.word 0xd077e46f  ! 558: STX_I	stx	%r8, [%r31 + 0x046f]
splash_decr_6_375:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r7, [%r1] 0x45
	.word 0xa7830009  ! 559: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r9, %-
splash_cmpr_6_376:
	setx 0xefd6ba3ae15ebd8a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 560: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a309d0  ! 561: FDIVd	fdivd	%f12, %f16, %f10
mondo_6_377:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d904011  ! 562: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
cwp_6_378:
    set user_data_start, %o7
	.word 0x93902004  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_379:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 564: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0xa3a00170  ! 565: FABSq	dis not found

	.word 0x93520000  ! 566: RDPR_PIL	rdpr	%pil, %r9
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_380
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_380:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 567: RDPC	rd	%pc, %r19
mondo_6_381:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d948009  ! 568: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
mondo_6_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d91c014  ! 569: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
	.word 0xd03fe46f  ! 570: STD_I	std	%r8, [%r31 + 0x046f]
	.word 0x95a00173  ! 571: FABSq	dis not found

	.word 0xe06fe46f  ! 572: LDSTUB_I	ldstub	%r16, [%r31 + 0x046f]
debug_6_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 573: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93d020b4  ! 574: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xe08fe000  ! 575: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r16
intveclr_6_384:
	setx 0x57fe5f9d56f5f5b3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 576: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 577: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_6_385:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 578: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_386:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 579: CASA_R	casa	[%r31] %asi, %r10, %r16
debug_6_387:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 580: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
pmu_6_388:
	nop
	setx 0xffffff13fffffc81, %g1, %g7
	.word 0xa3800007  ! 581: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_6_389-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_389:
	.word 0x91920011  ! 582: WRPR_PIL_R	wrpr	%r8, %r17, %pil
change_to_randtl_6_390:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_6_390:
	.word 0x8f902002  ! 583: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01971  ! 584: FqTOd	dis not found

	.word 0x36700001  ! 585: BPGE	<illegal instruction>
mondo_6_392:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d91800b  ! 586: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976d315d  ! 587: SDIVX_I	sdivx	%r20, 0xfffff15d, %r11
	.word 0x95a00174  ! 588: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_394
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_394:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 589: RDPC	rd	%pc, %r13
	.word 0xd0dfe020  ! 590: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r8
	.word 0xd0d7e020  ! 591: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
	setx 0x03de8daecea666c9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_395:
	.word 0x39400001  ! 592: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_396:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 593: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_6_397:
	setx 0x4c6031376e05b41d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 594: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_6_398:
	nop
	setx 0xfffff40bfffffb34, %g1, %g7
	.word 0xa3800007  ! 595: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x83d020b4  ! 596: Tcc_I	te	icc_or_xcc, %r0 + 180
intveclr_6_399:
	setx 0xb36dab6f5bcfcb53, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 597: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd03fe06b  ! 598: STD_I	std	%r8, [%r31 + 0x006b]
debug_6_400:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 599: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_6_401-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_401:
	.word 0x91904010  ! 600: WRPR_PIL_R	wrpr	%r1, %r16, %pil
mondo_6_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c8] %asi
	.word 0x9d94c000  ! 601: WRPR_WSTATE_R	wrpr	%r19, %r0, %wstate
	.word 0x99a1c9c3  ! 602: FDIVd	fdivd	%f38, %f34, %f12
intveclr_6_403:
	setx 0x3e60b47ef00e26d0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 603: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 604: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01962  ! 605: FqTOd	dis not found

    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 606: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0xe737e06b  ! 607: STQF_I	-	%f19, [0x006b, %r31]
pmu_6_407:
	nop
	setx 0xfffff475fffffd43, %g1, %g7
	.word 0xa3800007  ! 608: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_6_408-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_408:
	.word 0x91948006  ! 609: WRPR_PIL_R	wrpr	%r18, %r6, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01967  ! 610: FqTOd	dis not found

	.word 0xd737c000  ! 611: STQF_R	-	%f11, [%r0, %r31]
debug_6_410:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 612: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97697947  ! 613: SDIVX_I	sdivx	%r5, 0xfffff947, %r11
	.word 0x81510000  ! 614: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91d02033  ! 615: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_6_412:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe88008a0  ! 617: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
pmu_6_413:
	nop
	setx 0xffffffdffffff5fb, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99902000  ! 619: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
splash_cmpr_6_414:
	setx 0xbb140f4ed8a888f0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 620: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_415:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 621: RDPC	rd	%pc, %r8
splash_lsu_6_416:
	setx 0xd974a0fed11c1e9c, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 622: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd477f103  ! 623: STX_I	stx	%r10, [%r31 + 0xfffff103]
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_417
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_417:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 624: RDPC	rd	%pc, %r9
	.word 0x91d02035  ! 625: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_6_418:
	setx 0xa462d81c68ba529b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 626: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa5a509ca  ! 627: FDIVd	fdivd	%f20, %f10, %f18
DS_6_419:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 628: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xab844014  ! 629: WR_CLEAR_SOFTINT_R	wr	%r17, %r20, %clear_softint
splash_cmpr_6_420:
	setx 0xa099fc3dc0963200, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 630: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_6_421-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_421:
	.word 0x9191c014  ! 631: WRPR_PIL_R	wrpr	%r7, %r20, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_422)+32, 16, 16)) -> intp(6,1,3)
xir_6_422:
	.word 0xa981e2e1  ! 632: WR_SET_SOFTINT_I	wr	%r7, 0x02e1, %set_softint
mondo_6_423:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d914011  ! 633: WRPR_WSTATE_R	wrpr	%r5, %r17, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_424
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_424:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 634: CASA_R	casa	[%r31] %asi, %r3, %r11
debug_6_425:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 635: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_6_426:
	setx 0xc9620be696d48898, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 636: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_6_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d92000d  ! 637: WRPR_WSTATE_R	wrpr	%r8, %r13, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76ca101  ! 638: SDIVX_I	sdivx	%r18, 0x0101, %r19
intveclr_6_429:
	setx 0x7908b6423d885a65, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 639: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_430:
	setx 0xdfe62e7dee05d751, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 640: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x6fa9a6c1d07da639, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_431:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_432:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d950014  ! 642: WRPR_WSTATE_R	wrpr	%r20, %r20, %wstate
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_433
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_433
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_433:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 643: RDPC	rd	%pc, %r13
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_434
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_434:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 644: CASA_R	casa	[%r31] %asi, %r4, %r18
	setx 0xbaece151176c68a4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_435:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_436:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 646: CASA_R	casa	[%r31] %asi, %r4, %r18
splash_cmpr_6_437:
	setx 0x780263617c151bf2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 647: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_6_438:
	setx 0xa2bc430a248e1012, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 648: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 649: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
DS_6_439:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa3a00548  ! 1: FSQRTd	fsqrt	
	.word 0x9ba14820  ! 650: FADDs	fadds	%f5, %f0, %f13
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_6_440:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 652: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa7520000  ! 653: RDPR_PIL	rdpr	%pil, %r19
	setx 0x1bb7a605bd37dd4e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_441:
	.word 0x39400001  ! 654: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_442:
	setx 0xc97d9ff060c97a67, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 655: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_6_443:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 656: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_444
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_444:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 657: CASA_R	casa	[%r31] %asi, %r9, %r12
memptr_6_445:
	set 0x60340000, %r31
	.word 0x8582a414  ! 658: WRCCR_I	wr	%r10, 0x0414, %ccr
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_446
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_446
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_446:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 659: RDPC	rd	%pc, %r8
splash_cmpr_6_447:
	setx 0xdd972c1408530528, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 660: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_448:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e009  ! 661: CASA_R	casa	[%r31] %asi, %r9, %r13
	rd %pc, %r19
	add %r19, (ivw_6_449-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_449:
	.word 0x91940005  ! 662: WRPR_PIL_R	wrpr	%r16, %r5, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01963  ! 663: FqTOd	dis not found

	.word 0xa9a00160  ! 664: FABSq	dis not found

debug_6_451:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 665: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_6_452-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_6_452:
	.word 0x91904008  ! 666: WRPR_PIL_R	wrpr	%r1, %r8, %pil
	.word 0xda6fe48d  ! 667: LDSTUB_I	ldstub	%r13, [%r31 + 0x048d]
	.word 0x9f8039c6  ! 668: SIR	sir	0x19c6
mondo_6_453:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d948008  ! 669: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
	.word 0x8d902f95  ! 670: WRPR_PSTATE_I	wrpr	%r0, 0x0f95, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01972  ! 671: FqTOd	dis not found

	.word 0xa1a409c4  ! 672: FDIVd	fdivd	%f16, %f4, %f16
memptr_6_455:
	set 0x60540000, %r31
	.word 0x8585377d  ! 673: WRCCR_I	wr	%r20, 0x177d, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 674: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_6_456:
	setx 0x1dce1a79ccb3ab69, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 675: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xedb2e2caf16c5728, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_457:
	.word 0x39400001  ! 676: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_6_458:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 677: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_6_459:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 678: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (6+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_6_460
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_6_460
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_6_460:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 679: RDPC	rd	%pc, %r19
	setx 0x59b80d51cb516a36, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_461:
	.word 0x39400001  ! 680: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_6_462:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d924010  ! 681: WRPR_WSTATE_R	wrpr	%r9, %r16, %wstate
    mov (6+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_6_463
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_6_463:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 682: CASA_R	casa	[%r31] %asi, %r17, %r16
cwp_6_464:
    set user_data_start, %o7
	.word 0x93902005  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_6_465:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 684: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_6_466)+8, 16, 16)) -> intp(6,1,3)
xir_6_466:
	.word 0xa9837da2  ! 685: WR_SET_SOFTINT_I	wr	%r13, 0x1da2, %set_softint
	.word 0xa1a00172  ! 686: FABSq	dis not found

debug_6_467:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 687: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93464000  ! 688: RD_STICK_CMPR_REG	rd	%-, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_6_468) + 24, 16, 16)) -> intp(6,0,5)
intvec_6_468:
	.word 0x39400001  ! 689: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 690: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_6_469:
	set 0x60140000, %r31
	.word 0x85802f5f  ! 691: WRCCR_I	wr	%r0, 0x0f5f, %ccr
splash_cmpr_6_470:
	setx 0x12a84ad6dc4fdca6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 692: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_6_471:
	nop
	setx 0xfffffac7fffff8b0, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_6_472:
	setx 0x26d1c79ca0121334, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 694: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x98ef15723da32292, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_473:
	.word 0x39400001  ! 695: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_6_474:
	setx 0x7c530c3de265847e, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 696: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_6_475:
	setx 0xbecde6c2d23d666c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 697: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_6_476:
	setx 0xd2bb69a51222dd73, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 698: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x6b550944b722e82a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_6_477:
	.word 0x39400001  ! 699: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a249c7  ! 700: FDIVd	fdivd	%f40, %f38, %f8
splash_tba_6_478:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 701: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	invalw
	mov 0x32, %r30
splash_cmpr_5_0:
	setx 0x9be624f37cc4c33c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_1:
	setx 0xa6a0a58d7a2fe017, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_2:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 3: RDPC	rd	%pc, %r13
	.word 0x91d02033  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_hpstate_5_3:
	.word 0x81982ef7  ! 5: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ef7, %hpstate
donret_5_4:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_4-donret_5_4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x11e7, %tstate
    wrhpr %g0, 0x20f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (5)
	retry
donretarg_5_4:
	.word 0xe6ffee7d  ! 6: SWAPA_I	swapa	%r19, [%r31 + 0x0e7d] %asi
	.word 0x38700001  ! 7: BPGU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_5:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 8: RDPC	rd	%pc, %r17
	.word 0xa3a209c3  ! 9: FDIVd	fdivd	%f8, %f34, %f48
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01971  ! 10: FqTOd	dis not found

mondo_5_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d910009  ! 11: WRPR_WSTATE_R	wrpr	%r4, %r9, %wstate
splash_hpstate_5_8:
	.word 0x81982cc7  ! 12: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc7, %hpstate
mondo_5_9:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d908006  ! 13: WRPR_WSTATE_R	wrpr	%r2, %r6, %wstate
	.word 0xd80fee7d  ! 14: LDUB_I	ldub	[%r31 + 0x0e7d], %r12
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_10:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 15: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa982000d  ! 16: WR_SET_SOFTINT_R	wr	%r8, %r13, %set_softint
	setx 0x4eb3a185cc7d03f1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a00163  ! 18: FABSq	dis not found

	.word 0x93d02035  ! 19: Tcc_I	tne	icc_or_xcc, %r0 + 53
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_12) + 16, 16, 16)) -> intp(6,0,3)
intvec_5_12:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_5_13:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 21: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902cb4  ! 22: WRPR_PSTATE_I	wrpr	%r0, 0x0cb4, %pstate
	.word 0xab850014  ! 23: WR_CLEAR_SOFTINT_R	wr	%r20, %r20, %clear_softint
memptr_5_14:
	set 0x60740000, %r31
	.word 0x8580bfd4  ! 24: WRCCR_I	wr	%r2, 0x1fd4, %ccr
	setx 0x2bdb091fd548c8b0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_15:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956cbc78  ! 26: SDIVX_I	sdivx	%r18, 0xfffffc78, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16c3368  ! 27: SDIVX_I	sdivx	%r16, 0xfffff368, %r16
mondo_5_18:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d914001  ! 28: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
mondo_5_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d914005  ! 29: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_20:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e009  ! 30: CASA_R	casa	[%r31] %asi, %r9, %r11
	.word 0x93a149d4  ! 31: FDIVd	fdivd	%f36, %f20, %f40
	.word 0xe2800bc0  ! 32: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r17
splash_cmpr_5_21:
	setx 0x1ee3f975c83dc48e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa1a00163  ! 34: FABSq	dis not found

pmu_5_22:
	nop
	setx 0xfffff1b6fffff4ad, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_5_23:
	nop
	setx 0xfffffad8fffff8ad, %g1, %g7
	.word 0xa3800007  ! 36: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_5_24:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_24:
	.word 0x8f902001  ! 37: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_25:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 38: RDPC	rd	%pc, %r10
	.word 0xab807308  ! 39: WR_CLEAR_SOFTINT_I	wr	%r1, 0x1308, %clear_softint
memptr_5_26:
	set 0x60540000, %r31
	.word 0x85836a52  ! 40: WRCCR_I	wr	%r13, 0x0a52, %ccr
	rd %pc, %r19
	add %r19, (ivw_5_27-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_27:
	.word 0x91934010  ! 41: WRPR_PIL_R	wrpr	%r13, %r16, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6c62e1  ! 42: SDIVX_I	sdivx	%r17, 0x02e1, %r13
intveclr_5_29:
	setx 0xe76ace96dedd1dd5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_30) + 24, 16, 16)) -> intp(1,0,0)
intvec_5_30:
	.word 0x39400001  ! 44: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_5_31:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 45: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01969  ! 46: FqTOd	dis not found

	setx 0x53bde224bf60f2b5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_33:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_5_34:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 48: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_5_35:
	setx 0x424ad04adbb64b13, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 49: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_5_36:
	.word 0x8198265f  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065f, %hpstate
	.word 0x99a00163  ! 51: FABSq	dis not found

	.word 0x8d90251f  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x051f, %pstate
	rd %pc, %r19
	add %r19, (ivw_5_37-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_37:
	.word 0x91918002  ! 53: WRPR_PIL_R	wrpr	%r6, %r2, %pil
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_38:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 54: RDPC	rd	%pc, %r10
	.word 0x97a00174  ! 55: FABSq	dis not found

debug_5_39:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 56: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
splash_cmpr_5_40:
	setx 0x9d696bcaa41cd9d7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 57: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd31fc000  ! 58: LDDF_R	ldd	[%r31, %r0], %f9
debug_5_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 59: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_42:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 60: RDPC	rd	%pc, %r13
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_43:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 61: RDPC	rd	%pc, %r13
	.word 0xd537fc6d  ! 62: STQF_I	-	%f10, [0x1c6d, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196a  ! 63: FqTOd	dis not found

pmu_5_45:
	nop
	setx 0xfffff850fffff6aa, %g1, %g7
	.word 0xa3800007  ! 64: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_5_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d910005  ! 65: WRPR_WSTATE_R	wrpr	%r4, %r5, %wstate
DS_5_47:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd3318010  ! 1: STQF_R	-	%f9, [%r16, %r6]
	normalw
	.word 0xa9458000  ! 66: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xe0c7e000  ! 67: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_48) + 24, 16, 16)) -> intp(0,0,17)
intvec_5_48:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_5_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_49-donret_5_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x396, %tstate
    wrhpr %g0, 0xdd7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (5)
	done
donretarg_5_49:
	.word 0xe0fffc6d  ! 69: SWAPA_I	swapa	%r16, [%r31 + 0xfffffc6d] %asi
	.word 0x8d9032eb  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x12eb, %pstate
pmu_5_50:
	nop
	setx 0xfffff91afffff495, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b692f9e  ! 72: SDIVX_I	sdivx	%r4, 0x0f9e, %r13
	.word 0x93d020b5  ! 73: Tcc_I	tne	icc_or_xcc, %r0 + 181
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_52:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e002  ! 74: CASA_R	casa	[%r31] %asi, %r2, %r11
mondo_5_53:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d90800a  ! 75: WRPR_WSTATE_R	wrpr	%r2, %r10, %wstate
memptr_5_54:
	set user_data_start, %r31
	.word 0x858536a6  ! 76: WRCCR_I	wr	%r20, 0x16a6, %ccr
splash_lsu_5_55:
	setx 0xd9c018927cb391a4, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 77: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_56:
	.word 0x81982b8f  ! 78: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8f, %hpstate
splash_cmpr_5_57:
	setx 0x2720e9dbaa8052f2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 79: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 80: BPGE	<illegal instruction>
pmu_5_58:
	nop
	setx 0xfffff7f3fffff602, %g1, %g7
	.word 0xa3800007  ! 81: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_59:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 82: RDPC	rd	%pc, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a0196d  ! 83: FqTOd	dis not found

splash_cmpr_5_61:
	setx 0xb3e1aee207c3c821, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 84: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe927f7c3  ! 85: STF_I	st	%f20, [0x17c3, %r31]
splash_tba_5_62:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_5_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d930014  ! 87: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0x91d020b2  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x91a489c6  ! 89: FDIVd	fdivd	%f18, %f6, %f8
	rd %pc, %r19
	add %r19, (ivw_5_64-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_64:
	.word 0x91904011  ! 90: WRPR_PIL_R	wrpr	%r1, %r17, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_65)+32, 16, 16)) -> intp(5,1,3)
xir_5_65:
	.word 0xa9807dee  ! 91: WR_SET_SOFTINT_I	wr	%r1, 0x1dee, %set_softint
change_to_randtl_5_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_66:
	.word 0x8f902001  ! 92: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	setx 0x8b6961ce4ffdb09e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_67:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_68) + 16, 16, 16)) -> intp(1,0,22)
intvec_5_68:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903ca4  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x1ca4, %pstate
	.word 0xe0800c40  ! 96: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r16
	.word 0x8d903d27  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x1d27, %pstate
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 98: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe0c7e000  ! 99: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	setx 0xc513548bec28eb7d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_69:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_5_70:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 101: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 102: RD_STICK_REG	stbar
	rd %pc, %r19
	add %r19, (ivw_5_71-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_71:
	.word 0x91940007  ! 103: WRPR_PIL_R	wrpr	%r16, %r7, %pil
	.word 0x99902000  ! 104: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
change_to_randtl_5_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_72:
	.word 0x8f902000  ! 105: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_cmpr_5_73:
	setx 0x41c4ed79f368aab7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 107: CASA_R	casa	[%r31] %asi, %r10, %r16
	.word 0x26800001  ! 108: BL	bl,a	<label_0x1>
splash_hpstate_5_75:
	.word 0x81982a0d  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0d, %hpstate
intveclr_5_76:
	setx 0x26ec66fdeb00cd07, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 110: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe00fc000  ! 111: LDUB_R	ldub	[%r31 + %r0], %r16
donret_5_77:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_77-donret_5_77-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1b37, %tstate
    wrhpr %g0, 0xfdd, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (5)
	done
donretarg_5_77:
	.word 0xe0ffe388  ! 112: SWAPA_I	swapa	%r16, [%r31 + 0x0388] %asi
change_to_randtl_5_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_78:
	.word 0x8f902002  ! 113: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9f80332d  ! 114: SIR	sir	0x132d
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6cab79  ! 115: SDIVX_I	sdivx	%r18, 0x0b79, %r13
memptr_5_80:
	set 0x60540000, %r31
	.word 0x8580f61c  ! 116: WRCCR_I	wr	%r3, 0x161c, %ccr
mondo_5_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d914010  ! 117: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
DS_5_82:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 118: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	setx 0x3887f4ce1112ec0d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d920010  ! 120: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
	setx 0xd48957a664b4bd2e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_85:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 122: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
donret_5_86:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_86-donret_5_86), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x91b, %tstate
    wrhpr %g0, 0xa1f, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (5)
	retry
donretarg_5_86:
	.word 0xe8ffecb2  ! 123: SWAPA_I	swapa	%r20, [%r31 + 0x0cb2] %asi
DS_5_87:
	.word 0x93a4c9d0  ! 1: FDIVd	fdivd	%f50, %f16, %f40
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe7150000  ! 1: LDQF_R	-	[%r20, %r0], %f19
	.word 0x99a24823  ! 124: FADDs	fadds	%f9, %f3, %f12
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_88:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 125: CASA_R	casa	[%r31] %asi, %r16, %r12
splash_cmpr_5_89:
	setx 0x52c03e6071985faa, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 126: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_90) + 40, 16, 16)) -> intp(5,0,31)
intvec_5_90:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_91:
	.word 0x8f902002  ! 128: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_5_92:
	setx 0x4d3cc38c5357d75f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x39b6, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b047f4  ! 130: PDISTN	fmean16	%d32, %d20, %d8
	.word 0xd477c000  ! 131: STX_R	stx	%r10, [%r31 + %r0]
	setx 0xb09069186af091e0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_93:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 133: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_5_94:
	setx 0x853a95a60227d438, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_95:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 135: CASA_R	casa	[%r31] %asi, %r10, %r10
	.word 0x8d903780  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x1780, %pstate
	.word 0x99902002  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
memptr_5_96:
	set user_data_start, %r31
	.word 0x85852fb6  ! 138: WRCCR_I	wr	%r20, 0x0fb6, %ccr
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_97:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 139: RDPC	rd	%pc, %r17
	rd %pc, %r19
	add %r19, (ivw_5_98-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_98:
	.word 0x91918009  ! 140: WRPR_PIL_R	wrpr	%r6, %r9, %pil
memptr_5_99:
	set user_data_start, %r31
	.word 0x8582b0eb  ! 141: WRCCR_I	wr	%r10, 0x10eb, %ccr
splash_hpstate_5_100:
	.word 0x8198255d  ! 142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055d, %hpstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_101:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 143: RDPC	rd	%pc, %r16
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_102:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 144: RDPC	rd	%pc, %r8
	.word 0x8d9038be  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x18be, %pstate
	.word 0x3a700001  ! 146: BPCC	<illegal instruction>
    set 0x3518, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb347f4  ! 147: PDISTN	fmean16	%d44, %d20, %d44
splash_cmpr_5_103:
	setx 0xa11024bc73f2fa2e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_104:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbf4bcbec	! Random illegal ?
	.word 0xa1a489c7  ! 1: FDIVd	fdivd	%f18, %f38, %f16
	.word 0x99a0c822  ! 149: FADDs	fadds	%f3, %f2, %f12
mondo_5_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d914014  ! 150: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
	.word 0xa350c000  ! 151: RDPR_TT	<illegal instruction>
memptr_5_106:
	set 0x60140000, %r31
	.word 0x8582a62c  ! 152: WRCCR_I	wr	%r10, 0x062c, %ccr
	setx 0x8a88ecaec2d25bbe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_107:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9808014  ! 154: WR_SET_SOFTINT_R	wr	%r2, %r20, %set_softint
	.word 0xe297e030  ! 155: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_108:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 156: RDPC	rd	%pc, %r12
	setx 0xd0450799cae036dd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_109:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95480000  ! 158: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0xa7a00172  ! 159: FABSq	dis not found

DS_5_110:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f14, %f12, %f2
	.word 0xa7b48312  ! 160: ALIGNADDRESS	alignaddr	%r18, %r18, %r19
	.word 0x2a700001  ! 161: BPCS	<illegal instruction>
DS_5_111:
	.word 0x93a449ca  ! 1: FDIVd	fdivd	%f48, %f10, %f40
	allclean
	.word 0x9bb2430d  ! 162: ALIGNADDRESS	alignaddr	%r9, %r13, %r13
debug_5_112:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76a67f7  ! 164: SDIVX_I	sdivx	%r9, 0x07f7, %r19
	.word 0xe897e020  ! 165: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r20
	.word 0xe8dfe030  ! 166: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_114:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 167: RDPC	rd	%pc, %r12
	.word 0xe48008a0  ! 168: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	rd %pc, %r19
	add %r19, (ivw_5_115-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_115:
	.word 0x91940011  ! 169: WRPR_PIL_R	wrpr	%r16, %r17, %pil
debug_5_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 171: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_5_117:
	setx 0x663e05a01ef9666e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_118:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe457fe3c  ! 174: LDSH_I	ldsh	[%r31 + 0xfffffe3c], %r18
tagged_5_119:
	taddcctv %r14, 0x15e9, %r21
	.word 0xe407fe3c  ! 175: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
pmu_5_120:
	nop
	setx 0xfffffef9fffff983, %g1, %g7
	.word 0xa3800007  ! 176: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_5_121:
	setx 0xe6f1563981164c1d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d900012  ! 178: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
tagged_5_123:
	taddcctv %r22, 0x19e7, %r19
	.word 0xe407fe3c  ! 179: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
	.word 0x91d02035  ! 180: Tcc_I	ta	icc_or_xcc, %r0 + 53
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 181: LDX_R	ldx	[%r31 + %r0], %r18
debug_5_124:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_5_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d934003  ! 183: WRPR_WSTATE_R	wrpr	%r13, %r3, %wstate
	rd %pc, %r19
	add %r19, (ivw_5_126-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_126:
	.word 0x91930012  ! 184: WRPR_PIL_R	wrpr	%r12, %r18, %pil
	setx 0x501549d993597285, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_127:
	.word 0x39400001  ! 185: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_128) + 24, 16, 16)) -> intp(3,0,12)
intvec_5_128:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a00165  ! 187: FABSq	dis not found

debug_5_129:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 188: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_130:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 189: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_lsu_5_131:
	setx 0xdbf620e04d452bae, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00173  ! 191: FABSq	dis not found

	.word 0xd0cfe020  ! 192: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r8
intveclr_5_132:
	setx 0xda19e19a60a795ec, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 51
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 195: RDPC	rd	%pc, %r16
splash_cmpr_5_134:
	setx 0xae04fdf0b2e2e18a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_135:
	setx 0x486722c4045482f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06ffe3c  ! 198: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe3c]
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_136:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 199: CASA_R	casa	[%r31] %asi, %r9, %r16
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_137
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_137:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 200: RDPC	rd	%pc, %r17
	.word 0x3e800001  ! 201: BVC	bvc,a	<label_0x1>
intveclr_5_138:
	setx 0x1df7194ff662df5a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 202: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_5_139:
	setx 0xad2315649112d57e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 203: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b3  ! 204: Tcc_I	tne	icc_or_xcc, %r0 + 179
donret_5_140:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_140-donret_5_140), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x12c2, %tstate
    wrhpr %g0, 0xd06, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (5)
	retry
donretarg_5_140:
	.word 0xd8fffe3c  ! 205: SWAPA_I	swapa	%r12, [%r31 + 0xfffffe3c] %asi
splash_htba_5_141:
	set 0x003b0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 206: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_5_142:
	setx 0x128cab7a3541d82c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_5_144:
	.word 0x8198278d  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078d, %hpstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_145:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 210: CASA_R	casa	[%r31] %asi, %r9, %r12
splash_cmpr_5_146:
	setx 0x4c7888f41bb8c276, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 211: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_147:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 212: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0xab84bc96  ! 213: WR_CLEAR_SOFTINT_I	wr	%r18, 0x1c96, %clear_softint
intveclr_5_148:
	setx 0x35cb0c934aba902e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_149)+40, 16, 16)) -> intp(5,1,3)
xir_5_149:
	.word 0xa9846c0a  ! 215: WR_SET_SOFTINT_I	wr	%r17, 0x0c0a, %set_softint
pmu_5_150:
	nop
	setx 0xfffff739fffff02f, %g1, %g7
	.word 0xa3800007  ! 216: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_5_151:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_151:
	.word 0x8f902000  ! 217: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x26700001  ! 218: BPL	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_152) + 24, 16, 16)) -> intp(4,0,13)
intvec_5_152:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a00161  ! 220: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_5_153-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_153:
	.word 0x91930013  ! 221: WRPR_PIL_R	wrpr	%r12, %r19, %pil
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_154
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_154:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 222: RDPC	rd	%pc, %r10
	.word 0x91d02034  ! 223: Tcc_I	ta	icc_or_xcc, %r0 + 52
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 224: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_5_156:
	setx 0x621af5fc0fbd0035, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_5_157:
	setx 0xe0e009464aadadd3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97a00163  ! 227: FABSq	dis not found

splash_cmpr_5_158:
	setx 0x6d77acdf9637e05e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_159:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 229: RDPC	rd	%pc, %r13
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_160:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 230: RDPC	rd	%pc, %r9
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_161
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_161
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_161:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 231: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_162
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_162:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 232: RDPC	rd	%pc, %r18
	setx 0x0ff6254fe6a07c85, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_163:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_5_164:
	nop
	setx 0xfffffad3fffffd0b, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x7855750c6e92309f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_165:
	.word 0x39400001  ! 235: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9169a347  ! 236: SDIVX_I	sdivx	%r6, 0x0347, %r8
	.word 0x91d02032  ! 237: Tcc_I	ta	icc_or_xcc, %r0 + 50
mondo_5_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d91000a  ! 238: WRPR_WSTATE_R	wrpr	%r4, %r10, %wstate
splash_cmpr_5_168:
	setx 0x45efe8604bc603d3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d914014  ! 240: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
mondo_5_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d90c007  ! 241: WRPR_WSTATE_R	wrpr	%r3, %r7, %wstate
splash_cmpr_5_171:
	setx 0xab1565c1adf44d55, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 242: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_172) + 8, 16, 16)) -> intp(4,0,20)
intvec_5_172:
	.word 0x39400001  ! 243: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_173:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x93a189ca  ! 245: FDIVd	fdivd	%f6, %f10, %f40
	.word 0xda800a80  ! 246: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r13
splash_hpstate_5_174:
	.word 0x819821a5  ! 247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01a5, %hpstate
	setx 0x1fe4708facba248d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_175:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_176:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r13
	.word 0xa7480000  ! 250: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xd64fc000  ! 251: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0xd60ff241  ! 252: LDUB_I	ldub	[%r31 + 0xfffff241], %r11
	.word 0x8d902601  ! 253: WRPR_PSTATE_I	wrpr	%r0, 0x0601, %pstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_177:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 254: RDPC	rd	%pc, %r10
splash_hpstate_5_178:
	.word 0x81982704  ! 255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0704, %hpstate
mondo_5_179:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d918008  ! 256: WRPR_WSTATE_R	wrpr	%r6, %r8, %wstate
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_5_180:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 258: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x95464000  ! 259: RD_STICK_CMPR_REG	rd	%-, %r10
intveclr_5_181:
	setx 0xbf7dce28199e9a8d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1a049cd  ! 261: FDIVd	fdivd	%f32, %f44, %f16
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
	.word 0x91414000  ! 262: RDPC	rd	%pc, %r8
	rd %pc, %r19
	add %r19, (ivw_5_183-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_183:
	.word 0x91940004  ! 263: WRPR_PIL_R	wrpr	%r16, %r4, %pil
intveclr_5_184:
	setx 0x197da223eb7b0377, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 264: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_185:
	setx 0xa1f9f21cc5316106, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 265: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_5_186:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d944014  ! 266: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	rd %pc, %r19
	add %r19, (ivw_5_187-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_187:
	.word 0x91918009  ! 267: WRPR_PIL_R	wrpr	%r6, %r9, %pil
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_188:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 268: CASA_R	casa	[%r31] %asi, %r19, %r13
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_189:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 269: RDPC	rd	%pc, %r19
intveclr_5_190:
	setx 0x735e67aa273255bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 270: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_191:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_191:
	.word 0x8f902001  ! 271: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_5_192:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 272: RESTORE_R	restore	%r31, %r0, %r31
mondo_5_193:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d92c006  ! 273: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_194) + 8, 16, 16)) -> intp(7,0,1)
intvec_5_194:
	.word 0x39400001  ! 274: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d944011  ! 275: WRPR_WSTATE_R	wrpr	%r17, %r17, %wstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_196:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 276: RDPC	rd	%pc, %r10
debug_5_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 277: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa3500000  ! 278: RDPR_TPC	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_198:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 279: RDPC	rd	%pc, %r11
pmu_5_199:
	nop
	setx 0xfffff4abfffffcbe, %g1, %g7
	.word 0xa3800007  ! 280: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1a00170  ! 281: FABSq	dis not found

mondo_5_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d92400a  ! 282: WRPR_WSTATE_R	wrpr	%r9, %r10, %wstate
	.word 0x30800001  ! 283: BA	ba,a	<label_0x1>
pmu_5_201:
	nop
	setx 0xfffffc65fffff08f, %g1, %g7
	.word 0xa3800007  ! 284: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_5_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d92c004  ! 285: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
DS_5_203:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
memptr_5_204:
	set user_data_start, %r31
	.word 0x8582aa32  ! 287: WRCCR_I	wr	%r10, 0x0a32, %ccr
	.word 0x20800001  ! 288: BN	bn,a	<label_0x1>
pmu_5_205:
	nop
	setx 0xfffff24dfffffc07, %g1, %g7
	.word 0xa3800007  ! 289: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_206) + 24, 16, 16)) -> intp(2,0,31)
intvec_5_206:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_207:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 291: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8d903a7a  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x1a7a, %pstate
	.word 0xda37e0b8  ! 293: STH_I	sth	%r13, [%r31 + 0x00b8]
DS_5_208:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 294: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 296: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01966  ! 297: FqTOd	dis not found

debug_5_211:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 298: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_5_212:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d948010  ! 299: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76abc59  ! 300: SDIVX_I	sdivx	%r10, 0xfffffc59, %r19
	.word 0x9ba109c4  ! 301: FDIVd	fdivd	%f4, %f4, %f44
	.word 0x8d903a0e  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x1a0e, %pstate
intveclr_5_214:
	setx 0xf198d0d3194e1552, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01961  ! 304: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_216
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_216:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 305: RDPC	rd	%pc, %r12
intveclr_5_217:
	setx 0x598bbe3b93262d8f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91500000  ! 307: RDPR_TPC	<illegal instruction>
	.word 0x9ba4c9c8  ! 308: FDIVd	fdivd	%f50, %f8, %f44
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_218:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 309: RDPC	rd	%pc, %r11
donret_5_219:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_219-donret_5_219-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1c35, %tstate
    wrhpr %g0, 0xbdf, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (5)
	done
donretarg_5_219:
	.word 0xe6ffe4a4  ! 310: SWAPA_I	swapa	%r19, [%r31 + 0x04a4] %asi
	rd %pc, %r19
	add %r19, (ivw_5_220-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_220:
	.word 0x91920014  ! 311: WRPR_PIL_R	wrpr	%r8, %r20, %pil
intveclr_5_221:
	setx 0xc4365c94fa93bc3d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d920012  ! 313: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	.word 0xe6800c60  ! 314: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r19
	.word 0x9b454000  ! 315: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
donret_5_223:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_223-donret_5_223-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1ae2, %tstate
    wrhpr %g0, 0x817, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (5)
	done
donretarg_5_223:
	.word 0xd6ffe4a4  ! 316: SWAPA_I	swapa	%r11, [%r31 + 0x04a4] %asi
intveclr_5_224:
	setx 0x84844cae8c45afdd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 317: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_5_225:
	.word 0x819828e4  ! 318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08e4, %hpstate
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
	.word 0x99414000  ! 319: RDPC	rd	%pc, %r12
	.word 0xe607c000  ! 320: LDUW_R	lduw	[%r31 + %r0], %r19
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 321: CASA_R	casa	[%r31] %asi, %r20, %r19
memptr_5_228:
	set user_data_start, %r31
	.word 0x858070af  ! 322: WRCCR_I	wr	%r1, 0x10af, %ccr
	.word 0x93d02035  ! 323: Tcc_I	tne	icc_or_xcc, %r0 + 53
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_229:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 324: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0x8d90344b  ! 325: WRPR_PSTATE_I	wrpr	%r0, 0x144b, %pstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_230:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 326: RDPC	rd	%pc, %r10
mondo_5_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d92c012  ! 327: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
debug_5_232:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 328: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_233)+0, 16, 16)) -> intp(5,1,3)
xir_5_233:
	.word 0xa98329f9  ! 329: WR_SET_SOFTINT_I	wr	%r12, 0x09f9, %set_softint
DS_5_234:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 330: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x99902003  ! 331: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
mondo_5_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d90c012  ! 332: WRPR_WSTATE_R	wrpr	%r3, %r18, %wstate
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 333: Tcc_R	te	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_5_236-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_236:
	.word 0x9192400a  ! 334: WRPR_PIL_R	wrpr	%r9, %r10, %pil
DS_5_237:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 335: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xd01fff3e  ! 336: LDD_I	ldd	[%r31 + 0xffffff3e], %r8
	.word 0x8d903b9c  ! 337: WRPR_PSTATE_I	wrpr	%r0, 0x1b9c, %pstate
	.word 0xd03fff3e  ! 338: STD_I	std	%r8, [%r31 + 0xffffff3e]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196a  ! 339: FqTOd	dis not found

	.word 0x8d90267f  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x067f, %pstate
pmu_5_239:
	nop
	setx 0xfffff255fffff7de, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_240:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 342: RDPC	rd	%pc, %r11
mondo_5_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d900010  ! 343: WRPR_WSTATE_R	wrpr	%r0, %r16, %wstate
intveclr_5_242:
	setx 0x28167d72ca2b1ae5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9454000  ! 345: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
mondo_5_243:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d90c011  ! 346: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196c  ! 347: FqTOd	dis not found

	.word 0x95540000  ! 348: RDPR_GL	<illegal instruction>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_245
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_245:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e001  ! 349: CASA_R	casa	[%r31] %asi, %r1, %r8
	.word 0x99a00172  ! 350: FABSq	dis not found

memptr_5_246:
	set user_data_start, %r31
	.word 0x8584b0f8  ! 351: WRCCR_I	wr	%r18, 0x10f8, %ccr
	.word 0xd477c000  ! 352: STX_R	stx	%r10, [%r31 + %r0]
	.word 0x8d902e25  ! 353: WRPR_PSTATE_I	wrpr	%r0, 0x0e25, %pstate
memptr_5_247:
	set 0x60340000, %r31
	.word 0x85843af9  ! 354: WRCCR_I	wr	%r16, 0x1af9, %ccr
	.word 0xd46ff8e6  ! 355: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
    set 0x258b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b487e1  ! 356: PDISTN	fmean16	%d18, %d32, %d8
mondo_5_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d940001  ! 357: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
	.word 0x26800001  ! 358: BL	bl,a	<label_0x1>
pmu_5_249:
	nop
	setx 0xfffffd2dfffffc24, %g1, %g7
	.word 0xa3800007  ! 359: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46ff8e6  ! 360: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
change_to_randtl_5_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_250:
	.word 0x8f902002  ! 361: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_5_251:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_252
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_252:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e007  ! 363: CASA_R	casa	[%r31] %asi, %r7, %r10
debug_5_253:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 364: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99902004  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_254)+40, 16, 16)) -> intp(5,1,3)
xir_5_254:
	.word 0xa9842e5a  ! 366: WR_SET_SOFTINT_I	wr	%r16, 0x0e5a, %set_softint
	.word 0x8d902ce5  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x0ce5, %pstate
intveclr_5_255:
	setx 0xb9a9d675659a4cb6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 368: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9350c000  ! 369: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_256
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_256:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 370: RDPC	rd	%pc, %r19
	.word 0xa9500000  ! 371: RDPR_TPC	<illegal instruction>
	.word 0x9b45c000  ! 372: RD_TICK_CMPR_REG	rd	%-, %r13
splash_cmpr_5_257:
	setx 0xdd73400ff1999d77, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_258:
	setx 0xd20f65a1ee9d3f98, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 374: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xa1808f8ffb3ae640, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_259:
	.word 0x39400001  ! 375: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95480000  ! 376: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_260:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 377: CASA_R	casa	[%r31] %asi, %r7, %r19
mondo_5_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d914006  ! 378: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
intveclr_5_262:
	setx 0x83fb0d5602098c1d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 380: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe6800b60  ! 381: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r19
	.word 0xe63fc000  ! 382: STD_R	std	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_5_264-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_264:
	.word 0x91950006  ! 383: WRPR_PIL_R	wrpr	%r20, %r6, %pil
splash_cmpr_5_265:
	setx 0x8d0bb29e16a9a2bf, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 384: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 385: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0xa65ead59d6aad39b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_267:
	.word 0x39400001  ! 386: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903e13  ! 387: WRPR_PSTATE_I	wrpr	%r0, 0x1e13, %pstate
	.word 0x28700001  ! 388: BPLEU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_268:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 389: RDPC	rd	%pc, %r18
	.word 0xad81f321  ! 390: WR_SOFTINT_REG_I	wr	%r7, 0x1321, %softint
	.word 0xa782c008  ! 391: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r8, %-
DS_5_270:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe930b69b  ! 1: STQF_I	-	%f20, [0x169b, %r2]
	normalw
	.word 0x9b458000  ! 392: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xe537c000  ! 393: STQF_R	-	%f18, [%r0, %r31]
intveclr_5_271:
	setx 0x0345dad50ec0beb0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 395: RDPC	rd	%pc, %r19
mondo_5_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d920000  ! 396: WRPR_WSTATE_R	wrpr	%r8, %r0, %wstate
	.word 0xe08008a0  ! 397: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x26800001  ! 398: BL	bl,a	<label_0x1>
splash_cmpr_5_274:
	setx 0xbb58e0c57cb0c4b1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa369ab3a  ! 400: SDIVX_I	sdivx	%r6, 0x0b3a, %r17
DS_5_276:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
intveclr_5_277:
	setx 0x1cc98fcc53cc400c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 402: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_278:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 403: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
pmu_5_279:
	nop
	setx 0xfffff694fffffc4e, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_5_280-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_280:
	.word 0x9193000a  ! 405: WRPR_PIL_R	wrpr	%r12, %r10, %pil
debug_5_281:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 406: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_5_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_282-donret_5_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x16ac, %tstate
    wrhpr %g0, 0x88c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (5)
	retry
donretarg_5_282:
	.word 0xe6ffe2b9  ! 407: SWAPA_I	swapa	%r19, [%r31 + 0x02b9] %asi
mondo_5_283:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d914005  ! 408: WRPR_WSTATE_R	wrpr	%r5, %r5, %wstate
splash_tba_5_284:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 409: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa782c006  ! 410: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r6, %-
	.word 0xa5a00170  ! 411: FABSq	dis not found

intveclr_5_286:
	setx 0x08052eea178db63c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 412: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_5_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_5_287:
	.word 0x8f902001  ! 413: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_5_288:
	tsubcctv %r18, 0x183e, %r7
	.word 0xd207e2b9  ! 414: LDUW_I	lduw	[%r31 + 0x02b9], %r9
	.word 0x93d02035  ! 415: Tcc_I	tne	icc_or_xcc, %r0 + 53
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 416: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903938  ! 417: WRPR_PSTATE_I	wrpr	%r0, 0x1938, %pstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_289
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_289:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 418: RDPC	rd	%pc, %r20
tagged_5_290:
	tsubcctv %r13, 0x1df2, %r9
	.word 0xe407e2b9  ! 419: LDUW_I	lduw	[%r31 + 0x02b9], %r18
	.word 0x97a00168  ! 420: FABSq	dis not found

memptr_5_291:
	set user_data_start, %r31
	.word 0x8581eedd  ! 421: WRCCR_I	wr	%r7, 0x0edd, %ccr
splash_cmpr_5_292:
	setx 0xbb7a1cb795980923, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 422: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_5_293:
	.word 0x97a249cc  ! 1: FDIVd	fdivd	%f40, %f12, %f42
	.word 0xbfe7c000  ! 423: SAVE_R	save	%r31, %r0, %r31
	.word 0xd8dfe010  ! 424: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0xa1a349c7  ! 425: FDIVd	fdivd	%f44, %f38, %f16
memptr_5_294:
	set user_data_start, %r31
	.word 0x8584f8ca  ! 426: WRCCR_I	wr	%r19, 0x18ca, %ccr
donret_5_295:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_295-donret_5_295-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1c24, %tstate
    wrhpr %g0, 0x98e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (5)
	done
donretarg_5_295:
	.word 0xd6fff6a7  ! 427: SWAPA_I	swapa	%r11, [%r31 + 0xfffff6a7] %asi
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_296:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 428: CASA_R	casa	[%r31] %asi, %r1, %r11
mondo_5_297:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d924014  ! 429: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a0196c  ! 430: FqTOd	dis not found

	.word 0x99a0016b  ! 431: FABSq	dis not found

tagged_5_299:
	taddcctv %r26, 0x128c, %r11
	.word 0xe407f6a7  ! 432: LDUW_I	lduw	[%r31 + 0xfffff6a7], %r18
	.word 0xa7a00168  ! 433: FABSq	dis not found

	.word 0x95540000  ! 434: RDPR_GL	rdpr	%-, %r10
splash_cmpr_5_300:
	setx 0x949f8211c79fceb4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 435: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa784c00d  ! 436: WR_GRAPHICS_STATUS_REG_R	wr	%r19, %r13, %-
	.word 0xda8008a0  ! 437: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_5_302:
	nop
	setx 0xfffff861fffff195, %g1, %g7
	.word 0xa3800007  ! 438: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_5_303:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 439: RESTORE_R	restore	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_304) + 48, 16, 16)) -> intp(3,0,8)
intvec_5_304:
	.word 0x39400001  ! 440: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ff6a7  ! 441: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff6a7]
	.word 0xda8fe020  ! 442: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r13
intveclr_5_305:
	setx 0xbb43b3fe960881eb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 443: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_5_306:
	set user_data_start, %r31
	.word 0x8581eeaf  ! 444: WRCCR_I	wr	%r7, 0x0eaf, %ccr
	.word 0xda6ffae0  ! 445: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffae0]
intveclr_5_307:
	setx 0x898c602c706560cc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_5_308:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 447: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_5_309-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_309:
	.word 0x9194800b  ! 448: WRPR_PIL_R	wrpr	%r18, %r11, %pil
splash_tba_5_310:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 449: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93a349c4  ! 450: FDIVd	fdivd	%f44, %f4, %f40
	rd %pc, %r19
	add %r19, (ivw_5_311-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_311:
	.word 0x91940000  ! 451: WRPR_PIL_R	wrpr	%r16, %r0, %pil
	rd %pc, %r19
	add %r19, (ivw_5_312-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_312:
	.word 0x9195000d  ! 452: WRPR_PIL_R	wrpr	%r20, %r13, %pil
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 453: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f8025cc  ! 454: SIR	sir	0x05cc
	.word 0xd46ffb56  ! 455: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
	.word 0xd46ffb56  ! 456: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
pmu_5_313:
	nop
	setx 0xfffff4c1fffffc2e, %g1, %g7
	.word 0xa3800007  ! 457: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_5_314:
	set 0x60540000, %r31
	.word 0x85846c00  ! 458: WRCCR_I	wr	%r17, 0x0c00, %ccr
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 459: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_5_315:
	setx 0x4724446a4d865914, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 460: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_5_316:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_316-donret_5_316), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1a55, %tstate
    wrhpr %g0, 0x41e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (5)
	retry
donretarg_5_316:
	.word 0xd4fffcce  ! 461: SWAPA_I	swapa	%r10, [%r31 + 0xfffffcce] %asi
	.word 0x91947f71  ! 462: WRPR_PIL_I	wrpr	%r17, 0x1f71, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 463: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd53fc000  ! 464: STDF_R	std	%f10, [%r0, %r31]
	.word 0xd4dfe020  ! 465: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
mondo_5_317:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d900009  ! 466: WRPR_WSTATE_R	wrpr	%r0, %r9, %wstate
mondo_5_318:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d94c003  ! 467: WRPR_WSTATE_R	wrpr	%r19, %r3, %wstate
	.word 0x91d02033  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_5_319:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_5_320:
	set 0x60340000, %r31
	.word 0x8584a366  ! 470: WRCCR_I	wr	%r18, 0x0366, %ccr
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_321:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 471: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0xd537f470  ! 472: STQF_I	-	%f10, [0x1470, %r31]
splash_cmpr_5_322:
	setx 0x04b73421469fa094, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_323
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_323:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 474: CASA_R	casa	[%r31] %asi, %r0, %r10
mondo_5_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d8] %asi
	.word 0x9d93000a  ! 475: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
splash_hpstate_5_325:
	.word 0x81982995  ! 476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0995, %hpstate
	.word 0x9ba449c8  ! 477: FDIVd	fdivd	%f48, %f8, %f44
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_326
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_326:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 478: RDPC	rd	%pc, %r10
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_327
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_327:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 479: CASA_R	casa	[%r31] %asi, %r13, %r18
	.word 0x30700001  ! 480: BPA	<illegal instruction>
intveclr_5_328:
	setx 0x1bd6087523859207, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 481: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x292a426d85a6c521, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_329:
	.word 0x39400001  ! 482: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_5_330:
	nop
	setx 0xfffff40efffff697, %g1, %g7
	.word 0xa3800007  ! 483: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_5_331:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 484: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_5_332:
	nop
	setx 0xfffff3fdfffff92c, %g1, %g7
	.word 0xa3800007  ! 485: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x97480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xdb27c000  ! 487: STF_R	st	%f13, [%r0, %r31]
pmu_5_333:
	nop
	setx 0xffffff31fffff92f, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_5_334:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_334-donret_5_334), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x8b5, %tstate
    wrhpr %g0, 0x206, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (5)
	retry
donretarg_5_334:
	.word 0xdafff470  ! 489: SWAPA_I	swapa	%r13, [%r31 + 0xfffff470] %asi
	rd %pc, %r19
	add %r19, (ivw_5_335-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_335:
	.word 0x91948014  ! 490: WRPR_PIL_R	wrpr	%r18, %r20, %pil
debug_5_336:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 491: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_337
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_337:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 492: CASA_R	casa	[%r31] %asi, %r12, %r13
memptr_5_338:
	set 0x60340000, %r31
	.word 0x8581334c  ! 493: WRCCR_I	wr	%r4, 0x134c, %ccr
debug_5_339:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 494: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
	.word 0xda8008a0  ! 495: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda800bc0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r13
	.word 0xda97e030  ! 497: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
change_to_randtl_5_340:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_340:
	.word 0x8f902000  ! 498: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x1389, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b487ec  ! 499: PDISTN	fmean16	%d18, %d12, %d40
pmu_5_341:
	nop
	setx 0xffffff09fffff35a, %g1, %g7
	.word 0xa3800007  ! 500: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_342
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_342:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 501: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_htba_5_343:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 502: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_344
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_344
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_344:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 503: RDPC	rd	%pc, %r10
	setx 0xaad08e12bd9e9a4d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_345:
	.word 0x39400001  ! 504: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_5_346:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_346-donret_5_346), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x5bd, %tstate
    wrhpr %g0, 0xd0d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (5)
	retry
donretarg_5_346:
	.word 0xe6ffefb6  ! 505: SWAPA_I	swapa	%r19, [%r31 + 0x0fb6] %asi
	.word 0x91d020b5  ! 506: Tcc_I	ta	icc_or_xcc, %r0 + 181
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 507: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01969  ! 508: FqTOd	dis not found

cwp_5_348:
    set user_data_start, %o7
	.word 0x93902004  ! 509: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
cwp_5_349:
    set user_data_start, %o7
	.word 0x93902004  ! 510: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	rd %pc, %r19
	add %r19, (ivw_5_350-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_350:
	.word 0x9192c000  ! 511: WRPR_PIL_R	wrpr	%r11, %r0, %pil
	.word 0x95450000  ! 512: RD_SET_SOFTINT	rd	%set_softint, %r10
intveclr_5_351:
	setx 0xc63b8eabff153eac, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 513: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda57c000  ! 514: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93686fc8  ! 515: SDIVX_I	sdivx	%r1, 0x0fc8, %r9
memptr_5_353:
	set 0x60740000, %r31
	.word 0x8582a401  ! 516: WRCCR_I	wr	%r10, 0x0401, %ccr
	.word 0xe4bfe44b  ! 517: STDA_I	stda	%r18, [%r31 + 0x044b] %asi
	.word 0x91d02032  ! 518: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91464000  ! 519: RD_STICK_CMPR_REG	rd	%-, %r8
intveclr_5_354:
	setx 0xead9ac545089bce2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 520: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_5_355:
	nop
	setx 0xfffffa95fffffcae, %g1, %g7
	.word 0xa3800007  ! 521: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3a089c2  ! 522: FDIVd	fdivd	%f2, %f2, %f48
intveclr_5_356:
	setx 0xe0f9e828bf739211, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 523: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd8800be0  ! 524: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r12
intveclr_5_357:
	setx 0x454bcf1ea010014b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93500000  ! 526: RDPR_TPC	rdpr	%tpc, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_358) + 32, 16, 16)) -> intp(0,0,18)
intvec_5_358:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_5_359:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 528: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_5_360:
	.word 0x99a1c9ca  ! 1: FDIVd	fdivd	%f38, %f10, %f12
	.word 0xe134e8a9  ! 1: STQF_I	-	%f16, [0x08a9, %r19]
	normalw
	.word 0x91458000  ! 529: RD_SOFTINT_REG	rd	%softint, %r8
debug_5_361:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 530: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd0800c00  ! 531: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r8
	.word 0xa5450000  ! 532: RD_SET_SOFTINT	rd	%set_softint, %r18
	.word 0xe26ff145  ! 533: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
	.word 0xe26ff145  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
mondo_5_362:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d91800d  ! 535: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 536: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28008a0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
intveclr_5_363:
	setx 0xaa4d63536ff3e887, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 538: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d940001  ! 539: WRPR_WSTATE_R	wrpr	%r16, %r1, %wstate
	.word 0xe21fc000  ! 540: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x99902005  ! 541: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xe337f145  ! 542: STQF_I	-	%f17, [0x1145, %r31]
DS_5_365:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 543: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	rd %pc, %r19
	add %r19, (ivw_5_366-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_366:
	.word 0x91920009  ! 544: WRPR_PIL_R	wrpr	%r8, %r9, %pil
	.word 0xe247f145  ! 545: LDSW_I	ldsw	[%r31 + 0xfffff145], %r17
donret_5_367:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_5_367-donret_5_367-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1a6d, %tstate
    wrhpr %g0, 0x21c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (5)
	done
donretarg_5_367:
	.word 0xe2fff145  ! 546: SWAPA_I	swapa	%r17, [%r31 + 0xfffff145] %asi
mondo_5_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d94c002  ! 547: WRPR_WSTATE_R	wrpr	%r19, %r2, %wstate
DS_5_369:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x9bb20314  ! 548: ALIGNADDRESS	alignaddr	%r8, %r20, %r13
	.word 0x91d02034  ! 549: Tcc_I	ta	icc_or_xcc, %r0 + 52
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_370
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_370:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 550: CASA_R	casa	[%r31] %asi, %r3, %r8
	setx 0x440088d2af8d02b3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_371:
	.word 0x39400001  ! 551: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd09ff145  ! 552: LDDA_I	ldda	[%r31, + 0xfffff145] %asi, %r8
splash_lsu_5_372:
	setx 0xe7eddd70366d95eb, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 553: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_5_373:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 554: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9368658f  ! 555: SDIVX_I	sdivx	%r1, 0x058f, %r9
	.word 0xd137c000  ! 556: STQF_R	-	%f8, [%r0, %r31]
	.word 0xd00fe46f  ! 557: LDUB_I	ldub	[%r31 + 0x046f], %r8
	.word 0xd077e46f  ! 558: STX_I	stx	%r8, [%r31 + 0x046f]
	.word 0xa781c014  ! 559: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r20, %-
splash_cmpr_5_376:
	setx 0x4d7c6d9394790e86, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 560: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a249d0  ! 561: FDIVd	fdivd	%f40, %f16, %f12
mondo_5_377:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d914014  ! 562: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
cwp_5_378:
    set user_data_start, %o7
	.word 0x93902005  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_379:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 564: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x97a00164  ! 565: FABSq	dis not found

	.word 0xa3520000  ! 566: RDPR_PIL	rdpr	%pil, %r17
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_380
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_380:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 567: RDPC	rd	%pc, %r11
mondo_5_381:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d900000  ! 568: WRPR_WSTATE_R	wrpr	%r0, %r0, %wstate
mondo_5_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d900010  ! 569: WRPR_WSTATE_R	wrpr	%r0, %r16, %wstate
	.word 0xd03fe46f  ! 570: STD_I	std	%r8, [%r31 + 0x046f]
	.word 0x99a00173  ! 571: FABSq	dis not found

	.word 0xe06fe46f  ! 572: LDSTUB_I	ldstub	%r16, [%r31 + 0x046f]
debug_5_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 573: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 574: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe08fe030  ! 575: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r16
intveclr_5_384:
	setx 0xe2ac63db9071e507, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 576: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02034  ! 577: Tcc_I	te	icc_or_xcc, %r0 + 52
debug_5_385:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 578: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_386:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 579: CASA_R	casa	[%r31] %asi, %r10, %r16
debug_5_387:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 580: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
pmu_5_388:
	nop
	setx 0xfffffafafffff75f, %g1, %g7
	.word 0xa3800007  ! 581: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_5_389-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_389:
	.word 0x9194c006  ! 582: WRPR_PIL_R	wrpr	%r19, %r6, %pil
change_to_randtl_5_390:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_5_390:
	.word 0x8f902000  ! 583: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01969  ! 584: FqTOd	dis not found

	.word 0x36700001  ! 585: BPGE	<illegal instruction>
mondo_5_392:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d94400a  ! 586: WRPR_WSTATE_R	wrpr	%r17, %r10, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36b31a2  ! 587: SDIVX_I	sdivx	%r12, 0xfffff1a2, %r17
	.word 0x91a00170  ! 588: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_394
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_394:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 589: RDPC	rd	%pc, %r13
	.word 0xd0dfe030  ! 590: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r8
	.word 0xd0d7e030  ! 591: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	setx 0x15b9102b9fe43bd1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_395:
	.word 0x39400001  ! 592: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_396:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 593: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_5_397:
	setx 0xf56af7b44ee1e10d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 594: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_5_398:
	nop
	setx 0xfffffa3efffffb77, %g1, %g7
	.word 0xa3800007  ! 595: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 596: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_5_399:
	setx 0x6713a5827f2d1416, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 597: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd03fe06b  ! 598: STD_I	std	%r8, [%r31 + 0x006b]
debug_5_400:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 599: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_5_401-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_401:
	.word 0x9192c003  ! 600: WRPR_PIL_R	wrpr	%r11, %r3, %pil
mondo_5_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d92000c  ! 601: WRPR_WSTATE_R	wrpr	%r8, %r12, %wstate
	.word 0xa5a2c9c2  ! 602: FDIVd	fdivd	%f42, %f2, %f18
intveclr_5_403:
	setx 0xf71b37f47beabd7b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 603: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 604: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a0196a  ! 605: FqTOd	dis not found

    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 606: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0xe737e06b  ! 607: STQF_I	-	%f19, [0x006b, %r31]
pmu_5_407:
	nop
	setx 0xfffffc18fffff4e3, %g1, %g7
	.word 0xa3800007  ! 608: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_5_408-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_408:
	.word 0x9192c000  ! 609: WRPR_PIL_R	wrpr	%r11, %r0, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01969  ! 610: FqTOd	dis not found

	.word 0xd737c000  ! 611: STQF_R	-	%f11, [%r0, %r31]
debug_5_410:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 612: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56c7ca7  ! 613: SDIVX_I	sdivx	%r17, 0xfffffca7, %r18
	.word 0x81510000  ! 614: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91d02032  ! 615: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_5_412:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe88008a0  ! 617: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
pmu_5_413:
	nop
	setx 0xfffff24ffffff18d, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99902000  ! 619: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
splash_cmpr_5_414:
	setx 0xd0404d0c0cb91f83, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 620: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_415:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 621: RDPC	rd	%pc, %r12
splash_lsu_5_416:
	setx 0x432fbc4fdcb46f5b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 622: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd477f103  ! 623: STX_I	stx	%r10, [%r31 + 0xfffff103]
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_417
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_417:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 624: RDPC	rd	%pc, %r20
	.word 0x91d02032  ! 625: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_5_418:
	setx 0x72f5806bc47cb6f1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 626: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a2c9c1  ! 627: FDIVd	fdivd	%f42, %f32, %f10
DS_5_419:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 628: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xab84c009  ! 629: WR_CLEAR_SOFTINT_R	wr	%r19, %r9, %clear_softint
splash_cmpr_5_420:
	setx 0x0bd3c00dd3d788e2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 630: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_5_421-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_421:
	.word 0x9190000c  ! 631: WRPR_PIL_R	wrpr	%r0, %r12, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_422)+56, 16, 16)) -> intp(5,1,3)
xir_5_422:
	.word 0xa98423bc  ! 632: WR_SET_SOFTINT_I	wr	%r16, 0x03bc, %set_softint
mondo_5_423:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d928012  ! 633: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_424
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_424:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 634: CASA_R	casa	[%r31] %asi, %r3, %r11
debug_5_425:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 635: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_5_426:
	setx 0x6275f372947dca2d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 636: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_5_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d950002  ! 637: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa968a876  ! 638: SDIVX_I	sdivx	%r2, 0x0876, %r20
intveclr_5_429:
	setx 0x1497b424156ec480, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 639: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_430:
	setx 0xaba50b70170dff6b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 640: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xc41d1ed6dd76e675, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_431:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_432:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d950009  ! 642: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_433
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_433
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_433:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 643: RDPC	rd	%pc, %r9
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_434
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_434:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 644: CASA_R	casa	[%r31] %asi, %r4, %r18
	setx 0x0f2cee47b710f96e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_435:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_436:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 646: CASA_R	casa	[%r31] %asi, %r4, %r18
splash_cmpr_5_437:
	setx 0x50e8709b852de540, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 647: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_5_438:
	setx 0x6a9dadc86375730f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 648: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 649: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
DS_5_439:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa9a00552  ! 1: FSQRTd	fsqrt	
	.word 0x91a0482b  ! 650: FADDs	fadds	%f1, %f11, %f8
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_5_440:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 652: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa3520000  ! 653: RDPR_PIL	<illegal instruction>
	setx 0x04f004394dcce28b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_441:
	.word 0x39400001  ! 654: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_442:
	setx 0x18c601f52f2da03d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 655: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_5_443:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 656: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_444
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_444:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 657: CASA_R	casa	[%r31] %asi, %r9, %r12
memptr_5_445:
	set 0x60740000, %r31
	.word 0x8584f984  ! 658: WRCCR_I	wr	%r19, 0x1984, %ccr
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_446
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_446
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_446:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 659: RDPC	rd	%pc, %r16
splash_cmpr_5_447:
	setx 0x9a094d2040fd3c38, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 660: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_448:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e009  ! 661: CASA_R	casa	[%r31] %asi, %r9, %r13
	rd %pc, %r19
	add %r19, (ivw_5_449-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_449:
	.word 0x91930011  ! 662: WRPR_PIL_R	wrpr	%r12, %r17, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196a  ! 663: FqTOd	dis not found

	.word 0x9ba0016b  ! 664: FABSq	dis not found

debug_5_451:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 665: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_5_452-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_5_452:
	.word 0x91928013  ! 666: WRPR_PIL_R	wrpr	%r10, %r19, %pil
	.word 0xda6fe48d  ! 667: LDSTUB_I	ldstub	%r13, [%r31 + 0x048d]
	.word 0x9f802af7  ! 668: SIR	sir	0x0af7
mondo_5_453:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d948009  ! 669: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
	.word 0x8d902f97  ! 670: WRPR_PSTATE_I	wrpr	%r0, 0x0f97, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01966  ! 671: FqTOd	dis not found

	.word 0x95a0c9ca  ! 672: FDIVd	fdivd	%f34, %f10, %f10
memptr_5_455:
	set 0x60740000, %r31
	.word 0x8584baff  ! 673: WRCCR_I	wr	%r18, 0x1aff, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 674: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_5_456:
	setx 0xfb208afde7ae82f7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 675: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x68fb9fdaf88dabd9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_457:
	.word 0x39400001  ! 676: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_5_458:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 677: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_5_459:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 678: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (5+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_5_460
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_5_460
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_5_460:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 679: RDPC	rd	%pc, %r19
	setx 0x8fa86298a000ed3e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_461:
	.word 0x39400001  ! 680: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_5_462:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d94400c  ! 681: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
    mov (5+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_5_463
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_5_463:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 682: CASA_R	casa	[%r31] %asi, %r17, %r16
cwp_5_464:
    set user_data_start, %o7
	.word 0x93902001  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
debug_5_465:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 684: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_5_466)+48, 16, 16)) -> intp(5,1,3)
xir_5_466:
	.word 0xa98262e8  ! 685: WR_SET_SOFTINT_I	wr	%r9, 0x02e8, %set_softint
	.word 0xa5a00174  ! 686: FABSq	dis not found

debug_5_467:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 687: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91464000  ! 688: RD_STICK_CMPR_REG	rd	%-, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_5_468) + 40, 16, 16)) -> intp(1,0,21)
intvec_5_468:
	.word 0x39400001  ! 689: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 690: Tcc_R	te	icc_or_xcc, %r0 + %r30
memptr_5_469:
	set 0x60140000, %r31
	.word 0x8582232b  ! 691: WRCCR_I	wr	%r8, 0x032b, %ccr
splash_cmpr_5_470:
	setx 0xb25ef9a8652bea46, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 692: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_5_471:
	nop
	setx 0xfffff0cbfffff40f, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_5_472:
	setx 0x073d125432387b1e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 694: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x03d64294db87e434, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_473:
	.word 0x39400001  ! 695: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_5_474:
	setx 0x51f3a7ef07e88916, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 696: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_5_475:
	setx 0xfcfbb545e775e42d, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 697: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_5_476:
	setx 0x1d88557b9e97c3d3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 698: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xa22456f33458d719, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_5_477:
	.word 0x39400001  ! 699: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba109c9  ! 700: FDIVd	fdivd	%f4, %f40, %f44
splash_tba_5_478:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 701: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	invalw
	mov 0xb3, %r30
splash_cmpr_4_0:
	setx 0x179c8f5e97e85db9, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_1:
	setx 0x6aaf172bd8351b79, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_2:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 3: RDPC	rd	%pc, %r12
	.word 0x91d02032  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_hpstate_4_3:
	.word 0x819828ef  ! 5: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ef, %hpstate
donret_4_4:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_4-donret_4_4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x124f, %tstate
    wrhpr %g0, 0x6d6, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_4:
	.word 0xe6ffee7d  ! 6: SWAPA_I	swapa	%r19, [%r31 + 0x0e7d] %asi
	.word 0x38700001  ! 7: BPGU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_5:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 8: RDPC	rd	%pc, %r18
	.word 0xa7a309cd  ! 9: FDIVd	fdivd	%f12, %f44, %f50
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01967  ! 10: FqTOd	dis not found

mondo_4_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d91400a  ! 11: WRPR_WSTATE_R	wrpr	%r5, %r10, %wstate
splash_hpstate_4_8:
	.word 0x81982dd4  ! 12: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd4, %hpstate
mondo_4_9:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d8] %asi
	.word 0x9d95000c  ! 13: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	.word 0xd80fee7d  ! 14: LDUB_I	ldub	[%r31 + 0x0e7d], %r12
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_10:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 15: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa9814003  ! 16: WR_SET_SOFTINT_R	wr	%r5, %r3, %set_softint
	setx 0xf3c2eee21eb63ee6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95a00172  ! 18: FABSq	dis not found

	.word 0x93d02032  ! 19: Tcc_I	tne	icc_or_xcc, %r0 + 50
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_12) + 32, 16, 16)) -> intp(2,0,9)
intvec_4_12:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_13:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 21: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d90219f  ! 22: WRPR_PSTATE_I	wrpr	%r0, 0x019f, %pstate
	.word 0xab848014  ! 23: WR_CLEAR_SOFTINT_R	wr	%r18, %r20, %clear_softint
memptr_4_14:
	set 0x60140000, %r31
	.word 0x85847920  ! 24: WRCCR_I	wr	%r17, 0x1920, %ccr
	setx 0xe0888daaaa3704f3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_15:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3683596  ! 26: SDIVX_I	sdivx	%r0, 0xfffff596, %r17
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6b259c  ! 27: SDIVX_I	sdivx	%r12, 0x059c, %r13
mondo_4_18:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d934004  ! 28: WRPR_WSTATE_R	wrpr	%r13, %r4, %wstate
mondo_4_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d950003  ! 29: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_20:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e009  ! 30: CASA_R	casa	[%r31] %asi, %r9, %r11
	.word 0x99a449d2  ! 31: FDIVd	fdivd	%f48, %f18, %f12
	.word 0xe2800ac0  ! 32: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r17
splash_cmpr_4_21:
	setx 0x40ee07b00b3aff9e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a00163  ! 34: FABSq	dis not found

pmu_4_22:
	nop
	setx 0xffffffcafffff206, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_4_23:
	nop
	setx 0xfffffbf1fffff7a4, %g1, %g7
	.word 0xa3800007  ! 36: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_4_24:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_24:
	.word 0x8f902000  ! 37: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_25:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 38: RDPC	rd	%pc, %r11
	.word 0xab84e92d  ! 39: WR_CLEAR_SOFTINT_I	wr	%r19, 0x092d, %clear_softint
memptr_4_26:
	set 0x60540000, %r31
	.word 0x8580f152  ! 40: WRCCR_I	wr	%r3, 0x1152, %ccr
	rd %pc, %r19
	add %r19, (ivw_4_27-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_27:
	.word 0x91914010  ! 41: WRPR_PIL_R	wrpr	%r5, %r16, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa568a1c1  ! 42: SDIVX_I	sdivx	%r2, 0x01c1, %r18
intveclr_4_29:
	setx 0x886387158306d4a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_30) + 8, 16, 16)) -> intp(4,0,31)
intvec_4_30:
	.word 0x39400001  ! 44: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_31:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 45: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01972  ! 46: FqTOd	dis not found

	setx 0x14656d35d1d7a8c3, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_33:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_34:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 48: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_4_35:
	setx 0xe94e9081ff2dd625, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 49: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_4_36:
	.word 0x81982b1f  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1f, %hpstate
	.word 0x91a00170  ! 51: FABSq	dis not found

	.word 0x8d902e3f  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x0e3f, %pstate
	rd %pc, %r19
	add %r19, (ivw_4_37-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_37:
	.word 0x91914001  ! 53: WRPR_PIL_R	wrpr	%r5, %r1, %pil
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_38:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 54: RDPC	rd	%pc, %r10
	.word 0xa1a0016b  ! 55: FABSq	dis not found

debug_4_39:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_39:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_39
    nop
debug_wait4_39:
    ld [%r23], %r16
    brnz %r16, debug_wait4_39
    nop
    ba,a debug_startwait4_39
continue_debug_4_39:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_39:
    cmp %r13, %r15
    bne,a wait_for_stat_4_39
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_39:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_39
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 56: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
splash_cmpr_4_40:
	setx 0xfa73399b3574dbe7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 57: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd31fc000  ! 58: LDDF_R	ldd	[%r31, %r0], %f9
debug_4_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 59: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_42:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 60: RDPC	rd	%pc, %r9
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_43:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 61: RDPC	rd	%pc, %r13
	.word 0xd537fc6d  ! 62: STQF_I	-	%f10, [0x1c6d, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a0196d  ! 63: FqTOd	dis not found

pmu_4_45:
	nop
	setx 0xfffff11cfffff0c5, %g1, %g7
	.word 0xa3800007  ! 64: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d914013  ! 65: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
DS_4_47:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd9324005  ! 1: STQF_R	-	%f12, [%r5, %r9]
	normalw
	.word 0x99458000  ! 66: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xe0c7e030  ! 67: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_48) + 16, 16, 16)) -> intp(3,0,0)
intvec_4_48:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_4_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_49-donret_4_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1fe8, %tstate
    wrhpr %g0, 0x91c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_49:
	.word 0xe0fffc6d  ! 69: SWAPA_I	swapa	%r16, [%r31 + 0xfffffc6d] %asi
	.word 0x8d902c6e  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x0c6e, %pstate
pmu_4_50:
	nop
	setx 0xfffff026fffff293, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93692763  ! 72: SDIVX_I	sdivx	%r4, 0x0763, %r9
	.word 0x91d02035  ! 73: Tcc_I	ta	icc_or_xcc, %r0 + 53
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_52:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e002  ! 74: CASA_R	casa	[%r31] %asi, %r2, %r11
mondo_4_53:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d90000c  ! 75: WRPR_WSTATE_R	wrpr	%r0, %r12, %wstate
memptr_4_54:
	set user_data_start, %r31
	.word 0x8581a1d7  ! 76: WRCCR_I	wr	%r6, 0x01d7, %ccr
splash_lsu_4_55:
	setx 0x0cf61c187ea6c3e6, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 77: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_56:
	.word 0x81982647  ! 78: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0647, %hpstate
splash_cmpr_4_57:
	setx 0x2ec26f07bbadbd2d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 79: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 80: BPGE	<illegal instruction>
pmu_4_58:
	nop
	setx 0xfffffedbfffff49f, %g1, %g7
	.word 0xa3800007  ! 81: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_59:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 82: RDPC	rd	%pc, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01973  ! 83: FqTOd	dis not found

splash_cmpr_4_61:
	setx 0x902190244949f338, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 84: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe927f7c3  ! 85: STF_I	st	%f20, [0x17c3, %r31]
splash_tba_4_62:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_4_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d944005  ! 87: WRPR_WSTATE_R	wrpr	%r17, %r5, %wstate
	.word 0x91d02034  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93a149d3  ! 89: FDIVd	fdivd	%f36, %f50, %f40
	rd %pc, %r19
	add %r19, (ivw_4_64-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_64:
	.word 0x9191c000  ! 90: WRPR_PIL_R	wrpr	%r7, %r0, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_65)+0, 16, 16)) -> intp(4,1,3)
xir_4_65:
	.word 0xa98226b4  ! 91: WR_SET_SOFTINT_I	wr	%r8, 0x06b4, %set_softint
change_to_randtl_4_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_66:
	.word 0x8f902000  ! 92: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0xf6fddb7b566f39f0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_67:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_68) + 40, 16, 16)) -> intp(3,0,0)
intvec_4_68:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902793  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x0793, %pstate
	.word 0xe08008a0  ! 96: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8d902ec0  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0ec0, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0c7e020  ! 99: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
	setx 0x4d8be461ecbc0d39, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_69:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_70:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 101: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 102: RD_STICK_REG	stbar
	rd %pc, %r19
	add %r19, (ivw_4_71-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_71:
	.word 0x9192c002  ! 103: WRPR_PIL_R	wrpr	%r11, %r2, %pil
	.word 0x99902004  ! 104: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
change_to_randtl_4_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_72:
	.word 0x8f902002  ! 105: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_4_73:
	setx 0x590be245c071dbe4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 107: CASA_R	casa	[%r31] %asi, %r10, %r16
	.word 0x26800001  ! 108: BL	bl,a	<label_0x1>
splash_hpstate_4_75:
	.word 0x81982e8e  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8e, %hpstate
intveclr_4_76:
	setx 0xcbc4b5f6f581b2ed, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 110: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe00fc000  ! 111: LDUB_R	ldub	[%r31 + %r0], %r16
donret_4_77:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_77-donret_4_77-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xaf3, %tstate
    wrhpr %g0, 0x905, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	done
donretarg_4_77:
	.word 0xe0ffe388  ! 112: SWAPA_I	swapa	%r16, [%r31 + 0x0388] %asi
change_to_randtl_4_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_78:
	.word 0x8f902000  ! 113: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f803cd6  ! 114: SIR	sir	0x1cd6
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16921bf  ! 115: SDIVX_I	sdivx	%r4, 0x01bf, %r16
memptr_4_80:
	set 0x60140000, %r31
	.word 0x8581ee0c  ! 116: WRCCR_I	wr	%r7, 0x0e0c, %ccr
mondo_4_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d914004  ! 117: WRPR_WSTATE_R	wrpr	%r5, %r4, %wstate
DS_4_82:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 118: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	setx 0xf0f54b25f111b268, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d91c010  ! 120: WRPR_WSTATE_R	wrpr	%r7, %r16, %wstate
	setx 0x02e2180345b2dd66, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_85:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902001  ! 122: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
donret_4_86:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_86-donret_4_86), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x182, %tstate
    wrhpr %g0, 0x20c, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_86:
	.word 0xe8ffecb2  ! 123: SWAPA_I	swapa	%r20, [%r31 + 0x0cb2] %asi
DS_4_87:
	.word 0x9ba509d2  ! 1: FDIVd	fdivd	%f20, %f18, %f44
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe3108003  ! 1: LDQF_R	-	[%r2, %r3], %f17
	.word 0x93a14827  ! 124: FADDs	fadds	%f5, %f7, %f9
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_88:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 125: CASA_R	casa	[%r31] %asi, %r16, %r12
splash_cmpr_4_89:
	setx 0xcc67d7fa8aa1bbb1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 126: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_90) + 16, 16, 16)) -> intp(1,0,1)
intvec_4_90:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_91:
	.word 0x8f902000  ! 128: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_4_92:
	setx 0x84d0133f07e80da7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x206b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb4c7ea  ! 130: PDISTN	fmean16	%d50, %d10, %d44
	.word 0xd477c000  ! 131: STX_R	stx	%r10, [%r31 + %r0]
	setx 0xf57faf663ebdee33, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_93:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 133: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_4_94:
	setx 0x339b47ca591f4fff, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_95:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 135: CASA_R	casa	[%r31] %asi, %r10, %r10
	.word 0x8d903d0a  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x1d0a, %pstate
	.word 0x99902004  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
memptr_4_96:
	set user_data_start, %r31
	.word 0x8584b209  ! 138: WRCCR_I	wr	%r18, 0x1209, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_97:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 139: RDPC	rd	%pc, %r16
	rd %pc, %r19
	add %r19, (ivw_4_98-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_98:
	.word 0x9190000b  ! 140: WRPR_PIL_R	wrpr	%r0, %r11, %pil
memptr_4_99:
	set user_data_start, %r31
	.word 0x85817a8c  ! 141: WRCCR_I	wr	%r5, 0x1a8c, %ccr
splash_hpstate_4_100:
	.word 0x81982244  ! 142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0244, %hpstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_101:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 143: RDPC	rd	%pc, %r11
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_102:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 144: RDPC	rd	%pc, %r16
	.word 0x8d902bc5  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x0bc5, %pstate
	.word 0x3a700001  ! 146: BPCC	<illegal instruction>
    set 0x137d, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa5b247e8  ! 147: PDISTN	fmean16	%d40, %d8, %d18
splash_cmpr_4_103:
	setx 0x3c4d327fd2d3078e, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_104:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbd632cd7	! Random illegal ?
	.word 0x95a409c7  ! 1: FDIVd	fdivd	%f16, %f38, %f10
	.word 0x91a20830  ! 149: FADDs	fadds	%f8, %f16, %f8
mondo_4_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d91000b  ! 150: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
	.word 0x9150c000  ! 151: RDPR_TT	<illegal instruction>
memptr_4_106:
	set 0x60140000, %r31
	.word 0x85803286  ! 152: WRCCR_I	wr	%r0, 0x1286, %ccr
	setx 0x6c16dbc671fe4f1d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_107:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa982c013  ! 154: WR_SET_SOFTINT_R	wr	%r11, %r19, %set_softint
	.word 0xe297e010  ! 155: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_108:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 156: RDPC	rd	%pc, %r8
	setx 0x7c0e60187c7dce78, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_109:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93480000  ! 158: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x95a00167  ! 159: FABSq	dis not found

DS_4_110:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f8, %f12, %f10
	.word 0x91b4c303  ! 160: ALIGNADDRESS	alignaddr	%r19, %r3, %r8
	.word 0x2a700001  ! 161: BPCS	<illegal instruction>
DS_4_111:
	.word 0xa9a409c3  ! 1: FDIVd	fdivd	%f16, %f34, %f20
	allclean
	.word 0x95b5030b  ! 162: ALIGNADDRESS	alignaddr	%r20, %r11, %r10
debug_4_112:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c7933  ! 164: SDIVX_I	sdivx	%r17, 0xfffff933, %r10
	.word 0xe897e010  ! 165: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r20
	.word 0xe8dfe010  ! 166: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_114:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 167: RDPC	rd	%pc, %r16
	.word 0xe4800b40  ! 168: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
	rd %pc, %r19
	add %r19, (ivw_4_115-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_115:
	.word 0x9192c00b  ! 169: WRPR_PIL_R	wrpr	%r11, %r11, %pil
debug_4_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 171: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_cmpr_4_117:
	setx 0xa0d2ebffb44cf3a6, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_118:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe457fe3c  ! 174: LDSH_I	ldsh	[%r31 + 0xfffffe3c], %r18
tagged_4_119:
	taddcctv %r2, 0x1121, %r8
	.word 0xe407fe3c  ! 175: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
pmu_4_120:
	nop
	setx 0xfffffb98fffffbb4, %g1, %g7
	.word 0xa3800007  ! 176: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_121:
	setx 0x0033e2ee1a88ec86, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d904014  ! 178: WRPR_WSTATE_R	wrpr	%r1, %r20, %wstate
tagged_4_123:
	taddcctv %r3, 0x1a88, %r1
	.word 0xe407fe3c  ! 179: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
	.word 0x91d02033  ! 180: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 181: LDX_R	ldx	[%r31 + %r0], %r18
debug_4_124:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_4_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d948013  ! 183: WRPR_WSTATE_R	wrpr	%r18, %r19, %wstate
	rd %pc, %r19
	add %r19, (ivw_4_126-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_126:
	.word 0x9194c003  ! 184: WRPR_PIL_R	wrpr	%r19, %r3, %pil
	setx 0xcddf38c7f7fef6e8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_127:
	.word 0x39400001  ! 185: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_128) + 32, 16, 16)) -> intp(2,0,16)
intvec_4_128:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00171  ! 187: FABSq	dis not found

debug_4_129:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_129:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_129
    nop
debug_wait4_129:
    ld [%r23], %r16
    brnz %r16, debug_wait4_129
    nop
    ba,a debug_startwait4_129
continue_debug_4_129:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_129:
    cmp %r13, %r15
    bne,a wait_for_stat_4_129
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_129:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_129
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 188: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_130:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 189: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_lsu_4_131:
	setx 0x4a099abc3ae5eeea, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa3a00169  ! 191: FABSq	dis not found

	.word 0xd0cfe030  ! 192: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r8
intveclr_4_132:
	setx 0x23d7946b4c8e6cfb, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02032  ! 194: Tcc_I	te	icc_or_xcc, %r0 + 50
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 195: RDPC	rd	%pc, %r16
splash_cmpr_4_134:
	setx 0x8fc9e6bddbb5a278, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_135:
	setx 0xc2111fd11613a40f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06ffe3c  ! 198: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe3c]
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_136:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 199: CASA_R	casa	[%r31] %asi, %r9, %r16
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_137
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_137:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 200: RDPC	rd	%pc, %r13
	.word 0x3e800001  ! 201: BVC	bvc,a	<label_0x1>
intveclr_4_138:
	setx 0x262194f00a007d5c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 202: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_139:
	setx 0xb897f9ba865173a1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 203: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 204: Tcc_I	ta	icc_or_xcc, %r0 + 178
donret_4_140:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_140-donret_4_140), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x94b, %tstate
    wrhpr %g0, 0x6d5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_140:
	.word 0xd8fffe3c  ! 205: SWAPA_I	swapa	%r12, [%r31 + 0xfffffe3c] %asi
splash_htba_4_141:
	set 0x00380000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 206: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_4_142:
	setx 0x9998b05c17782acf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_4_144:
	.word 0x81982a6d  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a6d, %hpstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_145:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 210: CASA_R	casa	[%r31] %asi, %r9, %r12
splash_cmpr_4_146:
	setx 0x134309d5a5b4bd14, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 211: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_147:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_147:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_147
    nop
debug_wait4_147:
    ld [%r23], %r16
    brnz %r16, debug_wait4_147
    nop
    ba,a debug_startwait4_147
continue_debug_4_147:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_147:
    cmp %r13, %r15
    bne,a wait_for_stat_4_147
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_147:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_147
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe2f00492  ! 212: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xab8534c2  ! 213: WR_CLEAR_SOFTINT_I	wr	%r20, 0x14c2, %clear_softint
intveclr_4_148:
	setx 0x8886877e6f5f3b19, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_149)+56, 16, 16)) -> intp(4,1,3)
xir_4_149:
	.word 0xa982fd75  ! 215: WR_SET_SOFTINT_I	wr	%r11, 0x1d75, %set_softint
pmu_4_150:
	nop
	setx 0xfffff615fffff99b, %g1, %g7
	.word 0xa3800007  ! 216: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_4_151:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_151:
	.word 0x8f902000  ! 217: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x26700001  ! 218: BPL	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_152) + 0, 16, 16)) -> intp(5,0,24)
intvec_4_152:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba00172  ! 220: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_4_153-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_153:
	.word 0x91908012  ! 221: WRPR_PIL_R	wrpr	%r2, %r18, %pil
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_154
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_154:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 222: RDPC	rd	%pc, %r19
	.word 0x93d020b5  ! 223: Tcc_I	tne	icc_or_xcc, %r0 + 181
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 224: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_4_156:
	setx 0x14c12f8dd42ab49d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_4_157:
	setx 0x92afc1b6ed14c5c1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9ba00170  ! 227: FABSq	dis not found

splash_cmpr_4_158:
	setx 0xb742cb3766b03cd0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_159:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 229: RDPC	rd	%pc, %r19
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_160:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 230: RDPC	rd	%pc, %r11
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_161
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_161
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_161:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 231: RDPC	rd	%pc, %r13
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_162
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_162:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 232: RDPC	rd	%pc, %r17
	setx 0x7e28cb545bbd1110, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_163:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_164:
	nop
	setx 0xfffff897fffffac1, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xfbe0be3fd1a5cf6d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_165:
	.word 0x39400001  ! 235: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa369e4a7  ! 236: SDIVX_I	sdivx	%r7, 0x04a7, %r17
	.word 0x91d020b2  ! 237: Tcc_I	ta	icc_or_xcc, %r0 + 178
mondo_4_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d92c003  ! 238: WRPR_WSTATE_R	wrpr	%r11, %r3, %wstate
splash_cmpr_4_168:
	setx 0xc2eeef290137ee7a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d908013  ! 240: WRPR_WSTATE_R	wrpr	%r2, %r19, %wstate
mondo_4_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d92c012  ! 241: WRPR_WSTATE_R	wrpr	%r11, %r18, %wstate
splash_cmpr_4_171:
	setx 0x4585a0f954771764, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 242: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_172) + 40, 16, 16)) -> intp(7,0,13)
intvec_4_172:
	.word 0x39400001  ! 243: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_173:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x91a089c2  ! 245: FDIVd	fdivd	%f2, %f2, %f8
	.word 0xda800c00  ! 246: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r13
splash_hpstate_4_174:
	.word 0x819823a4  ! 247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03a4, %hpstate
	setx 0x92b89cd3f2941e0a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_175:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_176:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r13
	.word 0x91480000  ! 250: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xd64fc000  ! 251: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0xd60ff241  ! 252: LDUB_I	ldub	[%r31 + 0xfffff241], %r11
	.word 0x8d9039d7  ! 253: WRPR_PSTATE_I	wrpr	%r0, 0x19d7, %pstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_177:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 254: RDPC	rd	%pc, %r20
splash_hpstate_4_178:
	.word 0x81982394  ! 255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0394, %hpstate
mondo_4_179:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d90c014  ! 256: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 257: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_4_180:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_180:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_180
    nop
debug_wait4_180:
    ld [%r23], %r16
    brnz %r16, debug_wait4_180
    nop
    ba,a debug_startwait4_180
continue_debug_4_180:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_180:
    cmp %r13, %r15
    bne,a wait_for_stat_4_180
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_180:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_180
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 258: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
	.word 0x91464000  ! 259: RD_STICK_CMPR_REG	rd	%-, %r8
intveclr_4_181:
	setx 0xb0a49af6423651c6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93a509c1  ! 261: FDIVd	fdivd	%f20, %f32, %f40
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
	.word 0x91414000  ! 262: RDPC	rd	%pc, %r8
	rd %pc, %r19
	add %r19, (ivw_4_183-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_183:
	.word 0x91940012  ! 263: WRPR_PIL_R	wrpr	%r16, %r18, %pil
intveclr_4_184:
	setx 0xa624b4b4306825f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 264: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_185:
	setx 0x68bc776a99c307de, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 265: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_4_186:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d920010  ! 266: WRPR_WSTATE_R	wrpr	%r8, %r16, %wstate
	rd %pc, %r19
	add %r19, (ivw_4_187-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_187:
	.word 0x91900009  ! 267: WRPR_PIL_R	wrpr	%r0, %r9, %pil
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_188:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 268: CASA_R	casa	[%r31] %asi, %r19, %r13
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_189:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 269: RDPC	rd	%pc, %r12
intveclr_4_190:
	setx 0xc6c8a25b72cba5fa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 270: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_191:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_191:
	.word 0x8f902000  ! 271: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_4_192:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 272: RESTORE_R	restore	%r31, %r0, %r31
mondo_4_193:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d924013  ! 273: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_194) + 16, 16, 16)) -> intp(3,0,15)
intvec_4_194:
	.word 0x39400001  ! 274: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d900010  ! 275: WRPR_WSTATE_R	wrpr	%r0, %r16, %wstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_196:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 276: RDPC	rd	%pc, %r10
debug_4_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 277: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa1500000  ! 278: RDPR_TPC	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_198:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 279: RDPC	rd	%pc, %r10
pmu_4_199:
	nop
	setx 0xfffffef0fffff506, %g1, %g7
	.word 0xa3800007  ! 280: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95a00171  ! 281: FABSq	dis not found

mondo_4_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d944000  ! 282: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
	.word 0x30800001  ! 283: BA	ba,a	<label_0x1>
pmu_4_201:
	nop
	setx 0xfffff724fffffb1f, %g1, %g7
	.word 0xa3800007  ! 284: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_4_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c8] %asi
	.word 0x9d948012  ! 285: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
DS_4_203:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
memptr_4_204:
	set user_data_start, %r31
	.word 0x8584f1bf  ! 287: WRCCR_I	wr	%r19, 0x11bf, %ccr
	.word 0x20800001  ! 288: BN	bn,a	<label_0x1>
pmu_4_205:
	nop
	setx 0xfffff029fffff8ea, %g1, %g7
	.word 0xa3800007  ! 289: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_206) + 56, 16, 16)) -> intp(4,0,22)
intvec_4_206:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_207:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 291: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8d90231b  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x031b, %pstate
	.word 0xda37e0b8  ! 293: STH_I	sth	%r13, [%r31 + 0x00b8]
DS_4_208:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 294: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 296: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196c  ! 297: FqTOd	dis not found

debug_4_211:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 298: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_4_212:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d90c009  ! 299: WRPR_WSTATE_R	wrpr	%r3, %r9, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97693711  ! 300: SDIVX_I	sdivx	%r4, 0xfffff711, %r11
	.word 0x97a289c4  ! 301: FDIVd	fdivd	%f10, %f4, %f42
	.word 0x8d9026fe  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x06fe, %pstate
intveclr_4_214:
	setx 0x7e090c0c5e6c7534, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01973  ! 304: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_216
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_216:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 305: RDPC	rd	%pc, %r8
intveclr_4_217:
	setx 0xb92e392a6ac17032, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93500000  ! 307: RDPR_TPC	<illegal instruction>
	.word 0x91a089d2  ! 308: FDIVd	fdivd	%f2, %f18, %f8
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_218:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 309: RDPC	rd	%pc, %r8
donret_4_219:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_219-donret_4_219-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1b6f, %tstate
    wrhpr %g0, 0xac5, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_219:
	.word 0xe6ffe4a4  ! 310: SWAPA_I	swapa	%r19, [%r31 + 0x04a4] %asi
	rd %pc, %r19
	add %r19, (ivw_4_220-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_220:
	.word 0x91900003  ! 311: WRPR_PIL_R	wrpr	%r0, %r3, %pil
intveclr_4_221:
	setx 0xa637ed6535cf3494, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d944006  ! 313: WRPR_WSTATE_R	wrpr	%r17, %r6, %wstate
	.word 0xe68008a0  ! 314: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x9b454000  ! 315: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
donret_4_223:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_223-donret_4_223-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x434, %tstate
    wrhpr %g0, 0xb86, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_223:
	.word 0xd6ffe4a4  ! 316: SWAPA_I	swapa	%r11, [%r31 + 0x04a4] %asi
intveclr_4_224:
	setx 0x3a4d381e5a28c0ac, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 317: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_4_225:
	.word 0x8198216e  ! 318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x016e, %hpstate
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
	.word 0x95414000  ! 319: RDPC	rd	%pc, %r10
	.word 0xe607c000  ! 320: LDUW_R	lduw	[%r31 + %r0], %r19
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 321: CASA_R	casa	[%r31] %asi, %r20, %r19
memptr_4_228:
	set user_data_start, %r31
	.word 0x85803973  ! 322: WRCCR_I	wr	%r0, 0x1973, %ccr
	.word 0x91d020b2  ! 323: Tcc_I	ta	icc_or_xcc, %r0 + 178
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_229:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 324: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0x8d902121  ! 325: WRPR_PSTATE_I	wrpr	%r0, 0x0121, %pstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_230:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 326: RDPC	rd	%pc, %r19
mondo_4_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d91c014  ! 327: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
debug_4_232:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 328: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_233)+8, 16, 16)) -> intp(4,1,3)
xir_4_233:
	.word 0xa9852068  ! 329: WR_SET_SOFTINT_I	wr	%r20, 0x0068, %set_softint
DS_4_234:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 330: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x99902001  ! 331: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
mondo_4_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d930008  ! 332: WRPR_WSTATE_R	wrpr	%r12, %r8, %wstate
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 333: Tcc_R	te	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_4_236-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_236:
	.word 0x91920011  ! 334: WRPR_PIL_R	wrpr	%r8, %r17, %pil
DS_4_237:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 335: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xd01fff3e  ! 336: LDD_I	ldd	[%r31 + 0xffffff3e], %r8
	.word 0x8d903846  ! 337: WRPR_PSTATE_I	wrpr	%r0, 0x1846, %pstate
	.word 0xd03fff3e  ! 338: STD_I	std	%r8, [%r31 + 0xffffff3e]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01963  ! 339: FqTOd	dis not found

	.word 0x8d903dfe  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x1dfe, %pstate
pmu_4_239:
	nop
	setx 0xfffff11dffffff6c, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_240:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 342: RDPC	rd	%pc, %r10
mondo_4_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d914014  ! 343: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
intveclr_4_242:
	setx 0x88e5500e12adb483, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9b454000  ! 345: RD_CLEAR_SOFTINT	rd	%clear_softint, %r13
mondo_4_243:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d940007  ! 346: WRPR_WSTATE_R	wrpr	%r16, %r7, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01971  ! 347: FqTOd	dis not found

	.word 0xa7540000  ! 348: RDPR_GL	<illegal instruction>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_245
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_245:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e001  ! 349: CASA_R	casa	[%r31] %asi, %r1, %r8
	.word 0xa3a0016a  ! 350: FABSq	dis not found

memptr_4_246:
	set user_data_start, %r31
	.word 0x85837d87  ! 351: WRCCR_I	wr	%r13, 0x1d87, %ccr
	.word 0xd477c000  ! 352: STX_R	stx	%r10, [%r31 + %r0]
	.word 0x8d902320  ! 353: WRPR_PSTATE_I	wrpr	%r0, 0x0320, %pstate
memptr_4_247:
	set 0x60140000, %r31
	.word 0x8581267b  ! 354: WRCCR_I	wr	%r4, 0x067b, %ccr
	.word 0xd46ff8e6  ! 355: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
    set 0x1a73, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa1b407eb  ! 356: PDISTN	fmean16	%d16, %d42, %d16
mondo_4_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d928011  ! 357: WRPR_WSTATE_R	wrpr	%r10, %r17, %wstate
	.word 0x26800001  ! 358: BL	bl,a	<label_0x1>
pmu_4_249:
	nop
	setx 0xfffff579fffff9cc, %g1, %g7
	.word 0xa3800007  ! 359: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46ff8e6  ! 360: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
change_to_randtl_4_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_250:
	.word 0x8f902002  ! 361: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_4_251:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_252
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_252:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e007  ! 363: CASA_R	casa	[%r31] %asi, %r7, %r10
debug_4_253:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 364: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99902002  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_254)+0, 16, 16)) -> intp(4,1,3)
xir_4_254:
	.word 0xa9816bb9  ! 366: WR_SET_SOFTINT_I	wr	%r5, 0x0bb9, %set_softint
	.word 0x8d903044  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x1044, %pstate
intveclr_4_255:
	setx 0x8db700f60cc2cfc0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 368: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa750c000  ! 369: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_256
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_256:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 370: RDPC	rd	%pc, %r13
	.word 0x91500000  ! 371: RDPR_TPC	<illegal instruction>
	.word 0x9545c000  ! 372: RD_TICK_CMPR_REG	rd	%-, %r10
splash_cmpr_4_257:
	setx 0x867ce7d127a52a4a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_258:
	setx 0x945e8bb42a1a2a21, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 374: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xa70051b2c5aab795, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_259:
	.word 0x39400001  ! 375: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97480000  ! 376: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_260:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 377: CASA_R	casa	[%r31] %asi, %r7, %r19
mondo_4_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d948008  ! 378: WRPR_WSTATE_R	wrpr	%r18, %r8, %wstate
intveclr_4_262:
	setx 0xc88b5cced66dabbe, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 380: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe68008a0  ! 381: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe63fc000  ! 382: STD_R	std	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_4_264-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_264:
	.word 0x9190000d  ! 383: WRPR_PIL_R	wrpr	%r0, %r13, %pil
splash_cmpr_4_265:
	setx 0xfc62286f6132ef55, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 384: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 385: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0xff87a8a1ae730058, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_267:
	.word 0x39400001  ! 386: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903a69  ! 387: WRPR_PSTATE_I	wrpr	%r0, 0x1a69, %pstate
	.word 0x28700001  ! 388: BPLEU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_268:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 389: RDPC	rd	%pc, %r8
	.word 0xad8223fe  ! 390: WR_SOFTINT_REG_I	wr	%r8, 0x03fe, %softint
	.word 0xa784400b  ! 391: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r11, %-
DS_4_270:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd930f762  ! 1: STQF_I	-	%f12, [0x1762, %r3]
	normalw
	.word 0x97458000  ! 392: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xe537c000  ! 393: STQF_R	-	%f18, [%r0, %r31]
intveclr_4_271:
	setx 0x9fcd6ea9b88c4372, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_272:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 395: RDPC	rd	%pc, %r13
mondo_4_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d914006  ! 396: WRPR_WSTATE_R	wrpr	%r5, %r6, %wstate
	.word 0xe08008a0  ! 397: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x26800001  ! 398: BL	bl,a	<label_0x1>
splash_cmpr_4_274:
	setx 0xa075b89999fc15da, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6b2711  ! 400: SDIVX_I	sdivx	%r12, 0x0711, %r13
DS_4_276:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
intveclr_4_277:
	setx 0x3898d2557fb59552, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 402: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_278:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 403: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
pmu_4_279:
	nop
	setx 0xffffffdffffffd80, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_4_280-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_280:
	.word 0x91944012  ! 405: WRPR_PIL_R	wrpr	%r17, %r18, %pil
debug_4_281:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 406: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_4_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_282-donret_4_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xa30, %tstate
    wrhpr %g0, 0xc96, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_282:
	.word 0xe6ffe2b9  ! 407: SWAPA_I	swapa	%r19, [%r31 + 0x02b9] %asi
mondo_4_283:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d90c00a  ! 408: WRPR_WSTATE_R	wrpr	%r3, %r10, %wstate
splash_tba_4_284:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 409: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa7850002  ! 410: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r2, %-
	.word 0x91a00162  ! 411: FABSq	dis not found

intveclr_4_286:
	setx 0x2256062f7f75813a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 412: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_4_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_4_287:
	.word 0x8f902000  ! 413: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_4_288:
	tsubcctv %r26, 0x1dea, %r23
	.word 0xd207e2b9  ! 414: LDUW_I	lduw	[%r31 + 0x02b9], %r9
	.word 0x83d02032  ! 415: Tcc_I	te	icc_or_xcc, %r0 + 50
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 416: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903327  ! 417: WRPR_PSTATE_I	wrpr	%r0, 0x1327, %pstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_289
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_289:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 418: RDPC	rd	%pc, %r13
tagged_4_290:
	tsubcctv %r18, 0x15e0, %r5
	.word 0xe407e2b9  ! 419: LDUW_I	lduw	[%r31 + 0x02b9], %r18
	.word 0x93a00160  ! 420: FABSq	dis not found

memptr_4_291:
	set user_data_start, %r31
	.word 0x8581f976  ! 421: WRCCR_I	wr	%r7, 0x1976, %ccr
splash_cmpr_4_292:
	setx 0x4ef5844e4a7524f0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 422: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_4_293:
	.word 0xa3a209d2  ! 1: FDIVd	fdivd	%f8, %f18, %f48
	.word 0xbfe7c000  ! 423: SAVE_R	save	%r31, %r0, %r31
	.word 0xd8dfe010  ! 424: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0x97a109c8  ! 425: FDIVd	fdivd	%f4, %f8, %f42
memptr_4_294:
	set user_data_start, %r31
	.word 0x8584667b  ! 426: WRCCR_I	wr	%r17, 0x067b, %ccr
donret_4_295:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_295-donret_4_295-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1eaf, %tstate
    wrhpr %g0, 0x9dd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_295:
	.word 0xd6fff6a7  ! 427: SWAPA_I	swapa	%r11, [%r31 + 0xfffff6a7] %asi
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_296:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 428: CASA_R	casa	[%r31] %asi, %r1, %r11
mondo_4_297:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3e8] %asi
	.word 0x9d908004  ! 429: WRPR_WSTATE_R	wrpr	%r2, %r4, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01974  ! 430: FqTOd	dis not found

	.word 0x93a00165  ! 431: FABSq	dis not found

tagged_4_299:
	taddcctv %r12, 0x11c7, %r8
	.word 0xe407f6a7  ! 432: LDUW_I	lduw	[%r31 + 0xfffff6a7], %r18
	.word 0x91a00170  ! 433: FABSq	dis not found

	.word 0x97540000  ! 434: RDPR_GL	rdpr	%-, %r11
splash_cmpr_4_300:
	setx 0x0ab4f12e4fada8e0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 435: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa784400c  ! 436: WR_GRAPHICS_STATUS_REG_R	wr	%r17, %r12, %-
	.word 0xda8008a0  ! 437: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_4_302:
	nop
	setx 0xfffff6fbfffff345, %g1, %g7
	.word 0xa3800007  ! 438: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_4_303:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 439: RESTORE_R	restore	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_304) + 48, 16, 16)) -> intp(5,0,10)
intvec_4_304:
	.word 0x39400001  ! 440: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ff6a7  ! 441: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff6a7]
	.word 0xda8fe020  ! 442: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r13
intveclr_4_305:
	setx 0xb34d2b9cab529afc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 443: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_4_306:
	set user_data_start, %r31
	.word 0x858529d0  ! 444: WRCCR_I	wr	%r20, 0x09d0, %ccr
	.word 0xda6ffae0  ! 445: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffae0]
intveclr_4_307:
	setx 0x0a2043c8be3f8243, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_4_308:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 447: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_4_309-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_309:
	.word 0x9194c012  ! 448: WRPR_PIL_R	wrpr	%r19, %r18, %pil
splash_tba_4_310:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 449: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x9ba0c9c1  ! 450: FDIVd	fdivd	%f34, %f32, %f44
	rd %pc, %r19
	add %r19, (ivw_4_311-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_311:
	.word 0x91948007  ! 451: WRPR_PIL_R	wrpr	%r18, %r7, %pil
	rd %pc, %r19
	add %r19, (ivw_4_312-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_312:
	.word 0x9192c00d  ! 452: WRPR_PIL_R	wrpr	%r11, %r13, %pil
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 453: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f803dfd  ! 454: SIR	sir	0x1dfd
	.word 0xd46ffb56  ! 455: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
	.word 0xd46ffb56  ! 456: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
pmu_4_313:
	nop
	setx 0xfffff210ffffff09, %g1, %g7
	.word 0xa3800007  ! 457: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_4_314:
	set 0x60340000, %r31
	.word 0x85842b44  ! 458: WRCCR_I	wr	%r16, 0x0b44, %ccr
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 459: Tcc_R	te	icc_or_xcc, %r0 + %r30
intveclr_4_315:
	setx 0xd813a1469b340d6d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 460: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_4_316:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_316-donret_4_316), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1c67, %tstate
    wrhpr %g0, 0x8d7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_316:
	.word 0xd4fffcce  ! 461: SWAPA_I	swapa	%r10, [%r31 + 0xfffffcce] %asi
	.word 0x9190be12  ! 462: WRPR_PIL_I	wrpr	%r2, 0x1e12, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 463: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd53fc000  ! 464: STDF_R	std	%f10, [%r0, %r31]
	.word 0xd4dfe010  ! 465: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
mondo_4_317:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d930002  ! 466: WRPR_WSTATE_R	wrpr	%r12, %r2, %wstate
mondo_4_318:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d90c00c  ! 467: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
	.word 0x91d02034  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_4_319:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_4_320:
	set 0x60140000, %r31
	.word 0x85836b91  ! 470: WRCCR_I	wr	%r13, 0x0b91, %ccr
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_321:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 471: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0xd537f470  ! 472: STQF_I	-	%f10, [0x1470, %r31]
splash_cmpr_4_322:
	setx 0x42827ace04c9850c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_323
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_323:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 474: CASA_R	casa	[%r31] %asi, %r0, %r10
mondo_4_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d908007  ! 475: WRPR_WSTATE_R	wrpr	%r2, %r7, %wstate
splash_hpstate_4_325:
	.word 0x81982206  ! 476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0206, %hpstate
	.word 0xa1a0c9c1  ! 477: FDIVd	fdivd	%f34, %f32, %f16
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_326
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_326:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 478: RDPC	rd	%pc, %r13
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_327
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_327:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 479: CASA_R	casa	[%r31] %asi, %r13, %r18
	.word 0x30700001  ! 480: BPA	<illegal instruction>
intveclr_4_328:
	setx 0x6c9be62b6912e1e0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 481: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xad2582d5afb65cf8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_329:
	.word 0x39400001  ! 482: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_4_330:
	nop
	setx 0xfffff6b9fffffa9d, %g1, %g7
	.word 0xa3800007  ! 483: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_4_331:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 484: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_4_332:
	nop
	setx 0xfffff764fffffb18, %g1, %g7
	.word 0xa3800007  ! 485: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xdb27c000  ! 487: STF_R	st	%f13, [%r0, %r31]
pmu_4_333:
	nop
	setx 0xfffff584fffff44a, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_4_334:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_334-donret_4_334), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x4f4, %tstate
    wrhpr %g0, 0x15c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	retry
donretarg_4_334:
	.word 0xdafff470  ! 489: SWAPA_I	swapa	%r13, [%r31 + 0xfffff470] %asi
	rd %pc, %r19
	add %r19, (ivw_4_335-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_335:
	.word 0x91908005  ! 490: WRPR_PIL_R	wrpr	%r2, %r5, %pil
debug_4_336:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_336:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_336
    nop
debug_wait4_336:
    ld [%r23], %r16
    brnz %r16, debug_wait4_336
    nop
    ba,a debug_startwait4_336
continue_debug_4_336:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_336:
    cmp %r13, %r15
    bne,a wait_for_stat_4_336
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_336:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_336
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd8f00492  ! 491: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_337
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_337:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 492: CASA_R	casa	[%r31] %asi, %r12, %r13
memptr_4_338:
	set 0x60540000, %r31
	.word 0x85802f1a  ! 493: WRCCR_I	wr	%r0, 0x0f1a, %ccr
debug_4_339:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_339:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_339
    nop
debug_wait4_339:
    ld [%r23], %r16
    brnz %r16, debug_wait4_339
    nop
    ba,a debug_startwait4_339
continue_debug_4_339:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_339:
    cmp %r13, %r15
    bne,a wait_for_stat_4_339
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_339:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_339
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %18, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd4f00492  ! 494: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xda8008a0  ! 495: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda8008a0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda97e030  ! 497: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
change_to_randtl_4_340:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_340:
	.word 0x8f902002  ! 498: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    set 0x161b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b047e5  ! 499: PDISTN	fmean16	%d32, %d36, %d48
pmu_4_341:
	nop
	setx 0xfffffb1bfffff873, %g1, %g7
	.word 0xa3800007  ! 500: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_342
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_342:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 501: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_htba_4_343:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 502: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_344
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_344
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_344:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 503: RDPC	rd	%pc, %r10
	setx 0xa516a2d32131d459, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_345:
	.word 0x39400001  ! 504: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_4_346:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_346-donret_4_346), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x19bd, %tstate
    wrhpr %g0, 0xd05, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (4)
	retry
donretarg_4_346:
	.word 0xe6ffefb6  ! 505: SWAPA_I	swapa	%r19, [%r31 + 0x0fb6] %asi
	.word 0x91d020b3  ! 506: Tcc_I	ta	icc_or_xcc, %r0 + 179
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 507: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01970  ! 508: FqTOd	dis not found

cwp_4_348:
    set user_data_start, %o7
	.word 0x93902002  ! 509: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
cwp_4_349:
    set user_data_start, %o7
	.word 0x93902002  ! 510: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	rd %pc, %r19
	add %r19, (ivw_4_350-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_350:
	.word 0x91908002  ! 511: WRPR_PIL_R	wrpr	%r2, %r2, %pil
	.word 0xa3450000  ! 512: RD_SET_SOFTINT	rd	%set_softint, %r17
intveclr_4_351:
	setx 0xa4cbe4d55f05b837, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 513: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda57c000  ! 514: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956aa187  ! 515: SDIVX_I	sdivx	%r10, 0x0187, %r10
memptr_4_353:
	set 0x60740000, %r31
	.word 0x85853c45  ! 516: WRCCR_I	wr	%r20, 0x1c45, %ccr
	.word 0xe4bfe44b  ! 517: STDA_I	stda	%r18, [%r31 + 0x044b] %asi
	.word 0x91d02035  ! 518: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x99464000  ! 519: RD_STICK_CMPR_REG	rd	%-, %r12
intveclr_4_354:
	setx 0x82dc85434f4796bc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 520: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_355:
	nop
	setx 0xfffff800fffff1a1, %g1, %g7
	.word 0xa3800007  ! 521: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x95a4c9c8  ! 522: FDIVd	fdivd	%f50, %f8, %f10
intveclr_4_356:
	setx 0xf5c8ee0f51e7e486, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 523: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 524: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
intveclr_4_357:
	setx 0x1fb7f54c11c0a893, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99500000  ! 526: RDPR_TPC	rdpr	%tpc, %r12
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_358) + 48, 16, 16)) -> intp(7,0,21)
intvec_4_358:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_4_359:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 528: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_4_360:
	.word 0xa9a0c9cd  ! 1: FDIVd	fdivd	%f34, %f44, %f20
	.word 0xd7306152  ! 1: STQF_I	-	%f11, [0x0152, %r1]
	normalw
	.word 0x91458000  ! 529: RD_SOFTINT_REG	rd	%softint, %r8
debug_4_361:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 530: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd08008a0  ! 531: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x97450000  ! 532: RD_SET_SOFTINT	rd	%set_softint, %r11
	.word 0xe26ff145  ! 533: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
	.word 0xe26ff145  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
mondo_4_362:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d930011  ! 535: WRPR_WSTATE_R	wrpr	%r12, %r17, %wstate
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 536: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28008a0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
intveclr_4_363:
	setx 0x59d2ec311c7d4034, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 538: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3e8] %asi
	.word 0x9d92c002  ! 539: WRPR_WSTATE_R	wrpr	%r11, %r2, %wstate
	.word 0xe21fc000  ! 540: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x99902001  ! 541: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xe337f145  ! 542: STQF_I	-	%f17, [0x1145, %r31]
DS_4_365:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 543: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	rd %pc, %r19
	add %r19, (ivw_4_366-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_366:
	.word 0x91914004  ! 544: WRPR_PIL_R	wrpr	%r5, %r4, %pil
	.word 0xe247f145  ! 545: LDSW_I	ldsw	[%r31 + 0xfffff145], %r17
donret_4_367:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_4_367-donret_4_367-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x162e, %tstate
    wrhpr %g0, 0xb0c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (4)
	done
donretarg_4_367:
	.word 0xe2fff145  ! 546: SWAPA_I	swapa	%r17, [%r31 + 0xfffff145] %asi
mondo_4_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d900004  ! 547: WRPR_WSTATE_R	wrpr	%r0, %r4, %wstate
DS_4_369:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa5b24302  ! 548: ALIGNADDRESS	alignaddr	%r9, %r2, %r18
	.word 0x91d02032  ! 549: Tcc_I	ta	icc_or_xcc, %r0 + 50
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_370
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_370:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 550: CASA_R	casa	[%r31] %asi, %r3, %r8
	setx 0x752f85b2980eff12, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_371:
	.word 0x39400001  ! 551: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd09ff145  ! 552: LDDA_I	ldda	[%r31, + 0xfffff145] %asi, %r8
splash_lsu_4_372:
	setx 0xe4ecd399d1543bfa, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 553: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_4_373:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 554: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa768b7e1  ! 555: SDIVX_I	sdivx	%r2, 0xfffff7e1, %r19
	.word 0xd137c000  ! 556: STQF_R	-	%f8, [%r0, %r31]
	.word 0xd00fe46f  ! 557: LDUB_I	ldub	[%r31 + 0x046f], %r8
	.word 0xd077e46f  ! 558: STX_I	stx	%r8, [%r31 + 0x046f]
	.word 0xa781c001  ! 559: WR_GRAPHICS_STATUS_REG_R	wr	%r7, %r1, %-
splash_cmpr_4_376:
	setx 0x5e4455237aa4e48c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 560: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa9a409c3  ! 561: FDIVd	fdivd	%f16, %f34, %f20
mondo_4_377:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d944010  ! 562: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
cwp_4_378:
    set user_data_start, %o7
	.word 0x93902000  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_379:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 564: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x99a00161  ! 565: FABSq	dis not found

	.word 0x97520000  ! 566: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_380
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_380:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 567: RDPC	rd	%pc, %r8
mondo_4_381:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d950009  ! 568: WRPR_WSTATE_R	wrpr	%r20, %r9, %wstate
mondo_4_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d90c001  ! 569: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
	.word 0xd03fe46f  ! 570: STD_I	std	%r8, [%r31 + 0x046f]
	.word 0xa7a00167  ! 571: FABSq	dis not found

	.word 0xe06fe46f  ! 572: LDSTUB_I	ldstub	%r16, [%r31 + 0x046f]
debug_4_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 573: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d020b5  ! 574: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xe08fe020  ! 575: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r16
intveclr_4_384:
	setx 0xa9434738ccf7be37, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 576: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02034  ! 577: Tcc_I	te	icc_or_xcc, %r0 + 52
debug_4_385:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 578: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_386:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 579: CASA_R	casa	[%r31] %asi, %r10, %r16
debug_4_387:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_387:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_387
    nop
debug_wait4_387:
    ld [%r23], %r16
    brnz %r16, debug_wait4_387
    nop
    ba,a debug_startwait4_387
continue_debug_4_387:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_387:
    cmp %r13, %r15
    bne,a wait_for_stat_4_387
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_387:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_387
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 580: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
pmu_4_388:
	nop
	setx 0xfffffa0afffff5f0, %g1, %g7
	.word 0xa3800007  ! 581: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_4_389-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_389:
	.word 0x91924004  ! 582: WRPR_PIL_R	wrpr	%r9, %r4, %pil
change_to_randtl_4_390:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_4_390:
	.word 0x8f902002  ! 583: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01971  ! 584: FqTOd	dis not found

	.word 0x36700001  ! 585: BPGE	<illegal instruction>
mondo_4_392:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d914010  ! 586: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96b7fc5  ! 587: SDIVX_I	sdivx	%r13, 0xffffffc5, %r20
	.word 0x9ba00164  ! 588: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_394
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_394:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 589: RDPC	rd	%pc, %r8
	.word 0xd0dfe010  ! 590: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	.word 0xd0d7e020  ! 591: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
	setx 0x92b741564baf38ca, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_395:
	.word 0x39400001  ! 592: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_396:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 593: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_4_397:
	setx 0x7de1722579feca25, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 594: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_4_398:
	nop
	setx 0xfffff81cfffffc66, %g1, %g7
	.word 0xa3800007  ! 595: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d02032  ! 596: Tcc_I	tne	icc_or_xcc, %r0 + 50
intveclr_4_399:
	setx 0x4e32002c3677903e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 597: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd03fe06b  ! 598: STD_I	std	%r8, [%r31 + 0x006b]
debug_4_400:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 599: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_4_401-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_401:
	.word 0x91910010  ! 600: WRPR_PIL_R	wrpr	%r4, %r16, %pil
mondo_4_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d940011  ! 601: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0x9ba409d3  ! 602: FDIVd	fdivd	%f16, %f50, %f44
intveclr_4_403:
	setx 0x6a29902b44cda993, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 603: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 604: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01973  ! 605: FqTOd	dis not found

    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 606: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0xe737e06b  ! 607: STQF_I	-	%f19, [0x006b, %r31]
pmu_4_407:
	nop
	setx 0xfffff098fffff9e5, %g1, %g7
	.word 0xa3800007  ! 608: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_4_408-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_408:
	.word 0x91920011  ! 609: WRPR_PIL_R	wrpr	%r8, %r17, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a0196c  ! 610: FqTOd	dis not found

	.word 0xd737c000  ! 611: STQF_R	-	%f11, [%r0, %r31]
debug_4_410:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 612: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3692c7a  ! 613: SDIVX_I	sdivx	%r4, 0x0c7a, %r17
	.word 0x81510000  ! 614: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91d020b5  ! 615: Tcc_I	ta	icc_or_xcc, %r0 + 181
debug_4_412:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe8800be0  ! 617: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r20
pmu_4_413:
	nop
	setx 0xfffff391fffff391, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99902005  ! 619: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
splash_cmpr_4_414:
	setx 0xfb5acb96d7ce0914, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 620: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_415:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 621: RDPC	rd	%pc, %r20
splash_lsu_4_416:
	setx 0xd923749b9595b54b, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 622: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd477f103  ! 623: STX_I	stx	%r10, [%r31 + 0xfffff103]
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_417
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_417:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 624: RDPC	rd	%pc, %r10
	.word 0x91d02033  ! 625: Tcc_I	ta	icc_or_xcc, %r0 + 51
intveclr_4_418:
	setx 0x117664d536448134, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 626: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a4c9d3  ! 627: FDIVd	fdivd	%f50, %f50, %f12
DS_4_419:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 628: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xab82c012  ! 629: WR_CLEAR_SOFTINT_R	wr	%r11, %r18, %clear_softint
splash_cmpr_4_420:
	setx 0x40963f70eb4dd368, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 630: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_4_421-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_421:
	.word 0x91944006  ! 631: WRPR_PIL_R	wrpr	%r17, %r6, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_422)+0, 16, 16)) -> intp(4,1,3)
xir_4_422:
	.word 0xa9822aa7  ! 632: WR_SET_SOFTINT_I	wr	%r8, 0x0aa7, %set_softint
mondo_4_423:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d908004  ! 633: WRPR_WSTATE_R	wrpr	%r2, %r4, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_424
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_424:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 634: CASA_R	casa	[%r31] %asi, %r3, %r11
debug_4_425:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 635: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_4_426:
	setx 0xe0400ea55eba855d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 636: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_4_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d948000  ! 637: WRPR_WSTATE_R	wrpr	%r18, %r0, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97686361  ! 638: SDIVX_I	sdivx	%r1, 0x0361, %r11
intveclr_4_429:
	setx 0x27249c93c7507b06, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 639: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_430:
	setx 0x12ad787c88a85663, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 640: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xa6ed3aaccb15159b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_431:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_432:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d908010  ! 642: WRPR_WSTATE_R	wrpr	%r2, %r16, %wstate
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_433
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_433
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_433:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 643: RDPC	rd	%pc, %r12
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_434
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_434:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 644: CASA_R	casa	[%r31] %asi, %r4, %r18
	setx 0xc12882fdd60f9c02, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_435:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_436:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 646: CASA_R	casa	[%r31] %asi, %r4, %r18
splash_cmpr_4_437:
	setx 0x822fad544f853583, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 647: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_4_438:
	setx 0x453e417a884e3034, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 648: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 649: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
DS_4_439:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x91a00551  ! 1: FSQRTd	fsqrt	
	.word 0x93a2082a  ! 650: FADDs	fadds	%f8, %f10, %f9
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 651: Tcc_R	tne	icc_or_xcc, %r0 + %r30
debug_4_440:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 652: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99520000  ! 653: RDPR_PIL	<illegal instruction>
	setx 0x3394c831fc38da63, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_441:
	.word 0x39400001  ! 654: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_442:
	setx 0x69b97719f83d438d, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 655: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_4_443:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 656: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_444
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_444:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 657: CASA_R	casa	[%r31] %asi, %r9, %r12
memptr_4_445:
	set 0x60140000, %r31
	.word 0x85847b5a  ! 658: WRCCR_I	wr	%r17, 0x1b5a, %ccr
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_446
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_446
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_446:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 659: RDPC	rd	%pc, %r16
splash_cmpr_4_447:
	setx 0x5a29249d79becc03, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 660: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_448:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e009  ! 661: CASA_R	casa	[%r31] %asi, %r9, %r13
	rd %pc, %r19
	add %r19, (ivw_4_449-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_449:
	.word 0x91944013  ! 662: WRPR_PIL_R	wrpr	%r17, %r19, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01973  ! 663: FqTOd	dis not found

	.word 0xa5a00166  ! 664: FABSq	dis not found

debug_4_451:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 665: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_4_452-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_4_452:
	.word 0x9195000b  ! 666: WRPR_PIL_R	wrpr	%r20, %r11, %pil
	.word 0xda6fe48d  ! 667: LDSTUB_I	ldstub	%r13, [%r31 + 0x048d]
	.word 0x9f803c5b  ! 668: SIR	sir	0x1c5b
mondo_4_453:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d92000a  ! 669: WRPR_WSTATE_R	wrpr	%r8, %r10, %wstate
	.word 0x8d903285  ! 670: WRPR_PSTATE_I	wrpr	%r0, 0x1285, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a0196d  ! 671: FqTOd	dis not found

	.word 0x91a149d0  ! 672: FDIVd	fdivd	%f36, %f16, %f8
memptr_4_455:
	set 0x60340000, %r31
	.word 0x8581353a  ! 673: WRCCR_I	wr	%r4, 0x153a, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 674: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_4_456:
	setx 0xb60145382b0d6688, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 675: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xaea7c25ec0a7eb28, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_457:
	.word 0x39400001  ! 676: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_4_458:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 677: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_4_459:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 678: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (4+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_4_460
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_4_460
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_4_460:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 679: RDPC	rd	%pc, %r16
	setx 0xf9d7960662029586, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_461:
	.word 0x39400001  ! 680: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_4_462:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d908014  ! 681: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
    mov (4+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_4_463
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_4_463:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 682: CASA_R	casa	[%r31] %asi, %r17, %r16
cwp_4_464:
    set user_data_start, %o7
	.word 0x93902003  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_4_465:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait4_465:
    mov 0x4, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_4_465
    nop
debug_wait4_465:
    ld [%r23], %r16
    brnz %r16, debug_wait4_465
    nop
    ba,a debug_startwait4_465
continue_debug_4_465:
    mov 0xe0, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_4_465:
    cmp %r13, %r15
    bne,a wait_for_stat_4_465
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_4_465:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_4_465
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 684: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_4_466)+48, 16, 16)) -> intp(4,1,3)
xir_4_466:
	.word 0xa980e708  ! 685: WR_SET_SOFTINT_I	wr	%r3, 0x0708, %set_softint
	.word 0x93a00172  ! 686: FABSq	dis not found

debug_4_467:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 687: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b464000  ! 688: RD_STICK_CMPR_REG	rd	%-, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_4_468) + 0, 16, 16)) -> intp(6,0,6)
intvec_4_468:
	.word 0x39400001  ! 689: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 690: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_4_469:
	set 0x60740000, %r31
	.word 0x858532a9  ! 691: WRCCR_I	wr	%r20, 0x12a9, %ccr
splash_cmpr_4_470:
	setx 0x1e5b3548bf9ee081, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 692: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_4_471:
	nop
	setx 0xfffff184fffffe6c, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_4_472:
	setx 0xa293cfb700697918, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 694: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x9b3c197ded84cadb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_473:
	.word 0x39400001  ! 695: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_4_474:
	setx 0xfa665faa4e616661, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 696: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_4_475:
	setx 0xceffe9bc3dea21ab, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 697: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_4_476:
	setx 0x16c8eeb58fbc4078, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 698: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x0e2e8a518cd6b25d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_4_477:
	.word 0x39400001  ! 699: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a049c8  ! 700: FDIVd	fdivd	%f32, %f8, %f40
splash_tba_4_478:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 701: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	invalw
	mov 0x30, %r30
splash_cmpr_3_0:
	setx 0x183ddd7c149c7cd1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_1:
	setx 0x82610622e33296f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_2:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 3: RDPC	rd	%pc, %r8
	.word 0x93d02033  ! 4: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_hpstate_3_3:
	.word 0x819820c6  ! 5: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c6, %hpstate
donret_3_4:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_4-donret_3_4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x96, %tstate
    wrhpr %g0, 0x2c7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (3)
	retry
donretarg_3_4:
	.word 0xe6ffee7d  ! 6: SWAPA_I	swapa	%r19, [%r31 + 0x0e7d] %asi
	.word 0x38700001  ! 7: BPGU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_5:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 8: RDPC	rd	%pc, %r18
	.word 0x9ba089d1  ! 9: FDIVd	fdivd	%f2, %f48, %f44
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01971  ! 10: FqTOd	dis not found

mondo_3_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e0] %asi
	.word 0x9d91c014  ! 11: WRPR_WSTATE_R	wrpr	%r7, %r20, %wstate
splash_hpstate_3_8:
	.word 0x81982d97  ! 12: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d97, %hpstate
mondo_3_9:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d914010  ! 13: WRPR_WSTATE_R	wrpr	%r5, %r16, %wstate
	.word 0xd80fee7d  ! 14: LDUB_I	ldub	[%r31 + 0x0e7d], %r12
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_10:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 15: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa9818000  ! 16: WR_SET_SOFTINT_R	wr	%r6, %r0, %set_softint
	setx 0x7848ec690ad8512f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba0016d  ! 18: FABSq	dis not found

	.word 0x91d02032  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 50
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_12) + 0, 16, 16)) -> intp(2,0,18)
intvec_3_12:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_3_13:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 21: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d90207e  ! 22: WRPR_PSTATE_I	wrpr	%r0, 0x007e, %pstate
	.word 0xab84400c  ! 23: WR_CLEAR_SOFTINT_R	wr	%r17, %r12, %clear_softint
memptr_3_14:
	set 0x60740000, %r31
	.word 0x85852a6e  ! 24: WRCCR_I	wr	%r20, 0x0a6e, %ccr
	setx 0xf385c1ef257a8ff6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_15:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97693ce8  ! 26: SDIVX_I	sdivx	%r4, 0xfffffce8, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916c3008  ! 27: SDIVX_I	sdivx	%r16, 0xfffff008, %r8
mondo_3_18:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d0] %asi
	.word 0x9d91c00a  ! 28: WRPR_WSTATE_R	wrpr	%r7, %r10, %wstate
mondo_3_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d930003  ! 29: WRPR_WSTATE_R	wrpr	%r12, %r3, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_20:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e009  ! 30: CASA_R	casa	[%r31] %asi, %r9, %r11
	.word 0x95a349cb  ! 31: FDIVd	fdivd	%f44, %f42, %f10
	.word 0xe28008a0  ! 32: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_cmpr_3_21:
	setx 0xbcfe794887509f74, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x95a00170  ! 34: FABSq	dis not found

pmu_3_22:
	nop
	setx 0xfffff44dfffff76b, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_3_23:
	nop
	setx 0xfffffdcafffff8ac, %g1, %g7
	.word 0xa3800007  ! 36: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_3_24:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_24:
	.word 0x8f902001  ! 37: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_25:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 38: RDPC	rd	%pc, %r13
	.word 0xab82ab39  ! 39: WR_CLEAR_SOFTINT_I	wr	%r10, 0x0b39, %clear_softint
memptr_3_26:
	set 0x60340000, %r31
	.word 0x8584b108  ! 40: WRCCR_I	wr	%r18, 0x1108, %ccr
	rd %pc, %r19
	add %r19, (ivw_3_27-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_27:
	.word 0x91904008  ! 41: WRPR_PIL_R	wrpr	%r1, %r8, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa368203a  ! 42: SDIVX_I	sdivx	%r0, 0x003a, %r17
intveclr_3_29:
	setx 0xf2b7af92fddd5fb3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_30) + 0, 16, 16)) -> intp(2,0,21)
intvec_3_30:
	.word 0x39400001  ! 44: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_3_31:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 45: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196b  ! 46: FqTOd	dis not found

	setx 0xd04aec9243fe9a9b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_33:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_3_34:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 48: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_3_35:
	setx 0x8354d9f50b593f38, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 49: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_3_36:
	.word 0x8198226d  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x026d, %hpstate
	.word 0x93a00164  ! 51: FABSq	dis not found

	.word 0x8d903f34  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x1f34, %pstate
	rd %pc, %r19
	add %r19, (ivw_3_37-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_37:
	.word 0x91944006  ! 53: WRPR_PIL_R	wrpr	%r17, %r6, %pil
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_38:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 54: RDPC	rd	%pc, %r10
	.word 0x95a00164  ! 55: FABSq	dis not found

debug_3_39:
	nop
	mov 8, %r18
	.word 0xe4f00492  ! 56: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
splash_cmpr_3_40:
	setx 0xd7a85bb7e5190492, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 57: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd31fc000  ! 58: LDDF_R	ldd	[%r31, %r0], %f9
debug_3_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 59: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_42:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 60: RDPC	rd	%pc, %r11
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_43:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 61: RDPC	rd	%pc, %r11
	.word 0xd537fc6d  ! 62: STQF_I	-	%f10, [0x1c6d, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01973  ! 63: FqTOd	dis not found

pmu_3_45:
	nop
	setx 0xfffff06ffffffaf6, %g1, %g7
	.word 0xa3800007  ! 64: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_3_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d910011  ! 65: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
DS_3_47:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd9324008  ! 1: STQF_R	-	%f12, [%r8, %r9]
	normalw
	.word 0x99458000  ! 66: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xe0c7e020  ! 67: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_48) + 24, 16, 16)) -> intp(5,0,4)
intvec_3_48:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_3_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_49-donret_3_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x4c2, %tstate
    wrhpr %g0, 0x604, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (3)
	done
donretarg_3_49:
	.word 0xe0fffc6d  ! 69: SWAPA_I	swapa	%r16, [%r31 + 0xfffffc6d] %asi
	.word 0x8d90386e  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x186e, %pstate
pmu_3_50:
	nop
	setx 0xfffff4defffff633, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa768ec95  ! 72: SDIVX_I	sdivx	%r3, 0x0c95, %r19
	.word 0x91d02032  ! 73: Tcc_I	ta	icc_or_xcc, %r0 + 50
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_52:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e002  ! 74: CASA_R	casa	[%r31] %asi, %r2, %r11
mondo_3_53:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d91c00b  ! 75: WRPR_WSTATE_R	wrpr	%r7, %r11, %wstate
memptr_3_54:
	set user_data_start, %r31
	.word 0x8584f755  ! 76: WRCCR_I	wr	%r19, 0x1755, %ccr
splash_lsu_3_55:
	setx 0x1ccd4ed2dd4e6653, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 77: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_56:
	.word 0x81982257  ! 78: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0257, %hpstate
splash_cmpr_3_57:
	setx 0x1582bfd9a4bf88af, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 79: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 80: BPGE	<illegal instruction>
pmu_3_58:
	nop
	setx 0xfffff0fafffffcdd, %g1, %g7
	.word 0xa3800007  ! 81: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_59:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 82: RDPC	rd	%pc, %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba0196c  ! 83: FqTOd	dis not found

splash_cmpr_3_61:
	setx 0x8c804c3cdfddffa0, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 84: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe927f7c3  ! 85: STF_I	st	%f20, [0x17c3, %r31]
splash_tba_3_62:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_3_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d918006  ! 87: WRPR_WSTATE_R	wrpr	%r6, %r6, %wstate
	.word 0x91d02035  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91a009c8  ! 89: FDIVd	fdivd	%f0, %f8, %f8
	rd %pc, %r19
	add %r19, (ivw_3_64-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_64:
	.word 0x91930010  ! 90: WRPR_PIL_R	wrpr	%r12, %r16, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_65)+40, 16, 16)) -> intp(3,1,3)
xir_3_65:
	.word 0xa984bc59  ! 91: WR_SET_SOFTINT_I	wr	%r18, 0x1c59, %set_softint
change_to_randtl_3_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_66:
	.word 0x8f902001  ! 92: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	setx 0x9aec21aae8f62512, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_67:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_68) + 8, 16, 16)) -> intp(5,0,16)
intvec_3_68:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d90399a  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x199a, %pstate
	.word 0xe0800ba0  ! 96: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r16
	.word 0x8d9038aa  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x18aa, %pstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0c7e000  ! 99: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	setx 0xdbafa9b8208eb3fb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_69:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_3_70:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 101: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 102: RD_STICK_REG	stbar
	rd %pc, %r19
	add %r19, (ivw_3_71-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_71:
	.word 0x91908007  ! 103: WRPR_PIL_R	wrpr	%r2, %r7, %pil
	.word 0x99902000  ! 104: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
change_to_randtl_3_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_72:
	.word 0x8f902002  ! 105: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_cmpr_3_73:
	setx 0x93a4d57743732cae, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 107: CASA_R	casa	[%r31] %asi, %r10, %r16
	.word 0x26800001  ! 108: BL	bl,a	<label_0x1>
splash_hpstate_3_75:
	.word 0x8198222f  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x022f, %hpstate
intveclr_3_76:
	setx 0x6bcf1c68359d217f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 110: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe00fc000  ! 111: LDUB_R	ldub	[%r31 + %r0], %r16
donret_3_77:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_77-donret_3_77-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x101b, %tstate
    wrhpr %g0, 0x51d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (3)
	done
donretarg_3_77:
	.word 0xe0ffe388  ! 112: SWAPA_I	swapa	%r16, [%r31 + 0x0388] %asi
change_to_randtl_3_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_78:
	.word 0x8f902000  ! 113: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f8021a0  ! 114: SIR	sir	0x01a0
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956ca9b3  ! 115: SDIVX_I	sdivx	%r18, 0x09b3, %r10
memptr_3_80:
	set 0x60540000, %r31
	.word 0x8584383e  ! 116: WRCCR_I	wr	%r16, 0x183e, %ccr
mondo_3_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d924002  ! 117: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
DS_3_82:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 118: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	setx 0x4b00330b31f35932, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d928013  ! 120: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
	setx 0xf6d90e26f860c887, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_85:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902005  ! 122: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
donret_3_86:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_86-donret_3_86), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x5b0, %tstate
    wrhpr %g0, 0xbcf, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (3)
	retry
donretarg_3_86:
	.word 0xe8ffecb2  ! 123: SWAPA_I	swapa	%r20, [%r31 + 0x0cb2] %asi
DS_3_87:
	.word 0x95a089c4  ! 1: FDIVd	fdivd	%f2, %f4, %f10
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb13000a  ! 1: LDQF_R	-	[%r12, %r10], %f13
	.word 0x93a00820  ! 124: FADDs	fadds	%f0, %f0, %f9
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_88:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 125: CASA_R	casa	[%r31] %asi, %r16, %r12
splash_cmpr_3_89:
	setx 0xb7019362c98b2b1d, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 126: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_90) + 0, 16, 16)) -> intp(7,0,9)
intvec_3_90:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_91:
	.word 0x8f902001  ! 128: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_3_92:
	setx 0x1ca2438806a6f6da, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x111b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb2c7e0  ! 130: PDISTN	fmean16	%d42, %d0, %d44
	.word 0xd477c000  ! 131: STX_R	stx	%r10, [%r31 + %r0]
	setx 0xc5dad3efbff5fa9c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_93:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 133: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_3_94:
	setx 0xbe6ab19305a3d555, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_95:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 135: CASA_R	casa	[%r31] %asi, %r10, %r10
	.word 0x8d9039e7  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x19e7, %pstate
	.word 0x99902005  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
memptr_3_96:
	set user_data_start, %r31
	.word 0x8580f477  ! 138: WRCCR_I	wr	%r3, 0x1477, %ccr
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_97:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 139: RDPC	rd	%pc, %r12
	rd %pc, %r19
	add %r19, (ivw_3_98-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_98:
	.word 0x91948005  ! 140: WRPR_PIL_R	wrpr	%r18, %r5, %pil
memptr_3_99:
	set user_data_start, %r31
	.word 0x858123cc  ! 141: WRCCR_I	wr	%r4, 0x03cc, %ccr
splash_hpstate_3_100:
	.word 0x81982bcd  ! 142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcd, %hpstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_101:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 143: RDPC	rd	%pc, %r12
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_102:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 144: RDPC	rd	%pc, %r12
	.word 0x8d90298a  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x098a, %pstate
	.word 0x3a700001  ! 146: BPCC	<illegal instruction>
    set 0x1337, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa9b507e7  ! 147: PDISTN	fmean16	%d20, %d38, %d20
splash_cmpr_3_103:
	setx 0xf576c00f75ec9994, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_104:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x8942fd7e	! Random illegal ?
	.word 0x95a2c9c3  ! 1: FDIVd	fdivd	%f42, %f34, %f10
	.word 0xa3a08820  ! 149: FADDs	fadds	%f2, %f0, %f17
mondo_3_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d928007  ! 150: WRPR_WSTATE_R	wrpr	%r10, %r7, %wstate
	.word 0x9750c000  ! 151: RDPR_TT	<illegal instruction>
memptr_3_106:
	set 0x60340000, %r31
	.word 0x85847ea1  ! 152: WRCCR_I	wr	%r17, 0x1ea1, %ccr
	setx 0x0b379cfb58d6c214, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_107:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9840012  ! 154: WR_SET_SOFTINT_R	wr	%r16, %r18, %set_softint
	.word 0xe297e010  ! 155: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_108:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 156: RDPC	rd	%pc, %r17
	setx 0x51a7a0b0dec178a7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_109:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99480000  ! 158: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x99a00164  ! 159: FABSq	dis not found

DS_3_110:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f16, %f10, %f8
	.word 0x9bb34302  ! 160: ALIGNADDRESS	alignaddr	%r13, %r2, %r13
	.word 0x2a700001  ! 161: BPCS	<illegal instruction>
DS_3_111:
	.word 0xa7a309c0  ! 1: FDIVd	fdivd	%f12, %f0, %f50
	allclean
	.word 0x9bb4830c  ! 162: ALIGNADDRESS	alignaddr	%r18, %r12, %r13
debug_3_112:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9769695c  ! 164: SDIVX_I	sdivx	%r5, 0x095c, %r11
	.word 0xe897e010  ! 165: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r20
	.word 0xe8dfe020  ! 166: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_114:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 167: RDPC	rd	%pc, %r12
	.word 0xe4800c60  ! 168: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r18
	rd %pc, %r19
	add %r19, (ivw_3_115-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_115:
	.word 0x9194c008  ! 169: WRPR_PIL_R	wrpr	%r19, %r8, %pil
debug_3_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93d020b4  ! 171: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_cmpr_3_117:
	setx 0x2a21ea3159c7bbad, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_118:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe457fe3c  ! 174: LDSH_I	ldsh	[%r31 + 0xfffffe3c], %r18
tagged_3_119:
	taddcctv %r21, 0x1e64, %r22
	.word 0xe407fe3c  ! 175: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
pmu_3_120:
	nop
	setx 0xfffff615fffff5a4, %g1, %g7
	.word 0xa3800007  ! 176: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_3_121:
	setx 0x2e294a94ec1bb9ba, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d91000b  ! 178: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
tagged_3_123:
	taddcctv %r15, 0x1e4c, %r11
	.word 0xe407fe3c  ! 179: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
	.word 0x91d02033  ! 180: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 181: LDX_R	ldx	[%r31 + %r0], %r18
debug_3_124:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_3_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d910012  ! 183: WRPR_WSTATE_R	wrpr	%r4, %r18, %wstate
	rd %pc, %r19
	add %r19, (ivw_3_126-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_126:
	.word 0x91924001  ! 184: WRPR_PIL_R	wrpr	%r9, %r1, %pil
	setx 0x6f6cd5bc8a7ef9b8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_127:
	.word 0x39400001  ! 185: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_128) + 16, 16, 16)) -> intp(4,0,11)
intvec_3_128:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91a00166  ! 187: FABSq	dis not found

debug_3_129:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 188: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_130:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 189: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_lsu_3_131:
	setx 0x4ac24f048329f6d9, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95a00169  ! 191: FABSq	dis not found

	.word 0xd0cfe020  ! 192: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r8
intveclr_3_132:
	setx 0x9149bd5bf5333a30, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 180
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_133:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 195: RDPC	rd	%pc, %r10
splash_cmpr_3_134:
	setx 0xc114c8d7714f42a0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_135:
	setx 0x6e41387f6cf68f30, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06ffe3c  ! 198: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe3c]
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_136:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 199: CASA_R	casa	[%r31] %asi, %r9, %r16
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_137
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_137:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 200: RDPC	rd	%pc, %r16
	.word 0x3e800001  ! 201: BVC	bvc,a	<label_0x1>
intveclr_3_138:
	setx 0x66970f6034f0e641, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 202: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_3_139:
	setx 0x34d6f599bcf05b53, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 203: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 204: Tcc_I	ta	icc_or_xcc, %r0 + 51
donret_3_140:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_140-donret_3_140), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x5aa, %tstate
    wrhpr %g0, 0xb46, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (3)
	retry
donretarg_3_140:
	.word 0xd8fffe3c  ! 205: SWAPA_I	swapa	%r12, [%r31 + 0xfffffe3c] %asi
splash_htba_3_141:
	set 0x00390000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00390000, %r12
	.word 0x8b98000c  ! 206: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_3_142:
	setx 0x393da22892795c1a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_3_144:
	.word 0x81982fed  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fed, %hpstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_145:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 210: CASA_R	casa	[%r31] %asi, %r9, %r12
splash_cmpr_3_146:
	setx 0x1da1842d1c04947e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 211: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_147:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 212: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xab82a655  ! 213: WR_CLEAR_SOFTINT_I	wr	%r10, 0x0655, %clear_softint
intveclr_3_148:
	setx 0xe2daa799e508be03, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_149)+8, 16, 16)) -> intp(3,1,3)
xir_3_149:
	.word 0xa9833001  ! 215: WR_SET_SOFTINT_I	wr	%r12, 0x1001, %set_softint
pmu_3_150:
	nop
	setx 0xfffff04afffffb3c, %g1, %g7
	.word 0xa3800007  ! 216: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_3_151:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_151:
	.word 0x8f902001  ! 217: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x26700001  ! 218: BPL	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_152) + 56, 16, 16)) -> intp(0,0,5)
intvec_3_152:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a00160  ! 220: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_3_153-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_153:
	.word 0x91920000  ! 221: WRPR_PIL_R	wrpr	%r8, %r0, %pil
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_154
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_154:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 222: RDPC	rd	%pc, %r18
	.word 0x91d02035  ! 223: Tcc_I	ta	icc_or_xcc, %r0 + 53
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 224: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_3_156:
	setx 0xe101c30e010aec99, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_3_157:
	setx 0x9973537b0ff7d9d1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93a0016b  ! 227: FABSq	dis not found

splash_cmpr_3_158:
	setx 0x9204215c21baf7fa, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_159:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 229: RDPC	rd	%pc, %r9
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_160:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 230: RDPC	rd	%pc, %r13
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_161
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_161
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_161:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 231: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_162
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_162:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 232: RDPC	rd	%pc, %r8
	setx 0xce0abb4c9a115246, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_163:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_3_164:
	nop
	setx 0xfffffacdfffff1de, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0xecdd7448aafac06e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_165:
	.word 0x39400001  ! 235: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956d3407  ! 236: SDIVX_I	sdivx	%r20, 0xfffff407, %r10
	.word 0x91d020b5  ! 237: Tcc_I	ta	icc_or_xcc, %r0 + 181
mondo_3_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d92c013  ! 238: WRPR_WSTATE_R	wrpr	%r11, %r19, %wstate
splash_cmpr_3_168:
	setx 0x1dc11f6f387701d0, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d940008  ! 240: WRPR_WSTATE_R	wrpr	%r16, %r8, %wstate
mondo_3_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d94c009  ! 241: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
splash_cmpr_3_171:
	setx 0x883ea53a23a8c4f5, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 242: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_172) + 8, 16, 16)) -> intp(5,0,1)
intvec_3_172:
	.word 0x39400001  ! 243: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_173:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x9ba489c5  ! 245: FDIVd	fdivd	%f18, %f36, %f44
	.word 0xda8008a0  ! 246: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_hpstate_3_174:
	.word 0x819822ff  ! 247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02ff, %hpstate
	setx 0x639592f3aba77edb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_175:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_176:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r13
	.word 0xa7480000  ! 250: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xd64fc000  ! 251: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0xd60ff241  ! 252: LDUB_I	ldub	[%r31 + 0xfffff241], %r11
	.word 0x8d902eb9  ! 253: WRPR_PSTATE_I	wrpr	%r0, 0x0eb9, %pstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_177:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 254: RDPC	rd	%pc, %r12
splash_hpstate_3_178:
	.word 0x819827cc  ! 255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cc, %hpstate
mondo_3_179:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d0] %asi
	.word 0x9d908014  ! 256: WRPR_WSTATE_R	wrpr	%r2, %r20, %wstate
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 257: Tcc_R	te	icc_or_xcc, %r0 + %r30
debug_3_180:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 258: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0x93464000  ! 259: RD_STICK_CMPR_REG	rd	%-, %r9
intveclr_3_181:
	setx 0xf33c851719feb0a9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97a289c9  ! 261: FDIVd	fdivd	%f10, %f40, %f42
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
	.word 0xa9414000  ! 262: RDPC	rd	%pc, %r20
	rd %pc, %r19
	add %r19, (ivw_3_183-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_183:
	.word 0x91950007  ! 263: WRPR_PIL_R	wrpr	%r20, %r7, %pil
intveclr_3_184:
	setx 0x436ff6b0bd3214f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 264: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_185:
	setx 0xe68366ab1171539f, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 265: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_3_186:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d910006  ! 266: WRPR_WSTATE_R	wrpr	%r4, %r6, %wstate
	rd %pc, %r19
	add %r19, (ivw_3_187-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_187:
	.word 0x91948013  ! 267: WRPR_PIL_R	wrpr	%r18, %r19, %pil
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_188:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 268: CASA_R	casa	[%r31] %asi, %r19, %r13
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_189:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 269: RDPC	rd	%pc, %r16
intveclr_3_190:
	setx 0x1e1301795e5564ea, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 270: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_191:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_191:
	.word 0x8f902003  ! 271: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
DS_3_192:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 272: RESTORE_R	restore	%r31, %r0, %r31
mondo_3_193:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d92c005  ! 273: WRPR_WSTATE_R	wrpr	%r11, %r5, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_194) + 8, 16, 16)) -> intp(5,0,13)
intvec_3_194:
	.word 0x39400001  ! 274: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d950000  ! 275: WRPR_WSTATE_R	wrpr	%r20, %r0, %wstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_196:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 276: RDPC	rd	%pc, %r11
debug_3_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 277: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93500000  ! 278: RDPR_TPC	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_198:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 279: RDPC	rd	%pc, %r12
pmu_3_199:
	nop
	setx 0xfffff5dcfffffbc7, %g1, %g7
	.word 0xa3800007  ! 280: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa1a00165  ! 281: FABSq	dis not found

mondo_3_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d950008  ! 282: WRPR_WSTATE_R	wrpr	%r20, %r8, %wstate
	.word 0x30800001  ! 283: BA	ba,a	<label_0x1>
pmu_3_201:
	nop
	setx 0xfffffe7bfffff84c, %g1, %g7
	.word 0xa3800007  ! 284: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_3_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d93000a  ! 285: WRPR_WSTATE_R	wrpr	%r12, %r10, %wstate
DS_3_203:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
memptr_3_204:
	set user_data_start, %r31
	.word 0x85853a81  ! 287: WRCCR_I	wr	%r20, 0x1a81, %ccr
	.word 0x20800001  ! 288: BN	bn,a	<label_0x1>
pmu_3_205:
	nop
	setx 0xfffffc02fffff51c, %g1, %g7
	.word 0xa3800007  ! 289: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_206) + 56, 16, 16)) -> intp(7,0,25)
intvec_3_206:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_207:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 291: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8d903cc9  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x1cc9, %pstate
	.word 0xda37e0b8  ! 293: STH_I	sth	%r13, [%r31 + 0x00b8]
DS_3_208:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 294: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 296: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01970  ! 297: FqTOd	dis not found

debug_3_211:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 298: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_3_212:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d900000  ! 299: WRPR_WSTATE_R	wrpr	%r0, %r0, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa368fed8  ! 300: SDIVX_I	sdivx	%r3, 0xfffffed8, %r17
	.word 0xa7a409cd  ! 301: FDIVd	fdivd	%f16, %f44, %f50
	.word 0x8d902536  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x0536, %pstate
intveclr_3_214:
	setx 0xcb1216b121e11b1f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196c  ! 304: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_216
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_216:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 305: RDPC	rd	%pc, %r8
intveclr_3_217:
	setx 0xabc3a3e17311bc6a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1500000  ! 307: RDPR_TPC	<illegal instruction>
	.word 0xa1a509c1  ! 308: FDIVd	fdivd	%f20, %f32, %f16
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_218:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 309: RDPC	rd	%pc, %r8
donret_3_219:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_219-donret_3_219-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xfab, %tstate
    wrhpr %g0, 0xd7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (3)
	done
donretarg_3_219:
	.word 0xe6ffe4a4  ! 310: SWAPA_I	swapa	%r19, [%r31 + 0x04a4] %asi
	rd %pc, %r19
	add %r19, (ivw_3_220-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_220:
	.word 0x91948012  ! 311: WRPR_PIL_R	wrpr	%r18, %r18, %pil
intveclr_3_221:
	setx 0x8239f72be21361e7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d950003  ! 313: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
	.word 0xe68008a0  ! 314: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xa1454000  ! 315: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
donret_3_223:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_223-donret_3_223-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1ce3, %tstate
    wrhpr %g0, 0xbcd, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (3)
	done
donretarg_3_223:
	.word 0xd6ffe4a4  ! 316: SWAPA_I	swapa	%r11, [%r31 + 0x04a4] %asi
intveclr_3_224:
	setx 0xc4438254699125dd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 317: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_3_225:
	.word 0x81982ce5  ! 318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ce5, %hpstate
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
	.word 0xa3414000  ! 319: RDPC	rd	%pc, %r17
	.word 0xe607c000  ! 320: LDUW_R	lduw	[%r31 + %r0], %r19
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 321: CASA_R	casa	[%r31] %asi, %r20, %r19
memptr_3_228:
	set user_data_start, %r31
	.word 0x8584e65a  ! 322: WRCCR_I	wr	%r19, 0x065a, %ccr
	.word 0x93d020b4  ! 323: Tcc_I	tne	icc_or_xcc, %r0 + 180
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_229:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 324: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0x8d902376  ! 325: WRPR_PSTATE_I	wrpr	%r0, 0x0376, %pstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_230:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 326: RDPC	rd	%pc, %r11
mondo_3_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d948012  ! 327: WRPR_WSTATE_R	wrpr	%r18, %r18, %wstate
debug_3_232:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 328: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_233)+56, 16, 16)) -> intp(3,1,3)
xir_3_233:
	.word 0xa9803bf5  ! 329: WR_SET_SOFTINT_I	wr	%r0, 0x1bf5, %set_softint
DS_3_234:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 330: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x99902000  ! 331: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
mondo_3_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d924008  ! 332: WRPR_WSTATE_R	wrpr	%r9, %r8, %wstate
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 333: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_3_236-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_236:
	.word 0x91944005  ! 334: WRPR_PIL_R	wrpr	%r17, %r5, %pil
DS_3_237:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 335: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xd01fff3e  ! 336: LDD_I	ldd	[%r31 + 0xffffff3e], %r8
	.word 0x8d9034e5  ! 337: WRPR_PSTATE_I	wrpr	%r0, 0x14e5, %pstate
	.word 0xd03fff3e  ! 338: STD_I	std	%r8, [%r31 + 0xffffff3e]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01961  ! 339: FqTOd	dis not found

	.word 0x8d902da6  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x0da6, %pstate
pmu_3_239:
	nop
	setx 0xfffffa73fffff359, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_240:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 342: RDPC	rd	%pc, %r11
mondo_3_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d90c00d  ! 343: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
intveclr_3_242:
	setx 0xa230d6975195bf67, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1454000  ! 345: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
mondo_3_243:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3d0] %asi
	.word 0x9d948006  ! 346: WRPR_WSTATE_R	wrpr	%r18, %r6, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01963  ! 347: FqTOd	dis not found

	.word 0xa1540000  ! 348: RDPR_GL	<illegal instruction>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_245
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_245:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e001  ! 349: CASA_R	casa	[%r31] %asi, %r1, %r8
	.word 0xa9a00169  ! 350: FABSq	dis not found

memptr_3_246:
	set user_data_start, %r31
	.word 0x8584656d  ! 351: WRCCR_I	wr	%r17, 0x056d, %ccr
	.word 0xd477c000  ! 352: STX_R	stx	%r10, [%r31 + %r0]
	.word 0x8d902520  ! 353: WRPR_PSTATE_I	wrpr	%r0, 0x0520, %pstate
memptr_3_247:
	set 0x60140000, %r31
	.word 0x8581730c  ! 354: WRCCR_I	wr	%r5, 0x130c, %ccr
	.word 0xd46ff8e6  ! 355: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
    set 0x2ba, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb047f1  ! 356: PDISTN	fmean16	%d32, %d48, %d44
mondo_3_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d920005  ! 357: WRPR_WSTATE_R	wrpr	%r8, %r5, %wstate
	.word 0x26800001  ! 358: BL	bl,a	<label_0x1>
pmu_3_249:
	nop
	setx 0xfffffb27fffff352, %g1, %g7
	.word 0xa3800007  ! 359: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46ff8e6  ! 360: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
change_to_randtl_3_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_250:
	.word 0x8f902001  ! 361: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_3_251:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_252
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_252:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e007  ! 363: CASA_R	casa	[%r31] %asi, %r7, %r10
debug_3_253:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 364: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99902004  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_254)+56, 16, 16)) -> intp(3,1,3)
xir_3_254:
	.word 0xa981eda4  ! 366: WR_SET_SOFTINT_I	wr	%r7, 0x0da4, %set_softint
	.word 0x8d902059  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x0059, %pstate
intveclr_3_255:
	setx 0xfaea6524880ac7ce, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 368: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa150c000  ! 369: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_256
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_256:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 370: RDPC	rd	%pc, %r12
	.word 0x93500000  ! 371: RDPR_TPC	<illegal instruction>
	.word 0x9945c000  ! 372: RD_TICK_CMPR_REG	rd	%-, %r12
splash_cmpr_3_257:
	setx 0xc8fc4681d826e99a, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_258:
	setx 0xcdcb9b8fe22a431c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 374: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x3ad5f8b88899726b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_259:
	.word 0x39400001  ! 375: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7480000  ! 376: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_260:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 377: CASA_R	casa	[%r31] %asi, %r7, %r19
mondo_3_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e0] %asi
	.word 0x9d90c005  ! 378: WRPR_WSTATE_R	wrpr	%r3, %r5, %wstate
intveclr_3_262:
	setx 0x764c4ff170397039, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 380: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe68008a0  ! 381: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe63fc000  ! 382: STD_R	std	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_3_264-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_264:
	.word 0x91914013  ! 383: WRPR_PIL_R	wrpr	%r5, %r19, %pil
splash_cmpr_3_265:
	setx 0x49b04152fd76f93b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 384: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 385: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0x68a88084be5c9704, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_267:
	.word 0x39400001  ! 386: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902a58  ! 387: WRPR_PSTATE_I	wrpr	%r0, 0x0a58, %pstate
	.word 0x28700001  ! 388: BPLEU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_268:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 389: RDPC	rd	%pc, %r8
	.word 0xad837f36  ! 390: WR_SOFTINT_REG_I	wr	%r13, 0x1f36, %softint
	.word 0xa780c003  ! 391: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r3, %-
DS_3_270:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd331eebc  ! 1: STQF_I	-	%f9, [0x0ebc, %r7]
	normalw
	.word 0xa9458000  ! 392: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xe537c000  ! 393: STQF_R	-	%f18, [%r0, %r31]
intveclr_3_271:
	setx 0x898c9564d262a061, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_272:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 395: RDPC	rd	%pc, %r9
mondo_3_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d90000c  ! 396: WRPR_WSTATE_R	wrpr	%r0, %r12, %wstate
	.word 0xe08008a0  ! 397: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x26800001  ! 398: BL	bl,a	<label_0x1>
splash_cmpr_3_274:
	setx 0x17d46e751b62a424, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916c65df  ! 400: SDIVX_I	sdivx	%r17, 0x05df, %r8
DS_3_276:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
intveclr_3_277:
	setx 0x57fb2465b5e138ee, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 402: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_278:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 403: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
pmu_3_279:
	nop
	setx 0xffffff1dfffff88a, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_3_280-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_280:
	.word 0x9194c009  ! 405: WRPR_PIL_R	wrpr	%r19, %r9, %pil
debug_3_281:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 406: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_3_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_282-donret_3_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1a4d, %tstate
    wrhpr %g0, 0x61f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (3)
	retry
donretarg_3_282:
	.word 0xe6ffe2b9  ! 407: SWAPA_I	swapa	%r19, [%r31 + 0x02b9] %asi
mondo_3_283:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d910001  ! 408: WRPR_WSTATE_R	wrpr	%r4, %r1, %wstate
splash_tba_3_284:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 409: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa781800b  ! 410: WR_GRAPHICS_STATUS_REG_R	wr	%r6, %r11, %-
	.word 0x99a00162  ! 411: FABSq	dis not found

intveclr_3_286:
	setx 0x58eb3634507c009f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 412: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_3_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_3_287:
	.word 0x8f902003  ! 413: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
tagged_3_288:
	tsubcctv %r19, 0x1bde, %r11
	.word 0xd207e2b9  ! 414: LDUW_I	lduw	[%r31 + 0x02b9], %r9
	.word 0x91d020b2  ! 415: Tcc_I	ta	icc_or_xcc, %r0 + 178
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 416: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902d57  ! 417: WRPR_PSTATE_I	wrpr	%r0, 0x0d57, %pstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_289
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_289:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 418: RDPC	rd	%pc, %r11
tagged_3_290:
	tsubcctv %r8, 0x1ebc, %r6
	.word 0xe407e2b9  ! 419: LDUW_I	lduw	[%r31 + 0x02b9], %r18
	.word 0xa1a00172  ! 420: FABSq	dis not found

memptr_3_291:
	set user_data_start, %r31
	.word 0x85816cc5  ! 421: WRCCR_I	wr	%r5, 0x0cc5, %ccr
splash_cmpr_3_292:
	setx 0xb9b4eba159793ec1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 422: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_3_293:
	.word 0x9ba489c6  ! 1: FDIVd	fdivd	%f18, %f6, %f44
	.word 0xbfe7c000  ! 423: SAVE_R	save	%r31, %r0, %r31
	.word 0xd8dfe030  ! 424: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
	.word 0xa5a109c1  ! 425: FDIVd	fdivd	%f4, %f32, %f18
memptr_3_294:
	set user_data_start, %r31
	.word 0x858464be  ! 426: WRCCR_I	wr	%r17, 0x04be, %ccr
donret_3_295:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_295-donret_3_295-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1ef3, %tstate
    wrhpr %g0, 0xe84, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (3)
	done
donretarg_3_295:
	.word 0xd6fff6a7  ! 427: SWAPA_I	swapa	%r11, [%r31 + 0xfffff6a7] %asi
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_296:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 428: CASA_R	casa	[%r31] %asi, %r1, %r11
mondo_3_297:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d918002  ! 429: WRPR_WSTATE_R	wrpr	%r6, %r2, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01962  ! 430: FqTOd	dis not found

	.word 0x97a00161  ! 431: FABSq	dis not found

tagged_3_299:
	taddcctv %r9, 0x1ed1, %r13
	.word 0xe407f6a7  ! 432: LDUW_I	lduw	[%r31 + 0xfffff6a7], %r18
	.word 0x99a00171  ! 433: FABSq	dis not found

	.word 0x9b540000  ! 434: RDPR_GL	rdpr	%-, %r13
splash_cmpr_3_300:
	setx 0x0f5ecafcd919d194, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 435: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7814011  ! 436: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r17, %-
	.word 0xda800ba0  ! 437: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r13
pmu_3_302:
	nop
	setx 0xfffff1fefffff794, %g1, %g7
	.word 0xa3800007  ! 438: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_3_303:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 439: RESTORE_R	restore	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_304) + 32, 16, 16)) -> intp(0,0,11)
intvec_3_304:
	.word 0x39400001  ! 440: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ff6a7  ! 441: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff6a7]
	.word 0xda8fe000  ! 442: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r13
intveclr_3_305:
	setx 0x9ce3f34eaa49c2da, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 443: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_3_306:
	set user_data_start, %r31
	.word 0x8584f7f5  ! 444: WRCCR_I	wr	%r19, 0x17f5, %ccr
	.word 0xda6ffae0  ! 445: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffae0]
intveclr_3_307:
	setx 0x80d3c2d6706547aa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_3_308:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 447: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_3_309-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_309:
	.word 0x91920011  ! 448: WRPR_PIL_R	wrpr	%r8, %r17, %pil
splash_tba_3_310:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 449: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x93a449c9  ! 450: FDIVd	fdivd	%f48, %f40, %f40
	rd %pc, %r19
	add %r19, (ivw_3_311-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_311:
	.word 0x91908010  ! 451: WRPR_PIL_R	wrpr	%r2, %r16, %pil
	rd %pc, %r19
	add %r19, (ivw_3_312-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_312:
	.word 0x91900011  ! 452: WRPR_PIL_R	wrpr	%r0, %r17, %pil
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 453: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f803e61  ! 454: SIR	sir	0x1e61
	.word 0xd46ffb56  ! 455: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
	.word 0xd46ffb56  ! 456: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
pmu_3_313:
	nop
	setx 0xfffffa99fffff023, %g1, %g7
	.word 0xa3800007  ! 457: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_3_314:
	set 0x60340000, %r31
	.word 0x85813349  ! 458: WRCCR_I	wr	%r4, 0x1349, %ccr
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 459: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_3_315:
	setx 0xdfd58d4eb5be1202, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 460: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_3_316:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_316-donret_3_316), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xfba, %tstate
    wrhpr %g0, 0x916, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (3)
	retry
donretarg_3_316:
	.word 0xd4fffcce  ! 461: SWAPA_I	swapa	%r10, [%r31 + 0xfffffcce] %asi
	.word 0x919233be  ! 462: WRPR_PIL_I	wrpr	%r8, 0x13be, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 463: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd53fc000  ! 464: STDF_R	std	%f10, [%r0, %r31]
	.word 0xd4dfe020  ! 465: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
mondo_3_317:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e8] %asi
	.word 0x9d904012  ! 466: WRPR_WSTATE_R	wrpr	%r1, %r18, %wstate
mondo_3_318:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c8] %asi
	.word 0x9d91c002  ! 467: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
	.word 0x91d02034  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 52
debug_3_319:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_3_320:
	set 0x60540000, %r31
	.word 0x8580af79  ! 470: WRCCR_I	wr	%r2, 0x0f79, %ccr
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_321:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 471: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0xd537f470  ! 472: STQF_I	-	%f10, [0x1470, %r31]
splash_cmpr_3_322:
	setx 0x9adba8750b2c5133, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_323
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_323:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 474: CASA_R	casa	[%r31] %asi, %r0, %r10
mondo_3_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d928012  ! 475: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
splash_hpstate_3_325:
	.word 0x819829de  ! 476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09de, %hpstate
	.word 0x9ba509cb  ! 477: FDIVd	fdivd	%f20, %f42, %f44
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_326
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_326:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 478: RDPC	rd	%pc, %r18
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_327
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_327:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 479: CASA_R	casa	[%r31] %asi, %r13, %r18
	.word 0x30700001  ! 480: BPA	<illegal instruction>
intveclr_3_328:
	setx 0x1356a1ddb8568742, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 481: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xb2e534451a5ca9dd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_329:
	.word 0x39400001  ! 482: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_3_330:
	nop
	setx 0xfffff8a3fffffae3, %g1, %g7
	.word 0xa3800007  ! 483: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_3_331:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 484: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_3_332:
	nop
	setx 0xfffff1c6fffff246, %g1, %g7
	.word 0xa3800007  ! 485: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xdb27c000  ! 487: STF_R	st	%f13, [%r0, %r31]
pmu_3_333:
	nop
	setx 0xfffffb56fffffdca, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_3_334:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_334-donret_3_334), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xd40, %tstate
    wrhpr %g0, 0xc94, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (3)
	retry
donretarg_3_334:
	.word 0xdafff470  ! 489: SWAPA_I	swapa	%r13, [%r31 + 0xfffff470] %asi
	rd %pc, %r19
	add %r19, (ivw_3_335-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_335:
	.word 0x9194000b  ! 490: WRPR_PIL_R	wrpr	%r16, %r11, %pil
debug_3_336:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 491: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_337
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_337:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 492: CASA_R	casa	[%r31] %asi, %r12, %r13
memptr_3_338:
	set 0x60140000, %r31
	.word 0x85822a37  ! 493: WRCCR_I	wr	%r8, 0x0a37, %ccr
debug_3_339:
	nop
	mov 8, %r18
	.word 0xe6f00492  ! 494: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
	.word 0xda8008a0  ! 495: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda8008a0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda97e030  ! 497: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
change_to_randtl_3_340:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_340:
	.word 0x8f902001  ! 498: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
    set 0x5de, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b087f4  ! 499: PDISTN	fmean16	%d2, %d20, %d8
pmu_3_341:
	nop
	setx 0xfffffd2bfffffce9, %g1, %g7
	.word 0xa3800007  ! 500: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_342
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_342:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 501: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_htba_3_343:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 502: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_344
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_344
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_344:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 503: RDPC	rd	%pc, %r9
	setx 0x36d1761bf3fd8e86, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_345:
	.word 0x39400001  ! 504: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_3_346:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_346-donret_3_346), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1c16, %tstate
    wrhpr %g0, 0xe5e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (3)
	retry
donretarg_3_346:
	.word 0xe6ffefb6  ! 505: SWAPA_I	swapa	%r19, [%r31 + 0x0fb6] %asi
	.word 0x91d02033  ! 506: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 507: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a0196a  ! 508: FqTOd	dis not found

cwp_3_348:
    set user_data_start, %o7
	.word 0x93902006  ! 509: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
cwp_3_349:
    set user_data_start, %o7
	.word 0x93902007  ! 510: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	rd %pc, %r19
	add %r19, (ivw_3_350-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_350:
	.word 0x91948001  ! 511: WRPR_PIL_R	wrpr	%r18, %r1, %pil
	.word 0x93450000  ! 512: RD_SET_SOFTINT	rd	%set_softint, %r9
intveclr_3_351:
	setx 0xddce72463ff7a7fd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 513: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda57c000  ! 514: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c23d5  ! 515: SDIVX_I	sdivx	%r16, 0x03d5, %r12
memptr_3_353:
	set 0x60340000, %r31
	.word 0x85832615  ! 516: WRCCR_I	wr	%r12, 0x0615, %ccr
	.word 0xe4bfe44b  ! 517: STDA_I	stda	%r18, [%r31 + 0x044b] %asi
	.word 0x91d02035  ! 518: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa3464000  ! 519: RD_STICK_CMPR_REG	rd	%-, %r17
intveclr_3_354:
	setx 0x51c9480397240f4b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 520: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_3_355:
	nop
	setx 0xfffff071fffff2e3, %g1, %g7
	.word 0xa3800007  ! 521: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91a1c9d2  ! 522: FDIVd	fdivd	%f38, %f18, %f8
intveclr_3_356:
	setx 0x313588b8f55a5a70, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 523: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 524: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
intveclr_3_357:
	setx 0xca8d2dda6fb0939b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97500000  ! 526: RDPR_TPC	rdpr	%tpc, %r11
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_358) + 24, 16, 16)) -> intp(7,0,8)
intvec_3_358:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_3_359:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 528: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_3_360:
	.word 0x99a509d0  ! 1: FDIVd	fdivd	%f20, %f16, %f12
	.word 0xe731f17d  ! 1: STQF_I	-	%f19, [0x117d, %r7]
	normalw
	.word 0x9b458000  ! 529: RD_SOFTINT_REG	rd	%softint, %r13
debug_3_361:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 530: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd0800c40  ! 531: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r8
	.word 0xa3450000  ! 532: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0xe26ff145  ! 533: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
	.word 0xe26ff145  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
mondo_3_362:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d944007  ! 535: WRPR_WSTATE_R	wrpr	%r17, %r7, %wstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 536: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28008a0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
intveclr_3_363:
	setx 0x042e7798368c92f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 538: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d914004  ! 539: WRPR_WSTATE_R	wrpr	%r5, %r4, %wstate
	.word 0xe21fc000  ! 540: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x99902003  ! 541: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xe337f145  ! 542: STQF_I	-	%f17, [0x1145, %r31]
DS_3_365:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 543: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	rd %pc, %r19
	add %r19, (ivw_3_366-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_366:
	.word 0x91910007  ! 544: WRPR_PIL_R	wrpr	%r4, %r7, %pil
	.word 0xe247f145  ! 545: LDSW_I	ldsw	[%r31 + 0xfffff145], %r17
donret_3_367:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_3_367-donret_3_367-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x195e, %tstate
    wrhpr %g0, 0x684, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (3)
	done
donretarg_3_367:
	.word 0xe2fff145  ! 546: SWAPA_I	swapa	%r17, [%r31 + 0xfffff145] %asi
mondo_3_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d91400a  ! 547: WRPR_WSTATE_R	wrpr	%r5, %r10, %wstate
DS_3_369:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa9b08302  ! 548: ALIGNADDRESS	alignaddr	%r2, %r2, %r20
	.word 0x83d02035  ! 549: Tcc_I	te	icc_or_xcc, %r0 + 53
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_370
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_370:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 550: CASA_R	casa	[%r31] %asi, %r3, %r8
	setx 0x8178ec98ea6029b7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_371:
	.word 0x39400001  ! 551: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd09ff145  ! 552: LDDA_I	ldda	[%r31, + 0xfffff145] %asi, %r8
splash_lsu_3_372:
	setx 0xf56ab23cb724885c, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 553: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_3_373:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 554: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936a6170  ! 555: SDIVX_I	sdivx	%r9, 0x0170, %r9
	.word 0xd137c000  ! 556: STQF_R	-	%f8, [%r0, %r31]
	.word 0xd00fe46f  ! 557: LDUB_I	ldub	[%r31 + 0x046f], %r8
	.word 0xd077e46f  ! 558: STX_I	stx	%r8, [%r31 + 0x046f]
	.word 0xa7814013  ! 559: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r19, %-
splash_cmpr_3_376:
	setx 0xb133fae520814ce7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 560: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x9ba4c9cc  ! 561: FDIVd	fdivd	%f50, %f12, %f44
mondo_3_377:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d944014  ! 562: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
cwp_3_378:
    set user_data_start, %o7
	.word 0x93902001  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_379:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 564: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0xa5a00174  ! 565: FABSq	dis not found

	.word 0x9b520000  ! 566: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_380
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_380:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 567: RDPC	rd	%pc, %r8
mondo_3_381:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d94c001  ! 568: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
mondo_3_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d940010  ! 569: WRPR_WSTATE_R	wrpr	%r16, %r16, %wstate
	.word 0xd03fe46f  ! 570: STD_I	std	%r8, [%r31 + 0x046f]
	.word 0xa9a0016b  ! 571: FABSq	dis not found

	.word 0xe06fe46f  ! 572: LDSTUB_I	ldstub	%r16, [%r31 + 0x046f]
debug_3_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 573: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02032  ! 574: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe08fe010  ! 575: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r16
intveclr_3_384:
	setx 0xc5f13e215d4a9078, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 576: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 577: Tcc_I	ta	icc_or_xcc, %r0 + 181
debug_3_385:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 578: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_386:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 579: CASA_R	casa	[%r31] %asi, %r10, %r16
debug_3_387:
	nop
	mov 8, %r18
	.word 0xdaf00492  ! 580: STXA_R	stxa	%r13, [%r0 + %r18] 0x24
pmu_3_388:
	nop
	setx 0xfffffc84fffff150, %g1, %g7
	.word 0xa3800007  ! 581: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_3_389-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_389:
	.word 0x91944003  ! 582: WRPR_PIL_R	wrpr	%r17, %r3, %pil
change_to_randtl_3_390:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_3_390:
	.word 0x8f902000  ! 583: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196d  ! 584: FqTOd	dis not found

	.word 0x36700001  ! 585: BPGE	<illegal instruction>
mondo_3_392:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d908008  ! 586: WRPR_WSTATE_R	wrpr	%r2, %r8, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9769345a  ! 587: SDIVX_I	sdivx	%r4, 0xfffff45a, %r11
	.word 0x97a00171  ! 588: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_394
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_394:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 589: RDPC	rd	%pc, %r17
	.word 0xd0dfe010  ! 590: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r8
	.word 0xd0d7e000  ! 591: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	setx 0xc444e9c39f8d886a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_395:
	.word 0x39400001  ! 592: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_396:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 593: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_3_397:
	setx 0x2f8d310c9c7c3b6f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 594: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_3_398:
	nop
	setx 0xfffffe49fffff282, %g1, %g7
	.word 0xa3800007  ! 595: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d020b3  ! 596: Tcc_I	tne	icc_or_xcc, %r0 + 179
intveclr_3_399:
	setx 0x0dc49e21a9692f5f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 597: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd03fe06b  ! 598: STD_I	std	%r8, [%r31 + 0x006b]
debug_3_400:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 599: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_3_401-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_401:
	.word 0x9192c00b  ! 600: WRPR_PIL_R	wrpr	%r11, %r11, %pil
mondo_3_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d94000d  ! 601: WRPR_WSTATE_R	wrpr	%r16, %r13, %wstate
	.word 0x91a4c9cb  ! 602: FDIVd	fdivd	%f50, %f42, %f8
intveclr_3_403:
	setx 0xcf680f2cd2bbead9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 603: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 604: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196b  ! 605: FqTOd	dis not found

    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 606: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0xe737e06b  ! 607: STQF_I	-	%f19, [0x006b, %r31]
pmu_3_407:
	nop
	setx 0xfffffa06fffff53b, %g1, %g7
	.word 0xa3800007  ! 608: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_3_408-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_408:
	.word 0x91944004  ! 609: WRPR_PIL_R	wrpr	%r17, %r4, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01973  ! 610: FqTOd	dis not found

	.word 0xd737c000  ! 611: STQF_R	-	%f11, [%r0, %r31]
debug_3_410:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 612: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36923ab  ! 613: SDIVX_I	sdivx	%r4, 0x03ab, %r17
	.word 0x81510000  ! 614: RDPR_TICK	rdpr	%tick, %r0
	.word 0x93d02035  ! 615: Tcc_I	tne	icc_or_xcc, %r0 + 53
debug_3_412:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe88008a0  ! 617: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
pmu_3_413:
	nop
	setx 0xfffff7fbfffff324, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99902005  ! 619: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
splash_cmpr_3_414:
	setx 0xd16e44836319487f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 620: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_415:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 621: RDPC	rd	%pc, %r16
splash_lsu_3_416:
	setx 0xf257e33955f0b3a3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 622: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd477f103  ! 623: STX_I	stx	%r10, [%r31 + 0xfffff103]
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_417
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_417:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 624: RDPC	rd	%pc, %r16
	.word 0x93d020b5  ! 625: Tcc_I	tne	icc_or_xcc, %r0 + 181
intveclr_3_418:
	setx 0x1b65351f3d21851e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 626: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93a509d2  ! 627: FDIVd	fdivd	%f20, %f18, %f40
DS_3_419:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 628: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xab810009  ! 629: WR_CLEAR_SOFTINT_R	wr	%r4, %r9, %clear_softint
splash_cmpr_3_420:
	setx 0x96232f46bc1474db, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 630: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_3_421-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_421:
	.word 0x9190c005  ! 631: WRPR_PIL_R	wrpr	%r3, %r5, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_422)+8, 16, 16)) -> intp(3,1,3)
xir_3_422:
	.word 0xa9806436  ! 632: WR_SET_SOFTINT_I	wr	%r1, 0x0436, %set_softint
mondo_3_423:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d940011  ! 633: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_424
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_424:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 634: CASA_R	casa	[%r31] %asi, %r3, %r11
debug_3_425:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 635: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_3_426:
	setx 0xd5e314bed1481450, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 636: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_3_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d908011  ! 637: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976974fa  ! 638: SDIVX_I	sdivx	%r5, 0xfffff4fa, %r11
intveclr_3_429:
	setx 0xfa3a7b3d28dcdbf6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 639: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_430:
	setx 0x35376dd8c2b0c540, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 640: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x89c5ba842f2fe62a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_431:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_432:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d92c014  ! 642: WRPR_WSTATE_R	wrpr	%r11, %r20, %wstate
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_433
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_433
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_433:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 643: RDPC	rd	%pc, %r9
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_434
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_434:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 644: CASA_R	casa	[%r31] %asi, %r4, %r18
	setx 0x79d60d88e5758183, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_435:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_436:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 646: CASA_R	casa	[%r31] %asi, %r4, %r18
splash_cmpr_3_437:
	setx 0x47d29bf05ec997c2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 647: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_3_438:
	setx 0x1eef1c1ef1f6cfbc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 648: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 649: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
DS_3_439:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x9ba00548  ! 1: FSQRTd	fsqrt	
	.word 0xa3a2c82b  ! 650: FADDs	fadds	%f11, %f11, %f17
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_3_440:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 652: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97520000  ! 653: RDPR_PIL	<illegal instruction>
	setx 0xafb86b50bec3ec33, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_441:
	.word 0x39400001  ! 654: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_442:
	setx 0x717e76b44f28ca00, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 655: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_3_443:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 656: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_444
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_444:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 657: CASA_R	casa	[%r31] %asi, %r9, %r12
memptr_3_445:
	set 0x60740000, %r31
	.word 0x85826cd2  ! 658: WRCCR_I	wr	%r9, 0x0cd2, %ccr
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_446
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_446
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_446:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 659: RDPC	rd	%pc, %r12
splash_cmpr_3_447:
	setx 0x9ee7b2b55143bb75, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 660: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_448:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e009  ! 661: CASA_R	casa	[%r31] %asi, %r9, %r13
	rd %pc, %r19
	add %r19, (ivw_3_449-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_449:
	.word 0x9192c014  ! 662: WRPR_PIL_R	wrpr	%r11, %r20, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01974  ! 663: FqTOd	dis not found

	.word 0xa9a00162  ! 664: FABSq	dis not found

debug_3_451:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 665: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_3_452-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_3_452:
	.word 0x91904010  ! 666: WRPR_PIL_R	wrpr	%r1, %r16, %pil
	.word 0xda6fe48d  ! 667: LDSTUB_I	ldstub	%r13, [%r31 + 0x048d]
	.word 0x9f8031ac  ! 668: SIR	sir	0x11ac
mondo_3_453:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d92c004  ! 669: WRPR_WSTATE_R	wrpr	%r11, %r4, %wstate
	.word 0x8d902776  ! 670: WRPR_PSTATE_I	wrpr	%r0, 0x0776, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01961  ! 671: FqTOd	dis not found

	.word 0x91a409d2  ! 672: FDIVd	fdivd	%f16, %f18, %f8
memptr_3_455:
	set 0x60540000, %r31
	.word 0x8584e353  ! 673: WRCCR_I	wr	%r19, 0x0353, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 674: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_3_456:
	setx 0xf35c03c1a4a1dbf8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 675: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x0889a9c06c33c570, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_457:
	.word 0x39400001  ! 676: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_3_458:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 677: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_3_459:
	set 0x003d0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003d0000, %r12
	.word 0x8b90000c  ! 678: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (3+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_3_460
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_3_460
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_3_460:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 679: RDPC	rd	%pc, %r9
	setx 0xbe0af679d4d873f9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_461:
	.word 0x39400001  ! 680: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_3_462:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d924001  ! 681: WRPR_WSTATE_R	wrpr	%r9, %r1, %wstate
    mov (3+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_3_463
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_3_463:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 682: CASA_R	casa	[%r31] %asi, %r17, %r16
cwp_3_464:
    set user_data_start, %o7
	.word 0x93902000  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
debug_3_465:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 684: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_3_466)+56, 16, 16)) -> intp(3,1,3)
xir_3_466:
	.word 0xa9832365  ! 685: WR_SET_SOFTINT_I	wr	%r12, 0x0365, %set_softint
	.word 0xa1a00161  ! 686: FABSq	dis not found

debug_3_467:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 687: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93464000  ! 688: RD_STICK_CMPR_REG	rd	%-, %r9
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_3_468) + 8, 16, 16)) -> intp(2,0,4)
intvec_3_468:
	.word 0x39400001  ! 689: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 690: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_3_469:
	set 0x60540000, %r31
	.word 0x8584e2e7  ! 691: WRCCR_I	wr	%r19, 0x02e7, %ccr
splash_cmpr_3_470:
	setx 0x8cd9e64ed5f2c18e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 692: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_3_471:
	nop
	setx 0xfffff247fffff73e, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_3_472:
	setx 0x6d8eca207689ec4b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 694: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x3c6b8b94f5ed9ed1, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_473:
	.word 0x39400001  ! 695: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_3_474:
	setx 0xa62d87657daa71e3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 696: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_3_475:
	setx 0x03b4685502181656, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 697: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_3_476:
	setx 0xfbb4fa109cfadb44, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 698: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0x6fc549ae63cc4a9c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_3_477:
	.word 0x39400001  ! 699: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a289c2  ! 700: FDIVd	fdivd	%f10, %f2, %f40
splash_tba_3_478:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 701: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	invalw
	mov 0x31, %r30
splash_cmpr_2_0:
	setx 0x46ac9ef566e39855, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_1:
	setx 0x18a91f1276c63929, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_2:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 3: RDPC	rd	%pc, %r16
	.word 0x91d02033  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_hpstate_2_3:
	.word 0x8198294f  ! 5: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094f, %hpstate
donret_2_4:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_4-donret_2_4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1649, %tstate
    wrhpr %g0, 0x5df, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_4:
	.word 0xe6ffee7d  ! 6: SWAPA_I	swapa	%r19, [%r31 + 0x0e7d] %asi
	.word 0x38700001  ! 7: BPGU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_5:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 8: RDPC	rd	%pc, %r19
	.word 0x97a409c1  ! 9: FDIVd	fdivd	%f16, %f32, %f42
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01963  ! 10: FqTOd	dis not found

mondo_2_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c00d  ! 11: WRPR_WSTATE_R	wrpr	%r19, %r13, %wstate
splash_hpstate_2_8:
	.word 0x81982d5d  ! 12: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5d, %hpstate
mondo_2_9:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d920003  ! 13: WRPR_WSTATE_R	wrpr	%r8, %r3, %wstate
	.word 0xd80fee7d  ! 14: LDUB_I	ldub	[%r31 + 0x0e7d], %r12
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_10:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 15: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa9808010  ! 16: WR_SET_SOFTINT_R	wr	%r2, %r16, %set_softint
	setx 0x670ed6bb334d0124, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a00170  ! 18: FABSq	dis not found

	.word 0x91d020b3  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 179
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_12) + 56, 16, 16)) -> intp(5,0,5)
intvec_2_12:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_13:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 21: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d902343  ! 22: WRPR_PSTATE_I	wrpr	%r0, 0x0343, %pstate
	.word 0xab84c011  ! 23: WR_CLEAR_SOFTINT_R	wr	%r19, %r17, %clear_softint
memptr_2_14:
	set 0x60740000, %r31
	.word 0x85852b05  ! 24: WRCCR_I	wr	%r20, 0x0b05, %ccr
	setx 0xbce3e94c37b028fb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_15:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99682915  ! 26: SDIVX_I	sdivx	%r0, 0x0915, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9168a317  ! 27: SDIVX_I	sdivx	%r2, 0x0317, %r8
mondo_2_18:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3d0] %asi
	.word 0x9d928014  ! 28: WRPR_WSTATE_R	wrpr	%r10, %r20, %wstate
mondo_2_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d900012  ! 29: WRPR_WSTATE_R	wrpr	%r0, %r18, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_20:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e009  ! 30: CASA_R	casa	[%r31] %asi, %r9, %r11
	.word 0xa3a409cb  ! 31: FDIVd	fdivd	%f16, %f42, %f48
	.word 0xe2800be0  ! 32: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r17
splash_cmpr_2_21:
	setx 0xabb9e5e3c72f53be, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a00166  ! 34: FABSq	dis not found

pmu_2_22:
	nop
	setx 0xfffffcb7fffff4b0, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_2_23:
	nop
	setx 0xfffff96cfffff44a, %g1, %g7
	.word 0xa3800007  ! 36: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_2_24:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_24:
	.word 0x8f902002  ! 37: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_25:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 38: RDPC	rd	%pc, %r9
	.word 0xab847e7f  ! 39: WR_CLEAR_SOFTINT_I	wr	%r17, 0x1e7f, %clear_softint
memptr_2_26:
	set 0x60540000, %r31
	.word 0x85842795  ! 40: WRCCR_I	wr	%r16, 0x0795, %ccr
	rd %pc, %r19
	add %r19, (ivw_2_27-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_27:
	.word 0x9190000c  ! 41: WRPR_PIL_R	wrpr	%r0, %r12, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6c6978  ! 42: SDIVX_I	sdivx	%r17, 0x0978, %r13
intveclr_2_29:
	setx 0x8f4f25c54367a211, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_30) + 16, 16, 16)) -> intp(7,0,4)
intvec_2_30:
	.word 0x39400001  ! 44: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_31:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 45: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01962  ! 46: FqTOd	dis not found

	setx 0xc97059221833918a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_33:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_34:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 48: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_2_35:
	setx 0x5711631f893ed720, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 49: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_2_36:
	.word 0x81982b6c  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b6c, %hpstate
	.word 0x99a00165  ! 51: FABSq	dis not found

	.word 0x8d902f7d  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x0f7d, %pstate
	rd %pc, %r19
	add %r19, (ivw_2_37-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_37:
	.word 0x91918001  ! 53: WRPR_PIL_R	wrpr	%r6, %r1, %pil
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_38:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 54: RDPC	rd	%pc, %r13
	.word 0xa9a00173  ! 55: FABSq	dis not found

debug_2_39:
	nop
	mov 8, %r18
	.word 0xd8f00492  ! 56: STXA_R	stxa	%r12, [%r0 + %r18] 0x24
splash_cmpr_2_40:
	setx 0x560719f63f40bac3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 57: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd31fc000  ! 58: LDDF_R	ldd	[%r31, %r0], %f9
debug_2_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 59: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_42:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 60: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_43:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 61: RDPC	rd	%pc, %r16
	.word 0xd537fc6d  ! 62: STQF_I	-	%f10, [0x1c6d, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01963  ! 63: FqTOd	dis not found

pmu_2_45:
	nop
	setx 0xffffff5afffff0e3, %g1, %g7
	.word 0xa3800007  ! 64: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d920011  ! 65: WRPR_WSTATE_R	wrpr	%r8, %r17, %wstate
DS_2_47:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd131c003  ! 1: STQF_R	-	%f8, [%r3, %r7]
	normalw
	.word 0x95458000  ! 66: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xe0c7e010  ! 67: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_48) + 32, 16, 16)) -> intp(3,0,1)
intvec_2_48:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_2_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_49-donret_2_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xf8a, %tstate
    wrhpr %g0, 0xed6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_49:
	.word 0xe0fffc6d  ! 69: SWAPA_I	swapa	%r16, [%r31 + 0xfffffc6d] %asi
	.word 0x8d902d22  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x0d22, %pstate
pmu_2_50:
	nop
	setx 0xffffffc2fffffd8b, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936ab8dc  ! 72: SDIVX_I	sdivx	%r10, 0xfffff8dc, %r9
	.word 0x91d020b4  ! 73: Tcc_I	ta	icc_or_xcc, %r0 + 180
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_52:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e002  ! 74: CASA_R	casa	[%r31] %asi, %r2, %r11
mondo_2_53:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d94c008  ! 75: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
memptr_2_54:
	set user_data_start, %r31
	.word 0x85833172  ! 76: WRCCR_I	wr	%r12, 0x1172, %ccr
splash_lsu_2_55:
	setx 0x89e57d087e6304a6, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 77: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_56:
	.word 0x8198271d  ! 78: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071d, %hpstate
splash_cmpr_2_57:
	setx 0x616eaa8ca6073c76, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 79: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 80: BPGE	<illegal instruction>
pmu_2_58:
	nop
	setx 0xfffff9e8fffffa64, %g1, %g7
	.word 0xa3800007  ! 81: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_59:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 82: RDPC	rd	%pc, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a0196b  ! 83: FqTOd	dis not found

splash_cmpr_2_61:
	setx 0x5a3a4858882b3bb9, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 84: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe927f7c3  ! 85: STF_I	st	%f20, [0x17c3, %r31]
splash_tba_2_62:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_2_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e8] %asi
	.word 0x9d918003  ! 87: WRPR_WSTATE_R	wrpr	%r6, %r3, %wstate
	.word 0x83d020b3  ! 88: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x97a209c2  ! 89: FDIVd	fdivd	%f8, %f2, %f42
	rd %pc, %r19
	add %r19, (ivw_2_64-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_64:
	.word 0x91934006  ! 90: WRPR_PIL_R	wrpr	%r13, %r6, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_65)+48, 16, 16)) -> intp(2,1,3)
xir_2_65:
	.word 0xa980a28f  ! 91: WR_SET_SOFTINT_I	wr	%r2, 0x028f, %set_softint
change_to_randtl_2_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_66:
	.word 0x8f902002  ! 92: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	setx 0x5a5748384280ca8d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_67:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_68) + 16, 16, 16)) -> intp(2,0,2)
intvec_2_68:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9023b1  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x03b1, %pstate
	.word 0xe08008a0  ! 96: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8d902b62  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0b62, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0c7e010  ! 99: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r16
	setx 0x2151b5bb6028b686, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_69:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_70:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 101: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 102: RD_STICK_REG	stbar
	rd %pc, %r19
	add %r19, (ivw_2_71-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_71:
	.word 0x9194800b  ! 103: WRPR_PIL_R	wrpr	%r18, %r11, %pil
	.word 0x99902003  ! 104: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
change_to_randtl_2_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_72:
	.word 0x8f902001  ! 105: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_2_73:
	setx 0x1d64c1f6b90913cc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 107: CASA_R	casa	[%r31] %asi, %r10, %r16
	.word 0x26800001  ! 108: BL	bl,a	<label_0x1>
splash_hpstate_2_75:
	.word 0x81982fd5  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd5, %hpstate
intveclr_2_76:
	setx 0xd0f35e5ec4254241, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 110: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe00fc000  ! 111: LDUB_R	ldub	[%r31 + %r0], %r16
donret_2_77:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_77-donret_2_77-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xc00, %tstate
    wrhpr %g0, 0x414, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	done
donretarg_2_77:
	.word 0xe0ffe388  ! 112: SWAPA_I	swapa	%r16, [%r31 + 0x0388] %asi
change_to_randtl_2_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_78:
	.word 0x8f902001  ! 113: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9f802963  ! 114: SIR	sir	0x0963
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7693ed1  ! 115: SDIVX_I	sdivx	%r4, 0xfffffed1, %r19
memptr_2_80:
	set 0x60540000, %r31
	.word 0x85817173  ! 116: WRCCR_I	wr	%r5, 0x1173, %ccr
mondo_2_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d940009  ! 117: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
DS_2_82:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 118: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	setx 0x9c1d0825e45487fe, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e8] %asi
	.word 0x9d90400d  ! 120: WRPR_WSTATE_R	wrpr	%r1, %r13, %wstate
	setx 0x2670150b012eeba2, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_85:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 122: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
donret_2_86:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_86-donret_2_86), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1f50, %tstate
    wrhpr %g0, 0x9d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_86:
	.word 0xe8ffecb2  ! 123: SWAPA_I	swapa	%r20, [%r31 + 0x0cb2] %asi
DS_2_87:
	.word 0x91a409d2  ! 1: FDIVd	fdivd	%f16, %f18, %f8
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb150006  ! 1: LDQF_R	-	[%r20, %r6], %f13
	.word 0x93a0c832  ! 124: FADDs	fadds	%f3, %f18, %f9
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_88:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 125: CASA_R	casa	[%r31] %asi, %r16, %r12
splash_cmpr_2_89:
	setx 0xe7988f6830869b05, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 126: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_90) + 56, 16, 16)) -> intp(4,0,24)
intvec_2_90:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_91:
	.word 0x8f902001  ! 128: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
intveclr_2_92:
	setx 0x8bc90da833df4598, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x2346, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb287f0  ! 130: PDISTN	fmean16	%d10, %d16, %d44
	.word 0xd477c000  ! 131: STX_R	stx	%r10, [%r31 + %r0]
	setx 0x00311981f2670da5, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_93:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 133: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_2_94:
	setx 0x79d9e5d640f745c0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_95:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 135: CASA_R	casa	[%r31] %asi, %r10, %r10
	.word 0x8d9023b3  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x03b3, %pstate
	.word 0x99902001  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
memptr_2_96:
	set user_data_start, %r31
	.word 0x8584a9d1  ! 138: WRCCR_I	wr	%r18, 0x09d1, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_97:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 139: RDPC	rd	%pc, %r20
	rd %pc, %r19
	add %r19, (ivw_2_98-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_98:
	.word 0x91934005  ! 140: WRPR_PIL_R	wrpr	%r13, %r5, %pil
memptr_2_99:
	set user_data_start, %r31
	.word 0x85842889  ! 141: WRCCR_I	wr	%r16, 0x0889, %ccr
splash_hpstate_2_100:
	.word 0x8198261c  ! 142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061c, %hpstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_101:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 143: RDPC	rd	%pc, %r16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_102:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 144: RDPC	rd	%pc, %r18
	.word 0x8d902f4f  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x0f4f, %pstate
	.word 0x3a700001  ! 146: BPCC	<illegal instruction>
    set 0x343b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b407e2  ! 147: PDISTN	fmean16	%d16, %d2, %d40
splash_cmpr_2_103:
	setx 0x9306ec8a2018b28f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_104:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb6e5d3f	! Random illegal ?
	.word 0x91a1c9ca  ! 1: FDIVd	fdivd	%f38, %f10, %f8
	.word 0x91a24829  ! 149: FADDs	fadds	%f9, %f9, %f8
mondo_2_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d950011  ! 150: WRPR_WSTATE_R	wrpr	%r20, %r17, %wstate
	.word 0x9350c000  ! 151: RDPR_TT	<illegal instruction>
memptr_2_106:
	set 0x60340000, %r31
	.word 0x8580f1f0  ! 152: WRCCR_I	wr	%r3, 0x11f0, %ccr
	setx 0xcdd935937b32d95b, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_107:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9830006  ! 154: WR_SET_SOFTINT_R	wr	%r12, %r6, %set_softint
	.word 0xe297e020  ! 155: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_108:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 156: RDPC	rd	%pc, %r9
	setx 0x1ff5c43eeb30f42f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_109:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95480000  ! 158: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x95a00170  ! 159: FABSq	dis not found

DS_2_110:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f20, %f24, %f26
	.word 0xa7b30309  ! 160: ALIGNADDRESS	alignaddr	%r12, %r9, %r19
	.word 0x2a700001  ! 161: BPCS	<illegal instruction>
DS_2_111:
	.word 0xa5a049d1  ! 1: FDIVd	fdivd	%f32, %f48, %f18
	allclean
	.word 0xa5b48307  ! 162: ALIGNADDRESS	alignaddr	%r18, %r7, %r18
debug_2_112:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976aa0ad  ! 164: SDIVX_I	sdivx	%r10, 0x00ad, %r11
	.word 0xe897e030  ! 165: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r20
	.word 0xe8dfe020  ! 166: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_114:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 167: RDPC	rd	%pc, %r13
	.word 0xe48008a0  ! 168: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	rd %pc, %r19
	add %r19, (ivw_2_115-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_115:
	.word 0x9192800d  ! 169: WRPR_PIL_R	wrpr	%r10, %r13, %pil
debug_2_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x83d02034  ! 171: Tcc_I	te	icc_or_xcc, %r0 + 52
splash_cmpr_2_117:
	setx 0x132c01453fedf51e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_118:
	nop
	rd %pc, %r19
	add %r19, (64+40), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe457fe3c  ! 174: LDSH_I	ldsh	[%r31 + 0xfffffe3c], %r18
tagged_2_119:
	taddcctv %r6, 0x114f, %r9
	.word 0xe407fe3c  ! 175: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
pmu_2_120:
	nop
	setx 0xffffff00fffffa12, %g1, %g7
	.word 0xa3800007  ! 176: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_121:
	setx 0x195cb8c838802e42, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d928013  ! 178: WRPR_WSTATE_R	wrpr	%r10, %r19, %wstate
tagged_2_123:
	taddcctv %r21, 0x1d7c, %r26
	.word 0xe407fe3c  ! 179: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
	.word 0x91d02032  ! 180: Tcc_I	ta	icc_or_xcc, %r0 + 50
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 181: LDX_R	ldx	[%r31 + %r0], %r18
debug_2_124:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_2_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d8] %asi
	.word 0x9d92c006  ! 183: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
	rd %pc, %r19
	add %r19, (ivw_2_126-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_126:
	.word 0x9194c00a  ! 184: WRPR_PIL_R	wrpr	%r19, %r10, %pil
	setx 0xe87ea9cba4d0c3a8, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_127:
	.word 0x39400001  ! 185: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_128) + 56, 16, 16)) -> intp(6,0,5)
intvec_2_128:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7a00172  ! 187: FABSq	dis not found

debug_2_129:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 188: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_130:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 189: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_lsu_2_131:
	setx 0xe8ab3ba3b84d7db4, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91a00172  ! 191: FABSq	dis not found

	.word 0xd0cfe030  ! 192: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r8
intveclr_2_132:
	setx 0x98819593cea911f7, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 50
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_133:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 195: RDPC	rd	%pc, %r13
splash_cmpr_2_134:
	setx 0x662cb43edc56de30, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_135:
	setx 0xc48d1528c74f3a99, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06ffe3c  ! 198: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe3c]
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_136:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 199: CASA_R	casa	[%r31] %asi, %r9, %r16
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_137
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_137:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 200: RDPC	rd	%pc, %r13
	.word 0x3e800001  ! 201: BVC	bvc,a	<label_0x1>
intveclr_2_138:
	setx 0x8b7e55990e7a9c91, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 202: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_139:
	setx 0x6c9cbbed7081bb74, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 203: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b4  ! 204: Tcc_I	te	icc_or_xcc, %r0 + 180
donret_2_140:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_140-donret_2_140), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1824, %tstate
    wrhpr %g0, 0x29f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_140:
	.word 0xd8fffe3c  ! 205: SWAPA_I	swapa	%r12, [%r31 + 0xfffffe3c] %asi
splash_htba_2_141:
	set 0x003a0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r12
	.word 0x8b98000c  ! 206: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_2_142:
	setx 0xf9aa71dad58f4c72, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_2_144:
	.word 0x819825dc  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05dc, %hpstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_145:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 210: CASA_R	casa	[%r31] %asi, %r9, %r12
splash_cmpr_2_146:
	setx 0x383eb9a891b237d7, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 211: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_147:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 212: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
	.word 0xab836afc  ! 213: WR_CLEAR_SOFTINT_I	wr	%r13, 0x0afc, %clear_softint
intveclr_2_148:
	setx 0x99ad9b6e1e609f22, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_149)+40, 16, 16)) -> intp(2,1,3)
xir_2_149:
	.word 0xa9817b08  ! 215: WR_SET_SOFTINT_I	wr	%r5, 0x1b08, %set_softint
pmu_2_150:
	nop
	setx 0xfffff58cfffffd70, %g1, %g7
	.word 0xa3800007  ! 216: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_2_151:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_151:
	.word 0x8f902000  ! 217: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x26700001  ! 218: BPL	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_152) + 16, 16, 16)) -> intp(2,0,0)
intvec_2_152:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a00162  ! 220: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_2_153-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_153:
	.word 0x9195000a  ! 221: WRPR_PIL_R	wrpr	%r20, %r10, %pil
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_154
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_154:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 222: RDPC	rd	%pc, %r18
	.word 0x83d020b2  ! 223: Tcc_I	te	icc_or_xcc, %r0 + 178
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 224: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_2_156:
	setx 0x8678747f6206fa8c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_2_157:
	setx 0xef3236b995581e56, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00162  ! 227: FABSq	dis not found

splash_cmpr_2_158:
	setx 0x379e7110d3731e7b, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_159:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 229: RDPC	rd	%pc, %r9
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_160:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 230: RDPC	rd	%pc, %r20
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_161
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_161
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_161:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 231: RDPC	rd	%pc, %r19
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_162
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_162:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 232: RDPC	rd	%pc, %r12
	setx 0x79d27c2f5d837844, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_163:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_164:
	nop
	setx 0xfffff106fffffec4, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x3b9b5fd9a9daa992, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_165:
	.word 0x39400001  ! 235: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976d33cc  ! 236: SDIVX_I	sdivx	%r20, 0xfffff3cc, %r11
	.word 0x93d02035  ! 237: Tcc_I	tne	icc_or_xcc, %r0 + 53
mondo_2_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d934007  ! 238: WRPR_WSTATE_R	wrpr	%r13, %r7, %wstate
splash_cmpr_2_168:
	setx 0x759b45b8224e9d06, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d90c00c  ! 240: WRPR_WSTATE_R	wrpr	%r3, %r12, %wstate
mondo_2_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d94400c  ! 241: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
splash_cmpr_2_171:
	setx 0xcafd0d427df731cc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 242: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_172) + 40, 16, 16)) -> intp(6,0,15)
intvec_2_172:
	.word 0x39400001  ! 243: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_173:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0xa9a489cd  ! 245: FDIVd	fdivd	%f18, %f44, %f20
	.word 0xda8008a0  ! 246: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_hpstate_2_174:
	.word 0x8198271c  ! 247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071c, %hpstate
	setx 0x173645b2ceec10ef, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_175:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_176:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r13
	.word 0xa1480000  ! 250: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0xd64fc000  ! 251: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0xd60ff241  ! 252: LDUB_I	ldub	[%r31 + 0xfffff241], %r11
	.word 0x8d903b7b  ! 253: WRPR_PSTATE_I	wrpr	%r0, 0x1b7b, %pstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_177:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 254: RDPC	rd	%pc, %r16
splash_hpstate_2_178:
	.word 0x81982746  ! 255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0746, %hpstate
mondo_2_179:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d0] %asi
	.word 0x9d91c00a  ! 256: WRPR_WSTATE_R	wrpr	%r7, %r10, %wstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_2_180:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 258: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0x99464000  ! 259: RD_STICK_CMPR_REG	rd	%-, %r12
intveclr_2_181:
	setx 0x3faf13098c1a87d2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1a089c3  ! 261: FDIVd	fdivd	%f2, %f34, %f16
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
	.word 0xa9414000  ! 262: RDPC	rd	%pc, %r20
	rd %pc, %r19
	add %r19, (ivw_2_183-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_183:
	.word 0x91904010  ! 263: WRPR_PIL_R	wrpr	%r1, %r16, %pil
intveclr_2_184:
	setx 0x0318dc6806348bc2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 264: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_185:
	setx 0x1c23630b6994a0e4, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 265: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_2_186:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d95000c  ! 266: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
	rd %pc, %r19
	add %r19, (ivw_2_187-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_187:
	.word 0x91950004  ! 267: WRPR_PIL_R	wrpr	%r20, %r4, %pil
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_188:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 268: CASA_R	casa	[%r31] %asi, %r19, %r13
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_189:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 269: RDPC	rd	%pc, %r19
intveclr_2_190:
	setx 0xf60ab0e60a5a4412, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 270: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_191:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_191:
	.word 0x8f902001  ! 271: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_2_192:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 272: RESTORE_R	restore	%r31, %r0, %r31
mondo_2_193:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d900011  ! 273: WRPR_WSTATE_R	wrpr	%r0, %r17, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_194) + 8, 16, 16)) -> intp(5,0,0)
intvec_2_194:
	.word 0x39400001  ! 274: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3c0] %asi
	.word 0x9d94c010  ! 275: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_196:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 276: RDPC	rd	%pc, %r16
debug_2_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 277: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x93500000  ! 278: RDPR_TPC	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 279: RDPC	rd	%pc, %r20
pmu_2_199:
	nop
	setx 0xfffff21ffffff348, %g1, %g7
	.word 0xa3800007  ! 280: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99a00170  ! 281: FABSq	dis not found

mondo_2_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d90c014  ! 282: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
	.word 0x30800001  ! 283: BA	ba,a	<label_0x1>
pmu_2_201:
	nop
	setx 0xfffff6cdfffff77a, %g1, %g7
	.word 0xa3800007  ! 284: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_2_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d93000d  ! 285: WRPR_WSTATE_R	wrpr	%r12, %r13, %wstate
DS_2_203:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
memptr_2_204:
	set user_data_start, %r31
	.word 0x85826268  ! 287: WRCCR_I	wr	%r9, 0x0268, %ccr
	.word 0x20800001  ! 288: BN	bn,a	<label_0x1>
pmu_2_205:
	nop
	setx 0xfffff64dfffff1fe, %g1, %g7
	.word 0xa3800007  ! 289: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_206) + 56, 16, 16)) -> intp(0,0,9)
intvec_2_206:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_207:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 291: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8d903331  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x1331, %pstate
	.word 0xda37e0b8  ! 293: STH_I	sth	%r13, [%r31 + 0x00b8]
DS_2_208:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 294: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 296: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01967  ! 297: FqTOd	dis not found

debug_2_211:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 298: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_2_212:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d914013  ! 299: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91697bea  ! 300: SDIVX_I	sdivx	%r5, 0xfffffbea, %r8
	.word 0xa3a409ca  ! 301: FDIVd	fdivd	%f16, %f10, %f48
	.word 0x8d902d71  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x0d71, %pstate
intveclr_2_214:
	setx 0x60e3f950bf89a9c2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01973  ! 304: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_216
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_216:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 305: RDPC	rd	%pc, %r9
intveclr_2_217:
	setx 0x7df7052265b5134f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93500000  ! 307: RDPR_TPC	<illegal instruction>
	.word 0x95a209c6  ! 308: FDIVd	fdivd	%f8, %f6, %f10
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_218:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 309: RDPC	rd	%pc, %r8
donret_2_219:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_219-donret_2_219-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xfb0, %tstate
    wrhpr %g0, 0x9d4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_219:
	.word 0xe6ffe4a4  ! 310: SWAPA_I	swapa	%r19, [%r31 + 0x04a4] %asi
	rd %pc, %r19
	add %r19, (ivw_2_220-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_220:
	.word 0x91940010  ! 311: WRPR_PIL_R	wrpr	%r16, %r16, %pil
intveclr_2_221:
	setx 0xd084f5f8413c5936, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d904002  ! 313: WRPR_WSTATE_R	wrpr	%r1, %r2, %wstate
	.word 0xe68008a0  ! 314: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x99454000  ! 315: RD_CLEAR_SOFTINT	rd	%clear_softint, %r12
donret_2_223:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_223-donret_2_223-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x149b, %tstate
    wrhpr %g0, 0x5ce, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_223:
	.word 0xd6ffe4a4  ! 316: SWAPA_I	swapa	%r11, [%r31 + 0x04a4] %asi
intveclr_2_224:
	setx 0x6731092da631fe7b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 317: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_2_225:
	.word 0x81982aee  ! 318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0aee, %hpstate
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
	.word 0x97414000  ! 319: RDPC	rd	%pc, %r11
	.word 0xe607c000  ! 320: LDUW_R	lduw	[%r31 + %r0], %r19
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 321: CASA_R	casa	[%r31] %asi, %r20, %r19
memptr_2_228:
	set user_data_start, %r31
	.word 0x8584f6a7  ! 322: WRCCR_I	wr	%r19, 0x16a7, %ccr
	.word 0x83d02032  ! 323: Tcc_I	te	icc_or_xcc, %r0 + 50
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_229:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 324: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0x8d902da9  ! 325: WRPR_PSTATE_I	wrpr	%r0, 0x0da9, %pstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_230:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 326: RDPC	rd	%pc, %r12
mondo_2_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d900008  ! 327: WRPR_WSTATE_R	wrpr	%r0, %r8, %wstate
debug_2_232:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 328: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_233)+56, 16, 16)) -> intp(2,1,3)
xir_2_233:
	.word 0xa984a0c5  ! 329: WR_SET_SOFTINT_I	wr	%r18, 0x00c5, %set_softint
DS_2_234:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 330: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x99902001  ! 331: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
mondo_2_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e8] %asi
	.word 0x9d90c000  ! 332: WRPR_WSTATE_R	wrpr	%r3, %r0, %wstate
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 333: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_2_236-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_236:
	.word 0x91948005  ! 334: WRPR_PIL_R	wrpr	%r18, %r5, %pil
DS_2_237:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902005  ! 335: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd01fff3e  ! 336: LDD_I	ldd	[%r31 + 0xffffff3e], %r8
	.word 0x8d903a1c  ! 337: WRPR_PSTATE_I	wrpr	%r0, 0x1a1c, %pstate
	.word 0xd03fff3e  ! 338: STD_I	std	%r8, [%r31 + 0xffffff3e]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a0196c  ! 339: FqTOd	dis not found

	.word 0x8d902992  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x0992, %pstate
pmu_2_239:
	nop
	setx 0xfffff27ffffffdfd, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_240:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 342: RDPC	rd	%pc, %r11
mondo_2_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d92c009  ! 343: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
intveclr_2_242:
	setx 0xba73c885e0cfe68a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97454000  ! 345: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
mondo_2_243:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d930013  ! 346: WRPR_WSTATE_R	wrpr	%r12, %r19, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01968  ! 347: FqTOd	dis not found

	.word 0x95540000  ! 348: RDPR_GL	<illegal instruction>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_245
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_245:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e001  ! 349: CASA_R	casa	[%r31] %asi, %r1, %r8
	.word 0x97a0016a  ! 350: FABSq	dis not found

memptr_2_246:
	set user_data_start, %r31
	.word 0x8580e3b9  ! 351: WRCCR_I	wr	%r3, 0x03b9, %ccr
	.word 0xd477c000  ! 352: STX_R	stx	%r10, [%r31 + %r0]
	.word 0x8d902673  ! 353: WRPR_PSTATE_I	wrpr	%r0, 0x0673, %pstate
memptr_2_247:
	set 0x60540000, %r31
	.word 0x8584ef9d  ! 354: WRCCR_I	wr	%r19, 0x0f9d, %ccr
	.word 0xd46ff8e6  ! 355: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
    set 0x2a2e, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x99b407f4  ! 356: PDISTN	fmean16	%d16, %d20, %d12
mondo_2_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e0] %asi
	.word 0x9d94c013  ! 357: WRPR_WSTATE_R	wrpr	%r19, %r19, %wstate
	.word 0x26800001  ! 358: BL	bl,a	<label_0x1>
pmu_2_249:
	nop
	setx 0xfffffab4fffff148, %g1, %g7
	.word 0xa3800007  ! 359: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46ff8e6  ! 360: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
change_to_randtl_2_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_250:
	.word 0x8f902002  ! 361: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
debug_2_251:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_252
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_252:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e007  ! 363: CASA_R	casa	[%r31] %asi, %r7, %r10
debug_2_253:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 364: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99902005  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_254)+8, 16, 16)) -> intp(2,1,3)
xir_2_254:
	.word 0xa98223ac  ! 366: WR_SET_SOFTINT_I	wr	%r8, 0x03ac, %set_softint
	.word 0x8d90214b  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x014b, %pstate
intveclr_2_255:
	setx 0xf08f5204bc446b69, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 368: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa550c000  ! 369: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_256
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_256:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 370: RDPC	rd	%pc, %r9
	.word 0x99500000  ! 371: RDPR_TPC	<illegal instruction>
	.word 0x9b45c000  ! 372: RD_TICK_CMPR_REG	rd	%-, %r13
splash_cmpr_2_257:
	setx 0x1f74280dc1010c38, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_258:
	setx 0x15b9d86c450c3036, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 374: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x3a3ff2933b88d31a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_259:
	.word 0x39400001  ! 375: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x95480000  ! 376: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_260:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 377: CASA_R	casa	[%r31] %asi, %r7, %r19
mondo_2_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d95000a  ! 378: WRPR_WSTATE_R	wrpr	%r20, %r10, %wstate
intveclr_2_262:
	setx 0x9a76ad3eb4e92ee3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 380: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe68008a0  ! 381: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe63fc000  ! 382: STD_R	std	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_2_264-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_264:
	.word 0x9192c00d  ! 383: WRPR_PIL_R	wrpr	%r11, %r13, %pil
splash_cmpr_2_265:
	setx 0x8206f0c961f4ea92, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 384: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 385: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0xaf998e047ab92c5e, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_267:
	.word 0x39400001  ! 386: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903dce  ! 387: WRPR_PSTATE_I	wrpr	%r0, 0x1dce, %pstate
	.word 0x28700001  ! 388: BPLEU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_268:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 389: RDPC	rd	%pc, %r13
	.word 0xad8136ae  ! 390: WR_SOFTINT_REG_I	wr	%r4, 0x16ae, %softint
splash_decr_2_269:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa7814002  ! 391: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r2, %-
DS_2_270:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd9343306  ! 1: STQF_I	-	%f12, [0x1306, %r16]
	normalw
	.word 0x95458000  ! 392: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xe537c000  ! 393: STQF_R	-	%f18, [%r0, %r31]
intveclr_2_271:
	setx 0xae980ca886aff5b2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_272:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 395: RDPC	rd	%pc, %r10
mondo_2_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d918000  ! 396: WRPR_WSTATE_R	wrpr	%r6, %r0, %wstate
	.word 0xe08008a0  ! 397: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x26800001  ! 398: BL	bl,a	<label_0x1>
splash_cmpr_2_274:
	setx 0xa2b38036990fafe2, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56c2551  ! 400: SDIVX_I	sdivx	%r16, 0x0551, %r18
DS_2_276:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
intveclr_2_277:
	setx 0xa103b1e59a2f4974, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 402: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_278:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 403: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
pmu_2_279:
	nop
	setx 0xfffff7bdfffff363, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_2_280-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_280:
	.word 0x91944006  ! 405: WRPR_PIL_R	wrpr	%r17, %r6, %pil
debug_2_281:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 406: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_2_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_282-donret_2_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x17c5, %tstate
    wrhpr %g0, 0x39e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_282:
	.word 0xe6ffe2b9  ! 407: SWAPA_I	swapa	%r19, [%r31 + 0x02b9] %asi
mondo_2_283:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d948002  ! 408: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
splash_tba_2_284:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 409: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_2_285:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r19, [%r1] 0x45
	.word 0xa7840005  ! 410: WR_GRAPHICS_STATUS_REG_R	wr	%r16, %r5, %-
	.word 0xa9a00174  ! 411: FABSq	dis not found

intveclr_2_286:
	setx 0x847555db51cc97db, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 412: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_2_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_2_287:
	.word 0x8f902002  ! 413: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_2_288:
	tsubcctv %r8, 0x152a, %r11
	.word 0xd207e2b9  ! 414: LDUW_I	lduw	[%r31 + 0x02b9], %r9
	.word 0x91d020b5  ! 415: Tcc_I	ta	icc_or_xcc, %r0 + 181
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 416: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903c44  ! 417: WRPR_PSTATE_I	wrpr	%r0, 0x1c44, %pstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_289
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_289:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 418: RDPC	rd	%pc, %r9
tagged_2_290:
	tsubcctv %r23, 0x11e8, %r23
	.word 0xe407e2b9  ! 419: LDUW_I	lduw	[%r31 + 0x02b9], %r18
	.word 0x99a00169  ! 420: FABSq	dis not found

memptr_2_291:
	set user_data_start, %r31
	.word 0x858473be  ! 421: WRCCR_I	wr	%r17, 0x13be, %ccr
splash_cmpr_2_292:
	setx 0xcaa272fc674de823, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 422: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_2_293:
	.word 0x93a249d4  ! 1: FDIVd	fdivd	%f40, %f20, %f40
	.word 0xbfe7c000  ! 423: SAVE_R	save	%r31, %r0, %r31
	.word 0xd8dfe030  ! 424: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
	.word 0x93a149d2  ! 425: FDIVd	fdivd	%f36, %f18, %f40
memptr_2_294:
	set user_data_start, %r31
	.word 0x858077b5  ! 426: WRCCR_I	wr	%r1, 0x17b5, %ccr
donret_2_295:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_295-donret_2_295-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1aca, %tstate
    wrhpr %g0, 0x395, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_295:
	.word 0xd6fff6a7  ! 427: SWAPA_I	swapa	%r11, [%r31 + 0xfffff6a7] %asi
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_296:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 428: CASA_R	casa	[%r31] %asi, %r1, %r11
mondo_2_297:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d8] %asi
	.word 0x9d90c001  ! 429: WRPR_WSTATE_R	wrpr	%r3, %r1, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01966  ! 430: FqTOd	dis not found

	.word 0xa9a00168  ! 431: FABSq	dis not found

tagged_2_299:
	taddcctv %r25, 0x16e5, %r15
	.word 0xe407f6a7  ! 432: LDUW_I	lduw	[%r31 + 0xfffff6a7], %r18
	.word 0x9ba00172  ! 433: FABSq	dis not found

	.word 0x99540000  ! 434: RDPR_GL	rdpr	%-, %r12
splash_cmpr_2_300:
	setx 0x110299ad5834df48, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 435: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_decr_2_301:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r17, [%r1] 0x45
	.word 0xa7850004  ! 436: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r4, %-
	.word 0xda8008a0  ! 437: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
pmu_2_302:
	nop
	setx 0xfffff15efffff2ad, %g1, %g7
	.word 0xa3800007  ! 438: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_2_303:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 439: RESTORE_R	restore	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_304) + 0, 16, 16)) -> intp(4,0,27)
intvec_2_304:
	.word 0x39400001  ! 440: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ff6a7  ! 441: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff6a7]
	.word 0xda8fe010  ! 442: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
intveclr_2_305:
	setx 0x5dcbff2ad2215cf4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 443: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_2_306:
	set user_data_start, %r31
	.word 0x8580fcf6  ! 444: WRCCR_I	wr	%r3, 0x1cf6, %ccr
	.word 0xda6ffae0  ! 445: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffae0]
intveclr_2_307:
	setx 0x5ee727b995953524, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_2_308:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 447: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_2_309-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_309:
	.word 0x9191400c  ! 448: WRPR_PIL_R	wrpr	%r5, %r12, %pil
splash_tba_2_310:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 449: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9a449cb  ! 450: FDIVd	fdivd	%f48, %f42, %f20
	rd %pc, %r19
	add %r19, (ivw_2_311-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_311:
	.word 0x91918003  ! 451: WRPR_PIL_R	wrpr	%r6, %r3, %pil
	rd %pc, %r19
	add %r19, (ivw_2_312-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_312:
	.word 0x91928002  ! 452: WRPR_PIL_R	wrpr	%r10, %r2, %pil
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 453: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f803e02  ! 454: SIR	sir	0x1e02
	.word 0xd46ffb56  ! 455: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
	.word 0xd46ffb56  ! 456: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
pmu_2_313:
	nop
	setx 0xfffff762fffff685, %g1, %g7
	.word 0xa3800007  ! 457: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_2_314:
	set 0x60140000, %r31
	.word 0x8584e589  ! 458: WRCCR_I	wr	%r19, 0x0589, %ccr
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 459: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_2_315:
	setx 0x02824ac07a76b61b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 460: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_2_316:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_316-donret_2_316), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x990, %tstate
    wrhpr %g0, 0xc0d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_316:
	.word 0xd4fffcce  ! 461: SWAPA_I	swapa	%r10, [%r31 + 0xfffffcce] %asi
	.word 0x91912357  ! 462: WRPR_PIL_I	wrpr	%r4, 0x0357, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 463: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd53fc000  ! 464: STDF_R	std	%f10, [%r0, %r31]
	.word 0xd4dfe000  ! 465: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
mondo_2_317:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d92c008  ! 466: WRPR_WSTATE_R	wrpr	%r11, %r8, %wstate
mondo_2_318:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d0] %asi
	.word 0x9d94400c  ! 467: WRPR_WSTATE_R	wrpr	%r17, %r12, %wstate
	.word 0x91d020b5  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 181
debug_2_319:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_2_320:
	set 0x60540000, %r31
	.word 0x8582aa15  ! 470: WRCCR_I	wr	%r10, 0x0a15, %ccr
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_321:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 471: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0xd537f470  ! 472: STQF_I	-	%f10, [0x1470, %r31]
splash_cmpr_2_322:
	setx 0xd4a9b361d517fbcf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_323
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_323:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 474: CASA_R	casa	[%r31] %asi, %r0, %r10
mondo_2_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d8] %asi
	.word 0x9d94800c  ! 475: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
splash_hpstate_2_325:
	.word 0x81982716  ! 476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0716, %hpstate
	.word 0x97a189d1  ! 477: FDIVd	fdivd	%f6, %f48, %f42
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_326
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_326:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 478: RDPC	rd	%pc, %r8
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_327
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_327:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 479: CASA_R	casa	[%r31] %asi, %r13, %r18
	.word 0x30700001  ! 480: BPA	<illegal instruction>
intveclr_2_328:
	setx 0x2c7723f425012e38, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 481: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x40f50655c3f8d0ec, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_329:
	.word 0x39400001  ! 482: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_2_330:
	nop
	setx 0xfffffe95fffff04a, %g1, %g7
	.word 0xa3800007  ! 483: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_2_331:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 484: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_2_332:
	nop
	setx 0xfffffff3fffffa74, %g1, %g7
	.word 0xa3800007  ! 485: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa7480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xdb27c000  ! 487: STF_R	st	%f13, [%r0, %r31]
pmu_2_333:
	nop
	setx 0xfffff045fffff711, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_2_334:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_334-donret_2_334), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x612, %tstate
    wrhpr %g0, 0x7dc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	retry
donretarg_2_334:
	.word 0xdafff470  ! 489: SWAPA_I	swapa	%r13, [%r31 + 0xfffff470] %asi
	rd %pc, %r19
	add %r19, (ivw_2_335-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_335:
	.word 0x91900012  ! 490: WRPR_PIL_R	wrpr	%r0, %r18, %pil
debug_2_336:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 491: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_337
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_337:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 492: CASA_R	casa	[%r31] %asi, %r12, %r13
memptr_2_338:
	set 0x60740000, %r31
	.word 0x8584e3b0  ! 493: WRCCR_I	wr	%r19, 0x03b0, %ccr
debug_2_339:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 494: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xda8008a0  ! 495: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda800bc0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r13
	.word 0xda97e000  ! 497: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
change_to_randtl_2_340:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_340:
	.word 0x8f902000  ! 498: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x2d03, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0xa3b307e6  ! 499: PDISTN	fmean16	%d12, %d6, %d48
pmu_2_341:
	nop
	setx 0xfffffd48fffff9e3, %g1, %g7
	.word 0xa3800007  ! 500: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_342
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_342:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 501: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_htba_2_343:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 502: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_344
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_344
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_344:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 503: RDPC	rd	%pc, %r8
	setx 0x29a4c91de8f2fead, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_345:
	.word 0x39400001  ! 504: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_2_346:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_346-donret_2_346), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xc1c, %tstate
    wrhpr %g0, 0xf45, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (2)
	retry
donretarg_2_346:
	.word 0xe6ffefb6  ! 505: SWAPA_I	swapa	%r19, [%r31 + 0x0fb6] %asi
	.word 0x91d020b2  ! 506: Tcc_I	ta	icc_or_xcc, %r0 + 178
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 507: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01961  ! 508: FqTOd	dis not found

cwp_2_348:
    set user_data_start, %o7
	.word 0x93902006  ! 509: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
cwp_2_349:
    set user_data_start, %o7
	.word 0x93902001  ! 510: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	rd %pc, %r19
	add %r19, (ivw_2_350-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_350:
	.word 0x9191400b  ! 511: WRPR_PIL_R	wrpr	%r5, %r11, %pil
	.word 0x91450000  ! 512: RD_SET_SOFTINT	rd	%set_softint, %r8
intveclr_2_351:
	setx 0xccb14f609ef46dd1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 513: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda57c000  ! 514: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916d2188  ! 515: SDIVX_I	sdivx	%r20, 0x0188, %r8
memptr_2_353:
	set 0x60340000, %r31
	.word 0x8584a02f  ! 516: WRCCR_I	wr	%r18, 0x002f, %ccr
	.word 0xe4bfe44b  ! 517: STDA_I	stda	%r18, [%r31 + 0x044b] %asi
	.word 0x91d02033  ! 518: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1464000  ! 519: RD_STICK_CMPR_REG	rd	%-, %r16
intveclr_2_354:
	setx 0x1e6b5f06ad93b530, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 520: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_355:
	nop
	setx 0xfffff749fffff166, %g1, %g7
	.word 0xa3800007  ! 521: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93a049c0  ! 522: FDIVd	fdivd	%f32, %f0, %f40
intveclr_2_356:
	setx 0x997139ee35bce64b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 523: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 524: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
intveclr_2_357:
	setx 0xc89aa55ce31f57c3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95500000  ! 526: RDPR_TPC	rdpr	%tpc, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_358) + 56, 16, 16)) -> intp(4,0,20)
intvec_2_358:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_2_359:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 528: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_2_360:
	.word 0x93a049d4  ! 1: FDIVd	fdivd	%f32, %f20, %f40
	.word 0xe734f922  ! 1: STQF_I	-	%f19, [0x1922, %r19]
	normalw
	.word 0xa5458000  ! 529: RD_SOFTINT_REG	rd	%softint, %r18
debug_2_361:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 530: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd08008a0  ! 531: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa3450000  ! 532: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0xe26ff145  ! 533: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
	.word 0xe26ff145  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
mondo_2_362:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d934009  ! 535: WRPR_WSTATE_R	wrpr	%r13, %r9, %wstate
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 536: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe2800ba0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r17
intveclr_2_363:
	setx 0xb2beba92bf409c64, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 538: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d924006  ! 539: WRPR_WSTATE_R	wrpr	%r9, %r6, %wstate
	.word 0xe21fc000  ! 540: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x99902001  ! 541: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xe337f145  ! 542: STQF_I	-	%f17, [0x1145, %r31]
DS_2_365:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 543: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	rd %pc, %r19
	add %r19, (ivw_2_366-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_366:
	.word 0x9192c00d  ! 544: WRPR_PIL_R	wrpr	%r11, %r13, %pil
	.word 0xe247f145  ! 545: LDSW_I	ldsw	[%r31 + 0xfffff145], %r17
donret_2_367:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_2_367-donret_2_367-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xcc, %tstate
    wrhpr %g0, 0xdd4, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (2)
	done
donretarg_2_367:
	.word 0xe2fff145  ! 546: SWAPA_I	swapa	%r17, [%r31 + 0xfffff145] %asi
mondo_2_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d95000c  ! 547: WRPR_WSTATE_R	wrpr	%r20, %r12, %wstate
DS_2_369:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xa5b50307  ! 548: ALIGNADDRESS	alignaddr	%r20, %r7, %r18
	.word 0x91d02035  ! 549: Tcc_I	ta	icc_or_xcc, %r0 + 53
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_370
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_370:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 550: CASA_R	casa	[%r31] %asi, %r3, %r8
	setx 0x2e565c888d9218da, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_371:
	.word 0x39400001  ! 551: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd09ff145  ! 552: LDDA_I	ldda	[%r31, + 0xfffff145] %asi, %r8
splash_lsu_2_372:
	setx 0x2d1a8ef37d0c3c9f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 553: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_2_373:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 554: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9968331a  ! 555: SDIVX_I	sdivx	%r0, 0xfffff31a, %r12
	.word 0xd137c000  ! 556: STQF_R	-	%f8, [%r0, %r31]
	.word 0xd00fe46f  ! 557: LDUB_I	ldub	[%r31 + 0x046f], %r8
	.word 0xd077e46f  ! 558: STX_I	stx	%r8, [%r31 + 0x046f]
splash_decr_2_375:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r16, [%r1] 0x45
	.word 0xa7814006  ! 559: WR_GRAPHICS_STATUS_REG_R	wr	%r5, %r6, %-
splash_cmpr_2_376:
	setx 0x31e63378afe1fceb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 560: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa3a509ca  ! 561: FDIVd	fdivd	%f20, %f10, %f48
mondo_2_377:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c0] %asi
	.word 0x9d910011  ! 562: WRPR_WSTATE_R	wrpr	%r4, %r17, %wstate
cwp_2_378:
    set user_data_start, %o7
	.word 0x93902003  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_379:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 564: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x93a00160  ! 565: FABSq	dis not found

	.word 0x93520000  ! 566: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_380
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_380:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 567: RDPC	rd	%pc, %r8
mondo_2_381:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d91c004  ! 568: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
mondo_2_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c0] %asi
	.word 0x9d92c001  ! 569: WRPR_WSTATE_R	wrpr	%r11, %r1, %wstate
	.word 0xd03fe46f  ! 570: STD_I	std	%r8, [%r31 + 0x046f]
	.word 0xa9a00174  ! 571: FABSq	dis not found

	.word 0xe06fe46f  ! 572: LDSTUB_I	ldstub	%r16, [%r31 + 0x046f]
debug_2_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 573: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02034  ! 574: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe08fe010  ! 575: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r16
intveclr_2_384:
	setx 0x5397f7ff05765a37, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 576: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 577: Tcc_I	ta	icc_or_xcc, %r0 + 51
debug_2_385:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 578: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_386:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 579: CASA_R	casa	[%r31] %asi, %r10, %r16
debug_2_387:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 580: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
pmu_2_388:
	nop
	setx 0xfffff1cafffffc99, %g1, %g7
	.word 0xa3800007  ! 581: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_2_389-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_389:
	.word 0x91920014  ! 582: WRPR_PIL_R	wrpr	%r8, %r20, %pil
change_to_randtl_2_390:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_2_390:
	.word 0x8f902002  ! 583: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a0196c  ! 584: FqTOd	dis not found

	.word 0x36700001  ! 585: BPGE	<illegal instruction>
mondo_2_392:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d94c012  ! 586: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96b26bf  ! 587: SDIVX_I	sdivx	%r12, 0x06bf, %r20
	.word 0x99a00170  ! 588: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_394
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_394:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 589: RDPC	rd	%pc, %r11
	.word 0xd0dfe000  ! 590: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	.word 0xd0d7e010  ! 591: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
	setx 0xfdd32f09d75b6cba, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_395:
	.word 0x39400001  ! 592: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_396:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 593: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_2_397:
	setx 0x94e82dd663743367, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 594: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_2_398:
	nop
	setx 0xfffff68bfffff939, %g1, %g7
	.word 0xa3800007  ! 595: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02035  ! 596: Tcc_I	ta	icc_or_xcc, %r0 + 53
intveclr_2_399:
	setx 0x629e66edb70a010d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 597: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd03fe06b  ! 598: STD_I	std	%r8, [%r31 + 0x006b]
debug_2_400:
	nop
	rd %pc, %r19
	add %r19, (64+48), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 599: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_2_401-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_401:
	.word 0x91940012  ! 600: WRPR_PIL_R	wrpr	%r16, %r18, %pil
mondo_2_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3d0] %asi
	.word 0x9d944014  ! 601: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0xa3a109c0  ! 602: FDIVd	fdivd	%f4, %f0, %f48
intveclr_2_403:
	setx 0x72c18032e5a99f01, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 603: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 604: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01973  ! 605: FqTOd	dis not found

    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 606: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0xe737e06b  ! 607: STQF_I	-	%f19, [0x006b, %r31]
pmu_2_407:
	nop
	setx 0xfffff7b3ffffff99, %g1, %g7
	.word 0xa3800007  ! 608: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_2_408-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_408:
	.word 0x91934013  ! 609: WRPR_PIL_R	wrpr	%r13, %r19, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01970  ! 610: FqTOd	dis not found

	.word 0xd737c000  ! 611: STQF_R	-	%f11, [%r0, %r31]
debug_2_410:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 612: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996cf94b  ! 613: SDIVX_I	sdivx	%r19, 0xfffff94b, %r12
	.word 0x81510000  ! 614: RDPR_TICK	rdpr	%tick, %r0
	.word 0x93d02035  ! 615: Tcc_I	tne	icc_or_xcc, %r0 + 53
debug_2_412:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe88008a0  ! 617: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
pmu_2_413:
	nop
	setx 0xfffff6defffff4b1, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99902002  ! 619: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_cmpr_2_414:
	setx 0x3679a5e478d5c893, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 620: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_415:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 621: RDPC	rd	%pc, %r9
splash_lsu_2_416:
	setx 0xbeac76be88173836, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 622: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd477f103  ! 623: STX_I	stx	%r10, [%r31 + 0xfffff103]
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_417
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_417:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 624: RDPC	rd	%pc, %r11
	.word 0x91d02034  ! 625: Tcc_I	ta	icc_or_xcc, %r0 + 52
intveclr_2_418:
	setx 0x8d30b38fdeb8235f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 626: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a509d4  ! 627: FDIVd	fdivd	%f20, %f20, %f12
DS_2_419:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 628: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xab82000c  ! 629: WR_CLEAR_SOFTINT_R	wr	%r8, %r12, %clear_softint
splash_cmpr_2_420:
	setx 0xb0b18da041f02904, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 630: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_2_421-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_421:
	.word 0x91940009  ! 631: WRPR_PIL_R	wrpr	%r16, %r9, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_422)+0, 16, 16)) -> intp(2,1,3)
xir_2_422:
	.word 0xa980bfa4  ! 632: WR_SET_SOFTINT_I	wr	%r2, 0x1fa4, %set_softint
mondo_2_423:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d934007  ! 633: WRPR_WSTATE_R	wrpr	%r13, %r7, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_424
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_424:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 634: CASA_R	casa	[%r31] %asi, %r3, %r11
debug_2_425:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 635: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_2_426:
	setx 0x93f9d68668a3ccd8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 636: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_2_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d904013  ! 637: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916b69d6  ! 638: SDIVX_I	sdivx	%r13, 0x09d6, %r8
intveclr_2_429:
	setx 0xf02707c0a8a17b57, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 639: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_430:
	setx 0x4b978d9d63ad1331, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 640: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x3ec5cd71c676e548, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_431:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_432:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d94800d  ! 642: WRPR_WSTATE_R	wrpr	%r18, %r13, %wstate
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_433
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_433
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_433:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 643: RDPC	rd	%pc, %r12
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_434
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_434:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 644: CASA_R	casa	[%r31] %asi, %r4, %r18
	setx 0x7ac4f74e65ba3081, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_435:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_436:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 646: CASA_R	casa	[%r31] %asi, %r4, %r18
splash_cmpr_2_437:
	setx 0xaad7e83ddbd6d0e8, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 647: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_2_438:
	setx 0x75464c4e100ca2b9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 648: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 649: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
DS_2_439:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa1a00550  ! 1: FSQRTd	fsqrt	
	.word 0x97a34830  ! 650: FADDs	fadds	%f13, %f16, %f11
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_2_440:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 652: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x95520000  ! 653: RDPR_PIL	<illegal instruction>
	setx 0x8239583dec4022bb, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_441:
	.word 0x39400001  ! 654: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_442:
	setx 0x1ccc95b5bab19c93, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 655: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_2_443:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 656: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_444
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_444:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 657: CASA_R	casa	[%r31] %asi, %r9, %r12
memptr_2_445:
	set 0x60340000, %r31
	.word 0x858433dc  ! 658: WRCCR_I	wr	%r16, 0x13dc, %ccr
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_446
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_446
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_446:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 659: RDPC	rd	%pc, %r18
splash_cmpr_2_447:
	setx 0x7b0fc05b6167cf55, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 660: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_448:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e009  ! 661: CASA_R	casa	[%r31] %asi, %r9, %r13
	rd %pc, %r19
	add %r19, (ivw_2_449-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_449:
	.word 0x91944013  ! 662: WRPR_PIL_R	wrpr	%r17, %r19, %pil
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01973  ! 663: FqTOd	dis not found

	.word 0x93a00166  ! 664: FABSq	dis not found

debug_2_451:
	nop
	rd %pc, %r19
	add %r19, (64+32), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 665: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_2_452-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_2_452:
	.word 0x91904010  ! 666: WRPR_PIL_R	wrpr	%r1, %r16, %pil
	.word 0xda6fe48d  ! 667: LDSTUB_I	ldstub	%r13, [%r31 + 0x048d]
	.word 0x9f80395a  ! 668: SIR	sir	0x195a
mondo_2_453:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d904009  ! 669: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
	.word 0x8d902253  ! 670: WRPR_PSTATE_I	wrpr	%r0, 0x0253, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01967  ! 671: FqTOd	dis not found

	.word 0x93a4c9ca  ! 672: FDIVd	fdivd	%f50, %f10, %f40
memptr_2_455:
	set 0x60540000, %r31
	.word 0x8581b8d6  ! 673: WRCCR_I	wr	%r6, 0x18d6, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 674: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_2_456:
	setx 0x2ea31fdc425fc9db, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 675: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x260d51cf84abb4ab, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_457:
	.word 0x39400001  ! 676: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_2_458:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 677: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_2_459:
	set 0x003e0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003e0000, %r12
	.word 0x8b90000c  ! 678: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (2+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_2_460
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_2_460
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_2_460:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 679: RDPC	rd	%pc, %r17
	setx 0x3889ec5c2dc45c82, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_461:
	.word 0x39400001  ! 680: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_2_462:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d940009  ! 681: WRPR_WSTATE_R	wrpr	%r16, %r9, %wstate
    mov (2+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_2_463
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_2_463:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 682: CASA_R	casa	[%r31] %asi, %r17, %r16
cwp_2_464:
    set user_data_start, %o7
	.word 0x93902006  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
debug_2_465:
	nop
	mov 8, %r18
	.word 0xdcf00492  ! 684: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_2_466)+40, 16, 16)) -> intp(2,1,3)
xir_2_466:
	.word 0xa9853913  ! 685: WR_SET_SOFTINT_I	wr	%r20, 0x1913, %set_softint
	.word 0x91a0016b  ! 686: FABSq	dis not found

debug_2_467:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 687: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b464000  ! 688: RD_STICK_CMPR_REG	rd	%-, %r13
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_2_468) + 8, 16, 16)) -> intp(3,0,27)
intvec_2_468:
	.word 0x39400001  ! 689: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 690: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_2_469:
	set 0x60340000, %r31
	.word 0x858068c0  ! 691: WRCCR_I	wr	%r1, 0x08c0, %ccr
splash_cmpr_2_470:
	setx 0x907b0f2e610c1dac, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 692: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_2_471:
	nop
	setx 0xfffff6dcffffff61, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_2_472:
	setx 0xc09c3ca584d792a6, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 694: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xc9a825eb2f725085, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_473:
	.word 0x39400001  ! 695: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_2_474:
	setx 0x6f35b27f733761e6, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 696: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_2_475:
	setx 0xd00108e6f5c4ce1b, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 697: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_2_476:
	setx 0x58f1b1544240a617, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 698: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xd10a2bff94cda953, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_2_477:
	.word 0x39400001  ! 699: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba409c2  ! 700: FDIVd	fdivd	%f16, %f2, %f44
splash_tba_2_478:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 701: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	invalw
	mov 0x33, %r30
splash_cmpr_1_0:
	setx 0xdc08182a39594f28, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_1:
	setx 0xc24a535cf618987c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_2:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 3: RDPC	rd	%pc, %r13
	.word 0x93d020b5  ! 4: Tcc_I	tne	icc_or_xcc, %r0 + 181
splash_hpstate_1_3:
	.word 0x819826a4  ! 5: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06a4, %hpstate
donret_1_4:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_4-donret_1_4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1865, %tstate
    wrhpr %g0, 0xd1c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_4:
	.word 0xe6ffee7d  ! 6: SWAPA_I	swapa	%r19, [%r31 + 0x0e7d] %asi
	.word 0x38700001  ! 7: BPGU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_5:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 8: RDPC	rd	%pc, %r18
	.word 0xa5a489c9  ! 9: FDIVd	fdivd	%f18, %f40, %f18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a0196c  ! 10: FqTOd	dis not found

mondo_1_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c0] %asi
	.word 0x9d94c007  ! 11: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
splash_hpstate_1_8:
	.word 0x8198284d  ! 12: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084d, %hpstate
mondo_1_9:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d94000c  ! 13: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
	.word 0xd80fee7d  ! 14: LDUB_I	ldub	[%r31 + 0x0e7d], %r12
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_10:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 15: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa9828013  ! 16: WR_SET_SOFTINT_R	wr	%r10, %r19, %set_softint
	setx 0xf85314d59a7b0623, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa3a00168  ! 18: FABSq	dis not found

	.word 0x91d02034  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 52
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_12) + 32, 16, 16)) -> intp(7,0,26)
intvec_1_12:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_13:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 21: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d903152  ! 22: WRPR_PSTATE_I	wrpr	%r0, 0x1152, %pstate
	.word 0xab844003  ! 23: WR_CLEAR_SOFTINT_R	wr	%r17, %r3, %clear_softint
memptr_1_14:
	set 0x60540000, %r31
	.word 0x858469e1  ! 24: WRCCR_I	wr	%r17, 0x09e1, %ccr
	setx 0x1d9a9492102c9630, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_15:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996c3c85  ! 26: SDIVX_I	sdivx	%r16, 0xfffffc85, %r12
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96c705a  ! 27: SDIVX_I	sdivx	%r17, 0xfffff05a, %r20
mondo_1_18:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d90c003  ! 28: WRPR_WSTATE_R	wrpr	%r3, %r3, %wstate
mondo_1_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d94c00a  ! 29: WRPR_WSTATE_R	wrpr	%r19, %r10, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_20:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e009  ! 30: CASA_R	casa	[%r31] %asi, %r9, %r11
	.word 0xa1a2c9d4  ! 31: FDIVd	fdivd	%f42, %f20, %f16
	.word 0xe2800be0  ! 32: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r17
splash_cmpr_1_21:
	setx 0x885a2101c44cb6f5, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa5a0016a  ! 34: FABSq	dis not found

pmu_1_22:
	nop
	setx 0xfffffa1efffffba5, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_1_23:
	nop
	setx 0xfffff650fffff59a, %g1, %g7
	.word 0xa3800007  ! 36: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_1_24:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_24:
	.word 0x8f902002  ! 37: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_25:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 38: RDPC	rd	%pc, %r10
	.word 0xab816fec  ! 39: WR_CLEAR_SOFTINT_I	wr	%r5, 0x0fec, %clear_softint
memptr_1_26:
	set 0x60740000, %r31
	.word 0x85813a3d  ! 40: WRCCR_I	wr	%r4, 0x1a3d, %ccr
	rd %pc, %r19
	add %r19, (ivw_1_27-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_27:
	.word 0x9194c006  ! 41: WRPR_PIL_R	wrpr	%r19, %r6, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56abd4f  ! 42: SDIVX_I	sdivx	%r10, 0xfffffd4f, %r18
intveclr_1_29:
	setx 0x70f1cbfb86b319e5, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_30) + 56, 16, 16)) -> intp(4,0,10)
intvec_1_30:
	.word 0x39400001  ! 44: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_31:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 45: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01969  ! 46: FqTOd	dis not found

	setx 0xf46e819b0d5381b4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_33:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_34:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 48: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_1_35:
	setx 0xc5036b3b610cd935, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 49: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_1_36:
	.word 0x81982474  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0474, %hpstate
	.word 0xa1a00167  ! 51: FABSq	dis not found

	.word 0x8d903dd7  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x1dd7, %pstate
	rd %pc, %r19
	add %r19, (ivw_1_37-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_37:
	.word 0x91920010  ! 53: WRPR_PIL_R	wrpr	%r8, %r16, %pil
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_38:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 54: RDPC	rd	%pc, %r17
	.word 0x99a00173  ! 55: FABSq	dis not found

debug_1_39:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 56: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
splash_cmpr_1_40:
	setx 0x5d954a76ec338017, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 57: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd31fc000  ! 58: LDDF_R	ldd	[%r31, %r0], %f9
debug_1_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 59: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_42:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 60: RDPC	rd	%pc, %r8
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_43:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 61: RDPC	rd	%pc, %r16
	.word 0xd537fc6d  ! 62: STQF_I	-	%f10, [0x1c6d, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01970  ! 63: FqTOd	dis not found

pmu_1_45:
	nop
	setx 0xfffff597fffff20d, %g1, %g7
	.word 0xa3800007  ! 64: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d94c010  ! 65: WRPR_WSTATE_R	wrpr	%r19, %r16, %wstate
DS_1_47:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd932c010  ! 1: STQF_R	-	%f12, [%r16, %r11]
	normalw
	.word 0x91458000  ! 66: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xe0c7e020  ! 67: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_48) + 16, 16, 16)) -> intp(1,0,3)
intvec_1_48:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_1_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_49-donret_1_49-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x9aa, %tstate
    wrhpr %g0, 0xec6, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_49:
	.word 0xe0fffc6d  ! 69: SWAPA_I	swapa	%r16, [%r31 + 0xfffffc6d] %asi
	.word 0x8d903564  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x1564, %pstate
pmu_1_50:
	nop
	setx 0xfffff04dfffff34d, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916d34c3  ! 72: SDIVX_I	sdivx	%r20, 0xfffff4c3, %r8
	.word 0x91d02033  ! 73: Tcc_I	ta	icc_or_xcc, %r0 + 51
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_52:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e002  ! 74: CASA_R	casa	[%r31] %asi, %r2, %r11
mondo_1_53:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d914014  ! 75: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
memptr_1_54:
	set user_data_start, %r31
	.word 0x85846379  ! 76: WRCCR_I	wr	%r17, 0x0379, %ccr
splash_lsu_1_55:
	setx 0x3fa0c5206a84927f, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 77: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_56:
	.word 0x81982b97  ! 78: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b97, %hpstate
splash_cmpr_1_57:
	setx 0x37ca8516b3744d08, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 79: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 80: BPGE	<illegal instruction>
pmu_1_58:
	nop
	setx 0xfffffa12fffff625, %g1, %g7
	.word 0xa3800007  ! 81: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_59:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 82: RDPC	rd	%pc, %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01968  ! 83: FqTOd	dis not found

splash_cmpr_1_61:
	setx 0x5aca350f9dd62258, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 84: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe927f7c3  ! 85: STF_I	st	%f20, [0x17c3, %r31]
splash_tba_1_62:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_1_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3e0] %asi
	.word 0x9d940002  ! 87: WRPR_WSTATE_R	wrpr	%r16, %r2, %wstate
	.word 0x91d02032  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x99a2c9c3  ! 89: FDIVd	fdivd	%f42, %f34, %f12
	rd %pc, %r19
	add %r19, (ivw_1_64-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_64:
	.word 0x9190400d  ! 90: WRPR_PIL_R	wrpr	%r1, %r13, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_65)+8, 16, 16)) -> intp(1,1,3)
xir_1_65:
	.word 0xa981b439  ! 91: WR_SET_SOFTINT_I	wr	%r6, 0x1439, %set_softint
change_to_randtl_1_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_66:
	.word 0x8f902000  ! 92: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0x2cdf3cf3bdd51332, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_67:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_68) + 48, 16, 16)) -> intp(0,0,27)
intvec_1_68:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902248  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x0248, %pstate
	.word 0xe08008a0  ! 96: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8d902ae9  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0ae9, %pstate
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0c7e010  ! 99: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r16
	setx 0xc1b517b2b046ed50, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_69:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_70:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 101: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 102: RD_STICK_REG	stbar
	rd %pc, %r19
	add %r19, (ivw_1_71-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_71:
	.word 0x91928004  ! 103: WRPR_PIL_R	wrpr	%r10, %r4, %pil
	.word 0x99902004  ! 104: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
change_to_randtl_1_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_72:
	.word 0x8f902001  ! 105: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_1_73:
	setx 0x04a21e11695d8c50, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 107: CASA_R	casa	[%r31] %asi, %r10, %r16
	.word 0x26800001  ! 108: BL	bl,a	<label_0x1>
splash_hpstate_1_75:
	.word 0x81982c77  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c77, %hpstate
intveclr_1_76:
	setx 0x74310b75b2d0c72e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 110: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe00fc000  ! 111: LDUB_R	ldub	[%r31 + %r0], %r16
donret_1_77:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_77-donret_1_77-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xa3b, %tstate
    wrhpr %g0, 0x39d, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	done
donretarg_1_77:
	.word 0xe0ffe388  ! 112: SWAPA_I	swapa	%r16, [%r31 + 0x0388] %asi
change_to_randtl_1_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_78:
	.word 0x8f902000  ! 113: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f803df7  ! 114: SIR	sir	0x1df7
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6cf43f  ! 115: SDIVX_I	sdivx	%r19, 0xfffff43f, %r13
memptr_1_80:
	set 0x60540000, %r31
	.word 0x8580a38b  ! 116: WRCCR_I	wr	%r2, 0x038b, %ccr
mondo_1_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d8] %asi
	.word 0x9d94c001  ! 117: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
DS_1_82:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 118: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	setx 0xa7c6a8987ce26053, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d91c002  ! 120: WRPR_WSTATE_R	wrpr	%r7, %r2, %wstate
	setx 0x67ebcb3a135bb951, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_85:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 122: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
donret_1_86:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_86-donret_1_86), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x9d1, %tstate
    wrhpr %g0, 0x145, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_86:
	.word 0xe8ffecb2  ! 123: SWAPA_I	swapa	%r20, [%r31 + 0x0cb2] %asi
DS_1_87:
	.word 0x97a149d4  ! 1: FDIVd	fdivd	%f36, %f20, %f42
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe5118001  ! 1: LDQF_R	-	[%r6, %r1], %f18
	.word 0x99a14833  ! 124: FADDs	fadds	%f5, %f19, %f12
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_88:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 125: CASA_R	casa	[%r31] %asi, %r16, %r12
splash_cmpr_1_89:
	setx 0xc34dd11bd2b55706, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 126: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_90) + 32, 16, 16)) -> intp(4,0,29)
intvec_1_90:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_91:
	.word 0x8f902002  ! 128: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
intveclr_1_92:
	setx 0xb3c9dd3827ccc727, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x204a, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b187f2  ! 130: PDISTN	fmean16	%d6, %d18, %d42
	.word 0xd477c000  ! 131: STX_R	stx	%r10, [%r31 + %r0]
	setx 0x3a3cea892f44666f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_93:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 133: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_1_94:
	setx 0x0c08d5dbfb5074d4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_95:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 135: CASA_R	casa	[%r31] %asi, %r10, %r10
	.word 0x8d902a7d  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x0a7d, %pstate
	.word 0x99902005  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
memptr_1_96:
	set user_data_start, %r31
	.word 0x8581b068  ! 138: WRCCR_I	wr	%r6, 0x1068, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_97:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 139: RDPC	rd	%pc, %r10
	rd %pc, %r19
	add %r19, (ivw_1_98-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_98:
	.word 0x9192c00d  ! 140: WRPR_PIL_R	wrpr	%r11, %r13, %pil
memptr_1_99:
	set user_data_start, %r31
	.word 0x85813908  ! 141: WRCCR_I	wr	%r4, 0x1908, %ccr
splash_hpstate_1_100:
	.word 0x81982a9f  ! 142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9f, %hpstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_101:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 143: RDPC	rd	%pc, %r9
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_102:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 144: RDPC	rd	%pc, %r12
	.word 0x8d9037da  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x17da, %pstate
	.word 0x3a700001  ! 146: BPCC	<illegal instruction>
    set 0x329c, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b1c7e7  ! 147: PDISTN	fmean16	%d38, %d38, %d42
splash_cmpr_1_103:
	setx 0x4663c895398a04e6, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_104:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xb15fdddf	! Random illegal ?
	.word 0xa9a289cc  ! 1: FDIVd	fdivd	%f10, %f12, %f20
	.word 0x95a4882a  ! 149: FADDs	fadds	%f18, %f10, %f10
mondo_1_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d934011  ! 150: WRPR_WSTATE_R	wrpr	%r13, %r17, %wstate
	.word 0x9350c000  ! 151: RDPR_TT	<illegal instruction>
memptr_1_106:
	set 0x60540000, %r31
	.word 0x8584f328  ! 152: WRCCR_I	wr	%r19, 0x1328, %ccr
	setx 0xc50cf598b8a1a4ec, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_107:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa982c003  ! 154: WR_SET_SOFTINT_R	wr	%r11, %r3, %set_softint
	.word 0xe297e030  ! 155: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_108:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 156: RDPC	rd	%pc, %r13
	setx 0x0c4a5bbee283b862, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_109:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9b480000  ! 158: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x91a00161  ! 159: FABSq	dis not found

DS_1_110:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f16, %f2, %f28
	.word 0x9bb50300  ! 160: ALIGNADDRESS	alignaddr	%r20, %r0, %r13
	.word 0x2a700001  ! 161: BPCS	<illegal instruction>
DS_1_111:
	.word 0xa3a309d4  ! 1: FDIVd	fdivd	%f12, %f20, %f48
	allclean
	.word 0xa1b20313  ! 162: ALIGNADDRESS	alignaddr	%r8, %r19, %r16
debug_1_112:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956b6300  ! 164: SDIVX_I	sdivx	%r13, 0x0300, %r10
	.word 0xe897e000  ! 165: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	.word 0xe8dfe030  ! 166: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_114:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 167: RDPC	rd	%pc, %r8
	.word 0xe48008a0  ! 168: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	rd %pc, %r19
	add %r19, (ivw_1_115-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_115:
	.word 0x91904006  ! 169: WRPR_PIL_R	wrpr	%r1, %r6, %pil
debug_1_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d020b2  ! 171: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_cmpr_1_117:
	setx 0x8b881eb0c6c2a4e7, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_118:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe457fe3c  ! 174: LDSH_I	ldsh	[%r31 + 0xfffffe3c], %r18
tagged_1_119:
	taddcctv %r7, 0x1d64, %r22
	.word 0xe407fe3c  ! 175: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
pmu_1_120:
	nop
	setx 0xfffffc91ffffffa2, %g1, %g7
	.word 0xa3800007  ! 176: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_121:
	setx 0x9219aa1971daafb2, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d948003  ! 178: WRPR_WSTATE_R	wrpr	%r18, %r3, %wstate
tagged_1_123:
	taddcctv %r5, 0x1c83, %r10
	.word 0xe407fe3c  ! 179: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
	.word 0x91d02033  ! 180: Tcc_I	ta	icc_or_xcc, %r0 + 51
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xe45fc000  ! 181: LDX_R	ldx	[%r31 + %r0], %r18
debug_1_124:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_1_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d940011  ! 183: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	rd %pc, %r19
	add %r19, (ivw_1_126-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_126:
	.word 0x91918008  ! 184: WRPR_PIL_R	wrpr	%r6, %r8, %pil
	setx 0x6b94537bc53bc215, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_127:
	.word 0x39400001  ! 185: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_128) + 0, 16, 16)) -> intp(5,0,23)
intvec_1_128:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1a00161  ! 187: FABSq	dis not found

debug_1_129:
	nop
	mov 8, %r18
	.word 0xdef00492  ! 188: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_130:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 189: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_lsu_1_131:
	setx 0xc7a11b1fb96f47c4, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9ba00173  ! 191: FABSq	dis not found

	.word 0xd0cfe010  ! 192: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
intveclr_1_132:
	setx 0xe4cff2fda549292e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 53
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 195: RDPC	rd	%pc, %r20
splash_cmpr_1_134:
	setx 0x5437f921318d4b36, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_135:
	setx 0xd2c9570c2b78c163, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06ffe3c  ! 198: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe3c]
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_136:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 199: CASA_R	casa	[%r31] %asi, %r9, %r16
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_137
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_137:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 200: RDPC	rd	%pc, %r17
	.word 0x3e800001  ! 201: BVC	bvc,a	<label_0x1>
intveclr_1_138:
	setx 0x10f5c0a5e5a7d807, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 202: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_139:
	setx 0xca6d08379b6d94a0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 203: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 204: Tcc_I	tne	icc_or_xcc, %r0 + 51
donret_1_140:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_140-donret_1_140), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1cd1, %tstate
    wrhpr %g0, 0x4d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_140:
	.word 0xd8fffe3c  ! 205: SWAPA_I	swapa	%r12, [%r31 + 0xfffffe3c] %asi
splash_htba_1_141:
	set 0x003b0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r12
	.word 0x8b98000c  ! 206: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_1_142:
	setx 0xd77631d21de555ed, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_1_144:
	.word 0x81982f84  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f84, %hpstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_145:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 210: CASA_R	casa	[%r31] %asi, %r9, %r12
splash_cmpr_1_146:
	setx 0x3687a818c50cde56, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 211: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_147:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 212: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xab803a42  ! 213: WR_CLEAR_SOFTINT_I	wr	%r0, 0x1a42, %clear_softint
intveclr_1_148:
	setx 0x40e9222c92831471, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_149)+32, 16, 16)) -> intp(1,1,3)
xir_1_149:
	.word 0xa981fc6d  ! 215: WR_SET_SOFTINT_I	wr	%r7, 0x1c6d, %set_softint
pmu_1_150:
	nop
	setx 0xfffff75cfffff379, %g1, %g7
	.word 0xa3800007  ! 216: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_1_151:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_151:
	.word 0x8f902001  ! 217: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x26700001  ! 218: BPL	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_152) + 56, 16, 16)) -> intp(0,0,5)
intvec_1_152:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9a00165  ! 220: FABSq	dis not found

	rd %pc, %r19
	add %r19, (ivw_1_153-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_153:
	.word 0x91924003  ! 221: WRPR_PIL_R	wrpr	%r9, %r3, %pil
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_154
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_154:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 222: RDPC	rd	%pc, %r17
	.word 0x83d020b4  ! 223: Tcc_I	te	icc_or_xcc, %r0 + 180
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 224: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_1_156:
	setx 0x3f09c4e8782d76a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_1_157:
	setx 0xe8574d9d96d09437, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95a00169  ! 227: FABSq	dis not found

splash_cmpr_1_158:
	setx 0xc2e5bc08ef1874cb, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_159:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 229: RDPC	rd	%pc, %r18
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_160:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 230: RDPC	rd	%pc, %r20
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_161
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_161
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_161:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 231: RDPC	rd	%pc, %r17
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_162
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_162:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 232: RDPC	rd	%pc, %r17
	setx 0x5906382adfaa87c9, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_163:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_164:
	nop
	setx 0xfffff136fffff9e7, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x5a3be27c78a2ebba, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_165:
	.word 0x39400001  ! 235: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976aa082  ! 236: SDIVX_I	sdivx	%r10, 0x0082, %r11
	.word 0x93d02034  ! 237: Tcc_I	tne	icc_or_xcc, %r0 + 52
mondo_1_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d904011  ! 238: WRPR_WSTATE_R	wrpr	%r1, %r17, %wstate
splash_cmpr_1_168:
	setx 0x59b698d55c690a7c, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c8] %asi
	.word 0x9d904008  ! 240: WRPR_WSTATE_R	wrpr	%r1, %r8, %wstate
mondo_1_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d94400b  ! 241: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
splash_cmpr_1_171:
	setx 0x3b071d81c6c9e8dc, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 242: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_172) + 8, 16, 16)) -> intp(3,0,17)
intvec_1_172:
	.word 0x39400001  ! 243: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_173:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x93a1c9d4  ! 245: FDIVd	fdivd	%f38, %f20, %f40
	.word 0xda8008a0  ! 246: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_hpstate_1_174:
	.word 0x819823e4  ! 247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03e4, %hpstate
	setx 0x99d48340e412829a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_175:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_176:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r13
	.word 0x91480000  ! 250: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xd64fc000  ! 251: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0xd60ff241  ! 252: LDUB_I	ldub	[%r31 + 0xfffff241], %r11
	.word 0x8d902158  ! 253: WRPR_PSTATE_I	wrpr	%r0, 0x0158, %pstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_177:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 254: RDPC	rd	%pc, %r19
splash_hpstate_1_178:
	.word 0x81982d0c  ! 255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0c, %hpstate
mondo_1_179:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e8] %asi
	.word 0x9d904013  ! 256: WRPR_WSTATE_R	wrpr	%r1, %r19, %wstate
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_1_180:
	nop
	mov 8, %r18
	.word 0xe2f00492  ! 258: STXA_R	stxa	%r17, [%r0 + %r18] 0x24
	.word 0xa3464000  ! 259: RD_STICK_CMPR_REG	rd	%-, %r17
intveclr_1_181:
	setx 0x35b7881c850b7ba8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9ba0c9d4  ! 261: FDIVd	fdivd	%f34, %f20, %f44
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
	.word 0x93414000  ! 262: RDPC	rd	%pc, %r9
	rd %pc, %r19
	add %r19, (ivw_1_183-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_183:
	.word 0x91950004  ! 263: WRPR_PIL_R	wrpr	%r20, %r4, %pil
intveclr_1_184:
	setx 0x8b7d26ff0886a1be, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 264: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_185:
	setx 0xae45a9b23c79303c, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 265: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_1_186:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d94000c  ! 266: WRPR_WSTATE_R	wrpr	%r16, %r12, %wstate
	rd %pc, %r19
	add %r19, (ivw_1_187-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_187:
	.word 0x91910004  ! 267: WRPR_PIL_R	wrpr	%r4, %r4, %pil
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_188:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 268: CASA_R	casa	[%r31] %asi, %r19, %r13
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_189:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 269: RDPC	rd	%pc, %r16
intveclr_1_190:
	setx 0x4be74a6c40bb95f9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 270: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_191:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_191:
	.word 0x8f902002  ! 271: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
DS_1_192:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 272: RESTORE_R	restore	%r31, %r0, %r31
mondo_1_193:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d90c011  ! 273: WRPR_WSTATE_R	wrpr	%r3, %r17, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_194) + 40, 16, 16)) -> intp(2,0,19)
intvec_1_194:
	.word 0x39400001  ! 274: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d944010  ! 275: WRPR_WSTATE_R	wrpr	%r17, %r16, %wstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_196:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 276: RDPC	rd	%pc, %r13
debug_1_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 277: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xa9500000  ! 278: RDPR_TPC	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_198:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 279: RDPC	rd	%pc, %r11
pmu_1_199:
	nop
	setx 0xfffff63ffffff169, %g1, %g7
	.word 0xa3800007  ! 280: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93a00162  ! 281: FABSq	dis not found

mondo_1_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d92000a  ! 282: WRPR_WSTATE_R	wrpr	%r8, %r10, %wstate
	.word 0x30800001  ! 283: BA	ba,a	<label_0x1>
pmu_1_201:
	nop
	setx 0xffffff34fffff9fa, %g1, %g7
	.word 0xa3800007  ! 284: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_1_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d918011  ! 285: WRPR_WSTATE_R	wrpr	%r6, %r17, %wstate
DS_1_203:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
memptr_1_204:
	set user_data_start, %r31
	.word 0x8581e8d6  ! 287: WRCCR_I	wr	%r7, 0x08d6, %ccr
	.word 0x20800001  ! 288: BN	bn,a	<label_0x1>
pmu_1_205:
	nop
	setx 0xffffff6ffffffd12, %g1, %g7
	.word 0xa3800007  ! 289: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_206) + 56, 16, 16)) -> intp(3,0,8)
intvec_1_206:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_207:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 291: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8d903d15  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x1d15, %pstate
	.word 0xda37e0b8  ! 293: STH_I	sth	%r13, [%r31 + 0x00b8]
DS_1_208:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 294: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 296: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01961  ! 297: FqTOd	dis not found

debug_1_211:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 298: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_1_212:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c0] %asi
	.word 0x9d944004  ! 299: WRPR_WSTATE_R	wrpr	%r17, %r4, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916ab905  ! 300: SDIVX_I	sdivx	%r10, 0xfffff905, %r8
	.word 0xa3a489c5  ! 301: FDIVd	fdivd	%f18, %f36, %f48
	.word 0x8d9039aa  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x19aa, %pstate
intveclr_1_214:
	setx 0x83365e7a4b08bbdf, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01973  ! 304: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_216
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_216:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 305: RDPC	rd	%pc, %r12
intveclr_1_217:
	setx 0xa95af24cb421f1e0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93500000  ! 307: RDPR_TPC	<illegal instruction>
	.word 0x93a089cd  ! 308: FDIVd	fdivd	%f2, %f44, %f40
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_218:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 309: RDPC	rd	%pc, %r20
donret_1_219:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_219-donret_1_219-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1252, %tstate
    wrhpr %g0, 0xf55, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_219:
	.word 0xe6ffe4a4  ! 310: SWAPA_I	swapa	%r19, [%r31 + 0x04a4] %asi
	rd %pc, %r19
	add %r19, (ivw_1_220-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_220:
	.word 0x9191400d  ! 311: WRPR_PIL_R	wrpr	%r5, %r13, %pil
intveclr_1_221:
	setx 0x8180c91e1c44b937, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3c8] %asi
	.word 0x9d90800c  ! 313: WRPR_WSTATE_R	wrpr	%r2, %r12, %wstate
	.word 0xe68008a0  ! 314: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xa5454000  ! 315: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
donret_1_223:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_223-donret_1_223-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1ffb, %tstate
    wrhpr %g0, 0x79d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_223:
	.word 0xd6ffe4a4  ! 316: SWAPA_I	swapa	%r11, [%r31 + 0x04a4] %asi
intveclr_1_224:
	setx 0x01d6ace7184634b1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 317: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_1_225:
	.word 0x8198281e  ! 318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081e, %hpstate
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
	.word 0xa1414000  ! 319: RDPC	rd	%pc, %r16
	.word 0xe607c000  ! 320: LDUW_R	lduw	[%r31 + %r0], %r19
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 321: CASA_R	casa	[%r31] %asi, %r20, %r19
memptr_1_228:
	set user_data_start, %r31
	.word 0x85823107  ! 322: WRCCR_I	wr	%r8, 0x1107, %ccr
	.word 0x91d02035  ! 323: Tcc_I	ta	icc_or_xcc, %r0 + 53
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_229:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 324: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0x8d903c5e  ! 325: WRPR_PSTATE_I	wrpr	%r0, 0x1c5e, %pstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_230:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 326: RDPC	rd	%pc, %r11
mondo_1_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d908003  ! 327: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
debug_1_232:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 328: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_233)+56, 16, 16)) -> intp(1,1,3)
xir_1_233:
	.word 0xa9826aa9  ! 329: WR_SET_SOFTINT_I	wr	%r9, 0x0aa9, %set_softint
DS_1_234:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 330: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x99902002  ! 331: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
mondo_1_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d934013  ! 332: WRPR_WSTATE_R	wrpr	%r13, %r19, %wstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 333: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	rd %pc, %r19
	add %r19, (ivw_1_236-.+16), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_236:
	.word 0x91934014  ! 334: WRPR_PIL_R	wrpr	%r13, %r20, %pil
DS_1_237:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902000  ! 335: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xd01fff3e  ! 336: LDD_I	ldd	[%r31 + 0xffffff3e], %r8
	.word 0x8d902fa9  ! 337: WRPR_PSTATE_I	wrpr	%r0, 0x0fa9, %pstate
	.word 0xd03fff3e  ! 338: STD_I	std	%r8, [%r31 + 0xffffff3e]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01967  ! 339: FqTOd	dis not found

	.word 0x8d90350f  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x150f, %pstate
pmu_1_239:
	nop
	setx 0xfffffc50fffff935, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_240:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 342: RDPC	rd	%pc, %r16
mondo_1_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3e8] %asi
	.word 0x9d914014  ! 343: WRPR_WSTATE_R	wrpr	%r5, %r20, %wstate
intveclr_1_242:
	setx 0xebb0f9b1745fabb3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91454000  ! 345: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
mondo_1_243:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c8] %asi
	.word 0x9d928012  ! 346: WRPR_WSTATE_R	wrpr	%r10, %r18, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01973  ! 347: FqTOd	dis not found

	.word 0x95540000  ! 348: RDPR_GL	<illegal instruction>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_245
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_245:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e001  ! 349: CASA_R	casa	[%r31] %asi, %r1, %r8
	.word 0x99a00174  ! 350: FABSq	dis not found

memptr_1_246:
	set user_data_start, %r31
	.word 0x8581fe7d  ! 351: WRCCR_I	wr	%r7, 0x1e7d, %ccr
	.word 0xd477c000  ! 352: STX_R	stx	%r10, [%r31 + %r0]
	.word 0x8d902468  ! 353: WRPR_PSTATE_I	wrpr	%r0, 0x0468, %pstate
memptr_1_247:
	set 0x60740000, %r31
	.word 0x858121a4  ! 354: WRCCR_I	wr	%r4, 0x01a4, %ccr
	.word 0xd46ff8e6  ! 355: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
    set 0x16b, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x97b0c7e6  ! 356: PDISTN	fmean16	%d34, %d6, %d42
mondo_1_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d924008  ! 357: WRPR_WSTATE_R	wrpr	%r9, %r8, %wstate
	.word 0x26800001  ! 358: BL	bl,a	<label_0x1>
pmu_1_249:
	nop
	setx 0xfffff7f5fffffcab, %g1, %g7
	.word 0xa3800007  ! 359: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46ff8e6  ! 360: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
change_to_randtl_1_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_250:
	.word 0x8f902001  ! 361: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
debug_1_251:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_252
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_252:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e007  ! 363: CASA_R	casa	[%r31] %asi, %r7, %r10
debug_1_253:
	nop
	rd %pc, %r19
	add %r19, (64+16), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 364: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99902001  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_254)+24, 16, 16)) -> intp(1,1,3)
xir_1_254:
	.word 0xa982fdbc  ! 366: WR_SET_SOFTINT_I	wr	%r11, 0x1dbc, %set_softint
	.word 0x8d902f24  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x0f24, %pstate
intveclr_1_255:
	setx 0x608e5b0b6dbadcfa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 368: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa950c000  ! 369: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_256
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_256:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 370: RDPC	rd	%pc, %r10
	.word 0xa1500000  ! 371: RDPR_TPC	<illegal instruction>
	.word 0x9b45c000  ! 372: RD_TICK_CMPR_REG	rd	%-, %r13
splash_cmpr_1_257:
	setx 0xd0b8228034ffe4bb, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_258:
	setx 0x19c37dae8a64e137, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 374: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x10b28b572406142a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_259:
	.word 0x39400001  ! 375: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99480000  ! 376: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_260:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 377: CASA_R	casa	[%r31] %asi, %r7, %r19
mondo_1_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d948001  ! 378: WRPR_WSTATE_R	wrpr	%r18, %r1, %wstate
intveclr_1_262:
	setx 0xbf1191d7fb23fdc0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 380: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe68008a0  ! 381: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe63fc000  ! 382: STD_R	std	%r19, [%r31 + %r0]
	rd %pc, %r19
	add %r19, (ivw_1_264-.+24), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_264:
	.word 0x91930006  ! 383: WRPR_PIL_R	wrpr	%r12, %r6, %pil
splash_cmpr_1_265:
	setx 0xde8fd173e782ed04, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 384: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 385: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0x701eadedeff808fc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_267:
	.word 0x39400001  ! 386: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903961  ! 387: WRPR_PSTATE_I	wrpr	%r0, 0x1961, %pstate
	.word 0x28700001  ! 388: BPLEU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_268:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 389: RDPC	rd	%pc, %r13
	.word 0xad8371e1  ! 390: WR_SOFTINT_REG_I	wr	%r13, 0x11e1, %softint
	.word 0xa7820002  ! 391: WR_GRAPHICS_STATUS_REG_R	wr	%r8, %r2, %-
DS_1_270:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe532ba88  ! 1: STQF_I	-	%f18, [0x1a88, %r10]
	normalw
	.word 0x97458000  ! 392: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xe537c000  ! 393: STQF_R	-	%f18, [%r0, %r31]
intveclr_1_271:
	setx 0x7009aef5a94cf3b4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_272:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 395: RDPC	rd	%pc, %r10
mondo_1_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d94c009  ! 396: WRPR_WSTATE_R	wrpr	%r19, %r9, %wstate
	.word 0xe08008a0  ! 397: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x26800001  ! 398: BL	bl,a	<label_0x1>
splash_cmpr_1_274:
	setx 0xfa26c1fd6a6c3416, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16ae2c1  ! 400: SDIVX_I	sdivx	%r11, 0x02c1, %r16
DS_1_276:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
intveclr_1_277:
	setx 0xd464df660f5a7754, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 402: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_278:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 403: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
pmu_1_279:
	nop
	setx 0xfffff6e1fffff20c, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_1_280-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_280:
	.word 0x9194c003  ! 405: WRPR_PIL_R	wrpr	%r19, %r3, %pil
debug_1_281:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 406: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_1_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_282-donret_1_282), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1f3f, %tstate
    wrhpr %g0, 0x20c, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_282:
	.word 0xe6ffe2b9  ! 407: SWAPA_I	swapa	%r19, [%r31 + 0x02b9] %asi
mondo_1_283:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3c0] %asi
	.word 0x9d918003  ! 408: WRPR_WSTATE_R	wrpr	%r6, %r3, %wstate
splash_tba_1_284:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 409: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa782400a  ! 410: WR_GRAPHICS_STATUS_REG_R	wr	%r9, %r10, %-
	.word 0xa7a00173  ! 411: FABSq	dis not found

intveclr_1_286:
	setx 0x0f16c950d1353479, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 412: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_1_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_1_287:
	.word 0x8f902000  ! 413: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_1_288:
	tsubcctv %r7, 0x1796, %r16
	.word 0xd207e2b9  ! 414: LDUW_I	lduw	[%r31 + 0x02b9], %r9
	.word 0x93d02035  ! 415: Tcc_I	tne	icc_or_xcc, %r0 + 53
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 416: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902aa1  ! 417: WRPR_PSTATE_I	wrpr	%r0, 0x0aa1, %pstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_289
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_289:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 418: RDPC	rd	%pc, %r11
tagged_1_290:
	tsubcctv %r22, 0x11ef, %r25
	.word 0xe407e2b9  ! 419: LDUW_I	lduw	[%r31 + 0x02b9], %r18
	.word 0x95a00171  ! 420: FABSq	dis not found

memptr_1_291:
	set user_data_start, %r31
	.word 0x8585318a  ! 421: WRCCR_I	wr	%r20, 0x118a, %ccr
splash_cmpr_1_292:
	setx 0x45d2afefebf66467, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 422: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_1_293:
	.word 0x9ba509cb  ! 1: FDIVd	fdivd	%f20, %f42, %f44
	.word 0xbfe7c000  ! 423: SAVE_R	save	%r31, %r0, %r31
	.word 0xd8dfe030  ! 424: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
	.word 0x9ba009c0  ! 425: FDIVd	fdivd	%f0, %f0, %f44
memptr_1_294:
	set user_data_start, %r31
	.word 0x8582ec92  ! 426: WRCCR_I	wr	%r11, 0x0c92, %ccr
donret_1_295:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_295-donret_1_295-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x162b, %tstate
    wrhpr %g0, 0xc94, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_295:
	.word 0xd6fff6a7  ! 427: SWAPA_I	swapa	%r11, [%r31 + 0xfffff6a7] %asi
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_296:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 428: CASA_R	casa	[%r31] %asi, %r1, %r11
mondo_1_297:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d924011  ! 429: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01968  ! 430: FqTOd	dis not found

	.word 0x9ba00167  ! 431: FABSq	dis not found

tagged_1_299:
	taddcctv %r4, 0x1001, %r14
	.word 0xe407f6a7  ! 432: LDUW_I	lduw	[%r31 + 0xfffff6a7], %r18
	.word 0x91a00164  ! 433: FABSq	dis not found

	.word 0xa9540000  ! 434: RDPR_GL	rdpr	%-, %r20
splash_cmpr_1_300:
	setx 0xa164dc9d50c9df08, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 435: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xa7810011  ! 436: WR_GRAPHICS_STATUS_REG_R	wr	%r4, %r17, %-
	.word 0xda800bc0  ! 437: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r13
pmu_1_302:
	nop
	setx 0xfffff753fffffc97, %g1, %g7
	.word 0xa3800007  ! 438: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_1_303:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 439: RESTORE_R	restore	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_304) + 24, 16, 16)) -> intp(0,0,23)
intvec_1_304:
	.word 0x39400001  ! 440: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ff6a7  ! 441: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff6a7]
	.word 0xda8fe010  ! 442: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
intveclr_1_305:
	setx 0x806f0d559fe429fd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 443: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_1_306:
	set user_data_start, %r31
	.word 0x8584e11a  ! 444: WRCCR_I	wr	%r19, 0x011a, %ccr
	.word 0xda6ffae0  ! 445: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffae0]
intveclr_1_307:
	setx 0xbf7774b2f025bf56, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_1_308:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 447: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_1_309-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_309:
	.word 0x91914014  ! 448: WRPR_PIL_R	wrpr	%r5, %r20, %pil
splash_tba_1_310:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 449: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0xa9a309d0  ! 450: FDIVd	fdivd	%f12, %f16, %f20
	rd %pc, %r19
	add %r19, (ivw_1_311-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_311:
	.word 0x9192000b  ! 451: WRPR_PIL_R	wrpr	%r8, %r11, %pil
	rd %pc, %r19
	add %r19, (ivw_1_312-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_312:
	.word 0x91910010  ! 452: WRPR_PIL_R	wrpr	%r4, %r16, %pil
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 453: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f803668  ! 454: SIR	sir	0x1668
	.word 0xd46ffb56  ! 455: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
	.word 0xd46ffb56  ! 456: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
pmu_1_313:
	nop
	setx 0xfffff86dfffff2e0, %g1, %g7
	.word 0xa3800007  ! 457: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_1_314:
	set 0x60540000, %r31
	.word 0x8582a0a8  ! 458: WRCCR_I	wr	%r10, 0x00a8, %ccr
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 459: Tcc_R	tne	icc_or_xcc, %r0 + %r30
intveclr_1_315:
	setx 0x1d28f547f03e2a9f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 460: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_1_316:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_316-donret_1_316), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x495, %tstate
    wrhpr %g0, 31, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_316:
	.word 0xd4fffcce  ! 461: SWAPA_I	swapa	%r10, [%r31 + 0xfffffcce] %asi
	.word 0x91953d54  ! 462: WRPR_PIL_I	wrpr	%r20, 0x1d54, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 463: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd53fc000  ! 464: STDF_R	std	%f10, [%r0, %r31]
	.word 0xd4dfe010  ! 465: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
mondo_1_317:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d90c014  ! 466: WRPR_WSTATE_R	wrpr	%r3, %r20, %wstate
mondo_1_318:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d91c004  ! 467: WRPR_WSTATE_R	wrpr	%r7, %r4, %wstate
	.word 0x83d020b5  ! 468: Tcc_I	te	icc_or_xcc, %r0 + 181
debug_1_319:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_1_320:
	set 0x60140000, %r31
	.word 0x85853163  ! 470: WRCCR_I	wr	%r20, 0x1163, %ccr
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_321:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 471: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0xd537f470  ! 472: STQF_I	-	%f10, [0x1470, %r31]
splash_cmpr_1_322:
	setx 0xe528abeed57af381, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_323
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_323:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 474: CASA_R	casa	[%r31] %asi, %r0, %r10
mondo_1_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d950002  ! 475: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
splash_hpstate_1_325:
	.word 0x81982005  ! 476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0005, %hpstate
	.word 0xa5a1c9d1  ! 477: FDIVd	fdivd	%f38, %f48, %f18
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_326
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_326:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 478: RDPC	rd	%pc, %r9
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_327
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_327:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 479: CASA_R	casa	[%r31] %asi, %r13, %r18
	.word 0x30700001  ! 480: BPA	<illegal instruction>
intveclr_1_328:
	setx 0x59248fccdaa8c788, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 481: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0xc1c60533d608ce2c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_329:
	.word 0x39400001  ! 482: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_1_330:
	nop
	setx 0xfffffe69fffff64a, %g1, %g7
	.word 0xa3800007  ! 483: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_1_331:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 484: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_1_332:
	nop
	setx 0xfffffb56fffffcc6, %g1, %g7
	.word 0xa3800007  ! 485: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xa3480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xdb27c000  ! 487: STF_R	st	%f13, [%r0, %r31]
pmu_1_333:
	nop
	setx 0xfffff1cafffff5ce, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_1_334:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_334-donret_1_334), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1fbc, %tstate
    wrhpr %g0, 0x91f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	retry
donretarg_1_334:
	.word 0xdafff470  ! 489: SWAPA_I	swapa	%r13, [%r31 + 0xfffff470] %asi
	rd %pc, %r19
	add %r19, (ivw_1_335-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_335:
	.word 0x91920003  ! 490: WRPR_PIL_R	wrpr	%r8, %r3, %pil
debug_1_336:
	nop
	mov 8, %r18
	.word 0xe8f00492  ! 491: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_337
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_337:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 492: CASA_R	casa	[%r31] %asi, %r12, %r13
memptr_1_338:
	set 0x60740000, %r31
	.word 0x8582337f  ! 493: WRCCR_I	wr	%r8, 0x137f, %ccr
debug_1_339:
	nop
	mov 8, %r18
	.word 0xd0f00492  ! 494: STXA_R	stxa	%r8, [%r0 + %r18] 0x24
	.word 0xda800ac0  ! 495: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r13
	.word 0xda8008a0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda97e000  ! 497: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
change_to_randtl_1_340:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_340:
	.word 0x8f902002  ! 498: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    set 0x3fd1, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x93b1c7e7  ! 499: PDISTN	fmean16	%d38, %d38, %d40
pmu_1_341:
	nop
	setx 0xfffff6eeffffff0c, %g1, %g7
	.word 0xa3800007  ! 500: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_342
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_342:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 501: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_htba_1_343:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 502: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_344
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_344
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_344:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 503: RDPC	rd	%pc, %r9
	setx 0x1702f5fc5be6864c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_345:
	.word 0x39400001  ! 504: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_1_346:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_346-donret_1_346), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x9ca, %tstate
    wrhpr %g0, 0xfde, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (1)
	retry
donretarg_1_346:
	.word 0xe6ffefb6  ! 505: SWAPA_I	swapa	%r19, [%r31 + 0x0fb6] %asi
	.word 0x83d02032  ! 506: Tcc_I	te	icc_or_xcc, %r0 + 50
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 507: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01973  ! 508: FqTOd	dis not found

cwp_1_348:
    set user_data_start, %o7
	.word 0x93902007  ! 509: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
cwp_1_349:
    set user_data_start, %o7
	.word 0x93902007  ! 510: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	rd %pc, %r19
	add %r19, (ivw_1_350-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_350:
	.word 0x9190c001  ! 511: WRPR_PIL_R	wrpr	%r3, %r1, %pil
	.word 0x9b450000  ! 512: RD_SET_SOFTINT	rd	%set_softint, %r13
intveclr_1_351:
	setx 0xd1568db890eee1f2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 513: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda57c000  ! 514: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7697617  ! 515: SDIVX_I	sdivx	%r5, 0xfffff617, %r19
memptr_1_353:
	set 0x60540000, %r31
	.word 0x85843e07  ! 516: WRCCR_I	wr	%r16, 0x1e07, %ccr
	.word 0xe4bfe44b  ! 517: STDA_I	stda	%r18, [%r31 + 0x044b] %asi
	.word 0x91d02032  ! 518: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x99464000  ! 519: RD_STICK_CMPR_REG	rd	%-, %r12
intveclr_1_354:
	setx 0x41256a3dd7960761, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 520: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_355:
	nop
	setx 0xfffff548fffff819, %g1, %g7
	.word 0xa3800007  ! 521: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99a189cc  ! 522: FDIVd	fdivd	%f6, %f12, %f12
intveclr_1_356:
	setx 0xa4614dc561fefeb2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 523: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 524: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
intveclr_1_357:
	setx 0x8ac43fe8143fd8da, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95500000  ! 526: RDPR_TPC	rdpr	%tpc, %r10
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_358) + 48, 16, 16)) -> intp(1,0,21)
intvec_1_358:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_1_359:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 528: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_1_360:
	.word 0xa1a449c2  ! 1: FDIVd	fdivd	%f48, %f2, %f16
	.word 0xe7342bd5  ! 1: STQF_I	-	%f19, [0x0bd5, %r16]
	normalw
	.word 0x99458000  ! 529: RD_SOFTINT_REG	rd	%softint, %r12
debug_1_361:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 530: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd08008a0  ! 531: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x91450000  ! 532: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0xe26ff145  ! 533: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
	.word 0xe26ff145  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
mondo_1_362:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d0] %asi
	.word 0x9d91800d  ! 535: WRPR_WSTATE_R	wrpr	%r6, %r13, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 536: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe2800ba0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r17
intveclr_1_363:
	setx 0x98ff5e5632a3c97c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 538: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d934012  ! 539: WRPR_WSTATE_R	wrpr	%r13, %r18, %wstate
	.word 0xe21fc000  ! 540: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x99902002  ! 541: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xe337f145  ! 542: STQF_I	-	%f17, [0x1145, %r31]
DS_1_365:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 543: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	rd %pc, %r19
	add %r19, (ivw_1_366-.+8), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_366:
	.word 0x9190000a  ! 544: WRPR_PIL_R	wrpr	%r0, %r10, %pil
	.word 0xe247f145  ! 545: LDSW_I	ldsw	[%r31 + 0xfffff145], %r17
donret_1_367:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_1_367-donret_1_367-4), %r12
	mov 0x38, %r18
	stxa %r12, [%r18]0x58
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x13a2, %tstate
    wrhpr %g0, 0xbd7, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (1)
	done
donretarg_1_367:
	.word 0xe2fff145  ! 546: SWAPA_I	swapa	%r17, [%r31 + 0xfffff145] %asi
mondo_1_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d928002  ! 547: WRPR_WSTATE_R	wrpr	%r10, %r2, %wstate
DS_1_369:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x97b00312  ! 548: ALIGNADDRESS	alignaddr	%r0, %r18, %r11
	.word 0x91d020b3  ! 549: Tcc_I	ta	icc_or_xcc, %r0 + 179
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_370
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_370:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 550: CASA_R	casa	[%r31] %asi, %r3, %r8
	setx 0x568bcdd659418a6f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_371:
	.word 0x39400001  ! 551: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd09ff145  ! 552: LDDA_I	ldda	[%r31, + 0xfffff145] %asi, %r8
splash_lsu_1_372:
	setx 0x55397c6c2fd087e6, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 553: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_1_373:
	nop
	rd %pc, %r19
	add %r19, (64+56), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 554: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56abb44  ! 555: SDIVX_I	sdivx	%r10, 0xfffffb44, %r18
	.word 0xd137c000  ! 556: STQF_R	-	%f8, [%r0, %r31]
	.word 0xd00fe46f  ! 557: LDUB_I	ldub	[%r31 + 0x046f], %r8
	.word 0xd077e46f  ! 558: STX_I	stx	%r8, [%r31 + 0x046f]
	.word 0xa782c007  ! 559: WR_GRAPHICS_STATUS_REG_R	wr	%r11, %r7, %-
splash_cmpr_1_376:
	setx 0xd68ff9cb7c7339d8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 560: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x99a109d3  ! 561: FDIVd	fdivd	%f4, %f50, %f12
mondo_1_377:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d92000d  ! 562: WRPR_WSTATE_R	wrpr	%r8, %r13, %wstate
cwp_1_378:
    set user_data_start, %o7
	.word 0x93902005  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_379:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 564: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0x97a00172  ! 565: FABSq	dis not found

	.word 0x91520000  ! 566: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_380
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_380:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 567: RDPC	rd	%pc, %r13
mondo_1_381:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d908003  ! 568: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
mondo_1_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d90c00d  ! 569: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
	.word 0xd03fe46f  ! 570: STD_I	std	%r8, [%r31 + 0x046f]
	.word 0x99a00173  ! 571: FABSq	dis not found

	.word 0xe06fe46f  ! 572: LDSTUB_I	ldstub	%r16, [%r31 + 0x046f]
debug_1_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 573: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d020b2  ! 574: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe08fe030  ! 575: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r16
intveclr_1_384:
	setx 0x621a7dda97e79682, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 576: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 577: Tcc_I	ta	icc_or_xcc, %r0 + 180
debug_1_385:
	nop
	rd %pc, %r19
	add %r19, (64+0), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 578: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_386:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 579: CASA_R	casa	[%r31] %asi, %r10, %r16
debug_1_387:
	nop
	mov 8, %r18
	.word 0xd4f00492  ! 580: STXA_R	stxa	%r10, [%r0 + %r18] 0x24
pmu_1_388:
	nop
	setx 0xfffff954fffffa2a, %g1, %g7
	.word 0xa3800007  ! 581: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_1_389-.+56), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_389:
	.word 0x91930008  ! 582: WRPR_PIL_R	wrpr	%r12, %r8, %pil
change_to_randtl_1_390:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_1_390:
	.word 0x8f902000  ! 583: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01968  ! 584: FqTOd	dis not found

	.word 0x36700001  ! 585: BPGE	<illegal instruction>
mondo_1_392:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d92c006  ! 586: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56866a0  ! 587: SDIVX_I	sdivx	%r1, 0x06a0, %r18
	.word 0x97a00170  ! 588: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_394
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_394:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 589: RDPC	rd	%pc, %r8
	.word 0xd0dfe000  ! 590: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	.word 0xd0d7e030  ! 591: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	setx 0xc0fcb668e92007de, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_395:
	.word 0x39400001  ! 592: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_396:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 593: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_1_397:
	setx 0xe399ede15bcb7662, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 594: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_1_398:
	nop
	setx 0xfffff4affffffd8d, %g1, %g7
	.word 0xa3800007  ! 595: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x91d02032  ! 596: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_1_399:
	setx 0x3e293b24dbef685a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 597: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd03fe06b  ! 598: STD_I	std	%r8, [%r31 + 0x006b]
debug_1_400:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 599: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_1_401-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_401:
	.word 0x91948009  ! 600: WRPR_PIL_R	wrpr	%r18, %r9, %pil
mondo_1_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3e0] %asi
	.word 0x9d92400a  ! 601: WRPR_WSTATE_R	wrpr	%r9, %r10, %wstate
	.word 0x91a449c3  ! 602: FDIVd	fdivd	%f48, %f34, %f8
intveclr_1_403:
	setx 0x0fdfe25aae4a147b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 603: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 604: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01967  ! 605: FqTOd	dis not found

    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 606: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0xe737e06b  ! 607: STQF_I	-	%f19, [0x006b, %r31]
pmu_1_407:
	nop
	setx 0xfffffda7fffff2c8, %g1, %g7
	.word 0xa3800007  ! 608: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	rd %pc, %r19
	add %r19, (ivw_1_408-.+0), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_408:
	.word 0x9194400c  ! 609: WRPR_PIL_R	wrpr	%r17, %r12, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01968  ! 610: FqTOd	dis not found

	.word 0xd737c000  ! 611: STQF_R	-	%f11, [%r0, %r31]
debug_1_410:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 612: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b69e75f  ! 613: SDIVX_I	sdivx	%r7, 0x075f, %r13
	.word 0x81510000  ! 614: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91d02035  ! 615: Tcc_I	ta	icc_or_xcc, %r0 + 53
debug_1_412:
	nop
	rd %pc, %r19
	add %r19, (64+8), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe88008a0  ! 617: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
pmu_1_413:
	nop
	setx 0xfffff282fffff2cd, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99902004  ! 619: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_cmpr_1_414:
	setx 0x7326f2dc5e854a0e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 620: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_415:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 621: RDPC	rd	%pc, %r11
splash_lsu_1_416:
	setx 0x53cb367a18db6345, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 622: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd477f103  ! 623: STX_I	stx	%r10, [%r31 + 0xfffff103]
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_417
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_417:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 624: RDPC	rd	%pc, %r17
	.word 0x83d02034  ! 625: Tcc_I	te	icc_or_xcc, %r0 + 52
intveclr_1_418:
	setx 0xddb7ac60ec608d14, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 626: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7a249c5  ! 627: FDIVd	fdivd	%f40, %f36, %f50
DS_1_419:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 628: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xab830013  ! 629: WR_CLEAR_SOFTINT_R	wr	%r12, %r19, %clear_softint
splash_cmpr_1_420:
	setx 0x0a0cf47596f6138a, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 630: WR_STICK_REG_R	wr	%r0, %r1, %-
	rd %pc, %r19
	add %r19, (ivw_1_421-.+40), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_421:
	.word 0x9193000b  ! 631: WRPR_PIL_R	wrpr	%r12, %r11, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_422)+8, 16, 16)) -> intp(1,1,3)
xir_1_422:
	.word 0xa984a02d  ! 632: WR_SET_SOFTINT_I	wr	%r18, 0x002d, %set_softint
mondo_1_423:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d90c00d  ! 633: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_424
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_424:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 634: CASA_R	casa	[%r31] %asi, %r3, %r11
debug_1_425:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 635: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_1_426:
	setx 0x3860fdcb97302f6a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 636: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_1_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d920012  ! 637: WRPR_WSTATE_R	wrpr	%r8, %r18, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16b67e0  ! 638: SDIVX_I	sdivx	%r13, 0x07e0, %r16
intveclr_1_429:
	setx 0xf9a1a366eec64eab, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 639: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_430:
	setx 0xead3e5dd73df3748, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 640: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x6d21e7ed959bdc56, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_431:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_432:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3c8] %asi
	.word 0x9d91c012  ! 642: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_433
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_433
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_433:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 643: RDPC	rd	%pc, %r10
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_434
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_434:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 644: CASA_R	casa	[%r31] %asi, %r4, %r18
	setx 0xc2bc83b4ccfeef5d, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_435:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_436:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 646: CASA_R	casa	[%r31] %asi, %r4, %r18
splash_cmpr_1_437:
	setx 0x1402add12c46814e, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 647: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_1_438:
	setx 0xa686587d90166fa0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 648: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 649: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
DS_1_439:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x91a0054a  ! 1: FSQRTd	fsqrt	
	.word 0x97a44821  ! 650: FADDs	fadds	%f17, %f1, %f11
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_1_440:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 652: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x97520000  ! 653: RDPR_PIL	<illegal instruction>
	setx 0x910af800332bd186, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_441:
	.word 0x39400001  ! 654: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_442:
	setx 0x810ce8615f219a53, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 655: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_1_443:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 656: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_444
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_444:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 657: CASA_R	casa	[%r31] %asi, %r9, %r12
memptr_1_445:
	set 0x60740000, %r31
	.word 0x8584efa6  ! 658: WRCCR_I	wr	%r19, 0x0fa6, %ccr
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_446
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_446
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_446:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 659: RDPC	rd	%pc, %r11
splash_cmpr_1_447:
	setx 0x64eba294e83469d3, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 660: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_448:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e009  ! 661: CASA_R	casa	[%r31] %asi, %r9, %r13
	rd %pc, %r19
	add %r19, (ivw_1_449-.+48), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_449:
	.word 0x9192800a  ! 662: WRPR_PIL_R	wrpr	%r10, %r10, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01970  ! 663: FqTOd	dis not found

	.word 0xa5a0016a  ! 664: FABSq	dis not found

debug_1_451:
	nop
	rd %pc, %r19
	add %r19, (64+24), %r19
	mov 0x38, %r18
	.word 0xe6f00b12  ! 665: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	rd %pc, %r19
	add %r19, (ivw_1_452-.+32), %r19
	mov 0x38, %r18
	stxa %r19, [%r18]0x58
ivw_1_452:
	.word 0x91940009  ! 666: WRPR_PIL_R	wrpr	%r16, %r9, %pil
	.word 0xda6fe48d  ! 667: LDSTUB_I	ldstub	%r13, [%r31 + 0x048d]
	.word 0x9f8020c0  ! 668: SIR	sir	0x00c0
mondo_1_453:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3e0] %asi
	.word 0x9d914001  ! 669: WRPR_WSTATE_R	wrpr	%r5, %r1, %wstate
	.word 0x8d9034a2  ! 670: WRPR_PSTATE_I	wrpr	%r0, 0x14a2, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01967  ! 671: FqTOd	dis not found

	.word 0x99a509d1  ! 672: FDIVd	fdivd	%f20, %f48, %f12
memptr_1_455:
	set 0x60740000, %r31
	.word 0x8582a93c  ! 673: WRCCR_I	wr	%r10, 0x093c, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 674: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_1_456:
	setx 0x50a06b3195f1fe3c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 675: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x60ae4aa23e5b577f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_457:
	.word 0x39400001  ! 676: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_1_458:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 677: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_1_459:
	set 0x003f0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003f0000, %r12
	.word 0x8b90000c  ! 678: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (1+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_1_460
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_1_460
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_1_460:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 679: RDPC	rd	%pc, %r17
	setx 0xe9c07f5ea785b4de, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_461:
	.word 0x39400001  ! 680: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_1_462:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d91c009  ! 681: WRPR_WSTATE_R	wrpr	%r7, %r9, %wstate
    mov (1+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_1_463
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_1_463:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 682: CASA_R	casa	[%r31] %asi, %r17, %r16
cwp_1_464:
    set user_data_start, %o7
	.word 0x93902005  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
debug_1_465:
	nop
	mov 8, %r18
	.word 0xd6f00492  ! 684: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_1_466)+56, 16, 16)) -> intp(1,1,3)
xir_1_466:
	.word 0xa982e387  ! 685: WR_SET_SOFTINT_I	wr	%r11, 0x0387, %set_softint
	.word 0x9ba00173  ! 686: FABSq	dis not found

debug_1_467:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 687: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91464000  ! 688: RD_STICK_CMPR_REG	rd	%-, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_1_468) + 0, 16, 16)) -> intp(6,0,15)
intvec_1_468:
	.word 0x39400001  ! 689: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 690: Tcc_R	ta	icc_or_xcc, %r0 + %r30
memptr_1_469:
	set 0x60340000, %r31
	.word 0x8580710a  ! 691: WRCCR_I	wr	%r1, 0x110a, %ccr
splash_cmpr_1_470:
	setx 0xd1875ce50a0d9931, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 692: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_1_471:
	nop
	setx 0xfffff4e8fffff09f, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_1_472:
	setx 0x65b0795c8bd6b5db, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 694: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xbcc69ab0383fcfe4, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_473:
	.word 0x39400001  ! 695: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_1_474:
	setx 0x61acdef3d2e062ea, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 696: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_1_475:
	setx 0xd314c384c4a2943f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 697: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_1_476:
	setx 0xf1a6289569798bae, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 698: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xec6669391628df70, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_1_477:
	.word 0x39400001  ! 699: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba489ca  ! 700: FDIVd	fdivd	%f18, %f10, %f44
splash_tba_1_478:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 701: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	nop
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	invalw
	mov 0x34, %r30
splash_cmpr_0_0:
	setx 0xd50cd7a901938a46, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 1: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_1:
	setx 0x07bd2c59af35bf50, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 2: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_2
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_2
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_2:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 3: RDPC	rd	%pc, %r19
	.word 0x91d020b3  ! 4: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_hpstate_0_3:
	.word 0x81982207  ! 5: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0207, %hpstate
donret_0_4:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_4-donret_0_4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1e22, %tstate
    wrhpr %g0, 0x61d, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (0)
	retry
donretarg_0_4:
	.word 0xe6ffee7d  ! 6: SWAPA_I	swapa	%r19, [%r31 + 0x0e7d] %asi
	.word 0x38700001  ! 7: BPGU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_5
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_5
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_5:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 8: RDPC	rd	%pc, %r18
	.word 0xa9a209d1  ! 9: FDIVd	fdivd	%f8, %f48, %f20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01971  ! 10: FqTOd	dis not found

mondo_0_7:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d924002  ! 11: WRPR_WSTATE_R	wrpr	%r9, %r2, %wstate
splash_hpstate_0_8:
	.word 0x81982c57  ! 12: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c57, %hpstate
mondo_0_9:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d924011  ! 13: WRPR_WSTATE_R	wrpr	%r9, %r17, %wstate
	.word 0xd80fee7d  ! 14: LDUB_I	ldub	[%r31 + 0x0e7d], %r12
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_10
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_10:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e011  ! 15: CASA_R	casa	[%r31] %asi, %r17, %r12
	.word 0xa9814005  ! 16: WR_SET_SOFTINT_R	wr	%r5, %r5, %set_softint
	setx 0xa3de5c53d7aaad7a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_11:
	.word 0x39400001  ! 17: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x97a0016a  ! 18: FABSq	dis not found

	.word 0x91d02035  ! 19: Tcc_I	ta	icc_or_xcc, %r0 + 53
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_12) + 0, 16, 16)) -> intp(1,0,7)
intvec_0_12:
	.word 0x39400001  ! 20: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_13:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 21: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8d9020b9  ! 22: WRPR_PSTATE_I	wrpr	%r0, 0x00b9, %pstate
	.word 0xab84c008  ! 23: WR_CLEAR_SOFTINT_R	wr	%r19, %r8, %clear_softint
memptr_0_14:
	set 0x60540000, %r31
	.word 0x8584a47a  ! 24: WRCCR_I	wr	%r18, 0x047a, %ccr
	setx 0x4e4e377905938b18, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_15:
	.word 0x39400001  ! 25: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976872d9  ! 26: SDIVX_I	sdivx	%r1, 0xfffff2d9, %r11
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976ab679  ! 27: SDIVX_I	sdivx	%r10, 0xfffff679, %r11
mondo_0_18:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c0] %asi
	.word 0x9d918009  ! 28: WRPR_WSTATE_R	wrpr	%r6, %r9, %wstate
mondo_0_19:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d904009  ! 29: WRPR_WSTATE_R	wrpr	%r1, %r9, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_20
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_20:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e009  ! 30: CASA_R	casa	[%r31] %asi, %r9, %r11
	.word 0xa3a409cb  ! 31: FDIVd	fdivd	%f16, %f42, %f48
	.word 0xe28008a0  ! 32: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_cmpr_0_21:
	setx 0x8cdd5ee5285c4e5f, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 33: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x93a00167  ! 34: FABSq	dis not found

pmu_0_22:
	nop
	setx 0xfffffc5cfffff67b, %g1, %g7
	.word 0xa3800007  ! 35: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
pmu_0_23:
	nop
	setx 0xfffff0f6fffff1a1, %g1, %g7
	.word 0xa3800007  ! 36: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_0_24:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_24:
	.word 0x8f902002  ! 37: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_25
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_25
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_25:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 38: RDPC	rd	%pc, %r13
	.word 0xab807539  ! 39: WR_CLEAR_SOFTINT_I	wr	%r1, 0x1539, %clear_softint
memptr_0_26:
	set 0x60140000, %r31
	.word 0x85837759  ! 40: WRCCR_I	wr	%r13, 0x1759, %ccr
cmp_0_27:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_27:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_27
    nop
cmp_wait0_27:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_27
    nop
    ba,a cmp_startwait0_27
continue_cmp_0_27:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x8c, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192000c  ! 41: WRPR_PIL_R	wrpr	%r8, %r12, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6c3c6d  ! 42: SDIVX_I	sdivx	%r16, 0xfffffc6d, %r13
intveclr_0_29:
	setx 0x2e2ba35f83e61793, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 43: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_30) + 16, 16, 16)) -> intp(4,0,12)
intvec_0_30:
	.word 0x39400001  ! 44: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_31:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 45: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01974  ! 46: FqTOd	dis not found

	setx 0x3cddd72f07aade5a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_33:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_34:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 48: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
splash_cmpr_0_35:
	setx 0xca3da8bc1454e864, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 49: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_hpstate_0_36:
	.word 0x81982f36  ! 50: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f36, %hpstate
	.word 0x99a0016c  ! 51: FABSq	dis not found

	.word 0x8d903a93  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x1a93, %pstate
cmp_0_37:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_37:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_37
    nop
cmp_wait0_37:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_37
    nop
    ba,a cmp_startwait0_37
continue_cmp_0_37:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 4, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91918013  ! 53: WRPR_PIL_R	wrpr	%r6, %r19, %pil
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_38
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_38
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_38:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 54: RDPC	rd	%pc, %r12
	.word 0x93a00162  ! 55: FABSq	dis not found

debug_0_39:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_39:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_39
    nop
debug_wait0_39:
    ld [%r23], %r16
    brnz %r16, debug_wait0_39
    nop
    ba,a debug_startwait0_39
continue_debug_0_39:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_39:
    cmp %r13, %r15
    bne,a wait_for_stat_0_39
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_39:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_39
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %17, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe6f00492  ! 56: STXA_R	stxa	%r19, [%r0 + %r18] 0x24
splash_cmpr_0_40:
	setx 0x14b1d54d12a0c112, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 57: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xd31fc000  ! 58: LDDF_R	ldd	[%r31, %r0], %f9
debug_0_41:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 59: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_42
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_42
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_42:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 60: RDPC	rd	%pc, %r17
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_43
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_43
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_43:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 61: RDPC	rd	%pc, %r10
	.word 0xd537fc6d  ! 62: STQF_I	-	%f10, [0x1c6d, %r31]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01967  ! 63: FqTOd	dis not found

pmu_0_45:
	nop
	setx 0xfffff392fffffcd2, %g1, %g7
	.word 0xa3800007  ! 64: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_0_46:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3e8] %asi
	.word 0x9d910013  ! 65: WRPR_WSTATE_R	wrpr	%r4, %r19, %wstate
DS_0_47:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe3318002  ! 1: STQF_R	-	%f17, [%r2, %r6]
	normalw
	.word 0xa1458000  ! 66: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0xe0c7e020  ! 67: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_48) + 40, 16, 16)) -> intp(5,0,24)
intvec_0_48:
	.word 0x39400001  ! 68: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_0_49:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_49-donret_0_49-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xae3, %tstate
    wrhpr %g0, 0x84e, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (0)
	done
donretarg_0_49:
	.word 0xe0fffc6d  ! 69: SWAPA_I	swapa	%r16, [%r31 + 0xfffffc6d] %asi
	.word 0x8d9029bc  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x09bc, %pstate
pmu_0_50:
	nop
	setx 0xfffffc45fffffda6, %g1, %g7
	.word 0xa3800007  ! 71: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976ce777  ! 72: SDIVX_I	sdivx	%r19, 0x0777, %r11
	.word 0x91d02033  ! 73: Tcc_I	ta	icc_or_xcc, %r0 + 51
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_52
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_52:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e002  ! 74: CASA_R	casa	[%r31] %asi, %r2, %r11
mondo_0_53:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d8] %asi
	.word 0x9d924014  ! 75: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
memptr_0_54:
	set user_data_start, %r31
	.word 0x858277c3  ! 76: WRCCR_I	wr	%r9, 0x17c3, %ccr
splash_lsu_0_55:
	setx 0xa69d10a7d0e9d7e4, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 77: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_56:
	.word 0x81982d1d  ! 78: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1d, %hpstate
splash_cmpr_0_57:
	setx 0x88f10012dbbbed4b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 79: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x36700001  ! 80: BPGE	<illegal instruction>
pmu_0_58:
	nop
	setx 0xfffff68bfffffa6a, %g1, %g7
	.word 0xa3800007  ! 81: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_59
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_59
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_59:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 82: RDPC	rd	%pc, %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01973  ! 83: FqTOd	dis not found

splash_cmpr_0_61:
	setx 0xd7e5cff43c92cb19, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 84: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0xe927f7c3  ! 85: STF_I	st	%f20, [0x17c3, %r31]
splash_tba_0_62:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 86: WRPR_TBA_R	wrpr	%r0, %r12, %tba
mondo_0_63:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c8] %asi
	.word 0x9d91800b  ! 87: WRPR_WSTATE_R	wrpr	%r6, %r11, %wstate
	.word 0x91d02033  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1a009c0  ! 89: FDIVd	fdivd	%f0, %f0, %f16
cmp_0_64:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_64:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_64
    nop
cmp_wait0_64:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_64
    nop
    ba,a cmp_startwait0_64
continue_cmp_0_64:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xce, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c00c  ! 90: WRPR_PIL_R	wrpr	%r11, %r12, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_65)+32, 16, 16)) -> intp(0,1,3)
xir_0_65:
	.word 0xa9842388  ! 91: WR_SET_SOFTINT_I	wr	%r16, 0x0388, %set_softint
change_to_randtl_0_66:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_66:
	.word 0x8f902000  ! 92: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	setx 0xb59aad4a158a1aa6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_67:
	.word 0x39400001  ! 93: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_68) + 0, 16, 16)) -> intp(1,0,27)
intvec_0_68:
	.word 0x39400001  ! 94: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902eeb  ! 95: WRPR_PSTATE_I	wrpr	%r0, 0x0eeb, %pstate
	.word 0xe08008a0  ! 96: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8d903452  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x1452, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 98: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0c7e000  ! 99: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	setx 0x229a80922bae2fdd, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_69:
	.word 0x39400001  ! 100: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_70:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 101: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x81460000  ! 102: RD_STICK_REG	stbar
cmp_0_71:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_71:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_71
    nop
cmp_wait0_71:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_71
    nop
    ba,a cmp_startwait0_71
continue_cmp_0_71:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x68, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9190400a  ! 103: WRPR_PIL_R	wrpr	%r1, %r10, %pil
	.word 0x99902000  ! 104: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
change_to_randtl_0_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_72:
	.word 0x8f902001  ! 105: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_cmpr_0_73:
	setx 0x2e766701eaa583ee, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 106: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_74
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_74:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 107: CASA_R	casa	[%r31] %asi, %r10, %r16
	.word 0x26800001  ! 108: BL	bl,a	<label_0x1>
splash_hpstate_0_75:
	.word 0x8198254e  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054e, %hpstate
intveclr_0_76:
	setx 0xa0b2d34a8382912d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 110: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe00fc000  ! 111: LDUB_R	ldub	[%r31 + %r0], %r16
donret_0_77:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_77-donret_0_77-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xa62, %tstate
    wrhpr %g0, 0x2d7, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (0)
	done
donretarg_0_77:
	.word 0xe0ffe388  ! 112: SWAPA_I	swapa	%r16, [%r31 + 0x0388] %asi
change_to_randtl_0_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_78:
	.word 0x8f902000  ! 113: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f803b17  ! 114: SIR	sir	0x1b17
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9683dc7  ! 115: SDIVX_I	sdivx	%r0, 0xfffffdc7, %r20
memptr_0_80:
	set 0x60340000, %r31
	.word 0x85802cb2  ! 116: WRCCR_I	wr	%r0, 0x0cb2, %ccr
mondo_0_81:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3c0] %asi
	.word 0x9d94800a  ! 117: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
DS_0_82:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 118: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	setx 0x90f0f5275ebc3945, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_83:
	.word 0x39400001  ! 119: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_84:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3d0] %asi
	.word 0x9d91000c  ! 120: WRPR_WSTATE_R	wrpr	%r4, %r12, %wstate
	setx 0x01bce463f327887c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_85:
	.word 0x39400001  ! 121: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902004  ! 122: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
donret_0_86:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_86-donret_0_86), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x14ac, %tstate
    wrhpr %g0, 0x545, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (0)
	retry
donretarg_0_86:
	.word 0xe8ffecb2  ! 123: SWAPA_I	swapa	%r20, [%r31 + 0x0cb2] %asi
DS_0_87:
	.word 0xa5a509c0  ! 1: FDIVd	fdivd	%f20, %f0, %f18
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd514c008  ! 1: LDQF_R	-	[%r19, %r8], %f10
	.word 0x99a40830  ! 124: FADDs	fadds	%f16, %f16, %f12
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_88
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_88:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e010  ! 125: CASA_R	casa	[%r31] %asi, %r16, %r12
splash_cmpr_0_89:
	setx 0xec595ff035657877, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 126: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_90) + 56, 16, 16)) -> intp(7,0,30)
intvec_0_90:
	.word 0x39400001  ! 127: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_91:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_91:
	.word 0x8f902000  ! 128: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
intveclr_0_92:
	setx 0xe795c18189dc85ac, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 129: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    set 0x23a8, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b347ea  ! 130: PDISTN	fmean16	%d44, %d10, %d10
	.word 0xd477c000  ! 131: STX_R	stx	%r10, [%r31 + %r0]
	setx 0x3f63865cbe5a070f, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_93:
	.word 0x39400001  ! 132: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 133: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_94:
	setx 0x5ac64cee97f8706c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 134: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_95
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_95:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e00a  ! 135: CASA_R	casa	[%r31] %asi, %r10, %r10
	.word 0x8d9029ef  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x09ef, %pstate
	.word 0x99902001  ! 137: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
memptr_0_96:
	set user_data_start, %r31
	.word 0x8584a275  ! 138: WRCCR_I	wr	%r18, 0x0275, %ccr
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_97
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_97
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_97:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 139: RDPC	rd	%pc, %r11
cmp_0_98:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_98:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_98
    nop
cmp_wait0_98:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_98
    nop
    ba,a cmp_startwait0_98
continue_cmp_0_98:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x66, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9191c00b  ! 140: WRPR_PIL_R	wrpr	%r7, %r11, %pil
memptr_0_99:
	set user_data_start, %r31
	.word 0x85817ff8  ! 141: WRCCR_I	wr	%r5, 0x1ff8, %ccr
splash_hpstate_0_100:
	.word 0x81982a57  ! 142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a57, %hpstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_101
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_101
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_101:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 143: RDPC	rd	%pc, %r10
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_102
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_102
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_102:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 144: RDPC	rd	%pc, %r12
	.word 0x8d90210c  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x010c, %pstate
	.word 0x3a700001  ! 146: BPCC	<illegal instruction>
    set 0x3dc7, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x9bb347e2  ! 147: PDISTN	fmean16	%d44, %d2, %d44
splash_cmpr_0_103:
	setx 0x5678252c350a5729, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 148: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_104:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x83552121	! Random illegal ?
	.word 0xa5a449c8  ! 1: FDIVd	fdivd	%f48, %f8, %f18
	.word 0x93a28826  ! 149: FADDs	fadds	%f10, %f6, %f9
mondo_0_105:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3e0] %asi
	.word 0x9d948014  ! 150: WRPR_WSTATE_R	wrpr	%r18, %r20, %wstate
	.word 0xa350c000  ! 151: RDPR_TT	<illegal instruction>
memptr_0_106:
	set 0x60540000, %r31
	.word 0x8584ee50  ! 152: WRCCR_I	wr	%r19, 0x0e50, %ccr
	setx 0x55f234cf58f1cdef, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_107:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9810005  ! 154: WR_SET_SOFTINT_R	wr	%r4, %r5, %set_softint
	.word 0xe297e020  ! 155: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_108
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_108
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_108:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 156: RDPC	rd	%pc, %r18
	setx 0x18e503a37c3c2df0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_109:
	.word 0x39400001  ! 157: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9b480000  ! 158: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xa9a00163  ! 159: FABSq	dis not found

DS_0_110:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f22, %f26, %f24
	.word 0x95b08300  ! 160: ALIGNADDRESS	alignaddr	%r2, %r0, %r10
	.word 0x2a700001  ! 161: BPCS	<illegal instruction>
DS_0_111:
	.word 0x97a089c7  ! 1: FDIVd	fdivd	%f2, %f38, %f42
	allclean
	.word 0xa9b20314  ! 162: ALIGNADDRESS	alignaddr	%r8, %r20, %r20
debug_0_112:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 163: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa969be3c  ! 164: SDIVX_I	sdivx	%r6, 0xfffffe3c, %r20
	.word 0xe897e020  ! 165: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r20
	.word 0xe8dfe020  ! 166: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_114
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_114
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_114:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 167: RDPC	rd	%pc, %r18
	.word 0xe48008a0  ! 168: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
cmp_0_115:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_115:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_115
    nop
cmp_wait0_115:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_115
    nop
    ba,a cmp_startwait0_115
continue_cmp_0_115:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x7a, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91900012  ! 169: WRPR_PIL_R	wrpr	%r0, %r18, %pil
debug_0_116:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 170: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02033  ! 171: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_0_117:
	setx 0xeef09d3606d80ac9, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 172: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_118:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 173: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe457fe3c  ! 174: LDSH_I	ldsh	[%r31 + 0xfffffe3c], %r18
tagged_0_119:
	taddcctv %r6, 0x1cfc, %r23
	.word 0xe407fe3c  ! 175: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
pmu_0_120:
	nop
	setx 0xfffff1aefffff5c3, %g1, %g7
	.word 0xa3800007  ! 176: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_0_121:
	setx 0x1992babfe0c44431, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 177: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_122:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3d0] %asi
	.word 0x9d94c001  ! 178: WRPR_WSTATE_R	wrpr	%r19, %r1, %wstate
tagged_0_123:
	taddcctv %r3, 0x1d91, %r17
	.word 0xe407fe3c  ! 179: LDUW_I	lduw	[%r31 + 0xfffffe3c], %r18
	.word 0x83d020b4  ! 180: Tcc_I	te	icc_or_xcc, %r0 + 180
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xe45fc000  ! 181: LDX_R	ldx	[%r31 + %r0], %r18
debug_0_124:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 182: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_125:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3e0] %asi
	.word 0x9d90000d  ! 183: WRPR_WSTATE_R	wrpr	%r0, %r13, %wstate
cmp_0_126:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_126:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_126
    nop
cmp_wait0_126:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_126
    nop
    ba,a cmp_startwait0_126
continue_cmp_0_126:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 4, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194c011  ! 184: WRPR_PIL_R	wrpr	%r19, %r17, %pil
	setx 0x7d093a0e4bcec2dc, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_127:
	.word 0x39400001  ! 185: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_128) + 16, 16, 16)) -> intp(5,0,19)
intvec_0_128:
	.word 0x39400001  ! 186: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99a0016d  ! 187: FABSq	dis not found

debug_0_129:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_129:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_129
    nop
debug_wait0_129:
    ld [%r23], %r16
    brnz %r16, debug_wait0_129
    nop
    ba,a debug_startwait0_129
continue_debug_0_129:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_129:
    cmp %r13, %r15
    bne,a wait_for_stat_0_129
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_129:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_129
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %8, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 188: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_130
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_130:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e00d  ! 189: CASA_R	casa	[%r31] %asi, %r13, %r12
splash_lsu_0_131:
	setx 0xf03db7498862f2f3, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 190: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91a00169  ! 191: FABSq	dis not found

	.word 0xd0cfe010  ! 192: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
intveclr_0_132:
	setx 0x0bd805c169908825, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 193: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 50
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_133
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_133
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_133:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 195: RDPC	rd	%pc, %r16
splash_cmpr_0_134:
	setx 0x3fd76f5ebce58ee3, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 196: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_135:
	setx 0xbc14fe494ad33c7b, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 197: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe06ffe3c  ! 198: LDSTUB_I	ldstub	%r16, [%r31 + 0xfffffe3c]
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_136
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_136:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e009  ! 199: CASA_R	casa	[%r31] %asi, %r9, %r16
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_137
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_137
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_137:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 200: RDPC	rd	%pc, %r12
	.word 0x3e800001  ! 201: BVC	bvc,a	<label_0x1>
intveclr_0_138:
	setx 0xdccceab7dabee95c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 202: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_139:
	setx 0x0df691f80ea25bb9, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 203: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x83d02032  ! 204: Tcc_I	te	icc_or_xcc, %r0 + 50
donret_0_140:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_140-donret_0_140), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x6fd, %tstate
    wrhpr %g0, 0x65f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (0)
	retry
donretarg_0_140:
	.word 0xd8fffe3c  ! 205: SWAPA_I	swapa	%r12, [%r31 + 0xfffffe3c] %asi
splash_htba_0_141:
	set 0x00380000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x00380000, %r12
	.word 0x8b98000c  ! 206: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
splash_cmpr_0_142:
	setx 0x4643a9b69e5d8401, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 207: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_143:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 208: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_hpstate_0_144:
	.word 0x81982f34  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f34, %hpstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_145
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_145:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 210: CASA_R	casa	[%r31] %asi, %r9, %r12
splash_cmpr_0_146:
	setx 0xe5b6da717d216f42, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 211: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_147:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_147:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_147
    nop
debug_wait0_147:
    ld [%r23], %r16
    brnz %r16, debug_wait0_147
    nop
    ba,a debug_startwait0_147
continue_debug_0_147:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_147:
    cmp %r13, %r15
    bne,a wait_for_stat_0_147
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_147:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_147
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %14, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe4f00492  ! 212: STXA_R	stxa	%r18, [%r0 + %r18] 0x24
	.word 0xab81a80c  ! 213: WR_CLEAR_SOFTINT_I	wr	%r6, 0x080c, %clear_softint
intveclr_0_148:
	setx 0x30ac0f367b175eb1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 214: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_149)+40, 16, 16)) -> intp(0,1,3)
xir_0_149:
	.word 0xa9802e3d  ! 215: WR_SET_SOFTINT_I	wr	%r0, 0x0e3d, %set_softint
pmu_0_150:
	nop
	setx 0xffffff72fffffff1, %g1, %g7
	.word 0xa3800007  ! 216: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
change_to_randtl_0_151:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_151:
	.word 0x8f902003  ! 217: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x26700001  ! 218: BPL	<illegal instruction>
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_152) + 32, 16, 16)) -> intp(4,0,1)
intvec_0_152:
	.word 0x39400001  ! 219: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9ba0016d  ! 220: FABSq	dis not found

cmp_0_153:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_153:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_153
    nop
cmp_wait0_153:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_153
    nop
    ba,a cmp_startwait0_153
continue_cmp_0_153:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x72, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91920013  ! 221: WRPR_PIL_R	wrpr	%r8, %r19, %pil
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_154
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_154
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_154:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 222: RDPC	rd	%pc, %r13
	.word 0x83d02034  ! 223: Tcc_I	te	icc_or_xcc, %r0 + 52
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_155
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_155:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 224: CASA_R	casa	[%r31] %asi, %r19, %r13
intveclr_0_156:
	setx 0xc9fa20ea4420b95e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 225: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
intveclr_0_157:
	setx 0x35470e9da0e6a3ef, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 226: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x99a0016d  ! 227: FABSq	dis not found

splash_cmpr_0_158:
	setx 0x5a9ef43ed90de820, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 228: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_159
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_159
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_159:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 229: RDPC	rd	%pc, %r11
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_160
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_160
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_160:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 230: RDPC	rd	%pc, %r20
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_161
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_161
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_161:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 231: RDPC	rd	%pc, %r11
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_162
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_162
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_162:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 232: RDPC	rd	%pc, %r20
	setx 0x0fdb3b696e3b4e27, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_163:
	.word 0x39400001  ! 233: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_0_164:
	nop
	setx 0xfffff23fffffff26, %g1, %g7
	.word 0xa3800007  ! 234: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	setx 0x83b6503ee84dbc29, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_165:
	.word 0x39400001  ! 235: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976cf241  ! 236: SDIVX_I	sdivx	%r19, 0xfffff241, %r11
	.word 0x91d02034  ! 237: Tcc_I	ta	icc_or_xcc, %r0 + 52
mondo_0_167:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e0] %asi
	.word 0x9d92c009  ! 238: WRPR_WSTATE_R	wrpr	%r11, %r9, %wstate
splash_cmpr_0_168:
	setx 0x2f07619a82c5ff54, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 239: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_169:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3d0] %asi
	.word 0x9d92000d  ! 240: WRPR_WSTATE_R	wrpr	%r8, %r13, %wstate
mondo_0_170:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d8] %asi
	.word 0x9d93000c  ! 241: WRPR_WSTATE_R	wrpr	%r12, %r12, %wstate
splash_cmpr_0_171:
	setx 0x1cfd08ae362e9d22, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 242: WR_STICK_REG_R	wr	%r0, %r1, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_172) + 48, 16, 16)) -> intp(0,0,3)
intvec_0_172:
	.word 0x39400001  ! 243: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_173
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_173:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e00c  ! 244: CASA_R	casa	[%r31] %asi, %r12, %r11
	.word 0x9ba409d3  ! 245: FDIVd	fdivd	%f16, %f50, %f44
	.word 0xda8008a0  ! 246: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_hpstate_0_174:
	.word 0x81982686  ! 247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0686, %hpstate
	setx 0x3e335c7840da420c, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_175:
	.word 0x39400001  ! 248: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_176
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_176:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 249: CASA_R	casa	[%r31] %asi, %r19, %r13
	.word 0x97480000  ! 250: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xd64fc000  ! 251: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0xd60ff241  ! 252: LDUB_I	ldub	[%r31 + 0xfffff241], %r11
	.word 0x8d90295f  ! 253: WRPR_PSTATE_I	wrpr	%r0, 0x095f, %pstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_177
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_177
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_177:
    ta T_CHANGE_NONHPRIV
	.word 0x93414000  ! 254: RDPC	rd	%pc, %r9
splash_hpstate_0_178:
	.word 0x81982f5d  ! 255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5d, %hpstate
mondo_0_179:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d944001  ! 256: WRPR_WSTATE_R	wrpr	%r17, %r1, %wstate
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_180:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_180:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_180
    nop
debug_wait0_180:
    ld [%r23], %r16
    brnz %r16, debug_wait0_180
    nop
    ba,a debug_startwait0_180
continue_debug_0_180:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_180:
    cmp %r13, %r15
    bne,a wait_for_stat_0_180
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_180:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_180
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xd6f00492  ! 258: STXA_R	stxa	%r11, [%r0 + %r18] 0x24
	.word 0x91464000  ! 259: RD_STICK_CMPR_REG	rd	%-, %r8
intveclr_0_181:
	setx 0x9d01d54592aa5664, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 260: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1a409c8  ! 261: FDIVd	fdivd	%f16, %f8, %f16
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
	.word 0x9b414000  ! 262: RDPC	rd	%pc, %r13
cmp_0_183:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_183:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_183
    nop
cmp_wait0_183:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_183
    nop
    ba,a cmp_startwait0_183
continue_cmp_0_183:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xe0, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91940004  ! 263: WRPR_PIL_R	wrpr	%r16, %r4, %pil
intveclr_0_184:
	setx 0xcaed4a1803b7d34a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 264: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_185:
	setx 0x92e61bec3c6be79b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 265: WR_STICK_REG_R	wr	%r0, %r1, %-
mondo_0_186:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d94800c  ! 266: WRPR_WSTATE_R	wrpr	%r18, %r12, %wstate
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
    and %r14, 0x82, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91944013  ! 267: WRPR_PIL_R	wrpr	%r17, %r19, %pil
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_188
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_188:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e013  ! 268: CASA_R	casa	[%r31] %asi, %r19, %r13
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_189
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_189
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_189:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 269: RDPC	rd	%pc, %r11
intveclr_0_190:
	setx 0x467defa468927d51, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 270: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_191:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_191:
	.word 0x8f902000  ! 271: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_0_192:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 272: RESTORE_R	restore	%r31, %r0, %r31
mondo_0_193:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3d0] %asi
	.word 0x9d91000b  ! 273: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_194) + 48, 16, 16)) -> intp(7,0,26)
intvec_0_194:
	.word 0x39400001  ! 274: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_195:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3e0] %asi
	.word 0x9d94c008  ! 275: WRPR_WSTATE_R	wrpr	%r19, %r8, %wstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_196
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_196
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_196:
    ta T_CHANGE_NONHPRIV
	.word 0xa9414000  ! 276: RDPC	rd	%pc, %r20
debug_0_197:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 277: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x9b500000  ! 278: RDPR_TPC	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_198
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_198
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_198:
    ta T_CHANGE_NONHPRIV
	.word 0xa3414000  ! 279: RDPC	rd	%pc, %r17
pmu_0_199:
	nop
	setx 0xfffffcaefffff515, %g1, %g7
	.word 0xa3800007  ! 280: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9ba00164  ! 281: FABSq	dis not found

mondo_0_200:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c8] %asi
	.word 0x9d94800b  ! 282: WRPR_WSTATE_R	wrpr	%r18, %r11, %wstate
	.word 0x30800001  ! 283: BA	ba,a	<label_0x1>
pmu_0_201:
	nop
	setx 0xfffff069fffffeaa, %g1, %g7
	.word 0xa3800007  ! 284: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
mondo_0_202:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3d8] %asi
	.word 0x9d91c001  ! 285: WRPR_WSTATE_R	wrpr	%r7, %r1, %wstate
DS_0_203:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 286: RESTORE_R	restore	%r31, %r0, %r31
memptr_0_204:
	set user_data_start, %r31
	.word 0x858060b8  ! 287: WRCCR_I	wr	%r1, 0x00b8, %ccr
	.word 0x20800001  ! 288: BN	bn,a	<label_0x1>
pmu_0_205:
	nop
	setx 0xfffff982fffffa52, %g1, %g7
	.word 0xa3800007  ! 289: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_206) + 40, 16, 16)) -> intp(5,0,26)
intvec_0_206:
	.word 0x39400001  ! 290: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_207
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_207:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 291: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8d90344d  ! 292: WRPR_PSTATE_I	wrpr	%r0, 0x144d, %pstate
	.word 0xda37e0b8  ! 293: STH_I	sth	%r13, [%r31 + 0x00b8]
DS_0_208:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 294: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x2a800001  ! 295: BCS	bcs,a	<label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_209
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_209:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e001  ! 296: CASA_R	casa	[%r31] %asi, %r1, %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01967  ! 297: FqTOd	dis not found

debug_0_211:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 298: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
mondo_0_212:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3e0] %asi
	.word 0x9d91000b  ! 299: WRPR_WSTATE_R	wrpr	%r4, %r11, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956c64a4  ! 300: SDIVX_I	sdivx	%r17, 0x04a4, %r10
	.word 0x95a489d1  ! 301: FDIVd	fdivd	%f18, %f48, %f10
	.word 0x8d902846  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x0846, %pstate
intveclr_0_214:
	setx 0xa019cf260dcfb7c4, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 303: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01968  ! 304: FqTOd	dis not found

    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_216
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_216
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_216:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 305: RDPC	rd	%pc, %r16
intveclr_0_217:
	setx 0x416075a945a9056d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 306: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa1500000  ! 307: RDPR_TPC	<illegal instruction>
	.word 0x93a009cc  ! 308: FDIVd	fdivd	%f0, %f12, %f40
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_218
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_218
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_218:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 309: RDPC	rd	%pc, %r19
donret_0_219:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_219-donret_0_219-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x20c, %tstate
    wrhpr %g0, 0xe95, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (0)
	done
donretarg_0_219:
	.word 0xe6ffe4a4  ! 310: SWAPA_I	swapa	%r19, [%r31 + 0x04a4] %asi
cmp_0_220:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_220:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_220
    nop
cmp_wait0_220:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_220
    nop
    ba,a cmp_startwait0_220
continue_cmp_0_220:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xfa, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91934003  ! 311: WRPR_PIL_R	wrpr	%r13, %r3, %pil
intveclr_0_221:
	setx 0xfbeaf8f143551bd8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 312: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_222:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c8] %asi
	.word 0x9d930014  ! 313: WRPR_WSTATE_R	wrpr	%r12, %r20, %wstate
	.word 0xe68008a0  ! 314: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x97454000  ! 315: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
donret_0_223:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_223-donret_0_223-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x2, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x9c9, %tstate
    wrhpr %g0, 0x205, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (0)
	done
donretarg_0_223:
	.word 0xd6ffe4a4  ! 316: SWAPA_I	swapa	%r11, [%r31 + 0x04a4] %asi
intveclr_0_224:
	setx 0x632898ebf69de533, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 317: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_hpstate_0_225:
	.word 0x81982926  ! 318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0926, %hpstate
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
	.word 0xa7414000  ! 319: RDPC	rd	%pc, %r19
	.word 0xe607c000  ! 320: LDUW_R	lduw	[%r31 + %r0], %r19
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_227
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_227:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 321: CASA_R	casa	[%r31] %asi, %r20, %r19
memptr_0_228:
	set user_data_start, %r31
	.word 0x8582ade3  ! 322: WRCCR_I	wr	%r10, 0x0de3, %ccr
	.word 0x91d02034  ! 323: Tcc_I	ta	icc_or_xcc, %r0 + 52
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_229
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_229:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e014  ! 324: CASA_R	casa	[%r31] %asi, %r20, %r19
	.word 0x8d9038de  ! 325: WRPR_PSTATE_I	wrpr	%r0, 0x18de, %pstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_230
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_230
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_230:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 326: RDPC	rd	%pc, %r8
mondo_0_231:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d91c011  ! 327: WRPR_WSTATE_R	wrpr	%r7, %r17, %wstate
debug_0_232:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 328: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_233)+0, 16, 16)) -> intp(0,1,3)
xir_0_233:
	.word 0xa981ff3e  ! 329: WR_SET_SOFTINT_I	wr	%r7, 0x1f3e, %set_softint
DS_0_234:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902003  ! 330: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x99902002  ! 331: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
mondo_0_235:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r10, [%r0+0x3d8] %asi
	.word 0x9d934004  ! 332: WRPR_WSTATE_R	wrpr	%r13, %r4, %wstate
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 333: Tcc_R	ta	icc_or_xcc, %r0 + %r30
cmp_0_236:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_236:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_236
    nop
cmp_wait0_236:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_236
    nop
    ba,a cmp_startwait0_236
continue_cmp_0_236:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x8c, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91934007  ! 334: WRPR_PIL_R	wrpr	%r13, %r7, %pil
DS_0_237:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902004  ! 335: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd01fff3e  ! 336: LDD_I	ldd	[%r31 + 0xffffff3e], %r8
	.word 0x8d903820  ! 337: WRPR_PSTATE_I	wrpr	%r0, 0x1820, %pstate
	.word 0xd03fff3e  ! 338: STD_I	std	%r8, [%r31 + 0xffffff3e]
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01960  ! 339: FqTOd	dis not found

	.word 0x8d902c51  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x0c51, %pstate
pmu_0_239:
	nop
	setx 0xfffff469fffff9da, %g1, %g7
	.word 0xa3800007  ! 341: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_240
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_240
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_240:
    ta T_CHANGE_NONHPRIV
	.word 0x97414000  ! 342: RDPC	rd	%pc, %r11
mondo_0_241:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3c0] %asi
	.word 0x9d90400c  ! 343: WRPR_WSTATE_R	wrpr	%r1, %r12, %wstate
intveclr_0_242:
	setx 0x646cea5edeba5800, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 344: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x95454000  ! 345: RD_CLEAR_SOFTINT	rd	%clear_softint, %r10
mondo_0_243:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c8] %asi
	.word 0x9d92000a  ! 346: WRPR_WSTATE_R	wrpr	%r8, %r10, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01961  ! 347: FqTOd	dis not found

	.word 0x91540000  ! 348: RDPR_GL	<illegal instruction>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_245
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_245:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e001  ! 349: CASA_R	casa	[%r31] %asi, %r1, %r8
	.word 0x95a0016a  ! 350: FABSq	dis not found

memptr_0_246:
	set user_data_start, %r31
	.word 0x85812a4b  ! 351: WRCCR_I	wr	%r4, 0x0a4b, %ccr
	.word 0xd477c000  ! 352: STX_R	stx	%r10, [%r31 + %r0]
	.word 0x8d9027de  ! 353: WRPR_PSTATE_I	wrpr	%r0, 0x07de, %pstate
memptr_0_247:
	set 0x60140000, %r31
	.word 0x858538e6  ! 354: WRCCR_I	wr	%r20, 0x18e6, %ccr
	.word 0xd46ff8e6  ! 355: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
    set 0x3a15, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x95b407ed  ! 356: PDISTN	fmean16	%d16, %d44, %d10
mondo_0_248:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d900007  ! 357: WRPR_WSTATE_R	wrpr	%r0, %r7, %wstate
	.word 0x26800001  ! 358: BL	bl,a	<label_0x1>
pmu_0_249:
	nop
	setx 0xffffff1dffffff8a, %g1, %g7
	.word 0xa3800007  ! 359: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0xd46ff8e6  ! 360: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffff8e6]
change_to_randtl_0_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_250:
	.word 0x8f902000  ! 361: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
debug_0_251:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 362: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_252
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_252:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e007  ! 363: CASA_R	casa	[%r31] %asi, %r7, %r10
debug_0_253:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 364: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x99902000  ! 365: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_254)+40, 16, 16)) -> intp(0,1,3)
xir_0_254:
	.word 0xa982f0a8  ! 366: WR_SET_SOFTINT_I	wr	%r11, 0x10a8, %set_softint
	.word 0x8d902ceb  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x0ceb, %pstate
intveclr_0_255:
	setx 0xf6d6e17539e3e168, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 368: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x9550c000  ! 369: RDPR_TT	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_256
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_256
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_256:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 370: RDPC	rd	%pc, %r10
	.word 0x95500000  ! 371: RDPR_TPC	<illegal instruction>
	.word 0xa945c000  ! 372: RD_TICK_CMPR_REG	rd	%-, %r20
splash_cmpr_0_257:
	setx 0x6ab36fc73cd7de7b, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 373: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_258:
	setx 0xe5a4969cba6a79bd, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 374: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x9f4448addab52b12, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_259:
	.word 0x39400001  ! 375: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa7480000  ! 376: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_260
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_260:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e007  ! 377: CASA_R	casa	[%r31] %asi, %r7, %r19
mondo_0_261:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d94800a  ! 378: WRPR_WSTATE_R	wrpr	%r18, %r10, %wstate
intveclr_0_262:
	setx 0xb94392c971d8831e, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 379: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_263:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 380: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0xe68008a0  ! 381: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe63fc000  ! 382: STD_R	std	%r19, [%r31 + %r0]
cmp_0_264:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_264:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_264
    nop
cmp_wait0_264:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_264
    nop
    ba,a cmp_startwait0_264
continue_cmp_0_264:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xd4, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91934007  ! 383: WRPR_PIL_R	wrpr	%r13, %r7, %pil
splash_cmpr_0_265:
	setx 0xf3508631479e3b36, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 384: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_266:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 385: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	setx 0x8cf761905c07951a, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_267:
	.word 0x39400001  ! 386: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d903ce0  ! 387: WRPR_PSTATE_I	wrpr	%r0, 0x1ce0, %pstate
	.word 0x28700001  ! 388: BPLEU	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_268
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_268
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_268:
    ta T_CHANGE_NONHPRIV
	.word 0x99414000  ! 389: RDPC	rd	%pc, %r12
	.word 0xad816e23  ! 390: WR_SOFTINT_REG_I	wr	%r5, 0x0e23, %softint
splash_decr_0_269:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa784800c  ! 391: WR_GRAPHICS_STATUS_REG_R	wr	%r18, %r12, %-
DS_0_270:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd734f846  ! 1: STQF_I	-	%f11, [0x1846, %r19]
	normalw
	.word 0xa5458000  ! 392: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0xe537c000  ! 393: STQF_R	-	%f18, [%r0, %r31]
intveclr_0_271:
	setx 0xe524e6eae64da1c1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 394: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_272
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_272
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_272:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 395: RDPC	rd	%pc, %r16
mondo_0_273:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e8] %asi
	.word 0x9d908009  ! 396: WRPR_WSTATE_R	wrpr	%r2, %r9, %wstate
	.word 0xe08008a0  ! 397: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x26800001  ! 398: BL	bl,a	<label_0x1>
splash_cmpr_0_274:
	setx 0x80cebdb96fbff56f, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 399: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa768e2b9  ! 400: SDIVX_I	sdivx	%r3, 0x02b9, %r19
DS_0_276:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902002  ! 401: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
intveclr_0_277:
	setx 0x16e59a532cbba17d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 402: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_278:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 403: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
pmu_0_279:
	nop
	setx 0xfffff7a3fffff076, %g1, %g7
	.word 0xa3800007  ! 404: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmp_0_280:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_280:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_280
    nop
cmp_wait0_280:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_280
    nop
    ba,a cmp_startwait0_280
continue_cmp_0_280:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 62, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950010  ! 405: WRPR_PIL_R	wrpr	%r20, %r16, %pil
debug_0_281:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 406: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
donret_0_282:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_282-donret_0_282), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1d58, %tstate
    wrhpr %g0, 0x65e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (0)
	retry
donretarg_0_282:
	.word 0xe6ffe2b9  ! 407: SWAPA_I	swapa	%r19, [%r31 + 0x02b9] %asi
mondo_0_283:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d934000  ! 408: WRPR_WSTATE_R	wrpr	%r13, %r0, %wstate
splash_tba_0_284:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 409: WRPR_TBA_R	wrpr	%r0, %r12, %tba
splash_decr_0_285:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r6, [%r1] 0x45
	.word 0xa7830012  ! 410: WR_GRAPHICS_STATUS_REG_R	wr	%r12, %r18, %-
	.word 0x93a00167  ! 411: FABSq	dis not found

intveclr_0_286:
	setx 0xb7a20369cbb68f24, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 412: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_287:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_287:
	.word 0x8f902001  ! 413: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
tagged_0_288:
	tsubcctv %r11, 0x161d, %r23
	.word 0xd207e2b9  ! 414: LDUW_I	lduw	[%r31 + 0x02b9], %r9
	.word 0x91d020b4  ! 415: Tcc_I	ta	icc_or_xcc, %r0 + 180
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 416: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903ad6  ! 417: WRPR_PSTATE_I	wrpr	%r0, 0x1ad6, %pstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_289
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_289
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_289:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 418: RDPC	rd	%pc, %r18
tagged_0_290:
	tsubcctv %r7, 0x1f1a, %r24
	.word 0xe407e2b9  ! 419: LDUW_I	lduw	[%r31 + 0x02b9], %r18
	.word 0x93a00166  ! 420: FABSq	dis not found

memptr_0_291:
	set user_data_start, %r31
	.word 0x8581a84e  ! 421: WRCCR_I	wr	%r6, 0x084e, %ccr
splash_cmpr_0_292:
	setx 0x3fc0d9bacb888b01, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 422: WR_STICK_REG_R	wr	%r0, %r1, %-
DS_0_293:
	.word 0x99a349c8  ! 1: FDIVd	fdivd	%f44, %f8, %f12
	.word 0xbfe7c000  ! 423: SAVE_R	save	%r31, %r0, %r31
	.word 0xd8dfe000  ! 424: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
	.word 0x97a0c9c1  ! 425: FDIVd	fdivd	%f34, %f32, %f42
memptr_0_294:
	set user_data_start, %r31
	.word 0x8580b6a7  ! 426: WRCCR_I	wr	%r2, 0x16a7, %ccr
donret_0_295:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_295-donret_0_295-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x1a5b, %tstate
    wrhpr %g0, 0xf1f, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (0)
	done
donretarg_0_295:
	.word 0xd6fff6a7  ! 427: SWAPA_I	swapa	%r11, [%r31 + 0xfffff6a7] %asi
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_296
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_296:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e001  ! 428: CASA_R	casa	[%r31] %asi, %r1, %r11
mondo_0_297:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d0] %asi
	.word 0x9d90800b  ! 429: WRPR_WSTATE_R	wrpr	%r2, %r11, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91a01964  ! 430: FqTOd	dis not found

	.word 0xa5a00161  ! 431: FABSq	dis not found

tagged_0_299:
	taddcctv %r21, 0x1673, %r21
	.word 0xe407f6a7  ! 432: LDUW_I	lduw	[%r31 + 0xfffff6a7], %r18
	.word 0x9ba00164  ! 433: FABSq	dis not found

	.word 0x9b540000  ! 434: RDPR_GL	<illegal instruction>
splash_cmpr_0_300:
	setx 0xee70272083885372, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 435: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_decr_0_301:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r10, [%r1] 0x45
	.word 0xa7850009  ! 436: WR_GRAPHICS_STATUS_REG_R	wr	%r20, %r9, %-
	.word 0xda800a80  ! 437: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r13
pmu_0_302:
	nop
	setx 0xfffff092fffff980, %g1, %g7
	.word 0xa3800007  ! 438: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
DS_0_303:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 439: RESTORE_R	restore	%r31, %r0, %r31
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_304) + 40, 16, 16)) -> intp(5,0,19)
intvec_0_304:
	.word 0x39400001  ! 440: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xda6ff6a7  ! 441: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffff6a7]
	.word 0xda8fe010  ! 442: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
intveclr_0_305:
	setx 0x2ec0f11a60d187fa, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 443: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
memptr_0_306:
	set user_data_start, %r31
	.word 0x8582fae0  ! 444: WRCCR_I	wr	%r11, 0x1ae0, %ccr
	.word 0xda6ffae0  ! 445: LDSTUB_I	ldstub	%r13, [%r31 + 0xfffffae0]
intveclr_0_307:
	setx 0xfe6f1b69b415f365, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 446: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
debug_0_308:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 447: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
cmp_0_309:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_309:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_309
    nop
cmp_wait0_309:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_309
    nop
    ba,a cmp_startwait0_309
continue_cmp_0_309:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x4a, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950010  ! 448: WRPR_PIL_R	wrpr	%r20, %r16, %pil
splash_tba_0_310:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 449: WRPR_TBA_R	wrpr	%r0, %r12, %tba
	.word 0x95a509c7  ! 450: FDIVd	fdivd	%f20, %f38, %f10
cmp_0_311:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_311:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_311
    nop
cmp_wait0_311:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_311
    nop
    ba,a cmp_startwait0_311
continue_cmp_0_311:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x6e, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9195000c  ! 451: WRPR_PIL_R	wrpr	%r20, %r12, %pil
cmp_0_312:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_312:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_312
    nop
cmp_wait0_312:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_312
    nop
    ba,a cmp_startwait0_312
continue_cmp_0_312:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x74, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c001  ! 452: WRPR_PIL_R	wrpr	%r11, %r1, %pil
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 453: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f803b56  ! 454: SIR	sir	0x1b56
	.word 0xd46ffb56  ! 455: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
	.word 0xd46ffb56  ! 456: LDSTUB_I	ldstub	%r10, [%r31 + 0xfffffb56]
pmu_0_313:
	nop
	setx 0xfffff342fffff555, %g1, %g7
	.word 0xa3800007  ! 457: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
memptr_0_314:
	set 0x60140000, %r31
	.word 0x8582fcce  ! 458: WRCCR_I	wr	%r11, 0x1cce, %ccr
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 459: Tcc_R	ta	icc_or_xcc, %r0 + %r30
intveclr_0_315:
	setx 0x044ff6a7205585ac, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 460: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
donret_0_316:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_316-donret_0_316), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x165, %tstate
    wrhpr %g0, 0xac4, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (0)
	retry
donretarg_0_316:
	.word 0xd4fffcce  ! 461: SWAPA_I	swapa	%r10, [%r31 + 0xfffffcce] %asi
	.word 0x919168bb  ! 462: WRPR_PIL_I	wrpr	%r5, 0x08bb, %pil
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x5f
	.word 0xd45fc000  ! 463: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd53fc000  ! 464: STDF_R	std	%f10, [%r0, %r31]
	.word 0xd4dfe030  ! 465: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
mondo_0_317:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r3, [%r0+0x3d0] %asi
	.word 0x9d924014  ! 466: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
mondo_0_318:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3d8] %asi
	.word 0x9d924000  ! 467: WRPR_WSTATE_R	wrpr	%r9, %r0, %wstate
	.word 0x83d020b5  ! 468: Tcc_I	te	icc_or_xcc, %r0 + 181
debug_0_319:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 469: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
memptr_0_320:
	set 0x60540000, %r31
	.word 0x85823470  ! 470: WRCCR_I	wr	%r8, 0x1470, %ccr
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_321
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_321:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 471: CASA_R	casa	[%r31] %asi, %r0, %r10
	.word 0xd537f470  ! 472: STQF_I	-	%f10, [0x1470, %r31]
splash_cmpr_0_322:
	setx 0x66fcca7878e9e3f8, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 473: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_323
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_323:
    ta T_CHANGE_NONHPRIV
	.word 0xd5e7e000  ! 474: CASA_R	casa	[%r31] %asi, %r0, %r10
mondo_0_324:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c0] %asi
	.word 0x9d930004  ! 475: WRPR_WSTATE_R	wrpr	%r12, %r4, %wstate
splash_hpstate_0_325:
	.word 0x81982296  ! 476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0296, %hpstate
	.word 0x91a1c9cd  ! 477: FDIVd	fdivd	%f38, %f44, %f8
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_326
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_326
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_326:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 478: RDPC	rd	%pc, %r18
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_327
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_327:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e00d  ! 479: CASA_R	casa	[%r31] %asi, %r13, %r18
	.word 0x30700001  ! 480: BPA	<illegal instruction>
intveclr_0_328:
	setx 0x2e4cb9d4e958cc2c, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 481: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x0c51ec94e19ad6b7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_329:
	.word 0x39400001  ! 482: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
pmu_0_330:
	nop
	setx 0xfffffffbfffff709, %g1, %g7
	.word 0xa3800007  ! 483: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
debug_0_331:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 484: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
pmu_0_332:
	nop
	setx 0xfffff9e2fffff644, %g1, %g7
	.word 0xa3800007  ! 485: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x9b480000  ! 486: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xdb27c000  ! 487: STF_R	st	%f13, [%r0, %r31]
pmu_0_333:
	nop
	setx 0xfffff969fffffdce, %g1, %g7
	.word 0xa3800007  ! 488: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
donret_0_334:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_334-donret_0_334), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x3, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xcba, %tstate
    wrhpr %g0, 0x10e, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (0)
	retry
donretarg_0_334:
	.word 0xdafff470  ! 489: SWAPA_I	swapa	%r13, [%r31 + 0xfffff470] %asi
cmp_0_335:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_335:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_335
    nop
cmp_wait0_335:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_335
    nop
    ba,a cmp_startwait0_335
continue_cmp_0_335:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xdc, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9191c00c  ! 490: WRPR_PIL_R	wrpr	%r7, %r12, %pil
debug_0_336:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_336:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_336
    nop
debug_wait0_336:
    ld [%r23], %r16
    brnz %r16, debug_wait0_336
    nop
    ba,a debug_startwait0_336
continue_debug_0_336:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_336:
    cmp %r13, %r15
    bne,a wait_for_stat_0_336
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_336:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_336
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %15, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 491: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_337
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_337:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e00c  ! 492: CASA_R	casa	[%r31] %asi, %r12, %r13
memptr_0_338:
	set 0x60540000, %r31
	.word 0x85846fb6  ! 493: WRCCR_I	wr	%r17, 0x0fb6, %ccr
debug_0_339:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_339:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_339
    nop
debug_wait0_339:
    ld [%r23], %r16
    brnz %r16, debug_wait0_339
    nop
    ba,a debug_startwait0_339
continue_debug_0_339:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_339:
    cmp %r13, %r15
    bne,a wait_for_stat_0_339
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_339:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_339
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %9, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xe8f00492  ! 494: STXA_R	stxa	%r20, [%r0 + %r18] 0x24
	.word 0xda8008a0  ! 495: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda8008a0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda97e010  ! 497: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
change_to_randtl_0_340:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_340:
	.word 0x8f902000  ! 498: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
    set 0x2aba, %l3
    stxa    %l3, [%g0] ASI_SPARC_PWR_MGMT
	.word 0x91b087ed  ! 499: PDISTN	fmean16	%d2, %d44, %d8
pmu_0_341:
	nop
	setx 0xfffff48bfffffbfe, %g1, %g7
	.word 0xa3800007  ! 500: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_342
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_342:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e00d  ! 501: CASA_R	casa	[%r31] %asi, %r13, %r8
splash_htba_0_343:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 502: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_344
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_344
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_344:
    ta T_CHANGE_NONHPRIV
	.word 0xa7414000  ! 503: RDPC	rd	%pc, %r19
	setx 0xd93a290f57849838, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_345:
	.word 0x39400001  ! 504: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
donret_0_346:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_346-donret_0_346), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0x535, %tstate
    wrhpr %g0, 0x114, %htstate
	ta T_CHANGE_NONPRIV   ! rand=0 (0)
	retry
donretarg_0_346:
	.word 0xe6ffefb6  ! 505: SWAPA_I	swapa	%r19, [%r31 + 0x0fb6] %asi
	.word 0x91d020b2  ! 506: Tcc_I	ta	icc_or_xcc, %r0 + 178
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 507: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01974  ! 508: FqTOd	dis not found

cwp_0_348:
    set user_data_start, %o7
	.word 0x93902004  ! 509: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
cwp_0_349:
    set user_data_start, %o7
	.word 0x93902004  ! 510: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
cmp_0_350:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_350:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_350
    nop
cmp_wait0_350:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_350
    nop
    ba,a cmp_startwait0_350
continue_cmp_0_350:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xb6, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91904004  ! 511: WRPR_PIL_R	wrpr	%r1, %r4, %pil
	.word 0x9b450000  ! 512: RD_SET_SOFTINT	rd	%set_softint, %r13
intveclr_0_351:
	setx 0x68c6f924a0195550, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 513: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xda57c000  ! 514: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa56925fc  ! 515: SDIVX_I	sdivx	%r4, 0x05fc, %r18
memptr_0_353:
	set 0x60140000, %r31
	.word 0x8583644b  ! 516: WRCCR_I	wr	%r13, 0x044b, %ccr
	.word 0xe4bfe44b  ! 517: STDA_I	stda	%r18, [%r31 + 0x044b] %asi
	.word 0x91d02034  ! 518: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x97464000  ! 519: RD_STICK_CMPR_REG	rd	%-, %r11
intveclr_0_354:
	setx 0x87a68dd83477289a, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 520: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_0_355:
	nop
	setx 0xfffff337fffff750, %g1, %g7
	.word 0xa3800007  ! 521: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99a0c9d1  ! 522: FDIVd	fdivd	%f34, %f48, %f12
intveclr_0_356:
	setx 0xb26a2a1b9e5167a8, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 523: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 524: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
intveclr_0_357:
	setx 0xf3abc0cfd70c99a2, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 525: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xa7500000  ! 526: RDPR_TPC	rdpr	%tpc, %r19
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_358) + 16, 16, 16)) -> intp(1,0,26)
intvec_0_358:
	.word 0x39400001  ! 527: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_0_359:
	set 0x80000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r12
	.word 0x8b98000c  ! 528: WRHPR_HTBA_R	wrhpr	%r0, %r12, %htba
DS_0_360:
	.word 0xa3a209d3  ! 1: FDIVd	fdivd	%f8, %f50, %f48
	.word 0xd131b145  ! 1: STQF_I	-	%f8, [0x1145, %r6]
	normalw
	.word 0x91458000  ! 529: RD_SOFTINT_REG	rd	%softint, %r8
debug_0_361:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 530: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xd08008a0  ! 531: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa3450000  ! 532: RD_SET_SOFTINT	rd	%set_softint, %r17
	.word 0xe26ff145  ! 533: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
	.word 0xe26ff145  ! 534: LDSTUB_I	ldstub	%r17, [%r31 + 0xfffff145]
mondo_0_362:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3d0] %asi
	.word 0x9d934003  ! 535: WRPR_WSTATE_R	wrpr	%r13, %r3, %wstate
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 536: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28008a0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
intveclr_0_363:
	setx 0xa4c510f6989f630f, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 538: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_364:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r2, [%r0+0x3c0] %asi
	.word 0x9d924013  ! 539: WRPR_WSTATE_R	wrpr	%r9, %r19, %wstate
	.word 0xe21fc000  ! 540: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x99902000  ! 541: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xe337f145  ! 542: STQF_I	-	%f17, [0x1145, %r31]
DS_0_365:
	nop
	not %g0, %r12
	jmp %r12
	.word 0x9d902001  ! 543: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
cmp_0_366:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_366:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_366
    nop
cmp_wait0_366:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_366
    nop
    ba,a cmp_startwait0_366
continue_cmp_0_366:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x66, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194000a  ! 544: WRPR_PIL_R	wrpr	%r16, %r10, %pil
	.word 0xe247f145  ! 545: LDSW_I	ldsw	[%r31 + 0xfffff145], %r17
donret_0_367:
	nop
	ta	T_CHANGE_HPRIV	! macro
	rd %pc, %r12
	add %r12, (donretarg_0_367-donret_0_367-4), %r12
    add %r12, 0x4, %r11
    wrpr %g0, 0x1, %tl
    wrpr %g0, %r12, %tpc
    wrpr %g0, %r11, %tnpc
    wrpr %g0, 0xe6f, %tstate
    wrhpr %g0, 0xcc, %htstate
	ta T_CHANGE_NONHPRIV  ! rand=1 (0)
	done
donretarg_0_367:
	.word 0xe2fff145  ! 546: SWAPA_I	swapa	%r17, [%r31 + 0xfffff145] %asi
mondo_0_368:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d8] %asi
	.word 0x9d908003  ! 547: WRPR_WSTATE_R	wrpr	%r2, %r3, %wstate
DS_0_369:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x91b44303  ! 548: ALIGNADDRESS	alignaddr	%r17, %r3, %r8
	.word 0x91d020b3  ! 549: Tcc_I	ta	icc_or_xcc, %r0 + 179
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_370
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_370:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e003  ! 550: CASA_R	casa	[%r31] %asi, %r3, %r8
	setx 0xf1876bbc512ddbd6, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_371:
	.word 0x39400001  ! 551: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd09ff145  ! 552: LDDA_I	ldda	[%r31, + 0xfffff145] %asi, %r8
splash_lsu_0_372:
	setx 0x8eb3e5c4e534fee7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 553: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
debug_0_373:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 554: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9168246f  ! 555: SDIVX_I	sdivx	%r0, 0x046f, %r8
	.word 0xd137c000  ! 556: STQF_R	-	%f8, [%r0, %r31]
	.word 0xd00fe46f  ! 557: LDUB_I	ldub	[%r31 + 0x046f], %r8
	.word 0xd077e46f  ! 558: STX_I	stx	%r8, [%r31 + 0x046f]
splash_decr_0_375:
    nop
    ta T_CHANGE_HPRIV
    mov 8, %r1
    stxa %r20, [%r1] 0x45
	.word 0xa780c00c  ! 559: WR_GRAPHICS_STATUS_REG_R	wr	%r3, %r12, %-
splash_cmpr_0_376:
	setx 0x9e845f4fb66c70cf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 560: WR_STICK_REG_R	wr	%r0, %r1, %-
	.word 0x97a489d2  ! 561: FDIVd	fdivd	%f18, %f18, %f42
mondo_0_377:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r0, [%r0+0x3c8] %asi
	.word 0x9d924014  ! 562: WRPR_WSTATE_R	wrpr	%r9, %r20, %wstate
cwp_0_378:
    set user_data_start, %o7
	.word 0x93902005  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_379
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_379:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e014  ! 564: CASA_R	casa	[%r31] %asi, %r20, %r11
	.word 0xa7a00173  ! 565: FABSq	dis not found

	.word 0x9b520000  ! 566: RDPR_PIL	<illegal instruction>
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_380
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_380
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_380:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 567: RDPC	rd	%pc, %r8
mondo_0_381:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r13, [%r0+0x3c8] %asi
	.word 0x9d91400b  ! 568: WRPR_WSTATE_R	wrpr	%r5, %r11, %wstate
mondo_0_382:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r8, [%r0+0x3d8] %asi
	.word 0x9d94000b  ! 569: WRPR_WSTATE_R	wrpr	%r16, %r11, %wstate
	.word 0xd03fe46f  ! 570: STD_I	std	%r8, [%r31 + 0x046f]
	.word 0xa1a0016a  ! 571: FABSq	dis not found

	.word 0xe06fe46f  ! 572: LDSTUB_I	ldstub	%r16, [%r31 + 0x046f]
debug_0_383:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 573: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91d02035  ! 574: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe08fe000  ! 575: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r16
intveclr_0_384:
	setx 0x18deb26184f34842, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 576: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 577: Tcc_I	tne	icc_or_xcc, %r0 + 51
debug_0_385:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 578: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_386
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_386:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e00a  ! 579: CASA_R	casa	[%r31] %asi, %r10, %r16
debug_0_387:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_387:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_387
    nop
debug_wait0_387:
    ld [%r23], %r16
    brnz %r16, debug_wait0_387
    nop
    ba,a debug_startwait0_387
continue_debug_0_387:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_387:
    cmp %r13, %r15
    bne,a wait_for_stat_0_387
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_387:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_387
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %12, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdef00492  ! 580: STXA_R	stxa	%r15, [%r0 + %r18] 0x24
pmu_0_388:
	nop
	setx 0xfffff77dfffff8cf, %g1, %g7
	.word 0xa3800007  ! 581: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmp_0_389:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_389:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_389
    nop
cmp_wait0_389:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_389
    nop
    ba,a cmp_startwait0_389
continue_cmp_0_389:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xb6, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194c00d  ! 582: WRPR_PIL_R	wrpr	%r19, %r13, %pil
change_to_randtl_0_390:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_390:
	.word 0x8f902001  ! 583: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01969  ! 584: FqTOd	dis not found

	.word 0x36700001  ! 585: BPGE	<illegal instruction>
mondo_0_392:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d944002  ! 586: WRPR_WSTATE_R	wrpr	%r17, %r2, %wstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9569606b  ! 587: SDIVX_I	sdivx	%r5, 0x006b, %r10
	.word 0x91a00164  ! 588: FABSq	dis not found

    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_394
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_394
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_394:
    ta T_CHANGE_NONHPRIV
	.word 0x91414000  ! 589: RDPC	rd	%pc, %r8
	.word 0xd0dfe000  ! 590: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
	.word 0xd0d7e000  ! 591: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	setx 0x2588df048ee3f7c7, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_395:
	.word 0x39400001  ! 592: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_396
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_396:
    ta T_CHANGE_NONHPRIV
	.word 0xd1e7e004  ! 593: CASA_R	casa	[%r31] %asi, %r4, %r8
intveclr_0_397:
	setx 0xb9a0e75c23d68f51, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 594: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
pmu_0_398:
	nop
	setx 0xfffffb4efffff07e, %g1, %g7
	.word 0xa3800007  ! 595: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x93d020b3  ! 596: Tcc_I	tne	icc_or_xcc, %r0 + 179
intveclr_0_399:
	setx 0x907384f320afb2dc, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 597: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xd03fe06b  ! 598: STD_I	std	%r8, [%r31 + 0x006b]
debug_0_400:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 599: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cmp_0_401:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_401:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_401
    nop
cmp_wait0_401:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_401
    nop
    ba,a cmp_startwait0_401
continue_cmp_0_401:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 10, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9192c012  ! 600: WRPR_PIL_R	wrpr	%r11, %r18, %pil
mondo_0_402:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3e8] %asi
	.word 0x9d91c012  ! 601: WRPR_WSTATE_R	wrpr	%r7, %r18, %wstate
	.word 0xa5a189d1  ! 602: FDIVd	fdivd	%f6, %f48, %f18
intveclr_0_403:
	setx 0xfac23521264d1fb6, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 603: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_404
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_404:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e011  ! 604: CASA_R	casa	[%r31] %asi, %r17, %r18
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01963  ! 605: FqTOd	dis not found

    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_406
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_406:
    ta T_CHANGE_NONHPRIV
	.word 0xe7e7e003  ! 606: CASA_R	casa	[%r31] %asi, %r3, %r19
	.word 0xe737e06b  ! 607: STQF_I	-	%f19, [0x006b, %r31]
pmu_0_407:
	nop
	setx 0xffffff5ffffff398, %g1, %g7
	.word 0xa3800007  ! 608: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
cmp_0_408:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_408:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_408
    nop
cmp_wait0_408:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_408
    nop
    ba,a cmp_startwait0_408
continue_cmp_0_408:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xfe, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x9194400d  ! 609: WRPR_PIL_R	wrpr	%r17, %r13, %pil
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01969  ! 610: FqTOd	dis not found

	.word 0xd737c000  ! 611: STQF_R	-	%f11, [%r0, %r31]
debug_0_410:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 612: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa96c7103  ! 613: SDIVX_I	sdivx	%r17, 0xfffff103, %r20
	.word 0x81510000  ! 614: RDPR_TICK	rdpr	%tick, %r0
	.word 0x91d02032  ! 615: Tcc_I	ta	icc_or_xcc, %r0 + 50
debug_0_412:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 616: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
	.word 0xe8800c80  ! 617: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r20
pmu_0_413:
	nop
	setx 0xfffffc11fffff043, %g1, %g7
	.word 0xa3800007  ! 618: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
	.word 0x99902001  ! 619: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_cmpr_0_414:
	setx 0xe6f17b383bef617e, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 620: WR_STICK_REG_R	wr	%r0, %r1, %-
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_415
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_415
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_415:
    ta T_CHANGE_NONHPRIV
	.word 0x95414000  ! 621: RDPC	rd	%pc, %r10
splash_lsu_0_416:
	setx 0xc266029481e7aba7, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 622: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd477f103  ! 623: STX_I	stx	%r10, [%r31 + 0xfffff103]
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_417
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_417
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_417:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 624: RDPC	rd	%pc, %r16
	.word 0x91d02032  ! 625: Tcc_I	ta	icc_or_xcc, %r0 + 50
intveclr_0_418:
	setx 0x6f2106991345d26d, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 626: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0x97a209c3  ! 627: FDIVd	fdivd	%f8, %f34, %f42
DS_0_419:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 628: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xab804013  ! 629: WR_CLEAR_SOFTINT_R	wr	%r1, %r19, %clear_softint
splash_cmpr_0_420:
	setx 0xf08bed1f454610bf, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 630: WR_STICK_REG_R	wr	%r0, %r1, %-
cmp_0_421:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_421:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_421
    nop
cmp_wait0_421:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_421
    nop
    ba,a cmp_startwait0_421
continue_cmp_0_421:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xf8, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91940014  ! 631: WRPR_PIL_R	wrpr	%r16, %r20, %pil
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_422)+16, 16, 16)) -> intp(0,1,3)
xir_0_422:
	.word 0xa980bd62  ! 632: WR_SET_SOFTINT_I	wr	%r2, 0x1d62, %set_softint
mondo_0_423:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e0] %asi
	.word 0x9d950003  ! 633: WRPR_WSTATE_R	wrpr	%r20, %r3, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_424
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_424:
    ta T_CHANGE_NONHPRIV
	.word 0xd7e7e003  ! 634: CASA_R	casa	[%r31] %asi, %r3, %r11
debug_0_425:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 635: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
intveclr_0_426:
	setx 0x46cb6cf9dcd8c9e3, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 636: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
mondo_0_427:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3d0] %asi
	.word 0x9d948009  ! 637: WRPR_WSTATE_R	wrpr	%r18, %r9, %wstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa96c71c3  ! 638: SDIVX_I	sdivx	%r17, 0xfffff1c3, %r20
intveclr_0_429:
	setx 0x657caaff4ddf06f0, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 639: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_430:
	setx 0x4afa86a4202ad0e1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 640: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0xa9073a4153448494, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_431:
	.word 0x39400001  ! 641: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_432:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d950004  ! 642: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_433
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_433
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_433:
    ta T_CHANGE_NONHPRIV
	.word 0xa5414000  ! 643: RDPC	rd	%pc, %r18
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_434
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_434:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 644: CASA_R	casa	[%r31] %asi, %r4, %r18
	setx 0x706052aa3f6ac753, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_435:
	.word 0x39400001  ! 645: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_436
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_436:
    ta T_CHANGE_NONHPRIV
	.word 0xe5e7e004  ! 646: CASA_R	casa	[%r31] %asi, %r4, %r18
splash_cmpr_0_437:
	setx 0xf762a617d261e813, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 647: WR_STICK_REG_R	wr	%r0, %r1, %-
intveclr_0_438:
	setx 0x13e41fd55ae1a9f1, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 648: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	.word 0xe4800c40  ! 649: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r18
DS_0_439:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x93a00541  ! 1: FSQRTd	fsqrt	
	.word 0x93a2c829  ! 650: FADDs	fadds	%f11, %f9, %f9
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
debug_0_440:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 652: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x99520000  ! 653: RDPR_PIL	<illegal instruction>
	setx 0xae878936ff6b3c30, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_441:
	.word 0x39400001  ! 654: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_442:
	setx 0x37499307380780f1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 655: WR_STICK_REG_R	wr	%r0, %r1, %-
debug_0_443:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 656: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_444
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_444:
    ta T_CHANGE_NONHPRIV
	.word 0xd9e7e009  ! 657: CASA_R	casa	[%r31] %asi, %r9, %r12
memptr_0_445:
	set 0x60140000, %r31
	.word 0x8580248d  ! 658: WRCCR_I	wr	%r0, 0x048d, %ccr
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_446
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_446
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_446:
    ta T_CHANGE_NONHPRIV
	.word 0x9b414000  ! 659: RDPC	rd	%pc, %r13
splash_cmpr_0_447:
	setx 0xf2af2ebef0c7e47c, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 660: WR_STICK_REG_R	wr	%r0, %r1, %-
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_448
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_448:
    ta T_CHANGE_NONHPRIV
	.word 0xdbe7e009  ! 661: CASA_R	casa	[%r31] %asi, %r9, %r13
cmp_0_449:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_449:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_449
    nop
cmp_wait0_449:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_449
    nop
    ba,a cmp_startwait0_449
continue_cmp_0_449:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0xb6, %r14     !Apply mask to random ..
	stxa %r14, [0x68]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91950004  ! 662: WRPR_PIL_R	wrpr	%r20, %r4, %pil
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01966  ! 663: FqTOd	dis not found

	.word 0x9ba0016b  ! 664: FABSq	dis not found

debug_0_451:
	nop
	mov 0x38, %r18
	.word 0xe6f00b12  ! 665: STXA_R	stxa	%r19, [%r0 + %r18] 0x58
cmp_0_452:
	nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmp_startwait0_452:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmp_0_452
    nop
cmp_wait0_452:
    ld [%r23], %r10
    brnz %r10, cmp_wait0_452
    nop
    ba,a cmp_startwait0_452
continue_cmp_0_452:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
    xnor %r14, %r13, %r14       !Bits equal
    and %r14, 0x76, %r14     !Apply mask to random ..
	stxa %r14, [0x60]%asi
	st %g0, [%r23]	!clear lock
	wr %r12, %r0, %asi
	ta T_CHANGE_NONHPRIV
	.word 0x91908003  ! 666: WRPR_PIL_R	wrpr	%r2, %r3, %pil
	.word 0xda6fe48d  ! 667: LDSTUB_I	ldstub	%r13, [%r31 + 0x048d]
	.word 0x9f803fb5  ! 668: SIR	sir	0x1fb5
mondo_0_453:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3e0] %asi
	.word 0x9d94c011  ! 669: WRPR_WSTATE_R	wrpr	%r19, %r17, %wstate
	.word 0x8d9031a6  ! 670: WRPR_PSTATE_I	wrpr	%r0, 0x11a6, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01974  ! 671: FqTOd	dis not found

	.word 0x95a289c4  ! 672: FDIVd	fdivd	%f10, %f4, %f10
memptr_0_455:
	set 0x60140000, %r31
	.word 0x85836ebb  ! 673: WRCCR_I	wr	%r13, 0x0ebb, %ccr
	nop
	mov 0x80, %g3
	stxa %g3, [%g3] 0x57
	.word 0xd45fc000  ! 674: LDX_R	ldx	[%r31 + %r0], %r10
intveclr_0_456:
	setx 0x00a0fe1519ff4757, %r1, %r28
	stxa %r28, [%g0] 0x72
	.word 0x25400001  ! 675: FBPLG	fblg,a,pn	%fcc0, <label_0x1>
	setx 0x334bd84c0082b388, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_457:
	.word 0x39400001  ! 676: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
debug_0_458:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 677: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
splash_tba_0_459:
	set 0x003c0000, %r12
	ld [%r12+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x003c0000, %r12
	.word 0x8b90000c  ! 678: WRPR_TBA_R	wrpr	%r0, %r12, %tba
    ta T_CHANGE_HPRIV
    mov (0+1), %r10
    set sync_thr_counter1, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, cwq_0_460
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_CWQ_SYNC] %asi, %l1
    and %l1, 0x3, %l1       ! Check if busy/enabled ..
    cmp %l1, 1
	bne cwq_0_460
    ldxa    [%g0 + ASI_SPU_CWQ_HEAD] %asi, %l2
    sub %l2, 0x40, %l2
    stxa    %l2, [%g0 + ASI_SPU_CWQ_HEAD] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
cwq_0_460:
    ta T_CHANGE_NONHPRIV
	.word 0xa1414000  ! 679: RDPC	rd	%pc, %r16
	setx 0xe5ef848b97a57804, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_461:
	.word 0x39400001  ! 680: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_462:
	nop
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c8] %asi
	.word 0x9d908011  ! 681: WRPR_WSTATE_R	wrpr	%r2, %r17, %wstate
    mov (0+1), %r10
    ta T_CHANGE_HPRIV
    set sync_thr_counter2, %r23
    cas [%r23],%g0,%r10         !lock
    brnz %r10, sma_0_463
    rd %asi, %r12
    wr %g0, 0x40, %asi
    ldxa [%g0 + ASI_SPU_MA_SYNC] %asi, %l1
	set 0x21fff, %g1
	stxa	%g1,	[%g0 + 0x80] %asi
    wr %r12, %g0, %asi
    st %g0, [%r23]
sma_0_463:
    ta T_CHANGE_NONHPRIV
	.word 0xe1e7e011  ! 682: CASA_R	casa	[%r31] %asi, %r17, %r16
cwp_0_464:
    set user_data_start, %o7
	.word 0x93902003  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
debug_0_465:
	nop
	mov 8, %r18
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
debug_startwait0_465:
    mov 0x1, %r16
    cas [%r23],%g0,%r16       !lock
    brz,a %r16, continue_debug_0_465
    nop
debug_wait0_465:
    ld [%r23], %r16
    brnz %r16, debug_wait0_465
    nop
    ba,a debug_startwait0_465
continue_debug_0_465:
    mov 0x0e, %r16
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_stat_0_465:
    cmp %r13, %r15
    bne,a wait_for_stat_0_465
    ldxa [0x58]%asi, %r15       !Running_status
    stxa %r16, [0x68]%asi 
    ldxa [0x50]%asi, %r14       !Running_rw
wait_for_debug_0_465:
    ldxa [0x58]%asi, %r15       !Running_status
    cmp %r14, %r15
    bne,a wait_for_debug_0_465
    ldxa [0x50]%asi, %r14       !Running_rw
    stxa %16, [%r18]0x42
    stxa  %r13, [0x50] %asi     ! Running_rw
    st %g0, [%r23]              !clear lock
    wr %r0, %r12, %asi          ! restore %asi
	.word 0xdcf00492  ! 684: STXA_R	stxa	%r14, [%r0 + %r18] 0x24
!$EV trig_pc_d(1, expr(@VA(.MAIN.xir_0_466)+0, 16, 16)) -> intp(0,1,3)
xir_0_466:
	.word 0xa9846c96  ! 685: WR_SET_SOFTINT_I	wr	%r17, 0x0c96, %set_softint
	.word 0x91a0016a  ! 686: FABSq	dis not found

debug_0_467:
	nop
	mov 0x38, %r18
	.word 0xfef00b12  ! 687: STXA_R	stxa	%r31, [%r0 + %r18] 0x58
	.word 0x91464000  ! 688: RD_STICK_CMPR_REG	rd	%-, %r8
!$EV trig_pc_d(1, expr(@VA(.MAIN.intvec_0_468) + 0, 16, 16)) -> intp(4,0,5)
intvec_0_468:
	.word 0x39400001  ! 689: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 690: Tcc_R	tne	icc_or_xcc, %r0 + %r30
memptr_0_469:
	set 0x60540000, %r31
	.word 0x8584f614  ! 691: WRCCR_I	wr	%r19, 0x1614, %ccr
splash_cmpr_0_470:
	setx 0x73376349c6907332, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 692: WR_STICK_REG_R	wr	%r0, %r1, %-
pmu_0_471:
	nop
	setx 0xfffff786fffff5de, %g1, %g7
	.word 0xa3800007  ! 693: WR_PERF_COUNTER_R	wr	%r0, %r7, %-
splash_cmpr_0_472:
	setx 0xbd22f255cc3a83b4, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	sub %g1, 100, %g1
	.word 0xb1800001  ! 694: WR_STICK_REG_R	wr	%r0, %r1, %-
	setx 0x8e284ff373f21723, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_473:
	.word 0x39400001  ! 695: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_474:
	setx 0x89d09cff0eb0625a, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 696: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_0_475:
	setx 0xf45f000e047b7029, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	sub %g1, 100, %g1
	.word 0xb1800001  ! 697: WR_STICK_REG_R	wr	%r0, %r1, %-
splash_lsu_0_476:
	setx 0x6b642b46d2cfb5ed, %r1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 698: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	setx 0xad3578f8f9d0b6e0, %r1, %r28
	stxa %r28, [%g0] 0x73
intvec_0_477:
	.word 0x39400001  ! 699: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa5a289c1  ! 700: FDIVd	fdivd	%f10, %f32, %f18
splash_tba_0_478:
	set 0x120000, %r12
	st %r1, [%r12+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r12
	.word 0x8b90000c  ! 701: WRPR_TBA_R	wrpr	%r0, %r12, %tba
cmpenall_0_479:
    nop
    nop
    ta T_CHANGE_HPRIV
    rd %asi, %r12
    wr %r0, 0x41, %asi
    set sync_thr_counter, %r23
cmpenall_startwait0_479:
    mov 1, %r10
    cas [%r23],%g0,%r10         !lock
    brz,a %r10, continue_cmpenall_0_479
    nop
cmpenall_wait0_479:
    ld [%r23], %r10
    brnz %r10, cmpenall_wait0_479
    nop
    ba,a cmpenall_startwait0_479
continue_cmpenall_0_479:
    ldxa [0x50]%asi, %r13       !Running_rw
    ldxa [0x58]%asi, %r14       !Running_status
wait_for_cmpstat_0_479:
    cmp %r13, %r15
    bne,a wait_for_cmpstat_0_479
    ldxa [0x58]%asi, %r15       !Running_status
    mov 0xff, %r14              !All threads running
    stxa %r14, [0x50]%asi 
    ldxa [0x58]%asi, %r15       !Running_status
wait_for_cmpstat2_0_479:
    cmp %r14, %r15
    bne,a wait_for_cmpstat2_0_479
    ldxa [0x58]%asi, %r15       !Running_status
    st %g0, [%r23]              !clear lock
	nop
	nop

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

	.xword	0x7f1c592cca3b8f7f
	.xword	0x06800a511b3197e7
	.xword	0xc2e9617f3eaa645d
	.xword	0x2fcbdae7615ce49d
	.xword	0xe93e9a032b447388
	.xword	0xc327d7ab0661a89d
	.xword	0x506e2c6719486c97
	.xword	0xc3a1b63c8e2f3b6f
	.xword	0xa3a9acf73b33a718
	.xword	0xe29cb01329163388
	.xword	0xd72cdda675e294e1
	.xword	0xdad03a456c8185ba
	.xword	0x490a302d4a531f01
	.xword	0x4e38b2299fecf9ba
	.xword	0x77a45b04d97f1147
	.xword	0xa301e03b7836e4c5
	.xword	0xda0d862216afecc0
	.xword	0x9f46b92bede1d2ba
	.xword	0x6b978086248f6e9a
	.xword	0x511b8627d943bcfe
	.xword	0x358c87bf0087cc04
	.xword	0xdfe9d6ac08c8b49d
	.xword	0x5c85d314ca8f44d1
	.xword	0x3ff09f758d93de14
	.xword	0xef7b3bc27b299249
	.xword	0x569fc747666623e7
	.xword	0x11a401b1ab558cec
	.xword	0x67aa94cf56281349
	.xword	0xd384527ec54dfc5f
	.xword	0x326cfc7fad25c062
	.xword	0x2aeab0cb1cf7f879
	.xword	0x18aedf0b97e905a5
	.xword	0x0836b4751f39003d
	.xword	0x66c969f09fdb149c
	.xword	0x3c9571fdb7e54342
	.xword	0x11e94bb5bb53c122
	.xword	0x319e000fd0243b52
	.xword	0xd20ee7ec69bcfbcf
	.xword	0x4e26a6fb0598ae09
	.xword	0x1af3f60e3b0da735
	.xword	0x4237d57fc1721f7f
	.xword	0xf83746936cdcf3a4
	.xword	0x9fceb976b5365348
	.xword	0xf51db3b2c6c3bdee
	.xword	0xc85a1ae3870f1e00
	.xword	0x0148d9a586845fb3
	.xword	0x9b34e688a838ae59
	.xword	0x87ad9fe7719e8cd4
	.xword	0x04823c02437fa0a8
	.xword	0xb9198179a913b844
	.xword	0x61ddbd404c7163fe
	.xword	0x0cbfd642a0fe1320
	.xword	0xc3be936341708ba6
	.xword	0x685ca12005114d01
	.xword	0xd5923dc7cb0dd988
	.xword	0xaeec0df49a8d3f98
	.xword	0x494eb488a183d33d
	.xword	0x254fc298caaaf409
	.xword	0x4124642155392adf
	.xword	0x8b25cc5d24c4a9b1
	.xword	0x3268a1f32005584e
	.xword	0x3c2bafc1054d6e84
	.xword	0x7adf906ebf9c4615
	.xword	0x1891ceea592fbb09
	.xword	0xfd07f0158eb68c24
	.xword	0x0a016b554f8ab2a1
	.xword	0xdd86542393de3480
	.xword	0xdd8aef2aabe58ad2
	.xword	0xbcadccef30b3a2eb
	.xword	0x611caca4db242589
	.xword	0xca6018118ab7e4c2
	.xword	0xbd7210ffdd0eb105
	.xword	0xee88cafc7f2c7135
	.xword	0x5b740784e48e657d
	.xword	0x005789f39783e607
	.xword	0x213ccbb071152f57
	.xword	0xe0679bada92c9f68
	.xword	0xa626b181ddf47125
	.xword	0x4fdc0f4b64d2137d
	.xword	0x54404c1791945e4a
	.xword	0x298f9173cf3f9870
	.xword	0x761b0b18707d84ab
	.xword	0x1ba9509ad70ac060
	.xword	0x5b82f8916582d2e4
	.xword	0xc96217bfb3408d5f
	.xword	0xd35975b62641c458
	.xword	0x10e8da6c3d4b26c3
	.xword	0xf6f36c5739614d84
	.xword	0xf4e1d9578fb59dcf
	.xword	0x1928133301607b0c
	.xword	0xa1ad5e3690ac9c01
	.xword	0x8336ec3d945cdf57
	.xword	0xcca439ece1d33900
	.xword	0x149e77a4e13656f3
	.xword	0x01807ba5203467b2
	.xword	0xf35f8ef7030949dc
	.xword	0x05861890c9dab2b5
	.xword	0x3161901ef0d0ee31
	.xword	0x7972224721137d8b
	.xword	0xdb3811a56f8a6026
	.xword	0x8369448b2687c722
	.xword	0x64259422cdbd742e
	.xword	0xadcd60dfe9d7f8f6
	.xword	0xb4354423099939ce
	.xword	0x15783aadfe812c55
	.xword	0xb75609a51799d2cb
	.xword	0x5ef779c8ac3f7cfa
	.xword	0x6ff247d32cf29d86
	.xword	0x9cfdf34abcd2d053
	.xword	0x3fc245286e40ee60
	.xword	0xa6f4a52bbc6d645c
	.xword	0x1c048e7911655935
	.xword	0xa927226c2988010f
	.xword	0xbb1f53e33984691d
	.xword	0x2f703ce500a37c2a
	.xword	0x3a13393d67c435a1
	.xword	0x85d02ee215c518c3
	.xword	0x75cd3292998d1b60
	.xword	0xb5c669e5d7fa068e
	.xword	0xdd03bc885a35eea2
	.xword	0x6b7118455ad0c8f5
	.xword	0x83c1741cdb244049
	.xword	0xb3d0778753a69c78
	.xword	0x8cd54529d2ddfc9a
	.xword	0x5dc3840c004249c0
	.xword	0xc39b655c3f60ec72
	.xword	0xa620527375ddde98
	.xword	0xfa3660ef7db44e71
	.xword	0x2adcc8c6c111e604
	.xword	0x4ec222fbe759c21a
	.xword	0x7ea81ba5234340a1
	.xword	0x7ffa50ac3b017ed5
	.xword	0xaa121a19b2dab5ab
	.xword	0xdb6b189a50aa1162
	.xword	0xddc685a9c93abd9e
	.xword	0xe8d68b5e6bc9f69e
	.xword	0x6857544c7b2abd3f
	.xword	0xaa91fabe995d52cc
	.xword	0xf354625b38ba580d
	.xword	0x9c9368b7789a4990
	.xword	0x6ec3c8a5d8972389
	.xword	0xc98acac0b3b51e65
	.xword	0x0ef04ccee0c49790
	.xword	0x81a0f0ac969b5523
	.xword	0xab95cfa29337a738
	.xword	0x54b99b243fc38ebb
	.xword	0x715f494748eae769
	.xword	0x906c5fa29421f9a4
	.xword	0xb2c49b268db4e03b
	.xword	0xde4dbbdb7bf55e91
	.xword	0x57e89ff51c805bee
	.xword	0x65774645fa1823c9
	.xword	0xd3bccced0b58f992
	.xword	0x88485b13bd65eb7d
	.xword	0x5147029140d68459
	.xword	0x1d246c7781d7c322
	.xword	0x162db5d10192ce92
	.xword	0x100fa181ca5b7293
	.xword	0x538532ad3313e980
	.xword	0xde18c0d47bca6bd3
	.xword	0x4d2a2d6930f073cd
	.xword	0x05adf9010765e8a3
	.xword	0x10b1a46d8001de67
	.xword	0x6855e99e52b46dc0
	.xword	0xcf091cbb63b5b85b
	.xword	0xb535254c3c8fcd15
	.xword	0x4c281e675f68ed83
	.xword	0x1b80a490633c1e79
	.xword	0x1d6d3af2c8fe2844
	.xword	0x10fea577675e2c74
	.xword	0x994626375e8b9acc
	.xword	0xfafdc1e788546145
	.xword	0x4e368a61b0808633
	.xword	0x485958cba0236ebc
	.xword	0xfaa656620373021e
	.xword	0xcc4046fa2fdc4435
	.xword	0x7497886748bf0e13
	.xword	0x7f77ca79d742ee0d
	.xword	0x3c5cb035c7800509
	.xword	0x942207c1dfa23062
	.xword	0x6648069a762a585e
	.xword	0x4c1ef6f9b143b540
	.xword	0x49b357444dbae861
	.xword	0x7d6691fb0efee223
	.xword	0x84cbe79e4365fc61
	.xword	0x91fdae0d690bcf89
	.xword	0x9f0853f6ce63c990
	.xword	0x4c474e172c1f74ff
	.xword	0x7f7299d6540e1f36
	.xword	0xade11b030b210506
	.xword	0xe12ef90481006330
	.xword	0xedfe6c56d1f0d3ad
	.xword	0xa2d86a89b83549d0
	.xword	0x34c80c51245ab017
	.xword	0x1394919e2f2a9400
	.xword	0xac9a797ab3b2c2e6
	.xword	0x489a8cb46ed5a2c6
	.xword	0x6eb3f5aef6ecbaa1
	.xword	0x0f8184043f133bec
	.xword	0x5b730328b10471e3
	.xword	0x3480a76d59ff3dbb
	.xword	0xd552f4670f89fd08
	.xword	0x8860a01db07f4fd3
	.xword	0x13945bda4e28841a
	.xword	0xe749c2dd2b2580a1
	.xword	0x9db135f6d72521ea
	.xword	0x6b9bd41f861127a6
	.xword	0x77dbdb519daf75e8
	.xword	0x6ccd4e7a645b11ca
	.xword	0x9b3c0efb1cebb86f
	.xword	0xa7514bfd03a0e6ea
	.xword	0x7acda8b5332ae0a2
	.xword	0xe1f93e9c648a8818
	.xword	0xc57eecb4d82d1aa3
	.xword	0x244aaebe2007b4e3
	.xword	0xa2ae07a335c821f9
	.xword	0xfc9f3201da492da7
	.xword	0x11e65f02eae2f105
	.xword	0x2e34ae8b59b421b6
	.xword	0x0211fd7b1cd9b8f5
	.xword	0xde24410a8203d688
	.xword	0x2529edcc4941564c
	.xword	0x02e8c220a663b64b
	.xword	0xf8024c06d5375dd4
	.xword	0xe55363fc26463f4b
	.xword	0x30b1d5f9b7afe670
	.xword	0x566959c1a4507da5
	.xword	0xdd481ce3341fb7a4
	.xword	0x4bd2d25393bb08e8
	.xword	0x19f671585abb1b6f
	.xword	0x821e3d47b9c81b68
	.xword	0xf87a3881f03ef5de
	.xword	0x9360b64a8ba48ab6
	.xword	0x2e7e36ef5c817900
	.xword	0x6a15b8453e95d2c4
	.xword	0x8522f83264dd6811
	.xword	0xa7e64aafa7bbf37b
	.xword	0x6b3dcd6701bc1de4
	.xword	0x7023b5563b700acf
	.xword	0x6e8767bba457a235
	.xword	0xc43104a651f2a942
	.xword	0xe82c721436ad7656
	.xword	0x0351ae15c394a343
	.xword	0x8fcb7d4963e32146
	.xword	0x5c06bc9f5b1f30bb
	.xword	0x3f72a47d3ea39f90
	.xword	0xdaa543a263dc710b
	.xword	0x02be03a9abca13b9
	.xword	0x4af58fd2896e66e0
	.xword	0xfc9727474b726f18
	.xword	0xfa929b7ffe56cc71
	.xword	0x410f5b6d58a96e62
	.xword	0xefa00f5fcd90d38d
	.xword	0xc110b501a404be59
	.xword	0x1f72d750969eb8b1
	.xword	0x3b4fe12a004893df

.global wdog_2_ext
# 9 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
.global wdog_2_ext
.global retry_with_base_tba

SECTION .HTRAPS
.text
retry_with_base_tba:
    set 0x120000, %r5
    set 0x7fff, %r3
    rdpr %tpc, %r4
    and %r4, %r3, %r4
    or %r5, %r4, %r4
    wrpr %r4, %tpc
    rdpr %tnpc, %r4
    and %r4, %r3, %r4
    or %r5, %r4, %r4
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
    rdhpr %htstate, %l3
    and %l3, 0x4, %l3    ! If previously in hpriv mode, go to hpriv 
    brnz,a %l3, wdog_2_goto_handler_1
    rdhpr %htba, %l3
    srlx %l1, 7, %l3     ! Send priv sw traps to priv mode ..
    cmp %l3, 0x2         ! 0x2 = priv sw trap, 0x3=hpriv sw trap ..
    be,a wdog_2_goto_handler_1
    rdpr %tba, %l3
    rdhpr %htba, %l3
wdog_2_goto_handler_1:
    sllx %l1, 5, %l1
    add %l1, %l3, %l3
    jmp %l3
    nop
# 73 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
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
# 507 "diag.j"
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
	TTE_NFO	 = 1,
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
	TTE_CP	 = 0,
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
	TTE_E	 = 1,
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
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 1,
	TTE_W	 = 1
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
	.xword	0x039909d27d47e11a
	.xword	0x4dff232205244e33
	.xword	0x163db0a59d6789a0
	.xword	0x89de4b14ec226f47
	.xword	0xda83d617ba4060f9
	.xword	0xa73e2f31430ee595
	.xword	0x753c131e26d68fde
	.xword	0x3290d0a3f91f56f8
	.xword	0xe3712a8cf179eb57
	.xword	0xd5e7f01c09417322
	.xword	0xc440699f5bb8c2e0
	.xword	0x0630a1dfdac1c18c
	.xword	0x27594ba83c55dafd
	.xword	0x752ca3c7f2bacf47
	.xword	0xd99971dfb9694797
	.xword	0x4b47d30111bb6a8b
	.xword	0xbc9620c619b62838
	.xword	0x81b2fc74d39d4c5a
	.xword	0x5b5e66baa9959f72
	.xword	0x410fbc9c91dd0f19
	.xword	0xcf0622bc85466fb8
	.xword	0x399c0e52318f79be
	.xword	0xa93028c1a00e1ca6
	.xword	0x78152b4b46a8456e
	.xword	0x61586405ee10226a
	.xword	0xe71305108e790289
	.xword	0x07ee845c17b9e384
	.xword	0xccad0bc14db3cafe
	.xword	0x1165f4fee55cef7b
	.xword	0x59cbf691d427c541
	.xword	0x8e6f5c1cc6ca0656
	.xword	0x2ce27a19469a7548



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
	TTE_CP	 = 0,
	TTE_CV	 = 0,
	TTE_E	 = 1,
	TTE_P	 = 0,
	TTE_W	 = 0
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
	.xword	0xeaccedc4cb453fa1
	.xword	0x31358c2a2212d9af
	.xword	0x56642896f6e97c48
	.xword	0x2229552c625428f3
	.xword	0xb50f8860459e548b
	.xword	0xa910a274f5dcdba8
	.xword	0xe65150b836c70cc4
	.xword	0xceff9d005b2ac2f9
	.xword	0x1161b74e32f28a61
	.xword	0x2faf821acb283c89
	.xword	0x5d36912e5a363b08
	.xword	0xc731fd05a1bde46b
	.xword	0x70f4f590a633804a
	.xword	0x4006aeb1af139ce9
	.xword	0x34c951b478b5f57b
	.xword	0x7a766d2c99435ac2
	.xword	0x376e1b79bc44dc23
	.xword	0x112f2b6cb1d8d15b
	.xword	0xcf4c84197b15af03
	.xword	0x338c5dc5acbe65a5
	.xword	0x4768358c798d17ab
	.xword	0xc42e2d1d727cf801
	.xword	0x742dbc1fb285f922
	.xword	0x3db16e1bcdd5ac58
	.xword	0x2a1631367e01373a
	.xword	0x96b1f7c5fe432a08
	.xword	0xe00117c30fdd79f5
	.xword	0xfef2e3bedcaf05e1
	.xword	0xebfdcb45441b973f
	.xword	0x9253b6dd1c11b531
	.xword	0xe69d956a9bb3e354
	.xword	0x4eb59eb4dce675f0



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
	TTE_NFO	 = 1,
	TTE_IE	 = 1,
	TTE_Soft2	 = 0,
	TTE_Diag	 = 0,
	TTE_Soft	 = 0,
	TTE_L	 = 0,
	TTE_CP	 = 1,
	TTE_CV	 = 0,
	TTE_E	 = 0,
	TTE_P	 = 1,
	TTE_W	 = 1
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
	.xword	0x7a1bae470d4df819
	.xword	0xb67e67548f672eb4
	.xword	0x20bc67b9980ac0ee
	.xword	0xb40286868f94f75c
	.xword	0x24b46bb6189f3153
	.xword	0xcd07d29bbc072735
	.xword	0x0ea7f8ce041d89cc
	.xword	0xc0f21700e136fd00
	.xword	0xa7d409a99e8c04eb
	.xword	0x235104542b470c49
	.xword	0xe94c38d45fd374d8
	.xword	0x9ab057b8e6f08164
	.xword	0xf9439cccf8501125
	.xword	0x4717288dd498c5ea
	.xword	0x87206820fce6cbd1
	.xword	0x8af8cf1f8aab7118
	.xword	0x0b584f2bdbc12b02
	.xword	0x7262e6785ced775e
	.xword	0x12dfa46a8bea08e0
	.xword	0xfdb73e96ec072bec
	.xword	0x42d8778f3090c8be
	.xword	0x1769e2354e4c400f
	.xword	0x23521d2fc0e1dc7e
	.xword	0xaae647dfaf728710
	.xword	0x5b7c7694fd338502
	.xword	0xc6b6e31c19d47927
	.xword	0x7ac3a8e61a04b4a4
	.xword	0xf13fa7eeb5b32fe3
	.xword	0xbde5dc7c784c7f2f
	.xword	0xafdf6b36ca5052f3
	.xword	0x6598da9dd46f531d
	.xword	0x88b9490487146bc9



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
	TTE_P	 = 1,
	TTE_W	 = 1
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
	.xword	0xfa7bda5f39cd4257
	.xword	0x804d384e45fdabce
	.xword	0x9e344c9358674628
	.xword	0xd08f98c02eeee2f6
	.xword	0x35c3b13657145c1c
	.xword	0xf3ad9e91725a5981
	.xword	0x7803c773e7c93db8
	.xword	0x1afacd42633dc75c
	.xword	0x2312dd7c9afafa53
	.xword	0xb0141b885c3fe5e3
	.xword	0x65e225fb5e4c8c97
	.xword	0xdaea564341a7390d
	.xword	0xff350533ab15c521
	.xword	0x89867e4967161b26
	.xword	0x00e13a7e4a5eb81c
	.xword	0xd8b5439ffe94e72a
	.xword	0x1f709c8937cfb28e
	.xword	0x1ae8d25cbb6af4fa
	.xword	0xd3cdd0b03b24484b
	.xword	0x6c9fbcec7d52bc54
	.xword	0x1510feec82661ed9
	.xword	0xa18878a141861965
	.xword	0x70f6e02297a9a6de
	.xword	0x727d29d9bbec6cf2
	.xword	0xe3e205513bb1bd56
	.xword	0x553e6fb6fbc58f6a
	.xword	0x94969dcda2aa0072
	.xword	0x2209dc2a733ce44c
	.xword	0x34dc7b9be13f8dfc
	.xword	0x1c3d665a31f6b047
	.xword	0xa7ba9211be7490cc
	.xword	0x8aec3194783ebf8b



#if 0
#endif

