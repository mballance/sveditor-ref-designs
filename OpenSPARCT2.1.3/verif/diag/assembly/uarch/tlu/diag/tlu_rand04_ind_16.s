/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_16.s
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
    mov 8, %g3;\
    stxa %g3, [%g0] 0x57;\
    stw %g2, [%i7];\
    done;\
    nop;nop;nop

#define H_HT0_Trap_Instruction_1
#define My_HT0_Trap_Instruction_1 \
    rd %asi, %g2;\
    mov 8, %g3;\
    stxa %g3, [%g0] 0x5f;\
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
	mov 0x32, %r14
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
	mov 0x32, %r14
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
	mov 0xb5, %r14
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
	mov 0x34, %r14
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

    ta T_CHANGE_HPRIV 

    !Initializing Tick Cmprs
    mov 1, %g2
    sllx %g2, 63, %g2
    or %g1, %g2, %g1
    wrhpr %g1, %g0, %hsys_tick_cmpr
    wr %g1, %g0, %tick_cmpr
    wr %g1, %g0, %sys_tick_cmpr
    ta T_CHANGE_NONHPRIV 

splash_tba_0:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902001  ! 3: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8d902ea1  ! 4: WRPR_PSTATE_I	wrpr	%r0, 0x0ea1, %pstate
splash_htba_1:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 5: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_cmpr_2:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182e001  ! 6: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0x87902075  ! 7: WRPR_TT_I	wrpr	%r0, 0x0075, %tt
	.word 0x93902002  ! 8: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902462  ! 9: WRPR_PSTATE_I	wrpr	%r0, 0x0462, %pstate
DS_3:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 10: SAVE_R	save	%r31, %r0, %r31
	.word 0xced004a0  ! 11: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
tagged_4:
	tsubcctv %r3, 0x1193, %r26
	.word 0xce07e001  ! 12: LDUW_I	lduw	[%r31 + 0x0001], %r7
splash_tba_5:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 13: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802088  ! 14: WRASI_I	wr	%r0, 0x0088, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 15: LDX_R	ldx	[%r31 + %r0], %r7
splash_lsu_6:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 16: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_7:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 17: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_8:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 18: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_9:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce0fe001  ! 20: LDUB_I	ldub	[%r31 + 0x0001], %r7
DS_10:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f6, %f14, %f18
	.word 0x8db60307  ! 21: ALIGNADDRESS	alignaddr	%r24, %r7, %r6
	.word 0xccd7e010  ! 22: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r6
	.word 0x87802063  ! 23: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xccc7e020  ! 24: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r6
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 25: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xcc8fe030  ! 26: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r6
	.word 0x85480000  ! 27: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d020b5  ! 29: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8790230a  ! 30: WRPR_TT_I	wrpr	%r0, 0x030a, %tt
splash_lsu_11:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 32: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_12:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 33: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x91d02033  ! 34: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902005  ! 35: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc4c00e60  ! 36: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r2
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89828014  ! 37: WRTICK_R	wr	%r10, %r20, %tick
	.word 0x9f802001  ! 38: SIR	sir	0x0001
	.word 0x91d02035  ! 39: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc4c004a0  ! 40: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
	.word 0x879023d0  ! 41: WRPR_TT_I	wrpr	%r0, 0x03d0, %tt
splash_lsu_14:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 42: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc4800b60  ! 43: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r2
	.word 0xc4c004a0  ! 44: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
	.word 0x93902003  ! 45: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc45fe001  ! 46: LDX_I	ldx	[%r31 + 0x0001], %r2
	.word 0xc41fc000  ! 47: LDD_R	ldd	[%r31 + %r0], %r2
	.word 0x93902000  ! 48: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d802004  ! 49: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87902138  ! 50: WRPR_TT_I	wrpr	%r0, 0x0138, %tt
	.word 0x93480000  ! 51: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x93902001  ! 52: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200d  ! 54: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d902397  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x0397, %pstate
	.word 0xd28008a0  ! 56: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x93d020b5  ! 57: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xd207c000  ! 58: LDUW_R	lduw	[%r31 + %r0], %r9
	.word 0x9f802001  ! 59: SIR	sir	0x0001
	.word 0xd2c804a0  ! 60: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0xd2c00e80  ! 61: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r9
	.word 0x93902001  ! 62: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_15:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 63: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa1902008  ! 64: WRPR_GL_I	wrpr	%r0, 0x0008, %-
tagged_16:
	tsubcctv %r10, 0x167c, %r9
	.word 0xd207e001  ! 65: LDUW_I	lduw	[%r31 + 0x0001], %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 66: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8d802000  ! 67: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3e700001  ! 68: BPVC	<illegal instruction>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 69: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790206a  ! 70: WRPR_TT_I	wrpr	%r0, 0x006a, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xd2c7e030  ! 72: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
	.word 0x93902001  ! 73: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902006  ! 74: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81460000  ! 75: RD_STICK_REG	stbar
	.word 0x8d902922  ! 76: WRPR_PSTATE_I	wrpr	%r0, 0x0922, %pstate
	.word 0x91d020b2  ! 77: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd21fe001  ! 78: LDD_I	ldd	[%r31 + 0x0001], %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 79: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd28fe010  ! 80: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
	.word 0x9f802001  ! 81: SIR	sir	0x0001
	.word 0xd2c80e80  ! 82: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r9
	.word 0x8780201c  ! 83: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd2d80e40  ! 84: LDXA_R	ldxa	[%r0, %r0] 0x72, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd25fc000  ! 85: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2d7e000  ! 86: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r9
	.word 0xd247c000  ! 87: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xaf50c000  ! 88: RDPR_TT	rdpr	%tt, %r23
DS_17:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe3148007  ! 1: LDQF_R	-	[%r18, %r7], %f17
	.word 0x85a0082a  ! 89: FADDs	fadds	%f0, %f10, %f2
DS_18:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 90: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_lsu_19:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 91: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026b6  ! 92: WRPR_PSTATE_I	wrpr	%r0, 0x06b6, %pstate
tagged_20:
	tsubcctv %r5, 0x132a, %r14
	.word 0xc407e001  ! 93: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xa1902000  ! 94: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x84d1a001  ! 95: UMULcc_I	umulcc 	%r6, 0x0001, %r2
	.word 0x8d902b41  ! 96: WRPR_PSTATE_I	wrpr	%r0, 0x0b41, %pstate
	.word 0xad504000  ! 97: RDPR_TNPC	rdpr	%tnpc, %r22
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 98: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 99: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_tba_21:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 100: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9024d9  ! 101: WRPR_PSTATE_I	wrpr	%r0, 0x04d9, %pstate
splash_tba_22:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 102: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_23:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 103: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 104: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982456  ! 105: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0456, %hpstate
	.word 0xb5500000  ! 106: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8790236d  ! 107: WRPR_TT_I	wrpr	%r0, 0x036d, %tt
DS_24:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xc557c3b3	! Random illegal ?
	.word 0x89a00541  ! 1: FSQRTd	fsqrt	
	.word 0x9ba34832  ! 108: FADDs	fadds	%f13, %f18, %f13
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8981000a  ! 109: WRTICK_R	wr	%r4, %r10, %tick
	.word 0x93902004  ! 110: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb16de001  ! 111: SDIVX_I	sdivx	%r23, 0x0001, %r24
	.word 0x87802004  ! 112: WRASI_I	wr	%r0, 0x0004, %asi
DS_27:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe9356001  ! 1: STQF_I	-	%f20, [0x0001, %r21]
	normalw
	.word 0x8b458000  ! 113: RD_SOFTINT_REG	rd	%softint, %r5
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xca5fc000  ! 114: LDX_R	ldx	[%r31 + %r0], %r5
DS_28:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xd349736c	! Random illegal ?
	.word 0x91a00551  ! 1: FSQRTd	fsqrt	
	.word 0x83a0c822  ! 115: FADDs	fadds	%f3, %f2, %f1
	.word 0x93902006  ! 116: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902005  ! 117: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_29:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 118: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 119: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa190200f  ! 120: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_30:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 121: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc25fc000  ! 122: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x8d90255e  ! 123: WRPR_PSTATE_I	wrpr	%r0, 0x055e, %pstate
	.word 0x91d02032  ! 124: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc28008a0  ! 125: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc2d004a0  ! 126: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x8780204f  ! 127: WRASI_I	wr	%r0, 0x004f, %asi
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 128: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_31:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 129: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 130: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 131: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc207c000  ! 132: LDUW_R	lduw	[%r31 + %r0], %r1
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc25fc000  ! 133: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xa190200b  ! 134: WRPR_GL_I	wrpr	%r0, 0x000b, %-
tagged_32:
	tsubcctv %r20, 0x17fb, %r15
	.word 0xc207e001  ! 135: LDUW_I	lduw	[%r31 + 0x0001], %r1
splash_htba_33:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 136: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902008  ! 137: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x3c800001  ! 138: BPOS	bpos,a	<label_0x1>
tagged_34:
	tsubcctv %r18, 0x1d1b, %r3
	.word 0xc207e001  ! 139: LDUW_I	lduw	[%r31 + 0x0001], %r1
splash_lsu_35:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 140: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_36:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 141: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc25fe001  ! 143: LDX_I	ldx	[%r31 + 0x0001], %r1
splash_lsu_37:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 144: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 145: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xc28008a0  ! 146: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x85514000  ! 147: RDPR_TBA	rdpr	%tba, %r2
	.word 0x8d802004  ! 148: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_38:
	tsubcctv %r16, 0x1ad9, %r16
	.word 0xc407e001  ! 149: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x87802004  ! 150: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc4dfe000  ! 151: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r2
	.word 0x2c700001  ! 152: BPNEG	<illegal instruction>
	.word 0x22700001  ! 153: BPE	<illegal instruction>
	.word 0xa9680017  ! 154: SDIVX_R	sdivx	%r0, %r23, %r20
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 155: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe857e001  ! 156: LDSH_I	ldsh	[%r31 + 0x0001], %r20
	.word 0xe857e001  ! 157: LDSH_I	ldsh	[%r31 + 0x0001], %r20
	.word 0xe8d7e000  ! 158: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r20
DS_39:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 159: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 160: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe8d7e010  ! 161: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r20
	.word 0x93902002  ! 162: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 163: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879023f7  ! 164: WRPR_TT_I	wrpr	%r0, 0x03f7, %tt
	.word 0x91d020b3  ! 165: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x36800001  ! 166: BGE	bge,a	<label_0x1>
	.word 0xe89fc020  ! 167: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x38800001  ! 168: BGU	bgu,a	<label_0x1>
splash_tba_40:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 169: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_41:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f6, %f14, %f16
	.word 0x91b24310  ! 170: ALIGNADDRESS	alignaddr	%r9, %r16, %r8
	.word 0xd0d804a0  ! 171: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
tagged_42:
	tsubcctv %r6, 0x1c02, %r5
	.word 0xd007e001  ! 172: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x32700001  ! 173: BPNE	<illegal instruction>
	.word 0xd05fe001  ! 174: LDX_I	ldx	[%r31 + 0x0001], %r8
	.word 0x8d902ee5  ! 175: WRPR_PSTATE_I	wrpr	%r0, 0x0ee5, %pstate
	.word 0xd0800a80  ! 176: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r8
splash_lsu_43:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 177: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd017c000  ! 178: LDUH_R	lduh	[%r31 + %r0], %r8
DS_44:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 179: SAVE_R	save	%r31, %r0, %r31
	.word 0xd047c000  ! 180: LDSW_R	ldsw	[%r31 + %r0], %r8
tagged_45:
	taddcctv %r16, 0x1685, %r5
	.word 0xd007e001  ! 181: LDUW_I	lduw	[%r31 + 0x0001], %r8
tagged_46:
	tsubcctv %r22, 0x1812, %r2
	.word 0xd007e001  ! 182: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xa1902009  ! 183: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8780204f  ! 184: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x26800001  ! 185: BL	bl,a	<label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 186: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 187: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd0c004a0  ! 188: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0xd00fe001  ! 189: LDUB_I	ldub	[%r31 + 0x0001], %r8
tagged_47:
	taddcctv %r14, 0x125c, %r19
	.word 0xd007e001  ! 190: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xa190200f  ! 191: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa1902003  ! 192: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 193: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa1902009  ! 194: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_lsu_48:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 195: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902875  ! 196: WRPR_PSTATE_I	wrpr	%r0, 0x0875, %pstate
	.word 0xd01fe001  ! 197: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x876d2001  ! 198: SDIVX_I	sdivx	%r20, 0x0001, %r3
	ta	T_CHANGE_PRIV	! macro
splash_lsu_50:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 200: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8b51c000  ! 201: RDPR_TL	rdpr	%tl, %r5
DS_51:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 202: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xa1902009  ! 203: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xca4fc000  ! 204: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0xca8008a0  ! 205: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
splash_tba_52:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 206: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 207: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9145c000  ! 208: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x93902000  ! 209: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879023b9  ! 210: WRPR_TT_I	wrpr	%r0, 0x03b9, %tt
	.word 0x87802004  ! 211: WRASI_I	wr	%r0, 0x0004, %asi
tagged_53:
	taddcctv %r10, 0x175f, %r20
	.word 0xd007e001  ! 212: LDUW_I	lduw	[%r31 + 0x0001], %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 213: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x87902198  ! 214: WRPR_TT_I	wrpr	%r0, 0x0198, %tt
	.word 0xb550c000  ! 215: RDPR_TT	rdpr	%tt, %r26
	.word 0xf527c010  ! 216: STF_R	st	%f26, [%r16, %r31]
tagged_54:
	tsubcctv %r1, 0x1efa, %r22
	.word 0xf407e001  ! 217: LDUW_I	lduw	[%r31 + 0x0001], %r26
tagged_55:
	taddcctv %r14, 0x10b5, %r20
	.word 0xf407e001  ! 218: LDUW_I	lduw	[%r31 + 0x0001], %r26
	.word 0xf517c000  ! 219: LDQF_R	-	[%r31, %r0], %f26
	.word 0x8d902346  ! 220: WRPR_PSTATE_I	wrpr	%r0, 0x0346, %pstate
tagged_56:
	tsubcctv %r18, 0x1571, %r23
	.word 0xf407e001  ! 221: LDUW_I	lduw	[%r31 + 0x0001], %r26
	.word 0x91d020b4  ! 222: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xf40fc000  ! 223: LDUB_R	ldub	[%r31 + %r0], %r26
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf45fc000  ! 224: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0x28700001  ! 225: BPLEU	<illegal instruction>
splash_cmpr_57:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1866001  ! 226: WR_STICK_REG_I	wr	%r25, 0x0001, %-
	.word 0xf527e001  ! 227: STF_I	st	%f26, [0x0001, %r31]
	.word 0x93902000  ! 228: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902002  ! 229: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
tagged_58:
	tsubcctv %r22, 0x1bbf, %r6
	.word 0xf407e001  ! 230: LDUW_I	lduw	[%r31 + 0x0001], %r26
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf45fc000  ! 231: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0xf4cfe000  ! 232: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r26
DS_59:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe5134014  ! 1: LDQF_R	-	[%r13, %r20], %f18
	.word 0x97a18833  ! 233: FADDs	fadds	%f6, %f19, %f11
	.word 0xd6d00e80  ! 234: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r11
	.word 0x87802014  ! 235: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93d02032  ! 236: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d902a5b  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0a5b, %pstate
	.word 0xd6d00e40  ! 238: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r11
	.word 0x91d02032  ! 239: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x99500000  ! 240: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x879023af  ! 241: WRPR_TT_I	wrpr	%r0, 0x03af, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802063  ! 243: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8d9025da  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x05da, %pstate
	.word 0xd89fe001  ! 245: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
tagged_60:
	tsubcctv %r5, 0x1169, %r2
	.word 0xd807e001  ! 246: LDUW_I	lduw	[%r31 + 0x0001], %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 247: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd817c000  ! 248: LDUH_R	lduh	[%r31 + %r0], %r12
	.word 0xd8d804a0  ! 249: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0xd8c7e000  ! 250: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r12
	.word 0x93d02032  ! 251: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd88008a0  ! 252: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 253: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd88008a0  ! 254: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
splash_lsu_61:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 255: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_62:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 256: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xd917c000  ! 257: LDQF_R	-	[%r31, %r0], %f12
	.word 0xa190200f  ! 258: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_63:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 259: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9020fb  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x00fb, %pstate
	.word 0x879022cb  ! 261: WRPR_TT_I	wrpr	%r0, 0x02cb, %tt
	.word 0xa1902003  ! 262: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_lsu_64:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 263: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd847c000  ! 264: LDSW_R	ldsw	[%r31 + %r0], %r12
