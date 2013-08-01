/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_15.s
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
	mov 0xb0, %r14
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
	mov 0x35, %r14
	mov 0xb2, %r30
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
	mov 0x31, %r14
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
splash_lsu_0:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce800c60  ! 2: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r7
	.word 0x8d802000  ! 3: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_1:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 4: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200d  ! 5: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x879023a5  ! 6: WRPR_TT_I	wrpr	%r0, 0x03a5, %tt
	.word 0xce57e001  ! 7: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0x87802004  ! 8: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x99902005  ! 9: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
splash_lsu_2:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce8008a0  ! 11: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
splash_lsu_3:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 12: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 13: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 14: WRASI_I	wr	%r0, 0x0010, %asi
splash_tba_4:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 15: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802058  ! 16: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x93902003  ! 17: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xce17e001  ! 18: LDUH_I	lduh	[%r31 + 0x0001], %r7
	.word 0x87802088  ! 19: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x83d020b5  ! 20: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xcec804a0  ! 21: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 22: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xce800bc0  ! 24: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r7
	.word 0x87802058  ! 25: WRASI_I	wr	%r0, 0x0058, %asi
splash_tba_5:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 26: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790231b  ! 27: WRPR_TT_I	wrpr	%r0, 0x031b, %tt
	.word 0xcec804a0  ! 28: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0xce47c000  ! 29: LDSW_R	ldsw	[%r31 + %r0], %r7
splash_lsu_6:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 30: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_7:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 31: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982894  ! 32: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0894, %hpstate
	.word 0x91d020b4  ! 33: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x879023cd  ! 34: WRPR_TT_I	wrpr	%r0, 0x03cd, %tt
splash_cmpr_8:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1826001  ! 35: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0x26800001  ! 36: BL	bl,a	<label_0x1>
	.word 0x8d90259f  ! 37: WRPR_PSTATE_I	wrpr	%r0, 0x059f, %pstate
tagged_9:
	taddcctv %r12, 0x1282, %r15
	.word 0xce07e001  ! 38: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xced004a0  ! 39: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0x93902000  ! 40: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xcec00e60  ! 41: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r7
	.word 0xced804a0  ! 42: LDXA_R	ldxa	[%r0, %r0] 0x25, %r7
	.word 0xce880e40  ! 43: LDUBA_R	lduba	[%r0, %r0] 0x72, %r7
splash_lsu_10:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 44: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802058  ! 45: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902002  ! 47: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1830002  ! 46: WR_STICK_REG_R	wr	%r12, %r2, %-
DS_12:
	.word 0x22800001  ! 48: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 47: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xcf27e001  ! 48: STF_I	st	%f7, [0x0001, %r31]
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 49: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d9029d5  ! 51: WRPR_PSTATE_I	wrpr	%r0, 0x09d5, %pstate
	.word 0xce880e60  ! 52: LDUBA_R	lduba	[%r0, %r0] 0x73, %r7
	.word 0xce8008a0  ! 53: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
DS_13:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 54: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xce47c000  ! 55: LDSW_R	ldsw	[%r31 + %r0], %r7
	.word 0x3c800001  ! 56: BPOS	bpos,a	<label_0x1>
	.word 0x8d902aec  ! 57: WRPR_PSTATE_I	wrpr	%r0, 0x0aec, %pstate
splash_lsu_14:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 58: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb1480000  ! 59: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x87802088  ! 60: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d802000  ! 61: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xf08804a0  ! 62: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x91d02032  ! 63: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_15:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 64: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xf09fc020  ! 65: LDDA_R	ldda	[%r31, %r0] 0x01, %r24
DS_16:
	.word 0x32800001  ! 67: BNE	bne,a	<label_0x1>
	.xword 0x9bf873d6	! Random illegal ?
	.word 0xe5104008  ! 67: LDQF_R	-	[%r1, %r8], %f18
	.word 0x87a64823  ! 66: FADDs	fadds	%f25, %f3, %f3
splash_tba_17:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 67: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc69fc020  ! 68: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0x87902366  ! 69: WRPR_TT_I	wrpr	%r0, 0x0366, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc68008a0  ! 71: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
splash_lsu_18:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 72: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902653  ! 73: WRPR_PSTATE_I	wrpr	%r0, 0x0653, %pstate
	.word 0xc68008a0  ! 74: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x93902006  ! 75: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87802063  ! 76: WRASI_I	wr	%r0, 0x0063, %asi
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 77: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3e700001  ! 78: BPVC	<illegal instruction>
	.word 0xc647c000  ! 79: LDSW_R	ldsw	[%r31 + %r0], %r3
	.word 0x87902049  ! 80: WRPR_TT_I	wrpr	%r0, 0x0049, %tt
	.word 0xa190200d  ! 81: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xc617e001  ! 82: LDUH_I	lduh	[%r31 + 0x0001], %r3
	.word 0xc73fe001  ! 83: STDF_I	std	%f3, [0x0001, %r31]
	.word 0x95500000  ! 84: RDPR_TPC	rdpr	%tpc, %r10
	.word 0x93902003  ! 85: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
tagged_19:
	taddcctv %r19, 0x10da, %r20
	.word 0xd407e001  ! 86: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd48008a0  ! 87: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa1902007  ! 88: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x38700001  ! 89: BPGU	<illegal instruction>
	.word 0x879020bd  ! 90: WRPR_TT_I	wrpr	%r0, 0x00bd, %tt
	.word 0x8d902bda  ! 91: WRPR_PSTATE_I	wrpr	%r0, 0x0bda, %pstate
splash_tba_20:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 92: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x30700001  ! 93: BPA	<illegal instruction>
splash_tba_21:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 94: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd48008a0  ! 95: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x93902003  ! 96: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_22:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 97: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd4c7e020  ! 98: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
	.word 0xd4d004a0  ! 99: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
tagged_23:
	taddcctv %r9, 0x17bc, %r4
	.word 0xd407e001  ! 100: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x93902003  ! 101: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 102: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 103: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd4c7e030  ! 104: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
tagged_24:
	tsubcctv %r15, 0x1480, %r11
	.word 0xd407e001  ! 105: LDUW_I	lduw	[%r31 + 0x0001], %r10
tagged_25:
	taddcctv %r11, 0x1f30, %r21
	.word 0xd407e001  ! 106: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_lsu_26:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 107: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 108: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x83d02032  ! 109: Tcc_I	te	icc_or_xcc, %r0 + 50
DS_27:
	.word 0x34800001  ! 111: BG	bg,a	<label_0x1>
	allclean
	.word 0x9bb14308  ! 110: ALLIGNADDRESS	alignaddr	%r5, %r8, %r13
	.word 0x93d020b3  ! 111: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x87802016  ! 112: WRASI_I	wr	%r0, 0x0016, %asi
splash_lsu_28:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 113: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 114: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_29:
	taddcctv %r21, 0x19e6, %r4
	.word 0xda07e001  ! 115: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xa190200f  ! 116: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8790210e  ! 117: WRPR_TT_I	wrpr	%r0, 0x010e, %tt
	.word 0xa190200a  ! 118: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x89504000  ! 119: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0xa190200b  ! 120: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x99902002  ! 121: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 123: WRFPRS_I	wr	%r0, 0x0000, %fprs
change_to_randtl_30:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 124: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc817c000  ! 125: LDUH_R	lduh	[%r31 + %r0], %r4
splash_lsu_31:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 126: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 127: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902067  ! 128: WRPR_TT_I	wrpr	%r0, 0x0067, %tt
	.word 0x8f902000  ! 130: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97686001  ! 129: SDIVX_I	sdivx	%r1, 0x0001, %r11
	.word 0xd61fe001  ! 130: LDD_I	ldd	[%r31 + 0x0001], %r11
splash_cmpr_33:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 132: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1802001  ! 131: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	.word 0xa190200f  ! 132: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x83d020b3  ! 133: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x8f902002  ! 135: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1820003  ! 134: WR_STICK_REG_R	wr	%r8, %r3, %-
	.word 0x91d020b3  ! 135: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x879021e2  ! 136: WRPR_TT_I	wrpr	%r0, 0x01e2, %tt
	.word 0xd68008a0  ! 137: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_35:
	.word 0x20800001  ! 139: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 139: BN	bn,a	<label_0x1>
	.word 0x89a00541  ! 139: FSQRTd	fsqrt	
	.word 0xa3a18823  ! 138: FADDs	fadds	%f6, %f3, %f17
	.word 0x9f802001  ! 139: SIR	sir	0x0001
	.word 0xe317c000  ! 140: LDQF_R	-	[%r31, %r0], %f17
	.word 0x3e700001  ! 141: BPVC	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xe297e030  ! 143: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r17
change_to_randtl_36:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 144: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe337e001  ! 145: STQF_I	-	%f17, [0x0001, %r31]
tagged_37:
	taddcctv %r17, 0x1d81, %r19
	.word 0xe207e001  ! 146: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xa1902005  ! 147: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x93d02034  ! 148: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_tba_38:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 149: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x95540000  ! 150: RDPR_GL	rdpr	%-, %r10
	.word 0x819822c7  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c7, %hpstate
	.word 0xd457c000  ! 152: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0xd4c804a0  ! 153: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 154: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 155: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x87802016  ! 156: WRASI_I	wr	%r0, 0x0016, %asi
DS_39:
	.word 0x22800001  ! 158: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 157: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa190200f  ! 158: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_40:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 159: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802016  ! 160: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_41:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 161: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xd4d7e020  ! 162: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r10
	.word 0x91d020b5  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa190200c  ! 164: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x91d020b3  ! 165: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x87802063  ! 166: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xd49004a0  ! 167: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	.word 0x93902006  ! 168: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902007  ! 169: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd49fe001  ! 170: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0xd417e001  ! 171: LDUH_I	lduh	[%r31 + 0x0001], %r10
	.word 0x91d02034  ! 172: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8790208b  ! 173: WRPR_TT_I	wrpr	%r0, 0x008b, %tt
	.word 0xb5508000  ! 174: RDPR_TSTATE	rdpr	%tstate, %r26
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 175: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902fc6  ! 177: WRPR_PSTATE_I	wrpr	%r0, 0x0fc6, %pstate
	.word 0x91d02034  ! 178: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xf517c000  ! 179: LDQF_R	-	[%r31, %r0], %f26
	.word 0xf457e001  ! 180: LDSH_I	ldsh	[%r31 + 0x0001], %r26
splash_htba_42:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 181: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_43:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 182: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf48fe020  ! 183: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r26
	.word 0xf49004a0  ! 184: LDUHA_R	lduha	[%r0, %r0] 0x25, %r26
	.word 0xf49fe001  ! 185: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r26
splash_tba_44:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 186: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02034  ! 187: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_45:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 189: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1836001  ! 188: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x87802088  ! 189: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8f902000  ! 191: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8982001b  ! 190: WRTICK_R	wr	%r8, %r27, %tick
	ta	T_CHANGE_HPRIV	! macro
tagged_47:
	taddcctv %r22, 0x1e0b, %r23
	.word 0xf407e001  ! 192: LDUW_I	lduw	[%r31 + 0x0001], %r26
	.word 0xf4800ba0  ! 193: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r26
splash_lsu_48:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 194: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9027f1  ! 195: WRPR_PSTATE_I	wrpr	%r0, 0x07f1, %pstate
	.word 0xf48008a0  ! 196: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0x87802058  ! 197: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x91d02035  ! 198: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xf4c004a0  ! 199: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r26
DS_49:
	.word 0x22800001  ! 201: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 200: SAVE_R	save	%r31, %r0, %r31
splash_lsu_50:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 201: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 202: WRPR_GL_I	wrpr	%r0, 0x0004, %-
change_to_randtl_51:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 203: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xf4d004a0  ! 204: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r26
change_to_randtl_52:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 205: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 206: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 207: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_randtl_53:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 208: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 209: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf4d7e000  ! 210: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r26
	.word 0x9f802001  ! 211: SIR	sir	0x0001
	.word 0xf4900e60  ! 212: LDUHA_R	lduha	[%r0, %r0] 0x73, %r26
	.word 0xf447c000  ! 213: LDSW_R	ldsw	[%r31 + %r0], %r26
	.word 0x93d020b3  ! 214: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x81982214  ! 215: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0214, %hpstate
	.word 0xf48008a0  ! 216: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0xae830018  ! 217: ADDcc_R	addcc 	%r12, %r24, %r23
	.word 0xeed804a0  ! 218: LDXA_R	ldxa	[%r0, %r0] 0x25, %r23
	.word 0x83494000  ! 219: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0x99902003  ! 220: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xc21fe001  ! 221: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0xc21fc000  ! 222: LDD_R	ldd	[%r31 + %r0], %r1
	.word 0x93d02035  ! 223: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xc21fe001  ! 224: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0xc2d7e010  ! 225: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
splash_lsu_54:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 226: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879021c5  ! 227: WRPR_TT_I	wrpr	%r0, 0x01c5, %tt
change_to_randtl_55:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 228: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xc28804a0  ! 229: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	.word 0x91d02035  ! 230: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc28008a0  ! 231: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc2c804a0  ! 232: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	.word 0x87802055  ! 233: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x2a800001  ! 234: BCS	bcs,a	<label_0x1>
	.word 0x87902154  ! 235: WRPR_TT_I	wrpr	%r0, 0x0154, %tt
tagged_56:
	tsubcctv %r4, 0x1120, %r21
	.word 0xc207e001  ! 236: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x8d902a61  ! 237: WRPR_PSTATE_I	wrpr	%r0, 0x0a61, %pstate
	.word 0x8151c000  ! 238: RDPR_TL	rdpr	%tl, %r0
	.word 0xc03fe001  ! 239: STD_I	std	%r0, [%r31 + 0x0001]
	.word 0x8d9029b3  ! 240: WRPR_PSTATE_I	wrpr	%r0, 0x09b3, %pstate
	.word 0x8d902832  ! 241: WRPR_PSTATE_I	wrpr	%r0, 0x0832, %pstate
tagged_57:
	taddcctv %r12, 0x156c, %r10
	.word 0xc007e001  ! 242: LDUW_I	lduw	[%r31 + 0x0001], %r0
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 243: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91504000  ! 244: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0xd137c018  ! 245: STQF_R	-	%f8, [%r24, %r31]
	.word 0xb7480000  ! 246: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x81460000  ! 247: RD_STICK_REG	stbar
	.word 0xf6900e80  ! 248: LDUHA_R	lduha	[%r0, %r0] 0x74, %r27
	.word 0xf6dfe010  ! 249: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r27
tagged_58:
	tsubcctv %r26, 0x19e0, %r14
	.word 0xf607e001  ! 250: LDUW_I	lduw	[%r31 + 0x0001], %r27
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 251: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_59:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 252: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf60fe001  ! 253: LDUB_I	ldub	[%r31 + 0x0001], %r27
	.word 0xf737e001  ! 254: STQF_I	-	%f27, [0x0001, %r31]
splash_lsu_60:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 255: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf6d7e010  ! 256: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r27
	.word 0xf69004a0  ! 257: LDUHA_R	lduha	[%r0, %r0] 0x25, %r27
DS_61:
	.word 0x32800001  ! 259: BNE	bne,a	<label_0x1>
	.word 0xf7332001  ! 259: STQF_I	-	%f27, [0x0001, %r12]
	normalw
	.word 0x8f458000  ! 258: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xce9fe001  ! 259: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	.word 0xa1902002  ! 260: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x87802004  ! 261: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x879020e1  ! 262: WRPR_TT_I	wrpr	%r0, 0x00e1, %tt
	.word 0xce8008a0  ! 263: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
tagged_62:
	tsubcctv %r16, 0x184e, %r19
	.word 0xce07e001  ! 264: LDUW_I	lduw	[%r31 + 0x0001], %r7
tagged_63:
	taddcctv %r19, 0x1734, %r20
	.word 0xce07e001  ! 265: LDUW_I	lduw	[%r31 + 0x0001], %r7
splash_lsu_64:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 266: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_65:
	.word 0x32800001  ! 268: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 267: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02032  ! 268: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xce17e001  ! 269: LDUH_I	lduh	[%r31 + 0x0001], %r7
	.word 0x91d02035  ! 270: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xced7e010  ! 271: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r7
tagged_66:
	tsubcctv %r22, 0x1fff, %r17
	.word 0xce07e001  ! 272: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x8d902e5c  ! 273: WRPR_PSTATE_I	wrpr	%r0, 0x0e5c, %pstate
	.word 0xce800ba0  ! 274: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r7
	.word 0xa1902003  ! 275: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 276: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d90217e  ! 277: WRPR_PSTATE_I	wrpr	%r0, 0x017e, %pstate
splash_tba_67:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 278: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790239d  ! 279: WRPR_TT_I	wrpr	%r0, 0x039d, %tt
	.word 0xb3540000  ! 280: RDPR_GL	rdpr	%-, %r25
	.word 0xf28fe020  ! 281: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r25
DS_68:
	.word 0x22800001  ! 283: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 282: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xf29fc020  ! 283: LDDA_R	ldda	[%r31, %r0] 0x01, %r25
	.word 0x91d02034  ! 284: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xf2800ae0  ! 285: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r25
	.word 0xf397e001  ! 286: LDQFA_I	-	[%r31, 0x0001], %f25
	.word 0xa190200e  ! 287: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xf247c000  ! 288: LDSW_R	ldsw	[%r31 + %r0], %r25
	.word 0x2e700001  ! 289: BPVS	<illegal instruction>
splash_lsu_69:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 290: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf207c000  ! 291: LDUW_R	lduw	[%r31 + %r0], %r25
	ta	T_CHANGE_HPRIV	! macro
change_to_randtl_70:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 293: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d902c5b  ! 294: WRPR_PSTATE_I	wrpr	%r0, 0x0c5b, %pstate
splash_htba_71:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 295: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902442  ! 296: WRPR_PSTATE_I	wrpr	%r0, 0x0442, %pstate
splash_cmpr_72:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1806001  ! 297: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0x87802020  ! 298: WRASI_I	wr	%r0, 0x0020, %asi
	ta	T_CHANGE_PRIV	! macro
splash_tba_73:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 300: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_74:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 301: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902004  ! 302: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xf29004a0  ! 303: LDUHA_R	lduha	[%r0, %r0] 0x25, %r25
DS_75:
	.word 0x32800001  ! 305: BNE	bne,a	<label_0x1>
	.word 0xdb35001a  ! 305: STQF_R	-	%f13, [%r26, %r20]
	normalw
	.word 0x89458000  ! 304: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xc84fc000  ! 305: LDSB_R	ldsb	[%r31 + %r0], %r4
splash_lsu_76:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x24700001  ! 307: BPLE	<illegal instruction>
	.word 0xc817c000  ! 308: LDUH_R	lduh	[%r31 + %r0], %r4
	.word 0x83d02032  ! 309: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x87802055  ! 310: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xc88008a0  ! 311: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc81fc000  ! 312: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xc84fc000  ! 313: LDSB_R	ldsb	[%r31 + %r0], %r4
