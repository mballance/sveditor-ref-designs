/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_20.s
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
    rdpr %cleanwin, %g1;\
    add %g1,1,%g1;\
    wrpr %g1, %g0, %cleanwin;\
    retry; nop; nop; nop; nop

#define H_T1_Clean_Window_0x25
#define SUN_H_T1_Clean_Window_0x25 \
    rdpr %cleanwin, %g1;\
    add %g1,1,%g1;\
    wrpr %g1, %g0, %cleanwin;\
    retry; nop; nop; nop; nop

#define H_T1_Clean_Window_0x26
#define SUN_H_T1_Clean_Window_0x26 \
    rdpr %cleanwin, %g1;\
    add %g1,1,%g1;\
    wrpr %g1, %g0, %cleanwin;\
    retry; nop; nop; nop; nop

#define H_T1_Clean_Window_0x27
#define SUN_H_T1_Clean_Window_0x27 \
    rdpr %cleanwin, %g1;\
    add %g1,1,%g1;\
    wrpr %g1, %g0, %cleanwin;\
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
# 90 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_T1_Window_Spill_0_Normal_0x80
#define SUN_H_T1_Window_Spill_0_Normal_0x80 saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_1_Normal_0x84
#define SUN_H_T1_Window_Spill_1_Normal_0x84 saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_2_Normal_0x88
#define SUN_H_T1_Window_Spill_2_Normal_0x88 saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_3_Normal_0x8c
#define SUN_H_T1_Window_Spill_3_Normal_0x8c saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_4_Normal_0x90
#define SUN_H_T1_Window_Spill_4_Normal_0x90 saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_5_Normal_0x94
#define SUN_H_T1_Window_Spill_5_Normal_0x94 saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_6_Normal_0x98
#define SUN_H_T1_Window_Spill_6_Normal_0x98 saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_7_Normal_0x9c
#define SUN_H_T1_Window_Spill_7_Normal_0x9c saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_0_Other_0xa0
#define SUN_H_T1_Window_Spill_0_Other_0xa0 saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_1_Other_0xa4
#define SUN_H_T1_Window_Spill_1_Other_0xa4 saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_2_Other_0xa8
#define SUN_H_T1_Window_Spill_2_Other_0xa8 saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_3_Other_0xac
#define SUN_H_T1_Window_Spill_3_Other_0xac saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_4_Other_0xb0
#define SUN_H_T1_Window_Spill_4_Other_0xb0 saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_5_Other_0xb4
#define SUN_H_T1_Window_Spill_5_Other_0xb4 saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_6_Other_0xb8
#define SUN_H_T1_Window_Spill_6_Other_0xb8 saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Spill_7_Other_0xbc
#define SUN_H_T1_Window_Spill_7_Other_0xbc saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_0_Normal_0xc0
#define SUN_H_T1_Window_Fill_0_Normal_0xc0 restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_1_Normal_0xc4
#define SUN_H_T1_Window_Fill_1_Normal_0xc4 restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_2_Normal_0xc8
#define SUN_H_T1_Window_Fill_2_Normal_0xc8 restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_3_Normal_0xcc
#define SUN_H_T1_Window_Fill_3_Normal_0xcc restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_4_Normal_0xd0
#define SUN_H_T1_Window_Fill_4_Normal_0xd0 restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_5_Normal_0xd4
#define SUN_H_T1_Window_Fill_5_Normal_0xd4 restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_6_Normal_0xd8
#define SUN_H_T1_Window_Fill_6_Normal_0xd8 restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_7_Normal_0xdc
#define SUN_H_T1_Window_Fill_7_Normal_0xdc restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_0_Other_0xe0
#define SUN_H_T1_Window_Fill_0_Other_0xe0 restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_1_Other_0xe4
#define SUN_H_T1_Window_Fill_1_Other_0xe4 restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_2_Other_0xe8
#define SUN_H_T1_Window_Fill_2_Other_0xe8 restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_3_Other_0xec
#define SUN_H_T1_Window_Fill_3_Other_0xec restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_4_Other_0xf0
#define SUN_H_T1_Window_Fill_4_Other_0xf0 restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_5_Other_0xf4
#define SUN_H_T1_Window_Fill_5_Other_0xf4 restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_6_Other_0xf8
#define SUN_H_T1_Window_Fill_6_Other_0xf8 restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T1_Window_Fill_7_Other_0xfc
#define SUN_H_T1_Window_Fill_7_Other_0xfc restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Trap_Instruction_0
#define My_T0_Trap_Instruction_0 \
    rdpr %tnpc, %g2; \
    save %i7, %g0, %i7;  \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    restore %i7, %g0, %i7; \
    stw %g2, [%i7];\
    retry
#define H_T0_Trap_Instruction_1
#define My_T0_Trap_Instruction_1 \
    umul %o4, 2, %o5;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    stw %g2, [%i7];\
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
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    retry ;\
    illtrap
#define H_T0_Trap_Instruction_5
#define My_T0_Trap_Instruction_5 \
    umul %i7, 2, %l1;\
    inc %o5;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
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
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    stw %g2, [%i7];\
    wrpr %g2, %tnpc; \
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
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    stw %g2, [%i7];\
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    retry ;\
    illtrap
#define H_T1_Trap_Instruction_5
#define My_T1_Trap_Instruction_5 \
    umul %i7, 2, %l1;\
    inc %o5;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    sdiv    %r2, %r10, %r0; \
    retry

#define H_HT0_Trap_Instruction_0 
#define My_HT0_Trap_Instruction_0 \
    rd %asi, %g2;\
    mov 0x80, %g3;\
    stxa %g3, [%g3] 0x57;\
    stw %g2, [%i7];\
    done;\
    nop;nop;nop

#define H_HT0_Trap_Instruction_1
#define My_HT0_Trap_Instruction_1 \
    rd %asi, %g2;\
    mov 0x80, %g3;\
    stxa %g3, [%g3] 0x5f;\
    done;\
    nop;nop;nop;nop
#define H_HT0_Trap_Instruction_2
#define My_HT0_Trap_Instruction_2 \
    umul %i6, 2, %l4;\
    stw %l4, [%i7];\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    sdiv    %r2, %r0, %r0; \
    retry
#define H_HT0_Trap_Instruction_3
#define My_HT0_Trap_Instruction_3 \
    umul %i5, 3, %l3;\
    inc %o6;\
    illtrap ;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
    retry
#define H_HT0_Trap_Instruction_4
#define My_HT0_Trap_Instruction_4 \
    rdpr %tnpc, %g2; \
    save %i7, %g0, %i7;  \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    stw %g2, [%i7];\
    wrpr %g2, %tnpc; \
    restore %i7, %g0, %i7 ;\
    retry
#define H_HT0_Trap_Instruction_5
#define My_HT0_Trap_Instruction_5 \
    ba htrap_5_ext;\
    nop; retry;\
    nop; nop; nop; nop; nop

#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
    umul %i7, 4, %g1;\
    inc %o6;\
    umul %i4, 3, %l3;\
    inc %g6;\
    save %i7, %g0, %i7 ;\
    restore %i7, %g0, %i7 ;\
    done ;\
    nop; 
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
    umul %i0, 4, %g1;\
    inc %o6;\
    ba 7f; \
    rdhpr %htstate, %g3;\
    8: done; \
    7: ba 8b;\
    wrhpr %g3, 1, %htstate;nop

#define H_HT0_DAE_so_page_0x30
#define My_HT0_DAE_so_page_0x30 \
    umul %i5, 4, %g5;\
    inc %g6;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_DAE_invalid_asi_0x14
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
    umul %i5, 4, %g5;\
    inc %g6;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_DAE_privilege_violation_0x15
#define SUN_H_HT0_DAE_privilege_violation_0x15 \
    umul %i5, 4, %g5;\
    inc %g6;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    rd %fprs, %g2; \
    wr %g2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
    inc %l5;\
    dec %g3;\
    umul %i5, 4, %g5;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop
#define H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define My_HT0_Lddf_Mem_Address_Not_Aligned_0x35 \
    inc %l5;\
    dec %g3;\
    rdpr %tpc, %g2; \
    add %g2, 0x4, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 0x4, %g2; \
    wrpr %g2, %tnpc; \
    retry
#define H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define My_HT0_Stdf_Mem_Address_Not_Aligned_0x36 \
    inc %l5;\
    dec %g3;\
    rdpr %tpc, %g2; \
    add %g2, 0x4, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 0x4, %g2; \
    wrpr %g2, %tnpc; \
    retry
#define H_HT0_Fp_exception_other_0x22
#define My_HT0_Fp_exception_other_0x22 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    stw %g2, [%i7];\
    done; \
    nop
#define H_HT0_Division_By_Zero
#define My_HT0_Division_By_Zero \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop
#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop
#define H_T1_Division_By_Zero_0x28
#define My_H_T1_Division_By_Zero_0x28 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop

#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero\
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop

#define H_T1_Fp_Exception_Other_0x22
#define My_H_T1_Fp_Exception_Other_0x22 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop
#define H_T1_Privileged_Opcode_0x11
#define SUN_H_T1_Privileged_Opcode_0x11 \
    inc %l6;\
    dec %g5;\
    stw %g5, [%i7];\
    umul %i5, 4, %g2;\
    restore %i7, %g0, %i7;\
    save %i7, %g0, %i7; \
    done; \
    nop;

#define H_HT0_Privileged_opcode_0x11
#define My_HT0_Privileged_opcode_0x11 \
    xor %i0, %l1, %g1;\
    and %g1, 0xf, %g1; \
    ba hh11_1; \
    not %g0, %g2; \
    hh11_2: done; \
    hh11_1: xor %g1, %g2, %g2; \
    ba hh11_2; \
    jmp %g2;

#define H_HT0_Fp_disabled_0x20
#define My_HT0_Fp_disabled_0x20 \
    mov  0x4, %g2 ;\
    wr %g2, 0x0, %fprs ;\
    sllx %g2, 10, %g3; \
    rdpr %tstate, %g2;\
    or %g2, %g3, %g2 ;\
    stw %g2, [%i7];\
    wrpr %g2, 0x0, %tstate;\
    retry;

#define H_T0_Fp_disabled_0x20
#define My_T0_Fp_disabled_0x20 \
    mov  0x4, %g2 ;\
    wr %g2, 0x0, %fprs ;\
    sllx %g2, 10, %g3; \
    rdpr %tstate, %g2;\
    or %g2, %g3, %g2 ;\
    wrpr %g2, 0x0, %tstate;\
    retry; nop

#define H_T1_Fp_Disabled_0x20
#define My_H_T1_Fp_Disabled_0x20 \
    mov  0x4, %g2 ;\
    wr %g2, 0x0, %fprs ;\
    sllx %g2, 10, %g3; \
    rdpr %tstate, %g2;\
    or %g2, %g3, %g2 ;\
    wrpr %g2, 0x0, %tstate;\
    stw %g2, [%i7];\
    retry

#define H_HT0_Watchdog_Reset_0x02
#define My_HT0_Watchdog_Reset_0x02 \
    ba wdog_2_ext;\
    nop;retry;nop;nop;nop;nop;nop

#define H_T0_Privileged_opcode_0x11
#define My_T0_Privileged_opcode_0x11 \
    xor %i0, %l1, %g1;\
    and %g1, 0xf, %g1; \
    ba h11_1; \
    not %g0, %g2; \
    h11_2: done; \
    h11_1: xor %g1, %g2, %g2; \
    ba h11_2; \
    jmp %g2;

#define H_T1_Fp_exception_other_0x22
#define My_T1_Fp_exception_other_0x22 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    restore %i7, %g0, %i7 ; \
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    ldx [%g2], %g2;\
    done; 

#define H_T0_Fp_exception_other_0x22
#define My_T0_Fp_exception_other_0x22 \
    inc %l6;\
    dec %g5;\
    umul %i5, 4, %g2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    stw %g2, [%i7];\
    done; \
    nop

#define H_HT0_Trap_Level_Zero_0x5f
#define My_HT0_Trap_Level_Zero_0x5f \
    not %g0, %g2; \
    rdhpr %hpstate, %g3;\
    jmp %g2;\
    rdhpr %htstate, %g3;\
    and %g3, 0xfe, %g3;\
    wrhpr %g3, 0, %htstate;\
    stw %g2, [%i7];\
    retry

#define My_Watchdog_Reset
#define My_Watchdog_Reset \
    ba wdog_red_ext;\
    nop;retry;nop;nop;nop;nop;nop

#define H_HT0_Control_Transfer_Instr_0x74
#define My_H_HT0_Control_Transfer_Instr_0x74 \
    done;nop;

#define H_T0_Control_Transfer_Instr_0x74
#define My_H_T0_Control_Transfer_Instr_0x74 \
    done;nop;

#define H_T1_Control_Transfer_Instr_0x74
#define My_H_T1_Control_Transfer_Instr_0x74 \
    done;nop;

#define  H_HT0_IAE_privilege_violation_0x08
#define  My_HT0_IAE_privilege_violation_0x08 \
    done; nop;
#define  H_HT0_IAE_unauth_access_0x0b
#define  SUN_H_HT0_IAE_unauth_access_0x0b \
    done; nop;


#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    done;nop

#define H_HT0_mem_address_range_0x2e
#define SUN_H_HT0_mem_address_range_0x2e \
    done;nop

!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 178 "diag.j"
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
	mov 0x33, %r14
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

    ta T_CHANGE_HPRIV 

    !Initializing Tick Cmprs
    mov 1, %g2
    sllx %g2, 63, %g2
    or %g1, %g2, %g1
    wrhpr %g1, %g0, %hsys_tick_cmpr
    wr %g1, %g0, %tick_cmpr
    wr %g1, %g0, %sys_tick_cmpr
    ta T_CHANGE_NONHPRIV 

DS_0:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xe3f75782	! Random illegal ?
	.word 0x8da00543  ! 1: FSQRTd	fsqrt	
	.word 0x9ba2c821  ! 1: FADDs	fadds	%f11, %f1, %f13
	.word 0xdad004a0  ! 2: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xda8008a0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x87802004  ! 4: WRASI_I	wr	%r0, 0x0004, %asi
DS_1:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd1328013  ! 1: STQF_R	-	%f8, [%r19, %r10]
	normalw
	.word 0xb3458000  ! 5: RD_SOFTINT_REG	rd	%softint, %r25
	.word 0x879023de  ! 6: WRPR_TT_I	wrpr	%r0, 0x03de, %tt
splash_lsu_2:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 7: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 8: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x879022ff  ! 9: WRPR_TT_I	wrpr	%r0, 0x02ff, %tt
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 10: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8790225f  ! 11: WRPR_TT_I	wrpr	%r0, 0x025f, %tt
	.word 0xf2c004a0  ! 12: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r25
	.word 0xa1902007  ! 13: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xf25fe001  ! 14: LDX_I	ldx	[%r31 + 0x0001], %r25
	.word 0x8f480000  ! 15: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x93902006  ! 16: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 17: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce17c000  ! 18: LDUH_R	lduh	[%r31 + %r0], %r7
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 19: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xce8008a0  ! 20: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x87802080  ! 21: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xce8008a0  ! 22: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x93902002  ! 23: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8198250d  ! 24: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050d, %hpstate
	.word 0xced804a0  ! 25: LDXA_R	ldxa	[%r0, %r0] 0x25, %r7
splash_tba_3:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 26: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982b15  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b15, %hpstate
	.word 0x91d02032  ! 28: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902704  ! 29: WRPR_PSTATE_I	wrpr	%r0, 0x0704, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xce5fc000  ! 30: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89808016  ! 31: WRTICK_R	wr	%r2, %r22, %tick
	.word 0xce1fe001  ! 32: LDD_I	ldd	[%r31 + 0x0001], %r7
	.word 0xce4fc000  ! 33: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0xce8804a0  ! 34: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 35: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x8d902fc8  ! 36: WRPR_PSTATE_I	wrpr	%r0, 0x0fc8, %pstate
DS_5:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 37: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xce8804a0  ! 38: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
	.word 0xa249400c  ! 39: MULX_R	mulx 	%r5, %r12, %r17
	.word 0x8790230d  ! 40: WRPR_TT_I	wrpr	%r0, 0x030d, %tt
	.word 0xe2800ae0  ! 41: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r17
	.word 0x87802080  ! 42: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe28008a0  ! 43: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 44: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe2dfe030  ! 45: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r17
splash_cmpr_6:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb185a001  ! 46: WR_STICK_REG_I	wr	%r22, 0x0001, %-
splash_cmpr_7:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 47: WR_STICK_REG_I	wr	%r2, 0x0001, %-
splash_tba_8:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 48: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x95540000  ! 49: RDPR_GL	rdpr	%-, %r10
	.word 0x20800001  ! 50: BN	bn,a	<label_0x1>
	.word 0x8780204f  ! 51: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd41fc000  ! 52: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xd45fe001  ! 53: LDX_I	ldx	[%r31 + 0x0001], %r10
splash_tba_9:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 54: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_10:
	tsubcctv %r20, 0x1c55, %r17
	.word 0xd407e001  ! 55: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x91504000  ! 56: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0xd0d004a0  ! 57: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0x83d02033  ! 58: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xb3540000  ! 59: RDPR_GL	rdpr	%-, %r25
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 61: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_11:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f16, %f6, %f28
	.word 0x95b1c312  ! 62: ALIGNADDRESS	alignaddr	%r7, %r18, %r10
	.word 0x28800001  ! 63: BLEU	bleu,a	<label_0x1>
	.word 0x3a700001  ! 64: BPCC	<illegal instruction>
splash_tba_12:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 65: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4d80e60  ! 66: LDXA_R	ldxa	[%r0, %r0] 0x73, %r10
splash_cmpr_13:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182a001  ! 67: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0xd4d80e60  ! 68: LDXA_R	ldxa	[%r0, %r0] 0x73, %r10
	.word 0x9b464000  ! 69: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0xda8008a0  ! 70: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x99902000  ! 71: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xdadfe030  ! 72: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
tagged_14:
	tsubcctv %r26, 0x1f60, %r5
	.word 0xda07e001  ! 73: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdac80e40  ! 74: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r13
	.word 0xdad7e030  ! 75: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	.word 0xda07c000  ! 76: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0x8780204f  ! 77: WRASI_I	wr	%r0, 0x004f, %asi