DS_65:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe736c00c  ! 1: STQF_R	-	%f19, [%r12, %r27]
	normalw
	.word 0x9b458000  ! 265: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8d902d6b  ! 266: WRPR_PSTATE_I	wrpr	%r0, 0x0d6b, %pstate
	.word 0xda8008a0  ! 267: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xdb97e001  ! 268: LDQFA_I	-	[%r31, 0x0001], %f13
	.word 0xdac7e010  ! 269: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0x879022c2  ! 270: WRPR_TT_I	wrpr	%r0, 0x02c2, %tt
	.word 0x93902003  ! 271: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91540000  ! 272: RDPR_GL	rdpr	%-, %r8
	.word 0x8d902e9a  ! 273: WRPR_PSTATE_I	wrpr	%r0, 0x0e9a, %pstate
	.word 0x93500000  ! 274: RDPR_TPC	rdpr	%tpc, %r9
	.word 0xd2d804a0  ! 275: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0xa1902003  ! 276: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x2a700001  ! 277: BPCS	<illegal instruction>
	.word 0xd28008a0  ! 278: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x95508000  ! 279: RDPR_TSTATE	rdpr	%tstate, %r10
splash_tba_66:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 280: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd41fe001  ! 281: LDD_I	ldd	[%r31 + 0x0001], %r10
	.word 0x8790225d  ! 282: WRPR_TT_I	wrpr	%r0, 0x025d, %tt
	.word 0x8d9022d8  ! 283: WRPR_PSTATE_I	wrpr	%r0, 0x02d8, %pstate
	.word 0x9f802001  ! 284: SIR	sir	0x0001
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 285: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_67:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 286: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 287: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x97504000  ! 288: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0xd6cfe020  ! 289: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r11
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 290: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd647c000  ! 291: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0x91d02032  ! 292: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd65fe001  ! 293: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xa1902006  ! 294: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd68008a0  ! 295: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 296: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_68:
	tsubcctv %r8, 0x1fa6, %r21
	.word 0xd607e001  ! 297: LDUW_I	lduw	[%r31 + 0x0001], %r11
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 298: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd68008a0  ! 299: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd797e001  ! 300: LDQFA_I	-	[%r31, 0x0001], %f11
tagged_69:
	taddcctv %r22, 0x18a9, %r10
	.word 0xd607e001  ! 301: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x83a58dd6  ! 302: FdMULq	fdmulq	
	.word 0xa190200e  ! 303: WRPR_GL_I	wrpr	%r0, 0x000e, %-
tagged_70:
	tsubcctv %r25, 0x13e7, %r9
	.word 0xc207e001  ! 304: LDUW_I	lduw	[%r31 + 0x0001], %r1
splash_lsu_71:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 305: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 306: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902001  ! 307: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982b0d  ! 308: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0d, %hpstate
	.word 0x91d02034  ! 309: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xc2ffc036  ! 310: SWAPA_R	swapa	%r1, [%r31 + %r22] 0x01
DS_72:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 311: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 312: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 314: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_73:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 315: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_74:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 316: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_75:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe3324000  ! 1: STQF_R	-	%f17, [%r0, %r9]
	normalw
	.word 0x89458000  ! 317: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x879023b1  ! 318: WRPR_TT_I	wrpr	%r0, 0x03b1, %tt
	.word 0x8d504000  ! 319: RDPR_TNPC	rdpr	%tnpc, %r6
tagged_76:
	tsubcctv %r12, 0x1f43, %r2
	.word 0xcc07e001  ! 320: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc800ae0  ! 321: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r6
splash_htba_77:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 322: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 323: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 324: WRASI_I	wr	%r0, 0x0089, %asi
splash_tba_78:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 325: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 326: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc97e010  ! 327: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r6
	.word 0x87902166  ! 328: WRPR_TT_I	wrpr	%r0, 0x0166, %tt
	.word 0x20700001  ! 329: BPN	<illegal instruction>
	.word 0xcc1fe001  ! 330: LDD_I	ldd	[%r31 + 0x0001], %r6
splash_tba_79:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 331: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_80:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 332: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 333: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8790207a  ! 334: WRPR_TT_I	wrpr	%r0, 0x007a, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc4fc000  ! 336: LDSB_R	ldsb	[%r31 + %r0], %r6
	.word 0x91d02032  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x83d020b4  ! 338: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x8d90208d  ! 339: WRPR_PSTATE_I	wrpr	%r0, 0x008d, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xcc5fc000  ! 340: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcd17c000  ! 341: LDQF_R	-	[%r31, %r0], %f6
	.word 0x8d902e2c  ! 342: WRPR_PSTATE_I	wrpr	%r0, 0x0e2c, %pstate
change_to_randtl_81:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 343: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
splash_lsu_82:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 344: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879022ca  ! 345: WRPR_TT_I	wrpr	%r0, 0x02ca, %tt
	.word 0x26800001  ! 346: BL	bl,a	<label_0x1>
	.word 0xccd804a0  ! 347: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0x91d02035  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 349: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_83:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 350: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8cd1000d  ! 351: UMULcc_R	umulcc 	%r4, %r13, %r6
splash_htba_84:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 352: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_85:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 353: SAVE_R	save	%r31, %r0, %r31
tagged_86:
	tsubcctv %r23, 0x19a1, %r14
	.word 0xcc07e001  ! 354: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x93902007  ! 355: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9f802001  ! 356: SIR	sir	0x0001
DS_87:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 357: SAVE_R	save	%r31, %r0, %r31
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 358: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x81460000  ! 359: RD_STICK_REG	stbar
	.word 0xcd37c00d  ! 360: STQF_R	-	%f6, [%r13, %r31]
DS_88:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f26, %f0
	.word 0x95b20310  ! 361: ALIGNADDRESS	alignaddr	%r8, %r16, %r10
	.word 0xb5500000  ! 362: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x99902002  ! 363: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x91d020b5  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 181
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 365: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81460000  ! 366: RD_STICK_REG	stbar
tagged_89:
	taddcctv %r22, 0x13d1, %r15
	.word 0xf407e001  ! 367: LDUW_I	lduw	[%r31 + 0x0001], %r26
DS_90:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xe7cf570c	! Random illegal ?
	.word 0xd7150009  ! 1: LDQF_R	-	[%r20, %r9], %f11
	.word 0x8ba6c834  ! 368: FADDs	fadds	%f27, %f20, %f5
	.word 0x8780204f  ! 369: WRASI_I	wr	%r0, 0x004f, %asi
DS_91:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa1a00557  ! 1: FSQRTd	fsqrt	
	.word 0x85a1082d  ! 370: FADDs	fadds	%f4, %f13, %f2
DS_92:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 371: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
splash_tba_93:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 372: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc4dfe030  ! 373: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r2
	.word 0x87802089  ! 374: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x93902004  ! 375: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa190200b  ! 376: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_tba_94:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 377: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_95:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 378: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x34700001  ! 379: BPG	<illegal instruction>
	.word 0x8d90229c  ! 380: WRPR_PSTATE_I	wrpr	%r0, 0x029c, %pstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 381: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc417c000  ! 382: LDUH_R	lduh	[%r31 + %r0], %r2
DS_96:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd5348003  ! 1: STQF_R	-	%f10, [%r3, %r18]
	normalw
	.word 0x8d458000  ! 383: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcd3fe001  ! 384: STDF_I	std	%f6, [0x0001, %r31]
DS_97:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x87a00540  ! 1: FSQRTd	fsqrt	
	.word 0x93a5082d  ! 385: FADDs	fadds	%f20, %f13, %f9
	.word 0x91d02034  ! 386: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902001  ! 387: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802004  ! 388: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa190200a  ! 389: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x30700001  ! 390: BPA	<illegal instruction>
	.word 0x8790217d  ! 391: WRPR_TT_I	wrpr	%r0, 0x017d, %tt
splash_lsu_98:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 392: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd327e001  ! 393: STF_I	st	%f9, [0x0001, %r31]
	.word 0xd2dfe010  ! 394: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r9
	.word 0xd317c000  ! 395: LDQF_R	-	[%r31, %r0], %f9
	.word 0xa190200f  ! 396: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_99:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 397: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 398: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02035  ! 399: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd20fe001  ! 400: LDUB_I	ldub	[%r31 + 0x0001], %r9
	.word 0x8790234f  ! 401: WRPR_TT_I	wrpr	%r0, 0x034f, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 402: LDX_R	ldx	[%r31 + %r0], %r9
DS_100:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 403: RESTORE_R	restore	%r31, %r0, %r31
DS_101:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 404: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb186c005  ! 405: WR_STICK_REG_R	wr	%r27, %r5, %-
	.word 0x93902000  ! 406: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd2d00e80  ! 407: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r9
	.word 0x8d902aa9  ! 408: WRPR_PSTATE_I	wrpr	%r0, 0x0aa9, %pstate
	.word 0x93514000  ! 409: RDPR_TBA	rdpr	%tba, %r9
	.word 0xa1902007  ! 410: WRPR_GL_I	wrpr	%r0, 0x0007, %-
tagged_103:
	taddcctv %r13, 0x1f13, %r12
	.word 0xd207e001  ! 411: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x93902005  ! 412: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x20800001  ! 413: BN	bn,a	<label_0x1>
	.word 0x87802089  ! 414: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd297e000  ! 415: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	.word 0x8790224e  ! 416: WRPR_TT_I	wrpr	%r0, 0x024e, %tt
	.word 0xd2800b40  ! 417: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r9
	.word 0xd28804a0  ! 418: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0x87802016  ! 419: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_104:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 420: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_105:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 421: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 422: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_106:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 423: SAVE_R	save	%r31, %r0, %r31
	.word 0x34800001  ! 424: BG	bg,a	<label_0x1>
splash_tba_107:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 425: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd2dfe020  ! 426: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r9
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 427: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_108:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 428: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_109:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xb5a0055b  ! 1: FSQRTd	fsqrt	
	.word 0x85a4c823  ! 429: FADDs	fadds	%f19, %f3, %f2
	.word 0x93902006  ! 430: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902002  ! 431: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_110:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 432: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc41fc000  ! 433: LDD_R	ldd	[%r31 + %r0], %r2
	.word 0xa190200d  ! 434: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xc4c004a0  ! 435: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
tagged_111:
	taddcctv %r2, 0x1d3a, %r12
	.word 0xc407e001  ! 436: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x93902001  ! 437: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa9514000  ! 438: RDPR_TBA	rdpr	%tba, %r20
	.word 0xe88008a0  ! 439: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x81982a4d  ! 440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4d, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 441: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8d90200d  ! 442: WRPR_PSTATE_I	wrpr	%r0, 0x000d, %pstate
splash_tba_112:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 443: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe85fc000  ! 444: LDX_R	ldx	[%r31 + %r0], %r20
splash_tba_113:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 445: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_114:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 446: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802089  ! 447: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xe88008a0  ! 448: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
tagged_115:
	taddcctv %r26, 0x1b49, %r23
	.word 0xe807e001  ! 449: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xe88008a0  ! 450: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
DS_116:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 451: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d020b2  ! 452: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x36800001  ! 453: BGE	bge,a	<label_0x1>
tagged_117:
	taddcctv %r10, 0x1ac7, %r9
	.word 0xe807e001  ! 454: LDUW_I	lduw	[%r31 + 0x0001], %r20
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 455: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 456: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x879021d9  ! 457: WRPR_TT_I	wrpr	%r0, 0x01d9, %tt
DS_118:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 458: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xe8c7e020  ! 459: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r20
DS_119:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x97a00543  ! 1: FSQRTd	fsqrt	
	.word 0x9ba34828  ! 460: FADDs	fadds	%f13, %f8, %f13
	.word 0xda07c000  ! 461: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0x81460000  ! 462: RD_STICK_REG	stbar
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 463: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xda8fe010  ! 464: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
	.word 0xda8008a0  ! 465: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda800c60  ! 466: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r13
DS_120:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 467: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
splash_tba_121:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 468: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xad45c000  ! 469: RD_TICK_CMPR_REG	rd	%-, %r22
	.word 0x93902001  ! 470: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xec57c000  ! 471: LDSH_R	ldsh	[%r31 + %r0], %r22
	.word 0x879023bf  ! 472: WRPR_TT_I	wrpr	%r0, 0x03bf, %tt
	.word 0xecdfe010  ! 473: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r22
	.word 0xec57c000  ! 474: LDSH_R	ldsh	[%r31 + %r0], %r22
	ta	T_CHANGE_PRIV	! macro
	.word 0xec97e000  ! 476: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r22
	.word 0xec5fe001  ! 477: LDX_I	ldx	[%r31 + 0x0001], %r22
	.word 0xec9004a0  ! 478: LDUHA_R	lduha	[%r0, %r0] 0x25, %r22
	.word 0x87902162  ! 479: WRPR_TT_I	wrpr	%r0, 0x0162, %tt
	.word 0x87802089  ! 480: WRASI_I	wr	%r0, 0x0089, %asi
splash_cmpr_122:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1806001  ! 481: WR_STICK_REG_I	wr	%r1, 0x0001, %-
splash_tba_123:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 482: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 483: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xecc7e030  ! 484: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r22
	.word 0xecbfc028  ! 485: STDA_R	stda	%r22, [%r31 + %r8] 0x01
	.word 0xec8008a0  ! 486: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x8d902339  ! 487: WRPR_PSTATE_I	wrpr	%r0, 0x0339, %pstate
	.word 0x80f80008  ! 488: SDIVcc_R	sdivcc 	%r0, %r8, %r0
	.word 0xb1b30ff4  ! 489: FONES	e	%f24
	.word 0xf137c014  ! 490: STQF_R	-	%f24, [%r20, %r31]
DS_125:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f0, %f12, %f8
	.word 0xa3b64306  ! 491: ALIGNADDRESS	alignaddr	%r25, %r6, %r17
	.word 0x819821df  ! 492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01df, %hpstate
tagged_126:
	tsubcctv %r24, 0x11e6, %r2
	.word 0xe207e001  ! 493: LDUW_I	lduw	[%r31 + 0x0001], %r17
splash_lsu_127:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_128:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186a001  ! 495: WR_STICK_REG_I	wr	%r26, 0x0001, %-
splash_tba_129:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 496: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe247e001  ! 497: LDSW_I	ldsw	[%r31 + 0x0001], %r17
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe25fc000  ! 498: LDX_R	ldx	[%r31 + %r0], %r17
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 499: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xb4ab0007  ! 500: ANDNcc_R	andncc 	%r12, %r7, %r26
	.word 0xf48fe010  ! 501: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r26
	.word 0xa1902007  ! 502: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	ta	T_CHANGE_HPRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf45fc000  ! 504: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0xf417e001  ! 505: LDUH_I	lduh	[%r31 + 0x0001], %r26
splash_tba_130:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 506: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_131:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 507: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d9027b0  ! 508: WRPR_PSTATE_I	wrpr	%r0, 0x07b0, %pstate
	.word 0xf48008a0  ! 509: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0xa190200b  ! 510: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x87802089  ! 511: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xf49004a0  ! 512: LDUHA_R	lduha	[%r0, %r0] 0x25, %r26
splash_tba_132:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 513: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81460000  ! 514: RD_STICK_REG	stbar
	.word 0x34800001  ! 515: BG	bg,a	<label_0x1>
	.word 0x8d90276c  ! 516: WRPR_PSTATE_I	wrpr	%r0, 0x076c, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf45fc000  ! 517: LDX_R	ldx	[%r31 + %r0], %r26
DS_133:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 518: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf45fc000  ! 519: LDX_R	ldx	[%r31 + %r0], %r26
splash_lsu_134:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 520: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b45c000  ! 521: RD_TICK_CMPR_REG	rd	%-, %r13
tagged_135:
	taddcctv %r22, 0x1b92, %r26
	.word 0xda07e001  ! 522: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdad804a0  ! 523: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0xda9fe001  ! 524: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xdb37e001  ! 525: STQF_I	-	%f13, [0x0001, %r31]
splash_tba_136:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 526: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_137:
	taddcctv %r10, 0x1d44, %r24
	.word 0xda07e001  ! 527: LDUW_I	lduw	[%r31 + 0x0001], %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0xdad7e010  ! 529: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	.word 0x89500000  ! 530: RDPR_TPC	rdpr	%tpc, %r4
	.word 0xc80fe001  ! 531: LDUB_I	ldub	[%r31 + 0x0001], %r4
	.word 0x3c800001  ! 532: BPOS	bpos,a	<label_0x1>
	.word 0x38800001  ! 533: BGU	bgu,a	<label_0x1>
	.word 0xc847c000  ! 534: LDSW_R	ldsw	[%r31 + %r0], %r4
	.word 0xc837c007  ! 535: STH_R	sth	%r4, [%r31 + %r7]
	.word 0xc8cfe010  ! 536: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 537: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x87802058  ! 538: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87902321  ! 539: WRPR_TT_I	wrpr	%r0, 0x0321, %tt
	.word 0x9f802001  ! 540: SIR	sir	0x0001
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90263a  ! 542: WRPR_PSTATE_I	wrpr	%r0, 0x063a, %pstate
	.word 0xa190200d  ! 543: WRPR_GL_I	wrpr	%r0, 0x000d, %-
DS_138:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xf5c4a216	! Random illegal ?
	.word 0x85a0054b  ! 1: FSQRTd	fsqrt	
	.word 0xb5a20839  ! 544: FADDs	fadds	%f8, %f25, %f26