DS_77:
	.word 0x34800001  ! 315: BG	bg,a	<label_0x1>
	pdist %f18, %f28, %f12
	.word 0xb1b0430b  ! 314: ALLIGNADDRESS	alignaddr	%r1, %r11, %r24
	.word 0xf08804a0  ! 315: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x879020f0  ! 316: WRPR_TT_I	wrpr	%r0, 0x00f0, %tt
	.word 0xa1902005  ! 317: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x99902000  ! 318: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x87902093  ! 319: WRPR_TT_I	wrpr	%r0, 0x0093, %tt
	.word 0x87802004  ! 320: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf00fc000  ! 321: LDUB_R	ldub	[%r31 + %r0], %r24
	.word 0xf047c000  ! 322: LDSW_R	ldsw	[%r31 + %r0], %r24
	.word 0x81982795  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0795, %hpstate
	.word 0x93d020b3  ! 324: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xf09004a0  ! 325: LDUHA_R	lduha	[%r0, %r0] 0x25, %r24
splash_lsu_78:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 326: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_79:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 327: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0880e80  ! 328: LDUBA_R	lduba	[%r0, %r0] 0x74, %r24
	.word 0x87902081  ! 329: WRPR_TT_I	wrpr	%r0, 0x0081, %tt
splash_htba_80:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 330: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_81:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 331: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
DS_82:
	.word 0x22800001  ! 334: BE	be,a	<label_0x1>
	pdist %f26, %f28, %f4
	.word 0x99b6c308  ! 333: ALLIGNADDRESS	alignaddr	%r27, %r8, %r12
	.word 0xab51c000  ! 334: RDPR_TL	rdpr	%tl, %r21
	.word 0xea9fe001  ! 335: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r21
	.word 0x8790232c  ! 336: WRPR_TT_I	wrpr	%r0, 0x032c, %tt
DS_83:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 337: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x91d020b3  ! 338: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_lsu_84:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 339: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xeac80e60  ! 340: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r21
	.word 0xea8804a0  ! 341: LDUBA_R	lduba	[%r0, %r0] 0x25, %r21
	.word 0xa190200c  ! 342: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8780204f  ! 343: WRASI_I	wr	%r0, 0x004f, %asi
splash_lsu_85:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 344: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xea4fc000  ! 345: LDSB_R	ldsb	[%r31 + %r0], %r21
	.word 0x9945c000  ! 346: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0x87802004  ! 347: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa1902003  ! 348: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902006  ! 349: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x819824dc  ! 350: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04dc, %hpstate
	.word 0x91d02034  ! 351: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_86:
	.word 0x34800001  ! 353: BG	bg,a	<label_0x1>
	.xword 0xa55704a8	! Random illegal ?
	.word 0x8fa00549  ! 353: FSQRTd	fsqrt	
	.word 0xa3a0c82c  ! 352: FADDs	fadds	%f3, %f12, %f17
	.word 0x91d020b2  ! 353: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_lsu_87:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 354: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 355: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_88:
	.word 0x32800001  ! 357: BNE	bne,a	<label_0x1>
	pdist %f28, %f10, %f16
	.word 0x8fb10301  ! 356: ALLIGNADDRESS	alignaddr	%r4, %r1, %r7
splash_tba_89:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 357: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce4fe001  ! 358: LDSB_I	ldsb	[%r31 + 0x0001], %r7
	.word 0xce1fc000  ! 359: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0xce97e010  ! 360: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r7
	.word 0x879022fc  ! 361: WRPR_TT_I	wrpr	%r0, 0x02fc, %tt
	.word 0x87902354  ! 362: WRPR_TT_I	wrpr	%r0, 0x0354, %tt
splash_tba_90:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 363: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802001  ! 364: SIR	sir	0x0001
	.word 0xcec00e60  ! 365: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r7
	.word 0x91504000  ! 366: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0xd08008a0  ! 367: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x95480000  ! 368: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	ta	T_CHANGE_PRIV	! macro
DS_91:
	.word 0x20800001  ! 371: BN	bn,a	<label_0x1>
	.word 0xcf328012  ! 371: STQF_R	-	%f7, [%r18, %r10]
	normalw
	.word 0xa7458000  ! 370: RD_SOFTINT_REG	rd	%softint, %r19
tagged_92:
	tsubcctv %r24, 0x18f1, %r13
	.word 0xe607e001  ! 371: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xe69004a0  ! 372: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	ta	T_CHANGE_HPRIV	! macro
	.word 0xab504000  ! 374: RDPR_TNPC	rdpr	%tnpc, %r21
splash_lsu_93:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 375: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90279d  ! 376: WRPR_PSTATE_I	wrpr	%r0, 0x079d, %pstate
	.word 0x34800001  ! 377: BG	bg,a	<label_0x1>
splash_htba_94:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 378: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_PRIV	! macro
	.word 0x8780204f  ! 380: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x85500000  ! 381: RDPR_TPC	rdpr	%tpc, %r2
splash_tba_95:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 382: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_96:
	tsubcctv %r26, 0x1295, %r2
	.word 0xc407e001  ! 383: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc407c000  ! 384: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x879021c9  ! 385: WRPR_TT_I	wrpr	%r0, 0x01c9, %tt
	.word 0x879023f2  ! 386: WRPR_TT_I	wrpr	%r0, 0x03f2, %tt
	.word 0x83d02033  ! 387: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xc41fe001  ! 388: LDD_I	ldd	[%r31 + 0x0001], %r2
splash_lsu_97:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 389: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902000  ! 390: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	ta	T_CHANGE_HPRIV	! macro
splash_lsu_98:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 392: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc41fe001  ! 393: LDD_I	ldd	[%r31 + 0x0001], %r2
	.word 0x8f902000  ! 395: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8568e001  ! 394: SDIVX_I	sdivx	%r3, 0x0001, %r2
	.word 0x85508000  ! 395: RDPR_TSTATE	rdpr	%tstate, %r2
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc4cfe020  ! 398: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r2
splash_lsu_100:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 399: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 400: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xc40fe001  ! 401: LDUB_I	ldub	[%r31 + 0x0001], %r2
	.word 0xc4c7e030  ! 402: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
	.word 0x87902199  ! 403: WRPR_TT_I	wrpr	%r0, 0x0199, %tt
	.word 0x8780201c  ! 404: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_101:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 406: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb185e001  ! 405: WR_STICK_REG_I	wr	%r23, 0x0001, %-
	.word 0x879021f2  ! 406: WRPR_TT_I	wrpr	%r0, 0x01f2, %tt
	.word 0xa1902007  ! 407: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xc48008a0  ! 408: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x879021b5  ! 409: WRPR_TT_I	wrpr	%r0, 0x01b5, %tt
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 410: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc48008a0  ! 411: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x93902002  ! 412: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 413: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b45c000  ! 414: RD_TICK_CMPR_REG	rd	%-, %r5
	.word 0xca8008a0  ! 415: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 416: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_102:
	.word 0x20800001  ! 418: BN	bn,a	<label_0x1>
	.xword 0x95cb9c08	! Random illegal ?
	.word 0xe5144000  ! 418: LDQF_R	-	[%r17, %r0], %f18
	.word 0x8da44836  ! 417: FADDs	fadds	%f17, %f22, %f6
	.word 0x34700001  ! 418: BPG	<illegal instruction>
	.word 0xcc8008a0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
DS_103:
	.word 0x20800001  ! 421: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 421: BNE	bne,a	<label_0x1>
	.word 0x85a0054a  ! 421: FSQRTd	fsqrt	
	.word 0xb5a2c827  ! 420: FADDs	fadds	%f11, %f7, %f26
	.word 0xf4cfe030  ! 421: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r26
	.word 0x87902006  ! 422: WRPR_TT_I	wrpr	%r0, 0x0006, %tt
splash_htba_104:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 423: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87802004  ! 424: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf48008a0  ! 425: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0xf43fc007  ! 426: STD_R	std	%r26, [%r31 + %r7]
	.word 0xf497e020  ! 427: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r26
splash_lsu_105:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 428: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_106:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 429: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
tagged_107:
	taddcctv %r13, 0x1205, %r16
	.word 0xf407e001  ! 430: LDUW_I	lduw	[%r31 + 0x0001], %r26
	.word 0x86806001  ! 431: ADDcc_I	addcc 	%r1, 0x0001, %r3
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 432: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6800c80  ! 433: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r3
splash_htba_108:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 434: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902006  ! 435: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_109:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 436: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x87802058  ! 437: WRASI_I	wr	%r0, 0x0058, %asi
change_to_randtl_110:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 438: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc6c7e000  ! 439: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r3
	.word 0xa1902004  ! 440: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x26700001  ! 441: BPL	<illegal instruction>
splash_tba_111:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 442: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d02032  ! 443: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xa7480000  ! 444: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0x8d90247d  ! 445: WRPR_PSTATE_I	wrpr	%r0, 0x047d, %pstate
DS_112:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 446: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xe68804a0  ! 447: LDUBA_R	lduba	[%r0, %r0] 0x25, %r19
	.word 0x91d02033  ! 448: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902c68  ! 449: WRPR_PSTATE_I	wrpr	%r0, 0x0c68, %pstate
	.word 0x93902002  ! 450: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_113:
	.word 0x20800001  ! 452: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 452: BNE	bne,a	<label_0x1>
	.word 0x87a00549  ! 452: FSQRTd	fsqrt	
	.word 0x89a5482c  ! 451: FADDs	fadds	%f21, %f12, %f4
	.word 0xc84fc000  ! 452: LDSB_R	ldsb	[%r31 + %r0], %r4
	.word 0x8d902401  ! 453: WRPR_PSTATE_I	wrpr	%r0, 0x0401, %pstate
tagged_114:
	tsubcctv %r19, 0x181f, %r7
	.word 0xc807e001  ! 454: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xa1902009  ! 455: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d020b3  ! 456: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8d902630  ! 457: WRPR_PSTATE_I	wrpr	%r0, 0x0630, %pstate
	.word 0xc8800c00  ! 458: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r4
	.word 0xa1480000  ! 459: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0xe0dfe030  ! 460: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r16
tagged_115:
	taddcctv %r22, 0x15b1, %r1
	.word 0xe007e001  ! 461: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe0c7e010  ! 462: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r16
splash_lsu_116:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 463: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802055  ! 464: WRASI_I	wr	%r0, 0x0055, %asi
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 465: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe08fe030  ! 466: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r16
	.word 0x87902022  ! 467: WRPR_TT_I	wrpr	%r0, 0x0022, %tt
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 468: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902d39  ! 469: WRPR_PSTATE_I	wrpr	%r0, 0x0d39, %pstate
	.word 0x87802020  ! 470: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe047c000  ! 471: LDSW_R	ldsw	[%r31 + %r0], %r16
	.word 0xe017c000  ! 472: LDUH_R	lduh	[%r31 + %r0], %r16
	.word 0x93902003  ! 473: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x879020db  ! 474: WRPR_TT_I	wrpr	%r0, 0x00db, %tt
	.word 0x22800001  ! 475: BE	be,a	<label_0x1>
	.word 0xe0d7e000  ! 476: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	.word 0x8d802000  ! 477: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe0c804a0  ! 478: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r16
DS_117:
	.word 0x32800001  ! 480: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 479: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87902082  ! 480: WRPR_TT_I	wrpr	%r0, 0x0082, %tt
	.word 0x87902066  ! 481: WRPR_TT_I	wrpr	%r0, 0x0066, %tt
DS_118:
	.word 0x32800001  ! 483: BNE	bne,a	<label_0x1>
	.word 0xdb30e001  ! 483: STQF_I	-	%f13, [0x0001, %r3]
	normalw
	.word 0x97458000  ! 482: RD_SOFTINT_REG	rd	%softint, %r11
splash_htba_119:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 483: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902007  ! 484: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93d020b2  ! 485: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0xd68fe010  ! 486: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r11
DS_120:
	.word 0x32800001  ! 488: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 487: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8780204f  ! 488: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x87802089  ! 489: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd6c7e020  ! 490: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
	.word 0xd6cfe010  ! 491: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
DS_121:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 492: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
tagged_122:
	tsubcctv %r19, 0x1ad2, %r3
	.word 0xd607e001  ! 493: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x81982bce  ! 494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bce, %hpstate
	.word 0x87802004  ! 495: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd6880e40  ! 496: LDUBA_R	lduba	[%r0, %r0] 0x72, %r11
	.word 0x87902374  ! 497: WRPR_TT_I	wrpr	%r0, 0x0374, %tt
	.word 0x8f902002  ! 499: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb16a6001  ! 498: SDIVX_I	sdivx	%r9, 0x0001, %r24
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 499: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802055  ! 500: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8790200e  ! 501: WRPR_TT_I	wrpr	%r0, 0x000e, %tt
	.word 0xa1902009  ! 502: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87802063  ! 503: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93540000  ! 504: RDPR_GL	rdpr	%-, %r9
	.word 0xd337c00c  ! 505: STQF_R	-	%f9, [%r12, %r31]
tagged_124:
	tsubcctv %r10, 0x1803, %r21
	.word 0xd207e001  ! 506: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x879022d3  ! 507: WRPR_TT_I	wrpr	%r0, 0x02d3, %tt
	.word 0xd297e010  ! 508: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
	.word 0x36800001  ! 509: BGE	bge,a	<label_0x1>
	.word 0x879020cc  ! 510: WRPR_TT_I	wrpr	%r0, 0x00cc, %tt
	.word 0x819820d6  ! 511: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d6, %hpstate
splash_tba_125:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 512: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd2d004a0  ! 513: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	.word 0x87802055  ! 514: WRASI_I	wr	%r0, 0x0055, %asi
splash_lsu_126:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 515: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd28008a0  ! 516: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x91d02035  ! 517: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802058  ! 518: WRASI_I	wr	%r0, 0x0058, %asi
tagged_127:
	taddcctv %r15, 0x169e, %r2
	.word 0xd207e001  ! 519: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd24fe001  ! 520: LDSB_I	ldsb	[%r31 + 0x0001], %r9
	.word 0xd2800b80  ! 521: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r9
	.word 0xa3508000  ! 522: RDPR_TSTATE	rdpr	%tstate, %r17
DS_128:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 523: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8d9021d0  ! 524: WRPR_PSTATE_I	wrpr	%r0, 0x01d0, %pstate
DS_129:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 525: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x81460000  ! 526: RD_STICK_REG	stbar
	.word 0xe217e001  ! 527: LDUH_I	lduh	[%r31 + 0x0001], %r17
splash_lsu_130:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 528: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790214a  ! 529: WRPR_TT_I	wrpr	%r0, 0x014a, %tt
	.word 0xe2c7e030  ! 530: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r17
	.word 0x93902002  ! 531: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_131:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 532: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe217e001  ! 533: LDUH_I	lduh	[%r31 + 0x0001], %r17
	.word 0x8d90296b  ! 534: WRPR_PSTATE_I	wrpr	%r0, 0x096b, %pstate
	.word 0x87802004  ! 535: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe247c000  ! 536: LDSW_R	ldsw	[%r31 + %r0], %r17
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 537: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_132:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 538: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xe2800c60  ! 539: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r17
	.word 0x8d902054  ! 540: WRPR_PSTATE_I	wrpr	%r0, 0x0054, %pstate
DS_133:
	.word 0x34800001  ! 542: BG	bg,a	<label_0x1>
	.word 0xd7352001  ! 542: STQF_I	-	%f11, [0x0001, %r20]
	normalw
	.word 0x91458000  ! 541: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x87802088  ! 542: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd0c80e60  ! 543: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r8
	.word 0x8d802004  ! 544: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd137c00c  ! 545: STQF_R	-	%f8, [%r12, %r31]
	.word 0x8150c000  ! 546: RDPR_TT	rdpr	%tt, %r0
	.word 0xa1902004  ! 547: WRPR_GL_I	wrpr	%r0, 0x0004, %-
tagged_134:
	tsubcctv %r21, 0x1db8, %r15
	.word 0xc007e001  ! 548: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xa190200d  ! 549: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87802014  ! 550: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc0d7e000  ! 551: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r0
	.word 0x879022e7  ! 552: WRPR_TT_I	wrpr	%r0, 0x02e7, %tt
	.word 0x91d020b3  ! 553: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x93902006  ! 554: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc0c804a0  ! 555: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0xc0d804a0  ! 556: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
splash_tba_135:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 557: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 558: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc127c00c  ! 559: STF_R	st	%f0, [%r12, %r31]
	.word 0xc197e001  ! 560: LDQFA_I	-	[%r31, 0x0001], %f0
splash_htba_136:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 561: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8f902002  ! 563: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb7a0196c  ! 562: FqTOd	dis not found

	.word 0x9f802001  ! 563: SIR	sir	0x0001
	.word 0xf647e001  ! 564: LDSW_I	ldsw	[%r31 + 0x0001], %r27
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 565: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf737e001  ! 566: STQF_I	-	%f27, [0x0001, %r31]
	.word 0xf68008a0  ! 567: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 568: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 569: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa1902002  ! 570: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d802000  ! 571: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xf68008a0  ! 572: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
splash_lsu_138:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 573: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf647c000  ! 574: LDSW_R	ldsw	[%r31 + %r0], %r27
	.word 0x85a189d4  ! 575: FDIVd	fdivd	%f6, %f20, %f2
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 576: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_139:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 577: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 578: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc4c004a0  ! 579: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
	.word 0x85504000  ! 580: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x93902004  ! 581: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_tba_140:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 582: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200d  ! 583: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_lsu_141:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 584: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc4dfe000  ! 585: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0xc41fe001  ! 587: LDD_I	ldd	[%r31 + 0x0001], %r2
	.word 0xc457e001  ! 588: LDSH_I	ldsh	[%r31 + 0x0001], %r2
tagged_142:
	tsubcctv %r1, 0x197a, %r14
	.word 0xc407e001  ! 589: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_143:
	.word 0x20800001  ! 591: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 590: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802020  ! 591: WRASI_I	wr	%r0, 0x0020, %asi
	ta	T_CHANGE_HPRIV	! macro
tagged_144:
	tsubcctv %r19, 0x1bdd, %r24
	.word 0xc407e001  ! 593: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc517c000  ! 594: LDQF_R	-	[%r31, %r0], %f2
