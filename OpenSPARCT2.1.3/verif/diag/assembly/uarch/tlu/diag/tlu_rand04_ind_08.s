/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_08.s
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
#define IMMU_SKIP_IF_NO_TTE
#define TRAP_SECT_HV_ALSO
#define DMMU_SKIP_IF_NO_TTE

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
	mov 0x32, %r14
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
	mov 0xb0, %r14
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
	mov 0x34, %r14
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
	mov 0x35, %r14
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
	mov 0x30, %r30
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
	.word 0x83500000  ! 1: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x8d90224a  ! 2: WRPR_PSTATE_I	wrpr	%r0, 0x024a, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 3: LDX_R	ldx	[%r31 + %r0], %r1
DS_0:
	.word 0x20800001  ! 5: BN	bn,a	<label_0x1>
	illtrap
	.word 0x87a00552  ! 5: FSQRTd	fsqrt	
	.word 0x9ba20829  ! 4: FADDs	fadds	%f8, %f9, %f13
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 5: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c55  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x0c55, %pstate
	.word 0x81982707  ! 7: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0707, %hpstate
	.word 0x87802004  ! 8: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x99902001  ! 9: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
DS_1:
	.word 0x20800001  ! 11: BN	bn,a	<label_0x1>
	.word 0xc535400c  ! 11: STQF_R	-	%f2, [%r12, %r21]
	normalw
	.word 0xb7458000  ! 10: RD_SOFTINT_REG	rd	%softint, %r27
	.word 0xf68fe030  ! 11: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r27
	.word 0x3c800001  ! 12: BPOS	bpos,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0xf64fc000  ! 14: LDSB_R	ldsb	[%r31 + %r0], %r27
change_to_randtl_2:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 15: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xf6d004a0  ! 16: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r27
	.word 0xf697e030  ! 17: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r27
	.word 0xf68008a0  ! 18: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
	.word 0xf6d004a0  ! 19: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r27
splash_lsu_3:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 20: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf61fc000  ! 21: LDD_R	ldd	[%r31 + %r0], %r27
	.word 0xf6c804a0  ! 22: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r27
	.word 0xf797e001  ! 23: LDQFA_I	-	[%r31, 0x0001], %f27
tagged_4:
	tsubcctv %r7, 0x17d2, %r10
	.word 0xf607e001  ! 24: LDUW_I	lduw	[%r31 + 0x0001], %r27
	.word 0x81982f17  ! 25: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f17, %hpstate
	.word 0x91464000  ! 26: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0xad504000  ! 27: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xec9fc020  ! 28: LDDA_R	ldda	[%r31, %r0] 0x01, %r22
	.word 0xec8fe010  ! 29: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r22
DS_5:
	.word 0x32800001  ! 31: BNE	bne,a	<label_0x1>
	.word 0xcd328007  ! 31: STQF_R	-	%f6, [%r7, %r10]
	normalw
	.word 0x97458000  ! 30: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x93902006  ! 31: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93508000  ! 32: RDPR_TSTATE	rdpr	%tstate, %r9
splash_lsu_6:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 33: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 34: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2800c60  ! 35: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r9
	.word 0x93902001  ! 36: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 37: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982c8c  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8c, %hpstate
	.word 0xd28008a0  ! 39: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x879023fc  ! 40: WRPR_TT_I	wrpr	%r0, 0x03fc, %tt
	.word 0xd247c000  ! 41: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xd28008a0  ! 42: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 43: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x87802014  ! 44: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa1902008  ! 45: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd317c000  ! 46: LDQF_R	-	[%r31, %r0], %f9
	.word 0x91d02031  ! 47: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87802089  ! 48: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d802000  ! 49: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xb151c000  ! 50: RDPR_TL	rdpr	%tl, %r24
	.word 0x91d02031  ! 51: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_7:
	.word 0x34800001  ! 53: BG	bg,a	<label_0x1>
	pdist %f20, %f6, %f22
	.word 0x81b6430a  ! 52: ALLIGNADDRESS	alignaddr	%r25, %r10, %r0
	.word 0xa1902005  ! 53: WRPR_GL_I	wrpr	%r0, 0x0005, %-
tagged_8:
	tsubcctv %r24, 0x10c5, %r12
	.word 0xc007e001  ! 54: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x81982b9d  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9d, %hpstate
tagged_9:
	taddcctv %r12, 0x1f57, %r8
	.word 0xc007e001  ! 56: LDUW_I	lduw	[%r31 + 0x0001], %r0
splash_lsu_10:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 57: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02034  ! 58: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xc0d00e60  ! 59: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r0
	.word 0x8198239f  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039f, %hpstate
	.word 0xad494000  ! 61: RDHPR_HTBA	rdhpr	%htba, %r22
splash_tba_11:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 62: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d90280a  ! 63: WRPR_PSTATE_I	wrpr	%r0, 0x080a, %pstate
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 64: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xec5fc000  ! 65: LDX_R	ldx	[%r31 + %r0], %r22
	.word 0x8198265c  ! 66: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065c, %hpstate
	.word 0xec1fe001  ! 67: LDD_I	ldd	[%r31 + 0x0001], %r22
tagged_12:
	tsubcctv %r4, 0x13af, %r11
	.word 0xec07e001  ! 68: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0xec800b20  ! 69: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r22
	.word 0xaf540000  ! 70: RDPR_GL	rdpr	%-, %r23
	ta	T_CHANGE_PRIV	! macro
	.word 0xee0fc000  ! 72: LDUB_R	ldub	[%r31 + %r0], %r23
splash_tba_13:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 73: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_14:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182e001  ! 74: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0xeed004a0  ! 75: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r23
	.word 0x8198218c  ! 76: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018c, %hpstate
	.word 0x8f902002  ! 78: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01973  ! 77: FqTOd	dis not found

	.word 0xd84fe001  ! 78: LDSB_I	ldsb	[%r31 + 0x0001], %r12
splash_htba_16:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87508000  ! 80: RDPR_TSTATE	rdpr	%tstate, %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 81: LDX_R	ldx	[%r31 + %r0], %r3
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 82: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6d7e010  ! 83: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 84: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x8d802004  ! 85: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902002  ! 86: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x97508000  ! 87: RDPR_TSTATE	rdpr	%tstate, %r11
splash_tba_17:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 88: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 89: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x87802088  ! 90: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902005  ! 91: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd6c804a0  ! 92: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
DS_18:
	.word 0x22800001  ! 94: BE	be,a	<label_0x1>
	.word 0xdb30e001  ! 94: STQF_I	-	%f13, [0x0001, %r3]
	normalw
	.word 0xaf458000  ! 93: RD_SOFTINT_REG	rd	%softint, %r23
	.word 0x93902002  ! 94: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_19:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 95: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b5  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xee0fc000  ! 97: LDUB_R	ldub	[%r31 + %r0], %r23
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902346  ! 99: WRPR_TT_I	wrpr	%r0, 0x0346, %tt
	.word 0x34700001  ! 100: BPG	<illegal instruction>
	.word 0x8790226d  ! 101: WRPR_TT_I	wrpr	%r0, 0x026d, %tt
	.word 0x93902002  ! 102: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x26700001  ! 103: BPL	<illegal instruction>
	.word 0xeed00e60  ! 104: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r23
	.word 0xee8008a0  ! 105: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0x8d902487  ! 106: WRPR_PSTATE_I	wrpr	%r0, 0x0487, %pstate
DS_20:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 107: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_21:
	.word 0x34800001  ! 109: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 109: BNE	bne,a	<label_0x1>
	.word 0xcd10c018  ! 109: LDQF_R	-	[%r3, %r24], %f6
	.word 0x81a04825  ! 108: FADDs	fadds	%f1, %f5, %f0
	.word 0xc0c004a0  ! 109: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902000  ! 111: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902814  ! 112: WRPR_PSTATE_I	wrpr	%r0, 0x0814, %pstate
splash_cmpr_22:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 113: WR_STICK_REG_I	wr	%r7, 0x0001, %-
DS_23:
	.word 0x32800001  ! 115: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 115: BN	bn,a	<label_0x1>
	.word 0x89a00546  ! 115: FSQRTd	fsqrt	
	.word 0x9ba48827  ! 114: FADDs	fadds	%f18, %f7, %f13
tagged_24:
	tsubcctv %r2, 0x1eba, %r9
	.word 0xda07e001  ! 115: LDUW_I	lduw	[%r31 + 0x0001], %r13
splash_tba_25:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 116: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_26:
	tsubcctv %r23, 0x1d75, %r6
	.word 0xda07e001  ! 117: LDUW_I	lduw	[%r31 + 0x0001], %r13
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 118: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87802088  ! 119: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xdadfe000  ! 120: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0x91d020b2  ! 121: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x91d020b0  ! 122: Tcc_I	ta	icc_or_xcc, %r0 + 176
	.word 0x87802010  ! 123: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x99902001  ! 124: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_lsu_27:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 125: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda8008a0  ! 126: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8750c000  ! 127: RDPR_TT	rdpr	%tt, %r3
	.word 0x87802004  ! 128: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x24700001  ! 129: BPLE	<illegal instruction>
DS_28:
	.word 0x22800001  ! 131: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 130: SAVE_R	save	%r31, %r0, %r31
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 131: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xc617e001  ! 132: LDUH_I	lduh	[%r31 + 0x0001], %r3
	.word 0x32800001  ! 133: BNE	bne,a	<label_0x1>
	.word 0x91d02032  ! 134: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc6cfe000  ! 135: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r3
	.word 0x8780204f  ! 136: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xc6cfe000  ! 137: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r3
	.word 0x9b51c000  ! 138: RDPR_TL	rdpr	%tl, %r13
	.word 0x8d902c59  ! 139: WRPR_PSTATE_I	wrpr	%r0, 0x0c59, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 140: LDX_R	ldx	[%r31 + %r0], %r13
tagged_29:
	taddcctv %r1, 0x1f1e, %r15
	.word 0xda07e001  ! 141: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x91d020b2  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_htba_30:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 143: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x83504000  ! 144: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0xc29004a0  ! 145: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 146: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x8198200d  ! 147: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000d, %hpstate
splash_tba_31:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 148: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 150: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99a01962  ! 149: FqTOd	dis not found

	.word 0x97500000  ! 150: RDPR_TPC	rdpr	%tpc, %r11
splash_lsu_33:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 151: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa9540000  ! 152: RDPR_GL	rdpr	%-, %r20
	.word 0x3e700001  ! 153: BPVC	<illegal instruction>
	.word 0x87902125  ! 154: WRPR_TT_I	wrpr	%r0, 0x0125, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe85fc000  ! 155: LDX_R	ldx	[%r31 + %r0], %r20
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe85fc000  ! 156: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x879021c5  ! 157: WRPR_TT_I	wrpr	%r0, 0x01c5, %tt
splash_lsu_34:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879020ba  ! 159: WRPR_TT_I	wrpr	%r0, 0x00ba, %tt
	.word 0xe88008a0  ! 160: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xe89fc020  ! 161: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x879023ac  ! 162: WRPR_TT_I	wrpr	%r0, 0x03ac, %tt
DS_35:
	.word 0x22800001  ! 164: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 163: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902000  ! 165: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xaba0196c  ! 164: FqTOd	dis not found

	.word 0xea8008a0  ! 165: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0x81982e0c  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0c, %hpstate
	.word 0x8d902015  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x0015, %pstate
	.word 0x87802004  ! 168: WRASI_I	wr	%r0, 0x0004, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xea5fc000  ! 169: LDX_R	ldx	[%r31 + %r0], %r21
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 170: LDX_R	ldx	[%r31 + %r0], %r21
splash_lsu_37:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 171: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
splash_lsu_38:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 174: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_39:
	.word 0x20800001  ! 176: BN	bn,a	<label_0x1>
	allclean
	.word 0x99b0c304  ! 175: ALLIGNADDRESS	alignaddr	%r3, %r4, %r12
splash_tba_40:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 176: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802080  ! 177: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa190200c  ! 178: WRPR_GL_I	wrpr	%r0, 0x000c, %-
tagged_41:
	taddcctv %r1, 0x1a80, %r24
	.word 0xd807e001  ! 179: LDUW_I	lduw	[%r31 + 0x0001], %r12
DS_42:
	.word 0x22800001  ! 181: BE	be,a	<label_0x1>
	.word 0xd136a001  ! 181: STQF_I	-	%f8, [0x0001, %r26]
	normalw
	.word 0x99458000  ! 180: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd8cfe010  ! 181: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r12
splash_lsu_43:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 182: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 183: SIR	sir	0x0001
DS_44:
	.word 0x34800001  ! 185: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 184: RESTORE_R	restore	%r31, %r0, %r31
DS_45:
	.word 0x34800001  ! 186: BG	bg,a	<label_0x1>
	.word 0x34800001  ! 186: BG	bg,a	<label_0x1>
	.word 0xf515001b  ! 186: LDQF_R	-	[%r20, %r27], %f26
	.word 0xa9a00821  ! 185: FADDs	fadds	%f0, %f1, %f20
	.word 0x20700001  ! 186: BPN	<illegal instruction>
	.word 0xa190200a  ! 187: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_tba_46:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 188: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 189: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 190: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_47:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 191: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 192: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982cd6  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd6, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe85fc000  ! 194: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x9f802001  ! 195: SIR	sir	0x0001
	.word 0xe8c004a0  ! 196: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
splash_tba_48:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 197: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 198: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_49:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 199: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_50:
	tsubcctv %r14, 0x1c38, %r3
	.word 0xe807e001  ! 200: LDUW_I	lduw	[%r31 + 0x0001], %r20
splash_lsu_51:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 201: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 202: WRASI_I	wr	%r0, 0x0014, %asi
splash_htba_52:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 203: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_53:
	.word 0x22800001  ! 205: BE	be,a	<label_0x1>
	.word 0x32800001  ! 205: BNE	bne,a	<label_0x1>
	.word 0x8da00559  ! 205: FSQRTd	fsqrt	
	.word 0xa3a44826  ! 204: FADDs	fadds	%f17, %f6, %f17
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 205: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x81460000  ! 206: RD_STICK_REG	stbar
	.word 0x8790234c  ! 207: WRPR_TT_I	wrpr	%r0, 0x034c, %tt
	.word 0x8d90224c  ! 208: WRPR_PSTATE_I	wrpr	%r0, 0x024c, %pstate
	.word 0x91d020b0  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 176
	.word 0xe2800b60  ! 210: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r17
	.word 0xe21fc000  ! 211: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0x879020da  ! 212: WRPR_TT_I	wrpr	%r0, 0x00da, %tt
tagged_54:
	tsubcctv %r13, 0x1f3f, %r22
	.word 0xe207e001  ! 213: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe2800b80  ! 214: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r17
	.word 0xa190200f  ! 215: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_cmpr_55:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 217: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1852001  ! 216: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	.word 0xa190200d  ! 217: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe2d7e020  ! 219: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r17
	.word 0xe28008a0  ! 220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
change_to_randtl_56:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 221: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe28008a0  ! 222: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
splash_tba_57:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 223: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe25fc000  ! 224: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x81982fd6  ! 225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd6, %hpstate
	.word 0x8d902810  ! 226: WRPR_PSTATE_I	wrpr	%r0, 0x0810, %pstate
	.word 0x81982b0d  ! 227: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0d, %hpstate
splash_lsu_58:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 228: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2d004a0  ! 229: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
splash_tba_59:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 230: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_60:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 231: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x896b0010  ! 232: SDIVX_R	sdivx	%r12, %r16, %r4
DS_61:
	.word 0x32800001  ! 234: BNE	bne,a	<label_0x1>
	pdist %f28, %f14, %f4
	.word 0x99b1c31b  ! 233: ALLIGNADDRESS	alignaddr	%r7, %r27, %r12
	.word 0xd8d7e020  ! 234: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
tagged_62:
	tsubcctv %r25, 0x102c, %r7
	.word 0xd807e001  ! 235: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x91d02034  ! 236: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0xd88008a0  ! 238: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x91d02033  ! 239: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 241: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd897e010  ! 242: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r12
	.word 0x8d902a98  ! 243: WRPR_PSTATE_I	wrpr	%r0, 0x0a98, %pstate
	.word 0xd8dfe030  ! 244: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r12
DS_63:
	.word 0x22800001  ! 246: BE	be,a	<label_0x1>
	.word 0xcb32401b  ! 246: STQF_R	-	%f5, [%r27, %r9]
	normalw
	.word 0xab458000  ! 245: RD_SOFTINT_REG	rd	%softint, %r21
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 246: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0x879021ee  ! 247: WRPR_TT_I	wrpr	%r0, 0x01ee, %tt
	.word 0xea47e001  ! 248: LDSW_I	ldsw	[%r31 + 0x0001], %r21
	.word 0x91d02032  ! 249: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xea8008a0  ! 250: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0xea4fc000  ! 251: LDSB_R	ldsb	[%r31 + %r0], %r21
	.word 0x879022c3  ! 252: WRPR_TT_I	wrpr	%r0, 0x02c3, %tt
	.word 0xea17e001  ! 253: LDUH_I	lduh	[%r31 + 0x0001], %r21
	.word 0xeadfe000  ! 254: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r21
splash_cmpr_64:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184a001  ! 255: WR_STICK_REG_I	wr	%r18, 0x0001, %-
splash_htba_65:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 256: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xea17c000  ! 257: LDUH_R	lduh	[%r31 + %r0], %r21
	.word 0x87802080  ! 258: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xea8008a0  ! 259: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0x8d90209e  ! 260: WRPR_PSTATE_I	wrpr	%r0, 0x009e, %pstate
splash_tba_66:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 261: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xea8008a0  ! 262: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0x93902005  ! 263: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902003  ! 264: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87802063  ! 265: WRASI_I	wr	%r0, 0x0063, %asi
DS_67:
	.word 0x34800001  ! 267: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 266: SAVE_R	save	%r31, %r0, %r31
	.word 0xea47c000  ! 267: LDSW_R	ldsw	[%r31 + %r0], %r21
	.word 0xeb27e001  ! 268: STF_I	st	%f21, [0x0001, %r31]
	.word 0x8780201c  ! 269: WRASI_I	wr	%r0, 0x001c, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xea5fc000  ! 270: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0x87802016  ! 271: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81508000  ! 272: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0xc0d804a0  ! 273: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
	.word 0x93902001  ! 274: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 275: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_68:
	.word 0x32800001  ! 277: BNE	bne,a	<label_0x1>
	.word 0xe131e001  ! 277: STQF_I	-	%f16, [0x0001, %r7]
	normalw
	.word 0xab458000  ! 276: RD_SOFTINT_REG	rd	%softint, %r21
	.word 0xea8008a0  ! 277: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0x8d902e44  ! 278: WRPR_PSTATE_I	wrpr	%r0, 0x0e44, %pstate
	.word 0x93902003  ! 279: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_69:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 280: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xea5fc000  ! 281: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0xeb3fe001  ! 282: STDF_I	std	%f21, [0x0001, %r31]
	.word 0x8d902c02  ! 283: WRPR_PSTATE_I	wrpr	%r0, 0x0c02, %pstate
	.word 0x8198225c  ! 284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025c, %hpstate
splash_tba_70:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 285: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_71:
	taddcctv %r5, 0x14c3, %r4
	.word 0xea07e001  ! 286: LDUW_I	lduw	[%r31 + 0x0001], %r21
	.word 0x8d902a16  ! 287: WRPR_PSTATE_I	wrpr	%r0, 0x0a16, %pstate
DS_72:
	.word 0x22800001  ! 289: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 288: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d90204c  ! 289: WRPR_PSTATE_I	wrpr	%r0, 0x004c, %pstate
	.word 0x81982494  ! 290: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0494, %hpstate
	.word 0xea17e001  ! 291: LDUH_I	lduh	[%r31 + 0x0001], %r21
	.word 0x8d802000  ! 292: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802080  ! 293: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xea5fe001  ! 294: LDX_I	ldx	[%r31 + 0x0001], %r21
	.word 0xeb17c000  ! 295: LDQF_R	-	[%r31, %r0], %f21
DS_73:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 296: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
splash_tba_74:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 297: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x3c800001  ! 298: BPOS	bpos,a	<label_0x1>
	.word 0x9f802001  ! 299: SIR	sir	0x0001
	.word 0xead00e40  ! 300: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r21
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 301: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902e0f  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x0e0f, %pstate
	.word 0x8d902a0c  ! 303: WRPR_PSTATE_I	wrpr	%r0, 0x0a0c, %pstate
splash_lsu_75:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 304: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xea17c000  ! 305: LDUH_R	lduh	[%r31 + %r0], %r21
DS_76:
	.word 0x22800001  ! 307: BE	be,a	<label_0x1>
	.word 0xf1300015  ! 307: STQF_R	-	%f24, [%r21, %r0]
	normalw
	.word 0x9b458000  ! 306: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xda97e000  ! 307: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
	.word 0xda9fc020  ! 308: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	.word 0xda1fc000  ! 309: LDD_R	ldd	[%r31 + %r0], %r13
splash_lsu_77:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda9fe001  ! 311: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
DS_78:
	.word 0x22800001  ! 313: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 312: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x83d020b3  ! 313: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x8d902043  ! 314: WRPR_PSTATE_I	wrpr	%r0, 0x0043, %pstate
	.word 0xdac004a0  ! 315: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0xda8008a0  ! 316: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8d902e8e  ! 317: WRPR_PSTATE_I	wrpr	%r0, 0x0e8e, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xda5fc000  ! 318: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x93902004  ! 319: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9f802001  ! 320: SIR	sir	0x0001
	.word 0x2c800001  ! 321: BNEG	bneg,a	<label_0x1>
	.word 0x8780201c  ! 322: WRASI_I	wr	%r0, 0x001c, %asi
splash_lsu_79:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 323: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda4fc000  ! 324: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x22700001  ! 325: BPE	<illegal instruction>
	.word 0x87802014  ! 326: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93500000  ! 327: RDPR_TPC	rdpr	%tpc, %r9
splash_lsu_80:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 328: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b0  ! 329: Tcc_I	tne	icc_or_xcc, %r0 + 176
splash_tba_81:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 330: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02033  ! 331: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_tba_82:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 332: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd25fe001  ! 333: LDX_I	ldx	[%r31 + 0x0001], %r9
DS_83:
	.word 0x32800001  ! 335: BNE	bne,a	<label_0x1>
	.word 0xd5312001  ! 335: STQF_I	-	%f10, [0x0001, %r4]
	normalw
	.word 0x8b458000  ! 334: RD_SOFTINT_REG	rd	%softint, %r5
splash_tba_84:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 335: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 336: LDX_R	ldx	[%r31 + %r0], %r5
change_to_randtl_85:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 337: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xcb37e001  ! 338: STQF_I	-	%f5, [0x0001, %r31]
	.word 0x87802058  ! 339: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xca47e001  ! 340: LDSW_I	ldsw	[%r31 + 0x0001], %r5
	.word 0x91500000  ! 341: RDPR_TPC	rdpr	%tpc, %r8
	.word 0x91d02034  ! 342: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd0800ae0  ! 343: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r8
splash_tba_86:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 344: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_87:
	taddcctv %r8, 0x1044, %r20
	.word 0xd007e001  ! 345: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x93d02035  ! 346: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x91d02032  ! 347: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_88:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 348: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd047e001  ! 349: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	.word 0xd0cfe030  ! 350: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r8
	.word 0xa1902001  ! 351: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_tba_89:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 352: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 353: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd0800ba0  ! 354: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r8
	.word 0xd0d804a0  ! 355: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0x8198295c  ! 356: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095c, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 357: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8d90269d  ! 358: WRPR_PSTATE_I	wrpr	%r0, 0x069d, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd05fc000  ! 359: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xd04fc000  ! 360: LDSB_R	ldsb	[%r31 + %r0], %r8
	.word 0x99902004  ! 361: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x81460000  ! 362: RD_STICK_REG	stbar
	.word 0xd09004a0  ! 363: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0x91d020b2  ! 364: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x88834017  ! 365: ADDcc_R	addcc 	%r13, %r23, %r4
	.word 0x8d902cde  ! 366: WRPR_PSTATE_I	wrpr	%r0, 0x0cde, %pstate
DS_90:
	.word 0x22800001  ! 368: BE	be,a	<label_0x1>
	.word 0xf331a001  ! 368: STQF_I	-	%f25, [0x0001, %r6]
	normalw
	.word 0xa7458000  ! 367: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x95540000  ! 368: RDPR_GL	rdpr	%-, %r10
	.word 0x9b45c000  ! 369: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x8cfdc007  ! 370: SDIVcc_R	sdivcc 	%r23, %r7, %r6
splash_lsu_91:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 371: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_92:
	.word 0x20800001  ! 373: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 372: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81460000  ! 373: RD_STICK_REG	stbar
	.word 0x8f902000  ! 375: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89864018  ! 374: WRTICK_R	wr	%r25, %r24, %tick
	.word 0x8d902adf  ! 375: WRPR_PSTATE_I	wrpr	%r0, 0x0adf, %pstate
DS_94:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 376: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_lsu_95:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 378: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x819823d4  ! 379: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d4, %hpstate
	.word 0xcc5fe001  ! 380: LDX_I	ldx	[%r31 + 0x0001], %r6
splash_htba_96:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 381: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x2a700001  ! 382: BPCS	<illegal instruction>
splash_tba_97:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 383: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xccc004a0  ! 384: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0x87802063  ! 385: WRASI_I	wr	%r0, 0x0063, %asi
DS_98:
	.word 0x34800001  ! 387: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 386: SAVE_R	save	%r31, %r0, %r31
	.word 0xccc80e40  ! 387: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r6
	.word 0xccd804a0  ! 388: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0xccc004a0  ! 389: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0x36800001  ! 390: BGE	bge,a	<label_0x1>
	.word 0x8d802000  ! 391: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcc97e030  ! 392: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r6
	.word 0x30800001  ! 393: BA	ba,a	<label_0x1>
	.word 0xcc900e80  ! 394: LDUHA_R	lduha	[%r0, %r0] 0x74, %r6
	.word 0x91d02030  ! 395: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xcc0fe001  ! 396: LDUB_I	ldub	[%r31 + 0x0001], %r6
	.word 0xa1902009  ! 397: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xcc1fe001  ! 398: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x91d02032  ! 399: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87902127  ! 400: WRPR_TT_I	wrpr	%r0, 0x0127, %tt
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 401: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc0fe001  ! 402: LDUB_I	ldub	[%r31 + 0x0001], %r6
	.word 0x87902181  ! 403: WRPR_TT_I	wrpr	%r0, 0x0181, %tt
tagged_99:
	taddcctv %r25, 0x14f8, %r11
	.word 0xcc07e001  ! 404: LDUW_I	lduw	[%r31 + 0x0001], %r6
change_to_randtl_100:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 405: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa190200e  ! 406: WRPR_GL_I	wrpr	%r0, 0x000e, %-
tagged_101:
	taddcctv %r12, 0x1245, %r18
	.word 0xcc07e001  ! 407: LDUW_I	lduw	[%r31 + 0x0001], %r6
splash_htba_102:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 408: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902005  ! 409: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xcc07c000  ! 410: LDUW_R	lduw	[%r31 + %r0], %r6
	.word 0xcc17e001  ! 411: LDUH_I	lduh	[%r31 + 0x0001], %r6
	.word 0xcc0fc000  ! 412: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0xcc8008a0  ! 413: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
tagged_103:
	taddcctv %r5, 0x12b3, %r8
	.word 0xcc07e001  ! 414: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xa190200d  ! 415: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xcc800b20  ! 416: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r6
DS_104:
	.word 0x34800001  ! 418: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 417: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xcc9fe001  ! 418: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	.word 0x87902361  ! 419: WRPR_TT_I	wrpr	%r0, 0x0361, %tt
	.word 0x87802010  ! 420: WRASI_I	wr	%r0, 0x0010, %asi
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 421: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc97e000  ! 422: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r6
	.word 0x93902003  ! 423: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982047  ! 424: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0047, %hpstate
	.word 0xcc0fe001  ! 425: LDUB_I	ldub	[%r31 + 0x0001], %r6
