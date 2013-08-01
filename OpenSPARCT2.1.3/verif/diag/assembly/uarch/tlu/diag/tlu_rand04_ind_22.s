/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_22.s
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
	mov 0x30, %r14
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
	mov 0xb3, %r14
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
	mov 0x31, %r14
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
	mov 0xb3, %r14
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
	mov 0xb3, %r14
	mov 0xb4, %r30
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

	.word 0x81460000  ! 1: RD_STICK_REG	stbar
	.word 0x87802063  ! 2: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xd657c000  ! 3: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xaf682001  ! 4: SDIVX_I	sdivx	%r0, 0x0001, %r23
	.word 0x88d30000  ! 5: UMULcc_R	umulcc 	%r12, %r0, %r4
	.word 0x93540000  ! 6: RDPR_GL	rdpr	%-, %r9
	.word 0x8790204c  ! 7: WRPR_TT_I	wrpr	%r0, 0x004c, %tt
	.word 0xd2dfe030  ! 8: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r9
	.word 0xd247c000  ! 9: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0x8d902d78  ! 10: WRPR_PSTATE_I	wrpr	%r0, 0x0d78, %pstate
	.word 0xd29fe001  ! 11: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
	.word 0x8951c000  ! 12: RDPR_TL	rdpr	%tl, %r4
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 13: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x87802058  ! 14: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xc997e001  ! 15: LDQFA_I	-	[%r31, 0x0001], %f4
	.word 0x93902006  ! 16: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02034  ! 17: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xc857e001  ! 18: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	.word 0xc8c7e020  ! 19: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc85fc000  ! 20: LDX_R	ldx	[%r31 + %r0], %r4
tagged_1:
	taddcctv %r18, 0x106c, %r26
	.word 0xc807e001  ! 21: LDUW_I	lduw	[%r31 + 0x0001], %r4
splash_tba_2:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 22: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_3:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 23: SAVE_R	save	%r31, %r0, %r31
	.word 0x93d020b2  ! 24: Tcc_I	tne	icc_or_xcc, %r0 + 178
splash_lsu_4:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 25: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_5:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 26: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x38800001  ! 27: BGU	bgu,a	<label_0x1>
change_to_randtl_6:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 28: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_7:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 29: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xa190200d  ! 30: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93d02034  ! 31: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_lsu_8:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 32: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902379  ! 33: WRPR_TT_I	wrpr	%r0, 0x0379, %tt
	.word 0x8d504000  ! 34: RDPR_TNPC	rdpr	%tnpc, %r6
splash_htba_9:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 35: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8198220d  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020d, %hpstate
	.word 0xa190200a  ! 37: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_cmpr_10:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184e001  ! 38: WR_STICK_REG_I	wr	%r19, 0x0001, %-
	.word 0x91d02034  ! 39: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
splash_lsu_11:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 41: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 42: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xcc37c000  ! 43: STH_R	sth	%r6, [%r31 + %r0]
	.word 0xcc97e010  ! 44: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r6
change_to_randtl_12:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 45: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xcc800a60  ! 46: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r6
	.word 0x9f802001  ! 47: SIR	sir	0x0001
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 48: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x87902287  ! 49: WRPR_TT_I	wrpr	%r0, 0x0287, %tt
	.word 0x91d02035  ! 50: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xcc07c000  ! 51: LDUW_R	lduw	[%r31 + %r0], %r6
	.word 0xcc1fe001  ! 52: LDD_I	ldd	[%r31 + 0x0001], %r6
	ta	T_CHANGE_HPRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 54: LDX_R	ldx	[%r31 + %r0], %r6
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 55: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 56: LDX_R	ldx	[%r31 + %r0], %r6
splash_htba_13:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 57: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902000  ! 59: WRPR_GL_I	wrpr	%r0, 0x0000, %-
tagged_14:
	tsubcctv %r11, 0x14d9, %r21
	.word 0xcc07e001  ! 60: LDUW_I	lduw	[%r31 + 0x0001], %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802063  ! 62: WRASI_I	wr	%r0, 0x0063, %asi
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 63: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 65: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902000  ! 67: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_tba_15:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 68: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x819826de  ! 69: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06de, %hpstate
	.word 0xa1902003  ! 70: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x9f802001  ! 71: SIR	sir	0x0001
	.word 0xccc7e030  ! 72: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	.word 0xcc47e001  ! 73: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	.word 0x87802080  ! 74: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa1902000  ! 75: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa1902004  ! 76: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	ta	T_CHANGE_HPRIV	! macro
tagged_16:
	tsubcctv %r14, 0x1004, %r22
	.word 0xcc07e001  ! 78: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xa1902001  ! 79: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x87802010  ! 80: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xccd7e030  ! 82: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r6
	.word 0x93902007  ! 83: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xcc1fc000  ! 84: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x91d02035  ! 85: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 86: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc9fe001  ! 87: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83a01971  ! 88: FqTOd	dis not found

	.word 0x93902003  ! 89: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc28008a0  ! 90: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xa5540000  ! 91: RDPR_GL	rdpr	%-, %r18
	.word 0xe41fe001  ! 92: LDD_I	ldd	[%r31 + 0x0001], %r18
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9ba01967  ! 93: FqTOd	dis not found

DS_19:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f4, %f24, %f14
	.word 0x93b10302  ! 94: ALIGNADDRESS	alignaddr	%r4, %r2, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 95: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2800a60  ! 96: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r9
	.word 0x91d020b5  ! 97: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x87902211  ! 98: WRPR_TT_I	wrpr	%r0, 0x0211, %tt
	.word 0x87802058  ! 99: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87902379  ! 100: WRPR_TT_I	wrpr	%r0, 0x0379, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802055  ! 102: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd297e010  ! 103: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
	.word 0xd2c004a0  ! 104: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	.word 0xd25fe001  ! 105: LDX_I	ldx	[%r31 + 0x0001], %r9
	.word 0xd257e001  ! 106: LDSH_I	ldsh	[%r31 + 0x0001], %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 107: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa1902002  ! 108: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 109: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_20:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 110: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_21:
	taddcctv %r15, 0x1b5b, %r17
	.word 0xd207e001  ! 111: LDUW_I	lduw	[%r31 + 0x0001], %r9
tagged_22:
	tsubcctv %r25, 0x12fa, %r18
	.word 0xd207e001  ! 112: LDUW_I	lduw	[%r31 + 0x0001], %r9
splash_tba_23:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 113: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_24:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcf30c002  ! 1: STQF_R	-	%f7, [%r2, %r3]
	normalw
	.word 0x87458000  ! 114: RD_SOFTINT_REG	rd	%softint, %r3
DS_25:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f28, %f28, %f24
	.word 0x8db58306  ! 115: ALIGNADDRESS	alignaddr	%r22, %r6, %r6
	.word 0xcc8fe010  ! 116: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r6
	.word 0x93902002  ! 117: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xcccfe020  ! 118: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0x83d02032  ! 120: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xcc800ae0  ! 121: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r6
splash_tba_26:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 122: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_27:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 123: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xa1902002  ! 124: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8f50c000  ! 125: RDPR_TT	rdpr	%tt, %r7
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 126: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790235b  ! 127: WRPR_TT_I	wrpr	%r0, 0x035b, %tt
splash_tba_28:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 128: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcec004a0  ! 129: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xcf97e001  ! 130: LDQFA_I	-	[%r31, 0x0001], %f7
	.word 0x879021e2  ! 131: WRPR_TT_I	wrpr	%r0, 0x01e2, %tt
	.word 0xa190200f  ! 132: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x20700001  ! 133: BPN	<illegal instruction>
	.word 0xce8008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x91d02035  ! 135: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xce1fc000  ! 136: LDD_R	ldd	[%r31 + %r0], %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xce5fc000  ! 137: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xa1902005  ! 138: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xce4fc000  ! 139: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0xce1fe001  ! 140: LDD_I	ldd	[%r31 + 0x0001], %r7
	.word 0x93902001  ! 141: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xcf27c006  ! 142: STF_R	st	%f7, [%r6, %r31]
	.word 0xcedfe030  ! 143: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 144: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x93902005  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f802001  ! 146: SIR	sir	0x0001
tagged_29:
	taddcctv %r23, 0x136d, %r26
	.word 0xce07e001  ! 147: LDUW_I	lduw	[%r31 + 0x0001], %r7
splash_tba_30:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 148: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8780204f  ! 149: WRASI_I	wr	%r0, 0x004f, %asi
DS_31:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xed120017  ! 1: LDQF_R	-	[%r8, %r23], %f22
	.word 0x8fa2c837  ! 150: FADDs	fadds	%f11, %f23, %f7
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 151: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 152: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902007  ! 153: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xce8008a0  ! 154: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xce8008a0  ! 155: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xb7508000  ! 156: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xf677c017  ! 157: STX_R	stx	%r27, [%r31 + %r23]
	.word 0xf69fe001  ! 158: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r27
	.word 0x87802004  ! 159: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02032  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d020b5  ! 161: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_lsu_32:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 162: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf727e001  ! 163: STF_I	st	%f27, [0x0001, %r31]
	.word 0xf617e001  ! 164: LDUH_I	lduh	[%r31 + 0x0001], %r27
	.word 0x93902001  ! 165: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8981000b  ! 166: WRTICK_R	wr	%r4, %r11, %tick
splash_lsu_34:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 167: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_35:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 168: SAVE_R	save	%r31, %r0, %r31
tagged_36:
	tsubcctv %r23, 0x10f1, %r3
	.word 0xf607e001  ! 169: LDUW_I	lduw	[%r31 + 0x0001], %r27
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf65fc000  ! 170: LDX_R	ldx	[%r31 + %r0], %r27
	.word 0x93d020b4  ! 171: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_lsu_37:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 172: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf61fc000  ! 173: LDD_R	ldd	[%r31 + %r0], %r27
splash_lsu_38:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf60fe001  ! 175: LDUB_I	ldub	[%r31 + 0x0001], %r27
	.word 0x81982004  ! 176: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0004, %hpstate
	.word 0x99902003  ! 177: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xf68008a0  ! 178: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
DS_39:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 179: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x8950c000  ! 180: RDPR_TT	rdpr	%tt, %r4
tagged_40:
	tsubcctv %r19, 0x1e27, %r11
	.word 0xc807e001  ! 181: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc8c00e40  ! 182: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r4
	.word 0x9f802001  ! 183: SIR	sir	0x0001
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 184: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc8d004a0  ! 186: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0x26800001  ! 187: BL	bl,a	<label_0x1>
	.word 0x24800001  ! 188: BLE	ble,a	<label_0x1>
	.word 0xa190200f  ! 189: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87802063  ! 190: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93902005  ! 191: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902006  ! 192: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 193: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902740  ! 194: WRPR_PSTATE_I	wrpr	%r0, 0x0740, %pstate
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8983000c  ! 195: WRTICK_R	wr	%r12, %r12, %tick
	.word 0xc8900e60  ! 196: LDUHA_R	lduha	[%r0, %r0] 0x73, %r4
change_to_randtl_42:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 197: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9f802001  ! 198: SIR	sir	0x0001
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 199: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc81fe001  ! 200: LDD_I	ldd	[%r31 + 0x0001], %r4
	.word 0x99902004  ! 201: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x87802020  ! 202: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x91d02034  ! 203: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f802001  ! 204: SIR	sir	0x0001
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 205: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc807c000  ! 206: LDUW_R	lduw	[%r31 + %r0], %r4
splash_tba_43:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 207: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc81fc000  ! 208: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xc847c000  ! 209: LDSW_R	ldsw	[%r31 + %r0], %r4
change_to_randtl_44:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 210: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x879021d1  ! 211: WRPR_TT_I	wrpr	%r0, 0x01d1, %tt
	.word 0xc89fe001  ! 212: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	.word 0x8d902b42  ! 213: WRPR_PSTATE_I	wrpr	%r0, 0x0b42, %pstate
	.word 0x91d020b4  ! 214: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xc8cfe010  ! 215: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0xc81fe001  ! 216: LDD_I	ldd	[%r31 + 0x0001], %r4
	.word 0xc8880e40  ! 217: LDUBA_R	lduba	[%r0, %r0] 0x72, %r4
	.word 0xc997e001  ! 218: LDQFA_I	-	[%r31, 0x0001], %f4
change_to_randtl_45:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 219: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x879021a0  ! 220: WRPR_TT_I	wrpr	%r0, 0x01a0, %tt
splash_tba_46:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 221: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 222: LDX_R	ldx	[%r31 + %r0], %r4
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc85fc000  ! 223: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x87902297  ! 224: WRPR_TT_I	wrpr	%r0, 0x0297, %tt
	.word 0xc85fe001  ! 225: LDX_I	ldx	[%r31 + 0x0001], %r4
	.word 0xaf51c000  ! 226: RDPR_TL	rdpr	%tl, %r23
	.word 0x93902003  ! 227: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa26a2001  ! 228: UDIVX_I	udivx 	%r8, 0x0001, %r17
	.word 0x8d9029fc  ! 229: WRPR_PSTATE_I	wrpr	%r0, 0x09fc, %pstate
	.word 0x91d020b4  ! 230: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xe29fe001  ! 231: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
splash_tba_47:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 232: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1500000  ! 233: RDPR_TPC	rdpr	%tpc, %r16
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe09fe001  ! 235: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
	.word 0xe09fe001  ! 236: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
	.word 0x99902003  ! 237: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xe00fc000  ! 238: LDUB_R	ldub	[%r31 + %r0], %r16
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe05fc000  ! 239: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0x97494000  ! 240: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0x91d020b4  ! 241: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_cmpr_48:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180e001  ! 242: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0xd68008a0  ! 243: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x9f802001  ! 244: SIR	sir	0x0001
	.word 0xd6d004a0  ! 245: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
tagged_49:
	taddcctv %r3, 0x1a5d, %r15
	.word 0xd607e001  ! 246: LDUW_I	lduw	[%r31 + 0x0001], %r11
tagged_50:
	tsubcctv %r11, 0x104d, %r5
	.word 0xd607e001  ! 247: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd607c000  ! 248: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x8790218a  ! 249: WRPR_TT_I	wrpr	%r0, 0x018a, %tt
	.word 0x819823d6  ! 250: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d6, %hpstate
	.word 0x83d02035  ! 251: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xd65fe001  ! 252: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xa190200b  ! 253: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_lsu_51:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 254: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 255: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd69fe001  ! 256: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
	.word 0xd69fc020  ! 257: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0x8790210e  ! 258: WRPR_TT_I	wrpr	%r0, 0x010e, %tt
	.word 0x879021e9  ! 259: WRPR_TT_I	wrpr	%r0, 0x01e9, %tt
	.word 0x9f802001  ! 260: SIR	sir	0x0001
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 261: LDX_R	ldx	[%r31 + %r0], %r11
splash_cmpr_52:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181a001  ! 262: WR_STICK_REG_I	wr	%r6, 0x0001, %-
tagged_53:
	taddcctv %r25, 0x1dd2, %r5
	.word 0xd607e001  ! 263: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x879020e8  ! 264: WRPR_TT_I	wrpr	%r0, 0x00e8, %tt
	.word 0xd60fc000  ! 265: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x93d02035  ! 266: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_lsu_54:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 267: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 268: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81982ecc  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecc, %hpstate
	.word 0x8d9029bf  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x09bf, %pstate
	.word 0x91d02034  ! 271: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd6c004a0  ! 272: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0xd6c00e80  ! 273: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r11
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 274: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 275: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd6800b80  ! 276: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
	.word 0x8d802000  ! 277: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_55:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 278: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902006  ! 279: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd69fc020  ! 280: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0xd6c804a0  ! 281: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	.word 0x32800001  ! 282: BNE	bne,a	<label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 283: LDX_R	ldx	[%r31 + %r0], %r11