splash_lsu_145:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 595: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x32700001  ! 596: BPNE	<illegal instruction>
	.word 0xc597e001  ! 597: LDQFA_I	-	[%r31, 0x0001], %f2
	.word 0x93902002  ! 598: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc4c004a0  ! 599: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
	.word 0x8d90297d  ! 600: WRPR_PSTATE_I	wrpr	%r0, 0x097d, %pstate
	.word 0xc447e001  ! 601: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	.word 0xc4dfe000  ! 602: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r2
	.word 0xa1902007  ! 603: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93902007  ! 604: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x97508000  ! 606: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0xd6880e40  ! 607: LDUBA_R	lduba	[%r0, %r0] 0x72, %r11
	.word 0xd69fc020  ! 608: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 609: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x38700001  ! 610: BPGU	<illegal instruction>
	.word 0x8f51c000  ! 611: RDPR_TL	rdpr	%tl, %r7
	.word 0xce9004a0  ! 612: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0xcec804a0  ! 613: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
splash_lsu_146:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 614: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcf17c000  ! 615: LDQF_R	-	[%r31, %r0], %f7
	.word 0xce8008a0  ! 616: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
splash_htba_147:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 617: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xce57e001  ! 618: LDSH_I	ldsh	[%r31 + 0x0001], %r7
	.word 0x93902006  ! 619: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x32800001  ! 620: BNE	bne,a	<label_0x1>
	.word 0x8d9020f5  ! 621: WRPR_PSTATE_I	wrpr	%r0, 0x00f5, %pstate
	.word 0xa190200b  ! 622: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x87802088  ! 623: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa745c000  ! 624: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0x91d020b2  ! 625: Tcc_I	ta	icc_or_xcc, %r0 + 178
tagged_148:
	tsubcctv %r12, 0x1a75, %r13
	.word 0xe607e001  ! 626: LDUW_I	lduw	[%r31 + 0x0001], %r19
tagged_149:
	taddcctv %r12, 0x174f, %r11
	.word 0xe607e001  ! 627: LDUW_I	lduw	[%r31 + 0x0001], %r19
splash_tba_150:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 628: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe69fe001  ! 629: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r19
splash_lsu_151:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 630: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 631: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_152:
	tsubcctv %r5, 0x1f52, %r12
	.word 0xe607e001  ! 632: LDUW_I	lduw	[%r31 + 0x0001], %r19
splash_lsu_153:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 633: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_154:
	.word 0x34800001  ! 635: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 634: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902009  ! 635: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87802089  ! 636: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xe69fc020  ! 637: LDDA_R	ldda	[%r31, %r0] 0x01, %r19
	.word 0x22700001  ! 638: BPE	<illegal instruction>
	.word 0x8f902000  ! 640: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa9a01975  ! 639: FqTOd	dis not found

	.word 0xe88008a0  ! 640: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xe8dfe000  ! 641: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 642: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x24700001  ! 643: BPLE	<illegal instruction>
	.word 0x87802016  ! 644: WRASI_I	wr	%r0, 0x0016, %asi
splash_lsu_156:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 645: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_157:
	taddcctv %r4, 0x1c31, %r11
	.word 0xe807e001  ! 646: LDUW_I	lduw	[%r31 + 0x0001], %r20
DS_158:
	.word 0x22800001  ! 648: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 647: SAVE_R	save	%r31, %r0, %r31
	.word 0xe8c7e030  ! 648: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r20
	.word 0xe88fe010  ! 649: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r20
	.word 0x93902005  ! 650: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902003  ! 651: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802004  ! 652: WRASI_I	wr	%r0, 0x0004, %asi
splash_lsu_159:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 653: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_160:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 654: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_161:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 655: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 656: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 657: WRFPRS_I	wr	%r0, 0x0000, %fprs
change_to_randtl_162:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 658: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe897e030  ! 659: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r20
	.word 0xe81fc000  ! 660: LDD_R	ldd	[%r31 + %r0], %r20
tagged_163:
	taddcctv %r26, 0x1e17, %r13
	.word 0xe807e001  ! 661: LDUW_I	lduw	[%r31 + 0x0001], %r20
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 662: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 663: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902003  ! 664: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_randtl_164:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 665: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xe8cfe000  ! 666: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r20
splash_htba_165:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 667: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe8dfe010  ! 668: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r20
	.word 0xe8800be0  ! 669: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r20
	.word 0x99a049b0  ! 670: FDIVs	fdivs	%f1, %f16, %f12
splash_htba_166:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 671: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_cmpr_167:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 673: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181e001  ! 672: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902002  ! 675: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd89fc020  ! 676: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0xb36c8019  ! 677: SDIVX_R	sdivx	%r18, %r25, %r25
change_to_randtl_168:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 678: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902001  ! 679: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1508000  ! 680: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0xa1902003  ! 681: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xe0800ac0  ! 682: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r16
	.word 0x22700001  ! 683: BPE	<illegal instruction>
	.word 0x8d902059  ! 684: WRPR_PSTATE_I	wrpr	%r0, 0x0059, %pstate
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 685: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 686: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x87802055  ! 687: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x9f802001  ! 688: SIR	sir	0x0001
	.word 0xe09fe001  ! 689: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
	ta	T_CHANGE_PRIV	! macro
	.word 0xa190200d  ! 691: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xe08008a0  ! 692: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe09fe001  ! 693: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
	.word 0xe0d7e000  ! 694: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	.word 0xa190200c  ! 695: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x99902002  ! 696: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
DS_169:
	.word 0x32800001  ! 698: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 697: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe08008a0  ! 698: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8f902000  ! 700: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01974  ! 699: FqTOd	dis not found

	.word 0x93902001  ! 700: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_htba_171:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 701: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 702: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2a800001  ! 703: BCS	bcs,a	<label_0x1>
	.word 0x87902380  ! 704: WRPR_TT_I	wrpr	%r0, 0x0380, %tt
tagged_172:
	tsubcctv %r2, 0x1662, %r18
	.word 0xe407e001  ! 705: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x32700001  ! 706: BPNE	<illegal instruction>
	.word 0x879020d2  ! 707: WRPR_TT_I	wrpr	%r0, 0x00d2, %tt
splash_tba_173:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 708: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902083  ! 709: WRPR_PSTATE_I	wrpr	%r0, 0x0083, %pstate
splash_cmpr_174:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1816001  ! 710: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0xe48008a0  ! 711: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x8d802000  ! 712: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe457c000  ! 713: LDSH_R	ldsh	[%r31 + %r0], %r18
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 714: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe4d004a0  ! 715: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
	.word 0xe48fe010  ! 716: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r18
	.word 0x87902249  ! 717: WRPR_TT_I	wrpr	%r0, 0x0249, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xe4800c00  ! 719: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r18
	.word 0x8d802004  ! 720: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902006  ! 721: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902171  ! 722: WRPR_PSTATE_I	wrpr	%r0, 0x0171, %pstate
	.word 0x93902001  ! 723: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x28800001  ! 724: BLEU	bleu,a	<label_0x1>
splash_lsu_175:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 725: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902dff  ! 727: WRPR_PSTATE_I	wrpr	%r0, 0x0dff, %pstate
	.word 0xe447c000  ! 728: LDSW_R	ldsw	[%r31 + %r0], %r18
	.word 0xa1902005  ! 729: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa1902007  ! 730: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe45fe001  ! 731: LDX_I	ldx	[%r31 + 0x0001], %r18
	.word 0x8d902b0b  ! 732: WRPR_PSTATE_I	wrpr	%r0, 0x0b0b, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xe4800ae0  ! 734: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r18
	.word 0xe49fe001  ! 735: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0xe4c7e000  ! 736: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
DS_176:
	.word 0x20800001  ! 738: BN	bn,a	<label_0x1>
	pdist %f6, %f24, %f4
	.word 0x83b20314  ! 737: ALLIGNADDRESS	alignaddr	%r8, %r20, %r1
	.word 0x8d902ac3  ! 738: WRPR_PSTATE_I	wrpr	%r0, 0x0ac3, %pstate
	.word 0xc2d80e80  ! 739: LDXA_R	ldxa	[%r0, %r0] 0x74, %r1
	.word 0xc21fc000  ! 740: LDD_R	ldd	[%r31 + %r0], %r1
DS_177:
	.word 0x32800001  ! 742: BNE	bne,a	<label_0x1>
	allclean
	.word 0x81b50312  ! 741: ALLIGNADDRESS	alignaddr	%r20, %r18, %r0
	.word 0x99902005  ! 742: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xc00fe001  ! 743: LDUB_I	ldub	[%r31 + 0x0001], %r0
	.word 0x91d02034  ! 744: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8790200a  ! 745: WRPR_TT_I	wrpr	%r0, 0x000a, %tt
	.word 0x87802089  ! 746: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x83d020b3  ! 747: Tcc_I	te	icc_or_xcc, %r0 + 179
tagged_178:
	tsubcctv %r9, 0x1ad5, %r23
	.word 0xc007e001  ! 748: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x22700001  ! 749: BPE	<illegal instruction>
	.word 0xc08804a0  ! 750: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x879023c4  ! 751: WRPR_TT_I	wrpr	%r0, 0x03c4, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x89480000  ! 753: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x8d802000  ! 754: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc8d804a0  ! 755: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0xc8c004a0  ! 756: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r4
	.word 0xa1902003  ! 757: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x91d02035  ! 758: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81508000  ! 759: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0xc09004a0  ! 760: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	.word 0xc09004a0  ! 761: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
DS_179:
	.word 0x34800001  ! 763: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 762: SAVE_R	save	%r31, %r0, %r31
splash_lsu_180:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 763: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x28800001  ! 764: BLEU	bleu,a	<label_0x1>
	.word 0xc0800b60  ! 765: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r0
	.word 0x93902001  ! 766: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc08008a0  ! 767: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x8cd54006  ! 768: UMULcc_R	umulcc 	%r21, %r6, %r6
splash_cmpr_181:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 770: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 769: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0xcc4fe001  ! 770: LDSB_I	ldsb	[%r31 + 0x0001], %r6
splash_lsu_182:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 771: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_183:
	taddcctv %r3, 0x1d1f, %r14
	.word 0xcc07e001  ! 772: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x879020ed  ! 773: WRPR_TT_I	wrpr	%r0, 0x00ed, %tt
	.word 0x93902003  ! 774: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x28700001  ! 775: BPLEU	<illegal instruction>
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 776: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_184:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180a001  ! 777: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0x99902002  ! 778: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x2c800001  ! 779: BNEG	bneg,a	<label_0x1>
	.word 0xaf51c000  ! 780: RDPR_TL	rdpr	%tl, %r23
	.word 0xeed004a0  ! 781: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r23
	.word 0xee8008a0  ! 782: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0x879020c3  ! 783: WRPR_TT_I	wrpr	%r0, 0x00c3, %tt
	.word 0xeed7e000  ! 784: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
	.word 0x8d902776  ! 785: WRPR_PSTATE_I	wrpr	%r0, 0x0776, %pstate
	.word 0xee8008a0  ! 786: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
DS_185:
	.word 0x34800001  ! 788: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 788: BE	be,a	<label_0x1>
	.word 0xa9a0054d  ! 788: FSQRTd	fsqrt	
	.word 0xafa50827  ! 787: FADDs	fadds	%f20, %f7, %f23
	.word 0xa190200e  ! 788: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xee07c000  ! 789: LDUW_R	lduw	[%r31 + %r0], %r23
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 790: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902148  ! 791: WRPR_TT_I	wrpr	%r0, 0x0148, %tt
	.word 0xeec7e020  ! 792: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r23
	.word 0xee900e40  ! 793: LDUHA_R	lduha	[%r0, %r0] 0x72, %r23
	ta	T_CHANGE_HPRIV	! macro
DS_186:
	.word 0x22800001  ! 796: BE	be,a	<label_0x1>
	.word 0xd731a001  ! 796: STQF_I	-	%f11, [0x0001, %r6]
	normalw
	.word 0x97458000  ! 795: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x85500000  ! 796: RDPR_TPC	rdpr	%tpc, %r2
	.word 0xc45fe001  ! 797: LDX_I	ldx	[%r31 + 0x0001], %r2
	.word 0x89494000  ! 798: RDHPR_HTBA	rdhpr	%htba, %r4
	.word 0x9f802001  ! 799: SIR	sir	0x0001
	.word 0xad508000  ! 800: RDPR_TSTATE	rdpr	%tstate, %r22
change_to_randtl_187:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 801: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x91d020b5  ! 802: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_lsu_188:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 803: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2a700001  ! 804: BPCS	<illegal instruction>
	.word 0xec47c000  ! 805: LDSW_R	ldsw	[%r31 + %r0], %r22
	.word 0xa190200b  ! 806: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xa6aec000  ! 807: ANDNcc_R	andncc 	%r27, %r0, %r19
	.word 0xe647c000  ! 808: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x9f802001  ! 809: SIR	sir	0x0001
DS_189:
	.word 0x20800001  ! 811: BN	bn,a	<label_0x1>
	.word 0xf1326001  ! 811: STQF_I	-	%f24, [0x0001, %r9]
	normalw
	.word 0x83458000  ! 810: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xa1902005  ! 811: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x93902001  ! 812: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_190:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 813: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 814: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802020  ! 815: WRASI_I	wr	%r0, 0x0020, %asi
splash_tba_191:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 816: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 817: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_192:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 818: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 819: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc217e001  ! 820: LDUH_I	lduh	[%r31 + 0x0001], %r1
	.word 0x8d902b34  ! 821: WRPR_PSTATE_I	wrpr	%r0, 0x0b34, %pstate
	.word 0x87802088  ! 822: WRASI_I	wr	%r0, 0x0088, %asi
splash_cmpr_193:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 824: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 823: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0x38800001  ! 824: BGU	bgu,a	<label_0x1>
	.word 0x93902001  ! 825: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_tba_194:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 826: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_195:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 827: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_196:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 828: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_197:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 829: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_198:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 830: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_199:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 831: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x3e700001  ! 832: BPVC	<illegal instruction>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 833: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f802001  ! 835: SIR	sir	0x0001
	.word 0xc337e001  ! 836: STQF_I	-	%f1, [0x0001, %r31]
	.word 0x93d02034  ! 837: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x91d02033  ! 838: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc2d7e000  ! 839: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r1
	.word 0x93902001  ! 840: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc24fe001  ! 841: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	.word 0xc28008a0  ! 842: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc20fc000  ! 843: LDUB_R	ldub	[%r31 + %r0], %r1
splash_tba_200:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 844: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879023c3  ! 845: WRPR_TT_I	wrpr	%r0, 0x03c3, %tt
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 846: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 847: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa8d54019  ! 848: UMULcc_R	umulcc 	%r21, %r25, %r20
	.word 0x91d02033  ! 849: Tcc_I	ta	icc_or_xcc, %r0 + 51
tagged_201:
	taddcctv %r1, 0x1f6a, %r3
	.word 0xe807e001  ! 850: LDUW_I	lduw	[%r31 + 0x0001], %r20
splash_tba_202:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 851: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
DS_203:
	.word 0x22800001  ! 854: BE	be,a	<label_0x1>
	.word 0xc335c005  ! 854: STQF_R	-	%f1, [%r5, %r23]
	normalw
	.word 0x8f458000  ! 853: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8d9021a7  ! 854: WRPR_PSTATE_I	wrpr	%r0, 0x01a7, %pstate
	.word 0x91d02035  ! 855: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xced7e000  ! 856: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r7
DS_204:
	.word 0x34800001  ! 858: BG	bg,a	<label_0x1>
	.xword 0xc74f18eb	! Random illegal ?
	.word 0x8fa00549  ! 858: FSQRTd	fsqrt	
	.word 0x8ba60827  ! 857: FADDs	fadds	%f24, %f7, %f5
	.word 0xca4fc000  ! 858: LDSB_R	ldsb	[%r31 + %r0], %r5
	.word 0xca27e001  ! 859: STW_I	stw	%r5, [%r31 + 0x0001]
	ta	T_CHANGE_PRIV	! macro
DS_205:
	.word 0x34800001  ! 862: BG	bg,a	<label_0x1>
	.word 0xeb306001  ! 862: STQF_I	-	%f21, [0x0001, %r1]
	normalw
	.word 0x8b458000  ! 861: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xca4fe001  ! 862: LDSB_I	ldsb	[%r31 + 0x0001], %r5
splash_tba_206:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 863: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xca8804a0  ! 864: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
DS_207:
	.word 0x34800001  ! 866: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 866: BE	be,a	<label_0x1>
	.word 0x87a00541  ! 866: FSQRTd	fsqrt	
	.word 0x9ba40832  ! 865: FADDs	fadds	%f16, %f18, %f13
	.word 0x91d02033  ! 866: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x3a700001  ! 867: BPCC	<illegal instruction>
	.word 0xda4fc000  ! 868: LDSB_R	ldsb	[%r31 + %r0], %r13
	.word 0x879020d8  ! 869: WRPR_TT_I	wrpr	%r0, 0x00d8, %tt
	.word 0xdad7e020  ! 870: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	.word 0xa1902008  ! 871: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_lsu_208:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 872: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 873: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902840  ! 874: WRPR_PSTATE_I	wrpr	%r0, 0x0840, %pstate
splash_lsu_209:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 875: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_210:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 876: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902004  ! 877: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_211:
	taddcctv %r18, 0x1ddd, %r19
	.word 0xda07e001  ! 878: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x93902004  ! 879: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xdad804a0  ! 880: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0xa1902002  ! 881: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902004  ! 882: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_htba_212:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 883: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x26800001  ! 884: BL	bl,a	<label_0x1>
	.word 0x8790234d  ! 885: WRPR_TT_I	wrpr	%r0, 0x034d, %tt
splash_tba_213:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 886: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99504000  ! 887: RDPR_TNPC	rdpr	%tnpc, %r12
	.word 0x8d902e3a  ! 888: WRPR_PSTATE_I	wrpr	%r0, 0x0e3a, %pstate
splash_tba_214:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 889: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd81fe001  ! 890: LDD_I	ldd	[%r31 + 0x0001], %r12
	.word 0x99902000  ! 891: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
tagged_215:
	taddcctv %r8, 0x12ce, %r15
	.word 0xd807e001  ! 892: LDUW_I	lduw	[%r31 + 0x0001], %r12
splash_htba_216:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 893: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd84fe001  ! 894: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0x8d902e45  ! 895: WRPR_PSTATE_I	wrpr	%r0, 0x0e45, %pstate
splash_lsu_217:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 896: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9351c000  ! 897: RDPR_TL	rdpr	%tl, %r9
splash_lsu_218:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 898: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d02032  ! 899: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_lsu_219:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 900: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 901: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd28008a0  ! 902: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd317c000  ! 903: LDQF_R	-	[%r31, %r0], %f9
	.word 0xd24fe001  ! 904: LDSB_I	ldsb	[%r31 + 0x0001], %r9
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982856  ! 907: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0856, %hpstate
	.word 0x87802055  ! 908: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd29fc020  ! 909: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0x8d90285f  ! 910: WRPR_PSTATE_I	wrpr	%r0, 0x085f, %pstate
	.word 0xad514000  ! 911: RDPR_TBA	rdpr	%tba, %r22