tagged_105:
	taddcctv %r16, 0x1747, %r24
	.word 0xcc07e001  ! 426: LDUW_I	lduw	[%r31 + 0x0001], %r6
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 427: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 428: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x879020ff  ! 429: WRPR_TT_I	wrpr	%r0, 0x00ff, %tt
tagged_106:
	tsubcctv %r9, 0x1a29, %r6
	.word 0xcc07e001  ! 430: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xccc7e000  ! 431: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r6
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xcc5fc000  ! 432: LDX_R	ldx	[%r31 + %r0], %r6
change_to_randtl_107:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 433: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xcc07c000  ! 434: LDUW_R	lduw	[%r31 + %r0], %r6
	.word 0x8f902000  ! 436: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xad69e001  ! 435: SDIVX_I	sdivx	%r7, 0x0001, %r22
	.word 0x8745c000  ! 436: RD_TICK_CMPR_REG	rd	%-, %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 437: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0xa190200f  ! 438: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d802004  ! 439: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc68008a0  ! 440: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
splash_cmpr_109:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 442: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186e001  ! 441: WR_STICK_REG_I	wr	%r27, 0x0001, %-
splash_lsu_110:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 442: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_111:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 443: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc647c000  ! 444: LDSW_R	ldsw	[%r31 + %r0], %r3
	.word 0x89a01a66  ! 445: FqTOi	fqtoi	
	.word 0x8d90204d  ! 446: WRPR_PSTATE_I	wrpr	%r0, 0x004d, %pstate
	.word 0xc8d80e40  ! 447: LDXA_R	ldxa	[%r0, %r0] 0x72, %r4
	.word 0x81982a95  ! 448: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a95, %hpstate
	.word 0x93902003  ! 449: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802004  ! 450: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902006  ! 451: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902885  ! 452: WRPR_PSTATE_I	wrpr	%r0, 0x0885, %pstate
	.word 0xc8800b40  ! 453: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r4
	.word 0x8d902656  ! 454: WRPR_PSTATE_I	wrpr	%r0, 0x0656, %pstate
	.word 0xc85fe001  ! 455: LDX_I	ldx	[%r31 + 0x0001], %r4
	.word 0x20700001  ! 456: BPN	<illegal instruction>
DS_112:
	.word 0x20800001  ! 458: BN	bn,a	<label_0x1>
	.word 0xd3318000  ! 458: STQF_R	-	%f9, [%r0, %r6]
	normalw
	.word 0x89458000  ! 457: RD_SOFTINT_REG	rd	%softint, %r4
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 458: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb7540000  ! 459: RDPR_GL	rdpr	%-, %r27
	.word 0x93902006  ! 460: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf65fc000  ! 461: LDX_R	ldx	[%r31 + %r0], %r27
	.word 0x93902005  ! 462: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87802014  ! 463: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xf6dfe030  ! 464: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r27
	.word 0x879021ce  ! 465: WRPR_TT_I	wrpr	%r0, 0x01ce, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xa950c000  ! 467: RDPR_TT	rdpr	%tt, %r20
splash_tba_113:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 468: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902005  ! 469: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe897e030  ! 470: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r20
	.word 0xe81fc000  ! 471: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0x93902000  ! 472: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe89fc020  ! 473: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x93902001  ! 474: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe88008a0  ! 475: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
tagged_114:
	tsubcctv %r23, 0x120a, %r17
	.word 0xe807e001  ! 476: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xe937c000  ! 477: STQF_R	-	%f20, [%r0, %r31]
	.word 0x2a800001  ! 478: BCS	bcs,a	<label_0x1>
	.word 0x91d020b1  ! 479: Tcc_I	ta	icc_or_xcc, %r0 + 177
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 480: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_115:
	.word 0x34800001  ! 482: BG	bg,a	<label_0x1>
	pdist %f10, %f30, %f18
	.word 0x81b6c307  ! 481: ALLIGNADDRESS	alignaddr	%r27, %r7, %r0
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 482: LDX_R	ldx	[%r31 + %r0], %r0
DS_116:
	.word 0x20800001  ! 484: BN	bn,a	<label_0x1>
	.word 0xe9324010  ! 484: STQF_R	-	%f20, [%r16, %r9]
	normalw
	.word 0x85458000  ! 483: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc48008a0  ! 484: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x95508000  ! 485: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x81982c5c  ! 486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5c, %hpstate
	.word 0x81982757  ! 487: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0757, %hpstate
splash_lsu_117:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 488: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 490: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936ae001  ! 489: SDIVX_I	sdivx	%r11, 0x0001, %r9
	.word 0xd247e001  ! 490: LDSW_I	ldsw	[%r31 + 0x0001], %r9
	.word 0x93902002  ! 491: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_119:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 492: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd25fc000  ! 493: LDX_R	ldx	[%r31 + %r0], %r9
change_to_randtl_120:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 494: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87902045  ! 495: WRPR_TT_I	wrpr	%r0, 0x0045, %tt
splash_cmpr_121:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 497: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1832001  ! 496: WR_STICK_REG_I	wr	%r12, 0x0001, %-
splash_lsu_122:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 497: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 498: WRASI_I	wr	%r0, 0x004f, %asi
splash_tba_123:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 499: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_124:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 500: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802089  ! 501: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x3a800001  ! 502: BCC	bcc,a	<label_0x1>
tagged_125:
	taddcctv %r14, 0x1d36, %r6
	.word 0xd207e001  ! 503: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x8790225b  ! 504: WRPR_TT_I	wrpr	%r0, 0x025b, %tt
	.word 0x819827d5  ! 505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d5, %hpstate
	.word 0x91d02035  ! 506: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd29004a0  ! 507: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0x81982fd7  ! 508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd7, %hpstate
DS_126:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 509: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_lsu_127:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 510: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a800001  ! 511: BCC	bcc,a	<label_0x1>
splash_lsu_128:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 512: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd297e010  ! 513: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
splash_tba_129:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 514: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902000  ! 515: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902200  ! 517: WRPR_PSTATE_I	wrpr	%r0, 0x0200, %pstate
	.word 0xa190200d  ! 518: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa190200a  ! 519: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd327e001  ! 520: STF_I	st	%f9, [0x0001, %r31]
	.word 0x93902001  ! 521: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x83d02030  ! 522: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xd257c000  ! 523: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0xd2880e60  ! 524: LDUBA_R	lduba	[%r0, %r0] 0x73, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 525: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x93902004  ! 526: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd25fc000  ! 527: LDX_R	ldx	[%r31 + %r0], %r9
	ta	T_CHANGE_PRIV	! macro
splash_lsu_130:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 529: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd20fe001  ! 530: LDUB_I	ldub	[%r31 + 0x0001], %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd25fc000  ! 531: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c804a0  ! 532: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
tagged_131:
	taddcctv %r2, 0x1b34, %r7
	.word 0xd207e001  ! 533: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x8f902002  ! 535: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xad6b6001  ! 534: SDIVX_I	sdivx	%r13, 0x0001, %r22
	.word 0xec77c010  ! 535: STX_R	stx	%r22, [%r31 + %r16]
	.word 0x81982a1f  ! 536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1f, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 537: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_133:
	taddcctv %r8, 0x18a6, %r5
	.word 0xec07e001  ! 538: LDUW_I	lduw	[%r31 + 0x0001], %r22
DS_134:
	.word 0x34800001  ! 540: BG	bg,a	<label_0x1>
	.word 0xf3306001  ! 540: STQF_I	-	%f25, [0x0001, %r1]
	normalw
	.word 0x9b458000  ! 539: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x81982ecd  ! 540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecd, %hpstate
	.word 0x81982955  ! 541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0955, %hpstate
	.word 0x8f902002  ! 543: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89804004  ! 542: WRTICK_R	wr	%r1, %r4, %tick
tagged_136:
	tsubcctv %r8, 0x15ad, %r22
	.word 0xda07e001  ! 543: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda47e001  ! 544: LDSW_I	ldsw	[%r31 + 0x0001], %r13
splash_lsu_137:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 545: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 546: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902005  ! 547: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_tba_138:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 548: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902000  ! 549: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x20700001  ! 550: BPN	<illegal instruction>
	.word 0xda17e001  ! 551: LDUH_I	lduh	[%r31 + 0x0001], %r13
	.word 0xdad004a0  ! 552: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
splash_tba_139:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 553: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_140:
	tsubcctv %r5, 0x1dea, %r16
	.word 0xda07e001  ! 554: LDUW_I	lduw	[%r31 + 0x0001], %r13
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 555: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb27e001  ! 556: STF_I	st	%f13, [0x0001, %r31]
	.word 0xdac00e60  ! 557: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r13
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 558: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_141:
	taddcctv %r17, 0x1bd3, %r11
	.word 0xda07e001  ! 559: LDUW_I	lduw	[%r31 + 0x0001], %r13
tagged_142:
	tsubcctv %r20, 0x1f64, %r8
	.word 0xda07e001  ! 560: LDUW_I	lduw	[%r31 + 0x0001], %r13
DS_143:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 561: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8d902c17  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x0c17, %pstate
tagged_144:
	tsubcctv %r25, 0x1f11, %r22
	.word 0xda07e001  ! 563: LDUW_I	lduw	[%r31 + 0x0001], %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0xda880e40  ! 565: LDUBA_R	lduba	[%r0, %r0] 0x72, %r13
tagged_145:
	taddcctv %r1, 0x1249, %r8
	.word 0xda07e001  ! 566: LDUW_I	lduw	[%r31 + 0x0001], %r13
tagged_146:
	tsubcctv %r25, 0x1cce, %r4
	.word 0xda07e001  ! 567: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda47e001  ! 568: LDSW_I	ldsw	[%r31 + 0x0001], %r13
	.word 0x93d02030  ! 569: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x8d508000  ! 570: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0xcc57e001  ! 571: LDSH_I	ldsh	[%r31 + 0x0001], %r6
splash_htba_147:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 572: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200d  ! 573: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d802000  ! 574: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d020b2  ! 575: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_htba_148:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 576: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902813  ! 577: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
splash_lsu_149:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 578: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xcc5fc000  ! 579: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x879022d7  ! 580: WRPR_TT_I	wrpr	%r0, 0x02d7, %tt
	.word 0xcc47e001  ! 581: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	.word 0xccbfe001  ! 582: STDA_I	stda	%r6, [%r31 + 0x0001] %asi
	.word 0x87902039  ! 583: WRPR_TT_I	wrpr	%r0, 0x0039, %tt
	.word 0x8d902ccf  ! 584: WRPR_PSTATE_I	wrpr	%r0, 0x0ccf, %pstate
	.word 0xcc9fc020  ! 585: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x9f802001  ! 586: SIR	sir	0x0001
splash_lsu_150:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 587: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_151:
	.word 0x34800001  ! 589: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 589: BNE	bne,a	<label_0x1>
	.word 0xd3144014  ! 589: LDQF_R	-	[%r17, %r20], %f9
	.word 0xb7a4c822  ! 588: FADDs	fadds	%f19, %f2, %f27
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf65fc000  ! 591: LDX_R	ldx	[%r31 + %r0], %r27
	.word 0x8790208b  ! 592: WRPR_TT_I	wrpr	%r0, 0x008b, %tt
	.word 0x87902399  ! 593: WRPR_TT_I	wrpr	%r0, 0x0399, %tt
	.word 0xa1902001  ! 594: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xf6d7e010  ! 595: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r27
	.word 0xf6800c00  ! 596: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r27
	ta	T_CHANGE_HPRIV	! macro
	.word 0x30800001  ! 598: BA	ba,a	<label_0x1>
	.word 0xf717c000  ! 599: LDQF_R	-	[%r31, %r0], %f27
	.word 0xf647e001  ! 600: LDSW_I	ldsw	[%r31 + 0x0001], %r27
DS_152:
	.word 0x22800001  ! 602: BE	be,a	<label_0x1>
	illtrap
	.word 0x97a0054a  ! 602: FSQRTd	fsqrt	
	.word 0xa7a44824  ! 601: FADDs	fadds	%f17, %f4, %f19
	.word 0xa1902001  ! 602: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x38800001  ! 603: BGU	bgu,a	<label_0x1>
	.word 0xa1902005  ! 604: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902699  ! 605: WRPR_PSTATE_I	wrpr	%r0, 0x0699, %pstate
	.word 0xab50c000  ! 606: RDPR_TT	rdpr	%tt, %r21
	.word 0x91d02033  ! 607: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xea57e001  ! 608: LDSH_I	ldsh	[%r31 + 0x0001], %r21
splash_lsu_153:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 609: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902a5c  ! 610: WRPR_PSTATE_I	wrpr	%r0, 0x0a5c, %pstate
	.word 0x8d902c4e  ! 611: WRPR_PSTATE_I	wrpr	%r0, 0x0c4e, %pstate
	.word 0x87802016  ! 612: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81982057  ! 613: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0057, %hpstate
	.word 0xea17e001  ! 614: LDUH_I	lduh	[%r31 + 0x0001], %r21
	.word 0x87802058  ! 615: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x9f802001  ! 616: SIR	sir	0x0001
	.word 0x81982e1f  ! 617: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1f, %hpstate
	.word 0x87902327  ! 618: WRPR_TT_I	wrpr	%r0, 0x0327, %tt
	.word 0x80c66001  ! 619: ADDCcc_I	addccc 	%r25, 0x0001, %r0
	.word 0xc0cfe000  ! 620: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r0
	.word 0x93902007  ! 621: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 622: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc0800ba0  ! 623: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r0
splash_lsu_154:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 624: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc017e001  ! 625: LDUH_I	lduh	[%r31 + 0x0001], %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902000  ! 627: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_lsu_155:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 628: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x96adc016  ! 629: ANDNcc_R	andncc 	%r23, %r22, %r11
	.word 0x93902003  ! 630: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_156:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 631: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 632: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_157:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 634: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1836001  ! 633: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x819821c7  ! 634: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c7, %hpstate
DS_158:
	.word 0x34800001  ! 636: BG	bg,a	<label_0x1>
	illtrap
	.word 0xc3108005  ! 636: LDQF_R	-	[%r2, %r5], %f1
	.word 0xada0c833  ! 635: FADDs	fadds	%f3, %f19, %f22
DS_159:
	.word 0x20800001  ! 637: BN	bn,a	<label_0x1>
	allclean
	.word 0x8fb30302  ! 636: ALLIGNADDRESS	alignaddr	%r12, %r2, %r7
splash_lsu_160:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 637: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 638: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa190200e  ! 639: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x81982c54  ! 640: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c54, %hpstate
	.word 0xce4fe001  ! 641: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	.word 0x93902005  ! 642: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x26700001  ! 643: BPL	<illegal instruction>
	.word 0x91d02033  ! 644: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xce9fe001  ! 645: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	.word 0x20800001  ! 646: BN	bn,a	<label_0x1>
	.word 0x93902003  ! 647: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x28700001  ! 648: BPLEU	<illegal instruction>
	.word 0xa1902008  ! 649: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xce800b80  ! 650: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r7
splash_tba_161:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 651: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_162:
	tsubcctv %r22, 0x1bc9, %r8
	.word 0xce07e001  ! 652: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x99a34dc4  ! 653: FdMULq	fdmulq	
	.word 0x3a800001  ! 654: BCC	bcc,a	<label_0x1>
	.word 0xa190200f  ! 655: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa190200d  ! 656: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_htba_163:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 657: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d90205e  ! 658: WRPR_PSTATE_I	wrpr	%r0, 0x005e, %pstate
	.word 0xd8d00e40  ! 659: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r12
	.word 0xa1902009  ! 660: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87902211  ! 661: WRPR_TT_I	wrpr	%r0, 0x0211, %tt
	.word 0xd8cfe000  ! 662: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r12
	.word 0x91d020b3  ! 663: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x81982d84  ! 664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d84, %hpstate
	.word 0x87802004  ! 665: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93d020b4  ! 666: Tcc_I	tne	icc_or_xcc, %r0 + 180
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 667: LDX_R	ldx	[%r31 + %r0], %r12
splash_cmpr_164:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb185a001  ! 668: WR_STICK_REG_I	wr	%r22, 0x0001, %-
	.word 0xd80fe001  ! 669: LDUB_I	ldub	[%r31 + 0x0001], %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 670: LDX_R	ldx	[%r31 + %r0], %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 671: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d902cd8  ! 672: WRPR_PSTATE_I	wrpr	%r0, 0x0cd8, %pstate
splash_lsu_165:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 673: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 674: RD_STICK_REG	stbar
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
splash_lsu_166:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 677: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 678: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8198234e  ! 679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034e, %hpstate
splash_cmpr_167:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 681: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182e001  ! 680: WR_STICK_REG_I	wr	%r11, 0x0001, %-
splash_htba_168:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 681: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902005  ! 682: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_169:
	.word 0x22800001  ! 684: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 683: SAVE_R	save	%r31, %r0, %r31
	.word 0x8790232a  ! 684: WRPR_TT_I	wrpr	%r0, 0x032a, %tt
	.word 0xd897e030  ! 685: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
DS_170:
	.word 0x20800001  ! 687: BN	bn,a	<label_0x1>
	illtrap
	.word 0xc5128011  ! 687: LDQF_R	-	[%r10, %r17], %f2
	.word 0x95a48830  ! 686: FADDs	fadds	%f18, %f16, %f10
	.word 0x87802016  ! 687: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8198294f  ! 688: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094f, %hpstate
	.word 0x93902004  ! 689: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x99902002  ! 690: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xd48fe020  ! 691: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0xd49fe001  ! 692: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0x3e700001  ! 693: BPVC	<illegal instruction>
	.word 0xd447e001  ! 694: LDSW_I	ldsw	[%r31 + 0x0001], %r10
	.word 0x87802016  ! 695: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd417c000  ! 696: LDUH_R	lduh	[%r31 + %r0], %r10
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 697: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93b0cfe3  ! 698: FONES	fones	%f9
	.word 0x8790235d  ! 699: WRPR_TT_I	wrpr	%r0, 0x035d, %tt
tagged_171:
	taddcctv %r5, 0x13df, %r15
	.word 0xd207e001  ! 700: LDUW_I	lduw	[%r31 + 0x0001], %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0x32800001  ! 702: BNE	bne,a	<label_0x1>
	.word 0xd257c000  ! 703: LDSH_R	ldsh	[%r31 + %r0], %r9
DS_172:
	.word 0x22800001  ! 705: BE	be,a	<label_0x1>
	pdist %f10, %f18, %f16
	.word 0x8fb5c30d  ! 704: ALLIGNADDRESS	alignaddr	%r23, %r13, %r7
	.word 0x22800001  ! 705: BE	be,a	<label_0x1>
	.word 0x81982b5d  ! 706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5d, %hpstate
DS_173:
	.word 0x32800001  ! 708: BNE	bne,a	<label_0x1>
	.word 0xc934a001  ! 708: STQF_I	-	%f4, [0x0001, %r18]
	normalw
	.word 0x87458000  ! 707: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x8d902257  ! 708: WRPR_PSTATE_I	wrpr	%r0, 0x0257, %pstate
	.word 0x8d9028da  ! 709: WRPR_PSTATE_I	wrpr	%r0, 0x08da, %pstate
	.word 0xc60fc000  ! 710: LDUB_R	ldub	[%r31 + %r0], %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc65fc000  ! 711: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x93d02031  ! 712: Tcc_I	tne	icc_or_xcc, %r0 + 49
splash_lsu_174:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 713: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982307  ! 714: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
splash_tba_175:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 715: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802058  ! 716: WRASI_I	wr	%r0, 0x0058, %asi
splash_lsu_176:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 717: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_177:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 718: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 719: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc65fc000  ! 720: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x95464000  ! 721: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0x8790238b  ! 722: WRPR_TT_I	wrpr	%r0, 0x038b, %tt
splash_lsu_178:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 723: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd597e001  ! 724: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0xd597e001  ! 725: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x93902005  ! 726: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_179:
	taddcctv %r13, 0x12bd, %r15
	.word 0xd407e001  ! 727: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd49fe001  ! 728: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0x8d902c10  ! 729: WRPR_PSTATE_I	wrpr	%r0, 0x0c10, %pstate
DS_180:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 730: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8790216a  ! 732: WRPR_TT_I	wrpr	%r0, 0x016a, %tt
	.word 0xd4800ba0  ! 733: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r10
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 734: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0x9f802001  ! 735: SIR	sir	0x0001
	.word 0xa1902008  ! 736: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd4d004a0  ! 737: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0x8d902cc1  ! 738: WRPR_PSTATE_I	wrpr	%r0, 0x0cc1, %pstate
	.word 0x879022d8  ! 739: WRPR_TT_I	wrpr	%r0, 0x02d8, %tt
	.word 0x81982715  ! 740: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0715, %hpstate
	.word 0x8780201c  ! 741: WRASI_I	wr	%r0, 0x001c, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 742: LDX_R	ldx	[%r31 + %r0], %r10
	.word 0xd4800a60  ! 743: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r10
	.word 0xd457e001  ! 744: LDSH_I	ldsh	[%r31 + 0x0001], %r10
	.word 0x8d902e45  ! 745: WRPR_PSTATE_I	wrpr	%r0, 0x0e45, %pstate
	.word 0xd4d004a0  ! 746: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
splash_tba_181:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 747: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902003  ! 748: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x30800001  ! 749: BA	ba,a	<label_0x1>
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 750: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 751: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f802001  ! 752: SIR	sir	0x0001
	.word 0xd4880e60  ! 753: LDUBA_R	lduba	[%r0, %r0] 0x73, %r10
	.word 0x93d02032  ! 754: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd48008a0  ! 755: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x93902000  ! 756: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd45fc000  ! 757: LDX_R	ldx	[%r31 + %r0], %r10
DS_182:
	.word 0x22800001  ! 759: BE	be,a	<label_0x1>
	.word 0xc9328018  ! 759: STQF_R	-	%f4, [%r24, %r10]
	normalw
	.word 0x85458000  ! 758: RD_SOFTINT_REG	rd	%softint, %r2
DS_183:
	.word 0x32800001  ! 760: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 760: BNE	bne,a	<label_0x1>
	.word 0x89a00559  ! 760: FSQRTd	fsqrt	
	.word 0x93a1c824  ! 759: FADDs	fadds	%f7, %f4, %f9
	.word 0x91d02035  ! 760: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
splash_htba_184:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 762: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902003  ! 763: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902001  ! 764: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902000  ! 766: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x996ee001  ! 765: SDIVX_I	sdivx	%r27, 0x0001, %r12
	.word 0x8780201c  ! 766: WRASI_I	wr	%r0, 0x001c, %asi
	ta	T_CHANGE_PRIV	! macro
splash_lsu_186:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 768: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 769: WRASI_I	wr	%r0, 0x0089, %asi
splash_lsu_187:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 770: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_188:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 771: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_189:
	.word 0x22800001  ! 773: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 772: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x819826dc  ! 773: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06dc, %hpstate
	.word 0xd847e001  ! 774: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	.word 0x91d02032  ! 775: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_190:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 776: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 777: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 778: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 779: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd89fc020  ! 780: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0xd997e001  ! 781: LDQFA_I	-	[%r31, 0x0001], %f12
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 782: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790215e  ! 783: WRPR_TT_I	wrpr	%r0, 0x015e, %tt
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 784: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 785: SIR	sir	0x0001
	.word 0x93902000  ! 786: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_191:
	taddcctv %r5, 0x1588, %r20
	.word 0xd807e001  ! 787: LDUW_I	lduw	[%r31 + 0x0001], %r12
splash_tba_192:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 788: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd917c000  ! 789: LDQF_R	-	[%r31, %r0], %f12
splash_lsu_193:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 790: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 791: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xd88008a0  ! 792: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd8c004a0  ! 793: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0x91d02030  ! 794: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa190200d  ! 795: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd81fe001  ! 796: LDD_I	ldd	[%r31 + 0x0001], %r12
DS_194:
	.word 0x20800001  ! 798: BN	bn,a	<label_0x1>
	pdist %f14, %f8, %f30
	.word 0x93b00302  ! 797: ALLIGNADDRESS	alignaddr	%r0, %r2, %r9
	.word 0xd2800c80  ! 798: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r9
DS_195:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 799: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd2c004a0  ! 800: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 801: LDX_R	ldx	[%r31 + %r0], %r9
tagged_196:
	tsubcctv %r12, 0x109e, %r18
	.word 0xd207e001  ! 802: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd24fe001  ! 803: LDSB_I	ldsb	[%r31 + 0x0001], %r9
	.word 0x99902004  ! 804: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa1902003  ! 805: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_tba_197:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 806: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x94d22001  ! 807: UMULcc_I	umulcc 	%r8, 0x0001, %r10
	ta	T_CHANGE_HPRIV	! macro
splash_tba_198:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 809: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_199:
	taddcctv %r23, 0x1377, %r13
	.word 0xd407e001  ! 810: LDUW_I	lduw	[%r31 + 0x0001], %r10
DS_200:
	.word 0x34800001  ! 812: BG	bg,a	<label_0x1>
	pdist %f2, %f22, %f0
	.word 0x91b24316  ! 811: ALLIGNADDRESS	alignaddr	%r9, %r22, %r8
	.word 0x8780201c  ! 812: WRASI_I	wr	%r0, 0x001c, %asi
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 813: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd01fe001  ! 814: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x819821dd  ! 815: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01dd, %hpstate
	.word 0x3c700001  ! 816: BPPOS	<illegal instruction>
DS_201:
	.word 0x32800001  ! 818: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 817: SAVE_R	save	%r31, %r0, %r31
	.word 0x30800001  ! 818: BA	ba,a	<label_0x1>
	.word 0x87802004  ! 819: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8f494000  ! 820: RDHPR_HTBA	rdhpr	%htba, %r7
	.word 0xce9fc020  ! 821: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
tagged_202:
	tsubcctv %r26, 0x18ea, %r17
	.word 0xce07e001  ! 822: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x819826df  ! 823: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06df, %hpstate
	.word 0xce900e80  ! 824: LDUHA_R	lduha	[%r0, %r0] 0x74, %r7
	.word 0x8f902002  ! 826: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb182c012  ! 825: WR_STICK_REG_R	wr	%r11, %r18, %-
	.word 0xa1902003  ! 826: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 827: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_204:
	.word 0x22800001  ! 829: BE	be,a	<label_0x1>
	.word 0xcd326001  ! 829: STQF_I	-	%f6, [0x0001, %r9]
	normalw
	.word 0xb7458000  ! 828: RD_SOFTINT_REG	rd	%softint, %r27
tagged_205:
	taddcctv %r16, 0x1f26, %r6
	.word 0xf607e001  ! 829: LDUW_I	lduw	[%r31 + 0x0001], %r27
	.word 0x38700001  ! 830: BPGU	<illegal instruction>
DS_206:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 831: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 832: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf69004a0  ! 833: LDUHA_R	lduha	[%r0, %r0] 0x25, %r27
tagged_207:
	taddcctv %r23, 0x1b0a, %r25
	.word 0xf607e001  ! 834: LDUW_I	lduw	[%r31 + 0x0001], %r27
	.word 0xf61fe001  ! 835: LDD_I	ldd	[%r31 + 0x0001], %r27
	.word 0xf727e001  ! 836: STF_I	st	%f27, [0x0001, %r31]
	.word 0x93902004  ! 837: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xf6dfe030  ! 838: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r27
	.word 0xf6800ae0  ! 839: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r27
	.word 0x8f902000  ! 841: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8f6b2001  ! 840: SDIVX_I	sdivx	%r12, 0x0001, %r7
	.word 0x8f902000  ! 842: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81a01964  ! 841: FqTOd	dis not found

	.word 0xc0c804a0  ! 842: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
splash_lsu_210:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 843: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_211:
	taddcctv %r2, 0x1bad, %r23
	.word 0xc007e001  ! 844: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x8f902000  ! 846: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89850001  ! 845: WRTICK_R	wr	%r20, %r1, %tick
