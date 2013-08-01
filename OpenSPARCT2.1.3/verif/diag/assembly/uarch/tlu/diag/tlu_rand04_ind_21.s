/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_21.s
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
	mov 0xb4, %r14
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
	mov 0x35, %r14
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
	mov 0x33, %r14
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
	mov 0x31, %r14
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

	.word 0xa1902001  ! 1: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x91d02032  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902190  ! 3: WRPR_PSTATE_I	wrpr	%r0, 0x0190, %pstate
splash_lsu_0:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 4: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_1:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 5: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd6cfe030  ! 6: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
splash_tba_2:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 7: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x32800001  ! 8: BNE	bne,a	<label_0x1>
	.word 0xd68008a0  ! 9: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd61fc000  ! 10: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd61fc000  ! 11: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x22700001  ! 12: BPE	<illegal instruction>
	.word 0xd68008a0  ! 13: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xa1902003  ! 14: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x9f802001  ! 15: SIR	sir	0x0001
	.word 0x28700001  ! 16: BPLEU	<illegal instruction>
	.word 0xd61fe001  ! 17: LDD_I	ldd	[%r31 + 0x0001], %r11
	.word 0xd6c004a0  ! 18: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0x8198280d  ! 19: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080d, %hpstate
	.word 0xd68804a0  ! 20: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0x93902006  ! 21: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa190200a  ! 22: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd65fc000  ! 23: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xa1902002  ! 24: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_lsu_3:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 25: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 26: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902157  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x0157, %pstate
	.word 0xd68008a0  ! 28: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd6c7e000  ! 29: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r11
splash_lsu_4:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 30: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902ca9  ! 31: WRPR_PSTATE_I	wrpr	%r0, 0x0ca9, %pstate
	.word 0xd6800a60  ! 32: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r11
	.word 0x99902001  ! 33: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x38700001  ! 34: BPGU	<illegal instruction>
DS_5:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe1332001  ! 1: STQF_I	-	%f16, [0x0001, %r12]
	normalw
	.word 0x97458000  ! 35: RD_SOFTINT_REG	rd	%softint, %r11
tagged_6:
	tsubcctv %r18, 0x1e74, %r23
	.word 0xd607e001  ! 36: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd6d804a0  ! 37: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x34700001  ! 38: BPG	<illegal instruction>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 39: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_7:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 40: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_8:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 41: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd68804a0  ! 42: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
tagged_9:
	taddcctv %r26, 0x17c8, %r21
	.word 0xd607e001  ! 43: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd61fe001  ! 44: LDD_I	ldd	[%r31 + 0x0001], %r11
splash_lsu_10:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 45: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_11:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 46: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0x8b500000  ! 47: RDPR_TPC	<illegal instruction>
	.word 0x83d02032  ! 48: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x93902001  ! 49: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_HPRIV	! macro
splash_lsu_12:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 51: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 52: WRASI_I	wr	%r0, 0x0055, %asi
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 53: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_13:
	taddcctv %r15, 0x125d, %r19
	.word 0xca07e001  ! 54: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xca1fc000  ! 55: LDD_R	ldd	[%r31 + %r0], %r5
splash_lsu_14:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 56: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xca0fc000  ! 57: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0xb5504000  ! 58: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0xf4c004a0  ! 59: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r26
	.word 0x36700001  ! 60: BPGE	<illegal instruction>
DS_15:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 61: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x93d02034  ! 62: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_lsu_16:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 63: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_17:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 64: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf597e001  ! 65: LDQFA_I	-	[%r31, 0x0001], %f26
	.word 0x8780204f  ! 66: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x879022d0  ! 67: WRPR_TT_I	wrpr	%r0, 0x02d0, %tt
	.word 0x87902133  ! 68: WRPR_TT_I	wrpr	%r0, 0x0133, %tt
	.word 0x879022f5  ! 69: WRPR_TT_I	wrpr	%r0, 0x02f5, %tt
	.word 0x8d802004  ! 70: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xf48804a0  ! 71: LDUBA_R	lduba	[%r0, %r0] 0x25, %r26
	.word 0x81464000  ! 72: RD_STICK_CMPR_REG	stbar
DS_18:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa1b2c300  ! 73: ALIGNADDRESS	alignaddr	%r11, %r0, %r16
	.word 0x9f802001  ! 74: SIR	sir	0x0001
tagged_19:
	taddcctv %r1, 0x1119, %r10
	.word 0xe007e001  ! 75: LDUW_I	lduw	[%r31 + 0x0001], %r16
splash_lsu_20:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 76: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe057e001  ! 77: LDSH_I	ldsh	[%r31 + 0x0001], %r16
	.word 0xe08008a0  ! 78: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 79: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8986c001  ! 80: WRTICK_R	wr	%r27, %r1, %tick
DS_22:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f28, %f26, %f12
	.word 0x89b34313  ! 81: ALIGNADDRESS	alignaddr	%r13, %r19, %r4
	.word 0xc847c000  ! 82: LDSW_R	ldsw	[%r31 + %r0], %r4
	.word 0x879021be  ! 83: WRPR_TT_I	wrpr	%r0, 0x01be, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc85fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x879020b6  ! 85: WRPR_TT_I	wrpr	%r0, 0x00b6, %tt
	.word 0x83d02032  ! 86: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8780201c  ! 87: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x87802010  ! 88: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87802055  ! 89: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xc8d804a0  ! 90: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0xc85fe001  ! 91: LDX_I	ldx	[%r31 + 0x0001], %r4
	.word 0x91d020b2  ! 92: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xc89fe001  ! 93: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	.word 0x87480000  ! 94: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0xa1902003  ! 95: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x99464000  ! 96: RD_STICK_CMPR_REG	rd	%-, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0xd81fc000  ! 98: LDD_R	ldd	[%r31 + %r0], %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd85fc000  ! 99: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d802000  ! 100: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8750c000  ! 101: RDPR_TT	rdpr	%tt, %r3
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 102: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc6d004a0  ! 103: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 104: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902089  ! 105: WRPR_TT_I	wrpr	%r0, 0x0089, %tt
	.word 0x93902001  ! 106: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa190200c  ! 107: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_tba_23:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 108: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 109: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc61fc000  ! 110: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x9545c000  ! 111: RD_TICK_CMPR_REG	rd	%-, %r10
tagged_24:
	tsubcctv %r19, 0x120a, %r7
	.word 0xd407e001  ! 112: LDUW_I	lduw	[%r31 + 0x0001], %r10
tagged_25:
	taddcctv %r4, 0x14a9, %r20
	.word 0xd407e001  ! 113: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x93d02035  ! 114: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_htba_26:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 115: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200a  ! 116: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x91d02033  ! 117: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_27:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x95b28307  ! 118: ALIGNADDRESS	alignaddr	%r10, %r7, %r10
	.word 0xd4800c60  ! 119: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89692001  ! 120: SDIVX_I	sdivx	%r4, 0x0001, %r4
	.word 0xc88008a0  ! 121: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x93d02032  ! 122: Tcc_I	tne	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
DS_29:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f8, %f16, %f4
	.word 0xa9b48309  ! 124: ALIGNADDRESS	alignaddr	%r18, %r9, %r20
DS_30:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 125: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902005  ! 126: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x99902001  ! 127: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x87802055  ! 128: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x83d020b2  ! 129: Tcc_I	te	icc_or_xcc, %r0 + 178
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 130: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe88008a0  ! 131: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xe8c804a0  ! 132: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
	.word 0x87902200  ! 133: WRPR_TT_I	wrpr	%r0, 0x0200, %tt
	.word 0xe8dfe020  ! 134: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r20
	.word 0x8d500000  ! 135: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x8d802000  ! 136: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902003  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xcc800c00  ! 138: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r6
	.word 0x93902005  ! 139: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xccdfe000  ! 140: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
DS_31:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 141: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_htba_32:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 142: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcc4fc000  ! 143: LDSB_R	ldsb	[%r31 + %r0], %r6
	.word 0xa9504000  ! 144: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0xe8d7e030  ! 145: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r20
	.word 0x87802016  ! 146: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xe88008a0  ! 147: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x99902001  ! 148: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
tagged_33:
	taddcctv %r9, 0x1a3b, %r25
	.word 0xe807e001  ! 149: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x91d02035  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe827c009  ! 151: STW_R	stw	%r20, [%r31 + %r9]
splash_lsu_34:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 152: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8c004a0  ! 153: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
	.word 0xe897e030  ! 154: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r20
	.word 0x91d02032  ! 155: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93d02034  ! 156: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x93902000  ! 157: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_35:
	taddcctv %r3, 0x18e6, %r20
	.word 0xe807e001  ! 158: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x95a01a62  ! 159: FqTOi	fqtoi	
DS_36:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xfbf46f6c	! Random illegal ?
	.word 0x83a00541  ! 1: FSQRTd	fsqrt	
	.word 0x87a50835  ! 160: FADDs	fadds	%f20, %f21, %f3
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8980c001  ! 161: WRTICK_R	wr	%r3, %r1, %tick
	.word 0xc6c7e020  ! 162: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r3
	ta	T_CHANGE_HPRIV	! macro
splash_htba_38:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 164: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc68008a0  ! 165: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc6900e40  ! 166: LDUHA_R	lduha	[%r0, %r0] 0x72, %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 167: LDX_R	ldx	[%r31 + %r0], %r3
tagged_39:
	taddcctv %r21, 0x1875, %r26
	.word 0xc607e001  ! 168: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc68fe010  ! 169: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r3
	.word 0x93d02034  ! 170: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x85514000  ! 171: RDPR_TBA	rdpr	%tba, %r2
	.word 0xc4c00e40  ! 172: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r2
splash_lsu_40:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 173: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_41:
	taddcctv %r13, 0x1b9c, %r15
	.word 0xc407e001  ! 174: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_42:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xabb04313  ! 175: ALIGNADDRESS	alignaddr	%r1, %r19, %r21
	.word 0xeb17c000  ! 176: LDQF_R	-	[%r31, %r0], %f21
DS_43:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 177: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d90207d  ! 178: WRPR_PSTATE_I	wrpr	%r0, 0x007d, %pstate
	.word 0x879023e3  ! 179: WRPR_TT_I	wrpr	%r0, 0x03e3, %tt
	.word 0x93902000  ! 180: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x22800001  ! 181: BE	be,a	<label_0x1>
	.word 0x879021c9  ! 182: WRPR_TT_I	wrpr	%r0, 0x01c9, %tt
	.word 0xea0fe001  ! 183: LDUB_I	ldub	[%r31 + 0x0001], %r21
tagged_44:
	tsubcctv %r21, 0x162a, %r17
	.word 0xea07e001  ! 184: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0x93902001  ! 185: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1902007  ! 186: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 187: LDX_R	ldx	[%r31 + %r0], %r21
splash_lsu_45:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 188: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879020ca  ! 189: WRPR_TT_I	wrpr	%r0, 0x00ca, %tt
tagged_46:
	tsubcctv %r3, 0x1643, %r23
	.word 0xea07e001  ! 190: LDUW_I	lduw	[%r31 + 0x0001], %r21
splash_tba_47:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 191: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802010  ! 192: WRASI_I	wr	%r0, 0x0010, %asi
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 193: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 194: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_48:
	tsubcctv %r16, 0x1310, %r20
	.word 0xea07e001  ! 195: LDUW_I	lduw	[%r31 + 0x0001], %r21
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 196: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_49:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 197: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_50:
	tsubcctv %r10, 0x1abc, %r7
	.word 0xea07e001  ! 198: LDUW_I	lduw	[%r31 + 0x0001], %r21
tagged_51:
	taddcctv %r2, 0x14f1, %r19
	.word 0xea07e001  ! 199: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0xea8008a0  ! 200: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xea5fc000  ! 201: LDX_R	ldx	[%r31 + %r0], %r21
splash_lsu_52:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 202: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_53:
	taddcctv %r9, 0x1c71, %r16
	.word 0xea07e001  ! 203: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0xead7e020  ! 204: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r21
	.word 0x81982b55  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b55, %hpstate
	.word 0xeb97e001  ! 206: LDQFA_I	-	[%r31, 0x0001], %f21
	.word 0xea97e000  ! 207: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 208: LDX_R	ldx	[%r31 + %r0], %r21
splash_tba_54:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 209: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_55:
	taddcctv %r13, 0x1335, %r12
	.word 0xea07e001  ! 210: LDUW_I	lduw	[%r31 + 0x0001], %r21
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xea5fc000  ! 211: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0xea8fe010  ! 212: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r21
DS_56:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xfd66ead0	! Random illegal ?
	.word 0xe1120003  ! 1: LDQF_R	-	[%r8, %r3], %f16
	.word 0x93a1882a  ! 213: FADDs	fadds	%f6, %f10, %f9
	.word 0xd2880e60  ! 214: LDUBA_R	lduba	[%r0, %r0] 0x73, %r9
	.word 0x89500000  ! 215: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x87902224  ! 216: WRPR_TT_I	wrpr	%r0, 0x0224, %tt
	.word 0x93902003  ! 217: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902003  ! 218: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d802004  ! 219: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_HPRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc85fc000  ! 221: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x87802080  ! 222: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xc81fc000  ! 223: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0x91d020b3  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xb7500000  ! 225: RDPR_TPC	rdpr	%tpc, %r27
DS_57:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 226: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802089  ! 227: WRASI_I	wr	%r0, 0x0089, %asi
splash_tba_58:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 228: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_59:
	taddcctv %r21, 0x1eb9, %r15
	.word 0xf607e001  ! 229: LDUW_I	lduw	[%r31 + 0x0001], %r27
	.word 0x91d02034  ! 230: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xf617e001  ! 231: LDUH_I	lduh	[%r31 + 0x0001], %r27
	.word 0xf797e001  ! 232: LDQFA_I	-	[%r31, 0x0001], %f27
	.word 0xa1902000  ! 233: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d020b5  ! 234: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x93902000  ! 235: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87902218  ! 236: WRPR_TT_I	wrpr	%r0, 0x0218, %tt
splash_cmpr_60:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb185e001  ! 237: WR_STICK_REG_I	wr	%r23, 0x0001, %-
splash_tba_61:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 238: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf737e001  ! 239: STQF_I	-	%f27, [0x0001, %r31]
	.word 0x8d464000  ! 240: RD_STICK_CMPR_REG	rd	%-, %r6
	.word 0xcc8804a0  ! 241: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
splash_tba_62:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 242: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_63:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 243: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_64:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 244: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 245: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_65:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1806001  ! 246: WR_STICK_REG_I	wr	%r1, 0x0001, %-
splash_tba_66:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 247: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_67:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 248: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d514000  ! 249: RDPR_TBA	rdpr	%tba, %r6
splash_tba_68:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 250: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc8fe010  ! 251: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r6
	.word 0x38800001  ! 252: BGU	bgu,a	<label_0x1>
	.word 0x89b1cfe9  ! 253: FONES	e	%f4
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90206b  ! 255: WRPR_PSTATE_I	wrpr	%r0, 0x006b, %pstate
	.word 0xa1902009  ! 256: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8198250f  ! 257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050f, %hpstate
splash_cmpr_69:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1832001  ! 258: WR_STICK_REG_I	wr	%r12, 0x0001, %-
tagged_70:
	tsubcctv %r18, 0x14ce, %r4
	.word 0xc807e001  ! 259: LDUW_I	lduw	[%r31 + 0x0001], %r4
DS_71:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xe7356001  ! 1: STQF_I	-	%f19, [0x0001, %r21]
	normalw
	.word 0x93458000  ! 260: RD_SOFTINT_REG	rd	%softint, %r9
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 261: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 262: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9345c000  ! 263: RD_TICK_CMPR_REG	rd	%-, %r9
splash_tba_72:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 264: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902002  ! 265: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902004  ! 266: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 267: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2800c60  ! 268: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 269: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd21fe001  ! 270: LDD_I	ldd	[%r31 + 0x0001], %r9
	.word 0x8d902388  ! 271: WRPR_PSTATE_I	wrpr	%r0, 0x0388, %pstate
tagged_73:
	taddcctv %r18, 0x103d, %r17
	.word 0xd207e001  ! 272: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89864002  ! 273: WRTICK_R	wr	%r25, %r2, %tick
	.word 0xd2dfe000  ! 274: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r9
	.word 0x99902000  ! 275: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
splash_tba_75:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 276: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200e  ! 277: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa1902001  ! 278: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd2cfe000  ! 279: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r9
	.word 0x8d464000  ! 280: RD_STICK_CMPR_REG	rd	%-, %r6
	.word 0xccd804a0  ! 281: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0xcc8008a0  ! 282: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