splash_lsu_220:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 912: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_221:
	taddcctv %r8, 0x1276, %r10
	.word 0xec07e001  ! 913: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0xec880e60  ! 914: LDUBA_R	lduba	[%r0, %r0] 0x73, %r22
	.word 0x28800001  ! 915: BLEU	bleu,a	<label_0x1>
	.word 0x87802088  ! 916: WRASI_I	wr	%r0, 0x0088, %asi
splash_lsu_222:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 917: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_223:
	taddcctv %r21, 0x1902, %r23
	.word 0xec07e001  ! 918: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x8f504000  ! 919: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0xcf97e001  ! 920: LDQFA_I	-	[%r31, 0x0001], %f7
	.word 0xce8008a0  ! 921: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 922: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_224:
	tsubcctv %r19, 0x12cf, %r2
	.word 0xce07e001  ! 923: LDUW_I	lduw	[%r31 + 0x0001], %r7
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 924: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 925: SIR	sir	0x0001
DS_225:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 926: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x93902004  ! 927: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93d02035  ! 928: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8545c000  ! 929: RD_TICK_CMPR_REG	rd	%-, %r2
splash_tba_226:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 930: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 931: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902ddc  ! 932: WRPR_PSTATE_I	wrpr	%r0, 0x0ddc, %pstate
	.word 0xc457c000  ! 933: LDSH_R	ldsh	[%r31 + %r0], %r2
splash_tba_227:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 934: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 935: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 937: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83a01970  ! 936: FqTOd	dis not found

	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 937: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 938: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xc2d00e60  ! 939: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r1
DS_229:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 940: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xc24fe001  ! 941: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	.word 0x87802088  ! 942: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x83d02033  ! 943: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x93902006  ! 944: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc28008a0  ! 945: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
tagged_230:
	tsubcctv %r20, 0x1e05, %r3
	.word 0xc207e001  ! 946: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x87802055  ! 947: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xa1902005  ! 948: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87802055  ! 949: WRASI_I	wr	%r0, 0x0055, %asi
tagged_231:
	taddcctv %r5, 0x1ab2, %r7
	.word 0xc207e001  ! 950: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x3e800001  ! 951: BVC	bvc,a	<label_0x1>
	.word 0xa190200d  ! 952: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa190200f  ! 953: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8780204f  ! 954: WRASI_I	wr	%r0, 0x004f, %asi
change_to_randtl_232:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 955: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa1902007  ! 956: WRPR_GL_I	wrpr	%r0, 0x0007, %-
DS_233:
	.word 0x34800001  ! 958: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 957: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902273  ! 958: WRPR_PSTATE_I	wrpr	%r0, 0x0273, %pstate
	.word 0x8780201c  ! 959: WRASI_I	wr	%r0, 0x001c, %asi
DS_234:
	.word 0x20800001  ! 961: BN	bn,a	<label_0x1>
	allclean
	.word 0x83b2830c  ! 960: ALLIGNADDRESS	alignaddr	%r10, %r12, %r1
splash_cmpr_235:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 962: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1866001  ! 961: WR_STICK_REG_I	wr	%r25, 0x0001, %-
tagged_236:
	tsubcctv %r22, 0x1fe9, %r2
	.word 0xc207e001  ! 962: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc2c7e020  ! 963: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r1
	.word 0x93d020b4  ! 964: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xc20fc000  ! 965: LDUB_R	ldub	[%r31 + %r0], %r1
	.word 0x2c700001  ! 966: BPNEG	<illegal instruction>
	.word 0x87802055  ! 967: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x87802063  ! 968: WRASI_I	wr	%r0, 0x0063, %asi
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 969: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_237:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 971: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182a001  ! 970: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0xc257c000  ! 971: LDSH_R	ldsh	[%r31 + %r0], %r1
splash_lsu_238:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 972: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc28008a0  ! 973: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc2d7e000  ! 974: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r1
	.word 0x38800001  ! 975: BGU	bgu,a	<label_0x1>
tagged_239:
	taddcctv %r2, 0x1ca8, %r20
	.word 0xc207e001  ! 976: LDUW_I	lduw	[%r31 + 0x0001], %r1
DS_240:
	.word 0x22800001  ! 978: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 977: RESTORE_R	restore	%r31, %r0, %r31
tagged_241:
	taddcctv %r12, 0x1a1a, %r10
	.word 0xc207e001  ! 978: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc2c80e40  ! 979: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r1
	.word 0xc21fc000  ! 980: LDD_R	ldd	[%r31 + %r0], %r1
	.word 0x91d02034  ! 981: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802004  ! 982: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902004  ! 983: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_242:
	.word 0x34800001  ! 985: BG	bg,a	<label_0x1>
	pdist %f10, %f10, %f22
	.word 0x8db00313  ! 984: ALLIGNADDRESS	alignaddr	%r0, %r19, %r6
splash_lsu_243:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 985: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 986: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 987: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_244:
	.word 0x32800001  ! 989: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 988: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x879022ec  ! 989: WRPR_TT_I	wrpr	%r0, 0x02ec, %tt
	.word 0x8d902f07  ! 990: WRPR_PSTATE_I	wrpr	%r0, 0x0f07, %pstate
	ta	T_CHANGE_HPRIV	! macro
splash_tba_245:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 992: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc17e001  ! 993: LDUH_I	lduh	[%r31 + 0x0001], %r6
	.word 0x91d02032  ! 994: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xcc9fc020  ! 995: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0xcc800c40  ! 996: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r6
	.word 0xcc17c000  ! 997: LDUH_R	lduh	[%r31 + %r0], %r6
	.word 0x32800001  ! 998: BNE	bne,a	<label_0x1>
	.word 0xccd00e80  ! 999: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r6
splash_tba_246:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1000: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc8008a0  ! 1001: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x3c800001  ! 1002: BPOS	bpos,a	<label_0x1>
	.word 0x87802055  ! 1003: WRASI_I	wr	%r0, 0x0055, %asi
splash_lsu_247:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1004: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 1005: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xcc0fc000  ! 1006: LDUB_R	ldub	[%r31 + %r0], %r6
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1007: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1008: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_248:
	tsubcctv %r14, 0x101e, %r4
	.word 0xcc07e001  ! 1009: LDUW_I	lduw	[%r31 + 0x0001], %r6
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1010: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_249:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1011: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9151c000  ! 1012: RDPR_TL	rdpr	%tl, %r8
	.word 0xa1902004  ! 1013: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_htba_250:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1014: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8790200b  ! 1015: WRPR_TT_I	wrpr	%r0, 0x000b, %tt
	.word 0x87802088  ! 1016: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd0800c20  ! 1017: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r8
	.word 0xd09004a0  ! 1018: LDUHA_R	lduha	[%r0, %r0] 0x25, %r8
	.word 0x83d02033  ! 1019: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xd0d7e010  ! 1020: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
	.word 0xd047c000  ! 1021: LDSW_R	ldsw	[%r31 + %r0], %r8
	.word 0x93902001  ! 1022: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd09fe001  ! 1023: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r8
	.word 0x93902001  ! 1024: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd01fe001  ! 1025: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x81982dd6  ! 1026: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd6, %hpstate
	.word 0x879023ae  ! 1027: WRPR_TT_I	wrpr	%r0, 0x03ae, %tt
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1028: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 1029: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa3500000  ! 1030: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x8d464000  ! 1031: RD_STICK_CMPR_REG	rd	%-, %r6
splash_tba_251:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1032: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1033: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_252:
	.word 0x20800001  ! 1035: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1034: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xccd80e60  ! 1035: LDXA_R	ldxa	[%r0, %r0] 0x73, %r6
	.word 0xcd27e001  ! 1036: STF_I	st	%f6, [0x0001, %r31]
	.word 0xcc57e001  ! 1037: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	.word 0xcc8fe010  ! 1038: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r6
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 1039: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xcc9004a0  ! 1040: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
	.word 0xccd004a0  ! 1041: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r6
	.word 0xa1902003  ! 1042: WRPR_GL_I	wrpr	%r0, 0x0003, %-
tagged_253:
	taddcctv %r21, 0x1412, %r6
	.word 0xcc07e001  ! 1043: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc97e010  ! 1044: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r6
	.word 0x93902002  ! 1045: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982f87  ! 1046: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f87, %hpstate
	.word 0xcd27c013  ! 1047: STF_R	st	%f6, [%r19, %r31]
splash_lsu_254:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1048: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_255:
	.word 0x34800001  ! 1050: BG	bg,a	<label_0x1>
	allclean
	.word 0x89b24303  ! 1049: ALLIGNADDRESS	alignaddr	%r9, %r3, %r4
	.word 0xc89fe001  ! 1050: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1051: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8780204f  ! 1052: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x91d020b5  ! 1053: Tcc_I	ta	icc_or_xcc, %r0 + 181
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1054: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_256:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1055: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_257:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1056: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_258:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1057: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xb1500000  ! 1058: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x93902001  ! 1059: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xf0800c60  ! 1060: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r24
DS_259:
	.word 0x32800001  ! 1062: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1062: BNE	bne,a	<label_0x1>
	.word 0xafa00553  ! 1062: FSQRTd	fsqrt	
	.word 0x97a1c827  ! 1061: FADDs	fadds	%f7, %f7, %f11
DS_260:
	.word 0x34800001  ! 1063: BG	bg,a	<label_0x1>
	.word 0xc5318004  ! 1063: STQF_R	-	%f2, [%r4, %r6]
	normalw
	.word 0x99458000  ! 1062: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x2e700001  ! 1063: BPVS	<illegal instruction>
	.word 0x93902002  ! 1064: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1065: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021c3  ! 1066: WRPR_TT_I	wrpr	%r0, 0x01c3, %tt
	.word 0x8780204f  ! 1067: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8d802000  ! 1068: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd8800c00  ! 1069: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r12
	.word 0x91d02033  ! 1070: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8f902002  ! 1072: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87a0196c  ! 1071: FqTOd	dis not found

	.word 0x93902003  ! 1072: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc657e001  ! 1073: LDSH_I	ldsh	[%r31 + 0x0001], %r3
	.word 0xc6cfe020  ! 1074: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r3
tagged_262:
	tsubcctv %r9, 0x1b50, %r22
	.word 0xc607e001  ! 1075: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_lsu_263:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1076: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 1077: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d020b4  ! 1078: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xc6800be0  ! 1079: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r3
splash_tba_264:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1080: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83d02033  ! 1082: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xc6bfe001  ! 1083: STDA_I	stda	%r3, [%r31 + 0x0001] %asi
splash_lsu_265:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1084: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc68008a0  ! 1085: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
DS_266:
	.word 0x34800001  ! 1087: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1086: SAVE_R	save	%r31, %r0, %r31
	.word 0x3a700001  ! 1087: BPCC	<illegal instruction>
	.word 0x9f802001  ! 1088: SIR	sir	0x0001
	ta	T_CHANGE_PRIV	! macro
splash_lsu_267:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1090: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_268:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1091: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xa1902001  ! 1092: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1093: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32700001  ! 1094: BPNE	<illegal instruction>
	.word 0xc6d80e60  ! 1095: LDXA_R	ldxa	[%r0, %r0] 0x73, %r3
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1096: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc68008a0  ! 1097: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x93480000  ! 1098: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
DS_269:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1099: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xd25fe001  ! 1100: LDX_I	ldx	[%r31 + 0x0001], %r9
DS_270:
	.word 0x34800001  ! 1102: BG	bg,a	<label_0x1>
	.word 0xd736c009  ! 1102: STQF_R	-	%f11, [%r9, %r27]
	normalw
	.word 0x8d458000  ! 1101: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x91d02034  ! 1102: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902cd1  ! 1103: WRPR_PSTATE_I	wrpr	%r0, 0x0cd1, %pstate
	.word 0xa1902007  ! 1104: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1105: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc9fe001  ! 1106: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	.word 0xccc7e030  ! 1107: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	.word 0x8780201c  ! 1108: WRASI_I	wr	%r0, 0x001c, %asi
DS_271:
	.word 0x22800001  ! 1110: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1109: SAVE_R	save	%r31, %r0, %r31
DS_272:
	.word 0x32800001  ! 1111: BNE	bne,a	<label_0x1>
	pdist %f2, %f18, %f2
	.word 0x93b04306  ! 1110: ALLIGNADDRESS	alignaddr	%r1, %r6, %r9
	.word 0xd2d80e60  ! 1111: LDXA_R	ldxa	[%r0, %r0] 0x73, %r9
	.word 0x9f802001  ! 1112: SIR	sir	0x0001
splash_tba_273:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1113: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902279  ! 1114: WRPR_TT_I	wrpr	%r0, 0x0279, %tt
	.word 0xd29fc020  ! 1115: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0x87802088  ! 1116: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd28008a0  ! 1117: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
splash_tba_274:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1118: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 1119: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_275:
	.word 0x32800001  ! 1121: BNE	bne,a	<label_0x1>
	.word 0xd3302001  ! 1121: STQF_I	-	%f9, [0x0001, %r0]
	normalw
	.word 0x8b458000  ! 1120: RD_SOFTINT_REG	rd	%softint, %r5
splash_htba_276:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1121: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_277:
	taddcctv %r17, 0x14cd, %r26
	.word 0xca07e001  ! 1122: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x24800001  ! 1123: BLE	ble,a	<label_0x1>
	.word 0xca5fe001  ! 1124: LDX_I	ldx	[%r31 + 0x0001], %r5
splash_tba_278:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1125: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xca17e001  ! 1126: LDUH_I	lduh	[%r31 + 0x0001], %r5
tagged_279:
	taddcctv %r1, 0x1a03, %r13
	.word 0xca07e001  ! 1127: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xca800be0  ! 1128: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r5
	.word 0x9f802001  ! 1129: SIR	sir	0x0001
	.word 0x93902001  ! 1130: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1131: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 1132: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x879021ad  ! 1133: WRPR_TT_I	wrpr	%r0, 0x01ad, %tt
	.word 0xca9fc020  ! 1134: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
DS_280:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1135: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	ta	T_CHANGE_HPRIV	! macro
splash_lsu_281:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1137: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 1138: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_282:
	.word 0x32800001  ! 1140: BNE	bne,a	<label_0x1>
	.word 0xc734e001  ! 1140: STQF_I	-	%f3, [0x0001, %r19]
	normalw
	.word 0x8b458000  ! 1139: RD_SOFTINT_REG	rd	%softint, %r5
splash_tba_283:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1140: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902f6c  ! 1141: WRPR_PSTATE_I	wrpr	%r0, 0x0f6c, %pstate
	.word 0x8d9025bb  ! 1142: WRPR_PSTATE_I	wrpr	%r0, 0x05bb, %pstate
	.word 0xca8fe010  ! 1143: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r5
	.word 0xca8fe000  ! 1144: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r5
	.word 0xca5fe001  ! 1145: LDX_I	ldx	[%r31 + 0x0001], %r5
	.word 0xca8008a0  ! 1146: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
tagged_284:
	tsubcctv %r22, 0x1b7c, %r1
	.word 0xca07e001  ! 1147: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x88d1c006  ! 1148: UMULcc_R	umulcc 	%r7, %r6, %r4
	.word 0xc8d004a0  ! 1149: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0xc817c000  ! 1150: LDUH_R	lduh	[%r31 + %r0], %r4
	.word 0xc857e001  ! 1151: LDSH_I	ldsh	[%r31 + 0x0001], %r4
splash_tba_285:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1152: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc81fe001  ! 1153: LDD_I	ldd	[%r31 + 0x0001], %r4
	.word 0xc847c000  ! 1154: LDSW_R	ldsw	[%r31 + %r0], %r4
tagged_286:
	tsubcctv %r19, 0x1f88, %r18
	.word 0xc807e001  ! 1155: LDUW_I	lduw	[%r31 + 0x0001], %r4
splash_htba_287:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1156: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc8c004a0  ! 1157: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r4
	.word 0x8d9028f8  ! 1158: WRPR_PSTATE_I	wrpr	%r0, 0x08f8, %pstate
splash_cmpr_288:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1822001  ! 1159: WR_STICK_REG_I	wr	%r8, 0x0001, %-
tagged_289:
	taddcctv %r17, 0x1ed5, %r6
	.word 0xc807e001  ! 1160: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xa1902002  ! 1161: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xc89004a0  ! 1162: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
	.word 0x8790231c  ! 1163: WRPR_TT_I	wrpr	%r0, 0x031c, %tt
	.word 0x93902005  ! 1164: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_290:
	.word 0x32800001  ! 1166: BNE	bne,a	<label_0x1>
	.xword 0xff42c560	! Random illegal ?
	.word 0x89a0055a  ! 1166: FSQRTd	fsqrt	
	.word 0xa7a34829  ! 1165: FADDs	fadds	%f13, %f9, %f19
	.word 0x87802014  ! 1166: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902001  ! 1167: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_htba_291:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1168: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_292:
	.word 0x22800001  ! 1170: BE	be,a	<label_0x1>
	pdist %f0, %f18, %f28
	.word 0x95b68308  ! 1169: ALLIGNADDRESS	alignaddr	%r26, %r8, %r10
	.word 0x87802020  ! 1170: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xa1902009  ! 1171: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd49004a0  ! 1172: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	.word 0x9f802001  ! 1173: SIR	sir	0x0001
	.word 0xd41fe001  ! 1174: LDD_I	ldd	[%r31 + 0x0001], %r10
splash_lsu_293:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1175: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 1176: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xb1464000  ! 1177: RD_STICK_CMPR_REG	rd	%-, %r24
	.word 0x87802089  ! 1178: WRASI_I	wr	%r0, 0x0089, %asi
tagged_294:
	tsubcctv %r17, 0x1ccb, %r26
	.word 0xf007e001  ! 1179: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0xf01fe001  ! 1180: LDD_I	ldd	[%r31 + 0x0001], %r24
	.word 0x93902007  ! 1181: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x879021aa  ! 1182: WRPR_TT_I	wrpr	%r0, 0x01aa, %tt
	.word 0x93902003  ! 1183: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xf1e7c028  ! 1184: CASA_I	casa	[%r31] 0x 1, %r8, %r24
	.word 0x8d802004  ! 1185: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_295:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1187: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180e001  ! 1186: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x93902004  ! 1187: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902e00  ! 1188: WRPR_PSTATE_I	wrpr	%r0, 0x0e00, %pstate
	.word 0xf08008a0  ! 1189: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1190: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf0dfe000  ! 1191: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r24
	.word 0x20800001  ! 1192: BN	bn,a	<label_0x1>
	.word 0x99902001  ! 1193: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
DS_296:
	.word 0x32800001  ! 1195: BNE	bne,a	<label_0x1>
	.xword 0xb3ec74c2	! Random illegal ?
	.word 0x81a00556  ! 1195: FSQRTd	fsqrt	
	.word 0x85a18822  ! 1194: FADDs	fadds	%f6, %f2, %f2