splash_lsu_15:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 78: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d494000  ! 79: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0x91d02032  ! 80: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xcccfe000  ! 81: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r6
	.word 0x8780204f  ! 82: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8d902c37  ! 83: WRPR_PSTATE_I	wrpr	%r0, 0x0c37, %pstate
	.word 0x8d902cd0  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x0cd0, %pstate
	.word 0x99902004  ! 85: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa1902005  ! 86: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_htba_16:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 87: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 88: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x91d020b2  ! 89: Tcc_I	ta	icc_or_xcc, %r0 + 178
DS_17:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 90: RESTORE_R	restore	%r31, %r0, %r31
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 91: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x32800001  ! 92: BNE	bne,a	<label_0x1>
	.word 0x91d02034  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802014  ! 94: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87802058  ! 95: WRASI_I	wr	%r0, 0x0058, %asi
splash_tba_18:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 96: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_19:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 97: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcd17c000  ! 98: LDQF_R	-	[%r31, %r0], %f6
	.word 0x87802089  ! 99: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87902179  ! 100: WRPR_TT_I	wrpr	%r0, 0x0179, %tt
	.word 0xa190200f  ! 101: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 102: LDX_R	ldx	[%r31 + %r0], %r6
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xcc5fc000  ! 103: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x8d902d03  ! 104: WRPR_PSTATE_I	wrpr	%r0, 0x0d03, %pstate
splash_tba_20:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 105: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902259  ! 106: WRPR_TT_I	wrpr	%r0, 0x0259, %tt
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 107: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f540000  ! 108: RDPR_GL	rdpr	%-, %r7
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 109: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982b86  ! 110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b86, %hpstate
	.word 0x93902005  ! 111: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xce880e80  ! 112: LDUBA_R	lduba	[%r0, %r0] 0x74, %r7
	.word 0x93902004  ! 113: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 114: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x93902004  ! 115: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_21:
	taddcctv %r2, 0x1968, %r2
	.word 0xce07e001  ! 116: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x93902003  ! 117: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xce8008a0  ! 118: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xa5514000  ! 119: RDPR_TBA	rdpr	%tba, %r18
	.word 0xa190200e  ! 120: WRPR_GL_I	wrpr	%r0, 0x000e, %-
tagged_22:
	tsubcctv %r16, 0x172b, %r6
	.word 0xe407e001  ! 121: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0xe4c7e000  ! 122: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
DS_23:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 123: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802010  ! 124: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d802000  ! 125: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_24:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 126: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x99902002  ! 127: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xe42fc01e  ! 128: STB_R	stb	%r18, [%r31 + %r30]
	.word 0xe41fc000  ! 129: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x93d02034  ! 130: Tcc_I	tne	icc_or_xcc, %r0 + 52
DS_25:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f18, %f8, %f28
	.word 0xb5b1c302  ! 131: ALIGNADDRESS	alignaddr	%r7, %r2, %r26
	.word 0x8d902e5c  ! 132: WRPR_PSTATE_I	wrpr	%r0, 0x0e5c, %pstate
	.word 0xf4c7e020  ! 133: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r26
	.word 0xf4c80e40  ! 134: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r26
	.word 0xa190200b  ! 135: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x87802004  ! 136: WRASI_I	wr	%r0, 0x0004, %asi
tagged_26:
	tsubcctv %r3, 0x1420, %r16
	.word 0xf407e001  ! 137: LDUW_I	lduw	[%r31 + 0x0001], %r26
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 138: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf517c000  ! 139: LDQF_R	-	[%r31, %r0], %f26
	.word 0xf4c7e020  ! 140: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r26
	.word 0x91d02034  ! 141: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01976  ! 142: FqTOd	dis not found

	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 144: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xab696001  ! 145: SDIVX_I	sdivx	%r5, 0x0001, %r21
	.word 0xeac7e010  ! 146: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r21
	ta	T_CHANGE_PRIV	! macro
	.word 0xeacfe020  ! 148: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r21
	.word 0xa190200a  ! 149: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_lsu_29:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 150: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_30:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 151: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xea9004a0  ! 152: LDUHA_R	lduha	[%r0, %r0] 0x25, %r21
splash_tba_31:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 153: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802001  ! 154: SIR	sir	0x0001
tagged_32:
	tsubcctv %r3, 0x105b, %r25
	.word 0xea07e001  ! 155: LDUW_I	lduw	[%r31 + 0x0001], %r21
splash_lsu_33:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 156: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 157: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xeac7e020  ! 158: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r21
DS_34:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 159: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_35:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1852001  ! 160: WR_STICK_REG_I	wr	%r20, 0x0001, %-
splash_tba_36:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 161: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xea5fc000  ! 162: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0x2a800001  ! 163: BCS	bcs,a	<label_0x1>
	.word 0xea1fe001  ! 164: LDD_I	ldd	[%r31 + 0x0001], %r21
	.word 0xa1902002  ! 165: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x2e700001  ! 166: BPVS	<illegal instruction>
	.word 0x93902000  ! 167: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 168: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879023ac  ! 169: WRPR_TT_I	wrpr	%r0, 0x03ac, %tt
	.word 0x87a309d7  ! 170: FDIVd	fdivd	%f12, %f54, %f34
tagged_37:
	taddcctv %r8, 0x1b79, %r21
	.word 0xc607e001  ! 171: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc617e001  ! 172: LDUH_I	lduh	[%r31 + 0x0001], %r3
	.word 0x879022d5  ! 173: WRPR_TT_I	wrpr	%r0, 0x02d5, %tt
	.word 0x8d802000  ! 174: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99494000  ! 175: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x8fa609cc  ! 176: FDIVd	fdivd	%f24, %f12, %f38
	.word 0xa1902002  ! 177: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa1902009  ! 178: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xce1fe001  ! 179: LDD_I	ldd	[%r31 + 0x0001], %r7
	.word 0xce8008a0  ! 180: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xce5fc000  ! 181: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xce17e001  ! 182: LDUH_I	lduh	[%r31 + 0x0001], %r7
	.word 0xce0fe001  ! 183: LDUB_I	ldub	[%r31 + 0x0001], %r7
	.word 0x8198215f  ! 184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015f, %hpstate
	.word 0x93d02033  ! 185: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xce97e010  ! 186: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r7
	.word 0xcf97e001  ! 187: LDQFA_I	-	[%r31, 0x0001], %f7
	.word 0x93902000  ! 188: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x20700001  ! 189: BPN	<illegal instruction>
	.word 0x879020e1  ! 190: WRPR_TT_I	wrpr	%r0, 0x00e1, %tt
	.word 0x3e800001  ! 191: BVC	bvc,a	<label_0x1>
	.word 0x87902023  ! 192: WRPR_TT_I	wrpr	%r0, 0x0023, %tt
	.word 0xce9004a0  ! 193: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 194: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_38:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 195: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902006  ! 196: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_39:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 197: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x28800001  ! 198: BLEU	bleu,a	<label_0x1>
	.word 0x2e700001  ! 199: BPVS	<illegal instruction>
	.word 0xced00e80  ! 200: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r7
splash_tba_40:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 201: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce8008a0  ! 202: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xce8008a0  ! 203: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x91d020b4  ! 204: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xcedfe000  ! 205: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	.word 0x93902002  ! 206: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902b8a  ! 207: WRPR_PSTATE_I	wrpr	%r0, 0x0b8a, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 208: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x8d902bca  ! 209: WRPR_PSTATE_I	wrpr	%r0, 0x0bca, %pstate
	.word 0x87802016  ! 210: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xced00e80  ! 211: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r7
	.word 0xb7494000  ! 212: RDHPR_HTBA	rdhpr	%htba, %r27
	.word 0x93902000  ! 213: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87902086  ! 214: WRPR_TT_I	wrpr	%r0, 0x0086, %tt
	.word 0x93902000  ! 215: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 216: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 217: BLEU	bleu,a	<label_0x1>
	.word 0xf69fc020  ! 218: LDDA_R	ldda	[%r31, %r0] 0x01, %r27
	.word 0x8d802000  ! 219: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902004  ! 220: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 221: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982fdf  ! 222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdf, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf65fc000  ! 223: LDX_R	ldx	[%r31 + %r0], %r27
	.word 0xf607c000  ! 224: LDUW_R	lduw	[%r31 + %r0], %r27
splash_lsu_41:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 225: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_42:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 226: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf617e001  ! 227: LDUH_I	lduh	[%r31 + 0x0001], %r27
DS_43:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 228: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8790218e  ! 229: WRPR_TT_I	wrpr	%r0, 0x018e, %tt
	.word 0xf6c004a0  ! 230: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r27
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 231: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_44:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 232: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_45:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa7b44309  ! 233: ALIGNADDRESS	alignaddr	%r17, %r9, %r19
	.word 0xe68008a0  ! 234: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe65fc000  ! 235: LDX_R	ldx	[%r31 + %r0], %r19
change_to_randtl_46:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 236: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x30700001  ! 237: BPA	<illegal instruction>
	.word 0x93902004  ! 238: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_47:
	taddcctv %r5, 0x1258, %r8
	.word 0xe607e001  ! 239: LDUW_I	lduw	[%r31 + 0x0001], %r19
splash_htba_48:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 240: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe647e001  ! 241: LDSW_I	ldsw	[%r31 + 0x0001], %r19
tagged_49:
	taddcctv %r19, 0x10df, %r15
	.word 0xe607e001  ! 242: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xe6c004a0  ! 243: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
	.word 0xa1902000  ! 244: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe6c804a0  ! 245: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
splash_tba_50:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 246: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_51:
	taddcctv %r11, 0x1fef, %r10
	.word 0xe607e001  ! 247: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0x38800001  ! 248: BGU	bgu,a	<label_0x1>
change_to_randtl_52:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 249: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_53:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 250: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 251: BN	bn,a	<label_0x1>
tagged_54:
	tsubcctv %r9, 0x1a50, %r2
	.word 0xe607e001  ! 252: LDUW_I	lduw	[%r31 + 0x0001], %r19
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe65fc000  ! 253: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x93d020b4  ! 254: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_tba_55:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 255: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe61fc000  ! 256: LDD_R	ldd	[%r31 + %r0], %r19
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe65fc000  ! 257: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0xe6d7e010  ! 258: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r19
splash_lsu_56:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 259: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_57:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x9bb0430d  ! 260: ALIGNADDRESS	alignaddr	%r1, %r13, %r13
	.word 0xdacfe020  ! 261: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r13
	.word 0xda5fe001  ! 262: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0xa9480000  ! 263: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xe85fe001  ! 264: LDX_I	ldx	[%r31 + 0x0001], %r20
	.word 0x93d02032  ! 265: Tcc_I	tne	icc_or_xcc, %r0 + 50
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 266: LDX_R	ldx	[%r31 + %r0], %r20
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe88008a0  ! 268: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x8d45c000  ! 269: RD_TICK_CMPR_REG	rd	%-, %r6
change_to_randtl_58:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 270: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_tba_59:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 271: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902004  ! 272: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8981c00b  ! 274: WRTICK_R	wr	%r7, %r11, %tick
	.word 0x91514000  ! 275: RDPR_TBA	rdpr	%tba, %r8
splash_lsu_61:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 276: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902024  ! 277: WRPR_TT_I	wrpr	%r0, 0x0024, %tt
	.word 0xd01fe001  ! 278: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x87802088  ! 279: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89830018  ! 280: WRTICK_R	wr	%r12, %r24, %tick
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 282: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 283: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_63:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xafb24312  ! 284: ALIGNADDRESS	alignaddr	%r9, %r18, %r23
	.word 0xeed804a0  ! 285: LDXA_R	ldxa	[%r0, %r0] 0x25, %r23
	.word 0x83d020b3  ! 286: Tcc_I	te	icc_or_xcc, %r0 + 179
splash_tba_64:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 287: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xee0fc000  ! 288: LDUB_R	ldub	[%r31 + %r0], %r23
	.word 0xee8fe010  ! 289: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r23
	.word 0x93902002  ! 290: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa190200e  ! 291: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x87802016  ! 292: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93902005  ! 293: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xee5fc000  ! 294: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0xee800c40  ! 295: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r23
splash_cmpr_65:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182e001  ! 296: WR_STICK_REG_I	wr	%r11, 0x0001, %-
DS_66:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x99b14304  ! 297: ALIGNADDRESS	alignaddr	%r5, %r4, %r12
	.word 0xa1902004  ! 298: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd88fe020  ! 299: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
	.word 0x85504000  ! 300: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x93902006  ! 301: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa190200f  ! 302: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa190200d  ! 303: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902000  ! 304: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x38700001  ! 305: BPGU	<illegal instruction>
	.word 0x93902005  ! 306: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc417e001  ! 307: LDUH_I	lduh	[%r31 + 0x0001], %r2
DS_67:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 308: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 309: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9b480000  ! 310: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xda97e030  ! 311: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	.word 0x99902005  ! 312: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8d464000  ! 313: RD_STICK_CMPR_REG	rd	%-, %r6
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 314: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xccd004a0  ! 315: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	.word 0x93902004  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_tba_68:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 317: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_69:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 318: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f802001  ! 320: SIR	sir	0x0001
	.word 0xccc804a0  ! 321: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r6
	.word 0xcc1fc000  ! 322: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x8d9024a5  ! 323: WRPR_PSTATE_I	wrpr	%r0, 0x04a5, %pstate
	.word 0xccd804a0  ! 324: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0xcd37e001  ! 325: STQF_I	-	%f6, [0x0001, %r31]
DS_70:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 326: SAVE_R	save	%r31, %r0, %r31
	.word 0xccc004a0  ! 327: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0x2c700001  ! 328: BPNEG	<illegal instruction>
tagged_71:
	taddcctv %r8, 0x12c7, %r23
	.word 0xcc07e001  ! 329: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x87802020  ! 330: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xa1902009  ! 331: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xcc47e001  ! 332: LDSW_I	ldsw	[%r31 + 0x0001], %r6
DS_72:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9320008  ! 1: STQF_R	-	%f12, [%r8, %r8]
	normalw
	.word 0x9b458000  ! 333: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xdad7e010  ! 334: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	.word 0x99902004  ! 335: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xda1fc000  ! 336: LDD_R	ldd	[%r31 + %r0], %r13
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xda5fc000  ! 337: LDX_R	ldx	[%r31 + %r0], %r13
DS_73:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 338: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_74:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 339: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 341: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xda9fc020  ! 342: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	.word 0x879020b4  ! 343: WRPR_TT_I	wrpr	%r0, 0x00b4, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 344: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda9fc020  ! 345: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	.word 0x91d020b5  ! 346: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_lsu_75:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 347: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_76:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1856001  ! 348: WR_STICK_REG_I	wr	%r21, 0x0001, %-
	.word 0xa1902007  ! 349: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x879021c4  ! 350: WRPR_TT_I	wrpr	%r0, 0x01c4, %tt
DS_77:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 351: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_htba_78:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 352: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xda1fe001  ! 353: LDD_I	ldd	[%r31 + 0x0001], %r13
splash_tba_79:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 354: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802063  ! 355: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x879023ea  ! 356: WRPR_TT_I	wrpr	%r0, 0x03ea, %tt
	.word 0xdad004a0  ! 357: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
splash_tba_80:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 358: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_81:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184e001  ! 359: WR_STICK_REG_I	wr	%r19, 0x0001, %-
	.word 0x87802080  ! 360: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xdad7e000  ! 361: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	.word 0xda4fe001  ! 362: LDSB_I	ldsb	[%r31 + 0x0001], %r13
	.word 0x93902004  ! 363: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d90275f  ! 364: WRPR_PSTATE_I	wrpr	%r0, 0x075f, %pstate
	.word 0x8d90277e  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x077e, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 366: LDX_R	ldx	[%r31 + %r0], %r13
tagged_82:
	tsubcctv %r23, 0x15a5, %r3
	.word 0xda07e001  ! 367: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda1fc000  ! 368: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xa190200e  ! 369: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x9f802001  ! 370: SIR	sir	0x0001
tagged_83:
	taddcctv %r4, 0x19e4, %r16
	.word 0xda07e001  ! 371: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xa190200e  ! 372: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa190200c  ! 373: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_tba_84:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 374: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_85:
	taddcctv %r25, 0x1bb4, %r16
	.word 0xda07e001  ! 375: LDUW_I	lduw	[%r31 + 0x0001], %r13
tagged_86:
	tsubcctv %r25, 0x11f6, %r16
	.word 0xda07e001  ! 376: LDUW_I	lduw	[%r31 + 0x0001], %r13
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 377: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0196c  ! 378: FqTOd	dis not found

splash_lsu_88:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 379: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_89:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 380: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_90:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 381: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790219d  ! 382: WRPR_TT_I	wrpr	%r0, 0x019d, %tt
	.word 0x8d90221b  ! 383: WRPR_PSTATE_I	wrpr	%r0, 0x021b, %pstate
splash_tba_91:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 384: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_92:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 385: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
tagged_93:
	taddcctv %r7, 0x189c, %r13
	.word 0xe007e001  ! 387: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe007c000  ! 388: LDUW_R	lduw	[%r31 + %r0], %r16
	.word 0xe08008a0  ! 389: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 390: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790222b  ! 391: WRPR_TT_I	wrpr	%r0, 0x022b, %tt
	.word 0x91d02032  ! 392: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_94:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 393: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe01fe001  ! 394: LDD_I	ldd	[%r31 + 0x0001], %r16
	.word 0xe09fc020  ! 395: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
	.word 0x8d902345  ! 396: WRPR_PSTATE_I	wrpr	%r0, 0x0345, %pstate
	.word 0x34700001  ! 397: BPG	<illegal instruction>
DS_95:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xf530c001  ! 1: STQF_R	-	%f26, [%r1, %r3]
	normalw
	.word 0x97458000  ! 398: RD_SOFTINT_REG	rd	%softint, %r11
change_to_randtl_96:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 399: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_97:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 400: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902309  ! 401: WRPR_TT_I	wrpr	%r0, 0x0309, %tt
DS_98:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 402: SAVE_R	save	%r31, %r0, %r31
splash_tba_99:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 403: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 404: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd65fc000  ! 405: LDX_R	ldx	[%r31 + %r0], %r11
DS_100:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f2, %f22, %f10
	.word 0x85b6c30a  ! 406: ALIGNADDRESS	alignaddr	%r27, %r10, %r2
	.word 0x83d020b4  ! 407: Tcc_I	te	icc_or_xcc, %r0 + 180