DS_76:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f30, %f16, %f28
	.word 0x8db2c309  ! 283: ALIGNADDRESS	alignaddr	%r11, %r9, %r6
	.word 0xcc880e80  ! 284: LDUBA_R	lduba	[%r0, %r0] 0x74, %r6
tagged_77:
	taddcctv %r5, 0x15d9, %r16
	.word 0xcc07e001  ! 285: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xa5480000  ! 286: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
splash_lsu_78:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 287: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 288: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_79:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f8, %f24, %f16
	.word 0xb5b54305  ! 289: ALIGNADDRESS	alignaddr	%r21, %r5, %r26
	.word 0x2c700001  ! 290: BPNEG	<illegal instruction>
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 291: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 292: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xf457e001  ! 293: LDSH_I	ldsh	[%r31 + 0x0001], %r26
	.word 0x34800001  ! 294: BG	bg,a	<label_0x1>
splash_tba_80:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 295: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_81:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x8bb64312  ! 296: ALIGNADDRESS	alignaddr	%r25, %r18, %r5
	.word 0x91d02035  ! 297: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 298: LDX_R	ldx	[%r31 + %r0], %r5
tagged_82:
	tsubcctv %r18, 0x1819, %r9
	.word 0xca07e001  ! 299: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x93902006  ! 300: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902005  ! 301: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xca5fe001  ! 302: LDX_I	ldx	[%r31 + 0x0001], %r5
DS_83:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xafa0054d  ! 1: FSQRTd	fsqrt	
	.word 0xaba60838  ! 303: FADDs	fadds	%f24, %f24, %f21
	.word 0xea8008a0  ! 304: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0xea47e001  ! 305: LDSW_I	ldsw	[%r31 + 0x0001], %r21
	.word 0x91a01a78  ! 306: FqTOi	fqtoi	
	.word 0xd0800a60  ! 307: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r8
	.word 0xd09fc020  ! 308: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
	.word 0xd0900e40  ! 309: LDUHA_R	lduha	[%r0, %r0] 0x72, %r8
	.word 0x8d902dd6  ! 310: WRPR_PSTATE_I	wrpr	%r0, 0x0dd6, %pstate
splash_lsu_84:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd01fe001  ! 312: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x8d902790  ! 313: WRPR_PSTATE_I	wrpr	%r0, 0x0790, %pstate
	.word 0x8d9026da  ! 314: WRPR_PSTATE_I	wrpr	%r0, 0x06da, %pstate
	.word 0x93902001  ! 315: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87500000  ! 316: RDPR_TPC	rdpr	%tpc, %r3
	.word 0xc68fe000  ! 317: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r3
	.word 0x93902007  ! 318: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902c25  ! 319: WRPR_PSTATE_I	wrpr	%r0, 0x0c25, %pstate
	.word 0x93902001  ! 320: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902004  ! 321: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_tba_85:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 322: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790205c  ! 323: WRPR_TT_I	wrpr	%r0, 0x005c, %tt
	.word 0xc6d7e020  ! 324: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r3
	.word 0xc6c004a0  ! 325: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
DS_86:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 326: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902007  ! 327: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93902001  ! 328: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1902004  ! 329: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_tba_87:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 330: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 331: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_88:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 332: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90214a  ! 333: WRPR_PSTATE_I	wrpr	%r0, 0x014a, %pstate
splash_lsu_89:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 334: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 335: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x91d02032  ! 336: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc64fe001  ! 337: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	.word 0xc68008a0  ! 338: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x879023ee  ! 339: WRPR_TT_I	wrpr	%r0, 0x03ee, %tt
DS_90:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x8b7b2950	! Random illegal ?
	.word 0xd7128004  ! 1: LDQF_R	-	[%r10, %r4], %f11
	.word 0x99a04839  ! 340: FADDs	fadds	%f1, %f25, %f12
tagged_91:
	taddcctv %r21, 0x1579, %r10
	.word 0xd807e001  ! 341: LDUW_I	lduw	[%r31 + 0x0001], %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x34800001  ! 343: BG	bg,a	<label_0x1>
	.word 0x8790201a  ! 344: WRPR_TT_I	wrpr	%r0, 0x001a, %tt
tagged_92:
	tsubcctv %r23, 0x1f8c, %r5
	.word 0xd807e001  ! 345: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x93902007  ! 346: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd8d804a0  ! 348: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x36800001  ! 349: BGE	bge,a	<label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd85fc000  ! 350: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd89fc020  ! 351: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0xd89fc020  ! 352: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x85504000  ! 353: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0xa1902000  ! 354: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d802000  ! 355: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 356: LDX_R	ldx	[%r31 + %r0], %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 357: LDX_R	ldx	[%r31 + %r0], %r2
splash_lsu_93:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 358: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_94:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 359: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_95:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f0, %f28, %f16
	.word 0xafb64317  ! 360: ALIGNADDRESS	alignaddr	%r25, %r23, %r23
	.word 0xee0fe001  ! 361: LDUB_I	ldub	[%r31 + 0x0001], %r23
splash_tba_96:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 362: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x38700001  ! 363: BPGU	<illegal instruction>
	.word 0x81982e86  ! 364: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e86, %hpstate
	.word 0x87802010  ! 365: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xee8fe010  ! 366: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r23
	.word 0x8d902089  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x0089, %pstate
	.word 0xee77c017  ! 368: STX_R	stx	%r23, [%r31 + %r23]
	.word 0x93902002  ! 369: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xef37e001  ! 370: STQF_I	-	%f23, [0x0001, %r31]
tagged_97:
	taddcctv %r25, 0x17da, %r16
	.word 0xee07e001  ! 371: LDUW_I	lduw	[%r31 + 0x0001], %r23
splash_tba_98:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 372: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_99:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xdb31e001  ! 1: STQF_I	-	%f13, [0x0001, %r7]
	normalw
	.word 0x91458000  ! 373: RD_SOFTINT_REG	rd	%softint, %r8
splash_lsu_100:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 374: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d702001  ! 375: POPC_I	popc	0x0001, %r6
	.word 0x91d02032  ! 376: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x879023e9  ! 377: WRPR_TT_I	wrpr	%r0, 0x03e9, %tt
splash_htba_101:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 378: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902008  ! 379: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x87540000  ! 380: RDPR_GL	rdpr	%-, %r3
splash_tba_102:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 381: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8150c000  ! 382: RDPR_TT	rdpr	%tt, %r0
	.word 0x9f802001  ! 383: SIR	sir	0x0001
	.word 0xa3a34dc7  ! 384: FdMULq	fdmulq	
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 385: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 386: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x38800001  ! 387: BGU	bgu,a	<label_0x1>
	.word 0xe337c007  ! 388: STQF_R	-	%f17, [%r7, %r31]
splash_cmpr_103:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1826001  ! 389: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0xa1902005  ! 390: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 391: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 392: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902008  ! 393: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_tba_104:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 394: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_htba_105:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 395: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_106:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 396: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe2c804a0  ! 397: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
splash_lsu_107:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 399: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe2d004a0  ! 400: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
splash_lsu_108:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 401: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b3  ! 402: Tcc_I	ta	icc_or_xcc, %r0 + 179
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 403: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b3  ! 404: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x3c800001  ! 405: BPOS	bpos,a	<label_0x1>
	.word 0xe24fe001  ! 406: LDSB_I	ldsb	[%r31 + 0x0001], %r17
tagged_109:
	taddcctv %r24, 0x1d09, %r15
	.word 0xe207e001  ! 407: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x87902314  ! 408: WRPR_TT_I	wrpr	%r0, 0x0314, %tt
tagged_110:
	tsubcctv %r12, 0x1303, %r7
	.word 0xe207e001  ! 409: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe257c000  ! 410: LDSH_R	ldsh	[%r31 + %r0], %r17
	.word 0x38800001  ! 411: BGU	bgu,a	<label_0x1>
DS_111:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 412: RESTORE_R	restore	%r31, %r0, %r31
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 413: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x87802088  ! 414: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x38800001  ! 415: BGU	bgu,a	<label_0x1>
DS_112:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc9326001  ! 1: STQF_I	-	%f4, [0x0001, %r9]
	normalw
	.word 0x91458000  ! 416: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x879021a0  ! 417: WRPR_TT_I	wrpr	%r0, 0x01a0, %tt
	.word 0xd09fc020  ! 418: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
	.word 0x34700001  ! 419: BPG	<illegal instruction>
	.word 0xd09fe001  ! 420: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r8
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 421: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd0c004a0  ! 422: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x8f494000  ! 423: RDHPR_HTBA	rdhpr	%htba, %r7
tagged_113:
	taddcctv %r1, 0x1c42, %r17
	.word 0xce07e001  ! 424: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89854009  ! 425: WRTICK_R	wr	%r21, %r9, %tick
	.word 0x87802080  ! 426: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x879021c8  ! 427: WRPR_TT_I	wrpr	%r0, 0x01c8, %tt
	.word 0xcec004a0  ! 428: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0x81982a46  ! 429: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a46, %hpstate
splash_lsu_115:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 430: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb2d02001  ! 431: UMULcc_I	umulcc 	%r0, 0x0001, %r25
DS_116:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd131e001  ! 1: STQF_I	-	%f8, [0x0001, %r7]
	normalw
	.word 0x99458000  ! 432: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x91d02032  ! 433: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x20700001  ! 434: BPN	<illegal instruction>
	.word 0xd88804a0  ! 435: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xd8c80e40  ! 436: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r12
	.word 0xa1902004  ! 437: WRPR_GL_I	wrpr	%r0, 0x0004, %-
tagged_117:
	taddcctv %r15, 0x1ecf, %r10
	.word 0xd807e001  ! 438: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xa190200b  ! 439: WRPR_GL_I	wrpr	%r0, 0x000b, %-
tagged_118:
	tsubcctv %r7, 0x178a, %r7
	.word 0xd807e001  ! 440: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8d9025fc  ! 441: WRPR_PSTATE_I	wrpr	%r0, 0x05fc, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 442: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790207c  ! 443: WRPR_TT_I	wrpr	%r0, 0x007c, %tt
	.word 0x99902004  ! 444: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	ta	T_CHANGE_PRIV	! macro
	.word 0xd88804a0  ! 446: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_cmpr_119:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1812001  ! 447: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0xd8800be0  ! 448: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r12
	.word 0xd88008a0  ! 449: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x87902128  ! 450: WRPR_TT_I	wrpr	%r0, 0x0128, %tt
	.word 0xa2aa8017  ! 451: ANDNcc_R	andncc 	%r10, %r23, %r17
	.word 0x87802004  ! 452: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802020  ! 453: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x93d020b2  ! 454: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xa1902007  ! 455: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87902050  ! 456: WRPR_TT_I	wrpr	%r0, 0x0050, %tt
	.word 0x91d020b4  ! 457: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x91d02033  ! 458: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x99902005  ! 459: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xe2800bc0  ! 460: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r17
	.word 0x91d020b4  ! 461: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01968  ! 462: FqTOd	dis not found

	.word 0xe817c000  ! 463: LDUH_R	lduh	[%r31 + %r0], %r20
tagged_121:
	taddcctv %r18, 0x1b77, %r16
	.word 0xe807e001  ! 464: LDUW_I	lduw	[%r31 + 0x0001], %r20
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 465: LDX_R	ldx	[%r31 + %r0], %r20
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 466: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_122:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 467: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 468: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802014  ! 469: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xe89fc020  ! 470: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x87494000  ! 471: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0x87902200  ! 472: WRPR_TT_I	wrpr	%r0, 0x0200, %tt
tagged_123:
	taddcctv %r23, 0x18f1, %r12
	.word 0xc607e001  ! 473: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x93902000  ! 474: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc617c000  ! 475: LDUH_R	lduh	[%r31 + %r0], %r3
	.word 0x9f802001  ! 476: SIR	sir	0x0001
	.word 0xc61fe001  ! 477: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x9b494000  ! 478: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0xab504000  ! 479: RDPR_TNPC	rdpr	%tnpc, %r21
DS_124:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f10, %f0, %f2
	.word 0x97b2430d  ! 480: ALIGNADDRESS	alignaddr	%r9, %r13, %r11
	.word 0x8780204f  ! 481: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x34800001  ! 482: BG	bg,a	<label_0x1>
	.word 0x879022d5  ! 483: WRPR_TT_I	wrpr	%r0, 0x02d5, %tt
	.word 0x8780204f  ! 484: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x93902002  ! 485: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x26700001  ! 486: BPL	<illegal instruction>
	.word 0x91d02032  ! 487: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02033  ! 488: Tcc_I	ta	icc_or_xcc, %r0 + 51
tagged_125:
	taddcctv %r8, 0x19ac, %r2
	.word 0xd607e001  ! 489: LDUW_I	lduw	[%r31 + 0x0001], %r11
splash_cmpr_126:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181a001  ! 490: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0xd69fc020  ! 491: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0xd657e001  ! 492: LDSH_I	ldsh	[%r31 + 0x0001], %r11
tagged_127:
	taddcctv %r3, 0x1083, %r25
	.word 0xd607e001  ! 493: LDUW_I	lduw	[%r31 + 0x0001], %r11
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 494: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_128:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 495: SAVE_R	save	%r31, %r0, %r31
	.word 0x99902002  ! 496: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x91d02034  ! 497: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x80f90008  ! 498: SDIVcc_R	sdivcc 	%r4, %r8, %r0
	.word 0xc08008a0  ! 499: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc0d80e40  ! 500: LDXA_R	ldxa	[%r0, %r0] 0x72, %r0
	.word 0xc0800ba0  ! 501: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r0
splash_lsu_129:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 502: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb3494000  ! 503: RDHPR_HTBA	rdhpr	%htba, %r25
	.word 0xf28fe010  ! 504: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r25
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 505: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2800be0  ! 506: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r25
	.word 0x91d02032  ! 507: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xf25fe001  ! 508: LDX_I	ldx	[%r31 + 0x0001], %r25
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 509: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 510: SIR	sir	0x0001
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf25fc000  ! 511: LDX_R	ldx	[%r31 + %r0], %r25
tagged_130:
	tsubcctv %r19, 0x1cab, %r8
	.word 0xf207e001  ! 512: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0xf217e001  ! 513: LDUH_I	lduh	[%r31 + 0x0001], %r25
	.word 0x8d9028f4  ! 514: WRPR_PSTATE_I	wrpr	%r0, 0x08f4, %pstate
	.word 0x8d90272a  ! 515: WRPR_PSTATE_I	wrpr	%r0, 0x072a, %pstate
	.word 0x8b480000  ! 516: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
DS_131:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x87a00556  ! 1: FSQRTd	fsqrt	
	.word 0xaba5882c  ! 517: FADDs	fadds	%f22, %f12, %f21
	.word 0xea8008a0  ! 518: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 519: LDX_R	ldx	[%r31 + %r0], %r21
DS_132:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xebec4a2a	! Random illegal ?
	.word 0x97a00556  ! 1: FSQRTd	fsqrt	
	.word 0xb7a1082c  ! 520: FADDs	fadds	%f4, %f12, %f27
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf65fc000  ! 521: LDX_R	ldx	[%r31 + %r0], %r27
DS_133:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 522: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802000  ! 523: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802055  ! 524: WRASI_I	wr	%r0, 0x0055, %asi
tagged_134:
	tsubcctv %r26, 0x1bd2, %r25
	.word 0xf607e001  ! 525: LDUW_I	lduw	[%r31 + 0x0001], %r27
	.word 0xf617c000  ! 526: LDUH_R	lduh	[%r31 + %r0], %r27
DS_135:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 527: SAVE_R	save	%r31, %r0, %r31
	.word 0x93902004  ! 528: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87802088  ! 529: WRASI_I	wr	%r0, 0x0088, %asi
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 530: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_136:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 531: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d802000  ! 532: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_137:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xeb140019  ! 1: LDQF_R	-	[%r16, %r25], %f21
	.word 0x9ba10823  ! 533: FADDs	fadds	%f4, %f3, %f13
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 534: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790236b  ! 535: WRPR_TT_I	wrpr	%r0, 0x036b, %tt
tagged_138:
	tsubcctv %r25, 0x1f52, %r8
	.word 0xda07e001  ! 536: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xa1902005  ! 537: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902170  ! 538: WRPR_PSTATE_I	wrpr	%r0, 0x0170, %pstate
	.word 0xa190200d  ! 539: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xda1fe001  ! 540: LDD_I	ldd	[%r31 + 0x0001], %r13
	.word 0xda97e010  ! 541: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 542: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x9f802001  ! 543: SIR	sir	0x0001
	.word 0x8198238d  ! 544: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038d, %hpstate
	.word 0xda9004a0  ! 545: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0x87802004  ! 546: WRASI_I	wr	%r0, 0x0004, %asi