tagged_139:
	taddcctv %r8, 0x1f5d, %r12
	.word 0xf407e001  ! 545: LDUW_I	lduw	[%r31 + 0x0001], %r26
	.word 0x91d02032  ! 546: Tcc_I	ta	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	.word 0xf45fe001  ! 548: LDX_I	ldx	[%r31 + 0x0001], %r26
splash_lsu_140:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 549: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf447e001  ! 550: LDSW_I	ldsw	[%r31 + 0x0001], %r26
	.word 0xf40fe001  ! 551: LDUB_I	ldub	[%r31 + 0x0001], %r26
splash_lsu_141:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 552: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 553: BN	bn,a	<label_0x1>
	.word 0x93902006  ! 554: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_htba_142:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 555: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902008  ! 556: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x87802010  ! 557: WRASI_I	wr	%r0, 0x0010, %asi
splash_htba_143:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 558: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_144:
	tsubcctv %r16, 0x1ba6, %r7
	.word 0xf407e001  ! 559: LDUW_I	lduw	[%r31 + 0x0001], %r26
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 560: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x819825cc  ! 561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cc, %hpstate
	.word 0x93d02032  ! 562: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x91d020b2  ! 563: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x93902004  ! 564: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf45fc000  ! 565: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0x87902291  ! 566: WRPR_TT_I	wrpr	%r0, 0x0291, %tt
	.word 0x87802080  ! 567: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93902006  ! 568: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xf49fc020  ! 569: LDDA_R	ldda	[%r31, %r0] 0x01, %r26
	.word 0xf4800c80  ! 570: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r26
	.word 0xf48008a0  ! 571: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0xf4dfe010  ! 572: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r26
	.word 0xf417c000  ! 573: LDUH_R	lduh	[%r31 + %r0], %r26
	.word 0xf41fe001  ! 574: LDD_I	ldd	[%r31 + 0x0001], %r26
	.word 0x91d020b4  ! 575: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa4fc2001  ! 576: SDIVcc_I	sdivcc 	%r16, 0x0001, %r18
	.word 0xe4c7e000  ! 577: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
tagged_145:
	taddcctv %r18, 0x1f63, %r13
	.word 0xe407e001  ! 578: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x3a700001  ! 579: BPCC	<illegal instruction>
change_to_randtl_146:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 580: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87a01a78  ! 581: FqTOi	fqtoi	
	.word 0xa190200a  ! 582: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_lsu_147:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 583: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc68008a0  ! 584: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x91d020b3  ! 585: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xc6800b40  ! 586: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r3
	.word 0xc68008a0  ! 587: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8750c000  ! 588: RDPR_TT	rdpr	%tt, %r3
	.word 0xc657e001  ! 589: LDSH_I	ldsh	[%r31 + 0x0001], %r3
	.word 0xc68008a0  ! 590: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc65fc000  ! 591: LDX_R	ldx	[%r31 + %r0], %r3
DS_148:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe134c013  ! 1: STQF_R	-	%f16, [%r19, %r19]
	normalw
	.word 0x8d458000  ! 592: RD_SOFTINT_REG	rd	%softint, %r6
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 593: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xa1902005  ! 594: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x91d02032  ! 595: Tcc_I	ta	icc_or_xcc, %r0 + 50
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xcc5fc000  ! 596: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x8780201c  ! 597: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x87802004  ! 598: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xccd7e020  ! 599: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r6
	.word 0x9f802001  ! 600: SIR	sir	0x0001
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 601: LDX_R	ldx	[%r31 + %r0], %r6
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 602: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9022a7  ! 603: WRPR_PSTATE_I	wrpr	%r0, 0x02a7, %pstate
	.word 0x93902003  ! 604: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_htba_149:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 605: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_150:
	tsubcctv %r21, 0x1242, %r13
	.word 0xcc07e001  ! 606: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x8d802004  ! 607: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90286a  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x086a, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902006  ! 610: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xcc880e80  ! 611: LDUBA_R	lduba	[%r0, %r0] 0x74, %r6
splash_htba_151:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 612: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcc57e001  ! 613: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 614: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021bc  ! 615: WRPR_TT_I	wrpr	%r0, 0x01bc, %tt
	.word 0x87508000  ! 616: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x87802010  ! 617: WRASI_I	wr	%r0, 0x0010, %asi
tagged_152:
	tsubcctv %r21, 0x1720, %r23
	.word 0xc607e001  ! 618: LDUW_I	lduw	[%r31 + 0x0001], %r3
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 620: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902005  ! 622: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x93902006  ! 623: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_tba_153:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 624: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9024ed  ! 625: WRPR_PSTATE_I	wrpr	%r0, 0x04ed, %pstate
	.word 0x87802089  ! 626: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xc697e020  ! 627: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r3
	.word 0x99902000  ! 628: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x32800001  ! 629: BNE	bne,a	<label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1820006  ! 630: WR_STICK_REG_R	wr	%r8, %r6, %-
DS_155:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd3318005  ! 1: STQF_R	-	%f9, [%r5, %r6]
	normalw
	.word 0x97458000  ! 631: RD_SOFTINT_REG	rd	%softint, %r11
tagged_156:
	tsubcctv %r1, 0x180a, %r2
	.word 0xd607e001  ! 632: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x99902001  ! 633: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
DS_157:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x91a00551  ! 1: FSQRTd	fsqrt	
	.word 0x91a08823  ! 634: FADDs	fadds	%f2, %f3, %f8
splash_tba_158:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 635: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xab494000  ! 636: RDHPR_HTBA	rdhpr	%htba, %r21
splash_tba_159:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 637: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 638: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 639: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xea5fc000  ! 640: LDX_R	ldx	[%r31 + %r0], %r21
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 642: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_160:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 643: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 644: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87902218  ! 645: WRPR_TT_I	wrpr	%r0, 0x0218, %tt
	.word 0x93d020b5  ! 646: Tcc_I	tne	icc_or_xcc, %r0 + 181
	ta	T_CHANGE_HPRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 648: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0x87902304  ! 649: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
	.word 0x87902398  ! 650: WRPR_TT_I	wrpr	%r0, 0x0398, %tt
	.word 0xea8008a0  ! 651: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0xea5fe001  ! 652: LDX_I	ldx	[%r31 + 0x0001], %r21
	.word 0x87802020  ! 653: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x38700001  ! 654: BPGU	<illegal instruction>
	.word 0xeac804a0  ! 655: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r21
tagged_161:
	taddcctv %r13, 0x13dd, %r1
	.word 0xea07e001  ! 656: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0x8790230b  ! 657: WRPR_TT_I	wrpr	%r0, 0x030b, %tt
	.word 0x2e800001  ! 658: BVS	bvs,a	<label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 659: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 660: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902d1b  ! 661: WRPR_PSTATE_I	wrpr	%r0, 0x0d1b, %pstate
	.word 0x82c0e001  ! 662: ADDCcc_I	addccc 	%r3, 0x0001, %r1
	.word 0x99902002  ! 663: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x87802080  ! 664: WRASI_I	wr	%r0, 0x0080, %asi
DS_162:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 665: SAVE_R	save	%r31, %r0, %r31
splash_lsu_163:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 666: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc2d804a0  ! 667: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	.word 0x93902005  ! 668: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d02034  ! 669: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f802001  ! 670: SIR	sir	0x0001
DS_164:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd530c009  ! 1: STQF_R	-	%f10, [%r9, %r3]
	normalw
	.word 0xa3458000  ! 671: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xe217c000  ! 672: LDUH_R	lduh	[%r31 + %r0], %r17
	.word 0xe2800b80  ! 673: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r17
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 674: LDX_R	ldx	[%r31 + %r0], %r17
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 675: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xaf514000  ! 676: RDPR_TBA	rdpr	%tba, %r23
	.word 0x87802088  ! 677: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa1902005  ! 678: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d802000  ! 679: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x22700001  ! 680: BPE	<illegal instruction>
	.word 0xa190200a  ! 681: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xee1fe001  ! 682: LDD_I	ldd	[%r31 + 0x0001], %r23
	.word 0xee5fe001  ! 683: LDX_I	ldx	[%r31 + 0x0001], %r23
DS_165:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x8ba00540  ! 1: FSQRTd	fsqrt	
	.word 0x85a40822  ! 684: FADDs	fadds	%f16, %f2, %f2
	.word 0xa1902006  ! 685: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87802004  ! 686: WRASI_I	wr	%r0, 0x0004, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 687: LDX_R	ldx	[%r31 + %r0], %r2
tagged_166:
	tsubcctv %r14, 0x1ac6, %r8
	.word 0xc407e001  ! 688: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc4cfe010  ! 689: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r2
	.word 0x93902004  ! 690: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02035  ! 691: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902c2a  ! 692: WRPR_PSTATE_I	wrpr	%r0, 0x0c2a, %pstate
	.word 0x38800001  ! 693: BGU	bgu,a	<label_0x1>
	.word 0xa1902004  ! 694: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xc41fe001  ! 695: LDD_I	ldd	[%r31 + 0x0001], %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 696: LDX_R	ldx	[%r31 + %r0], %r2
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 697: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 698: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 699: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc4cfe000  ! 700: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r2
	.word 0xc49fe001  ! 701: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	.word 0xc48008a0  ! 702: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x99504000  ! 703: RDPR_TNPC	rdpr	%tnpc, %r12
	.word 0xd8c804a0  ! 704: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x91d02033  ! 705: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 706: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 707: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802016  ! 708: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa190200e  ! 709: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_lsu_167:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 710: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24700001  ! 711: BPLE	<illegal instruction>
	.word 0x8d802000  ! 712: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802058  ! 713: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x91d020b2  ! 714: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa190200d  ! 715: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d802000  ! 716: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd89004a0  ! 717: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0x87540000  ! 718: RDPR_GL	rdpr	%-, %r3
splash_tba_168:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 719: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89840001  ! 720: WRTICK_R	wr	%r16, %r1, %tick
	.word 0xc797e001  ! 721: LDQFA_I	-	[%r31, 0x0001], %f3
	.word 0x8d902fba  ! 722: WRPR_PSTATE_I	wrpr	%r0, 0x0fba, %pstate
	.word 0x93902001  ! 723: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc697e030  ! 724: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r3
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 725: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 726: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982894  ! 727: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0894, %hpstate
	.word 0x91d02033  ! 728: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_lsu_170:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 729: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc68008a0  ! 730: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc6d80e80  ! 731: LDXA_R	ldxa	[%r0, %r0] 0x74, %r3
	.word 0x91d02032  ! 732: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802063  ! 733: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xc737c001  ! 734: STQF_R	-	%f3, [%r1, %r31]
change_to_randtl_171:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 735: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xc717c000  ! 736: LDQF_R	-	[%r31, %r0], %f3
	.word 0xa1902004  ! 737: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x879023d0  ! 738: WRPR_TT_I	wrpr	%r0, 0x03d0, %tt
	.word 0xc6c004a0  ! 739: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0xc6c804a0  ! 740: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x8d9021e4  ! 741: WRPR_PSTATE_I	wrpr	%r0, 0x01e4, %pstate
	.word 0xa1902007  ! 742: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_cmpr_172:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 743: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0x99902000  ! 744: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8780204f  ! 745: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xc6800a80  ! 746: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r3
	.word 0x87802088  ! 747: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x879020c8  ! 748: WRPR_TT_I	wrpr	%r0, 0x00c8, %tt
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 749: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9b508000  ! 750: RDPR_TSTATE	rdpr	%tstate, %r13
splash_tba_173:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 751: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902110  ! 752: WRPR_TT_I	wrpr	%r0, 0x0110, %tt
	.word 0x91d02033  ! 753: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02033  ! 754: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xda0fc000  ! 755: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0xdad804a0  ! 756: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 757: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_174:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 758: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 759: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87902319  ! 760: WRPR_TT_I	wrpr	%r0, 0x0319, %tt
	.word 0x93902000  ! 761: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x97504000  ! 762: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0x87802089  ! 763: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd61fe001  ! 764: LDD_I	ldd	[%r31 + 0x0001], %r11
	.word 0xaf51c000  ! 765: RDPR_TL	rdpr	%tl, %r23
splash_lsu_175:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 766: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_176:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 767: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xee9fe001  ! 768: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r23
	.word 0x87802055  ! 769: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xee4fe001  ! 770: LDSB_I	ldsb	[%r31 + 0x0001], %r23
splash_tba_177:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 771: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
	.word 0x38800001  ! 773: BGU	bgu,a	<label_0x1>
splash_cmpr_178:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1816001  ! 774: WR_STICK_REG_I	wr	%r5, 0x0001, %-
tagged_179:
	taddcctv %r15, 0x1c75, %r24
	.word 0xee07e001  ! 775: LDUW_I	lduw	[%r31 + 0x0001], %r23
	.word 0xee800b00  ! 776: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r23
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d020b3  ! 778: Tcc_I	tne	icc_or_xcc, %r0 + 179
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xee5fc000  ! 779: LDX_R	ldx	[%r31 + %r0], %r23
splash_cmpr_180:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1822001  ! 780: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	.word 0xee0fc000  ! 781: LDUB_R	ldub	[%r31 + %r0], %r23
	.word 0x99902001  ! 782: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xee4fc000  ! 783: LDSB_R	ldsb	[%r31 + %r0], %r23
	.word 0x97508000  ! 784: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0x93902005  ! 785: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d802004  ! 786: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x24800001  ! 787: BLE	ble,a	<label_0x1>
	.word 0xd69fe001  ! 788: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 790: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x879023e7  ! 791: WRPR_TT_I	wrpr	%r0, 0x03e7, %tt
	.word 0xd727e001  ! 792: STF_I	st	%f11, [0x0001, %r31]
	.word 0x9f802001  ! 793: SIR	sir	0x0001
	.word 0xd6c00e40  ! 794: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r11
	.word 0xd647e001  ! 795: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0xd69004a0  ! 796: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 797: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x87802004  ! 798: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd6d80e80  ! 799: LDXA_R	ldxa	[%r0, %r0] 0x74, %r11
DS_181:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe731e001  ! 1: STQF_I	-	%f19, [0x0001, %r7]
	normalw
	.word 0x89458000  ! 800: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x87902134  ! 801: WRPR_TT_I	wrpr	%r0, 0x0134, %tt
	.word 0xc897e010  ! 802: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r4
	.word 0x9551c000  ! 803: RDPR_TL	rdpr	%tl, %r10
	.word 0xd457c000  ! 804: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0xd4cfe010  ! 805: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r10
	.word 0xa190200c  ! 806: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 807: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd48008a0  ! 808: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x87802010  ! 809: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87802088  ! 810: WRASI_I	wr	%r0, 0x0088, %asi
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 811: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9020c8  ! 812: WRPR_PSTATE_I	wrpr	%r0, 0x00c8, %pstate
	.word 0xd4d80e60  ! 813: LDXA_R	ldxa	[%r0, %r0] 0x73, %r10
splash_cmpr_182:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186e001  ! 814: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0x8d902450  ! 815: WRPR_PSTATE_I	wrpr	%r0, 0x0450, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 816: LDX_R	ldx	[%r31 + %r0], %r10
tagged_183:
	taddcctv %r26, 0x1682, %r24
	.word 0xd407e001  ! 817: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4d004a0  ! 818: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0xa1902001  ! 819: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x95480000  ! 820: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x8b500000  ! 821: RDPR_TPC	rdpr	%tpc, %r5
splash_lsu_184:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 822: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902bff  ! 823: WRPR_PSTATE_I	wrpr	%r0, 0x0bff, %pstate
	.word 0xca57e001  ! 824: LDSH_I	ldsh	[%r31 + 0x0001], %r5
	.word 0x81480000  ! 825: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0xa1902003  ! 826: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902006  ! 827: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_tba_185:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 828: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902006  ! 829: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_186:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 830: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 831: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91508000  ! 832: RDPR_TSTATE	rdpr	%tstate, %r8
splash_tba_187:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 833: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd05fc000  ! 834: LDX_R	ldx	[%r31 + %r0], %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 835: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8d902034  ! 836: WRPR_PSTATE_I	wrpr	%r0, 0x0034, %pstate
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 837: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 838: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902002  ! 839: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_188:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 840: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_189:
	taddcctv %r3, 0x19d9, %r25
	.word 0xd007e001  ! 841: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x93902000  ! 842: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xb7480000  ! 843: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0xa1902001  ! 844: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_lsu_190:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 845: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_191:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 846: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x92c66001  ! 847: ADDCcc_I	addccc 	%r25, 0x0001, %r9
	.word 0xd2cfe020  ! 848: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
	.word 0x9f802001  ! 849: SIR	sir	0x0001
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 850: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 851: WRPR_GL_I	wrpr	%r0, 0x000c, %-
DS_192:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 852: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x20700001  ! 853: BPN	<illegal instruction>
	.word 0x93902000  ! 854: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x26700001  ! 855: BPL	<illegal instruction>
	.word 0xd29004a0  ! 856: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0x83504000  ! 857: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x8d902f75  ! 858: WRPR_PSTATE_I	wrpr	%r0, 0x0f75, %pstate
	.word 0xa1902001  ! 859: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xc29fe001  ! 860: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x3e700001  ! 861: BPVC	<illegal instruction>
	.word 0xa190200e  ! 862: WRPR_GL_I	wrpr	%r0, 0x000e, %-
