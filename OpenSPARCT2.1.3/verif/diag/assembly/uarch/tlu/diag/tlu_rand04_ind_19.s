/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_19.s
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
	mov 0x34, %r14
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
	mov 0xb5, %r14
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
	mov 0xb5, %r14
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

	.word 0xea0fe001  ! 1: LDUB_I	ldub	[%r31 + 0x0001], %r21
	.word 0x8d802004  ! 2: WRFPRS_I	wr	%r0, 0x0004, %fprs
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 3: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xeb27e001  ! 4: STF_I	st	%f21, [0x0001, %r31]
DS_0:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x81540d98	! Random illegal ?
	.word 0xf314800d  ! 1: LDQF_R	-	[%r18, %r13], %f25
	.word 0x85a3483b  ! 5: FADDs	fadds	%f13, %f27, %f2
	.word 0xa1902006  ! 6: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xc48804a0  ! 7: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 8: LDX_R	ldx	[%r31 + %r0], %r2
DS_1:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 9: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x93902002  ! 10: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc41fe001  ! 11: LDD_I	ldd	[%r31 + 0x0001], %r2
tagged_2:
	tsubcctv %r21, 0x1f55, %r19
	.word 0xc407e001  ! 12: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a0196d  ! 13: FqTOd	dis not found

	.word 0x8d802000  ! 14: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x20700001  ! 15: BPN	<illegal instruction>
splash_lsu_4:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 16: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 17: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd68008a0  ! 18: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 19: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd697e010  ! 20: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x856c6001  ! 21: SDIVX_I	sdivx	%r17, 0x0001, %r2
DS_6:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0x8fd2fcae	! Random illegal ?
	.word 0x8ba00541  ! 1: FSQRTd	fsqrt	
	.word 0x91a6c82d  ! 22: FADDs	fadds	%f27, %f13, %f8
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 23: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 24: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_7:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 25: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 26: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93902000  ! 27: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
change_to_randtl_8:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 28: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x83514000  ! 29: RDPR_TBA	rdpr	%tba, %r1
	.word 0xc29fc020  ! 30: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	.word 0xc207c000  ! 31: LDUW_R	lduw	[%r31 + %r0], %r1
	.word 0xc2c804a0  ! 32: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	.word 0xc2d00e80  ! 33: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r1
DS_9:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 34: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8d802000  ! 35: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc257e001  ! 36: LDSH_I	ldsh	[%r31 + 0x0001], %r1
splash_tba_10:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 37: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc2c804a0  ! 38: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	.word 0x93902006  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa9494000  ! 40: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0x93902004  ! 41: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe8d804a0  ! 42: LDXA_R	ldxa	[%r0, %r0] 0x25, %r20
	.word 0xe8d7e000  ! 43: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r20
splash_tba_11:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 44: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 45: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x8d9029c7  ! 46: WRPR_PSTATE_I	wrpr	%r0, 0x09c7, %pstate
	.word 0x9f802001  ! 47: SIR	sir	0x0001
	.word 0x93902005  ! 48: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe8c004a0  ! 49: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
	.word 0x8790237e  ! 50: WRPR_TT_I	wrpr	%r0, 0x037e, %tt
	.word 0x83d020b4  ! 51: Tcc_I	te	icc_or_xcc, %r0 + 180
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 52: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe8cfe030  ! 53: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r20
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 54: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 55: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xe88008a0  ! 56: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x9669c003  ! 57: UDIVX_R	udivx 	%r7, %r3, %r11
	.word 0xd607c000  ! 58: LDUW_R	lduw	[%r31 + %r0], %r11
splash_lsu_12:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 59: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 60: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02032  ! 61: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd6d00e60  ! 62: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r11
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 63: LDX_R	ldx	[%r31 + %r0], %r11
tagged_13:
	taddcctv %r4, 0x1e6e, %r19
	.word 0xd607e001  ! 64: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd68804a0  ! 65: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0x93902007  ! 66: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d02035  ! 67: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02034  ! 68: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d9028e8  ! 69: WRPR_PSTATE_I	wrpr	%r0, 0x08e8, %pstate
	.word 0x34700001  ! 70: BPG	<illegal instruction>
DS_14:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 71: SAVE_R	save	%r31, %r0, %r31
	.word 0x8745c000  ! 72: RD_TICK_CMPR_REG	rd	%-, %r3
	.word 0xc657e001  ! 73: LDSH_I	ldsh	[%r31 + 0x0001], %r3
splash_lsu_15:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 74: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9027cf  ! 75: WRPR_PSTATE_I	wrpr	%r0, 0x07cf, %pstate
	.word 0x819829c4  ! 76: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c4, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc60fc000  ! 78: LDUB_R	ldub	[%r31 + %r0], %r3
tagged_16:
	tsubcctv %r8, 0x12b2, %r25
	.word 0xc607e001  ! 79: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc6d80e80  ! 80: LDXA_R	ldxa	[%r0, %r0] 0x74, %r3
	.word 0x93902007  ! 81: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x879021f9  ! 82: WRPR_TT_I	wrpr	%r0, 0x01f9, %tt
	.word 0x9b500000  ! 83: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xda17c000  ! 84: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0xa190200e  ! 85: WRPR_GL_I	wrpr	%r0, 0x000e, %-
DS_17:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f12, %f26, %f12
	.word 0xabb28300  ! 86: ALIGNADDRESS	alignaddr	%r10, %r0, %r21
	.word 0x8d90276b  ! 87: WRPR_PSTATE_I	wrpr	%r0, 0x076b, %pstate
	.word 0xea8008a0  ! 88: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0x93902003  ! 89: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_18:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 90: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02034  ! 91: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xea1fc000  ! 92: LDD_R	ldd	[%r31 + %r0], %r21
	.word 0xeac7e000  ! 93: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r21
DS_19:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 94: RESTORE_R	restore	%r31, %r0, %r31
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 95: LDX_R	ldx	[%r31 + %r0], %r21
splash_cmpr_20:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1842001  ! 96: WR_STICK_REG_I	wr	%r16, 0x0001, %-
	.word 0xea47c000  ! 97: LDSW_R	ldsw	[%r31 + %r0], %r21
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 98: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0xea4fc000  ! 99: LDSB_R	ldsb	[%r31 + %r0], %r21
	.word 0xeac804a0  ! 100: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r21
	.word 0xead00e40  ! 101: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r21
	.word 0x8d90212f  ! 102: WRPR_PSTATE_I	wrpr	%r0, 0x012f, %pstate
	.word 0xea9004a0  ! 103: LDUHA_R	lduha	[%r0, %r0] 0x25, %r21
	.word 0x8745c000  ! 104: RD_TICK_CMPR_REG	rd	%-, %r3
tagged_21:
	taddcctv %r11, 0x1c95, %r18
	.word 0xc607e001  ! 105: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc69004a0  ! 106: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x8b480000  ! 107: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x81982c87  ! 108: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c87, %hpstate
	.word 0xca8fe020  ! 109: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r5
	.word 0xa1902004  ! 110: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xca0fc000  ! 111: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0x91d02033  ! 112: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902005  ! 113: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902975  ! 114: WRPR_PSTATE_I	wrpr	%r0, 0x0975, %pstate
	.word 0xca57e001  ! 115: LDSH_I	ldsh	[%r31 + 0x0001], %r5
	.word 0x3c700001  ! 116: BPPOS	<illegal instruction>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 117: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0xca4fe001  ! 118: LDSB_I	ldsb	[%r31 + 0x0001], %r5
	.word 0x91d02034  ! 119: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902c1e  ! 120: WRPR_PSTATE_I	wrpr	%r0, 0x0c1e, %pstate
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 121: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 122: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_22:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180e001  ! 123: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcb17c000  ! 125: LDQF_R	-	[%r31, %r0], %f5
	.word 0x8150c000  ! 126: RDPR_TT	<illegal instruction>
	.word 0x93d020b5  ! 127: Tcc_I	tne	icc_or_xcc, %r0 + 181
splash_cmpr_23:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181a001  ! 128: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x93902001  ! 129: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
tagged_24:
	tsubcctv %r5, 0x11a0, %r1
	.word 0xc007e001  ! 130: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x91d02034  ! 131: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xc0bfe001  ! 132: STDA_I	stda	%r0, [%r31 + 0x0001] %asi
	.word 0xc007c000  ! 133: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0x99902004  ! 134: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
tagged_25:
	taddcctv %r3, 0x18f5, %r21
	.word 0xc007e001  ! 135: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xa085c001  ! 136: ADDcc_R	addcc 	%r23, %r1, %r16
	.word 0xe0cfe020  ! 137: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r16
	.word 0xe01fe001  ! 138: LDD_I	ldd	[%r31 + 0x0001], %r16
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89820012  ! 139: WRTICK_R	wr	%r8, %r18, %tick
splash_htba_27:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 140: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200d  ! 141: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa190200b  ! 142: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa950c000  ! 144: RDPR_TT	rdpr	%tt, %r20
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1808003  ! 145: WR_STICK_REG_R	wr	%r2, %r3, %-
	.word 0x28700001  ! 146: BPLEU	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d02032  ! 148: Tcc_I	tne	icc_or_xcc, %r0 + 50
tagged_29:
	taddcctv %r26, 0x1271, %r15
	.word 0xe807e001  ! 149: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x8790201c  ! 150: WRPR_TT_I	wrpr	%r0, 0x001c, %tt
	.word 0x93902000  ! 151: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902004  ! 152: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87802080  ! 153: WRASI_I	wr	%r0, 0x0080, %asi
splash_tba_30:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 154: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d020b4  ! 155: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x8d802000  ! 156: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_31:
	taddcctv %r4, 0x1700, %r10
	.word 0xe807e001  ! 157: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x8d802004  ! 158: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902007  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d90216b  ! 160: WRPR_PSTATE_I	wrpr	%r0, 0x016b, %pstate
	.word 0x28800001  ! 161: BLEU	bleu,a	<label_0x1>
	.word 0x93902007  ! 162: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x3e700001  ! 163: BPVC	<illegal instruction>
splash_tba_32:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 164: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_33:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 165: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe88804a0  ! 166: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
	.word 0xe88008a0  ! 167: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x91d02034  ! 168: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe8d00e60  ! 169: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r20
	.word 0x3c800001  ! 170: BPOS	bpos,a	<label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 171: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902226  ! 172: WRPR_TT_I	wrpr	%r0, 0x0226, %tt
	.word 0xe817c000  ! 173: LDUH_R	lduh	[%r31 + %r0], %r20
	.word 0xe84fe001  ! 174: LDSB_I	ldsb	[%r31 + 0x0001], %r20
	.word 0xa1902005  ! 175: WRPR_GL_I	wrpr	%r0, 0x0005, %-
change_to_randtl_34:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 176: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_35:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 177: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe84fc000  ! 178: LDSB_R	ldsb	[%r31 + %r0], %r20
	.word 0x38700001  ! 179: BPGU	<illegal instruction>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 180: LDX_R	ldx	[%r31 + %r0], %r20
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 181: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_36:
	tsubcctv %r11, 0x1d90, %r15
	.word 0xe807e001  ! 182: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xa190200b  ! 183: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93902006  ! 184: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe80fe001  ! 185: LDUB_I	ldub	[%r31 + 0x0001], %r20
	.word 0x87802089  ! 186: WRASI_I	wr	%r0, 0x0089, %asi
DS_37:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 187: RESTORE_R	restore	%r31, %r0, %r31
tagged_38:
	tsubcctv %r8, 0x164c, %r4
	.word 0xe807e001  ! 188: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xe817e001  ! 189: LDUH_I	lduh	[%r31 + 0x0001], %r20
splash_tba_39:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 190: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_40:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 191: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 192: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe85fc000  ! 193: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xa9464000  ! 194: RD_STICK_CMPR_REG	rd	%-, %r20
tagged_41:
	taddcctv %r11, 0x1eb3, %r7
	.word 0xe807e001  ! 195: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xe80fc000  ! 196: LDUB_R	ldub	[%r31 + %r0], %r20
	.word 0xa1902002  ! 197: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8780204f  ! 198: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe8800be0  ! 199: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r20
	.word 0xe8c7e030  ! 200: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r20
	.word 0x819820ce  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00ce, %hpstate
	.word 0x87902196  ! 202: WRPR_TT_I	wrpr	%r0, 0x0196, %tt
	.word 0x87802055  ! 203: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xe8d004a0  ! 204: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0xe8cfe020  ! 205: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r20
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 206: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xa190200d  ! 207: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xe89004a0  ! 208: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe807c000  ! 210: LDUW_R	lduw	[%r31 + %r0], %r20
DS_42:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xed344017  ! 1: STQF_R	-	%f22, [%r23, %r17]
	normalw
	.word 0xa1458000  ! 211: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0xe117c000  ! 212: LDQF_R	-	[%r31, %r0], %f16
splash_lsu_43:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 213: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99a2cdcc  ! 214: FdMULq	fdmulq	
	.word 0x91d02033  ! 215: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802080  ! 216: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd897e000  ! 217: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
splash_tba_44:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 218: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd89fe001  ! 219: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 220: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_45:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 221: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd997e001  ! 222: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0xa1902000  ! 223: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_tba_46:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 224: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xb3508000  ! 225: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0x8790207f  ! 226: WRPR_TT_I	wrpr	%r0, 0x007f, %tt
	.word 0x99902001  ! 227: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
DS_47:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 228: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xf2cfe030  ! 229: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r25
splash_lsu_48:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 231: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87802010  ! 232: WRASI_I	wr	%r0, 0x0010, %asi
splash_tba_49:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 233: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802016  ! 234: WRASI_I	wr	%r0, 0x0016, %asi
DS_50:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 235: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902e1f  ! 236: WRPR_PSTATE_I	wrpr	%r0, 0x0e1f, %pstate
	.word 0x9f802001  ! 237: SIR	sir	0x0001
	.word 0x87802020  ! 238: WRASI_I	wr	%r0, 0x0020, %asi
splash_cmpr_51:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1806001  ! 239: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0xf28008a0  ! 240: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0xa190200b  ! 241: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xf257c000  ! 242: LDSH_R	ldsh	[%r31 + %r0], %r25
	.word 0xf2dfe010  ! 243: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r25
	.word 0x24700001  ! 244: BPLE	<illegal instruction>
	.word 0x87802020  ! 245: WRASI_I	wr	%r0, 0x0020, %asi
tagged_52:
	tsubcctv %r21, 0x12b2, %r18
	.word 0xf207e001  ! 246: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0x8780204f  ! 247: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802020  ! 248: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8d902203  ! 249: WRPR_PSTATE_I	wrpr	%r0, 0x0203, %pstate
	.word 0xa190200b  ! 250: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xf397e001  ! 251: LDQFA_I	-	[%r31, 0x0001], %f25
tagged_53:
	taddcctv %r12, 0x1bbe, %r22
	.word 0xf207e001  ! 252: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0x879023e2  ! 253: WRPR_TT_I	wrpr	%r0, 0x03e2, %tt
	.word 0xf28008a0  ! 254: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
splash_tba_54:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 255: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x3e700001  ! 256: BPVC	<illegal instruction>
	.word 0x879021fc  ! 257: WRPR_TT_I	wrpr	%r0, 0x01fc, %tt
	.word 0xf21fe001  ! 258: LDD_I	ldd	[%r31 + 0x0001], %r25
tagged_55:
	taddcctv %r12, 0x1935, %r6
	.word 0xf207e001  ! 259: LDUW_I	lduw	[%r31 + 0x0001], %r25
splash_tba_56:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 260: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d90278e  ! 261: WRPR_PSTATE_I	wrpr	%r0, 0x078e, %pstate
splash_htba_57:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 262: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 263: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_58:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 264: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_59:
	taddcctv %r1, 0x1c74, %r22
	.word 0xf207e001  ! 265: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0xf28804a0  ! 266: LDUBA_R	lduba	[%r0, %r0] 0x25, %r25
	.word 0xf25fe001  ! 267: LDX_I	ldx	[%r31 + 0x0001], %r25
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 268: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81500000  ! 269: RDPR_TPC	rdpr	%tpc, %r0
tagged_60:
	tsubcctv %r14, 0x1222, %r10
	.word 0xc007e001  ! 270: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xc0bfe001  ! 271: STDA_I	stda	%r0, [%r31 + 0x0001] %asi
	.word 0xc01fc000  ! 272: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x8d9029c9  ! 273: WRPR_PSTATE_I	wrpr	%r0, 0x09c9, %pstate
	.word 0x81460000  ! 274: RD_STICK_REG	stbar
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc09fe001  ! 276: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
tagged_61:
	taddcctv %r17, 0x16fb, %r15
	.word 0xc007e001  ! 277: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xa190200d  ! 278: WRPR_GL_I	wrpr	%r0, 0x000d, %-