splash_lsu_139:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 547: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa969a001  ! 548: SDIVX_I	sdivx	%r6, 0x0001, %r20
	.word 0xe88008a0  ! 549: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x2a800001  ! 550: BCS	bcs,a	<label_0x1>
	.word 0xa7514000  ! 551: RDPR_TBA	rdpr	%tba, %r19
	.word 0x8780204f  ! 552: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe6800a80  ! 553: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r19
splash_tba_141:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 554: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe677e001  ! 555: STX_I	stx	%r19, [%r31 + 0x0001]
	.word 0xe61fc000  ! 556: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x93902005  ! 557: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe6d804a0  ! 558: LDXA_R	ldxa	[%r0, %r0] 0x25, %r19
	.word 0xe69fe001  ! 559: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r19
	.word 0x87802020  ! 560: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8fa689e7  ! 561: FDIVq	dis not found

	.word 0x8780201c  ! 562: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x879023aa  ! 563: WRPR_TT_I	wrpr	%r0, 0x03aa, %tt
	.word 0xce9fc020  ! 564: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	.word 0x83d02033  ! 565: Tcc_I	te	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8981000c  ! 567: WRTICK_R	wr	%r4, %r12, %tick
	.word 0xce1fc000  ! 568: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0x8790208c  ! 569: WRPR_TT_I	wrpr	%r0, 0x008c, %tt
	.word 0xcebfe001  ! 570: STDA_I	stda	%r7, [%r31 + 0x0001] %asi
	.word 0x93902005  ! 571: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902009  ! 572: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xcf3fc000  ! 573: STDF_R	std	%f7, [%r12, %r31]
	.word 0x8d902f6a  ! 574: WRPR_PSTATE_I	wrpr	%r0, 0x0f6a, %pstate
	.word 0xa1902007  ! 575: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_lsu_143:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 576: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 577: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_tba_144:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 578: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_145:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f18, %f20, %f8
	.word 0x81b60306  ! 579: ALIGNADDRESS	alignaddr	%r24, %r6, %r0
	.word 0x32700001  ! 580: BPNE	<illegal instruction>
	.word 0x93902006  ! 581: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 582: LDX_R	ldx	[%r31 + %r0], %r0
splash_tba_146:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 583: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc0d7e020  ! 584: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r0
	.word 0xc097e010  ! 585: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r0
	.word 0x8f540000  ! 586: RDPR_GL	rdpr	%-, %r7
	.word 0xced7e010  ! 587: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r7
	.word 0xce880e40  ! 588: LDUBA_R	lduba	[%r0, %r0] 0x72, %r7
	.word 0x87802088  ! 589: WRASI_I	wr	%r0, 0x0088, %asi
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 590: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 591: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_147:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 592: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce97e010  ! 593: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r7
	.word 0xce900e80  ! 594: LDUHA_R	lduha	[%r0, %r0] 0x74, %r7
tagged_148:
	tsubcctv %r12, 0x1c87, %r15
	.word 0xce07e001  ! 595: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xcf27e001  ! 596: STF_I	st	%f7, [0x0001, %r31]
	.word 0x93902007  ! 597: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_149:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 598: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_150:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 599: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87802010  ! 600: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87902066  ! 601: WRPR_TT_I	wrpr	%r0, 0x0066, %tt
	.word 0xa190200d  ! 602: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87514000  ! 603: RDPR_TBA	rdpr	%tba, %r3
tagged_151:
	taddcctv %r6, 0x19e3, %r6
	.word 0xc607e001  ! 604: LDUW_I	lduw	[%r31 + 0x0001], %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 605: LDX_R	ldx	[%r31 + %r0], %r3
splash_tba_152:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 606: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc6d804a0  ! 607: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0xa190200f  ! 608: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xc64fe001  ! 609: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	.word 0xa1902005  ! 610: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x28800001  ! 611: BLEU	bleu,a	<label_0x1>
	.word 0xc6cfe000  ! 612: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r3
	.word 0x81982f0d  ! 613: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0d, %hpstate
	.word 0xc68008a0  ! 614: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xa1902001  ! 615: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93902001  ! 616: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_153:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa9b08311  ! 617: ALIGNADDRESS	alignaddr	%r2, %r17, %r20
	.word 0x9550c000  ! 618: RDPR_TT	rdpr	%tt, %r10
	.word 0xd48008a0  ! 619: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd48fe000  ! 620: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0x30700001  ! 621: BPA	<illegal instruction>
splash_lsu_154:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 622: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_155:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 623: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x81982f8d  ! 624: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8d, %hpstate
	.word 0xd417c000  ! 625: LDUH_R	lduh	[%r31 + %r0], %r10
DS_156:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 626: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd48008a0  ! 627: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 628: LDX_R	ldx	[%r31 + %r0], %r10
tagged_157:
	taddcctv %r16, 0x1392, %r6
	.word 0xd407e001  ! 629: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd49004a0  ! 630: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
DS_158:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 631: SAVE_R	save	%r31, %r0, %r31
splash_htba_159:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 632: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d020b5  ! 633: Tcc_I	ta	icc_or_xcc, %r0 + 181
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 634: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_160:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 635: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 636: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982b4c  ! 637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4c, %hpstate
	.word 0xd48fe020  ! 638: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0x93902000  ! 639: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_161:
	taddcctv %r25, 0x1929, %r6
	.word 0xd407e001  ! 640: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xb1540000  ! 641: RDPR_GL	rdpr	%-, %r24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1800016  ! 642: WR_STICK_REG_R	wr	%r0, %r22, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0xf117c000  ! 644: LDQF_R	-	[%r31, %r0], %f24
	.word 0xf0800c00  ! 645: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r24
splash_tba_163:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 646: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9026cf  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x06cf, %pstate
	.word 0x24800001  ! 648: BLE	ble,a	<label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf05fc000  ! 649: LDX_R	ldx	[%r31 + %r0], %r24
splash_tba_164:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 650: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902007  ! 651: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902008  ! 652: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8f540000  ! 653: RDPR_GL	rdpr	%-, %r7
tagged_165:
	taddcctv %r8, 0x1dcc, %r23
	.word 0xce07e001  ! 654: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x81982107  ! 655: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0107, %hpstate
DS_166:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 656: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xced7e030  ! 657: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r7
splash_tba_167:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 658: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902005  ! 659: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87802058  ! 660: WRASI_I	wr	%r0, 0x0058, %asi
splash_tba_168:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 661: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802058  ! 662: WRASI_I	wr	%r0, 0x0058, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 663: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x99902000  ! 664: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xb1514000  ! 665: RDPR_TBA	rdpr	%tba, %r24
	.word 0x93902000  ! 666: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d802000  ! 667: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xf08008a0  ! 668: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89834013  ! 669: WRTICK_R	wr	%r13, %r19, %tick
splash_tba_170:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 670: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf09004a0  ! 671: LDUHA_R	lduha	[%r0, %r0] 0x25, %r24
splash_lsu_171:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 672: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916b2001  ! 673: SDIVX_I	sdivx	%r12, 0x0001, %r8
splash_htba_173:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 674: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87500000  ! 675: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x8d902b9f  ! 676: WRPR_PSTATE_I	wrpr	%r0, 0x0b9f, %pstate
	.word 0xc647e001  ! 677: LDSW_I	ldsw	[%r31 + 0x0001], %r3
tagged_174:
	tsubcctv %r25, 0x1f86, %r15
	.word 0xc607e001  ! 678: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc797e001  ! 679: LDQFA_I	-	[%r31, 0x0001], %f3
splash_tba_175:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 680: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68008a0  ! 681: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x879023bf  ! 682: WRPR_TT_I	wrpr	%r0, 0x03bf, %tt
	.word 0xc6c804a0  ! 683: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
tagged_176:
	tsubcctv %r26, 0x1db4, %r23
	.word 0xc607e001  ! 684: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x91d020b5  ! 685: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xc60fc000  ! 686: LDUB_R	ldub	[%r31 + %r0], %r3
splash_lsu_177:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 687: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902000  ! 688: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
splash_tba_178:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 689: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc6d004a0  ! 690: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 691: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc61fe001  ! 692: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0xc68008a0  ! 693: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x9f802001  ! 694: SIR	sir	0x0001
DS_179:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 695: SAVE_R	save	%r31, %r0, %r31
	.word 0xc64fe001  ! 696: LDSB_I	ldsb	[%r31 + 0x0001], %r3
DS_180:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd7366001  ! 1: STQF_I	-	%f11, [0x0001, %r25]
	normalw
	.word 0x81458000  ! 697: RD_SOFTINT_REG	stbar
	.word 0xc0d004a0  ! 698: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r0
	.word 0xc0880e60  ! 699: LDUBA_R	lduba	[%r0, %r0] 0x73, %r0
	.word 0xc08fe010  ! 700: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r0
splash_cmpr_181:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182a001  ! 701: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0xc0cfe020  ! 702: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r0
splash_tba_182:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 703: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc00fc000  ! 704: LDUB_R	ldub	[%r31 + %r0], %r0
DS_183:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 705: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc09fc020  ! 706: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0x879020fe  ! 707: WRPR_TT_I	wrpr	%r0, 0x00fe, %tt
	.word 0x81982955  ! 708: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0955, %hpstate
tagged_184:
	tsubcctv %r15, 0x1cb0, %r11
	.word 0xc007e001  ! 709: LDUW_I	lduw	[%r31 + 0x0001], %r0
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802020  ! 711: WRASI_I	wr	%r0, 0x0020, %asi
splash_lsu_185:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 712: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90277b  ! 713: WRPR_PSTATE_I	wrpr	%r0, 0x077b, %pstate
	.word 0x93902001  ! 714: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_186:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 715: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc017e001  ! 716: LDUH_I	lduh	[%r31 + 0x0001], %r0
	.word 0x879022ed  ! 717: WRPR_TT_I	wrpr	%r0, 0x02ed, %tt
	.word 0xc0d80e40  ! 718: LDXA_R	ldxa	[%r0, %r0] 0x72, %r0
	.word 0xc01fc000  ! 719: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0xc09fc020  ! 720: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 721: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc05fe001  ! 722: LDX_I	ldx	[%r31 + 0x0001], %r0
	.word 0x8790214a  ! 723: WRPR_TT_I	wrpr	%r0, 0x014a, %tt
	.word 0x91d020b4  ! 724: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8d802000  ! 725: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f802001  ! 726: SIR	sir	0x0001
	.word 0xc01fe001  ! 727: LDD_I	ldd	[%r31 + 0x0001], %r0
tagged_187:
	taddcctv %r9, 0x151b, %r16
	.word 0xc007e001  ! 728: LDUW_I	lduw	[%r31 + 0x0001], %r0
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 729: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982607  ! 730: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0607, %hpstate
splash_tba_188:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 731: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d90266c  ! 732: WRPR_PSTATE_I	wrpr	%r0, 0x066c, %pstate
	.word 0x93902000  ! 733: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc047c000  ! 734: LDSW_R	ldsw	[%r31 + %r0], %r0
	.word 0x87802058  ! 735: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xc08804a0  ! 736: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
tagged_189:
	taddcctv %r20, 0x1e94, %r24
	.word 0xc007e001  ! 737: LDUW_I	lduw	[%r31 + 0x0001], %r0
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 738: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_190:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180a001  ! 739: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0x8198261c  ! 740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061c, %hpstate
splash_lsu_191:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 741: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_192:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc330a001  ! 1: STQF_I	-	%f1, [0x0001, %r2]
	normalw
	.word 0xb7458000  ! 742: RD_SOFTINT_REG	rd	%softint, %r27
	.word 0x8d90290e  ! 743: WRPR_PSTATE_I	wrpr	%r0, 0x090e, %pstate
	.word 0x87802089  ! 744: WRASI_I	wr	%r0, 0x0089, %asi
DS_193:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f18, %f26, %f4
	.word 0x93b1c300  ! 745: ALIGNADDRESS	alignaddr	%r7, %r0, %r9
splash_lsu_194:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 746: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_195:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 747: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d90206e  ! 748: WRPR_PSTATE_I	wrpr	%r0, 0x006e, %pstate
	ta	T_CHANGE_PRIV	! macro
splash_tba_196:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 750: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x26700001  ! 751: BPL	<illegal instruction>
	.word 0xd20fc000  ! 752: LDUB_R	ldub	[%r31 + %r0], %r9
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89834003  ! 753: WRTICK_R	wr	%r13, %r3, %tick
DS_198:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa3b2c306  ! 754: ALIGNADDRESS	alignaddr	%r11, %r6, %r17
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 755: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe29fe001  ! 756: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
	.word 0x93902006  ! 757: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x3a700001  ! 758: BPCC	<illegal instruction>
	.word 0x8350c000  ! 759: RDPR_TT	rdpr	%tt, %r1
	.word 0x93902004  ! 760: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902000  ! 761: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_lsu_199:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 762: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902bbb  ! 763: WRPR_PSTATE_I	wrpr	%r0, 0x0bbb, %pstate
	.word 0xc28008a0  ! 764: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
splash_lsu_200:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 765: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 766: LDX_R	ldx	[%r31 + %r0], %r1
DS_201:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x8fb18302  ! 767: ALIGNADDRESS	alignaddr	%r6, %r2, %r7
	.word 0x87802010  ! 768: WRASI_I	wr	%r0, 0x0010, %asi
tagged_202:
	tsubcctv %r11, 0x137a, %r21
	.word 0xce07e001  ! 769: LDUW_I	lduw	[%r31 + 0x0001], %r7
tagged_203:
	taddcctv %r12, 0x172c, %r19
	.word 0xce07e001  ! 770: LDUW_I	lduw	[%r31 + 0x0001], %r7
tagged_204:
	tsubcctv %r4, 0x1435, %r13
	.word 0xce07e001  ! 771: LDUW_I	lduw	[%r31 + 0x0001], %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 772: LDX_R	ldx	[%r31 + %r0], %r7
splash_htba_205:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 773: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xab494000  ! 774: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0x91d02034  ! 775: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_206:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 777: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xea9fe001  ! 778: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r21
	.word 0x20700001  ! 779: BPN	<illegal instruction>
	.word 0x2a700001  ! 780: BPCS	<illegal instruction>
tagged_207:
	taddcctv %r3, 0x1152, %r23
	.word 0xea07e001  ! 781: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0x87802088  ! 782: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902005  ! 783: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902b93  ! 784: WRPR_PSTATE_I	wrpr	%r0, 0x0b93, %pstate
	.word 0x87802080  ! 785: WRASI_I	wr	%r0, 0x0080, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xea5fc000  ! 786: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0x8780201c  ! 787: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x879022b1  ! 788: WRPR_TT_I	wrpr	%r0, 0x02b1, %tt
splash_lsu_208:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 789: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97494000  ! 790: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0xd797e001  ! 791: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0x8d90227f  ! 792: WRPR_PSTATE_I	wrpr	%r0, 0x027f, %pstate
	.word 0xd6cfe000  ! 793: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	.word 0xd657c000  ! 794: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0xd607c000  ! 795: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0xa190200a  ! 796: WRPR_GL_I	wrpr	%r0, 0x000a, %-
DS_209:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9144009  ! 1: LDQF_R	-	[%r17, %r9], %f12
	.word 0xb5a1c823  ! 797: FADDs	fadds	%f7, %f3, %f26
	.word 0x88dd4004  ! 798: SMULcc_R	smulcc 	%r21, %r4, %r4
splash_lsu_210:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 799: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 800: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9480000  ! 801: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xe89fc020  ! 802: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 803: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_211:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 804: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe8c80e60  ! 805: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r20
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe85fc000  ! 806: LDX_R	ldx	[%r31 + %r0], %r20
	ta	T_CHANGE_PRIV	! macro
tagged_212:
	tsubcctv %r8, 0x1dcc, %r7
	.word 0xe807e001  ! 808: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x8790216f  ! 809: WRPR_TT_I	wrpr	%r0, 0x016f, %tt
	.word 0x87802016  ! 810: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xe88008a0  ! 811: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
DS_213:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x91b68319  ! 812: ALIGNADDRESS	alignaddr	%r26, %r25, %r8
	.word 0xd09fc020  ! 813: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