splash_lsu_101:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 408: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902319  ! 409: WRPR_TT_I	wrpr	%r0, 0x0319, %tt
	.word 0xc49fe001  ! 410: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	.word 0x93902002  ! 411: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f508000  ! 412: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0xcedfe020  ! 413: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r7
	.word 0x91a00574  ! 414: FSQRTq	fsqrt	
	.word 0x8d802000  ! 415: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 416: LDX_R	ldx	[%r31 + %r0], %r8
splash_lsu_102:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 417: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd017e001  ! 418: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0xa1902008  ! 419: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 420: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd09004a0  ! 421: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0xd017e001  ! 422: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0xd0cfe010  ! 423: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
	.word 0x8d90233a  ! 424: WRPR_PSTATE_I	wrpr	%r0, 0x033a, %pstate
tagged_103:
	taddcctv %r9, 0x1ffe, %r26
	.word 0xd007e001  ! 425: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xd197e001  ! 426: LDQFA_I	-	[%r31, 0x0001], %f8
	.word 0xd01fe001  ! 427: LDD_I	ldd	[%r31 + 0x0001], %r8
tagged_104:
	tsubcctv %r22, 0x17f0, %r24
	.word 0xd007e001  ! 428: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x87508000  ! 429: RDPR_TSTATE	rdpr	%tstate, %r3
DS_105:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 430: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xc6d7e020  ! 431: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r3
	.word 0x91d02035  ! 432: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_lsu_106:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 433: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x22800001  ! 434: BE	be,a	<label_0x1>
	.word 0x28800001  ! 435: BLEU	bleu,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x99494000  ! 437: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x93902005  ! 438: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa190200b  ! 439: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd8800aa0  ! 440: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r12
	.word 0x87802063  ! 441: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8198229e  ! 442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029e, %hpstate
	.word 0x91514000  ! 443: RDPR_TBA	rdpr	%tba, %r8
	.word 0x87802004  ! 444: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd0d00e40  ! 445: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r8
splash_tba_107:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 446: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 447: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd09004a0  ! 448: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0x87802020  ! 449: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xad50c000  ! 450: RDPR_TT	rdpr	%tt, %r22
	.word 0xec9fe001  ! 451: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r22
	.word 0xec800c80  ! 452: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r22
	.word 0xec47e001  ! 453: LDSW_I	ldsw	[%r31 + 0x0001], %r22
splash_htba_108:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 454: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xed97e001  ! 455: LDQFA_I	-	[%r31, 0x0001], %f22
	.word 0xec5fe001  ! 456: LDX_I	ldx	[%r31 + 0x0001], %r22
	.word 0xeccfe010  ! 457: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r22
	.word 0xa145c000  ! 458: RD_TICK_CMPR_REG	rd	%-, %r16
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe05fc000  ! 459: LDX_R	ldx	[%r31 + %r0], %r16
DS_109:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f26, %f6, %f20
	.word 0x91b0031b  ! 460: ALIGNADDRESS	alignaddr	%r0, %r27, %r8
	.word 0xd0d7e000  ! 461: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r8
	.word 0x87902362  ! 462: WRPR_TT_I	wrpr	%r0, 0x0362, %tt
DS_110:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc932a001  ! 1: STQF_I	-	%f4, [0x0001, %r10]
	normalw
	.word 0x93458000  ! 463: RD_SOFTINT_REG	rd	%softint, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 464: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa1902000  ! 465: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_111:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x87a00548  ! 1: FSQRTd	fsqrt	
	.word 0x93a48835  ! 466: FADDs	fadds	%f18, %f21, %f9
splash_htba_112:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 467: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 468: LDX_R	ldx	[%r31 + %r0], %r9
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 469: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83494000  ! 470: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0xc28008a0  ! 471: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
splash_tba_113:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 472: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95696001  ! 473: SDIVX_I	sdivx	%r5, 0x0001, %r10
splash_tba_115:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 474: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81540000  ! 475: RDPR_GL	rdpr	%-, %r0
	.word 0x81982304  ! 476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0304, %hpstate
	.word 0xc017c000  ! 477: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xa1902008  ! 478: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xc007c000  ! 479: LDUW_R	lduw	[%r31 + %r0], %r0
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 480: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x24700001  ! 481: BPLE	<illegal instruction>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 482: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc0c7e030  ! 483: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r0
	.word 0xc0cfe000  ! 484: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r0
	.word 0xc0800c80  ! 485: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r0
	.word 0x93902003  ! 486: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93d020b4  ! 487: Tcc_I	tne	icc_or_xcc, %r0 + 180
change_to_randtl_116:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 488: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc09004a0  ! 489: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	.word 0x26800001  ! 490: BL	bl,a	<label_0x1>
splash_htba_117:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 491: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x99902000  ! 492: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xc09004a0  ! 493: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
tagged_118:
	tsubcctv %r13, 0x138e, %r8
	.word 0xc007e001  ! 494: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xc09fe001  ! 495: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
DS_119:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 496: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc05fe001  ! 497: LDX_I	ldx	[%r31 + 0x0001], %r0
	.word 0xc0800ba0  ! 498: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r0
	.word 0xc0800be0  ! 499: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r0
	.word 0x8d802000  ! 500: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_120:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc5308003  ! 1: STQF_R	-	%f2, [%r3, %r2]
	normalw
	.word 0x83458000  ! 501: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x2c800001  ! 502: BNEG	bneg,a	<label_0x1>
	.word 0xc2d004a0  ! 503: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x83d02035  ! 504: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xb1508000  ! 505: RDPR_TSTATE	rdpr	%tstate, %r24
splash_lsu_121:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 506: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 507: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xf027c003  ! 508: STW_R	stw	%r24, [%r31 + %r3]
	.word 0xf13fc003  ! 509: STDF_R	std	%f24, [%r3, %r31]
	.word 0x99902005  ! 510: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
splash_lsu_122:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 511: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 512: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xf007c000  ! 513: LDUW_R	lduw	[%r31 + %r0], %r24
	.word 0x87802016  ! 514: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93902007  ! 515: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d90231f  ! 516: WRPR_PSTATE_I	wrpr	%r0, 0x031f, %pstate
	.word 0xf01fc000  ! 517: LDD_R	ldd	[%r31 + %r0], %r24
DS_123:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x89b1c304  ! 518: ALIGNADDRESS	alignaddr	%r7, %r4, %r4
	.word 0x93540000  ! 519: RDPR_GL	rdpr	%-, %r9
	.word 0x3e800001  ! 520: BVC	bvc,a	<label_0x1>
	.word 0x93902004  ! 521: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87464000  ! 522: RD_STICK_CMPR_REG	rd	%-, %r3
	.word 0x8d902cec  ! 523: WRPR_PSTATE_I	wrpr	%r0, 0x0cec, %pstate
	.word 0x3a700001  ! 524: BPCC	<illegal instruction>
	.word 0x87802004  ! 525: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc61fc000  ! 526: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xab504000  ! 527: RDPR_TNPC	rdpr	%tnpc, %r21
splash_lsu_124:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 528: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 529: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d02033  ! 530: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xea47c000  ! 531: LDSW_R	ldsw	[%r31 + %r0], %r21
	.word 0x91d02034  ! 532: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902000  ! 533: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb183000c  ! 534: WR_STICK_REG_R	wr	%r12, %r12, %-
	.word 0xa190200e  ! 535: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_lsu_126:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 536: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xea8008a0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0x8f480000  ! 538: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 539: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 540: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa151c000  ! 541: RDPR_TL	rdpr	%tl, %r16
	.word 0x8198248e  ! 542: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048e, %hpstate
	.word 0x93902007  ! 543: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa7514000  ! 544: RDPR_TBA	rdpr	%tba, %r19
	.word 0x91d02032  ! 545: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902c6d  ! 546: WRPR_PSTATE_I	wrpr	%r0, 0x0c6d, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8ba01964  ! 547: FqTOd	dis not found

	.word 0x87902232  ! 548: WRPR_TT_I	wrpr	%r0, 0x0232, %tt
DS_128:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xf9f197b6	! Random illegal ?
	.word 0xc7114010  ! 1: LDQF_R	-	[%r5, %r16], %f3
	.word 0xaba2c825  ! 549: FADDs	fadds	%f11, %f5, %f21
	.word 0x8d902920  ! 550: WRPR_PSTATE_I	wrpr	%r0, 0x0920, %pstate
	.word 0xead00e40  ! 551: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r21
	.word 0xa9a14d27  ! 552: FsMULd	fsmuld	%f5, %f38, %f20
	.word 0x87802004  ! 553: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa1902007  ! 554: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x879022ba  ! 555: WRPR_TT_I	wrpr	%r0, 0x02ba, %tt
	.word 0xe88008a0  ! 556: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
DS_129:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 557: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe8cfe030  ! 558: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r20
	.word 0x8780201c  ! 559: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8351c000  ! 560: RDPR_TL	rdpr	%tl, %r1
	.word 0x8d902845  ! 561: WRPR_PSTATE_I	wrpr	%r0, 0x0845, %pstate
	.word 0xa1902005  ! 562: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa1902002  ! 563: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 564: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 565: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x91d020b4  ! 566: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_htba_130:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 567: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802000  ! 568: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 569: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 570: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc2dfe030  ! 571: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r1
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 572: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc28008a0  ! 574: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x32700001  ! 575: BPNE	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
tagged_131:
	taddcctv %r9, 0x1c92, %r7
	.word 0xc207e001  ! 577: LDUW_I	lduw	[%r31 + 0x0001], %r1
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 578: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_132:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 579: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc297e000  ! 580: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r1
	.word 0xc2800be0  ! 581: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r1
	.word 0x32800001  ! 582: BNE	bne,a	<label_0x1>
	.word 0x87802058  ! 583: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8d90206d  ! 584: WRPR_PSTATE_I	wrpr	%r0, 0x006d, %pstate
	.word 0xc297e020  ! 585: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r1
	.word 0x30800001  ! 586: BA	ba,a	<label_0x1>
DS_133:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xeb340019  ! 1: STQF_R	-	%f21, [%r25, %r16]
	normalw
	.word 0x81458000  ! 587: RD_SOFTINT_REG	stbar
	.word 0xc0c7e020  ! 588: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r0
	.word 0x8d90295a  ! 589: WRPR_PSTATE_I	wrpr	%r0, 0x095a, %pstate
	.word 0x8780201c  ! 590: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8d802000  ! 591: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982e0c  ! 592: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0c, %hpstate
	.word 0xa1902009  ! 593: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87802080  ! 594: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xc017c000  ! 595: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc09fe001  ! 596: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
	.word 0x8d9021a4  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x01a4, %pstate
	.word 0xc08008a0  ! 598: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc0c80e80  ! 599: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r0
	.word 0xc0c004a0  ! 600: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	.word 0x87802080  ! 601: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xa190200e  ! 603: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x9f802001  ! 604: SIR	sir	0x0001
	.word 0x93902006  ! 605: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902415  ! 606: WRPR_PSTATE_I	wrpr	%r0, 0x0415, %pstate
	.word 0x8d802000  ! 607: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc0dfe000  ! 608: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r0
splash_cmpr_134:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1802001  ! 609: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	.word 0xc117c000  ! 610: LDQF_R	-	[%r31, %r0], %f0
	.word 0x879020dc  ! 611: WRPR_TT_I	wrpr	%r0, 0x00dc, %tt
	.word 0xc0c004a0  ! 612: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	.word 0x93902002  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87902295  ! 614: WRPR_TT_I	wrpr	%r0, 0x0295, %tt
	.word 0x8d902b0e  ! 615: WRPR_PSTATE_I	wrpr	%r0, 0x0b0e, %pstate
splash_lsu_135:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 616: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 617: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02032  ! 618: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902b01  ! 619: WRPR_PSTATE_I	wrpr	%r0, 0x0b01, %pstate
	.word 0xc08008a0  ! 620: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x87494000  ! 621: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0xb350c000  ! 622: RDPR_TT	rdpr	%tt, %r25
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf25fc000  ! 623: LDX_R	ldx	[%r31 + %r0], %r25
	.word 0xf28008a0  ! 624: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
splash_lsu_136:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 625: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 626: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xf21fc000  ! 627: LDD_R	ldd	[%r31 + %r0], %r25
	.word 0x91d020b3  ! 628: Tcc_I	ta	icc_or_xcc, %r0 + 179
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 629: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3c700001  ! 630: BPPOS	<illegal instruction>
splash_tba_137:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 631: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802014  ! 632: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xf257e001  ! 633: LDSH_I	ldsh	[%r31 + 0x0001], %r25
DS_138:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xd9744d8d	! Random illegal ?
	.word 0x85a0054b  ! 1: FSQRTd	fsqrt	
	.word 0x87a54836  ! 634: FADDs	fadds	%f21, %f22, %f3
	.word 0xc68008a0  ! 635: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
splash_tba_139:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 636: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc657e001  ! 637: LDSH_I	ldsh	[%r31 + 0x0001], %r3
splash_tba_140:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 638: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 639: LDX_R	ldx	[%r31 + %r0], %r3
change_to_randtl_141:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 640: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xa1902003  ! 641: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 642: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902007  ! 643: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xc6d804a0  ! 644: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0xc617c000  ! 645: LDUH_R	lduh	[%r31 + %r0], %r3
	.word 0x93902007  ! 646: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902e12  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x0e12, %pstate
	.word 0xc61fc000  ! 648: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xc6d7e030  ! 649: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r3
	.word 0xb750c000  ! 650: RDPR_TT	rdpr	%tt, %r27
	.word 0x93902003  ! 651: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_142:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xd14899b1	! Random illegal ?
	.word 0xa1a0054a  ! 1: FSQRTd	fsqrt	
	.word 0x81a4882d  ! 652: FADDs	fadds	%f18, %f13, %f0
	.word 0xb3480000  ! 653: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
tagged_143:
	taddcctv %r11, 0x1177, %r20
	.word 0xf207e001  ! 654: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0x93902004  ! 655: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_144:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 656: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
DS_145:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f30, %f26, %f22
	.word 0x9bb00300  ! 657: ALIGNADDRESS	alignaddr	%r0, %r0, %r13
	.word 0xda57c000  ! 658: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0xda9fe001  ! 659: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0x8790237f  ! 660: WRPR_TT_I	wrpr	%r0, 0x037f, %tt
	.word 0xda1fe001  ! 661: LDD_I	ldd	[%r31 + 0x0001], %r13
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 662: LDX_R	ldx	[%r31 + %r0], %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902280  ! 664: WRPR_PSTATE_I	wrpr	%r0, 0x0280, %pstate
	.word 0xda97e010  ! 665: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
DS_146:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 666: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x93902007  ! 667: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902007  ! 668: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x879023f9  ! 669: WRPR_TT_I	wrpr	%r0, 0x03f9, %tt
	.word 0xda8804a0  ! 670: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 671: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87802063  ! 672: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xda8008a0  ! 673: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x2c700001  ! 674: BPNEG	<illegal instruction>
tagged_147:
	taddcctv %r2, 0x1594, %r7
	.word 0xda07e001  ! 675: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda57e001  ! 676: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0xda8fe020  ! 677: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r13
	.word 0x93902003  ! 678: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa190200d  ! 679: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93480000  ! 680: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x28700001  ! 681: BPLEU	<illegal instruction>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 682: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x879023bb  ! 683: WRPR_TT_I	wrpr	%r0, 0x03bb, %tt
	.word 0x91464000  ! 684: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x85a01962  ! 685: FqTOd	dis not found

tagged_149:
	taddcctv %r10, 0x111b, %r18
	.word 0xc407e001  ! 686: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x99a189ab  ! 687: FDIVs	fdivs	%f6, %f11, %f12
	.word 0x93902000  ! 688: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xb1508000  ! 689: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x879023de  ! 690: WRPR_TT_I	wrpr	%r0, 0x03de, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf05fc000  ! 691: LDX_R	ldx	[%r31 + %r0], %r24
splash_lsu_150:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 692: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 693: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83a01a79  ! 695: FqTOi	fqtoi	
splash_tba_151:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 696: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc2800b40  ! 697: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r1
	.word 0xc217c000  ! 698: LDUH_R	lduh	[%r31 + %r0], %r1
splash_htba_152:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 699: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc2880e80  ! 700: LDUBA_R	lduba	[%r0, %r0] 0x74, %r1
	.word 0x24800001  ! 701: BLE	ble,a	<label_0x1>
	.word 0x8d802000  ! 702: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 703: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_153:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 704: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc29004a0  ! 705: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
change_to_randtl_154:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 706: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xb145c000  ! 707: RD_TICK_CMPR_REG	rd	%-, %r24
splash_lsu_155:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 708: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026d0  ! 709: WRPR_PSTATE_I	wrpr	%r0, 0x06d0, %pstate
	.word 0x87902386  ! 710: WRPR_TT_I	wrpr	%r0, 0x0386, %tt
	.word 0x91d020b2  ! 711: Tcc_I	ta	icc_or_xcc, %r0 + 178
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf05fc000  ! 712: LDX_R	ldx	[%r31 + %r0], %r24
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 713: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_156:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcb312001  ! 1: STQF_I	-	%f5, [0x0001, %r4]
	normalw
	.word 0xab458000  ! 714: RD_SOFTINT_REG	rd	%softint, %r21
	.word 0xb3540000  ! 715: RDPR_GL	rdpr	%-, %r25
	.word 0xf29fc020  ! 716: LDDA_R	ldda	[%r31, %r0] 0x01, %r25
	.word 0xf297e010  ! 717: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r25
splash_htba_157:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 718: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902001  ! 719: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_158:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 720: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879022d1  ! 721: WRPR_TT_I	wrpr	%r0, 0x02d1, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf25fc000  ! 722: LDX_R	ldx	[%r31 + %r0], %r25
	.word 0xf2bfc039  ! 723: STDA_R	stda	%r25, [%r31 + %r25] 0x01
	.word 0x8790202b  ! 724: WRPR_TT_I	wrpr	%r0, 0x002b, %tt
DS_159:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 725: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xf327e001  ! 726: STF_I	st	%f25, [0x0001, %r31]
	ta	T_CHANGE_HPRIV	! macro
splash_htba_160:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 728: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xf257c000  ! 729: LDSH_R	ldsh	[%r31 + %r0], %r25
	.word 0x8d902d1b  ! 730: WRPR_PSTATE_I	wrpr	%r0, 0x0d1b, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf25fc000  ! 731: LDX_R	ldx	[%r31 + %r0], %r25
	ta	T_CHANGE_HPRIV	! macro