DS_62:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd135c000  ! 1: STQF_R	-	%f8, [%r0, %r23]
	normalw
	.word 0x8b458000  ! 279: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xcadfe010  ! 280: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r5
	.word 0x879022c3  ! 281: WRPR_TT_I	wrpr	%r0, 0x02c3, %tt
DS_63:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe5308006  ! 1: STQF_R	-	%f18, [%r6, %r2]
	normalw
	.word 0xaf458000  ! 282: RD_SOFTINT_REG	rd	%softint, %r23
	.word 0xeed004a0  ! 283: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r23
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xee5fc000  ! 284: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0x879021d3  ! 285: WRPR_TT_I	wrpr	%r0, 0x01d3, %tt
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 286: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xee9004a0  ! 287: LDUHA_R	lduha	[%r0, %r0] 0x25, %r23
	.word 0xee9fc020  ! 288: LDDA_R	ldda	[%r31, %r0] 0x01, %r23
	.word 0x81982c4f  ! 289: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4f, %hpstate
	.word 0x9b504000  ! 290: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x87802020  ! 291: WRASI_I	wr	%r0, 0x0020, %asi
splash_tba_64:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 292: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_65:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1822001  ! 293: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	.word 0xda8fe020  ! 294: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r13
	.word 0xda77c006  ! 295: STX_R	stx	%r13, [%r31 + %r6]
	.word 0x9951c000  ! 296: RDPR_TL	<illegal instruction>
	.word 0x93902002  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd88008a0  ! 298: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_66:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 299: SAVE_R	save	%r31, %r0, %r31
	.word 0xd8c80e80  ! 300: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r12
	.word 0x9f802001  ! 301: SIR	sir	0x0001
	.word 0xd89fe001  ! 302: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x32700001  ! 303: BPNE	<illegal instruction>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 304: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd89fe001  ! 305: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd85fc000  ! 306: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x93902002  ! 307: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd89fe001  ! 308: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0xd877e001  ! 309: STX_I	stx	%r12, [%r31 + 0x0001]
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 310: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x22800001  ! 311: BE	be,a	<label_0x1>
	.word 0x91d020b5  ! 312: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_lsu_67:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 313: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8800ac0  ! 314: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r12
	.word 0xafa309a8  ! 315: FDIVs	fdivs	%f12, %f8, %f23
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902005  ! 317: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_68:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 318: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xeecfe000  ! 319: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r23
	.word 0xee9fe001  ! 320: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r23
change_to_randtl_69:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 321: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x9f802001  ! 322: SIR	sir	0x0001
	.word 0x87802058  ! 323: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xee1fc000  ! 324: LDD_R	ldd	[%r31 + %r0], %r23
	.word 0x8790208f  ! 325: WRPR_TT_I	wrpr	%r0, 0x008f, %tt
change_to_randtl_70:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 326: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xee800b80  ! 327: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r23
	.word 0xee8fe000  ! 328: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r23
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xee5fc000  ! 329: LDX_R	ldx	[%r31 + %r0], %r23
	ta	T_CHANGE_PRIV	! macro
	.word 0xad494000  ! 331: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0x87802010  ! 332: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d902e47  ! 333: WRPR_PSTATE_I	wrpr	%r0, 0x0e47, %pstate
	.word 0xa190200f  ! 334: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8790213e  ! 335: WRPR_TT_I	wrpr	%r0, 0x013e, %tt
tagged_71:
	taddcctv %r4, 0x19e1, %r4
	.word 0xec07e001  ! 336: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x28700001  ! 337: BPLEU	<illegal instruction>
	.word 0xec57e001  ! 338: LDSH_I	ldsh	[%r31 + 0x0001], %r22
	.word 0xa1902004  ! 339: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xec0fc000  ! 340: LDUB_R	ldub	[%r31 + %r0], %r22
	ta	T_CHANGE_PRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xec5fc000  ! 342: LDX_R	ldx	[%r31 + %r0], %r22
	.word 0x93d02035  ! 343: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xed37c008  ! 344: STQF_R	-	%f22, [%r8, %r31]
	.word 0xec8008a0  ! 345: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x83d020b3  ! 346: Tcc_I	te	icc_or_xcc, %r0 + 179
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 347: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 348: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87802004  ! 349: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_PRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xec5fc000  ! 351: LDX_R	ldx	[%r31 + %r0], %r22
tagged_72:
	tsubcctv %r21, 0x1c99, %r12
	.word 0xec07e001  ! 352: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0xed17c000  ! 353: LDQF_R	-	[%r31, %r0], %f22
	.word 0xec8008a0  ! 354: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x8d90206e  ! 355: WRPR_PSTATE_I	wrpr	%r0, 0x006e, %pstate
change_to_randtl_73:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 356: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xecc804a0  ! 357: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r22
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xec5fc000  ! 358: LDX_R	ldx	[%r31 + %r0], %r22
	.word 0xec4fe001  ! 359: LDSB_I	ldsb	[%r31 + 0x0001], %r22
	.word 0xecffc028  ! 360: SWAPA_R	swapa	%r22, [%r31 + %r8] 0x01
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xec5fc000  ! 361: LDX_R	ldx	[%r31 + %r0], %r22
	.word 0xec17e001  ! 362: LDUH_I	lduh	[%r31 + 0x0001], %r22
	.word 0xa1494000  ! 363: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0x8d802004  ! 364: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d9024ae  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x04ae, %pstate
	.word 0xe0c7e010  ! 366: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r16
	.word 0x8790223f  ! 367: WRPR_TT_I	wrpr	%r0, 0x023f, %tt
	.word 0xe00fe001  ! 368: LDUB_I	ldub	[%r31 + 0x0001], %r16
	.word 0xe00fe001  ! 369: LDUB_I	ldub	[%r31 + 0x0001], %r16
	.word 0x99902004  ! 370: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_cmpr_74:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186a001  ! 371: WR_STICK_REG_I	wr	%r26, 0x0001, %-
splash_lsu_75:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 372: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 373: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 374: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93d02034  ! 375: Tcc_I	tne	icc_or_xcc, %r0 + 52
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 376: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b494000  ! 377: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0xca5fe001  ! 378: LDX_I	ldx	[%r31 + 0x0001], %r5
	.word 0x2c800001  ! 379: BNEG	bneg,a	<label_0x1>
DS_76:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 380: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_77:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 381: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_78:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 382: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcad804a0  ! 383: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	.word 0x99902005  ! 384: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8790211d  ! 385: WRPR_TT_I	wrpr	%r0, 0x011d, %tt
	.word 0x93902000  ! 386: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802088  ! 387: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d90216b  ! 388: WRPR_PSTATE_I	wrpr	%r0, 0x016b, %pstate
	.word 0x89464000  ! 389: RD_STICK_CMPR_REG	rd	%-, %r4
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xaba01965  ! 390: FqTOd	dis not found

	.word 0x87802088  ! 391: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x91d020b4  ! 392: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x87508000  ! 393: RDPR_TSTATE	rdpr	%tstate, %r3
DS_80:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xf5c7be90	! Random illegal ?
	.word 0xe513400d  ! 1: LDQF_R	-	[%r13, %r13], %f18
	.word 0xa5a2c835  ! 394: FADDs	fadds	%f11, %f21, %f18
tagged_81:
	taddcctv %r13, 0x1a8a, %r19
	.word 0xe407e001  ! 395: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x87902270  ! 396: WRPR_TT_I	wrpr	%r0, 0x0270, %tt
DS_82:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 397: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_tba_83:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 398: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_84:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0x9b43f01a	! Random illegal ?
	.word 0x8fa0055a  ! 1: FSQRTd	fsqrt	
	.word 0x87a64830  ! 399: FADDs	fadds	%f25, %f16, %f3
	.word 0xc68008a0  ! 400: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x81982207  ! 401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0207, %hpstate
change_to_randtl_85:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 402: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
tagged_86:
	tsubcctv %r15, 0x1426, %r2
	.word 0xc607e001  ! 403: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xb351c000  ! 404: RDPR_TL	rdpr	%tl, %r25
	.word 0x8d802000  ! 405: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
tagged_87:
	taddcctv %r13, 0x13e8, %r16
	.word 0xf207e001  ! 407: LDUW_I	lduw	[%r31 + 0x0001], %r25
splash_lsu_88:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 408: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_89:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x99a00558  ! 1: FSQRTd	fsqrt	
	.word 0xa1a60837  ! 409: FADDs	fadds	%f24, %f23, %f16
	.word 0x9b514000  ! 410: RDPR_TBA	rdpr	%tba, %r13
DS_90:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0xadb64310  ! 411: ALIGNADDRESS	alignaddr	%r25, %r16, %r22
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xec5fc000  ! 412: LDX_R	ldx	[%r31 + %r0], %r22
	.word 0xec0fc000  ! 413: LDUB_R	ldub	[%r31 + %r0], %r22
	.word 0x87a589db  ! 414: FDIVd	fdivd	%f22, %f58, %f34
tagged_91:
	taddcctv %r1, 0x1147, %r21
	.word 0xc607e001  ! 415: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x91a01a61  ! 416: FqTOi	fqtoi	
	.word 0x9b480000  ! 417: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x879023f0  ! 418: WRPR_TT_I	wrpr	%r0, 0x03f0, %tt
	.word 0xdad004a0  ! 419: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xda1fc000  ! 420: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x9f802001  ! 421: SIR	sir	0x0001
	.word 0x81504000  ! 422: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0x2a700001  ! 423: BPCS	<illegal instruction>
	.word 0x87902052  ! 424: WRPR_TT_I	wrpr	%r0, 0x0052, %tt
	.word 0x8d902bb4  ! 425: WRPR_PSTATE_I	wrpr	%r0, 0x0bb4, %pstate
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 426: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc01fe001  ! 427: LDD_I	ldd	[%r31 + 0x0001], %r0
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 428: LDX_R	ldx	[%r31 + %r0], %r0
splash_tba_92:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 429: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x26800001  ! 430: BL	bl,a	<label_0x1>
	.word 0x879021a9  ! 431: WRPR_TT_I	wrpr	%r0, 0x01a9, %tt
	.word 0xc0d7e030  ! 432: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r0
	.word 0x87802055  ! 433: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x87802004  ! 434: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x99540000  ! 435: RDPR_GL	rdpr	%-, %r12
	.word 0x8d9026f1  ! 436: WRPR_PSTATE_I	wrpr	%r0, 0x06f1, %pstate
	.word 0x8d9022dc  ! 437: WRPR_PSTATE_I	wrpr	%r0, 0x02dc, %pstate
splash_htba_93:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 438: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd85fc000  ! 439: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x91d02032  ! 440: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_94:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 441: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd81fc000  ! 442: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0xd8dfe000  ! 443: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
	.word 0x879020d1  ! 444: WRPR_TT_I	wrpr	%r0, 0x00d1, %tt
	.word 0xd897e030  ! 445: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 446: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8c00e60  ! 447: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8790223f  ! 449: WRPR_TT_I	wrpr	%r0, 0x023f, %tt
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8980c003  ! 450: WRTICK_R	wr	%r3, %r3, %tick
	.word 0x93902006  ! 451: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd817e001  ! 452: LDUH_I	lduh	[%r31 + 0x0001], %r12
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 453: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_96:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 454: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x99902003  ! 455: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xd8d7e010  ! 456: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r12
	.word 0xd8d7e020  ! 457: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
	.word 0xd857c000  ! 458: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0xa1902000  ! 459: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 460: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x87802089  ! 461: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81460000  ! 462: RD_STICK_REG	stbar
	.word 0xd8800b60  ! 463: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r12
	.word 0x93902007  ! 464: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa190200d  ! 465: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 466: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd88008a0  ! 467: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa190200a  ! 468: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x83d02033  ! 469: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x81460000  ! 470: RD_STICK_REG	stbar
DS_97:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xcd366001  ! 1: STQF_I	-	%f6, [0x0001, %r25]
	normalw
	.word 0xad458000  ! 471: RD_SOFTINT_REG	rd	%softint, %r22
DS_98:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc135800c  ! 1: STQF_R	-	%f0, [%r12, %r22]
	normalw
	.word 0x9b458000  ! 472: RD_SOFTINT_REG	rd	%softint, %r13
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 473: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_99:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 474: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802080  ! 475: WRASI_I	wr	%r0, 0x0080, %asi
DS_100:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f0, %f24
	.word 0x8bb08301  ! 476: ALIGNADDRESS	alignaddr	%r2, %r1, %r5
	.word 0xca9004a0  ! 477: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0x87802010  ! 478: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xca77c001  ! 479: STX_R	stx	%r5, [%r31 + %r1]
	.word 0x8d9023f4  ! 480: WRPR_PSTATE_I	wrpr	%r0, 0x03f4, %pstate
	.word 0x879020eb  ! 481: WRPR_TT_I	wrpr	%r0, 0x00eb, %tt
	.word 0x87902253  ! 482: WRPR_TT_I	wrpr	%r0, 0x0253, %tt
splash_lsu_101:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 483: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xca4fc000  ! 484: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0x8d902bc3  ! 485: WRPR_PSTATE_I	wrpr	%r0, 0x0bc3, %pstate
	.word 0xca8fe010  ! 486: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r5
	.word 0xca47e001  ! 487: LDSW_I	ldsw	[%r31 + 0x0001], %r5
	.word 0x87464000  ! 488: RD_STICK_CMPR_REG	rd	%-, %r3
	.word 0xc6c004a0  ! 489: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
DS_102:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	allclean
	.word 0x81b0c30a  ! 490: ALIGNADDRESS	alignaddr	%r3, %r10, %r0
splash_lsu_103:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 491: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_104:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 492: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc137c00a  ! 493: STQF_R	-	%f0, [%r10, %r31]
	.word 0xc0c7e030  ! 494: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r0
	.word 0x87802058  ! 495: WRASI_I	wr	%r0, 0x0058, %asi
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 496: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_105:
	taddcctv %r21, 0x1095, %r9
	.word 0xc007e001  ! 497: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x8d802000  ! 498: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902004  ! 499: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xc0dfe030  ! 500: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r0
	.word 0x87802010  ! 501: WRASI_I	wr	%r0, 0x0010, %asi
tagged_106:
	tsubcctv %r24, 0x1d29, %r25
	.word 0xc007e001  ! 502: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xc09fc020  ! 503: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
splash_lsu_107:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 504: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 505: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8f540000  ! 506: RDPR_GL	rdpr	%-, %r7
	ta	T_CHANGE_PRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xce5fc000  ! 508: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xce800ba0  ! 509: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r7
splash_lsu_108:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 510: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 511: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_tba_109:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 512: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcec7e030  ! 513: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r7
DS_110:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf5308011  ! 1: STQF_R	-	%f26, [%r17, %r2]
	normalw
	.word 0x87458000  ! 514: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc69fc020  ! 515: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0x8150c000  ! 516: RDPR_TT	rdpr	%tt, %r0
splash_tba_111:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 517: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc0800ac0  ! 518: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r0
	.word 0xa1902005  ! 519: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xc05fe001  ! 520: LDX_I	ldx	[%r31 + 0x0001], %r0
tagged_112:
	tsubcctv %r8, 0x12d8, %r21
	.word 0xc007e001  ! 521: LDUW_I	lduw	[%r31 + 0x0001], %r0
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 522: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc01fe001  ! 523: LDD_I	ldd	[%r31 + 0x0001], %r0
	.word 0x93902002  ! 524: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d020b3  ! 525: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x93902000  ! 526: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc08008a0  ! 527: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc017c000  ! 528: LDUH_R	lduh	[%r31 + %r0], %r0
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 529: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_113:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 530: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879022bf  ! 531: WRPR_TT_I	wrpr	%r0, 0x02bf, %tt
	.word 0x87802004  ! 532: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xb7504000  ! 533: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0xf64fe001  ! 534: LDSB_I	ldsb	[%r31 + 0x0001], %r27
	.word 0x91d020b4  ! 535: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa1902009  ! 536: WRPR_GL_I	wrpr	%r0, 0x0009, %-
tagged_114:
	tsubcctv %r20, 0x1998, %r25
	.word 0xf607e001  ! 537: LDUW_I	lduw	[%r31 + 0x0001], %r27
	.word 0xf657c000  ! 538: LDSH_R	ldsh	[%r31 + %r0], %r27
	.word 0x87802016  ! 539: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x879022f5  ! 541: WRPR_TT_I	wrpr	%r0, 0x02f5, %tt
	.word 0xa1902002  ! 542: WRPR_GL_I	wrpr	%r0, 0x0002, %-