DS_297:
	.word 0x20800001  ! 1196: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1195: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802004  ! 1196: WRASI_I	wr	%r0, 0x0004, %asi
tagged_298:
	tsubcctv %r20, 0x1e68, %r26
	.word 0xc407e001  ! 1197: LDUW_I	lduw	[%r31 + 0x0001], %r2
splash_lsu_299:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1198: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 1199: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc41fc000  ! 1200: LDD_R	ldd	[%r31 + %r0], %r2
	.word 0xa1902005  ! 1201: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xc45fe001  ! 1202: LDX_I	ldx	[%r31 + 0x0001], %r2
tagged_300:
	tsubcctv %r12, 0x1301, %r6
	.word 0xc407e001  ! 1203: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x91d02032  ! 1204: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902001  ! 1205: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8d9020da  ! 1206: WRPR_PSTATE_I	wrpr	%r0, 0x00da, %pstate
	.word 0xc457e001  ! 1207: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0xc407c000  ! 1208: LDUW_R	lduw	[%r31 + %r0], %r2
splash_lsu_301:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1209: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_302:
	.word 0x32800001  ! 1211: BNE	bne,a	<label_0x1>
	.word 0xd732a001  ! 1211: STQF_I	-	%f11, [0x0001, %r10]
	normalw
	.word 0x8d458000  ! 1210: RD_SOFTINT_REG	rd	%softint, %r6
splash_lsu_303:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1211: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_304:
	tsubcctv %r18, 0x1d67, %r20
	.word 0xcc07e001  ! 1212: LDUW_I	lduw	[%r31 + 0x0001], %r6
tagged_305:
	taddcctv %r7, 0x13d4, %r19
	.word 0xcc07e001  ! 1213: LDUW_I	lduw	[%r31 + 0x0001], %r6
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1214: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xcc800b20  ! 1215: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r6
	.word 0x8d902888  ! 1216: WRPR_PSTATE_I	wrpr	%r0, 0x0888, %pstate
	.word 0x9545c000  ! 1217: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xd527c002  ! 1218: STF_R	st	%f10, [%r2, %r31]
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_306:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1220: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_307:
	taddcctv %r20, 0x1384, %r23
	.word 0xd407e001  ! 1221: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xa1464000  ! 1222: RD_STICK_CMPR_REG	rd	%-, %r16
splash_tba_308:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1223: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879021c8  ! 1224: WRPR_TT_I	wrpr	%r0, 0x01c8, %tt
splash_tba_309:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1225: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802004  ! 1226: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe117c000  ! 1227: LDQF_R	-	[%r31, %r0], %f16
	.word 0xe0d804a0  ! 1228: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	.word 0xe08fe020  ! 1229: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r16
	.word 0x9b494000  ! 1230: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0xda1fc000  ! 1231: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xda880e60  ! 1232: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
tagged_310:
	tsubcctv %r24, 0x161e, %r12
	.word 0xda07e001  ! 1233: LDUW_I	lduw	[%r31 + 0x0001], %r13
DS_311:
	.word 0x20800001  ! 1235: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1234: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802063  ! 1235: WRASI_I	wr	%r0, 0x0063, %asi
splash_lsu_312:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1236: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 1237: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xda17e001  ! 1238: LDUH_I	lduh	[%r31 + 0x0001], %r13
	.word 0xda5fe001  ! 1239: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0x8d90297c  ! 1240: WRPR_PSTATE_I	wrpr	%r0, 0x097c, %pstate
	.word 0x9f802001  ! 1241: SIR	sir	0x0001
splash_lsu_313:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1242: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982905  ! 1243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0905, %hpstate
DS_314:
	.word 0x34800001  ! 1245: BG	bg,a	<label_0x1>
	pdist %f10, %f26, %f4
	.word 0x8fb5030d  ! 1244: ALLIGNADDRESS	alignaddr	%r20, %r13, %r7
	.word 0x81480000  ! 1245: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0xc04fc000  ! 1246: LDSB_R	ldsb	[%r31 + %r0], %r0
	.word 0x87902350  ! 1247: WRPR_TT_I	wrpr	%r0, 0x0350, %tt
change_to_randtl_315:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1248: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xc08fe020  ! 1249: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r0
DS_316:
	.word 0x34800001  ! 1251: BG	bg,a	<label_0x1>
	pdist %f16, %f24, %f30
	.word 0x87b50309  ! 1250: ALLIGNADDRESS	alignaddr	%r20, %r9, %r3
	.word 0xc6dfe020  ! 1251: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r3
	.word 0x879020b6  ! 1252: WRPR_TT_I	wrpr	%r0, 0x00b6, %tt
	.word 0xc6c00e80  ! 1253: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r3
	.word 0x8f902000  ! 1255: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a01962  ! 1254: FqTOd	dis not found

splash_tba_318:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1255: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802001  ! 1256: SIR	sir	0x0001
splash_lsu_319:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1257: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 1258: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe4d7e030  ! 1259: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r18
	.word 0x2e700001  ! 1260: BPVS	<illegal instruction>
	.word 0xe40fe001  ! 1261: LDUB_I	ldub	[%r31 + 0x0001], %r18
tagged_320:
	tsubcctv %r24, 0x1f95, %r15
	.word 0xe407e001  ! 1262: LDUW_I	lduw	[%r31 + 0x0001], %r18
DS_321:
	.word 0x32800001  ! 1264: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1264: BNE	bne,a	<label_0x1>
	.word 0xdb100018  ! 1264: LDQF_R	-	[%r0, %r24], %f13
	.word 0x99a50835  ! 1263: FADDs	fadds	%f20, %f21, %f12
	.word 0xa1902003  ! 1264: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd88fe020  ! 1265: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
DS_322:
	.word 0x34800001  ! 1267: BG	bg,a	<label_0x1>
	.word 0xd3314003  ! 1267: STQF_R	-	%f9, [%r3, %r5]
	normalw
	.word 0x83458000  ! 1266: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xc28008a0  ! 1267: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc2d804a0  ! 1268: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	.word 0xc28008a0  ! 1269: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x8d902db8  ! 1270: WRPR_PSTATE_I	wrpr	%r0, 0x0db8, %pstate
	.word 0xc20fc000  ! 1271: LDUB_R	ldub	[%r31 + %r0], %r1
	.word 0x8d902b3f  ! 1272: WRPR_PSTATE_I	wrpr	%r0, 0x0b3f, %pstate
	.word 0xa190200f  ! 1273: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_323:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1274: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902002  ! 1275: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d020b4  ! 1276: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_lsu_324:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1277: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc2d7e020  ! 1278: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r1
	.word 0xc29fc020  ! 1279: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	.word 0x879022fa  ! 1280: WRPR_TT_I	wrpr	%r0, 0x02fa, %tt
DS_325:
	.word 0x20800001  ! 1282: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1281: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc28008a0  ! 1282: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc2d80e60  ! 1283: LDXA_R	ldxa	[%r0, %r0] 0x73, %r1
	.word 0x8d90282f  ! 1284: WRPR_PSTATE_I	wrpr	%r0, 0x082f, %pstate
	.word 0x93902001  ! 1285: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_tba_326:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1286: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99902001  ! 1287: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xc21fe001  ! 1288: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0x879022fe  ! 1289: WRPR_TT_I	wrpr	%r0, 0x02fe, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x89540000  ! 1291: RDPR_GL	rdpr	%-, %r4
	.word 0xa1902005  ! 1292: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xc81fc000  ! 1293: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xb2688008  ! 1294: UDIVX_R	udivx 	%r2, %r8, %r25
	.word 0x879022b9  ! 1295: WRPR_TT_I	wrpr	%r0, 0x02b9, %tt
	.word 0x8d90259d  ! 1296: WRPR_PSTATE_I	wrpr	%r0, 0x059d, %pstate
	.word 0x819821cf  ! 1297: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cf, %hpstate
tagged_327:
	taddcctv %r18, 0x1434, %r7
	.word 0xf207e001  ! 1298: LDUW_I	lduw	[%r31 + 0x0001], %r25
	.word 0xa1902000  ! 1299: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_328:
	.word 0x20800001  ! 1301: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1300: SAVE_R	save	%r31, %r0, %r31
	.word 0xf28008a0  ! 1301: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0xa1902007  ! 1302: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d90220e  ! 1303: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902004  ! 1305: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87802058  ! 1306: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87802058  ! 1307: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902000  ! 1309: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01970  ! 1308: FqTOd	dis not found

	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1309: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_330:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_331:
	.word 0x34800001  ! 1312: BG	bg,a	<label_0x1>
	.word 0xf7306001  ! 1312: STQF_I	-	%f27, [0x0001, %r1]
	normalw
	.word 0xa1458000  ! 1311: RD_SOFTINT_REG	rd	%softint, %r16
splash_lsu_332:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1312: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_333:
	.word 0x34800001  ! 1314: BG	bg,a	<label_0x1>
	.word 0xc935e001  ! 1314: STQF_I	-	%f4, [0x0001, %r23]
	normalw
	.word 0xb5458000  ! 1313: RD_SOFTINT_REG	rd	%softint, %r26
	.word 0xf457c000  ! 1314: LDSH_R	ldsh	[%r31 + %r0], %r26
splash_tba_334:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1315: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93d02034  ! 1316: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x38700001  ! 1317: BPGU	<illegal instruction>
	.word 0x87802020  ! 1318: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xf4dfe020  ! 1319: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r26
	.word 0xf48fe030  ! 1320: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r26
	.word 0x93902002  ! 1321: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f802001  ! 1322: SIR	sir	0x0001
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 1323: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_335:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1324: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802014  ! 1325: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x30800001  ! 1326: BA	ba,a	<label_0x1>
	.word 0x9f802001  ! 1327: SIR	sir	0x0001
DS_336:
	.word 0x20800001  ! 1329: BN	bn,a	<label_0x1>
	.xword 0xfddacdea	! Random illegal ?
	.word 0x8da00556  ! 1329: FSQRTd	fsqrt	
	.word 0xa1a18824  ! 1328: FADDs	fadds	%f6, %f4, %f16
	.word 0xe057e001  ! 1329: LDSH_I	ldsh	[%r31 + 0x0001], %r16
splash_lsu_337:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1330: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 1331: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe0cfe030  ! 1332: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r16
tagged_338:
	tsubcctv %r3, 0x181f, %r14
	.word 0xe007e001  ! 1333: LDUW_I	lduw	[%r31 + 0x0001], %r16
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1334: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe09fe001  ! 1335: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
	.word 0x93902002  ! 1336: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe0cfe000  ! 1337: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
tagged_339:
	taddcctv %r14, 0x1aea, %r25
	.word 0xe007e001  ! 1338: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8f902001  ! 1340: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1830005  ! 1339: WR_STICK_REG_R	wr	%r12, %r5, %-
	.word 0xe08008a0  ! 1340: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8780201c  ! 1341: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x93902002  ! 1342: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1343: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_341:
	.word 0x22800001  ! 1345: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1344: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x83d02034  ! 1345: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xe127e001  ! 1346: STF_I	st	%f16, [0x0001, %r31]
	.word 0xe09fc020  ! 1347: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
	.word 0x87802020  ! 1348: WRASI_I	wr	%r0, 0x0020, %asi
splash_htba_342:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1349: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902005  ! 1350: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_343:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1351: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe0880e80  ! 1352: LDUBA_R	lduba	[%r0, %r0] 0x74, %r16
	.word 0x879022c9  ! 1353: WRPR_TT_I	wrpr	%r0, 0x02c9, %tt
	.word 0xe05fe001  ! 1354: LDX_I	ldx	[%r31 + 0x0001], %r16
	.word 0x2a800001  ! 1355: BCS	bcs,a	<label_0x1>
	.word 0x91d02034  ! 1356: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902009  ! 1357: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa1902008  ! 1358: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe197e001  ! 1359: LDQFA_I	-	[%r31, 0x0001], %f16
	.word 0x87802055  ! 1360: WRASI_I	wr	%r0, 0x0055, %asi
	ta	T_CHANGE_HPRIV	! macro
splash_lsu_344:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1362: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902005  ! 1364: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81460000  ! 1365: RD_STICK_REG	stbar
splash_htba_345:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1366: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1367: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe01fc000  ! 1368: LDD_R	ldd	[%r31 + %r0], %r16
tagged_346:
	tsubcctv %r12, 0x1474, %r6
	.word 0xe007e001  ! 1369: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x81460000  ! 1370: RD_STICK_REG	stbar
	.word 0xa1902003  ! 1371: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xe0dfe030  ! 1372: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r16
	.word 0x34800001  ! 1373: BG	bg,a	<label_0x1>
	.word 0x87802058  ! 1374: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xe08008a0  ! 1375: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x87802014  ! 1376: WRASI_I	wr	%r0, 0x0014, %asi
splash_lsu_347:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02032  ! 1378: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_tba_348:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1379: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe05fe001  ! 1380: LDX_I	ldx	[%r31 + 0x0001], %r16
splash_lsu_349:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1381: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f7c  ! 1382: WRPR_PSTATE_I	wrpr	%r0, 0x0f7c, %pstate
	.word 0x91d020b3  ! 1383: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xe08008a0  ! 1384: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1385: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0800c20  ! 1386: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r16
	.word 0x87802058  ! 1387: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f51c000  ! 1388: RDPR_TL	rdpr	%tl, %r7
	.word 0x91d020b2  ! 1389: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x879023dd  ! 1390: WRPR_TT_I	wrpr	%r0, 0x03dd, %tt
	.word 0x87902143  ! 1391: WRPR_TT_I	wrpr	%r0, 0x0143, %tt
	.word 0x83d02032  ! 1392: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8545c000  ! 1393: RD_TICK_CMPR_REG	rd	%-, %r2
	.word 0x3a800001  ! 1394: BCC	bcc,a	<label_0x1>
	.word 0xc4800b40  ! 1395: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r2
	.word 0xc4d004a0  ! 1396: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r2
	.word 0x91d02033  ! 1397: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902d34  ! 1398: WRPR_PSTATE_I	wrpr	%r0, 0x0d34, %pstate
tagged_350:
	tsubcctv %r8, 0x1cc6, %r12
	.word 0xc407e001  ! 1399: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x9f802001  ! 1400: SIR	sir	0x0001
	.word 0xc517c000  ! 1401: LDQF_R	-	[%r31, %r0], %f2
tagged_351:
	taddcctv %r22, 0x1648, %r10
	.word 0xc407e001  ! 1402: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc41fe001  ! 1403: LDD_I	ldd	[%r31 + 0x0001], %r2
	.word 0xc447e001  ! 1404: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	.word 0x8d9020cf  ! 1405: WRPR_PSTATE_I	wrpr	%r0, 0x00cf, %pstate
	.word 0x8780204f  ! 1406: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x83d02035  ! 1407: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa1902000  ! 1408: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xc44fc000  ! 1409: LDSB_R	ldsb	[%r31 + %r0], %r2
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1410: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc41fe001  ! 1411: LDD_I	ldd	[%r31 + 0x0001], %r2
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1412: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1413: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc45fe001  ! 1414: LDX_I	ldx	[%r31 + 0x0001], %r2
	.word 0x83d02034  ! 1415: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x9f802001  ! 1416: SIR	sir	0x0001
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc41fc000  ! 1418: LDD_R	ldd	[%r31 + %r0], %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902006  ! 1420: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_352:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1421: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc427e001  ! 1422: STW_I	stw	%r2, [%r31 + 0x0001]
DS_353:
	.word 0x32800001  ! 1424: BNE	bne,a	<label_0x1>
	pdist %f4, %f0, %f22
	.word 0x83b50315  ! 1423: ALLIGNADDRESS	alignaddr	%r20, %r21, %r1
splash_tba_354:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1424: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_355:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1425: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc29fc020  ! 1426: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	.word 0x91d020b3  ! 1427: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x8f902000  ! 1429: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8980c007  ! 1428: WRTICK_R	wr	%r3, %r7, %tick
	.word 0x819826c5  ! 1429: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c5, %hpstate
	.word 0x91d020b2  ! 1430: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_lsu_357:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1431: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 1432: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1433: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 1434: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_358:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1435: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc33fc007  ! 1436: STDF_R	std	%f1, [%r7, %r31]
	.word 0x8d902d45  ! 1437: WRPR_PSTATE_I	wrpr	%r0, 0x0d45, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1438: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc24fe001  ! 1439: LDSB_I	ldsb	[%r31 + 0x0001], %r1
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1440: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_359:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1441: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 1442: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc28804a0  ! 1443: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	.word 0xc217e001  ! 1444: LDUH_I	lduh	[%r31 + 0x0001], %r1
	.word 0x8d902b91  ! 1445: WRPR_PSTATE_I	wrpr	%r0, 0x0b91, %pstate
tagged_360:
	tsubcctv %r14, 0x1bb4, %r2
	.word 0xc207e001  ! 1446: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc207c000  ! 1447: LDUW_R	lduw	[%r31 + %r0], %r1
	.word 0xa190200f  ! 1448: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xc24fc000  ! 1449: LDSB_R	ldsb	[%r31 + %r0], %r1
	.word 0xb3514000  ! 1450: RDPR_TBA	rdpr	%tba, %r25
	.word 0xf317c000  ! 1451: LDQF_R	-	[%r31, %r0], %f25
	.word 0x9951c000  ! 1452: RDPR_TL	<illegal instruction>
	.word 0xd847c000  ! 1453: LDSW_R	ldsw	[%r31 + %r0], %r12
tagged_361:
	taddcctv %r6, 0x13c4, %r14
	.word 0xd807e001  ! 1454: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x99902003  ! 1455: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
splash_htba_362:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1456: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd84fe001  ! 1457: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0xd81fe001  ! 1458: LDD_I	ldd	[%r31 + 0x0001], %r12
	.word 0x9b464000  ! 1459: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x93902002  ! 1460: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x83d02033  ! 1461: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xda9004a0  ! 1462: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
splash_lsu_363:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1463: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda07c000  ! 1464: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0xdac004a0  ! 1465: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_tba_364:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1466: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02032  ! 1467: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xda9004a0  ! 1468: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0xdac004a0  ! 1469: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r13
splash_htba_365:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1470: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xda0fc000  ! 1471: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0xda8fe010  ! 1472: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
	.word 0x36800001  ! 1473: BGE	bge,a	<label_0x1>
	.word 0xda8008a0  ! 1474: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xa190200f  ! 1475: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_366:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1476: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 1477: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xda57e001  ! 1478: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0x93902004  ! 1479: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_HPRIV	! macro
splash_tba_367:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1481: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_368:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1482: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_369:
	taddcctv %r11, 0x1b21, %r16
	.word 0xda07e001  ! 1483: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xa1902004  ! 1484: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87802004  ! 1485: WRASI_I	wr	%r0, 0x0004, %asi