DS_193:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f6, %f12, %f26
	.word 0x91b44318  ! 863: ALIGNADDRESS	alignaddr	%r17, %r24, %r8
	.word 0x99508000  ! 864: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x8d9028cf  ! 865: WRPR_PSTATE_I	wrpr	%r0, 0x08cf, %pstate
	.word 0xa1902000  ! 866: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91500000  ! 867: RDPR_TPC	rdpr	%tpc, %r8
	.word 0xd047e001  ! 868: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	.word 0x8d9027c3  ! 869: WRPR_PSTATE_I	wrpr	%r0, 0x07c3, %pstate
	.word 0x87802020  ! 870: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xd0cfe030  ! 871: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r8
splash_cmpr_194:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180e001  ! 872: WR_STICK_REG_I	wr	%r3, 0x0001, %-
change_to_randtl_195:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 873: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x87514000  ! 874: RDPR_TBA	rdpr	%tba, %r3
splash_tba_196:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 875: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 876: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc68008a0  ! 877: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc65fc000  ! 878: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x93902007  ! 879: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_tba_197:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 880: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc60fe001  ! 881: LDUB_I	ldub	[%r31 + 0x0001], %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 882: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc677e001  ! 883: STX_I	stx	%r3, [%r31 + 0x0001]
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 884: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 885: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_198:
	tsubcctv %r12, 0x1e2e, %r17
	.word 0xc607e001  ! 886: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc69fc020  ! 887: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0x36700001  ! 888: BPGE	<illegal instruction>
	.word 0x83504000  ! 889: RDPR_TNPC	rdpr	%tnpc, %r1
splash_lsu_199:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 890: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_200:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0x83783cf0	! Random illegal ?
	.word 0xf313400a  ! 1: LDQF_R	-	[%r13, %r10], %f25
	.word 0xa1a30830  ! 891: FADDs	fadds	%f12, %f16, %f16
	.word 0x91d02033  ! 892: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902ab1  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x0ab1, %pstate
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 894: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902320  ! 895: WRPR_TT_I	wrpr	%r0, 0x0320, %tt
splash_lsu_201:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 896: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe05fc000  ! 897: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x9f802001  ! 898: SIR	sir	0x0001
splash_tba_202:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 899: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa7508000  ! 900: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x81982d1f  ! 901: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1f, %hpstate
	.word 0x879023bb  ! 902: WRPR_TT_I	wrpr	%r0, 0x03bb, %tt
	.word 0x91d02033  ! 903: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 904: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe6dfe030  ! 905: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r19
DS_203:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 906: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
tagged_204:
	tsubcctv %r17, 0x13a2, %r10
	.word 0xe607e001  ! 907: LDUW_I	lduw	[%r31 + 0x0001], %r19
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 908: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe67fe001  ! 909: SWAP_I	swap	%r19, [%r31 + 0x0001]
	.word 0x93902001  ! 910: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe68008a0  ! 911: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
splash_tba_205:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 912: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802080  ! 913: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa1902008  ! 914: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_lsu_206:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 915: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_207:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 916: SAVE_R	save	%r31, %r0, %r31
splash_lsu_208:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 917: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe607c000  ! 918: LDUW_R	lduw	[%r31 + %r0], %r19
splash_lsu_209:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 919: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe6d7e030  ! 920: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 921: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802063  ! 922: WRASI_I	wr	%r0, 0x0063, %asi
DS_210:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 923: SAVE_R	save	%r31, %r0, %r31
	.word 0x8b702001  ! 924: POPC_I	popc	0x0001, %r5
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 925: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xcac00e40  ! 926: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r5
splash_tba_211:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 927: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_212:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 928: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xca17c000  ! 929: LDUH_R	lduh	[%r31 + %r0], %r5
splash_tba_213:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 930: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902000  ! 931: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902008  ! 932: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xca1fe001  ! 933: LDD_I	ldd	[%r31 + 0x0001], %r5
	.word 0xca1fe001  ! 934: LDD_I	ldd	[%r31 + 0x0001], %r5
splash_lsu_214:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 935: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 936: WRPR_GL_I	wrpr	%r0, 0x0001, %-
change_to_randtl_215:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 937: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
splash_tba_216:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 938: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_217:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 939: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xca1fe001  ! 940: LDD_I	ldd	[%r31 + 0x0001], %r5
	.word 0xca8008a0  ! 941: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x87802014  ! 942: WRASI_I	wr	%r0, 0x0014, %asi
splash_tba_218:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 943: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_219:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc5310005  ! 1: STQF_R	-	%f2, [%r5, %r4]
	normalw
	.word 0x87458000  ! 944: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x9f802001  ! 945: SIR	sir	0x0001
splash_tba_220:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 946: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_htba_221:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 947: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_222:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 948: SAVE_R	save	%r31, %r0, %r31
	.word 0x93902001  ! 949: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d9027c4  ! 950: WRPR_PSTATE_I	wrpr	%r0, 0x07c4, %pstate
	.word 0xc6d80e80  ! 951: LDXA_R	ldxa	[%r0, %r0] 0x74, %r3
splash_lsu_223:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 952: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_224:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 953: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879021fa  ! 954: WRPR_TT_I	wrpr	%r0, 0x01fa, %tt
splash_cmpr_225:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181e001  ! 955: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0xc6dfe020  ! 956: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r3
	.word 0xb1494000  ! 957: RDHPR_HTBA	rdhpr	%htba, %r24
	.word 0x8d9027c3  ! 958: WRPR_PSTATE_I	wrpr	%r0, 0x07c3, %pstate
	.word 0xf0c004a0  ! 959: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r24
	.word 0xa190200f  ! 960: WRPR_GL_I	wrpr	%r0, 0x000f, %-
tagged_226:
	tsubcctv %r23, 0x10ce, %r26
	.word 0xf007e001  ! 961: LDUW_I	lduw	[%r31 + 0x0001], %r24
DS_227:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcb148008  ! 1: LDQF_R	-	[%r18, %r8], %f5
	.word 0x8fa6c836  ! 962: FADDs	fadds	%f27, %f22, %f7
	.word 0x93902007  ! 963: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
tagged_228:
	tsubcctv %r3, 0x1512, %r15
	.word 0xce07e001  ! 964: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xce8008a0  ! 965: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8b464000  ! 966: RD_STICK_CMPR_REG	rd	%-, %r5
	.word 0x81982445  ! 967: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0445, %hpstate
splash_tba_229:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 968: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_PRIV	! macro
DS_230:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc130e001  ! 1: STQF_I	-	%f0, [0x0001, %r3]
	normalw
	.word 0x99458000  ! 970: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x87802058  ! 971: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8982c007  ! 972: WRTICK_R	wr	%r11, %r7, %tick
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902d9b  ! 974: WRPR_PSTATE_I	wrpr	%r0, 0x0d9b, %pstate
tagged_232:
	tsubcctv %r1, 0x1799, %r7
	.word 0xd807e001  ! 975: LDUW_I	lduw	[%r31 + 0x0001], %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd85fc000  ! 976: LDX_R	ldx	[%r31 + %r0], %r12
DS_233:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 977: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9f802001  ! 978: SIR	sir	0x0001
	.word 0x83d02033  ! 979: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x93902000  ! 980: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd897e030  ! 981: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
splash_lsu_234:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 982: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 983: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd85fc000  ! 984: LDX_R	ldx	[%r31 + %r0], %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd88008a0  ! 986: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x8d902113  ! 987: WRPR_PSTATE_I	wrpr	%r0, 0x0113, %pstate
splash_lsu_235:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 988: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f04  ! 989: WRPR_PSTATE_I	wrpr	%r0, 0x0f04, %pstate
	.word 0xd8c804a0  ! 990: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd85fc000  ! 991: LDX_R	ldx	[%r31 + %r0], %r12
tagged_236:
	tsubcctv %r6, 0x1064, %r4
	.word 0xd807e001  ! 992: LDUW_I	lduw	[%r31 + 0x0001], %r12
splash_lsu_237:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 993: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8c004a0  ! 994: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0xa1902002  ! 995: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd8800c40  ! 996: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r12
	.word 0xd897e000  ! 997: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
	.word 0xaba6c9c5  ! 998: FDIVd	fdivd	%f58, %f36, %f52
tagged_238:
	tsubcctv %r13, 0x1931, %r13
	.word 0xea07e001  ! 999: LDUW_I	lduw	[%r31 + 0x0001], %r21
tagged_239:
	taddcctv %r20, 0x1f54, %r2
	.word 0xea07e001  ! 1000: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0x83d02035  ! 1001: Tcc_I	te	icc_or_xcc, %r0 + 53
DS_240:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1002: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xead804a0  ! 1003: LDXA_R	ldxa	[%r0, %r0] 0x25, %r21
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 1004: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0x30800001  ! 1005: BA	ba,a	<label_0x1>
DS_241:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1006: RESTORE_R	restore	%r31, %r0, %r31
DS_242:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe9310017  ! 1: STQF_R	-	%f20, [%r23, %r4]
	normalw
	.word 0x95458000  ! 1007: RD_SOFTINT_REG	rd	%softint, %r10
tagged_243:
	taddcctv %r26, 0x1cea, %r1
	.word 0xd407e001  ! 1008: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x87802055  ! 1009: WRASI_I	wr	%r0, 0x0055, %asi
splash_lsu_244:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1010: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982e8e  ! 1011: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8e, %hpstate
tagged_245:
	taddcctv %r1, 0x1084, %r20
	.word 0xd407e001  ! 1012: LDUW_I	lduw	[%r31 + 0x0001], %r10
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1013: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x93d02034  ! 1014: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x879023f5  ! 1015: WRPR_TT_I	wrpr	%r0, 0x03f5, %tt
	.word 0x22700001  ! 1016: BPE	<illegal instruction>
	.word 0xd44fe001  ! 1017: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0xd41fc000  ! 1018: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xd4c80e40  ! 1019: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r10
	.word 0x8d902d7c  ! 1020: WRPR_PSTATE_I	wrpr	%r0, 0x0d7c, %pstate
splash_cmpr_246:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1832001  ! 1021: WR_STICK_REG_I	wr	%r12, 0x0001, %-
splash_tba_247:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1022: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4d004a0  ! 1023: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0x87802055  ! 1024: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x93902002  ! 1025: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd48008a0  ! 1026: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d9029e6  ! 1027: WRPR_PSTATE_I	wrpr	%r0, 0x09e6, %pstate
DS_248:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1028: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02033  ! 1029: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd4d004a0  ! 1030: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0x8d90260b  ! 1031: WRPR_PSTATE_I	wrpr	%r0, 0x060b, %pstate
	.word 0x91a01a61  ! 1032: FqTOi	fqtoi	
	.word 0xd0d004a0  ! 1033: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
splash_cmpr_249:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1812001  ! 1034: WR_STICK_REG_I	wr	%r4, 0x0001, %-
splash_lsu_250:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1035: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 1036: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x91d020b4  ! 1037: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a01962  ! 1038: FqTOd	dis not found

	.word 0x87802088  ! 1039: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x9f802001  ! 1040: SIR	sir	0x0001
	.word 0xe04fe001  ! 1041: LDSB_I	ldsb	[%r31 + 0x0001], %r16
	.word 0xe09fe001  ! 1042: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
DS_252:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1043: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xa1902009  ! 1044: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x28700001  ! 1045: BPLEU	<illegal instruction>
	.word 0xe0800a60  ! 1046: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r16
	.word 0x87802010  ! 1047: WRASI_I	wr	%r0, 0x0010, %asi
DS_253:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f18, %f8
	.word 0x85b10303  ! 1048: ALIGNADDRESS	alignaddr	%r4, %r3, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 1049: LDX_R	ldx	[%r31 + %r0], %r2
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1050: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200d  ! 1051: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa1902000  ! 1052: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xc4c7e010  ! 1053: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0x3a800001  ! 1054: BCC	bcc,a	<label_0x1>
	.word 0xc4c00e40  ! 1055: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r2
splash_tba_254:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1056: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1057: LDX_R	ldx	[%r31 + %r0], %r2
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 1058: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1059: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902266  ! 1060: WRPR_TT_I	wrpr	%r0, 0x0266, %tt
	.word 0x93d020b2  ! 1061: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xc44fe001  ! 1062: LDSB_I	ldsb	[%r31 + 0x0001], %r2
	.word 0x8d9029fc  ! 1063: WRPR_PSTATE_I	wrpr	%r0, 0x09fc, %pstate
	.word 0x93902002  ! 1064: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x36700001  ! 1065: BPGE	<illegal instruction>
splash_tba_255:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1066: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc4bfe001  ! 1067: STDA_I	stda	%r2, [%r31 + 0x0001] %asi
change_to_randtl_256:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1068: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x879020a2  ! 1069: WRPR_TT_I	wrpr	%r0, 0x00a2, %tt
	.word 0x87802089  ! 1070: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xc48008a0  ! 1071: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc4dfe020  ! 1072: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r2
splash_cmpr_257:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1836001  ! 1073: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0xc48fe020  ! 1074: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 1075: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x93902007  ! 1076: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_tba_258:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1077: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc4c7e010  ! 1078: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0xc4c7e010  ! 1079: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0xc49fe001  ! 1080: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
splash_lsu_259:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1081: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 1082: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xc48008a0  ! 1083: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x34700001  ! 1084: BPG	<illegal instruction>
change_to_randtl_260:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1085: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d902ffc  ! 1086: WRPR_PSTATE_I	wrpr	%r0, 0x0ffc, %pstate
	.word 0xc48008a0  ! 1087: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
change_to_randtl_261:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1088: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xc48008a0  ! 1089: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc4cfe030  ! 1090: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r2
splash_lsu_262:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1091: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0xc49fe001  ! 1093: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	.word 0x34800001  ! 1094: BG	bg,a	<label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 1095: LDX_R	ldx	[%r31 + %r0], %r2
splash_lsu_263:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1096: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 1097: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x99902003  ! 1098: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x93902006  ! 1099: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x879023cc  ! 1100: WRPR_TT_I	wrpr	%r0, 0x03cc, %tt
	.word 0xc48008a0  ! 1101: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc44fe001  ! 1102: LDSB_I	ldsb	[%r31 + 0x0001], %r2
	.word 0x8d902984  ! 1103: WRPR_PSTATE_I	wrpr	%r0, 0x0984, %pstate
	.word 0x93902000  ! 1104: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc4c004a0  ! 1105: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
	.word 0xb5494000  ! 1106: RDHPR_HTBA	rdhpr	%htba, %r26
	.word 0x38700001  ! 1107: BPGU	<illegal instruction>
	.word 0x34700001  ! 1108: BPG	<illegal instruction>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf45fc000  ! 1109: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0xf40fc000  ! 1110: LDUB_R	ldub	[%r31 + %r0], %r26
	.word 0xf4dfe020  ! 1111: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r26
DS_264:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x8fb54307  ! 1112: ALIGNADDRESS	alignaddr	%r21, %r7, %r7
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_265:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1114: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce17e001  ! 1115: LDUH_I	lduh	[%r31 + 0x0001], %r7
	.word 0x87802058  ! 1116: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87902275  ! 1117: WRPR_TT_I	wrpr	%r0, 0x0275, %tt
	.word 0x8d902e34  ! 1118: WRPR_PSTATE_I	wrpr	%r0, 0x0e34, %pstate
	.word 0xce9fc020  ! 1119: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
DS_266:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1120: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
tagged_267:
	taddcctv %r20, 0x1006, %r26
	.word 0xce07e001  ! 1121: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x3e800001  ! 1122: BVC	bvc,a	<label_0x1>
	.word 0x8d90209e  ! 1123: WRPR_PSTATE_I	wrpr	%r0, 0x009e, %pstate
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1124: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902356  ! 1125: WRPR_PSTATE_I	wrpr	%r0, 0x0356, %pstate
	.word 0xced80e60  ! 1126: LDXA_R	ldxa	[%r0, %r0] 0x73, %r7
	.word 0xce4fc000  ! 1127: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0xa7500000  ! 1128: RDPR_TPC	rdpr	%tpc, %r19
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 1129: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 1130: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe68008a0  ! 1131: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x30700001  ! 1132: BPA	<illegal instruction>
	.word 0x8951c000  ! 1133: RDPR_TL	rdpr	%tl, %r4
tagged_268:
	tsubcctv %r18, 0x1b49, %r14
	.word 0xc807e001  ! 1134: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x8d902774  ! 1135: WRPR_PSTATE_I	wrpr	%r0, 0x0774, %pstate
	.word 0x8790226c  ! 1136: WRPR_TT_I	wrpr	%r0, 0x026c, %tt
DS_269:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f8, %f28, %f26
	.word 0x95b40308  ! 1137: ALIGNADDRESS	alignaddr	%r16, %r8, %r10