tagged_115:
	taddcctv %r21, 0x1e41, %r2
	.word 0xf607e001  ! 543: LDUW_I	lduw	[%r31 + 0x0001], %r27
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf65fc000  ! 544: LDX_R	ldx	[%r31 + %r0], %r27
tagged_116:
	tsubcctv %r10, 0x1ad0, %r24
	.word 0xf607e001  ! 545: LDUW_I	lduw	[%r31 + 0x0001], %r27
	.word 0x8945c000  ! 546: RD_TICK_CMPR_REG	rd	%-, %r4
	.word 0xb3500000  ! 547: RDPR_TPC	rdpr	%tpc, %r25
	.word 0xa9514000  ! 548: RDPR_TBA	<illegal instruction>
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01963  ! 549: FqTOd	dis not found

	.word 0xe6c804a0  ! 550: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
	.word 0xe697e030  ! 551: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r19
	.word 0x87802014  ! 552: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xe60fe001  ! 553: LDUB_I	ldub	[%r31 + 0x0001], %r19
splash_lsu_118:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 554: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe65fc000  ! 555: LDX_R	ldx	[%r31 + %r0], %r19
splash_lsu_119:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 556: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_120:
	tsubcctv %r23, 0x1100, %r2
	.word 0xe607e001  ! 557: LDUW_I	lduw	[%r31 + 0x0001], %r19
DS_121:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc9124003  ! 1: LDQF_R	-	[%r9, %r3], %f4
	.word 0x91a6c837  ! 558: FADDs	fadds	%f27, %f23, %f8
splash_lsu_122:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 559: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9022aa  ! 560: WRPR_PSTATE_I	wrpr	%r0, 0x02aa, %pstate
	.word 0x8780201c  ! 561: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd09004a0  ! 562: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
splash_tba_123:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 563: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd01fe001  ! 564: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0xd0c804a0  ! 565: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
splash_lsu_124:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 566: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_125:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xe1104011  ! 1: LDQF_R	-	[%r1, %r17], %f16
	.word 0x81a58826  ! 567: FADDs	fadds	%f22, %f6, %f0
	.word 0x87902034  ! 568: WRPR_TT_I	wrpr	%r0, 0x0034, %tt
	.word 0x879020f2  ! 569: WRPR_TT_I	wrpr	%r0, 0x00f2, %tt
	.word 0xc04fe001  ! 570: LDSB_I	ldsb	[%r31 + 0x0001], %r0
	.word 0xc0c00e80  ! 571: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r0
	.word 0x81982005  ! 572: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0005, %hpstate
splash_lsu_126:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 573: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 574: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902958  ! 575: WRPR_PSTATE_I	wrpr	%r0, 0x0958, %pstate
DS_127:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 576: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802089  ! 577: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xaf50c000  ! 578: RDPR_TT	rdpr	%tt, %r23
splash_tba_128:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 579: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xeec7e000  ! 580: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r23
	.word 0xee17e001  ! 581: LDUH_I	lduh	[%r31 + 0x0001], %r23
	.word 0x89508000  ! 582: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0xa5480000  ! 583: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0xa190200a  ! 584: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_lsu_129:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 585: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 586: SIR	sir	0x0001
	.word 0x87802016  ! 587: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x28700001  ! 588: BPLEU	<illegal instruction>
	.word 0x8f540000  ! 589: RDPR_GL	rdpr	%-, %r7
	.word 0x83d02035  ! 590: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa5540000  ! 591: RDPR_GL	rdpr	%-, %r18
	.word 0xe4800c60  ! 592: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r18
	.word 0x9f802001  ! 593: SIR	sir	0x0001
splash_tba_130:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 594: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802001  ! 595: SIR	sir	0x0001
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe45fc000  ! 596: LDX_R	ldx	[%r31 + %r0], %r18
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 597: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902d06  ! 598: WRPR_PSTATE_I	wrpr	%r0, 0x0d06, %pstate
DS_131:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 599: SAVE_R	save	%r31, %r0, %r31
	.word 0x99902001  ! 600: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_tba_132:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 601: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902305  ! 602: WRPR_TT_I	wrpr	%r0, 0x0305, %tt
	.word 0xe447e001  ! 603: LDSW_I	ldsw	[%r31 + 0x0001], %r18
splash_lsu_133:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 604: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 605: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8ba00555  ! 606: FSQRTd	fsqrt	
	.word 0xa1902000  ! 607: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xca1fc000  ! 608: LDD_R	ldd	[%r31 + %r0], %r5
	.word 0xa1902006  ! 609: WRPR_GL_I	wrpr	%r0, 0x0006, %-
tagged_134:
	tsubcctv %r11, 0x12c7, %r22
	.word 0xca07e001  ! 610: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x99902002  ! 611: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x91514000  ! 612: RDPR_TBA	rdpr	%tba, %r8
	.word 0x879021ee  ! 613: WRPR_TT_I	wrpr	%r0, 0x01ee, %tt
	.word 0x8d902967  ! 614: WRPR_PSTATE_I	wrpr	%r0, 0x0967, %pstate
	.word 0xd0d004a0  ! 615: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0x8198221f  ! 616: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021f, %hpstate
	.word 0x8780204f  ! 617: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa190200a  ! 618: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd0d80e80  ! 619: LDXA_R	ldxa	[%r0, %r0] 0x74, %r8
splash_lsu_135:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 620: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902d4a  ! 621: WRPR_PSTATE_I	wrpr	%r0, 0x0d4a, %pstate
	.word 0xd08008a0  ! 622: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0c7e010  ! 623: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r8
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 624: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902053  ! 625: WRPR_TT_I	wrpr	%r0, 0x0053, %tt
	.word 0x95504000  ! 626: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0xa1902006  ! 627: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd4d00e80  ! 628: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x89480000  ! 630: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x91d020b4  ! 631: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_lsu_136:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 632: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_137:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf135c014  ! 1: STQF_R	-	%f24, [%r20, %r23]
	normalw
	.word 0x85458000  ! 633: RD_SOFTINT_REG	rd	%softint, %r2
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 634: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_138:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 635: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc457e001  ! 636: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0x93902006  ! 637: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
tagged_139:
	taddcctv %r12, 0x1a9b, %r8
	.word 0xc407e001  ! 638: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc41fe001  ! 639: LDD_I	ldd	[%r31 + 0x0001], %r2
	.word 0xc4800bc0  ! 640: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r2
	.word 0x93902001  ! 641: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x83d02032  ! 642: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x93902003  ! 643: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_140:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 644: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc48008a0  ! 645: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x3e800001  ! 646: BVC	bvc,a	<label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 647: LDX_R	ldx	[%r31 + %r0], %r2
tagged_141:
	taddcctv %r10, 0x1050, %r11
	.word 0xc407e001  ! 648: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x8d902638  ! 649: WRPR_PSTATE_I	wrpr	%r0, 0x0638, %pstate
splash_tba_142:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 650: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902004  ! 651: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81464000  ! 653: RD_STICK_CMPR_REG	stbar
	.word 0x93902001  ! 654: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87902070  ! 655: WRPR_TT_I	wrpr	%r0, 0x0070, %tt
splash_lsu_143:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 656: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc04fc000  ! 657: LDSB_R	ldsb	[%r31 + %r0], %r0
	.word 0x91d020b4  ! 658: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x9f802001  ! 659: SIR	sir	0x0001
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 660: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_144:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 661: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc01fc000  ! 662: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0xc0c004a0  ! 663: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
DS_145:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd9316001  ! 1: STQF_I	-	%f12, [0x0001, %r5]
	normalw
	.word 0xa1458000  ! 664: RD_SOFTINT_REG	rd	%softint, %r16
tagged_146:
	tsubcctv %r26, 0x1c8e, %r14
	.word 0xe007e001  ! 665: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8351c000  ! 666: RDPR_TL	rdpr	%tl, %r1
tagged_147:
	taddcctv %r26, 0x1e1e, %r22
	.word 0xc207e001  ! 667: LDUW_I	lduw	[%r31 + 0x0001], %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc257e001  ! 669: LDSH_I	ldsh	[%r31 + 0x0001], %r1
	.word 0x99902002  ! 670: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xc337e001  ! 671: STQF_I	-	%f1, [0x0001, %r31]
	.word 0x8790202a  ! 672: WRPR_TT_I	wrpr	%r0, 0x002a, %tt
DS_148:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe3340008  ! 1: STQF_R	-	%f17, [%r8, %r16]
	normalw
	.word 0x81458000  ! 673: RD_SOFTINT_REG	stbar
splash_lsu_149:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 674: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 675: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902b49  ! 676: WRPR_PSTATE_I	wrpr	%r0, 0x0b49, %pstate
	.word 0xc09fc020  ! 677: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0x83d02035  ! 678: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa1902000  ! 679: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_lsu_150:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 680: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_151:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xcb334004  ! 1: STQF_R	-	%f5, [%r4, %r13]
	normalw
	.word 0xa1458000  ! 681: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x879023c6  ! 682: WRPR_TT_I	wrpr	%r0, 0x03c6, %tt
	.word 0x8780204f  ! 683: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe01fe001  ! 684: LDD_I	ldd	[%r31 + 0x0001], %r16
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe05fc000  ! 685: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xe017c000  ! 686: LDUH_R	lduh	[%r31 + %r0], %r16
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 687: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d500000  ! 688: RDPR_TPC	rdpr	%tpc, %r6
splash_htba_152:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 689: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902002  ! 690: WRPR_GL_I	wrpr	%r0, 0x0002, %-
DS_153:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xc1320019  ! 1: STQF_R	-	%f0, [%r25, %r8]
	normalw
	.word 0x95458000  ! 691: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8780204f  ! 692: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd417e001  ! 693: LDUH_I	lduh	[%r31 + 0x0001], %r10
	.word 0xd41fe001  ! 694: LDD_I	ldd	[%r31 + 0x0001], %r10
change_to_randtl_154:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 695: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91d02034  ! 696: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd497e020  ! 697: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0x8d802004  ! 698: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x819825c7  ! 699: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c7, %hpstate
DS_155:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 700: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_156:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182a001  ! 701: WR_STICK_REG_I	wr	%r10, 0x0001, %-
change_to_randtl_157:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 702: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xd4c7e030  ! 703: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
change_to_randtl_158:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 704: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
DS_159:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xeb110001  ! 1: LDQF_R	-	[%r4, %r1], %f21
	.word 0x81a28820  ! 705: FADDs	fadds	%f10, %f0, %f0
	.word 0x2e800001  ! 706: BVS	bvs,a	<label_0x1>
DS_160:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 707: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xc017c000  ! 708: LDUH_R	lduh	[%r31 + %r0], %r0
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 709: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0x879023b1  ! 710: WRPR_TT_I	wrpr	%r0, 0x03b1, %tt
splash_htba_161:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 711: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 712: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0x8d802000  ! 713: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02035  ! 714: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902289  ! 715: WRPR_TT_I	wrpr	%r0, 0x0289, %tt
	.word 0x87802058  ! 716: WRASI_I	wr	%r0, 0x0058, %asi
tagged_162:
	tsubcctv %r23, 0x1888, %r25
	.word 0xc007e001  ! 717: LDUW_I	lduw	[%r31 + 0x0001], %r0
tagged_163:
	taddcctv %r11, 0x1bc2, %r2
	.word 0xc007e001  ! 718: LDUW_I	lduw	[%r31 + 0x0001], %r0
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc05fc000  ! 719: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc0900e60  ! 720: LDUHA_R	lduha	[%r0, %r0] 0x73, %r0
	.word 0x9f802001  ! 721: SIR	sir	0x0001
	.word 0xc00fc000  ! 722: LDUB_R	ldub	[%r31 + %r0], %r0
	.word 0x8d802000  ! 723: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02034  ! 724: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 725: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_164:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 726: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_165:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 727: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc08008a0  ! 728: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc0bfe001  ! 729: STDA_I	stda	%r0, [%r31 + 0x0001] %asi
splash_cmpr_166:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 730: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0xc08008a0  ! 731: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x879023d1  ! 732: WRPR_TT_I	wrpr	%r0, 0x03d1, %tt
	.word 0xc0800b60  ! 733: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r0
	.word 0x8951c000  ! 734: RDPR_TL	rdpr	%tl, %r4
	.word 0x83d02032  ! 735: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_lsu_167:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 736: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_168:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 737: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc89004a0  ! 738: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
DS_169:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 739: SAVE_R	save	%r31, %r0, %r31
	.word 0xc80fc000  ! 740: LDUB_R	ldub	[%r31 + %r0], %r4
splash_htba_170:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 741: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902009  ! 742: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xb550c000  ! 743: RDPR_TT	rdpr	%tt, %r26
	.word 0xf4c7e010  ! 744: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r26
splash_tba_171:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 745: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf48008a0  ! 746: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	ta	T_CHANGE_PRIV	! macro
	.word 0x986dc003  ! 748: UDIVX_R	udivx 	%r23, %r3, %r12
DS_172:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xa3f82859	! Random illegal ?
	.word 0x89a00556  ! 1: FSQRTd	fsqrt	
	.word 0x99a44823  ! 749: FADDs	fadds	%f17, %f3, %f12
	.word 0x879023f5  ! 750: WRPR_TT_I	wrpr	%r0, 0x03f5, %tt
	.word 0xd88008a0  ! 751: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa1902009  ! 752: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x879023ba  ! 753: WRPR_TT_I	wrpr	%r0, 0x03ba, %tt
	.word 0x93d02032  ! 754: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xa190200b  ! 755: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d540000  ! 756: RDPR_GL	rdpr	%-, %r6
	.word 0x87802020  ! 757: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xccd004a0  ! 758: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
tagged_173:
	taddcctv %r15, 0x1853, %r20
	.word 0xcc07e001  ! 759: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc8fe020  ! 760: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r6
	.word 0xcc8804a0  ! 761: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
	.word 0xcc8008a0  ! 762: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xcc17e001  ! 763: LDUH_I	lduh	[%r31 + 0x0001], %r6
	.word 0xa190200c  ! 764: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_lsu_174:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 765: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3c700001  ! 766: BPPOS	<illegal instruction>
	.word 0xcc97e000  ! 767: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r6
	.word 0xcc9fc020  ! 768: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x8790238a  ! 769: WRPR_TT_I	wrpr	%r0, 0x038a, %tt
	.word 0x8d902212  ! 770: WRPR_PSTATE_I	wrpr	%r0, 0x0212, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 771: LDX_R	ldx	[%r31 + %r0], %r6
DS_175:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x99a00540  ! 1: FSQRTd	fsqrt	
	.word 0x9ba58823  ! 772: FADDs	fadds	%f22, %f3, %f13
	.word 0x87902365  ! 773: WRPR_TT_I	wrpr	%r0, 0x0365, %tt
	.word 0x9882401a  ! 774: ADDcc_R	addcc 	%r9, %r26, %r12
	.word 0xd8d80e40  ! 775: LDXA_R	ldxa	[%r0, %r0] 0x72, %r12
splash_lsu_176:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 776: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_177:
	taddcctv %r9, 0x1785, %r18
	.word 0xd807e001  ! 777: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd847e001  ! 778: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 779: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd8800be0  ! 780: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r12
	.word 0xd89fe001  ! 781: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
splash_lsu_178:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 782: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 783: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xa350c000  ! 784: RDPR_TT	rdpr	%tt, %r17
	.word 0x8d802004  ! 785: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_htba_179:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 786: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902819  ! 787: WRPR_PSTATE_I	wrpr	%r0, 0x0819, %pstate
	.word 0xe2cfe010  ! 788: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r17
	.word 0x87902352  ! 789: WRPR_TT_I	wrpr	%r0, 0x0352, %tt
	.word 0xa190200d  ! 790: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x99902001  ! 791: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xe2d004a0  ! 792: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x87802014  ! 793: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x95464000  ! 794: RD_STICK_CMPR_REG	rd	%-, %r10
tagged_180:
	tsubcctv %r11, 0x15cb, %r14
	.word 0xd407e001  ! 795: LDUW_I	lduw	[%r31 + 0x0001], %r10
DS_181:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 796: SAVE_R	save	%r31, %r0, %r31
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 797: LDX_R	ldx	[%r31 + %r0], %r10
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 798: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 799: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_182:
	tsubcctv %r24, 0x118b, %r17
	.word 0xd407e001  ! 800: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd49004a0  ! 801: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	.word 0x38800001  ! 802: BGU	bgu,a	<label_0x1>
	.word 0x8d9027ba  ! 803: WRPR_PSTATE_I	wrpr	%r0, 0x07ba, %pstate
	.word 0x97540000  ! 804: RDPR_GL	rdpr	%-, %r11
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 805: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd6c7e010  ! 806: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
	.word 0x91d020b4  ! 807: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_lsu_183:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 808: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_184:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 809: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd617c000  ! 810: LDUH_R	lduh	[%r31 + %r0], %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89830009  ! 811: WRTICK_R	wr	%r12, %r9, %tick
	.word 0xd6dfe010  ! 812: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0xd64fe001  ! 813: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0xd69fe001  ! 814: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
	.word 0x87802016  ! 815: WRASI_I	wr	%r0, 0x0016, %asi