change_to_randtl_370:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1486: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8f902002  ! 1488: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x856b6001  ! 1487: SDIVX_I	sdivx	%r13, 0x0001, %r2
	.word 0xc44fe001  ! 1488: LDSB_I	ldsb	[%r31 + 0x0001], %r2
DS_372:
	.word 0x32800001  ! 1490: BNE	bne,a	<label_0x1>
	.word 0xd934a001  ! 1490: STQF_I	-	%f12, [0x0001, %r18]
	normalw
	.word 0x8f458000  ! 1489: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8780201c  ! 1490: WRASI_I	wr	%r0, 0x001c, %asi
splash_htba_373:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1491: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xce1fc000  ! 1492: LDD_R	ldd	[%r31 + %r0], %r7
splash_lsu_374:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1493: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90286a  ! 1494: WRPR_PSTATE_I	wrpr	%r0, 0x086a, %pstate
	.word 0xce9fc020  ! 1495: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902375  ! 1497: WRPR_PSTATE_I	wrpr	%r0, 0x0375, %pstate
	.word 0xce1fc000  ! 1498: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0x879023e6  ! 1499: WRPR_TT_I	wrpr	%r0, 0x03e6, %tt
	.word 0x36800001  ! 1500: BGE	bge,a	<label_0x1>
	.word 0xce8008a0  ! 1501: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xce0fe001  ! 1502: LDUB_I	ldub	[%r31 + 0x0001], %r7
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1503: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce800b00  ! 1504: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r7
	.word 0xa1902008  ! 1505: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa190200b  ! 1506: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_lsu_375:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1507: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802010  ! 1508: WRASI_I	wr	%r0, 0x0010, %asi
tagged_376:
	tsubcctv %r22, 0x13cd, %r3
	.word 0xce07e001  ! 1509: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x83d020b2  ! 1510: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0x81460000  ! 1511: RD_STICK_REG	stbar
	.word 0x81982cdd  ! 1512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdd, %hpstate
	.word 0x93902006  ! 1513: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x99464000  ! 1514: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x99902002  ! 1515: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
tagged_377:
	taddcctv %r11, 0x1f53, %r21
	.word 0xd807e001  ! 1516: LDUW_I	lduw	[%r31 + 0x0001], %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0xd997e001  ! 1518: LDQFA_I	-	[%r31, 0x0001], %f12
splash_cmpr_378:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 1519: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x9551c000  ! 1520: RDPR_TL	<illegal instruction>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1521: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 1522: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902002  ! 1523: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902003  ! 1524: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_tba_379:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1525: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8790209a  ! 1527: WRPR_TT_I	wrpr	%r0, 0x009a, %tt
splash_cmpr_380:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 1528: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0x93902004  ! 1529: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_381:
	.word 0x20800001  ! 1531: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1530: SAVE_R	save	%r31, %r0, %r31
tagged_382:
	tsubcctv %r11, 0x1ac2, %r17
	.word 0xd407e001  ! 1531: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x32800001  ! 1532: BNE	bne,a	<label_0x1>
	.word 0x93902005  ! 1533: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_383:
	taddcctv %r7, 0x1632, %r6
	.word 0xd407e001  ! 1534: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x9551c000  ! 1535: RDPR_TL	rdpr	%tl, %r10
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1536: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02033  ! 1538: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd41fe001  ! 1539: LDD_I	ldd	[%r31 + 0x0001], %r10
splash_htba_384:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1540: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8b50c000  ! 1541: RDPR_TT	rdpr	%tt, %r5
	.word 0xcad7e010  ! 1542: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r5
	.word 0xca97e000  ! 1543: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r5
	.word 0xca37c007  ! 1544: STH_R	sth	%r5, [%r31 + %r7]
	.word 0x9b464000  ! 1545: RD_STICK_CMPR_REG	rd	%-, %r13
tagged_385:
	taddcctv %r1, 0x1c88, %r10
	.word 0xda07e001  ! 1546: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x886b2001  ! 1547: UDIVX_I	udivx 	%r12, 0x0001, %r4
	.word 0x2c800001  ! 1548: BNEG	bneg,a	<label_0x1>
	.word 0xa1902000  ! 1549: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa190200c  ! 1550: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x34700001  ! 1551: BPG	<illegal instruction>
	.word 0x87802020  ! 1552: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8d902d6e  ! 1553: WRPR_PSTATE_I	wrpr	%r0, 0x0d6e, %pstate
	.word 0xc80fe001  ! 1554: LDUB_I	ldub	[%r31 + 0x0001], %r4
	.word 0x8d90209e  ! 1555: WRPR_PSTATE_I	wrpr	%r0, 0x009e, %pstate
	.word 0x93902001  ! 1556: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc997e001  ! 1557: LDQFA_I	-	[%r31, 0x0001], %f4
	.word 0xc8c804a0  ! 1558: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0x81460000  ! 1560: RD_STICK_REG	stbar
splash_lsu_386:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1561: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8da00559  ! 1562: FSQRTd	fsqrt	
	.word 0xcde7c039  ! 1563: CASA_I	casa	[%r31] 0x 1, %r25, %r6
	.word 0xcc1fe001  ! 1564: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0xcc1fe001  ! 1565: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x8780204f  ! 1566: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x99902003  ! 1567: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xcc0fc000  ! 1568: LDUB_R	ldub	[%r31 + %r0], %r6
splash_tba_387:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1569: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_htba_388:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1570: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d020b4  ! 1571: Tcc_I	ta	icc_or_xcc, %r0 + 180
tagged_389:
	taddcctv %r7, 0x1483, %r13
	.word 0xcc07e001  ! 1572: LDUW_I	lduw	[%r31 + 0x0001], %r6
DS_390:
	.word 0x20800001  ! 1574: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1573: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_HPRIV	! macro
splash_tba_391:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1575: WRPR_TBA_R	wrpr	%r0, %r2, %tba
tagged_392:
	tsubcctv %r6, 0x1025, %r13
	.word 0xcc07e001  ! 1576: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc8008a0  ! 1577: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x87802014  ! 1578: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8b45c000  ! 1579: RD_TICK_CMPR_REG	rd	%-, %r5
	.word 0x91d02032  ! 1580: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8198240f  ! 1581: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040f, %hpstate
	.word 0xca57c000  ! 1582: LDSH_R	ldsh	[%r31 + %r0], %r5
	.word 0xcadfe010  ! 1583: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r5
	.word 0xca1fc000  ! 1584: LDD_R	ldd	[%r31 + %r0], %r5
	.word 0xca1fc000  ! 1585: LDD_R	ldd	[%r31 + %r0], %r5
	.word 0xca8fe010  ! 1586: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r5
	.word 0xca47e001  ! 1587: LDSW_I	ldsw	[%r31 + 0x0001], %r5
change_to_randtl_393:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1588: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x91d02032  ! 1589: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xcacfe020  ! 1590: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r5
tagged_394:
	tsubcctv %r11, 0x14ed, %r17
	.word 0xca07e001  ! 1591: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x87802020  ! 1592: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x879021cc  ! 1593: WRPR_TT_I	wrpr	%r0, 0x01cc, %tt
DS_395:
	.word 0x32800001  ! 1595: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1594: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x879022d2  ! 1595: WRPR_TT_I	wrpr	%r0, 0x02d2, %tt
	.word 0x3c800001  ! 1596: BPOS	bpos,a	<label_0x1>
	.word 0x81540000  ! 1597: RDPR_GL	rdpr	%-, %r0
	.word 0xc0800bc0  ! 1598: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r0
	.word 0xa1902007  ! 1599: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x22700001  ! 1600: BPE	<illegal instruction>
	.word 0x91d020b5  ! 1601: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xc0c00e40  ! 1602: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r0
	.word 0xa190200b  ! 1603: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d90293e  ! 1604: WRPR_PSTATE_I	wrpr	%r0, 0x093e, %pstate
change_to_randtl_396:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1605: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9f802001  ! 1606: SIR	sir	0x0001
tagged_397:
	taddcctv %r3, 0x1539, %r17
	.word 0xc007e001  ! 1607: LDUW_I	lduw	[%r31 + 0x0001], %r0
splash_lsu_398:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1608: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_399:
	.word 0x22800001  ! 1610: BE	be,a	<label_0x1>
	.word 0xd731a001  ! 1610: STQF_I	-	%f11, [0x0001, %r6]
	normalw
	.word 0xa9458000  ! 1609: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xe937e001  ! 1610: STQF_I	-	%f20, [0x0001, %r31]
	.word 0x8d90232c  ! 1611: WRPR_PSTATE_I	wrpr	%r0, 0x032c, %pstate
	.word 0x99902002  ! 1612: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x93902004  ! 1613: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902005  ! 1614: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_lsu_400:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1615: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 1616: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xe897e010  ! 1617: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r20
splash_lsu_401:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1618: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe89fc020  ! 1619: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
splash_tba_402:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1620: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe8800ac0  ! 1621: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r20
	.word 0xa7540000  ! 1622: RDPR_GL	rdpr	%-, %r19
	.word 0x8d902389  ! 1623: WRPR_PSTATE_I	wrpr	%r0, 0x0389, %pstate
	.word 0x3e700001  ! 1624: BPVC	<illegal instruction>
change_to_randtl_403:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1625: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe68008a0  ! 1626: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe68008a0  ! 1627: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x8d902a8e  ! 1628: WRPR_PSTATE_I	wrpr	%r0, 0x0a8e, %pstate
splash_tba_404:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1629: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802088  ! 1630: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe68008a0  ! 1631: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x24800001  ! 1632: BLE	ble,a	<label_0x1>
splash_tba_405:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1633: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe617c000  ! 1634: LDUH_R	lduh	[%r31 + %r0], %r19
	.word 0x87802014  ! 1635: WRASI_I	wr	%r0, 0x0014, %asi
tagged_406:
	tsubcctv %r24, 0x13d2, %r13
	.word 0xe607e001  ! 1636: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0xa190200d  ! 1637: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91d020b4  ! 1638: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x24700001  ! 1639: BPLE	<illegal instruction>
	.word 0xab50c000  ! 1640: RDPR_TT	rdpr	%tt, %r21
splash_lsu_407:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1641: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 1642: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_408:
	.word 0x34800001  ! 1644: BG	bg,a	<label_0x1>
	.word 0xd335a001  ! 1644: STQF_I	-	%f9, [0x0001, %r22]
	normalw
	.word 0x95458000  ! 1643: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd417c000  ! 1644: LDUH_R	lduh	[%r31 + %r0], %r10
	.word 0x87902063  ! 1645: WRPR_TT_I	wrpr	%r0, 0x0063, %tt
tagged_409:
	taddcctv %r9, 0x1642, %r1
	.word 0xd407e001  ! 1646: LDUW_I	lduw	[%r31 + 0x0001], %r10
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 1647: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8a69e001  ! 1648: UDIVX_I	udivx 	%r7, 0x0001, %r5
	.word 0xb150c000  ! 1649: RDPR_TT	rdpr	%tt, %r24
	.word 0x93902007  ! 1650: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d02035  ! 1651: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8198211e  ! 1652: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011e, %hpstate
	.word 0xf117c000  ! 1653: LDQF_R	-	[%r31, %r0], %f24
splash_tba_410:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1654: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf017c000  ! 1655: LDUH_R	lduh	[%r31 + %r0], %r24
	.word 0x91d020b2  ! 1656: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8790209b  ! 1657: WRPR_TT_I	wrpr	%r0, 0x009b, %tt
	.word 0x879022e4  ! 1658: WRPR_TT_I	wrpr	%r0, 0x02e4, %tt
	.word 0xa190200d  ! 1659: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d802000  ! 1660: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xf0cfe000  ! 1661: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r24
splash_htba_411:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1662: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802000  ! 1663: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xf01fe001  ! 1664: LDD_I	ldd	[%r31 + 0x0001], %r24
	.word 0xa1902009  ! 1665: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x879020a4  ! 1666: WRPR_TT_I	wrpr	%r0, 0x00a4, %tt
	.word 0x93902000  ! 1667: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xf0800b40  ! 1668: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r24
DS_412:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1669: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xf017c000  ! 1670: LDUH_R	lduh	[%r31 + %r0], %r24
	.word 0xf0cfe030  ! 1671: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r24
	.word 0x8d9023f2  ! 1672: WRPR_PSTATE_I	wrpr	%r0, 0x03f2, %pstate
	.word 0xf09004a0  ! 1673: LDUHA_R	lduha	[%r0, %r0] 0x25, %r24
	.word 0xf047e001  ! 1674: LDSW_I	ldsw	[%r31 + 0x0001], %r24
splash_lsu_413:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1675: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_414:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1676: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf0dfe020  ! 1677: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r24
	ta	T_CHANGE_HPRIV	! macro
	.word 0xf097e010  ! 1679: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r24
	.word 0x91d02032  ! 1680: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200c  ! 1681: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xf0cfe010  ! 1682: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r24
splash_cmpr_415:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1684: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1852001  ! 1683: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1684: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf197e001  ! 1685: LDQFA_I	-	[%r31, 0x0001], %f24
	.word 0xf0c00e60  ! 1686: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r24
	.word 0xf0d7e010  ! 1687: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r24
DS_416:
	.word 0x20800001  ! 1689: BN	bn,a	<label_0x1>
	.xword 0x9f50d1f7	! Random illegal ?
	.word 0xcd128016  ! 1689: LDQF_R	-	[%r10, %r22], %f6
	.word 0x91a28827  ! 1688: FADDs	fadds	%f10, %f7, %f8
	.word 0x89514000  ! 1689: RDPR_TBA	rdpr	%tba, %r4
	.word 0x8780201c  ! 1690: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xc8c7e000  ! 1691: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r4
	.word 0xc8800a60  ! 1692: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r4
	.word 0x93902002  ! 1693: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f802001  ! 1694: SIR	sir	0x0001
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 1695: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8945c000  ! 1696: RD_TICK_CMPR_REG	rd	%-, %r4
	.word 0xc857e001  ! 1697: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	.word 0xc8c7e010  ! 1698: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r4
splash_cmpr_417:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1700: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb185a001  ! 1699: WR_STICK_REG_I	wr	%r22, 0x0001, %-
	.word 0x93902004  ! 1700: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_tba_418:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1701: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802016  ! 1702: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8a86e001  ! 1703: ADDcc_I	addcc 	%r27, 0x0001, %r5
	.word 0xa190200a  ! 1704: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x879020b5  ! 1705: WRPR_TT_I	wrpr	%r0, 0x00b5, %tt
DS_419:
	.word 0x20800001  ! 1707: BN	bn,a	<label_0x1>
	pdist %f24, %f22, %f18
	.word 0x8bb48308  ! 1706: ALLIGNADDRESS	alignaddr	%r18, %r8, %r5
tagged_420:
	tsubcctv %r4, 0x14fb, %r6
	.word 0xca07e001  ! 1707: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xcad7e010  ! 1708: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r5
	.word 0xa190200e  ! 1709: WRPR_GL_I	wrpr	%r0, 0x000e, %-
DS_421:
	.word 0x32800001  ! 1711: BNE	bne,a	<label_0x1>
	pdist %f26, %f26, %f12
	.word 0xa9b24316  ! 1710: ALLIGNADDRESS	alignaddr	%r9, %r22, %r20
splash_htba_422:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1711: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1712: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_423:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1713: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa3500000  ! 1714: RDPR_TPC	rdpr	%tpc, %r17
tagged_424:
	tsubcctv %r23, 0x10a5, %r14
	.word 0xe207e001  ! 1715: LDUW_I	lduw	[%r31 + 0x0001], %r17
tagged_425:
	taddcctv %r19, 0x17f2, %r10
	.word 0xe207e001  ! 1716: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe2c7e030  ! 1717: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r17
	.word 0x8790223d  ! 1718: WRPR_TT_I	wrpr	%r0, 0x023d, %tt
	.word 0x8d902d2a  ! 1719: WRPR_PSTATE_I	wrpr	%r0, 0x0d2a, %pstate
DS_426:
	.word 0x20800001  ! 1721: BN	bn,a	<label_0x1>
	.word 0xc532c007  ! 1721: STQF_R	-	%f2, [%r7, %r11]
	normalw
	.word 0xab458000  ! 1720: RD_SOFTINT_REG	rd	%softint, %r21
	.word 0x8d9022ad  ! 1721: WRPR_PSTATE_I	wrpr	%r0, 0x02ad, %pstate
	.word 0x8d802000  ! 1722: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xb1514000  ! 1723: RDPR_TBA	rdpr	%tba, %r24
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1724: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_427:
	taddcctv %r17, 0x1182, %r16
	.word 0xf007e001  ! 1725: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0x99902000  ! 1726: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xa1902007  ! 1727: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xf137c007  ! 1728: STQF_R	-	%f24, [%r7, %r31]
	.word 0x91d02034  ! 1729: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xf0c00e40  ! 1730: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r24
DS_428:
	.word 0x22800001  ! 1732: BE	be,a	<label_0x1>
	.xword 0xbb432571	! Random illegal ?
	.word 0x99a0054a  ! 1732: FSQRTd	fsqrt	
	.word 0x85a68821  ! 1731: FADDs	fadds	%f26, %f1, %f2
	.word 0x8780204f  ! 1732: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xc40fe001  ! 1733: LDUB_I	ldub	[%r31 + 0x0001], %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0xc49fc020  ! 1735: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
splash_cmpr_429:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1737: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb185a001  ! 1736: WR_STICK_REG_I	wr	%r22, 0x0001, %-
splash_tba_430:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1737: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902a54  ! 1738: WRPR_PSTATE_I	wrpr	%r0, 0x0a54, %pstate
	.word 0xc48008a0  ! 1739: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x93902000  ! 1740: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87508000  ! 1741: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x9a4ac001  ! 1742: MULX_R	mulx 	%r11, %r1, %r13
	.word 0xa1902007  ! 1743: WRPR_GL_I	wrpr	%r0, 0x0007, %-
DS_431:
	.word 0x20800001  ! 1745: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1745: BE	be,a	<label_0x1>
	.word 0x81a00549  ! 1745: FSQRTd	fsqrt	
	.word 0xaba2c823  ! 1744: FADDs	fadds	%f11, %f3, %f21
	.word 0x8d902ff6  ! 1745: WRPR_PSTATE_I	wrpr	%r0, 0x0ff6, %pstate
	.word 0xea97e000  ! 1746: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r21
splash_lsu_432:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1747: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xea1fc000  ! 1748: LDD_R	ldd	[%r31 + %r0], %r21
	.word 0x91d020b5  ! 1749: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xea57c000  ! 1750: LDSH_R	ldsh	[%r31 + %r0], %r21