splash_lsu_270:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1138: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 1139: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd4d804a0  ! 1140: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
DS_271:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1141: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_272:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xef364008  ! 1: STQF_R	-	%f23, [%r8, %r25]
	normalw
	.word 0x83458000  ! 1142: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xc29fc020  ! 1143: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1144: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x20700001  ! 1145: BPN	<illegal instruction>
	.word 0x8790232d  ! 1146: WRPR_TT_I	wrpr	%r0, 0x032d, %tt
	.word 0x8d500000  ! 1147: RDPR_TPC	rdpr	%tpc, %r6
DS_273:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd734a001  ! 1: STQF_I	-	%f11, [0x0001, %r18]
	normalw
	.word 0x99458000  ! 1148: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd8c804a0  ! 1149: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xa1902007  ! 1150: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8780201c  ! 1151: WRASI_I	wr	%r0, 0x001c, %asi
tagged_274:
	tsubcctv %r12, 0x1ea2, %r22
	.word 0xd807e001  ! 1152: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd88fe010  ! 1153: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd85fc000  ! 1154: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd93fe001  ! 1155: STDF_I	std	%f12, [0x0001, %r31]
splash_lsu_275:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1156: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_276:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1157: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_277:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f30, %f14, %f4
	.word 0x97b4830c  ! 1158: ALIGNADDRESS	alignaddr	%r18, %r12, %r11
	.word 0xd697e000  ! 1159: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
splash_cmpr_278:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186e001  ! 1160: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0xd68008a0  ! 1161: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x36800001  ! 1162: BGE	bge,a	<label_0x1>
	.word 0xd6800a80  ! 1163: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r11
	.word 0x99902001  ! 1164: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xd68804a0  ! 1165: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0x8d9028b7  ! 1166: WRPR_PSTATE_I	wrpr	%r0, 0x08b7, %pstate
	.word 0x8780201c  ! 1167: WRASI_I	wr	%r0, 0x001c, %asi
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8982c001  ! 1169: WRTICK_R	wr	%r11, %r1, %tick
	.word 0x93902002  ! 1170: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd657c000  ! 1171: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0x9f802001  ! 1172: SIR	sir	0x0001
	.word 0xa1902006  ! 1173: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x83d02033  ! 1174: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xd6d7e000  ! 1175: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
	.word 0x87802088  ! 1176: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa5500000  ! 1177: RDPR_TPC	rdpr	%tpc, %r18
	.word 0x8d90265d  ! 1178: WRPR_PSTATE_I	wrpr	%r0, 0x065d, %pstate
tagged_280:
	tsubcctv %r10, 0x1913, %r23
	.word 0xe407e001  ! 1179: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x91d020b2  ! 1180: Tcc_I	ta	icc_or_xcc, %r0 + 178
tagged_281:
	taddcctv %r19, 0x1292, %r7
	.word 0xe407e001  ! 1181: LDUW_I	lduw	[%r31 + 0x0001], %r18
DS_282:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xe7d9ac1c	! Random illegal ?
	.word 0x91a00540  ! 1: FSQRTd	fsqrt	
	.word 0x83a20832  ! 1182: FADDs	fadds	%f8, %f18, %f1
	.word 0x28800001  ! 1183: BLEU	bleu,a	<label_0x1>
	.word 0x87802055  ! 1184: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x94c22001  ! 1185: ADDCcc_I	addccc 	%r8, 0x0001, %r10
	.word 0xa190200e  ! 1186: WRPR_GL_I	wrpr	%r0, 0x000e, %-
tagged_283:
	taddcctv %r1, 0x1795, %r5
	.word 0xd407e001  ! 1187: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x93902000  ! 1188: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x99902003  ! 1189: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xd40fc000  ! 1190: LDUB_R	ldub	[%r31 + %r0], %r10
	.word 0x8d802000  ! 1191: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902002  ! 1192: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd447e001  ! 1193: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	.word 0xd48fe030  ! 1194: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
tagged_284:
	tsubcctv %r8, 0x1859, %r5
	.word 0xd407e001  ! 1195: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x87902329  ! 1196: WRPR_TT_I	wrpr	%r0, 0x0329, %tt
	.word 0x87802055  ! 1197: WRASI_I	wr	%r0, 0x0055, %asi
splash_tba_285:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1198: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd49004a0  ! 1199: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	.word 0xa1902005  ! 1200: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x2e700001  ! 1201: BPVS	<illegal instruction>
	.word 0xd45fe001  ! 1202: LDX_I	ldx	[%r31 + 0x0001], %r10
splash_htba_286:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1203: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_287:
	taddcctv %r21, 0x1fb7, %r24
	.word 0xd407e001  ! 1204: LDUW_I	lduw	[%r31 + 0x0001], %r10
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1205: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd48804a0  ! 1206: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
change_to_randtl_288:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1207: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xd40fc000  ! 1208: LDUB_R	ldub	[%r31 + %r0], %r10
	.word 0xd40fc000  ! 1209: LDUB_R	ldub	[%r31 + %r0], %r10
	.word 0xd49fe001  ! 1210: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
DS_289:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc530a001  ! 1: STQF_I	-	%f2, [0x0001, %r2]
	normalw
	.word 0xb7458000  ! 1211: RD_SOFTINT_REG	rd	%softint, %r27
	.word 0x91d02033  ! 1212: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02032  ! 1213: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xf68fe020  ! 1214: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r27
	.word 0xf6dfe000  ! 1215: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r27
	.word 0xf61fc000  ! 1216: LDD_R	ldd	[%r31 + %r0], %r27
	.word 0x8d9021bb  ! 1217: WRPR_PSTATE_I	wrpr	%r0, 0x01bb, %pstate
DS_290:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xa95508c4	! Random illegal ?
	.word 0xaba0054d  ! 1: FSQRTd	fsqrt	
	.word 0x85a08824  ! 1218: FADDs	fadds	%f2, %f4, %f2
splash_htba_291:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1219: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x2c700001  ! 1220: BPNEG	<illegal instruction>
DS_292:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1221: SAVE_R	save	%r31, %r0, %r31
	.word 0xc4800c60  ! 1222: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r2
splash_tba_293:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1223: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802004  ! 1224: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902e1b  ! 1225: WRPR_PSTATE_I	wrpr	%r0, 0x0e1b, %pstate
	.word 0x93902007  ! 1226: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902fa7  ! 1227: WRPR_PSTATE_I	wrpr	%r0, 0x0fa7, %pstate
	.word 0x879022e6  ! 1228: WRPR_TT_I	wrpr	%r0, 0x02e6, %tt
tagged_294:
	tsubcctv %r5, 0x13be, %r6
	.word 0xc407e001  ! 1229: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc4d7e030  ! 1230: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r2
	.word 0x8f504000  ! 1231: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0xb751c000  ! 1232: RDPR_TL	rdpr	%tl, %r27
	.word 0xf68008a0  ! 1233: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
	.word 0x8198225e  ! 1234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025e, %hpstate
	.word 0xf6c7e000  ! 1235: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r27
	.word 0x93902003  ! 1236: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xf6880e80  ! 1237: LDUBA_R	lduba	[%r0, %r0] 0x74, %r27
	.word 0xf6cfe010  ! 1238: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r27
	.word 0x8d902d8b  ! 1239: WRPR_PSTATE_I	wrpr	%r0, 0x0d8b, %pstate
	.word 0xa190200b  ! 1240: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d902b33  ! 1241: WRPR_PSTATE_I	wrpr	%r0, 0x0b33, %pstate
DS_295:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1242: RESTORE_R	restore	%r31, %r0, %r31
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf65fc000  ! 1243: LDX_R	ldx	[%r31 + %r0], %r27
	.word 0x81982f56  ! 1244: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f56, %hpstate
	.word 0xf677c004  ! 1245: STX_R	stx	%r27, [%r31 + %r4]
	.word 0xf60fc000  ! 1246: LDUB_R	ldub	[%r31 + %r0], %r27
	.word 0xf68804a0  ! 1247: LDUBA_R	lduba	[%r0, %r0] 0x25, %r27
	.word 0xf69004a0  ! 1248: LDUHA_R	lduha	[%r0, %r0] 0x25, %r27
	.word 0xa3464000  ! 1249: RD_STICK_CMPR_REG	rd	%-, %r17
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 1250: LDX_R	ldx	[%r31 + %r0], %r17
tagged_296:
	tsubcctv %r16, 0x1a1e, %r22
	.word 0xe207e001  ! 1251: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe2dfe030  ! 1252: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r17
	.word 0x87802020  ! 1253: WRASI_I	wr	%r0, 0x0020, %asi
tagged_297:
	taddcctv %r19, 0x1cb9, %r9
	.word 0xe207e001  ! 1254: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x93902000  ! 1255: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d9028c8  ! 1256: WRPR_PSTATE_I	wrpr	%r0, 0x08c8, %pstate
	.word 0x87802088  ! 1257: WRASI_I	wr	%r0, 0x0088, %asi
DS_298:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xc3e9b517	! Random illegal ?
	.word 0xcf120002  ! 1: LDQF_R	-	[%r8, %r2], %f7
	.word 0x8fa3482b  ! 1258: FADDs	fadds	%f13, %f11, %f7
	.word 0x9b50c000  ! 1259: RDPR_TT	rdpr	%tt, %r13
splash_tba_299:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1260: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1261: LDX_R	ldx	[%r31 + %r0], %r13
tagged_300:
	tsubcctv %r23, 0x1361, %r11
	.word 0xda07e001  ! 1262: LDUW_I	lduw	[%r31 + 0x0001], %r13
splash_lsu_301:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1263: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_302:
	tsubcctv %r6, 0x168b, %r10
	.word 0xda07e001  ! 1264: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdac00e80  ! 1265: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r13
splash_lsu_303:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1266: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1267: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdac804a0  ! 1268: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0xda47e001  ! 1269: LDSW_I	ldsw	[%r31 + 0x0001], %r13
	.word 0x93902002  ! 1270: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xda8fe030  ! 1271: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0xda07c000  ! 1272: LDUW_R	lduw	[%r31 + %r0], %r13
tagged_304:
	tsubcctv %r18, 0x1a72, %r13
	.word 0xda07e001  ! 1273: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda9fe001  ! 1274: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
tagged_305:
	taddcctv %r15, 0x183b, %r24
	.word 0xda07e001  ! 1275: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdac7e010  ! 1276: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0x87802014  ! 1277: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902a72  ! 1278: WRPR_PSTATE_I	wrpr	%r0, 0x0a72, %pstate
	ta	T_CHANGE_PRIV	! macro
splash_lsu_306:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1280: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_307:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1281: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902189  ! 1282: WRPR_TT_I	wrpr	%r0, 0x0189, %tt
	.word 0x879022bd  ! 1283: WRPR_TT_I	wrpr	%r0, 0x02bd, %tt
	.word 0xda97e020  ! 1284: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r13
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1285: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02034  ! 1286: Tcc_I	tne	icc_or_xcc, %r0 + 52
tagged_308:
	tsubcctv %r3, 0x1066, %r19
	.word 0xda07e001  ! 1287: LDUW_I	lduw	[%r31 + 0x0001], %r13
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1288: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x3e800001  ! 1289: BVC	bvc,a	<label_0x1>
	.word 0x8d902851  ! 1290: WRPR_PSTATE_I	wrpr	%r0, 0x0851, %pstate
	ta	T_CHANGE_HPRIV	! macro
splash_lsu_309:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1292: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1293: LDX_R	ldx	[%r31 + %r0], %r13
splash_lsu_310:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1294: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x83d02033  ! 1296: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x9f802001  ! 1297: SIR	sir	0x0001
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa56a2001  ! 1298: SDIVX_I	sdivx	%r8, 0x0001, %r18
	ta	T_CHANGE_HPRIV	! macro
DS_312:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xbf6b3cd3	! Random illegal ?
	.word 0x9ba0054a  ! 1: FSQRTd	fsqrt	
	.word 0xb3a18836  ! 1300: FADDs	fadds	%f6, %f22, %f25
	.word 0x91d020b5  ! 1301: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xf2cfe000  ! 1302: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r25
DS_313:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xf513401a  ! 1: LDQF_R	-	[%r13, %r26], %f26
	.word 0xa3a1c822  ! 1303: FADDs	fadds	%f7, %f2, %f17
	.word 0xe28008a0  ! 1304: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe2800ac0  ! 1305: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r17
	.word 0x8d9027c0  ! 1306: WRPR_PSTATE_I	wrpr	%r0, 0x07c0, %pstate
splash_tba_314:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1307: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_315:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b2430a  ! 1308: ALIGNADDRESS	alignaddr	%r9, %r10, %r9
	.word 0x99902000  ! 1309: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xd2cfe030  ! 1310: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 1311: LDX_R	ldx	[%r31 + %r0], %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd217e001  ! 1313: LDUH_I	lduh	[%r31 + 0x0001], %r9
splash_cmpr_316:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182a001  ! 1314: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0xd29fc020  ! 1315: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0x879023f8  ! 1316: WRPR_TT_I	wrpr	%r0, 0x03f8, %tt
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1317: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d9023cb  ! 1318: WRPR_PSTATE_I	wrpr	%r0, 0x03cb, %pstate
	.word 0x87902254  ! 1319: WRPR_TT_I	wrpr	%r0, 0x0254, %tt
	.word 0xd2dfe020  ! 1320: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r9
DS_317:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x89a00546  ! 1: FSQRTd	fsqrt	
	.word 0x89a2482d  ! 1321: FADDs	fadds	%f9, %f13, %f4
	.word 0x91d020b3  ! 1322: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x93902003  ! 1323: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_318:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1324: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_319:
	taddcctv %r6, 0x1941, %r18
	.word 0xc807e001  ! 1325: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x9b50c000  ! 1326: RDPR_TT	rdpr	%tt, %r13
	.word 0x87902313  ! 1327: WRPR_TT_I	wrpr	%r0, 0x0313, %tt
	.word 0xa1902004  ! 1328: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87802088  ! 1329: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa190200a  ! 1330: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1331: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790237a  ! 1332: WRPR_TT_I	wrpr	%r0, 0x037a, %tt
	.word 0x87902387  ! 1333: WRPR_TT_I	wrpr	%r0, 0x0387, %tt
	.word 0xda8008a0  ! 1334: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x93902000  ! 1335: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xdb17c000  ! 1336: LDQF_R	-	[%r31, %r0], %f13
	.word 0x89504000  ! 1337: RDPR_TNPC	rdpr	%tnpc, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902166  ! 1339: WRPR_PSTATE_I	wrpr	%r0, 0x0166, %pstate
splash_lsu_320:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1340: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc857e001  ! 1341: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 1342: LDX_R	ldx	[%r31 + %r0], %r4
tagged_321:
	taddcctv %r14, 0x16b7, %r21
	.word 0xc807e001  ! 1343: LDUW_I	lduw	[%r31 + 0x0001], %r4
tagged_322:
	tsubcctv %r12, 0x1d09, %r7
	.word 0xc807e001  ! 1344: LDUW_I	lduw	[%r31 + 0x0001], %r4
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 1345: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc88008a0  ! 1346: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
tagged_323:
	taddcctv %r25, 0x1d09, %r19
	.word 0xc807e001  ! 1347: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x8790236e  ! 1348: WRPR_TT_I	wrpr	%r0, 0x036e, %tt
	.word 0xa1902009  ! 1349: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_lsu_324:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1350: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc88008a0  ! 1351: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
tagged_325:
	taddcctv %r20, 0x1ded, %r26
	.word 0xc807e001  ! 1352: LDUW_I	lduw	[%r31 + 0x0001], %r4
DS_326:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xf534e001  ! 1: STQF_I	-	%f26, [0x0001, %r19]
	normalw
	.word 0x8f458000  ! 1353: RD_SOFTINT_REG	rd	%softint, %r7
DS_327:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x8fb10306  ! 1354: ALIGNADDRESS	alignaddr	%r4, %r6, %r7
	.word 0x8d802004  ! 1355: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_tba_328:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1356: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_329:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1856001  ! 1357: WR_STICK_REG_I	wr	%r21, 0x0001, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 1358: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x8d802000  ! 1359: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200a  ! 1360: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87902311  ! 1361: WRPR_TT_I	wrpr	%r0, 0x0311, %tt
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1362: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcec804a0  ! 1363: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0x8d802000  ! 1364: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xce17c000  ! 1365: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0x91d020b3  ! 1366: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x879021cd  ! 1367: WRPR_TT_I	wrpr	%r0, 0x01cd, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 1368: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x91d02035  ! 1369: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 1370: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x3a700001  ! 1371: BPCC	<illegal instruction>
	.word 0x8d902a79  ! 1372: WRPR_PSTATE_I	wrpr	%r0, 0x0a79, %pstate
	.word 0xce17c000  ! 1373: LDUH_R	lduh	[%r31 + %r0], %r7