splash_lsu_56:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 284: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_57:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x8bb1431b  ! 285: ALIGNADDRESS	alignaddr	%r5, %r27, %r5
	.word 0xca800b20  ! 286: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r5
	.word 0x98d32001  ! 287: UMULcc_I	umulcc 	%r12, 0x0001, %r12
	.word 0xd81fc000  ! 288: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0x3e800001  ! 289: BVC	bvc,a	<label_0x1>
	.word 0x8f464000  ! 290: RD_STICK_CMPR_REG	rd	%-, %r7
	.word 0x91d02032  ! 291: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802014  ! 292: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xce800a80  ! 293: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r7
	.word 0x8790200d  ! 294: WRPR_TT_I	wrpr	%r0, 0x000d, %tt
	.word 0xce8804a0  ! 295: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
	.word 0xa190200a  ! 296: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93902003  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982d14  ! 298: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d14, %hpstate
	ta	T_CHANGE_PRIV	! macro
splash_tba_58:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 300: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790224d  ! 301: WRPR_TT_I	wrpr	%r0, 0x024d, %tt
	.word 0x87902317  ! 302: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
DS_59:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 303: SAVE_R	save	%r31, %r0, %r31
	.word 0xce800c80  ! 304: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r7
	.word 0x8d902c7f  ! 305: WRPR_PSTATE_I	wrpr	%r0, 0x0c7f, %pstate
DS_60:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 306: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x87902087  ! 307: WRPR_TT_I	wrpr	%r0, 0x0087, %tt
	.word 0xce1fc000  ! 308: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0x8d902603  ! 309: WRPR_PSTATE_I	wrpr	%r0, 0x0603, %pstate
	.word 0x99902005  ! 310: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
splash_lsu_61:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81504000  ! 312: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0x24700001  ! 313: BPLE	<illegal instruction>
	.word 0xc09fc020  ! 314: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0x93902001  ! 315: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc0dfe000  ! 316: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r0
splash_tba_62:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 317: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 318: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc04fc000  ! 319: LDSB_R	ldsb	[%r31 + %r0], %r0
	.word 0xc01fc000  ! 320: LDD_R	ldd	[%r31 + %r0], %r0
DS_63:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xcd31400b  ! 1: STQF_R	-	%f6, [%r11, %r5]
	normalw
	.word 0x8b458000  ! 321: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xca800aa0  ! 322: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r5
DS_64:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 323: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_65:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 324: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 325: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8198239c  ! 326: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039c, %hpstate
	.word 0x99902001  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xcadfe020  ! 328: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r5
	.word 0xca9fc020  ! 329: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
	.word 0xca800c40  ! 330: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r5
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 331: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca8fe010  ! 332: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02034  ! 334: Tcc_I	ta	icc_or_xcc, %r0 + 52
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 335: LDX_R	ldx	[%r31 + %r0], %r5
DS_66:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 336: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_67:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 337: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 338: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xca8008a0  ! 339: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xca5fc000  ! 340: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xcad7e010  ! 341: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r5
splash_tba_68:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 342: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xca8fe000  ! 343: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r5
	.word 0x34800001  ! 344: BG	bg,a	<label_0x1>
	.word 0xca8008a0  ! 345: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x879022ad  ! 346: WRPR_TT_I	wrpr	%r0, 0x02ad, %tt
	.word 0xb350c000  ! 347: RDPR_TT	rdpr	%tt, %r25
	.word 0x819824d7  ! 348: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d7, %hpstate
	.word 0xf20fc000  ! 349: LDUB_R	ldub	[%r31 + %r0], %r25
DS_69:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 350: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d802000  ! 351: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_70:
	tsubcctv %r14, 0x11a3, %r18
	.word 0xf207e001  ! 352: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0xf29fe001  ! 353: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r25
	.word 0x85a149f2  ! 354: FDIVq	dis not found

	.word 0x8d902abc  ! 355: WRPR_PSTATE_I	wrpr	%r0, 0x0abc, %pstate
	.word 0xc45fe001  ! 356: LDX_I	ldx	[%r31 + 0x0001], %r2
	.word 0x879023b6  ! 357: WRPR_TT_I	wrpr	%r0, 0x03b6, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 358: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x93d020b3  ! 359: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xa190200a  ! 360: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xc4dfe000  ! 361: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r2
	.word 0xc4c804a0  ! 362: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r2
	.word 0x8790228d  ! 363: WRPR_TT_I	wrpr	%r0, 0x028d, %tt
	.word 0x819824ce  ! 364: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ce, %hpstate
	.word 0xc457c000  ! 365: LDSH_R	ldsh	[%r31 + %r0], %r2
	.word 0x91d020b2  ! 366: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xc48fe030  ! 367: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r2
	.word 0xc44fe001  ! 368: LDSB_I	ldsb	[%r31 + 0x0001], %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902230  ! 370: WRPR_TT_I	wrpr	%r0, 0x0230, %tt
	.word 0x91d020b2  ! 371: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa1902003  ! 372: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 373: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x93d02034  ! 374: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x93d020b4  ! 375: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x32700001  ! 376: BPNE	<illegal instruction>
tagged_71:
	taddcctv %r7, 0x1e68, %r26
	.word 0xc407e001  ! 377: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc4c004a0  ! 378: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
	.word 0xc417c000  ! 379: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x93d020b3  ! 380: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x819821dd  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01dd, %hpstate
	.word 0xc49fe001  ! 382: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	.word 0x83d02035  ! 383: Tcc_I	te	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0xc49fc020  ! 385: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 386: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc4c804a0  ! 387: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r2
	.word 0x87802055  ! 388: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x95540000  ! 389: RDPR_GL	rdpr	%-, %r10
	.word 0x87802089  ! 390: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87902068  ! 391: WRPR_TT_I	wrpr	%r0, 0x0068, %tt
	.word 0x8198288e  ! 392: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088e, %hpstate
	.word 0xd417c000  ! 393: LDUH_R	lduh	[%r31 + %r0], %r10
	.word 0x2c800001  ! 394: BNEG	bneg,a	<label_0x1>
	.word 0xa1902000  ! 395: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd44fe001  ! 396: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 397: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_72:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd330c001  ! 1: STQF_R	-	%f9, [%r1, %r3]
	normalw
	.word 0x87458000  ! 398: RD_SOFTINT_REG	rd	%softint, %r3
change_to_randtl_73:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 399: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xa1902002  ! 400: WRPR_GL_I	wrpr	%r0, 0x0002, %-
DS_74:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f18, %f18
	.word 0x83b5c312  ! 401: ALIGNADDRESS	alignaddr	%r23, %r18, %r1
	.word 0x81460000  ! 402: RD_STICK_REG	stbar
DS_75:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x8db4830c  ! 403: ALIGNADDRESS	alignaddr	%r18, %r12, %r6
tagged_76:
	tsubcctv %r11, 0x1c5d, %r11
	.word 0xcc07e001  ! 404: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc17e001  ! 405: LDUH_I	lduh	[%r31 + 0x0001], %r6
	.word 0xcc9fc020  ! 406: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 407: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902007  ! 408: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xcc3fc00c  ! 409: STD_R	std	%r6, [%r31 + %r12]
	.word 0x9950c000  ! 410: RDPR_TT	rdpr	%tt, %r12
	.word 0x91d02035  ! 411: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93d020b2  ! 412: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xd81fc000  ! 413: LDD_R	ldd	[%r31 + %r0], %r12
splash_lsu_77:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 414: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 415: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x87802014  ! 416: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd88fe000  ! 417: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0xd82fe001  ! 418: STB_I	stb	%r12, [%r31 + 0x0001]
	.word 0xd88008a0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x87802089  ! 420: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802014  ! 421: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd88008a0  ! 422: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd8c7e030  ! 423: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r12
	.word 0x819822c6  ! 424: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c6, %hpstate
	.word 0xd8d7e020  ! 425: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
	.word 0xd8c804a0  ! 426: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x81510000  ! 427: RDPR_TICK	rdpr	%tick, %r0
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 429: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd917c000  ! 430: LDQF_R	-	[%r31, %r0], %f12
splash_tba_78:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 431: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802063  ! 432: WRASI_I	wr	%r0, 0x0063, %asi
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 433: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 434: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8900e80  ! 435: LDUHA_R	lduha	[%r0, %r0] 0x74, %r12
splash_cmpr_79:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182a001  ! 436: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0xd8c00e60  ! 437: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r12
splash_tba_80:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 438: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_81:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 439: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8880e80  ! 440: LDUBA_R	lduba	[%r0, %r0] 0x74, %r12
	.word 0xa1902005  ! 441: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 442: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790215d  ! 443: WRPR_TT_I	wrpr	%r0, 0x015d, %tt
	.word 0xa190200c  ! 444: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902001  ! 445: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x99902002  ! 446: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x879021f7  ! 447: WRPR_TT_I	wrpr	%r0, 0x01f7, %tt
splash_htba_82:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 448: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902000  ! 449: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd8d004a0  ! 450: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	.word 0x2e800001  ! 451: BVS	bvs,a	<label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1864004  ! 452: WR_STICK_REG_R	wr	%r25, %r4, %-
	.word 0x879020c7  ! 453: WRPR_TT_I	wrpr	%r0, 0x00c7, %tt
splash_lsu_84:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 454: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 455: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xb551c000  ! 456: RDPR_TL	rdpr	%tl, %r26
	.word 0x91d02035  ! 457: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_85:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcd14000d  ! 1: LDQF_R	-	[%r16, %r13], %f6
	.word 0x8ba1882c  ! 458: FADDs	fadds	%f6, %f12, %f5
tagged_86:
	tsubcctv %r22, 0x1ca3, %r16
	.word 0xca07e001  ! 459: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x8f540000  ! 460: RDPR_GL	<illegal instruction>
	.word 0xce8fe010  ! 461: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r7
splash_tba_87:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 462: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_88:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 463: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	ta	T_CHANGE_HPRIV	! macro
tagged_89:
	taddcctv %r19, 0x1f3f, %r13
	.word 0xce07e001  ! 465: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xce8008a0  ! 466: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x87802063  ! 467: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xce1fe001  ! 468: LDD_I	ldd	[%r31 + 0x0001], %r7
	.word 0xce27c00c  ! 469: STW_R	stw	%r7, [%r31 + %r12]
	.word 0x99902002  ! 470: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xce5fe001  ! 471: LDX_I	ldx	[%r31 + 0x0001], %r7
	.word 0x87802089  ! 472: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x93902000  ! 473: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982994  ! 474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0994, %hpstate
	.word 0xce07c000  ! 475: LDUW_R	lduw	[%r31 + %r0], %r7
	.word 0xa190200b  ! 476: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xce9fe001  ! 477: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 478: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x91d02034  ! 479: Tcc_I	ta	icc_or_xcc, %r0 + 52
tagged_90:
	tsubcctv %r6, 0x1c2c, %r23
	.word 0xce07e001  ! 480: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xce8008a0  ! 481: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8780204f  ! 482: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xce8008a0  ! 483: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xce5fc000  ! 484: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xce800ac0  ! 485: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r7
splash_lsu_91:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 486: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb181c004  ! 487: WR_STICK_REG_R	wr	%r7, %r4, %-
	.word 0x36700001  ! 488: BPGE	<illegal instruction>
DS_93:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd9104019  ! 1: LDQF_R	-	[%r1, %r25], %f12
	.word 0x95a00826  ! 489: FADDs	fadds	%f0, %f6, %f10
	.word 0x8d802004  ! 490: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902004  ! 491: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd4880e40  ! 492: LDUBA_R	lduba	[%r0, %r0] 0x72, %r10
splash_tba_94:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 493: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_95:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 494: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02033  ! 495: Tcc_I	tne	icc_or_xcc, %r0 + 51
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 496: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd527c006  ! 497: STF_R	st	%f10, [%r6, %r31]
	.word 0xd4800be0  ! 498: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r10
	.word 0xd4800b00  ! 499: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r10
	.word 0x879023c4  ! 500: WRPR_TT_I	wrpr	%r0, 0x03c4, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xd48008a0  ! 502: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_lsu_96:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 503: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_97:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 504: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd48008a0  ! 505: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4d7e000  ! 506: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0x91d02034  ! 507: Tcc_I	ta	icc_or_xcc, %r0 + 52
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 508: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x93d02034  ! 509: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa190200c  ! 510: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902004  ! 511: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_HPRIV	! macro
tagged_98:
	tsubcctv %r6, 0x1512, %r10
	.word 0xd407e001  ! 513: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xa1902007  ! 514: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1902000  ! 515: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x93902003  ! 516: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd4cfe000  ! 517: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
DS_99:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x91b28302  ! 518: ALIGNADDRESS	alignaddr	%r10, %r2, %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 519: LDX_R	ldx	[%r31 + %r0], %r8
splash_tba_100:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 520: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd0800b40  ! 521: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r8
splash_cmpr_101:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1806001  ! 522: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0xd03fc002  ! 523: STD_R	std	%r8, [%r31 + %r2]
splash_tba_102:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 524: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 525: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd00fe001  ! 526: LDUB_I	ldub	[%r31 + 0x0001], %r8
	.word 0xd08008a0  ! 527: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0c804a0  ! 528: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 529: LDX_R	ldx	[%r31 + %r0], %r8
splash_htba_103:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 530: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd017c000  ! 531: LDUH_R	lduh	[%r31 + %r0], %r8
	.word 0x93902003  ! 532: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_104:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 533: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_105:
	taddcctv %r13, 0x1dff, %r20
	.word 0xd007e001  ! 534: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x8d9022f7  ! 535: WRPR_PSTATE_I	wrpr	%r0, 0x02f7, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 536: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa9464000  ! 537: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0x87902233  ! 538: WRPR_TT_I	wrpr	%r0, 0x0233, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 539: LDX_R	ldx	[%r31 + %r0], %r20
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 540: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe81fe001  ! 541: LDD_I	ldd	[%r31 + 0x0001], %r20
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 542: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902005  ! 543: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8790217e  ! 544: WRPR_TT_I	wrpr	%r0, 0x017e, %tt
	.word 0x2c800001  ! 545: BNEG	bneg,a	<label_0x1>
DS_106:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc3302001  ! 1: STQF_I	-	%f1, [0x0001, %r0]
	normalw
	.word 0x8b458000  ! 546: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xcb97e001  ! 547: LDQFA_I	-	[%r31, 0x0001], %f5
tagged_107:
	taddcctv %r21, 0x1807, %r10
	.word 0xca07e001  ! 548: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x87802016  ! 549: WRASI_I	wr	%r0, 0x0016, %asi
DS_108:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xafb6830c  ! 550: ALIGNADDRESS	alignaddr	%r26, %r12, %r23
	.word 0xee8008a0  ! 551: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0xee57c000  ! 552: LDSH_R	ldsh	[%r31 + %r0], %r23
	.word 0xef97e001  ! 553: LDQFA_I	-	[%r31, 0x0001], %f23
DS_109:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 554: SAVE_R	save	%r31, %r0, %r31
splash_htba_110:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 555: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_111:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc910c00a  ! 1: LDQF_R	-	[%r3, %r10], %f4
	.word 0x95a44830  ! 556: FADDs	fadds	%f17, %f16, %f10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89864007  ! 557: WRTICK_R	wr	%r25, %r7, %tick
	.word 0x879022aa  ! 558: WRPR_TT_I	wrpr	%r0, 0x02aa, %tt
	.word 0x91d02035  ! 559: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_113:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd910c002  ! 1: LDQF_R	-	[%r3, %r2], %f12
	.word 0x93a28826  ! 560: FADDs	fadds	%f10, %f6, %f9
	.word 0xd327e001  ! 561: STF_I	st	%f9, [0x0001, %r31]
	.word 0x8d902532  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x0532, %pstate
	.word 0xd2c804a0  ! 563: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0x93494000  ! 564: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0xd2c7e020  ! 565: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r9
	.word 0x8d902d12  ! 566: WRPR_PSTATE_I	wrpr	%r0, 0x0d12, %pstate
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 567: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 568: SIR	sir	0x0001
DS_114:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x0	! illegal
	.word 0xb7a0055b  ! 1: FSQRTd	fsqrt	
	.word 0xb1a0c822  ! 569: FADDs	fadds	%f3, %f2, %f24
	.word 0x83d02034  ! 570: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x93902007  ! 571: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d802000  ! 572: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xf01fc000  ! 573: LDD_R	ldd	[%r31 + %r0], %r24
	.word 0x91d02033  ! 574: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d90264a  ! 575: WRPR_PSTATE_I	wrpr	%r0, 0x064a, %pstate
	.word 0x83464000  ! 576: RD_STICK_CMPR_REG	rd	%-, %r1
	.word 0x24700001  ! 577: BPLE	<illegal instruction>
	.word 0x8d902cb1  ! 578: WRPR_PSTATE_I	wrpr	%r0, 0x0cb1, %pstate