splash_tba_433:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1751: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_434:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182a001  ! 1752: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0xea17e001  ! 1753: LDUH_I	lduh	[%r31 + 0x0001], %r21
DS_435:
	.word 0x34800001  ! 1755: BG	bg,a	<label_0x1>
	allclean
	.word 0x91b3030b  ! 1754: ALLIGNADDRESS	alignaddr	%r12, %r11, %r8
	.word 0x93d020b4  ! 1755: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x879023a1  ! 1756: WRPR_TT_I	wrpr	%r0, 0x03a1, %tt
	.word 0xd097e030  ! 1757: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r8
splash_lsu_436:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1758: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1759: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_437:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1760: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1761: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 1762: BPOS	bpos,a	<label_0x1>
	.word 0xd0800ae0  ! 1763: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r8
	.word 0x30800001  ! 1764: BA	ba,a	<label_0x1>
splash_tba_438:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1765: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_439:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1767: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1826001  ! 1766: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0xa1902007  ! 1767: WRPR_GL_I	wrpr	%r0, 0x0007, %-
tagged_440:
	tsubcctv %r5, 0x1825, %r22
	.word 0xd007e001  ! 1768: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xd0800b80  ! 1769: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r8
	.word 0xd047e001  ! 1770: LDSW_I	ldsw	[%r31 + 0x0001], %r8
splash_lsu_441:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1771: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd0d004a0  ! 1772: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0x87802089  ! 1773: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87902366  ! 1774: WRPR_TT_I	wrpr	%r0, 0x0366, %tt
	.word 0x8d480000  ! 1775: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x24800001  ! 1776: BLE	ble,a	<label_0x1>
	.word 0xcc9fc020  ! 1777: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc8008a0  ! 1779: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x99902002  ! 1780: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x8790222f  ! 1781: WRPR_TT_I	wrpr	%r0, 0x022f, %tt
	.word 0xcd17c000  ! 1782: LDQF_R	-	[%r31, %r0], %f6
DS_442:
	.word 0x34800001  ! 1784: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1783: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1784: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90231b  ! 1785: WRPR_PSTATE_I	wrpr	%r0, 0x031b, %pstate
	.word 0x8f902001  ! 1787: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89834003  ! 1786: WRTICK_R	wr	%r13, %r3, %tick
	.word 0x2e800001  ! 1787: BVS	bvs,a	<label_0x1>
	.word 0xcc8008a0  ! 1788: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8f902000  ! 1790: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93692001  ! 1789: SDIVX_I	sdivx	%r4, 0x0001, %r9
	.word 0xd257c000  ! 1790: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x8da609c8  ! 1791: FDIVd	fdivd	%f24, %f8, %f6
DS_445:
	.word 0x34800001  ! 1793: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1792: SAVE_R	save	%r31, %r0, %r31
	.word 0x8198218d  ! 1793: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018d, %hpstate
	.word 0xcc17c000  ! 1794: LDUH_R	lduh	[%r31 + %r0], %r6
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1795: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc800c60  ! 1796: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r6
splash_tba_446:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1797: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_447:
	.word 0x34800001  ! 1799: BG	bg,a	<label_0x1>
	.word 0xc931a001  ! 1799: STQF_I	-	%f4, [0x0001, %r6]
	normalw
	.word 0x8b458000  ! 1798: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x91d02033  ! 1799: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xca17e001  ! 1800: LDUH_I	lduh	[%r31 + 0x0001], %r5
	.word 0xca0fc000  ! 1801: LDUB_R	ldub	[%r31 + %r0], %r5
	.word 0xca9004a0  ! 1802: LDUHA_R	lduha	[%r0, %r0] 0x25, %r5
	.word 0x93d02034  ! 1803: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xcac004a0  ! 1804: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
DS_448:
	.word 0x22800001  ! 1806: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1805: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02035  ! 1806: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_htba_449:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1807: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xca8008a0  ! 1808: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x20700001  ! 1809: BPN	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902bb9  ! 1811: WRPR_PSTATE_I	wrpr	%r0, 0x0bb9, %pstate
	.word 0x8d802000  ! 1812: WRFPRS_I	wr	%r0, 0x0000, %fprs
change_to_randtl_450:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1813: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa745c000  ! 1814: RD_TICK_CMPR_REG	rd	%-, %r19
DS_451:
	.word 0x20800001  ! 1816: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1815: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe647e001  ! 1816: LDSW_I	ldsw	[%r31 + 0x0001], %r19
	.word 0x8d9024dd  ! 1817: WRPR_PSTATE_I	wrpr	%r0, 0x04dd, %pstate
	.word 0xe61fc000  ! 1818: LDD_R	ldd	[%r31 + %r0], %r19
	.word 0x87902353  ! 1819: WRPR_TT_I	wrpr	%r0, 0x0353, %tt
splash_htba_452:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1820: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x30800001  ! 1821: BA	ba,a	<label_0x1>
tagged_453:
	taddcctv %r17, 0x177a, %r24
	.word 0xe607e001  ! 1822: LDUW_I	lduw	[%r31 + 0x0001], %r19
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1823: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_454:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1824: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb7514000  ! 1825: RDPR_TBA	rdpr	%tba, %r27
	.word 0x83504000  ! 1826: RDPR_TNPC	<illegal instruction>
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1827: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200b  ! 1828: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_455:
	.word 0x20800001  ! 1830: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1829: SAVE_R	save	%r31, %r0, %r31
	.word 0x85b34fed  ! 1830: FONES	fones	%f2
	.word 0x87802089  ! 1831: WRASI_I	wr	%r0, 0x0089, %asi
change_to_randtl_456:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1832: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1833: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 1834: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81460000  ! 1835: RD_STICK_REG	stbar
	.word 0x81982646  ! 1836: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0646, %hpstate
	.word 0x3e700001  ! 1837: BPVC	<illegal instruction>
	.word 0xc40fc000  ! 1838: LDUB_R	ldub	[%r31 + %r0], %r2
splash_tba_457:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1839: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200a  ! 1840: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d9022da  ! 1841: WRPR_PSTATE_I	wrpr	%r0, 0x02da, %pstate
	.word 0xc4800b00  ! 1842: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r2
	.word 0x87902088  ! 1843: WRPR_TT_I	wrpr	%r0, 0x0088, %tt
	.word 0xc4d804a0  ! 1844: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0xa1902006  ! 1845: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x91d02033  ! 1846: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87902301  ! 1847: WRPR_TT_I	wrpr	%r0, 0x0301, %tt
	.word 0x9f802001  ! 1848: SIR	sir	0x0001
	.word 0xc407c000  ! 1849: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x83d02034  ! 1850: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xc44fc000  ! 1851: LDSB_R	ldsb	[%r31 + %r0], %r2
	.word 0x8f902001  ! 1853: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1844005  ! 1852: WR_STICK_REG_R	wr	%r17, %r5, %-
tagged_459:
	taddcctv %r2, 0x111a, %r13
	.word 0xc407e001  ! 1853: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc457e001  ! 1854: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0x8d902808  ! 1855: WRPR_PSTATE_I	wrpr	%r0, 0x0808, %pstate
	.word 0xc417e001  ! 1856: LDUH_I	lduh	[%r31 + 0x0001], %r2
splash_lsu_460:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1857: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_461:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1858: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_462:
	.word 0x22800001  ! 1860: BE	be,a	<label_0x1>
	.word 0xe1302001  ! 1860: STQF_I	-	%f16, [0x0001, %r0]
	normalw
	.word 0x99458000  ! 1859: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8d902ecf  ! 1860: WRPR_PSTATE_I	wrpr	%r0, 0x0ecf, %pstate
	.word 0x9f802001  ! 1861: SIR	sir	0x0001
	.word 0x879020f8  ! 1862: WRPR_TT_I	wrpr	%r0, 0x00f8, %tt
	.word 0x87902253  ! 1863: WRPR_TT_I	wrpr	%r0, 0x0253, %tt
	.word 0x93902006  ! 1864: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd847e001  ! 1865: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1866: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd89fc020  ! 1867: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0xd807c000  ! 1868: LDUW_R	lduw	[%r31 + %r0], %r12
	.word 0x8790232f  ! 1869: WRPR_TT_I	wrpr	%r0, 0x032f, %tt
	.word 0xd8800c80  ! 1870: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r12
splash_htba_463:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1871: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1872: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f902000  ! 1874: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d6a6001  ! 1873: SDIVX_I	sdivx	%r9, 0x0001, %r6
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1874: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879023c2  ! 1875: WRPR_TT_I	wrpr	%r0, 0x03c2, %tt
	.word 0x91d02035  ! 1876: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1877: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_465:
	taddcctv %r11, 0x19c7, %r26
	.word 0xcc07e001  ! 1878: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x8d802000  ! 1879: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802016  ! 1880: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87902332  ! 1881: WRPR_TT_I	wrpr	%r0, 0x0332, %tt
	.word 0xccc80e40  ! 1882: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r6
DS_466:
	.word 0x22800001  ! 1884: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1883: SAVE_R	save	%r31, %r0, %r31
	.word 0x8751c000  ! 1884: RDPR_TL	rdpr	%tl, %r3
	.word 0xa190200a  ! 1885: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xa1902009  ! 1886: WRPR_GL_I	wrpr	%r0, 0x0009, %-
DS_467:
	.word 0x22800001  ! 1888: BE	be,a	<label_0x1>
	pdist %f30, %f14, %f20
	.word 0xa3b44306  ! 1887: ALLIGNADDRESS	alignaddr	%r17, %r6, %r17
splash_cmpr_468:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182e001  ! 1888: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0x93902004  ! 1889: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x36800001  ! 1890: BGE	bge,a	<label_0x1>
	.word 0x8d902fbe  ! 1891: WRPR_PSTATE_I	wrpr	%r0, 0x0fbe, %pstate
	.word 0x93902002  ! 1892: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa7540000  ! 1893: RDPR_GL	rdpr	%-, %r19
	.word 0xaf494000  ! 1894: RDHPR_HTBA	rdhpr	%htba, %r23
	.word 0x99902003  ! 1895: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x84a94003  ! 1896: ANDNcc_R	andncc 	%r5, %r3, %r2
	.word 0x87902255  ! 1897: WRPR_TT_I	wrpr	%r0, 0x0255, %tt
	.word 0x8d902a6e  ! 1898: WRPR_PSTATE_I	wrpr	%r0, 0x0a6e, %pstate
	.word 0x87802055  ! 1899: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xc49004a0  ! 1900: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	.word 0x3c800001  ! 1901: BPOS	bpos,a	<label_0x1>
	.word 0xa190200f  ! 1902: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d902390  ! 1903: WRPR_PSTATE_I	wrpr	%r0, 0x0390, %pstate
splash_lsu_469:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1904: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc48008a0  ! 1905: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x91d020b2  ! 1906: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xc49fc020  ! 1907: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0xc45fe001  ! 1908: LDX_I	ldx	[%r31 + 0x0001], %r2
splash_tba_470:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1909: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b2  ! 1910: Tcc_I	ta	icc_or_xcc, %r0 + 178
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1911: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 1912: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87802058  ! 1913: WRASI_I	wr	%r0, 0x0058, %asi
splash_htba_471:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1914: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc44fe001  ! 1915: LDSB_I	ldsb	[%r31 + 0x0001], %r2
	.word 0x8545c000  ! 1916: RD_TICK_CMPR_REG	rd	%-, %r2
	.word 0xc4d804a0  ! 1917: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1918: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc4800ba0  ! 1919: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r2
	.word 0xc447c000  ! 1920: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0x8d902d0e  ! 1921: WRPR_PSTATE_I	wrpr	%r0, 0x0d0e, %pstate
	.word 0x879022ea  ! 1922: WRPR_TT_I	wrpr	%r0, 0x02ea, %tt
	.word 0x8d902577  ! 1923: WRPR_PSTATE_I	wrpr	%r0, 0x0577, %pstate
	.word 0xc42fc003  ! 1924: STB_R	stb	%r2, [%r31 + %r3]
DS_472:
	.word 0x20800001  ! 1926: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1925: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x83d02033  ! 1926: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xc447c000  ! 1927: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0x20700001  ! 1928: BPN	<illegal instruction>
	.word 0x8d902246  ! 1929: WRPR_PSTATE_I	wrpr	%r0, 0x0246, %pstate
	.word 0xc48804a0  ! 1930: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
DS_473:
	.word 0x34800001  ! 1932: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1931: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_474:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1932: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc457e001  ! 1933: LDSH_I	ldsh	[%r31 + 0x0001], %r2
splash_lsu_475:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1934: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200a  ! 1935: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xc4800a80  ! 1936: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r2
	.word 0x8d902e35  ! 1937: WRPR_PSTATE_I	wrpr	%r0, 0x0e35, %pstate
	.word 0x8d90213a  ! 1938: WRPR_PSTATE_I	wrpr	%r0, 0x013a, %pstate
	.word 0xc48008a0  ! 1939: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x91d020b4  ! 1940: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xc457e001  ! 1941: LDSH_I	ldsh	[%r31 + 0x0001], %r2
	.word 0x87802058  ! 1942: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8d802000  ! 1943: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99902002  ! 1944: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
tagged_476:
	tsubcctv %r14, 0x1369, %r7
	.word 0xc407e001  ! 1945: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x91d02035  ! 1946: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02032  ! 1947: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x36800001  ! 1948: BGE	bge,a	<label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1949: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 1950: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 1951: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x81460000  ! 1952: RD_STICK_REG	stbar
	ta	T_CHANGE_PRIV	! macro
	.word 0xc4dfe030  ! 1954: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r2
	.word 0x91494000  ! 1955: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0xd08008a0  ! 1956: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0cfe030  ! 1957: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r8
	.word 0x8d902e42  ! 1958: WRPR_PSTATE_I	wrpr	%r0, 0x0e42, %pstate
splash_lsu_477:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1959: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879021ec  ! 1960: WRPR_TT_I	wrpr	%r0, 0x01ec, %tt
	.word 0x9b504000  ! 1961: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x87802080  ! 1962: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9f802001  ! 1963: SIR	sir	0x0001
	.word 0x8d902ab4  ! 1964: WRPR_PSTATE_I	wrpr	%r0, 0x0ab4, %pstate
	.word 0xa190200c  ! 1965: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xdacfe030  ! 1966: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
splash_htba_478:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1967: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_PRIV	! macro
	.word 0xda8008a0  ! 1969: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
change_to_randtl_479:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1970: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa1902003  ! 1971: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902005  ! 1972: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93d020b2  ! 1973: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x26700001  ! 1974: BPL	<illegal instruction>
	.word 0x8d90205d  ! 1975: WRPR_PSTATE_I	wrpr	%r0, 0x005d, %pstate
	.word 0xdad7e010  ! 1976: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	.word 0x87902258  ! 1977: WRPR_TT_I	wrpr	%r0, 0x0258, %tt
splash_lsu_480:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1978: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_481:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1979: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790235e  ! 1980: WRPR_TT_I	wrpr	%r0, 0x035e, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xdad80e40  ! 1982: LDXA_R	ldxa	[%r0, %r0] 0x72, %r13
splash_tba_482:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1983: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d020b5  ! 1984: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8d902229  ! 1985: WRPR_PSTATE_I	wrpr	%r0, 0x0229, %pstate
splash_tba_483:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1986: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xda8008a0  ! 1987: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
change_to_randtl_484:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1988: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
splash_lsu_485:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1989: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8da109e6  ! 1990: FDIVq	dis not found

	.word 0x879021f9  ! 1991: WRPR_TT_I	wrpr	%r0, 0x01f9, %tt
	.word 0x87902108  ! 1992: WRPR_TT_I	wrpr	%r0, 0x0108, %tt
	.word 0x93902001  ! 1993: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xccc804a0  ! 1994: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r6
	.word 0x879022f4  ! 1995: WRPR_TT_I	wrpr	%r0, 0x02f4, %tt
	.word 0x91d02033  ! 1996: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93d02035  ! 1997: Tcc_I	tne	icc_or_xcc, %r0 + 53
DS_486:
	.word 0x20800001  ! 1999: BN	bn,a	<label_0x1>
	allclean
	.word 0x95b64305  ! 1998: ALLIGNADDRESS	alignaddr	%r25, %r5, %r10


