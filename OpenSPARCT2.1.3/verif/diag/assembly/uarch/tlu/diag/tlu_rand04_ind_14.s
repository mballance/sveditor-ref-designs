/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_14.s
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
    nop;retry;nop;nop;nop;

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
    rdpr %tstate, %l3;\
    and %l3, 0xfff, %l3;\
    wrpr %l3, %tstate ;\
    done;nop;

#define H_T0_Control_Transfer_Instr_0x74
#define My_H_T0_Control_Transfer_Instr_0x74 \
    done;nop;

#define H_T1_Control_Transfer_Instr_0x74
#define My_H_T1_Control_Transfer_Instr_0x74 \
    done;nop;


#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
    done;nop

#define H_HT0_mem_address_range_0x2e
#define SUN_H_HT0_mem_address_range_0x2e \
    done;nop


!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!

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
	mov 0xb4, %r14
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
	mov 0x32, %r14
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
	mov 0xb5, %r14
	mov 0xb3, %r30
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
!Initializing Trap Stack 
	wrpr 0x1, %tl
	wrpr 0x1, %tt
	wrpr 0x1, %tpc
	wrpr 0x1, %tnpc
	wrpr 0x1, %tstate
	wrhpr 0x1, %htstate
	wrpr 0x2, %tl
	wrpr 0x1, %tt
	wrpr 0x1, %tpc
	wrpr 0x1, %tnpc
	wrpr 0x1, %tstate
	wrhpr 0x1, %htstate
	wrpr 0x3, %tl
	wrpr 0x1, %tt
	wrpr 0x1, %tpc
	wrpr 0x1, %tnpc
	wrpr 0x1, %tstate
	wrhpr 0x1, %htstate
	wrpr 0x4, %tl
	wrpr 0x1, %tt
	wrpr 0x1, %tpc
	wrpr 0x1, %tnpc
	wrpr 0x1, %tstate
	wrhpr 0x1, %htstate
	wrpr 0x5, %tl
	wrpr 0x1, %tt
	wrpr 0x1, %tpc
	wrpr 0x1, %tnpc
	wrpr 0x1, %tstate
	wrhpr 0x1, %htstate
	wrpr 0x6, %tl
	wrpr 0x1, %tt
	wrpr 0x1, %tpc
	wrpr 0x1, %tnpc
	wrpr 0x1, %tstate
	wrhpr 0x1, %htstate
	wrpr 0x0, %tl
	ta T_CHANGE_NONHPRIV 
	.word 0xe2800be0  ! 1: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r17
splash_tba_0:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 2: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe2c7e020  ! 3: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r17
DS_1:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 4: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xaf494000  ! 5: RDHPR_HTBA	rdhpr	%htba, %r23
	.word 0x8d802000  ! 6: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xee1fe001  ! 7: LDD_I	ldd	[%r31 + 0x0001], %r23
	.word 0x93902003  ! 8: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 9: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa745c000  ! 10: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0xe69004a0  ! 11: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
splash_tba_2:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 12: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982a94  ! 13: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a94, %hpstate
tagged_3:
	taddcctv %r8, 0x114a, %r3
	.word 0xe607e001  ! 14: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0x879023b9  ! 15: WRPR_TT_I	wrpr	%r0, 0x03b9, %tt
	.word 0xe61fc000  ! 16: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0xe697e000  ! 17: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r19
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 18: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_4:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 19: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
splash_tba_5:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 21: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802000  ! 22: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe6800b00  ! 23: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r19
	.word 0xe6c7e020  ! 24: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r19
	.word 0x91d020b4  ! 25: Tcc_I	ta	icc_or_xcc, %r0 + 180
change_to_randtl_6:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 26: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe61fe001  ! 27: LDD_I	ldd	[%r31 + 0x0001], %r19
	.word 0xaba0056b  ! 28: FSQRTq	fsqrt	
	.word 0x8d902337  ! 29: WRPR_PSTATE_I	wrpr	%r0, 0x0337, %pstate
	.word 0x8d903eff  ! 30: WRPR_PSTATE_I	wrpr	%r0, 0x1eff, %pstate
DS_7:
	.word 0x22800001  ! 32: BE	be,a	<label_0x1>
	.word 0x20800001  ! 32: BN	bn,a	<label_0x1>
	.word 0xa3a00554  ! 32: FSQRTd	fsqrt	
	.word 0x8fa40820  ! 31: FADDs	fadds	%f16, %f0, %f7
	.word 0xce17e001  ! 32: LDUH_I	lduh	[%r31 + 0x0001], %r7
	.word 0xcec00e40  ! 33: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r7
DS_8:
	.word 0x34800001  ! 35: BG	bg,a	<label_0x1>
	.word 0xc7312001  ! 35: STQF_I	-	%f3, [0x0001, %r4]
	normalw
	.word 0xb5458000  ! 34: RD_SOFTINT_REG	rd	%softint, %r26
	.word 0xa1902005  ! 35: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xf41fe001  ! 36: LDD_I	ldd	[%r31 + 0x0001], %r26
	.word 0xf597e001  ! 37: LDQFA_I	-	[%r31, 0x0001], %f26