splash_lsu_161:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 733: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 734: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xf28008a0  ! 735: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0xf297e020  ! 736: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r25
	.word 0x83540000  ! 737: RDPR_GL	rdpr	%-, %r1
	.word 0x28800001  ! 738: BLEU	bleu,a	<label_0x1>
	.word 0x38800001  ! 739: BGU	bgu,a	<label_0x1>
	.word 0xa1902006  ! 740: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902005  ! 741: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x83d02032  ! 742: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xa3500000  ! 743: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x95514000  ! 744: RDPR_TBA	<illegal instruction>
splash_cmpr_162:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182a001  ! 745: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0xd4d7e010  ! 746: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
DS_163:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 747: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x93902004  ! 748: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x2c800001  ! 749: BNEG	bneg,a	<label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8981c010  ! 750: WRTICK_R	wr	%r7, %r16, %tick
	.word 0x83504000  ! 751: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x8790229a  ! 752: WRPR_TT_I	wrpr	%r0, 0x029a, %tt
	.word 0x93d02034  ! 753: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x87902151  ! 754: WRPR_TT_I	wrpr	%r0, 0x0151, %tt
	.word 0x87902369  ! 755: WRPR_TT_I	wrpr	%r0, 0x0369, %tt
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 757: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802055  ! 758: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xb550c000  ! 759: RDPR_TT	rdpr	%tt, %r26
	.word 0x87802004  ! 760: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8780201c  ! 761: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x99902002  ! 762: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xf4800c40  ! 763: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r26
	.word 0x81982617  ! 764: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0617, %hpstate
splash_lsu_165:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 765: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 766: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x83d020b2  ! 767: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xf4d7e000  ! 768: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r26
	.word 0x87902361  ! 769: WRPR_TT_I	wrpr	%r0, 0x0361, %tt
tagged_166:
	tsubcctv %r11, 0x1e7c, %r25
	.word 0xf407e001  ! 770: LDUW_I	lduw	[%r31 + 0x0001], %r26
	.word 0x87802014  ! 771: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902cc2  ! 772: WRPR_PSTATE_I	wrpr	%r0, 0x0cc2, %pstate
	.word 0x93902006  ! 773: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 774: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf45fc000  ! 775: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0x8d902803  ! 776: WRPR_PSTATE_I	wrpr	%r0, 0x0803, %pstate
	.word 0xf4800ba0  ! 777: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r26
tagged_167:
	taddcctv %r6, 0x1f86, %r6
	.word 0xf407e001  ! 778: LDUW_I	lduw	[%r31 + 0x0001], %r26
	.word 0x8790204b  ! 779: WRPR_TT_I	wrpr	%r0, 0x004b, %tt
	.word 0xf4dfe020  ! 780: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r26
	.word 0xf48008a0  ! 781: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
splash_tba_168:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 782: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 783: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902460  ! 784: WRPR_PSTATE_I	wrpr	%r0, 0x0460, %pstate
DS_169:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 785: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x97494000  ! 786: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0x99494000  ! 787: RDHPR_HTBA	rdhpr	%htba, %r12
splash_lsu_170:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 788: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902002  ! 790: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xd8dfe020  ! 791: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	.word 0x91d020b3  ! 792: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x87802080  ! 793: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd89fc020  ! 794: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x93d020b3  ! 795: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xd84fc000  ! 796: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x99902004  ! 797: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
DS_171:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 798: SAVE_R	save	%r31, %r0, %r31
	.word 0xd8d804a0  ! 799: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0xd8c7e010  ! 800: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0x81982186  ! 801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0186, %hpstate
	.word 0x93902007  ! 802: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd8dfe000  ! 803: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
splash_lsu_172:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 804: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd857c000  ! 805: LDSH_R	ldsh	[%r31 + %r0], %r12
tagged_173:
	taddcctv %r7, 0x1867, %r1
	.word 0xd807e001  ! 806: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xa1902004  ! 807: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x91d02032  ! 808: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x83b44ff0  ! 809: FONES	e	%f1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc257e001  ! 811: LDSH_I	ldsh	[%r31 + 0x0001], %r1
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 812: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1834003  ! 813: WR_STICK_REG_R	wr	%r13, %r3, %-
	.word 0x91d020b2  ! 814: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_lsu_175:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 815: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc28008a0  ! 816: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x81982444  ! 817: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0444, %hpstate
	.word 0x9f802001  ! 818: SIR	sir	0x0001
	.word 0x2c700001  ! 819: BPNEG	<illegal instruction>
	.word 0x3a800001  ! 820: BCC	bcc,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 822: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83d02034  ! 823: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xc2d7e010  ! 824: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
DS_176:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc130c004  ! 1: STQF_R	-	%f0, [%r4, %r3]
	normalw
	.word 0x91458000  ! 825: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8d90204a  ! 826: WRPR_PSTATE_I	wrpr	%r0, 0x004a, %pstate
	.word 0xd01fc000  ! 827: LDD_R	ldd	[%r31 + %r0], %r8
	.word 0xa1902008  ! 828: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa190200a  ! 829: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x83d02035  ! 830: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89830010  ! 831: WRTICK_R	wr	%r12, %r16, %tick
	.word 0x3e800001  ! 832: BVC	bvc,a	<label_0x1>
	.word 0x81464000  ! 833: RD_STICK_CMPR_REG	stbar
	.word 0xc0d7e020  ! 834: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r0
	.word 0xc057e001  ! 835: LDSH_I	ldsh	[%r31 + 0x0001], %r0
	.word 0xc04fc000  ! 836: LDSB_R	ldsb	[%r31 + %r0], %r0
	.word 0x9f802001  ! 837: SIR	sir	0x0001
	.word 0x8d902006  ! 838: WRPR_PSTATE_I	wrpr	%r0, 0x0006, %pstate
	.word 0x93902000  ! 839: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 840: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc097e010  ! 841: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r0
	.word 0xc047e001  ! 842: LDSW_I	ldsw	[%r31 + 0x0001], %r0
	.word 0x81982ac6  ! 843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac6, %hpstate
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 844: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_178:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f14, %f18, %f4
	.word 0x8fb00309  ! 845: ALIGNADDRESS	alignaddr	%r0, %r9, %r7
	.word 0x34700001  ! 846: BPG	<illegal instruction>
tagged_179:
	taddcctv %r12, 0x17ed, %r5
	.word 0xce07e001  ! 847: LDUW_I	lduw	[%r31 + 0x0001], %r7
DS_180:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xcb31c00c  ! 1: STQF_R	-	%f5, [%r12, %r7]
	normalw
	.word 0x9b458000  ! 848: RD_SOFTINT_REG	rd	%softint, %r13
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 849: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d90273f  ! 850: WRPR_PSTATE_I	wrpr	%r0, 0x073f, %pstate
DS_181:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd7362001  ! 1: STQF_I	-	%f11, [0x0001, %r24]
	normalw
	.word 0x91458000  ! 851: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x81982c9c  ! 852: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9c, %hpstate
splash_cmpr_182:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1862001  ! 853: WR_STICK_REG_I	wr	%r24, 0x0001, %-
	.word 0x8d902066  ! 854: WRPR_PSTATE_I	wrpr	%r0, 0x0066, %pstate
splash_lsu_183:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 855: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd08008a0  ! 856: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
splash_cmpr_184:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 857: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0x93902003  ! 858: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802004  ! 859: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd0d00e40  ! 860: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r8
	.word 0xd08008a0  ! 861: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd057c000  ! 862: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x99902001  ! 863: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8d90205d  ! 864: WRPR_PSTATE_I	wrpr	%r0, 0x005d, %pstate
tagged_185:
	taddcctv %r5, 0x1d51, %r12
	.word 0xd007e001  ! 865: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1808013  ! 866: WR_STICK_REG_R	wr	%r2, %r19, %-
	.word 0xd057e001  ! 867: LDSH_I	ldsh	[%r31 + 0x0001], %r8
	.word 0xd0d7e020  ! 868: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 869: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b4  ! 870: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x81a01a64  ! 871: FqTOi	fqtoi	
splash_lsu_187:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 872: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 873: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xc09004a0  ! 874: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	.word 0x93902001  ! 875: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d020b3  ! 876: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x93902000  ! 877: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_188:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 878: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x95a01a7b  ! 880: FqTOi	fqtoi	
	.word 0x879020b8  ! 881: WRPR_TT_I	wrpr	%r0, 0x00b8, %tt
	.word 0xd4c004a0  ! 882: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x8d902801  ! 883: WRPR_PSTATE_I	wrpr	%r0, 0x0801, %pstate
	.word 0x87802088  ! 884: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d802000  ! 885: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879020a1  ! 886: WRPR_TT_I	wrpr	%r0, 0x00a1, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 887: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4c004a0  ! 888: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0xd4800aa0  ! 889: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r10
	.word 0x87802016  ! 890: WRASI_I	wr	%r0, 0x0016, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd45fc000  ! 891: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x87902239  ! 892: WRPR_TT_I	wrpr	%r0, 0x0239, %tt
	.word 0x8d9029bd  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x09bd, %pstate
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 894: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 895: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_PRIV	! macro
splash_lsu_189:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 897: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_190:
	tsubcctv %r26, 0x1f42, %r13
	.word 0xd407e001  ! 898: LDUW_I	lduw	[%r31 + 0x0001], %r10
change_to_randtl_191:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 899: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	ta	T_CHANGE_PRIV	! macro
tagged_192:
	tsubcctv %r20, 0x1dda, %r25
	.word 0xd407e001  ! 901: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x87902093  ! 902: WRPR_TT_I	wrpr	%r0, 0x0093, %tt
	.word 0x8d9029d5  ! 903: WRPR_PSTATE_I	wrpr	%r0, 0x09d5, %pstate
	.word 0xd4c804a0  ! 904: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x8b514000  ! 905: RDPR_TBA	rdpr	%tba, %r5
tagged_193:
	taddcctv %r5, 0x1a2c, %r1
	.word 0xca07e001  ! 906: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d6a2001  ! 907: SDIVX_I	sdivx	%r8, 0x0001, %r6
DS_195:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 908: SAVE_R	save	%r31, %r0, %r31
	.word 0x93902005  ! 909: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xcc17e001  ! 910: LDUH_I	lduh	[%r31 + 0x0001], %r6
splash_lsu_196:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 911: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9029d7  ! 912: WRPR_PSTATE_I	wrpr	%r0, 0x09d7, %pstate
	.word 0x8d902e77  ! 913: WRPR_PSTATE_I	wrpr	%r0, 0x0e77, %pstate
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 914: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xcc4fc000  ! 915: LDSB_R	ldsb	[%r31 + %r0], %r6
splash_tba_197:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 916: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b3  ! 917: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x36700001  ! 918: BPGE	<illegal instruction>
change_to_randtl_198:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 919: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x87802058  ! 920: WRASI_I	wr	%r0, 0x0058, %asi
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 921: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc9fe001  ! 922: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 923: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc9fc020  ! 924: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0xae6aa001  ! 925: UDIVX_I	udivx 	%r10, 0x0001, %r23
DS_199:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd932400d  ! 1: STQF_R	-	%f12, [%r13, %r9]
	normalw
	.word 0x89458000  ! 926: RD_SOFTINT_REG	rd	%softint, %r4
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 927: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0xa1902005  ! 928: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8351c000  ! 929: RDPR_TL	rdpr	%tl, %r1
tagged_200:
	tsubcctv %r10, 0x1e2f, %r15
	.word 0xc207e001  ! 930: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x93902002  ! 931: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
tagged_201:
	taddcctv %r2, 0x127a, %r4
	.word 0xc207e001  ! 932: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc28fe010  ! 933: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r1
	.word 0x91d02033  ! 934: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x879023c1  ! 935: WRPR_TT_I	wrpr	%r0, 0x03c1, %tt
	.word 0xb5480000  ! 936: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
DS_202:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd133400c  ! 1: STQF_R	-	%f8, [%r12, %r13]
	normalw
	.word 0x97458000  ! 937: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd68008a0  ! 938: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_203:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1866001  ! 939: WR_STICK_REG_I	wr	%r25, 0x0001, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 940: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 941: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd6c7e010  ! 942: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
	ta	T_CHANGE_HPRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 944: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x87802014  ! 945: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d802000  ! 946: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83508000  ! 947: RDPR_TSTATE	rdpr	%tstate, %r1
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 948: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc397e001  ! 949: LDQFA_I	-	[%r31, 0x0001], %f1
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 950: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc2c7e000  ! 951: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r1
splash_lsu_204:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 952: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc29fe001  ! 953: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 954: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc28008a0  ! 955: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
splash_lsu_205:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 956: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
tagged_206:
	tsubcctv %r12, 0x1b2e, %r22
	.word 0xc207e001  ! 958: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x87802004  ! 959: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x879022de  ! 961: WRPR_TT_I	wrpr	%r0, 0x02de, %tt
	.word 0xa1902007  ! 962: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87802063  ! 963: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa190200f  ! 964: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d90218e  ! 965: WRPR_PSTATE_I	wrpr	%r0, 0x018e, %pstate
	.word 0xc28008a0  ! 966: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
DS_207:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc7140009  ! 1: LDQF_R	-	[%r16, %r9], %f3
	.word 0x97a14837  ! 967: FADDs	fadds	%f5, %f23, %f11
	ta	T_CHANGE_HPRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 969: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd68fe030  ! 970: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r11
	.word 0x9b45c000  ! 971: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xda57c000  ! 972: LDSH_R	ldsh	[%r31 + %r0], %r13
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 973: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802063  ! 974: WRASI_I	wr	%r0, 0x0063, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xda5fc000  ! 975: LDX_R	ldx	[%r31 + %r0], %r13
change_to_randtl_208:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 976: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xda1fe001  ! 977: LDD_I	ldd	[%r31 + 0x0001], %r13
change_to_randtl_209:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 978: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x89480000  ! 979: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x879020bb  ! 980: WRPR_TT_I	wrpr	%r0, 0x00bb, %tt
	.word 0x87802004  ! 981: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9f802001  ! 982: SIR	sir	0x0001
splash_tba_210:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 983: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93480000  ! 984: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
tagged_211:
	taddcctv %r16, 0x128c, %r21
	.word 0xd207e001  ! 985: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd21fc000  ! 986: LDD_R	ldd	[%r31 + %r0], %r9
splash_cmpr_212:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1852001  ! 987: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	.word 0x91d02035  ! 988: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x879023f6  ! 989: WRPR_TT_I	wrpr	%r0, 0x03f6, %tt
	.word 0x87902370  ! 990: WRPR_TT_I	wrpr	%r0, 0x0370, %tt
	.word 0xd207c000  ! 991: LDUW_R	lduw	[%r31 + %r0], %r9
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 993: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd21fe001  ! 994: LDD_I	ldd	[%r31 + 0x0001], %r9
	.word 0x91d02034  ! 995: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_213:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x91b00315  ! 996: ALIGNADDRESS	alignaddr	%r0, %r21, %r8
tagged_214:
	tsubcctv %r23, 0x1596, %r16
	.word 0xd007e001  ! 997: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x2c700001  ! 998: BPNEG	<illegal instruction>
	.word 0xd0800b60  ! 999: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r8
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1000: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x36700001  ! 1001: BPGE	<illegal instruction>
	.word 0xa7508000  ! 1002: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0xe647e001  ! 1003: LDSW_I	ldsw	[%r31 + 0x0001], %r19
	.word 0x9b504000  ! 1004: RDPR_TNPC	<illegal instruction>
	.word 0x8b480000  ! 1005: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x99902000  ! 1006: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xca0fe001  ! 1007: LDUB_I	ldub	[%r31 + 0x0001], %r5
splash_cmpr_215:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184e001  ! 1008: WR_STICK_REG_I	wr	%r19, 0x0001, %-
	.word 0x87802088  ! 1009: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x2e700001  ! 1010: BPVS	<illegal instruction>
	.word 0xcadfe010  ! 1011: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r5
	.word 0x8d902701  ! 1012: WRPR_PSTATE_I	wrpr	%r0, 0x0701, %pstate
splash_lsu_216:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1013: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902256  ! 1014: WRPR_TT_I	wrpr	%r0, 0x0256, %tt
tagged_217:
	taddcctv %r15, 0x1a11, %r7
	.word 0xca07e001  ! 1015: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x8d9025a2  ! 1016: WRPR_PSTATE_I	wrpr	%r0, 0x05a2, %pstate
splash_tba_218:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1017: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81a0196b  ! 1018: FqTOd	dis not found

	.word 0x91d02035  ! 1019: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_220:
	tsubcctv %r9, 0x1b32, %r14
	.word 0xc007e001  ! 1020: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xc0d00e60  ! 1021: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r0
	.word 0x2a800001  ! 1022: BCS	bcs,a	<label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 1023: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0x8ea90009  ! 1024: ANDNcc_R	andncc 	%r4, %r9, %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 1025: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x87802063  ! 1026: WRASI_I	wr	%r0, 0x0063, %asi
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1027: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 1028: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02032  ! 1029: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xb5504000  ! 1030: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf40fc000  ! 1031: LDUB_R	ldub	[%r31 + %r0], %r26
	.word 0xf48008a0  ! 1032: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0xf4900e80  ! 1033: LDUHA_R	lduha	[%r0, %r0] 0x74, %r26
	.word 0x91d02034  ! 1034: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xf48008a0  ! 1035: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0xf44fc000  ! 1036: LDSB_R	ldsb	[%r31 + %r0], %r26
	ta	T_CHANGE_HPRIV	! macro
	.word 0xf4dfe000  ! 1038: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r26
	.word 0x8780204f  ! 1039: WRASI_I	wr	%r0, 0x004f, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf45fc000  ! 1040: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0x93902007  ! 1041: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d802000  ! 1042: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802058  ! 1043: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87802058  ! 1044: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xf417c000  ! 1045: LDUH_R	lduh	[%r31 + %r0], %r26
splash_tba_221:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1046: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1047: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902007  ! 1048: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93902004  ! 1049: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_222:
	tsubcctv %r15, 0x1bca, %r14
	.word 0xf407e001  ! 1050: LDUW_I	lduw	[%r31 + 0x0001], %r26
	.word 0xa6aa8015  ! 1051: ANDNcc_R	andncc 	%r10, %r21, %r19
	.word 0x8d802000  ! 1052: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198249f  ! 1053: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049f, %hpstate
	.word 0x87902117  ! 1054: WRPR_TT_I	wrpr	%r0, 0x0117, %tt