splash_tba_214:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 814: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902007  ! 815: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_tba_215:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 816: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8345c000  ! 817: RD_TICK_CMPR_REG	rd	%-, %r1
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 818: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902f57  ! 819: WRPR_PSTATE_I	wrpr	%r0, 0x0f57, %pstate
	.word 0x8d902c03  ! 820: WRPR_PSTATE_I	wrpr	%r0, 0x0c03, %pstate
	.word 0xc247e001  ! 821: LDSW_I	ldsw	[%r31 + 0x0001], %r1
	.word 0xc2c80e60  ! 822: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r1
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 823: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_216:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 824: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902002  ! 825: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_217:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 826: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_218:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 827: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02032  ! 828: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x28700001  ! 829: BPLEU	<illegal instruction>
	.word 0xc28804a0  ! 830: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
DS_219:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x91b4030d  ! 831: ALIGNADDRESS	alignaddr	%r16, %r13, %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd05fc000  ! 832: LDX_R	ldx	[%r31 + %r0], %r8
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 833: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd05fe001  ! 834: LDX_I	ldx	[%r31 + 0x0001], %r8
	.word 0xa1514000  ! 835: RDPR_TBA	rdpr	%tba, %r16
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe05fc000  ! 836: LDX_R	ldx	[%r31 + %r0], %r16
DS_220:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xb3d5263b	! Random illegal ?
	.word 0xef100003  ! 1: LDQF_R	-	[%r0, %r3], %f23
	.word 0x85a14821  ! 837: FADDs	fadds	%f5, %f1, %f2
splash_htba_221:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 838: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_222:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 839: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 840: LDX_R	ldx	[%r31 + %r0], %r2
splash_tba_223:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 841: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790239c  ! 842: WRPR_TT_I	wrpr	%r0, 0x039c, %tt
	.word 0xad464000  ! 843: RD_STICK_CMPR_REG	rd	%-, %r22
	.word 0x9f802001  ! 844: SIR	sir	0x0001
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xec5fc000  ! 845: LDX_R	ldx	[%r31 + %r0], %r22
	.word 0xec8fe000  ! 846: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r22
DS_224:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f12, %f20, %f26
	.word 0xb3b6830c  ! 847: ALIGNADDRESS	alignaddr	%r26, %r12, %r25
	.word 0x8d902e80  ! 848: WRPR_PSTATE_I	wrpr	%r0, 0x0e80, %pstate
splash_lsu_225:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 849: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf2cfe000  ! 850: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r25
DS_226:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 851: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xf397e001  ! 852: LDQFA_I	-	[%r31, 0x0001], %f25
	.word 0x87902256  ! 853: WRPR_TT_I	wrpr	%r0, 0x0256, %tt
tagged_227:
	taddcctv %r13, 0x1e8f, %r17
	.word 0xf207e001  ! 854: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0xf2800c80  ! 855: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r25
splash_tba_228:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 856: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf317c000  ! 857: LDQF_R	-	[%r31, %r0], %f25
splash_tba_229:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 858: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200a  ! 859: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xf28008a0  ! 860: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8d9029e2  ! 861: WRPR_PSTATE_I	wrpr	%r0, 0x09e2, %pstate
	.word 0xf297e000  ! 862: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r25
	.word 0x83d020b4  ! 863: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x8780201c  ! 864: WRASI_I	wr	%r0, 0x001c, %asi
DS_230:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 865: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 866: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 867: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xf24fc000  ! 868: LDSB_R	ldsb	[%r31 + %r0], %r25
	.word 0x91d02032  ! 869: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_231:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x97a00543  ! 1: FSQRTd	fsqrt	
	.word 0xafa08834  ! 870: FADDs	fadds	%f2, %f20, %f23
	.word 0x91d020b2  ! 871: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8d9024ad  ! 872: WRPR_PSTATE_I	wrpr	%r0, 0x04ad, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 873: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 874: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 875: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_232:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 876: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 877: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xee5fc000  ! 878: LDX_R	ldx	[%r31 + %r0], %r23
splash_lsu_233:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 879: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902818  ! 880: WRPR_PSTATE_I	wrpr	%r0, 0x0818, %pstate
DS_234:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xabb0030d  ! 881: ALIGNADDRESS	alignaddr	%r0, %r13, %r21
	.word 0x8780204f  ! 882: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xeac804a0  ! 883: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r21
splash_lsu_235:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 884: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_236:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 885: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xea07c000  ! 886: LDUW_R	lduw	[%r31 + %r0], %r21
	.word 0xeac80e80  ! 887: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r21
	.word 0xa1902007  ! 888: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xea8008a0  ! 889: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0x93902006  ! 890: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xead7e000  ! 891: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r21
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x85a01977  ! 892: FqTOd	dis not found

	.word 0x8198235f  ! 893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035f, %hpstate
	.word 0xab464000  ! 894: RD_STICK_CMPR_REG	rd	%-, %r21
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 895: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 896: LDX_R	ldx	[%r31 + %r0], %r21
DS_238:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 897: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d9024dc  ! 898: WRPR_PSTATE_I	wrpr	%r0, 0x04dc, %pstate
splash_tba_239:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 899: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_PRIV	! macro
	.word 0xea57e001  ! 901: LDSH_I	ldsh	[%r31 + 0x0001], %r21
splash_lsu_240:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 902: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 903: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0xea07c000  ! 904: LDUW_R	lduw	[%r31 + %r0], %r21
	.word 0x93902006  ! 905: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xea880e80  ! 906: LDUBA_R	lduba	[%r0, %r0] 0x74, %r21
splash_lsu_241:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 907: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 908: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x36700001  ! 909: BPGE	<illegal instruction>
	.word 0x93902004  ! 910: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa190200f  ! 911: WRPR_GL_I	wrpr	%r0, 0x000f, %-
DS_242:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe9306001  ! 1: STQF_I	-	%f20, [0x0001, %r1]
	normalw
	.word 0x97458000  ! 912: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xd607c000  ! 913: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0xd6dfe030  ! 914: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0xd797e001  ! 915: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0x8d902263  ! 916: WRPR_PSTATE_I	wrpr	%r0, 0x0263, %pstate
	.word 0x9f802001  ! 917: SIR	sir	0x0001
	.word 0x8d802000  ! 918: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x85504000  ! 919: RDPR_TNPC	rdpr	%tnpc, %r2
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 920: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_243:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 921: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_244:
	tsubcctv %r11, 0x104c, %r7
	.word 0xc407e001  ! 922: LDUW_I	lduw	[%r31 + 0x0001], %r2
splash_cmpr_245:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1866001  ! 923: WR_STICK_REG_I	wr	%r25, 0x0001, %-
DS_246:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 924: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x879022b0  ! 925: WRPR_TT_I	wrpr	%r0, 0x02b0, %tt
	.word 0x87802004  ! 926: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d9022c2  ! 927: WRPR_PSTATE_I	wrpr	%r0, 0x02c2, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 928: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xb351c000  ! 929: RDPR_TL	rdpr	%tl, %r25
	.word 0x8f464000  ! 930: RD_STICK_CMPR_REG	rd	%-, %r7
	.word 0xce4fc000  ! 931: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0x8d902c17  ! 932: WRPR_PSTATE_I	wrpr	%r0, 0x0c17, %pstate
DS_247:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe732a001  ! 1: STQF_I	-	%f19, [0x0001, %r10]
	normalw
	.word 0xb1458000  ! 933: RD_SOFTINT_REG	rd	%softint, %r24
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93696001  ! 934: SDIVX_I	sdivx	%r5, 0x0001, %r9
	.word 0xd217e001  ! 935: LDUH_I	lduh	[%r31 + 0x0001], %r9
	.word 0xd21fe001  ! 936: LDD_I	ldd	[%r31 + 0x0001], %r9
	.word 0xd397e001  ! 937: LDQFA_I	-	[%r31, 0x0001], %f9
	.word 0xd24fe001  ! 938: LDSB_I	ldsb	[%r31 + 0x0001], %r9
	.word 0x2a800001  ! 939: BCS	bcs,a	<label_0x1>
	.word 0x879022e1  ! 940: WRPR_TT_I	wrpr	%r0, 0x02e1, %tt
splash_tba_249:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 941: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_250:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 942: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd2d7e030  ! 943: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r9
	.word 0x8d902563  ! 944: WRPR_PSTATE_I	wrpr	%r0, 0x0563, %pstate
	.word 0xd2cfe030  ! 945: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r9
	.word 0x83d02032  ! 946: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x93902001  ! 947: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd28008a0  ! 948: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d802004  ! 949: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8b494000  ! 950: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0xca0fc000  ! 951: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0x91d02034  ! 952: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902000  ! 953: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 954: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 955: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xb1540000  ! 956: RDPR_GL	rdpr	%-, %r24
change_to_randtl_251:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 957: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x91d02034  ! 958: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8780204f  ! 959: WRASI_I	wr	%r0, 0x004f, %asi
DS_252:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xbd48df97	! Random illegal ?
	.word 0x85a00557  ! 1: FSQRTd	fsqrt	
	.word 0x95a6c825  ! 960: FADDs	fadds	%f27, %f5, %f10
	.word 0xd537e001  ! 961: STQF_I	-	%f10, [0x0001, %r31]
	.word 0xb1a000d5  ! 962: FNEGd	fnegd	%f52, %f24
	.word 0x8d802000  ! 963: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_lsu_253:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 964: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf08804a0  ! 965: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
splash_tba_254:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 966: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf047c000  ! 967: LDSW_R	ldsw	[%r31 + %r0], %r24
splash_lsu_255:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3c700001  ! 969: BPPOS	<illegal instruction>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf05fc000  ! 970: LDX_R	ldx	[%r31 + %r0], %r24
	.word 0x93902002  ! 971: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87802089  ! 972: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xf047e001  ! 973: LDSW_I	ldsw	[%r31 + 0x0001], %r24
	.word 0xf007c000  ! 974: LDUW_R	lduw	[%r31 + %r0], %r24
	.word 0x93902007  ! 975: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902004  ! 976: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02035  ! 977: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_256:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 978: SAVE_R	save	%r31, %r0, %r31
	.word 0xf09fc020  ! 979: LDDA_R	ldda	[%r31, %r0] 0x01, %r24
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 980: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982c4d  ! 981: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4d, %hpstate
splash_tba_257:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 982: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf01fe001  ! 983: LDD_I	ldd	[%r31 + 0x0001], %r24
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 984: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8790210a  ! 985: WRPR_TT_I	wrpr	%r0, 0x010a, %tt
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 986: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf0800c60  ! 987: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r24
	.word 0x8780201c  ! 988: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb7a01966  ! 989: FqTOd	dis not found

	.word 0xa282c019  ! 990: ADDcc_R	addcc 	%r11, %r25, %r17
splash_htba_259:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 991: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8780201c  ! 992: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xa1902007  ! 993: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8790239f  ! 994: WRPR_TT_I	wrpr	%r0, 0x039f, %tt
	.word 0x99902001  ! 995: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8f500000  ! 996: RDPR_TPC	rdpr	%tpc, %r7
	.word 0x93902004  ! 997: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 998: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 999: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90292b  ! 1000: WRPR_PSTATE_I	wrpr	%r0, 0x092b, %pstate
	.word 0x8d500000  ! 1001: RDPR_TPC	rdpr	%tpc, %r6
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xcc5fc000  ! 1002: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x93902000  ! 1003: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x99902005  ! 1004: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
splash_lsu_260:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1005: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc0fc000  ! 1006: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x87802058  ! 1007: WRASI_I	wr	%r0, 0x0058, %asi
tagged_261:
	taddcctv %r8, 0x124f, %r8
	.word 0xcc07e001  ! 1008: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xa7464000  ! 1009: RD_STICK_CMPR_REG	rd	%-, %r19
splash_htba_262:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1010: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91a01966  ! 1011: FqTOd	dis not found

	.word 0xd117c000  ! 1012: LDQF_R	-	[%r31, %r0], %f8
	.word 0x97504000  ! 1013: RDPR_TNPC	rdpr	%tnpc, %r11
splash_lsu_264:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1014: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd64fc000  ! 1015: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0xd6c804a0  ! 1016: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
splash_tba_265:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1017: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd6c004a0  ! 1018: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 1019: LDX_R	ldx	[%r31 + %r0], %r11
tagged_266:
	tsubcctv %r8, 0x15e0, %r23
	.word 0xd607e001  ! 1020: LDUW_I	lduw	[%r31 + 0x0001], %r11
	ta	T_CHANGE_PRIV	! macro
splash_lsu_267:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1022: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_268:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1023: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902253  ! 1024: WRPR_TT_I	wrpr	%r0, 0x0253, %tt
	.word 0xad504000  ! 1025: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x8d902423  ! 1026: WRPR_PSTATE_I	wrpr	%r0, 0x0423, %pstate
splash_tba_269:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1027: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x24800001  ! 1028: BLE	ble,a	<label_0x1>
	.word 0x8790238d  ! 1029: WRPR_TT_I	wrpr	%r0, 0x038d, %tt
	.word 0x8d902ec3  ! 1030: WRPR_PSTATE_I	wrpr	%r0, 0x0ec3, %pstate
	.word 0x99500000  ! 1031: RDPR_TPC	rdpr	%tpc, %r12
splash_tba_270:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1032: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd897e000  ! 1033: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_271:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1822001  ! 1034: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	.word 0x97500000  ! 1035: RDPR_TPC	<illegal instruction>
	.word 0xd68804a0  ! 1036: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
tagged_272:
	tsubcctv %r19, 0x1a98, %r25
	.word 0xd607e001  ! 1037: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd607c000  ! 1038: LDUW_R	lduw	[%r31 + %r0], %r11
tagged_273:
	taddcctv %r24, 0x1c2e, %r11
	.word 0xd607e001  ! 1039: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd68008a0  ! 1040: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xa1902008  ! 1041: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd69fe001  ! 1042: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
	.word 0xd61fc000  ! 1043: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xa190200b  ! 1044: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xa190200e  ! 1045: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_tba_274:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1046: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_275:
	taddcctv %r12, 0x13bd, %r7
	.word 0xd607e001  ! 1047: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x3a800001  ! 1048: BCC	bcc,a	<label_0x1>
tagged_276:
	tsubcctv %r22, 0x1689, %r17
	.word 0xd607e001  ! 1049: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd68008a0  ! 1050: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd68008a0  ! 1051: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1052: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 1053: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_277:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1054: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 1055: LDX_R	ldx	[%r31 + %r0], %r11
DS_278:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1056: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xd68008a0  ! 1057: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x83d020b2  ! 1058: Tcc_I	te	icc_or_xcc, %r0 + 178
DS_279:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa1b2c309  ! 1059: ALIGNADDRESS	alignaddr	%r11, %r9, %r16
	.word 0xe04fc000  ! 1060: LDSB_R	ldsb	[%r31 + %r0], %r16
splash_lsu_280:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1061: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe057c000  ! 1062: LDSH_R	ldsh	[%r31 + %r0], %r16
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe05fc000  ! 1063: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0800c80  ! 1064: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r16
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe05fc000  ! 1065: LDX_R	ldx	[%r31 + %r0], %r16
tagged_281:
	taddcctv %r6, 0x162a, %r26
	.word 0xe007e001  ! 1066: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe01fe001  ! 1067: LDD_I	ldd	[%r31 + 0x0001], %r16
	.word 0x87802080  ! 1068: WRASI_I	wr	%r0, 0x0080, %asi
splash_lsu_282:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1069: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9968e001  ! 1070: SDIVX_I	sdivx	%r3, 0x0001, %r12
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 1072: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_284:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1073: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad514000  ! 1074: RDPR_TBA	rdpr	%tba, %r22
	.word 0xec8008a0  ! 1075: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x91d02032  ! 1076: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902d5f  ! 1077: WRPR_PSTATE_I	wrpr	%r0, 0x0d5f, %pstate
change_to_randtl_285:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1078: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
tagged_286:
	tsubcctv %r19, 0x1af8, %r24
	.word 0xec07e001  ! 1079: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x87802080  ! 1080: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa190200c  ! 1081: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xecd7e020  ! 1082: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r22
tagged_287:
	taddcctv %r12, 0x1c9c, %r6
	.word 0xec07e001  ! 1083: LDUW_I	lduw	[%r31 + 0x0001], %r22
DS_288:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xd5ccf882	! Random illegal ?
	.word 0x8fa00543  ! 1: FSQRTd	fsqrt	
	.word 0x87a4c830  ! 1084: FADDs	fadds	%f19, %f16, %f3
	.word 0xc60fc000  ! 1085: LDUB_R	ldub	[%r31 + %r0], %r3
	.word 0x99902005  ! 1086: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