splash_htba_186:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 816: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 817: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x9f802001  ! 818: SIR	sir	0x0001
	.word 0x99902001  ! 819: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 820: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902000  ! 821: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d90205a  ! 822: WRPR_PSTATE_I	wrpr	%r0, 0x005a, %pstate
	.word 0x8f508000  ! 823: RDPR_TSTATE	rdpr	%tstate, %r7
splash_tba_187:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 824: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcf37c009  ! 825: STQF_R	-	%f7, [%r9, %r31]
	.word 0x87802004  ! 826: WRASI_I	wr	%r0, 0x0004, %asi
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 827: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_188:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 828: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790218b  ! 829: WRPR_TT_I	wrpr	%r0, 0x018b, %tt
	.word 0xce17e001  ! 830: LDUH_I	lduh	[%r31 + 0x0001], %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 831: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x8790206e  ! 832: WRPR_TT_I	wrpr	%r0, 0x006e, %tt
splash_tba_189:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 833: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87508000  ! 834: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0xc69004a0  ! 835: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0xc6880e40  ! 836: LDUBA_R	lduba	[%r0, %r0] 0x72, %r3
	.word 0x93902006  ! 837: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc69fc020  ! 838: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 839: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x30700001  ! 840: BPA	<illegal instruction>
	.word 0x91d020b2  ! 841: Tcc_I	ta	icc_or_xcc, %r0 + 178
DS_190:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f10, %f24, %f26
	.word 0x91b24318  ! 842: ALIGNADDRESS	alignaddr	%r9, %r24, %r8
	.word 0xd00fc000  ! 843: LDUB_R	ldub	[%r31 + %r0], %r8
	.word 0x8d90242b  ! 844: WRPR_PSTATE_I	wrpr	%r0, 0x042b, %pstate
splash_lsu_191:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 845: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd03fc018  ! 846: STD_R	std	%r8, [%r31 + %r24]
	.word 0xd117c000  ! 847: LDQF_R	-	[%r31, %r0], %f8
	.word 0xd09fc020  ! 848: LDDA_R	ldda	[%r31, %r0] 0x01, %r8
splash_tba_192:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 849: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x96fb4007  ! 850: SDIVcc_R	sdivcc 	%r13, %r7, %r11
	.word 0xa190200e  ! 851: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x91d02033  ! 852: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902006  ! 853: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d020b2  ! 854: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd69004a0  ! 855: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0x93540000  ! 856: RDPR_GL	rdpr	%-, %r9
	.word 0x91d02032  ! 857: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902007  ! 858: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902b47  ! 859: WRPR_PSTATE_I	wrpr	%r0, 0x0b47, %pstate
	.word 0xa1902008  ! 860: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d902a2c  ! 861: WRPR_PSTATE_I	wrpr	%r0, 0x0a2c, %pstate
splash_cmpr_193:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1862001  ! 862: WR_STICK_REG_I	wr	%r24, 0x0001, %-
	.word 0x3a700001  ! 863: BPCC	<illegal instruction>
	.word 0xd207c000  ! 864: LDUW_R	lduw	[%r31 + %r0], %r9
	.word 0xd297e030  ! 865: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 866: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd257c000  ! 867: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0xd257c000  ! 868: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x93902004  ! 869: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902034  ! 870: WRPR_TT_I	wrpr	%r0, 0x0034, %tt
splash_cmpr_194:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1832001  ! 871: WR_STICK_REG_I	wr	%r12, 0x0001, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd25fc000  ! 872: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd20fc000  ! 873: LDUB_R	ldub	[%r31 + %r0], %r9
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 874: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 875: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902006  ! 876: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 877: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xa190200a  ! 878: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd297e000  ! 879: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r9
	.word 0x83d02034  ! 880: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x2e800001  ! 881: BVS	bvs,a	<label_0x1>
	.word 0x93902002  ! 882: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d020b3  ! 883: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xd28fe030  ! 884: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
	.word 0xd2d7e010  ! 885: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
DS_195:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	allclean
	.word 0xa9b5430c  ! 886: ALIGNADDRESS	alignaddr	%r21, %r12, %r20
tagged_196:
	tsubcctv %r4, 0x1411, %r16
	.word 0xe807e001  ! 887: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xe847e001  ! 888: LDSW_I	ldsw	[%r31 + 0x0001], %r20
	.word 0x8d90228a  ! 889: WRPR_PSTATE_I	wrpr	%r0, 0x028a, %pstate
splash_tba_197:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 890: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe8880e80  ! 891: LDUBA_R	lduba	[%r0, %r0] 0x74, %r20
	.word 0x97464000  ! 892: RD_STICK_CMPR_REG	rd	%-, %r11
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 893: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd68008a0  ! 894: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x91d02035  ! 895: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 896: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x81982fcf  ! 897: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcf, %hpstate
	.word 0xa190200e  ! 898: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 899: LDX_R	ldx	[%r31 + %r0], %r11
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd65fc000  ! 900: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x99902003  ! 901: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	ta	T_CHANGE_PRIV	! macro
	.word 0xd657c000  ! 903: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0xd6d7e030  ! 904: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
DS_198:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xf3336001  ! 1: STQF_I	-	%f25, [0x0001, %r13]
	normalw
	.word 0xb1458000  ! 905: RD_SOFTINT_REG	rd	%softint, %r24
DS_199:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 906: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa190200f  ! 907: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xf09fe001  ! 908: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r24
tagged_200:
	tsubcctv %r8, 0x1d91, %r1
	.word 0xf007e001  ! 909: LDUW_I	lduw	[%r31 + 0x0001], %r24
splash_cmpr_201:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181e001  ! 910: WR_STICK_REG_I	wr	%r7, 0x0001, %-
DS_202:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f2, %f8, %f26
	.word 0x85b1c319  ! 911: ALIGNADDRESS	alignaddr	%r7, %r25, %r2
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1818007  ! 912: WR_STICK_REG_R	wr	%r6, %r7, %-
	.word 0xc49fc020  ! 913: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x8d50c000  ! 914: RDPR_TT	<illegal instruction>
	.word 0xcc9fe001  ! 915: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	.word 0x87802004  ! 916: WRASI_I	wr	%r0, 0x0004, %asi
splash_lsu_204:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 917: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xccc00e60  ! 918: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xccd7e000  ! 920: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r6
	.word 0xcc8008a0  ! 921: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xccd004a0  ! 922: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	.word 0x87902286  ! 923: WRPR_TT_I	wrpr	%r0, 0x0286, %tt
tagged_205:
	taddcctv %r12, 0x1ddb, %r8
	.word 0xcc07e001  ! 924: LDUW_I	lduw	[%r31 + 0x0001], %r6
DS_206:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 925: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
splash_lsu_207:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 927: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_208:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 928: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa190200b  ! 929: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 930: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_209:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 931: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_210:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 932: SAVE_R	save	%r31, %r0, %r31
	.word 0xcd97e001  ! 933: LDQFA_I	-	[%r31, 0x0001], %f6
	.word 0x91d020b2  ! 934: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x81460000  ! 935: RD_STICK_REG	stbar
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 936: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xcc9fe001  ! 937: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	.word 0x87902362  ! 938: WRPR_TT_I	wrpr	%r0, 0x0362, %tt
	.word 0xcc8008a0  ! 939: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_PRIV	! macro
splash_tba_211:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 941: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcd17c000  ! 942: LDQF_R	-	[%r31, %r0], %f6
	.word 0x93902001  ! 943: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902004  ! 944: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xcc8804a0  ! 945: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
DS_212:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 946: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_213:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 947: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 948: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9464000  ! 949: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0x87902184  ! 950: WRPR_TT_I	wrpr	%r0, 0x0184, %tt
DS_214:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xf531c01a  ! 1: STQF_R	-	%f26, [%r26, %r7]
	normalw
	.word 0x87458000  ! 951: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc69004a0  ! 952: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
DS_215:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd713401b  ! 1: LDQF_R	-	[%r13, %r27], %f11
	.word 0xa7a4c82c  ! 953: FADDs	fadds	%f19, %f12, %f19
	.word 0x34700001  ! 954: BPG	<illegal instruction>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe65fc000  ! 955: LDX_R	ldx	[%r31 + %r0], %r19
	.word 0x87802016  ! 956: WRASI_I	wr	%r0, 0x0016, %asi
DS_216:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 957: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x87802004  ! 958: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x30700001  ! 959: BPA	<illegal instruction>
	.word 0xe68fe000  ! 960: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r19
	.word 0xe647e001  ! 961: LDSW_I	ldsw	[%r31 + 0x0001], %r19
	.word 0x8d902896  ! 962: WRPR_PSTATE_I	wrpr	%r0, 0x0896, %pstate
splash_tba_217:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 963: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879021e2  ! 964: WRPR_TT_I	wrpr	%r0, 0x01e2, %tt
	.word 0x8d902655  ! 965: WRPR_PSTATE_I	wrpr	%r0, 0x0655, %pstate
	.word 0x99902003  ! 966: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
splash_tba_218:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 967: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902003  ! 968: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_219:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 969: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe6c804a0  ! 970: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r19
splash_lsu_220:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 971: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_221:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 972: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe6800a60  ! 973: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r19
	.word 0xe61fc000  ! 974: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x8d902fa2  ! 975: WRPR_PSTATE_I	wrpr	%r0, 0x0fa2, %pstate
	.word 0xe61fc000  ! 976: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a01973  ! 977: FqTOd	dis not found

DS_223:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xef30a001  ! 1: STQF_I	-	%f23, [0x0001, %r2]
	normalw
	.word 0x95458000  ! 978: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x91d020b4  ! 979: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xb16a4018  ! 980: SDIVX_R	sdivx	%r9, %r24, %r24
splash_lsu_224:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 981: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 982: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9950c000  ! 983: RDPR_TT	rdpr	%tt, %r12
DS_225:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 984: SAVE_R	save	%r31, %r0, %r31
	.word 0x2a800001  ! 985: BCS	bcs,a	<label_0x1>
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa3a01968  ! 986: FqTOd	dis not found

DS_227:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 987: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x85514000  ! 988: RDPR_TBA	rdpr	%tba, %r2
	.word 0x99508000  ! 989: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x8198211f  ! 990: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011f, %hpstate
	.word 0x87902395  ! 991: WRPR_TT_I	wrpr	%r0, 0x0395, %tt
	.word 0xd88804a0  ! 992: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
splash_htba_228:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 993: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87802010  ! 994: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd847e001  ! 995: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 996: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_229:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 997: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 998: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d902eda  ! 999: WRPR_PSTATE_I	wrpr	%r0, 0x0eda, %pstate
tagged_230:
	tsubcctv %r12, 0x19d5, %r25
	.word 0xd807e001  ! 1000: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd82fc008  ! 1001: STB_R	stb	%r12, [%r31 + %r8]
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa769a001  ! 1002: SDIVX_I	sdivx	%r6, 0x0001, %r19
	.word 0xe657e001  ! 1003: LDSH_I	ldsh	[%r31 + 0x0001], %r19
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe65fc000  ! 1004: LDX_R	ldx	[%r31 + %r0], %r19
tagged_232:
	tsubcctv %r18, 0x1b88, %r9
	.word 0xe607e001  ! 1005: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xe797e001  ! 1006: LDQFA_I	-	[%r31, 0x0001], %f19
	.word 0xe657c000  ! 1007: LDSH_R	ldsh	[%r31 + %r0], %r19
	.word 0x83d02033  ! 1008: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8345c000  ! 1009: RD_TICK_CMPR_REG	rd	%-, %r1
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 1010: LDX_R	ldx	[%r31 + %r0], %r1
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 1011: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x34800001  ! 1012: BG	bg,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_233:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1014: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xc207c000  ! 1015: LDUW_R	lduw	[%r31 + %r0], %r1
	.word 0x8780201c  ! 1016: WRASI_I	wr	%r0, 0x001c, %asi
splash_tba_234:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1017: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879021ea  ! 1018: WRPR_TT_I	wrpr	%r0, 0x01ea, %tt
	.word 0xa1508000  ! 1019: RDPR_TSTATE	rdpr	%tstate, %r16
tagged_235:
	taddcctv %r25, 0x1ff0, %r15
	.word 0xe007e001  ! 1020: LDUW_I	lduw	[%r31 + 0x0001], %r16
splash_tba_236:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1021: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 1022: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902007  ! 1023: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x9f802001  ! 1024: SIR	sir	0x0001
	.word 0xe197e001  ! 1025: LDQFA_I	-	[%r31, 0x0001], %f16
	.word 0x87902114  ! 1026: WRPR_TT_I	wrpr	%r0, 0x0114, %tt
	.word 0x879022ca  ! 1027: WRPR_TT_I	wrpr	%r0, 0x02ca, %tt
splash_tba_237:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1028: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802080  ! 1029: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902339  ! 1030: WRPR_PSTATE_I	wrpr	%r0, 0x0339, %pstate
	.word 0x93902004  ! 1031: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x879021bf  ! 1032: WRPR_TT_I	wrpr	%r0, 0x01bf, %tt
	.word 0xe0800ae0  ! 1033: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r16
	.word 0x22800001  ! 1034: BE	be,a	<label_0x1>
	.word 0x93d02035  ! 1035: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x83d020b2  ! 1036: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xe09fc020  ! 1037: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
	.word 0x87500000  ! 1038: RDPR_TPC	rdpr	%tpc, %r3
	.word 0xc61fc000  ! 1039: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xc6d004a0  ! 1040: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
splash_tba_238:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1041: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68fe010  ! 1042: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r3
	.word 0x8780204f  ! 1043: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x99902003  ! 1044: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x83514000  ! 1045: RDPR_TBA	rdpr	%tba, %r1
	.word 0xc2dfe000  ! 1046: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r1
splash_lsu_239:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1047: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_240:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1048: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc28008a0  ! 1049: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x99902002  ! 1051: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x85480000  ! 1052: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 1053: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc4c804a0  ! 1054: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r2
	.word 0x93902006  ! 1055: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x24800001  ! 1056: BLE	ble,a	<label_0x1>
DS_241:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f12, %f22, %f26
	.word 0x97b10304  ! 1057: ALIGNADDRESS	alignaddr	%r4, %r4, %r11
splash_lsu_242:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1058: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902eeb  ! 1059: WRPR_PSTATE_I	wrpr	%r0, 0x0eeb, %pstate
	.word 0xd69004a0  ! 1060: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0xd69fe001  ! 1061: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
	.word 0xd6dfe030  ! 1062: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0xd68fe000  ! 1063: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r11
	.word 0x9145c000  ! 1064: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x32700001  ! 1065: BPNE	<illegal instruction>
tagged_243:
	taddcctv %r20, 0x1059, %r15
	.word 0xd007e001  ! 1066: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xd0c004a0  ! 1067: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x8780204f  ! 1068: WRASI_I	wr	%r0, 0x004f, %asi
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1069: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_244:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1070: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790208a  ! 1071: WRPR_TT_I	wrpr	%r0, 0x008a, %tt
	.word 0x8790221e  ! 1072: WRPR_TT_I	wrpr	%r0, 0x021e, %tt
DS_245:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f14, %f20, %f18
	.word 0x87b44313  ! 1073: ALIGNADDRESS	alignaddr	%r17, %r19, %r3
	.word 0xc6c00e80  ! 1074: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r3
	.word 0x93902005  ! 1075: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc6c80e60  ! 1076: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r3
	.word 0x93902001  ! 1077: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_PRIV	! macro
tagged_246:
	tsubcctv %r16, 0x1b8b, %r13
	.word 0xc607e001  ! 1079: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc68008a0  ! 1080: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x2a700001  ! 1081: BPCS	<illegal instruction>
tagged_247:
	taddcctv %r3, 0x1803, %r22
	.word 0xc607e001  ! 1082: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_htba_248:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1083: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_249:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0xadb6030d  ! 1084: ALIGNADDRESS	alignaddr	%r24, %r13, %r22
	.word 0x93902002  ! 1085: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1086: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1087: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 1088: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_tba_250:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1089: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x3a700001  ! 1090: BPCC	<illegal instruction>
	.word 0x9f802001  ! 1091: SIR	sir	0x0001
	.word 0xec07c000  ! 1092: LDUW_R	lduw	[%r31 + %r0], %r22
	.word 0x87802020  ! 1093: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xec8008a0  ! 1094: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
splash_tba_251:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1095: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xed27e001  ! 1096: STF_I	st	%f22, [0x0001, %r31]
	.word 0xec9fc020  ! 1097: LDDA_R	ldda	[%r31, %r0] 0x01, %r22