splash_htba_115:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 579: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802004  ! 580: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x30700001  ! 581: BPA	<illegal instruction>
	.word 0x8d9024a5  ! 582: WRPR_PSTATE_I	wrpr	%r0, 0x04a5, %pstate
	.word 0x8d902c4d  ! 583: WRPR_PSTATE_I	wrpr	%r0, 0x0c4d, %pstate
	.word 0xa3500000  ! 584: RDPR_TPC	rdpr	%tpc, %r17
splash_htba_116:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 585: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe28008a0  ! 586: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe2c7e020  ! 587: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r17
	.word 0xe337e001  ! 588: STQF_I	-	%f17, [0x0001, %r31]
	.word 0xe28008a0  ! 589: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_lsu_117:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 590: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe28008a0  ! 591: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_lsu_118:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 592: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2800c20  ! 593: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r17
	.word 0xa190200f  ! 594: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_119:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 595: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_120:
	tsubcctv %r21, 0x1d91, %r10
	.word 0xe207e001  ! 596: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe207c000  ! 597: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0x9b51c000  ! 598: RDPR_TL	rdpr	%tl, %r13
	.word 0xda5fe001  ! 599: LDX_I	ldx	[%r31 + 0x0001], %r13
splash_lsu_121:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 600: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda47c000  ! 601: LDSW_R	ldsw	[%r31 + %r0], %r13
tagged_122:
	tsubcctv %r6, 0x17a2, %r19
	.word 0xda07e001  ! 602: LDUW_I	lduw	[%r31 + 0x0001], %r13
splash_tba_123:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 603: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xdad7e000  ! 604: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 605: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_124:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0x0	! illegal
	.word 0xb1a00548  ! 1: FSQRTd	fsqrt	
	.word 0xaba20831  ! 606: FADDs	fadds	%f8, %f17, %f21
DS_125:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd1328000  ! 1: STQF_R	-	%f8, [%r0, %r10]
	normalw
	.word 0x87458000  ! 607: RD_SOFTINT_REG	rd	%softint, %r3
tagged_126:
	tsubcctv %r26, 0x1cc7, %r13
	.word 0xc607e001  ! 608: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x93902005  ! 609: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902002  ! 610: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xc6c004a0  ! 611: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
splash_cmpr_127:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1836001  ! 612: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x8d9023cc  ! 613: WRPR_PSTATE_I	wrpr	%r0, 0x03cc, %pstate
	.word 0x9f802001  ! 614: SIR	sir	0x0001
	.word 0xc6880e80  ! 615: LDUBA_R	lduba	[%r0, %r0] 0x74, %r3
	.word 0xc69004a0  ! 616: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x91d020b4  ! 617: Tcc_I	ta	icc_or_xcc, %r0 + 180
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 618: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_128:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 619: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc6d7e000  ! 620: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r3
	.word 0xc64fc000  ! 621: LDSB_R	ldsb	[%r31 + %r0], %r3
	.word 0xc6900e40  ! 622: LDUHA_R	lduha	[%r0, %r0] 0x72, %r3
	.word 0xc697e020  ! 623: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r3
	.word 0xc607c000  ! 624: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0xc61fe001  ! 625: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0xc697e020  ! 626: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r3
	.word 0xa3508000  ! 627: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xe29fe001  ! 628: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
	.word 0xa1902009  ! 629: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xe20fe001  ! 630: LDUB_I	ldub	[%r31 + 0x0001], %r17
	.word 0x93d02032  ! 631: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xe207c000  ! 632: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0xa1902008  ! 633: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93902007  ! 634: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe25fe001  ! 635: LDX_I	ldx	[%r31 + 0x0001], %r17
	.word 0x87802088  ! 636: WRASI_I	wr	%r0, 0x0088, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 637: LDX_R	ldx	[%r31 + %r0], %r17
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 638: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0xe337e001  ! 639: STQF_I	-	%f17, [0x0001, %r31]
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 640: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_129:
	taddcctv %r9, 0x141f, %r2
	.word 0xe207e001  ! 641: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x98c42001  ! 642: ADDCcc_I	addccc 	%r16, 0x0001, %r12
	.word 0x87902309  ! 643: WRPR_TT_I	wrpr	%r0, 0x0309, %tt
	.word 0xd8d7e000  ! 644: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
	.word 0xd81fc000  ! 645: LDD_R	ldd	[%r31 + %r0], %r12
DS_130:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 646: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d902751  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x0751, %pstate
tagged_131:
	taddcctv %r3, 0x13c5, %r16
	.word 0xd807e001  ! 648: LDUW_I	lduw	[%r31 + 0x0001], %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 649: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x99902004  ! 650: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
DS_132:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x99b00301  ! 651: ALIGNADDRESS	alignaddr	%r0, %r1, %r12
	.word 0x87802020  ! 652: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xd8c00e80  ! 653: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r12
	.word 0x8d902502  ! 654: WRPR_PSTATE_I	wrpr	%r0, 0x0502, %pstate
tagged_133:
	taddcctv %r22, 0x1f16, %r15
	.word 0xd807e001  ! 655: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd81fc000  ! 656: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0x87802055  ! 657: WRASI_I	wr	%r0, 0x0055, %asi
	ta	T_CHANGE_HPRIV	! macro
tagged_134:
	tsubcctv %r14, 0x14ab, %r3
	.word 0xd807e001  ! 659: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd89004a0  ! 660: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
DS_135:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xb7a0055b  ! 1: FSQRTd	fsqrt	
	.word 0x85a30831  ! 661: FADDs	fadds	%f12, %f17, %f2
splash_lsu_136:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 662: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 663: LDX_R	ldx	[%r31 + %r0], %r2
splash_tba_137:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 664: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc49fe001  ! 665: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	.word 0x87802089  ! 666: WRASI_I	wr	%r0, 0x0089, %asi
splash_lsu_138:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 667: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_139:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f4, %f26, %f28
	.word 0x91b58301  ! 668: ALIGNADDRESS	alignaddr	%r22, %r1, %r8
	ta	T_CHANGE_PRIV	! macro
	.word 0xd137c001  ! 670: STQF_R	-	%f8, [%r1, %r31]
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 671: LDX_R	ldx	[%r31 + %r0], %r8
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 672: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd0d7e020  ! 673: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 674: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x99902001  ! 675: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xa9514000  ! 676: RDPR_TBA	rdpr	%tba, %r20
	.word 0x879021e8  ! 677: WRPR_TT_I	wrpr	%r0, 0x01e8, %tt
	.word 0x8d802000  ! 678: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902001  ! 679: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe89fc020  ! 680: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x8d802000  ! 681: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 682: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1902009  ! 684: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_htba_140:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 685: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_141:
	taddcctv %r6, 0x132b, %r21
	.word 0xe807e001  ! 686: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xe8880e80  ! 687: LDUBA_R	lduba	[%r0, %r0] 0x74, %r20
	ta	T_CHANGE_HPRIV	! macro
	.word 0x28800001  ! 689: BLEU	bleu,a	<label_0x1>
	.word 0xe88804a0  ! 690: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
	.word 0xa190200d  ! 691: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_tba_142:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 692: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe8800ae0  ! 693: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r20
splash_lsu_143:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 694: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8800a80  ! 695: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r20
splash_tba_144:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 696: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe8c7e020  ! 697: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r20
splash_cmpr_145:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180e001  ! 698: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 699: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe807c000  ! 700: LDUW_R	lduw	[%r31 + %r0], %r20
tagged_146:
	tsubcctv %r7, 0x11d0, %r6
	.word 0xe807e001  ! 701: LDUW_I	lduw	[%r31 + 0x0001], %r20
tagged_147:
	taddcctv %r4, 0x1cae, %r25
	.word 0xe807e001  ! 702: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x87802014  ! 703: WRASI_I	wr	%r0, 0x0014, %asi
splash_lsu_148:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 704: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902490  ! 705: WRPR_PSTATE_I	wrpr	%r0, 0x0490, %pstate
	.word 0xe8c00e40  ! 706: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r20
	.word 0xa1902007  ! 707: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 708: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 709: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x93902003  ! 710: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xaf464000  ! 711: RD_STICK_CMPR_REG	rd	%-, %r23
	.word 0x87802063  ! 712: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xee9fc020  ! 713: LDDA_R	ldda	[%r31, %r0] 0x01, %r23
	.word 0x91d020b5  ! 714: Tcc_I	ta	icc_or_xcc, %r0 + 181
tagged_149:
	taddcctv %r3, 0x15ac, %r20
	.word 0xee07e001  ! 715: LDUW_I	lduw	[%r31 + 0x0001], %r23
	.word 0x28700001  ! 716: BPLEU	<illegal instruction>
	.word 0xee4fc000  ! 717: LDSB_R	ldsb	[%r31 + %r0], %r23
	.word 0xa1902008  ! 718: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xee8fe000  ! 719: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r23
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 721: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_150:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 722: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_151:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 723: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xee57e001  ! 724: LDSH_I	ldsh	[%r31 + 0x0001], %r23
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xee5fc000  ! 725: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0x87802058  ! 726: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xeec004a0  ! 727: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r23
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d9020cb  ! 729: WRPR_PSTATE_I	wrpr	%r0, 0x00cb, %pstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8985000d  ! 730: WRTICK_R	wr	%r20, %r13, %tick
	.word 0x36700001  ! 731: BPGE	<illegal instruction>
	.word 0xeebfc02d  ! 732: STDA_R	stda	%r23, [%r31 + %r13] 0x01
	.word 0xee8fe020  ! 733: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r23
	.word 0x93902007  ! 734: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x879023d6  ! 735: WRPR_TT_I	wrpr	%r0, 0x03d6, %tt
splash_htba_153:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 736: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x3c700001  ! 737: BPPOS	<illegal instruction>
splash_lsu_154:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 738: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790226b  ! 739: WRPR_TT_I	wrpr	%r0, 0x026b, %tt
	.word 0xee9004a0  ! 740: LDUHA_R	lduha	[%r0, %r0] 0x25, %r23
	.word 0x87802016  ! 741: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x91d02032  ! 742: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902005  ! 743: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d02035  ! 744: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x24800001  ! 745: BLE	ble,a	<label_0x1>
	.word 0xeedfe020  ! 746: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r23
splash_lsu_155:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 747: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902e1c  ! 748: WRPR_PSTATE_I	wrpr	%r0, 0x0e1c, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90276f  ! 750: WRPR_PSTATE_I	wrpr	%r0, 0x076f, %pstate
	.word 0xab45c000  ! 751: RD_TICK_CMPR_REG	rd	%-, %r21
	.word 0x879022ab  ! 752: WRPR_TT_I	wrpr	%r0, 0x02ab, %tt
	.word 0x8d902843  ! 753: WRPR_PSTATE_I	wrpr	%r0, 0x0843, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x87902153  ! 755: WRPR_TT_I	wrpr	%r0, 0x0153, %tt
	.word 0x91d020b2  ! 756: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xea9fe001  ! 757: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r21
	.word 0x93902001  ! 758: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802055  ! 759: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xa1902005  ! 760: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xea07c000  ! 761: LDUW_R	lduw	[%r31 + %r0], %r21
	.word 0xeadfe020  ! 762: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r21
	.word 0xea17c000  ! 763: LDUH_R	lduh	[%r31 + %r0], %r21
	.word 0x91d02032  ! 764: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b6ee001  ! 765: SDIVX_I	sdivx	%r27, 0x0001, %r13
	.word 0xa1902007  ! 766: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d902e93  ! 767: WRPR_PSTATE_I	wrpr	%r0, 0x0e93, %pstate
	.word 0x81500000  ! 768: RDPR_TPC	rdpr	%tpc, %r0
	.word 0xc0d7e010  ! 769: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r0
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 770: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x99902003  ! 771: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc0c804a0  ! 773: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0x83d020b2  ! 774: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x87802016  ! 775: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc01fe001  ! 776: LDD_I	ldd	[%r31 + 0x0001], %r0
	.word 0xc057e001  ! 777: LDSH_I	ldsh	[%r31 + 0x0001], %r0
	.word 0x9f802001  ! 778: SIR	sir	0x0001
	.word 0xa1902008  ! 779: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_lsu_157:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 780: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_158:
	tsubcctv %r22, 0x1d82, %r4
	.word 0xc007e001  ! 781: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xc08008a0  ! 782: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc00fc000  ! 783: LDUB_R	ldub	[%r31 + %r0], %r0
	.word 0x87802080  ! 784: WRASI_I	wr	%r0, 0x0080, %asi
splash_htba_159:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 785: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_PRIV	! macro
DS_160:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0x0	! illegal
	.word 0xc916c00d  ! 1: LDQF_R	-	[%r27, %r13], %f4
	.word 0x97a1483a  ! 787: FADDs	fadds	%f5, %f26, %f11
	.word 0xd657c000  ! 788: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0x99902004  ! 789: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_lsu_161:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 790: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 791: BPNEG	<illegal instruction>
	.word 0xd657e001  ! 792: LDSH_I	ldsh	[%r31 + 0x0001], %r11
	.word 0xd68804a0  ! 793: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0x2e800001  ! 794: BVS	bvs,a	<label_0x1>
splash_tba_162:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 795: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802000  ! 796: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902d58  ! 797: WRPR_PSTATE_I	wrpr	%r0, 0x0d58, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd65fc000  ! 798: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902001  ! 799: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902a6e  ! 800: WRPR_PSTATE_I	wrpr	%r0, 0x0a6e, %pstate
	.word 0xa190200f  ! 801: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd797e001  ! 802: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0x93902004  ! 803: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 804: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 806: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd60fc000  ! 807: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x879023dc  ! 808: WRPR_TT_I	wrpr	%r0, 0x03dc, %tt
	.word 0xd65fe001  ! 809: LDX_I	ldx	[%r31 + 0x0001], %r11
DS_163:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 810: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xd68008a0  ! 811: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd64fe001  ! 812: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	ta	T_CHANGE_PRIV	! macro
splash_tba_164:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 814: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd6c804a0  ! 815: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	.word 0x93902005  ! 816: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_tba_165:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 817: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_166:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 818: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 819: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 820: SIR	sir	0x0001
	.word 0x91d02035  ! 821: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902007  ! 822: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_167:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xdb36a001  ! 1: STQF_I	-	%f13, [0x0001, %r26]
	normalw
	.word 0x9b458000  ! 823: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x22700001  ! 824: BPE	<illegal instruction>
splash_lsu_168:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 825: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 826: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda9fc020  ! 827: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
tagged_169:
	taddcctv %r2, 0x12f8, %r10
	.word 0xda07e001  ! 828: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda880e80  ! 829: LDUBA_R	lduba	[%r0, %r0] 0x74, %r13
	.word 0xdac804a0  ! 830: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x81510000  ! 831: RDPR_TICK	rdpr	%tick, %r0
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 832: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 833: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xda8fe030  ! 834: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0x87802063  ! 835: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xda1fe001  ! 836: LDD_I	ldd	[%r31 + 0x0001], %r13
DS_170:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 837: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902858  ! 838: WRPR_PSTATE_I	wrpr	%r0, 0x0858, %pstate
	.word 0xda9fc020  ! 839: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	.word 0xda8008a0  ! 840: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
DS_171:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 841: SAVE_R	save	%r31, %r0, %r31
	.word 0x34800001  ! 842: BG	bg,a	<label_0x1>
	.word 0xda77c01a  ! 843: STX_R	stx	%r13, [%r31 + %r26]
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 844: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902308  ! 845: WRPR_TT_I	wrpr	%r0, 0x0308, %tt
splash_lsu_172:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 846: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902123  ! 847: WRPR_TT_I	wrpr	%r0, 0x0123, %tt
	.word 0xdb17c000  ! 848: LDQF_R	-	[%r31, %r0], %f13
	.word 0x87802010  ! 849: WRASI_I	wr	%r0, 0x0010, %asi
splash_lsu_173:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 850: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 851: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa1902001  ! 852: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xda8008a0  ! 853: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x81982f55  ! 854: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f55, %hpstate
	.word 0xdac804a0  ! 855: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