splash_tba_9:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 38: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_10:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 39: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_htba_11:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 40: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xf48008a0  ! 41: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0x8d903227  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x1227, %pstate
	.word 0xf49fe001  ! 43: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r26
	.word 0xf4c00e40  ! 44: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r26
	.word 0xf49fe001  ! 45: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r26
	.word 0xf597e001  ! 46: LDQFA_I	-	[%r31, 0x0001], %f26
DS_12:
	.word 0x20800001  ! 48: BN	bn,a	<label_0x1>
	allclean
	.word 0xb7b4c309  ! 47: ALLIGNADDRESS	alignaddr	%r19, %r9, %r27
splash_lsu_13:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 48: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf6c004a0  ! 49: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r27


.global user_data_start
.data
user_data_start:
	.xword	0x417465975a111fda
	.xword	0x53cc9d0b103d10b8
	.xword	0x987b66dcac462d54
	.xword	0x68aac5ec0e57c85e
	.xword	0x988a0d76c9ccc0d5
	.xword	0x8a6dcbb289fe6b59
	.xword	0x782265a61791c71e
	.xword	0xfaa6b88e5a2fe449
	.xword	0x6532c5c28318bd41
	.xword	0xf363f9d671da071d
	.xword	0x448d7540d797c344
	.xword	0xf96cd3818fd80572
	.xword	0x685832b93c55376a
	.xword	0x22aa702fa44a30d2
	.xword	0x9cd1284f64eb10aa
	.xword	0x17eee7a840a1a177
	.xword	0x45cf98b2489731ee
	.xword	0x7c8fa5bdac11ca85
	.xword	0xc556cc589cab8d42
	.xword	0x05c1d2d6afea5189
	.xword	0x8dbaa8ef87a11cad
	.xword	0xdf36a05e42d52568
	.xword	0xa78ef51e7da696bd
	.xword	0x5038b8dfee7eda72
	.xword	0xc072fefcb3949a67
	.xword	0x264318c843f63ebc
	.xword	0x4f55c687b6a83444
	.xword	0xbf2fb03d78021887
	.xword	0x9aa1747bfee8805f
	.xword	0x0dc71c42f849a4cc
	.xword	0x5c4c6eae838f382f
	.xword	0x75d45b99eb8d6b5c
	.xword	0x07df00dd2b7112fd
	.xword	0xd630828b56b06234
	.xword	0xfb3194fde8a7d689
	.xword	0x26a8dec0c35292dc
	.xword	0x9d797d1db6905f4a
	.xword	0x4d64f06fb82970ab
	.xword	0xa582a4e68559b67b
	.xword	0x29c0d8cbe5fc5932
	.xword	0xb0d6bb9c420c009c
	.xword	0x58f81a9051a9e562
	.xword	0x70aaab4666ace09b
	.xword	0x94a74ef77c5d9534
	.xword	0x6cc29b6149178d0b
	.xword	0x8a238fa3ecae3ae3
	.xword	0x00f352f24f95fe56
	.xword	0x880eef65944b9a49
	.xword	0x8314f85bab2351fa
	.xword	0x56c1760885eb7282
	.xword	0x8affc23a7901f10b
	.xword	0xe87f07fbb6324ab1
	.xword	0x3a559d7a962621f1
	.xword	0xbf32fafbb0942e01
	.xword	0x7e3734aec1ac4fd0
	.xword	0xfd8f3c20c1d841cb
	.xword	0x1af96f49a0026b7a
	.xword	0xbc17dc18fa9a16c9
	.xword	0x13a515ef19b35969
	.xword	0x050c2981958b703b
	.xword	0x49764cf52113d5f8
	.xword	0xbb8581124cfb8725
	.xword	0xc5c6e3932c6e2fad
	.xword	0x86095317841ce0d2
	.xword	0xa52031e6ef7a16bb
	.xword	0xc0c9f1060ad54d42
	.xword	0x46a64d67f62f2c4b
	.xword	0x149925a18d229c5a
	.xword	0x5bdb08584e3468d4
	.xword	0xd7ef5dd9b519bf5f
	.xword	0x04c718dbc4e4f814
	.xword	0xada343a781936fa1
	.xword	0xb6d47839377a1b3b
	.xword	0x646a948bac424f57
	.xword	0x071dba613f77a983
	.xword	0x4e4618401d773b5f
	.xword	0x4740d9bdafa0a347
	.xword	0x63d8a4e3c842d541
	.xword	0xb10a4fcbe57b4800
	.xword	0x2db2c04597fe5f74
	.xword	0x57b54bee13078666
	.xword	0x7d493d45e50ce006
	.xword	0xec1a7f4fb4f8db4b
	.xword	0x7539c04d266e52db
	.xword	0xc54dcb5aa04db489
	.xword	0x62a38cbf5516759a
	.xword	0x03cd69201d7d7260
	.xword	0x99764f6a85d67984
	.xword	0x3841196ae300d6b3
	.xword	0xb86ae9d7986fa4f8
	.xword	0x05bd2562cc3a9d30
	.xword	0x203d4c62497473e6
	.xword	0x8c51547c2fb094b8
	.xword	0x065f71ae8f5fba18
	.xword	0x8fcc354cb29f572a
	.xword	0xedc3164124b83933
	.xword	0x7472dce2c5d4f566
	.xword	0xa7f4800f9c07ccef
	.xword	0xd81ea78262f10d26
	.xword	0x5ad125ce6f12094c
	.xword	0xd28bcf37c823e28c
	.xword	0xbd850077c1a4d858
	.xword	0xdcb5c8e232cbe2c9
	.xword	0x5252ac1f690fcb06
	.xword	0xb357a30ba514b950
	.xword	0x78139b4a0cb50512
	.xword	0xaf1cced7abbfa42a
	.xword	0x267fb7e2a16b9343
	.xword	0xb54978ccfa179e1e
	.xword	0x34e119dfadc78d6f
	.xword	0x728893485abf0346
	.xword	0x38737497f24736e1
	.xword	0x3a22b2900e5e30e0
	.xword	0xc7daa304d9cd8023
	.xword	0xe907043a70bf5ffb
	.xword	0xedb12ca8aa112006
	.xword	0x7a278be7fb88458e
	.xword	0xc3075a60c7dad24e
	.xword	0xc15e378a594a46c6
	.xword	0x33ff339e5d97574e
	.xword	0x11b378756110179f
	.xword	0xd484455105fe3454
	.xword	0x1c2890b4e8bff825
	.xword	0x2ac839b7673a5d52
	.xword	0x000460171e3649a2
	.xword	0x4e909a981176afc6
	.xword	0x0fb4195d0ff120b6
	.xword	0xdd6221b695ae880e
	.xword	0xb084e9959bd35840
	.xword	0x0a92f474face4fa4
	.xword	0xaa58d6569c8dab9f
	.xword	0x1f3507e6c1683f27
	.xword	0xe5e9a6d62e77da93
	.xword	0xa58df9f6212c9951
	.xword	0x26dbc1f1be12f308
	.xword	0x8d16c68d44a06d3a
	.xword	0xd2d9844f5775f6c2
	.xword	0x73b8f401dd872c61
	.xword	0xaba796f47c24bbc3
	.xword	0x642ba9f61e0c89fc
	.xword	0xd5deffe3d70df39b
	.xword	0x2dc29c45858b59df
	.xword	0x8af9862600d14638
	.xword	0xe520f8c7655adf38
	.xword	0xfd53075907dce91c
	.xword	0x3a8e8db64e28c1cc
	.xword	0x79c4e8047dca3962
	.xword	0xe29767aba1564f17
	.xword	0x22f5ff0138769edb
	.xword	0x806f8482c2d086e4
	.xword	0x209b22c4d7bcf835
	.xword	0xc456df00fc434a9a
	.xword	0x0044064e7020b17a
	.xword	0x9ceefd2c72dbea57
	.xword	0xa6e977ec16f530da
	.xword	0x021e9a53d55225e7
	.xword	0x2ccf2c4d395b5933
	.xword	0x95a1d83f8131c325
	.xword	0x4e17b59fd2b259eb
	.xword	0xe25034ca876e7126
	.xword	0xfadf8429f8f31687
	.xword	0x59d556bc9ae633cd
	.xword	0xcee0793e2bbeff86
	.xword	0x96186143d536bfb6
	.xword	0x205f973daa1b2f8d
	.xword	0x5b91cba09a923fa4
	.xword	0x3b1b74092976ee3e
	.xword	0x519e0f311407c724
	.xword	0x4566103f21e5e81d
	.xword	0xc2f33141848c7eeb
	.xword	0xaf76220dcca64b85
	.xword	0xf88c9b44f3c5e106
	.xword	0x26baac23b2271fa3
	.xword	0x164fd599eec8cbe8
	.xword	0xd56a1676c292a299
	.xword	0xd709acbdee0f3e51
	.xword	0xebf830b2e66f7331
	.xword	0x47510b863638d1b9
	.xword	0xed455aa59fd493f1
	.xword	0xce0582afcf24abc4
	.xword	0xa69c537d3689d911
	.xword	0xb7333f03f16e9b32
	.xword	0xda561ef97f72bbae
	.xword	0x651da7685f31a068
	.xword	0x2483da1b2f97053f
	.xword	0xe6fd6383c163fabf
	.xword	0x7cbee514087e9c23
	.xword	0x10e68e9c00a598c0
	.xword	0x83f38719c844de0a
	.xword	0x9fb2035ae82cb4f2
	.xword	0x75a05292c2fb4917
	.xword	0x88478679853c31aa
	.xword	0xf540eb82fe19fdc3
	.xword	0x47283635de7c9ef3
	.xword	0x23bea98d8d606fdb
	.xword	0xdaad7c3d5510c050
	.xword	0x9ec04f546c98da46
	.xword	0xf88f84593ad68939
	.xword	0x8b27fa9b40d60217
	.xword	0xef001dd08b4e49ac
	.xword	0x6aee387f70095990
	.xword	0x1ebb528139be8ce1
	.xword	0xc967f7492c9e3376
	.xword	0xff6fba6dde7b8e27
	.xword	0x1c10edaa6b3d2ae8
	.xword	0x05726b445a672884
	.xword	0xdd0af47994088ddb
	.xword	0x4ca5bb25d4b6d5ce
	.xword	0xae3edc5f61a7bd6d
	.xword	0xcf079c3f1f372284
	.xword	0xe4907fefd4f148d0
	.xword	0x11795d8842c8df2b
	.xword	0x26505f342fbf82ef
	.xword	0x3c3d7b1b586a1d3e
	.xword	0x73bf044a50af0c2e
	.xword	0x32ee60c10b9f2a59
	.xword	0x3265cacfa338746a
	.xword	0xcbb79fac5a189bfe
	.xword	0x6cc8e54ba06746bc
	.xword	0x7fc979da4b7d5164
	.xword	0xe173b59a84116f39
	.xword	0xcd9b12088a35238b
	.xword	0x5c6c08eb2d0c3493
	.xword	0x2e75f2f712246580
	.xword	0x826f92c3e61aaaa5
	.xword	0x19efdec6b20f2113
	.xword	0x4667e285c9e78445
	.xword	0x8b82d3361416b6b9
	.xword	0x3b30763daa96cffc
	.xword	0xf3dc9073d5932f17
	.xword	0xe8912ffc0883cb98
	.xword	0x5aceda14ee3bcc21
	.xword	0xa6db58bbbb7108f2
	.xword	0xbec416d1b92036d8
	.xword	0x19625bb2196a2aae
	.xword	0xb3f7739c6a0e2eae
	.xword	0x14010cc6b381e958
	.xword	0x027ed24be785d5d0
	.xword	0xcacbc1c7797bbb0d
	.xword	0x6c1d6028a383a6a6
	.xword	0xeda16f22a4bad790
	.xword	0x9f2b6fa084b006da
	.xword	0xda1ed6da4fb7a9f6
	.xword	0xbbc297733e5615a8
	.xword	0x5d1ca1f1eca46df8
	.xword	0x6f2b133c75dfe819
	.xword	0x92ccaab83afc0e87
	.xword	0xc4ab112558229666
	.xword	0xaca9c0aa32ac0e82
	.xword	0x191cae4185756eeb
	.xword	0xc3ea77b4a90ad64d
	.xword	0x7ccf76bbb7a29132
	.xword	0x6c56654b1b685353
	.xword	0x0eab4a22a029e769
	.xword	0x5dabf35617b7dd15
	.xword	0x6107b99d2e6bba6c


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