tagged_252:
	tsubcctv %r14, 0x11af, %r24
	.word 0xec07e001  ! 1098: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x81982757  ! 1099: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0757, %hpstate
	.word 0xed17c000  ! 1100: LDQF_R	-	[%r31, %r0], %f22
	.word 0x93902002  ! 1101: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902000  ! 1102: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xec8fe030  ! 1103: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r22
	ta	T_CHANGE_PRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xec5fc000  ! 1105: LDX_R	ldx	[%r31 + %r0], %r22
	.word 0xecdfe030  ! 1106: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r22
splash_htba_253:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1107: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xec1fc000  ! 1108: LDD_R	ldd	[%r31 + %r0], %r22
	.word 0xed97e001  ! 1109: LDQFA_I	-	[%r31, 0x0001], %f22
	.word 0x93902001  ! 1110: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_cmpr_254:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180e001  ! 1111: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x8198228d  ! 1112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028d, %hpstate
	.word 0x8d802004  ! 1113: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_255:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184a001  ! 1114: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0xec1fc000  ! 1115: LDD_R	ldd	[%r31 + %r0], %r22
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xec5fc000  ! 1116: LDX_R	ldx	[%r31 + %r0], %r22
	.word 0x8198258f  ! 1117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058f, %hpstate
	.word 0x8790224f  ! 1118: WRPR_TT_I	wrpr	%r0, 0x024f, %tt
	.word 0x8d902951  ! 1119: WRPR_PSTATE_I	wrpr	%r0, 0x0951, %pstate
	.word 0xa190200b  ! 1120: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xec0fc000  ! 1121: LDUB_R	ldub	[%r31 + %r0], %r22
	.word 0xa1902006  ! 1122: WRPR_GL_I	wrpr	%r0, 0x0006, %-
DS_256:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1123: RESTORE_R	restore	%r31, %r0, %r31
DS_257:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd9326001  ! 1: STQF_I	-	%f12, [0x0001, %r9]
	normalw
	.word 0x81458000  ! 1124: RD_SOFTINT_REG	stbar
	.word 0x91d02033  ! 1125: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc017e001  ! 1126: LDUH_I	lduh	[%r31 + 0x0001], %r0
DS_258:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1127: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc0cfe030  ! 1128: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r0
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1129: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 1130: BLEU	bleu,a	<label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 1131: LDX_R	ldx	[%r31 + %r0], %r0
DS_259:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xf7312001  ! 1: STQF_I	-	%f27, [0x0001, %r4]
	normalw
	.word 0x8b458000  ! 1132: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x87902042  ! 1133: WRPR_TT_I	wrpr	%r0, 0x0042, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 1134: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x87802063  ! 1135: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xca8008a0  ! 1136: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x30700001  ! 1137: BPA	<illegal instruction>
	.word 0xca800b40  ! 1138: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r5
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 1139: LDX_R	ldx	[%r31 + %r0], %r5
DS_260:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1140: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1141: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b2  ! 1142: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x87802020  ! 1143: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xa1902003  ! 1144: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d802000  ! 1145: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9020b0  ! 1146: WRPR_PSTATE_I	wrpr	%r0, 0x00b0, %pstate
splash_tba_261:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1147: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902006  ! 1148: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_lsu_262:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1149: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xca5fe001  ! 1150: LDX_I	ldx	[%r31 + 0x0001], %r5
	.word 0xca97e000  ! 1151: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r5
	.word 0x8d90271f  ! 1152: WRPR_PSTATE_I	wrpr	%r0, 0x071f, %pstate
	.word 0xcad7e000  ! 1153: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r5
	.word 0xca77c00d  ! 1154: STX_R	stx	%r5, [%r31 + %r13]
	.word 0xca800b00  ! 1155: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r5
	.word 0x87802020  ! 1156: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x93902001  ! 1157: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 1158: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x87802063  ! 1159: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa1902000  ! 1160: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d802000  ! 1161: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9b464000  ! 1162: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0xdb37c00d  ! 1163: STQF_R	-	%f13, [%r13, %r31]
	.word 0x93902007  ! 1164: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902498  ! 1165: WRPR_PSTATE_I	wrpr	%r0, 0x0498, %pstate
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1166: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x83d02033  ! 1167: Tcc_I	te	icc_or_xcc, %r0 + 51
DS_263:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1168: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xdb17c000  ! 1169: LDQF_R	-	[%r31, %r0], %f13
	.word 0xda3fe001  ! 1170: STD_I	std	%r13, [%r31 + 0x0001]
splash_tba_264:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1171: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81460000  ! 1172: RD_STICK_REG	stbar
splash_tba_265:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1173: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902005  ! 1174: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87802063  ! 1175: WRASI_I	wr	%r0, 0x0063, %asi
DS_266:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1176: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xda8fe010  ! 1177: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
change_to_randtl_267:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1178: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8d802004  ! 1179: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_lsu_268:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1180: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda1fc000  ! 1181: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xa190200a  ! 1182: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1183: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa190200f  ! 1184: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87802014  ! 1185: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x83d020b2  ! 1186: Tcc_I	te	icc_or_xcc, %r0 + 178
change_to_randtl_269:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1187: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x83464000  ! 1188: RD_STICK_CMPR_REG	rd	%-, %r1
splash_tba_270:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1189: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902da1  ! 1190: WRPR_PSTATE_I	wrpr	%r0, 0x0da1, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc25fc000  ! 1191: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x93902002  ! 1192: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc2cfe000  ! 1193: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r1
	.word 0xc2d80e40  ! 1194: LDXA_R	ldxa	[%r0, %r0] 0x72, %r1
splash_lsu_271:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1195: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_272:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1196: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d902f9e  ! 1197: WRPR_PSTATE_I	wrpr	%r0, 0x0f9e, %pstate
	.word 0xc28008a0  ! 1198: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc25fe001  ! 1199: LDX_I	ldx	[%r31 + 0x0001], %r1
	.word 0xc317c000  ! 1200: LDQF_R	-	[%r31, %r0], %f1
	.word 0x8d902da3  ! 1201: WRPR_PSTATE_I	wrpr	%r0, 0x0da3, %pstate
splash_lsu_273:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1202: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc297e030  ! 1203: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r1
	.word 0xc28008a0  ! 1204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x96d62001  ! 1205: UMULcc_I	umulcc 	%r24, 0x0001, %r11
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196c  ! 1206: FqTOd	dis not found

tagged_275:
	taddcctv %r13, 0x1a25, %r24
	.word 0xd207e001  ! 1207: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xa1902003  ! 1208: WRPR_GL_I	wrpr	%r0, 0x0003, %-
change_to_randtl_276:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1209: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802088  ! 1210: WRASI_I	wr	%r0, 0x0088, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd25fc000  ! 1211: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c804a0  ! 1212: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
tagged_277:
	taddcctv %r20, 0x1cae, %r9
	.word 0xd207e001  ! 1213: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x8d802000  ! 1214: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02034  ! 1215: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902009  ! 1216: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd257e001  ! 1217: LDSH_I	ldsh	[%r31 + 0x0001], %r9
	.word 0xd29fc020  ! 1218: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xd28008a0  ! 1219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd28804a0  ! 1220: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0x2e800001  ! 1221: BVS	bvs,a	<label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1222: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902470  ! 1223: WRPR_PSTATE_I	wrpr	%r0, 0x0470, %pstate
	.word 0x8d902e99  ! 1224: WRPR_PSTATE_I	wrpr	%r0, 0x0e99, %pstate
	.word 0x8d902a9d  ! 1225: WRPR_PSTATE_I	wrpr	%r0, 0x0a9d, %pstate
	.word 0x8d802000  ! 1226: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1227: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902576  ! 1228: WRPR_PSTATE_I	wrpr	%r0, 0x0576, %pstate
	.word 0xa190200d  ! 1229: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd2dfe030  ! 1230: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r9
	.word 0xa1902009  ! 1231: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d90258c  ! 1232: WRPR_PSTATE_I	wrpr	%r0, 0x058c, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xd21fe001  ! 1234: LDD_I	ldd	[%r31 + 0x0001], %r9
	.word 0xd2d804a0  ! 1235: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0xa190200b  ! 1236: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xab508000  ! 1237: RDPR_TSTATE	rdpr	%tstate, %r21
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1238: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90293e  ! 1239: WRPR_PSTATE_I	wrpr	%r0, 0x093e, %pstate
	.word 0xea47c000  ! 1240: LDSW_R	ldsw	[%r31 + %r0], %r21
	.word 0x8d902549  ! 1241: WRPR_PSTATE_I	wrpr	%r0, 0x0549, %pstate
	.word 0xa1902004  ! 1242: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1243: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xeb27e001  ! 1244: STF_I	st	%f21, [0x0001, %r31]
	.word 0x8790202f  ! 1245: WRPR_TT_I	wrpr	%r0, 0x002f, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x87902107  ! 1247: WRPR_TT_I	wrpr	%r0, 0x0107, %tt
	.word 0x8d9022f8  ! 1248: WRPR_PSTATE_I	wrpr	%r0, 0x02f8, %pstate
	.word 0xeacfe000  ! 1249: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r21
	.word 0x879021f0  ! 1250: WRPR_TT_I	wrpr	%r0, 0x01f0, %tt
splash_cmpr_278:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1826001  ! 1251: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0xea9fc020  ! 1252: LDDA_R	ldda	[%r31, %r0] 0x01, %r21
	.word 0x8790230e  ! 1253: WRPR_TT_I	wrpr	%r0, 0x030e, %tt
	.word 0xea800b40  ! 1254: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r21
DS_279:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc9150007  ! 1: LDQF_R	-	[%r20, %r7], %f4
	.word 0x99a3482d  ! 1255: FADDs	fadds	%f13, %f13, %f12
	.word 0x20800001  ! 1256: BN	bn,a	<label_0x1>
	.word 0x91d02035  ! 1257: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902260  ! 1258: WRPR_TT_I	wrpr	%r0, 0x0260, %tt
tagged_280:
	tsubcctv %r21, 0x1ccb, %r1
	.word 0xd807e001  ! 1259: LDUW_I	lduw	[%r31 + 0x0001], %r12
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1260: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1814010  ! 1261: WR_STICK_REG_R	wr	%r5, %r16, %-
	ta	T_CHANGE_HPRIV	! macro
tagged_282:
	tsubcctv %r13, 0x12de, %r13
	.word 0xd807e001  ! 1263: LDUW_I	lduw	[%r31 + 0x0001], %r12
DS_283:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xb7a0054b  ! 1: FSQRTd	fsqrt	
	.word 0xb7a1083b  ! 1264: FADDs	fadds	%f4, %f27, %f27
	.word 0xf68804a0  ! 1265: LDUBA_R	lduba	[%r0, %r0] 0x25, %r27
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8983001a  ! 1266: WRTICK_R	wr	%r12, %r26, %tick
	.word 0x8d9022fa  ! 1267: WRPR_PSTATE_I	wrpr	%r0, 0x02fa, %pstate
	.word 0xf717c000  ! 1268: LDQF_R	-	[%r31, %r0], %f27
splash_tba_285:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1269: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf65fc000  ! 1270: LDX_R	ldx	[%r31 + %r0], %r27
tagged_286:
	tsubcctv %r1, 0x152e, %r11
	.word 0xf607e001  ! 1271: LDUW_I	lduw	[%r31 + 0x0001], %r27
	.word 0xf6c7e030  ! 1272: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r27
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf65fc000  ! 1273: LDX_R	ldx	[%r31 + %r0], %r27
	.word 0x87802014  ! 1274: WRASI_I	wr	%r0, 0x0014, %asi
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1275: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902655  ! 1276: WRPR_PSTATE_I	wrpr	%r0, 0x0655, %pstate
	.word 0x81540000  ! 1277: RDPR_GL	rdpr	%-, %r0
	.word 0x93902002  ! 1278: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc08008a0  ! 1280: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc01fe001  ! 1281: LDD_I	ldd	[%r31 + 0x0001], %r0
	.word 0xc08008a0  ! 1282: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc08008a0  ! 1283: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
DS_287:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1284: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8790206b  ! 1285: WRPR_TT_I	wrpr	%r0, 0x006b, %tt
	.word 0x8d9026a7  ! 1286: WRPR_PSTATE_I	wrpr	%r0, 0x06a7, %pstate
tagged_288:
	tsubcctv %r19, 0x1ec1, %r18
	.word 0xc007e001  ! 1287: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x87802080  ! 1288: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x879021d9  ! 1289: WRPR_TT_I	wrpr	%r0, 0x01d9, %tt
DS_289:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f22, %f20, %f14
	.word 0x91b44300  ! 1290: ALIGNADDRESS	alignaddr	%r17, %r0, %r8
tagged_290:
	tsubcctv %r23, 0x1fd2, %r16
	.word 0xd007e001  ! 1291: LDUW_I	lduw	[%r31 + 0x0001], %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 1292: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd0800c80  ! 1293: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
	.word 0xd0d00e60  ! 1294: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r8
	.word 0xd05fe001  ! 1295: LDX_I	ldx	[%r31 + 0x0001], %r8
	.word 0x87802016  ! 1296: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa1902006  ! 1297: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87902289  ! 1298: WRPR_TT_I	wrpr	%r0, 0x0289, %tt
change_to_randtl_291:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1299: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xd097e030  ! 1300: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r8
	.word 0x8198201c  ! 1301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001c, %hpstate
	ta	T_CHANGE_PRIV	! macro
DS_292:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1303: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd017c000  ! 1304: LDUH_R	lduh	[%r31 + %r0], %r8
change_to_randtl_293:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1305: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x91d020b4  ! 1306: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd08804a0  ! 1307: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
splash_cmpr_294:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186a001  ! 1308: WR_STICK_REG_I	wr	%r26, 0x0001, %-
	.word 0x26800001  ! 1309: BL	bl,a	<label_0x1>
	.word 0xd0d7e020  ! 1310: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r8
	.word 0x3e800001  ! 1311: BVC	bvc,a	<label_0x1>
splash_tba_295:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1312: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902712  ! 1313: WRPR_PSTATE_I	wrpr	%r0, 0x0712, %pstate
	.word 0x83500000  ! 1314: RDPR_TPC	rdpr	%tpc, %r1
splash_tba_296:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1315: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc2800a80  ! 1316: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r1
splash_lsu_297:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1317: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc257c000  ! 1318: LDSH_R	ldsh	[%r31 + %r0], %r1
splash_lsu_298:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc28008a0  ! 1320: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc28008a0  ! 1321: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
splash_tba_299:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1322: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 1323: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xc28008a0  ! 1324: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x81460000  ! 1325: RD_STICK_REG	stbar
	.word 0xc337c000  ! 1326: STQF_R	-	%f1, [%r0, %r31]
	.word 0xc2800ac0  ! 1327: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r1
DS_300:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	allclean
	.word 0x81b5c31b  ! 1328: ALIGNADDRESS	alignaddr	%r23, %r27, %r0
tagged_301:
	taddcctv %r2, 0x1bd4, %r26
	.word 0xc007e001  ! 1329: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x879022b9  ! 1330: WRPR_TT_I	wrpr	%r0, 0x02b9, %tt
	.word 0xa190200d  ! 1331: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_tba_302:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1332: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc09fe001  ! 1333: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9692001  ! 1334: SDIVX_I	sdivx	%r4, 0x0001, %r20
tagged_304:
	tsubcctv %r16, 0x1d1d, %r5
	.word 0xe807e001  ! 1335: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x87802063  ! 1336: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xe8c7e000  ! 1337: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r20
	.word 0xe88008a0  ! 1338: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1339: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90233f  ! 1340: WRPR_PSTATE_I	wrpr	%r0, 0x033f, %pstate
	.word 0xe88008a0  ! 1341: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x93d020b2  ! 1342: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x8d90269d  ! 1343: WRPR_PSTATE_I	wrpr	%r0, 0x069d, %pstate
DS_305:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1344: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d020b5  ! 1345: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x87802016  ! 1346: WRASI_I	wr	%r0, 0x0016, %asi
splash_lsu_306:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1347: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_307:
	taddcctv %r20, 0x12b1, %r16
	.word 0xe807e001  ! 1348: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x91d02032  ! 1349: Tcc_I	ta	icc_or_xcc, %r0 + 50
tagged_308:
	tsubcctv %r17, 0x1baa, %r25
	.word 0xe807e001  ! 1350: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x8d902be3  ! 1351: WRPR_PSTATE_I	wrpr	%r0, 0x0be3, %pstate
tagged_309:
	taddcctv %r7, 0x12a1, %r10
	.word 0xe807e001  ! 1352: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xa1902000  ! 1353: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x2c700001  ! 1354: BPNEG	<illegal instruction>