tagged_174:
	tsubcctv %r1, 0x1c79, %r3
	.word 0xda07e001  ! 856: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda0fc000  ! 857: LDUB_R	ldub	[%r31 + %r0], %r13
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 858: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xdad7e010  ! 859: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	.word 0x879021c6  ! 860: WRPR_TT_I	wrpr	%r0, 0x01c6, %tt
	.word 0x87802055  ! 861: WRASI_I	wr	%r0, 0x0055, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0xdad004a0  ! 863: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 864: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b2  ! 865: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xda8008a0  ! 866: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
DS_175:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f30, %f8, %f24
	.word 0x8db24317  ! 867: ALIGNADDRESS	alignaddr	%r9, %r23, %r6
	.word 0xcc5fe001  ! 868: LDX_I	ldx	[%r31 + 0x0001], %r6
	.word 0xccdfe020  ! 869: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
DS_176:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc7340002  ! 1: STQF_R	-	%f3, [%r2, %r16]
	normalw
	.word 0x95458000  ! 870: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd48008a0  ! 871: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
splash_tba_177:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 872: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_178:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 873: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02032  ! 874: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd44fc000  ! 875: LDSB_R	ldsb	[%r31 + %r0], %r10
	.word 0x9b45c000  ! 876: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xda8fe020  ! 877: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r13
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 878: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 879: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa1902003  ! 880: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_179:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f12, %f24, %f16
	.word 0xa1b10307  ! 881: ALIGNADDRESS	alignaddr	%r4, %r7, %r16
	.word 0xaf464000  ! 882: RD_STICK_CMPR_REG	rd	%-, %r23
tagged_180:
	tsubcctv %r15, 0x14bb, %r8
	.word 0xee07e001  ! 883: LDUW_I	lduw	[%r31 + 0x0001], %r23
	.word 0xee8008a0  ! 884: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
splash_tba_181:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 885: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879021b4  ! 886: WRPR_TT_I	wrpr	%r0, 0x01b4, %tt
	.word 0xa1902001  ! 887: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xee97e030  ! 888: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r23
	.word 0xef97e001  ! 889: LDQFA_I	-	[%r31, 0x0001], %f23
	.word 0xee17e001  ! 890: LDUH_I	lduh	[%r31 + 0x0001], %r23
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 891: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902172  ! 892: WRPR_TT_I	wrpr	%r0, 0x0172, %tt
	.word 0xee47c000  ! 893: LDSW_R	ldsw	[%r31 + %r0], %r23
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36a2001  ! 894: SDIVX_I	sdivx	%r8, 0x0001, %r17
	.word 0x91d02034  ! 895: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x879022b8  ! 896: WRPR_TT_I	wrpr	%r0, 0x02b8, %tt
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 897: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_183:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcd118012  ! 1: LDQF_R	-	[%r6, %r18], %f6
	.word 0xb3a10821  ! 898: FADDs	fadds	%f4, %f1, %f25
tagged_184:
	tsubcctv %r1, 0x1a36, %r3
	.word 0xf207e001  ! 899: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0x87802016  ! 900: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xf2dfe020  ! 901: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r25
	.word 0x8d9028bc  ! 902: WRPR_PSTATE_I	wrpr	%r0, 0x08bc, %pstate
	.word 0x83d02034  ! 903: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xf257c000  ! 904: LDSH_R	ldsh	[%r31 + %r0], %r25
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf25fc000  ! 905: LDX_R	ldx	[%r31 + %r0], %r25
	.word 0x93902007  ! 906: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x804a4000  ! 907: MULX_R	mulx 	%r9, %r0, %r0
	.word 0xc01fe001  ! 908: LDD_I	ldd	[%r31 + 0x0001], %r0
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc05fc000  ! 909: LDX_R	ldx	[%r31 + %r0], %r0
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc05fc000  ! 910: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc08804a0  ! 911: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x91d02035  ! 912: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_185:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 913: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02033  ! 915: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902004  ! 916: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d90263a  ! 917: WRPR_PSTATE_I	wrpr	%r0, 0x063a, %pstate
DS_186:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 918: RESTORE_R	restore	%r31, %r0, %r31
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 919: LDX_R	ldx	[%r31 + %r0], %r0
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 920: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_187:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f10, %f20
	.word 0xa9b40313  ! 921: ALIGNADDRESS	alignaddr	%r16, %r19, %r20
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902002  ! 923: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_188:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f6, %f22, %f0
	.word 0xb3b10308  ! 924: ALIGNADDRESS	alignaddr	%r4, %r8, %r25
	.word 0xf2800b20  ! 925: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r25
splash_lsu_189:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 926: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf25fc000  ! 927: LDX_R	ldx	[%r31 + %r0], %r25
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xaf6ca001  ! 928: SDIVX_I	sdivx	%r18, 0x0001, %r23
	.word 0x2e700001  ! 929: BPVS	<illegal instruction>
	.word 0xee17e001  ! 930: LDUH_I	lduh	[%r31 + 0x0001], %r23
	.word 0x81510000  ! 931: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d902ccb  ! 932: WRPR_PSTATE_I	wrpr	%r0, 0x0ccb, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xee5fc000  ! 933: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0x87902264  ! 934: WRPR_TT_I	wrpr	%r0, 0x0264, %tt
	.word 0x879023d8  ! 935: WRPR_TT_I	wrpr	%r0, 0x03d8, %tt
	.word 0xee4fe001  ! 936: LDSB_I	ldsb	[%r31 + 0x0001], %r23
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 937: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902617  ! 938: WRPR_PSTATE_I	wrpr	%r0, 0x0617, %pstate
	.word 0xee17e001  ! 939: LDUH_I	lduh	[%r31 + 0x0001], %r23
	.word 0x3c700001  ! 940: BPPOS	<illegal instruction>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 941: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902e65  ! 942: WRPR_PSTATE_I	wrpr	%r0, 0x0e65, %pstate
splash_cmpr_191:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181e001  ! 943: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0x2e800001  ! 944: BVS	bvs,a	<label_0x1>
splash_tba_192:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 945: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x30700001  ! 946: BPA	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_193:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 948: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa1902002  ! 949: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8790230a  ! 950: WRPR_TT_I	wrpr	%r0, 0x030a, %tt
	.word 0x93d02035  ! 951: Tcc_I	tne	icc_or_xcc, %r0 + 53
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 952: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95494000  ! 953: RDHPR_HTBA	rdhpr	%htba, %r10
	.word 0x9b494000  ! 954: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0xda9004a0  ! 955: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
DS_194:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 956: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02034  ! 957: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87902261  ! 958: WRPR_TT_I	wrpr	%r0, 0x0261, %tt
splash_lsu_195:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 959: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xdad7e000  ! 960: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	.word 0x8d902766  ! 961: WRPR_PSTATE_I	wrpr	%r0, 0x0766, %pstate
	.word 0xda8fe020  ! 962: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r13
	.word 0x91d020b3  ! 963: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xda8008a0  ! 964: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
DS_196:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x0	! illegal
	.word 0xd916c004  ! 1: LDQF_R	-	[%r27, %r4], %f12
	.word 0x9ba1482c  ! 965: FADDs	fadds	%f5, %f12, %f13
splash_cmpr_197:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1806001  ! 966: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0xda9004a0  ! 967: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
splash_lsu_198:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_199:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf3332001  ! 1: STQF_I	-	%f25, [0x0001, %r12]
	normalw
	.word 0x95458000  ! 969: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x2a700001  ! 970: BPCS	<illegal instruction>
splash_tba_200:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 971: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902007  ! 972: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1902000  ! 973: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87802088  ! 974: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802020  ! 975: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xd53fe001  ! 976: STDF_I	std	%f10, [0x0001, %r31]
	.word 0x9b6a800d  ! 977: SDIVX_R	sdivx	%r10, %r13, %r13
	.word 0xda17e001  ! 978: LDUH_I	lduh	[%r31 + 0x0001], %r13
	.word 0xdac7e000  ! 979: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r13
	.word 0x93902006  ! 980: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xdad80e40  ! 981: LDXA_R	ldxa	[%r0, %r0] 0x72, %r13
	.word 0xda800b20  ! 982: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r13
	.word 0xda8fe030  ! 983: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0x87540000  ! 984: RDPR_GL	rdpr	%-, %r3
splash_lsu_201:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 985: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902733  ! 986: WRPR_PSTATE_I	wrpr	%r0, 0x0733, %pstate
tagged_202:
	tsubcctv %r25, 0x1e5e, %r19
	.word 0xc607e001  ! 987: LDUW_I	lduw	[%r31 + 0x0001], %r3
DS_203:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 988: SAVE_R	save	%r31, %r0, %r31
	.word 0xc60fc000  ! 989: LDUB_R	ldub	[%r31 + %r0], %r3
	.word 0x8198288c  ! 990: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088c, %hpstate
	.word 0xc69fe001  ! 991: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
	.word 0xc697e010  ! 992: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r3
	.word 0x93902007  ! 993: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc6d7e000  ! 994: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r3
	.word 0xc6d7e030  ! 995: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r3
	.word 0x93902003  ! 996: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc727c00d  ! 997: STF_R	st	%f3, [%r13, %r31]
	.word 0xc727e001  ! 998: STF_I	st	%f3, [0x0001, %r31]
	.word 0x8d9021af  ! 999: WRPR_PSTATE_I	wrpr	%r0, 0x01af, %pstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8fa01965  ! 1000: FqTOd	dis not found

DS_205:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f14, %f26, %f28
	.word 0x99b5431a  ! 1001: ALIGNADDRESS	alignaddr	%r21, %r26, %r12
	.word 0x9f802001  ! 1002: SIR	sir	0x0001
	.word 0xd8d004a0  ! 1003: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
splash_tba_206:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1004: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1005: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1006: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_htba_207:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1007: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x99902004  ! 1008: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
tagged_208:
	tsubcctv %r1, 0x1d7b, %r24
	.word 0xd807e001  ! 1009: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x87902286  ! 1010: WRPR_TT_I	wrpr	%r0, 0x0286, %tt
	.word 0x87802089  ! 1011: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x91d02032  ! 1012: Tcc_I	ta	icc_or_xcc, %r0 + 50
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd85fc000  ! 1013: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x93902006  ! 1014: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 1015: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8780201c  ! 1016: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd837e001  ! 1017: STH_I	sth	%r12, [%r31 + 0x0001]
	.word 0xd997e001  ! 1018: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0xa190200d  ! 1019: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x83480000  ! 1020: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0xc2c004a0  ! 1021: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0xa1902005  ! 1022: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa1902007  ! 1023: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x879023fe  ! 1024: WRPR_TT_I	wrpr	%r0, 0x03fe, %tt
	.word 0x8d902292  ! 1025: WRPR_PSTATE_I	wrpr	%r0, 0x0292, %pstate
tagged_209:
	taddcctv %r16, 0x106e, %r14
	.word 0xc207e001  ! 1026: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x93902006  ! 1027: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_htba_210:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1028: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc25fe001  ! 1029: LDX_I	ldx	[%r31 + 0x0001], %r1
DS_211:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f16, %f20, %f22
	.word 0x95b00303  ! 1030: ALIGNADDRESS	alignaddr	%r0, %r3, %r10
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1031: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd597e001  ! 1032: LDQFA_I	-	[%r31, 0x0001], %f10
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1033: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8d902337  ! 1034: WRPR_PSTATE_I	wrpr	%r0, 0x0337, %pstate
	.word 0xd4d804a0  ! 1035: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
splash_lsu_212:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1036: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1037: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x9b494000  ! 1039: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0xda8008a0  ! 1040: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda9fe001  ! 1041: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
splash_htba_213:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1042: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xdacfe010  ! 1043: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r13
	.word 0xda1fc000  ! 1044: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x87802080  ! 1045: WRASI_I	wr	%r0, 0x0080, %asi
splash_tba_214:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1046: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_215:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1047: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1048: LDX_R	ldx	[%r31 + %r0], %r13
change_to_randtl_216:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1049: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xda8008a0  ! 1050: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xdac804a0  ! 1051: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1052: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdac004a0  ! 1053: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0xdacfe030  ! 1054: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xda5fc000  ! 1055: LDX_R	ldx	[%r31 + %r0], %r13
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1056: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3c700001  ! 1057: BPPOS	<illegal instruction>
	.word 0x24700001  ! 1058: BPLE	<illegal instruction>
	.word 0x26700001  ! 1059: BPL	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
tagged_217:
	taddcctv %r9, 0x1e4c, %r2
	.word 0xda07e001  ! 1061: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x879022b5  ! 1062: WRPR_TT_I	wrpr	%r0, 0x02b5, %tt
	.word 0xda9fe001  ! 1063: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xda17e001  ! 1064: LDUH_I	lduh	[%r31 + 0x0001], %r13
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1065: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 1066: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87902060  ! 1067: WRPR_TT_I	wrpr	%r0, 0x0060, %tt
	.word 0x8d902dcc  ! 1068: WRPR_PSTATE_I	wrpr	%r0, 0x0dcc, %pstate
	.word 0xa190200d  ! 1069: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xda8008a0  ! 1070: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x93902004  ! 1071: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x879023fd  ! 1072: WRPR_TT_I	wrpr	%r0, 0x03fd, %tt
	.word 0xda57c000  ! 1073: LDSH_R	ldsh	[%r31 + %r0], %r13
splash_tba_218:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1074: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200a  ! 1075: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d90200a  ! 1076: WRPR_PSTATE_I	wrpr	%r0, 0x000a, %pstate
	.word 0x87802004  ! 1077: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902003  ! 1078: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902004  ! 1079: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_219:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1080: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
tagged_220:
	tsubcctv %r4, 0x1b44, %r15
	.word 0xda07e001  ! 1081: LDUW_I	lduw	[%r31 + 0x0001], %r13
change_to_randtl_221:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1082: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1083: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x81982b17  ! 1084: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b17, %hpstate
splash_cmpr_222:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180e001  ! 1085: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0xda57c000  ! 1087: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x93902000  ! 1088: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1090: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdac004a0  ! 1091: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	ta	T_CHANGE_PRIV	! macro
splash_htba_223:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1093: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d90248f  ! 1094: WRPR_PSTATE_I	wrpr	%r0, 0x048f, %pstate
	.word 0xdac804a0  ! 1095: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0xa190200a  ! 1096: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_tba_224:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1097: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xda1fe001  ! 1098: LDD_I	ldd	[%r31 + 0x0001], %r13
tagged_225:
	taddcctv %r4, 0x17a5, %r22
	.word 0xda07e001  ! 1099: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x99902004  ! 1100: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xda0fe001  ! 1101: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0xda9004a0  ! 1102: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
tagged_226:
	tsubcctv %r6, 0x1bc0, %r12
	.word 0xda07e001  ! 1103: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda8008a0  ! 1104: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xa1902003  ! 1105: WRPR_GL_I	wrpr	%r0, 0x0003, %-
change_to_randtl_227:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1106: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x87902257  ! 1107: WRPR_TT_I	wrpr	%r0, 0x0257, %tt
	.word 0x8790209a  ! 1108: WRPR_TT_I	wrpr	%r0, 0x009a, %tt
	.word 0xda47c000  ! 1109: LDSW_R	ldsw	[%r31 + %r0], %r13
DS_228:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1110: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xda800c80  ! 1111: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r13
tagged_229:
	taddcctv %r12, 0x168e, %r2
	.word 0xda07e001  ! 1112: LDUW_I	lduw	[%r31 + 0x0001], %r13
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_230:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1114: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xda07c000  ! 1115: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0x87802004  ! 1116: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xda8008a0  ! 1117: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0xdad7e020  ! 1119: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	.word 0x8780204f  ! 1120: WRASI_I	wr	%r0, 0x004f, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902386  ! 1122: WRPR_TT_I	wrpr	%r0, 0x0386, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1123: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda47c000  ! 1124: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0xda8008a0  ! 1125: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x91d020b2  ! 1126: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8d902a39  ! 1127: WRPR_PSTATE_I	wrpr	%r0, 0x0a39, %pstate
tagged_231:
	taddcctv %r20, 0x1f54, %r17
	.word 0xda07e001  ! 1128: LDUW_I	lduw	[%r31 + 0x0001], %r13
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1129: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda4fc000  ! 1130: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0xdad804a0  ! 1131: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902000  ! 1133: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_232:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1134: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1135: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad004a0  ! 1136: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0x26700001  ! 1137: BPL	<illegal instruction>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1138: LDX_R	ldx	[%r31 + %r0], %r13
splash_tba_233:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1139: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_234:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1140: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1141: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x20800001  ! 1142: BN	bn,a	<label_0x1>
change_to_randtl_235:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1143: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
tagged_236:
	tsubcctv %r20, 0x1edb, %r2
	.word 0xda07e001  ! 1144: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda8fe000  ! 1145: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r13