DS_289:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1087: SAVE_R	save	%r31, %r0, %r31
	.word 0x30700001  ! 1088: BPA	<illegal instruction>
	.word 0x93902004  ! 1089: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9f802001  ! 1090: SIR	sir	0x0001
	.word 0x93902001  ! 1091: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x879022bb  ! 1092: WRPR_TT_I	wrpr	%r0, 0x02bb, %tt
	.word 0xc647e001  ! 1093: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 1094: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc6d004a0  ! 1095: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	.word 0x93902004  ! 1096: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x83a04dc9  ! 1097: FdMULq	fdmulq	
	.word 0xc257c000  ! 1098: LDSH_R	ldsh	[%r31 + %r0], %r1
tagged_290:
	tsubcctv %r13, 0x184a, %r13
	.word 0xc207e001  ! 1099: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x83d02035  ! 1100: Tcc_I	te	icc_or_xcc, %r0 + 53
DS_291:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x87a0054a  ! 1: FSQRTd	fsqrt	
	.word 0xada20820  ! 1101: FADDs	fadds	%f8, %f0, %f22
	.word 0xed17c000  ! 1102: LDQF_R	-	[%r31, %r0], %f22
splash_lsu_292:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1103: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xec4fe001  ! 1104: LDSB_I	ldsb	[%r31 + 0x0001], %r22
	.word 0x87802088  ! 1105: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xecd80e40  ! 1106: LDXA_R	ldxa	[%r0, %r0] 0x72, %r22
	.word 0xec8008a0  ! 1107: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1108: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xec8fe020  ! 1109: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r22
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xec5fc000  ! 1110: LDX_R	ldx	[%r31 + %r0], %r22
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1111: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 1112: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xec8008a0  ! 1113: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x8d90229b  ! 1114: WRPR_PSTATE_I	wrpr	%r0, 0x029b, %pstate
	.word 0xec8008a0  ! 1115: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
DS_293:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1116: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xec9fe001  ! 1117: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r22
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902007  ! 1119: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93902007  ! 1120: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xec47c000  ! 1121: LDSW_R	ldsw	[%r31 + %r0], %r22
	.word 0x87802020  ! 1122: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xb5514000  ! 1123: RDPR_TBA	rdpr	%tba, %r26
	.word 0x9f802001  ! 1124: SIR	sir	0x0001
	.word 0x36800001  ! 1125: BGE	bge,a	<label_0x1>
	.word 0xa1902006  ! 1126: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xf43fe001  ! 1127: STD_I	std	%r26, [%r31 + 0x0001]
	.word 0xf44fc000  ! 1128: LDSB_R	ldsb	[%r31 + %r0], %r26
	.word 0x93d02032  ! 1129: Tcc_I	tne	icc_or_xcc, %r0 + 50
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1130: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf44fe001  ! 1131: LDSB_I	ldsb	[%r31 + 0x0001], %r26
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1132: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_294:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1133: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 1134: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x34800001  ! 1135: BG	bg,a	<label_0x1>
splash_tba_295:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1136: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_296:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f28, %f12, %f8
	.word 0x8fb68313  ! 1137: ALIGNADDRESS	alignaddr	%r26, %r19, %r7
	.word 0xcf97e001  ! 1138: LDQFA_I	-	[%r31, 0x0001], %f7
	.word 0x93902001  ! 1139: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d802000  ! 1140: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1141: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcec7e030  ! 1142: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r7
DS_297:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa1b18317  ! 1143: ALIGNADDRESS	alignaddr	%r6, %r23, %r16
	.word 0xe08008a0  ! 1144: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	ta	T_CHANGE_PRIV	! macro
DS_298:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f8, %f12, %f18
	.word 0x99b6431a  ! 1146: ALIGNADDRESS	alignaddr	%r25, %r26, %r12
	.word 0xa1902007  ! 1147: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd8c804a0  ! 1148: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x8d504000  ! 1149: RDPR_TNPC	rdpr	%tnpc, %r6
DS_299:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd5344003  ! 1: STQF_R	-	%f10, [%r3, %r17]
	normalw
	.word 0xad458000  ! 1150: RD_SOFTINT_REG	rd	%softint, %r22
	.word 0xec3fe001  ! 1151: STD_I	std	%r22, [%r31 + 0x0001]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1858006  ! 1152: WR_STICK_REG_R	wr	%r22, %r6, %-
splash_lsu_301:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1153: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb6804009  ! 1154: ADDcc_R	addcc 	%r1, %r9, %r27
	.word 0x97500000  ! 1155: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x91d02033  ! 1156: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd6c804a0  ! 1157: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	.word 0x93902002  ! 1158: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902cc4  ! 1159: WRPR_PSTATE_I	wrpr	%r0, 0x0cc4, %pstate
	.word 0xd6c804a0  ! 1160: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	.word 0xab500000  ! 1161: RDPR_TPC	rdpr	%tpc, %r21
	.word 0xea8008a0  ! 1162: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0x87902111  ! 1163: WRPR_TT_I	wrpr	%r0, 0x0111, %tt
splash_lsu_302:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1164: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1165: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x30700001  ! 1166: BPA	<illegal instruction>
	.word 0x87802014  ! 1167: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xeac804a0  ! 1168: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r21
DS_303:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xabb58308  ! 1169: ALIGNADDRESS	alignaddr	%r22, %r8, %r21
	.word 0x93902002  ! 1170: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
tagged_304:
	tsubcctv %r26, 0x169c, %r14
	.word 0xea07e001  ! 1171: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0xea1fc000  ! 1172: LDD_R	ldd	[%r31 + %r0], %r21
	.word 0xea47c000  ! 1173: LDSW_R	ldsw	[%r31 + %r0], %r21
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1174: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 1175: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xea9fc020  ! 1176: LDDA_R	ldda	[%r31, %r0] 0x01, %r21
splash_tba_305:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1177: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_306:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1178: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xea97e000  ! 1179: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
	.word 0xea8804a0  ! 1180: LDUBA_R	lduba	[%r0, %r0] 0x25, %r21
DS_307:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xed312001  ! 1: STQF_I	-	%f22, [0x0001, %r4]
	normalw
	.word 0xab458000  ! 1181: RD_SOFTINT_REG	rd	%softint, %r21
	.word 0x879022c2  ! 1182: WRPR_TT_I	wrpr	%r0, 0x02c2, %tt
	.word 0xa190200d  ! 1183: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902005  ! 1184: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb181c002  ! 1185: WR_STICK_REG_R	wr	%r7, %r2, %-
	.word 0x8d802000  ! 1186: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02035  ! 1187: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xea800be0  ! 1188: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r21
	.word 0x87802089  ! 1189: WRASI_I	wr	%r0, 0x0089, %asi
DS_309:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x95b30300  ! 1190: ALIGNADDRESS	alignaddr	%r12, %r0, %r10
	.word 0xd4800bc0  ! 1191: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r10
	.word 0x81982b5d  ! 1192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5d, %hpstate
	.word 0xd40fe001  ! 1193: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1808003  ! 1194: WR_STICK_REG_R	wr	%r2, %r3, %-
	.word 0xa190200f  ! 1195: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_311:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1196: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24800001  ! 1197: BLE	ble,a	<label_0x1>
splash_lsu_312:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1198: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd497e030  ! 1199: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0x8790231b  ! 1200: WRPR_TT_I	wrpr	%r0, 0x031b, %tt
	.word 0x93902002  ! 1201: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_313:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1202: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_314:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1203: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_315:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x95b60313  ! 1204: ALIGNADDRESS	alignaddr	%r24, %r19, %r10
	.word 0x2e700001  ! 1205: BPVS	<illegal instruction>
	.word 0xd41fe001  ! 1206: LDD_I	ldd	[%r31 + 0x0001], %r10
	.word 0x91d020b4  ! 1207: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd41fc000  ! 1208: LDD_R	ldd	[%r31 + %r0], %r10
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1209: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_316:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1210: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd41fe001  ! 1211: LDD_I	ldd	[%r31 + 0x0001], %r10
change_to_randtl_317:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1212: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
DS_318:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1213: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
splash_tba_319:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1214: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1215: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd49fe001  ! 1216: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
splash_cmpr_320:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182a001  ! 1217: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0x91d02033  ! 1218: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x99902004  ! 1219: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xd4dfe020  ! 1220: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
splash_cmpr_321:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1836001  ! 1221: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0xa1902005  ! 1222: WRPR_GL_I	wrpr	%r0, 0x0005, %-
tagged_322:
	tsubcctv %r3, 0x12f1, %r2
	.word 0xd407e001  ! 1223: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4c004a0  ! 1224: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0xd49fe001  ! 1225: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0xd48008a0  ! 1226: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd42fe001  ! 1227: STB_I	stb	%r10, [%r31 + 0x0001]
	.word 0x8d802004  ! 1228: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_323:
	taddcctv %r23, 0x1cef, %r24
	.word 0xd407e001  ! 1229: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_lsu_324:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81494000  ! 1231: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0x91d02035  ! 1232: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc007c000  ! 1233: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0x8790217c  ! 1234: WRPR_TT_I	wrpr	%r0, 0x017c, %tt
splash_lsu_325:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1235: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc0c00e40  ! 1236: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r0
tagged_326:
	tsubcctv %r13, 0x1bc4, %r1
	.word 0xc007e001  ! 1237: LDUW_I	lduw	[%r31 + 0x0001], %r0
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc05fc000  ! 1238: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc0cfe020  ! 1239: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r0
	.word 0xc127c013  ! 1240: STF_R	st	%f0, [%r19, %r31]
	.word 0x879020ca  ! 1241: WRPR_TT_I	wrpr	%r0, 0x00ca, %tt
	.word 0xa1902008  ! 1242: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8790238f  ! 1243: WRPR_TT_I	wrpr	%r0, 0x038f, %tt
	.word 0x83d02035  ! 1244: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xc0d00e80  ! 1245: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r0
change_to_randtl_327:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1246: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1247: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_328:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1248: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1249: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba0196c  ! 1250: FqTOd	dis not found

	.word 0x2a700001  ! 1251: BPCS	<illegal instruction>
	.word 0x819826cd  ! 1252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cd, %hpstate
tagged_330:
	tsubcctv %r16, 0x1798, %r16
	.word 0xda07e001  ! 1253: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda57c000  ! 1254: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x87902049  ! 1255: WRPR_TT_I	wrpr	%r0, 0x0049, %tt
	.word 0x93480000  ! 1256: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
splash_lsu_331:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1257: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_332:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1258: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1259: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879020ac  ! 1260: WRPR_TT_I	wrpr	%r0, 0x00ac, %tt
splash_lsu_333:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd29fe001  ! 1262: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
	.word 0xd207c000  ! 1263: LDUW_R	lduw	[%r31 + %r0], %r9
	.word 0xd217c000  ! 1264: LDUH_R	lduh	[%r31 + %r0], %r9
	.word 0x3a700001  ! 1265: BPCC	<illegal instruction>
	.word 0x8d902a5c  ! 1266: WRPR_PSTATE_I	wrpr	%r0, 0x0a5c, %pstate
splash_lsu_334:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1267: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd25fc000  ! 1268: LDX_R	ldx	[%r31 + %r0], %r9
splash_lsu_335:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1269: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd21fc000  ! 1270: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x879020b7  ! 1271: WRPR_TT_I	wrpr	%r0, 0x00b7, %tt
	.word 0xd29fe001  ! 1272: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
	.word 0xd297e020  ! 1273: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
	.word 0x9f802001  ! 1274: SIR	sir	0x0001
	.word 0x8d902e38  ! 1275: WRPR_PSTATE_I	wrpr	%r0, 0x0e38, %pstate
	.word 0xa1902006  ! 1276: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902004  ! 1277: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x24700001  ! 1278: BPLE	<illegal instruction>
	.word 0x87802020  ! 1279: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8d90279c  ! 1280: WRPR_PSTATE_I	wrpr	%r0, 0x079c, %pstate
	.word 0x8d902e8c  ! 1281: WRPR_PSTATE_I	wrpr	%r0, 0x0e8c, %pstate
	.word 0xa1902009  ! 1282: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d02035  ! 1283: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd29004a0  ! 1284: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1285: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd217c000  ! 1286: LDUH_R	lduh	[%r31 + %r0], %r9
	.word 0xd28008a0  ! 1287: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x85514000  ! 1288: RDPR_TBA	rdpr	%tba, %r2
tagged_336:
	tsubcctv %r12, 0x1074, %r6
	.word 0xc407e001  ! 1289: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x89508000  ! 1290: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0xc8dfe030  ! 1291: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r4
splash_tba_337:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1292: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 1293: LDX_R	ldx	[%r31 + %r0], %r4
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 1294: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa569e001  ! 1295: SDIVX_I	sdivx	%r7, 0x0001, %r18
tagged_339:
	taddcctv %r14, 0x1085, %r26
	.word 0xe407e001  ! 1296: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0xe49fc020  ! 1297: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 1298: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802058  ! 1299: WRASI_I	wr	%r0, 0x0058, %asi
splash_tba_340:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1300: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02033  ! 1301: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902002  ! 1302: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_341:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1866001  ! 1303: WR_STICK_REG_I	wr	%r25, 0x0001, %-
	.word 0x87802020  ! 1304: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x879021a8  ! 1305: WRPR_TT_I	wrpr	%r0, 0x01a8, %tt
	.word 0xa190200d  ! 1306: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d9022e3  ! 1307: WRPR_PSTATE_I	wrpr	%r0, 0x02e3, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe45fc000  ! 1308: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x8780201c  ! 1309: WRASI_I	wr	%r0, 0x001c, %asi
splash_lsu_342:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_343:
	taddcctv %r4, 0x133b, %r3
	.word 0xe407e001  ! 1311: LDUW_I	lduw	[%r31 + 0x0001], %r18
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1312: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_344:
	tsubcctv %r12, 0x1031, %r23
	.word 0xe407e001  ! 1313: LDUW_I	lduw	[%r31 + 0x0001], %r18
splash_lsu_345:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1314: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_346:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1315: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02033  ! 1316: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe597e001  ! 1317: LDQFA_I	-	[%r31, 0x0001], %f18
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83508000  ! 1319: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8ba01967  ! 1320: FqTOd	dis not found

	.word 0xca5fe001  ! 1321: LDX_I	ldx	[%r31 + 0x0001], %r5
	.word 0x91d02034  ! 1322: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d020b3  ! 1323: Tcc_I	ta	icc_or_xcc, %r0 + 179
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1324: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902180  ! 1325: WRPR_PSTATE_I	wrpr	%r0, 0x0180, %pstate
	.word 0x93902004  ! 1326: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xca9fc020  ! 1327: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
	.word 0xca800c60  ! 1328: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r5
	.word 0x87802055  ! 1329: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xca800b00  ! 1330: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r5
splash_tba_348:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1331: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_349:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1332: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xca0fc000  ! 1333: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0xcad7e010  ! 1334: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r5
splash_lsu_350:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1335: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 1336: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_351:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1816001  ! 1337: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 1338: LDX_R	ldx	[%r31 + %r0], %r5
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1339: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca57e001  ! 1340: LDSH_I	ldsh	[%r31 + 0x0001], %r5
splash_tba_352:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1341: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xca5fc000  ! 1342: LDX_R	ldx	[%r31 + %r0], %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcac80e40  ! 1344: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r5
	.word 0x91d020b5  ! 1345: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_tba_353:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1346: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_htba_354:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1347: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_355:
	taddcctv %r5, 0x13db, %r24
	.word 0xca07e001  ! 1348: LDUW_I	lduw	[%r31 + 0x0001], %r5
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 1349: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xca800bc0  ! 1350: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r5
	.word 0x93902003  ! 1351: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
tagged_356:
	tsubcctv %r21, 0x1009, %r21
	.word 0xca07e001  ! 1352: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xcac7e010  ! 1353: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
	.word 0xa1902009  ! 1354: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xb7464000  ! 1355: RD_STICK_CMPR_REG	rd	%-, %r27
	.word 0xf6dfe020  ! 1356: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r27
splash_lsu_357:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1357: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902dbe  ! 1358: WRPR_PSTATE_I	wrpr	%r0, 0x0dbe, %pstate
	.word 0xf6c7e000  ! 1359: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r27
	.word 0x91d020b4  ! 1360: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x91d02034  ! 1361: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d9021d2  ! 1362: WRPR_PSTATE_I	wrpr	%r0, 0x01d2, %pstate