tagged_310:
	tsubcctv %r17, 0x1d2c, %r25
	.word 0xe807e001  ! 1355: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xe847e001  ! 1356: LDSW_I	ldsw	[%r31 + 0x0001], %r20
DS_311:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f0, %f2, %f6
	.word 0x83b60304  ! 1357: ALIGNADDRESS	alignaddr	%r24, %r4, %r1
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1358: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 1359: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x816ae001  ! 1360: SDIVX_I	sdivx	%r11, 0x0001, %r0
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc05fc000  ! 1361: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0x87902183  ! 1362: WRPR_TT_I	wrpr	%r0, 0x0183, %tt
	.word 0x93d02032  ! 1363: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xc05fe001  ! 1364: LDX_I	ldx	[%r31 + 0x0001], %r0
	.word 0xa190200f  ! 1365: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902004  ! 1367: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xc0dfe030  ! 1368: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r0
	.word 0xc05fe001  ! 1369: LDX_I	ldx	[%r31 + 0x0001], %r0
	.word 0xc08008a0  ! 1370: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc0bfe001  ! 1371: STDA_I	stda	%r0, [%r31 + 0x0001] %asi
tagged_313:
	taddcctv %r1, 0x1018, %r6
	.word 0xc007e001  ! 1372: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xc0c7e020  ! 1373: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r0
	.word 0xc0cfe000  ! 1374: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r0
splash_lsu_314:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1375: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 1377: SIR	sir	0x0001
	.word 0x87802016  ! 1378: WRASI_I	wr	%r0, 0x0016, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 1379: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0x87802016  ! 1380: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x3e800001  ! 1381: BVC	bvc,a	<label_0x1>
	.word 0x8d802000  ! 1382: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90280e  ! 1383: WRPR_PSTATE_I	wrpr	%r0, 0x080e, %pstate
	.word 0xc197e001  ! 1384: LDQFA_I	-	[%r31, 0x0001], %f0
	.word 0x8d802000  ! 1385: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f802001  ! 1386: SIR	sir	0x0001
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1387: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x26800001  ! 1388: BL	bl,a	<label_0x1>
	.word 0x8d90244c  ! 1389: WRPR_PSTATE_I	wrpr	%r0, 0x044c, %pstate
	.word 0x8f508000  ! 1390: RDPR_TSTATE	rdpr	%tstate, %r7
splash_lsu_315:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1391: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 1392: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xcec00e40  ! 1393: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r7
	.word 0xcedfe000  ! 1394: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	.word 0xce1fc000  ! 1395: LDD_R	ldd	[%r31 + %r0], %r7
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 1396: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1397: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_316:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1398: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 1399: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0xa190200a  ! 1400: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_tba_317:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1401: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce900e40  ! 1402: LDUHA_R	lduha	[%r0, %r0] 0x72, %r7
	.word 0x8d902edc  ! 1403: WRPR_PSTATE_I	wrpr	%r0, 0x0edc, %pstate
	.word 0x8d902b24  ! 1404: WRPR_PSTATE_I	wrpr	%r0, 0x0b24, %pstate
	.word 0x87902192  ! 1405: WRPR_TT_I	wrpr	%r0, 0x0192, %tt
	.word 0xa9540000  ! 1406: RDPR_GL	rdpr	%-, %r20
splash_lsu_318:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1407: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_319:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1408: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x30800001  ! 1409: BA	ba,a	<label_0x1>
	.word 0xe81fc000  ! 1410: LDD_R	ldd	[%r31 + %r0], %r20
splash_lsu_320:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1411: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe8c7e000  ! 1412: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r20
	.word 0x8780201c  ! 1413: WRASI_I	wr	%r0, 0x001c, %asi
DS_321:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1414: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802089  ! 1415: WRASI_I	wr	%r0, 0x0089, %asi
splash_tba_322:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1416: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 1417: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0xe89004a0  ! 1418: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
DS_323:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f20, %f26, %f4
	.word 0x93b24308  ! 1419: ALIGNADDRESS	alignaddr	%r9, %r8, %r9
	.word 0x8d9021d5  ! 1420: WRPR_PSTATE_I	wrpr	%r0, 0x01d5, %pstate
	.word 0xd21fe001  ! 1421: LDD_I	ldd	[%r31 + 0x0001], %r9
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1422: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 1423: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x2c700001  ! 1424: BPNEG	<illegal instruction>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1425: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd207c000  ! 1426: LDUW_R	lduw	[%r31 + %r0], %r9
splash_tba_324:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1427: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902003  ! 1428: WRPR_TT_I	wrpr	%r0, 0x0003, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd25fc000  ! 1429: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x93902007  ! 1430: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d9023dc  ! 1431: WRPR_PSTATE_I	wrpr	%r0, 0x03dc, %pstate
splash_lsu_325:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1432: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902000  ! 1433: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x87802020  ! 1434: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xd337c008  ! 1435: STQF_R	-	%f9, [%r8, %r31]
	.word 0x91d02032  ! 1436: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd2800ba0  ! 1437: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r9
splash_lsu_326:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1438: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd297e020  ! 1439: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
	.word 0x8b540000  ! 1440: RDPR_GL	rdpr	%-, %r5
	.word 0xcacfe020  ! 1441: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r5
	.word 0xcac7e010  ! 1442: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
change_to_randtl_327:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1443: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa9494000  ! 1444: RDHPR_HTBA	rdhpr	%htba, %r20
DS_328:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f18, %f0, %f26
	.word 0x93b04302  ! 1445: ALIGNADDRESS	alignaddr	%r1, %r2, %r9
	.word 0xd2dfe020  ! 1446: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r9
	.word 0xd2bfc022  ! 1447: STDA_R	stda	%r9, [%r31 + %r2] 0x01
	.word 0x91d02034  ! 1448: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x32700001  ! 1449: BPNE	<illegal instruction>
DS_329:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd135e001  ! 1: STQF_I	-	%f8, [0x0001, %r23]
	normalw
	.word 0xab458000  ! 1450: RD_SOFTINT_REG	rd	%softint, %r21
	.word 0xb4d0e001  ! 1451: UMULcc_I	umulcc 	%r3, 0x0001, %r26
splash_tba_330:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1452: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02033  ! 1453: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_htba_331:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1454: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02032  ! 1455: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xf4c80e80  ! 1456: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r26
	.word 0x8d90237d  ! 1457: WRPR_PSTATE_I	wrpr	%r0, 0x037d, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xf4c004a0  ! 1459: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r26
	.word 0x83d020b5  ! 1460: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xa1902002  ! 1461: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x87902369  ! 1462: WRPR_TT_I	wrpr	%r0, 0x0369, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf45fc000  ! 1463: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0xf597e001  ! 1464: LDQFA_I	-	[%r31, 0x0001], %f26
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf45fc000  ! 1465: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0x93902001  ! 1466: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81a18d27  ! 1467: FsMULd	fsmuld	%f6, %f38, %f0
splash_cmpr_332:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1852001  ! 1468: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	.word 0x93902000  ! 1469: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_333:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1470: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_334:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1471: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902004  ! 1472: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x99902004  ! 1473: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc05fc000  ! 1474: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0x95540000  ! 1475: RDPR_GL	rdpr	%-, %r10
splash_lsu_335:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1476: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902003  ! 1477: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd4800ba0  ! 1478: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r10
	.word 0x8790237a  ! 1479: WRPR_TT_I	wrpr	%r0, 0x037a, %tt
	.word 0x93902002  ! 1480: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1481: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 1482: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_336:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1483: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 1484: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
tagged_337:
	taddcctv %r26, 0x118f, %r9
	.word 0xd407e001  ! 1485: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x87802088  ! 1486: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd40fe001  ! 1487: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0x93902002  ! 1488: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd48fe010  ! 1489: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0xa190200d  ! 1490: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902004  ! 1491: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_tba_338:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1492: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_339:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xafa00552  ! 1: FSQRTd	fsqrt	
	.word 0x93a0c825  ! 1493: FADDs	fadds	%f3, %f5, %f9
	.word 0x97540000  ! 1494: RDPR_GL	rdpr	%-, %r11
splash_lsu_340:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1495: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 1496: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x9f802001  ! 1497: SIR	sir	0x0001
	.word 0x87802004  ! 1498: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802014  ! 1499: WRASI_I	wr	%r0, 0x0014, %asi
splash_tba_341:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1500: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd61fc000  ! 1501: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd60fc000  ! 1502: LDUB_R	ldub	[%r31 + %r0], %r11
splash_lsu_342:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1503: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xaf50c000  ! 1504: RDPR_TT	rdpr	%tt, %r23
	.word 0xee4fc000  ! 1505: LDSB_R	ldsb	[%r31 + %r0], %r23
	.word 0x87802004  ! 1506: WRASI_I	wr	%r0, 0x0004, %asi
tagged_343:
	taddcctv %r8, 0x1891, %r9
	.word 0xee07e001  ! 1507: LDUW_I	lduw	[%r31 + 0x0001], %r23
	.word 0x2c800001  ! 1508: BNEG	bneg,a	<label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1509: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1510: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 1511: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 1512: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xee1fc000  ! 1513: LDD_R	ldd	[%r31 + %r0], %r23
DS_344:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1514: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x87802010  ! 1515: WRASI_I	wr	%r0, 0x0010, %asi
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 1516: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xee17c000  ! 1517: LDUH_R	lduh	[%r31 + %r0], %r23
	.word 0xa190200d  ! 1518: WRPR_GL_I	wrpr	%r0, 0x000d, %-
tagged_345:
	taddcctv %r3, 0x1ac0, %r15
	.word 0xee07e001  ! 1519: LDUW_I	lduw	[%r31 + 0x0001], %r23
	ta	T_CHANGE_PRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xee5fc000  ! 1521: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0x8da34dc8  ! 1522: FdMULq	fdmulq	
	.word 0x91d02034  ! 1523: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_346:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1524: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_347:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1525: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 1526: SIR	sir	0x0001
	.word 0x879021e4  ! 1527: WRPR_TT_I	wrpr	%r0, 0x01e4, %tt
	.word 0xcc800c40  ! 1528: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r6
splash_tba_348:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1529: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1530: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_349:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1531: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 1532: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xcc07c000  ! 1533: LDUW_R	lduw	[%r31 + %r0], %r6
	.word 0x81982217  ! 1534: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0217, %hpstate
splash_tba_350:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1535: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902003  ! 1536: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 1537: LDX_R	ldx	[%r31 + %r0], %r6
DS_351:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1538: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1539: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
splash_tba_352:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1541: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_353:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1542: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 1543: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8985c012  ! 1544: WRTICK_R	wr	%r23, %r18, %tick
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 1545: LDX_R	ldx	[%r31 + %r0], %r6
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 1546: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc1fc000  ! 1547: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x99902003  ! 1548: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x91d02032  ! 1549: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8151c000  ! 1550: RDPR_TL	rdpr	%tl, %r0
	.word 0x8d902d4f  ! 1551: WRPR_PSTATE_I	wrpr	%r0, 0x0d4f, %pstate
	.word 0x8d802000  ! 1552: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x80ac4005  ! 1553: ANDNcc_R	andncc 	%r17, %r5, %r0
	.word 0xc117c000  ! 1554: LDQF_R	-	[%r31, %r0], %f0
	.word 0xc01fe001  ! 1555: LDD_I	ldd	[%r31 + 0x0001], %r0
	.word 0x8d9026d3  ! 1556: WRPR_PSTATE_I	wrpr	%r0, 0x06d3, %pstate
	.word 0xc09fe001  ! 1557: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
	.word 0xa190200b  ! 1558: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xc08008a0  ! 1559: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xa1902008  ! 1560: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d902d4c  ! 1561: WRPR_PSTATE_I	wrpr	%r0, 0x0d4c, %pstate
splash_htba_355:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1562: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9f802001  ! 1563: SIR	sir	0x0001
	.word 0x8790228a  ! 1564: WRPR_TT_I	wrpr	%r0, 0x028a, %tt
	.word 0x879020a3  ! 1565: WRPR_TT_I	wrpr	%r0, 0x00a3, %tt
splash_tba_356:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1566: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc08008a0  ! 1567: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc017c000  ! 1568: LDUH_R	lduh	[%r31 + %r0], %r0
splash_cmpr_357:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186a001  ! 1569: WR_STICK_REG_I	wr	%r26, 0x0001, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1570: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc007c000  ! 1571: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0xc08008a0  ! 1572: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x879021ce  ! 1573: WRPR_TT_I	wrpr	%r0, 0x01ce, %tt
tagged_358:
	tsubcctv %r19, 0x12ff, %r21
	.word 0xc007e001  ! 1574: LDUW_I	lduw	[%r31 + 0x0001], %r0
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1575: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_359:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f2, %f16, %f2
	.word 0xabb10311  ! 1576: ALIGNADDRESS	alignaddr	%r4, %r17, %r21
	.word 0xea8008a0  ! 1577: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0xea1fe001  ! 1578: LDD_I	ldd	[%r31 + 0x0001], %r21
tagged_360:
	tsubcctv %r9, 0x15f4, %r7
	.word 0xea07e001  ! 1579: LDUW_I	lduw	[%r31 + 0x0001], %r21
splash_tba_361:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1580: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_htba_362:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1581: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902e49  ! 1582: WRPR_PSTATE_I	wrpr	%r0, 0x0e49, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 1583: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0x9b514000  ! 1584: RDPR_TBA	rdpr	%tba, %r13
	.word 0x20800001  ! 1585: BN	bn,a	<label_0x1>
	.word 0xa1902005  ! 1586: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_tba_363:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1587: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1588: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xda5fc000  ! 1589: LDX_R	ldx	[%r31 + %r0], %r13
DS_364:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1590: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d802000  ! 1591: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_htba_365:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1592: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xda8008a0  ! 1593: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x879023b8  ! 1594: WRPR_TT_I	wrpr	%r0, 0x03b8, %tt
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1595: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1596: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902593  ! 1597: WRPR_PSTATE_I	wrpr	%r0, 0x0593, %pstate
	.word 0x8d902236  ! 1598: WRPR_PSTATE_I	wrpr	%r0, 0x0236, %pstate
	.word 0x93902000  ! 1599: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xda57c000  ! 1600: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0xda0fe001  ! 1601: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0xda1fe001  ! 1602: LDD_I	ldd	[%r31 + 0x0001], %r13
	.word 0x91d02034  ! 1603: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902473  ! 1604: WRPR_PSTATE_I	wrpr	%r0, 0x0473, %pstate
	.word 0xa1902003  ! 1605: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_cmpr_366:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1842001  ! 1606: WR_STICK_REG_I	wr	%r16, 0x0001, %-
tagged_367:
	taddcctv %r17, 0x1084, %r23
	.word 0xda07e001  ! 1607: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda880e40  ! 1608: LDUBA_R	lduba	[%r0, %r0] 0x72, %r13
splash_lsu_368:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1609: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 1610: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xda57c000  ! 1611: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x8d90248b  ! 1612: WRPR_PSTATE_I	wrpr	%r0, 0x048b, %pstate
splash_lsu_369:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1613: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1614: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x81982a16  ! 1615: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a16, %hpstate
	.word 0xda77e001  ! 1616: STX_I	stx	%r13, [%r31 + 0x0001]
	.word 0x3c700001  ! 1617: BPPOS	<illegal instruction>
	.word 0xa190200d  ! 1618: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xda17c000  ! 1619: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0x87802010  ! 1620: WRASI_I	wr	%r0, 0x0010, %asi
tagged_370:
	tsubcctv %r26, 0x1e37, %r17
	.word 0xda07e001  ! 1621: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x87802088  ! 1622: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xda07c000  ! 1623: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0xda800b20  ! 1624: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r13
splash_cmpr_371:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1862001  ! 1625: WR_STICK_REG_I	wr	%r24, 0x0001, %-
splash_lsu_372:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1626: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9022c1  ! 1627: WRPR_PSTATE_I	wrpr	%r0, 0x02c1, %pstate
splash_htba_373:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1628: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xda47c000  ! 1629: LDSW_R	ldsw	[%r31 + %r0], %r13
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1630: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 1631: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_htba_374:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1632: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902000  ! 1633: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87902375  ! 1634: WRPR_TT_I	wrpr	%r0, 0x0375, %tt
	.word 0x8750c000  ! 1635: RDPR_TT	rdpr	%tt, %r3
splash_tba_375:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1636: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879021f7  ! 1637: WRPR_TT_I	wrpr	%r0, 0x01f7, %tt
splash_lsu_376:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1638: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1639: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 1640: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902a3c  ! 1641: WRPR_PSTATE_I	wrpr	%r0, 0x0a3c, %pstate
	.word 0x8d9028ac  ! 1642: WRPR_PSTATE_I	wrpr	%r0, 0x08ac, %pstate
	.word 0xc68008a0  ! 1643: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