.global user_data_start
.data
user_data_start:
	.xword	0xecf9128faa50427a
	.xword	0x100c76e71f1c7f80
	.xword	0x37b760606df8fe80
	.xword	0xa8894deed6c1f177
	.xword	0xa6a5554dfaa950eb
	.xword	0x396ad3b02e304831
	.xword	0xaedff1797feeff03
	.xword	0x220ab4458e06de86
	.xword	0xa7a133ed017961b1
	.xword	0x204a355612d65a18
	.xword	0xcfe9485f7b0c7857
	.xword	0x881195f9e6d8a621
	.xword	0x2c80da43dae5cca8
	.xword	0x104addc51ebebeb8
	.xword	0x3f32d3469355b667
	.xword	0x79a8f7f7e8b31daf
	.xword	0xd970cadf1b62a443
	.xword	0xb3a4dd54cff06a4a
	.xword	0xcb8ba975d5cef28e
	.xword	0x5fb90d467c692bbe
	.xword	0x5db6c2b9ed029f36
	.xword	0x6da6724cd0eaff46
	.xword	0x2a8857ec92c7364d
	.xword	0xb227b7d453ef61df
	.xword	0xe7aa34e53ca0acab
	.xword	0x41293b4ecf5d3962
	.xword	0xc8923ef5665c84fd
	.xword	0x57868fa45119fedc
	.xword	0x815825fc55a17ecd
	.xword	0x8709df26ee568996
	.xword	0x3f79be1ca3216eba
	.xword	0x0bfacf8744bc66d3
	.xword	0x039460674ed326f6
	.xword	0x48834b7558a96967
	.xword	0x7bb330597ee68978
	.xword	0xbf266492b02f8e03
	.xword	0xcd6489651aaf4999
	.xword	0xe7b9c94779b80811
	.xword	0xbc94add1c9b030fc
	.xword	0xc03528766df16d41
	.xword	0x59fb2a644938a74a
	.xword	0xc918f32b7737b753
	.xword	0xe1ab5de0f1d4a0c3
	.xword	0xaa9f6dea77347c55
	.xword	0x4090a55128718f0a
	.xword	0xcf6ecafaa071f668
	.xword	0x60e8bbcf3eb51057
	.xword	0xf9fc065176faa893
	.xword	0x4ea21d9ee42cc832
	.xword	0x54e7c4c614e5708a
	.xword	0x192f55c041918c38
	.xword	0x33811b565fd65de5
	.xword	0x353f759752e6f9e6
	.xword	0x2fa1a4258ee962b4
	.xword	0x35506b6a219f890a
	.xword	0x548c44b3fda55890
	.xword	0x8019dfe5d535bdd7
	.xword	0x472c62e0441a2762
	.xword	0x1eb88fef180d8116
	.xword	0xcb5b55fad2edded4
	.xword	0x773ec91443492ff8
	.xword	0xab20d6e8b6f44503
	.xword	0x0060e2abd3ce2b87
	.xword	0x725c43fbda0ff20d
	.xword	0xc2decb44dc6a5720
	.xword	0xade289ff25a887b8
	.xword	0x4f29953bb0d46fbf
	.xword	0x6950c9e021cf2d00
	.xword	0xe1d22ddee11f7110
	.xword	0x3bba96058eb79ce1
	.xword	0x1d7f199f74722d9b
	.xword	0x1d801858c017fdfa
	.xword	0x360628ffe2a1ac2d
	.xword	0xe9037b10dff62fa2
	.xword	0x070592f3da427d3c
	.xword	0xdf91543971b054ab
	.xword	0xefbb81aa7b02ac35
	.xword	0xe7c229c31eef98e7
	.xword	0x370339eac8c2b2d6
	.xword	0xe7217179bc030cdf
	.xword	0xc9c54df986e2a266
	.xword	0xbc07ccb09f725f95
	.xword	0xbda04384183fb4ea
	.xword	0x29384d139ff2166d
	.xword	0x1556ca1939efba03
	.xword	0xec0b65dbff947850
	.xword	0x162da543952e08b9
	.xword	0x2e7442d821953c59
	.xword	0x6d3b2c15da81f136
	.xword	0xfce12099f12dc81f
	.xword	0x8d8ba762699f60e7
	.xword	0xa11cde22650391a2
	.xword	0x21f13652a4eec33c
	.xword	0xfc5320c66ac2dae4
	.xword	0x9290161a2862048a
	.xword	0xe12d5bb0867adee4
	.xword	0x234e86e33e662d4f
	.xword	0xac81bb621b6a7d05
	.xword	0xcf31db058d09608c
	.xword	0xa53b7893d7fe4667
	.xword	0x18432a0f8bd82066
	.xword	0xf3b917ebf3b15e8e
	.xword	0x342917887b889fe1
	.xword	0x7a2d995bf42fce83
	.xword	0x5a9584b56268fc7d
	.xword	0xe5ed025aac35c7f4
	.xword	0x48e2034273da315c
	.xword	0x205b81c72e85a516
	.xword	0xae4df71f647fbfb4
	.xword	0x8825bc6d3448b59c
	.xword	0x675305d3dced8132
	.xword	0xe9e27d8d6225ed58
	.xword	0xac32a9c27ea34075
	.xword	0x7911408aebd271af
	.xword	0x0039c45d8d8cdb48
	.xword	0x942dc1e1b01a6f4a
	.xword	0x00e675947f49682a
	.xword	0x6ce074b79d7928a7
	.xword	0x926627ca7ff4e1db
	.xword	0xc6314463df929e22
	.xword	0x6146d78f2905fc2e
	.xword	0x918cbbea6339c6f8
	.xword	0x72212e1aea6e70b6
	.xword	0xb73ffcb2431c5dc1
	.xword	0xeab1c6c6f9c5aca0
	.xword	0x6d2a59ce34092f10
	.xword	0xa0788859ab4b755e
	.xword	0xcd69c1609073ec21
	.xword	0x9f76b27d81208d2f
	.xword	0x58d72338ddb8ac8d
	.xword	0xd3d490f7991208f4
	.xword	0xff5911fdec1842c9
	.xword	0x396b92b0ed9f6bdc
	.xword	0xd892f42ce83de28d
	.xword	0x117693e738937633
	.xword	0x6441882d0b63297e
	.xword	0x1a90879b65dc84f9
	.xword	0x47c2d5827ba91be0
	.xword	0x365abf1968293891
	.xword	0x68b7611451fbb573
	.xword	0x84897c89ba708544
	.xword	0x39d0cb9ecc2ab57b
	.xword	0x82bf52543c227897
	.xword	0xee04140e1e400051
	.xword	0x66946c058f9d1a24
	.xword	0xdb1dd670b85c82e6
	.xword	0x74397c4d2e0d0d74
	.xword	0x11e57081ab125609
	.xword	0xbd4b274ee538a146
	.xword	0x03306056e96ab41e
	.xword	0x14dafa01636dce65
	.xword	0x115325ffdf98bc72
	.xword	0x3caf284908b79461
	.xword	0x178915be6058bfda
	.xword	0x557cd5ac7794f8a4
	.xword	0x8cafada7e0099e53
	.xword	0xc15ce901ea0d4d09
	.xword	0x523ef7bb7936d5de
	.xword	0x5e0ce42cc940e465
	.xword	0x94457babbb89cb8f
	.xword	0x4424eabc49793998
	.xword	0x177b958f903b52a0
	.xword	0xe7b7eb53c2d299e7
	.xword	0xc654841c865ac66c
	.xword	0xd15e2b602f7ea853
	.xword	0x393748ea7392c273
	.xword	0xc4fe673f1f00b324
	.xword	0xe76803a6cbf83688
	.xword	0x5b350d886da38d0e
	.xword	0xafdec6a7d78122b9
	.xword	0x47c5a22a82a0209b
	.xword	0xad78c8a0e9a482e7
	.xword	0x3c02a0dcf8dd4ff5
	.xword	0x415f846a79235ec5
	.xword	0x33564eb7d0338443
	.xword	0x65aa71f49372c44a
	.xword	0x82f1a990ba77c680
	.xword	0x1124eaecc978d3d9
	.xword	0x00889a28f5afc20c
	.xword	0x26875f51165cbd68
	.xword	0xe760edf5cbb6070a
	.xword	0xeae3f716a035fbf0
	.xword	0xa78764c06c0fd89a
	.xword	0x57aa917036fc19d6
	.xword	0x6c630403847fcda5
	.xword	0xf4a6502f1731b47f
	.xword	0x2a51c206d53b0cbb
	.xword	0xcf90586d5edb7533
	.xword	0x6851255a7641d421
	.xword	0x70747fe27c38dfe2
	.xword	0x31e35b8f3f000462
	.xword	0xc786ecf3432de94d
	.xword	0x64b63308aa732fbb
	.xword	0x78a423da940b40ff
	.xword	0x14a444bd0b348d2f
	.xword	0xfec337d763fa5947
	.xword	0x0c62f306bc3ede46
	.xword	0x072e7c17839d3004
	.xword	0xde124eefe057fd08
	.xword	0x5853cd0cdced61db
	.xword	0xeb023b662d283dde
	.xword	0x7da33529efe249a2
	.xword	0xb920ca15361c549f
	.xword	0x643ab4f2749f2448
	.xword	0x66038ea35c85e100
	.xword	0x7ba03d237f9aad4e
	.xword	0xd3547f9862cd01ec
	.xword	0xe3e86517bc670e0d
	.xword	0xeee233d5a4a26199
	.xword	0x1f5e190ae516fc2e
	.xword	0x31e8a0ce81ea6f3c
	.xword	0x637a8fdea1f8ccd4
	.xword	0xa6e2aa73922f0948
	.xword	0x492b9fa4eb317288
	.xword	0x2cd54f8b71367573
	.xword	0x177c9b8455689db3
	.xword	0x4e7a705bf5807cf2
	.xword	0xcdeeb9ab779014d6
	.xword	0x96ecc082febf1213
	.xword	0x33998a5625b822ca
	.xword	0xa55129a316e71abf
	.xword	0xe472fa659cde962b
	.xword	0x9dd30608d40268dd
	.xword	0xc0136ad12f0af5a8
	.xword	0xe0b5151667c51e7e
	.xword	0xbfc784eedf539ad7
	.xword	0x83353cdbbbfd114f
	.xword	0x310788d98ede09ad
	.xword	0xf8f1e8dfb4c1b280
	.xword	0x735d670dc23d0f10
	.xword	0x7afabaccbce3308f
	.xword	0x68963d20a21aba73
	.xword	0x83d3888161491a13
	.xword	0x2259b21c6df8788c
	.xword	0x9c358769e4b24d16
	.xword	0x64c1efd76b1060e6
	.xword	0x5df9faade2fedd1b
	.xword	0x08d27b37ec155c41
	.xword	0x9f9ab1b993f6649c
	.xword	0x34d87463976e0565
	.xword	0xd3e236992900b7ae
	.xword	0x1e274abbce86f7b9
	.xword	0x23f6118786aba426
	.xword	0x7d16a3bf30e6bafd
	.xword	0x69626e56c89715d1
	.xword	0xa482c05686303ea9
	.xword	0xb688df08f949e652
	.xword	0xc38587c1fca7eb6f
	.xword	0x95f5ac4307f1bd71
	.xword	0xc76101fc499f1a2c
	.xword	0x2e13195f47c45717
	.xword	0xa43fe3afab192837
	.xword	0x494f581eaa3b08f6
	.xword	0x105791a8d0cd228c
	.xword	0xd171344787218e20
	.xword	0xa1f36558c59872f7


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Fri May 21 11:55:00 2004
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
!!#     //IJ_set_ropr_fld(Ro_wrpstate, Ft_Simm13, "13'brrrrrrrrrrrrr");
!!#     IJ_set_ropr_fld("diag.j", 127, Ro_wrpstate, Ft_Simm13, "13'b0rrrrrrrrrrrr");
!!# 
!!#     // Hpstate splash
!!#     IJ_set_ropr_fld("diag.j", 130, Ro_wrhpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 131, Ro_wrhpstate, Ft_Simm13, "12'brrrrrr0rr1rr");
!!# 
!!#     // TT splash
!!#     IJ_set_ropr_fld("diag.j", 134, Ro_wrtt, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 135, Ro_wrtt, Ft_Simm13, "10'brrrrrrrrrr");
!!# 
!!#     // GL splash
!!#     IJ_set_ropr_fld("diag.j", 138, Ro_wrgl, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 139, Ro_wrgl, Ft_Simm13, "4'brrrr");
!!# 
!!#     // TL splash
!!#     IJ_set_ropr_fld("diag.j", 142, Ro_tl, Ft_Simm13, "{0..5}");
!!#     IJ_set_ropr_fld("diag.j", 143, Ro_tl, Ft_Rs1,    "{0}");
!!# 
!!#     // CWP splash
!!#     IJ_set_ropr_fld("diag.j", 146, Ro_wrcwp, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 147, Ro_wrcwp, Ft_Simm13, "3'brrr");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 149, Ro_save_restore, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 150, Ro_save_restore, Ft_Rd,  "{31}");
!!#     IJ_set_ropr_fld("diag.j", 151, Ro_save_restore, Ft_Rs2, "{0}");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 153, Ro_winops, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 154, Ro_winops, Ft_Simm13, "{0..5}");
!!# 
!!#     // {H}TBA Splash
!!#     IJ_set_ropr_fld("diag.j", 157, Ro_tba, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 158, Ro_tba, Ft_Rs2, "{2}");
!!# 
!!#     // Dest reg is %g0
!!#     IJ_set_ropr_fld("diag.j", 161, Ro_rd0, Ft_Rd, "{0}");
!!# 
!!#     // Weights
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 165,"{10}");
!!#     IJ_set_rvar("diag.j", 166, wt_high, "{90}");
!!#     IJ_set_rvar("diag.j", 167, wt_med,  "{40}");
!!#     IJ_set_rvar("diag.j", 168, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 172, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<7; k++) {
!!#         for (i = 0; i < 30; i++) {
!!#             if (i==15) {
!!#                 IJ_printf  ("diag.j", 176, th0,"\tmov %%r31, %%r15\n");
!!#                 continue;
!!#             }
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 180, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 182, th0,"\tmov 0x%rx, %%r14\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 183, th0,"\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 184, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 187, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 190, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 193, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 196, th0,"\tta T_CHANGE_HPRIV \n");
!!#     IJ_printf  ("diag.j", 197, th0,"!Initializing Tick Cmprs \n");
!!#     IJ_printf  ("diag.j", 198, th0,"\tmov 1, %%g2\n");
!!#     IJ_printf  ("diag.j", 199, th0,"\tsllx %%g2, 63, %%g2\n");
!!#     IJ_printf  ("diag.j", 200, th0,"\tor %%g1, %%g2, %%g1\n");
!!#     IJ_printf("diag.j", 201, th0, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
!!#     IJ_printf("diag.j", 202, th0, "\twr %%g1, %%g0, %%tick_cmpr\n");
!!#     IJ_printf("diag.j", 203, th0, "\twr %%g1, %%g0, %%sys_tick_cmpr\n");
!!#     IJ_printf  ("diag.j", 204, th0,"!Initializing Trap Stack \n");
!!#     for (i = 1; i <=6; i++) {
!!#         IJ_printf  ("diag.j", 206, th0,"\twrpr 0x%d, %%tl\n", i);
!!#         IJ_printf  ("diag.j", 207, th0,"\twrpr 0x1, %%tt\n");
!!#         IJ_printf  ("diag.j", 208, th0,"\twrpr 0x1, %%tpc\n");
!!#         IJ_printf  ("diag.j", 209, th0,"\twrpr 0x1, %%tnpc\n");
!!#         IJ_printf  ("diag.j", 210, th0,"\twrpr 0x1, %%tstate\n");
!!#         IJ_printf  ("diag.j", 211, th0,"\twrhpr 0x1, %%htstate\n");
!!#     }
!!#     IJ_printf  ("diag.j", 213, th0,"\twrpr 0x0, %%tl\n");
!!#     IJ_printf  ("diag.j", 214, th0,"\tta T_CHANGE_NONHPRIV \n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#     int i;
!!#     IJ_printf  ("diag.j", 263, th0,"\n\n.global user_data_start\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 265, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
!!#     }
!!# 
!!#     for (i = 0; i < 4; i++) {
!!#         IJ_iseg_printf  ("diag.j", 269,MyHTRAPS, i, th0, "#include \"htraps.s\"\n");
!!#         IJ_iseg_printf  ("diag.j", 270,MyHTRAPS, i, th0,"#include \"tlu_htraps_ext.s\"\n");
!!#         IJ_iseg_printf  ("diag.j", 271,MyTRAPS, i, th0,"#include \"traps.s\"\n");
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
!!#         IJ_generate ("diag.j", 320, th0, $2);
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
!!#         IJ_set_rvar("diag.j", 358, Rv_demap, "{0x57, 0x5f}");
!!#         IJ_printf("diag.j", 359, th0, "\tmov 8, %%g3\n");
!!#         IJ_printf("diag.j", 360, th0, "\tstxa %%g3, [%%g0] 0x%rx\n", Rv_demap);
!!#     }
!!# ;
!!# 
!!# tagged: tLDUW_I %ropr  Ro_nontrap_ld
!!#     {
!!#         IJ_printf("diag.j", 366, th0, "tagged_%d:\n", label);
!!#         IJ_set_rvar("diag.j", 367, Rv_tof_r, "{1..26}");
!!#         IJ_set_rvar("diag.j", 368, Rv_tof_i, "13'b1rrrrrrrrrrrr");
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 370, th0, "\ttaddcctv %%r%rd, 0x%rx, %%r%rd\n", 
!!#                                 Rv_tof_r, Rv_tof_i, Rv_tof_r);
!!#         } else {
!!#             IJ_printf("diag.j", 373, th0, "\ttsubcctv %%r%rd, 0x%rx, %%r%rd\n", 
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
!!#         IJ_set_ropr_fld("diag.j", 396, Ro_tl, Ft_Simm13, "{0..2}");
!!#         IJ_generate_from_token("diag.j", 397,1, th0, Ro_tl, tWRPR_TL_I, -1);;
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 399,1, th0, ijdefault, tCHANGE_NONHPRIV, -1);;
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 401,1, th0, ijdefault, tCHANGE_NONPRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_randtl: tWRPR_TL_I %ropr  Ro_tl
!!#     {
!!#         IJ_printf("diag.j", 409, th0, "change_to_randtl_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_set_ropr_fld("diag.j", 411, Ro_tl, Ft_Simm13, "{3..5}");
!!#             IJ_generate_from_token("diag.j", 412,1, th0, ijdefault, tCHANGE_HPRIV, -1);;
!!#         } else {
!!#             IJ_set_ropr_fld("diag.j", 414, Ro_tl, Ft_Simm13, "{0..2}");
!!#             IJ_generate_from_token("diag.j", 415,1, th0, ijdefault, tCHANGE_PRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_tl1 : tCHANGE_TO_TL1
!!#     {
!!#         IJ_printf("diag.j", 423, th0, "change_to_tl1_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 425, th0, "\tta T_CHANGE_HPRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 427, th0, "\tta T_CHANGE_PRIV\n");
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
!!#         IJ_printf("diag.j", 449, th0, "splash_lsu_%d:\n", label);
!!#         IJ_printf("diag.j", 450, th0, "\tset 0x%rx, %%r2\n", Rv_lsucntl);
!!#         IJ_printf("diag.j", 451, th0, "\tstxa %%r2, [%%r0] ASI_LSU_CONTROL\n");
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_tba: tWRPR_TBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 458, th0, "splash_tba_%d:\n", label);
!!#         IJ_printf("diag.j", 459, th0, "\tta T_CHANGE_PRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 461, th0, "\tset 0x120000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 463, th0, "\tset 0x%08llrx, %%r2\n", Rv_tba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# splash_htba: tWRHPR_HTBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 470, th0, "splash_htba_%d:\n", label);
!!#         IJ_printf("diag.j", 471, th0, "\tta T_CHANGE_HPRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 473, th0, "\tset 0x80000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 475, th0, "\tset 0x%08llrx, %%r2\n", Rv_htba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_cmpr: tWR_STICK_REG_I
!!#     {
!!#         IJ_printf("diag.j", 483, th0, "splash_cmpr_%d:\n", label);
!!#         IJ_set_rvar("diag.j", 484, Rv_rand_60,"64'h8rrrrrrr_rrrrrrrr");
!!#         IJ_set_ropr_fld("diag.j", 485, Ro_cmpr, Ft_Rs1, "{0}");
!!#         IJ_set_ropr_fld("diag.j", 486, Ro_cmpr, Ft_Rs2, "{1}");
!!#         IJ_printf  ("diag.j", 487, th0,"\tnop\n\tmov 1, %%g2\n");
!!#         IJ_printf  ("diag.j", 488, th0,"\tsllx %%g2, 63, %%g2\n");
!!#         IJ_printf  ("diag.j", 489, th0,"\tor %%g1, %%g2, %%g1\n");
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 491,1, th0, Ro_cmpr, tWR_STICK_CMPR_REG_R, tWR_TICK_CMPR_REG_R, -1);;
!!#         } else {
!!#            IJ_printf("diag.j", 493, th0, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
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
!!#         IJ_printf("diag.j", 531, th0, "\totherw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      } else {
!!#         IJ_printf("diag.j", 533, th0, "\tinvalw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!#         IJ_printf("diag.j", 617, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 618,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 619,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 620, th0, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 624, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 625,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 627,1, th0, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 629, th0, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 631, th0, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 636, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 637,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 639, th0, "\t.xword 0x%rx\t! Random illegal ?\n", Rv_illtrap);
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