tagged_223:
	taddcctv %r4, 0x148f, %r25
	.word 0xe607e001  ! 1055: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xe61fe001  ! 1056: LDD_I	ldd	[%r31 + 0x0001], %r19
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1057: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa3540000  ! 1058: RDPR_GL	rdpr	%-, %r17
	.word 0xe2d7e010  ! 1059: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r17
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1060: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3a700001  ! 1061: BPCC	<illegal instruction>
DS_224:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1062: RESTORE_R	restore	%r31, %r0, %r31
DS_225:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xf5114014  ! 1: LDQF_R	-	[%r5, %r20], %f26
	.word 0x85a14833  ! 1063: FADDs	fadds	%f5, %f19, %f2
	.word 0xc44fc000  ! 1064: LDSB_R	ldsb	[%r31 + %r0], %r2
	.word 0xa1902007  ! 1065: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_tba_226:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1066: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902350  ! 1067: WRPR_TT_I	wrpr	%r0, 0x0350, %tt
	.word 0xa1902004  ! 1068: WRPR_GL_I	wrpr	%r0, 0x0004, %-
change_to_randtl_227:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1069: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_cmpr_228:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184a001  ! 1070: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0x81464000  ! 1071: RD_STICK_CMPR_REG	stbar
	.word 0xc08008a0  ! 1072: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x99902005  ! 1073: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xa1902001  ! 1074: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xc08fe000  ! 1075: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r0
	.word 0x93d02034  ! 1076: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x9545c000  ! 1077: RD_TICK_CMPR_REG	rd	%-, %r10
DS_229:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x97a0054b  ! 1: FSQRTd	fsqrt	
	.word 0x8fa3483a  ! 1078: FADDs	fadds	%f13, %f26, %f7
	.word 0xcec804a0  ! 1079: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0xcecfe010  ! 1080: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r7
	.word 0xce8804a0  ! 1081: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
DS_230:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xdd5ec68f	! Random illegal ?
	.word 0xd7144016  ! 1: LDQF_R	-	[%r17, %r22], %f11
	.word 0x97a5882a  ! 1082: FADDs	fadds	%f22, %f10, %f11
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 1083: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902004  ! 1084: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd68008a0  ! 1085: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_lsu_231:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1086: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd61fc000  ! 1087: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd6cfe000  ! 1088: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	.word 0xd64fe001  ! 1089: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0x91d02033  ! 1090: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_232:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f30, %f16, %f12
	.word 0x89b18319  ! 1091: ALIGNADDRESS	alignaddr	%r6, %r25, %r4
	.word 0x97494000  ! 1092: RDHPR_HTBA	rdhpr	%htba, %r11
DS_233:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1093: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x93902006  ! 1094: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d802004  ! 1095: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802063  ! 1096: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xd617c000  ! 1097: LDUH_R	lduh	[%r31 + %r0], %r11
	.word 0xd61fe001  ! 1098: LDD_I	ldd	[%r31 + 0x0001], %r11
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 1099: LDX_R	ldx	[%r31 + %r0], %r11
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 1100: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd797e001  ! 1101: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0x91d02034  ! 1102: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1103: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd647c000  ! 1104: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0xd69fc020  ! 1105: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0xd657e001  ! 1106: LDSH_I	ldsh	[%r31 + 0x0001], %r11
	.word 0x3a800001  ! 1107: BCC	bcc,a	<label_0x1>
	.word 0x20800001  ! 1108: BN	bn,a	<label_0x1>
	.word 0xd6c004a0  ! 1109: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0xd6d7e000  ! 1110: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
	.word 0x879021fd  ! 1111: WRPR_TT_I	wrpr	%r0, 0x01fd, %tt
	.word 0xd68008a0  ! 1112: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_234:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1113: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02035  ! 1114: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd697e020  ! 1115: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r11
	.word 0x8790200f  ! 1116: WRPR_TT_I	wrpr	%r0, 0x000f, %tt
	.word 0x8d902dc9  ! 1117: WRPR_PSTATE_I	wrpr	%r0, 0x0dc9, %pstate
	.word 0xd607c000  ! 1118: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x34700001  ! 1119: BPG	<illegal instruction>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1120: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_235:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1121: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_236:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc1348000  ! 1: STQF_R	-	%f0, [%r0, %r18]
	normalw
	.word 0x93458000  ! 1122: RD_SOFTINT_REG	rd	%softint, %r9
splash_lsu_237:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1123: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
change_to_randtl_238:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1126: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd2dfe010  ! 1127: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r9
	.word 0xd297e030  ! 1128: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
	.word 0xd24fe001  ! 1129: LDSB_I	ldsb	[%r31 + 0x0001], %r9
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1130: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x36700001  ! 1131: BPGE	<illegal instruction>
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1132: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_239:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1133: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2c804a0  ! 1134: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
splash_tba_240:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1135: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902002  ! 1136: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd28fe010  ! 1137: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
splash_tba_241:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1138: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd28008a0  ! 1139: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d90289f  ! 1140: WRPR_PSTATE_I	wrpr	%r0, 0x089f, %pstate
splash_tba_242:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1141: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_243:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1142: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 1143: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802004  ! 1145: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd2c7e010  ! 1146: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 1147: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2d004a0  ! 1148: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0xd2dfe010  ! 1149: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r9
	.word 0xd24fc000  ! 1150: LDSB_R	ldsb	[%r31 + %r0], %r9
	.word 0xd297e000  ! 1151: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	.word 0x9f802001  ! 1152: SIR	sir	0x0001
	.word 0x8945c000  ! 1153: RD_TICK_CMPR_REG	rd	%-, %r4
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1154: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc817c000  ! 1155: LDUH_R	lduh	[%r31 + %r0], %r4
	.word 0x8d902bf5  ! 1156: WRPR_PSTATE_I	wrpr	%r0, 0x0bf5, %pstate
	.word 0x87902228  ! 1157: WRPR_TT_I	wrpr	%r0, 0x0228, %tt
	.word 0xc88008a0  ! 1158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc88008a0  ! 1159: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc84fe001  ! 1160: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0x8790227d  ! 1161: WRPR_TT_I	wrpr	%r0, 0x027d, %tt
	.word 0x8d802004  ! 1162: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902623  ! 1163: WRPR_PSTATE_I	wrpr	%r0, 0x0623, %pstate
	.word 0x8b51c000  ! 1164: RDPR_TL	rdpr	%tl, %r5
splash_lsu_244:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1165: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xca4fc000  ! 1166: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0x93902002  ! 1167: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xca8008a0  ! 1168: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xca47e001  ! 1169: LDSW_I	ldsw	[%r31 + 0x0001], %r5
DS_245:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f16, %f26, %f16
	.word 0x95b10307  ! 1170: ALIGNADDRESS	alignaddr	%r4, %r7, %r10
splash_lsu_246:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1171: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b3  ! 1172: Tcc_I	te	icc_or_xcc, %r0 + 179
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1173: LDX_R	ldx	[%r31 + %r0], %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902009  ! 1175: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x879023b3  ! 1176: WRPR_TT_I	wrpr	%r0, 0x03b3, %tt
DS_247:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc332c008  ! 1: STQF_R	-	%f1, [%r8, %r11]
	normalw
	.word 0x85458000  ! 1177: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x87802089  ! 1178: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x99464000  ! 1179: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0xd88008a0  ! 1180: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa1902003  ! 1181: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_248:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xd16eb16b	! Random illegal ?
	.word 0x8ba00553  ! 1: FSQRTd	fsqrt	
	.word 0x85a44833  ! 1182: FADDs	fadds	%f17, %f19, %f2
	.word 0xc4800bc0  ! 1183: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r2
	.word 0x8d9022c3  ! 1184: WRPR_PSTATE_I	wrpr	%r0, 0x02c3, %pstate
	.word 0x8d802004  ! 1185: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91d02034  ! 1186: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xc4800c40  ! 1187: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r2
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1188: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1189: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1190: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_249:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa7a00549  ! 1: FSQRTd	fsqrt	
	.word 0x81a1c82d  ! 1191: FADDs	fadds	%f7, %f13, %f0
	.word 0x87802055  ! 1192: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x819827dc  ! 1193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07dc, %hpstate
	.word 0xc017e001  ! 1194: LDUH_I	lduh	[%r31 + 0x0001], %r0
	.word 0x879022f5  ! 1195: WRPR_TT_I	wrpr	%r0, 0x02f5, %tt
splash_tba_250:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1196: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_htba_251:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1197: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1198: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_252:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1199: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879021e4  ! 1200: WRPR_TT_I	wrpr	%r0, 0x01e4, %tt
	.word 0xa2692001  ! 1201: UDIVX_I	udivx 	%r4, 0x0001, %r17
	.word 0xa1902005  ! 1202: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xe2d7e030  ! 1203: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r17
	.word 0xe24fc000  ! 1204: LDSB_R	ldsb	[%r31 + %r0], %r17
	.word 0xe2dfe010  ! 1205: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r17
	.word 0xe28fe010  ! 1206: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
splash_lsu_253:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1207: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_254:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1208: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe25fc000  ! 1209: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe28008a0  ! 1210: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x8d902ef1  ! 1211: WRPR_PSTATE_I	wrpr	%r0, 0x0ef1, %pstate
	.word 0x93902002  ! 1212: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe247e001  ! 1213: LDSW_I	ldsw	[%r31 + 0x0001], %r17
	.word 0x9f802001  ! 1214: SIR	sir	0x0001
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1215: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d020b5  ! 1216: Tcc_I	tne	icc_or_xcc, %r0 + 181
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1217: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_255:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1218: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe297e010  ! 1219: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
	.word 0x8198288f  ! 1220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088f, %hpstate
	.word 0xe2c804a0  ! 1221: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 1222: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802014  ! 1223: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xe2800c20  ! 1224: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r17
	.word 0x87902396  ! 1225: WRPR_TT_I	wrpr	%r0, 0x0396, %tt
splash_tba_256:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1226: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902009  ! 1227: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93d020b5  ! 1228: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x91d02034  ! 1229: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1230: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_257:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1231: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902004  ! 1232: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe2dfe010  ! 1233: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r17
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 1234: LDX_R	ldx	[%r31 + %r0], %r17
splash_tba_258:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1235: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02033  ! 1236: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87902064  ! 1237: WRPR_TT_I	wrpr	%r0, 0x0064, %tt
	.word 0x83540000  ! 1238: RDPR_GL	rdpr	%-, %r1
	.word 0xa1902009  ! 1239: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d020b5  ! 1240: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_lsu_259:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1241: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb345c000  ! 1242: RD_TICK_CMPR_REG	rd	%-, %r25
splash_tba_260:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1243: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_261:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1244: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_262:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181a001  ! 1245: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0xf2dfe000  ! 1246: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r25
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 1247: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_263:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1248: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_264:
	tsubcctv %r15, 0x18ac, %r9
	.word 0xf207e001  ! 1249: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0xf397e001  ! 1250: LDQFA_I	-	[%r31, 0x0001], %f25
tagged_265:
	taddcctv %r6, 0x1682, %r11
	.word 0xf207e001  ! 1251: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0x8d902bd3  ! 1252: WRPR_PSTATE_I	wrpr	%r0, 0x0bd3, %pstate
	.word 0xf2bfc02d  ! 1253: STDA_R	stda	%r25, [%r31 + %r13] 0x01
	.word 0x93902005  ! 1254: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x3a700001  ! 1255: BPCC	<illegal instruction>
	.word 0x99902001  ! 1256: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_lsu_266:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1257: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf24fc000  ! 1258: LDSB_R	ldsb	[%r31 + %r0], %r25
	.word 0xf2cfe000  ! 1259: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r25
	.word 0x8551c000  ! 1260: RDPR_TL	rdpr	%tl, %r2
	.word 0x87802063  ! 1261: WRASI_I	wr	%r0, 0x0063, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1262: LDX_R	ldx	[%r31 + %r0], %r2
DS_267:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x89a0054b  ! 1: FSQRTd	fsqrt	
	.word 0x83a1c833  ! 1263: FADDs	fadds	%f7, %f19, %f1
	.word 0xc2d004a0  ! 1264: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x87802014  ! 1265: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87902120  ! 1266: WRPR_TT_I	wrpr	%r0, 0x0120, %tt
DS_268:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0x83feda53	! Random illegal ?
	.word 0xd511801b  ! 1: LDQF_R	-	[%r6, %r27], %f10
	.word 0xa3a1882d  ! 1267: FADDs	fadds	%f6, %f13, %f17
splash_tba_269:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1268: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902005  ! 1269: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xe21fe001  ! 1270: LDD_I	ldd	[%r31 + 0x0001], %r17
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 1272: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_270:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1273: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x93902000  ! 1274: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902003  ! 1275: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_tba_271:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1276: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe29004a0  ! 1277: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	ta	T_CHANGE_HPRIV	! macro
tagged_272:
	tsubcctv %r19, 0x1d17, %r26
	.word 0xe207e001  ! 1279: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x8d9028dd  ! 1280: WRPR_PSTATE_I	wrpr	%r0, 0x08dd, %pstate
splash_lsu_273:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1281: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2c7e020  ! 1282: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r17
	.word 0x22700001  ! 1283: BPE	<illegal instruction>
	.word 0x99902004  ! 1284: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
DS_274:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1285: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
	.word 0x8e4e4001  ! 1287: MULX_R	mulx 	%r25, %r1, %r7
	.word 0xce57c000  ! 1288: LDSH_R	ldsh	[%r31 + %r0], %r7
	.word 0x93902006  ! 1289: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xcedfe030  ! 1290: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r7
	.word 0x87902328  ! 1291: WRPR_TT_I	wrpr	%r0, 0x0328, %tt
splash_cmpr_275:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1806001  ! 1292: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0xced7e000  ! 1293: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r7
	.word 0x89500000  ! 1294: RDPR_TPC	<illegal instruction>
	.word 0x8790229a  ! 1295: WRPR_TT_I	wrpr	%r0, 0x029a, %tt
splash_lsu_276:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1296: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc88fe020  ! 1297: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r4
	.word 0xc81fc000  ! 1298: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xc88008a0  ! 1299: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x879020e1  ! 1300: WRPR_TT_I	wrpr	%r0, 0x00e1, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc85fc000  ! 1301: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x8d802000  ! 1302: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3e700001  ! 1303: BPVC	<illegal instruction>
DS_277:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe131c000  ! 1: STQF_R	-	%f16, [%r0, %r7]
	normalw
	.word 0x8b458000  ! 1304: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xca8008a0  ! 1305: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
DS_278:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f0, %f8
	.word 0xabb3430a  ! 1306: ALIGNADDRESS	alignaddr	%r13, %r10, %r21
	.word 0xeb17c000  ! 1307: LDQF_R	-	[%r31, %r0], %f21
	.word 0xea9fc020  ! 1308: LDDA_R	ldda	[%r31, %r0] 0x01, %r21
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 1309: LDX_R	ldx	[%r31 + %r0], %r21
tagged_279:
	taddcctv %r22, 0x170f, %r16
	.word 0xea07e001  ! 1310: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0xea800ba0  ! 1311: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r21
splash_cmpr_280:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 1312: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0x87802004  ! 1313: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902fb7  ! 1314: WRPR_PSTATE_I	wrpr	%r0, 0x0fb7, %pstate
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1315: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_randtl_281:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1316: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
change_to_randtl_282:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1317: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x3e800001  ! 1318: BVC	bvc,a	<label_0x1>
	.word 0x93902007  ! 1319: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_tba_283:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1320: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1321: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1322: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d020b5  ! 1323: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x8751c000  ! 1324: RDPR_TL	rdpr	%tl, %r3
change_to_randtl_284:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1325: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc68008a0  ! 1326: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc617e001  ! 1327: LDUH_I	lduh	[%r31 + 0x0001], %r3
	.word 0x87802058  ! 1328: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xc697e030  ! 1329: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r3
	.word 0x819828d6  ! 1330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d6, %hpstate
	.word 0xc68804a0  ! 1331: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 1332: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x93494000  ! 1333: RDHPR_HTBA	rdhpr	%htba, %r9
splash_lsu_285:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1334: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802020  ! 1335: WRASI_I	wr	%r0, 0x0020, %asi
splash_lsu_286:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1336: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 1337: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd2d80e60  ! 1338: LDXA_R	ldxa	[%r0, %r0] 0x73, %r9
	.word 0x8d902027  ! 1339: WRPR_PSTATE_I	wrpr	%r0, 0x0027, %pstate
splash_lsu_287:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1340: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd21fc000  ! 1341: LDD_R	ldd	[%r31 + %r0], %r9
splash_cmpr_288:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184a001  ! 1342: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 1343: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd247c000  ! 1344: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xd2dfe000  ! 1345: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r9
tagged_289:
	taddcctv %r26, 0x1ab4, %r13
	.word 0xd207e001  ! 1346: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916a6001  ! 1347: SDIVX_I	sdivx	%r9, 0x0001, %r8
	.word 0x99902000  ! 1348: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x87802055  ! 1349: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd09004a0  ! 1350: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
splash_tba_291:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1351: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902000  ! 1352: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd08fe000  ! 1353: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd05fc000  ! 1354: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x91514000  ! 1355: RDPR_TBA	rdpr	%tba, %r8
	.word 0x93902006  ! 1356: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8790225a  ! 1357: WRPR_TT_I	wrpr	%r0, 0x025a, %tt
	.word 0xa1902009  ! 1358: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd01fe001  ! 1359: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x99500000  ! 1360: RDPR_TPC	rdpr	%tpc, %r12
	.word 0xd8800aa0  ! 1361: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r12
DS_292:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1362: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x87802014  ! 1363: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa9508000  ! 1364: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x87802004  ! 1365: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe857e001  ! 1366: LDSH_I	ldsh	[%r31 + 0x0001], %r20
	.word 0x87802020  ! 1367: WRASI_I	wr	%r0, 0x0020, %asi
splash_htba_293:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1368: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe847c000  ! 1369: LDSW_R	ldsw	[%r31 + %r0], %r20
DS_294:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xf531c010  ! 1: STQF_R	-	%f26, [%r16, %r7]
	normalw
	.word 0xad458000  ! 1370: RD_SOFTINT_REG	rd	%softint, %r22
	.word 0xec57c000  ! 1371: LDSH_R	ldsh	[%r31 + %r0], %r22
	.word 0xec97e010  ! 1372: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r22
	.word 0xec9fe001  ! 1373: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r22
	.word 0x2a800001  ! 1374: BCS	bcs,a	<label_0x1>