splash_tba_358:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1363: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x26700001  ! 1364: BPL	<illegal instruction>
	.word 0x87802010  ! 1365: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_HPRIV	! macro
DS_359:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd511c017  ! 1: LDQF_R	-	[%r7, %r23], %f10
	.word 0xb1a50835  ! 1367: FADDs	fadds	%f20, %f21, %f24
	.word 0x91d02034  ! 1368: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_360:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1802001  ! 1369: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	.word 0xf08fe020  ! 1370: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r24
	.word 0x99902001  ! 1371: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_tba_361:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1372: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_362:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1373: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x22800001  ! 1374: BE	be,a	<label_0x1>
	.word 0x93902005  ! 1375: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f802001  ! 1376: SIR	sir	0x0001
	.word 0x8d90285b  ! 1377: WRPR_PSTATE_I	wrpr	%r0, 0x085b, %pstate
	.word 0xf057c000  ! 1378: LDSH_R	ldsh	[%r31 + %r0], %r24
	.word 0x8b514000  ! 1379: RDPR_TBA	rdpr	%tba, %r5
	.word 0x99902004  ! 1380: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x82694009  ! 1381: UDIVX_R	udivx 	%r5, %r9, %r1
	.word 0xc24fc000  ! 1382: LDSB_R	ldsb	[%r31 + %r0], %r1
splash_tba_363:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1383: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc397e001  ! 1384: LDQFA_I	-	[%r31, 0x0001], %f1
	.word 0xc257c000  ! 1385: LDSH_R	ldsh	[%r31 + %r0], %r1
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc25fc000  ! 1386: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x8d90231d  ! 1387: WRPR_PSTATE_I	wrpr	%r0, 0x031d, %pstate
	.word 0xb1a409b1  ! 1388: FDIVs	fdivs	%f16, %f17, %f24
	.word 0x81504000  ! 1389: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0xa1902000  ! 1390: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87a049c5  ! 1391: FDIVd	fdivd	%f32, %f36, %f34
	.word 0x87802020  ! 1392: WRASI_I	wr	%r0, 0x0020, %asi
tagged_364:
	tsubcctv %r23, 0x1627, %r17
	.word 0xc607e001  ! 1393: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_tba_365:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1394: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8345c000  ! 1395: RD_TICK_CMPR_REG	rd	%-, %r1
	.word 0xa1902009  ! 1396: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d902c22  ! 1397: WRPR_PSTATE_I	wrpr	%r0, 0x0c22, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 1398: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xc207c000  ! 1399: LDUW_R	lduw	[%r31 + %r0], %r1
	.word 0x8790227c  ! 1400: WRPR_TT_I	wrpr	%r0, 0x027c, %tt
	.word 0xc207c000  ! 1401: LDUW_R	lduw	[%r31 + %r0], %r1
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc25fc000  ! 1402: LDX_R	ldx	[%r31 + %r0], %r1
tagged_366:
	tsubcctv %r6, 0x11c6, %r2
	.word 0xc207e001  ! 1403: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc2c804a0  ! 1404: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	.word 0x87802004  ! 1405: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa5500000  ! 1406: RDPR_TPC	rdpr	%tpc, %r18
	.word 0x93d02035  ! 1407: Tcc_I	tne	icc_or_xcc, %r0 + 53
tagged_367:
	taddcctv %r9, 0x11cd, %r13
	.word 0xe407e001  ! 1408: LDUW_I	lduw	[%r31 + 0x0001], %r18
DS_368:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1409: SAVE_R	save	%r31, %r0, %r31
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe45fc000  ! 1410: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x83d02034  ! 1411: Tcc_I	te	icc_or_xcc, %r0 + 52
splash_tba_369:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1412: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe4d7e020  ! 1413: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
splash_lsu_370:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1414: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902318  ! 1415: WRPR_TT_I	wrpr	%r0, 0x0318, %tt
	.word 0x93902005  ! 1416: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_371:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1417: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879023db  ! 1418: WRPR_TT_I	wrpr	%r0, 0x03db, %tt
	.word 0x91d02035  ! 1419: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982757  ! 1420: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0757, %hpstate
	.word 0x93902002  ! 1421: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d802004  ! 1422: WRFPRS_I	wr	%r0, 0x0004, %fprs
tagged_372:
	tsubcctv %r20, 0x18cd, %r12
	.word 0xe407e001  ! 1423: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x8d90298e  ! 1424: WRPR_PSTATE_I	wrpr	%r0, 0x098e, %pstate
	.word 0x91d020b4  ! 1425: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xe4c00e80  ! 1426: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r18
	.word 0x8d902994  ! 1427: WRPR_PSTATE_I	wrpr	%r0, 0x0994, %pstate
	.word 0x83d020b5  ! 1428: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xa190200d  ! 1429: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01966  ! 1430: FqTOd	dis not found

splash_lsu_374:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1431: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 1432: LDX_R	ldx	[%r31 + %r0], %r9
tagged_375:
	taddcctv %r11, 0x16c6, %r1
	.word 0xd207e001  ! 1433: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x87802020  ! 1434: WRASI_I	wr	%r0, 0x0020, %asi
splash_tba_376:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1435: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x34700001  ! 1436: BPG	<illegal instruction>
	.word 0xa1902006  ! 1437: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902004  ! 1438: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd2cfe010  ! 1439: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x8d902584  ! 1440: WRPR_PSTATE_I	wrpr	%r0, 0x0584, %pstate
splash_cmpr_377:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180e001  ! 1441: WR_STICK_REG_I	wr	%r3, 0x0001, %-
DS_378:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1442: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902861  ! 1443: WRPR_PSTATE_I	wrpr	%r0, 0x0861, %pstate
DS_379:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xcd34c00a  ! 1: STQF_R	-	%f6, [%r10, %r19]
	normalw
	.word 0x99458000  ! 1444: RD_SOFTINT_REG	rd	%softint, %r12
splash_cmpr_380:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182e001  ! 1445: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0xd847e001  ! 1446: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 1447: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d802000  ! 1448: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 1449: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d902ca4  ! 1450: WRPR_PSTATE_I	wrpr	%r0, 0x0ca4, %pstate
	.word 0x8d902713  ! 1451: WRPR_PSTATE_I	wrpr	%r0, 0x0713, %pstate
	.word 0xd897e030  ! 1452: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
DS_381:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1453: SAVE_R	save	%r31, %r0, %r31
tagged_382:
	tsubcctv %r22, 0x1952, %r19
	.word 0xd807e001  ! 1454: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd8c804a0  ! 1455: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x91d020b3  ! 1456: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa3508000  ! 1457: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xa1902007  ! 1458: WRPR_GL_I	wrpr	%r0, 0x0007, %-
tagged_383:
	taddcctv %r9, 0x1714, %r6
	.word 0xe207e001  ! 1459: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe2c7e000  ! 1460: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r17
	.word 0xe29fc020  ! 1461: LDDA_R	ldda	[%r31, %r0] 0x01, %r17
DS_384:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xed32a001  ! 1: STQF_I	-	%f22, [0x0001, %r10]
	normalw
	.word 0x99458000  ! 1462: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd88008a0  ! 1463: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd8800b00  ! 1464: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r12
	.word 0x8198244d  ! 1465: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044d, %hpstate
	.word 0xd817e001  ! 1466: LDUH_I	lduh	[%r31 + 0x0001], %r12
change_to_randtl_385:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1467: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x876c2001  ! 1468: SDIVX_I	sdivx	%r16, 0x0001, %r3
	.word 0xc7e7c02a  ! 1469: CASA_I	casa	[%r31] 0x 1, %r10, %r3
	.word 0x8d802000  ! 1470: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902004  ! 1471: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_387:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1472: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x93d020b4  ! 1473: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x81982ecd  ! 1474: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecd, %hpstate
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89834003  ! 1475: WRTICK_R	wr	%r13, %r3, %tick
	.word 0xc6d7e030  ! 1476: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r3
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1808002  ! 1477: WR_STICK_REG_R	wr	%r2, %r2, %-
	.word 0x93902002  ! 1478: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1479: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6d004a0  ! 1480: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1481: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 1482: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1483: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 1484: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa1902005  ! 1485: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_tba_390:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1486: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc6d804a0  ! 1488: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1489: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x3a800001  ! 1490: BCC	bcc,a	<label_0x1>
	.word 0xa190200e  ! 1491: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x9151c000  ! 1492: RDPR_TL	rdpr	%tl, %r8
DS_391:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1493: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902006  ! 1494: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902007  ! 1495: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd04fe001  ! 1496: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0xd057e001  ! 1497: LDSH_I	ldsh	[%r31 + 0x0001], %r8
	.word 0x8b504000  ! 1498: RDPR_TNPC	rdpr	%tnpc, %r5
splash_cmpr_392:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184e001  ! 1499: WR_STICK_REG_I	wr	%r19, 0x0001, %-
splash_tba_393:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1500: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_394:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1501: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_395:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1502: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xa190200c  ! 1503: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d902039  ! 1504: WRPR_PSTATE_I	wrpr	%r0, 0x0039, %pstate
	.word 0xcadfe000  ! 1505: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r5
	.word 0x8790204e  ! 1506: WRPR_TT_I	wrpr	%r0, 0x004e, %tt
	.word 0xcac004a0  ! 1507: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0x8d902f6b  ! 1508: WRPR_PSTATE_I	wrpr	%r0, 0x0f6b, %pstate
splash_lsu_396:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1509: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3c700001  ! 1510: BPPOS	<illegal instruction>
	.word 0xa1902005  ! 1511: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xcad004a0  ! 1512: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0x3c700001  ! 1513: BPPOS	<illegal instruction>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1514: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcac004a0  ! 1515: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8982c009  ! 1516: WRTICK_R	wr	%r11, %r9, %tick
	.word 0xca9fc020  ! 1517: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
	.word 0x8d90289f  ! 1518: WRPR_PSTATE_I	wrpr	%r0, 0x089f, %pstate
	.word 0x8d90235b  ! 1519: WRPR_PSTATE_I	wrpr	%r0, 0x035b, %pstate
	.word 0x879020a4  ! 1520: WRPR_TT_I	wrpr	%r0, 0x00a4, %tt
splash_htba_398:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1521: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_399:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc330e001  ! 1: STQF_I	-	%f1, [0x0001, %r3]
	normalw
	.word 0xa1458000  ! 1522: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0xe09004a0  ! 1523: LDUHA_R	lduha	[%r0, %r0] 0x25, %r16
	.word 0x93902000  ! 1524: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe097e030  ! 1525: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe05fc000  ! 1526: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe0dfe030  ! 1527: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r16
	.word 0x8d902b24  ! 1528: WRPR_PSTATE_I	wrpr	%r0, 0x0b24, %pstate
splash_lsu_400:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1529: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_401:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186e001  ! 1530: WR_STICK_REG_I	wr	%r27, 0x0001, %-
DS_402:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0x8bb28302  ! 1531: ALIGNADDRESS	alignaddr	%r10, %r2, %r5
splash_tba_403:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1532: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1533: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xca0fe001  ! 1534: LDUB_I	ldub	[%r31 + 0x0001], %r5
	.word 0x24700001  ! 1535: BPLE	<illegal instruction>
	.word 0x93902002  ! 1536: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902000  ! 1537: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_404:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1538: SAVE_R	save	%r31, %r0, %r31
	.word 0xca57c000  ! 1539: LDSH_R	ldsh	[%r31 + %r0], %r5
	.word 0x87902142  ! 1540: WRPR_TT_I	wrpr	%r0, 0x0142, %tt
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d020b5  ! 1542: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xcac80e80  ! 1543: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r5
	.word 0xcad00e80  ! 1544: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r5
	.word 0x93902003  ! 1545: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x2a800001  ! 1546: BCS	bcs,a	<label_0x1>
DS_405:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc3304012  ! 1: STQF_R	-	%f1, [%r18, %r1]
	normalw
	.word 0x89458000  ! 1547: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x81514000  ! 1548: RDPR_TBA	rdpr	%tba, %r0
	.word 0x93902006  ! 1549: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_tba_406:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1550: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8da01a7a  ! 1551: FqTOi	fqtoi	
	.word 0x9b464000  ! 1552: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x91d02034  ! 1553: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xdac004a0  ! 1554: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x879022c4  ! 1555: WRPR_TT_I	wrpr	%r0, 0x02c4, %tt
DS_407:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xef10c012  ! 1: LDQF_R	-	[%r3, %r18], %f23
	.word 0xb3a6482b  ! 1556: FADDs	fadds	%f25, %f11, %f25
	.word 0xf247c000  ! 1557: LDSW_R	ldsw	[%r31 + %r0], %r25
DS_408:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0x89b00314  ! 1558: ALIGNADDRESS	alignaddr	%r0, %r20, %r4
	.word 0xc88fe020  ! 1559: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r4
	.word 0x9f802001  ! 1560: SIR	sir	0x0001
	.word 0xc88fe020  ! 1561: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r4
	.word 0xc8900e40  ! 1562: LDUHA_R	lduha	[%r0, %r0] 0x72, %r4
	.word 0x87802014  ! 1563: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc897e020  ! 1564: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r4
DS_409:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f22, %f6, %f2
	.word 0x8bb24306  ! 1565: ALIGNADDRESS	alignaddr	%r9, %r6, %r5
	.word 0x93902003  ! 1566: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902004  ! 1567: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x9350c000  ! 1568: RDPR_TT	rdpr	%tt, %r9
	.word 0x8780201c  ! 1569: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x87802010  ! 1570: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xa1902000  ! 1571: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x879022cf  ! 1572: WRPR_TT_I	wrpr	%r0, 0x02cf, %tt
	.word 0xd29004a0  ! 1573: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
tagged_410:
	tsubcctv %r5, 0x190b, %r9
	.word 0xd207e001  ! 1574: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xa1902007  ! 1575: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd2c7e000  ! 1576: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
splash_lsu_411:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1577: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 1579: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd2c80e60  ! 1580: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r9
	.word 0x879020d1  ! 1581: WRPR_TT_I	wrpr	%r0, 0x00d1, %tt
	.word 0xa1902000  ! 1582: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87902083  ! 1583: WRPR_TT_I	wrpr	%r0, 0x0083, %tt
	.word 0xab494000  ! 1584: RDHPR_HTBA	rdhpr	%htba, %r21
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 1585: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_412:
	tsubcctv %r3, 0x1b21, %r19
	.word 0xea07e001  ! 1586: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0x8790220f  ! 1587: WRPR_TT_I	wrpr	%r0, 0x020f, %tt
splash_tba_413:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1588: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x2e700001  ! 1589: BPVS	<illegal instruction>
splash_tba_414:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1590: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d02032  ! 1591: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_lsu_415:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1592: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1593: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_416:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1594: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_417:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1595: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d020b4  ! 1596: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_lsu_418:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1597: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xeb27c006  ! 1598: STF_R	st	%f21, [%r6, %r31]
	.word 0xea800aa0  ! 1599: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r21
splash_tba_419:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1600: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x28700001  ! 1601: BPLEU	<illegal instruction>
	.word 0xa1902008  ! 1602: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xea27c006  ! 1604: STW_R	stw	%r21, [%r31 + %r6]
DS_420:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1605: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x38700001  ! 1606: BPGU	<illegal instruction>
	.word 0xea4fe001  ! 1607: LDSB_I	ldsb	[%r31 + 0x0001], %r21
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 1608: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879021c8  ! 1609: WRPR_TT_I	wrpr	%r0, 0x01c8, %tt
	.word 0x91d020b3  ! 1610: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xea0fc000  ! 1611: LDUB_R	ldub	[%r31 + %r0], %r21
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1612: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b480000  ! 1613: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1614: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879021ec  ! 1615: WRPR_TT_I	wrpr	%r0, 0x01ec, %tt
	.word 0xa190200c  ! 1616: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xca9fc020  ! 1617: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
splash_tba_421:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1618: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902960  ! 1619: WRPR_PSTATE_I	wrpr	%r0, 0x0960, %pstate
	.word 0xca47e001  ! 1620: LDSW_I	ldsw	[%r31 + 0x0001], %r5
DS_422:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x8553b1e3	! Random illegal ?
	.word 0x8fa00557  ! 1: FSQRTd	fsqrt	
	.word 0x85a34827  ! 1621: FADDs	fadds	%f13, %f7, %f2
	ta	T_CHANGE_PRIV	! macro
	.word 0xc48008a0  ! 1623: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