splash_htba_330:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1374: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902003  ! 1375: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x99702001  ! 1376: POPC_I	popc	0x0001, %r12
tagged_331:
	taddcctv %r25, 0x1cb8, %r6
	.word 0xd807e001  ! 1377: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8ba0197b  ! 1378: FqTOd	dis not found

	.word 0xca8008a0  ! 1379: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1380: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x22800001  ! 1381: BE	be,a	<label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1382: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 1383: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_333:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1384: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902d3b  ! 1385: WRPR_PSTATE_I	wrpr	%r0, 0x0d3b, %pstate
	.word 0x8d514000  ! 1386: RDPR_TBA	rdpr	%tba, %r6
	.word 0x8d902a28  ! 1387: WRPR_PSTATE_I	wrpr	%r0, 0x0a28, %pstate
	.word 0x93902005  ! 1388: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x2c800001  ! 1389: BNEG	bneg,a	<label_0x1>
splash_htba_334:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1390: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_335:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe1314006  ! 1: STQF_R	-	%f16, [%r6, %r5]
	normalw
	.word 0x99458000  ! 1391: RD_SOFTINT_REG	rd	%softint, %r12
splash_tba_336:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1392: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd89fe001  ! 1393: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x8d802004  ! 1394: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_tba_337:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1395: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902462  ! 1396: WRPR_PSTATE_I	wrpr	%r0, 0x0462, %pstate
	.word 0xd8c004a0  ! 1397: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0x83d020b4  ! 1398: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x93902001  ! 1399: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1902003  ! 1400: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_338:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1846001  ! 1401: WR_STICK_REG_I	wr	%r17, 0x0001, %-
tagged_339:
	taddcctv %r15, 0x1aef, %r25
	.word 0xd807e001  ! 1402: LDUW_I	lduw	[%r31 + 0x0001], %r12
DS_340:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xb544e9d0	! Random illegal ?
	.word 0x8ba00543  ! 1: FSQRTd	fsqrt	
	.word 0xada24822  ! 1403: FADDs	fadds	%f9, %f2, %f22
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 1404: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 1405: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_tba_341:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1406: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_342:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1407: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_343:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1408: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xec8008a0  ! 1409: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
splash_cmpr_344:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1806001  ! 1410: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0x93902003  ! 1411: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa190200b  ! 1412: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x81982907  ! 1413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0907, %hpstate
	.word 0x87802014  ! 1414: WRASI_I	wr	%r0, 0x0014, %asi
tagged_345:
	taddcctv %r19, 0x18dd, %r5
	.word 0xec07e001  ! 1415: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x87802016  ! 1416: WRASI_I	wr	%r0, 0x0016, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xec5fc000  ! 1417: LDX_R	ldx	[%r31 + %r0], %r22
	.word 0x93902006  ! 1418: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8790213c  ! 1419: WRPR_TT_I	wrpr	%r0, 0x013c, %tt
	.word 0x91d02032  ! 1420: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d90257a  ! 1421: WRPR_PSTATE_I	wrpr	%r0, 0x057a, %pstate
	.word 0xec8008a0  ! 1422: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0xec8fe030  ! 1423: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r22
	.word 0x9150c000  ! 1424: RDPR_TT	rdpr	%tt, %r8
splash_cmpr_346:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1816001  ! 1425: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0xd017c000  ! 1426: LDUH_R	lduh	[%r31 + %r0], %r8
	.word 0x87902303  ! 1427: WRPR_TT_I	wrpr	%r0, 0x0303, %tt
splash_lsu_347:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1428: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd057c000  ! 1429: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0x3e700001  ! 1430: BPVC	<illegal instruction>
	.word 0x87802058  ! 1431: WRASI_I	wr	%r0, 0x0058, %asi
splash_tba_348:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1432: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902006  ! 1433: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_tba_349:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1434: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd09fc020  ! 1435: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
	.word 0xd04fe001  ! 1436: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0xd0d80e80  ! 1437: LDXA_R	ldxa	[%r0, %r0] 0x74, %r8
	.word 0x87902066  ! 1438: WRPR_TT_I	wrpr	%r0, 0x0066, %tt
	.word 0x9f802001  ! 1439: SIR	sir	0x0001
splash_tba_350:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1440: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_351:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1441: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
tagged_352:
	tsubcctv %r14, 0x1d43, %r16
	.word 0xd007e001  ! 1442: LDUW_I	lduw	[%r31 + 0x0001], %r8
	ta	T_CHANGE_HPRIV	! macro
splash_lsu_353:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1444: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902352  ! 1445: WRPR_TT_I	wrpr	%r0, 0x0352, %tt
	ta	T_CHANGE_HPRIV	! macro
tagged_354:
	tsubcctv %r24, 0x19cc, %r25
	.word 0xd007e001  ! 1447: LDUW_I	lduw	[%r31 + 0x0001], %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd05fc000  ! 1448: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0cfe000  ! 1449: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
	.word 0x93902002  ! 1450: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd13fc002  ! 1452: STDF_R	std	%f8, [%r2, %r31]
splash_tba_355:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1453: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xab464000  ! 1454: RD_STICK_CMPR_REG	rd	%-, %r21
	.word 0x87802004  ! 1455: WRASI_I	wr	%r0, 0x0004, %asi
DS_356:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1456: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8d902a49  ! 1457: WRPR_PSTATE_I	wrpr	%r0, 0x0a49, %pstate
splash_tba_357:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1458: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_358:
	tsubcctv %r20, 0x1e46, %r23
	.word 0xea07e001  ! 1459: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x836b6001  ! 1460: SDIVX_I	sdivx	%r13, 0x0001, %r1
	.word 0xc29004a0  ! 1461: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	.word 0x93902006  ! 1462: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02034  ! 1464: Tcc_I	ta	icc_or_xcc, %r0 + 52
tagged_360:
	tsubcctv %r23, 0x147f, %r5
	.word 0xc207e001  ! 1465: LDUW_I	lduw	[%r31 + 0x0001], %r1
DS_361:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f10, %f30, %f24
	.word 0x97b18310  ! 1466: ALIGNADDRESS	alignaddr	%r6, %r16, %r11
splash_tba_362:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1467: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_363:
	taddcctv %r8, 0x135f, %r26
	.word 0xd607e001  ! 1468: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x81982f86  ! 1469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f86, %hpstate
	.word 0x8d90263d  ! 1470: WRPR_PSTATE_I	wrpr	%r0, 0x063d, %pstate
DS_364:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1471: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd61fc000  ! 1472: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x9f802001  ! 1473: SIR	sir	0x0001
	.word 0xd68804a0  ! 1474: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xd6c7e020  ! 1475: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 1476: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x9951c000  ! 1477: RDPR_TL	rdpr	%tl, %r12
	.word 0x8d9028e3  ! 1478: WRPR_PSTATE_I	wrpr	%r0, 0x08e3, %pstate
	.word 0xd88008a0  ! 1479: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x8b500000  ! 1480: RDPR_TPC	rdpr	%tpc, %r5
DS_365:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f18, %f18
	.word 0x87b58306  ! 1481: ALIGNADDRESS	alignaddr	%r22, %r6, %r3
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87a01971  ! 1482: FqTOd	dis not found

	.word 0x36800001  ! 1483: BGE	bge,a	<label_0x1>
	.word 0xc6c004a0  ! 1484: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1485: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1486: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_367:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f0, %f14, %f18
	.word 0x91b6c314  ! 1487: ALIGNADDRESS	alignaddr	%r27, %r20, %r8
	.word 0xd0c80e60  ! 1488: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r8
	.word 0xd117c000  ! 1489: LDQF_R	-	[%r31, %r0], %f8
	.word 0xb5464000  ! 1490: RD_STICK_CMPR_REG	rd	%-, %r26
DS_368:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1491: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x93d02035  ! 1492: Tcc_I	tne	icc_or_xcc, %r0 + 53
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1493: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8780201c  ! 1494: WRASI_I	wr	%r0, 0x001c, %asi
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1495: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902004  ! 1496: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x2c700001  ! 1497: BPNEG	<illegal instruction>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1498: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf49fc020  ! 1499: LDDA_R	ldda	[%r31, %r0] 0x01, %r26
splash_lsu_369:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1500: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 1501: WRASI_I	wr	%r0, 0x0014, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf45fc000  ! 1502: LDX_R	ldx	[%r31 + %r0], %r26
DS_370:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb32a001  ! 1: STQF_I	-	%f13, [0x0001, %r10]
	normalw
	.word 0xad458000  ! 1503: RD_SOFTINT_REG	rd	%softint, %r22
	.word 0x93902002  ! 1504: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_371:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1505: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xecd004a0  ! 1506: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r22
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1507: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_372:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1508: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_373:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1509: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_374:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1510: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01965  ! 1511: FqTOd	dis not found

	.word 0x9f802001  ! 1512: SIR	sir	0x0001
	.word 0xda800a80  ! 1513: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r13
	.word 0x91d02033  ! 1514: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_tba_376:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1515: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xda8fe030  ! 1516: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0xa1902001  ! 1517: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_lsu_377:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1518: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 1519: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xdadfe030  ! 1520: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
change_to_randtl_378:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1521: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_379:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f8, %f2, %f24
	.word 0x97b30314  ! 1522: ALIGNADDRESS	alignaddr	%r12, %r20, %r11
	.word 0x93902001  ! 1523: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x20800001  ! 1524: BN	bn,a	<label_0x1>
	.word 0xd6c004a0  ! 1525: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
tagged_380:
	tsubcctv %r10, 0x1d27, %r22
	.word 0xd607e001  ! 1526: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd64fe001  ! 1527: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0xa1902004  ! 1528: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x26700001  ! 1529: BPL	<illegal instruction>
	.word 0x8198244d  ! 1530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044d, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 1531: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd68008a0  ! 1532: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd6800a60  ! 1533: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r11
	.word 0x93d020b5  ! 1534: Tcc_I	tne	icc_or_xcc, %r0 + 181
splash_htba_381:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1535: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd68008a0  ! 1536: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x83540000  ! 1537: RDPR_GL	rdpr	%-, %r1
	.word 0x9f802001  ! 1538: SIR	sir	0x0001
	.word 0xc257e001  ! 1539: LDSH_I	ldsh	[%r31 + 0x0001], %r1
	.word 0x87902125  ! 1540: WRPR_TT_I	wrpr	%r0, 0x0125, %tt
tagged_382:
	tsubcctv %r2, 0x194e, %r10
	.word 0xc207e001  ! 1541: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc2d804a0  ! 1542: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	ta	T_CHANGE_PRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 1544: LDX_R	ldx	[%r31 + %r0], %r1
splash_tba_383:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1545: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc257e001  ! 1546: LDSH_I	ldsh	[%r31 + 0x0001], %r1
tagged_384:
	tsubcctv %r3, 0x1603, %r20
	.word 0xc207e001  ! 1547: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xab508000  ! 1548: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xeadfe030  ! 1549: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r21
	ta	T_CHANGE_PRIV	! macro
splash_htba_385:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1551: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xb1514000  ! 1552: RDPR_TBA	rdpr	%tba, %r24
	.word 0xf0d004a0  ! 1553: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r24
	.word 0xf08008a0  ! 1554: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x8d902467  ! 1555: WRPR_PSTATE_I	wrpr	%r0, 0x0467, %pstate
	.word 0x87802088  ! 1556: WRASI_I	wr	%r0, 0x0088, %asi
change_to_randtl_386:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1557: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_387:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1558: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 1559: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf05fe001  ! 1560: LDX_I	ldx	[%r31 + 0x0001], %r24
splash_lsu_388:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1561: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2a700001  ! 1562: BPCS	<illegal instruction>
	.word 0x87802089  ! 1563: WRASI_I	wr	%r0, 0x0089, %asi
DS_389:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1564: SAVE_R	save	%r31, %r0, %r31
	.word 0xf08804a0  ! 1565: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x87802016  ! 1566: WRASI_I	wr	%r0, 0x0016, %asi
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1567: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 1568: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902850  ! 1569: WRPR_PSTATE_I	wrpr	%r0, 0x0850, %pstate
	.word 0x93902007  ! 1570: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_390:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa5b18300  ! 1571: ALIGNADDRESS	alignaddr	%r6, %r0, %r18
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe45fc000  ! 1572: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 1573: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x81982b5e  ! 1574: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5e, %hpstate
change_to_randtl_391:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1575: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x93902007  ! 1576: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902242  ! 1577: WRPR_PSTATE_I	wrpr	%r0, 0x0242, %pstate
splash_lsu_392:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1578: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_393:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1579: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
splash_cmpr_394:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1802001  ! 1580: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	.word 0x91d020b4  ! 1581: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x9f802001  ! 1582: SIR	sir	0x0001
	.word 0xe537c000  ! 1583: STQF_R	-	%f18, [%r0, %r31]
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe45fc000  ! 1584: LDX_R	ldx	[%r31 + %r0], %r18
splash_lsu_395:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1585: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 1586: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe49fc020  ! 1587: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902395  ! 1589: WRPR_PSTATE_I	wrpr	%r0, 0x0395, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1590: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe4d004a0  ! 1591: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
	.word 0x8780204f  ! 1592: WRASI_I	wr	%r0, 0x004f, %asi
splash_lsu_396:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1593: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200f  ! 1594: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_397:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1595: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_398:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1596: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_399:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1597: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8b540000  ! 1598: RDPR_GL	rdpr	%-, %r5
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 1599: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x8d90230f  ! 1600: WRPR_PSTATE_I	wrpr	%r0, 0x030f, %pstate
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1601: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 1602: BPE	<illegal instruction>
	.word 0x9f802001  ! 1603: SIR	sir	0x0001
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xca5fc000  ! 1604: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xcacfe000  ! 1605: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r5
DS_400:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xcf304006  ! 1: STQF_R	-	%f7, [%r6, %r1]
	normalw
	.word 0x8d458000  ! 1606: RD_SOFTINT_REG	rd	%softint, %r6
splash_tba_401:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1607: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02032  ! 1608: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9f802001  ! 1609: SIR	sir	0x0001
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xcc5fc000  ! 1610: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x9f802001  ! 1611: SIR	sir	0x0001
	.word 0xcc17c000  ! 1612: LDUH_R	lduh	[%r31 + %r0], %r6
	.word 0x91d02033  ! 1613: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902005  ! 1614: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8198220d  ! 1615: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020d, %hpstate
	.word 0xcc1fe001  ! 1616: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x879020f9  ! 1617: WRPR_TT_I	wrpr	%r0, 0x00f9, %tt
	.word 0x93d02033  ! 1618: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_lsu_402:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1619: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc880e60  ! 1620: LDUBA_R	lduba	[%r0, %r0] 0x73, %r6
	.word 0xcc0fc000  ! 1621: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0xcc8804a0  ! 1622: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
	.word 0xccc7e030  ! 1623: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	.word 0xccdfe010  ! 1624: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r6
splash_tba_403:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1625: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_404:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1626: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 1627: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8d802000  ! 1628: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcc9fe001  ! 1629: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1630: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x38800001  ! 1631: BGU	bgu,a	<label_0x1>
	.word 0x879020e6  ! 1632: WRPR_TT_I	wrpr	%r0, 0x00e6, %tt
	.word 0xcc8fe020  ! 1633: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r6
	.word 0x87802058  ! 1634: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x91d02032  ! 1635: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902868  ! 1636: WRPR_PSTATE_I	wrpr	%r0, 0x0868, %pstate
splash_cmpr_405:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1846001  ! 1637: WR_STICK_REG_I	wr	%r17, 0x0001, %-
tagged_406:
	tsubcctv %r13, 0x178e, %r3
	.word 0xcc07e001  ! 1638: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc77c006  ! 1639: STX_R	stx	%r6, [%r31 + %r6]
splash_lsu_407:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1640: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab514000  ! 1641: RDPR_TBA	rdpr	%tba, %r21
	.word 0xea0fe001  ! 1642: LDUB_I	ldub	[%r31 + 0x0001], %r21
splash_cmpr_408:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1832001  ! 1643: WR_STICK_REG_I	wr	%r12, 0x0001, %-
	.word 0x8d902301  ! 1644: WRPR_PSTATE_I	wrpr	%r0, 0x0301, %pstate
change_to_randtl_409:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1645: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
DS_410:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1646: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_411:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1647: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902001  ! 1648: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982886  ! 1649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0886, %hpstate
	.word 0x99902004  ! 1650: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x99902002  ! 1651: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xea97e010  ! 1652: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r21
	.word 0x8d9024f3  ! 1653: WRPR_PSTATE_I	wrpr	%r0, 0x04f3, %pstate
	.word 0xea97e020  ! 1654: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r21
	.word 0x9f802001  ! 1655: SIR	sir	0x0001
tagged_412:
	tsubcctv %r11, 0x1360, %r12
	.word 0xea07e001  ! 1656: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0xeb37e001  ! 1657: STQF_I	-	%f21, [0x0001, %r31]
	.word 0x91d020b3  ! 1658: Tcc_I	ta	icc_or_xcc, %r0 + 179
tagged_413:
	taddcctv %r17, 0x1bb8, %r23
	.word 0xea07e001  ! 1659: LDUW_I	lduw	[%r31 + 0x0001], %r21