DS_295:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1375: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1376: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_296:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1377: SAVE_R	save	%r31, %r0, %r31
tagged_297:
	taddcctv %r18, 0x1080, %r22
	.word 0xec07e001  ! 1378: LDUW_I	lduw	[%r31 + 0x0001], %r22
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1379: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 1380: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xec5fe001  ! 1381: LDX_I	ldx	[%r31 + 0x0001], %r22
splash_lsu_298:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1382: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xec800bc0  ! 1383: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r22
splash_lsu_299:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1384: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xec8008a0  ! 1385: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1386: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_300:
	tsubcctv %r8, 0x1c9d, %r6
	.word 0xec07e001  ! 1387: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x8d9024ed  ! 1388: WRPR_PSTATE_I	wrpr	%r0, 0x04ed, %pstate
splash_tba_301:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1389: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902007  ! 1390: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_htba_302:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1391: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_303:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1392: SAVE_R	save	%r31, %r0, %r31
	.word 0xec57e001  ! 1393: LDSH_I	ldsh	[%r31 + 0x0001], %r22
	.word 0xecc00e40  ! 1394: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r22
	.word 0xec47c000  ! 1395: LDSW_R	ldsw	[%r31 + %r0], %r22
	.word 0x8d802004  ! 1396: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_304:
	tsubcctv %r4, 0x1aa7, %r3
	.word 0xec07e001  ! 1397: LDUW_I	lduw	[%r31 + 0x0001], %r22
splash_lsu_305:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3c800001  ! 1399: BPOS	bpos,a	<label_0x1>
DS_306:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1400: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902003  ! 1401: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_lsu_307:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1402: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xec97e030  ! 1403: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r22
	.word 0x819826d7  ! 1404: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d7, %hpstate
	.word 0xec800c20  ! 1405: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r22
splash_tba_308:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1406: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879021e0  ! 1407: WRPR_TT_I	wrpr	%r0, 0x01e0, %tt
tagged_309:
	taddcctv %r13, 0x193c, %r13
	.word 0xec07e001  ! 1408: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x8d802004  ! 1409: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xec17c000  ! 1410: LDUH_R	lduh	[%r31 + %r0], %r22
	.word 0x91d02034  ! 1411: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8198265c  ! 1412: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065c, %hpstate
tagged_310:
	tsubcctv %r12, 0x16a2, %r20
	.word 0xec07e001  ! 1413: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x87802089  ! 1414: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xecc804a0  ! 1415: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r22
	.word 0xec9fe001  ! 1416: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r22
tagged_311:
	taddcctv %r23, 0x190e, %r4
	.word 0xec07e001  ! 1417: LDUW_I	lduw	[%r31 + 0x0001], %r22
DS_312:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc931e001  ! 1: STQF_I	-	%f4, [0x0001, %r7]
	normalw
	.word 0x95458000  ! 1418: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x91d02035  ! 1419: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0xd417c000  ! 1421: LDUH_R	lduh	[%r31 + %r0], %r10
	.word 0x91d02034  ! 1422: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_313:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1423: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1424: LDX_R	ldx	[%r31 + %r0], %r10
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 1425: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_314:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1426: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd4dfe020  ! 1427: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0xd4d004a0  ! 1428: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0xd45fe001  ! 1429: LDX_I	ldx	[%r31 + 0x0001], %r10
tagged_315:
	taddcctv %r5, 0x1b6e, %r7
	.word 0xd407e001  ! 1430: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_cmpr_316:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 1431: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1432: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_317:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1433: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd447e001  ! 1434: LDSW_I	ldsw	[%r31 + 0x0001], %r10
DS_318:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1435: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200a  ! 1436: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd40fe001  ! 1437: LDUB_I	ldub	[%r31 + 0x0001], %r10
splash_cmpr_319:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1822001  ! 1438: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	.word 0x87902207  ! 1439: WRPR_TT_I	wrpr	%r0, 0x0207, %tt
splash_tba_320:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1440: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_321:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1441: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd4c7e030  ! 1442: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
	.word 0xd4800b20  ! 1443: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r10
tagged_322:
	tsubcctv %r16, 0x11bb, %r24
	.word 0xd407e001  ! 1444: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd447c000  ! 1445: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x26800001  ! 1446: BL	bl,a	<label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd45fc000  ! 1447: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa190200c  ! 1448: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1449: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4800b40  ! 1450: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd497e010  ! 1452: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r10
	.word 0x87802004  ! 1453: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_323:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1454: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902009  ! 1455: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1456: LDX_R	ldx	[%r31 + %r0], %r10
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1457: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd43fc010  ! 1458: STD_R	std	%r10, [%r31 + %r16]
	.word 0xa1902006  ! 1459: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87902305  ! 1460: WRPR_TT_I	wrpr	%r0, 0x0305, %tt
splash_htba_324:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1461: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1462: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1463: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 1464: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93d020b2  ! 1465: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_cmpr_325:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1846001  ! 1466: WR_STICK_REG_I	wr	%r17, 0x0001, %-
	.word 0x8d902091  ! 1467: WRPR_PSTATE_I	wrpr	%r0, 0x0091, %pstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1468: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa16e6001  ! 1469: SDIVX_I	sdivx	%r25, 0x0001, %r16
splash_tba_327:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1470: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0d00e60  ! 1471: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r16
	.word 0xe0d004a0  ! 1472: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r16
	.word 0x28700001  ! 1473: BPLEU	<illegal instruction>
change_to_randtl_328:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1474: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d9028e3  ! 1475: WRPR_PSTATE_I	wrpr	%r0, 0x08e3, %pstate
	.word 0xe0d804a0  ! 1476: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	.word 0xe0d804a0  ! 1477: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	.word 0xe047c000  ! 1478: LDSW_R	ldsw	[%r31 + %r0], %r16
	.word 0xa190200c  ! 1479: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1902003  ! 1480: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_329:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1481: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
splash_htba_330:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1482: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_331:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1483: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_332:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1484: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9545c000  ! 1485: RD_TICK_CMPR_REG	rd	%-, %r10
splash_tba_333:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1486: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_334:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1487: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_335:
	taddcctv %r25, 0x196d, %r11
	.word 0xd407e001  ! 1488: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd40fe001  ! 1489: LDUB_I	ldub	[%r31 + 0x0001], %r10
DS_336:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1490: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1491: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4d804a0  ! 1492: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0xd497e010  ! 1493: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r10
splash_lsu_337:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1495: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd417e001  ! 1496: LDUH_I	lduh	[%r31 + 0x0001], %r10
tagged_338:
	tsubcctv %r12, 0x1462, %r7
	.word 0xd407e001  ! 1497: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4880e40  ! 1498: LDUBA_R	lduba	[%r0, %r0] 0x72, %r10
	.word 0xd44fe001  ! 1499: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0x95540000  ! 1500: RDPR_GL	rdpr	%-, %r10
	.word 0xd4800aa0  ! 1501: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r10
splash_lsu_339:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1502: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3c800001  ! 1503: BPOS	bpos,a	<label_0x1>
tagged_340:
	tsubcctv %r25, 0x11c7, %r24
	.word 0xd407e001  ! 1504: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd49fc020  ! 1505: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0xd41fe001  ! 1506: LDD_I	ldd	[%r31 + 0x0001], %r10
	.word 0xd4d004a0  ! 1507: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0xd447c000  ! 1508: LDSW_R	ldsw	[%r31 + %r0], %r10
	.word 0x87802063  ! 1509: WRASI_I	wr	%r0, 0x0063, %asi
splash_htba_341:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1510: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x3c800001  ! 1511: BPOS	bpos,a	<label_0x1>
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1512: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 1513: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1514: LDX_R	ldx	[%r31 + %r0], %r10
splash_lsu_342:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1515: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd4800c20  ! 1516: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r10
DS_343:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1517: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802058  ! 1518: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd497e030  ! 1519: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x93d020b2  ! 1520: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x87902338  ! 1521: WRPR_TT_I	wrpr	%r0, 0x0338, %tt
splash_tba_344:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1522: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd45fc000  ! 1523: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd447e001  ! 1524: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	.word 0x8790212b  ! 1525: WRPR_TT_I	wrpr	%r0, 0x012b, %tt
splash_tba_345:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1526: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802000  ! 1527: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd48008a0  ! 1528: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x896ae001  ! 1529: SDIVX_I	sdivx	%r11, 0x0001, %r4
DS_347:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1530: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
tagged_348:
	tsubcctv %r22, 0x137b, %r19
	.word 0xc807e001  ! 1531: LDUW_I	lduw	[%r31 + 0x0001], %r4
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 1532: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0xa4d2a001  ! 1533: UMULcc_I	umulcc 	%r10, 0x0001, %r18
	.word 0xe41fc000  ! 1534: LDD_R	ldd	[%r31 + %r0], %r18
splash_tba_349:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1535: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8b504000  ! 1536: RDPR_TNPC	rdpr	%tnpc, %r5
DS_350:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xf567a224	! Random illegal ?
	.word 0xeb100004  ! 1: LDQF_R	-	[%r0, %r4], %f21
	.word 0xa7a58834  ! 1537: FADDs	fadds	%f22, %f20, %f19
splash_lsu_351:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1538: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1539: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe68008a0  ! 1540: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x93902003  ! 1541: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_352:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1542: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe6800c40  ! 1543: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r19
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
splash_cmpr_353:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186a001  ! 1546: WR_STICK_REG_I	wr	%r26, 0x0001, %-
	.word 0x99902001  ! 1547: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x93902006  ! 1548: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe697e010  ! 1550: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r19
splash_lsu_354:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1551: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe69004a0  ! 1552: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	ta	T_CHANGE_HPRIV	! macro
splash_htba_355:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1554: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8fa01967  ! 1555: FqTOd	dis not found

	.word 0xa1902006  ! 1556: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x91d020b4  ! 1557: Tcc_I	ta	icc_or_xcc, %r0 + 180
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xce5fc000  ! 1558: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xce1fe001  ! 1559: LDD_I	ldd	[%r31 + 0x0001], %r7
splash_lsu_357:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1560: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xced00e60  ! 1561: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r7
	.word 0x93902001  ! 1562: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x26700001  ! 1563: BPL	<illegal instruction>
	.word 0xcec00e60  ! 1564: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r7
	.word 0xa1902009  ! 1565: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x3e800001  ! 1566: BVC	bvc,a	<label_0x1>
change_to_randtl_358:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1567: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xce9fe001  ! 1568: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xce5fc000  ! 1569: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xa1902007  ! 1570: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x91d02035  ! 1571: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x816b6001  ! 1573: SDIVX_I	sdivx	%r13, 0x0001, %r0
	.word 0x8d902f83  ! 1574: WRPR_PSTATE_I	wrpr	%r0, 0x0f83, %pstate
	.word 0xc01fe001  ! 1575: LDD_I	ldd	[%r31 + 0x0001], %r0
	.word 0xc0880e60  ! 1576: LDUBA_R	lduba	[%r0, %r0] 0x73, %r0
	.word 0x879022f9  ! 1577: WRPR_TT_I	wrpr	%r0, 0x02f9, %tt
	.word 0x88fb4012  ! 1578: SDIVcc_R	sdivcc 	%r13, %r18, %r4
	.word 0xc88804a0  ! 1579: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 1580: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8b6c2001  ! 1581: SDIVX_I	sdivx	%r16, 0x0001, %r5
tagged_361:
	taddcctv %r22, 0x103f, %r24
	.word 0xca07e001  ! 1582: LDUW_I	lduw	[%r31 + 0x0001], %r5
splash_htba_362:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1583: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 1584: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xca07c000  ! 1585: LDUW_R	lduw	[%r31 + %r0], %r5
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89850009  ! 1586: WRTICK_R	wr	%r20, %r9, %tick
	.word 0xa1902000  ! 1587: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x99902000  ! 1588: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xa1902004  ! 1589: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d9023cd  ! 1590: WRPR_PSTATE_I	wrpr	%r0, 0x03cd, %pstate
	.word 0xca4fc000  ! 1591: LDSB_R	ldsb	[%r31 + %r0], %r5
change_to_randtl_364:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1592: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_365:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xcb110014  ! 1: LDQF_R	-	[%r4, %r20], %f5
	.word 0x91a4c827  ! 1593: FADDs	fadds	%f19, %f7, %f8
	.word 0x87902241  ! 1594: WRPR_TT_I	wrpr	%r0, 0x0241, %tt
tagged_366:
	tsubcctv %r16, 0x1e70, %r20
	.word 0xd007e001  ! 1595: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x93d02035  ! 1596: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_tba_367:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1597: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 1598: LDX_R	ldx	[%r31 + %r0], %r8
splash_lsu_368:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1599: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_369:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182e001  ! 1600: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0x9f802001  ! 1601: SIR	sir	0x0001
splash_lsu_370:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1602: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd0c7e000  ! 1603: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r8
	.word 0x87902375  ! 1604: WRPR_TT_I	wrpr	%r0, 0x0375, %tt
DS_371:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1605: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x87802080  ! 1606: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd057c000  ! 1607: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x87802004  ! 1608: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_372:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1862001  ! 1609: WR_STICK_REG_I	wr	%r24, 0x0001, %-
tagged_373:
	taddcctv %r18, 0x188d, %r21
	.word 0xd007e001  ! 1610: LDUW_I	lduw	[%r31 + 0x0001], %r8
splash_tba_374:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1611: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802089  ! 1612: WRASI_I	wr	%r0, 0x0089, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 1613: LDX_R	ldx	[%r31 + %r0], %r8
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1614: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 1615: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd08fe010  ! 1616: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
splash_lsu_375:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1617: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 1618: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd04fe001  ! 1619: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 1620: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x93a0057b  ! 1621: FSQRTq	fsqrt	
	.word 0x87802010  ! 1622: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x91d020b3  ! 1623: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x91d020b3  ! 1624: Tcc_I	ta	icc_or_xcc, %r0 + 179
DS_376:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xcffbeff2	! Random illegal ?
	.word 0xd110c000  ! 1: LDQF_R	-	[%r3, %r0], %f8
	.word 0xa7a2c826  ! 1625: FADDs	fadds	%f11, %f6, %f19
splash_tba_377:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1626: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe61fe001  ! 1627: LDD_I	ldd	[%r31 + 0x0001], %r19
	.word 0xe6c804a0  ! 1628: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
	.word 0x87802004  ! 1629: WRASI_I	wr	%r0, 0x0004, %asi
DS_378:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xcf352001  ! 1: STQF_I	-	%f7, [0x0001, %r20]
	normalw
	.word 0xb7458000  ! 1630: RD_SOFTINT_REG	rd	%softint, %r27
	.word 0x93902007  ! 1631: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99902003  ! 1632: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
splash_tba_379:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1633: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_380:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1634: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xf68008a0  ! 1635: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
	.word 0xf6d7e010  ! 1636: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r27
	.word 0xf6d804a0  ! 1637: LDXA_R	ldxa	[%r0, %r0] 0x25, %r27
	.word 0x82ac4009  ! 1638: ANDNcc_R	andncc 	%r17, %r9, %r1
	.word 0x93d02035  ! 1639: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x95464000  ! 1640: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0xd4c7e000  ! 1641: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r10
	.word 0x93902004  ! 1642: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_381:
	taddcctv %r2, 0x1306, %r2
	.word 0xd407e001  ! 1643: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d902752  ! 1644: WRPR_PSTATE_I	wrpr	%r0, 0x0752, %pstate
	.word 0xd48008a0  ! 1645: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
tagged_382:
	tsubcctv %r20, 0x137a, %r23
	.word 0xd407e001  ! 1646: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d802004  ! 1647: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_383:
	taddcctv %r26, 0x1763, %r2
	.word 0xd407e001  ! 1648: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d9021ae  ! 1649: WRPR_PSTATE_I	wrpr	%r0, 0x01ae, %pstate
DS_384:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xb5b5430c  ! 1650: ALIGNADDRESS	alignaddr	%r21, %r12, %r26
	.word 0x91d02035  ! 1651: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xf4800be0  ! 1652: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r26
	.word 0xa5464000  ! 1653: RD_STICK_CMPR_REG	rd	%-, %r18
	.word 0xe40fe001  ! 1654: LDUB_I	ldub	[%r31 + 0x0001], %r18
splash_tba_385:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1655: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe4c7e000  ! 1656: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
splash_lsu_386:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1657: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_387:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1658: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe49004a0  ! 1659: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
splash_tba_388:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1660: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902091  ! 1661: WRPR_TT_I	wrpr	%r0, 0x0091, %tt
	.word 0xe44fe001  ! 1662: LDSB_I	ldsb	[%r31 + 0x0001], %r18
tagged_389:
	taddcctv %r18, 0x1b8a, %r11
	.word 0xe407e001  ! 1663: LDUW_I	lduw	[%r31 + 0x0001], %r18
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1664: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_390:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1665: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 1666: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe40fe001  ! 1667: LDUB_I	ldub	[%r31 + 0x0001], %r18
	.word 0xe41fc000  ! 1668: LDD_R	ldd	[%r31 + %r0], %r18
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe45fc000  ! 1669: LDX_R	ldx	[%r31 + %r0], %r18
splash_htba_391:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1670: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe48fe030  ! 1671: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r18
	.word 0xe417c000  ! 1672: LDUH_R	lduh	[%r31 + %r0], %r18
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe45fc000  ! 1673: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x89480000  ! 1674: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x93902000  ! 1675: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_392:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1676: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xc8800b60  ! 1677: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r4
	.word 0xc85fe001  ! 1678: LDX_I	ldx	[%r31 + 0x0001], %r4
	.word 0xa190200f  ! 1679: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xc89fc020  ! 1680: LDDA_R	ldda	[%r31, %r0] 0x01, %r4
	.word 0x8780201c  ! 1681: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xc8800c40  ! 1682: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r4
	.word 0xc847c000  ! 1683: LDSW_R	ldsw	[%r31 + %r0], %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc8d004a0  ! 1685: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