.global wdog_2_ext

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
    rdpr %pstate, %g1 
    wrpr %g1, 0x1000, %pstate
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
!!# /*
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Tue May 18 16:03:41 2004
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!#     int label = 0;
!!# 
!!# #define MyHTRAPS	0
!!# #define MyTRAPS	1
!!# #define MAIN	2
!!# #define HTRAPS	3
!!# #define RED_SEC	4
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#     IJ_bind_thread_group("diag.j", 51, th0, 0x01);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 54, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     IJ_set_rvar("diag.j", 57, Rv_pdist_reg,"5'brrrr0");
!!# 
!!#     // TBA/HTBA values 
!!# 
!!#     IJ_set_rvar("diag.j", 61, Rv_tba, "6'b1111kk, 16'{0}");
!!#     IJ_set_rvar("diag.j", 62, Rv_htba, "6'b1110kk, 16'{0}");
!!# 
!!#     // LSU cntl reg ..
!!#     IJ_set_rvar("diag.j", 65, Rv_lsucntl, "5'brrrr1");
!!# 
!!#     // Illegal combos
!!#     IJ_set_rvar("diag.j", 68, Rv_illtrap, "2'b1r,5'brrrr,6'b1r1rrr,19'hrrrrr");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!# 
!!#     IJ_set_ropr_fld("diag.j", 75, ijdefault, Ft_Rs1, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 76, ijdefault, Ft_Rs2, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 77, ijdefault, Ft_Rd, "{0..13,16..27}");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 80, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 83, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 84, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x20, 0x10, 0x14, 0x16, 0x1c, 0x4f, 0x58, 0x55, 0x63, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 87, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x20, 0x14, 0x16, 0x1c, 0x4f, 0x63, 0x55, 0x58, 0x80, 0x88}");
!!#     IJ_set_ropr_fld("diag.j", 88, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 89, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 90, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 92, Ro_nontrap_ldasi_z, Ft_Imm_Asi, "{0x45, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 93, Ro_nontrap_ldasi_z, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 94, Ro_nontrap_ldasi_z, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 95, Ro_nontrap_ldasi_z, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 98, Ro_nontrap_ld, Fm_align_Simm13, "{0x0..0x6:5,0x7:1}");
!!#     IJ_set_ropr_fld("diag.j", 99, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 100, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 103, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 104, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 105, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 106, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     //IJ_set_ropr_fld(Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_ropr_fld("diag.j", 110, Ro_traps_i, Ft_Sw_Trap, "{0x32..0x35, 0xb2..0xb5}");
!!#     IJ_set_ropr_fld("diag.j", 111, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 112, Ro_traps_i, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 113, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 114, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 115, Ro_traps_r, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     //IJ_set_ropr_fld(Ro_traps_r, Ft_Simm13, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_ropr_fld("diag.j", 117, Ro_traps_r, Ft_Simm13, "{0x32..0x35, 0xb2..0xb5}");
!!#     IJ_set_rvar("diag.j", 118, Rv_init_trap, "{0x30..0x35, 0xb0..0xb5}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 121, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 122, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Pstate splash
!!#     IJ_set_ropr_fld("diag.j", 125, Ro_wrpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 126, Ro_wrpstate, Ft_Simm13, "13'brrrrrrrrrrrrr");
!!# 
!!#     // Hpstate splash
!!#     IJ_set_ropr_fld("diag.j", 129, Ro_wrhpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 130, Ro_wrhpstate, Ft_Simm13, "12'brrrrrr0rr1rr");
!!# 
!!#     // TT splash
!!#     IJ_set_ropr_fld("diag.j", 133, Ro_wrtt, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 134, Ro_wrtt, Ft_Simm13, "10'brrrrrrrrrr");
!!# 
!!#     // GL splash
!!#     IJ_set_ropr_fld("diag.j", 137, Ro_wrgl, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 138, Ro_wrgl, Ft_Simm13, "4'brrrr");
!!# 
!!#     // TL splash
!!#     IJ_set_ropr_fld("diag.j", 141, Ro_tl, Ft_Simm13, "{0..5}");
!!#     IJ_set_ropr_fld("diag.j", 142, Ro_tl, Ft_Rs1,    "{0}");
!!# 
!!#     // CWP splash
!!#     IJ_set_ropr_fld("diag.j", 145, Ro_wrcwp, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 146, Ro_wrcwp, Ft_Simm13, "3'brrr");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 148, Ro_save_restore, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 149, Ro_save_restore, Ft_Rd,  "{31}");
!!#     IJ_set_ropr_fld("diag.j", 150, Ro_save_restore, Ft_Rs2, "{0}");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 152, Ro_winops, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 153, Ro_winops, Ft_Simm13, "{0..5}");
!!# 
!!#     // {H}TBA Splash
!!#     IJ_set_ropr_fld("diag.j", 156, Ro_tba, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 157, Ro_tba, Ft_Rs2, "{2}");
!!# 
!!#     // Dest reg is %g0
!!#     IJ_set_ropr_fld("diag.j", 160, Ro_rd0, Ft_Rd, "{0}");
!!# 
!!#     // Weights
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 164,"{10}");
!!#     IJ_set_rvar("diag.j", 165, wt_high, "{90}");
!!#     IJ_set_rvar("diag.j", 166, wt_med,  "{40}");
!!#     IJ_set_rvar("diag.j", 167, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 171, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<7; k++) {
!!#         for (i = 0; i < 30; i++) {
!!#             if (i==15) {
!!#                 IJ_printf  ("diag.j", 175, th0,"\tmov %%r31, %%r15\n");
!!#                 continue;
!!#             }
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 179, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 181, th0,"\tmov 0x%rx, %%r14\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 182, th0,"\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 183, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 186, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 189, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 192, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 195, th0,"\tta T_CHANGE_HPRIV \n");
!!#     IJ_printf  ("diag.j", 196, th0,"!Initializing Tick Cmprs \n");
!!#     IJ_printf  ("diag.j", 197, th0,"\tmov 1, %%g2\n");
!!#     IJ_printf  ("diag.j", 198, th0,"\tsllx %%g2, 63, %%g2\n");
!!#     IJ_printf  ("diag.j", 199, th0,"\tor %%g1, %%g2, %%g1\n");
!!#     IJ_printf("diag.j", 200, th0, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
!!#     IJ_printf("diag.j", 201, th0, "\twr %%g1, %%g0, %%tick_cmpr\n");
!!#     IJ_printf("diag.j", 202, th0, "\twr %%g1, %%g0, %%sys_tick_cmpr\n");
!!#     IJ_printf  ("diag.j", 203, th0,"!Initializing Trap Stack \n");
!!#     for (i = 1; i <=6; i++) {
!!#         IJ_printf  ("diag.j", 205, th0,"\twrpr 0x%d, %%tl\n", i);
!!#         IJ_printf  ("diag.j", 206, th0,"\twrpr 0x1, %%tt\n");
!!#         IJ_printf  ("diag.j", 207, th0,"\twrpr 0x1, %%tpc\n");
!!#         IJ_printf  ("diag.j", 208, th0,"\twrpr 0x1, %%tnpc\n");
!!#         IJ_printf  ("diag.j", 209, th0,"\twrpr 0x1, %%tstate\n");
!!#         IJ_printf  ("diag.j", 210, th0,"\twrhpr 0x1, %%htstate\n");
!!#     }
!!#     IJ_printf  ("diag.j", 212, th0,"\twrpr 0x0, %%tl\n");
!!#     IJ_printf  ("diag.j", 213, th0,"\tta T_CHANGE_NONHPRIV \n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#     int i;
!!#     IJ_printf  ("diag.j", 262, th0,"\n\n.global user_data_start\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 264, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
!!#     }
!!# 
!!#     for (i = 0; i < 4; i++) {
!!#         IJ_iseg_printf  ("diag.j", 268,MyHTRAPS, i, th0, "#include \"htraps.s\"\n");
!!#         IJ_iseg_printf  ("diag.j", 269,MyHTRAPS, i, th0,"#include \"tlu_htraps_ext.s\"\n");
!!#         IJ_iseg_printf  ("diag.j", 270,MyTRAPS, i, th0,"#include \"traps.s\"\n");
!!#     }
!!# 
!!# }
!!# 
!!# %%
!!# %%section map
!!# 
!!# // Define some additional trap tables here ..
!!# 
!!# SECTION .MyHTRAPS  TEXT_VA = "42'{0}, 6'b1110jj, 16'{0}", 
!!#                  DATA_VA = "42'{0}, 8'b1110jj11, 14'{0}",
!!# attr_text {
!!#     Name = .MyHTRAPS,
!!#     hypervisor
!!#     }
!!# attr_data {
!!#     Name = .MyHTRAPS,
!!#     hypervisor
!!#     }
!!# 
!!#   enumerate {
!!#     TEXT_VA
!!#   }  
!!# 
!!# SECTION .MyTRAPS  TEXT_VA = "42'{0}, 6'b1111jj, 16'{0}", 
!!#                  DATA_VA = "42'{0}, 8'b1111jj11, 14'{0}",
!!# attr_text {
!!#     Name = .MyTRAPS,
!!#     RA = "42'{0}, 6'b1111jj, 16'{0}",
!!#     part_0_ctx_zero_tsb_config_0,
!!#     TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
!!#     TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
!!#     TTE_E=0,      TTE_P=1,        TTE_W=1, TTE_X=1
!!#     }
!!# attr_data {
!!#     Name = .MyTRAPS,  
!!#     RA = "42'{0}, 8'b1111jj11, 14'{0}",
!!#     part_0_ctx_zero_tsb_config_0,
!!#     TTE_G=1,       TTE_Context=0, TTE_V=1,    TTE_Size=0, TTE_NFO=0, TTE_IE=0, 
!!#     TTE_Soft2=0,   TTE_Diag=0,    TTE_Soft=0, TTE_L=0,    TTE_CP=1,  TTE_CV=0, 
!!#     TTE_E=0,      TTE_P=1,        TTE_W=1
!!#     }
!!# 
!!#   enumerate {
!!#     TEXT_VA
!!#   }  
!!# 
!!# 
!!# 
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# block: inst | block inst
!!#     {
!!#         IJ_generate ("diag.j", 319, th0, $2);
!!#     };
!!# 
!!# inst:      trap_asr     %rvar  wt_med
!!#         |  trap_asi     %rvar  wt_med
!!#         |  tcc          %rvar  wt_high
!!#         | ldst_excp     %rvar  wt_high
!!#         | ldstasi_excp  %rvar  wt_med
!!#         | ldstasi_excp_z  %rvar  wt_med
!!#         | change_mode   %rvar  wt_med
!!#         | alu           %rvar  wt_low
!!#         | branches      %rvar  wt_high
!!#         | wrasi         %rvar  wt_med
!!#         | splash_fprs   %rvar  wt_low
!!#         | splash_pstate %rvar  wt_med
!!#         | splash_hpstate %rvar  wt_low
!!#         | splash_cwp    %rvar  wt_med
!!#         | splash_gl     %rvar  wt_med
!!#         | splash_tt     %rvar  wt_med
!!#         | stores        %rvar  wt_low
!!#         | sir           %rvar  wt_low
!!#         | splash_cmpr   %rvar  wt_low
!!#         | splash_tba    %rvar  wt_med
!!#         | splash_htba   %rvar  wt_low
!!#         | splash_lsucnt %rvar  wt_med
!!#         //| demap         %rvar wt_med
!!#         | tagged        %rvar  wt_med
!!# ;
!!# 
!!# dummy :tCHANGE_NONHPRIV | tCHANGE_NONPRIV | 
!!#        tWR_STICK_CMPR_REG_R | tWR_TICK_CMPR_REG_R |
!!#        tILLTRAP
!!# ;
!!# 
!!# sir : tSIR ;
!!# 
!!# demap : tLDX_R  %ropr  Ro_nontrap_ld
!!#     {
!!#         IJ_set_rvar("diag.j", 357, Rv_demap, "{0x57, 0x5f}");
!!#         IJ_printf("diag.j", 358, th0, "\tmov 8, %%g3\n");
!!#         IJ_printf("diag.j", 359, th0, "\tstxa %%g3, [%%g0] 0x%rx\n", Rv_demap);
!!#     }
!!# ;
!!# 
!!# tagged: tLDUW_I %ropr  Ro_nontrap_ld
!!#     {
!!#         IJ_printf("diag.j", 365, th0, "tagged_%d:\n", label);
!!#         IJ_set_rvar("diag.j", 366, Rv_tof_r, "{1..26}");
!!#         IJ_set_rvar("diag.j", 367, Rv_tof_i, "13'b1rrrrrrrrrrrr");
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 369, th0, "\ttaddcctv %%r%rd, 0x%rx, %%r%rd\n", 
!!#                                 Rv_tof_r, Rv_tof_i, Rv_tof_r);
!!#         } else {
!!#             IJ_printf("diag.j", 372, th0, "\ttsubcctv %%r%rd, 0x%rx, %%r%rd\n", 
!!#                                 Rv_tof_r, Rv_tof_i, Rv_tof_r);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# 
!!# change_mode :   
!!#     reduce_priv_level
!!#     | tCHANGE_HPRIV 
!!#     | tCHANGE_PRIV 
!!#     //| change_to_tl1
!!#     | change_to_randtl
!!#     //| tCHANGE_TO_TL0 
!!# ;
!!# 
!!# pt1: tFqTOd | tSDIVX_I | tWRTICK_R | tWR_STICK_REG_R
!!# ;
!!# 
!!# reduce_priv_level: pt1 
!!#     {
!!# 
!!#         IJ_set_ropr_fld("diag.j", 395, Ro_tl, Ft_Simm13, "{0..2}");
!!#         IJ_generate_from_token("diag.j", 396,1, th0, Ro_tl, tWRPR_TL_I, -1);;
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 398,1, th0, ijdefault, tCHANGE_NONHPRIV, -1);;
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 400,1, th0, ijdefault, tCHANGE_NONPRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_randtl: tWRPR_TL_I %ropr  Ro_tl
!!#     {
!!#         IJ_printf("diag.j", 408, th0, "change_to_randtl_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_set_ropr_fld("diag.j", 410, Ro_tl, Ft_Simm13, "{3..5}");
!!#             IJ_generate_from_token("diag.j", 411,1, th0, ijdefault, tCHANGE_HPRIV, -1);;
!!#         } else {
!!#             IJ_set_ropr_fld("diag.j", 413, Ro_tl, Ft_Simm13, "{0..2}");
!!#             IJ_generate_from_token("diag.j", 414,1, th0, ijdefault, tCHANGE_PRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_tl1 : tCHANGE_TO_TL1
!!#     {
!!#         IJ_printf("diag.j", 422, th0, "change_to_tl1_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 424, th0, "\tta T_CHANGE_HPRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 426, th0, "\tta T_CHANGE_PRIV\n");
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# trap_asr :
!!#       tRDPR_TPC 
!!#     | tRDPR_TSTATE 
!!#     | tRDPR_TT
!!#     | tRDPR_TNPC
!!#     | tRDPR_TBA
!!#     | tRDPR_TL
!!#     | tRDPR_GL
!!#     | tRDHPR_HTBA
!!#     | tRDHPR_HPSTATE
!!#     | tRD_TICK_CMPR_REG
!!#     | tRD_STICK_CMPR_REG
!!#     | tRD_STICK_REG         %ropr   Ro_rd0
!!# ;
!!# 
!!# splash_lsucnt: tFBPULE
!!#     {
!!#         IJ_printf("diag.j", 448, th0, "splash_lsu_%d:\n", label);
!!#         IJ_printf("diag.j", 449, th0, "\tset 0x%rx, %%r2\n", Rv_lsucntl);
!!#         IJ_printf("diag.j", 450, th0, "\tstxa %%r2, [%%r0] ASI_LSU_CONTROL\n");
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_tba: tWRPR_TBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 457, th0, "splash_tba_%d:\n", label);
!!#         IJ_printf("diag.j", 458, th0, "\tta T_CHANGE_PRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 460, th0, "\tset 0x120000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 462, th0, "\tset 0x%08llrx, %%r2\n", Rv_tba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# splash_htba: tWRHPR_HTBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 469, th0, "splash_htba_%d:\n", label);
!!#         IJ_printf("diag.j", 470, th0, "\tta T_CHANGE_HPRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 472, th0, "\tset 0x80000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 474, th0, "\tset 0x%08llrx, %%r2\n", Rv_htba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_cmpr: tWR_STICK_REG_I
!!#     {
!!#         IJ_printf("diag.j", 482, th0, "splash_cmpr_%d:\n", label);
!!#         IJ_set_rvar("diag.j", 483, Rv_rand_60,"64'h8rrrrrrr_rrrrrrrr");
!!#         IJ_set_ropr_fld("diag.j", 484, Ro_cmpr, Ft_Rs1, "{0}");
!!#         IJ_set_ropr_fld("diag.j", 485, Ro_cmpr, Ft_Rs2, "{1}");
!!#         IJ_printf  ("diag.j", 486, th0,"\tnop\n\tmov 1, %%g2\n");
!!#         IJ_printf  ("diag.j", 487, th0,"\tsllx %%g2, 63, %%g2\n");
!!#         IJ_printf  ("diag.j", 488, th0,"\tor %%g1, %%g2, %%g1\n");
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 490,1, th0, Ro_cmpr, tWR_STICK_CMPR_REG_R, tWR_TICK_CMPR_REG_R, -1);;
!!#         } else {
!!#            IJ_printf("diag.j", 492, th0, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
!!#         }
!!#         label++;
!!#     }
!!# 
!!# ;   
!!# 
!!# splash_gl :
!!#     tWRPR_GL_I %ropr  Ro_wrgl
!!# ;
!!# splash_tt :
!!#     tWRPR_TT_I %ropr  Ro_wrtt
!!# ;
!!# splash_fprs :
!!#     tWRFPRS_I %ropr  Ro_wrfprs
!!# ;
!!# 
!!# splash_cwp :
!!#     tWRPR_CWP_I %ropr  Ro_wrcwp 
!!# ;
!!# 
!!# splash_pstate :
!!#     tWRPR_PSTATE_I %ropr  Ro_wrpstate
!!# ;
!!# 
!!# splash_hpstate :
!!#     tWRHPR_HPSTATE_I %ropr  Ro_wrhpstate
!!# ;
!!# 
!!# trap_asi : 
!!#     asi_load_r %ropr  Ro_traps_asi
!!# ;
!!# 
!!# wrasi : tWRASI_I %ropr  Ro_wrasi_i
!!# ;
!!# reg_tcc : tTcc_R %ropr  Ro_traps_r
!!#      { 
!!#      if (label%2) {
!!#         IJ_printf("diag.j", 530, th0, "\totherw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      } else {
!!#         IJ_printf("diag.j", 532, th0, "\tinvalw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      }
!!#      }
!!# ;
!!# 
!!# tcc :
!!#      tTcc_I %ropr  Ro_traps_i  
!!#      | reg_tcc
!!# 
!!# ;
!!# 
!!# ldst_excp : 
!!#         ldds %ropr  Ro_nontrap_ld  |
!!#         load_r %ropr  Ro_nontrap_ld  |
!!#         load_i %ropr  Ro_nontrap_ld 
!!# 
!!# ;
!!# 
!!# ldstasi_excp : 
!!#         asi_load_i %ropr  Ro_nontrap_ldasi
!!# ;
!!# ldstasi_excp_z : 
!!#          tLDUWA_R %ropr  Ro_nontrap_ldasi_z
!!# ;
!!# 
!!# ldds: tLDD_R | tLDD_I | tLDDA_I  | tLDDA_R
!!# ;
!!# 
!!# stores:
!!#     stds %ropr  Ro_ldst_ptr |
!!#     stfs %ropr  Ro_ldst_ptr |
!!#     stqfs %ropr  Ro_ldst_ptr |
!!#     sts %ropr  Ro_ldst_ptr 
!!# ;
!!# stds:  tSTDA_R | tSTDA_I | tSTD_R | tSTD_I | tSTDF_R | tSTDF_I
!!# ;
!!# stfs: tSTF_R | tSTF_I
!!# ;
!!# stqfs: tSTQF_R | tSTQF_I
!!# ;
!!# sts:   tSTB_R | tSTB_I | tSTH_R | tSTH_I | tSTW_R | tSTW_I | tSTX_R | tSTX_I
!!# 
!!# ;
!!# 
!!# load_r: tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDQF_R 
!!# ;
!!# 
!!# load_i: tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDX_I 
!!#         | tLDQFA_I 
!!# ;
!!# 
!!# asi_load_i: tLDSBA_I | tLDSHA_I | tLDSWA_I | tLDUBA_I | tLDUHA_I | tLDXA_I
!!# ;
!!# 
!!# asi_load_r:tLDSBA_R | tLDSHA_R | tLDSWA_R | tLDUBA_R | tLDUHA_R | tLDXA_R 
!!# ;
!!# 
!!# asi_store_i: tSTBA_I | tSTHA_I | tSTWA_I | tSTXA_I
!!# ;
!!# 
!!# asi_store_r: tSTBA_R | tSTHA_R | tSTWA_R | tSTXA_R
!!# ;
!!# 
!!# alu :
!!#      tADDcc_R | tADDcc_I | tADDCcc_I | tANDNcc_R |
!!#      tMULX_R | tUMULcc_R | tUMULcc_I | tSDIVcc_I | tSDIVcc_R |
!!#      tSMULcc_R | tSDIVX_R |  tUDIVX_R |
!!#      tUDIVX_I | tFDIVs | tFDIVd | tFDIVq | tSWAP_I %ropr  Ro_ldst_ptr |
!!#      tSWAPA_R %ropr  Ro_ldst_ptr | tCASA_I %ropr  Ro_ldst_ptr | tPOPC_I |
!!#      tFSQRTq | tFSQRTd | tFsMULd | tFdMULq | tFqTOi | tFNEGd | tFONES
!!# ;
!!# 
!!# br :     tBA | tBLE | tBGE | tBL | tBGU  | tBLEU | tBN | tBNE | tBE | tBG |
!!#          tBCC | tBCS | tBPOS | tBNEG | tBVC | tBVS | tBPA | tBPN | tBPNE |
!!#          tBPE | tBPG | tBPLE | tBPGE | tBPL | tBPGU | tBPLEU | tBPCC | tBPCS |
!!#          tBPPOS | tBPNEG | tBPVC | tBPVS
!!# ;
!!# 
!!# branches : br | br_badelay | br_longdelay;
!!# 
!!# br_badelay : tRD_SOFTINT_REG 
!!#     {
!!#         IJ_printf("diag.j", 616, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 617,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 618,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 619, th0, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 623, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 624,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 626,1, th0, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 628, th0, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 630, th0, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 635, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 636,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             //IJ_printf(th0, "\t.xword 0x%rx\t! Random illegal ?\n", Rv_illtrap);
!!#             IJ_printf("diag.j", 639, th0, "\tilltrap\n");
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 641,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 643,1, th0, ijdefault, tFSQRTd, tLDQF_R, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 650, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 651,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 655, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 656,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 660, th0, "DS_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 661, th0, "\tnop\n\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 662, th0, "\tjmp %%g2\n");
!!#     }
!!# ;
!!# 
!!# 
!!# 
!!# %%
!!# %%section cbfunc
!!# 
!!# %%
!!# %%section stat
!!# 
!!# %%
#endif