splash_lsu_377:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1644: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_378:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1645: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc64fe001  ! 1646: LDSB_I	ldsb	[%r31 + 0x0001], %r3
DS_379:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc932c012  ! 1: STQF_R	-	%f4, [%r18, %r11]
	normalw
	.word 0x99458000  ! 1647: RD_SOFTINT_REG	rd	%softint, %r12
change_to_randtl_380:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1648: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_381:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1649: SAVE_R	save	%r31, %r0, %r31
tagged_382:
	tsubcctv %r17, 0x1e0a, %r21
	.word 0xd807e001  ! 1650: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x81982d4f  ! 1651: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4f, %hpstate
	.word 0xd997e001  ! 1652: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0x91d02033  ! 1653: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902d71  ! 1654: WRPR_PSTATE_I	wrpr	%r0, 0x0d71, %pstate
	.word 0x8d802004  ! 1655: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa190200f  ! 1656: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x99514000  ! 1657: RDPR_TBA	rdpr	%tba, %r12
	.word 0xd89fe001  ! 1658: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0xd8800ba0  ! 1659: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r12
	.word 0xd8c004a0  ! 1660: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0x8d802000  ! 1661: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x24800001  ! 1662: BLE	ble,a	<label_0x1>
splash_htba_383:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1663: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02033  ! 1664: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x879020ae  ! 1665: WRPR_TT_I	wrpr	%r0, 0x00ae, %tt
	.word 0x87480000  ! 1666: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0x8d90210e  ! 1667: WRPR_PSTATE_I	wrpr	%r0, 0x010e, %pstate
	.word 0x8d802000  ! 1668: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_384:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1669: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa190200f  ! 1670: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xc64fc000  ! 1671: LDSB_R	ldsb	[%r31 + %r0], %r3
	.word 0xc69fc020  ! 1672: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0x87802058  ! 1673: WRASI_I	wr	%r0, 0x0058, %asi
splash_htba_385:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1674: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc60fc000  ! 1675: LDUB_R	ldub	[%r31 + %r0], %r3
	.word 0x83d02034  ! 1676: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87802010  ! 1677: WRASI_I	wr	%r0, 0x0010, %asi
splash_tba_386:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1678: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_387:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc134c00b  ! 1: STQF_R	-	%f0, [%r11, %r19]
	normalw
	.word 0xb1458000  ! 1679: RD_SOFTINT_REG	rd	%softint, %r24
change_to_randtl_388:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1680: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902007  ! 1681: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_389:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1682: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 1683: SIR	sir	0x0001
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1684: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf097e030  ! 1685: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r24
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf05fc000  ! 1686: LDX_R	ldx	[%r31 + %r0], %r24
tagged_390:
	tsubcctv %r24, 0x1654, %r5
	.word 0xf007e001  ! 1687: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0x81982ece  ! 1688: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ece, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf05fc000  ! 1689: LDX_R	ldx	[%r31 + %r0], %r24
	.word 0x99902005  ! 1690: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
DS_391:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xc7160017  ! 1: LDQF_R	-	[%r24, %r23], %f3
	.word 0xb7a4082d  ! 1691: FADDs	fadds	%f16, %f13, %f27
	.word 0xf61fe001  ! 1692: LDD_I	ldd	[%r31 + 0x0001], %r27
	.word 0xf6cfe020  ! 1693: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r27
DS_392:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1694: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93508000  ! 1695: RDPR_TSTATE	rdpr	%tstate, %r9
	.word 0x91d020b5  ! 1696: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd21fe001  ! 1697: LDD_I	ldd	[%r31 + 0x0001], %r9
	.word 0x3e800001  ! 1698: BVC	bvc,a	<label_0x1>
	.word 0xd29fe001  ! 1699: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
	.word 0x8d802004  ! 1700: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91d02032  ! 1701: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x83504000  ! 1702: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xaba01963  ! 1703: FqTOd	dis not found

DS_394:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1704: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
	.word 0xead7e030  ! 1706: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r21
DS_395:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xb1a00552  ! 1: FSQRTd	fsqrt	
	.word 0x95a50822  ! 1707: FADDs	fadds	%f20, %f2, %f10
	.word 0x8780201c  ! 1708: WRASI_I	wr	%r0, 0x001c, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1709: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4c004a0  ! 1710: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
splash_tba_396:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1711: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200b  ! 1713: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93902006  ! 1714: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd4c804a0  ! 1715: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0xd44fe001  ! 1716: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0x8d902073  ! 1717: WRPR_PSTATE_I	wrpr	%r0, 0x0073, %pstate
	.word 0xd49004a0  ! 1718: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
splash_lsu_397:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1719: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 1720: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd4800c80  ! 1721: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r10
	.word 0x2c700001  ! 1722: BPNEG	<illegal instruction>
	.word 0xb5508000  ! 1723: RDPR_TSTATE	rdpr	%tstate, %r26
tagged_398:
	tsubcctv %r8, 0x14f4, %r7
	.word 0xf407e001  ! 1724: LDUW_I	lduw	[%r31 + 0x0001], %r26
splash_tba_399:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1725: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902007  ! 1726: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81982f0c  ! 1727: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0c, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf45fc000  ! 1728: LDX_R	ldx	[%r31 + %r0], %r26
splash_htba_400:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1729: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf45fc000  ! 1730: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0x91d020b3  ! 1731: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8d9029e8  ! 1732: WRPR_PSTATE_I	wrpr	%r0, 0x09e8, %pstate
	.word 0xf497e000  ! 1733: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r26
	.word 0xf48fe010  ! 1734: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r26
	.word 0xf4dfe030  ! 1735: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r26
	.word 0xf4c804a0  ! 1736: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r26
DS_401:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f28, %f30, %f2
	.word 0xa7b20301  ! 1737: ALIGNADDRESS	alignaddr	%r8, %r1, %r19
	.word 0x91d02032  ! 1738: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe61fc000  ! 1739: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x93d02033  ! 1740: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_lsu_402:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1741: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 1742: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x93902007  ! 1743: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902005  ! 1744: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982d8c  ! 1745: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8c, %hpstate
	.word 0xa1902004  ! 1746: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x95464000  ! 1747: RD_STICK_CMPR_REG	rd	%-, %r10
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1748: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd48008a0  ! 1749: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
tagged_403:
	taddcctv %r14, 0x175f, %r10
	.word 0xd407e001  ! 1750: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x2c800001  ! 1751: BNEG	bneg,a	<label_0x1>
	.word 0xd49004a0  ! 1752: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	.word 0x87802080  ! 1753: WRASI_I	wr	%r0, 0x0080, %asi
DS_404:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1754: SAVE_R	save	%r31, %r0, %r31
	.word 0xd49fe001  ! 1755: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0xd41fc000  ! 1756: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xd4800c40  ! 1757: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r10
	.word 0x99540000  ! 1758: RDPR_GL	rdpr	%-, %r12
	.word 0xd8c7e030  ! 1759: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r12
	.word 0x91d02035  ! 1760: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd8800bc0  ! 1761: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r12
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1762: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_405:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1763: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd8c00e80  ! 1764: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r12
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1765: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879023f2  ! 1766: WRPR_TT_I	wrpr	%r0, 0x03f2, %tt
	.word 0x93902003  ! 1767: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_406:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1768: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 1769: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd81fc000  ! 1770: LDD_R	ldd	[%r31 + %r0], %r12
	.word 0x93902007  ! 1771: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1772: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 1773: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81460000  ! 1774: RD_STICK_REG	stbar
	.word 0xd88fe010  ! 1775: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r12
	.word 0xd89fe001  ! 1776: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 1778: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_407:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 1779: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 1780: LDX_R	ldx	[%r31 + %r0], %r12
splash_lsu_408:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1781: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 1782: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d90241b  ! 1783: WRPR_PSTATE_I	wrpr	%r0, 0x041b, %pstate
	.word 0x83d02032  ! 1784: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x87802004  ! 1785: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802080  ! 1786: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd817e001  ! 1787: LDUH_I	lduh	[%r31 + 0x0001], %r12
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1788: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902002  ! 1790: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
DS_409:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1791: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_410:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1792: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200d  ! 1793: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902000  ! 1794: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_411:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xb1a00548  ! 1: FSQRTd	fsqrt	
	.word 0x85a34830  ! 1795: FADDs	fadds	%f13, %f16, %f2
DS_412:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1796: SAVE_R	save	%r31, %r0, %r31
	.word 0xc49fe001  ! 1797: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1798: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 1799: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_413:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1800: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc517c000  ! 1801: LDQF_R	-	[%r31, %r0], %f2
	.word 0xc4c7e010  ! 1802: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0x28800001  ! 1803: BLEU	bleu,a	<label_0x1>
	.word 0xc4d00e60  ! 1804: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r2
splash_lsu_414:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1805: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x85514000  ! 1806: RDPR_TBA	rdpr	%tba, %r2
	.word 0x8d902b14  ! 1807: WRPR_PSTATE_I	wrpr	%r0, 0x0b14, %pstate
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1808: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902149  ! 1809: WRPR_TT_I	wrpr	%r0, 0x0149, %tt
	.word 0xc41fe001  ! 1810: LDD_I	ldd	[%r31 + 0x0001], %r2
	.word 0x93902001  ! 1811: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc4c804a0  ! 1812: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1813: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x32800001  ! 1814: BNE	bne,a	<label_0x1>
	.word 0x879021cf  ! 1815: WRPR_TT_I	wrpr	%r0, 0x01cf, %tt
	.word 0x2e800001  ! 1816: BVS	bvs,a	<label_0x1>
	.word 0x93902000  ! 1817: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1818: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x879022a9  ! 1819: WRPR_TT_I	wrpr	%r0, 0x02a9, %tt
tagged_415:
	taddcctv %r3, 0x14e7, %r12
	.word 0xc407e001  ! 1820: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_416:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1821: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xc48008a0  ! 1822: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc41fc000  ! 1823: LDD_R	ldd	[%r31 + %r0], %r2
	.word 0x30700001  ! 1824: BPA	<illegal instruction>
splash_lsu_417:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1825: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc417e001  ! 1826: LDUH_I	lduh	[%r31 + 0x0001], %r2
	.word 0xc4dfe030  ! 1827: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r2
	.word 0x93902002  ! 1828: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc497e000  ! 1829: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r2
	.word 0x87802014  ! 1830: WRASI_I	wr	%r0, 0x0014, %asi
splash_tba_418:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1831: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_419:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1832: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xc457e001  ! 1833: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0x87802055  ! 1834: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xc4d804a0  ! 1835: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0x89480000  ! 1836: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
DS_420:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xe96ff6a7	! Random illegal ?
	.word 0x87a00542  ! 1: FSQRTd	fsqrt	
	.word 0x99a10823  ! 1837: FADDs	fadds	%f4, %f3, %f12
splash_cmpr_421:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1852001  ! 1838: WR_STICK_REG_I	wr	%r20, 0x0001, %-
DS_422:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f28, %f10, %f26
	.word 0x89b18311  ! 1839: ALIGNADDRESS	alignaddr	%r6, %r17, %r4
	.word 0x87802058  ! 1840: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xc8cfe020  ! 1841: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r4
	.word 0x93902001  ! 1842: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x24700001  ! 1843: BPLE	<illegal instruction>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 1844: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0xc88fe030  ! 1845: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r4
tagged_423:
	taddcctv %r11, 0x1892, %r17
	.word 0xc807e001  ! 1846: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc997e001  ! 1847: LDQFA_I	-	[%r31, 0x0001], %f4
	.word 0xc89004a0  ! 1848: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
DS_424:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1849: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x93902001  ! 1850: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9f802001  ! 1851: SIR	sir	0x0001
	.word 0x93902003  ! 1852: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc8c7e010  ! 1853: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r4
	.word 0xa1902005  ! 1854: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xc88008a0  ! 1855: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc89fe001  ! 1856: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	.word 0xc8d80e40  ! 1857: LDXA_R	ldxa	[%r0, %r0] 0x72, %r4
	.word 0xc84fe001  ! 1858: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0x91d02034  ! 1859: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_HPRIV	! macro
DS_425:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	pdist %f30, %f8, %f8
	.word 0x8db20307  ! 1861: ALIGNADDRESS	alignaddr	%r8, %r7, %r6
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 1862: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 1863: WRPR_GL_I	wrpr	%r0, 0x000e, %-
tagged_426:
	tsubcctv %r5, 0x1c2e, %r1
	.word 0xcc07e001  ! 1864: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc0fe001  ! 1865: LDUB_I	ldub	[%r31 + 0x0001], %r6
	.word 0x9f802001  ! 1866: SIR	sir	0x0001
	.word 0x93902001  ! 1867: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_427:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f20, %f16, %f16
	.word 0xb3b14306  ! 1868: ALIGNADDRESS	alignaddr	%r5, %r6, %r25
splash_htba_428:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1869: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x85464000  ! 1870: RD_STICK_CMPR_REG	rd	%-, %r2
	.word 0x81460000  ! 1871: RD_STICK_REG	stbar
tagged_429:
	taddcctv %r26, 0x1113, %r17
	.word 0xc407e001  ! 1872: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x93902006  ! 1873: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa551c000  ! 1874: RDPR_TL	rdpr	%tl, %r18
splash_lsu_430:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1875: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe447c000  ! 1876: LDSW_R	ldsw	[%r31 + %r0], %r18
	.word 0x8790220b  ! 1877: WRPR_TT_I	wrpr	%r0, 0x020b, %tt
	.word 0x87802014  ! 1878: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa550c000  ! 1879: RDPR_TT	rdpr	%tt, %r18
	.word 0xe4d804a0  ! 1880: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0xa1902008  ! 1881: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x91d02035  ! 1882: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02035  ! 1883: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe45fc000  ! 1884: LDX_R	ldx	[%r31 + %r0], %r18
splash_tba_431:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1885: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe45fc000  ! 1886: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4dfe000  ! 1887: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r18
	.word 0x91d02032  ! 1888: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902a2c  ! 1889: WRPR_PSTATE_I	wrpr	%r0, 0x0a2c, %pstate
	.word 0xe4c7e010  ! 1890: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0xe48008a0  ! 1891: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	ta	T_CHANGE_HPRIV	! macro
DS_432:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xd94e77dc	! Random illegal ?
	.word 0x97a00540  ! 1: FSQRTd	fsqrt	
	.word 0x87a1c83a  ! 1893: FADDs	fadds	%f7, %f26, %f3
tagged_433:
	taddcctv %r11, 0x1854, %r18
	.word 0xc607e001  ! 1894: LDUW_I	lduw	[%r31 + 0x0001], %r3
tagged_434:
	tsubcctv %r15, 0x1466, %r15
	.word 0xc607e001  ! 1895: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x34700001  ! 1896: BPG	<illegal instruction>
tagged_435:
	taddcctv %r26, 0x18fe, %r17
	.word 0xc607e001  ! 1897: LDUW_I	lduw	[%r31 + 0x0001], %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 1898: LDX_R	ldx	[%r31 + %r0], %r3
DS_436:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x817027dc	! Random illegal ?
	.word 0xf115400d  ! 1: LDQF_R	-	[%r21, %r13], %f24
	.word 0x8da34835  ! 1899: FADDs	fadds	%f13, %f21, %f6
tagged_437:
	taddcctv %r24, 0x1c66, %r25
	.word 0xcc07e001  ! 1900: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x91d020b3  ! 1901: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x93902004  ! 1902: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_htba_438:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1903: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xccd80e60  ! 1904: LDXA_R	ldxa	[%r0, %r0] 0x73, %r6
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 1905: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xa190200f  ! 1906: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_439:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1907: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902a5c  ! 1908: WRPR_PSTATE_I	wrpr	%r0, 0x0a5c, %pstate
	.word 0x87802016  ! 1909: WRASI_I	wr	%r0, 0x0016, %asi
DS_440:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd531c00a  ! 1: STQF_R	-	%f10, [%r10, %r7]
	normalw
	.word 0xb7458000  ! 1910: RD_SOFTINT_REG	rd	%softint, %r27
	.word 0x93902001  ! 1911: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xf6cfe030  ! 1913: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r27
	.word 0x9b514000  ! 1914: RDPR_TBA	rdpr	%tba, %r13
splash_lsu_441:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1915: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8151c000  ! 1916: RDPR_TL	rdpr	%tl, %r0
	.word 0xc00fc000  ! 1917: LDUB_R	ldub	[%r31 + %r0], %r0
	.word 0x22700001  ! 1918: BPE	<illegal instruction>