splash_tba_423:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1624: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802010  ! 1625: WRASI_I	wr	%r0, 0x0010, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1626: LDX_R	ldx	[%r31 + %r0], %r2
splash_lsu_424:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1627: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_425:
	taddcctv %r2, 0x1626, %r7
	.word 0xc407e001  ! 1628: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc48fe010  ! 1629: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc4c00e60  ! 1631: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r2
	.word 0xc4c7e020  ! 1632: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
splash_tba_426:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1633: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc457e001  ! 1634: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0x9ba009a3  ! 1635: FDIVs	fdivs	%f0, %f3, %f13
	.word 0x99902005  ! 1636: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xda4fe001  ! 1637: LDSB_I	ldsb	[%r31 + 0x0001], %r13
splash_tba_427:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1638: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b2  ! 1639: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_tba_428:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1640: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xda5fc000  ! 1641: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x8b514000  ! 1642: RDPR_TBA	rdpr	%tba, %r5
	.word 0xa1902006  ! 1643: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d802000  ! 1644: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xca8008a0  ! 1645: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x3c800001  ! 1646: BPOS	bpos,a	<label_0x1>
splash_tba_429:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1647: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790217a  ! 1648: WRPR_TT_I	wrpr	%r0, 0x017a, %tt
splash_lsu_430:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1649: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 1650: WRASI_I	wr	%r0, 0x0089, %asi
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 1652: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 1653: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x24700001  ! 1654: BPLE	<illegal instruction>
	.word 0x26800001  ! 1655: BL	bl,a	<label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1656: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_431:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1657: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_432:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1658: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_433:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1659: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x95a24dc6  ! 1660: FdMULq	fdmulq	
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd45fc000  ! 1661: LDX_R	ldx	[%r31 + %r0], %r10
tagged_434:
	tsubcctv %r2, 0x1556, %r11
	.word 0xd407e001  ! 1662: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x3e800001  ! 1663: BVC	bvc,a	<label_0x1>
	.word 0x20800001  ! 1664: BN	bn,a	<label_0x1>
	.word 0xa1902002  ! 1665: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1666: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd457c000  ! 1667: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0xd4c804a0  ! 1668: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0xd4d804a0  ! 1669: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
tagged_435:
	taddcctv %r6, 0x1303, %r23
	.word 0xd407e001  ! 1670: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x2a700001  ! 1671: BPCS	<illegal instruction>
	.word 0x91d020b2  ! 1672: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd447e001  ! 1673: LDSW_I	ldsw	[%r31 + 0x0001], %r10
splash_lsu_436:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1674: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790229e  ! 1675: WRPR_TT_I	wrpr	%r0, 0x029e, %tt
	.word 0xd497e000  ! 1676: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0xd457c000  ! 1677: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0xd4c00e80  ! 1678: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
tagged_437:
	taddcctv %r13, 0x1019, %r8
	.word 0xd407e001  ! 1679: LDUW_I	lduw	[%r31 + 0x0001], %r10
tagged_438:
	tsubcctv %r3, 0x17b4, %r21
	.word 0xd407e001  ! 1680: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d802000  ! 1681: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d02035  ! 1682: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xd447e001  ! 1683: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	.word 0xd457e001  ! 1684: LDSH_I	ldsh	[%r31 + 0x0001], %r10
	.word 0xd48008a0  ! 1685: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x93d020b4  ! 1686: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x8d9020b5  ! 1687: WRPR_PSTATE_I	wrpr	%r0, 0x00b5, %pstate
	.word 0x20700001  ! 1688: BPN	<illegal instruction>
	.word 0x93d02033  ! 1689: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_tba_439:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1690: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 1691: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd517c000  ! 1692: LDQF_R	-	[%r31, %r0], %f10
	.word 0x91d02034  ! 1693: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd45fe001  ! 1694: LDX_I	ldx	[%r31 + 0x0001], %r10
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd45fc000  ! 1695: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x8d802000  ! 1696: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902a5f  ! 1697: WRPR_PSTATE_I	wrpr	%r0, 0x0a5f, %pstate
	.word 0x87902089  ! 1698: WRPR_TT_I	wrpr	%r0, 0x0089, %tt
	.word 0xa190200a  ! 1699: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x819825c7  ! 1700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c7, %hpstate
	.word 0x8d902fab  ! 1701: WRPR_PSTATE_I	wrpr	%r0, 0x0fab, %pstate
	.word 0xd537e001  ! 1702: STQF_I	-	%f10, [0x0001, %r31]
	.word 0x87902067  ! 1703: WRPR_TT_I	wrpr	%r0, 0x0067, %tt
	.word 0x8d902c8e  ! 1704: WRPR_PSTATE_I	wrpr	%r0, 0x0c8e, %pstate
tagged_440:
	tsubcctv %r16, 0x13bd, %r23
	.word 0xd407e001  ! 1705: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x879020df  ! 1706: WRPR_TT_I	wrpr	%r0, 0x00df, %tt
	.word 0xd4880e80  ! 1707: LDUBA_R	lduba	[%r0, %r0] 0x74, %r10
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1708: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x93902000  ! 1709: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x36700001  ! 1710: BPGE	<illegal instruction>
	.word 0x81982186  ! 1711: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0186, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1712: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802063  ! 1713: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93d02034  ! 1714: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x87802014  ! 1715: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa190200a  ! 1716: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1717: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_441:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1718: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd48804a0  ! 1719: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0xd48008a0  ! 1720: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x8145c000  ! 1721: RD_TICK_CMPR_REG	stbar
	.word 0xc09fc020  ! 1722: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89810006  ! 1723: WRTICK_R	wr	%r4, %r6, %tick
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1724: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc0dfe030  ! 1725: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r0
splash_lsu_443:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1726: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 1727: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc08008a0  ! 1728: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1729: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 1730: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902004  ! 1731: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_444:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1732: RESTORE_R	restore	%r31, %r0, %r31
splash_htba_445:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1733: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_446:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1734: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc047c000  ! 1735: LDSW_R	ldsw	[%r31 + %r0], %r0
	.word 0x8198284d  ! 1736: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084d, %hpstate
	.word 0xc01fc000  ! 1737: LDD_R	ldd	[%r31 + %r0], %r0
DS_447:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x91b20306  ! 1738: ALIGNADDRESS	alignaddr	%r8, %r6, %r8
	.word 0xa190200f  ! 1739: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd04fc000  ! 1740: LDSB_R	ldsb	[%r31 + %r0], %r8
	.word 0xd0cfe000  ! 1741: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r8
	.word 0x93902003  ! 1742: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8780201c  ! 1743: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd0d804a0  ! 1744: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0x28700001  ! 1745: BPLEU	<illegal instruction>
	.word 0x24700001  ! 1746: BPLE	<illegal instruction>
	.word 0xa1902001  ! 1747: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x9f802001  ! 1748: SIR	sir	0x0001
	.word 0xd0c7e030  ! 1749: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r8
	.word 0xd0800b80  ! 1750: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r8
	.word 0x97514000  ! 1751: RDPR_TBA	rdpr	%tba, %r11
	.word 0x8d9021a5  ! 1752: WRPR_PSTATE_I	wrpr	%r0, 0x01a5, %pstate
splash_lsu_448:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1753: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9027b5  ! 1754: WRPR_PSTATE_I	wrpr	%r0, 0x07b5, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902007  ! 1756: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d9028b8  ! 1757: WRPR_PSTATE_I	wrpr	%r0, 0x08b8, %pstate
	.word 0x87802020  ! 1758: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87902128  ! 1759: WRPR_TT_I	wrpr	%r0, 0x0128, %tt
	.word 0x2c700001  ! 1760: BPNEG	<illegal instruction>
tagged_449:
	taddcctv %r24, 0x1de8, %r18
	.word 0xd607e001  ! 1761: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd69fc020  ! 1762: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0x8780204f  ! 1763: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x879020c9  ! 1764: WRPR_TT_I	wrpr	%r0, 0x00c9, %tt
splash_tba_450:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1765: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802004  ! 1766: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93d02033  ! 1767: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d902fc5  ! 1768: WRPR_PSTATE_I	wrpr	%r0, 0x0fc5, %pstate
	.word 0xd68008a0  ! 1769: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x91514000  ! 1770: RDPR_TBA	rdpr	%tba, %r8
	.word 0xd08008a0  ! 1771: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 1772: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x87902326  ! 1773: WRPR_TT_I	wrpr	%r0, 0x0326, %tt
	.word 0x93902006  ! 1774: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1775: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902040  ! 1776: WRPR_TT_I	wrpr	%r0, 0x0040, %tt
splash_lsu_451:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1777: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02035  ! 1778: Tcc_I	tne	icc_or_xcc, %r0 + 53
DS_452:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f8, %f24, %f18
	.word 0x85b2c307  ! 1779: ALIGNADDRESS	alignaddr	%r11, %r7, %r2
	.word 0xa1902004  ! 1780: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x3a700001  ! 1781: BPCC	<illegal instruction>
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1782: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_453:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1836001  ! 1783: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0xc417c000  ! 1784: LDUH_R	lduh	[%r31 + %r0], %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc447c000  ! 1786: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0xc48008a0  ! 1787: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902006  ! 1789: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc4bfe001  ! 1790: STDA_I	stda	%r2, [%r31 + 0x0001] %asi
	.word 0xc49fe001  ! 1791: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1792: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x3c700001  ! 1793: BPPOS	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
splash_tba_454:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1795: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d020b2  ! 1796: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x3a800001  ! 1797: BCC	bcc,a	<label_0x1>
	.word 0xc48008a0  ! 1798: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc48fe030  ! 1799: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r2
	.word 0x8d90297f  ! 1800: WRPR_PSTATE_I	wrpr	%r0, 0x097f, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1801: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc49fe001  ! 1802: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
splash_lsu_455:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1803: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc40fe001  ! 1804: LDUB_I	ldub	[%r31 + 0x0001], %r2
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1805: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802063  ! 1806: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x99902005  ! 1807: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xc44fe001  ! 1808: LDSB_I	ldsb	[%r31 + 0x0001], %r2
	.word 0xc4d80e40  ! 1809: LDXA_R	ldxa	[%r0, %r0] 0x72, %r2
	.word 0xc447e001  ! 1810: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	.word 0xc48008a0  ! 1811: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc4c004a0  ! 1813: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
	.word 0x87802004  ! 1814: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_456:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1815: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1816: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc4800b60  ! 1817: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r2
	.word 0x81982715  ! 1818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0715, %hpstate
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8da01966  ! 1819: FqTOd	dis not found

	.word 0xa1902008  ! 1820: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xcc8008a0  ! 1821: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x93902005  ! 1822: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
change_to_randtl_458:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1823: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xcc9fc020  ! 1824: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
splash_htba_459:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1825: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcc800bc0  ! 1826: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r6
splash_cmpr_460:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 1827: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x9b540000  ! 1828: RDPR_GL	<illegal instruction>
splash_htba_461:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1829: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xda1fe001  ! 1830: LDD_I	ldd	[%r31 + 0x0001], %r13
tagged_462:
	tsubcctv %r21, 0x13ed, %r22
	.word 0xda07e001  ! 1831: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x93902007  ! 1832: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d802000  ! 1833: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdb17c000  ! 1834: LDQF_R	-	[%r31, %r0], %f13
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xda5fc000  ! 1835: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xdad7e000  ! 1836: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	.word 0xda8008a0  ! 1837: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8d9027de  ! 1838: WRPR_PSTATE_I	wrpr	%r0, 0x07de, %pstate
tagged_463:
	taddcctv %r3, 0x10e2, %r7
	.word 0xda07e001  ! 1839: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda47c000  ! 1840: LDSW_R	ldsw	[%r31 + %r0], %r13
splash_tba_464:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1841: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81500000  ! 1842: RDPR_TPC	rdpr	%tpc, %r0
	.word 0x3a800001  ! 1843: BCC	bcc,a	<label_0x1>
	.word 0xc0d004a0  ! 1844: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r0
	.word 0xc0d00e60  ! 1845: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r0
	.word 0xa190200d  ! 1846: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xc09fc020  ! 1847: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
splash_htba_465:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1848: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8048c00a  ! 1849: MULX_R	mulx 	%r3, %r10, %r0
tagged_466:
	tsubcctv %r14, 0x1493, %r8
	.word 0xc007e001  ! 1850: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xc047e001  ! 1851: LDSW_I	ldsw	[%r31 + 0x0001], %r0
	.word 0x91d02035  ! 1852: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa190200d  ! 1853: WRPR_GL_I	wrpr	%r0, 0x000d, %-
DS_467:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xcb358004  ! 1: STQF_R	-	%f5, [%r4, %r22]
	normalw
	.word 0x8f458000  ! 1854: RD_SOFTINT_REG	rd	%softint, %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xce5fc000  ! 1855: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x93902002  ! 1856: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_468:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1857: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
DS_469:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc1356001  ! 1: STQF_I	-	%f0, [0x0001, %r21]
	normalw
	.word 0x83458000  ! 1858: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x93d02032  ! 1859: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xc2d004a0  ! 1860: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x93902002  ! 1861: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x2a700001  ! 1862: BPCS	<illegal instruction>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1863: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc28fe000  ! 1864: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r1
	.word 0xad45c000  ! 1865: RD_TICK_CMPR_REG	rd	%-, %r22
	.word 0xa280c005  ! 1866: ADDcc_R	addcc 	%r3, %r5, %r17
	.word 0x9550c000  ! 1867: RDPR_TT	rdpr	%tt, %r10
splash_lsu_470:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1868: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd48804a0  ! 1869: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1870: LDX_R	ldx	[%r31 + %r0], %r10
DS_471:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	allclean
	.word 0xb7b1430c  ! 1871: ALIGNADDRESS	alignaddr	%r5, %r12, %r27
	.word 0x8d9023c9  ! 1872: WRPR_PSTATE_I	wrpr	%r0, 0x03c9, %pstate
splash_lsu_472:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1873: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_473:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1832001  ! 1874: WR_STICK_REG_I	wr	%r12, 0x0001, %-
DS_474:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd3352001  ! 1: STQF_I	-	%f9, [0x0001, %r20]
	normalw
	.word 0x93458000  ! 1875: RD_SOFTINT_REG	rd	%softint, %r9
DS_475:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f12, %f28, %f2
	.word 0xb5b10309  ! 1876: ALIGNADDRESS	alignaddr	%r4, %r9, %r26
	.word 0xf4d004a0  ! 1877: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r26
DS_476:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f20, %f30
	.word 0x87b20305  ! 1878: ALIGNADDRESS	alignaddr	%r8, %r5, %r3
splash_tba_477:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1879: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93d02034  ! 1880: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x87802055  ! 1881: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x93902005  ! 1882: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc68008a0  ! 1883: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8d90200f  ! 1884: WRPR_PSTATE_I	wrpr	%r0, 0x000f, %pstate
DS_478:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1885: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_479:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1886: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1887: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6800ac0  ! 1888: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r3
DS_480:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1889: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc65fe001  ! 1890: LDX_I	ldx	[%r31 + 0x0001], %r3
	.word 0xb3464000  ! 1891: RD_STICK_CMPR_REG	rd	%-, %r25
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1892: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 1893: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb56a6001  ! 1894: SDIVX_I	sdivx	%r9, 0x0001, %r26
	.word 0x9f802001  ! 1895: SIR	sir	0x0001
	.word 0xf41fe001  ! 1896: LDD_I	ldd	[%r31 + 0x0001], %r26
tagged_482:
	tsubcctv %r16, 0x109b, %r10
	.word 0xf407e001  ! 1897: LDUW_I	lduw	[%r31 + 0x0001], %r26
	.word 0x8d902bab  ! 1898: WRPR_PSTATE_I	wrpr	%r0, 0x0bab, %pstate
	.word 0x93d02035  ! 1899: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x3e800001  ! 1900: BVC	bvc,a	<label_0x1>
tagged_483:
	taddcctv %r5, 0x12be, %r1
	.word 0xf407e001  ! 1901: LDUW_I	lduw	[%r31 + 0x0001], %r26
	.word 0xf41fe001  ! 1902: LDD_I	ldd	[%r31 + 0x0001], %r26
	.word 0x83d02033  ! 1903: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x87902338  ! 1904: WRPR_TT_I	wrpr	%r0, 0x0338, %tt
	.word 0xf48008a0  ! 1905: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