DS_237:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1146: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
splash_lsu_238:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1147: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 1148: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa1902006  ! 1149: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa1902008  ! 1150: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x2e800001  ! 1151: BVS	bvs,a	<label_0x1>
	.word 0xa190200f  ! 1152: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_239:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1153: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x30700001  ! 1154: BPA	<illegal instruction>
DS_240:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1155: RESTORE_R	restore	%r31, %r0, %r31
tagged_241:
	taddcctv %r22, 0x1131, %r24
	.word 0xda07e001  ! 1156: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdadfe020  ! 1157: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
	.word 0xda0fe001  ! 1158: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0xda8008a0  ! 1159: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xa1902006  ! 1160: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8790217d  ! 1161: WRPR_TT_I	wrpr	%r0, 0x017d, %tt
	.word 0xda9fe001  ! 1162: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xdadfe030  ! 1163: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x9f802001  ! 1164: SIR	sir	0x0001
	.word 0xda9fe001  ! 1165: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0x83508000  ! 1166: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0xc21fc000  ! 1167: LDD_R	ldd	[%r31 + %r0], %r1
tagged_242:
	tsubcctv %r9, 0x1b25, %r25
	.word 0xc207e001  ! 1168: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc2c7e000  ! 1169: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r1
	.word 0x8790212c  ! 1170: WRPR_TT_I	wrpr	%r0, 0x012c, %tt
splash_tba_243:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1171: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x89a089c5  ! 1172: FDIVd	fdivd	%f2, %f36, %f4
	.word 0x8780204f  ! 1173: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8790236e  ! 1174: WRPR_TT_I	wrpr	%r0, 0x036e, %tt
splash_lsu_244:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1175: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x94fb0000  ! 1176: SDIVcc_R	sdivcc 	%r12, %r0, %r10
	.word 0xd49fc020  ! 1177: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0x81510000  ! 1178: RDPR_TICK	rdpr	%tick, %r0
	.word 0xb5508000  ! 1179: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xf44fc000  ! 1180: LDSB_R	ldsb	[%r31 + %r0], %r26
splash_lsu_245:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1181: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf4800aa0  ! 1182: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r26
DS_246:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x8fb2030d  ! 1183: ALIGNADDRESS	alignaddr	%r8, %r13, %r7
	.word 0x81460000  ! 1184: RD_STICK_REG	stbar
DS_247:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1185: SAVE_R	save	%r31, %r0, %r31
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 1186: LDX_R	ldx	[%r31 + %r0], %r7
tagged_248:
	tsubcctv %r18, 0x1d82, %r20
	.word 0xce07e001  ! 1187: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x91d02032  ! 1188: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8790222e  ! 1189: WRPR_TT_I	wrpr	%r0, 0x022e, %tt
splash_tba_249:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1190: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802010  ! 1191: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xcec7e020  ! 1192: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r7
DS_250:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1193: SAVE_R	save	%r31, %r0, %r31
	.word 0xced804a0  ! 1194: LDXA_R	ldxa	[%r0, %r0] 0x25, %r7
splash_tba_251:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1195: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_252:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1196: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790209f  ! 1197: WRPR_TT_I	wrpr	%r0, 0x009f, %tt
	.word 0xce47c000  ! 1198: LDSW_R	ldsw	[%r31 + %r0], %r7
splash_lsu_253:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1199: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce0fc000  ! 1200: LDUB_R	ldub	[%r31 + %r0], %r7
tagged_254:
	tsubcctv %r12, 0x138f, %r21
	.word 0xce07e001  ! 1201: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xce57e001  ! 1202: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0x8d902d6b  ! 1203: WRPR_PSTATE_I	wrpr	%r0, 0x0d6b, %pstate
	.word 0x87802010  ! 1204: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87802020  ! 1205: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x91d02033  ! 1206: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_htba_255:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1207: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_256:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1208: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83508000  ! 1209: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x93902007  ! 1210: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8780204f  ! 1211: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8d802004  ! 1212: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc28008a0  ! 1213: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x24800001  ! 1214: BLE	ble,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d02035  ! 1216: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x87902204  ! 1217: WRPR_TT_I	wrpr	%r0, 0x0204, %tt
splash_tba_257:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1218: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc28fe010  ! 1219: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r1
	.word 0x2e700001  ! 1220: BPVS	<illegal instruction>
splash_tba_258:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1221: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc2d00e60  ! 1222: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r1
	.word 0xc20fe001  ! 1223: LDUB_I	ldub	[%r31 + 0x0001], %r1
	.word 0xa1902000  ! 1224: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87802058  ! 1225: WRASI_I	wr	%r0, 0x0058, %asi
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1226: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 1227: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902002  ! 1228: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa151c000  ! 1229: RDPR_TL	rdpr	%tl, %r16
splash_lsu_259:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02033  ! 1231: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x87802004  ! 1232: WRASI_I	wr	%r0, 0x0004, %asi
DS_260:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1233: RESTORE_R	restore	%r31, %r0, %r31
DS_261:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1234: SAVE_R	save	%r31, %r0, %r31
	.word 0xe02fe001  ! 1235: STB_I	stb	%r16, [%r31 + 0x0001]
change_to_randtl_262:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1236: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1902001  ! 1237: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xe0800c60  ! 1238: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r16
tagged_263:
	taddcctv %r10, 0x1e25, %r12
	.word 0xe007e001  ! 1239: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe01fc000  ! 1240: LDD_R	ldd	[%r31 + %r0], %r16
DS_264:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0x0	! illegal
	.word 0x85a0054d  ! 1: FSQRTd	fsqrt	
	.word 0x91a0c82d  ! 1241: FADDs	fadds	%f3, %f13, %f8
	.word 0xd0800c60  ! 1242: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r8
	.word 0xd007c000  ! 1243: LDUW_R	lduw	[%r31 + %r0], %r8
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1244: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_265:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1245: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd0800ae0  ! 1246: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r8
	.word 0x99902001  ! 1247: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x9751c000  ! 1248: RDPR_TL	rdpr	%tl, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0xd617c000  ! 1250: LDUH_R	lduh	[%r31 + %r0], %r11
	.word 0x93902007  ! 1251: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd657e001  ! 1252: LDSH_I	ldsh	[%r31 + 0x0001], %r11
	.word 0xb3500000  ! 1253: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xf247e001  ! 1254: LDSW_I	ldsw	[%r31 + 0x0001], %r25
	.word 0x8780201c  ! 1255: WRASI_I	wr	%r0, 0x001c, %asi
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1256: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_266:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1257: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xf20fe001  ! 1258: LDUB_I	ldub	[%r31 + 0x0001], %r25
	.word 0xad514000  ! 1259: RDPR_TBA	rdpr	%tba, %r22
	.word 0xecd00e80  ! 1260: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r22
	.word 0xec9fc020  ! 1261: LDDA_R	ldda	[%r31, %r0] 0x01, %r22
	.word 0xec8008a0  ! 1262: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0xecc004a0  ! 1263: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r22
	.word 0x3c800001  ! 1264: BPOS	bpos,a	<label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xec5fc000  ! 1265: LDX_R	ldx	[%r31 + %r0], %r22
	.word 0x93902001  ! 1266: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_267:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1267: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8d802000  ! 1268: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200f  ! 1269: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x93902006  ! 1270: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8780201c  ! 1271: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x91d02034  ! 1272: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xec9fe001  ! 1273: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r22
	.word 0xecd80e40  ! 1274: LDXA_R	ldxa	[%r0, %r0] 0x72, %r22
tagged_268:
	tsubcctv %r11, 0x1fb4, %r15
	.word 0xec07e001  ! 1275: LDUW_I	lduw	[%r31 + 0x0001], %r22
tagged_269:
	taddcctv %r20, 0x1463, %r16
	.word 0xec07e001  ! 1276: LDUW_I	lduw	[%r31 + 0x0001], %r22
DS_270:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0x0	! illegal
	.word 0xd3150005  ! 1: LDQF_R	-	[%r20, %r5], %f9
	.word 0xa3a0c82a  ! 1277: FADDs	fadds	%f3, %f10, %f17
DS_271:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f20, %f2, %f22
	.word 0x89b48307  ! 1278: ALIGNADDRESS	alignaddr	%r18, %r7, %r4
tagged_272:
	tsubcctv %r14, 0x172e, %r20
	.word 0xc807e001  ! 1279: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc88008a0  ! 1280: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc81fc000  ! 1281: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1808012  ! 1282: WR_STICK_REG_R	wr	%r2, %r18, %-
DS_274:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f30, %f16, %f20
	.word 0x89b50305  ! 1283: ALIGNADDRESS	alignaddr	%r20, %r5, %r4
	.word 0xc8d7e000  ! 1284: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r4
	.word 0x81510000  ! 1285: RDPR_TICK	<illegal instruction>
	.word 0x91d02032  ! 1286: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02034  ! 1287: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_275:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1288: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_276:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1289: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc8800c20  ! 1290: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r4
	.word 0x81982084  ! 1291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0084, %hpstate
	.word 0x93d02033  ! 1292: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x3a700001  ! 1293: BPCC	<illegal instruction>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 1294: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x99902005  ! 1295: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xc81fc000  ! 1296: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0x87902249  ! 1297: WRPR_TT_I	wrpr	%r0, 0x0249, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xc80fc000  ! 1299: LDUB_R	ldub	[%r31 + %r0], %r4
	.word 0x93902002  ! 1300: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
tagged_277:
	taddcctv %r4, 0x13a0, %r12
	.word 0xc807e001  ! 1301: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x91d02033  ! 1302: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902000  ! 1303: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x819822d7  ! 1304: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d7, %hpstate
	.word 0xc88008a0  ! 1305: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x93540000  ! 1306: RDPR_GL	rdpr	%-, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 1307: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x87902139  ! 1308: WRPR_TT_I	wrpr	%r0, 0x0139, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 1309: LDX_R	ldx	[%r31 + %r0], %r9
	ta	T_CHANGE_HPRIV	! macro
DS_278:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1311: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
DS_279:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xef11c00a  ! 1: LDQF_R	-	[%r7, %r10], %f23
	.word 0x8ba2c82b  ! 1312: FADDs	fadds	%f11, %f11, %f5
	.word 0xcadfe030  ! 1313: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r5
	.word 0xca4fe001  ! 1314: LDSB_I	ldsb	[%r31 + 0x0001], %r5
	.word 0x3c700001  ! 1315: BPPOS	<illegal instruction>
tagged_280:
	tsubcctv %r9, 0x13f8, %r18
	.word 0xca07e001  ! 1316: LDUW_I	lduw	[%r31 + 0x0001], %r5
DS_281:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1317: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_282:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 1318: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0xcb3fe001  ! 1319: STDF_I	std	%f5, [0x0001, %r31]
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196c  ! 1320: FqTOd	dis not found

	.word 0x91d02034  ! 1321: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_284:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1322: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x91d02035  ! 1323: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_lsu_285:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1324: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda97e030  ! 1325: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	.word 0xa1902009  ! 1326: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xb04ac012  ! 1327: MULX_R	mulx 	%r11, %r18, %r24
DS_286:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f8, %f22, %f0
	.word 0xadb30313  ! 1328: ALIGNADDRESS	alignaddr	%r12, %r19, %r22
	.word 0xecdfe030  ! 1329: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r22
tagged_287:
	taddcctv %r12, 0x114e, %r4
	.word 0xec07e001  ! 1330: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0xec9fe001  ! 1331: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r22
	.word 0x32800001  ! 1332: BNE	bne,a	<label_0x1>
	.word 0x8d464000  ! 1333: RD_STICK_CMPR_REG	rd	%-, %r6
	.word 0xcc8008a0  ! 1334: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xcc47e001  ! 1335: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	.word 0xccd004a0  ! 1336: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	.word 0x87802004  ! 1337: WRASI_I	wr	%r0, 0x0004, %asi
splash_lsu_288:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1338: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1339: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc0fe001  ! 1340: LDUB_I	ldub	[%r31 + 0x0001], %r6
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89830018  ! 1341: WRTICK_R	wr	%r12, %r24, %tick
	.word 0xcc8fe010  ! 1342: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r6
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 1343: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc1fe001  ! 1344: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x30700001  ! 1345: BPA	<illegal instruction>
DS_290:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x0	! illegal
	.word 0xe9124011  ! 1: LDQF_R	-	[%r9, %r17], %f20
	.word 0x99a6c821  ! 1346: FADDs	fadds	%f27, %f1, %f12
	.word 0x93d020b4  ! 1347: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x91d02033  ! 1348: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02032  ! 1349: Tcc_I	ta	icc_or_xcc, %r0 + 50
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 1350: LDX_R	ldx	[%r31 + %r0], %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 1351: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd89004a0  ! 1352: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0xd8c804a0  ! 1353: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd88008a0  ! 1354: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
tagged_291:
	taddcctv %r19, 0x1739, %r16
	.word 0xd807e001  ! 1355: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd8800c00  ! 1356: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r12
	.word 0xd85fe001  ! 1357: LDX_I	ldx	[%r31 + 0x0001], %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 1358: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x99514000  ! 1359: RDPR_TBA	rdpr	%tba, %r12
splash_lsu_292:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1360: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_293:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1361: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 1362: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd88008a0  ! 1363: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa1902001  ! 1364: WRPR_GL_I	wrpr	%r0, 0x0001, %-
tagged_294:
	tsubcctv %r5, 0x1709, %r15
	.word 0xd807e001  ! 1365: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8780204f  ! 1366: WRASI_I	wr	%r0, 0x004f, %asi
splash_lsu_295:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1367: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 1368: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x93902004  ! 1369: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd8c804a0  ! 1370: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x93902005  ! 1371: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1372: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902062  ! 1373: WRPR_TT_I	wrpr	%r0, 0x0062, %tt
	.word 0xd88008a0  ! 1374: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd85fe001  ! 1375: LDX_I	ldx	[%r31 + 0x0001], %r12
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
tagged_296:
	tsubcctv %r4, 0x12f2, %r10
	.word 0xd807e001  ! 1378: LDUW_I	lduw	[%r31 + 0x0001], %r12
tagged_297:
	taddcctv %r20, 0x1ef3, %r6
	.word 0xd807e001  ! 1379: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8d902223  ! 1380: WRPR_PSTATE_I	wrpr	%r0, 0x0223, %pstate
DS_298:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc932e001  ! 1: STQF_I	-	%f4, [0x0001, %r11]
	normalw
	.word 0xa5458000  ! 1381: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x93902003  ! 1382: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_cmpr_299:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184e001  ! 1383: WR_STICK_REG_I	wr	%r19, 0x0001, %-
	.word 0x99902003  ! 1384: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
DS_300:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x85b1c309  ! 1385: ALIGNADDRESS	alignaddr	%r7, %r9, %r2
	.word 0x8d802000  ! 1386: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 1387: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc4d7e030  ! 1388: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r2
	.word 0xc4c7e020  ! 1389: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	.word 0x81460000  ! 1390: RD_STICK_REG	stbar
	.word 0xc4cfe010  ! 1391: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r2
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1392: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982f86  ! 1393: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f86, %hpstate
	.word 0xc527e001  ! 1394: STF_I	st	%f2, [0x0001, %r31]
	.word 0xa190200d  ! 1395: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xc49fc020  ! 1396: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0xc48804a0  ! 1397: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0x93902007  ! 1398: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902001  ! 1399: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xc48008a0  ! 1400: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