DS_213:
	.word 0x22800001  ! 847: BE	be,a	<label_0x1>
	.word 0xc535a001  ! 847: STQF_I	-	%f2, [0x0001, %r22]
	normalw
	.word 0x85458000  ! 846: RD_SOFTINT_REG	rd	%softint, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 847: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x97508000  ! 848: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0xab500000  ! 849: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x8d902e9f  ! 850: WRPR_PSTATE_I	wrpr	%r0, 0x0e9f, %pstate
	.word 0xea17c000  ! 851: LDUH_R	lduh	[%r31 + %r0], %r21
	.word 0x8d902249  ! 852: WRPR_PSTATE_I	wrpr	%r0, 0x0249, %pstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 853: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021a2  ! 854: WRPR_TT_I	wrpr	%r0, 0x01a2, %tt
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 855: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xea1fe001  ! 856: LDD_I	ldd	[%r31 + 0x0001], %r21
	.word 0xea0fe001  ! 857: LDUB_I	ldub	[%r31 + 0x0001], %r21
	.word 0x87802014  ! 858: WRASI_I	wr	%r0, 0x0014, %asi
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 859: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xea9fc020  ! 860: LDDA_R	ldda	[%r31, %r0] 0x01, %r21
	.word 0x819823d7  ! 861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d7, %hpstate
	.word 0xea1fe001  ! 862: LDD_I	ldd	[%r31 + 0x0001], %r21
	.word 0x87802058  ! 863: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x879022bb  ! 864: WRPR_TT_I	wrpr	%r0, 0x02bb, %tt
	.word 0xa1902000  ! 865: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x93d02030  ! 866: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xea8008a0  ! 867: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
DS_214:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 868: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xea8008a0  ! 869: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0x819825ce  ! 870: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05ce, %hpstate
	.word 0xea880e60  ! 871: LDUBA_R	lduba	[%r0, %r0] 0x73, %r21
	.word 0xead804a0  ! 872: LDXA_R	ldxa	[%r0, %r0] 0x25, %r21
	.word 0xea9fe001  ! 873: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r21
splash_tba_215:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 874: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xea47c000  ! 875: LDSW_R	ldsw	[%r31 + %r0], %r21
change_to_randtl_216:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 876: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 878: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x28700001  ! 879: BPLEU	<illegal instruction>
	.word 0x8745c000  ! 880: RD_TICK_CMPR_REG	rd	%-, %r3
	.word 0x38700001  ! 881: BPGU	<illegal instruction>
	.word 0x87802010  ! 882: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc64fc000  ! 883: LDSB_R	ldsb	[%r31 + %r0], %r3
	.word 0x8d902cdd  ! 884: WRPR_PSTATE_I	wrpr	%r0, 0x0cdd, %pstate
	.word 0xc61fc000  ! 885: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x87802016  ! 886: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93902001  ! 887: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc69fc020  ! 888: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0xc797e001  ! 889: LDQFA_I	-	[%r31, 0x0001], %f3
splash_lsu_217:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 890: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 891: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xc68008a0  ! 892: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc6c804a0  ! 893: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x87802058  ! 894: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x9950c000  ! 895: RDPR_TT	rdpr	%tt, %r12
splash_lsu_218:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 896: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_219:
	.word 0x22800001  ! 898: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 897: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd88008a0  ! 898: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x8550c000  ! 900: RDPR_TT	rdpr	%tt, %r2
	.word 0xc517c000  ! 901: LDQF_R	-	[%r31, %r0], %f2
	.word 0x91d02035  ! 902: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc447e001  ! 903: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	.word 0x8d50c000  ! 904: RDPR_TT	rdpr	%tt, %r6
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 905: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0x81982097  ! 906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0097, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802004  ! 908: WRASI_I	wr	%r0, 0x0004, %asi
splash_htba_220:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 909: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87902171  ! 910: WRPR_TT_I	wrpr	%r0, 0x0171, %tt
	.word 0x8d902c9b  ! 911: WRPR_PSTATE_I	wrpr	%r0, 0x0c9b, %pstate
splash_htba_221:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 912: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d020b2  ! 913: Tcc_I	ta	icc_or_xcc, %r0 + 178
tagged_222:
	tsubcctv %r13, 0x1ad2, %r16
	.word 0xcc07e001  ! 914: LDUW_I	lduw	[%r31 + 0x0001], %r6
tagged_223:
	taddcctv %r4, 0x15c3, %r14
	.word 0xcc07e001  ! 915: LDUW_I	lduw	[%r31 + 0x0001], %r6
DS_224:
	.word 0x32800001  ! 917: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 916: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d9020da  ! 917: WRPR_PSTATE_I	wrpr	%r0, 0x00da, %pstate
	.word 0x93902003  ! 918: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902003  ! 919: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x36800001  ! 920: BGE	bge,a	<label_0x1>
	.word 0x8d902e0f  ! 921: WRPR_PSTATE_I	wrpr	%r0, 0x0e0f, %pstate
splash_lsu_225:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 922: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_226:
	.word 0x20800001  ! 924: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 923: SAVE_R	save	%r31, %r0, %r31
splash_lsu_227:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 924: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b1  ! 925: Tcc_I	ta	icc_or_xcc, %r0 + 177
	.word 0x22700001  ! 926: BPE	<illegal instruction>
	.word 0x8d90261f  ! 927: WRPR_PSTATE_I	wrpr	%r0, 0x061f, %pstate
	.word 0xa7480000  ! 928: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0xe68fe020  ! 929: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r19
	.word 0x93902006  ! 930: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d802000  ! 931: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe617e001  ! 932: LDUH_I	lduh	[%r31 + 0x0001], %r19
splash_lsu_228:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 933: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 934: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d020b3  ! 935: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xe697e020  ! 936: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r19
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 937: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_229:
	.word 0x32800001  ! 939: BNE	bne,a	<label_0x1>
	pdist %f8, %f12, %f6
	.word 0x8fb60304  ! 938: ALLIGNADDRESS	alignaddr	%r24, %r4, %r7
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xce5fc000  ! 939: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x81982245  ! 940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0245, %hpstate
splash_tba_230:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 941: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902a1a  ! 942: WRPR_PSTATE_I	wrpr	%r0, 0x0a1a, %pstate
	.word 0xad51c000  ! 943: RDPR_TL	rdpr	%tl, %r22
	.word 0xec800ac0  ! 944: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r22
	.word 0x9f802001  ! 945: SIR	sir	0x0001
	.word 0xec900e60  ! 946: LDUHA_R	lduha	[%r0, %r0] 0x73, %r22
	.word 0xec97e020  ! 947: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r22
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 948: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xecc7e020  ! 949: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r22
	.word 0xec9fc020  ! 950: LDDA_R	ldda	[%r31, %r0] 0x01, %r22
tagged_231:
	taddcctv %r20, 0x1df0, %r20
	.word 0xec07e001  ! 951: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x81982105  ! 952: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0105, %hpstate
	ta	T_CHANGE_PRIV	! macro
splash_lsu_232:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 954: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xec8008a0  ! 955: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x8f902002  ! 957: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1850007  ! 956: WR_STICK_REG_R	wr	%r20, %r7, %-
	.word 0x93902000  ! 957: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_tba_234:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 958: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xecbfe001  ! 959: STDA_I	stda	%r22, [%r31 + 0x0001] %asi
splash_lsu_235:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 960: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 961: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_236:
	.word 0x34800001  ! 963: BG	bg,a	<label_0x1>
	.word 0xc331c017  ! 963: STQF_R	-	%f1, [%r23, %r7]
	normalw
	.word 0xa1458000  ! 962: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x99902001  ! 963: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
tagged_237:
	taddcctv %r19, 0x191a, %r8
	.word 0xe007e001  ! 964: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x97500000  ! 965: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x93902004  ! 966: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d802000  ! 967: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879023b4  ! 968: WRPR_TT_I	wrpr	%r0, 0x03b4, %tt
	.word 0xa190200b  ! 969: WRPR_GL_I	wrpr	%r0, 0x000b, %-
tagged_238:
	tsubcctv %r8, 0x1c70, %r14
	.word 0xd607e001  ! 970: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x93902007  ! 971: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd68fe010  ! 972: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r11
	.word 0x819822cd  ! 973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cd, %hpstate
	.word 0xd6c80e60  ! 974: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r11
	.word 0x879023c7  ! 975: WRPR_TT_I	wrpr	%r0, 0x03c7, %tt
	.word 0x91d020b5  ! 976: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xd797e001  ! 977: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0xd65fe001  ! 978: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0x8198289f  ! 979: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089f, %hpstate
	.word 0xa190200d  ! 980: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d90281a  ! 981: WRPR_PSTATE_I	wrpr	%r0, 0x081a, %pstate
tagged_239:
	taddcctv %r10, 0x16c6, %r17
	.word 0xd607e001  ! 982: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xd6900e80  ! 983: LDUHA_R	lduha	[%r0, %r0] 0x74, %r11
	.word 0xaf464000  ! 984: RD_STICK_CMPR_REG	rd	%-, %r23
	.word 0x8d802000  ! 985: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x97504000  ! 986: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0x879021d9  ! 987: WRPR_TT_I	wrpr	%r0, 0x01d9, %tt
	.word 0x8d802004  ! 988: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91d020b2  ! 989: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x87802088  ! 990: WRASI_I	wr	%r0, 0x0088, %asi
splash_lsu_240:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 991: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200f  ! 992: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd6c80e40  ! 993: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r11
	.word 0x20800001  ! 994: BN	bn,a	<label_0x1>
	.word 0xd697e020  ! 995: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r11
	.word 0x93902004  ! 996: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 997: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 998: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1902001  ! 999: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x81982e9c  ! 1000: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9c, %hpstate
	.word 0xd737c017  ! 1001: STQF_R	-	%f11, [%r23, %r31]
tagged_241:
	taddcctv %r18, 0x1385, %r3
	.word 0xd607e001  ! 1002: LDUW_I	lduw	[%r31 + 0x0001], %r11
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1003: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_242:
	tsubcctv %r20, 0x15de, %r18
	.word 0xd607e001  ! 1004: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x99902003  ! 1005: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x81500000  ! 1006: RDPR_TPC	rdpr	%tpc, %r0
splash_tba_243:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1007: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8cfb2001  ! 1008: SDIVcc_I	sdivcc 	%r12, 0x0001, %r6
	.word 0x87802014  ! 1009: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x91d020b1  ! 1010: Tcc_I	ta	icc_or_xcc, %r0 + 177
splash_lsu_244:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1011: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_245:
	.word 0x22800001  ! 1013: BE	be,a	<label_0x1>
	.word 0xe7356001  ! 1013: STQF_I	-	%f19, [0x0001, %r21]
	normalw
	.word 0x89458000  ! 1012: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xc8800ba0  ! 1013: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r4
splash_tba_246:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1014: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x85504000  ! 1015: RDPR_TNPC	rdpr	%tnpc, %r2
change_to_randtl_247:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1016: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x81982614  ! 1017: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0614, %hpstate
	.word 0x819822d5  ! 1018: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d5, %hpstate
splash_tba_248:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1019: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_249:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1020: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81480000  ! 1021: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
DS_250:
	.word 0x20800001  ! 1023: BN	bn,a	<label_0x1>
	.word 0xd1332001  ! 1023: STQF_I	-	%f8, [0x0001, %r12]
	normalw
	.word 0x95458000  ! 1022: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x93d02031  ! 1023: Tcc_I	tne	icc_or_xcc, %r0 + 49
DS_251:
	.word 0x22800001  ! 1025: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1024: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd4c004a0  ! 1025: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
splash_tba_252:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1026: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4d7e030  ! 1027: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1028: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd417e001  ! 1029: LDUH_I	lduh	[%r31 + 0x0001], %r10
DS_253:
	.word 0x32800001  ! 1031: BNE	bne,a	<label_0x1>
	pdist %f14, %f22, %f10
	.word 0xb7b5830d  ! 1030: ALLIGNADDRESS	alignaddr	%r22, %r13, %r27
	.word 0x8d802000  ! 1031: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 1032: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_254:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1033: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_255:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1034: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982d14  ! 1035: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d14, %hpstate
splash_lsu_256:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1036: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf65fc000  ! 1037: LDX_R	ldx	[%r31 + %r0], %r27
	.word 0x93902001  ! 1038: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f902002  ! 1040: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb181c014  ! 1039: WR_STICK_REG_R	wr	%r7, %r20, %-
	.word 0xa1902007  ! 1040: WRPR_GL_I	wrpr	%r0, 0x0007, %-
tagged_258:
	tsubcctv %r26, 0x1c0f, %r3
	.word 0xf607e001  ! 1041: LDUW_I	lduw	[%r31 + 0x0001], %r27
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1042: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf6d804a0  ! 1043: LDXA_R	ldxa	[%r0, %r0] 0x25, %r27
	ta	T_CHANGE_HPRIV	! macro
	.word 0xaf464000  ! 1045: RD_STICK_CMPR_REG	rd	%-, %r23
	.word 0x93902001  ! 1046: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xee800c00  ! 1047: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r23
	.word 0x8d902ec1  ! 1048: WRPR_PSTATE_I	wrpr	%r0, 0x0ec1, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xee5fc000  ! 1049: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0xee8008a0  ! 1050: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0x91d02032  ! 1051: Tcc_I	ta	icc_or_xcc, %r0 + 50
tagged_259:
	taddcctv %r19, 0x10ae, %r20
	.word 0xee07e001  ! 1052: LDUW_I	lduw	[%r31 + 0x0001], %r23
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1053: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_260:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1054: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_261:
	.word 0x20800001  ! 1056: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1055: RESTORE_R	restore	%r31, %r0, %r31
tagged_262:
	tsubcctv %r15, 0x1984, %r23
	.word 0xee07e001  ! 1056: LDUW_I	lduw	[%r31 + 0x0001], %r23
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xee5fc000  ! 1057: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0x8d802000  ! 1058: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_htba_263:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1059: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_264:
	.word 0x20800001  ! 1061: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1060: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x2e700001  ! 1061: BPVS	<illegal instruction>
	.word 0xee57e001  ! 1062: LDSH_I	ldsh	[%r31 + 0x0001], %r23
	.word 0x91d020b1  ! 1063: Tcc_I	ta	icc_or_xcc, %r0 + 177
DS_265:
	.word 0x20800001  ! 1065: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1064: SAVE_R	save	%r31, %r0, %r31
	.word 0xee4fc000  ! 1065: LDSB_R	ldsb	[%r31 + %r0], %r23
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802088  ! 1067: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xee9fc020  ! 1068: LDDA_R	ldda	[%r31, %r0] 0x01, %r23
	.word 0x99902003  ! 1069: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xee9004a0  ! 1070: LDUHA_R	lduha	[%r0, %r0] 0x25, %r23
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d020b0  ! 1072: Tcc_I	ta	icc_or_xcc, %r0 + 176
DS_266:
	.word 0x22800001  ! 1074: BE	be,a	<label_0x1>
	pdist %f6, %f18, %f14
	.word 0xafb48306  ! 1073: ALLIGNADDRESS	alignaddr	%r18, %r6, %r23
	.word 0x91d02031  ! 1074: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xee47c000  ! 1075: LDSW_R	ldsw	[%r31 + %r0], %r23
	.word 0xee880e40  ! 1076: LDUBA_R	lduba	[%r0, %r0] 0x72, %r23
	.word 0x93902000  ! 1077: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87902365  ! 1078: WRPR_TT_I	wrpr	%r0, 0x0365, %tt
	.word 0xee8008a0  ! 1079: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
splash_lsu_267:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1080: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902483  ! 1081: WRPR_PSTATE_I	wrpr	%r0, 0x0483, %pstate
splash_cmpr_268:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182e001  ! 1082: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0xeebfc026  ! 1083: STDA_R	stda	%r23, [%r31 + %r6] 0x01
	.word 0x81982acd  ! 1084: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acd, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879020d9  ! 1086: WRPR_TT_I	wrpr	%r0, 0x00d9, %tt
DS_269:
	.word 0x34800001  ! 1088: BG	bg,a	<label_0x1>
	pdist %f20, %f10, %f16
	.word 0x89b2030d  ! 1087: ALLIGNADDRESS	alignaddr	%r8, %r13, %r4
	.word 0x91d02035  ! 1088: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_lsu_270:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1089: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc89fc020  ! 1090: LDDA_R	ldda	[%r31, %r0] 0x01, %r4
	.word 0x91d02033  ! 1091: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902006  ! 1092: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc857c000  ! 1093: LDSH_R	ldsh	[%r31 + %r0], %r4
	.word 0xa1902005  ! 1094: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x9b50c000  ! 1095: RDPR_TT	rdpr	%tt, %r13
	.word 0x99902001  ! 1096: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_tba_271:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1097: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_272:
	tsubcctv %r18, 0x19d2, %r9
	.word 0xda07e001  ! 1098: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xda9004a0  ! 1099: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0xda0fc000  ! 1100: LDUB_R	ldub	[%r31 + %r0], %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d020b1  ! 1102: Tcc_I	ta	icc_or_xcc, %r0 + 177
	.word 0xda8008a0  ! 1103: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x87802058  ! 1104: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xdac00e40  ! 1105: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r13
	.word 0xdad804a0  ! 1106: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0xdadfe000  ! 1107: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902000  ! 1109: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802089  ! 1110: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x93480000  ! 1111: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0xd2cfe000  ! 1113: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r9
	.word 0x93902005  ! 1114: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd25fc000  ! 1115: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x87802004  ! 1116: WRASI_I	wr	%r0, 0x0004, %asi
splash_lsu_273:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1117: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026d2  ! 1118: WRPR_PSTATE_I	wrpr	%r0, 0x06d2, %pstate
	.word 0x87802080  ! 1119: WRASI_I	wr	%r0, 0x0080, %asi
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1120: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 1121: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd21fc000  ! 1122: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x93902001  ! 1123: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd21fe001  ! 1124: LDD_I	ldd	[%r31 + 0x0001], %r9
	.word 0x93902006  ! 1125: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87802004  ! 1126: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87902157  ! 1127: WRPR_TT_I	wrpr	%r0, 0x0157, %tt
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1128: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1129: SIR	sir	0x0001
	.word 0xd28008a0  ! 1130: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd397e001  ! 1131: LDQFA_I	-	[%r31, 0x0001], %f9
	.word 0xd2cfe020  ! 1132: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
DS_274:
	.word 0x34800001  ! 1134: BG	bg,a	<label_0x1>
	.word 0xc132e001  ! 1134: STQF_I	-	%f0, [0x0001, %r11]
	normalw
	.word 0xb5458000  ! 1133: RD_SOFTINT_REG	rd	%softint, %r26
DS_275:
	.word 0x22800001  ! 1135: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1134: SAVE_R	save	%r31, %r0, %r31
splash_tba_276:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1135: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902004  ! 1136: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_277:
	taddcctv %r10, 0x18ba, %r2
	.word 0xf407e001  ! 1137: LDUW_I	lduw	[%r31 + 0x0001], %r26
DS_278:
	.word 0x20800001  ! 1139: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1138: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902004  ! 1139: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_tba_279:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1140: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf49fc020  ! 1141: LDDA_R	ldda	[%r31, %r0] 0x01, %r26
	.word 0xa190200a  ! 1142: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x97540000  ! 1143: RDPR_GL	rdpr	%-, %r11
	.word 0x87902205  ! 1144: WRPR_TT_I	wrpr	%r0, 0x0205, %tt
splash_tba_280:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1145: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd6cfe000  ! 1146: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r11
	.word 0xd65fe001  ! 1147: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd607c000  ! 1148: LDUW_R	lduw	[%r31 + %r0], %r11
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 1149: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd6d7e010  ! 1150: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0xd6c804a0  ! 1151: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	.word 0x93902005  ! 1152: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87902010  ! 1153: WRPR_TT_I	wrpr	%r0, 0x0010, %tt
	.word 0x8d90241f  ! 1154: WRPR_PSTATE_I	wrpr	%r0, 0x041f, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xd6880e80  ! 1156: LDUBA_R	lduba	[%r0, %r0] 0x74, %r11
	.word 0x81982886  ! 1157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0886, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902004  ! 1159: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x32700001  ! 1160: BPNE	<illegal instruction>
	.word 0x8d90260b  ! 1161: WRPR_PSTATE_I	wrpr	%r0, 0x060b, %pstate
	.word 0xd6d00e60  ! 1162: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r11
	.word 0xd64fe001  ! 1163: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 1164: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x93902005  ! 1165: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8780201c  ! 1166: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x879020a8  ! 1167: WRPR_TT_I	wrpr	%r0, 0x00a8, %tt
DS_281:
	.word 0x20800001  ! 1169: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1168: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d9028c7  ! 1169: WRPR_PSTATE_I	wrpr	%r0, 0x08c7, %pstate
	.word 0xd64fe001  ! 1170: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802016  ! 1172: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd69fe001  ! 1173: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
splash_tba_282:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1174: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd65fc000  ! 1175: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd607c000  ! 1176: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0xd6c80e40  ! 1177: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r11
	.word 0x8d902a1e  ! 1178: WRPR_PSTATE_I	wrpr	%r0, 0x0a1e, %pstate
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1179: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1180: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd737c00d  ! 1181: STQF_R	-	%f11, [%r13, %r31]
	.word 0x81982c1d  ! 1182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1d, %hpstate
DS_283:
	.word 0x20800001  ! 1184: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1183: SAVE_R	save	%r31, %r0, %r31
splash_tba_284:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1184: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_285:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1185: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd6880e60  ! 1186: LDUBA_R	lduba	[%r0, %r0] 0x73, %r11
	.word 0xa1902004  ! 1187: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x24800001  ! 1188: BLE	ble,a	<label_0x1>
	.word 0xd68fe020  ! 1189: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r11
	.word 0x91d02032  ! 1190: Tcc_I	ta	icc_or_xcc, %r0 + 50
tagged_286:
	tsubcctv %r15, 0x1af4, %r22
	.word 0xd607e001  ! 1191: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x83d02033  ! 1192: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8d802000  ! 1193: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802004  ! 1194: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd647c000  ! 1195: LDSW_R	ldsw	[%r31 + %r0], %r11
DS_287:
	.word 0x32800001  ! 1197: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1197: BN	bn,a	<label_0x1>
	.word 0xcb15001b  ! 1197: LDQF_R	-	[%r20, %r27], %f5
	.word 0x83a10829  ! 1196: FADDs	fadds	%f4, %f9, %f1
	.word 0x879020de  ! 1197: WRPR_TT_I	wrpr	%r0, 0x00de, %tt
	.word 0x8790212f  ! 1198: WRPR_TT_I	wrpr	%r0, 0x012f, %tt
	.word 0xa190200b  ! 1199: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8f902002  ! 1201: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x816e6001  ! 1200: SDIVX_I	sdivx	%r25, 0x0001, %r0
	.word 0x83a509cc  ! 1201: FDIVd	fdivd	%f20, %f12, %f32
	.word 0xc2d7e010  ! 1202: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
	.word 0xc327e001  ! 1203: STF_I	st	%f1, [0x0001, %r31]
	.word 0x36800001  ! 1204: BGE	bge,a	<label_0x1>
	.word 0xc28804a0  ! 1205: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	.word 0x93902005  ! 1206: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982fd4  ! 1207: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd4, %hpstate
	.word 0xc20fe001  ! 1208: LDUB_I	ldub	[%r31 + 0x0001], %r1
	.word 0x81982fcf  ! 1209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcf, %hpstate
	.word 0xc2c80e80  ! 1210: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r1
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 1211: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902277  ! 1212: WRPR_TT_I	wrpr	%r0, 0x0277, %tt
	.word 0x8d802000  ! 1213: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_lsu_289:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1214: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790204e  ! 1215: WRPR_TT_I	wrpr	%r0, 0x004e, %tt
	.word 0xc2c7e030  ! 1216: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r1
	.word 0x8d902ec4  ! 1217: WRPR_PSTATE_I	wrpr	%r0, 0x0ec4, %pstate
	.word 0x91d02034  ! 1218: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902005  ! 1219: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 1220: LDX_R	ldx	[%r31 + %r0], %r1
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 1221: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x879020e4  ! 1222: WRPR_TT_I	wrpr	%r0, 0x00e4, %tt
	.word 0x8198281d  ! 1223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081d, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1224: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 1225: BPOS	bpos,a	<label_0x1>
	.word 0xc28008a0  ! 1226: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc2c7e010  ! 1227: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r1
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1228: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc20fe001  ! 1229: LDUB_I	ldub	[%r31 + 0x0001], %r1
	.word 0xc2d7e000  ! 1230: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r1
splash_tba_290:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1231: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802001  ! 1232: SIR	sir	0x0001
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 1233: LDX_R	ldx	[%r31 + %r0], %r1
DS_291:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1234: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8d902e1a  ! 1235: WRPR_PSTATE_I	wrpr	%r0, 0x0e1a, %pstate
	.word 0xc257c000  ! 1236: LDSH_R	ldsh	[%r31 + %r0], %r1
	.word 0x28700001  ! 1237: BPLEU	<illegal instruction>
splash_htba_292:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1238: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_cmpr_293:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1240: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1822001  ! 1239: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1240: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 1241: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc217c000  ! 1242: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x91d02032  ! 1243: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x28700001  ! 1244: BPLEU	<illegal instruction>
DS_294:
	.word 0x20800001  ! 1246: BN	bn,a	<label_0x1>
	allclean
	.word 0xa5b3430d  ! 1245: ALLIGNADDRESS	alignaddr	%r13, %r13, %r18
DS_295:
	.word 0x22800001  ! 1247: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1247: BG	bg,a	<label_0x1>
	.word 0xafa00548  ! 1247: FSQRTd	fsqrt	
	.word 0x87a00822  ! 1246: FADDs	fadds	%f0, %f2, %f3
	.word 0xa1902009  ! 1247: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902007  ! 1248: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc6c7e020  ! 1249: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r3