splash_lsu_442:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1919: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_443:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xf1318002  ! 1: STQF_R	-	%f24, [%r2, %r6]
	normalw
	.word 0xab458000  ! 1920: RD_SOFTINT_REG	rd	%softint, %r21
	.word 0x8d902847  ! 1921: WRPR_PSTATE_I	wrpr	%r0, 0x0847, %pstate
	.word 0x8d902d72  ! 1922: WRPR_PSTATE_I	wrpr	%r0, 0x0d72, %pstate
	.word 0x879021b7  ! 1923: WRPR_TT_I	wrpr	%r0, 0x01b7, %tt
	.word 0xa1902004  ! 1924: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x32800001  ! 1925: BNE	bne,a	<label_0x1>
	.word 0xea57e001  ! 1926: LDSH_I	ldsh	[%r31 + 0x0001], %r21
	.word 0xeb27e001  ! 1927: STF_I	st	%f21, [0x0001, %r31]
	.word 0x91d020b4  ! 1928: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8d902a8d  ! 1929: WRPR_PSTATE_I	wrpr	%r0, 0x0a8d, %pstate
splash_lsu_444:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1930: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 1931: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xa1902002  ! 1932: WRPR_GL_I	wrpr	%r0, 0x0002, %-
tagged_445:
	taddcctv %r7, 0x1608, %r1
	.word 0xea07e001  ! 1933: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0x87902131  ! 1934: WRPR_TT_I	wrpr	%r0, 0x0131, %tt
	.word 0x38700001  ! 1935: BPGU	<illegal instruction>
	.word 0x879022f0  ! 1936: WRPR_TT_I	wrpr	%r0, 0x02f0, %tt
	.word 0x87902254  ! 1937: WRPR_TT_I	wrpr	%r0, 0x0254, %tt
	.word 0x91d020b5  ! 1938: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xea800b00  ! 1939: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r21
splash_lsu_446:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1940: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_447:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1941: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_448:
	tsubcctv %r22, 0x1686, %r4
	.word 0xea07e001  ! 1942: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0x93902007  ! 1943: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x32700001  ! 1944: BPNE	<illegal instruction>
	.word 0x87802020  ! 1945: WRASI_I	wr	%r0, 0x0020, %asi
splash_htba_449:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1946: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_450:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1947: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 1948: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87802016  ! 1949: WRASI_I	wr	%r0, 0x0016, %asi
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1950: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xea17c000  ! 1951: LDUH_R	lduh	[%r31 + %r0], %r21
	.word 0x87802010  ! 1952: WRASI_I	wr	%r0, 0x0010, %asi
splash_tba_451:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1953: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802001  ! 1954: SIR	sir	0x0001
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1955: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99540000  ! 1956: RDPR_GL	rdpr	%-, %r12
splash_lsu_452:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1957: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_453:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1958: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd89004a0  ! 1959: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xd8d7e000  ! 1962: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r12
	.word 0x87802080  ! 1963: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x879023a4  ! 1964: WRPR_TT_I	wrpr	%r0, 0x03a4, %tt
	.word 0xd817c000  ! 1965: LDUH_R	lduh	[%r31 + %r0], %r12
	.word 0xa1902006  ! 1966: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x38700001  ! 1967: BPGU	<illegal instruction>
tagged_454:
	tsubcctv %r6, 0x121c, %r25
	.word 0xd807e001  ! 1968: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd937e001  ! 1969: STQF_I	-	%f12, [0x0001, %r31]
	.word 0xd897e000  ! 1970: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
splash_cmpr_455:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1812001  ! 1971: WR_STICK_REG_I	wr	%r4, 0x0001, %-
splash_lsu_456:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1972: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 1973: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xab540000  ! 1974: RDPR_GL	rdpr	%-, %r21
	.word 0x83d02035  ! 1975: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_tba_457:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1976: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902003  ! 1977: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xea8008a0  ! 1978: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
splash_tba_458:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1979: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xeac804a0  ! 1980: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r21
DS_459:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xe531c01a  ! 1: STQF_R	-	%f18, [%r26, %r7]
	normalw
	.word 0x97458000  ! 1981: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x8d902856  ! 1982: WRPR_PSTATE_I	wrpr	%r0, 0x0856, %pstate
	.word 0xd617c000  ! 1983: LDUH_R	lduh	[%r31 + %r0], %r11
	.word 0xd6d80e60  ! 1984: LDXA_R	ldxa	[%r0, %r0] 0x73, %r11
tagged_460:
	tsubcctv %r9, 0x10fe, %r20
	.word 0xd607e001  ! 1985: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd61fe001  ! 1986: LDD_I	ldd	[%r31 + 0x0001], %r11
	.word 0x91d020b2  ! 1987: Tcc_I	ta	icc_or_xcc, %r0 + 178
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd65fc000  ! 1988: LDX_R	ldx	[%r31 + %r0], %r11
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1989: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_461:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1990: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x99902002  ! 1991: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa1902005  ! 1992: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87802063  ! 1993: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa1902006  ! 1994: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_tba_462:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1995: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200c  ! 1996: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x81982044  ! 1997: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0044, %hpstate
splash_cmpr_463:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1822001  ! 1998: WR_STICK_REG_I	wr	%r8, 0x0001, %-
change_to_randtl_464:
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

	.xword	0xfbc3f59a1fa07e2c
	.xword	0xdd910169a6c5daf8
	.xword	0xc669e8fe8a87475f
	.xword	0x4098678d32f2fb3d
	.xword	0x3769d0f63ab54ed4
	.xword	0xab6ec85faa4423aa
	.xword	0x2bd4a12c0b49be96
	.xword	0x235e15a6da798269
	.xword	0x5c072ac128d3ac56
	.xword	0x4656ebd224460b54
	.xword	0xef15b4477d9ad21c
	.xword	0x2262c739fdfecd63
	.xword	0x6a74d598d098ba0a
	.xword	0x3595ba1a9a574bf9
	.xword	0x759a7aa237a140ad
	.xword	0x2f986d31c43521c7
	.xword	0x5d57094802e68633
	.xword	0x539e39db1019936a
	.xword	0x23a96428cbc429a2
	.xword	0x1bff8319e5dfedcc
	.xword	0x279f7d69dd13518c
	.xword	0x73269e6fc8234a3f
	.xword	0x6dd496fd857ac663
	.xword	0xc27df425559c2a9f
	.xword	0x2a40df3e3a655cb8
	.xword	0xfd1fb833a8dcf443
	.xword	0xa397b271b4f37223
	.xword	0x0702ddcdb70c6a7d
	.xword	0x9fd71d5caab22905
	.xword	0x3b68cd9ee3ad4223
	.xword	0x809122bc412e8250
	.xword	0x2f93588e1a6ceee5
	.xword	0xe855075429f73c6a
	.xword	0xf55b9e6e415bde31
	.xword	0x75d840f30949115a
	.xword	0xfd283a43d650211a
	.xword	0xd03d0cf6209d0a1e
	.xword	0xe3fddca4d1af1410
	.xword	0xdef9ef1236850c4c
	.xword	0xcf6a40cadbe3f86a
	.xword	0xf875c60d766e4e1f
	.xword	0x2d63dd13957b4bde
	.xword	0x2119a7f1352be402
	.xword	0x9fa6def14acda4ea
	.xword	0x3c054b82df9095ea
	.xword	0x89975974930d71bc
	.xword	0xf44a510bbcec60cd
	.xword	0xb58c931fd2f84fce
	.xword	0xa38f61d069e32c92
	.xword	0x8c8ab622f72a1f59
	.xword	0xc71cc78edff69a73
	.xword	0xd8cf9ba3d56e720c
	.xword	0xcdd89a2c132663bb
	.xword	0xf681bac936db9ef1
	.xword	0xe6720a73d41a85c6
	.xword	0xb21217bca93e7fec
	.xword	0xc8400fbd43f043b8
	.xword	0x4bb7acd42ebaa900
	.xword	0xc7257a7d52218969
	.xword	0x885d7c215090ea49
	.xword	0xd98257bface991e2
	.xword	0x426ee4c0e888d4b0
	.xword	0x4b95219e45fe002f
	.xword	0x2cca676b5927a5f7
	.xword	0xc2300df52573ca92
	.xword	0xd05382ac2512bd46
	.xword	0xcec5144e4e877a44
	.xword	0x6ce593f0d61829d6
	.xword	0x12069cf7fa0e868b
	.xword	0x486945f12711434b
	.xword	0x8caa50513caa617a
	.xword	0xececf9b67179a21f
	.xword	0xc5c97eadd2649505
	.xword	0xb0d01e3ea1921a82
	.xword	0xca48bd633ef3a3b9
	.xword	0xed448871d735faed
	.xword	0x33cad8e89c4deec9
	.xword	0xa2ac0c33ed380991
	.xword	0xc4adc60661263a10
	.xword	0x2ff01ad35c92be04
	.xword	0x76b71c11fa7ccbc3
	.xword	0xdb63e77365a16559
	.xword	0x15dc133a229253b9
	.xword	0x433da890c4c75d7c
	.xword	0x00ee7029f0f794d2
	.xword	0x4e67b471f0f3fa3b
	.xword	0xd93c792fa3c22824
	.xword	0xd1e9aa5b4f253b57
	.xword	0xea478887846f3bd4
	.xword	0xfd7756916b305ced
	.xword	0x27ba9c69c73e4d53
	.xword	0x93c09d4074508efd
	.xword	0x707744d8bfe55d9e
	.xword	0x64a470412970acdf
	.xword	0x7090049524ebdb99
	.xword	0x58eed0b9d8152eca
	.xword	0x4638c87bd41210b3
	.xword	0x5c8cfd91e65cf537
	.xword	0xa866d52da1033de6
	.xword	0x6c81c4bc3d879d14
	.xword	0xf560a6e7cf55fed3
	.xword	0x085ca269279d4cb5
	.xword	0x329432a4f0ac2977
	.xword	0xf58769172c394a51
	.xword	0x89550bd1d45ff60d
	.xword	0x4d4a4fdc3dd2280b
	.xword	0xbb673934284533e9
	.xword	0x444fc8e4b476a7f4
	.xword	0xd32c809f3656b70b
	.xword	0x09970c45098be785
	.xword	0x9758a509596ff91d
	.xword	0xfbb9dae18c573a88
	.xword	0x69e3eff8d6f4982a
	.xword	0xcf6e02850131c86f
	.xword	0xe6adf2bbc2ea7996
	.xword	0x81f6ba3704c5f4d7
	.xword	0x13a887abe63f0698
	.xword	0xa162b9fa89327b37
	.xword	0x6be9370d762f6691
	.xword	0xc417518e07c022d1
	.xword	0x0053b335eac8bc14
	.xword	0x13be716ae369823b
	.xword	0x48ea3b2021609532
	.xword	0xf5fd6d8387d04f9f
	.xword	0xbc540cecdb3d1b50
	.xword	0x579f70eb25f018d5
	.xword	0x7af542cea0d80185
	.xword	0x965d1afc20523a91
	.xword	0xdfaed86c71abe62f
	.xword	0x88a0811e86704641
	.xword	0x09326a6d35285852
	.xword	0xdd01a5d1b0221d1b
	.xword	0xc49d6604ef4ae873
	.xword	0x418a03cf69c5053c
	.xword	0x32eeaf3fd71991ef
	.xword	0xf7375a88d059cc15
	.xword	0xba828d23718cd533
	.xword	0x822b6f3dfc6250e1
	.xword	0x0ab80ede8d7b5fd4
	.xword	0xf2a0f8bbddeee52a
	.xword	0x67943ee7a9317357
	.xword	0x22b63a89d4f29367
	.xword	0x1237fdb0f02dc769
	.xword	0x8e36979e2ce8416c
	.xword	0x23cdd90b34f5e9aa
	.xword	0x5aafb7402a6dc012
	.xword	0xa25f11de2a658f1a
	.xword	0xdf4f8ad31ba403ef
	.xword	0x5e09b9170949c322
	.xword	0x54cea33fb4f24654
	.xword	0xd5206b9443c219ed
	.xword	0x6a6a189bf73bde5e
	.xword	0xc6956f532a2fade1
	.xword	0xbc5c03b441f10226
	.xword	0xbbafe143ae4ef719
	.xword	0xec1cb8ecf806abd2
	.xword	0x7b62467af16760c8
	.xword	0x15a91ca034bc21c9
	.xword	0xafb5f9fe0dc8272e
	.xword	0x54c4be27b430a5b0
	.xword	0xef97570745626568
	.xword	0xed1fff8057b9de1c
	.xword	0x51f211583174a7d8
	.xword	0x447fd07197cb8eb0
	.xword	0x8b307bafbbe7c7bb
	.xword	0x33b86ab96ad12f06
	.xword	0x9f81da3da9ea17ca
	.xword	0x01846a2a2156234a
	.xword	0xfdf297b401ed648c
	.xword	0x55f94a982860aeed
	.xword	0x08b0b5ae1687311f
	.xword	0x3505635fbd40eb8b
	.xword	0x1116745c08fd0b60
	.xword	0x12207a4a7a692862
	.xword	0x0c9e3c8f6c6a9a43
	.xword	0x1a3bad80645b5eda
	.xword	0x4709d055d5d60b19
	.xword	0xf1e13cea39f3ccd3
	.xword	0x1007bb53c2b1f77f
	.xword	0x03fde7b0fa534e7f
	.xword	0x964ad7cddee7905c
	.xword	0x8de745f225e4725e
	.xword	0xb8ac3a8df8be666e
	.xword	0xa45e7918f7e855d2
	.xword	0xa0048be3ec4efa9c
	.xword	0x522a57aa99d13a90
	.xword	0x11af7cbcaab8a858
	.xword	0x42534bcbd0a88191
	.xword	0x054b91ada59640ed
	.xword	0xe2fa9426c321f2a9
	.xword	0x8dffedd16d3bae09
	.xword	0x1f9d5b74562c49e9
	.xword	0xa2cc5f9ce3a31c80
	.xword	0x8f9b20ca1e249430
	.xword	0x72e73ffbadba672b
	.xword	0x48296e263fe21bea
	.xword	0xaa7784e8a01d324d
	.xword	0x49c4ff77367c8e7d
	.xword	0x6018c3635f9a9e3a
	.xword	0xb77c595f69f7f3d9
	.xword	0x5179919971ee4e55
	.xword	0x727f4401dbe0f6bb
	.xword	0xeaf61f959e83a30a
	.xword	0x06473e10644ef54a
	.xword	0xa084f3f14273c4bf
	.xword	0x7dd718793af2c94d
	.xword	0x14c5e10d29c5ceea
	.xword	0x5affd2ad0d92a008
	.xword	0xa23799f5c0f069a0
	.xword	0xe9aa1a6e71156751
	.xword	0xb31cb69074b90cd1
	.xword	0xd35b0a6573d49f22
	.xword	0x64d8c99e641a17e6
	.xword	0xc68103e119f98f25
	.xword	0x61492e4abf7c531d
	.xword	0x7dc2f31066b02314
	.xword	0x6a3ece4316b0797e
	.xword	0xb8e73177380a26a3
	.xword	0x3c67651b1400813b
	.xword	0x933b94d91de20d94
	.xword	0x78a576a231aaad35
	.xword	0xf91ce940871af237
	.xword	0xbb4329b894c87b4c
	.xword	0x46288e91a76a454d
	.xword	0xc879f84d5b180a4b
	.xword	0xa152c397c9288c5a
	.xword	0x2103ddc046efc2c2
	.xword	0x206858c11993cea0
	.xword	0x64888ba1921584bc
	.xword	0x5cc79155cea6c4dd
	.xword	0x5453755b927250d5
	.xword	0x0b39eb32764494fc
	.xword	0x56e767d147f8a758
	.xword	0xa217d2036e6189a6
	.xword	0x5572af882cca05cc
	.xword	0xeb3377ee010b47ca
	.xword	0xc290f04c90715128
	.xword	0xf2def49610392015
	.xword	0x9907ab8de970dab1
	.xword	0x36336a0e429e64d0
	.xword	0x6c58dcfae48d7591
	.xword	0x8d23fa953cfc675a
	.xword	0x8be9f4836706317f
	.xword	0x80367c7b908461cc
	.xword	0xab716e9a56b1acc3
	.xword	0xb141523e2e8251bb
	.xword	0x512602047486d144
	.xword	0x0fb03c9378e77f5f
	.xword	0x7bff45de0c11bc9a
	.xword	0xaf156e65d02b0a7a
	.xword	0x23a8c3e8262efae7
	.xword	0xa3aa2ddd1f88d34b
	.xword	0xd5e0229749ae5791
	.xword	0x0f0dd25ca280ecc6
	.xword	0x6436ed1a43d2b9b8
	.xword	0x649d0e7f1b6bc337

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