splash_lsu_301:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1401: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1402: LDX_R	ldx	[%r31 + %r0], %r2
tagged_302:
	tsubcctv %r16, 0x11a1, %r18
	.word 0xc407e001  ! 1403: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x91d02032  ! 1404: Tcc_I	ta	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_HPRIV	! macro
change_to_randtl_303:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1406: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1407: LDX_R	ldx	[%r31 + %r0], %r2
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1408: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1409: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_304:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1410: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 1411: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902d82  ! 1412: WRPR_PSTATE_I	wrpr	%r0, 0x0d82, %pstate
	.word 0x879020d9  ! 1413: WRPR_TT_I	wrpr	%r0, 0x00d9, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1414: LDX_R	ldx	[%r31 + %r0], %r2
splash_tba_305:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1415: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902001  ! 1416: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x879022e9  ! 1417: WRPR_TT_I	wrpr	%r0, 0x02e9, %tt
tagged_306:
	tsubcctv %r18, 0x1575, %r24
	.word 0xc407e001  ! 1418: LDUW_I	lduw	[%r31 + 0x0001], %r2
tagged_307:
	taddcctv %r3, 0x1b91, %r12
	.word 0xc407e001  ! 1419: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc597e001  ! 1420: LDQFA_I	-	[%r31, 0x0001], %f2
splash_tba_308:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1421: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc4c00e80  ! 1422: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1423: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x9f802001  ! 1424: SIR	sir	0x0001
	.word 0x93902007  ! 1425: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1426: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 1427: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02034  ! 1428: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902001  ! 1429: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa1902008  ! 1430: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_tba_309:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1431: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_310:
	tsubcctv %r16, 0x11cd, %r10
	.word 0xc407e001  ! 1432: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x8790219e  ! 1433: WRPR_TT_I	wrpr	%r0, 0x019e, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1434: LDX_R	ldx	[%r31 + %r0], %r2
splash_htba_311:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1435: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_312:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1436: RESTORE_R	restore	%r31, %r0, %r31
tagged_313:
	taddcctv %r12, 0x192a, %r17
	.word 0xc407e001  ! 1437: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc4800ae0  ! 1438: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r2
	.word 0x81464000  ! 1439: RD_STICK_CMPR_REG	stbar
	.word 0xc117c000  ! 1440: LDQF_R	-	[%r31, %r0], %f0
splash_lsu_314:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1441: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc00fc000  ! 1442: LDUB_R	ldub	[%r31 + %r0], %r0
	.word 0xc097e030  ! 1443: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r0
	.word 0xc0c004a0  ! 1444: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
DS_315:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1445: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xc00fc000  ! 1446: LDUB_R	ldub	[%r31 + %r0], %r0
	.word 0x8d902007  ! 1447: WRPR_PSTATE_I	wrpr	%r0, 0x0007, %pstate
	.word 0x8d902b5f  ! 1448: WRPR_PSTATE_I	wrpr	%r0, 0x0b5f, %pstate
	.word 0xc057c000  ! 1449: LDSH_R	ldsh	[%r31 + %r0], %r0
	ta	T_CHANGE_PRIV	! macro
splash_lsu_316:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1451: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902170  ! 1452: WRPR_TT_I	wrpr	%r0, 0x0170, %tt
	.word 0x81460000  ! 1453: RD_STICK_REG	stbar
	.word 0x93902003  ! 1454: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_317:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xa7a00540  ! 1: FSQRTd	fsqrt	
	.word 0x8fa24821  ! 1455: FADDs	fadds	%f9, %f1, %f7
	.word 0x8d902cf3  ! 1456: WRPR_PSTATE_I	wrpr	%r0, 0x0cf3, %pstate
DS_318:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0x0	! illegal
	.word 0xe714c00a  ! 1: LDQF_R	-	[%r19, %r10], %f19
	.word 0x8da2c839  ! 1457: FADDs	fadds	%f11, %f25, %f6
splash_cmpr_319:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1846001  ! 1458: WR_STICK_REG_I	wr	%r17, 0x0001, %-
	.word 0xcc1fe001  ! 1459: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1a01976  ! 1460: FqTOd	dis not found

	.word 0xf08008a0  ! 1461: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x87802058  ! 1462: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87802055  ! 1463: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xf0800b00  ! 1464: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r24
	.word 0x89504000  ! 1465: RDPR_TNPC	rdpr	%tnpc, %r4
splash_lsu_321:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1466: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc937e001  ! 1467: STQF_I	-	%f4, [0x0001, %r31]
tagged_322:
	tsubcctv %r22, 0x10fd, %r23
	.word 0xc807e001  ! 1468: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc80fc000  ! 1469: LDUB_R	ldub	[%r31 + %r0], %r4
	.word 0x93902003  ! 1470: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1471: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_323:
	taddcctv %r14, 0x1cb2, %r19
	.word 0xc807e001  ! 1472: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc89fc020  ! 1473: LDDA_R	ldda	[%r31, %r0] 0x01, %r4
	.word 0xc8cfe020  ! 1474: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r4
	.word 0x93494000  ! 1475: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0x8d902133  ! 1476: WRPR_PSTATE_I	wrpr	%r0, 0x0133, %pstate
	.word 0xd28804a0  ! 1477: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0xd2c7e010  ! 1478: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r9
	.word 0xa190200b  ! 1479: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xaf494000  ! 1480: RDHPR_HTBA	rdhpr	%htba, %r23
	.word 0x8d9028ec  ! 1481: WRPR_PSTATE_I	wrpr	%r0, 0x08ec, %pstate
	.word 0xee5fe001  ! 1482: LDX_I	ldx	[%r31 + 0x0001], %r23
	.word 0xee2fe001  ! 1483: STB_I	stb	%r23, [%r31 + 0x0001]
splash_tba_324:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1484: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xab508000  ! 1485: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x93902006  ! 1486: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902006  ! 1487: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x91d02035  ! 1488: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_325:
	taddcctv %r12, 0x11a6, %r17
	.word 0xea07e001  ! 1489: LDUW_I	lduw	[%r31 + 0x0001], %r21
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1490: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_326:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1491: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xea9fc020  ! 1492: LDDA_R	ldda	[%r31, %r0] 0x01, %r21
	.word 0x95504000  ! 1493: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0xd41fe001  ! 1494: LDD_I	ldd	[%r31 + 0x0001], %r10
	.word 0x91d020b3  ! 1495: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x93902001  ! 1496: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01962  ! 1497: FqTOd	dis not found

splash_lsu_328:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1498: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe6cfe020  ! 1499: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r19
	.word 0x8d902ec4  ! 1500: WRPR_PSTATE_I	wrpr	%r0, 0x0ec4, %pstate
	.word 0x34700001  ! 1501: BPG	<illegal instruction>
	.word 0xe617c000  ! 1502: LDUH_R	lduh	[%r31 + %r0], %r19
	.word 0xa190200f  ! 1503: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x9f802001  ! 1504: SIR	sir	0x0001
	.word 0x93902007  ! 1505: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9f802001  ! 1506: SIR	sir	0x0001
	.word 0xe647c000  ! 1507: LDSW_R	ldsw	[%r31 + %r0], %r19
change_to_randtl_329:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1508: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa1902009  ! 1509: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_tba_330:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1510: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_htba_331:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1511: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe6c7e010  ! 1512: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r19
	.word 0x87902388  ! 1513: WRPR_TT_I	wrpr	%r0, 0x0388, %tt
DS_332:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0x0	! illegal
	.word 0xc1124007  ! 1: LDQF_R	-	[%r9, %r7], %f0
	.word 0x95a40825  ! 1514: FADDs	fadds	%f16, %f5, %f10
	.word 0x87802080  ! 1515: WRASI_I	wr	%r0, 0x0080, %asi
splash_lsu_333:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1516: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd49fe001  ! 1517: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0xd41fc000  ! 1518: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x8d90243c  ! 1519: WRPR_PSTATE_I	wrpr	%r0, 0x043c, %pstate
	.word 0xd4cfe030  ! 1520: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
splash_tba_334:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1521: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd48008a0  ! 1522: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8d802000  ! 1523: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_335:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1524: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4c7e010  ! 1525: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
	.word 0xd48fe030  ! 1526: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0xd4800b20  ! 1527: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r10
	.word 0x93902002  ! 1528: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd4800ba0  ! 1529: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r10
	ta	T_CHANGE_HPRIV	! macro
splash_lsu_336:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1531: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902c54  ! 1533: WRPR_PSTATE_I	wrpr	%r0, 0x0c54, %pstate
DS_337:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f8, %f24, %f16
	.word 0xadb14306  ! 1534: ALIGNADDRESS	alignaddr	%r5, %r6, %r22
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xec5fc000  ! 1535: LDX_R	ldx	[%r31 + %r0], %r22
tagged_338:
	tsubcctv %r4, 0x1146, %r9
	.word 0xec07e001  ! 1536: LDUW_I	lduw	[%r31 + 0x0001], %r22
splash_lsu_339:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1537: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902308  ! 1538: WRPR_TT_I	wrpr	%r0, 0x0308, %tt
	.word 0xec17c000  ! 1539: LDUH_R	lduh	[%r31 + %r0], %r22
	.word 0xa1902009  ! 1540: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8345c000  ! 1541: RD_TICK_CMPR_REG	rd	%-, %r1
splash_cmpr_340:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1816001  ! 1542: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0x93902007  ! 1543: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc2800a60  ! 1544: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r1
	.word 0xc257c000  ! 1545: LDSH_R	ldsh	[%r31 + %r0], %r1
	.word 0x95480000  ! 1546: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0xd447e001  ! 1547: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1548: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd41fe001  ! 1549: LDD_I	ldd	[%r31 + 0x0001], %r10
	.word 0xa190200f  ! 1550: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_341:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1551: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790233e  ! 1552: WRPR_TT_I	wrpr	%r0, 0x033e, %tt
	.word 0x88804007  ! 1553: ADDcc_R	addcc 	%r1, %r7, %r4
	.word 0xa190200f  ! 1554: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x83d020b4  ! 1555: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xc8d7e000  ! 1556: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r4
	.word 0xab51c000  ! 1557: RDPR_TL	rdpr	%tl, %r21
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 1558: LDX_R	ldx	[%r31 + %r0], %r21
splash_tba_342:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1559: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xea9fc020  ! 1560: LDDA_R	ldda	[%r31, %r0] 0x01, %r21
DS_343:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1561: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802089  ! 1562: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x93902002  ! 1563: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xeac804a0  ! 1564: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r21
	.word 0x8d902f56  ! 1565: WRPR_PSTATE_I	wrpr	%r0, 0x0f56, %pstate
tagged_344:
	tsubcctv %r24, 0x1d8c, %r9
	.word 0xea07e001  ! 1566: LDUW_I	lduw	[%r31 + 0x0001], %r21
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1567: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 1569: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1570: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d50c000  ! 1571: RDPR_TT	rdpr	%tt, %r6
	.word 0xcc07c000  ! 1572: LDUW_R	lduw	[%r31 + %r0], %r6
	.word 0x93902006  ! 1573: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_345:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1574: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 1576: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802004  ! 1577: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xcc47e001  ! 1578: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xcc5fc000  ! 1579: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc8008a0  ! 1580: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xccc004a0  ! 1581: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
tagged_346:
	tsubcctv %r1, 0x13c2, %r8
	.word 0xcc07e001  ! 1582: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc47c000  ! 1583: LDSW_R	ldsw	[%r31 + %r0], %r6
	.word 0x8790216e  ! 1584: WRPR_TT_I	wrpr	%r0, 0x016e, %tt
	.word 0x93902001  ! 1585: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902830  ! 1586: WRPR_PSTATE_I	wrpr	%r0, 0x0830, %pstate
splash_lsu_347:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1587: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc8008a0  ! 1588: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x91d020b2  ! 1589: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x87802004  ! 1590: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_348:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1591: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200e  ! 1592: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xccc7e030  ! 1593: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	.word 0x34700001  ! 1594: BPG	<illegal instruction>
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 1595: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 1596: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xcc5fe001  ! 1597: LDX_I	ldx	[%r31 + 0x0001], %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xccd804a0  ! 1599: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
splash_tba_349:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1600: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x38700001  ! 1601: BPGU	<illegal instruction>
	.word 0xcc47e001  ! 1602: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	.word 0x81982c45  ! 1603: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c45, %hpstate
splash_lsu_350:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1604: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81540000  ! 1605: RDPR_GL	rdpr	%-, %r0
	.word 0x87802016  ! 1606: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8790237b  ! 1607: WRPR_TT_I	wrpr	%r0, 0x037b, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xc01fc000  ! 1609: LDD_R	ldd	[%r31 + %r0], %r0
splash_lsu_351:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1610: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc08fe000  ! 1611: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r0
	.word 0xc077e001  ! 1612: STX_I	stx	%r0, [%r31 + 0x0001]
	.word 0x91508000  ! 1613: RDPR_TSTATE	rdpr	%tstate, %r8
	.word 0xa1902005  ! 1614: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x3c800001  ! 1615: BPOS	bpos,a	<label_0x1>
	.word 0x3e800001  ! 1616: BVC	bvc,a	<label_0x1>
	.word 0x24700001  ! 1617: BPLE	<illegal instruction>
	.word 0xd0800c40  ! 1618: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r8
	.word 0x95540000  ! 1619: RDPR_GL	rdpr	%-, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902fa8  ! 1621: WRPR_PSTATE_I	wrpr	%r0, 0x0fa8, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd45fc000  ! 1622: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4c00e80  ! 1623: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
	.word 0xa1902003  ! 1624: WRPR_GL_I	wrpr	%r0, 0x0003, %-
tagged_352:
	tsubcctv %r12, 0x188d, %r22
	.word 0xd407e001  ! 1625: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_lsu_353:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1626: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd4d7e010  ! 1627: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
	.word 0x91480000  ! 1628: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xd097e000  ! 1629: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r8
	.word 0x8780201c  ! 1630: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd0900e40  ! 1631: LDUHA_R	lduha	[%r0, %r0] 0x72, %r8
	.word 0xd08008a0  ! 1632: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa1902007  ! 1633: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8545c000  ! 1634: RD_TICK_CMPR_REG	rd	%-, %r2
	.word 0x8281e001  ! 1635: ADDcc_I	addcc 	%r7, 0x0001, %r1
DS_354:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1636: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
splash_lsu_355:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1637: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc25fc000  ! 1638: LDX_R	ldx	[%r31 + %r0], %r1
splash_tba_356:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1639: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_357:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd730a001  ! 1: STQF_I	-	%f11, [0x0001, %r2]
	normalw
	.word 0x93458000  ! 1640: RD_SOFTINT_REG	rd	%softint, %r9
splash_lsu_358:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1641: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd21fc000  ! 1642: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0xd24fe001  ! 1643: LDSB_I	ldsb	[%r31 + 0x0001], %r9
	.word 0x9f802001  ! 1644: SIR	sir	0x0001
	.word 0xd2800c20  ! 1645: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
	.word 0x87902018  ! 1646: WRPR_TT_I	wrpr	%r0, 0x0018, %tt
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1647: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_359:
	taddcctv %r5, 0x1f21, %r10
	.word 0xd207e001  ! 1648: LDUW_I	lduw	[%r31 + 0x0001], %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd25fc000  ! 1649: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8d802000  ! 1650: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02032  ! 1651: Tcc_I	ta	icc_or_xcc, %r0 + 50
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 1652: LDX_R	ldx	[%r31 + %r0], %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 1653: LDX_R	ldx	[%r31 + %r0], %r9
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1654: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd28804a0  ! 1655: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0xd2c00e80  ! 1656: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r9
	.word 0x9b504000  ! 1657: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x879020e2  ! 1658: WRPR_TT_I	wrpr	%r0, 0x00e2, %tt
	.word 0x93d02033  ! 1659: Tcc_I	tne	icc_or_xcc, %r0 + 51
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xda5fc000  ! 1660: LDX_R	ldx	[%r31 + %r0], %r13
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1661: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda9004a0  ! 1662: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0x99500000  ! 1663: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x83d02032  ! 1664: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xd82fc007  ! 1665: STB_R	stb	%r12, [%r31 + %r7]
	.word 0x95540000  ! 1666: RDPR_GL	rdpr	%-, %r10
	.word 0x8d902312  ! 1667: WRPR_PSTATE_I	wrpr	%r0, 0x0312, %pstate