tagged_393:
	taddcctv %r10, 0x120a, %r3
	.word 0xc807e001  ! 1686: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x93902006  ! 1687: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87802080  ! 1688: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xb7a00569  ! 1689: FSQRTq	fsqrt	
	.word 0xf697e010  ! 1690: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r27
	.word 0xf697e010  ! 1691: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r27
	.word 0x8d90250a  ! 1692: WRPR_PSTATE_I	wrpr	%r0, 0x050a, %pstate
	.word 0x22800001  ! 1693: BE	be,a	<label_0x1>
	.word 0x81982d0e  ! 1694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0e, %hpstate
	.word 0x93902004  ! 1695: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902be1  ! 1696: WRPR_PSTATE_I	wrpr	%r0, 0x0be1, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf65fc000  ! 1697: LDX_R	ldx	[%r31 + %r0], %r27
	.word 0xa1902006  ! 1698: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x95508000  ! 1699: RDPR_TSTATE	rdpr	%tstate, %r10
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1700: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd48008a0  ! 1701: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
DS_394:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1702: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8ba000d4  ! 1703: FNEGd	fnegd	%f20, %f36
DS_395:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f2, %f4, %f12
	.word 0xadb34310  ! 1704: ALIGNADDRESS	alignaddr	%r13, %r16, %r22
	.word 0x8d902339  ! 1705: WRPR_PSTATE_I	wrpr	%r0, 0x0339, %pstate
	.word 0xec9fc020  ! 1706: LDDA_R	ldda	[%r31, %r0] 0x01, %r22
	.word 0x8d902304  ! 1707: WRPR_PSTATE_I	wrpr	%r0, 0x0304, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xec47c000  ! 1709: LDSW_R	ldsw	[%r31 + %r0], %r22
	.word 0xec8804a0  ! 1710: LDUBA_R	lduba	[%r0, %r0] 0x25, %r22
DS_396:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1711: SAVE_R	save	%r31, %r0, %r31
DS_397:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa5a00555  ! 1: FSQRTd	fsqrt	
	.word 0x91a4c826  ! 1712: FADDs	fadds	%f19, %f6, %f8
	.word 0xd0800b60  ! 1713: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r8
	.word 0x93902004  ! 1714: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93d02035  ! 1715: Tcc_I	tne	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0xd197e001  ! 1717: LDQFA_I	-	[%r31, 0x0001], %f8
DS_398:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f8, %f22, %f28
	.word 0xabb18302  ! 1718: ALIGNADDRESS	alignaddr	%r6, %r2, %r21
	.word 0x9f802001  ! 1719: SIR	sir	0x0001
	.word 0x91d02034  ! 1720: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xeacfe010  ! 1721: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r21
	.word 0xea9fc020  ! 1722: LDDA_R	ldda	[%r31, %r0] 0x01, %r21
	.word 0x34800001  ! 1723: BG	bg,a	<label_0x1>
	.word 0x99902004  ! 1724: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x8d508000  ! 1725: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0x87902279  ! 1726: WRPR_TT_I	wrpr	%r0, 0x0279, %tt
DS_399:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8ba00549  ! 1: FSQRTd	fsqrt	
	.word 0x91a2c834  ! 1727: FADDs	fadds	%f11, %f20, %f8
	.word 0x8d802004  ! 1728: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 1729: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8198295e  ! 1730: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095e, %hpstate
	.word 0xd097e020  ! 1731: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
	.word 0x8d802000  ! 1732: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd05fe001  ! 1733: LDX_I	ldx	[%r31 + 0x0001], %r8
	.word 0xa190200b  ! 1734: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1735: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8790219b  ! 1736: WRPR_TT_I	wrpr	%r0, 0x019b, %tt
DS_400:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1737: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd0d804a0  ! 1738: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 1739: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x91d020b4  ! 1740: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_tba_401:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1741: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd017e001  ! 1742: LDUH_I	lduh	[%r31 + 0x0001], %r8
	ta	T_CHANGE_HPRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 1744: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa1902008  ! 1745: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93902007  ! 1746: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd0800ae0  ! 1747: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r8
	.word 0xd0c7e020  ! 1748: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r8
	.word 0x93902007  ! 1749: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d02034  ! 1750: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_402:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xf7f0a6e8	! Random illegal ?
	.word 0x8da00550  ! 1: FSQRTd	fsqrt	
	.word 0x85a5c832  ! 1751: FADDs	fadds	%f23, %f18, %f2
	.word 0xc4800ac0  ! 1752: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1753: LDX_R	ldx	[%r31 + %r0], %r2
splash_htba_403:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1754: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1755: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x87802089  ! 1756: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xc40fc000  ! 1757: LDUB_R	ldub	[%r31 + %r0], %r2
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 1758: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x34700001  ! 1759: BPG	<illegal instruction>
splash_htba_404:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1760: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 1761: LDX_R	ldx	[%r31 + %r0], %r2
splash_lsu_405:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1762: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc4d80e60  ! 1763: LDXA_R	ldxa	[%r0, %r0] 0x73, %r2
	.word 0xc417c000  ! 1764: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x93902001  ! 1765: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc48008a0  ! 1766: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1767: LDX_R	ldx	[%r31 + %r0], %r2
splash_htba_406:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1768: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_407:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1769: RESTORE_R	restore	%r31, %r0, %r31
DS_408:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1770: SAVE_R	save	%r31, %r0, %r31
	.word 0xc40fc000  ! 1771: LDUB_R	ldub	[%r31 + %r0], %r2
	.word 0xc48804a0  ! 1772: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1773: LDX_R	ldx	[%r31 + %r0], %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 1774: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc49004a0  ! 1775: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
DS_409:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc7302001  ! 1: STQF_I	-	%f3, [0x0001, %r0]
	normalw
	.word 0x9b458000  ! 1776: RD_SOFTINT_REG	rd	%softint, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200b  ! 1778: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x819820dc  ! 1779: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dc, %hpstate
	.word 0x38800001  ! 1780: BGU	bgu,a	<label_0x1>
	.word 0x87902129  ! 1781: WRPR_TT_I	wrpr	%r0, 0x0129, %tt
DS_410:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1782: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_411:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xeb35c00c  ! 1: STQF_R	-	%f21, [%r12, %r23]
	normalw
	.word 0x87458000  ! 1783: RD_SOFTINT_REG	rd	%softint, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902006  ! 1785: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_lsu_412:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1786: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_413:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1787: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f13  ! 1788: WRPR_PSTATE_I	wrpr	%r0, 0x0f13, %pstate
	.word 0x87802063  ! 1789: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xc6800ae0  ! 1790: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r3
	.word 0x93b44fe9  ! 1791: FONES	e	%f9
splash_lsu_414:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1792: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2c7e030  ! 1793: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
	.word 0xa1902008  ! 1794: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_415:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x91a0054d  ! 1: FSQRTd	fsqrt	
	.word 0xa3a34829  ! 1795: FADDs	fadds	%f13, %f9, %f17
	.word 0x87902310  ! 1796: WRPR_TT_I	wrpr	%r0, 0x0310, %tt
	.word 0x91d02034  ! 1797: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe2800a60  ! 1798: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r17
	.word 0xe2800ac0  ! 1799: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r17
	.word 0xe21fc000  ! 1800: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0xe2cfe030  ! 1801: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r17
DS_416:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xad5baa6f	! Random illegal ?
	.word 0xd9120013  ! 1: LDQF_R	-	[%r8, %r19], %f12
	.word 0xb5a6c832  ! 1802: FADDs	fadds	%f27, %f18, %f26
	.word 0xb4ae800d  ! 1803: ANDNcc_R	andncc 	%r26, %r13, %r26
DS_417:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcd336001  ! 1: STQF_I	-	%f6, [0x0001, %r13]
	normalw
	.word 0x85458000  ! 1804: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc4d00e60  ! 1805: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r2
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1806: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1807: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc457c000  ! 1808: LDSH_R	ldsh	[%r31 + %r0], %r2
	.word 0x87802063  ! 1809: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8d902b36  ! 1810: WRPR_PSTATE_I	wrpr	%r0, 0x0b36, %pstate
	.word 0xa5500000  ! 1811: RDPR_TPC	rdpr	%tpc, %r18
splash_lsu_418:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1812: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe4880e80  ! 1813: LDUBA_R	lduba	[%r0, %r0] 0x74, %r18
	.word 0x93902006  ! 1814: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_419:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1815: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8d902412  ! 1816: WRPR_PSTATE_I	wrpr	%r0, 0x0412, %pstate
	.word 0xe49fe001  ! 1817: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0x8d9022ab  ! 1818: WRPR_PSTATE_I	wrpr	%r0, 0x02ab, %pstate
	.word 0xe48008a0  ! 1819: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe40fe001  ! 1820: LDUB_I	ldub	[%r31 + 0x0001], %r18
splash_tba_420:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1821: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe45fc000  ! 1822: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8198215e  ! 1823: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015e, %hpstate
	.word 0x93902006  ! 1824: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x85508000  ! 1825: RDPR_TSTATE	rdpr	%tstate, %r2
splash_lsu_421:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1826: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 1827: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc417e001  ! 1828: LDUH_I	lduh	[%r31 + 0x0001], %r2
	.word 0x3a700001  ! 1829: BPCC	<illegal instruction>
	.word 0x8d9023ff  ! 1830: WRPR_PSTATE_I	wrpr	%r0, 0x03ff, %pstate
	.word 0x91d02032  ! 1831: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902000  ! 1832: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_cmpr_422:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb185a001  ! 1833: WR_STICK_REG_I	wr	%r22, 0x0001, %-
	.word 0xc42fc00d  ! 1834: STB_R	stb	%r2, [%r31 + %r13]
	.word 0x93902001  ! 1835: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
tagged_423:
	taddcctv %r11, 0x19fb, %r8
	.word 0xc407e001  ! 1836: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc4c7e020  ! 1837: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
splash_lsu_424:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1838: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87a00546  ! 1839: FSQRTd	fsqrt	
	.word 0x95514000  ! 1840: RDPR_TBA	rdpr	%tba, %r10
	.word 0x93902003  ! 1841: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1842: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_425:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186a001  ! 1843: WR_STICK_REG_I	wr	%r26, 0x0001, %-
	.word 0x87802010  ! 1844: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93902000  ! 1845: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902001  ! 1846: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd49fc020  ! 1847: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0x8d902f2c  ! 1848: WRPR_PSTATE_I	wrpr	%r0, 0x0f2c, %pstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1849: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_426:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1850: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1851: LDX_R	ldx	[%r31 + %r0], %r10
tagged_427:
	taddcctv %r8, 0x1c94, %r21
	.word 0xd407e001  ! 1852: LDUW_I	lduw	[%r31 + 0x0001], %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x99902005  ! 1854: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8d902e5e  ! 1855: WRPR_PSTATE_I	wrpr	%r0, 0x0e5e, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1856: LDX_R	ldx	[%r31 + %r0], %r10
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1857: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xa190200c  ! 1858: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 1860: SIR	sir	0x0001
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1861: LDX_R	ldx	[%r31 + %r0], %r10
tagged_428:
	tsubcctv %r6, 0x1263, %r5
	.word 0xd407e001  ! 1862: LDUW_I	lduw	[%r31 + 0x0001], %r10
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1863: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd45fc000  ! 1864: LDX_R	ldx	[%r31 + %r0], %r10
change_to_randtl_429:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1865: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
DS_430:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1866: SAVE_R	save	%r31, %r0, %r31
	.word 0xd48008a0  ! 1867: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
DS_431:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1868: SAVE_R	save	%r31, %r0, %r31
	.word 0xd48008a0  ! 1869: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd40fc000  ! 1870: LDUB_R	ldub	[%r31 + %r0], %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd4800c80  ! 1872: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r10
	.word 0xd4d804a0  ! 1873: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0xd4d00e40  ! 1874: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r10
	.word 0x8d90288a  ! 1875: WRPR_PSTATE_I	wrpr	%r0, 0x088a, %pstate
	.word 0x93902001  ! 1876: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd48008a0  ! 1877: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d9026d9  ! 1878: WRPR_PSTATE_I	wrpr	%r0, 0x06d9, %pstate
	.word 0xd41fe001  ! 1879: LDD_I	ldd	[%r31 + 0x0001], %r10
	.word 0xd48008a0  ! 1880: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x84fc801a  ! 1881: SDIVcc_R	sdivcc 	%r18, %r26, %r2
	ta	T_CHANGE_PRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 1883: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc49004a0  ! 1884: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	.word 0x91d020b3  ! 1885: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xc4c7e030  ! 1886: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 1887: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc4d004a0  ! 1888: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r2
tagged_432:
	tsubcctv %r24, 0x1406, %r2
	.word 0xc407e001  ! 1889: LDUW_I	lduw	[%r31 + 0x0001], %r2
splash_tba_433:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1890: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02032  ! 1891: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902003  ! 1892: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d90204f  ! 1893: WRPR_PSTATE_I	wrpr	%r0, 0x004f, %pstate
DS_434:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1894: SAVE_R	save	%r31, %r0, %r31
	.word 0xc4c80e40  ! 1895: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r2
DS_435:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1896: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc49004a0  ! 1897: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	.word 0xc527e001  ! 1898: STF_I	st	%f2, [0x0001, %r31]
	.word 0x9751c000  ! 1899: RDPR_TL	rdpr	%tl, %r11
	.word 0xa1902008  ! 1900: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd6d004a0  ! 1901: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
tagged_436:
	tsubcctv %r23, 0x1d3d, %r19
	.word 0xd607e001  ! 1902: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd717c000  ! 1903: LDQF_R	-	[%r31, %r0], %f11
	.word 0x8d90225b  ! 1904: WRPR_PSTATE_I	wrpr	%r0, 0x025b, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8da01967  ! 1905: FqTOd	dis not found

	.word 0xccd004a0  ! 1906: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
splash_tba_438:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1907: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9027cf  ! 1908: WRPR_PSTATE_I	wrpr	%r0, 0x07cf, %pstate
	.word 0xa1902003  ! 1909: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_439:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f26, %f18
	.word 0xa9b4030b  ! 1910: ALIGNADDRESS	alignaddr	%r16, %r11, %r20
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1911: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 1912: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x91d02035  ! 1913: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe89fc020  ! 1914: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
splash_tba_440:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1915: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_441:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1916: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902005  ! 1917: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8790224b  ! 1918: WRPR_TT_I	wrpr	%r0, 0x024b, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 1919: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe8d80e80  ! 1920: LDXA_R	ldxa	[%r0, %r0] 0x74, %r20
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89830012  ! 1921: WRTICK_R	wr	%r12, %r18, %tick
splash_lsu_443:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1922: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_444:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1923: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe89004a0  ! 1924: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0xe88008a0  ! 1925: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1926: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9951c000  ! 1927: RDPR_TL	rdpr	%tl, %r12
splash_tba_445:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1928: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_446:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1929: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902319  ! 1930: WRPR_TT_I	wrpr	%r0, 0x0319, %tt
	.word 0xd88008a0  ! 1931: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd85fe001  ! 1932: LDX_I	ldx	[%r31 + 0x0001], %r12
	.word 0x93902001  ! 1933: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_447:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1934: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879020bf  ! 1935: WRPR_TT_I	wrpr	%r0, 0x00bf, %tt
	.word 0xd8900e40  ! 1936: LDUHA_R	lduha	[%r0, %r0] 0x72, %r12
	.word 0x9f802001  ! 1937: SIR	sir	0x0001
	.word 0x87902245  ! 1938: WRPR_TT_I	wrpr	%r0, 0x0245, %tt
	.word 0x3e800001  ! 1939: BVC	bvc,a	<label_0x1>
	.word 0x87902356  ! 1940: WRPR_TT_I	wrpr	%r0, 0x0356, %tt
splash_htba_448:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1941: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_449:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1942: SAVE_R	save	%r31, %r0, %r31
	.word 0x87902101  ! 1943: WRPR_TT_I	wrpr	%r0, 0x0101, %tt
	.word 0x8d902c06  ! 1944: WRPR_PSTATE_I	wrpr	%r0, 0x0c06, %pstate
tagged_450:
	tsubcctv %r8, 0x1998, %r5
	.word 0xd807e001  ! 1945: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8d802000  ! 1946: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd8dfe020  ! 1947: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	.word 0xd8800c00  ! 1948: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r12
splash_tba_451:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1949: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02032  ! 1950: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd8c004a0  ! 1951: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0xa1514000  ! 1952: RDPR_TBA	rdpr	%tba, %r16
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe05fc000  ! 1953: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0800c40  ! 1954: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r16
splash_lsu_452:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1955: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 1956: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x879022b0  ! 1957: WRPR_TT_I	wrpr	%r0, 0x02b0, %tt
	.word 0x93902003  ! 1958: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe0800b40  ! 1959: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r16
	.word 0xe08804a0  ! 1960: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe05fc000  ! 1961: LDX_R	ldx	[%r31 + %r0], %r16
change_to_randtl_453:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1962: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x87802055  ! 1963: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8d9020c3  ! 1964: WRPR_PSTATE_I	wrpr	%r0, 0x00c3, %pstate
	.word 0x91d020b4  ! 1965: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xe057c000  ! 1966: LDSH_R	ldsh	[%r31 + %r0], %r16
tagged_454:
	tsubcctv %r26, 0x1428, %r4
	.word 0xe007e001  ! 1967: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8d802000  ! 1968: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe0dfe010  ! 1969: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r16
	.word 0xa190200d  ! 1970: WRPR_GL_I	wrpr	%r0, 0x000d, %-
change_to_randtl_455:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1971: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x93902003  ! 1972: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d802000  ! 1973: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02034  ! 1974: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956b6001  ! 1975: SDIVX_I	sdivx	%r13, 0x0001, %r10
	.word 0xd4d7e010  ! 1976: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
	.word 0xd48008a0  ! 1977: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd417c000  ! 1978: LDUH_R	lduh	[%r31 + %r0], %r10
	.word 0x26800001  ! 1979: BL	bl,a	<label_0x1>
DS_457:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f18, %f18, %f12
	.word 0x91b30311  ! 1980: ALIGNADDRESS	alignaddr	%r12, %r17, %r8
	.word 0x91d02032  ! 1981: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8790222d  ! 1982: WRPR_TT_I	wrpr	%r0, 0x022d, %tt
	.word 0x8d902cda  ! 1983: WRPR_PSTATE_I	wrpr	%r0, 0x0cda, %pstate
	.word 0xd00fe001  ! 1984: LDUB_I	ldub	[%r31 + 0x0001], %r8
	.word 0xd097e010  ! 1985: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0x2c800001  ! 1987: BNEG	bneg,a	<label_0x1>
	.word 0x87802058  ! 1988: WRASI_I	wr	%r0, 0x0058, %asi