splash_htba_414:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1660: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xeacfe020  ! 1661: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r21
splash_lsu_415:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1662: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 1663: SIR	sir	0x0001
	.word 0x93902005  ! 1664: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa9494000  ! 1665: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0xe83fe001  ! 1666: STD_I	std	%r20, [%r31 + 0x0001]
	.word 0x8d9024f0  ! 1667: WRPR_PSTATE_I	wrpr	%r0, 0x04f0, %pstate
	.word 0x8790224b  ! 1668: WRPR_TT_I	wrpr	%r0, 0x024b, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xb345c000  ! 1670: RD_TICK_CMPR_REG	rd	%-, %r25
	.word 0xa1902005  ! 1671: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_lsu_416:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1672: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf25fc000  ! 1673: LDX_R	ldx	[%r31 + %r0], %r25
	.word 0x879020a1  ! 1674: WRPR_TT_I	wrpr	%r0, 0x00a1, %tt
splash_tba_417:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1675: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_418:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1676: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa7504000  ! 1677: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1854014  ! 1678: WR_STICK_REG_R	wr	%r21, %r20, %-
DS_420:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1679: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x87902398  ! 1680: WRPR_TT_I	wrpr	%r0, 0x0398, %tt
DS_421:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xf3346001  ! 1: STQF_I	-	%f25, [0x0001, %r17]
	normalw
	.word 0x83458000  ! 1681: RD_SOFTINT_REG	rd	%softint, %r1
splash_lsu_422:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1682: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_423:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xeb306001  ! 1: STQF_I	-	%f21, [0x0001, %r1]
	normalw
	.word 0x85458000  ! 1683: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc4c7e010  ! 1684: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0xc4d804a0  ! 1685: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
splash_htba_424:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1686: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_425:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1687: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x89504000  ! 1688: RDPR_TNPC	rdpr	%tnpc, %r4
change_to_randtl_426:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1689: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 1691: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_427:
	taddcctv %r10, 0x1a77, %r21
	.word 0xc807e001  ! 1692: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x87902219  ! 1693: WRPR_TT_I	wrpr	%r0, 0x0219, %tt
	.word 0xa9494000  ! 1694: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0xa1902008  ! 1695: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa1902001  ! 1696: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8d902207  ! 1697: WRPR_PSTATE_I	wrpr	%r0, 0x0207, %pstate
	.word 0x24800001  ! 1698: BLE	ble,a	<label_0x1>
	.word 0xe81fc000  ! 1699: LDD_R	ldd	[%r31 + %r0], %r20
splash_lsu_428:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1700: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe88fe020  ! 1701: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r20
	.word 0x8d902ed9  ! 1702: WRPR_PSTATE_I	wrpr	%r0, 0x0ed9, %pstate
	.word 0xe997e001  ! 1703: LDQFA_I	-	[%r31, 0x0001], %f20
splash_tba_429:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1704: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_430:
	tsubcctv %r20, 0x1642, %r24
	.word 0xe807e001  ! 1705: LDUW_I	lduw	[%r31 + 0x0001], %r20
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1706: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1707: SIR	sir	0x0001
	.word 0xe9e7c034  ! 1708: CASA_I	casa	[%r31] 0x 1, %r20, %r20
	.word 0xe847c000  ! 1709: LDSW_R	ldsw	[%r31 + %r0], %r20
	.word 0xe817e001  ! 1710: LDUH_I	lduh	[%r31 + 0x0001], %r20
splash_tba_431:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1711: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_432:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1712: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_433:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xdb302001  ! 1: STQF_I	-	%f13, [0x0001, %r0]
	normalw
	.word 0xa9458000  ! 1713: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x91d02034  ! 1714: Tcc_I	ta	icc_or_xcc, %r0 + 52
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe85fc000  ! 1715: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x24700001  ! 1716: BPLE	<illegal instruction>
	.word 0xa190200a  ! 1717: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_htba_434:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1718: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200a  ! 1719: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xe8800ba0  ! 1720: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r20
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1721: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1722: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe88008a0  ! 1723: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xe8d004a0  ! 1724: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x93902002  ! 1725: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_435:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1726: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x34700001  ! 1727: BPG	<illegal instruction>
	.word 0x91d02034  ! 1728: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902e02  ! 1729: WRPR_PSTATE_I	wrpr	%r0, 0x0e02, %pstate
splash_tba_436:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1730: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902008  ! 1731: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe817c000  ! 1732: LDUH_R	lduh	[%r31 + %r0], %r20
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 1733: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8d9023c9  ! 1734: WRPR_PSTATE_I	wrpr	%r0, 0x03c9, %pstate
DS_437:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1735: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902001  ! 1736: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_438:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc5342001  ! 1: STQF_I	-	%f2, [0x0001, %r16]
	normalw
	.word 0x8d458000  ! 1737: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcccfe010  ! 1738: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r6
	.word 0x93902002  ! 1739: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996b6001  ! 1740: SDIVX_I	sdivx	%r13, 0x0001, %r12
	.word 0x93d02032  ! 1741: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd88008a0  ! 1742: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 1743: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd88008a0  ! 1744: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x8198278d  ! 1745: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078d, %hpstate
	.word 0x81982817  ! 1746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0817, %hpstate
	.word 0xd807c000  ! 1747: LDUW_R	lduw	[%r31 + %r0], %r12
	.word 0x93902001  ! 1748: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902005  ! 1749: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_440:
	tsubcctv %r18, 0x11d9, %r10
	.word 0xd807e001  ! 1750: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8790206b  ! 1751: WRPR_TT_I	wrpr	%r0, 0x006b, %tt
	.word 0x879022d9  ! 1752: WRPR_TT_I	wrpr	%r0, 0x02d9, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902003  ! 1754: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x34800001  ! 1755: BG	bg,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
splash_cmpr_441:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1802001  ! 1757: WR_STICK_REG_I	wr	%r0, 0x0001, %-
splash_tba_442:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1758: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_443:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1759: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879022b7  ! 1760: WRPR_TT_I	wrpr	%r0, 0x02b7, %tt
	.word 0x91d02032  ! 1761: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd80fe001  ! 1762: LDUB_I	ldub	[%r31 + 0x0001], %r12
splash_tba_444:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1764: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd88fe020  ! 1765: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
	.word 0x22800001  ! 1766: BE	be,a	<label_0x1>
	.word 0xd88008a0  ! 1767: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x95508000  ! 1768: RDPR_TSTATE	rdpr	%tstate, %r10
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1769: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 1770: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd53fc014  ! 1771: STDF_R	std	%f10, [%r20, %r31]
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1772: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_445:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1773: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1774: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd45fe001  ! 1775: LDX_I	ldx	[%r31 + 0x0001], %r10
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1776: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x87802055  ! 1777: WRASI_I	wr	%r0, 0x0055, %asi
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1778: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_446:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xc34db639	! Random illegal ?
	.word 0xf1164014  ! 1: LDQF_R	-	[%r25, %r20], %f24
	.word 0x97a34828  ! 1779: FADDs	fadds	%f13, %f8, %f11
	.word 0x8d902a2d  ! 1780: WRPR_PSTATE_I	wrpr	%r0, 0x0a2d, %pstate
splash_lsu_447:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1781: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902005  ! 1782: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
DS_448:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb360004  ! 1: STQF_R	-	%f13, [%r4, %r24]
	normalw
	.word 0x93458000  ! 1783: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd29fe001  ! 1784: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
splash_lsu_449:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1785: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1786: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_450:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1787: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02032  ! 1788: Tcc_I	te	icc_or_xcc, %r0 + 50
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1789: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1790: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd2c7e010  ! 1791: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r9
splash_lsu_451:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1792: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9022b7  ! 1793: WRPR_PSTATE_I	wrpr	%r0, 0x02b7, %pstate
	.word 0xa1902005  ! 1794: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd29fe001  ! 1795: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
	ta	T_CHANGE_PRIV	! macro
splash_htba_452:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1797: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93d02032  ! 1798: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8790232e  ! 1799: WRPR_TT_I	wrpr	%r0, 0x032e, %tt
	.word 0xa1902006  ! 1800: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd297e010  ! 1801: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
DS_453:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1802: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02034  ! 1803: Tcc_I	ta	icc_or_xcc, %r0 + 52
tagged_454:
	tsubcctv %r18, 0x169f, %r4
	.word 0xd207e001  ! 1804: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd22fc004  ! 1805: STB_R	stb	%r9, [%r31 + %r4]
	.word 0x8d902466  ! 1806: WRPR_PSTATE_I	wrpr	%r0, 0x0466, %pstate
DS_455:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xcf120010  ! 1: LDQF_R	-	[%r8, %r16], %f7
	.word 0x95a44822  ! 1807: FADDs	fadds	%f17, %f2, %f10
tagged_456:
	tsubcctv %r3, 0x18b5, %r7
	.word 0xd407e001  ! 1808: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8790223e  ! 1809: WRPR_TT_I	wrpr	%r0, 0x023e, %tt
splash_cmpr_457:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1842001  ! 1810: WR_STICK_REG_I	wr	%r16, 0x0001, %-
	.word 0x93d02034  ! 1811: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x81982bdd  ! 1812: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdd, %hpstate
	.word 0x99514000  ! 1813: RDPR_TBA	rdpr	%tba, %r12
	.word 0xd8c804a0  ! 1814: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
tagged_458:
	tsubcctv %r17, 0x164f, %r15
	.word 0xd807e001  ! 1815: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x91d02035  ! 1816: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd8c804a0  ! 1817: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd89fe001  ! 1818: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0xd88008a0  ! 1819: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x91d02032  ! 1820: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd8c804a0  ! 1821: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd8800b60  ! 1822: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r12
	.word 0x8d902216  ! 1823: WRPR_PSTATE_I	wrpr	%r0, 0x0216, %pstate
	.word 0xd817c000  ! 1824: LDUH_R	lduh	[%r31 + %r0], %r12
	.word 0x87802010  ! 1825: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d9028ed  ! 1826: WRPR_PSTATE_I	wrpr	%r0, 0x08ed, %pstate
	.word 0xd857e001  ! 1827: LDSH_I	ldsh	[%r31 + 0x0001], %r12
	.word 0xd8c7e020  ! 1828: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r12
	.word 0xd85fe001  ! 1829: LDX_I	ldx	[%r31 + 0x0001], %r12
	.word 0x819821cf  ! 1830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cf, %hpstate
	.word 0xd8800c80  ! 1831: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r12
	.word 0xd88804a0  ! 1832: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xd89fc020  ! 1833: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0xd817e001  ! 1834: LDUH_I	lduh	[%r31 + 0x0001], %r12
	.word 0xd8dfe030  ! 1835: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
tagged_459:
	taddcctv %r19, 0x1be9, %r16
	.word 0xd807e001  ! 1836: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd80fc000  ! 1837: LDUB_R	ldub	[%r31 + %r0], %r12
	.word 0x99902004  ! 1838: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xd8d00e80  ! 1839: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r12
	.word 0xa190200c  ! 1840: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d902ef5  ! 1841: WRPR_PSTATE_I	wrpr	%r0, 0x0ef5, %pstate
	.word 0xb5494000  ! 1842: RDHPR_HTBA	rdhpr	%htba, %r26
	.word 0xf4c7e030  ! 1843: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r26
DS_460:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f22, %f10, %f18
	.word 0xadb64319  ! 1844: ALIGNADDRESS	alignaddr	%r25, %r25, %r22
splash_lsu_461:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1845: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 1846: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902001  ! 1847: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xec800aa0  ! 1848: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r22
	.word 0x83d020b4  ! 1849: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xec8008a0  ! 1850: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x99902004  ! 1851: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xecd7e000  ! 1852: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r22
	.word 0x879020fa  ! 1853: WRPR_TT_I	wrpr	%r0, 0x00fa, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xec5fc000  ! 1854: LDX_R	ldx	[%r31 + %r0], %r22
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1855: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879020e2  ! 1856: WRPR_TT_I	wrpr	%r0, 0x00e2, %tt
	.word 0x87802063  ! 1857: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8790235a  ! 1858: WRPR_TT_I	wrpr	%r0, 0x035a, %tt
	.word 0xecc7e010  ! 1859: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r22
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 1860: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_462:
	tsubcctv %r11, 0x1108, %r1
	.word 0xec07e001  ! 1861: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x8f480000  ! 1862: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x9f802001  ! 1863: SIR	sir	0x0001
	.word 0xcf97e001  ! 1864: LDQFA_I	-	[%r31, 0x0001], %f7
	.word 0x9f802001  ! 1865: SIR	sir	0x0001
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89840005  ! 1866: WRTICK_R	wr	%r16, %r5, %tick
	.word 0x87802014  ! 1867: WRASI_I	wr	%r0, 0x0014, %asi
splash_lsu_464:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1868: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_465:
	taddcctv %r10, 0x16b2, %r6
	.word 0xce07e001  ! 1869: LDUW_I	lduw	[%r31 + 0x0001], %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xce5fc000  ! 1870: LDX_R	ldx	[%r31 + %r0], %r7
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 1871: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1872: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802063  ! 1873: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa190200f  ! 1874: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0xce97e020  ! 1876: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r7
	.word 0xa96a0019  ! 1877: SDIVX_R	sdivx	%r8, %r25, %r20
	.word 0x99902000  ! 1878: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x93d02035  ! 1879: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xe857e001  ! 1880: LDSH_I	ldsh	[%r31 + 0x0001], %r20
	.word 0x93d020b5  ! 1881: Tcc_I	tne	icc_or_xcc, %r0 + 181
splash_tba_466:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1882: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1883: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93d02032  ! 1884: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_htba_467:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1885: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe89004a0  ! 1886: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0xe88008a0  ! 1887: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x36700001  ! 1888: BPGE	<illegal instruction>
DS_468:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd532801a  ! 1: STQF_R	-	%f10, [%r26, %r10]
	normalw
	.word 0x89458000  ! 1889: RD_SOFTINT_REG	rd	%softint, %r4
tagged_469:
	taddcctv %r16, 0x1b63, %r1
	.word 0xc807e001  ! 1890: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc89fe001  ! 1891: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	.word 0x91d02035  ! 1892: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc937c01a  ! 1893: STQF_R	-	%f4, [%r26, %r31]
	.word 0xa190200b  ! 1894: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x30800001  ! 1895: BA	ba,a	<label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 1896: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0xc817c000  ! 1897: LDUH_R	lduh	[%r31 + %r0], %r4
DS_470:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe3322001  ! 1: STQF_I	-	%f17, [0x0001, %r8]
	normalw
	.word 0xa1458000  ! 1898: RD_SOFTINT_REG	rd	%softint, %r16
DS_471:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf334c004  ! 1: STQF_R	-	%f25, [%r4, %r19]
	normalw
	.word 0x95458000  ! 1899: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xa1902001  ! 1900: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x91d02033  ! 1901: Tcc_I	ta	icc_or_xcc, %r0 + 51
tagged_472:
	tsubcctv %r12, 0x1c9f, %r9
	.word 0xd407e001  ! 1902: LDUW_I	lduw	[%r31 + 0x0001], %r10
change_to_randtl_473:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1903: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1904: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 1906: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd457e001  ! 1907: LDSH_I	ldsh	[%r31 + 0x0001], %r10
	.word 0x87802080  ! 1908: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd48008a0  ! 1909: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8790218d  ! 1910: WRPR_TT_I	wrpr	%r0, 0x018d, %tt
	.word 0x91d02034  ! 1911: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd41fc000  ! 1912: LDD_R	ldd	[%r31 + %r0], %r10
splash_cmpr_474:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186a001  ! 1913: WR_STICK_REG_I	wr	%r26, 0x0001, %-
	.word 0xa1902005  ! 1914: WRPR_GL_I	wrpr	%r0, 0x0005, %-
tagged_475:
	taddcctv %r9, 0x10d3, %r26
	.word 0xd407e001  ! 1915: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x87802010  ! 1916: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x879023fb  ! 1917: WRPR_TT_I	wrpr	%r0, 0x03fb, %tt
	.word 0xb7514000  ! 1918: RDPR_TBA	rdpr	%tba, %r27
splash_lsu_476:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1919: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf68008a0  ! 1920: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf65fc000  ! 1921: LDX_R	ldx	[%r31 + %r0], %r27
	.word 0xf737c004  ! 1922: STQF_R	-	%f27, [%r4, %r31]
change_to_randtl_477:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1923: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xf657c000  ! 1924: LDSH_R	ldsh	[%r31 + %r0], %r27
	.word 0x8d902d7f  ! 1925: WRPR_PSTATE_I	wrpr	%r0, 0x0d7f, %pstate
	.word 0xf65fe001  ! 1926: LDX_I	ldx	[%r31 + 0x0001], %r27