splash_tba_360:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1668: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1669: LDX_R	ldx	[%r31 + %r0], %r10
DS_361:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f10, %f22, %f6
	.word 0x85b28319  ! 1670: ALIGNADDRESS	alignaddr	%r10, %r25, %r2
	.word 0x93902000  ! 1671: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_362:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 1672: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x9b464000  ! 1673: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x93902000  ! 1674: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xda17c000  ! 1675: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0x91d02034  ! 1676: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902004  ! 1677: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xda47e001  ! 1678: LDSW_I	ldsw	[%r31 + 0x0001], %r13
	.word 0x99902004  ! 1679: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xda8008a0  ! 1680: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1681: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_363:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1682: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902004  ! 1683: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xda8008a0  ! 1684: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda8008a0  ! 1685: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x93902002  ! 1686: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xdac7e020  ! 1687: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	.word 0x8790234f  ! 1688: WRPR_TT_I	wrpr	%r0, 0x034f, %tt
	.word 0x93902004  ! 1689: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_tba_364:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1690: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902003  ! 1691: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93d02033  ! 1692: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_tba_365:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1693: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902334  ! 1694: WRPR_TT_I	wrpr	%r0, 0x0334, %tt
splash_tba_366:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1695: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b2  ! 1696: Tcc_I	ta	icc_or_xcc, %r0 + 178
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1697: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdadfe030  ! 1698: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
	.word 0x91d020b4  ! 1699: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa190200c  ! 1700: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x28700001  ! 1701: BPLEU	<illegal instruction>
	.word 0xa190200f  ! 1702: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d90273c  ! 1703: WRPR_PSTATE_I	wrpr	%r0, 0x073c, %pstate
	.word 0x93902001  ! 1704: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1705: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xda57e001  ! 1706: LDSH_I	ldsh	[%r31 + 0x0001], %r13
DS_367:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f0, %f26, %f14
	.word 0x81b6430c  ! 1707: ALIGNADDRESS	alignaddr	%r25, %r12, %r0
	ta	T_CHANGE_PRIV	! macro
splash_htba_368:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1709: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87802063  ! 1710: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8790205b  ! 1711: WRPR_TT_I	wrpr	%r0, 0x005b, %tt
	.word 0xc0d004a0  ! 1712: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r0
	.word 0x93902004  ! 1713: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xc01fe001  ! 1714: LDD_I	ldd	[%r31 + 0x0001], %r0
	.word 0x8d802000  ! 1715: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1716: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc0d804a0  ! 1717: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
splash_tba_369:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1718: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_370:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1719: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc007c000  ! 1720: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0xc097e020  ! 1721: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r0
DS_371:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd134e001  ! 1: STQF_I	-	%f8, [0x0001, %r19]
	normalw
	.word 0xa9458000  ! 1722: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xe8c00e40  ! 1723: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r20
	.word 0xe817e001  ! 1724: LDUH_I	lduh	[%r31 + 0x0001], %r20
	.word 0xe877e001  ! 1725: STX_I	stx	%r20, [%r31 + 0x0001]
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1726: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe8800c20  ! 1727: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r20
tagged_372:
	tsubcctv %r24, 0x1616, %r9
	.word 0xe807e001  ! 1728: LDUW_I	lduw	[%r31 + 0x0001], %r20
tagged_373:
	taddcctv %r20, 0x1040, %r21
	.word 0xe807e001  ! 1729: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xe88804a0  ! 1730: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
	.word 0x2a800001  ! 1731: BCS	bcs,a	<label_0x1>
	.word 0x87802089  ! 1732: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xe8c7e000  ! 1733: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r20
DS_374:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f8, %f22, %f6
	.word 0x97b2031a  ! 1734: ALIGNADDRESS	alignaddr	%r8, %r26, %r11
	.word 0x879022d3  ! 1735: WRPR_TT_I	wrpr	%r0, 0x02d3, %tt
	.word 0x93902001  ! 1736: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa190200d  ! 1737: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x879023c2  ! 1738: WRPR_TT_I	wrpr	%r0, 0x03c2, %tt
splash_tba_375:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1739: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd7e7c03a  ! 1740: CASA_I	casa	[%r31] 0x 1, %r26, %r11
DS_376:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1741: SAVE_R	save	%r31, %r0, %r31
DS_377:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd7154006  ! 1: LDQF_R	-	[%r21, %r6], %f11
	.word 0x87a50827  ! 1742: FADDs	fadds	%f20, %f7, %f3
	.word 0x3e800001  ! 1743: BVC	bvc,a	<label_0x1>
	.word 0xc61fe001  ! 1744: LDD_I	ldd	[%r31 + 0x0001], %r3
change_to_randtl_378:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1745: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87802020  ! 1746: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x83d02035  ! 1747: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d9022eb  ! 1748: WRPR_PSTATE_I	wrpr	%r0, 0x02eb, %pstate
	.word 0x87902144  ! 1749: WRPR_TT_I	wrpr	%r0, 0x0144, %tt
	.word 0xa1902009  ! 1750: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_lsu_379:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1751: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_380:
	tsubcctv %r16, 0x1929, %r26
	.word 0xc607e001  ! 1752: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xa1902006  ! 1753: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xc6c004a0  ! 1754: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0x38800001  ! 1755: BGU	bgu,a	<label_0x1>
	.word 0xc68008a0  ! 1756: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc61fc000  ! 1757: LDD_R	ldd	[%r31 + %r0], %r3
splash_lsu_381:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1758: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc617e001  ! 1759: LDUH_I	lduh	[%r31 + 0x0001], %r3
	.word 0x83d020b2  ! 1760: Tcc_I	te	icc_or_xcc, %r0 + 178
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 1761: LDX_R	ldx	[%r31 + %r0], %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc65fc000  ! 1762: LDX_R	ldx	[%r31 + %r0], %r3
DS_382:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1763: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8ba01964  ! 1764: FqTOd	dis not found

	.word 0xca1fe001  ! 1765: LDD_I	ldd	[%r31 + 0x0001], %r5
	.word 0xa1902002  ! 1766: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d500000  ! 1767: RDPR_TPC	rdpr	%tpc, %r6
	.word 0xccc804a0  ! 1768: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r6
	.word 0x87902273  ! 1769: WRPR_TT_I	wrpr	%r0, 0x0273, %tt
	.word 0x91d020b5  ! 1770: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_tba_384:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1771: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1772: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_385:
	taddcctv %r6, 0x1767, %r3
	.word 0xcc07e001  ! 1773: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc8804a0  ! 1774: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
	.word 0x8790224e  ! 1775: WRPR_TT_I	wrpr	%r0, 0x024e, %tt
	.word 0x8d802000  ! 1776: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879021e3  ! 1777: WRPR_TT_I	wrpr	%r0, 0x01e3, %tt
	.word 0x93902004  ! 1778: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8790207f  ! 1779: WRPR_TT_I	wrpr	%r0, 0x007f, %tt
	.word 0xcd37e001  ! 1780: STQF_I	-	%f6, [0x0001, %r31]
	.word 0x93902004  ! 1781: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x3e700001  ! 1782: BPVC	<illegal instruction>
	.word 0x81510000  ! 1783: RDPR_TICK	rdpr	%tick, %r0
	.word 0x93902005  ! 1784: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1785: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1786: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790208d  ! 1787: WRPR_TT_I	wrpr	%r0, 0x008d, %tt
	.word 0xccd004a0  ! 1788: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
splash_lsu_386:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1789: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902913  ! 1790: WRPR_PSTATE_I	wrpr	%r0, 0x0913, %pstate
	.word 0x83d02032  ! 1791: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xa1902002  ! 1792: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1793: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 1794: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x8d902057  ! 1795: WRPR_PSTATE_I	wrpr	%r0, 0x0057, %pstate
	.word 0xcc800c80  ! 1796: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r6
	.word 0x38800001  ! 1797: BGU	bgu,a	<label_0x1>
splash_lsu_387:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1798: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_388:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1799: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_389:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc9318008  ! 1: STQF_R	-	%f4, [%r8, %r6]
	normalw
	.word 0x91458000  ! 1800: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x93d020b4  ! 1801: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x93902001  ! 1802: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd08fe010  ! 1803: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r8
	.word 0xd0d004a0  ! 1804: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0x3e800001  ! 1805: BVC	bvc,a	<label_0x1>
DS_390:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1806: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa190200f  ! 1807: WRPR_GL_I	wrpr	%r0, 0x000f, %-
tagged_391:
	taddcctv %r23, 0x1284, %r25
	.word 0xd007e001  ! 1808: LDUW_I	lduw	[%r31 + 0x0001], %r8
DS_392:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1809: SAVE_R	save	%r31, %r0, %r31
change_to_randtl_393:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1810: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xd0d7e030  ! 1811: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	.word 0x9f802001  ! 1812: SIR	sir	0x0001
DS_394:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f10, %f30, %f6
	.word 0xb7b04302  ! 1813: ALIGNADDRESS	alignaddr	%r1, %r2, %r27
	.word 0x26700001  ! 1814: BPL	<illegal instruction>
	.word 0xa1902004  ! 1815: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x81510000  ! 1816: RDPR_TICK	rdpr	%tick, %r0
	.word 0x8d90259b  ! 1817: WRPR_PSTATE_I	wrpr	%r0, 0x059b, %pstate
	.word 0xf6ffc022  ! 1818: SWAPA_R	swapa	%r27, [%r31 + %r2] 0x01
splash_tba_395:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1819: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9022da  ! 1820: WRPR_PSTATE_I	wrpr	%r0, 0x02da, %pstate
splash_tba_396:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1821: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf68008a0  ! 1822: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
splash_htba_397:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1823: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x879022e9  ! 1824: WRPR_TT_I	wrpr	%r0, 0x02e9, %tt
	.word 0x8790223b  ! 1825: WRPR_TT_I	wrpr	%r0, 0x023b, %tt
	.word 0x879023fe  ! 1826: WRPR_TT_I	wrpr	%r0, 0x03fe, %tt
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1827: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf617c000  ! 1828: LDUH_R	lduh	[%r31 + %r0], %r27
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36aa001  ! 1829: SDIVX_I	sdivx	%r10, 0x0001, %r17
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 1830: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x91d020b3  ! 1831: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xe297e010  ! 1832: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
	.word 0x87802089  ! 1833: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x32800001  ! 1834: BNE	bne,a	<label_0x1>
	.word 0x93902002  ! 1835: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902006  ! 1836: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_399:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1837: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_400:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1838: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200c  ! 1839: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe217e001  ! 1840: LDUH_I	lduh	[%r31 + 0x0001], %r17
DS_401:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1841: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe327c002  ! 1842: STF_R	st	%f17, [%r2, %r31]
	.word 0x85540000  ! 1843: RDPR_GL	rdpr	%-, %r2
DS_402:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1844: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x93d02034  ! 1845: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xb3464000  ! 1846: RD_STICK_CMPR_REG	rd	%-, %r25
	.word 0x28700001  ! 1847: BPLEU	<illegal instruction>
	.word 0xf2cfe000  ! 1848: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r25
	.word 0xf2c004a0  ! 1849: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r25
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1850: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02035  ! 1851: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xf297e000  ! 1852: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r25
splash_tba_403:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1853: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1854: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf317c000  ! 1855: LDQF_R	-	[%r31, %r0], %f25
splash_htba_404:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1856: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1857: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982bc5  ! 1858: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc5, %hpstate
tagged_405:
	taddcctv %r21, 0x1821, %r16
	.word 0xf207e001  ! 1859: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0xf2800b40  ! 1860: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r25
splash_tba_406:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1861: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802004  ! 1862: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d020b3  ! 1863: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xf29fc020  ! 1864: LDDA_R	ldda	[%r31, %r0] 0x01, %r25
	.word 0x8d902d16  ! 1865: WRPR_PSTATE_I	wrpr	%r0, 0x0d16, %pstate
	.word 0xf25fe001  ! 1866: LDX_I	ldx	[%r31 + 0x0001], %r25
splash_lsu_407:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1867: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_408:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1868: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02032  ! 1869: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x87802020  ! 1870: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x83d02032  ! 1871: Tcc_I	te	icc_or_xcc, %r0 + 50
DS_409:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1872: SAVE_R	save	%r31, %r0, %r31
	.word 0x8790205b  ! 1873: WRPR_TT_I	wrpr	%r0, 0x005b, %tt
	.word 0x95540000  ! 1874: RDPR_GL	rdpr	%-, %r10
	.word 0xa1902009  ! 1875: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_tba_410:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1876: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd40fe001  ! 1877: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0xd4d804a0  ! 1878: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0xd48804a0  ! 1879: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0xd4c80e60  ! 1880: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
tagged_411:
	taddcctv %r16, 0x173c, %r25
	.word 0xd407e001  ! 1881: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4c804a0  ! 1882: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x83d020b5  ! 1883: Tcc_I	te	icc_or_xcc, %r0 + 181
splash_htba_412:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1884: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_PRIV	! macro
DS_413:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xcd100010  ! 1: LDQF_R	-	[%r0, %r16], %f6
	.word 0x85a2082c  ! 1886: FADDs	fadds	%f8, %f12, %f2
DS_414:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0x0	! illegal
	.word 0xf7118008  ! 1: LDQF_R	-	[%r6, %r8], %f27
	.word 0x8ba5c83b  ! 1887: FADDs	fadds	%f23, %f27, %f5
	.word 0xcad004a0  ! 1888: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0xca5fe001  ! 1889: LDX_I	ldx	[%r31 + 0x0001], %r5
	.word 0x879022c1  ! 1890: WRPR_TT_I	wrpr	%r0, 0x02c1, %tt
	.word 0x93902002  ! 1891: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xca5fc000  ! 1892: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xcac004a0  ! 1893: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0xca9004a0  ! 1894: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0xcac004a0  ! 1895: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0x8d902c9e  ! 1896: WRPR_PSTATE_I	wrpr	%r0, 0x0c9e, %pstate
	.word 0xacfa401b  ! 1897: SDIVcc_R	sdivcc 	%r9, %r27, %r22
	.word 0xec8804a0  ! 1898: LDUBA_R	lduba	[%r0, %r0] 0x25, %r22
	.word 0xec5fe001  ! 1899: LDX_I	ldx	[%r31 + 0x0001], %r22
	.word 0xec0fe001  ! 1900: LDUB_I	ldub	[%r31 + 0x0001], %r22
	.word 0x9b514000  ! 1901: RDPR_TBA	rdpr	%tba, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x24700001  ! 1903: BPLE	<illegal instruction>
DS_415:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1904: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d494000  ! 1905: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0x3e800001  ! 1906: BVC	bvc,a	<label_0x1>
	.word 0x93902007  ! 1907: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_416:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1908: SAVE_R	save	%r31, %r0, %r31
	.word 0x93d02033  ! 1909: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xcc47e001  ! 1910: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	.word 0xccc004a0  ! 1911: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0xcc1fe001  ! 1912: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x87902306  ! 1913: WRPR_TT_I	wrpr	%r0, 0x0306, %tt
	.word 0x93902002  ! 1914: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8790213e  ! 1915: WRPR_TT_I	wrpr	%r0, 0x013e, %tt
	.word 0x87902291  ! 1916: WRPR_TT_I	wrpr	%r0, 0x0291, %tt
	.word 0x8d802000  ! 1917: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_417:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1918: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc4fe001  ! 1919: LDSB_I	ldsb	[%r31 + 0x0001], %r6
	.word 0x8780201c  ! 1920: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xcccfe010  ! 1921: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r6
	.word 0x85a01a6d  ! 1922: FqTOi	fqtoi	
	.word 0xc48008a0  ! 1923: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc4dfe030  ! 1924: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r2
	.word 0xa1902005  ! 1925: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902d0f  ! 1926: WRPR_PSTATE_I	wrpr	%r0, 0x0d0f, %pstate
	.word 0xc4800b00  ! 1927: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r2
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1928: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 1929: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9f802001  ! 1930: SIR	sir	0x0001
	.word 0xc497e010  ! 1931: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r2