splash_lsu_484:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1906: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_485:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1907: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_486:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1908: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902000  ! 1909: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf45fc000  ! 1910: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0xf48008a0  ! 1911: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0xa1902002  ! 1912: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xf517c000  ! 1914: LDQF_R	-	[%r31, %r0], %f26
	.word 0xf4d004a0  ! 1915: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r26
	.word 0xf4d804a0  ! 1916: LDXA_R	ldxa	[%r0, %r0] 0x25, %r26
	.word 0xa1902006  ! 1917: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xf407c000  ! 1918: LDUW_R	lduw	[%r31 + %r0], %r26
DS_487:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd3368019  ! 1: STQF_R	-	%f9, [%r25, %r26]
	normalw
	.word 0xb1458000  ! 1919: RD_SOFTINT_REG	rd	%softint, %r24
	.word 0x879022c6  ! 1920: WRPR_TT_I	wrpr	%r0, 0x02c6, %tt
splash_lsu_488:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1921: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 1922: WRPR_GL_I	wrpr	%r0, 0x0008, %-
tagged_489:
	taddcctv %r8, 0x1258, %r15
	.word 0xf007e001  ! 1923: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0xf08008a0  ! 1924: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x8d508000  ! 1925: RDPR_TSTATE	rdpr	%tstate, %r6
splash_tba_490:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1926: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_491:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1927: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38800001  ! 1928: BGU	bgu,a	<label_0x1>
	.word 0xcc17c000  ! 1929: LDUH_R	lduh	[%r31 + %r0], %r6
	.word 0xccd7e000  ! 1930: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r6
splash_lsu_492:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1931: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 1932: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d020b5  ! 1933: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa1902000  ! 1934: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xcc8008a0  ! 1935: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x87902114  ! 1936: WRPR_TT_I	wrpr	%r0, 0x0114, %tt
	.word 0xcc1fe001  ! 1937: LDD_I	ldd	[%r31 + 0x0001], %r6
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1938: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1939: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 1940: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x9545c000  ! 1941: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xd4c004a0  ! 1942: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
splash_lsu_493:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1943: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_494:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1944: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd4c7e030  ! 1945: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
	.word 0xd447e001  ! 1946: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	.word 0xa1902009  ! 1947: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d902834  ! 1948: WRPR_PSTATE_I	wrpr	%r0, 0x0834, %pstate
	.word 0xd417c000  ! 1949: LDUH_R	lduh	[%r31 + %r0], %r10
tagged_495:
	taddcctv %r3, 0x174f, %r4
	.word 0xd407e001  ! 1950: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4800bc0  ! 1951: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r10
	.word 0x81982f8d  ! 1952: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8d, %hpstate
splash_lsu_496:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1953: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_497:
	taddcctv %r17, 0x1e93, %r5
	.word 0xd407e001  ! 1954: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4d7e030  ! 1955: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0xa1902003  ! 1956: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_498:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1957: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
	.word 0xd497e020  ! 1959: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0xd457e001  ! 1960: LDSH_I	ldsh	[%r31 + 0x0001], %r10
	.word 0xd49fe001  ! 1961: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0xd457c000  ! 1962: LDSH_R	ldsh	[%r31 + %r0], %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1834006  ! 1964: WR_STICK_REG_R	wr	%r13, %r6, %-
	.word 0x93902002  ! 1965: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd4800ac0  ! 1966: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r10
DS_500:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1967: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xd517c000  ! 1968: LDQF_R	-	[%r31, %r0], %f10
	.word 0x8d802000  ! 1969: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd597e001  ! 1970: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x93902000  ! 1971: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xaf480000  ! 1972: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99902004  ! 1974: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x8d902849  ! 1975: WRPR_PSTATE_I	wrpr	%r0, 0x0849, %pstate
splash_lsu_501:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1976: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902d55  ! 1977: WRPR_PSTATE_I	wrpr	%r0, 0x0d55, %pstate
splash_lsu_502:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1978: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xee5fc000  ! 1979: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0x36800001  ! 1980: BGE	bge,a	<label_0x1>
	.word 0x93902002  ! 1981: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1982: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_503:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1983: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xee8804a0  ! 1984: LDUBA_R	lduba	[%r0, %r0] 0x25, %r23
tagged_504:
	tsubcctv %r15, 0x1389, %r19
	.word 0xee07e001  ! 1985: LDUW_I	lduw	[%r31 + 0x0001], %r23
	.word 0x9f802001  ! 1986: SIR	sir	0x0001
	.word 0x2e800001  ! 1987: BVS	bvs,a	<label_0x1>
	.word 0xee8804a0  ! 1988: LDUBA_R	lduba	[%r0, %r0] 0x25, %r23
	.word 0xeed7e000  ! 1989: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	.word 0x8d902889  ! 1990: WRPR_PSTATE_I	wrpr	%r0, 0x0889, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902005  ! 1992: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xee9004a0  ! 1993: LDUHA_R	lduha	[%r0, %r0] 0x25, %r23
	.word 0x8790224d  ! 1994: WRPR_TT_I	wrpr	%r0, 0x024d, %tt
	.word 0xee8008a0  ! 1995: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0x8d802000  ! 1996: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902004  ! 1997: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_PRIV	! macro
splash_htba_505:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
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

	.xword	0x662e1a722d822485
	.xword	0x36e5665b56a315f5
	.xword	0xec2f6ced821f862b
	.xword	0xe005713b9d28d2a3
	.xword	0x79817a7ad6362f50
	.xword	0x9e1526529b09b688
	.xword	0xec0d346ceb15e56d
	.xword	0xe2ab4419802ac644
	.xword	0x7dacef9c7bddb07d
	.xword	0x56d42104a71e7b88
	.xword	0x9dee1a7a89ecf51c
	.xword	0x57189b7d72b711ed
	.xword	0xb2d6d07e858822e7
	.xword	0xaa626545bcac686a
	.xword	0x594914b90432317a
	.xword	0xbe8742361eb30f2e
	.xword	0x99df8d82e37aa4d0
	.xword	0xe89a77ac233799ca
	.xword	0xf7ee0eb7b1a0d314
	.xword	0xd14071fed7dd41cd
	.xword	0xd83ac2139c15e23c
	.xword	0xeb18f35311939897
	.xword	0xa1226d43b7e04264
	.xword	0xb2f3dbe7cae4acf9
	.xword	0x0bb15ad9d6603722
	.xword	0x96b0e2168de9abbd
	.xword	0x5508bf5d78b7bf08
	.xword	0xcad8eae391c00401
	.xword	0x9cff94b496ab31c4
	.xword	0x020584666c60c74f
	.xword	0x33060fd4068db1de
	.xword	0x284216e321c73027
	.xword	0xb3a3bd9a5a74747c
	.xword	0x422713e270342048
	.xword	0xd3ff53885cd4f80b
	.xword	0x336913dd0539653a
	.xword	0x18f51f347abbadd0
	.xword	0x453c8823cf8cf64f
	.xword	0x1b9ba00e20613756
	.xword	0x6b047af432aacd11
	.xword	0x55ecb05ec68573f7
	.xword	0xd130b6cff28b9858
	.xword	0x040ea09d85bfa14e
	.xword	0xa8dadc45e24c3bc6
	.xword	0x066b60dd48c954e5
	.xword	0x5abc02f89086e269
	.xword	0xa02633c56f281c14
	.xword	0x6025da24942af53c
	.xword	0xbb2f32f4ef5db624
	.xword	0x0bde075c070aa82d
	.xword	0xd965f142b976d6b7
	.xword	0xbfd657e74ffcc35f
	.xword	0x8e4f7c02585f9651
	.xword	0x9546d6df50db482e
	.xword	0xe03be572f7e099f6
	.xword	0x656b622b7ee4cdd1
	.xword	0x2dd6423d809a44c8
	.xword	0x84ef590e640c5026
	.xword	0x943ce24c0476ea72
	.xword	0x5a4eef66fe403c76
	.xword	0xb56db11ce6783fab
	.xword	0x45d0df9f58bac8cf
	.xword	0xe2a6f5659f9a5ed4
	.xword	0x0c74073dcecad5a6
	.xword	0xc04ce11d0f46ef01
	.xword	0x101f11b324866239
	.xword	0x00591e5f9691863d
	.xword	0x6c467d28169d18f6
	.xword	0x8a78499a5a5a5307
	.xword	0xd6532c13ebf77150
	.xword	0x649cd9a4b4533bb5
	.xword	0xf7945e411ee03532
	.xword	0x37a49f828c50acb3
	.xword	0xb7efdac134ab7c5c
	.xword	0xb67248698697c0ce
	.xword	0x98e66556d39fe5f8
	.xword	0xd71144778d1e4111
	.xword	0xa3eb941985fad94f
	.xword	0x474326cd05062d38
	.xword	0x37ee4510b2af6032
	.xword	0xc40a98d8e2c4136c
	.xword	0x4c39c866fb3dacc5
	.xword	0x69cc50f391cfae20
	.xword	0xb8a5ccc07c6b4eb0
	.xword	0xb2b06bec98d03fac
	.xword	0x790f75e37b0a11cb
	.xword	0x58fcd3ff43999a9f
	.xword	0xd49957bfecb42df6
	.xword	0xb39f529fe35a598e
	.xword	0xd6a8da9874849b06
	.xword	0x01bbb0de46f70a03
	.xword	0x7e182f93504e2dc1
	.xword	0xfcadb6908eae6d56
	.xword	0x376f12620b05a5f3
	.xword	0xb2dc007ae029144e
	.xword	0x0e7c69a0fa2c05c7
	.xword	0xf7ff469b92307f91
	.xword	0x98b080df22c0b2d4
	.xword	0x5ad6bb12023a6154
	.xword	0x6581029813a768aa
	.xword	0x1b49691f7fbf07e0
	.xword	0x6e1f0eeb7723db4a
	.xword	0x8a5d1fe0a45f5e0b
	.xword	0xa1776869b932e91b
	.xword	0xdcce4161829fed07
	.xword	0x1164aa215bc3666d
	.xword	0x9967575407d8de48
	.xword	0x28247b618499f667
	.xword	0x03b41c0667c17785
	.xword	0x0658981de480fc08
	.xword	0x9f2e56d614d82cef
	.xword	0x3e2514506fdb0ede
	.xword	0x6b1701a877211351
	.xword	0x6eece105c1984307
	.xword	0x090c8e8458c38ae3
	.xword	0xe49d06483d5e21b7
	.xword	0x17f72ba173d272b2
	.xword	0xd60d445072e68960
	.xword	0x38df2a990d1ac43d
	.xword	0xf1621734c3130faf
	.xword	0xd753ba5499f9357c
	.xword	0xb823eb9d2f331647
	.xword	0x45481ee1c57d9d9b
	.xword	0x42d6a16dc4329efd
	.xword	0x9c7cb5fbf805b5fd
	.xword	0xf71ee1ad84b230c2
	.xword	0x19d04b636b0759a2
	.xword	0x3caae1f7016f3573
	.xword	0xc4a754fdc3b22a00
	.xword	0x92ad7ef59646bb0a
	.xword	0x2a434cde0e061c3c
	.xword	0x443416a2b541b6b6
	.xword	0xcde921c67000966e
	.xword	0xabf077ced7da3807
	.xword	0xb097ece9c0c4376f
	.xword	0x05df72e543b2a215
	.xword	0xda5ecc34efab4c2f
	.xword	0x77d499d4eb8feb7a
	.xword	0x8fe73d4628e2da4f
	.xword	0xef6e184350a7834b
	.xword	0xae9ae4e65637d160
	.xword	0x9c8926bc6dfa5806
	.xword	0x2c1894c45880ab3d
	.xword	0xcde7901c4baaedbb
	.xword	0xfe7b0b46ec1fc01f
	.xword	0xe401c5c0277d9049
	.xword	0x9e5a38e3b34d1072
	.xword	0x14ee59c896bb35c8
	.xword	0xc08bdc7a80a678fc
	.xword	0x06d4720635724534
	.xword	0x29880347ca0a29bd
	.xword	0x302e8014a7bc5c1f
	.xword	0x887d62c1f64fe4a8
	.xword	0xe10e2560245e6dc0
	.xword	0x798d630a555eb6b1
	.xword	0xacc0d9acc8a2ee6b
	.xword	0x7a79fde1adcf43fc
	.xword	0xa560b402d30a902c
	.xword	0x4ab8a798ffa6b2cb
	.xword	0x6739d036aa0df776
	.xword	0x38cb779d988fba0a
	.xword	0xe1cc946ac7fbf09a
	.xword	0xa6035276dbc48d0b
	.xword	0x950ee1b11187d16f
	.xword	0xf402731aba1e7f66
	.xword	0xd582b845ffcd0691
	.xword	0x9aaad9002ca2a0ce
	.xword	0xe0fed165d99106cf
	.xword	0x598a60861e10abef
	.xword	0x6710147b435e5a6f
	.xword	0xb7aa24d7dac44f80
	.xword	0x1d1e8c6fc9f4097a
	.xword	0xa976665380f9ba51
	.xword	0x6fddb535b2377567
	.xword	0xff521db968072af1
	.xword	0xf76779eadbfee3bb
	.xword	0x1e14fe92f2232e8c
	.xword	0xf609e47f440fc3a8
	.xword	0xc2aeccd449859ab3
	.xword	0xe69add42a33ee03b
	.xword	0xb59c837e902bf009
	.xword	0xf5db6f155f97667f
	.xword	0x79ef48f98897bbb2
	.xword	0x6944b26ce6890e81
	.xword	0x7ca239b0cbb9c8a7
	.xword	0x32f7cd53cce08f61
	.xword	0xfa54d8e12fedfbfc
	.xword	0x1c14c3d72efb9b62
	.xword	0x331afa78f995084c
	.xword	0xeffb46c00072aee2
	.xword	0xb34199f624e4a2ff
	.xword	0x4ee732952b8036a3
	.xword	0x8549309948a241f9
	.xword	0xc3d5d48953213a37
	.xword	0xdb1ddacc998794b0
	.xword	0xb6e7e850ee28f0f4
	.xword	0xde5f9e76daaa8f15
	.xword	0xb13d3bdb97d2dd1e
	.xword	0x3fddae07cadc1b98
	.xword	0xec9711fa9ffc5c6c
	.xword	0x6dd072bb705033d7
	.xword	0xd757f363f473b1bc
	.xword	0x88a64b7e18fc0802
	.xword	0xdd3b22fb5ba6dc34
	.xword	0x3b0f791dedd97ab7
	.xword	0x820b1450d8dc8076
	.xword	0xccabb6b6acccf92a
	.xword	0x57349abc93f78782
	.xword	0x3f56f1954da9a228
	.xword	0xfce7d6711ecdef4d
	.xword	0x78b2c69f66d1b55d
	.xword	0x61c64aca92afcfc9
	.xword	0xa867bfacea198ac6
	.xword	0x056da57061026144
	.xword	0xdc0594a6b1c77c40
	.xword	0x8070ed0b3c53072c
	.xword	0x427f846bf80a17ac
	.xword	0x432154fd8ce27fa3
	.xword	0xd3183bc4d0a9e939
	.xword	0x27bf728481bc5cc9
	.xword	0x70864c93468fa01a
	.xword	0xdc382bc15599ac2e
	.xword	0x0c263c5750bc2b11
	.xword	0xb9c872964c58405e
	.xword	0xcea8a6b00351a823
	.xword	0x2abaf694d4b8f6e1
	.xword	0x30840fdeddb7a537
	.xword	0xfb40cdbe533efe4e
	.xword	0x4fccea5f1c13e8cf
	.xword	0x7d90a0a3c0e3910a
	.xword	0xb36d9c1bd86337c6
	.xword	0xabaeb743fed1e2c8
	.xword	0x15eb99b685e5cc2e
	.xword	0xb970e4c944b83c77
	.xword	0xf82d06bb2fd967e6
	.xword	0xec7e3d3c691ceccd
	.xword	0x766705092ac200a6
	.xword	0xca03830800a12585
	.xword	0x4527e417028597b1
	.xword	0x509a61ad16dd37fb
	.xword	0x556405fa1d4783b1
	.xword	0x87026a4a7806986f
	.xword	0x960c1817327a4bfa
	.xword	0xb862e150ff488b8e
	.xword	0xad33f96e4ce356f8
	.xword	0xa1597c3adbf88ee5
	.xword	0x5aa4ddfa1c91c16c
	.xword	0x68382164c46e4707
	.xword	0x09657e9e925e384f
	.xword	0x637959f1dca5d318
	.xword	0xb2c34dfb3b9e998e
	.xword	0x900fe17dcdd1015a
	.xword	0xea39efe7ce736378
	.xword	0x17afee55ab9a1e56
	.xword	0xd8e51299d1b133f8
	.xword	0x976c7c8fbee49055

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