DS_478:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xbbdbeb3e	! Random illegal ?
	.word 0xc9130009  ! 1: LDQF_R	-	[%r12, %r9], %f4
	.word 0x97a1883b  ! 1927: FADDs	fadds	%f6, %f27, %f11
	.word 0xd737c01b  ! 1928: STQF_R	-	%f11, [%r27, %r31]
	.word 0x87802020  ! 1929: WRASI_I	wr	%r0, 0x0020, %asi
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1930: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd61fe001  ! 1931: LDD_I	ldd	[%r31 + 0x0001], %r11
	.word 0x8d90225a  ! 1932: WRPR_PSTATE_I	wrpr	%r0, 0x025a, %pstate
	.word 0xa190200f  ! 1933: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87802058  ! 1934: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x91d02032  ! 1935: Tcc_I	ta	icc_or_xcc, %r0 + 50
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 1936: LDX_R	ldx	[%r31 + %r0], %r11
tagged_479:
	taddcctv %r18, 0x10f7, %r14
	.word 0xd607e001  ! 1937: LDUW_I	lduw	[%r31 + 0x0001], %r11
DS_480:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xed34a001  ! 1: STQF_I	-	%f22, [0x0001, %r18]
	normalw
	.word 0x9b458000  ! 1938: RD_SOFTINT_REG	rd	%softint, %r13
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 1939: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xdadfe000  ! 1940: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x91d020b3  ! 1941: Tcc_I	ta	icc_or_xcc, %r0 + 179
	ta	T_CHANGE_HPRIV	! macro
	.word 0xda8008a0  ! 1943: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda17e001  ! 1944: LDUH_I	lduh	[%r31 + 0x0001], %r13
	.word 0xa551c000  ! 1945: RDPR_TL	rdpr	%tl, %r18
tagged_481:
	taddcctv %r15, 0x1c3b, %r25
	.word 0xe407e001  ! 1946: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x36800001  ! 1947: BGE	bge,a	<label_0x1>
DS_482:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xeb736062	! Random illegal ?
	.word 0x97a00554  ! 1: FSQRTd	fsqrt	
	.word 0x83a18827  ! 1948: FADDs	fadds	%f6, %f7, %f1
	.word 0x87802088  ! 1949: WRASI_I	wr	%r0, 0x0088, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 1950: LDX_R	ldx	[%r31 + %r0], %r1
DS_483:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc1148005  ! 1: LDQF_R	-	[%r18, %r5], %f0
	.word 0x8fa54826  ! 1951: FADDs	fadds	%f21, %f6, %f7
	.word 0x87802055  ! 1952: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x93902003  ! 1953: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_484:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1954: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce1fe001  ! 1955: LDD_I	ldd	[%r31 + 0x0001], %r7
	ta	T_CHANGE_HPRIV	! macro
splash_lsu_485:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1957: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_486:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1958: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02033  ! 1959: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_lsu_487:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1960: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce27e001  ! 1961: STW_I	stw	%r7, [%r31 + 0x0001]
	.word 0xcf17c000  ! 1962: LDQF_R	-	[%r31, %r0], %f7
	.word 0xce900e40  ! 1963: LDUHA_R	lduha	[%r0, %r0] 0x72, %r7
	.word 0x8790227a  ! 1964: WRPR_TT_I	wrpr	%r0, 0x027a, %tt
	.word 0xcf17c000  ! 1965: LDQF_R	-	[%r31, %r0], %f7
tagged_488:
	tsubcctv %r14, 0x1f45, %r20
	.word 0xce07e001  ! 1966: LDUW_I	lduw	[%r31 + 0x0001], %r7
splash_cmpr_489:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186a001  ! 1967: WR_STICK_REG_I	wr	%r26, 0x0001, %-
	.word 0x8d9023a4  ! 1968: WRPR_PSTATE_I	wrpr	%r0, 0x03a4, %pstate
splash_tba_490:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1969: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce57c000  ! 1970: LDSH_R	ldsh	[%r31 + %r0], %r7
	.word 0x91d02033  ! 1971: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93d02035  ! 1972: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_cmpr_491:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1806001  ! 1973: WR_STICK_REG_I	wr	%r1, 0x0001, %-
splash_lsu_492:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1974: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 1975: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89810004  ! 1976: WRTICK_R	wr	%r4, %r4, %tick
	.word 0x91d02034  ! 1977: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1978: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83b10feb  ! 1979: FONES	e	%f1
	.word 0x87802088  ! 1980: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xc317c000  ! 1981: LDQF_R	-	[%r31, %r0], %f1
	.word 0x9951c000  ! 1982: RDPR_TL	rdpr	%tl, %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 1983: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x38800001  ! 1984: BGU	bgu,a	<label_0x1>
	.word 0x8d802000  ! 1985: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802004  ! 1986: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xd897e020  ! 1988: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r12
	.word 0x87802063  ! 1989: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93508000  ! 1990: RDPR_TSTATE	rdpr	%tstate, %r9
	.word 0xd397e001  ! 1991: LDQFA_I	-	[%r31, 0x0001], %f9
splash_lsu_494:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1992: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 1993: Tcc_I	ta	icc_or_xcc, %r0 + 180
DS_495:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1994: SAVE_R	save	%r31, %r0, %r31
splash_htba_496:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1995: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_497:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1996: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_498:
	tsubcctv %r9, 0x1f9b, %r1
	.word 0xd207e001  ! 1997: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd2d80e40  ! 1998: LDXA_R	ldxa	[%r0, %r0] 0x72, %r9
tagged_499:
	taddcctv %r1, 0x1136, %r19
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

	.xword	0xe256253a41cd4dc6
	.xword	0xc7702175024ac6bb
	.xword	0x8ea38d66d6932ebb
	.xword	0x12205c101e38a994
	.xword	0xf916f90c42674736
	.xword	0x09617986bf420999
	.xword	0x8afa2e308afd0d9a
	.xword	0x7e66ef4fae0f5dde
	.xword	0xb05034f2310b2a01
	.xword	0x0419e57d6f32e592
	.xword	0x0fd3cfde2798886e
	.xword	0x3420add259d0c487
	.xword	0x74470fc794ce431e
	.xword	0xa3f003291a555124
	.xword	0x1e46f7a192448cf7
	.xword	0xaa2ab2d14476878d
	.xword	0xe4f27728c4951ecd
	.xword	0x813b9c7ec7a3aff4
	.xword	0x13980a4586c7fb30
	.xword	0xef41a2a159d0d4f9
	.xword	0x57cbbec0a5346ff5
	.xword	0x4e1382c24bfdd101
	.xword	0xcdc7d560dc7fb80f
	.xword	0xd663a075bec788da
	.xword	0xb4a7d8fc447c68c5
	.xword	0x82bd9486c6d4a21b
	.xword	0x1adaa62d5ee3933a
	.xword	0xdb0b1ecab68c537d
	.xword	0x075ae9e29b48f2de
	.xword	0x58dd44f30affaa28
	.xword	0x5adb31007e547124
	.xword	0xcf953ef914a9963d
	.xword	0xa18567d8dd031549
	.xword	0xaafaa0e8f9413bc3
	.xword	0xc93d9459469b401c
	.xword	0xe5ef621709a23ef3
	.xword	0x1539777a0ea51a53
	.xword	0x25056523cfdd98e6
	.xword	0x0ebe7657a3de481a
	.xword	0x872ac07cc85f0c8b
	.xword	0xe58b3515b324b280
	.xword	0xfc7171bcbd050a45
	.xword	0x8e774d5f336032e2
	.xword	0x3bcd085dc42ff53a
	.xword	0x0173b411b52c7991
	.xword	0xe35338025a628c1a
	.xword	0x2cec7239874511eb
	.xword	0x593262c54fd5a1e9
	.xword	0x05c0b279143043c9
	.xword	0xdafec4cd7d5c8f04
	.xword	0xdb648e590ec03211
	.xword	0x11724709e783ff6f
	.xword	0x05c8fdededa6f768
	.xword	0xd86ca04b1a8146d8
	.xword	0xa22f210dd4bf67e5
	.xword	0x3924c4092144be4f
	.xword	0xee4f1ffc29a9336a
	.xword	0x46b8c3d80572299f
	.xword	0xd8f5d92b035af303
	.xword	0x2dedd722a9077745
	.xword	0x5fb9a6a0adbe6a3d
	.xword	0x53cc6b778276255f
	.xword	0xfb5183ebdfee98c1
	.xword	0x7ec70617aa62b118
	.xword	0x4ef0a5f8d40beb21
	.xword	0x18867b2aa95a3fc5
	.xword	0xfc7b4c68c24c6823
	.xword	0x9c9ff0eab712dcef
	.xword	0x4af00fb280db0a20
	.xword	0x22dff808763e0b45
	.xword	0xb4c5aa204c256ecb
	.xword	0xc17da1f3d15c2889
	.xword	0x676117bcff3f57ac
	.xword	0x3dbdd5d5d81318d9
	.xword	0x43b2db7ec1725c2a
	.xword	0xe5d6a8cb2b28a138
	.xword	0x76feeab58a95ab86
	.xword	0x4ab5961351f19947
	.xword	0xbb707eefca95d3dc
	.xword	0x8772ddc5c46d2540
	.xword	0x365ecfd3d19987f2
	.xword	0x5d32b7ceb0468362
	.xword	0xa064c6c75322b090
	.xword	0x59b03cd7849a9ab5
	.xword	0x5d0e624d0858a1d8
	.xword	0x9a0c7b8ec07c45fb
	.xword	0xcf623339dfc1b06e
	.xword	0x08387f4f986ea376
	.xword	0xc370e0d8dbcdc2e1
	.xword	0xa06f9275fa420fb1
	.xword	0x3aae1429455b8708
	.xword	0x1f971836154d1e99
	.xword	0xaba5940d24eaea59
	.xword	0x6b09cff8b70eb484
	.xword	0x77d21950c39d1ca9
	.xword	0xb049ef3c9734a9a4
	.xword	0xd2dacec696a1f398
	.xword	0xe74ef6247be3bc8b
	.xword	0xaae57788712580d4
	.xword	0x5a201b9cfae585f5
	.xword	0x3254f0c5660809de
	.xword	0x0a9eff83632d4c70
	.xword	0x9fa8ee8e35c90cae
	.xword	0xe70af49eb2ba0028
	.xword	0x7f9d2a153725807d
	.xword	0x9b06b8c06936e410
	.xword	0x03ea679a9d538a3e
	.xword	0x404c04d31710bf24
	.xword	0x9ab0423811e6b713
	.xword	0x4c561e1209f15edf
	.xword	0xf12540982bc18188
	.xword	0x1af28fb47b857b2d
	.xword	0xf9b1af916468830b
	.xword	0x487a17fda5e3ad0a
	.xword	0x93cbd89b76e8c401
	.xword	0x2ad536e45734c062
	.xword	0xda514b5d9ac4a6bb
	.xword	0xf58f606f87026256
	.xword	0xaaa5ac8706e53bee
	.xword	0x7fabd10d08cfb2c0
	.xword	0x2bb8c1402efc291c
	.xword	0xd71b0da452295a84
	.xword	0x590b0c9ed5b7f7d5
	.xword	0xd7a91fd251b1b3af
	.xword	0x307f8caedcae0f51
	.xword	0x01ab64913571eca7
	.xword	0x4f71ca1ca4f51038
	.xword	0x40ec8fed3a8cf5aa
	.xword	0xd0c46a37e016e1c9
	.xword	0xeef8e3b1d911f05f
	.xword	0xf67e7c55f4ff4950
	.xword	0xeafe6ae61b8a841b
	.xword	0x01841c4f666ff579
	.xword	0xc7bd0a386148d6d0
	.xword	0x18f685e8ed9d89da
	.xword	0xf9c8085fad710e81
	.xword	0x4dcb6cba295991a3
	.xword	0x7cb537b1d00f1a30
	.xword	0xff8f6515155a2918
	.xword	0x0d6d9e9c7125da66
	.xword	0xcced3f630025e750
	.xword	0xe7efb9786768b0f0
	.xword	0x4f13648e8c6dcb12
	.xword	0x2ff5c4d0ebe6d2af
	.xword	0x1dfb037f6d339d11
	.xword	0x75355c8d381af1a9
	.xword	0xacaa9ba33ba80ba9
	.xword	0x5f1c05fd44ecbb60
	.xword	0x760bf824ac73d961
	.xword	0x4020b42080fc40a0
	.xword	0x8876610f3ba22e2a
	.xword	0x6fb7259dd9259709
	.xword	0xd2aadd4a83915b15
	.xword	0x330aa980ae15e41e
	.xword	0xcc13d034d5ff20d7
	.xword	0x133b5d09624ae1e7
	.xword	0x7c9d151926e54273
	.xword	0x3b91fcda9a22b0c9
	.xword	0x0e9b1ab1cc3b8f9f
	.xword	0xbb1c0ea31e87dbf0
	.xword	0x757b5bfbb4cbc723
	.xword	0x05600fbe1204a695
	.xword	0x1f923a51c16559ba
	.xword	0xd7dbf6dcc53de0ad
	.xword	0x33fde42a37b57ea8
	.xword	0xd152fcbcfe8e7b1a
	.xword	0x130db52e93042d75
	.xword	0xb9a5a86610b8beb7
	.xword	0x538cf51d14d06c03
	.xword	0x158c638b04aa5505
	.xword	0x8ab2d81774d8b6ab
	.xword	0xa4062e54679714c0
	.xword	0x15abcb120ab8de57
	.xword	0x53201bceae70b15f
	.xword	0xcbf57724b6059f04
	.xword	0x34894bab18d798e4
	.xword	0x474fd23e6900213f
	.xword	0x99d1698a713b4e36
	.xword	0xdda1431fd6bb93e2
	.xword	0x18fa19ab029c341b
	.xword	0x2201a4059057371c
	.xword	0xfcd3bf9cfb6a363d
	.xword	0x157e84cb9d9e9847
	.xword	0x870ddfdf47fa5255
	.xword	0xb0014da225955c28
	.xword	0xdb91d935b36db0ed
	.xword	0x164e6a7464170079
	.xword	0xe6a86392287d528a
	.xword	0xb6c9bc11447860e7
	.xword	0x9e643b7b64ca21fb
	.xword	0x22433c896c52911d
	.xword	0x26dc0cf2e8fdb113
	.xword	0xe9a92e2fc19ab58a
	.xword	0xc298087a10751a9e
	.xword	0xab57b52d9c1cfa15
	.xword	0x9b020a21da387c4d
	.xword	0x1350f6d8ded26c11
	.xword	0x028ba1752015faad
	.xword	0x7cb64fab596fa53f
	.xword	0x4220c91ae4ee9d6a
	.xword	0xdbc8d7b5e4f0b9a2
	.xword	0x25f9cbe7de523ea1
	.xword	0x674b6b665db546c8
	.xword	0x632d9c8970978bcb
	.xword	0x429b51b7ea838319
	.xword	0x754e501b8a5ed766
	.xword	0x2192322f97d4a6d9
	.xword	0x8ce2378da2952892
	.xword	0xa04649e2b1414ada
	.xword	0xf33bf06971424c7a
	.xword	0x8a2b58e220359a97
	.xword	0x097d42134b5d7507
	.xword	0x50c6f020f9e899c5
	.xword	0x48540b83bd578eba
	.xword	0xb884615ab60f685f
	.xword	0xf475fa4a69dbb70a
	.xword	0xa9ed2d0d9072554b
	.xword	0xc80f314f1dade599
	.xword	0xc9c6a4d8e79e5572
	.xword	0x799dd5ac117aef32
	.xword	0x52b2d513929863a3
	.xword	0xc8497a6899f9bbc9
	.xword	0xac91c7fee056912e
	.xword	0xb4165f55530fdbdc
	.xword	0x6a163fdd1af45db4
	.xword	0xfa5332a017980d99
	.xword	0x3c8f4d4067bfe09b
	.xword	0x78441d7d4a12bff2
	.xword	0xf7c832f6e68e2fac
	.xword	0x2dc17d6e5f607ce0
	.xword	0x8080b6c3eb6ce8cc
	.xword	0xff9f74d005d1aa6d
	.xword	0x62f1858228c1c4cb
	.xword	0x82f24468b956858c
	.xword	0xee196e4c30b43c6e
	.xword	0xe0e430a1612f44db
	.xword	0x3e934f6fc0dd0860
	.xword	0x91fe8609d54c50c5
	.xword	0x92af826573b65924
	.xword	0xd2afd5e03119c8ad
	.xword	0xe0e5116a5b5b72fb
	.xword	0x7fa16c949bd41768
	.xword	0x679c4f617f1622ae
	.xword	0xad373240f04e1ac9
	.xword	0xf1124505ae7ab530
	.xword	0x1390f6ad937c3f7e
	.xword	0x7478bee235e62b98
	.xword	0x44a6ff7cdd6a7143
	.xword	0x1ad9d4aac9d95d77
	.xword	0x528e61fb09a4ad13
	.xword	0x24f478b201f8a3d5
	.xword	0x5aaf0853cbce4892
	.xword	0x4f49f8742e57e68d
	.xword	0x2070a33a2e0169e6
	.xword	0x1132921eeae66bfd
	.xword	0xea3fd928e23ef37b

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