tagged_418:
	tsubcctv %r26, 0x15fe, %r26
	.word 0xc407e001  ! 1932: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x93902007  ! 1933: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc49fe001  ! 1934: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	.word 0x93902004  ! 1935: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02034  ! 1936: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_419:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1812001  ! 1937: WR_STICK_REG_I	wr	%r4, 0x0001, %-
tagged_420:
	tsubcctv %r20, 0x1e95, %r6
	.word 0xc407e001  ! 1938: LDUW_I	lduw	[%r31 + 0x0001], %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 1939: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x87902321  ! 1940: WRPR_TT_I	wrpr	%r0, 0x0321, %tt
	.word 0xc4d004a0  ! 1941: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r2
splash_tba_421:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1942: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_422:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f14, %f30
	.word 0x95b30303  ! 1943: ALIGNADDRESS	alignaddr	%r12, %r3, %r10
	.word 0xd44fe001  ! 1944: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0xd4800b00  ! 1945: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r10
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd45fc000  ! 1946: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x87902241  ! 1947: WRPR_TT_I	wrpr	%r0, 0x0241, %tt
	.word 0x93464000  ! 1948: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0xd21fc000  ! 1949: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0xaf464000  ! 1950: RD_STICK_CMPR_REG	rd	%-, %r23
change_to_randtl_423:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1951: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa190200a  ! 1952: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x99902004  ! 1953: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x93902002  ! 1954: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_424:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1955: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_lsu_425:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1956: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1957: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_426:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1958: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xee5fc000  ! 1959: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0xee27c003  ! 1960: STW_R	stw	%r23, [%r31 + %r3]
	.word 0x8d90299b  ! 1961: WRPR_PSTATE_I	wrpr	%r0, 0x099b, %pstate
splash_tba_427:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1962: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xee17e001  ! 1963: LDUH_I	lduh	[%r31 + 0x0001], %r23
	.word 0xeec804a0  ! 1964: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r23
splash_cmpr_428:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1842001  ! 1965: WR_STICK_REG_I	wr	%r16, 0x0001, %-
	.word 0xa190200a  ! 1966: WRPR_GL_I	wrpr	%r0, 0x000a, %-
tagged_429:
	taddcctv %r15, 0x152e, %r14
	.word 0xee07e001  ! 1967: LDUW_I	lduw	[%r31 + 0x0001], %r23
	.word 0x3e700001  ! 1968: BPVC	<illegal instruction>
	.word 0x24700001  ! 1969: BPLE	<illegal instruction>
DS_430:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0x0	! illegal
	.word 0x83a0054d  ! 1: FSQRTd	fsqrt	
	.word 0xaba48821  ! 1970: FADDs	fadds	%f18, %f1, %f21
	.word 0xeacfe010  ! 1971: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r21
splash_tba_431:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1972: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 1973: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x3e800001  ! 1974: BVC	bvc,a	<label_0x1>
	.word 0xab51c000  ! 1975: RDPR_TL	rdpr	%tl, %r21
tagged_432:
	tsubcctv %r8, 0x183d, %r19
	.word 0xea07e001  ! 1976: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0xa1902002  ! 1977: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xea1fc000  ! 1978: LDD_R	ldd	[%r31 + %r0], %r21
	.word 0xea0fe001  ! 1979: LDUB_I	ldub	[%r31 + 0x0001], %r21
	.word 0x93902005  ! 1980: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_433:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1822001  ! 1981: WR_STICK_REG_I	wr	%r8, 0x0001, %-
tagged_434:
	tsubcctv %r25, 0x15d1, %r19
	.word 0xea07e001  ! 1982: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0xea800b60  ! 1983: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r21
tagged_435:
	taddcctv %r2, 0x1e7c, %r26
	.word 0xea07e001  ! 1984: LDUW_I	lduw	[%r31 + 0x0001], %r21
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 1985: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0x93902004  ! 1986: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902003  ! 1987: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xea47e001  ! 1988: LDSW_I	ldsw	[%r31 + 0x0001], %r21
	.word 0x30800001  ! 1989: BA	ba,a	<label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1990: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9b45c000  ! 1991: RD_TICK_CMPR_REG	rd	%-, %r13
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1992: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdac004a0  ! 1993: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x819826cd  ! 1994: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cd, %hpstate
DS_436:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f26, %f12, %f0
	.word 0x93b54306  ! 1995: ALIGNADDRESS	alignaddr	%r21, %r6, %r9
	.word 0x8d902464  ! 1996: WRPR_PSTATE_I	wrpr	%r0, 0x0464, %pstate
	.word 0x8d902cca  ! 1997: WRPR_PSTATE_I	wrpr	%r0, 0x0cca, %pstate
splash_lsu_437:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1998: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
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

	.xword	0x9a4eddf29531bb6d
	.xword	0xc275b7a382f67ce1
	.xword	0x67389aeaf2c25669
	.xword	0xeaed7e84561121e2
	.xword	0xac32d088ba542c67
	.xword	0x3f211c473943324b
	.xword	0xa5665cda6d1b4cf1
	.xword	0xda33158d4a00979f
	.xword	0x8055a978e06d6421
	.xword	0x251889c2b3b3ddac
	.xword	0xf3c6cfbf104ed1ef
	.xword	0xc438593ef23c7e9c
	.xword	0x7e83d90815d0870c
	.xword	0xca73e7a034444214
	.xword	0x38210afe82c10f5f
	.xword	0x53e0e35d2f1ffa6d
	.xword	0xb10cb771db56080e
	.xword	0x189a12541bcc5e4e
	.xword	0xb21dfa06a50614e2
	.xword	0x7a92e3808aefcb86
	.xword	0xd43168928932b07d
	.xword	0x4aa3e7f09973aa95
	.xword	0x51d2f765ce314c11
	.xword	0x535f7f20cfceed03
	.xword	0x6765607576e5ee35
	.xword	0x137e33ddc935fdd6
	.xword	0xc276e77c1807604e
	.xword	0x7fe878a829e44fa6
	.xword	0xa1ab678bf7c6f23b
	.xword	0x1b838d232bf1414c
	.xword	0x98de3f5748b1380f
	.xword	0xaace3366311c3093
	.xword	0x5ac3b2b45e70c729
	.xword	0xe26e3048f5054cec
	.xword	0xb5fb05c7724542a8
	.xword	0x68936728a782afac
	.xword	0x69464ea19729bfad
	.xword	0xfd15dad019c22934
	.xword	0xfc887b84c11119f0
	.xword	0xb56458ff92f3c5f6
	.xword	0xa5f396a3f7e6f456
	.xword	0xe4faa5855a146bfd
	.xword	0xde5322e79f0b69f9
	.xword	0x9a3385378d077587
	.xword	0x35fd4af956025fcc
	.xword	0x9ce2c1d13ca3c948
	.xword	0x55cbbc2e0632aedd
	.xword	0x5cd20914cb6e266f
	.xword	0x5d217c0162050828
	.xword	0x5f1cbf47d5f55c44
	.xword	0x0a91df229f6dd2b2
	.xword	0xecd09cf4fff9c407
	.xword	0x6d6490470e40a54d
	.xword	0xb12e3f18c9807927
	.xword	0xa14a44fe7da58521
	.xword	0x2858c5a5df1dced4
	.xword	0x24a57ff940e10575
	.xword	0x4bb197bf93cda57f
	.xword	0x17e88a4297beb1db
	.xword	0x1a74312a9a4fcc71
	.xword	0x313357ad34923b89
	.xword	0xc27e480ff286a19b
	.xword	0x8c3fb19c67423d0c
	.xword	0xaae09c1016fb1309
	.xword	0x38ddbff52829be8c
	.xword	0x816316e3267b0b69
	.xword	0xfc3d679d3812dc54
	.xword	0x4cf6e9f1a96ff228
	.xword	0x422e9c5381935435
	.xword	0xe85d5388bc1babe3
	.xword	0xd9ee45f501ab4fb0
	.xword	0xc9a2d668f99a962c
	.xword	0xce0e8d7b8a9463fb
	.xword	0xf0776b30e59acffd
	.xword	0x892708cdf2bcf83a
	.xword	0x83cedcfcbb5d8caf
	.xword	0xd7dd0692ed1e2d0e
	.xword	0x316fe01455dd9e6e
	.xword	0xf297af6b1115a4ed
	.xword	0x00fe628142090090
	.xword	0x680130dea22fd479
	.xword	0x3390a5c559b2434c
	.xword	0xe0473252bfd4e35c
	.xword	0x4e00ed2cd6f6fece
	.xword	0x16777b340a9c0549
	.xword	0xa28df35eb0ff4800
	.xword	0x4fb2740de7f8cc3e
	.xword	0x3d74cfc9aaa74d8f
	.xword	0x30c634523ca3322d
	.xword	0xf27d3ed53793fbd7
	.xword	0xf3efb17ed7aea657
	.xword	0xfe5e9aacdf3f5e97
	.xword	0xd2f82f77183a87b6
	.xword	0x39c811d61f761a04
	.xword	0xacb6cef5c861b6c6
	.xword	0x2eef1f34910ca172
	.xword	0xf4eff140bb181248
	.xword	0xaf0872a4aae56578
	.xword	0x7292a4c9dcc4c56e
	.xword	0x01cbec61129106ee
	.xword	0xbfa3036503d6269f
	.xword	0x0f079c867cbc2627
	.xword	0x29f9fbca87538f68
	.xword	0xa352034c1689b0e3
	.xword	0x5115c81ed874e120
	.xword	0x77998a636b45b36e
	.xword	0x06822a2742144cb7
	.xword	0x11c0cca307bb0692
	.xword	0x1b6cb08e3090d711
	.xword	0xef151b480bfa3406
	.xword	0x60d488fdb7d0f2d3
	.xword	0x5790552e2d35041b
	.xword	0x4a47f0472c303241
	.xword	0x801cdf47c8d8fff1
	.xword	0xf79d36cbb4b1d900
	.xword	0xc50dd263e5d4a4e9
	.xword	0x84ef1212212a5da1
	.xword	0x9a7bcd97846aad83
	.xword	0x06c5fb14c923601e
	.xword	0xc65d73e8b64c3194
	.xword	0x90ace753d1920f10
	.xword	0x16d0f906a34dfa6f
	.xword	0xafda08e0f4cbd17e
	.xword	0x0158a0ec87f8e99f
	.xword	0x7f169790cc76d372
	.xword	0x21e3264ff008c046
	.xword	0xdf64a14170156d5e
	.xword	0xddc7c0a313dc1e6b
	.xword	0xc307fd6468c56c77
	.xword	0xe380de0610d8830b
	.xword	0xd957e92bcc15195b
	.xword	0xb5194f02f893830e
	.xword	0x49cc723956a021e6
	.xword	0xd7d7f5ec37655371
	.xword	0xfab54db0335150ee
	.xword	0x37b4a9ec0971d512
	.xword	0x68d7ed7ae98f61e7
	.xword	0xa36b48cb608b1b82
	.xword	0xe05e2d9feaccf5f7
	.xword	0xf218162f15e401df
	.xword	0x208a765ed89e80f9
	.xword	0xbf70717512e44193
	.xword	0xb5902ab79b9ea37b
	.xword	0x4c2961449d9de762
	.xword	0x19027a63a841858b
	.xword	0xffb46fd1bf2160a6
	.xword	0xa8233ccf0a6d9468
	.xword	0x7a3275350ff8f5a0
	.xword	0xc1a176587ac41d55
	.xword	0x3a6c6009ac4dd129
	.xword	0x7d0e1c26cd706045
	.xword	0xfd5ba2ffc3b9fd05
	.xword	0xc227572f68a900aa
	.xword	0x0f4b59dbdd02a5be
	.xword	0xa3c5f3b058211851
	.xword	0xb68cbc492a6ba8fd
	.xword	0x40b14c98a060398d
	.xword	0x64663da9bf91d536
	.xword	0x024552b69d6cf21c
	.xword	0x4e3beb2bda8f39a9
	.xword	0xecc7bc7ae4f82e8e
	.xword	0xe2e63e5d07b21372
	.xword	0xd40a4651a8506e25
	.xword	0xae4014cc97d3cf21
	.xword	0xaad9d637bc86fbb9
	.xword	0xed0de149e32d407c
	.xword	0xe18b323725b4e3bd
	.xword	0x1393a226fb23827a
	.xword	0x44cf107abd090300
	.xword	0xad94e571b6181ba1
	.xword	0x86626f2162adfd2f
	.xword	0x68f9512eb9d54ea4
	.xword	0x73fa36e2b35528ab
	.xword	0x2c8d20ce695168cd
	.xword	0x75104101f2654133
	.xword	0x71e3f1ada0bfa60a
	.xword	0x01d1f4d8dec459a0
	.xword	0xf4fcd29474083b97
	.xword	0xb521cd76381497f7
	.xword	0xbbf3d121c1ffd3f9
	.xword	0x82c8f0ff40e59102
	.xword	0x13a8b0bb3be781b5
	.xword	0x7ede4f438a59cc1e
	.xword	0x16217e4d5e703d01
	.xword	0x706db19d44ae4620
	.xword	0xf1cbb5fc536d7724
	.xword	0x1ca21b7b3fcb3c77
	.xword	0x69bb87ba154072d2
	.xword	0x7310b3c903d4b627
	.xword	0x57f091da6749e1ec
	.xword	0xaaa697be560a934a
	.xword	0xa4f20dc3e8bae6d5
	.xword	0x01ec1d156dbd2265
	.xword	0xaead5df158a817fb
	.xword	0x8ca047d2c6c59ce6
	.xword	0x9c68b7225b3210c7
	.xword	0x1875806794b79d7d
	.xword	0xae28c5881306f53a
	.xword	0x25e10877ce25bb0b
	.xword	0xa92b4025a84bb443
	.xword	0xfe2499dcb249e708
	.xword	0x7b5ccee02d645f72
	.xword	0x6b198bbc9da15edc
	.xword	0x4e232474ccbafbdb
	.xword	0xbbb2f1913708719e
	.xword	0x440ee7a2021a5092
	.xword	0xe5b5ca5e4fc6cfeb
	.xword	0x2511108dcdf9f26d
	.xword	0x308ddaecad37a6ba
	.xword	0xe90328021f1b6548
	.xword	0x3ed5c3ff5d3602bf
	.xword	0x0beb1ba59bd25d5a
	.xword	0x038bd130fcaf7f9d
	.xword	0xd009deb626018adc
	.xword	0x4bca4bff5cb62a9e
	.xword	0x513061f5453d918c
	.xword	0x92ae2539cd4f903f
	.xword	0xe4c81061f72f23be
	.xword	0x8d9bcba29e93b548
	.xword	0xd925e0531887977e
	.xword	0x48de48ce723e0648
	.xword	0x711ecd206e281e5a
	.xword	0x062e858781c796f1
	.xword	0x01aa5ab29b2e5839
	.xword	0x59700ef418dd5327
	.xword	0x2afb8596f649fceb
	.xword	0xa82f258d0d62d3c6
	.xword	0x9415b26caddee3d2
	.xword	0x608906b7101bd260
	.xword	0x67880c4959736041
	.xword	0xe3684edf1071bfc7
	.xword	0xc36bb42669278f8f
	.xword	0xd2768a2f57e3d99f
	.xword	0xce14b12236c16513
	.xword	0x662f8c4250b2bc84
	.xword	0x41058cf8989e1b95
	.xword	0xe4c5df9260daa627
	.xword	0x6d87cbdd38f29ee1
	.xword	0x4ddeab9417015bc9
	.xword	0x5f448b5145f39683
	.xword	0x9c58ce862c8a44a6
	.xword	0x25024e84c5054ac2
	.xword	0x94bab4b9daaf26fc
	.xword	0x924d082c77f9cb5b
	.xword	0xc6806f17848b1e85
	.xword	0x8303e6307d0addaf
	.xword	0xe596ddb85bc215e1
	.xword	0x037dad1a0de62855
	.xword	0x1d449f8148044c82
	.xword	0x4302076cb15329b3
	.xword	0xc1543de0d0335216
	.xword	0xaf01ee7fe9c2e06b
	.xword	0x4a3af5e5b16c3264
	.xword	0xc3bc677d07888878
	.xword	0x513e1d5a706b380b
	.xword	0xcb6ea79f53bad02b

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