tagged_296:
	tsubcctv %r6, 0x15ef, %r14
	.word 0xc607e001  ! 1250: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc6d7e020  ! 1251: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r3
	.word 0x93902004  ! 1252: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xc727c002  ! 1253: STF_R	st	%f3, [%r2, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0xc737c002  ! 1255: STQF_R	-	%f3, [%r2, %r31]
	.word 0x8d902255  ! 1256: WRPR_PSTATE_I	wrpr	%r0, 0x0255, %pstate
	.word 0xc69fe001  ! 1257: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
	.word 0xc617c000  ! 1258: LDUH_R	lduh	[%r31 + %r0], %r3
tagged_297:
	taddcctv %r16, 0x149a, %r17
	.word 0xc607e001  ! 1259: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc68804a0  ! 1260: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0x8790236a  ! 1261: WRPR_TT_I	wrpr	%r0, 0x036a, %tt
	ta	T_CHANGE_HPRIV	! macro
tagged_298:
	tsubcctv %r22, 0x17d6, %r13
	.word 0xc607e001  ! 1263: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_tba_299:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1264: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8198294f  ! 1265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094f, %hpstate
	.word 0xc73fc002  ! 1266: STDF_R	std	%f3, [%r2, %r31]
	.word 0x86d4e001  ! 1267: UMULcc_I	umulcc 	%r19, 0x0001, %r3
	.word 0x8d90284c  ! 1268: WRPR_PSTATE_I	wrpr	%r0, 0x084c, %pstate
	.word 0xc69fc020  ! 1269: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0xc6880e40  ! 1270: LDUBA_R	lduba	[%r0, %r0] 0x72, %r3
	.word 0x8d902c07  ! 1271: WRPR_PSTATE_I	wrpr	%r0, 0x0c07, %pstate
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1272: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_300:
	tsubcctv %r21, 0x1c6a, %r1
	.word 0xc607e001  ! 1273: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_tba_301:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1274: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc6d7e020  ! 1275: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r3
splash_tba_302:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1276: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc6d004a0  ! 1277: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	.word 0x8d902adb  ! 1278: WRPR_PSTATE_I	wrpr	%r0, 0x0adb, %pstate
	.word 0x93902006  ! 1279: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_303:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1280: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_304:
	tsubcctv %r18, 0x16da, %r15
	.word 0xc607e001  ! 1281: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x93902000  ! 1282: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc617c000  ! 1283: LDUH_R	lduh	[%r31 + %r0], %r3
	.word 0xc6800ac0  ! 1284: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r3
	.word 0x8d902ec5  ! 1285: WRPR_PSTATE_I	wrpr	%r0, 0x0ec5, %pstate
	.word 0x8f902000  ! 1287: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8f6c6001  ! 1286: SDIVX_I	sdivx	%r17, 0x0001, %r7
splash_tba_306:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1287: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99902000  ! 1288: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x93902007  ! 1289: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8198254c  ! 1290: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054c, %hpstate
tagged_307:
	taddcctv %r23, 0x1bf0, %r13
	.word 0xce07e001  ! 1291: LDUW_I	lduw	[%r31 + 0x0001], %r7
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1292: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce8008a0  ! 1293: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x99508000  ! 1294: RDPR_TSTATE	rdpr	%tstate, %r12
splash_tba_308:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1295: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 1296: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_309:
	.word 0x34800001  ! 1298: BG	bg,a	<label_0x1>
	.word 0xc532c01a  ! 1298: STQF_R	-	%f2, [%r26, %r11]
	normalw
	.word 0x99458000  ! 1297: RD_SOFTINT_REG	rd	%softint, %r12
DS_310:
	.word 0x22800001  ! 1299: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1298: SAVE_R	save	%r31, %r0, %r31
	.word 0x81500000  ! 1299: RDPR_TPC	rdpr	%tpc, %r0
	.word 0x87802010  ! 1300: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8f902002  ! 1302: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81682001  ! 1301: SDIVX_I	sdivx	%r0, 0x0001, %r0
	.word 0x87902276  ! 1302: WRPR_TT_I	wrpr	%r0, 0x0276, %tt
	.word 0xc0800c60  ! 1303: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r0
	.word 0x2a700001  ! 1304: BPCS	<illegal instruction>
	.word 0x91d02030  ! 1305: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xc09004a0  ! 1306: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
splash_cmpr_312:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 1307: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0xc08fe030  ! 1308: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r0
	.word 0xc04fe001  ! 1309: LDSB_I	ldsb	[%r31 + 0x0001], %r0
splash_tba_313:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1310: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_314:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1311: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc09fc020  ! 1312: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0x879022fe  ! 1313: WRPR_TT_I	wrpr	%r0, 0x02fe, %tt
	.word 0x93902002  ! 1314: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 1315: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc0c004a0  ! 1316: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	.word 0x89514000  ! 1317: RDPR_TBA	rdpr	%tba, %r4
	.word 0xc997e001  ! 1318: LDQFA_I	-	[%r31, 0x0001], %f4
	.word 0xc917c000  ! 1319: LDQF_R	-	[%r31, %r0], %f4
	.word 0x81982b55  ! 1320: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b55, %hpstate
	.word 0x87902097  ! 1321: WRPR_TT_I	wrpr	%r0, 0x0097, %tt
	.word 0x97500000  ! 1322: RDPR_TPC	rdpr	%tpc, %r11
DS_315:
	.word 0x32800001  ! 1324: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1323: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_316:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1324: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa3500000  ! 1325: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xe28008a0  ! 1326: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x83500000  ! 1327: RDPR_TPC	<illegal instruction>
	.word 0xc247c000  ! 1328: LDSW_R	ldsw	[%r31 + %r0], %r1
	.word 0x93d02033  ! 1329: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xc2c80e80  ! 1330: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r1
	.word 0xc257c000  ! 1331: LDSH_R	ldsh	[%r31 + %r0], %r1
	.word 0xc217c000  ! 1332: LDUH_R	lduh	[%r31 + %r0], %r1
splash_lsu_317:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1333: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_318:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1334: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc29fe001  ! 1335: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0xc28fe010  ! 1336: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r1
	.word 0xc24fe001  ! 1337: LDSB_I	ldsb	[%r31 + 0x0001], %r1
splash_tba_319:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1338: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc247c000  ! 1339: LDSW_R	ldsw	[%r31 + %r0], %r1
	.word 0xc24fe001  ! 1340: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	.word 0xa190200b  ! 1341: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xc257c000  ! 1342: LDSH_R	ldsh	[%r31 + %r0], %r1
	.word 0x8198259e  ! 1343: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059e, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1344: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc2dfe010  ! 1345: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r1
	.word 0x93902006  ! 1346: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87902141  ! 1347: WRPR_TT_I	wrpr	%r0, 0x0141, %tt
	.word 0xc2d804a0  ! 1348: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	.word 0x8198235d  ! 1349: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035d, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1350: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790218d  ! 1351: WRPR_TT_I	wrpr	%r0, 0x018d, %tt
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1352: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_320:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1353: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_321:
	taddcctv %r7, 0x1c42, %r10
	.word 0xc207e001  ! 1354: LDUW_I	lduw	[%r31 + 0x0001], %r1
splash_lsu_322:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1355: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_323:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1356: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc28fe000  ! 1357: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r1
	.word 0xc2dfe000  ! 1358: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r1
change_to_randtl_324:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1359: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc25fe001  ! 1360: LDX_I	ldx	[%r31 + 0x0001], %r1
	.word 0x8d802004  ! 1361: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902007  ! 1362: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902007  ! 1363: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x89494000  ! 1364: RDHPR_HTBA	rdhpr	%htba, %r4
	.word 0x8790200a  ! 1365: WRPR_TT_I	wrpr	%r0, 0x000a, %tt
tagged_325:
	taddcctv %r17, 0x1908, %r14
	.word 0xc807e001  ! 1366: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x91d02031  ! 1367: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87802089  ! 1368: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87902363  ! 1369: WRPR_TT_I	wrpr	%r0, 0x0363, %tt
	.word 0xc8cfe010  ! 1370: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0xc8800b20  ! 1371: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r4
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 1372: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x8f902001  ! 1374: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1834019  ! 1373: WR_STICK_REG_R	wr	%r13, %r25, %-
splash_tba_327:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1374: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982e8e  ! 1375: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8e, %hpstate
	.word 0xab480000  ! 1376: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0x8f540000  ! 1377: RDPR_GL	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802088  ! 1379: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x819823cc  ! 1380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cc, %hpstate
	.word 0xced7e000  ! 1381: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r7
	.word 0x93902000  ! 1382: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902a1c  ! 1383: WRPR_PSTATE_I	wrpr	%r0, 0x0a1c, %pstate
	.word 0x8790218c  ! 1384: WRPR_TT_I	wrpr	%r0, 0x018c, %tt
change_to_randtl_328:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1385: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xce5fc000  ! 1386: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x87802088  ! 1387: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x81982c46  ! 1388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c46, %hpstate
DS_329:
	.word 0x34800001  ! 1390: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1390: BN	bn,a	<label_0x1>
	.word 0xb7a0054a  ! 1390: FSQRTd	fsqrt	
	.word 0x95a3482a  ! 1389: FADDs	fadds	%f13, %f10, %f10
DS_330:
	.word 0x34800001  ! 1391: BG	bg,a	<label_0x1>
	.word 0xcf354009  ! 1391: STQF_R	-	%f7, [%r9, %r21]
	normalw
	.word 0xb5458000  ! 1390: RD_SOFTINT_REG	rd	%softint, %r26
	.word 0x81982b9d  ! 1391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9d, %hpstate
	.word 0x8d802004  ! 1392: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf45fc000  ! 1393: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0x93902007  ! 1394: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
tagged_331:
	taddcctv %r18, 0x11eb, %r26
	.word 0xf407e001  ! 1395: LDUW_I	lduw	[%r31 + 0x0001], %r26
	.word 0x93902006  ! 1396: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_PRIV	! macro
splash_tba_332:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1398: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879022c7  ! 1399: WRPR_TT_I	wrpr	%r0, 0x02c7, %tt
	.word 0xf49fe001  ! 1400: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r26
splash_cmpr_333:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1402: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184a001  ! 1401: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0x87902063  ! 1402: WRPR_TT_I	wrpr	%r0, 0x0063, %tt
splash_tba_334:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1403: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
	.word 0xf40fe001  ! 1405: LDUB_I	ldub	[%r31 + 0x0001], %r26
splash_lsu_335:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1406: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 1407: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x93902000  ! 1408: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xf4800c20  ! 1409: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r26
	.word 0x93902007  ! 1410: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xf45fc000  ! 1411: LDX_R	ldx	[%r31 + %r0], %r26
	.word 0xf48008a0  ! 1412: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	ta	T_CHANGE_PRIV	! macro
	.word 0xf49fc020  ! 1414: LDDA_R	ldda	[%r31, %r0] 0x01, %r26
DS_336:
	.word 0x32800001  ! 1416: BNE	bne,a	<label_0x1>
	allclean
	.word 0x89b14305  ! 1415: ALLIGNADDRESS	alignaddr	%r5, %r5, %r4
	.word 0xa190200f  ! 1416: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x81982187  ! 1417: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0187, %hpstate
	.word 0xa190200a  ! 1418: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xc8c804a0  ! 1419: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
tagged_337:
	taddcctv %r20, 0x13e0, %r9
	.word 0xc807e001  ! 1420: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x91d02035  ! 1421: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_338:
	tsubcctv %r8, 0x1c0f, %r18
	.word 0xc807e001  ! 1422: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc817c000  ! 1423: LDUH_R	lduh	[%r31 + %r0], %r4
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 1424: LDX_R	ldx	[%r31 + %r0], %r4
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc85fc000  ! 1425: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0xc88804a0  ! 1426: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	.word 0xa1902007  ! 1427: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_htba_339:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1428: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902000  ! 1429: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xab508000  ! 1430: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0xeb3fe001  ! 1431: STDF_I	std	%f21, [0x0001, %r31]
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1432: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 1433: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d020b5  ! 1434: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x879020af  ! 1435: WRPR_TT_I	wrpr	%r0, 0x00af, %tt
	.word 0x8d902613  ! 1436: WRPR_PSTATE_I	wrpr	%r0, 0x0613, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x87902324  ! 1438: WRPR_TT_I	wrpr	%r0, 0x0324, %tt
	.word 0x8d902817  ! 1439: WRPR_PSTATE_I	wrpr	%r0, 0x0817, %pstate
	.word 0xead804a0  ! 1440: LDXA_R	ldxa	[%r0, %r0] 0x25, %r21
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 1441: LDX_R	ldx	[%r31 + %r0], %r21
splash_lsu_340:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1442: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xead7e000  ! 1443: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r21
	.word 0x8f902002  ! 1445: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89828011  ! 1444: WRTICK_R	wr	%r10, %r17, %tick
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xea5fc000  ! 1445: LDX_R	ldx	[%r31 + %r0], %r21
	.word 0x8d902c9c  ! 1446: WRPR_PSTATE_I	wrpr	%r0, 0x0c9c, %pstate
	.word 0x93902004  ! 1447: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xea800b00  ! 1448: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r21
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1450: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_342:
	tsubcctv %r19, 0x134f, %r7
	.word 0xea07e001  ! 1451: LDUW_I	lduw	[%r31 + 0x0001], %r21
splash_tba_343:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1452: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b2  ! 1453: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xea1fc000  ! 1454: LDD_R	ldd	[%r31 + %r0], %r21
	.word 0x20700001  ! 1455: BPN	<illegal instruction>
	.word 0xa1902008  ! 1456: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xea9fe001  ! 1457: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r21
	.word 0x91d02031  ! 1458: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8f902001  ! 1460: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1a01963  ! 1459: FqTOd	dis not found

	.word 0xf0d80e60  ! 1460: LDXA_R	ldxa	[%r0, %r0] 0x73, %r24
	.word 0x8b540000  ! 1461: RDPR_GL	rdpr	%-, %r5
DS_345:
	.word 0x22800001  ! 1463: BE	be,a	<label_0x1>
	.word 0xc534c017  ! 1463: STQF_R	-	%f2, [%r23, %r19]
	normalw
	.word 0x97458000  ! 1462: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xa1902009  ! 1463: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1464: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd68804a0  ! 1465: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xd61fc000  ! 1466: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x81982706  ! 1467: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0706, %hpstate
tagged_346:
	tsubcctv %r2, 0x18f0, %r8
	.word 0xd607e001  ! 1468: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x87902365  ! 1469: WRPR_TT_I	wrpr	%r0, 0x0365, %tt
	.word 0xa1902007  ! 1470: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d902e13  ! 1471: WRPR_PSTATE_I	wrpr	%r0, 0x0e13, %pstate
	.word 0xd607c000  ! 1472: LDUW_R	lduw	[%r31 + %r0], %r11
splash_lsu_347:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1473: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b45c000  ! 1474: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0xdb17c000  ! 1475: LDQF_R	-	[%r31, %r0], %f13
	.word 0x8f902002  ! 1477: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa76d6001  ! 1476: SDIVX_I	sdivx	%r21, 0x0001, %r19
	.word 0x81982bde  ! 1477: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bde, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe737e001  ! 1479: STQF_I	-	%f19, [0x0001, %r31]
	.word 0xe69fe001  ! 1480: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r19
	.word 0x8f902000  ! 1482: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97682001  ! 1481: SDIVX_I	sdivx	%r0, 0x0001, %r11
	.word 0xd65fe001  ! 1482: LDX_I	ldx	[%r31 + 0x0001], %r11
tagged_350:
	tsubcctv %r26, 0x180a, %r6
	.word 0xd607e001  ! 1483: LDUW_I	lduw	[%r31 + 0x0001], %r11
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 1484: LDX_R	ldx	[%r31 + %r0], %r11
tagged_351:
	taddcctv %r11, 0x107f, %r23
	.word 0xd607e001  ! 1485: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x28700001  ! 1486: BPLEU	<illegal instruction>
tagged_352:
	tsubcctv %r4, 0x10a4, %r16
	.word 0xd607e001  ! 1487: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x81982114  ! 1488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0114, %hpstate
	.word 0xd6c7e030  ! 1489: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
	.word 0x99902002  ! 1490: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 1491: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x91d02033  ! 1492: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd69004a0  ! 1493: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
	.word 0x8790203d  ! 1494: WRPR_TT_I	wrpr	%r0, 0x003d, %tt
splash_tba_353:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1495: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879021fe  ! 1496: WRPR_TT_I	wrpr	%r0, 0x01fe, %tt
DS_354:
	.word 0x32800001  ! 1498: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xc111c014  ! 1498: LDQF_R	-	[%r7, %r20], %f0
	.word 0xb3a30824  ! 1497: FADDs	fadds	%f12, %f4, %f25
	.word 0x8780201c  ! 1498: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8d902081  ! 1499: WRPR_PSTATE_I	wrpr	%r0, 0x0081, %pstate
	.word 0xf2d804a0  ! 1500: LDXA_R	ldxa	[%r0, %r0] 0x25, %r25
	.word 0xf28fe030  ! 1501: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r25
tagged_355:
	taddcctv %r15, 0x1df5, %r17
	.word 0xf207e001  ! 1502: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0x81460000  ! 1503: RD_STICK_REG	stbar
	.word 0x22800001  ! 1504: BE	be,a	<label_0x1>
DS_356:
	.word 0x34800001  ! 1506: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1505: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_357:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1506: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_htba_358:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1507: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02032  ! 1508: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 1509: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902002  ! 1510: WRPR_GL_I	wrpr	%r0, 0x0002, %-
DS_359:
	.word 0x32800001  ! 1512: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1511: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x99902003  ! 1512: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x93d020b2  ! 1513: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x93d020b5  ! 1514: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x20700001  ! 1515: BPN	<illegal instruction>
	.word 0x87802089  ! 1516: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9f802001  ! 1517: SIR	sir	0x0001
	.word 0x91d020b5  ! 1518: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8f902001  ! 1520: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x816ce001  ! 1519: SDIVX_I	sdivx	%r19, 0x0001, %r0
DS_361:
	.word 0x20800001  ! 1521: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1520: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8f902002  ! 1522: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d692001  ! 1521: SDIVX_I	sdivx	%r4, 0x0001, %r6
	.word 0x8f902001  ! 1523: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1850006  ! 1522: WR_STICK_REG_R	wr	%r20, %r6, %-
	.word 0x91d02030  ! 1523: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xccd7e020  ! 1524: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r6
tagged_364:
	tsubcctv %r24, 0x160c, %r15
	.word 0xcc07e001  ! 1525: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x91d02033  ! 1526: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x819824d5  ! 1527: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d5, %hpstate
	.word 0x9f802001  ! 1528: SIR	sir	0x0001
	.word 0xcc800ae0  ! 1529: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r6
change_to_randtl_365:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1530: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
splash_lsu_366:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1531: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 1532: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d020b4  ! 1533: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x93d02031  ! 1534: Tcc_I	tne	icc_or_xcc, %r0 + 49
splash_lsu_367:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1535: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 1536: WRPR_GL_I	wrpr	%r0, 0x0004, %-
DS_368:
	.word 0x32800001  ! 1538: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1537: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xcc8008a0  ! 1538: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
splash_htba_369:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1539: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_370:
	tsubcctv %r5, 0x117c, %r8
	.word 0xcc07e001  ! 1540: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xccdfe020  ! 1541: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
splash_tba_371:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1542: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982d04  ! 1543: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d04, %hpstate
	.word 0xcc9fc020  ! 1544: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
tagged_372:
	tsubcctv %r12, 0x1886, %r20
	.word 0xcc07e001  ! 1545: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc4fc000  ! 1546: LDSB_R	ldsb	[%r31 + %r0], %r6
	.word 0xcc9fc020  ! 1547: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xccdfe020  ! 1549: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
	.word 0x91d02034  ! 1550: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x936c0017  ! 1551: SDIVX_R	sdivx	%r16, %r23, %r9
	.word 0xd397e001  ! 1552: LDQFA_I	-	[%r31, 0x0001], %f9
	.word 0x8198215c  ! 1553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015c, %hpstate
	.word 0x93902002  ! 1554: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982c54  ! 1555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c54, %hpstate
	.word 0xd217c000  ! 1556: LDUH_R	lduh	[%r31 + %r0], %r9
	.word 0xd2800a60  ! 1557: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r9
splash_lsu_373:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1558: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x30800001  ! 1559: BA	ba,a	<label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 1560: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd217e001  ! 1561: LDUH_I	lduh	[%r31 + 0x0001], %r9
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1562: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1500000  ! 1563: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xe08804a0  ! 1564: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
	.word 0xe057c000  ! 1565: LDSH_R	ldsh	[%r31 + %r0], %r16
splash_lsu_374:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1566: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982256  ! 1567: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0256, %hpstate
	.word 0x99902004  ! 1568: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xe05fe001  ! 1569: LDX_I	ldx	[%r31 + 0x0001], %r16
	.word 0x8f902002  ! 1571: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76c6001  ! 1570: SDIVX_I	sdivx	%r17, 0x0001, %r19
splash_tba_376:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1571: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d02030  ! 1572: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x24800001  ! 1573: BLE	ble,a	<label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1574: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe61fc000  ! 1575: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x8d902894  ! 1576: WRPR_PSTATE_I	wrpr	%r0, 0x0894, %pstate
DS_377:
	.word 0x34800001  ! 1578: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1578: BNE	bne,a	<label_0x1>
	.word 0x8ba0055b  ! 1578: FSQRTd	fsqrt	
	.word 0xb3a6c826  ! 1577: FADDs	fadds	%f27, %f6, %f25
splash_tba_378:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1578: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_379:
	.word 0x34800001  ! 1580: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1579: SAVE_R	save	%r31, %r0, %r31
	.word 0x28700001  ! 1580: BPLEU	<illegal instruction>
	.word 0x91d02030  ! 1581: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xf24fe001  ! 1582: LDSB_I	ldsb	[%r31 + 0x0001], %r25
	.word 0xf28fe020  ! 1583: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r25
	.word 0xf25fe001  ! 1584: LDX_I	ldx	[%r31 + 0x0001], %r25
	.word 0xf247e001  ! 1585: LDSW_I	ldsw	[%r31 + 0x0001], %r25
	.word 0x8d90248a  ! 1586: WRPR_PSTATE_I	wrpr	%r0, 0x048a, %pstate
	.word 0x819820cd  ! 1587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00cd, %hpstate
	.word 0xa3540000  ! 1588: RDPR_GL	rdpr	%-, %r17
splash_cmpr_380:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 1589: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 1590: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x93902001  ! 1591: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe297e020  ! 1592: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
	.word 0xe207c000  ! 1593: LDUW_R	lduw	[%r31 + %r0], %r17
splash_lsu_381:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1594: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1595: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_382:
	tsubcctv %r5, 0x1211, %r20
	.word 0xe207e001  ! 1596: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe2d004a0  ! 1597: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x8d902c46  ! 1598: WRPR_PSTATE_I	wrpr	%r0, 0x0c46, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 1599: LDX_R	ldx	[%r31 + %r0], %r17
	.word 0x8d902e15  ! 1600: WRPR_PSTATE_I	wrpr	%r0, 0x0e15, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe25fc000  ! 1601: LDX_R	ldx	[%r31 + %r0], %r17
tagged_383:
	taddcctv %r5, 0x1548, %r17
	.word 0xe207e001  ! 1602: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x81982006  ! 1603: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0006, %hpstate
	.word 0x8950c000  ! 1604: RDPR_TT	rdpr	%tt, %r4
	.word 0xc88fe000  ! 1605: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r4
DS_384:
	.word 0x20800001  ! 1607: BN	bn,a	<label_0x1>
	.word 0xd7304001  ! 1607: STQF_R	-	%f11, [%r1, %r1]
	normalw
	.word 0x85458000  ! 1606: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x91d020b1  ! 1607: Tcc_I	ta	icc_or_xcc, %r0 + 177
splash_lsu_385:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1608: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902345  ! 1609: WRPR_TT_I	wrpr	%r0, 0x0345, %tt
	.word 0x91d02030  ! 1610: Tcc_I	ta	icc_or_xcc, %r0 + 48
change_to_randtl_386:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1611: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc4cfe000  ! 1612: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r2
	.word 0x879020d6  ! 1613: WRPR_TT_I	wrpr	%r0, 0x00d6, %tt
	.word 0xc4dfe010  ! 1614: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r2
	.word 0x8d802000  ! 1615: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x819820c4  ! 1616: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c4, %hpstate
	.word 0x9f802001  ! 1617: SIR	sir	0x0001
	.word 0x8f902000  ! 1619: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89808009  ! 1618: WRTICK_R	wr	%r2, %r9, %tick
	.word 0x99480000  ! 1619: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x8198295d  ! 1620: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095d, %hpstate
splash_cmpr_388:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1856001  ! 1621: WR_STICK_REG_I	wr	%r21, 0x0001, %-
	.word 0x8d902243  ! 1622: WRPR_PSTATE_I	wrpr	%r0, 0x0243, %pstate
	.word 0x93902002  ! 1623: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd88008a0  ! 1624: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1625: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02031  ! 1626: Tcc_I	te	icc_or_xcc, %r0 + 49
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 1627: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0xab494000  ! 1628: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0xea8008a0  ! 1629: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0xea5fe001  ! 1630: LDX_I	ldx	[%r31 + 0x0001], %r21
	.word 0x8d902406  ! 1631: WRPR_PSTATE_I	wrpr	%r0, 0x0406, %pstate
	.word 0xa190200b  ! 1632: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d902206  ! 1633: WRPR_PSTATE_I	wrpr	%r0, 0x0206, %pstate
tagged_389:
	taddcctv %r16, 0x1ad8, %r9
	.word 0xea07e001  ! 1634: LDUW_I	lduw	[%r31 + 0x0001], %r21
splash_lsu_390:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1635: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xea57e001  ! 1636: LDSH_I	ldsh	[%r31 + 0x0001], %r21
	.word 0x8745c000  ! 1637: RD_TICK_CMPR_REG	rd	%-, %r3
	.word 0x93d02032  ! 1638: Tcc_I	tne	icc_or_xcc, %r0 + 50
tagged_391:
	taddcctv %r16, 0x14db, %r24
	.word 0xc607e001  ! 1639: LDUW_I	lduw	[%r31 + 0x0001], %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 1640: LDX_R	ldx	[%r31 + %r0], %r3
	.word 0x89494000  ! 1641: RDHPR_HTBA	rdhpr	%htba, %r4
	.word 0xc8800c20  ! 1642: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r4
	.word 0x8d902602  ! 1643: WRPR_PSTATE_I	wrpr	%r0, 0x0602, %pstate
	.word 0xc88008a0  ! 1644: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x8f902002  ! 1646: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b69a001  ! 1645: SDIVX_I	sdivx	%r6, 0x0001, %r13
	.word 0xdac00e40  ! 1646: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r13
tagged_393:
	taddcctv %r19, 0x164f, %r7
	.word 0xda07e001  ! 1647: LDUW_I	lduw	[%r31 + 0x0001], %r13
tagged_394:
	tsubcctv %r22, 0x1bd3, %r19
	.word 0xda07e001  ! 1648: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x3e800001  ! 1649: BVC	bvc,a	<label_0x1>
tagged_395:
	taddcctv %r10, 0x184d, %r9
	.word 0xda07e001  ! 1650: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x87902253  ! 1651: WRPR_TT_I	wrpr	%r0, 0x0253, %tt
	.word 0xda8804a0  ! 1652: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0xdb37c009  ! 1653: STQF_R	-	%f13, [%r9, %r31]
	.word 0xdad7e000  ! 1654: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	.word 0xa9480000  ! 1655: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	ta	T_CHANGE_HPRIV	! macro
tagged_396:
	tsubcctv %r5, 0x1b62, %r9
	.word 0xe807e001  ! 1657: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0x93902001  ! 1658: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_397:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1659: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa5494000  ! 1660: RDHPR_HTBA	rdhpr	%htba, %r18
	.word 0x8d90260f  ! 1661: WRPR_PSTATE_I	wrpr	%r0, 0x060f, %pstate
	.word 0x93902006  ! 1662: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa190200c  ! 1663: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe497e000  ! 1664: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0x8b504000  ! 1665: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x8f902002  ! 1667: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x876c6001  ! 1666: SDIVX_I	sdivx	%r17, 0x0001, %r3
	.word 0x81982944  ! 1667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0944, %hpstate
	.word 0x8d902e93  ! 1668: WRPR_PSTATE_I	wrpr	%r0, 0x0e93, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc65fc000  ! 1669: LDX_R	ldx	[%r31 + %r0], %r3
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc65fc000  ! 1670: LDX_R	ldx	[%r31 + %r0], %r3
splash_htba_399:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1671: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_400:
	.word 0x22800001  ! 1673: BE	be,a	<label_0x1>
	pdist %f22, %f6, %f8
	.word 0x8fb0c30c  ! 1672: ALLIGNADDRESS	alignaddr	%r3, %r12, %r7
	.word 0x93902007  ! 1673: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_htba_401:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1674: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcec004a0  ! 1675: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xce8008a0  ! 1676: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x20800001  ! 1677: BN	bn,a	<label_0x1>
	.word 0x87902172  ! 1678: WRPR_TT_I	wrpr	%r0, 0x0172, %tt
	.word 0x91d020b3  ! 1679: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xce0fc000  ! 1680: LDUB_R	ldub	[%r31 + %r0], %r7
tagged_402:
	tsubcctv %r19, 0x1014, %r25
	.word 0xce07e001  ! 1681: LDUW_I	lduw	[%r31 + 0x0001], %r7
splash_lsu_403:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1682: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_404:
	.word 0x22800001  ! 1684: BE	be,a	<label_0x1>
	pdist %f24, %f12, %f0
	.word 0x85b34301  ! 1683: ALLIGNADDRESS	alignaddr	%r13, %r1, %r2
	.word 0xc41fc000  ! 1684: LDD_R	ldd	[%r31 + %r0], %r2
	.word 0x81982307  ! 1685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1686: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 1687: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc49fc020  ! 1688: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x93902006  ! 1689: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1690: LDX_R	ldx	[%r31 + %r0], %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 1691: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc48008a0  ! 1692: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xa551c000  ! 1693: RDPR_TL	rdpr	%tl, %r18
	.word 0x28800001  ! 1694: BLEU	bleu,a	<label_0x1>
	.word 0x93902001  ! 1695: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_405:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1696: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982c0c  ! 1697: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0c, %hpstate
	.word 0xe4900e80  ! 1698: LDUHA_R	lduha	[%r0, %r0] 0x74, %r18
DS_406:
	.word 0x20800001  ! 1700: BN	bn,a	<label_0x1>
	.word 0xf5324016  ! 1700: STQF_R	-	%f26, [%r22, %r9]
	normalw
	.word 0xb3458000  ! 1699: RD_SOFTINT_REG	rd	%softint, %r25
	.word 0x9afaa001  ! 1700: SDIVcc_I	sdivcc 	%r10, 0x0001, %r13
	.word 0xa190200f  ! 1701: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xda5fe001  ! 1702: LDX_I	ldx	[%r31 + 0x0001], %r13
splash_tba_407:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1703: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xda07c000  ! 1704: LDUW_R	lduw	[%r31 + %r0], %r13
	ta	T_CHANGE_HPRIV	! macro
splash_tba_408:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1706: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xda07c000  ! 1707: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0xa1902008  ! 1708: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xda1fc000  ! 1709: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x81982e1c  ! 1710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1c, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1711: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x93d02030  ! 1712: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x87902293  ! 1713: WRPR_TT_I	wrpr	%r0, 0x0293, %tt
	.word 0xda1fc000  ! 1714: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x87802016  ! 1715: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x99902005  ! 1716: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x87802063  ! 1717: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xda47e001  ! 1718: LDSW_I	ldsw	[%r31 + 0x0001], %r13
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1719: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 1720: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87902249  ! 1721: WRPR_TT_I	wrpr	%r0, 0x0249, %tt
	.word 0xdad7e030  ! 1722: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1723: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1724: SIR	sir	0x0001
splash_cmpr_409:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1726: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1832001  ! 1725: WR_STICK_REG_I	wr	%r12, 0x0001, %-
	.word 0x8790211c  ! 1726: WRPR_TT_I	wrpr	%r0, 0x011c, %tt
	.word 0xda1fc000  ! 1727: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x87802014  ! 1728: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x99902000  ! 1729: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xda8008a0  ! 1730: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xaf50c000  ! 1731: RDPR_TT	rdpr	%tt, %r23
	.word 0xeedfe030  ! 1732: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r23
DS_410:
	.word 0x32800001  ! 1734: BNE	bne,a	<label_0x1>
	.word 0xc5326001  ! 1734: STQF_I	-	%f2, [0x0001, %r9]
	normalw
	.word 0xaf458000  ! 1733: RD_SOFTINT_REG	rd	%softint, %r23
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xee5fc000  ! 1734: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0x8d802000  ! 1735: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xeed7e010  ! 1736: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r23
	.word 0x81982586  ! 1737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0586, %hpstate
	.word 0xee9fe001  ! 1738: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r23
	.word 0xee57c000  ! 1739: LDSH_R	ldsh	[%r31 + %r0], %r23
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xee5fc000  ! 1740: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0x87802016  ! 1741: WRASI_I	wr	%r0, 0x0016, %asi
splash_tba_411:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1742: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81460000  ! 1743: RD_STICK_REG	stbar
	.word 0xee57e001  ! 1744: LDSH_I	ldsh	[%r31 + 0x0001], %r23
	.word 0xee1fc000  ! 1745: LDD_R	ldd	[%r31 + %r0], %r23
	.word 0xee4fe001  ! 1746: LDSB_I	ldsb	[%r31 + 0x0001], %r23
splash_htba_412:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1747: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87902126  ! 1748: WRPR_TT_I	wrpr	%r0, 0x0126, %tt
splash_tba_413:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1749: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xeec7e030  ! 1750: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r23
	.word 0xee5fe001  ! 1751: LDX_I	ldx	[%r31 + 0x0001], %r23
	.word 0x879023f6  ! 1752: WRPR_TT_I	wrpr	%r0, 0x03f6, %tt
	.word 0x8d902649  ! 1753: WRPR_PSTATE_I	wrpr	%r0, 0x0649, %pstate
	.word 0x879021cd  ! 1754: WRPR_TT_I	wrpr	%r0, 0x01cd, %tt
splash_tba_414:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1755: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_415:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1756: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_416:
	.word 0x22800001  ! 1758: BE	be,a	<label_0x1>
	pdist %f6, %f0, %f28
	.word 0xb5b34306  ! 1757: ALLIGNADDRESS	alignaddr	%r13, %r6, %r26
splash_lsu_417:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1758: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902083  ! 1759: WRPR_PSTATE_I	wrpr	%r0, 0x0083, %pstate
	.word 0x8d90209e  ! 1760: WRPR_PSTATE_I	wrpr	%r0, 0x009e, %pstate
	.word 0xf41fc000  ! 1761: LDD_R	ldd	[%r31 + %r0], %r26
	.word 0x87802089  ! 1762: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x97a149a0  ! 1763: FDIVs	fdivs	%f5, %f0, %f11
	.word 0xa351c000  ! 1764: RDPR_TL	rdpr	%tl, %r17
	.word 0x87802063  ! 1765: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x879023c9  ! 1766: WRPR_TT_I	wrpr	%r0, 0x03c9, %tt
splash_lsu_418:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1767: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982d5c  ! 1768: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5c, %hpstate
	.word 0xe29fe001  ! 1769: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r17
splash_htba_419:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1770: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_420:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1771: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x9150c000  ! 1773: RDPR_TT	rdpr	%tt, %r8
	.word 0xd007c000  ! 1774: LDUW_R	lduw	[%r31 + %r0], %r8
tagged_421:
	taddcctv %r13, 0x1f48, %r14
	.word 0xd007e001  ! 1775: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0x8d902206  ! 1776: WRPR_PSTATE_I	wrpr	%r0, 0x0206, %pstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1777: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_422:
	.word 0x22800001  ! 1779: BE	be,a	<label_0x1>
	pdist %f8, %f20, %f10
	.word 0x87b0830c  ! 1778: ALLIGNADDRESS	alignaddr	%r2, %r12, %r3
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1779: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819827df  ! 1780: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
	.word 0xc797e001  ! 1781: LDQFA_I	-	[%r31, 0x0001], %f3
	.word 0xb7508000  ! 1782: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x8f902001  ! 1784: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01961  ! 1783: FqTOd	dis not found

	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02033  ! 1785: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81982c44  ! 1786: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c44, %hpstate
	.word 0x8d902681  ! 1787: WRPR_PSTATE_I	wrpr	%r0, 0x0681, %pstate
	.word 0xe41fc000  ! 1788: LDD_R	ldd	[%r31 + %r0], %r18
splash_cmpr_424:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186e001  ! 1789: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0x87802004  ! 1790: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802004  ! 1791: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_425:
	.word 0x22800001  ! 1793: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1792: SAVE_R	save	%r31, %r0, %r31
	.word 0x8150c000  ! 1793: RDPR_TT	rdpr	%tt, %r0
splash_cmpr_426:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 1794: WR_STICK_REG_I	wr	%r13, 0x0001, %-
splash_lsu_427:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1795: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982606  ! 1796: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0606, %hpstate
	.word 0x8d902c9b  ! 1797: WRPR_PSTATE_I	wrpr	%r0, 0x0c9b, %pstate
	.word 0x8198241c  ! 1798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041c, %hpstate
	.word 0x9f802001  ! 1799: SIR	sir	0x0001
	.word 0xa1902006  ! 1800: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_lsu_428:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1801: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc017c000  ! 1802: LDUH_R	lduh	[%r31 + %r0], %r0
DS_429:
	.word 0x22800001  ! 1804: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1803: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1804: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 1805: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xc05fe001  ! 1806: LDX_I	ldx	[%r31 + 0x0001], %r0
tagged_430:
	tsubcctv %r25, 0x14ec, %r25
	.word 0xc007e001  ! 1807: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x87802089  ! 1808: WRASI_I	wr	%r0, 0x0089, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 1809: LDX_R	ldx	[%r31 + %r0], %r0
DS_431:
	.word 0x22800001  ! 1811: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1810: RESTORE_R	restore	%r31, %r0, %r31
tagged_432:
	tsubcctv %r5, 0x1a74, %r12
	.word 0xc007e001  ! 1811: LDUW_I	lduw	[%r31 + 0x0001], %r0
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 1812: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0x81982d9d  ! 1813: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9d, %hpstate
	.word 0x91d02033  ! 1814: Tcc_I	ta	icc_or_xcc, %r0 + 51
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 1815: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc007c000  ! 1816: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0x91d02031  ! 1817: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xc0800c80  ! 1818: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r0
	.word 0x8198239f  ! 1819: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039f, %hpstate
	.word 0x93902001  ! 1820: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8790212b  ! 1821: WRPR_TT_I	wrpr	%r0, 0x012b, %tt
	.word 0xc017c000  ! 1822: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc00fc000  ! 1823: LDUB_R	ldub	[%r31 + %r0], %r0
	.word 0x93902006  ! 1824: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902001  ! 1825: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9550c000  ! 1826: RDPR_TT	rdpr	%tt, %r10
	.word 0xd49fc020  ! 1827: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
splash_lsu_433:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1828: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 1829: SIR	sir	0x0001
	.word 0xd4c7e010  ! 1830: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r10
	.word 0xd4cfe030  ! 1831: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
DS_434:
	.word 0x34800001  ! 1833: BG	bg,a	<label_0x1>
	pdist %f6, %f14, %f24
	.word 0x81b30316  ! 1832: ALLIGNADDRESS	alignaddr	%r12, %r22, %r0
	.word 0xc00fe001  ! 1833: LDUB_I	ldub	[%r31 + 0x0001], %r0
	.word 0x91d02033  ! 1834: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902005  ! 1835: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x95464000  ! 1836: RD_STICK_CMPR_REG	rd	%-, %r10
	.word 0xa1902009  ! 1837: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d902852  ! 1838: WRPR_PSTATE_I	wrpr	%r0, 0x0852, %pstate
	.word 0x91d02030  ! 1839: Tcc_I	ta	icc_or_xcc, %r0 + 48
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd45fc000  ! 1840: LDX_R	ldx	[%r31 + %r0], %r10
DS_435:
	.word 0x34800001  ! 1842: BG	bg,a	<label_0x1>
	allclean
	.word 0xa5b44317  ! 1841: ALLIGNADDRESS	alignaddr	%r17, %r23, %r18
	.word 0x87802080  ! 1842: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802016  ! 1843: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa190200b  ! 1844: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x81982c46  ! 1845: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c46, %hpstate
tagged_436:
	tsubcctv %r19, 0x1700, %r13
	.word 0xe407e001  ! 1846: LDUW_I	lduw	[%r31 + 0x0001], %r18
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xe45fc000  ! 1847: LDX_R	ldx	[%r31 + %r0], %r18
splash_tba_437:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1848: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_438:
	.word 0x22800001  ! 1850: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1849: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_439:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1851: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182a001  ! 1850: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0xe48804a0  ! 1851: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
	.word 0x87802080  ! 1852: WRASI_I	wr	%r0, 0x0080, %asi
DS_440:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1853: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x20700001  ! 1854: BPN	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
tagged_441:
	taddcctv %r10, 0x1acc, %r15
	.word 0xe407e001  ! 1856: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0xe447e001  ! 1857: LDSW_I	ldsw	[%r31 + 0x0001], %r18
	.word 0x93d02032  ! 1858: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_cmpr_442:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182a001  ! 1859: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0x8d802000  ! 1860: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe48008a0  ! 1861: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x879022b6  ! 1862: WRPR_TT_I	wrpr	%r0, 0x02b6, %tt
DS_443:
	.word 0x22800001  ! 1864: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1863: SAVE_R	save	%r31, %r0, %r31
	.word 0xe4800c40  ! 1864: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r18
	.word 0x8d9028c7  ! 1865: WRPR_PSTATE_I	wrpr	%r0, 0x08c7, %pstate
	.word 0xe4d7e000  ! 1866: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
change_to_randtl_444:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1867: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_tba_445:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1868: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902003  ! 1869: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8780204f  ! 1870: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8d902609  ! 1871: WRPR_PSTATE_I	wrpr	%r0, 0x0609, %pstate
tagged_446:
	tsubcctv %r14, 0x17c6, %r22
	.word 0xe407e001  ! 1872: LDUW_I	lduw	[%r31 + 0x0001], %r18
DS_447:
	.word 0x32800001  ! 1874: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1873: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902e5d  ! 1874: WRPR_PSTATE_I	wrpr	%r0, 0x0e5d, %pstate
splash_tba_448:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1875: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902c12  ! 1876: WRPR_PSTATE_I	wrpr	%r0, 0x0c12, %pstate
	.word 0xe527e001  ! 1877: STF_I	st	%f18, [0x0001, %r31]
	.word 0x91508000  ! 1878: RDPR_TSTATE	rdpr	%tstate, %r8
	.word 0xd08008a0  ! 1879: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1880: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_449:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1881: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd0dfe000  ! 1882: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r8
splash_htba_450:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1883: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 1884: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 1885: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200c  ! 1887: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd0900e40  ! 1888: LDUHA_R	lduha	[%r0, %r0] 0x72, %r8
	ta	T_CHANGE_PRIV	! macro
	.word 0xa190200c  ! 1890: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87802004  ! 1891: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd09004a0  ! 1892: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd05fc000  ! 1893: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0xa3508000  ! 1894: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xe23fe001  ! 1895: STD_I	std	%r17, [%r31 + 0x0001]
	.word 0xe21fc000  ! 1896: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0xe21fe001  ! 1897: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0xe2d7e030  ! 1898: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r17
	.word 0x8f902002  ! 1900: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb16e6001  ! 1899: SDIVX_I	sdivx	%r25, 0x0001, %r24
	.word 0x8198281e  ! 1900: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081e, %hpstate
	.word 0x8d902493  ! 1901: WRPR_PSTATE_I	wrpr	%r0, 0x0493, %pstate
	ta	T_CHANGE_HPRIV	! macro
DS_452:
	.word 0x22800001  ! 1904: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1903: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87902164  ! 1904: WRPR_TT_I	wrpr	%r0, 0x0164, %tt
	.word 0xa190200a  ! 1905: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_tba_453:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1906: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902000  ! 1907: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_454:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1908: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_455:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1909: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_456:
	tsubcctv %r9, 0x1398, %r26
	.word 0xf007e001  ! 1910: LDUW_I	lduw	[%r31 + 0x0001], %r24
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1911: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf05fc000  ! 1912: LDX_R	ldx	[%r31 + %r0], %r24
	.word 0xf0c804a0  ! 1913: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r24
DS_457:
	.word 0x32800001  ! 1915: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 1915: BN	bn,a	<label_0x1>
	.word 0xd511c000  ! 1915: LDQF_R	-	[%r7, %r0], %f10
	.word 0x99a08838  ! 1914: FADDs	fadds	%f2, %f24, %f12
	.word 0xd8880e40  ! 1915: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
DS_458:
	.word 0x34800001  ! 1917: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1916: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200e  ! 1917: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d902880  ! 1918: WRPR_PSTATE_I	wrpr	%r0, 0x0880, %pstate
	.word 0xd8dfe010  ! 1919: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
DS_459:
	.word 0x22800001  ! 1921: BE	be,a	<label_0x1>
	.word 0xd334000a  ! 1921: STQF_R	-	%f9, [%r10, %r16]
	normalw
	.word 0x89458000  ! 1920: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8f902001  ! 1922: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89848008  ! 1921: WRTICK_R	wr	%r18, %r8, %tick
	.word 0xc8800b60  ! 1922: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r4
	.word 0x8d902652  ! 1923: WRPR_PSTATE_I	wrpr	%r0, 0x0652, %pstate
splash_tba_461:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1924: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879023eb  ! 1925: WRPR_TT_I	wrpr	%r0, 0x03eb, %tt
	.word 0x87802014  ! 1926: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc8c7e020  ! 1927: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	.word 0xc917c000  ! 1928: LDQF_R	-	[%r31, %r0], %f4
	.word 0xc8d7e000  ! 1929: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r4
tagged_462:
	tsubcctv %r25, 0x119d, %r3
	.word 0xc807e001  ! 1930: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x8198204e  ! 1931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x004e, %hpstate
DS_463:
	.word 0x34800001  ! 1933: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1932: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc8cfe010  ! 1933: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0xc8cfe000  ! 1934: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r4
DS_464:
	.word 0x22800001  ! 1936: BE	be,a	<label_0x1>
	.word 0xed36c005  ! 1936: STQF_R	-	%f22, [%r5, %r27]
	normalw
	.word 0x89458000  ! 1935: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x2e700001  ! 1936: BPVS	<illegal instruction>
	.word 0x819822d7  ! 1937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d7, %hpstate
splash_lsu_465:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1938: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02031  ! 1939: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x83d02030  ! 1940: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x87902235  ! 1941: WRPR_TT_I	wrpr	%r0, 0x0235, %tt
	.word 0x91d02035  ! 1942: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_466:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1943: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc81fc000  ! 1945: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xc8800ba0  ! 1946: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r4
	.word 0xc917c000  ! 1947: LDQF_R	-	[%r31, %r0], %f4
	.word 0x91d02033  ! 1948: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc80fe001  ! 1949: LDUB_I	ldub	[%r31 + 0x0001], %r4
splash_tba_467:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1950: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc8c004a0  ! 1951: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r4
	.word 0xc81fe001  ! 1952: LDD_I	ldd	[%r31 + 0x0001], %r4
	.word 0xa1902004  ! 1953: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xc8880e60  ! 1954: LDUBA_R	lduba	[%r0, %r0] 0x73, %r4
	.word 0xa1902000  ! 1955: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87802016  ! 1956: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x20700001  ! 1957: BPN	<illegal instruction>
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1958: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc89fc020  ! 1959: LDDA_R	ldda	[%r31, %r0] 0x01, %r4
	.word 0x819827c5  ! 1960: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c5, %hpstate
	.word 0xc88008a0  ! 1961: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc84fe001  ! 1962: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0x87802058  ! 1963: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902001  ! 1965: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb181000c  ! 1964: WR_STICK_REG_R	wr	%r4, %r12, %-
	.word 0xc827e001  ! 1965: STW_I	stw	%r4, [%r31 + 0x0001]
	.word 0xc8cfe010  ! 1966: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r4
	.word 0x8198275d  ! 1967: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075d, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc85fc000  ! 1968: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x8d902210  ! 1969: WRPR_PSTATE_I	wrpr	%r0, 0x0210, %pstate
	.word 0x87902273  ! 1970: WRPR_TT_I	wrpr	%r0, 0x0273, %tt
	.word 0x91d02033  ! 1971: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_lsu_469:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1972: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982ac6  ! 1973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac6, %hpstate
	.word 0xc917c000  ! 1974: LDQF_R	-	[%r31, %r0], %f4
	.word 0xa1902006  ! 1975: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xc9e7c02c  ! 1976: CASA_I	casa	[%r31] 0x 1, %r12, %r4
	.word 0xc88008a0  ! 1977: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 1978: LDX_R	ldx	[%r31 + %r0], %r4
DS_470:
	.word 0x34800001  ! 1980: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8da00544  ! 1980: FSQRTd	fsqrt	
	.word 0x8ba6c828  ! 1979: FADDs	fadds	%f27, %f8, %f5
	.word 0x91d020b5  ! 1980: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_htba_471:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1981: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_472:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1982: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcad7e030  ! 1983: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
	.word 0xca4fc000  ! 1984: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0x81982e16  ! 1985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e16, %hpstate
splash_lsu_473:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1986: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 1987: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87802088  ! 1988: WRASI_I	wr	%r0, 0x0088, %asi
splash_tba_474:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1989: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902095  ! 1990: WRPR_TT_I	wrpr	%r0, 0x0095, %tt
	.word 0x8198229d  ! 1991: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029d, %hpstate
	.word 0xca800ae0  ! 1992: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r5
	.word 0x9745c000  ! 1993: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xd647e001  ! 1994: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0xd627e001  ! 1995: STW_I	stw	%r11, [%r31 + 0x0001]
splash_lsu_475:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1996: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd6dfe010  ! 1997: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1998: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1999: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_476:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2000: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd717c000  ! 2001: LDQF_R	-	[%r31, %r0], %f11
	.word 0x8d802000  ! 2002: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd617e001  ! 2003: LDUH_I	lduh	[%r31 + 0x0001], %r11
DS_477:
	.word 0x20800001  ! 2005: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 2005: BNE	bne,a	<label_0x1>
	.word 0x97a0054c  ! 2005: FSQRTd	fsqrt	
	.word 0x85a60821  ! 2004: FADDs	fadds	%f24, %f1, %f2
	.word 0x8198251f  ! 2005: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051f, %hpstate
	.word 0x8d902e08  ! 2006: WRPR_PSTATE_I	wrpr	%r0, 0x0e08, %pstate
	.word 0x91d02031  ! 2007: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81982fd7  ! 2008: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd7, %hpstate
	.word 0x87802014  ! 2009: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x34800001  ! 2010: BG	bg,a	<label_0x1>
splash_cmpr_478:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 2011: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0xc4c00e60  ! 2012: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r2
	.word 0xc48008a0  ! 2013: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2014: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc41fe001  ! 2015: LDD_I	ldd	[%r31 + 0x0001], %r2
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2016: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32700001  ! 2017: BPNE	<illegal instruction>
change_to_randtl_479:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 2018: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 2019: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc40fe001  ! 2020: LDUB_I	ldub	[%r31 + 0x0001], %r2
	.word 0x8790227a  ! 2021: WRPR_TT_I	wrpr	%r0, 0x027a, %tt
tagged_480:
	tsubcctv %r1, 0x1d12, %r11
	.word 0xc407e001  ! 2022: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x8198279e  ! 2023: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079e, %hpstate
	.word 0xa1902004  ! 2024: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	ta	T_CHANGE_PRIV	! macro
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 2026: LDX_R	ldx	[%r31 + %r0], %r2
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2027: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_481:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2028: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb5540000  ! 2029: RDPR_GL	rdpr	%-, %r26
	.word 0x81460000  ! 2030: RD_STICK_REG	stbar
	.word 0x8751c000  ! 2031: RDPR_TL	<illegal instruction>
	.word 0xc657e001  ! 2032: LDSH_I	ldsh	[%r31 + 0x0001], %r3
	.word 0x81982f17  ! 2033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f17, %hpstate
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 2034: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x20800001  ! 2036: BN	bn,a	<label_0x1>
	.word 0x8f902001  ! 2038: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x916e2001  ! 2037: SDIVX_I	sdivx	%r24, 0x0001, %r8
	.word 0x8d902c16  ! 2038: WRPR_PSTATE_I	wrpr	%r0, 0x0c16, %pstate
	.word 0x8151c000  ! 2039: RDPR_TL	rdpr	%tl, %r0
	.word 0x91d020b3  ! 2040: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x91d02034  ! 2041: Tcc_I	ta	icc_or_xcc, %r0 + 52
tagged_483:
	taddcctv %r7, 0x1747, %r19
	.word 0xc007e001  ! 2042: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xc0d7e020  ! 2043: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r0
	.word 0xc04fe001  ! 2044: LDSB_I	ldsb	[%r31 + 0x0001], %r0
	.word 0xc08fe020  ! 2045: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r0
	.word 0x8f902001  ! 2047: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1814010  ! 2046: WR_STICK_REG_R	wr	%r5, %r16, %-
	.word 0xc017e001  ! 2047: LDUH_I	lduh	[%r31 + 0x0001], %r0
	.word 0x91d02034  ! 2048: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902002  ! 2049: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 2050: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xa1902009  ! 2051: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x20700001  ! 2052: BPN	<illegal instruction>
	.word 0xa1902009  ! 2053: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xc017e001  ! 2054: LDUH_I	lduh	[%r31 + 0x0001], %r0
splash_lsu_485:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2055: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 2056: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x89500000  ! 2057: RDPR_TPC	rdpr	%tpc, %r4
splash_htba_486:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 2058: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d90229f  ! 2059: WRPR_PSTATE_I	wrpr	%r0, 0x029f, %pstate
	.word 0xa190200b  ! 2060: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x91d020b3  ! 2061: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x91d020b5  ! 2062: Tcc_I	ta	icc_or_xcc, %r0 + 181
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 2064: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_487:
	.word 0x32800001  ! 2066: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 2065: SAVE_R	save	%r31, %r0, %r31
splash_tba_488:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2066: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902001  ! 2067: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc8d804a0  ! 2068: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0xc9e7c030  ! 2069: CASA_I	casa	[%r31] 0x 1, %r16, %r4
	.word 0x93902006  ! 2070: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 2071: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc80fe001  ! 2072: LDUB_I	ldub	[%r31 + 0x0001], %r4
splash_lsu_489:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2073: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc88008a0  ! 2074: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xa190200b  ! 2075: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xc84fc000  ! 2076: LDSB_R	ldsb	[%r31 + %r0], %r4
change_to_randtl_490:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 2077: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc85fc000  ! 2078: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x8d902893  ! 2079: WRPR_PSTATE_I	wrpr	%r0, 0x0893, %pstate
DS_491:
	.word 0x20800001  ! 2081: BN	bn,a	<label_0x1>
	pdist %f10, %f30, %f2
	.word 0x91b48308  ! 2080: ALLIGNADDRESS	alignaddr	%r18, %r8, %r8
	.word 0xd00fe001  ! 2081: LDUB_I	ldub	[%r31 + 0x0001], %r8
	.word 0xd09fe001  ! 2082: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r8
splash_lsu_492:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2083: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_493:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2085: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 2084: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd09004a0  ! 2086: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
tagged_494:
	tsubcctv %r12, 0x1faa, %r13
	.word 0xd007e001  ! 2087: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xd097e000  ! 2088: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r8
	.word 0x81982f04  ! 2089: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f04, %hpstate
splash_tba_495:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 2090: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd047e001  ! 2091: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	.word 0x87902095  ! 2092: WRPR_TT_I	wrpr	%r0, 0x0095, %tt
	.word 0xd0800c00  ! 2093: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r8
	.word 0x93902002  ! 2094: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_496:
	.word 0x34800001  ! 2096: BG	bg,a	<label_0x1>
	illtrap
	.word 0xe3150003  ! 2096: LDQF_R	-	[%r20, %r3], %f17
	.word 0x87a24827  ! 2095: FADDs	fadds	%f9, %f7, %f3
	.word 0x8d802000  ! 2096: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc62fe001  ! 2097: STB_I	stb	%r3, [%r31 + 0x0001]
	.word 0xc6880e40  ! 2098: LDUBA_R	lduba	[%r0, %r0] 0x72, %r3
splash_tba_497:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2099: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc65fe001  ! 2100: LDX_I	ldx	[%r31 + 0x0001], %r3
	.word 0xc6d7e010  ! 2101: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r3
	.word 0x879021a5  ! 2102: WRPR_TT_I	wrpr	%r0, 0x01a5, %tt
	.word 0x81982cd6  ! 2103: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd6, %hpstate
	.word 0x91d02030  ! 2104: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x2a800001  ! 2105: BCS	bcs,a	<label_0x1>
	.word 0xc6c7e000  ! 2106: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r3
	.word 0xc6c80e40  ! 2107: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r3
	.word 0x8780201c  ! 2108: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x93902002  ! 2109: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa9514000  ! 2110: RDPR_TBA	rdpr	%tba, %r20
	.word 0x93902006  ! 2111: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe817e001  ! 2112: LDUH_I	lduh	[%r31 + 0x0001], %r20
change_to_randtl_498:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 2113: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 2114: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_499:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2115: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x3e800001  ! 2116: BVC	bvc,a	<label_0x1>
DS_500:
	.word 0x34800001  ! 2118: BG	bg,a	<label_0x1>
	pdist %f0, %f2, %f12
	.word 0xa9b4430a  ! 2117: ALLIGNADDRESS	alignaddr	%r17, %r10, %r20
	.word 0x91d02034  ! 2118: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f902000  ! 2120: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x856e2001  ! 2119: SDIVX_I	sdivx	%r24, 0x0001, %r2
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 2120: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b5  ! 2121: Tcc_I	ta	icc_or_xcc, %r0 + 181
tagged_502:
	tsubcctv %r23, 0x1678, %r17
	.word 0xc407e001  ! 2122: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc48008a0  ! 2123: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc457e001  ! 2124: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0x84d40007  ! 2125: UMULcc_R	umulcc 	%r16, %r7, %r2
	.word 0x30700001  ! 2126: BPA	<illegal instruction>
	.word 0xc4d7e000  ! 2127: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 2129: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc4dfe020  ! 2130: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 2131: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0x8f902001  ! 2133: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb181c002  ! 2132: WR_STICK_REG_R	wr	%r7, %r2, %-
splash_tba_504:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 2133: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2134: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc48008a0  ! 2135: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
tagged_505:
	taddcctv %r23, 0x1ea5, %r26
	.word 0xc407e001  ! 2136: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x8790224e  ! 2137: WRPR_TT_I	wrpr	%r0, 0x024e, %tt
	.word 0x87802004  ! 2138: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x879020eb  ! 2139: WRPR_TT_I	wrpr	%r0, 0x00eb, %tt
DS_506:
	.word 0x34800001  ! 2141: BG	bg,a	<label_0x1>
	.word 0xd131a001  ! 2141: STQF_I	-	%f8, [0x0001, %r6]
	normalw
	.word 0x85458000  ! 2140: RD_SOFTINT_REG	rd	%softint, %r2
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc45fc000  ! 2141: LDX_R	ldx	[%r31 + %r0], %r2
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2142: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902004  ! 2143: WRPR_PSTATE_I	wrpr	%r0, 0x0004, %pstate
	.word 0x87802016  ! 2144: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x83d020b4  ! 2145: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x91494000  ! 2146: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0xd0cfe010  ! 2147: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 2148: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_507:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 2149: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x81982306  ! 2150: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0306, %hpstate
tagged_508:
	tsubcctv %r1, 0x1278, %r3
	.word 0xd007e001  ! 2151: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xd09004a0  ! 2152: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0x32700001  ! 2153: BPNE	<illegal instruction>
	.word 0x8f902000  ! 2155: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83692001  ! 2154: SDIVX_I	sdivx	%r4, 0x0001, %r1
	.word 0x2c700001  ! 2155: BPNEG	<illegal instruction>
splash_htba_510:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 2156: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902002  ! 2157: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xc28804a0  ! 2158: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
DS_511:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 2159: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
splash_lsu_512:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2160: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc257e001  ! 2161: LDSH_I	ldsh	[%r31 + 0x0001], %r1
	.word 0x8f902002  ! 2163: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95a01975  ! 2162: FqTOd	dis not found

splash_tba_514:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2163: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd45fe001  ! 2164: LDX_I	ldx	[%r31 + 0x0001], %r10
	.word 0xd44fc000  ! 2165: LDSB_R	ldsb	[%r31 + %r0], %r10
	.word 0xd437c015  ! 2166: STH_R	sth	%r10, [%r31 + %r21]
DS_515:
	.word 0x32800001  ! 2168: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 2167: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_516:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 2168: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982485  ! 2169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0485, %hpstate
	.word 0xd4cfe030  ! 2170: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
	.word 0xb1494000  ! 2171: RDHPR_HTBA	rdhpr	%htba, %r24
	.word 0x8d90285f  ! 2172: WRPR_PSTATE_I	wrpr	%r0, 0x085f, %pstate
	.word 0x91d02035  ! 2173: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x20800001  ! 2174: BN	bn,a	<label_0x1>
	.word 0x87802004  ! 2175: WRASI_I	wr	%r0, 0x0004, %asi
DS_517:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 2176: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x30700001  ! 2177: BPA	<illegal instruction>
	.word 0x93902002  ! 2178: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_518:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2179: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81460000  ! 2180: RD_STICK_REG	stbar
change_to_randtl_519:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 2181: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xf0dfe010  ! 2182: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r24
	.word 0x93504000  ! 2183: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0x8d902e8f  ! 2184: WRPR_PSTATE_I	wrpr	%r0, 0x0e8f, %pstate
	.word 0x91d02033  ! 2185: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902000  ! 2186: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02032  ! 2187: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_520:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2188: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36700001  ! 2189: BPGE	<illegal instruction>
	.word 0x8d902ecc  ! 2190: WRPR_PSTATE_I	wrpr	%r0, 0x0ecc, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982c57  ! 2192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c57, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2193: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd21fc000  ! 2194: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x87802088  ! 2195: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa1902002  ! 2196: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 2197: LDX_R	ldx	[%r31 + %r0], %r9
DS_521:
	.word 0x22800001  ! 2199: BE	be,a	<label_0x1>
	.word 0xd3320000  ! 2199: STQF_R	-	%f9, [%r0, %r8]
	normalw
	.word 0xa7458000  ! 2198: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x8d9020dd  ! 2199: WRPR_PSTATE_I	wrpr	%r0, 0x00dd, %pstate
	.word 0x93d020b0  ! 2200: Tcc_I	tne	icc_or_xcc, %r0 + 176
	.word 0x8d90224b  ! 2201: WRPR_PSTATE_I	wrpr	%r0, 0x024b, %pstate
	.word 0x8f902000  ! 2203: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89854001  ! 2202: WRTICK_R	wr	%r21, %r1, %tick
	.word 0x8d902486  ! 2203: WRPR_PSTATE_I	wrpr	%r0, 0x0486, %pstate
	.word 0x87802010  ! 2204: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8f902000  ! 2206: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b68e001  ! 2205: SDIVX_I	sdivx	%r3, 0x0001, %r13
splash_htba_524:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2206: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xda97e030  ! 2207: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	.word 0x87902019  ! 2208: WRPR_TT_I	wrpr	%r0, 0x0019, %tt
	.word 0xda4fc000  ! 2209: LDSB_R	ldsb	[%r31 + %r0], %r13
tagged_525:
	taddcctv %r6, 0x1706, %r2
	.word 0xda07e001  ! 2210: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x91d020b4  ! 2211: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x93902004  ! 2212: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802010  ! 2214: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93902000  ! 2215: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 2216: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x3e700001  ! 2217: BPVC	<illegal instruction>
	.word 0xdad7e020  ! 2218: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	.word 0xda8008a0  ! 2219: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
tagged_526:
	tsubcctv %r19, 0x1492, %r24
	.word 0xda07e001  ! 2220: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x81982747  ! 2221: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0747, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 2222: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x87902138  ! 2223: WRPR_TT_I	wrpr	%r0, 0x0138, %tt
	.word 0x91d02033  ! 2224: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xda0fc000  ! 2225: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0x91d02033  ! 2226: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_tba_527:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2227: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_528:
	tsubcctv %r9, 0x1a94, %r10
	.word 0xda07e001  ! 2228: LDUW_I	lduw	[%r31 + 0x0001], %r13
splash_cmpr_529:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2230: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181a001  ! 2229: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x9751c000  ! 2230: RDPR_TL	<illegal instruction>
tagged_530:
	tsubcctv %r22, 0x1a85, %r16
	.word 0xd607e001  ! 2231: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x87802004  ! 2232: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902001  ! 2233: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_htba_531:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 2234: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 2235: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd617c000  ! 2236: LDUH_R	lduh	[%r31 + %r0], %r11
	.word 0x22800001  ! 2237: BE	be,a	<label_0x1>
	.word 0x30800001  ! 2238: BA	ba,a	<label_0x1>
	.word 0x9b464000  ! 2239: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x87802014  ! 2240: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xda9fe001  ! 2241: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xdad7e030  ! 2242: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
splash_tba_532:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2243: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xda07c000  ! 2244: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0xda97e010  ! 2245: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
	.word 0x8f902002  ! 2247: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81a0196b  ! 2246: FqTOd	dis not found

	.word 0x8d464000  ! 2247: RD_STICK_CMPR_REG	rd	%-, %r6
DS_534:
	.word 0x20800001  ! 2249: BN	bn,a	<label_0x1>
	illtrap
	.word 0xa9a00551  ! 2249: FSQRTd	fsqrt	
	.word 0x9ba28829  ! 2248: FADDs	fadds	%f10, %f9, %f13
	.word 0x87902020  ! 2249: WRPR_TT_I	wrpr	%r0, 0x0020, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 2250: LDX_R	ldx	[%r31 + %r0], %r13
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 2251: LDX_R	ldx	[%r31 + %r0], %r13
tagged_535:
	taddcctv %r10, 0x1ace, %r16
	.word 0xda07e001  ! 2252: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdb17c000  ! 2253: LDQF_R	-	[%r31, %r0], %f13
	.word 0x22800001  ! 2254: BE	be,a	<label_0x1>
	.word 0xdac00e80  ! 2255: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r13
	.word 0xdac004a0  ! 2256: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
	.word 0x83d02035  ! 2257: Tcc_I	te	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
splash_lsu_536:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2259: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda9fe001  ! 2260: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xda0fe001  ! 2261: LDUB_I	ldub	[%r31 + 0x0001], %r13
splash_cmpr_537:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2263: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1836001  ! 2262: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0xda17c000  ! 2263: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0x91d02031  ! 2264: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8f902000  ! 2266: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb36e2001  ! 2265: SDIVX_I	sdivx	%r24, 0x0001, %r25
	.word 0xf2800b80  ! 2266: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r25
	.word 0xf2c00e40  ! 2267: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r25
	.word 0xb345c000  ! 2268: RD_TICK_CMPR_REG	rd	%-, %r25
splash_tba_539:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2269: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200f  ! 2270: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xf21fe001  ! 2271: LDD_I	ldd	[%r31 + 0x0001], %r25
	.word 0xf207c000  ! 2272: LDUW_R	lduw	[%r31 + %r0], %r25
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 2273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2d7e020  ! 2274: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r25
splash_lsu_540:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2275: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_541:
	taddcctv %r18, 0x161d, %r14
	.word 0xf207e001  ! 2276: LDUW_I	lduw	[%r31 + 0x0001], %r25
splash_lsu_542:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 2278: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf25fc000  ! 2279: LDX_R	ldx	[%r31 + %r0], %r25
	.word 0x8f902002  ! 2281: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8984000a  ! 2280: WRTICK_R	wr	%r16, %r10, %tick
	.word 0xf2c004a0  ! 2281: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r25
	.word 0x93902000  ! 2282: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_544:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2283: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb3500000  ! 2284: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x8d90220e  ! 2285: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
	.word 0x28800001  ! 2286: BLEU	bleu,a	<label_0x1>
	.word 0xf25fe001  ! 2287: LDX_I	ldx	[%r31 + 0x0001], %r25
	.word 0xf28008a0  ! 2288: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0xf2800aa0  ! 2289: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r25
DS_545:
	.word 0x22800001  ! 2291: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 2290: RESTORE_R	restore	%r31, %r0, %r31
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf25fc000  ! 2291: LDX_R	ldx	[%r31 + %r0], %r25
	.word 0x8351c000  ! 2292: RDPR_TL	rdpr	%tl, %r1
	.word 0x87802014  ! 2293: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc21fe001  ! 2294: LDD_I	ldd	[%r31 + 0x0001], %r1
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc25fc000  ! 2295: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xc23fe001  ! 2296: STD_I	std	%r1, [%r31 + 0x0001]
	.word 0xc24fc000  ! 2297: LDSB_R	ldsb	[%r31 + %r0], %r1
	.word 0x87802088  ! 2298: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xc29fe001  ! 2299: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0xc28008a0  ! 2300: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
splash_lsu_546:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2301: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_547:
	.word 0x20800001  ! 2303: BN	bn,a	<label_0x1>
	pdist %f30, %f6, %f8
	.word 0x93b40319  ! 2302: ALLIGNADDRESS	alignaddr	%r16, %r25, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 2303: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd2c7e030  ! 2304: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
	.word 0xd247c000  ! 2305: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0x93902001  ! 2306: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_tba_548:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2307: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902340  ! 2308: WRPR_TT_I	wrpr	%r0, 0x0340, %tt
	.word 0xd2cfe010  ! 2309: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x87902265  ! 2310: WRPR_TT_I	wrpr	%r0, 0x0265, %tt
	.word 0x87802080  ! 2311: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02032  ! 2312: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_549:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 2313: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd317c000  ! 2314: LDQF_R	-	[%r31, %r0], %f9
	.word 0xd2800c20  ! 2315: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
	.word 0xd217c000  ! 2316: LDUH_R	lduh	[%r31 + %r0], %r9
DS_550:
	.word 0x22800001  ! 2318: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 2317: SAVE_R	save	%r31, %r0, %r31
	.word 0xd29fe001  ! 2318: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
	.word 0xd327e001  ! 2319: STF_I	st	%f9, [0x0001, %r31]
	.word 0x99902001  ! 2320: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x93902004  ! 2321: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8f902002  ! 2323: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0196b  ! 2322: FqTOd	dis not found

	.word 0xe08008a0  ! 2323: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x26800001  ! 2324: BL	bl,a	<label_0x1>
	.word 0x93902001  ! 2325: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902899  ! 2326: WRPR_PSTATE_I	wrpr	%r0, 0x0899, %pstate
splash_htba_552:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 2327: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8780201c  ! 2328: WRASI_I	wr	%r0, 0x001c, %asi
change_to_randtl_553:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 2329: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x87902076  ! 2330: WRPR_TT_I	wrpr	%r0, 0x0076, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2331: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 2332: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02032  ! 2333: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81460000  ! 2334: RD_STICK_REG	stbar
splash_lsu_554:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2335: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 2337: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb180c008  ! 2336: WR_STICK_REG_R	wr	%r3, %r8, %-
	.word 0x93464000  ! 2337: RD_STICK_CMPR_REG	rd	%-, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 2338: LDX_R	ldx	[%r31 + %r0], %r9
splash_htba_556:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2339: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd247e001  ! 2340: LDSW_I	ldsw	[%r31 + 0x0001], %r9
	.word 0x2c700001  ! 2341: BPNEG	<illegal instruction>
splash_lsu_557:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2342: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902896  ! 2343: WRPR_PSTATE_I	wrpr	%r0, 0x0896, %pstate
splash_tba_558:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 2344: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x24700001  ! 2345: BPLE	<illegal instruction>
	.word 0x93902007  ! 2346: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa190200b  ! 2347: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2349: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd2800c60  ! 2350: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r9
	.word 0x91d020b1  ! 2351: Tcc_I	ta	icc_or_xcc, %r0 + 177
	.word 0x8f902002  ! 2353: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916a2001  ! 2352: SDIVX_I	sdivx	%r8, 0x0001, %r8
	.word 0x93902004  ! 2353: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902007  ! 2354: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x30700001  ! 2355: BPA	<illegal instruction>
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 2356: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902014  ! 2357: WRPR_PSTATE_I	wrpr	%r0, 0x0014, %pstate
	.word 0x93902007  ! 2358: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_560:
	.word 0x22800001  ! 2360: BE	be,a	<label_0x1>
	.word 0xe9352001  ! 2360: STQF_I	-	%f20, [0x0001, %r20]
	normalw
	.word 0x8b458000  ! 2359: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x87802058  ! 2360: WRASI_I	wr	%r0, 0x0058, %asi
tagged_561:
	taddcctv %r9, 0x14cf, %r16
	.word 0xca07e001  ! 2361: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xca9fe001  ! 2362: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
	.word 0x8d802000  ! 2363: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_562:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2364: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 2365: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x879020db  ! 2366: WRPR_TT_I	wrpr	%r0, 0x00db, %tt
change_to_randtl_563:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 2367: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xca57e001  ! 2368: LDSH_I	ldsh	[%r31 + 0x0001], %r5
tagged_564:
	tsubcctv %r17, 0x12af, %r23
	.word 0xca07e001  ! 2369: LDUW_I	lduw	[%r31 + 0x0001], %r5
tagged_565:
	taddcctv %r15, 0x1634, %r13
	.word 0xca07e001  ! 2370: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xa1902002  ! 2371: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x95a0056d  ! 2372: FSQRTq	fsqrt	
	.word 0x91d02030  ! 2373: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xd49fc020  ! 2374: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
splash_tba_566:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2375: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd4800aa0  ! 2376: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r10
splash_lsu_567:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 2379: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01965  ! 2378: FqTOd	dis not found

	.word 0x879020f4  ! 2379: WRPR_TT_I	wrpr	%r0, 0x00f4, %tt
	.word 0x87902133  ! 2380: WRPR_TT_I	wrpr	%r0, 0x0133, %tt
	.word 0xd21fe001  ! 2381: LDD_I	ldd	[%r31 + 0x0001], %r9
	.word 0x8d902817  ! 2382: WRPR_PSTATE_I	wrpr	%r0, 0x0817, %pstate
splash_tba_569:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2383: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b2  ! 2385: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd2dfe020  ! 2386: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r9
	.word 0xd397e001  ! 2387: LDQFA_I	-	[%r31, 0x0001], %f9
	.word 0xd2800ae0  ! 2388: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd25fc000  ! 2389: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd29fc020  ! 2390: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xd2d7e020  ! 2391: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r9
tagged_570:
	tsubcctv %r15, 0x1ff8, %r22
	.word 0xd207e001  ! 2392: LDUW_I	lduw	[%r31 + 0x0001], %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 2393: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8d494000  ! 2394: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0x87802063  ! 2395: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x87902392  ! 2396: WRPR_TT_I	wrpr	%r0, 0x0392, %tt
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xcc5fc000  ! 2397: LDX_R	ldx	[%r31 + %r0], %r6
	.word 0xcc47e001  ! 2398: LDSW_I	ldsw	[%r31 + 0x0001], %r6
DS_571:
	.word 0x32800001  ! 2400: BNE	bne,a	<label_0x1>
	.word 0xc931c004  ! 2400: STQF_R	-	%f4, [%r4, %r7]
	normalw
	.word 0x9b458000  ! 2399: RD_SOFTINT_REG	rd	%softint, %r13
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 2400: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x93902002  ! 2401: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902001  ! 2402: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8198225f  ! 2403: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025f, %hpstate
	.word 0xa1902002  ! 2404: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa1902001  ! 2405: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xda97e030  ! 2406: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	.word 0xdac80e60  ! 2407: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r13
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2408: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b508000  ! 2409: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0x93d02035  ! 2410: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_lsu_572:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2411: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982057  ! 2412: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0057, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 2413: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2414: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 2415: SIR	sir	0x0001
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 2416: LDX_R	ldx	[%r31 + %r0], %r5
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xca5fc000  ! 2417: LDX_R	ldx	[%r31 + %r0], %r5
splash_cmpr_573:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2419: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1836001  ! 2418: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x8d902a46  ! 2419: WRPR_PSTATE_I	wrpr	%r0, 0x0a46, %pstate
	.word 0xcb37e001  ! 2420: STQF_I	-	%f5, [0x0001, %r31]
tagged_574:
	tsubcctv %r23, 0x13b1, %r14
	.word 0xca07e001  ! 2421: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xca4fe001  ! 2422: LDSB_I	ldsb	[%r31 + 0x0001], %r5
	.word 0x8790233c  ! 2423: WRPR_TT_I	wrpr	%r0, 0x033c, %tt
	.word 0xca4fe001  ! 2424: LDSB_I	ldsb	[%r31 + 0x0001], %r5
	.word 0xcabfc024  ! 2425: STDA_R	stda	%r5, [%r31 + %r4] 0x01
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xca5fc000  ! 2426: LDX_R	ldx	[%r31 + %r0], %r5
DS_575:
	.word 0x34800001  ! 2428: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 2428: BN	bn,a	<label_0x1>
	.word 0xe9158009  ! 2428: LDQF_R	-	[%r22, %r9], %f20
	.word 0xa3a1882c  ! 2427: FADDs	fadds	%f6, %f12, %f17
	.word 0x9350c000  ! 2428: RDPR_TT	rdpr	%tt, %r9
	.word 0x81982114  ! 2429: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0114, %hpstate
	.word 0x87802058  ! 2430: WRASI_I	wr	%r0, 0x0058, %asi
DS_576:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 2431: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xd2c804a0  ! 2432: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 2433: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0x8f902000  ! 2435: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1830014  ! 2434: WR_STICK_REG_R	wr	%r12, %r20, %-
splash_lsu_578:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2435: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 2436: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_579:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2438: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181e001  ! 2437: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0xd25fe001  ! 2438: LDX_I	ldx	[%r31 + 0x0001], %r9
tagged_580:
	tsubcctv %r7, 0x120d, %r3
	.word 0xd207e001  ! 2439: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd2c804a0  ! 2440: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2441: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 2443: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x956a2001  ! 2442: SDIVX_I	sdivx	%r8, 0x0001, %r10
	.word 0x81982087  ! 2443: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0087, %hpstate
	.word 0x8f500000  ! 2444: RDPR_TPC	rdpr	%tpc, %r7
DS_582:
	.word 0x34800001  ! 2446: BG	bg,a	<label_0x1>
	.word 0xd336801a  ! 2446: STQF_R	-	%f9, [%r26, %r26]
	normalw
	.word 0x8f458000  ! 2445: RD_SOFTINT_REG	rd	%softint, %r7
splash_cmpr_583:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2447: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1842001  ! 2446: WR_STICK_REG_I	wr	%r16, 0x0001, %-
	.word 0x91d020b0  ! 2447: Tcc_I	ta	icc_or_xcc, %r0 + 176
	.word 0xce07c000  ! 2448: LDUW_R	lduw	[%r31 + %r0], %r7
	.word 0xce800bc0  ! 2449: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r7
	.word 0xce1fc000  ! 2450: LDD_R	ldd	[%r31 + %r0], %r7
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 2451: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 2452: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802004  ! 2453: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xce8804a0  ! 2454: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
	.word 0xcec7e030  ! 2455: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r7
DS_584:
	.word 0x34800001  ! 2457: BG	bg,a	<label_0x1>
	pdist %f26, %f0, %f22
	.word 0x99b18307  ! 2456: ALLIGNADDRESS	alignaddr	%r6, %r7, %r12
	.word 0xd80fc000  ! 2457: LDUB_R	ldub	[%r31 + %r0], %r12
	.word 0x819820c4  ! 2458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c4, %hpstate
change_to_randtl_585:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 2459: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xd817e001  ! 2460: LDUH_I	lduh	[%r31 + 0x0001], %r12
tagged_586:
	tsubcctv %r7, 0x1643, %r17
	.word 0xd807e001  ! 2461: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0xd89fe001  ! 2462: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd997e001  ! 2464: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0xd88008a0  ! 2465: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd88008a0  ! 2466: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd85fc000  ! 2467: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x93902003  ! 2468: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd80fe001  ! 2469: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0xd88008a0  ! 2470: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x95540000  ! 2471: RDPR_GL	rdpr	%-, %r10
	.word 0x8f902001  ! 2473: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81a01963  ! 2472: FqTOd	dis not found

	.word 0x91d02031  ! 2473: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x9f802001  ! 2474: SIR	sir	0x0001
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 2475: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc097e000  ! 2476: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r0
	.word 0xc0c7e000  ! 2477: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
splash_lsu_588:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2478: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81460000  ! 2479: RD_STICK_REG	stbar
	.word 0xc0dfe000  ! 2480: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r0
DS_589:
	.word 0x34800001  ! 2482: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 2482: BN	bn,a	<label_0x1>
	.word 0x95a00546  ! 2482: FSQRTd	fsqrt	
	.word 0x85a34828  ! 2481: FADDs	fadds	%f13, %f8, %f2
	.word 0x91d02034  ! 2482: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81982d1c  ! 2483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1c, %hpstate
	.word 0xc4c004a0  ! 2484: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
	.word 0xc407c000  ! 2485: LDUW_R	lduw	[%r31 + %r0], %r2
splash_cmpr_590:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1852001  ! 2486: WR_STICK_REG_I	wr	%r20, 0x0001, %-
splash_lsu_591:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2487: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_592:
	.word 0x20800001  ! 2489: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 2488: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc48008a0  ! 2489: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc517c000  ! 2490: LDQF_R	-	[%r31, %r0], %f2
	.word 0x2a700001  ! 2491: BPCS	<illegal instruction>
	.word 0x91d020b4  ! 2492: Tcc_I	ta	icc_or_xcc, %r0 + 180
DS_593:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 2493: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x879020f9  ! 2494: WRPR_TT_I	wrpr	%r0, 0x00f9, %tt
splash_lsu_594:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2495: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 2496: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_htba_595:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2497: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87802063  ! 2498: WRASI_I	wr	%r0, 0x0063, %asi
splash_lsu_596:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2499: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 2500: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x87902368  ! 2501: WRPR_TT_I	wrpr	%r0, 0x0368, %tt
	.word 0x81982746  ! 2502: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0746, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc45fc000  ! 2503: LDX_R	ldx	[%r31 + %r0], %r2
splash_lsu_597:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2504: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83a50d38  ! 2505: FsMULd	fsmuld	%f20, %f24, %f32
	.word 0xaf500000  ! 2506: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xef3fe001  ! 2507: STDF_I	std	%f23, [0x0001, %r31]
	.word 0x819825df  ! 2508: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05df, %hpstate
	.word 0xee7fe001  ! 2509: SWAP_I	swap	%r23, [%r31 + 0x0001]
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xee5fc000  ! 2510: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0x9750c000  ! 2511: RDPR_TT	rdpr	%tt, %r11
	.word 0x87902055  ! 2512: WRPR_TT_I	wrpr	%r0, 0x0055, %tt
	.word 0xd61fe001  ! 2513: LDD_I	ldd	[%r31 + 0x0001], %r11
	.word 0x91d020b5  ! 2514: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x2e800001  ! 2515: BVS	bvs,a	<label_0x1>
	.word 0x24700001  ! 2516: BPLE	<illegal instruction>
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 2517: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd657e001  ! 2518: LDSH_I	ldsh	[%r31 + 0x0001], %r11
	.word 0x819820df  ! 2519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00df, %hpstate
	.word 0x93902005  ! 2520: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_tba_598:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2521: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200a  ! 2522: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd607c000  ! 2523: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x83d02031  ! 2524: Tcc_I	te	icc_or_xcc, %r0 + 49
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 2525: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd69fc020  ! 2526: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
DS_599:
	.word 0x22800001  ! 2528: BE	be,a	<label_0x1>
	.word 0xdb34400c  ! 2528: STQF_R	-	%f13, [%r12, %r17]
	normalw
	.word 0x9b458000  ! 2527: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x9f802001  ! 2528: SIR	sir	0x0001
	.word 0xa1902001  ! 2529: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 2530: LDX_R	ldx	[%r31 + %r0], %r13
tagged_600:
	tsubcctv %r22, 0x136f, %r11
	.word 0xda07e001  ! 2531: LDUW_I	lduw	[%r31 + 0x0001], %r13
tagged_601:
	taddcctv %r15, 0x11aa, %r4
	.word 0xda07e001  ! 2532: LDUW_I	lduw	[%r31 + 0x0001], %r13
splash_htba_602:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2533: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xda97e010  ! 2534: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
	.word 0x93902004  ! 2535: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_lsu_603:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2536: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97508000  ! 2537: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0x8780204f  ! 2538: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd607c000  ! 2539: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0xd647c000  ! 2540: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0x819828c4  ! 2541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c4, %hpstate
	.word 0xd6c804a0  ! 2542: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
DS_604:
	.word 0x32800001  ! 2544: BNE	bne,a	<label_0x1>
	.word 0xe932a001  ! 2544: STQF_I	-	%f20, [0x0001, %r10]
	normalw
	.word 0x9b458000  ! 2543: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8780201c  ! 2544: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xda8fe030  ! 2545: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
DS_605:
	.word 0x34800001  ! 2547: BG	bg,a	<label_0x1>
	.word 0xd734e001  ! 2547: STQF_I	-	%f11, [0x0001, %r19]
	normalw
	.word 0x8f458000  ! 2546: RD_SOFTINT_REG	rd	%softint, %r7
tagged_606:
	tsubcctv %r18, 0x12a3, %r9
	.word 0xce07e001  ! 2547: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x8790226c  ! 2548: WRPR_TT_I	wrpr	%r0, 0x026c, %tt
DS_607:
	.word 0x22800001  ! 2550: BE	be,a	<label_0x1>
	pdist %f24, %f10, %f10
	.word 0x93b34319  ! 2549: ALLIGNADDRESS	alignaddr	%r13, %r25, %r9
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2550: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_608:
	.word 0x32800001  ! 2552: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 2551: RESTORE_R	restore	%r31, %r0, %r31
DS_609:
	.word 0x20800001  ! 2553: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 2552: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93480000  ! 2553: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2554: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902008  ! 2555: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xaf50c000  ! 2556: RDPR_TT	rdpr	%tt, %r23
tagged_610:
	tsubcctv %r17, 0x1bdf, %r1
	.word 0xee07e001  ! 2557: LDUW_I	lduw	[%r31 + 0x0001], %r23
	.word 0xa190200e  ! 2558: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xee17c000  ! 2559: LDUH_R	lduh	[%r31 + %r0], %r23
splash_cmpr_611:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2561: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1802001  ! 2560: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	.word 0x91d02035  ! 2561: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x2e700001  ! 2562: BPVS	<illegal instruction>
	.word 0xa9540000  ! 2563: RDPR_GL	rdpr	%-, %r20
DS_612:
	.word 0x22800001  ! 2565: BE	be,a	<label_0x1>
	allclean
	.word 0xb3b24301  ! 2564: ALLIGNADDRESS	alignaddr	%r9, %r1, %r25
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf25fc000  ! 2565: LDX_R	ldx	[%r31 + %r0], %r25
	.word 0xb1540000  ! 2566: RDPR_GL	<illegal instruction>
tagged_613:
	taddcctv %r8, 0x101f, %r11
	.word 0xf007e001  ! 2567: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0x8d802004  ! 2568: WRFPRS_I	wr	%r0, 0x0004, %fprs
change_to_randtl_614:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 2569: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802080  ! 2570: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x2e800001  ! 2571: BVS	bvs,a	<label_0x1>
	.word 0x879020f6  ! 2572: WRPR_TT_I	wrpr	%r0, 0x00f6, %tt
DS_615:
	.word 0x34800001  ! 2574: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 2574: BE	be,a	<label_0x1>
	.word 0xa3a00544  ! 2574: FSQRTd	fsqrt	
	.word 0x95a08829  ! 2573: FADDs	fadds	%f2, %f9, %f10
	.word 0x9f802001  ! 2574: SIR	sir	0x0001
DS_616:
	.word 0x22800001  ! 2576: BE	be,a	<label_0x1>
	pdist %f4, %f20, %f16
	.word 0xadb68307  ! 2575: ALLIGNADDRESS	alignaddr	%r26, %r7, %r22
	.word 0xec1fe001  ! 2576: LDD_I	ldd	[%r31 + 0x0001], %r22
	.word 0x81982ccd  ! 2577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ccd, %hpstate
	.word 0xa190200c  ! 2578: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93d020b2  ! 2579: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x8d9028d3  ! 2580: WRPR_PSTATE_I	wrpr	%r0, 0x08d3, %pstate
	.word 0xa190200e  ! 2581: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xec9fc020  ! 2582: LDDA_R	ldda	[%r31, %r0] 0x01, %r22
	.word 0x93902001  ! 2583: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_617:
	.word 0x20800001  ! 2585: BN	bn,a	<label_0x1>
	pdist %f8, %f10, %f14
	.word 0xa3b54309  ! 2584: ALLIGNADDRESS	alignaddr	%r21, %r9, %r17
	.word 0x83d02031  ! 2585: Tcc_I	te	icc_or_xcc, %r0 + 49
tagged_618:
	tsubcctv %r8, 0x13f9, %r2
	.word 0xe207e001  ! 2586: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x87802004  ! 2587: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902002  ! 2588: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe247e001  ! 2589: LDSW_I	ldsw	[%r31 + 0x0001], %r17
	.word 0xe28008a0  ! 2590: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2591: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b508000  ! 2592: RDPR_TSTATE	rdpr	%tstate, %r5
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 2593: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_619:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2594: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xb5508000  ! 2595: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x2a800001  ! 2596: BCS	bcs,a	<label_0x1>
splash_htba_620:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2597: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_cmpr_621:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2599: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181e001  ! 2598: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0xf497e020  ! 2599: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r26
	.word 0xf40fe001  ! 2600: LDUB_I	ldub	[%r31 + 0x0001], %r26
	.word 0xf597e001  ! 2601: LDQFA_I	-	[%r31, 0x0001], %f26
	.word 0x93902007  ! 2602: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902002  ! 2603: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902007  ! 2604: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_cmpr_622:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186e001  ! 2605: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0x879023ab  ! 2606: WRPR_TT_I	wrpr	%r0, 0x03ab, %tt
	.word 0xa190200c  ! 2607: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xf48008a0  ! 2608: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
splash_lsu_623:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2609: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x819821c5  ! 2610: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c5, %hpstate
splash_tba_624:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 2611: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802004  ! 2612: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf4c7e010  ! 2613: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r26
DS_625:
	.word 0x34800001  ! 2615: BG	bg,a	<label_0x1>
	.word 0xcf320000  ! 2615: STQF_R	-	%f7, [%r0, %r8]
	normalw
	.word 0x97458000  ! 2614: RD_SOFTINT_REG	rd	%softint, %r11
splash_lsu_626:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2615: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x36700001  ! 2616: BPGE	<illegal instruction>
	.word 0x87802063  ! 2617: WRASI_I	wr	%r0, 0x0063, %asi
splash_tba_627:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 2618: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 2619: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5a549e8  ! 2620: FDIVq	dis not found

	.word 0x34700001  ! 2621: BPG	<illegal instruction>
	.word 0x87902106  ! 2622: WRPR_TT_I	wrpr	%r0, 0x0106, %tt
tagged_628:
	tsubcctv %r23, 0x1bd0, %r17
	.word 0xe407e001  ! 2623: LDUW_I	lduw	[%r31 + 0x0001], %r18
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 2624: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8198228f  ! 2625: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028f, %hpstate
	.word 0x8790212d  ! 2626: WRPR_TT_I	wrpr	%r0, 0x012d, %tt
	.word 0x91d02030  ! 2627: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xe48008a0  ! 2628: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
splash_lsu_629:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2629: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02031  ! 2630: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x91d02035  ! 2631: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe4c80e80  ! 2632: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r18
	.word 0xe49fc020  ! 2633: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0x91d02033  ! 2634: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d9022cc  ! 2635: WRPR_PSTATE_I	wrpr	%r0, 0x02cc, %pstate
	.word 0x38800001  ! 2636: BGU	bgu,a	<label_0x1>
	.word 0xe457c000  ! 2637: LDSH_R	ldsh	[%r31 + %r0], %r18
	.word 0x24800001  ! 2638: BLE	ble,a	<label_0x1>
	.word 0x8790234b  ! 2639: WRPR_TT_I	wrpr	%r0, 0x034b, %tt
tagged_630:
	tsubcctv %r11, 0x1d8e, %r18
	.word 0xe407e001  ! 2640: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x91d02030  ! 2641: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8790231a  ! 2642: WRPR_TT_I	wrpr	%r0, 0x031a, %tt
	.word 0xe49fc020  ! 2643: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0xe48008a0  ! 2644: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa190200b  ! 2645: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_lsu_631:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2646: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe4d004a0  ! 2647: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
DS_632:
	.word 0x32800001  ! 2649: BNE	bne,a	<label_0x1>
	.word 0xd9302001  ! 2649: STQF_I	-	%f12, [0x0001, %r0]
	normalw
	.word 0x97458000  ! 2648: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x26700001  ! 2649: BPL	<illegal instruction>
	.word 0xd737c008  ! 2650: STQF_R	-	%f11, [%r8, %r31]
	.word 0x87802080  ! 2651: WRASI_I	wr	%r0, 0x0080, %asi
tagged_633:
	taddcctv %r16, 0x1c1f, %r10
	.word 0xd607e001  ! 2652: LDUW_I	lduw	[%r31 + 0x0001], %r11
tagged_634:
	tsubcctv %r18, 0x1613, %r24
	.word 0xd607e001  ! 2653: LDUW_I	lduw	[%r31 + 0x0001], %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x81460000  ! 2655: RD_STICK_REG	stbar
	.word 0x8d902a1e  ! 2656: WRPR_PSTATE_I	wrpr	%r0, 0x0a1e, %pstate
	.word 0xd6800a60  ! 2657: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r11
splash_lsu_635:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2658: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3a800001  ! 2659: BCC	bcc,a	<label_0x1>
	.word 0xd6dfe000  ! 2660: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	.word 0x87802016  ! 2661: WRASI_I	wr	%r0, 0x0016, %asi
DS_636:
	.word 0x32800001  ! 2663: BNE	bne,a	<label_0x1>
	allclean
	.word 0x9bb34316  ! 2662: ALLIGNADDRESS	alignaddr	%r13, %r22, %r13
DS_637:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 2663: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x91d020b0  ! 2664: Tcc_I	ta	icc_or_xcc, %r0 + 176
	.word 0x93902000  ! 2665: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x30700001  ! 2666: BPA	<illegal instruction>
	.word 0xda9fe001  ! 2667: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
splash_htba_638:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2668: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xda880e80  ! 2669: LDUBA_R	lduba	[%r0, %r0] 0x74, %r13
	.word 0x93902007  ! 2670: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_tba_639:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 2671: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xda5fc000  ! 2672: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda800c00  ! 2673: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r13
	.word 0xdac7e020  ! 2674: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	.word 0xa190200c  ! 2675: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1902007  ! 2676: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x91d02034  ! 2677: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xda0fc000  ! 2678: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0xda0fe001  ! 2679: LDUB_I	ldub	[%r31 + 0x0001], %r13
splash_tba_640:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2680: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902321  ! 2681: WRPR_TT_I	wrpr	%r0, 0x0321, %tt
	.word 0x8d9026ce  ! 2682: WRPR_PSTATE_I	wrpr	%r0, 0x06ce, %pstate
	.word 0xda8fe030  ! 2683: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0xdac7e020  ! 2684: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	.word 0x8d90200a  ! 2685: WRPR_PSTATE_I	wrpr	%r0, 0x000a, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xda5fc000  ! 2686: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda9fe001  ! 2687: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0x2a800001  ! 2688: BCS	bcs,a	<label_0x1>
	.word 0x8d802000  ! 2689: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xda800b60  ! 2690: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r13
	.word 0x91d02035  ! 2691: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xda17c000  ! 2692: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0x87802063  ! 2693: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x87802016  ! 2694: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93902007  ! 2695: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d9024cc  ! 2696: WRPR_PSTATE_I	wrpr	%r0, 0x04cc, %pstate
	.word 0xdadfe020  ! 2697: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
	.word 0xda9fc020  ! 2698: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	.word 0xdb97e001  ! 2699: LDQFA_I	-	[%r31, 0x0001], %f13
	.word 0xdacfe010  ! 2700: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r13
	.word 0x89540000  ! 2701: RDPR_GL	rdpr	%-, %r4
DS_641:
	.word 0x32800001  ! 2703: BNE	bne,a	<label_0x1>
	pdist %f26, %f4, %f16
	.word 0xb7b00318  ! 2702: ALLIGNADDRESS	alignaddr	%r0, %r24, %r27
	.word 0x8d902c14  ! 2703: WRPR_PSTATE_I	wrpr	%r0, 0x0c14, %pstate
	.word 0x93d02030  ! 2704: Tcc_I	tne	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_PRIV	! macro
	.word 0x83d02032  ! 2706: Tcc_I	te	icc_or_xcc, %r0 + 50
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xf65fc000  ! 2707: LDX_R	ldx	[%r31 + %r0], %r27
	.word 0xf617c000  ! 2708: LDUH_R	lduh	[%r31 + %r0], %r27
	.word 0x83464000  ! 2709: RD_STICK_CMPR_REG	rd	%-, %r1
	.word 0xc28008a0  ! 2710: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x91d02031  ! 2711: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81982414  ! 2712: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0414, %hpstate
	.word 0xc2d004a0  ! 2713: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0xc2d7e010  ! 2714: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
DS_642:
	.word 0x22800001  ! 2716: BE	be,a	<label_0x1>
	.word 0xdb32e001  ! 2716: STQF_I	-	%f13, [0x0001, %r11]
	normalw
	.word 0x8d458000  ! 2715: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x83d020b5  ! 2716: Tcc_I	te	icc_or_xcc, %r0 + 181
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xcc5fc000  ! 2717: LDX_R	ldx	[%r31 + %r0], %r6
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2718: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc8008a0  ! 2720: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x81982644  ! 2721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0644, %hpstate
DS_643:
	.word 0x32800001  ! 2723: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 2723: BNE	bne,a	<label_0x1>
	.word 0x9ba00553  ! 2723: FSQRTd	fsqrt	
	.word 0x93a64833  ! 2722: FADDs	fadds	%f25, %f19, %f9
splash_lsu_644:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2723: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd2c804a0  ! 2724: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 2725: LDX_R	ldx	[%r31 + %r0], %r9
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd25fc000  ! 2726: LDX_R	ldx	[%r31 + %r0], %r9
	.word 0xd28008a0  ! 2727: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x9351c000  ! 2728: RDPR_TL	rdpr	%tl, %r9
	.word 0xa1902008  ! 2729: WRPR_GL_I	wrpr	%r0, 0x0008, %-
tagged_645:
	taddcctv %r23, 0x1500, %r25
	.word 0xd207e001  ! 2730: LDUW_I	lduw	[%r31 + 0x0001], %r9
tagged_646:
	tsubcctv %r13, 0x1b6d, %r15
	.word 0xd207e001  ! 2731: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x83480000  ! 2732: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x99902002  ! 2734: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x87902346  ! 2735: WRPR_TT_I	wrpr	%r0, 0x0346, %tt
	.word 0xc2c7e020  ! 2736: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	.word 0xc2d804a0  ! 2737: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
splash_cmpr_647:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2739: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181a001  ! 2738: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 2739: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81500000  ! 2740: RDPR_TPC	<illegal instruction>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xc05fc000  ! 2741: LDX_R	ldx	[%r31 + %r0], %r0
splash_lsu_648:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2742: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b2  ! 2743: Tcc_I	tne	icc_or_xcc, %r0 + 178
tagged_649:
	taddcctv %r17, 0x17fb, %r22
	.word 0xc007e001  ! 2744: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x93902007  ! 2745: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_650:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2746: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc01fc000  ! 2747: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x81982b04  ! 2748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b04, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc05fc000  ! 2749: LDX_R	ldx	[%r31 + %r0], %r0
	.word 0xc047c000  ! 2750: LDSW_R	ldsw	[%r31 + %r0], %r0
	.word 0x87802016  ! 2751: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xb545c000  ! 2752: RD_TICK_CMPR_REG	rd	%-, %r26
	ta	T_CHANGE_HPRIV	! macro
splash_tba_651:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 2754: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf49fc020  ! 2755: LDDA_R	ldda	[%r31, %r0] 0x01, %r26
splash_lsu_652:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2756: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902002  ! 2757: WRPR_GL_I	wrpr	%r0, 0x0002, %-
DS_653:
	.word 0x20800001  ! 2759: BN	bn,a	<label_0x1>
	pdist %f4, %f26, %f20
	.word 0xa7b24314  ! 2758: ALLIGNADDRESS	alignaddr	%r9, %r20, %r19
splash_tba_654:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 2759: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe617c000  ! 2760: LDUH_R	lduh	[%r31 + %r0], %r19
	.word 0x26700001  ! 2761: BPL	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe60fc000  ! 2763: LDUB_R	ldub	[%r31 + %r0], %r19
	.word 0xa1902008  ! 2764: WRPR_GL_I	wrpr	%r0, 0x0008, %-
tagged_655:
	taddcctv %r21, 0x1ed8, %r22
	.word 0xe607e001  ! 2765: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xe697e030  ! 2766: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r19
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2767: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe68008a0  ! 2768: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
DS_656:
	.word 0x22800001  ! 2770: BE	be,a	<label_0x1>
	.word 0xc936e001  ! 2770: STQF_I	-	%f4, [0x0001, %r27]
	normalw
	.word 0x9b458000  ! 2769: RD_SOFTINT_REG	rd	%softint, %r13
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 2770: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 2771: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x3e800001  ! 2772: BVC	bvc,a	<label_0x1>
	.word 0xda0fe001  ! 2773: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0xda8008a0  ! 2774: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xda4fc000  ! 2775: LDSB_R	ldsb	[%r31 + %r0], %r13
splash_lsu_657:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2776: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xda5fc000  ! 2777: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xda8008a0  ! 2778: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_lsu_658:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2779: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x38800001  ! 2780: BGU	bgu,a	<label_0x1>
	.word 0x8790213d  ! 2781: WRPR_TT_I	wrpr	%r0, 0x013d, %tt
	.word 0x8d902c17  ! 2782: WRPR_PSTATE_I	wrpr	%r0, 0x0c17, %pstate
	.word 0x8f508000  ! 2783: RDPR_TSTATE	rdpr	%tstate, %r7
splash_tba_659:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2784: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcec004a0  ! 2785: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
splash_tba_660:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 2786: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_661:
	.word 0x34800001  ! 2788: BG	bg,a	<label_0x1>
	.word 0xd1304007  ! 2788: STQF_R	-	%f8, [%r7, %r1]
	normalw
	.word 0xb5458000  ! 2787: RD_SOFTINT_REG	rd	%softint, %r26
	.word 0xf447c000  ! 2788: LDSW_R	ldsw	[%r31 + %r0], %r26
	.word 0x87a349c9  ! 2789: FDIVd	fdivd	%f44, %f40, %f34
splash_tba_662:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2790: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 2791: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_663:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2792: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_664:
	tsubcctv %r24, 0x1b6a, %r24
	.word 0xc607e001  ! 2793: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x83d020b2  ! 2794: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x8f902000  ! 2796: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89860008  ! 2795: WRTICK_R	wr	%r24, %r8, %tick
tagged_666:
	tsubcctv %r1, 0x169a, %r13
	.word 0xc607e001  ! 2796: LDUW_I	lduw	[%r31 + 0x0001], %r3
tagged_667:
	taddcctv %r21, 0x1a0c, %r13
	.word 0xc607e001  ! 2797: LDUW_I	lduw	[%r31 + 0x0001], %r3
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 2798: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 2799: WRASI_I	wr	%r0, 0x0004, %asi
splash_tba_668:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2800: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x28700001  ! 2801: BPLEU	<illegal instruction>
	.word 0x93902006  ! 2802: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc68008a0  ! 2803: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
tagged_669:
	taddcctv %r26, 0x15a3, %r10
	.word 0xc607e001  ! 2804: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc6800a80  ! 2805: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r3
	.word 0x8d902e85  ! 2806: WRPR_PSTATE_I	wrpr	%r0, 0x0e85, %pstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2807: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_670:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2808: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_671:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2809: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc617c000  ! 2810: LDUH_R	lduh	[%r31 + %r0], %r3
splash_tba_672:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 2811: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc6800c00  ! 2812: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r3
	.word 0xa190200d  ! 2813: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902000  ! 2814: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_673:
	taddcctv %r20, 0x17bd, %r8
	.word 0xc607e001  ! 2815: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x93902003  ! 2816: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc607c000  ! 2817: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0x8d902212  ! 2818: WRPR_PSTATE_I	wrpr	%r0, 0x0212, %pstate
	.word 0xc797e001  ! 2819: LDQFA_I	-	[%r31, 0x0001], %f3
	.word 0x8d902443  ! 2820: WRPR_PSTATE_I	wrpr	%r0, 0x0443, %pstate
	.word 0xa1902009  ! 2821: WRPR_GL_I	wrpr	%r0, 0x0009, %-
tagged_674:
	tsubcctv %r5, 0x1547, %r2
	.word 0xc607e001  ! 2822: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc6d80e40  ! 2823: LDXA_R	ldxa	[%r0, %r0] 0x72, %r3
splash_tba_675:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 2824: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc61fe001  ! 2825: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x93902007  ! 2826: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_tba_676:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2827: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_677:
	taddcctv %r10, 0x12f4, %r1
	.word 0xc607e001  ! 2828: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x99902000  ! 2829: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x896e0001  ! 2830: SDIVX_R	sdivx	%r24, %r1, %r4
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 2831: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 2832: BVS	bvs,a	<label_0x1>
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xc85fc000  ! 2833: LDX_R	ldx	[%r31 + %r0], %r4
splash_lsu_678:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2834: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc88fe010  ! 2835: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r4
	.word 0xc897e010  ! 2836: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r4
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 2837: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_679:
	taddcctv %r25, 0x1d82, %r12
	.word 0xc807e001  ! 2838: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x9f802001  ! 2839: SIR	sir	0x0001
change_to_randtl_680:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 2840: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f504000  ! 2841: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0xce9004a0  ! 2842: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2843: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95500000  ! 2844: RDPR_TPC	rdpr	%tpc, %r10
	.word 0xa1902001  ! 2845: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x87464000  ! 2846: RD_STICK_CMPR_REG	rd	%-, %r3
	.word 0xad504000  ! 2847: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x8d902e95  ! 2848: WRPR_PSTATE_I	wrpr	%r0, 0x0e95, %pstate
	.word 0xec4fc000  ! 2849: LDSB_R	ldsb	[%r31 + %r0], %r22
	ta	T_CHANGE_PRIV	! macro
DS_681:
	.word 0x32800001  ! 2852: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 2852: BE	be,a	<label_0x1>
	.word 0x8fa0054a  ! 2852: FSQRTd	fsqrt	
	.word 0x87a28838  ! 2851: FADDs	fadds	%f10, %f24, %f3
	.word 0xc60fe001  ! 2852: LDUB_I	ldub	[%r31 + 0x0001], %r3
tagged_682:
	tsubcctv %r23, 0x1a7d, %r25
	.word 0xc607e001  ! 2853: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x9145c000  ! 2854: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x8790222a  ! 2855: WRPR_TT_I	wrpr	%r0, 0x022a, %tt
splash_lsu_683:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2856: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x819829c7  ! 2857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c7, %hpstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd05fc000  ! 2858: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x83d02035  ! 2859: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xd0d004a0  ! 2860: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
DS_684:
	.word 0x20800001  ! 2862: BN	bn,a	<label_0x1>
	illtrap
	.word 0xb5a00545  ! 2862: FSQRTd	fsqrt	
	.word 0xa5a14823  ! 2861: FADDs	fadds	%f5, %f3, %f18
	.word 0xe40fe001  ! 2862: LDUB_I	ldub	[%r31 + 0x0001], %r18
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe45fc000  ! 2863: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0x9f802001  ! 2864: SIR	sir	0x0001
	.word 0xa1902000  ! 2865: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xe45fc000  ! 2866: LDX_R	ldx	[%r31 + %r0], %r18
	.word 0xe4cfe020  ! 2867: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r18
DS_685:
	.word 0x32800001  ! 2869: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 2868: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe497e000  ! 2869: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0x87902197  ! 2870: WRPR_TT_I	wrpr	%r0, 0x0197, %tt
DS_686:
	.word 0x32800001  ! 2872: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 2871: SAVE_R	save	%r31, %r0, %r31
splash_lsu_687:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2872: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe537e001  ! 2873: STQF_I	-	%f18, [0x0001, %r31]
	.word 0xe40fe001  ! 2874: LDUB_I	ldub	[%r31 + 0x0001], %r18
	.word 0x8d902856  ! 2875: WRPR_PSTATE_I	wrpr	%r0, 0x0856, %pstate
	.word 0xe4d7e010  ! 2876: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r18
	.word 0xe4d00e40  ! 2877: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r18
	.word 0xa190200f  ! 2878: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xe457c000  ! 2879: LDSH_R	ldsh	[%r31 + %r0], %r18
	.word 0xe48008a0  ! 2880: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa1902004  ! 2881: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8780201c  ! 2882: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8150c000  ! 2883: RDPR_TT	rdpr	%tt, %r0
	.word 0xc08008a0  ! 2884: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xa1902006  ! 2885: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xc007c000  ! 2886: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0xc0800b00  ! 2887: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r0
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 2888: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 2889: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_688:
	tsubcctv %r22, 0x11b0, %r12
	.word 0xc007e001  ! 2890: LDUW_I	lduw	[%r31 + 0x0001], %r0
splash_tba_689:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2891: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9026de  ! 2892: WRPR_PSTATE_I	wrpr	%r0, 0x06de, %pstate
	.word 0x91d020b0  ! 2893: Tcc_I	ta	icc_or_xcc, %r0 + 176
splash_cmpr_690:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181a001  ! 2894: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x83d02031  ! 2895: Tcc_I	te	icc_or_xcc, %r0 + 49
splash_cmpr_691:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2897: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186a001  ! 2896: WR_STICK_REG_I	wr	%r26, 0x0001, %-
DS_692:
	.word 0x22800001  ! 2898: BE	be,a	<label_0x1>
	pdist %f18, %f14, %f16
	.word 0x87b1c305  ! 2897: ALLIGNADDRESS	alignaddr	%r7, %r5, %r3
	.word 0x93d02034  ! 2898: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xc6d7e020  ! 2899: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r3
	.word 0x91d02034  ! 2900: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_693:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2901: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc6c804a0  ! 2902: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x93902002  ! 2903: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81500000  ! 2904: RDPR_TPC	rdpr	%tpc, %r0
	.word 0xc0dfe010  ! 2905: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r0
	.word 0x87802088  ! 2906: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x91d020b2  ! 2907: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_htba_694:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2908: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc02fe001  ! 2909: STB_I	stb	%r0, [%r31 + 0x0001]
	.word 0xc097e000  ! 2910: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r0
	.word 0x8d802000  ! 2911: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_695:
	taddcctv %r23, 0x13fd, %r14
	.word 0xc007e001  ! 2912: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x879022b6  ! 2913: WRPR_TT_I	wrpr	%r0, 0x02b6, %tt
DS_696:
	.word 0x34800001  ! 2915: BG	bg,a	<label_0x1>
	allclean
	.word 0x8db0c308  ! 2914: ALLIGNADDRESS	alignaddr	%r3, %r8, %r6
	.word 0xcc2fe001  ! 2915: STB_I	stb	%r6, [%r31 + 0x0001]
	.word 0xcc1fc000  ! 2916: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x91d02031  ! 2917: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xcc5fe001  ! 2918: LDX_I	ldx	[%r31 + 0x0001], %r6
	.word 0x81982f1e  ! 2919: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1e, %hpstate
	.word 0xccd7e020  ! 2920: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r6
	.word 0x8780204f  ! 2921: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802016  ! 2922: WRASI_I	wr	%r0, 0x0016, %asi
splash_tba_697:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2923: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_698:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 2924: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xcc8008a0  ! 2925: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xccd80e40  ! 2926: LDXA_R	ldxa	[%r0, %r0] 0x72, %r6
	.word 0x819825d5  ! 2927: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d5, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902282  ! 2929: WRPR_PSTATE_I	wrpr	%r0, 0x0282, %pstate
	.word 0xa190200d  ! 2930: WRPR_GL_I	wrpr	%r0, 0x000d, %-
change_to_randtl_699:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 2931: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8d90261b  ! 2932: WRPR_PSTATE_I	wrpr	%r0, 0x061b, %pstate
	.word 0x87802089  ! 2933: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x93902000  ! 2934: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x24700001  ! 2935: BPLE	<illegal instruction>
	.word 0xcd27c008  ! 2936: STF_R	st	%f6, [%r8, %r31]
	.word 0x87494000  ! 2937: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0x8f902001  ! 2939: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89824009  ! 2938: WRTICK_R	wr	%r9, %r9, %tick
	.word 0x8d902ac5  ! 2939: WRPR_PSTATE_I	wrpr	%r0, 0x0ac5, %pstate
	.word 0xc61fc000  ! 2940: LDD_R	ldd	[%r31 + %r0], %r3
DS_701:
	.word 0x22800001  ! 2942: BE	be,a	<label_0x1>
	pdist %f16, %f28, %f8
	.word 0xadb20305  ! 2941: ALLIGNADDRESS	alignaddr	%r8, %r5, %r22
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2942: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xec900e40  ! 2943: LDUHA_R	lduha	[%r0, %r0] 0x72, %r22
	.word 0x87902355  ! 2944: WRPR_TT_I	wrpr	%r0, 0x0355, %tt
splash_lsu_702:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2945: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xeccfe030  ! 2946: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r22
	.word 0x93d02033  ! 2947: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xecd80e80  ! 2948: LDXA_R	ldxa	[%r0, %r0] 0x74, %r22
	.word 0x93902005  ! 2949: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_703:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 2950: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8c68c017  ! 2951: UDIVX_R	udivx 	%r3, %r23, %r6
tagged_704:
	tsubcctv %r16, 0x17d9, %r13
	.word 0xcc07e001  ! 2952: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x87802004  ! 2953: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x20700001  ! 2954: BPN	<illegal instruction>
	.word 0xa1902006  ! 2955: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902000  ! 2956: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x96f94012  ! 2957: SDIVcc_R	sdivcc 	%r5, %r18, %r11
	.word 0xd60fc000  ! 2958: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0xd6800bc0  ! 2959: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r11
	.word 0xa1902001  ! 2960: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_705:
	.word 0x22800001  ! 2962: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 2961: SAVE_R	save	%r31, %r0, %r31
	mov 8, %g3
	stxa %g3, [%g0] 0x5f
	.word 0xd65fc000  ! 2962: LDX_R	ldx	[%r31 + %r0], %r11
splash_tba_706:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2963: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x22700001  ! 2964: BPE	<illegal instruction>
DS_707:
	.word 0x22800001  ! 2966: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 2965: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902453  ! 2966: WRPR_PSTATE_I	wrpr	%r0, 0x0453, %pstate
	.word 0x93902007  ! 2967: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8f902002  ! 2969: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1820000  ! 2968: WR_STICK_REG_R	wr	%r8, %r0, %-
DS_709:
	.word 0x22800001  ! 2970: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 2969: SAVE_R	save	%r31, %r0, %r31
	.word 0xd68008a0  ! 2970: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_710:
	.word 0x32800001  ! 2972: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 2971: SAVE_R	save	%r31, %r0, %r31
	.word 0xd61fc000  ! 2972: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd717c000  ! 2973: LDQF_R	-	[%r31, %r0], %f11
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 2974: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b2  ! 2975: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x87802063  ! 2976: WRASI_I	wr	%r0, 0x0063, %asi
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 2977: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x97494000  ! 2978: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0xd647e001  ! 2979: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 2980: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x879020a9  ! 2981: WRPR_TT_I	wrpr	%r0, 0x00a9, %tt
	.word 0xa1902004  ! 2982: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d90224e  ! 2983: WRPR_PSTATE_I	wrpr	%r0, 0x024e, %pstate
	.word 0x8d902ed0  ! 2984: WRPR_PSTATE_I	wrpr	%r0, 0x0ed0, %pstate
	.word 0xd68008a0  ! 2985: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x9f802001  ! 2986: SIR	sir	0x0001
	.word 0x91d02030  ! 2987: Tcc_I	ta	icc_or_xcc, %r0 + 48
splash_lsu_711:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2988: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_712:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2989: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982285  ! 2990: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0285, %hpstate
	.word 0xd697e010  ! 2991: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0xd68008a0  ! 2992: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd6800b20  ! 2993: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r11
	.word 0x8d9028d5  ! 2994: WRPR_PSTATE_I	wrpr	%r0, 0x08d5, %pstate
	mov 8, %g3
	stxa %g3, [%g0] 0x57
	.word 0xd65fc000  ! 2995: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0xd727e001  ! 2996: STF_I	st	%f11, [0x0001, %r31]
DS_713:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 2997: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
DS_714:
	.word 0x20800001  ! 2999: BN	bn,a	<label_0x1>
	.word 0xc7358008  ! 2999: STQF_R	-	%f3, [%r8, %r22]
	normalw
	.word 0x87458000  ! 2998: RD_SOFTINT_REG	rd	%softint, %r3


.global user_data_start
.data
user_data_start:
	.xword	0xbbc6c7d0cb12cfae
	.xword	0xb06e9057b5e9f9c2
	.xword	0xad1e569727cb0eaa
	.xword	0x7cabbea44db782db
	.xword	0xaa3231c6e8e82a6c
	.xword	0xc183199841f2355c
	.xword	0x0bf369e3c9491850
	.xword	0x582a855efd2ef945
	.xword	0x1dcf002a8b146309
	.xword	0x5dc3590c5f215a41
	.xword	0x8e6307e21ee0e8a6
	.xword	0x7a202f3b90954487
	.xword	0x31d9041d37bb1640
	.xword	0xac03b822c94796b5
	.xword	0xad69951510e1641f
	.xword	0xe3e7d2da19c0e67c
	.xword	0x1348f5a3de4dc185
	.xword	0x049b5503a469acab
	.xword	0x28a630b4cef2183b
	.xword	0x6256ca5856505fac
	.xword	0xcadacb98fb650f6f
	.xword	0xbe222eeb63bb286c
	.xword	0xaea6a4fa89881baa
	.xword	0xfed10b7cd49894fc
	.xword	0x8372b6ec6a6f53bc
	.xword	0xdc0ed0f5e7cea95a
	.xword	0x709b150493366ec5
	.xword	0xcab63646ed68bfcb
	.xword	0xc30ac21253d1ab7f
	.xword	0x3559e50025e68111
	.xword	0x0c26e39b94148432
	.xword	0xc9c0277c5c6c179f
	.xword	0xfd477d60ab71a365
	.xword	0xe571c6174419d13d
	.xword	0xf14969b352e29feb
	.xword	0x6ec2dce2039395be
	.xword	0xdcdcb47fac07efc3
	.xword	0x3dd604c4864487f5
	.xword	0x03382c24973e0621
	.xword	0xdf5975b7352a4e0c
	.xword	0x217c47fc48f146bb
	.xword	0x0d58637133f3290c
	.xword	0x6dcb5a367d8759cc
	.xword	0xfed66d55e0771efd
	.xword	0x90af6bed8d95d306
	.xword	0x7d1a2c37c4293a20
	.xword	0x0ba86eef9ac19bc4
	.xword	0x03742117f08bc5da
	.xword	0xba4edc4d62269e1a
	.xword	0xb7d15a52b5ce8437
	.xword	0x76e2ccf251e5bd3d
	.xword	0xb24fffedef06c5b5
	.xword	0x5ff88cbf840d8b5d
	.xword	0x85c20f9a2dd815f7
	.xword	0x1ba3c54a02ed1321
	.xword	0x8064b74dca40b731
	.xword	0xa5975013e03f2e4c
	.xword	0xec7640ee554c0054
	.xword	0xa597bdca3ed105f9
	.xword	0x4c5fa6a848034fc1
	.xword	0x93db9d2f41ad1d6f
	.xword	0xdb8be2f0475c9e61
	.xword	0xb00758609a0154f2
	.xword	0x225793cdd867d79f
	.xword	0x94a6e9eb1a1df029
	.xword	0xf22c13d48661259d
	.xword	0x8415b6cca7b70f57
	.xword	0xceddfd67f4671fe2
	.xword	0xc49f665d5923270c
	.xword	0x5aea2f7b0f0ee1fc
	.xword	0xa3dd4538451d3c36
	.xword	0x0320bc47f3e9a042
	.xword	0xbdfd71a496de1af7
	.xword	0xd3a53cf1703f7b43
	.xword	0xc3d21b1d092200c7
	.xword	0x2038875a2e118c74
	.xword	0xe97bf55d53802f77
	.xword	0x81ba5454327b377a
	.xword	0xe1d5537a244176a4
	.xword	0x569c137d5ef0fe1e
	.xword	0x17536d5ffe2f3bf3
	.xword	0xfc005853cf7523c4
	.xword	0x7969f257b3191a6e
	.xword	0x4e4b9722b471ba5b
	.xword	0xc936e099a7fc41a0
	.xword	0x970c266401ae316e
	.xword	0x8823abc8ff8863d7
	.xword	0xb5aa1bb3902be3f1
	.xword	0xdbf3253d3494ca61
	.xword	0xd7bec8ff1854b763
	.xword	0xf66bb0014a80636a
	.xword	0x50b507ccd8ff06da
	.xword	0x699d37f547e1bbc9
	.xword	0xfdc725e3a14d8555
	.xword	0xe4f37a585f24b289
	.xword	0x1f49cca3d94c4149
	.xword	0x5158f9dd9f34b8b4
	.xword	0xcf53ff253a4ed653
	.xword	0x3f3d90e5ef61ab67
	.xword	0x7c4f4c15aa731538
	.xword	0xb603526d945ef61a
	.xword	0x859f0311b323e769
	.xword	0x534fb17fe40730ef
	.xword	0x6fcddbf1b3600fda
	.xword	0x901ab410ea4e9b59
	.xword	0x18dfd7c181410ddc
	.xword	0xf8e620c6bdcbe40a
	.xword	0x847905494c1d18e9
	.xword	0xcec3fa33c6875fe2
	.xword	0x42ddf05ab483341b
	.xword	0xa8b32035e6a34835
	.xword	0xec35cdd6e0ac2d1a
	.xword	0x63179da758365759
	.xword	0xf33e92ac921b33ad
	.xword	0xc24c9532a08f5d72
	.xword	0xc761f04fbd613e09
	.xword	0x1b3e31237f54100d
	.xword	0xfb02075763c7c350
	.xword	0x4e4f8a6a0ebe480f
	.xword	0xe9008bef95983d76
	.xword	0x02a952f6760d5614
	.xword	0x6b9dc8a7143c82a3
	.xword	0xd37d53278ba56230
	.xword	0xad3b366e65a72b53
	.xword	0xd9faa573b23dbab0
	.xword	0x67c2ecd3eafaf289
	.xword	0x0702cfe8be3ebcfc
	.xword	0x8e1c9eb133d595d3
	.xword	0x45dc464ef8cfe2bc
	.xword	0x8febcb1abc8e045d
	.xword	0xb4b8cfa045d0b525
	.xword	0x4b67b14b46a46cd8
	.xword	0xf8f38d3cc853fd52
	.xword	0x7c69f37218914020
	.xword	0x593ddfeb1a0f8c1a
	.xword	0xfd323b0631caf74c
	.xword	0x1f39d126b9cef53b
	.xword	0x6a09e79866aed42a
	.xword	0x1d7b82bcc10eb5ad
	.xword	0x28d757e72eb7a18c
	.xword	0x67cc3533a21fe53b
	.xword	0xe7c093ff4ad404eb
	.xword	0x7c24519cb284d722
	.xword	0xfe967fab5c9f7ba9
	.xword	0x70db4460f303ec6a
	.xword	0x6f947c888cbbb42f
	.xword	0x8cfef3891c8e43a7
	.xword	0x7150a0acaef7b82b
	.xword	0x9339bc5b65950827
	.xword	0x4c6df2d80f45f1bf
	.xword	0x53cb6f3c4cf313f4
	.xword	0x47643dcb597ae6ea
	.xword	0xf1f9d6e0b74f92af
	.xword	0xf578fc2fe4237818
	.xword	0xf5c7218eabe8d1a0
	.xword	0x3b583545eb6177d9
	.xword	0xbb5ae229ae51675a
	.xword	0x08691a314b306e78
	.xword	0x1730b90620b2e92d
	.xword	0x3024bf335b569a4e
	.xword	0xf47eebabe9ba00cb
	.xword	0x09acf151623005a6
	.xword	0x4a2d8a1607dff114
	.xword	0x41c1b0543af99409
	.xword	0xc6a4f87af2df9c7b
	.xword	0x4e9ad15fdb525bbb
	.xword	0x71adee35f5be3b4d
	.xword	0xf1620061db13ef20
	.xword	0x8e9d965450a87b3b
	.xword	0xd72611e82d9f6c9e
	.xword	0xa38cab7c1ba9fdd6
	.xword	0xd363379ffc81a403
	.xword	0xa1dba4b3eb3dcc20
	.xword	0x1019522d7a4f1505
	.xword	0x03f3fe44f631336a
	.xword	0x50e65527fa58a50c
	.xword	0x36d40c1909c1f707
	.xword	0xae08650374437281
	.xword	0xe328944c62db65ba
	.xword	0x0619fb73d5e095db
	.xword	0xb75b8c392f983b57
	.xword	0x344cf9dcf9a0b14d
	.xword	0xad2994782acaad50
	.xword	0x13d6ba1dc1caacfa
	.xword	0xa37a2566b49aabc7
	.xword	0x117022bc5136b577
	.xword	0xcee4246ee3982c52
	.xword	0x319499f97e1abd55
	.xword	0x61252530d19b5ebe
	.xword	0x98e1b0603a4f3c28
	.xword	0xf7333ad399ca311c
	.xword	0x326db45a5a7236f0
	.xword	0xa9725eafc867d951
	.xword	0xd6a848ef57e9f6ab
	.xword	0x2db187cf564354b8
	.xword	0x2bd97245735df6dc
	.xword	0x705cee914cd0f4c1
	.xword	0xd71545164d669d54
	.xword	0x59f2bb1f1525dc73
	.xword	0xf3fab08155051476
	.xword	0x616f7d2520884c2e
	.xword	0xd0db2411687d8be8
	.xword	0x9afd0030205c00d6
	.xword	0x6452f33797c3775b
	.xword	0xd4d3ff17c4cffcd9
	.xword	0x5483e616bf71d1ca
	.xword	0x273c21a264fcc4d3
	.xword	0x82ec95ca73e60a16
	.xword	0x8ec01f12c8e2a6f0
	.xword	0x822c8d2f83ce895f
	.xword	0xd124db7f2e06da17
	.xword	0x2abece871fa2bbe9
	.xword	0x0260ae14dc7744f0
	.xword	0x83226ee6fe253cf7
	.xword	0x5f1ff1754b041ce1
	.xword	0x8bc8a02c75142003
	.xword	0x26f4dbbc49f6a905
	.xword	0x98ef9af2352fa578
	.xword	0xc021513b7248ee1a
	.xword	0xb70de6726eba94c8
	.xword	0x774dec1290e733a5
	.xword	0xaf34b1c0028aa28d
	.xword	0xafe7076fadf80695
	.xword	0x2ddc36e0009f5c3c
	.xword	0x294b6b64867e922a
	.xword	0x4dfb199b2b8bef31
	.xword	0x8699a4f62bb3e209
	.xword	0xb29f15d297fc36cb
	.xword	0x6af2d13c8a8101d0
	.xword	0xc25b95319748aaf6
	.xword	0x2b4c0f6adb7b3329
	.xword	0xa4da49f3cc966a49
	.xword	0x6beb077e0e786014
	.xword	0xa7a12db119d0c56d
	.xword	0xbf0ea0ab10d2a5bf
	.xword	0x5579130818b7e088
	.xword	0xce211f2247854833
	.xword	0x913efb236243210c
	.xword	0x52fbfc70534baa42
	.xword	0xf1ac998a85617296
	.xword	0x86512e48b6ba191b
	.xword	0x029828948d812ed7
	.xword	0xc6a460ce8ba52fae
	.xword	0xa46b24b4a6d6ee86
	.xword	0x46e37f998eaf79fc
	.xword	0x84711f0394455e98
	.xword	0x58e6f83e6f9862a0
	.xword	0xaa038ca0baf2ca54
	.xword	0xfa50c5e8b44d09da
	.xword	0x76590cd140bae6c8
	.xword	0x6989c4d3dc60afbc
	.xword	0x43b9ebe6a136eabf
	.xword	0x26977417d300e974
	.xword	0x0196581a92a642a1
	.xword	0x26ec1798fd85c2a7
	.xword	0x1aecedd62bd75a39


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Mon May 17 13:45:45 2004
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
!!#     IJ_set_ropr_fld("diag.j", 84, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x1c, 0x4f, 0x58, 0x63, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 87, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x16, 0x1c, 0x4f, 0x63, 0x58, 0x80, 0x88}");
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
!!#     IJ_set_ropr_fld("diag.j", 109, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_ropr_fld("diag.j", 110, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 111, Ro_traps_i, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 112, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 113, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 114, Ro_traps_r, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 115, Ro_traps_r, Ft_Simm13, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_rvar("diag.j", 116, Rv_init_trap, "{0x30..0x35, 0xb0..0xb5}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 119, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 120, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Pstate splash
!!#     IJ_set_ropr_fld("diag.j", 123, Ro_wrpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 124, Ro_wrpstate, Ft_Simm13, "12'b0rrr0rr0rrrrr");
!!# 
!!#     // Hpstate splash
!!#     IJ_set_ropr_fld("diag.j", 127, Ro_wrhpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 128, Ro_wrhpstate, Ft_Simm13, "12'brrrrrr0rr1rr");
!!# 
!!#     // TT splash
!!#     IJ_set_ropr_fld("diag.j", 131, Ro_wrtt, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 132, Ro_wrtt, Ft_Simm13, "10'brrrrrrrrrr");
!!# 
!!#     // GL splash
!!#     IJ_set_ropr_fld("diag.j", 135, Ro_wrgl, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 136, Ro_wrgl, Ft_Simm13, "4'brrrr");
!!# 
!!#     // TL splash
!!#     IJ_set_ropr_fld("diag.j", 139, Ro_tl, Ft_Simm13, "{0..5}");
!!#     IJ_set_ropr_fld("diag.j", 140, Ro_tl, Ft_Rs1,    "{0}");
!!# 
!!#     // CWP splash
!!#     IJ_set_ropr_fld("diag.j", 143, Ro_wrcwp, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 144, Ro_wrcwp, Ft_Simm13, "3'brrr");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 146, Ro_save_restore, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 147, Ro_save_restore, Ft_Rd,  "{31}");
!!#     IJ_set_ropr_fld("diag.j", 148, Ro_save_restore, Ft_Rs2, "{0}");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 150, Ro_winops, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 151, Ro_winops, Ft_Simm13, "{0..5}");
!!# 
!!#     // {H}TBA Splash
!!#     IJ_set_ropr_fld("diag.j", 154, Ro_tba, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 155, Ro_tba, Ft_Rs2, "{2}");
!!# 
!!#     // Dest reg is %g0
!!#     IJ_set_ropr_fld("diag.j", 158, Ro_rd0, Ft_Rd, "{0}");
!!# 
!!#     // Weights
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 162,"{10}");
!!#     IJ_set_rvar("diag.j", 163, wt_high, "{90}");
!!#     IJ_set_rvar("diag.j", 164, wt_med,  "{40}");
!!#     IJ_set_rvar("diag.j", 165, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 169, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<7; k++) {
!!#         for (i = 0; i < 30; i++) {
!!#             if (i==15) {
!!#                 IJ_printf  ("diag.j", 173, th0,"\tmov %%r31, %%r15\n");
!!#                 continue;
!!#             }
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 177, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 179, th0,"\tmov 0x%rx, %%r14\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 180, th0,"\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 181, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 184, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 187, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 190, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 193, th0,"\tta T_CHANGE_HPRIV \n");
!!#     IJ_printf  ("diag.j", 194, th0,"!Initializing Tick Cmprs \n");
!!#     IJ_printf  ("diag.j", 195, th0,"\tmov 1, %%g2\n");
!!#     IJ_printf  ("diag.j", 196, th0,"\tsllx %%g2, 63, %%g2\n");
!!#     IJ_printf  ("diag.j", 197, th0,"\tor %%g1, %%g2, %%g1\n");
!!#     IJ_printf("diag.j", 198, th0, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
!!#     IJ_printf("diag.j", 199, th0, "\twr %%g1, %%g0, %%tick_cmpr\n");
!!#     IJ_printf("diag.j", 200, th0, "\twr %%g1, %%g0, %%sys_tick_cmpr\n");
!!#     IJ_printf  ("diag.j", 201, th0,"!Initializing Trap Stack \n");
!!#     for (i = 1; i <=6; i++) {
!!#         IJ_printf  ("diag.j", 203, th0,"\twrpr 0x%d, %%tl\n", i);
!!#         IJ_printf  ("diag.j", 204, th0,"\twrpr 0x1, %%tt\n");
!!#         IJ_printf  ("diag.j", 205, th0,"\twrpr 0x1, %%tpc\n");
!!#         IJ_printf  ("diag.j", 206, th0,"\twrpr 0x1, %%tnpc\n");
!!#         IJ_printf  ("diag.j", 207, th0,"\twrpr 0x1, %%tstate\n");
!!#         IJ_printf  ("diag.j", 208, th0,"\twrhpr 0x1, %%htstate\n");
!!#     }
!!#     IJ_printf  ("diag.j", 210, th0,"\twrpr 0x0, %%tl\n");
!!#     IJ_printf  ("diag.j", 211, th0,"\tta T_CHANGE_NONHPRIV \n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#     int i;
!!#     IJ_printf  ("diag.j", 260, th0,"\n\n.global user_data_start\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 262, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
!!#     }
!!# 
!!#     for (i = 0; i < 4; i++) {
!!#         IJ_iseg_printf  ("diag.j", 266,MyHTRAPS, i, th0, "#include \"htraps.s\"\n");
!!#         IJ_iseg_printf  ("diag.j", 267,MyHTRAPS, i, th0,"#include \"tlu_htraps_ext.s\"\n");
!!#         IJ_iseg_printf  ("diag.j", 268,MyTRAPS, i, th0,"#include \"traps.s\"\n");
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
!!#         IJ_generate ("diag.j", 317, th0, $2);
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
!!#         | splash_hpstate %rvar  wt_med
!!#         | splash_cwp    %rvar  wt_med
!!#         | splash_gl     %rvar  wt_med
!!#         | splash_tt     %rvar  wt_med
!!#         | stores        %rvar  wt_low
!!#         | sir           %rvar  wt_low
!!#         | splash_cmpr   %rvar  wt_low
!!#         | splash_tba    %rvar  wt_med
!!#         | splash_htba   %rvar  wt_low
!!#         | splash_lsucnt %rvar  wt_med
!!#         | demap         %rvar  wt_med
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
!!#         IJ_set_rvar("diag.j", 355, Rv_demap, "{0x57, 0x5f}");
!!#         IJ_printf("diag.j", 356, th0, "\tmov 8, %%g3\n");
!!#         IJ_printf("diag.j", 357, th0, "\tstxa %%g3, [%%g0] 0x%rx\n", Rv_demap);
!!#     }
!!# ;
!!# 
!!# tagged: tLDUW_I %ropr  Ro_nontrap_ld
!!#     {
!!#         IJ_printf("diag.j", 363, th0, "tagged_%d:\n", label);
!!#         IJ_set_rvar("diag.j", 364, Rv_tof_r, "{1..26}");
!!#         IJ_set_rvar("diag.j", 365, Rv_tof_i, "13'b1rrrrrrrrrrrr");
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 367, th0, "\ttaddcctv %%r%rd, 0x%rx, %%r%rd\n", 
!!#                                 Rv_tof_r, Rv_tof_i, Rv_tof_r);
!!#         } else {
!!#             IJ_printf("diag.j", 370, th0, "\ttsubcctv %%r%rd, 0x%rx, %%r%rd\n", 
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
!!#         IJ_set_ropr_fld("diag.j", 393, Ro_tl, Ft_Simm13, "{0..2}");
!!#         IJ_generate_from_token("diag.j", 394,1, th0, Ro_tl, tWRPR_TL_I, -1);;
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 396,1, th0, ijdefault, tCHANGE_NONHPRIV, -1);;
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 398,1, th0, ijdefault, tCHANGE_NONPRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_randtl: tWRPR_TL_I %ropr  Ro_tl
!!#     {
!!#         IJ_printf("diag.j", 406, th0, "change_to_randtl_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_set_ropr_fld("diag.j", 408, Ro_tl, Ft_Simm13, "{3..5}");
!!#             IJ_generate_from_token("diag.j", 409,1, th0, ijdefault, tCHANGE_HPRIV, -1);;
!!#         } else {
!!#             IJ_set_ropr_fld("diag.j", 411, Ro_tl, Ft_Simm13, "{0..2}");
!!#             IJ_generate_from_token("diag.j", 412,1, th0, ijdefault, tCHANGE_PRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_tl1 : tCHANGE_TO_TL1
!!#     {
!!#         IJ_printf("diag.j", 420, th0, "change_to_tl1_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 422, th0, "\tta T_CHANGE_HPRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 424, th0, "\tta T_CHANGE_PRIV\n");
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
!!#         IJ_printf("diag.j", 446, th0, "splash_lsu_%d:\n", label);
!!#         IJ_printf("diag.j", 447, th0, "\tset 0x%rx, %%r2\n", Rv_lsucntl);
!!#         IJ_printf("diag.j", 448, th0, "\tstxa %%r2, [%%r0] ASI_LSU_CONTROL\n");
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_tba: tWRPR_TBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 455, th0, "splash_tba_%d:\n", label);
!!#         IJ_printf("diag.j", 456, th0, "\tta T_CHANGE_PRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 458, th0, "\tset 0x120000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 460, th0, "\tset 0x%08llrx, %%r2\n", Rv_tba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# splash_htba: tWRHPR_HTBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 467, th0, "splash_htba_%d:\n", label);
!!#         IJ_printf("diag.j", 468, th0, "\tta T_CHANGE_HPRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 470, th0, "\tset 0x80000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 472, th0, "\tset 0x%08llrx, %%r2\n", Rv_htba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_cmpr: tWR_STICK_REG_I
!!#     {
!!#         IJ_printf("diag.j", 480, th0, "splash_cmpr_%d:\n", label);
!!#         IJ_set_rvar("diag.j", 481, Rv_rand_60,"64'h8rrrrrrr_rrrrrrrr");
!!#         IJ_set_ropr_fld("diag.j", 482, Ro_cmpr, Ft_Rs1, "{0}");
!!#         IJ_set_ropr_fld("diag.j", 483, Ro_cmpr, Ft_Rs2, "{1}");
!!#         IJ_printf  ("diag.j", 484, th0,"\tnop\n\tmov 1, %%g2\n");
!!#         IJ_printf  ("diag.j", 485, th0,"\tsllx %%g2, 63, %%g2\n");
!!#         IJ_printf  ("diag.j", 486, th0,"\tor %%g1, %%g2, %%g1\n");
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 488,1, th0, Ro_cmpr, tWR_STICK_CMPR_REG_R, tWR_TICK_CMPR_REG_R, -1);;
!!#         } else {
!!#            IJ_printf("diag.j", 490, th0, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
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
!!#         IJ_printf("diag.j", 528, th0, "\totherw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      } else {
!!#         IJ_printf("diag.j", 530, th0, "\tinvalw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!#         IJ_printf("diag.j", 614, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 615,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 616,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 617, th0, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 621, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 622,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 624,1, th0, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 626, th0, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 628, th0, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 633, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 634,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             //IJ_printf(th0, "\t.xword 0x%rx\t! Random illegal ?\n", Rv_illtrap);
!!#             IJ_printf("diag.j", 637, th0, "\tilltrap\n");
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 639,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 641,1, th0, ijdefault, tFSQRTd, tLDQF_R, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 648, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 649,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 653, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 654,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 658, th0, "DS_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 659, th0, "\tnop\n\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 660, th0, "\tjmp %%g2\n");
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