splash_lsu_458:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1989: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd01fe001  ! 1990: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x26700001  ! 1991: BPL	<illegal instruction>
splash_tba_459:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1992: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902002  ! 1993: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 1994: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xb1540000  ! 1995: RDPR_GL	rdpr	%-, %r24
	.word 0xf00fe001  ! 1996: LDUB_I	ldub	[%r31 + 0x0001], %r24
	.word 0x2e800001  ! 1997: BVS	bvs,a	<label_0x1>
	.word 0xa1902005  ! 1998: WRPR_GL_I	wrpr	%r0, 0x0005, %-
tagged_460:
	tsubcctv %r12, 0x1d0e, %r9
SECTION .MAIN
.text
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

	.xword	0x570efc328ce05679
	.xword	0xdd59b9fb7c16d611
	.xword	0x729595cfdf7e8084
	.xword	0xe66da2813bd0c91e
	.xword	0x312c2079ee77c23a
	.xword	0x9c1acd3bdc42928e
	.xword	0x7e73e1740a41b82f
	.xword	0x43c713e725f8b7a1
	.xword	0x7564a3828c3f2478
	.xword	0x3d4974a7319583d2
	.xword	0xadde23acd7209380
	.xword	0x29f9fbc62478648a
	.xword	0xbba997b5d103ae1c
	.xword	0xe83f2c0c2ce93925
	.xword	0x6d2e5e2beb232918
	.xword	0x754d9b9094e7be4b
	.xword	0x3966f0c84f65e74f
	.xword	0x1ee3293e7745bf18
	.xword	0x939139daf71c8f60
	.xword	0x39ae11d15fec1121
	.xword	0x9a8aea8d7ee8def7
	.xword	0xe927796b9046d1b3
	.xword	0x43bd72aacab99b94
	.xword	0xc114f26de3020894
	.xword	0xd625a4127c110064
	.xword	0x8d6572d139b1dacb
	.xword	0xacc78852e727186c
	.xword	0x8c138096f972c6f9
	.xword	0xf750db6962429072
	.xword	0x6ffa2b6d75467f56
	.xword	0xe9769ba911db184b
	.xword	0x1fe282a35bb0faeb
	.xword	0xf7a3656c7bf9edd5
	.xword	0x1cc2273698cc259d
	.xword	0x9683a3dc421d734f
	.xword	0xc638e3f4fca2605d
	.xword	0x037971ade0d2cb1f
	.xword	0xf1c2b59b64a8e6a6
	.xword	0x77e7083bfc176532
	.xword	0x4b3f7c85a5d3c701
	.xword	0x0e2598ca4993f859
	.xword	0xa2af270451bfe406
	.xword	0x8303e57b35847a02
	.xword	0xc1b34d61e16471db
	.xword	0x5b9c865781f6e70a
	.xword	0x033057b96eb27ece
	.xword	0x059be9a957fad5b5
	.xword	0x86b7722561bd06a5
	.xword	0xba2f18dae400c74f
	.xword	0x9d2421b248797f3a
	.xword	0xeb5435b64ab08c80
	.xword	0x52b7c1182e192653
	.xword	0x9d5cb01cd19c866f
	.xword	0xcbfe76fecf59b91a
	.xword	0xf3511b774ce75f94
	.xword	0xc116f3d2fc0a503f
	.xword	0x1e6eee491d5466a3
	.xword	0xdf5b12508c68d483
	.xword	0x9bb6f2eb4c6852a1
	.xword	0x7c72d61103924747
	.xword	0x450493fa1e6100c0
	.xword	0x8d1b8ad62dcbef21
	.xword	0x24332a133aff39c0
	.xword	0x412ef25b36778fef
	.xword	0x30003bdfb55962fe
	.xword	0x924f9f5f49a81bbb
	.xword	0x39b1d72caa3acec8
	.xword	0xc8ab795f26fab118
	.xword	0x0d6e4f9083de94b4
	.xword	0xfdbcfffa51a124b7
	.xword	0x43c5386d37e1c89f
	.xword	0xc80f24bd1d0f56ca
	.xword	0xf1e263dd712f3973
	.xword	0x183c7efe2b624f88
	.xword	0x3f3de077e040c6f0
	.xword	0x4b20f1bc098dd4d6
	.xword	0xbc160635b6066d76
	.xword	0x9b082dd59327cd9b
	.xword	0x49f5e49049b88401
	.xword	0x028a866dd62cb4e0
	.xword	0xb546f0110ab6f999
	.xword	0xeb45f3af47fbea1e
	.xword	0x0d81e6565d3c6d58
	.xword	0x853fe0373f6079bb
	.xword	0xa945748488e07ca8
	.xword	0xfcb8a8f3941a6a77
	.xword	0x57d0f1b9c72f607e
	.xword	0x6d7acb1c035b8f0e
	.xword	0x40b5ee37ce2d5044
	.xword	0xc5e866f88e48ded9
	.xword	0xcdd5920a51b544b7
	.xword	0x78ae18f145190903
	.xword	0x123e219a00235d2e
	.xword	0xcb455301791c4fba
	.xword	0x78ffccee8b6e41c2
	.xword	0x4e051d40c6abd38a
	.xword	0x36dbe435c3a589f7
	.xword	0xf29d3547757b3889
	.xword	0x3970f3e6de1af047
	.xword	0xb227ffecae7369f8
	.xword	0x074304aa3ceefb3c
	.xword	0x599fb38807f70d4d
	.xword	0x6acd3ab2cf847cd8
	.xword	0x506d4a6198509cdf
	.xword	0x04a8baf48d570013
	.xword	0x6045540245cfdf55
	.xword	0xc4f18b83e32a375b
	.xword	0x0d451996affc2f80
	.xword	0x8d87bd7108c132fd
	.xword	0x33b319c38555529c
	.xword	0xca5a1b32dc6f058e
	.xword	0x3ae333fc796e002b
	.xword	0x7bcfd532cc908794
	.xword	0xfae53f4fdfd47888
	.xword	0x8afac1bb753ad8d2
	.xword	0xbff3198064bb86ae
	.xword	0xbe15dfa632472aed
	.xword	0x87fc6bd0b47fe9d9
	.xword	0x05d24d3acbd5d179
	.xword	0x549bcac5ffe5c780
	.xword	0x1172e92636e8a018
	.xword	0xc3aca320a53ab6ad
	.xword	0x159d1c8ed2d03290
	.xword	0x7bdc4517cdf0f23b
	.xword	0x23c3e094451ead9a
	.xword	0xd5a5ba785a073b94
	.xword	0x35c41c2567c126b0
	.xword	0x9889afb0cebac0f8
	.xword	0xbb89f7a701a89543
	.xword	0x87ad587fd3477001
	.xword	0xd1d3aef8370094e9
	.xword	0x536fb2e3dbbb4672
	.xword	0x7a607f70941be3c5
	.xword	0x08f92520eec7aa7b
	.xword	0xb42201237636c800
	.xword	0x7579a8de94575b7b
	.xword	0x629c47a562722e17
	.xword	0xa3d7d09befe86f1d
	.xword	0xbacb905d0c3ffc2b
	.xword	0xf4361fe423cdba24
	.xword	0x6b753ead24d2ccd9
	.xword	0xa427fe874921a7a2
	.xword	0x66451770bb99e627
	.xword	0x39737316015b31cd
	.xword	0xe9f236416510afed
	.xword	0x875d3fa8ff969ef6
	.xword	0x4bcec88dcaf1d421
	.xword	0xee08cffcba00bc0a
	.xword	0x7b1053ae425af8fd
	.xword	0xee14121e078bad02
	.xword	0xa4470a961b071831
	.xword	0x55dbf28531b981b6
	.xword	0x94372a066a442441
	.xword	0x1f55f84637916cbd
	.xword	0xfb43c8e1ddc83382
	.xword	0xab379e8ffde8347b
	.xword	0x600cf54028ce38bb
	.xword	0xc7dbaeb267893043
	.xword	0xdffb71f7f495567e
	.xword	0x73bc6a2b8e6a8f2c
	.xword	0xa39199cf73043335
	.xword	0xb82b433f0c3b1c31
	.xword	0x80634feb140ff674
	.xword	0xdb6079183c7b9a34
	.xword	0x943d3af540fe6ac2
	.xword	0x243757e616345179
	.xword	0xfaefe10c40f77c1f
	.xword	0xdca914c40eaab494
	.xword	0x406307191d8e1e68
	.xword	0x243f8398f9fb6056
	.xword	0x6d067dd959ba2b09
	.xword	0x2c78af9714847c1f
	.xword	0x3b4658e78a604973
	.xword	0x457979d799596a07
	.xword	0xb49ce5f97ac20bd7
	.xword	0x550fedd0d2490315
	.xword	0xd96128e58ad458ac
	.xword	0x574a7e9073dad12d
	.xword	0x322bf8acda8b684e
	.xword	0x08c89fd0fba71d0b
	.xword	0x81e5bffb6dd898fe
	.xword	0x956ddb52ed222976
	.xword	0x2eabd111a5815599
	.xword	0x95aa92af3f4dd863
	.xword	0xd673e4764d2a64ad
	.xword	0xa9e3cb99e924f210
	.xword	0x19ecf7cdd83f86ea
	.xword	0xf781aeaf6e5fbb23
	.xword	0x43ed911c3571f27e
	.xword	0x868f1653ea824ced
	.xword	0x7dff46767cd46d17
	.xword	0x6720eee945d0426e
	.xword	0x46b02fca7afa4716
	.xword	0x578701418bb1de6c
	.xword	0xb422783d3ef1e142
	.xword	0xdbf9c58eaa4489e9
	.xword	0xbcec39bf0c3e7e24
	.xword	0xf60fe88f3208cdf4
	.xword	0x5998c8af542ed2b1
	.xword	0x5d10c977360eedec
	.xword	0x70a86222a5a4bc70
	.xword	0xd7abd12b303ca7c1
	.xword	0xf3295d2c992e582d
	.xword	0x7d788305332a1ba0
	.xword	0x68239f133d89af10
	.xword	0xa47879fa057b013f
	.xword	0x1b7978b71df83367
	.xword	0x66227102240e1349
	.xword	0x8ee3884d1cbfe175
	.xword	0x4c0a0e6f52cf4540
	.xword	0x344eaaa76c5ae7b7
	.xword	0x96444da3b4f83244
	.xword	0xe8df05db664f6ee8
	.xword	0x237957cb2acf3b9f
	.xword	0x8a7c1d30f6caaeaa
	.xword	0x8cb32d5a29229de0
	.xword	0xa92865126b587b3c
	.xword	0x724d5e0ec305de23
	.xword	0x62dd53309d1352b8
	.xword	0x73dedacbd3d768c5
	.xword	0xbb823d9edfe15b97
	.xword	0x6c228a4146beded1
	.xword	0xd8a6b87c2648529e
	.xword	0x2b272b7615c31029
	.xword	0xce67ceb634645c42
	.xword	0x6363cabe4fdce8f6
	.xword	0x427b20784e76b35a
	.xword	0xeedfdf9313e578ea
	.xword	0x29edfe272e27bb45
	.xword	0x773cd3ce1d8b2f0a
	.xword	0x4d2bbeb8d13a55f3
	.xword	0xf811394530afbcb8
	.xword	0x4eb712e288998188
	.xword	0x341d4d630955ab29
	.xword	0x7e9b7dea11f93b06
	.xword	0xa6e0c2bcf8475e3f
	.xword	0x1e923aacdb1169da
	.xword	0x72aac7a6f04be352
	.xword	0xbdfb633cc633abd6
	.xword	0x570f509af6a2fa71
	.xword	0x464663336af82ef4
	.xword	0x28ddfb542b32ea40
	.xword	0xe841864b34da29a1
	.xword	0x3c7f0d372016b40f
	.xword	0x42eeb3323e46a7cd
	.xword	0x641bbeb1629202fa
	.xword	0xa45d012db6649add
	.xword	0xd087ea341abb654b
	.xword	0xb9ccbabc69ca56a9
	.xword	0x8e36a73cf3d99658
	.xword	0xb939ab17b99e0495
	.xword	0x17354736c0a2b71f
	.xword	0x441fad6cf306be05
	.xword	0x8a4cb184d9bb268a
	.xword	0x8b4a226a792baab3
	.xword	0xc536b987ceaa3eb6

.global wdog_2_ext
# 9 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
.global wdog_2_ext

SECTION .HTRAPS
.text
htrap_5_ext:
    rd %pc, %g2
    inc %g3
    add %g2, htrap_5_ext_done-htrap_5_ext, %g2
    rdpr %tl, %g3
    rdpr %tstate, %g4
    rdhpr %htstate, %g5
    or %g5, 0x4, %g5
    inc %g3
    wrpr %g3, %tl
    wrpr %g2, %tpc
    add %g2, 4, %g2
    wrpr %g2, %tnpc
    wrpr %g4, %tstate
    wrhpr %g5, %htstate
    retry
htrap_5_ext_done:
    done

wdog_2_ext:
    mov 0x1f, %g1
    stxa    %g1, [%g0] ASI_LSU_CTL_REG
    stxa    %g0, [%g0] ASI_ERROR_INJECT
 ! If TT != 2, then goto trap handler
    rdpr %tt, %g1
    cmp %g1, 0x2
    bne wdog_2_goto_handler
    nop
 ! else done
    done
wdog_2_goto_handler:
    rdhpr %htba, %g2
    sllx %g1, 5, %g1
    add %g1, %g2, %g2
    jmp %g2
    nop
# 51 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
! Red mode other reset handler
! Get htba, and tt and make trap address
! Jump to trap handler ..

SECTION .RED_SEC
.text
red_other_ext:
 ! IF TL=6, shift stack by one ..
    rdpr %tl, %g1
    cmp %g1, 6
    be start_tsa_shift
    nop

continue_red_other:
    mov 0x1f, %g1
    stxa    %g1, [%g0] ASI_LSU_CTL_REG
    stxa    %g0, [%g0] ASI_ERROR_INJECT

    rdpr %tt, %g1
    sllx %g1, 5, %g1
    rdhpr %htba, %g2
    add %g1, %g2, %g2
    rdhpr %hpstate, %g1
    jmp %g2
    wrhpr %g1, 0x20, %hpstate
    nop

wdog_red_ext:
 ! Shift stack down by 1 ...
    rdpr %tl, %g1
start_tsa_shift:
    mov 0x2, %g2

tsa_shift:
    wrpr %g2, %tl
    rdpr %tt, %g3
    rdpr %tpc, %g4
    rdpr %tnpc, %g5
    rdpr %tstate, %g6
    rdhpr %htstate, %g7
    dec %g2
    wrpr %g2, %tl
    wrpr %g3, %tt
    wrpr %g4, %tpc
    wrpr %g5, %tnpc
    wrpr %g6, %tstate
    wrhpr %g7, %htstate
    add %g2, 2, %g2
    cmp %g2, %g1
    ble tsa_shift
    nop
tsa_shift_done:
    dec %g1
    wrpr %g1, %tl

 ! If TT != 2, then goto trap handler
    rdpr %tt, %g1

    cmp %g1, 0x2
    bne continue_red_other
    nop
 ! else done
    mov 0x1f, %g1
    stxa    %g1, [%g0] ASI_LSU_CTL_REG
    stxa    %g0, [%g0] ASI_ERROR_INJECT
    done
# 310 "diag.j"



SECTION .MyHTRAPS_0 TEXT_VA = 0x0000000000380000, DATA_VA = 0x000000000038c000
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
	TTE_W	 = 1,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyTRAPS_0,
	RA	 = 0x00000000003cc000,
	PA	 = ra2pa(0x00000000003cc000,0),
	part_0_ctx_zero_tsb_config_0,
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
	TTE_W	 = 1
}

attr_text {
    Name = .MyTRAPS_0 
    hypervisor
}
attr_data {
    Name = .MyTRAPS_0 
    hypervisor
}

#include "traps.s"



SECTION .MyTRAPS_1 TEXT_VA = 0x00000000003d0000, DATA_VA = 0x00000000003dc000
attr_text {
	Name	 = .MyTRAPS_1,
	RA	 = 0x00000000003d0000,
	PA	 = ra2pa(0x00000000003d0000,0),
	part_0_ctx_zero_tsb_config_0,
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
	TTE_W	 = 1,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyTRAPS_1,
	RA	 = 0x00000000003dc000,
	PA	 = ra2pa(0x00000000003dc000,0),
	part_0_ctx_zero_tsb_config_0,
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
	TTE_W	 = 1
}

attr_text {
    Name = .MyTRAPS_1 
    hypervisor
}
attr_data {
    Name = .MyTRAPS_1 
    hypervisor
}

#include "traps.s"



SECTION .MyTRAPS_2 TEXT_VA = 0x00000000003e0000, DATA_VA = 0x00000000003ec000
attr_text {
	Name	 = .MyTRAPS_2,
	RA	 = 0x00000000003e0000,
	PA	 = ra2pa(0x00000000003e0000,0),
	part_0_ctx_zero_tsb_config_0,
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
	TTE_W	 = 1,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyTRAPS_2,
	RA	 = 0x00000000003ec000,
	PA	 = ra2pa(0x00000000003ec000,0),
	part_0_ctx_zero_tsb_config_0,
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
	TTE_W	 = 1
}

attr_text  {
    Name = .MyTRAPS_2 
    hypervisor
}
attr_data {
    Name = .MyTRAPS_2 
    hypervisor
}

#include "traps.s"



SECTION .MyTRAPS_3 TEXT_VA = 0x00000000003f0000, DATA_VA = 0x00000000003fc000
attr_text {
	Name	 = .MyTRAPS_3,
	RA	 = 0x00000000003f0000,
	PA	 = ra2pa(0x00000000003f0000,0),
	part_0_ctx_zero_tsb_config_0,
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
	TTE_W	 = 1,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyTRAPS_3,
	RA	 = 0x00000000003fc000,
	PA	 = ra2pa(0x00000000003fc000,0),
	part_0_ctx_zero_tsb_config_0,
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
	TTE_W	 = 1
}

attr_text {
    Name = .MyTRAPS_3 
    hypervisor
}
attr_data {
    Name = .MyTRAPS_3 
    hypervisor
}

#include "traps.s"



#if 0
#endif

