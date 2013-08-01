/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand03_ind_08.s
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
	mov 0x32, %r14
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
	mov 0x34, %r14
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
!Initializing Trap Stack 
	ta T_CHANGE_HPRIV 
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
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xead7e030  ! 3: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r21
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 4: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83702001  ! 5: POPC_I	popc	0x0001, %r1
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 6: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_0:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 7: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
DS_1:
	.word 0x20800001  ! 9: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 8: SAVE_R	save	%r31, %r0, %r31
change_to_tl1_2:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1902002  ! 10: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902003  ! 11: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0xc33fe001  ! 13: STDF_I	std	%f1, [0x0001, %r31]
	.word 0xc28008a0  ! 14: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x819821df  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01df, %hpstate
	.word 0x879022c1  ! 16: WRPR_TT_I	wrpr	%r0, 0x02c1, %tt
	.word 0x93902006  ! 17: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902009  ! 18: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902002  ! 19: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8790207a  ! 20: WRPR_TT_I	wrpr	%r0, 0x007a, %tt
	.word 0x91d02035  ! 21: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d802004  ! 22: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x95a28dcd  ! 23: FdMULq	fdmulq	
	.word 0x8f500000  ! 24: RDPR_TPC	rdpr	%tpc, %r7
	.word 0x8d90209c  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x009c, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 26: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 27: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d540000  ! 28: RDPR_GL	rdpr	%-, %r6
	.word 0xa1902007  ! 29: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d90240b  ! 30: WRPR_PSTATE_I	wrpr	%r0, 0x040b, %pstate
	.word 0xcc8008a0  ! 31: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8d508000  ! 32: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0x91d02030  ! 33: Tcc_I	ta	icc_or_xcc, %r0 + 48
reduce_priv_level_3:
	.word 0x8f902001  ! 35: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8b6a6001  ! 34: SDIVX_I	sdivx	%r9, 0x0001, %r5
	.word 0x87902066  ! 35: WRPR_TT_I	wrpr	%r0, 0x0066, %tt
	.word 0x99902003  ! 36: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x92fce001  ! 37: SDIVcc_I	sdivcc 	%r19, 0x0001, %r9
	.word 0x819827c6  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c6, %hpstate
	.word 0x8d802000  ! 39: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90249c  ! 40: WRPR_PSTATE_I	wrpr	%r0, 0x049c, %pstate
change_to_randtl_4:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 41: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91d02034  ! 42: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_5:
	.word 0x34800001  ! 44: BG	bg,a	<label_0x1>
	pdist %f22, %f10, %f24
	.word 0x9bb0830b  ! 43: ALLIGNADDRESS	alignaddr	%r2, %r11, %r13
change_to_randtl_6:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 44: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
reduce_priv_level_7:
	.word 0x8f902002  ! 46: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89820014  ! 45: WRTICK_R	wr	%r8, %r20, %tick
	.word 0x8790234e  ! 46: WRPR_TT_I	wrpr	%r0, 0x034e, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x87500000  ! 48: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x8d50c000  ! 49: RDPR_TT	rdpr	%tt, %r6
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 50: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902c50  ! 51: WRPR_PSTATE_I	wrpr	%r0, 0x0c50, %pstate
	.word 0xa1902002  ! 52: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xb5500000  ! 53: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x93902001  ! 54: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xf40fe001  ! 55: LDUB_I	ldub	[%r31 + 0x0001], %r26
	.word 0x93902003  ! 56: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02035  ! 58: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xf407e001  ! 59: LDUW_I	lduw	[%r31 + 0x0001], %r26
	.word 0x879021aa  ! 60: WRPR_TT_I	wrpr	%r0, 0x01aa, %tt
	.word 0xf48fe020  ! 61: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r26
reduce_priv_level_8:
	.word 0x8f902002  ! 63: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8985400d  ! 62: WRTICK_R	wr	%r21, %r13, %tick
	.word 0x98aa4010  ! 63: ANDNcc_R	andncc 	%r9, %r16, %r12
	.word 0xa1514000  ! 64: RDPR_TBA	rdpr	%tba, %r16
	.word 0xe0900e80  ! 65: LDUHA_R	lduha	[%r0, %r0] 0x74, %r16
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 66: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 67: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902002  ! 68: WRPR_GL_I	wrpr	%r0, 0x0002, %-
DS_9:
	.word 0x32800001  ! 70: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 70: BNE	bne,a	<label_0x1>
	.word 0xe911c00a  ! 70: LDQF_R	-	[%r7, %r10], %f20
	.word 0xb3a10827  ! 69: FADDs	fadds	%f4, %f7, %f25
	.word 0x8d902a5e  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x0a5e, %pstate
	.word 0xa7504000  ! 71: RDPR_TNPC	rdpr	%tnpc, %r19
DS_10:
	.word 0x32800001  ! 73: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 72: SAVE_R	save	%r31, %r0, %r31
reduce_priv_level_11:
	.word 0x8f902002  ! 74: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8568e001  ! 73: SDIVX_I	sdivx	%r3, 0x0001, %r2
	.word 0x879023e2  ! 74: WRPR_TT_I	wrpr	%r0, 0x03e2, %tt
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 75: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902080  ! 76: WRPR_PSTATE_I	wrpr	%r0, 0x0080, %pstate
	.word 0x81982a85  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a85, %hpstate
	.word 0x8d902695  ! 78: WRPR_PSTATE_I	wrpr	%r0, 0x0695, %pstate
	.word 0x93902003  ! 79: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93d02035  ! 80: Tcc_I	tne	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
change_to_randtl_12:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 82: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d902653  ! 83: WRPR_PSTATE_I	wrpr	%r0, 0x0653, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 84: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc47fe001  ! 85: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0xa190200d  ! 86: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x879023d4  ! 87: WRPR_TT_I	wrpr	%r0, 0x03d4, %tt
	.word 0x87802014  ! 88: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xb681801a  ! 89: ADDcc_R	addcc 	%r6, %r26, %r27
	.word 0x8d90260f  ! 90: WRPR_PSTATE_I	wrpr	%r0, 0x060f, %pstate
	.word 0xb7a01a73  ! 91: FqTOi	fqtoi	
	.word 0xafa589f2  ! 92: FDIVq	dis not found

	.word 0xa5690010  ! 93: SDIVX_R	sdivx	%r4, %r16, %r18
	.word 0x85504000  ! 94: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0xafa0057b  ! 95: FSQRTq	fsqrt	
	.word 0xa7514000  ! 96: RDPR_TBA	rdpr	%tba, %r19
	.word 0x97a01a6a  ! 97: FqTOi	fqtoi	
	.word 0x8da489cd  ! 98: FDIVd	fdivd	%f18, %f44, %f6
	.word 0x8d802004  ! 99: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902a86  ! 100: WRPR_PSTATE_I	wrpr	%r0, 0x0a86, %pstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 101: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982185  ! 102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0185, %hpstate
	.word 0x91d02035  ! 103: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982d06  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d06, %hpstate
	.word 0xcd27e001  ! 105: STF_I	st	%f6, [0x0001, %r31]
	.word 0xccc804a0  ! 106: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r6
	.word 0x92d30010  ! 107: UMULcc_R	umulcc 	%r12, %r16, %r9
	.word 0x99508000  ! 108: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x81982281  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0281, %hpstate
	.word 0x8790206e  ! 110: WRPR_TT_I	wrpr	%r0, 0x006e, %tt
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 111: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02032  ! 113: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x82d6e001  ! 114: UMULcc_I	umulcc 	%r27, 0x0001, %r1
	.word 0x8d902a18  ! 115: WRPR_PSTATE_I	wrpr	%r0, 0x0a18, %pstate
	.word 0x91d02035  ! 116: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x83d02033  ! 117: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xa681a001  ! 118: ADDcc_I	addcc 	%r6, 0x0001, %r19
	.word 0x91500000  ! 119: RDPR_TPC	rdpr	%tpc, %r8
	.word 0x8769c019  ! 120: SDIVX_R	sdivx	%r7, %r25, %r3
	.word 0x9ba309b1  ! 121: FDIVs	fdivs	%f12, %f17, %f13
	.word 0x91d02032  ! 122: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 123: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8790221f  ! 124: WRPR_TT_I	wrpr	%r0, 0x021f, %tt
	.word 0x89a649e4  ! 125: FDIVq	dis not found

	.word 0xa1902008  ! 126: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xc8d7e020  ! 127: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r4
	.word 0xc8d00e40  ! 128: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r4
	.word 0x87802088  ! 129: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d902849  ! 130: WRPR_PSTATE_I	wrpr	%r0, 0x0849, %pstate
	.word 0x8d90289d  ! 131: WRPR_PSTATE_I	wrpr	%r0, 0x089d, %pstate
	.word 0x87902192  ! 132: WRPR_TT_I	wrpr	%r0, 0x0192, %tt
	.word 0x8d90265c  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x065c, %pstate
	.word 0xc8d004a0  ! 134: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0x91d02033  ! 135: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x819820d0  ! 136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d0, %hpstate
	.word 0xc8800b60  ! 137: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r4
	.word 0x87902226  ! 138: WRPR_TT_I	wrpr	%r0, 0x0226, %tt
	.word 0x9f802001  ! 139: SIR	sir	0x0001
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d02032  ! 141: Tcc_I	tne	icc_or_xcc, %r0 + 50
change_to_randtl_13:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 142: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x87802080  ! 143: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xc8ffc024  ! 144: SWAPA_R	swapa	%r4, [%r31 + %r4] 0x01
	.word 0xc8d804a0  ! 145: LDXA_R	ldxa	[%r0, %r0] 0x25, %r4
	.word 0xa190200b  ! 146: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xb4852001  ! 147: ADDcc_I	addcc 	%r20, 0x0001, %r26
DS_14:
	.word 0x32800001  ! 149: BNE	bne,a	<label_0x1>
	pdist %f22, %f14, %f30
	.word 0xa5b20317  ! 148: ALLIGNADDRESS	alignaddr	%r8, %r23, %r18
	.word 0xe40fe001  ! 149: LDUB_I	ldub	[%r31 + 0x0001], %r18
	.word 0x8d9028c4  ! 150: WRPR_PSTATE_I	wrpr	%r0, 0x08c4, %pstate
	ta	T_CHANGE_TO_TL0	! macro
DS_15:
	.word 0x32800001  ! 153: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 153: BG	bg,a	<label_0x1>
	.word 0x99a00552  ! 153: FSQRTd	fsqrt	
	.word 0x9ba08826  ! 152: FADDs	fadds	%f2, %f6, %f13
	ta	T_CHANGE_PRIV	! macro
	.word 0x9048000c  ! 154: MULX_R	mulx 	%r0, %r12, %r8
	.word 0x87902153  ! 155: WRPR_TT_I	wrpr	%r0, 0x0153, %tt
	.word 0x8d902850  ! 156: WRPR_PSTATE_I	wrpr	%r0, 0x0850, %pstate
	.word 0x93902001  ! 157: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x88fd6001  ! 158: SDIVcc_I	sdivcc 	%r21, 0x0001, %r4
	.word 0x87802088  ! 159: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x91d02031  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d802000  ! 161: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802088  ! 162: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x81a249c6  ! 163: FDIVd	fdivd	%f40, %f6, %f0
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02034  ! 165: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902a4d  ! 166: WRPR_PSTATE_I	wrpr	%r0, 0x0a4d, %pstate
	.word 0x966ae001  ! 167: UDIVX_I	udivx 	%r11, 0x0001, %r11
	.word 0x8790209d  ! 168: WRPR_TT_I	wrpr	%r0, 0x009d, %tt
	.word 0x8d9026db  ! 169: WRPR_PSTATE_I	wrpr	%r0, 0x06db, %pstate
	.word 0x8790209a  ! 170: WRPR_TT_I	wrpr	%r0, 0x009a, %tt
	.word 0xd67fe001  ! 171: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x8d802000  ! 172: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902006  ! 173: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x34700001  ! 174: BPG	<illegal instruction>
	.word 0x93902004  ! 175: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd68fe020  ! 176: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r11
	.word 0x9ba01a6d  ! 177: FqTOi	fqtoi	
	.word 0x879023dd  ! 178: WRPR_TT_I	wrpr	%r0, 0x03dd, %tt
	.word 0x9f802001  ! 179: SIR	sir	0x0001
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 180: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8198200c  ! 181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
	.word 0x9f802001  ! 182: SIR	sir	0x0001
	.word 0x81982ecc  ! 183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecc, %hpstate
	.word 0x81494000  ! 184: RDHPR_HTBA	rdhpr	%htba, %r0
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 186: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc007e001  ! 187: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0xc0c7e010  ! 188: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r0
	.word 0x91514000  ! 189: RDPR_TBA	rdpr	%tba, %r8
	.word 0x8198205d  ! 190: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005d, %hpstate
	.word 0x93902003  ! 191: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa190200c  ! 192: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x879022d6  ! 193: WRPR_TT_I	wrpr	%r0, 0x02d6, %tt
	.word 0x8d902a00  ! 194: WRPR_PSTATE_I	wrpr	%r0, 0x0a00, %pstate
DS_16:
	.word 0x20800001  ! 196: BN	bn,a	<label_0x1>
	illtrap
	.word 0xc3154006  ! 196: LDQF_R	-	[%r21, %r6], %f1
	.word 0x9ba50823  ! 195: FADDs	fadds	%f20, %f3, %f13
	.word 0x879022d8  ! 196: WRPR_TT_I	wrpr	%r0, 0x02d8, %tt
	.word 0xda8fe030  ! 197: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0x81982d1e  ! 198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1e, %hpstate
	.word 0x93902007  ! 199: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_17:
	.word 0x32800001  ! 201: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 200: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9f802001  ! 201: SIR	sir	0x0001
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 202: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 203: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x38700001  ! 205: BPGU	<illegal instruction>
	.word 0xb3514000  ! 206: RDPR_TBA	rdpr	%tba, %r25
	.word 0x87902338  ! 207: WRPR_TT_I	wrpr	%r0, 0x0338, %tt
	.word 0x8750c000  ! 208: RDPR_TT	rdpr	%tt, %r3
	.word 0x8d500000  ! 209: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x93902005  ! 210: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x936a8009  ! 211: SDIVX_R	sdivx	%r10, %r9, %r9
	.word 0x93902002  ! 212: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87802089  ! 213: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x98ab0004  ! 214: ANDNcc_R	andncc 	%r12, %r4, %r12
	.word 0xa5a00558  ! 215: FSQRTd	fsqrt	
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 216: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 217: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902063  ! 218: WRPR_TT_I	wrpr	%r0, 0x0063, %tt
	.word 0x81982505  ! 219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0505, %hpstate
	.word 0xa1902007  ! 220: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d90261d  ! 221: WRPR_PSTATE_I	wrpr	%r0, 0x061d, %pstate
DS_18:
	.word 0x20800001  ! 223: BN	bn,a	<label_0x1>
	allclean
	.word 0x8fb2030d  ! 222: ALLIGNADDRESS	alignaddr	%r8, %r13, %r7
	.word 0x99a0056b  ! 223: FSQRTq	fsqrt	
	.word 0x879021e7  ! 224: WRPR_TT_I	wrpr	%r0, 0x01e7, %tt
	.word 0xa1902007  ! 225: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93d02031  ! 226: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x879022fb  ! 227: WRPR_TT_I	wrpr	%r0, 0x02fb, %tt
	.word 0x81702001  ! 228: POPC_I	popc	0x0001, %r0
	.word 0x93a60dcc  ! 229: FdMULq	fdmulq	
	.word 0xa190200d  ! 230: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x3e700001  ! 231: BPVC	<illegal instruction>
	.word 0x8198255b  ! 232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055b, %hpstate
	.word 0xae4ec006  ! 233: MULX_R	mulx 	%r27, %r6, %r23
	.word 0x8790203f  ! 234: WRPR_TT_I	wrpr	%r0, 0x003f, %tt
	.word 0x81982643  ! 235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0643, %hpstate
	.word 0xb7540000  ! 236: RDPR_GL	rdpr	%-, %r27
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 238: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x89a289e7  ! 239: FDIVq	dis not found

	.word 0x8d9020df  ! 240: WRPR_PSTATE_I	wrpr	%r0, 0x00df, %pstate
	.word 0x879021a9  ! 241: WRPR_TT_I	wrpr	%r0, 0x01a9, %tt
	.word 0x91d02035  ! 242: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902001  ! 243: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8790224e  ! 244: WRPR_TT_I	wrpr	%r0, 0x024e, %tt
	.word 0x93d02034  ! 245: Tcc_I	tne	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982950  ! 247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0950, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902004  ! 249: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d902ec6  ! 250: WRPR_PSTATE_I	wrpr	%r0, 0x0ec6, %pstate
	.word 0x864cc005  ! 251: MULX_R	mulx 	%r19, %r5, %r3
	.word 0x83d02033  ! 252: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xc65fe001  ! 253: LDX_I	ldx	[%r31 + 0x0001], %r3
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 254: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 255: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc68fe020  ! 256: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r3
	.word 0x8d902010  ! 257: WRPR_PSTATE_I	wrpr	%r0, 0x0010, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc6cfe010  ! 259: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r3
	.word 0xc6800b40  ! 260: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r3
	.word 0x9f802001  ! 261: SIR	sir	0x0001
DS_19:
	.word 0x22800001  ! 263: BE	be,a	<label_0x1>
	.word 0x32800001  ! 263: BNE	bne,a	<label_0x1>
	.word 0xc310c006  ! 263: LDQF_R	-	[%r3, %r6], %f1
	.word 0xa9a08820  ! 262: FADDs	fadds	%f2, %f0, %f20
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 263: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a09  ! 264: WRPR_PSTATE_I	wrpr	%r0, 0x0a09, %pstate
	.word 0x819822d6  ! 265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d6, %hpstate
	.word 0xa1902005  ! 266: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa1902002  ! 267: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x81982b04  ! 268: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b04, %hpstate
	.word 0x8d902095  ! 269: WRPR_PSTATE_I	wrpr	%r0, 0x0095, %pstate
	.word 0x87802010  ! 270: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xe88fe030  ! 271: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r20
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xe8dfe000  ! 273: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r20
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 274: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8198285b  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085b, %hpstate
	.word 0x8d902695  ! 276: WRPR_PSTATE_I	wrpr	%r0, 0x0695, %pstate
	.word 0x93902007  ! 277: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa7494000  ! 278: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xa1902009  ! 279: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 280: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe68008a0  ! 281: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
DS_20:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 282: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x93d02035  ! 283: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x83d02034  ! 284: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xa1902003  ! 285: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8198289f  ! 286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089f, %hpstate
	.word 0x8790207f  ! 287: WRPR_TT_I	wrpr	%r0, 0x007f, %tt
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 288: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_21:
	.word 0x32800001  ! 290: BNE	bne,a	<label_0x1>
	.word 0xf1366001  ! 290: STQF_I	-	%f24, [0x0001, %r25]
	normalw
	.word 0x89458000  ! 289: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x93902004  ! 290: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x94a8001a  ! 291: ANDNcc_R	andncc 	%r0, %r26, %r10
	.word 0x8790201d  ! 292: WRPR_TT_I	wrpr	%r0, 0x001d, %tt
	.word 0x93902007  ! 293: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd4d7e030  ! 294: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 295: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 296: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982c52  ! 297: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c52, %hpstate
	.word 0x8d802004  ! 298: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd4d004a0  ! 299: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
DS_22:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 300: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd4c80e60  ! 301: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0x93902005  ! 302: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd48008a0  ! 303: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x99902002  ! 304: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa551c000  ! 305: RDPR_TL	rdpr	%tl, %r18
	.word 0x8ba649c3  ! 306: FDIVd	fdivd	%f56, %f34, %f36
	.word 0x8d902687  ! 307: WRPR_PSTATE_I	wrpr	%r0, 0x0687, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 308: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x87902058  ! 310: WRPR_TT_I	wrpr	%r0, 0x0058, %tt
	.word 0x93902003  ! 311: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x879021ab  ! 312: WRPR_TT_I	wrpr	%r0, 0x01ab, %tt
	.word 0x83d02032  ! 313: Tcc_I	te	icc_or_xcc, %r0 + 50
reduce_priv_level_23:
	.word 0x8f902001  ! 315: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8981c000  ! 314: WRTICK_R	wr	%r7, %r0, %tick
	.word 0x91d02030  ! 315: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902008  ! 316: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93902003  ! 317: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8a6c2001  ! 318: UDIVX_I	udivx 	%r16, 0x0001, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1902003  ! 320: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x89508000  ! 321: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0x9b508000  ! 322: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0x8198261e  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061e, %hpstate
	.word 0x87902272  ! 324: WRPR_TT_I	wrpr	%r0, 0x0272, %tt
	.word 0x8f514000  ! 325: RDPR_TBA	rdpr	%tba, %r7
	.word 0x93902004  ! 326: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8db0cfe2  ! 327: FONES	fones	%f6
	.word 0x81982ad6  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad6, %hpstate
	.word 0x91d02034  ! 329: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xcc7fe001  ! 330: SWAP_I	swap	%r6, [%r31 + 0x0001]
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 331: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982492  ! 332: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0492, %hpstate
	.word 0x81982046  ! 333: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0046, %hpstate
change_to_randtl_24:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 334: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8fa00563  ! 335: FSQRTq	fsqrt	
	.word 0xced7e010  ! 336: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r7
	.word 0x9b514000  ! 337: RDPR_TBA	rdpr	%tba, %r13
	.word 0x83d02034  ! 338: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d90249a  ! 339: WRPR_PSTATE_I	wrpr	%r0, 0x049a, %pstate
	.word 0x93702001  ! 340: POPC_I	popc	0x0001, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879020d2  ! 342: WRPR_TT_I	wrpr	%r0, 0x00d2, %tt
	.word 0x97702001  ! 343: POPC_I	popc	0x0001, %r11
	.word 0x93902000  ! 344: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
reduce_priv_level_25:
	.word 0x8f902002  ! 346: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83a01978  ! 345: FqTOd	dis not found

	.word 0xa4d00015  ! 346: UMULcc_R	umulcc 	%r0, %r21, %r18
	.word 0x8790214b  ! 347: WRPR_TT_I	wrpr	%r0, 0x014b, %tt
	.word 0xe4c004a0  ! 348: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	.word 0x9f802001  ! 349: SIR	sir	0x0001
	.word 0xa1902003  ! 350: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902005  ! 351: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87802089  ! 352: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x22700001  ! 353: BPE	<illegal instruction>
	.word 0xe4cfe030  ! 354: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r18
	.word 0xb04cc00c  ! 355: MULX_R	mulx 	%r19, %r12, %r24
	.word 0x81982986  ! 356: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0986, %hpstate
	.word 0x8790221d  ! 357: WRPR_TT_I	wrpr	%r0, 0x021d, %tt
	.word 0x93902003  ! 358: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d9020cc  ! 359: WRPR_PSTATE_I	wrpr	%r0, 0x00cc, %pstate
	.word 0x83d02034  ! 360: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x879020b2  ! 361: WRPR_TT_I	wrpr	%r0, 0x00b2, %tt
	.word 0x8d902800  ! 362: WRPR_PSTATE_I	wrpr	%r0, 0x0800, %pstate
	.word 0xa190200b  ! 363: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93902003  ! 364: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902007  ! 365: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_26:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 366: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x879020ea  ! 367: WRPR_TT_I	wrpr	%r0, 0x00ea, %tt
	.word 0x819824c2  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c2, %hpstate
	.word 0x38700001  ! 369: BPGU	<illegal instruction>
	.word 0xf04fe001  ! 370: LDSB_I	ldsb	[%r31 + 0x0001], %r24
	.word 0x8790236e  ! 371: WRPR_TT_I	wrpr	%r0, 0x036e, %tt
	.word 0x879022cc  ! 372: WRPR_TT_I	wrpr	%r0, 0x02cc, %tt
	.word 0x98804003  ! 373: ADDcc_R	addcc 	%r1, %r3, %r12
	.word 0xa1902001  ! 374: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x26800001  ! 375: BL	bl,a	<label_0x1>
	.word 0x88d62001  ! 376: UMULcc_I	umulcc 	%r24, 0x0001, %r4
	.word 0x8198218a  ! 377: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018a, %hpstate
change_to_randtl_27:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 378: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x9750c000  ! 379: RDPR_TT	rdpr	%tt, %r11
change_to_randtl_28:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 380: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd7e7c023  ! 381: CASA_I	casa	[%r31] 0x 1, %r3, %r11
	.word 0x99a000d5  ! 382: FNEGd	fnegd	%f52, %f12
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902007  ! 384: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902006  ! 385: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x83494000  ! 386: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0xa350c000  ! 387: RDPR_TT	rdpr	%tt, %r17
	.word 0x87802010  ! 388: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x91d02034  ! 389: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa190200a  ! 390: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x91d02035  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9f802001  ! 392: SIR	sir	0x0001
	.word 0x91d02035  ! 393: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982cc3  ! 394: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc3, %hpstate
	.word 0x8d9024d7  ! 395: WRPR_PSTATE_I	wrpr	%r0, 0x04d7, %pstate
	.word 0x87902137  ! 396: WRPR_TT_I	wrpr	%r0, 0x0137, %tt
	.word 0x8790236e  ! 397: WRPR_TT_I	wrpr	%r0, 0x036e, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8198289d  ! 399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089d, %hpstate
	.word 0x8d90265d  ! 400: WRPR_PSTATE_I	wrpr	%r0, 0x065d, %pstate
	.word 0x85a00557  ! 401: FSQRTd	fsqrt	
	.word 0xacc12001  ! 402: ADDCcc_I	addccc 	%r4, 0x0001, %r22
change_to_randtl_29:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 403: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	ta	T_CHANGE_HPRIV	! macro
change_to_randtl_30:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 405: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xed3fe001  ! 406: STDF_I	std	%f22, [0x0001, %r31]
	.word 0x87902004  ! 407: WRPR_TT_I	wrpr	%r0, 0x0004, %tt
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 408: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 409: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902004  ! 410: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902005  ! 411: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xecc80e80  ! 412: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r22
	.word 0x99902003  ! 413: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 414: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8fa00549  ! 415: FSQRTd	fsqrt	
	.word 0x96dec016  ! 416: SMULcc_R	smulcc 	%r27, %r22, %r11
	.word 0xa1902000  ! 417: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 418: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd617e001  ! 419: LDUH_I	lduh	[%r31 + 0x0001], %r11
reduce_priv_level_31:
	.word 0x8f902002  ! 421: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89828017  ! 420: WRTICK_R	wr	%r10, %r23, %tick
change_to_tl1_32:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa5a000cd  ! 422: FNEGd	fnegd	%f44, %f18
	.word 0xa1902006  ! 423: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d902c9b  ! 424: WRPR_PSTATE_I	wrpr	%r0, 0x0c9b, %pstate
reduce_priv_level_33:
	.word 0x8f902002  ! 426: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8f6a6001  ! 425: SDIVX_I	sdivx	%r9, 0x0001, %r7
	.word 0xa1902007  ! 426: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d902ccf  ! 427: WRPR_PSTATE_I	wrpr	%r0, 0x0ccf, %pstate
	.word 0x93902004  ! 428: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xcedfe010  ! 429: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r7
DS_34:
	.word 0x32800001  ! 431: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 430: SAVE_R	save	%r31, %r0, %r31
reduce_priv_level_35:
	.word 0x8f902001  ! 432: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 431: SIAM	siam	1
	.word 0x93902000  ! 432: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x99902001  ! 433: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xce9004a0  ! 434: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982bc4  ! 436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc4, %hpstate
	.word 0x91d02035  ! 437: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902009  ! 438: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x88ab0001  ! 439: ANDNcc_R	andncc 	%r12, %r1, %r4
	.word 0x91d02030  ! 440: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902006  ! 441: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902001  ! 442: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x879022a7  ! 443: WRPR_TT_I	wrpr	%r0, 0x02a7, %tt
	.word 0x80fd8003  ! 444: SDIVcc_R	sdivcc 	%r22, %r3, %r0
	.word 0x94ab4017  ! 445: ANDNcc_R	andncc 	%r13, %r23, %r10
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 446: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4800ba0  ! 447: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r10
	.word 0x93902005  ! 448: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f802001  ! 449: SIR	sir	0x0001
	.word 0xb5a48dc5  ! 450: FdMULq	fdmulq	
	.word 0x91d02033  ! 451: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902e15  ! 452: WRPR_PSTATE_I	wrpr	%r0, 0x0e15, %pstate
	.word 0x8951c000  ! 453: RDPR_TL	rdpr	%tl, %r4
	.word 0x93902001  ! 454: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa7a00563  ! 455: FSQRTq	fsqrt	
	.word 0xe6d80e40  ! 456: LDXA_R	ldxa	[%r0, %r0] 0x72, %r19
change_to_randtl_36:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 457: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x879020e6  ! 458: WRPR_TT_I	wrpr	%r0, 0x00e6, %tt
	.word 0xb5a149c4  ! 459: FDIVd	fdivd	%f36, %f4, %f26
	.word 0x8d90220e  ! 460: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
	.word 0x89a01a64  ! 461: FqTOi	fqtoi	
	ta	T_CHANGE_PRIV	! macro
	.word 0x85504000  ! 463: RDPR_TNPC	rdpr	%tnpc, %r2
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 464: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3514000  ! 465: RDPR_TBA	rdpr	%tba, %r17
	.word 0xe29fc020  ! 466: LDDA_R	ldda	[%r31, %r0] 0x01, %r17
	.word 0xa190200b  ! 467: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x81702001  ! 468: POPC_I	popc	0x0001, %r0
change_to_tl1_37:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa190200f  ! 470: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 471: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02030  ! 472: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xb1702001  ! 473: POPC_I	popc	0x0001, %r24
	.word 0x91d02033  ! 474: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902002  ! 475: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x34700001  ! 476: BPG	<illegal instruction>
	.word 0xa1902004  ! 477: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xf00fc000  ! 478: LDUB_R	ldub	[%r31 + %r0], %r24
DS_38:
	.word 0x20800001  ! 480: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 479: SAVE_R	save	%r31, %r0, %r31
	.word 0x9f802001  ! 480: SIR	sir	0x0001
	.word 0x81982010  ! 481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0010, %hpstate
	.word 0x98f86001  ! 482: SDIVcc_I	sdivcc 	%r1, 0x0001, %r12
	.word 0x91d02031  ! 483: Tcc_I	ta	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02034  ! 485: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802016  ! 486: WRASI_I	wr	%r0, 0x0016, %asi
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 487: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83a549a0  ! 488: FDIVs	fdivs	%f21, %f0, %f1
	.word 0x8d902819  ! 489: WRPR_PSTATE_I	wrpr	%r0, 0x0819, %pstate
	.word 0x8a6a0008  ! 490: UDIVX_R	udivx 	%r8, %r8, %r5
	.word 0x8d902259  ! 491: WRPR_PSTATE_I	wrpr	%r0, 0x0259, %pstate
	.word 0x8ba18dc7  ! 492: FdMULq	fdmulq	
	.word 0xa1902006  ! 493: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d9026cd  ! 494: WRPR_PSTATE_I	wrpr	%r0, 0x06cd, %pstate
	.word 0x28700001  ! 495: BPLEU	<illegal instruction>
	.word 0x81982f56  ! 496: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f56, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa880c01a  ! 498: ADDcc_R	addcc 	%r3, %r26, %r20
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 499: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81540000  ! 500: RDPR_GL	rdpr	%-, %r0
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 501: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d9026ca  ! 502: WRPR_PSTATE_I	wrpr	%r0, 0x06ca, %pstate
	.word 0xa0c5a001  ! 503: ADDCcc_I	addccc 	%r22, 0x0001, %r16
	.word 0x92816001  ! 504: ADDcc_I	addcc 	%r5, 0x0001, %r9
	.word 0x83500000  ! 505: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x81982dd9  ! 506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd9, %hpstate
DS_39:
	.word 0x22800001  ! 508: BE	be,a	<label_0x1>
	.word 0xdb33400b  ! 508: STQF_R	-	%f13, [%r11, %r13]
	normalw
	.word 0x9b458000  ! 507: RD_SOFTINT_REG	rd	%softint, %r13
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9f802001  ! 509: SIR	sir	0x0001
	.word 0x879020df  ! 510: WRPR_TT_I	wrpr	%r0, 0x00df, %tt
	.word 0x30800001  ! 511: BA	ba,a	<label_0x1>
	.word 0xda77c00b  ! 512: STX_R	stx	%r13, [%r31 + %r11]
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 513: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 514: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902003  ! 515: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa190200e  ! 516: WRPR_GL_I	wrpr	%r0, 0x000e, %-
DS_40:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 517: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 519: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 520: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879022cb  ! 521: WRPR_TT_I	wrpr	%r0, 0x02cb, %tt
	.word 0x91d02034  ! 522: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902c8f  ! 523: WRPR_PSTATE_I	wrpr	%r0, 0x0c8f, %pstate
	.word 0x93902007  ! 524: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81982a88  ! 525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a88, %hpstate
	.word 0x81982b0f  ! 526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0f, %hpstate
	.word 0x8d902c03  ! 527: WRPR_PSTATE_I	wrpr	%r0, 0x0c03, %pstate
DS_41:
	.word 0x22800001  ! 529: BE	be,a	<label_0x1>
	.word 0x34800001  ! 529: BG	bg,a	<label_0x1>
	.word 0xc7108004  ! 529: LDQF_R	-	[%r2, %r4], %f3
	.word 0x89a2483a  ! 528: FADDs	fadds	%f9, %f26, %f4
	.word 0x91d02033  ! 529: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa190200f  ! 530: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xb551c000  ! 531: RDPR_TL	rdpr	%tl, %r26
DS_42:
	.word 0x22800001  ! 533: BE	be,a	<label_0x1>
	.word 0xd1324018  ! 533: STQF_R	-	%f8, [%r24, %r9]
	normalw
	.word 0xa1458000  ! 532: RD_SOFTINT_REG	rd	%softint, %r16
DS_43:
	.word 0x34800001  ! 534: BG	bg,a	<label_0x1>
	.word 0xd130800a  ! 534: STQF_R	-	%f8, [%r10, %r2]
	normalw
	.word 0x97458000  ! 533: RD_SOFTINT_REG	rd	%softint, %r11
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 534: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99a00541  ! 535: FSQRTd	fsqrt	
	.word 0xa190200d  ! 536: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd88008a0  ! 537: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x8d90260b  ! 538: WRPR_PSTATE_I	wrpr	%r0, 0x060b, %pstate
	.word 0x93902007  ! 539: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x866a8004  ! 540: UDIVX_R	udivx 	%r10, %r4, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0x9150c000  ! 542: RDPR_TT	rdpr	%tt, %r8
	.word 0x88806001  ! 543: ADDcc_I	addcc 	%r1, 0x0001, %r4
	.word 0x32800001  ! 544: BNE	bne,a	<label_0x1>
	.word 0x9f802001  ! 545: SIR	sir	0x0001
	.word 0x9a826001  ! 546: ADDcc_I	addcc 	%r9, 0x0001, %r13
	.word 0x93902007  ! 547: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9f802001  ! 548: SIR	sir	0x0001
	.word 0x91d02035  ! 549: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93d02031  ! 550: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8550c000  ! 551: RDPR_TT	rdpr	%tt, %r2
	.word 0x8d902ad9  ! 552: WRPR_PSTATE_I	wrpr	%r0, 0x0ad9, %pstate
	.word 0x81982a48  ! 553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a48, %hpstate
	.word 0x819822c3  ! 554: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c3, %hpstate
	.word 0x93902005  ! 555: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982fde  ! 556: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fde, %hpstate
	.word 0xc48008a0  ! 557: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x30700001  ! 558: BPA	<illegal instruction>
	.word 0x8d90200c  ! 559: WRPR_PSTATE_I	wrpr	%r0, 0x000c, %pstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 560: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902880  ! 561: WRPR_PSTATE_I	wrpr	%r0, 0x0880, %pstate
	.word 0x8d802000  ! 562: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x20700001  ! 563: BPN	<illegal instruction>
	.word 0xc47fe001  ! 564: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0x87514000  ! 565: RDPR_TBA	rdpr	%tba, %r3
	.word 0x81982947  ! 566: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0947, %hpstate
	.word 0x85a0054a  ! 567: FSQRTd	fsqrt	
	.word 0xc48008a0  ! 568: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x8d90280d  ! 569: WRPR_PSTATE_I	wrpr	%r0, 0x080d, %pstate
	.word 0x93902007  ! 570: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8da2c9c2  ! 571: FDIVd	fdivd	%f42, %f2, %f6
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 572: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 573: WRPR_GL_I	wrpr	%r0, 0x0004, %-
change_to_randtl_44:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 574: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc97e030  ! 576: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r6
	.word 0x8198291d  ! 577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091d, %hpstate
	.word 0xa1902008  ! 578: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xcc7fe001  ! 579: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x87702001  ! 580: POPC_I	popc	0x0001, %r3
	.word 0xc69fc020  ! 581: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0xa1902003  ! 582: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902007  ! 583: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0xa6dc4016  ! 585: SMULcc_R	smulcc 	%r17, %r22, %r19
	.word 0x83d02034  ! 586: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xe697e020  ! 587: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r19
reduce_priv_level_45:
	.word 0x8f902001  ! 589: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8986000d  ! 588: WRTICK_R	wr	%r24, %r13, %tick
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 589: Tcc_R	ta	icc_or_xcc, %r0 + %r30
reduce_priv_level_46:
	.word 0x8f902001  ! 591: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 590: SIAM	siam	1
	.word 0x8d902a5a  ! 591: WRPR_PSTATE_I	wrpr	%r0, 0x0a5a, %pstate
	.word 0x8d902404  ! 592: WRPR_PSTATE_I	wrpr	%r0, 0x0404, %pstate
	.word 0xb3a189b7  ! 593: FDIVs	fdivs	%f6, %f23, %f25
	.word 0xa1902003  ! 594: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_47:
	.word 0x34800001  ! 596: BG	bg,a	<label_0x1>
	.word 0xd3322001  ! 596: STQF_I	-	%f9, [0x0001, %r8]
	normalw
	.word 0xad458000  ! 595: RD_SOFTINT_REG	rd	%softint, %r22
	.word 0x99902003  ! 596: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	ta	T_CHANGE_HPRIV	! macro
	.word 0x89494000  ! 598: RDHPR_HTBA	rdhpr	%htba, %r4
	.word 0xc837c017  ! 599: STH_R	sth	%r4, [%r31 + %r23]
	.word 0xb550c000  ! 600: RDPR_TT	rdpr	%tt, %r26
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 601: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02031  ! 602: Tcc_I	te	icc_or_xcc, %r0 + 49
DS_48:
	.word 0x32800001  ! 604: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 603: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
reduce_priv_level_49:
	.word 0x8f902000  ! 606: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xab68e001  ! 605: SDIVX_I	sdivx	%r3, 0x0001, %r21
	.word 0x8d802000  ! 606: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198229d  ! 607: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029d, %hpstate
	.word 0x8d90228f  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x028f, %pstate
	.word 0x8da01a60  ! 609: FqTOi	fqtoi	
	.word 0x81982743  ! 610: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0743, %hpstate
	.word 0x87802088  ! 611: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa3a40d2b  ! 612: FsMULd	fsmuld	%f16, %f42, %f48
	.word 0x8c834009  ! 613: ADDcc_R	addcc 	%r13, %r9, %r6
	.word 0xcc8008a0  ! 614: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8198201d  ! 615: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001d, %hpstate
	.word 0x93d02035  ! 616: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x91d02033  ! 617: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x879021d1  ! 618: WRPR_TT_I	wrpr	%r0, 0x01d1, %tt
	.word 0x8d902c94  ! 619: WRPR_PSTATE_I	wrpr	%r0, 0x0c94, %pstate
	.word 0xcd37c009  ! 620: STQF_R	-	%f6, [%r9, %r31]
change_to_randtl_50:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 621: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x83a000d4  ! 622: FNEGd	fnegd	%f20, %f32
	.word 0x8d802004  ! 623: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa190200d  ! 624: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xaaf80007  ! 625: SDIVcc_R	sdivcc 	%r0, %r7, %r21
	.word 0x93902002  ! 626: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 627: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 628: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x87902318  ! 630: WRPR_TT_I	wrpr	%r0, 0x0318, %tt
	.word 0xa1508000  ! 631: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x83d02030  ! 632: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x91d02033  ! 633: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe08008a0  ! 634: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xb350c000  ! 635: RDPR_TT	rdpr	%tt, %r25
DS_51:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 636: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x87802004  ! 637: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8ba000d6  ! 638: FNEGd	fnegd	%f22, %f36
	.word 0xa0d0c017  ! 639: UMULcc_R	umulcc 	%r3, %r23, %r16
	.word 0x91d02030  ! 640: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d902a5a  ! 641: WRPR_PSTATE_I	wrpr	%r0, 0x0a5a, %pstate
	.word 0x91d02030  ! 642: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8551c000  ! 643: RDPR_TL	rdpr	%tl, %r2
	ta	T_CHANGE_PRIV	! macro
reduce_priv_level_52:
	.word 0x8f902002  ! 646: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 645: SIAM	siam	1
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 646: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x83480000  ! 647: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0x8ef86001  ! 648: SDIVcc_I	sdivcc 	%r1, 0x0001, %r7
	.word 0xab514000  ! 649: RDPR_TBA	rdpr	%tba, %r21
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 650: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x90dc800c  ! 651: SMULcc_R	smulcc 	%r18, %r12, %r8
reduce_priv_level_53:
	.word 0x8f902000  ! 653: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8981c016  ! 652: WRTICK_R	wr	%r7, %r22, %tick
	.word 0x9ac32001  ! 653: ADDCcc_I	addccc 	%r12, 0x0001, %r13
	.word 0x83480000  ! 654: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
change_to_tl1_54:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xaf504000  ! 656: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x99902004  ! 657: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 658: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5a609a6  ! 659: FDIVs	fdivs	%f24, %f6, %f18
	.word 0x89480000  ! 660: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x91480000  ! 661: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902000  ! 663: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 664: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 665: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1a289c3  ! 666: FDIVd	fdivd	%f10, %f34, %f16
	.word 0x93902003  ! 667: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe0dfe010  ! 668: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r16
	.word 0xe0c7e020  ! 669: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 670: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81a00550  ! 671: FSQRTd	fsqrt	
	.word 0x97540000  ! 672: RDPR_GL	rdpr	%-, %r11
	.word 0x83d02035  ! 673: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xb5a509d8  ! 674: FDIVd	fdivd	%f20, %f24, %f26
	.word 0x83d02035  ! 675: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8198264b  ! 676: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064b, %hpstate
	.word 0xf497e030  ! 677: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r26
change_to_randtl_55:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902002  ! 678: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa1902004  ! 679: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x81982b88  ! 680: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b88, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02034  ! 682: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x879021b6  ! 683: WRPR_TT_I	wrpr	%r0, 0x01b6, %tt
	.word 0xb551c000  ! 684: RDPR_TL	rdpr	%tl, %r26
	.word 0x87902022  ! 685: WRPR_TT_I	wrpr	%r0, 0x0022, %tt
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 686: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9951c000  ! 687: RDPR_TL	rdpr	%tl, %r12
DS_56:
	.word 0x20800001  ! 689: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 688: RESTORE_R	restore	%r31, %r0, %r31
DS_57:
	.word 0x22800001  ! 690: BE	be,a	<label_0x1>
	allclean
	.word 0xb1b0c301  ! 689: ALLIGNADDRESS	alignaddr	%r3, %r1, %r24
	.word 0xf08008a0  ! 690: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x91a209a9  ! 691: FDIVs	fdivs	%f8, %f9, %f8
	.word 0x34800001  ! 692: BG	bg,a	<label_0x1>
	.word 0x93902004  ! 693: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81982a81  ! 694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a81, %hpstate
	.word 0xa1902001  ! 695: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8d902653  ! 696: WRPR_PSTATE_I	wrpr	%r0, 0x0653, %pstate
	.word 0x9f802001  ! 697: SIR	sir	0x0001
	ta	T_CHANGE_PRIV	! macro
DS_58:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 699: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x9b514000  ! 700: RDPR_TBA	rdpr	%tba, %r13
	.word 0x83d02030  ! 701: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x81982089  ! 702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0089, %hpstate
	.word 0x819826df  ! 703: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06df, %hpstate
	.word 0x8f50c000  ! 704: RDPR_TT	rdpr	%tt, %r7
	.word 0x87902158  ! 705: WRPR_TT_I	wrpr	%r0, 0x0158, %tt
	.word 0xcec804a0  ! 706: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0x28700001  ! 707: BPLEU	<illegal instruction>
	.word 0x20700001  ! 708: BPN	<illegal instruction>
	.word 0xa5494000  ! 709: RDHPR_HTBA	rdhpr	%htba, %r18
	.word 0xe4cfe030  ! 710: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r18
	.word 0xa5508000  ! 711: RDPR_TSTATE	<illegal instruction>
	.word 0x8d9028cb  ! 712: WRPR_PSTATE_I	wrpr	%r0, 0x08cb, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x28700001  ! 714: BPLEU	<illegal instruction>
	.word 0x8d902443  ! 715: WRPR_PSTATE_I	wrpr	%r0, 0x0443, %pstate
	.word 0x91d02032  ! 716: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe4900e80  ! 717: LDUHA_R	lduha	[%r0, %r0] 0x74, %r18
	.word 0x38700001  ! 718: BPGU	<illegal instruction>
	.word 0xa1902000  ! 719: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8ba6cdc1  ! 720: FdMULq	fdmulq	
	.word 0x91d02031  ! 721: Tcc_I	ta	icc_or_xcc, %r0 + 49
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 722: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcad00e80  ! 723: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r5
	.word 0xcad804a0  ! 724: LDXA_R	ldxa	[%r0, %r0] 0x25, %r5
	.word 0x91d02031  ! 725: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x91d02035  ! 726: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02031  ! 727: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xca97e030  ! 728: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r5
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 729: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 730: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8f702001  ! 731: POPC_I	popc	0x0001, %r7
	.word 0xa1902009  ! 732: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d902ad1  ! 733: WRPR_PSTATE_I	wrpr	%r0, 0x0ad1, %pstate
DS_59:
	.word 0x20800001  ! 735: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 735: BG	bg,a	<label_0x1>
	.word 0xcf15000c  ! 735: LDQF_R	-	[%r20, %r12], %f7
	.word 0x93a04825  ! 734: FADDs	fadds	%f1, %f5, %f9
	.word 0x91d02032  ! 735: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902005  ! 736: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
reduce_priv_level_60:
	.word 0x8f902001  ! 738: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x996a6001  ! 737: SDIVX_I	sdivx	%r9, 0x0001, %r12
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 738: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x84682001  ! 740: UDIVX_I	udivx 	%r0, 0x0001, %r2
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 741: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 742: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8790205b  ! 743: WRPR_TT_I	wrpr	%r0, 0x005b, %tt
	.word 0x91d02032  ! 744: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x906a8003  ! 745: UDIVX_R	udivx 	%r10, %r3, %r8
	.word 0x8790236e  ! 746: WRPR_TT_I	wrpr	%r0, 0x036e, %tt
	.word 0x83d02031  ! 747: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x2e700001  ! 748: BPVS	<illegal instruction>
	.word 0x8d802004  ! 749: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x819821ce  ! 750: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01ce, %hpstate
	.word 0x879023da  ! 751: WRPR_TT_I	wrpr	%r0, 0x03da, %tt
	.word 0xd0d00e80  ! 752: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r8
	.word 0x91494000  ! 753: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0xa190200e  ! 754: WRPR_GL_I	wrpr	%r0, 0x000e, %-
DS_61:
	.word 0x20800001  ! 756: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 755: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 756: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_62:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 757: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 758: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x84c5a001  ! 759: ADDCcc_I	addccc 	%r22, 0x0001, %r2
	.word 0x94f98014  ! 760: SDIVcc_R	sdivcc 	%r6, %r20, %r10
	.word 0x9f802001  ! 761: SIR	sir	0x0001
	.word 0x8cd36001  ! 762: UMULcc_I	umulcc 	%r13, 0x0001, %r6
	.word 0x8d902c9f  ! 763: WRPR_PSTATE_I	wrpr	%r0, 0x0c9f, %pstate
	.word 0x8350c000  ! 764: RDPR_TT	rdpr	%tt, %r1
	.word 0xc2d804a0  ! 765: LDXA_R	ldxa	[%r0, %r0] 0x25, %r1
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 766: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xb04b001a  ! 767: MULX_R	mulx 	%r12, %r26, %r24
	.word 0x879023d8  ! 768: WRPR_TT_I	wrpr	%r0, 0x03d8, %tt
	.word 0x9f802001  ! 769: SIR	sir	0x0001
	.word 0x91a01a6a  ! 770: FqTOi	fqtoi	
	.word 0x819820dd  ! 771: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dd, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 772: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 773: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_63:
	.word 0x32800001  ! 775: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 774: SAVE_R	save	%r31, %r0, %r31
	.word 0xa46cc007  ! 775: UDIVX_R	udivx 	%r19, %r7, %r18
	.word 0x81982356  ! 776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0356, %hpstate
	.word 0x8b508000  ! 777: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0x87802088  ! 778: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902006  ! 779: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xcac7e010  ! 780: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
	.word 0xca97e000  ! 781: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r5
	.word 0xa4f9a001  ! 782: SDIVcc_I	sdivcc 	%r6, 0x0001, %r18
	.word 0x8198239e  ! 783: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039e, %hpstate
	.word 0xa1902001  ! 784: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xe41fe001  ! 785: LDD_I	ldd	[%r31 + 0x0001], %r18
	.word 0x87802010  ! 786: WRASI_I	wr	%r0, 0x0010, %asi
DS_64:
	.word 0x20800001  ! 788: BN	bn,a	<label_0x1>
	illtrap
	.word 0xc9128019  ! 788: LDQF_R	-	[%r10, %r25], %f4
	.word 0x95a10823  ! 787: FADDs	fadds	%f4, %f3, %f10
	.word 0x9f802001  ! 788: SIR	sir	0x0001
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_65:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91540000  ! 791: RDPR_GL	rdpr	%-, %r8
	.word 0xa1902000  ! 792: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd0900e60  ! 793: LDUHA_R	lduha	[%r0, %r0] 0x73, %r8
	.word 0xd08008a0  ! 794: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x81982118  ! 795: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0118, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 796: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8cd24012  ! 797: UMULcc_R	umulcc 	%r9, %r18, %r6
	.word 0x91d02031  ! 798: Tcc_I	ta	icc_or_xcc, %r0 + 49
change_to_randtl_66:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 799: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87902340  ! 800: WRPR_TT_I	wrpr	%r0, 0x0340, %tt
	.word 0xaf514000  ! 801: RDPR_TBA	rdpr	%tba, %r23
	.word 0x8d500000  ! 802: RDPR_TPC	<illegal instruction>
	.word 0x8d802004  ! 803: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xcde7c032  ! 805: CASA_I	casa	[%r31] 0x 1, %r18, %r6
	.word 0x94fda001  ! 806: SDIVcc_I	sdivcc 	%r22, 0x0001, %r10
	.word 0xa1902000  ! 807: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d02031  ! 808: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x9f802001  ! 809: SIR	sir	0x0001
	.word 0xab508000  ! 810: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x879023cc  ! 811: WRPR_TT_I	wrpr	%r0, 0x03cc, %tt
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 812: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 813: SIR	sir	0x0001
	.word 0xaac36001  ! 814: ADDCcc_I	addccc 	%r13, 0x0001, %r21
	.word 0x81982b92  ! 815: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b92, %hpstate
	.word 0x97a549a4  ! 816: FDIVs	fdivs	%f21, %f4, %f11
	.word 0xd6d00e80  ! 817: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r11
change_to_randtl_67:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 818: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x91d02030  ! 819: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x91d02031  ! 820: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d9022cb  ! 821: WRPR_PSTATE_I	wrpr	%r0, 0x02cb, %pstate
	.word 0xad540000  ! 822: RDPR_GL	rdpr	%-, %r22
	.word 0x93902005  ! 823: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902ace  ! 824: WRPR_PSTATE_I	wrpr	%r0, 0x0ace, %pstate
	.word 0xb1b20fe0  ! 825: FONES	fones	%f24
	.word 0x3a800001  ! 826: BCC	bcc,a	<label_0x1>
	.word 0xb1a049db  ! 827: FDIVd	fdivd	%f32, %f58, %f24
change_to_tl1_68:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x816ac002  ! 829: SDIVX_R	sdivx	%r11, %r2, %r0
	.word 0xc017c000  ! 830: LDUH_R	lduh	[%r31 + %r0], %r0
DS_69:
	.word 0x22800001  ! 832: BE	be,a	<label_0x1>
	.word 0x20800001  ! 832: BN	bn,a	<label_0x1>
	.word 0xada00547  ! 832: FSQRTd	fsqrt	
	.word 0x95a08823  ! 831: FADDs	fadds	%f2, %f3, %f10
	.word 0x9b504000  ! 832: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x8d902cdc  ! 833: WRPR_PSTATE_I	wrpr	%r0, 0x0cdc, %pstate
	.word 0xa1902002  ! 834: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x20700001  ! 835: BPN	<illegal instruction>
	.word 0xa1902004  ! 836: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93902007  ! 837: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xda27c003  ! 838: STW_R	stw	%r13, [%r31 + %r3]
	.word 0x83d02034  ! 839: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x91d02031  ! 840: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81982281  ! 841: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0281, %hpstate
	.word 0x89508000  ! 842: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0x87902398  ! 843: WRPR_TT_I	wrpr	%r0, 0x0398, %tt
	.word 0x8d902256  ! 844: WRPR_PSTATE_I	wrpr	%r0, 0x0256, %pstate
	.word 0x9ba000cb  ! 845: FNEGd	fnegd	%f42, %f44
	.word 0x8d902883  ! 846: WRPR_PSTATE_I	wrpr	%r0, 0x0883, %pstate
	.word 0x87902090  ! 847: WRPR_TT_I	wrpr	%r0, 0x0090, %tt
	.word 0x93902005  ! 848: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xaaaec016  ! 849: ANDNcc_R	andncc 	%r27, %r22, %r21
	.word 0x90d16001  ! 850: UMULcc_I	umulcc 	%r5, 0x0001, %r8
	.word 0xd05fc000  ! 851: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x8d902ac2  ! 852: WRPR_PSTATE_I	wrpr	%r0, 0x0ac2, %pstate
	.word 0x9f802001  ! 853: SIR	sir	0x0001
	.word 0x81982957  ! 854: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0957, %hpstate
	.word 0xa6f8c01b  ! 855: SDIVcc_R	sdivcc 	%r3, %r27, %r19
	.word 0x93d02032  ! 856: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x99902003  ! 857: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x84f90001  ! 858: SDIVcc_R	sdivcc 	%r4, %r1, %r2
	.word 0xc4d804a0  ! 859: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0xa1902008  ! 860: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xb6854000  ! 861: ADDcc_R	addcc 	%r21, %r0, %r27
DS_70:
	.word 0x20800001  ! 863: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 862: SAVE_R	save	%r31, %r0, %r31
	.word 0x8198220f  ! 863: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020f, %hpstate
	.word 0x91d02031  ! 864: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902000  ! 865: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xb5508000  ! 866: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x99902005  ! 867: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x80db4016  ! 868: SMULcc_R	smulcc 	%r13, %r22, %r0
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xb0814006  ! 870: ADDcc_R	addcc 	%r5, %r6, %r24
	.word 0x3c800001  ! 871: BPOS	bpos,a	<label_0x1>
	.word 0x91d02034  ! 872: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902a01  ! 873: WRPR_PSTATE_I	wrpr	%r0, 0x0a01, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 874: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 875: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 876: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 877: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x30700001  ! 878: BPA	<illegal instruction>
	.word 0x879022aa  ! 879: WRPR_TT_I	wrpr	%r0, 0x02aa, %tt
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 880: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 881: Tcc_R	te	icc_or_xcc, %r0 + %r30
reduce_priv_level_71:
	.word 0x8f902002  ! 883: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 882: SIAM	siam	1
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 883: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902032  ! 884: WRPR_TT_I	wrpr	%r0, 0x0032, %tt
	.word 0xa1902009  ! 885: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xb2d46001  ! 886: UMULcc_I	umulcc 	%r17, 0x0001, %r25
	.word 0x93902007  ! 887: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x956a8010  ! 888: SDIVX_R	sdivx	%r10, %r16, %r10
	.word 0x93902006  ! 889: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_72:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 890: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xd4ffc030  ! 891: SWAPA_R	swapa	%r10, [%r31 + %r16] 0x01
	.word 0x9b51c000  ! 892: RDPR_TL	rdpr	%tl, %r13
	.word 0x81982e1f  ! 893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1f, %hpstate
	.word 0x9b494000  ! 894: RDHPR_HTBA	rdhpr	%htba, %r13
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 895: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5514000  ! 896: RDPR_TBA	rdpr	%tba, %r18
	.word 0xe47fe001  ! 897: SWAP_I	swap	%r18, [%r31 + 0x0001]
	.word 0x91d02031  ! 898: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x91d02031  ! 899: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902000  ! 900: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x8790203e  ! 902: WRPR_TT_I	wrpr	%r0, 0x003e, %tt
	.word 0xe41fc000  ! 903: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0xa1902002  ! 904: WRPR_GL_I	wrpr	%r0, 0x0002, %-
DS_73:
	.word 0x34800001  ! 906: BG	bg,a	<label_0x1>
	pdist %f14, %f16, %f24
	.word 0x91b1c307  ! 905: ALLIGNADDRESS	alignaddr	%r7, %r7, %r8
	.word 0x8fa0054c  ! 906: FSQRTd	fsqrt	
	.word 0x8b504000  ! 907: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0xca880e40  ! 908: LDUBA_R	lduba	[%r0, %r0] 0x72, %r5
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 909: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790222b  ! 910: WRPR_TT_I	wrpr	%r0, 0x022b, %tt
	.word 0x879021a7  ! 911: WRPR_TT_I	wrpr	%r0, 0x01a7, %tt
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 912: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x82d9c000  ! 913: SMULcc_R	smulcc 	%r7, %r0, %r1
	.word 0x83d02034  ! 914: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87802016  ! 915: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87802014  ! 916: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81982c03  ! 917: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c03, %hpstate
	.word 0x85b24ff2  ! 918: FONES	fones	%f2
	.word 0xc49004a0  ! 919: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	.word 0xa190200a  ! 920: WRPR_GL_I	wrpr	%r0, 0x000a, %-
DS_74:
	.word 0x34800001  ! 922: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 921: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982c10  ! 922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c10, %hpstate
	.word 0x91d02035  ! 923: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc4900e40  ! 924: LDUHA_R	lduha	[%r0, %r0] 0x72, %r2
	.word 0x8350c000  ! 925: RDPR_TT	rdpr	%tt, %r1
	.word 0x87902100  ! 926: WRPR_TT_I	wrpr	%r0, 0x0100, %tt
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 927: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 928: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa1902004  ! 929: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x879022ee  ! 930: WRPR_TT_I	wrpr	%r0, 0x02ee, %tt
	.word 0x87494000  ! 931: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0xa1902007  ! 932: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93702001  ! 933: POPC_I	popc	0x0001, %r9
	.word 0xa7a01a67  ! 934: FqTOi	fqtoi	
	.word 0xa1902008  ! 935: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x83d02031  ! 936: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xafa0054b  ! 937: FSQRTd	fsqrt	
	.word 0xabb08ff6  ! 938: FONES	fones	%f21
	.word 0x9b494000  ! 939: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0x93902004  ! 940: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902003  ! 941: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_75:
	.word 0x34800001  ! 943: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 942: SAVE_R	save	%r31, %r0, %r31
	.word 0x89a01a6a  ! 943: FqTOi	fqtoi	
	.word 0x93902001  ! 944: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802010  ! 945: WRASI_I	wr	%r0, 0x0010, %asi
DS_76:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 946: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xb4fda001  ! 947: SDIVcc_I	sdivcc 	%r22, 0x0001, %r26
	.word 0xf42fe001  ! 948: STB_I	stb	%r26, [%r31 + 0x0001]
	.word 0x8d51c000  ! 949: RDPR_TL	rdpr	%tl, %r6
	.word 0x93902001  ! 950: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87902196  ! 951: WRPR_TT_I	wrpr	%r0, 0x0196, %tt
	.word 0x87802004  ! 952: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902002  ! 954: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902006  ! 955: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xccc804a0  ! 956: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r6
	.word 0xa1902001  ! 957: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_77:
	.word 0x20800001  ! 959: BN	bn,a	<label_0x1>
	.word 0xc3364014  ! 959: STQF_R	-	%f1, [%r20, %r25]
	normalw
	.word 0xaf458000  ! 958: RD_SOFTINT_REG	rd	%softint, %r23
	.word 0x93902005  ! 959: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x82a90009  ! 960: ANDNcc_R	andncc 	%r4, %r9, %r1
	.word 0xa1902001  ! 961: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_78:
	.word 0x34800001  ! 963: BG	bg,a	<label_0x1>
	.word 0xf7334003  ! 963: STQF_R	-	%f27, [%r3, %r13]
	normalw
	.word 0xb3458000  ! 962: RD_SOFTINT_REG	rd	%softint, %r25
	.word 0xb5b2cfe2  ! 963: FONES	fones	%f26
	.word 0x81982545  ! 964: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0545, %hpstate
	.word 0xf4cfe030  ! 965: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r26
change_to_randtl_79:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902002  ! 966: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x819821c2  ! 967: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c2, %hpstate
	.word 0xf4c804a0  ! 968: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r26
	.word 0x8790209a  ! 969: WRPR_TT_I	wrpr	%r0, 0x009a, %tt
	.word 0xf48008a0  ! 970: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0x8d90241d  ! 971: WRPR_PSTATE_I	wrpr	%r0, 0x041d, %pstate
	.word 0x93902003  ! 972: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d802000  ! 973: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902005  ! 974: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 975: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x85540000  ! 976: RDPR_GL	rdpr	%-, %r2
	.word 0x93902004  ! 977: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902002  ! 978: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f802001  ! 979: SIR	sir	0x0001
	.word 0x81982785  ! 980: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0785, %hpstate
	.word 0x93902003  ! 981: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81a00549  ! 982: FSQRTd	fsqrt	
	.word 0x879023b9  ! 983: WRPR_TT_I	wrpr	%r0, 0x03b9, %tt
	.word 0x92698001  ! 984: UDIVX_R	udivx 	%r6, %r1, %r9
	.word 0x93902004  ! 985: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9281e001  ! 986: ADDcc_I	addcc 	%r7, 0x0001, %r9
	.word 0x8ba149e7  ! 987: FDIVq	dis not found

	.word 0x87802016  ! 988: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xca27c007  ! 989: STW_R	stw	%r5, [%r31 + %r7]
	.word 0x8790226e  ! 990: WRPR_TT_I	wrpr	%r0, 0x026e, %tt
change_to_randtl_80:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 991: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x819829c7  ! 992: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c7, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 993: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 994: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 995: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790202c  ! 996: WRPR_TT_I	wrpr	%r0, 0x002c, %tt
	.word 0x8790226a  ! 997: WRPR_TT_I	wrpr	%r0, 0x026a, %tt
	.word 0x91d02035  ! 998: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_81:
	.word 0x22800001  ! 1000: BE	be,a	<label_0x1>
	allclean
	.word 0x95b08319  ! 999: ALLIGNADDRESS	alignaddr	%r2, %r25, %r10
	.word 0x91d02035  ! 1000: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd457c000  ! 1001: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0xa1902009  ! 1002: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x926ce001  ! 1003: UDIVX_I	udivx 	%r19, 0x0001, %r9
	.word 0x87802004  ! 1004: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902acb  ! 1005: WRPR_PSTATE_I	wrpr	%r0, 0x0acb, %pstate
	.word 0x879020ed  ! 1006: WRPR_TT_I	wrpr	%r0, 0x00ed, %tt
	.word 0x879022e0  ! 1007: WRPR_TT_I	wrpr	%r0, 0x02e0, %tt
	.word 0x8da000c2  ! 1008: FNEGd	fnegd	%f2, %f6
	.word 0xcc8008a0  ! 1009: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x93a1c9d5  ! 1010: FDIVd	fdivd	%f38, %f52, %f40
	.word 0xa190200f  ! 1011: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x83d02030  ! 1012: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x91d02031  ! 1013: Tcc_I	ta	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_PRIV	! macro
	.word 0x97a649b1  ! 1015: FDIVs	fdivs	%f25, %f17, %f11
	.word 0xd737c011  ! 1016: STQF_R	-	%f11, [%r17, %r31]
	.word 0x8d9022cd  ! 1017: WRPR_PSTATE_I	wrpr	%r0, 0x02cd, %pstate
	.word 0xd6d80e80  ! 1018: LDXA_R	ldxa	[%r0, %r0] 0x74, %r11
	.word 0x819824c8  ! 1019: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c8, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1020: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02030  ! 1021: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xa3540000  ! 1022: RDPR_GL	rdpr	%-, %r17
	.word 0x81982d0b  ! 1023: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0b, %hpstate
	.word 0xe2cfe020  ! 1024: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r17
	.word 0xa1902005  ! 1025: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x9f802001  ! 1026: SIR	sir	0x0001
reduce_priv_level_82:
	.word 0x8f902001  ! 1028: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 1027: SIAM	siam	1
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1028: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8fa0054c  ! 1029: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200e  ! 1031: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d9022c4  ! 1032: WRPR_PSTATE_I	wrpr	%r0, 0x02c4, %pstate
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1033: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 1034: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1035: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81480000  ! 1036: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0x99902001  ! 1037: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
change_to_tl1_83:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1039: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 1040: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x3e800001  ! 1041: BVC	bvc,a	<label_0x1>
	.word 0x8d902881  ! 1042: WRPR_PSTATE_I	wrpr	%r0, 0x0881, %pstate
	.word 0x8686e001  ! 1043: ADDcc_I	addcc 	%r27, 0x0001, %r3
	.word 0x81982f0b  ! 1044: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0b, %hpstate
	.word 0x8d90200f  ! 1045: WRPR_PSTATE_I	wrpr	%r0, 0x000f, %pstate
	.word 0xb6822001  ! 1046: ADDcc_I	addcc 	%r8, 0x0001, %r27
	.word 0x83508000  ! 1047: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x93d02030  ! 1048: Tcc_I	tne	icc_or_xcc, %r0 + 48
change_to_randtl_84:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1049: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa1902001  ! 1050: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa1902000  ! 1051: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d02031  ! 1052: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x91d02034  ! 1053: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902005  ! 1054: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x9f802001  ! 1055: SIR	sir	0x0001
	.word 0xa190200c  ! 1056: WRPR_GL_I	wrpr	%r0, 0x000c, %-
change_to_tl1_85:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x83d02035  ! 1058: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x93902004  ! 1059: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902000  ! 1060: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87902380  ! 1061: WRPR_TT_I	wrpr	%r0, 0x0380, %tt
	.word 0x8d902652  ! 1062: WRPR_PSTATE_I	wrpr	%r0, 0x0652, %pstate
DS_86:
	.word 0x20800001  ! 1064: BN	bn,a	<label_0x1>
	pdist %f14, %f16, %f20
	.word 0x81b6c310  ! 1063: ALLIGNADDRESS	alignaddr	%r27, %r16, %r0
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1064: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 1065: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1066: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 1067: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x83d02030  ! 1068: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x879020e8  ! 1069: WRPR_TT_I	wrpr	%r0, 0x00e8, %tt
	.word 0x8d90289d  ! 1070: WRPR_PSTATE_I	wrpr	%r0, 0x089d, %pstate
	.word 0xc08fe010  ! 1071: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r0
	.word 0x8d90288f  ! 1072: WRPR_PSTATE_I	wrpr	%r0, 0x088f, %pstate
	.word 0x81982c8b  ! 1073: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8b, %hpstate
	.word 0x826e4017  ! 1074: UDIVX_R	udivx 	%r25, %r23, %r1
	.word 0x8d90248e  ! 1075: WRPR_PSTATE_I	wrpr	%r0, 0x048e, %pstate
DS_87:
	.word 0x22800001  ! 1077: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1076: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93a01a67  ! 1077: FqTOi	fqtoi	
	.word 0x38700001  ! 1078: BPGU	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9551c000  ! 1080: RDPR_TL	rdpr	%tl, %r10
	.word 0x83d02033  ! 1081: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x879023cd  ! 1082: WRPR_TT_I	wrpr	%r0, 0x03cd, %tt
	.word 0x93d02035  ! 1083: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x87802004  ! 1084: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982d95  ! 1085: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d95, %hpstate
	.word 0x8790214e  ! 1086: WRPR_TT_I	wrpr	%r0, 0x014e, %tt
	.word 0x85a0054a  ! 1087: FSQRTd	fsqrt	
	.word 0xc4800bc0  ! 1088: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r2
	.word 0x87802089  ! 1089: WRASI_I	wr	%r0, 0x0089, %asi
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1090: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790232a  ! 1091: WRPR_TT_I	wrpr	%r0, 0x032a, %tt
	.word 0x8b50c000  ! 1092: RDPR_TT	rdpr	%tt, %r5
	.word 0x99902004  ! 1093: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1094: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa0fa0002  ! 1095: SDIVcc_R	sdivcc 	%r8, %r2, %r16
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1097: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0d00e80  ! 1098: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r16
	.word 0xa190200f  ! 1099: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa1902007  ! 1100: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xb66ca001  ! 1101: UDIVX_I	udivx 	%r18, 0x0001, %r27
	.word 0x93d02034  ! 1102: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x93902004  ! 1103: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902095  ! 1104: WRPR_PSTATE_I	wrpr	%r0, 0x0095, %pstate
	.word 0x89508000  ! 1105: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0xc88008a0  ! 1106: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x83d02034  ! 1107: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xc857e001  ! 1108: LDSH_I	ldsh	[%r31 + 0x0001], %r4
	.word 0x8790225a  ! 1109: WRPR_TT_I	wrpr	%r0, 0x025a, %tt
	.word 0xc8c7e000  ! 1110: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r4
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9022d1  ! 1112: WRPR_PSTATE_I	wrpr	%r0, 0x02d1, %pstate
	.word 0x91d02035  ! 1113: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879020bf  ! 1115: WRPR_TT_I	wrpr	%r0, 0x00bf, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc827e001  ! 1117: STW_I	stw	%r4, [%r31 + 0x0001]
	.word 0x8d902ac2  ! 1118: WRPR_PSTATE_I	wrpr	%r0, 0x0ac2, %pstate
	.word 0x8198211c  ! 1119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011c, %hpstate
	.word 0x89b4cfe4  ! 1120: FONES	fones	%f4
	.word 0x99500000  ! 1121: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x879022da  ! 1122: WRPR_TT_I	wrpr	%r0, 0x02da, %tt
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1123: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902a99  ! 1124: WRPR_PSTATE_I	wrpr	%r0, 0x0a99, %pstate
	.word 0x8790205c  ! 1125: WRPR_TT_I	wrpr	%r0, 0x005c, %tt
	.word 0x819825c1  ! 1126: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c1, %hpstate
	.word 0x8d902ed0  ! 1127: WRPR_PSTATE_I	wrpr	%r0, 0x0ed0, %pstate
	.word 0xa1902002  ! 1128: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x83d02030  ! 1129: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xa190200a  ! 1130: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1131: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1132: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a049a9  ! 1133: FDIVs	fdivs	%f1, %f9, %f11
change_to_tl1_88:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xd647c000  ! 1135: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0x8d90244a  ! 1136: WRPR_PSTATE_I	wrpr	%r0, 0x044a, %pstate
	.word 0x83d02032  ! 1137: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d902e1c  ! 1138: WRPR_PSTATE_I	wrpr	%r0, 0x0e1c, %pstate
	.word 0x91702001  ! 1139: POPC_I	popc	0x0001, %r8
	.word 0x81982d8e  ! 1140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8e, %hpstate
	.word 0xa1902009  ! 1141: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd05fe001  ! 1142: LDX_I	ldx	[%r31 + 0x0001], %r8
	.word 0xd05fc000  ! 1143: LDX_R	ldx	[%r31 + %r0], %r8
	.word 0x85702001  ! 1144: POPC_I	popc	0x0001, %r2
	.word 0x8d90220e  ! 1145: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
	.word 0x8d90261f  ! 1146: WRPR_PSTATE_I	wrpr	%r0, 0x061f, %pstate
	.word 0xa1902000  ! 1147: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_89:
	.word 0x32800001  ! 1149: BNE	bne,a	<label_0x1>
	.word 0xd1356001  ! 1149: STQF_I	-	%f8, [0x0001, %r21]
	normalw
	.word 0x9b458000  ! 1148: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8ba01a61  ! 1149: FqTOi	fqtoi	
	.word 0x97500000  ! 1150: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x91d02034  ! 1151: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d9028d2  ! 1152: WRPR_PSTATE_I	wrpr	%r0, 0x08d2, %pstate
change_to_randtl_90:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1153: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91a14d2a  ! 1154: FsMULd	fsmuld	%f5, %f10, %f8
	.word 0x90fa8006  ! 1155: SDIVcc_R	sdivcc 	%r10, %r6, %r8
	.word 0xa1902002  ! 1156: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x906c6001  ! 1157: UDIVX_I	udivx 	%r17, 0x0001, %r8
	.word 0x87504000  ! 1158: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x9f802001  ! 1159: SIR	sir	0x0001
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1160: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83504000  ! 1161: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0xc2800b00  ! 1162: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r1
	.word 0x81982a49  ! 1163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a49, %hpstate
	.word 0x9ad2c017  ! 1164: UMULcc_R	umulcc 	%r11, %r23, %r13
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1165: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902001  ! 1166: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x819826cb  ! 1167: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cb, %hpstate
DS_91:
	.word 0x34800001  ! 1169: BG	bg,a	<label_0x1>
	pdist %f4, %f10, %f26
	.word 0x9bb10315  ! 1168: ALLIGNADDRESS	alignaddr	%r4, %r21, %r13
	.word 0xa190200f  ! 1169: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xdbe7c035  ! 1170: CASA_I	casa	[%r31] 0x 1, %r21, %r13
	.word 0x89a1c9f7  ! 1171: FDIVq	dis not found

	.word 0x856a8003  ! 1172: SDIVX_R	sdivx	%r10, %r3, %r2
	.word 0x9f802001  ! 1173: SIR	sir	0x0001
	.word 0xc437e001  ! 1174: STH_I	sth	%r2, [%r31 + 0x0001]
	.word 0xa1902000  ! 1175: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x93d02034  ! 1176: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x91d02030  ! 1177: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x879020e0  ! 1178: WRPR_TT_I	wrpr	%r0, 0x00e0, %tt
	.word 0x95a5c9ca  ! 1179: FDIVd	fdivd	%f54, %f10, %f10
	.word 0x87802088  ! 1180: WRASI_I	wr	%r0, 0x0088, %asi
change_to_randtl_92:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1181: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93480000  ! 1182: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1183: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 1184: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xb5500000  ! 1185: RDPR_TPC	rdpr	%tpc, %r26
change_to_randtl_93:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1186: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x93902000  ! 1187: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x98d12001  ! 1188: UMULcc_I	umulcc 	%r4, 0x0001, %r12
	.word 0xa6d9800a  ! 1189: SMULcc_R	smulcc 	%r6, %r10, %r19
DS_94:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1190: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1191: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1192: WRFPRS_I	wr	%r0, 0x0000, %fprs
reduce_priv_level_95:
	.word 0x8f902000  ! 1194: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8ba01965  ! 1193: FqTOd	dis not found

	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1194: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83504000  ! 1195: RDPR_TNPC	rdpr	%tnpc, %r1
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1196: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1197: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1a349f6  ! 1198: FDIVq	dis not found

	.word 0x91d02035  ! 1199: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe09fe001  ! 1200: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
	.word 0x90d6a001  ! 1201: UMULcc_I	umulcc 	%r26, 0x0001, %r8
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1202: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9482e001  ! 1203: ADDcc_I	addcc 	%r11, 0x0001, %r10
	.word 0x87802004  ! 1204: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa1902007  ! 1205: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd477c016  ! 1206: STX_R	stx	%r10, [%r31 + %r22]
	.word 0xb268001b  ! 1207: UDIVX_R	udivx 	%r0, %r27, %r25
	.word 0xb3a00552  ! 1208: FSQRTd	fsqrt	
	.word 0x8ed1e001  ! 1209: UMULcc_I	umulcc 	%r7, 0x0001, %r7
	.word 0x87902326  ! 1210: WRPR_TT_I	wrpr	%r0, 0x0326, %tt
	.word 0x87802080  ! 1211: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xb5a00578  ! 1212: FSQRTq	fsqrt	
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1213: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf597e001  ! 1214: LDQFA_I	-	[%r31, 0x0001], %f26
	.word 0x8790211a  ! 1215: WRPR_TT_I	wrpr	%r0, 0x011a, %tt
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1216: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf477e001  ! 1217: STX_I	stx	%r26, [%r31 + 0x0001]
	.word 0x8d902289  ! 1218: WRPR_PSTATE_I	wrpr	%r0, 0x0289, %pstate
	.word 0x9f802001  ! 1219: SIR	sir	0x0001
	.word 0x8cd48008  ! 1220: UMULcc_R	umulcc 	%r18, %r8, %r6
	.word 0x93902005  ! 1221: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xccffc028  ! 1222: SWAPA_R	swapa	%r6, [%r31 + %r8] 0x01
	.word 0x91d02031  ! 1223: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x819823c3  ! 1224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c3, %hpstate
	.word 0x93902000  ! 1225: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902008  ! 1226: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93902007  ! 1227: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x96da800a  ! 1228: SMULcc_R	smulcc 	%r10, %r10, %r11
	.word 0x93902001  ! 1229: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902004  ! 1230: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa190200a  ! 1231: WRPR_GL_I	wrpr	%r0, 0x000a, %-
change_to_randtl_96:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1232: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xd63fe001  ! 1233: STD_I	std	%r11, [%r31 + 0x0001]
	.word 0xd69fc020  ! 1234: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
change_to_tl1_97:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1236: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 1237: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8f51c000  ! 1238: RDPR_TL	rdpr	%tl, %r7
	.word 0x8198275d  ! 1239: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075d, %hpstate
reduce_priv_level_98:
	.word 0x8f902000  ! 1241: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 1240: SIAM	siam	1
	.word 0xcf3fc00a  ! 1241: STDF_R	std	%f7, [%r10, %r31]
	.word 0x91d02030  ! 1242: Tcc_I	ta	icc_or_xcc, %r0 + 48
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1243: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1244: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7514000  ! 1245: RDPR_TBA	rdpr	%tba, %r19
	.word 0x93d02031  ! 1246: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x93902000  ! 1247: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1248: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 1249: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902003  ! 1250: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_99:
	.word 0x22800001  ! 1252: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1252: BE	be,a	<label_0x1>
	.word 0xe516c012  ! 1252: LDQF_R	-	[%r27, %r18], %f18
	.word 0x8da2482a  ! 1251: FADDs	fadds	%f9, %f10, %f6
	.word 0x8f51c000  ! 1252: RDPR_TL	rdpr	%tl, %r7
	.word 0xb1514000  ! 1253: RDPR_TBA	rdpr	%tba, %r24
	.word 0xa0adc01a  ! 1254: ANDNcc_R	andncc 	%r23, %r26, %r16
	.word 0x91d02034  ! 1255: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902008  ! 1257: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x81982d99  ! 1258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d99, %hpstate
	.word 0x93902006  ! 1259: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f802001  ! 1260: SIR	sir	0x0001
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1261: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87504000  ! 1262: RDPR_TNPC	rdpr	%tnpc, %r3
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1263: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1264: Tcc_R	te	icc_or_xcc, %r0 + %r30
reduce_priv_level_100:
	.word 0x8f902000  ! 1266: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89820000  ! 1265: WRTICK_R	wr	%r8, %r0, %tick
	.word 0x8d902ac9  ! 1266: WRPR_PSTATE_I	wrpr	%r0, 0x0ac9, %pstate
	.word 0x81982152  ! 1267: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0152, %hpstate
	.word 0x879023c6  ! 1268: WRPR_TT_I	wrpr	%r0, 0x03c6, %tt
	.word 0xa1902005  ! 1269: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8fa00545  ! 1270: FSQRTd	fsqrt	
	.word 0x8ec12001  ! 1271: ADDCcc_I	addccc 	%r4, 0x0001, %r7
	.word 0xa1902006  ! 1272: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902001  ! 1273: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa190200c  ! 1274: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879021e3  ! 1276: WRPR_TT_I	wrpr	%r0, 0x01e3, %tt
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1277: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 1278: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xcedfe010  ! 1279: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r7
	.word 0x93902006  ! 1280: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902cc0  ! 1281: WRPR_PSTATE_I	wrpr	%r0, 0x0cc0, %pstate
	.word 0xb680c018  ! 1282: ADDcc_R	addcc 	%r3, %r24, %r27
	.word 0x8d902c86  ! 1283: WRPR_PSTATE_I	wrpr	%r0, 0x0c86, %pstate
	.word 0x93902005  ! 1284: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93d02032  ! 1285: Tcc_I	tne	icc_or_xcc, %r0 + 50
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1286: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 1287: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87a189e3  ! 1288: FDIVq	dis not found

	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1289: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6800c60  ! 1290: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r3
	.word 0xc65fe001  ! 1291: LDX_I	ldx	[%r31 + 0x0001], %r3
	.word 0x886b2001  ! 1292: UDIVX_I	udivx 	%r12, 0x0001, %r4
	.word 0xa1902009  ! 1293: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1294: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1a50d23  ! 1295: FsMULd	fsmuld	%f20, %f34, %f16
	.word 0x91d02034  ! 1296: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902416  ! 1297: WRPR_PSTATE_I	wrpr	%r0, 0x0416, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1298: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 1299: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa9500000  ! 1300: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x879020ef  ! 1301: WRPR_TT_I	wrpr	%r0, 0x00ef, %tt
change_to_tl1_101:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xb0810004  ! 1303: ADDcc_R	addcc 	%r4, %r4, %r24
	.word 0x93d02033  ! 1304: Tcc_I	tne	icc_or_xcc, %r0 + 51
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1305: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xf0d00e40  ! 1306: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r24
	.word 0xa0a8400c  ! 1307: ANDNcc_R	andncc 	%r1, %r12, %r16
	.word 0x93902000  ! 1308: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1309: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe0d7e030  ! 1310: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1311: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb4c36001  ! 1312: ADDCcc_I	addccc 	%r13, 0x0001, %r26
	.word 0x87902026  ! 1313: WRPR_TT_I	wrpr	%r0, 0x0026, %tt
change_to_randtl_102:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1314: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xf53fc00c  ! 1315: STDF_R	std	%f26, [%r12, %r31]
	.word 0x93902001  ! 1316: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9b702001  ! 1317: POPC_I	popc	0x0001, %r13
	.word 0x93902007  ! 1318: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99902003  ! 1319: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
change_to_tl1_103:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x819824db  ! 1321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04db, %hpstate
	.word 0x87802004  ! 1322: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xb1494000  ! 1323: RDHPR_HTBA	rdhpr	%htba, %r24
	.word 0x93902003  ! 1324: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xf0c7e010  ! 1326: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r24
	.word 0x81982956  ! 1327: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0956, %hpstate
change_to_tl1_104:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d90204e  ! 1329: WRPR_PSTATE_I	wrpr	%r0, 0x004e, %pstate
	.word 0x81540000  ! 1330: RDPR_GL	rdpr	%-, %r0
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8198279a  ! 1332: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079a, %hpstate
	.word 0x8d902a03  ! 1333: WRPR_PSTATE_I	wrpr	%r0, 0x0a03, %pstate
	.word 0x93902002  ! 1334: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x95b40fe1  ! 1335: FONES	fones	%f10
	.word 0xb0d90012  ! 1336: SMULcc_R	smulcc 	%r4, %r18, %r24
	.word 0x83d02033  ! 1337: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x93902006  ! 1338: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8db20ff7  ! 1339: FONES	fones	%f6
	.word 0xa1480000  ! 1340: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0xe0dfe020  ! 1341: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r16
	.word 0xa190200e  ! 1342: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8f508000  ! 1343: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0x87802004  ! 1344: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8f494000  ! 1345: RDHPR_HTBA	rdhpr	%htba, %r7
	.word 0xb351c000  ! 1346: RDPR_TL	rdpr	%tl, %r25
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1347: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf2dfe020  ! 1348: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r25
	.word 0xa1902000  ! 1349: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xb3b34fe5  ! 1350: FONES	fones	%f25
	.word 0x91d02032  ! 1351: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1352: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 1353: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81982846  ! 1354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0846, %hpstate
	.word 0x8d902e98  ! 1355: WRPR_PSTATE_I	wrpr	%r0, 0x0e98, %pstate
	.word 0x81982d81  ! 1356: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d81, %hpstate
	.word 0x93902006  ! 1357: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x83d02031  ! 1358: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x87802004  ! 1359: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x85540000  ! 1360: RDPR_GL	rdpr	%-, %r2
	.word 0x93d02031  ! 1361: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8790208f  ! 1362: WRPR_TT_I	wrpr	%r0, 0x008f, %tt
DS_105:
	.word 0x20800001  ! 1364: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1363: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x89500000  ! 1364: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x24800001  ! 1365: BLE	ble,a	<label_0x1>
	.word 0x91d02030  ! 1366: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xb7514000  ! 1367: RDPR_TBA	rdpr	%tba, %r27
	.word 0xb66ac014  ! 1368: UDIVX_R	udivx 	%r11, %r20, %r27
	.word 0x81982680  ! 1369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0680, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902052  ! 1371: WRPR_PSTATE_I	wrpr	%r0, 0x0052, %pstate
	.word 0xf7e7c034  ! 1372: CASA_I	casa	[%r31] 0x 1, %r20, %r27
	.word 0x8f500000  ! 1373: RDPR_TPC	rdpr	%tpc, %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8790222a  ! 1375: WRPR_TT_I	wrpr	%r0, 0x022a, %tt
	.word 0x83d02030  ! 1376: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x93902001  ! 1377: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81494000  ! 1378: RDHPR_HTBA	rdhpr	%htba, %r0
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1379: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 1380: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d508000  ! 1381: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0xccdfe000  ! 1382: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
	.word 0x9f802001  ! 1383: SIR	sir	0x0001
	.word 0x93902002  ! 1384: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02035  ! 1385: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902216  ! 1386: WRPR_PSTATE_I	wrpr	%r0, 0x0216, %pstate
	.word 0x85504000  ! 1387: RDPR_TNPC	rdpr	%tnpc, %r2
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1388: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3a700001  ! 1389: BPCC	<illegal instruction>
	.word 0xc48804a0  ! 1390: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0x8d902054  ! 1391: WRPR_PSTATE_I	wrpr	%r0, 0x0054, %pstate
	.word 0x83514000  ! 1392: RDPR_TBA	rdpr	%tba, %r1
	.word 0x8790208b  ! 1393: WRPR_TT_I	wrpr	%r0, 0x008b, %tt
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1394: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb2c06001  ! 1395: ADDCcc_I	addccc 	%r1, 0x0001, %r25
	.word 0xa8fe2001  ! 1396: SDIVcc_I	sdivcc 	%r24, 0x0001, %r20
	.word 0x91d02031  ! 1397: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa1902004  ! 1398: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x879023e9  ! 1399: WRPR_TT_I	wrpr	%r0, 0x03e9, %tt
	.word 0x8198298d  ! 1400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098d, %hpstate
	.word 0x8d902449  ! 1401: WRPR_PSTATE_I	wrpr	%r0, 0x0449, %pstate
	.word 0x87802004  ! 1402: WRASI_I	wr	%r0, 0x0004, %asi
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1403: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982e0d  ! 1404: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0d, %hpstate
	.word 0xa1902006  ! 1405: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xe857e001  ! 1406: LDSH_I	ldsh	[%r31 + 0x0001], %r20
	.word 0xb3504000  ! 1407: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x819822ce  ! 1408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02ce, %hpstate
	.word 0x8d90261a  ! 1409: WRPR_PSTATE_I	wrpr	%r0, 0x061a, %pstate
DS_106:
	.word 0x20800001  ! 1411: BN	bn,a	<label_0x1>
	.word 0xcb368009  ! 1411: STQF_R	-	%f5, [%r9, %r26]
	normalw
	.word 0x8f458000  ! 1410: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x93514000  ! 1411: RDPR_TBA	rdpr	%tba, %r9
	.word 0x34800001  ! 1412: BG	bg,a	<label_0x1>
	.word 0x8da01a63  ! 1413: FqTOi	fqtoi	
	.word 0x8d902e91  ! 1414: WRPR_PSTATE_I	wrpr	%r0, 0x0e91, %pstate
	.word 0x8b494000  ! 1415: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0x86fec016  ! 1416: SDIVcc_R	sdivcc 	%r27, %r22, %r3
	.word 0x9f802001  ! 1417: SIR	sir	0x0001
change_to_tl1_107:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9f802001  ! 1419: SIR	sir	0x0001
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1420: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95a289ad  ! 1421: FDIVs	fdivs	%f10, %f13, %f10
	.word 0x81982ccf  ! 1422: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ccf, %hpstate
	.word 0x8b480000  ! 1423: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0xca800be0  ! 1424: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r5
	.word 0x2a800001  ! 1425: BCS	bcs,a	<label_0x1>
	.word 0x99902004  ! 1426: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x93902002  ! 1427: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902002  ! 1428: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8da01a62  ! 1429: FqTOi	fqtoi	
	.word 0xa1902007  ! 1430: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x91d02030  ! 1431: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xccc004a0  ! 1432: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0x90d50003  ! 1433: UMULcc_R	umulcc 	%r20, %r3, %r8
	.word 0x879022fb  ! 1434: WRPR_TT_I	wrpr	%r0, 0x02fb, %tt
	.word 0x93902000  ! 1435: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902003  ! 1436: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902000  ! 1437: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02032  ! 1438: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d90205c  ! 1439: WRPR_PSTATE_I	wrpr	%r0, 0x005c, %pstate
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1440: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x92488009  ! 1441: MULX_R	mulx 	%r2, %r9, %r9
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1442: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd2c7e030  ! 1443: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r9
	.word 0xa26de001  ! 1444: UDIVX_I	udivx 	%r23, 0x0001, %r17
reduce_priv_level_108:
	.word 0x8f902000  ! 1446: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb36e2001  ! 1445: SDIVX_I	sdivx	%r24, 0x0001, %r25
	.word 0x91d02032  ! 1446: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xf28008a0  ! 1447: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0xf23fc009  ! 1448: STD_R	std	%r25, [%r31 + %r9]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902a0f  ! 1450: WRPR_PSTATE_I	wrpr	%r0, 0x0a0f, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879020c8  ! 1452: WRPR_TT_I	wrpr	%r0, 0x00c8, %tt
	.word 0xb3480000  ! 1453: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x87802004  ! 1454: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802089  ! 1455: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8fa01a76  ! 1456: FqTOi	fqtoi	
	.word 0x99902003  ! 1457: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x81982393  ! 1458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0393, %hpstate
	.word 0x9f802001  ! 1459: SIR	sir	0x0001
	.word 0xa190200e  ! 1460: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1902000  ! 1462: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xcf37c016  ! 1463: STQF_R	-	%f7, [%r22, %r31]
	.word 0x95b04fe0  ! 1464: FONES	fones	%f10
	.word 0xa1902003  ! 1465: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xad480000  ! 1466: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0xec8008a0  ! 1467: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0xa190200b  ! 1468: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x87a2cd24  ! 1469: FsMULd	fsmuld	%f11, %f4, %f34
change_to_randtl_109:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1470: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xc6900e80  ! 1471: LDUHA_R	lduha	[%r0, %r0] 0x74, %r3
	.word 0x9f802001  ! 1472: SIR	sir	0x0001
	.word 0xc69fe001  ! 1473: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
	.word 0xa190200b  ! 1474: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_110:
	.word 0x34800001  ! 1476: BG	bg,a	<label_0x1>
	.word 0xdb35800c  ! 1476: STQF_R	-	%f13, [%r12, %r22]
	normalw
	.word 0x95458000  ! 1475: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x80f9c016  ! 1476: SDIVcc_R	sdivcc 	%r7, %r22, %r0
	.word 0x8d90228d  ! 1477: WRPR_PSTATE_I	wrpr	%r0, 0x028d, %pstate
	.word 0x91d02032  ! 1478: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_111:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1479: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
DS_112:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1480: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xa190200a  ! 1481: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d902c8c  ! 1482: WRPR_PSTATE_I	wrpr	%r0, 0x0c8c, %pstate
	.word 0xa3b0cff7  ! 1483: FONES	fones	%f17
	.word 0x8d9020c7  ! 1484: WRPR_PSTATE_I	wrpr	%r0, 0x00c7, %pstate
	.word 0xaba149f7  ! 1485: FDIVq	dis not found

	.word 0xb4822001  ! 1486: ADDcc_I	addcc 	%r8, 0x0001, %r26
	.word 0x87802089  ! 1487: WRASI_I	wr	%r0, 0x0089, %asi
DS_113:
	.word 0x32800001  ! 1489: BNE	bne,a	<label_0x1>
	pdist %f18, %f18, %f6
	.word 0x93b44313  ! 1488: ALLIGNADDRESS	alignaddr	%r17, %r19, %r9
	.word 0x8790218e  ! 1489: WRPR_TT_I	wrpr	%r0, 0x018e, %tt
	.word 0x83a00552  ! 1490: FSQRTd	fsqrt	
	.word 0xb5a649e2  ! 1491: FDIVq	dis not found

	.word 0x81982e5a  ! 1492: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5a, %hpstate
	.word 0x93902002  ! 1493: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x924e4000  ! 1494: MULX_R	mulx 	%r25, %r0, %r9
	.word 0x93902000  ! 1495: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982816  ! 1496: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0816, %hpstate
	.word 0x83d02031  ! 1497: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x879022bc  ! 1498: WRPR_TT_I	wrpr	%r0, 0x02bc, %tt
	.word 0x93902000  ! 1499: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xad480000  ! 1500: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0x9ad68017  ! 1501: UMULcc_R	umulcc 	%r26, %r23, %r13
	.word 0x87802016  ! 1502: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x966dc006  ! 1503: UDIVX_R	udivx 	%r23, %r6, %r11
	.word 0xb2c5a001  ! 1504: ADDCcc_I	addccc 	%r22, 0x0001, %r25
reduce_priv_level_114:
	.word 0x8f902000  ! 1506: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 1505: SIAM	siam	1
	.word 0xa1902006  ! 1506: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8198219b  ! 1507: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019b, %hpstate
	.word 0x8ba00547  ! 1508: FSQRTd	fsqrt	
	.word 0x81982b81  ! 1509: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b81, %hpstate
	.word 0x8198225a  ! 1510: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025a, %hpstate
	.word 0xca800b60  ! 1511: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r5
	.word 0x93902003  ! 1512: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_115:
	.word 0x34800001  ! 1514: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1513: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902006  ! 1514: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x91d02033  ! 1515: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d802000  ! 1516: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d02035  ! 1517: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x87902393  ! 1518: WRPR_TT_I	wrpr	%r0, 0x0393, %tt
	.word 0x9950c000  ! 1519: RDPR_TT	rdpr	%tt, %r12
	.word 0xd88804a0  ! 1520: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x819821d6  ! 1521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d6, %hpstate
	.word 0x8af8e001  ! 1522: SDIVcc_I	sdivcc 	%r3, 0x0001, %r5
	.word 0x826ca001  ! 1523: UDIVX_I	udivx 	%r18, 0x0001, %r1
change_to_tl1_116:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1525: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982bd3  ! 1526: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd3, %hpstate
	.word 0x91d02030  ! 1527: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8198268d  ! 1528: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068d, %hpstate
	.word 0xc337e001  ! 1529: STQF_I	-	%f1, [0x0001, %r31]
	.word 0xc28804a0  ! 1530: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	.word 0x81982e9e  ! 1531: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9e, %hpstate
	.word 0x96d6a001  ! 1532: UMULcc_I	umulcc 	%r26, 0x0001, %r11
	.word 0x819827d4  ! 1533: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d4, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83d02033  ! 1535: Tcc_I	te	icc_or_xcc, %r0 + 51
DS_117:
	.word 0x20800001  ! 1537: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1537: BG	bg,a	<label_0x1>
	.word 0x89a00549  ! 1537: FSQRTd	fsqrt	
	.word 0x85a10829  ! 1536: FADDs	fadds	%f4, %f9, %f2
	.word 0x93540000  ! 1537: RDPR_GL	rdpr	%-, %r9
	.word 0xa7508000  ! 1538: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x20800001  ! 1539: BN	bn,a	<label_0x1>
	.word 0x93902001  ! 1540: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8350c000  ! 1541: RDPR_TT	rdpr	%tt, %r1
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1542: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x83d02034  ! 1543: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x93a289e0  ! 1544: FDIVq	dis not found

	.word 0x87902050  ! 1545: WRPR_TT_I	wrpr	%r0, 0x0050, %tt
	.word 0x8d9026d5  ! 1546: WRPR_PSTATE_I	wrpr	%r0, 0x06d5, %pstate
	.word 0xd2d804a0  ! 1547: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0x9bb54fea  ! 1548: FONES	fones	%f13
	.word 0x879021d2  ! 1549: WRPR_TT_I	wrpr	%r0, 0x01d2, %tt
	.word 0xa190200f  ! 1550: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa4fc2001  ! 1551: SDIVcc_I	sdivcc 	%r16, 0x0001, %r18
	.word 0x819827d1  ! 1552: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d1, %hpstate
change_to_tl1_118:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x83d02035  ! 1554: Tcc_I	te	icc_or_xcc, %r0 + 53
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1555: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe4800c80  ! 1556: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r18
	.word 0x81982657  ! 1557: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0657, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902007  ! 1559: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d02032  ! 1560: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x88a90004  ! 1561: ANDNcc_R	andncc 	%r4, %r4, %r4
	.word 0x81982f17  ! 1562: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f17, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1563: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1a01a61  ! 1564: FqTOi	fqtoi	
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f802001  ! 1566: SIR	sir	0x0001
	.word 0xa1902003  ! 1567: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xe08fe030  ! 1568: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r16
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xe07fe001  ! 1570: SWAP_I	swap	%r16, [%r31 + 0x0001]
	.word 0xe05fc000  ! 1571: LDX_R	ldx	[%r31 + %r0], %r16
	.word 0xa1902002  ! 1572: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x91d02030  ! 1573: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x87802080  ! 1574: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802014  ! 1575: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8951c000  ! 1576: RDPR_TL	rdpr	%tl, %r4
	.word 0x8750c000  ! 1577: RDPR_TT	rdpr	%tt, %r3
DS_119:
	.word 0x34800001  ! 1579: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1578: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982407  ! 1579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0407, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1580: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902007  ! 1582: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93902002  ! 1583: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9351c000  ! 1584: RDPR_TL	rdpr	%tl, %r9
	.word 0x8d902e85  ! 1585: WRPR_PSTATE_I	wrpr	%r0, 0x0e85, %pstate
	.word 0x87902104  ! 1586: WRPR_TT_I	wrpr	%r0, 0x0104, %tt
	.word 0x93902007  ! 1587: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd327c001  ! 1589: STF_R	st	%f9, [%r1, %r31]
	.word 0x91d02030  ! 1590: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902002  ! 1591: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87902276  ! 1592: WRPR_TT_I	wrpr	%r0, 0x0276, %tt
	.word 0xa7480000  ! 1593: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
reduce_priv_level_120:
	.word 0x8f902000  ! 1595: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89824018  ! 1594: WRTICK_R	wr	%r9, %r24, %tick
	.word 0x9f802001  ! 1595: SIR	sir	0x0001
	.word 0x8d9024cf  ! 1596: WRPR_PSTATE_I	wrpr	%r0, 0x04cf, %pstate
	.word 0x8d902c09  ! 1597: WRPR_PSTATE_I	wrpr	%r0, 0x0c09, %pstate
	.word 0xb1540000  ! 1598: RDPR_GL	rdpr	%-, %r24
	.word 0xf08804a0  ! 1599: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x879021ef  ! 1600: WRPR_TT_I	wrpr	%r0, 0x01ef, %tt
	.word 0x8d902c93  ! 1601: WRPR_PSTATE_I	wrpr	%r0, 0x0c93, %pstate
	.word 0x81982211  ! 1602: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0211, %hpstate
	.word 0x97a00544  ! 1603: FSQRTd	fsqrt	
	.word 0x87902117  ! 1604: WRPR_TT_I	wrpr	%r0, 0x0117, %tt
	.word 0xa1902006  ! 1605: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x91d02033  ! 1606: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd7e7c024  ! 1607: CASA_I	casa	[%r31] 0x 1, %r4, %r11
	.word 0xd6800c20  ! 1608: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r11
	.word 0x89514000  ! 1609: RDPR_TBA	rdpr	%tba, %r4
	.word 0x32700001  ! 1610: BPNE	<illegal instruction>
	.word 0x8d902a58  ! 1611: WRPR_PSTATE_I	wrpr	%r0, 0x0a58, %pstate
	.word 0x89514000  ! 1612: RDPR_TBA	rdpr	%tba, %r4
	.word 0x8d902484  ! 1613: WRPR_PSTATE_I	wrpr	%r0, 0x0484, %pstate
	.word 0x93d02030  ! 1614: Tcc_I	tne	icc_or_xcc, %r0 + 48
DS_121:
	.word 0x22800001  ! 1616: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1615: RESTORE_R	restore	%r31, %r0, %r31
DS_122:
	.word 0x22800001  ! 1617: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1616: SAVE_R	save	%r31, %r0, %r31
	.word 0x8efb2001  ! 1617: SDIVcc_I	sdivcc 	%r12, 0x0001, %r7
	.word 0x879022c9  ! 1618: WRPR_TT_I	wrpr	%r0, 0x02c9, %tt
	.word 0xa190200b  ! 1619: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1620: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d9026cb  ! 1621: WRPR_PSTATE_I	wrpr	%r0, 0x06cb, %pstate
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1622: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 1623: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d02030  ! 1624: Tcc_I	ta	icc_or_xcc, %r0 + 48
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1625: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1626: SIR	sir	0x0001
	.word 0x9448000a  ! 1627: MULX_R	mulx 	%r0, %r10, %r10
	.word 0xd4cfe030  ! 1628: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
	.word 0x87902273  ! 1629: WRPR_TT_I	wrpr	%r0, 0x0273, %tt
	.word 0x91d02031  ! 1630: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x804e0004  ! 1631: MULX_R	mulx 	%r24, %r4, %r0
	.word 0x99902001  ! 1632: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x81982456  ! 1633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0456, %hpstate
change_to_randtl_123:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1634: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xb5514000  ! 1635: RDPR_TBA	rdpr	%tba, %r26
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xf4cfe010  ! 1637: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r26
	ta	T_CHANGE_HPRIV	! macro
	.word 0xf4d804a0  ! 1639: LDXA_R	ldxa	[%r0, %r0] 0x25, %r26
	.word 0x95a309c3  ! 1640: FDIVd	fdivd	%f12, %f34, %f10
	.word 0x8da000c6  ! 1641: FNEGd	fnegd	%f6, %f6
	.word 0x83d02033  ! 1642: Tcc_I	te	icc_or_xcc, %r0 + 51
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1643: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_124:
	.word 0x32800001  ! 1645: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1644: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802004  ! 1645: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87902009  ! 1646: WRPR_TT_I	wrpr	%r0, 0x0009, %tt
	.word 0x8fa509a6  ! 1647: FDIVs	fdivs	%f20, %f6, %f7
	.word 0x8d902e45  ! 1648: WRPR_PSTATE_I	wrpr	%r0, 0x0e45, %pstate
	.word 0x81982857  ! 1649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0857, %hpstate
	.word 0xcec7e010  ! 1650: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r7
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 1654: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1655: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902cd6  ! 1656: WRPR_PSTATE_I	wrpr	%r0, 0x0cd6, %pstate
	.word 0x87902198  ! 1657: WRPR_TT_I	wrpr	%r0, 0x0198, %tt
	.word 0x8d802004  ! 1658: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x22700001  ! 1659: BPE	<illegal instruction>
	.word 0x8ba00574  ! 1660: FSQRTq	fsqrt	
	.word 0x8d508000  ! 1661: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0x93902002  ! 1662: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xcc77c014  ! 1663: STX_R	stx	%r6, [%r31 + %r20]
	.word 0xb26e2001  ! 1664: UDIVX_I	udivx 	%r24, 0x0001, %r25
	.word 0xa2a94012  ! 1665: ANDNcc_R	andncc 	%r5, %r18, %r17
change_to_tl1_125:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_126:
	.word 0x20800001  ! 1668: BN	bn,a	<label_0x1>
	.word 0xd736c003  ! 1668: STQF_R	-	%f11, [%r3, %r27]
	normalw
	.word 0xb5458000  ! 1667: RD_SOFTINT_REG	rd	%softint, %r26
	.word 0x80a8400a  ! 1668: ANDNcc_R	andncc 	%r1, %r10, %r0
	.word 0x83504000  ! 1669: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0xa190200e  ! 1670: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02031  ! 1672: Tcc_I	ta	icc_or_xcc, %r0 + 49
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1673: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc2bfc02a  ! 1674: STDA_R	stda	%r1, [%r31 + %r10] 0x01
	.word 0x87902103  ! 1675: WRPR_TT_I	wrpr	%r0, 0x0103, %tt
	.word 0xa190200c  ! 1676: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1902008  ! 1677: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d9020d8  ! 1678: WRPR_PSTATE_I	wrpr	%r0, 0x00d8, %pstate
	.word 0xc29004a0  ! 1679: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1680: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 1681: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc2ffc02a  ! 1682: SWAPA_R	swapa	%r1, [%r31 + %r10] 0x01
	.word 0x8ba01a6b  ! 1683: FqTOi	fqtoi	
	.word 0x87902376  ! 1684: WRPR_TT_I	wrpr	%r0, 0x0376, %tt
	.word 0xab500000  ! 1685: RDPR_TPC	rdpr	%tpc, %r21
DS_127:
	.word 0x20800001  ! 1687: BN	bn,a	<label_0x1>
	pdist %f0, %f28, %f4
	.word 0x91b54310  ! 1686: ALLIGNADDRESS	alignaddr	%r21, %r16, %r8
	.word 0x879020cf  ! 1687: WRPR_TT_I	wrpr	%r0, 0x00cf, %tt
	.word 0xd0ffc030  ! 1688: SWAPA_R	swapa	%r8, [%r31 + %r16] 0x01
	.word 0x91d02031  ! 1689: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8db40fea  ! 1690: FONES	fones	%f6
	.word 0x93902003  ! 1691: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902002  ! 1692: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8ac6a001  ! 1693: ADDCcc_I	addccc 	%r26, 0x0001, %r5
	.word 0x87802010  ! 1694: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x9f802001  ! 1695: SIR	sir	0x0001
	.word 0x93902001  ! 1696: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_128:
	.word 0x34800001  ! 1698: BG	bg,a	<label_0x1>
	pdist %f18, %f8, %f26
	.word 0x89b4c307  ! 1697: ALLIGNADDRESS	alignaddr	%r19, %r7, %r4
	.word 0x8d494000  ! 1698: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0x99494000  ! 1699: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x93902007  ! 1700: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa190200f  ! 1701: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa6dd0007  ! 1702: SMULcc_R	smulcc 	%r20, %r7, %r19
	.word 0x93902001  ! 1703: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9f802001  ! 1704: SIR	sir	0x0001
	.word 0xa1902001  ! 1705: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa2fa2001  ! 1706: SDIVcc_I	sdivcc 	%r8, 0x0001, %r17
	.word 0xa190200f  ! 1707: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x93d02034  ! 1708: Tcc_I	tne	icc_or_xcc, %r0 + 52
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1709: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 1710: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xacad4014  ! 1711: ANDNcc_R	andncc 	%r21, %r20, %r22
	.word 0x8d902215  ! 1712: WRPR_PSTATE_I	wrpr	%r0, 0x0215, %pstate
	.word 0x97480000  ! 1713: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xd6dfe010  ! 1714: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0x93902007  ! 1715: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x879020bf  ! 1716: WRPR_TT_I	wrpr	%r0, 0x00bf, %tt
	.word 0x81982b18  ! 1717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b18, %hpstate
	.word 0xd6c804a0  ! 1718: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	.word 0x24700001  ! 1719: BPLE	<illegal instruction>
	.word 0xd727e001  ! 1720: STF_I	st	%f11, [0x0001, %r31]
	.word 0x34800001  ! 1721: BG	bg,a	<label_0x1>
	.word 0xd67fe001  ! 1722: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x93d02031  ! 1723: Tcc_I	tne	icc_or_xcc, %r0 + 49
change_to_tl1_129:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x81982680  ! 1725: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0680, %hpstate
	.word 0xa1514000  ! 1726: RDPR_TBA	rdpr	%tba, %r16
	.word 0x93902004  ! 1727: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x28700001  ! 1728: BPLEU	<illegal instruction>
DS_130:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1729: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xe0dfe000  ! 1730: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r16
DS_131:
	.word 0x20800001  ! 1732: BN	bn,a	<label_0x1>
	pdist %f28, %f12, %f6
	.word 0x85b30300  ! 1731: ALLIGNADDRESS	alignaddr	%r12, %r0, %r2
	.word 0x8d802000  ! 1732: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc4d7e000  ! 1733: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
	.word 0x8d902a0a  ! 1734: WRPR_PSTATE_I	wrpr	%r0, 0x0a0a, %pstate
change_to_randtl_132:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1735: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x83500000  ! 1736: RDPR_TPC	rdpr	%tpc, %r1
	.word 0xc297e000  ! 1737: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r1
	.word 0x91d02035  ! 1738: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902006  ! 1739: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x99a1cd27  ! 1740: FsMULd	fsmuld	%f7, %f38, %f12
	.word 0x87902158  ! 1741: WRPR_TT_I	wrpr	%r0, 0x0158, %tt
	.word 0x83d02035  ! 1742: Tcc_I	te	icc_or_xcc, %r0 + 53
DS_133:
	.word 0x34800001  ! 1744: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1743: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x97508000  ! 1744: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0x93902002  ! 1745: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d802000  ! 1746: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d02031  ! 1747: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xd7e7c027  ! 1748: CASA_I	casa	[%r31] 0x 1, %r7, %r11
	.word 0xa9480000  ! 1749: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1750: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93b28fea  ! 1751: FONES	fones	%f9
	.word 0x91d02035  ! 1752: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99b40fe7  ! 1754: FONES	fones	%f12
	.word 0x8790225e  ! 1755: WRPR_TT_I	wrpr	%r0, 0x025e, %tt
	.word 0x93902001  ! 1756: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902002  ! 1757: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87902158  ! 1758: WRPR_TT_I	wrpr	%r0, 0x0158, %tt
	.word 0x81982704  ! 1759: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0704, %hpstate
	.word 0x8d90205a  ! 1760: WRPR_PSTATE_I	wrpr	%r0, 0x005a, %pstate
	.word 0x8d902217  ! 1761: WRPR_PSTATE_I	wrpr	%r0, 0x0217, %pstate
	.word 0x93d02032  ! 1762: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x879020e1  ! 1763: WRPR_TT_I	wrpr	%r0, 0x00e1, %tt
	.word 0xb3514000  ! 1764: RDPR_TBA	rdpr	%tba, %r25
	.word 0xf297e030  ! 1765: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r25
	.word 0xf28008a0  ! 1766: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
reduce_priv_level_134:
	.word 0x8f902001  ! 1768: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89824006  ! 1767: WRTICK_R	wr	%r9, %r6, %tick
	.word 0xa190200d  ! 1768: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87802004  ! 1769: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02030  ! 1770: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xf297e030  ! 1771: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r25
	.word 0x89480000  ! 1772: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
DS_135:
	.word 0x34800001  ! 1774: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1773: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902004  ! 1774: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93d02035  ! 1775: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8f514000  ! 1776: RDPR_TBA	rdpr	%tba, %r7
	.word 0x879020e1  ! 1777: WRPR_TT_I	wrpr	%r0, 0x00e1, %tt
DS_136:
	.word 0x34800001  ! 1779: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1778: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982c8c  ! 1779: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8c, %hpstate
	.word 0x8f51c000  ! 1780: RDPR_TL	rdpr	%tl, %r7
	.word 0x879022e3  ! 1781: WRPR_TT_I	wrpr	%r0, 0x02e3, %tt
	.word 0x87902344  ! 1782: WRPR_TT_I	wrpr	%r0, 0x0344, %tt
	.word 0xa1902008  ! 1783: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1784: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1785: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcfe7c026  ! 1786: CASA_I	casa	[%r31] 0x 1, %r6, %r7
reduce_priv_level_137:
	.word 0x8f902001  ! 1788: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916a2001  ! 1787: SDIVX_I	sdivx	%r8, 0x0001, %r8
	.word 0xb5a349ca  ! 1788: FDIVd	fdivd	%f44, %f10, %f26
	.word 0x81982613  ! 1789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0613, %hpstate
	.word 0x8d90261e  ! 1790: WRPR_PSTATE_I	wrpr	%r0, 0x061e, %pstate
	.word 0x8d902c0c  ! 1791: WRPR_PSTATE_I	wrpr	%r0, 0x0c0c, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8969401a  ! 1793: SDIVX_R	sdivx	%r5, %r26, %r4
	.word 0x81982209  ! 1794: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0209, %hpstate
DS_138:
	.word 0x22800001  ! 1796: BE	be,a	<label_0x1>
	allclean
	.word 0xb1b30307  ! 1795: ALLIGNADDRESS	alignaddr	%r12, %r7, %r24
	.word 0x81982959  ! 1796: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0959, %hpstate
	.word 0xf007e001  ! 1797: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0x87902358  ! 1798: WRPR_TT_I	wrpr	%r0, 0x0358, %tt
	.word 0xa1902005  ! 1799: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_139:
	.word 0x22800001  ! 1801: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1800: RESTORE_R	restore	%r31, %r0, %r31
DS_140:
	.word 0x34800001  ! 1802: BG	bg,a	<label_0x1>
	illtrap
	.word 0x81a00545  ! 1802: FSQRTd	fsqrt	
	.word 0x87a5c831  ! 1801: FADDs	fadds	%f23, %f17, %f3
	.word 0x88a90019  ! 1802: ANDNcc_R	andncc 	%r4, %r25, %r4
	.word 0x8d802004  ! 1803: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc8ffc039  ! 1804: SWAPA_R	swapa	%r4, [%r31 + %r25] 0x01
	.word 0xa1902004  ! 1805: WRPR_GL_I	wrpr	%r0, 0x0004, %-
change_to_tl1_141:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa190200a  ! 1807: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xb2faa001  ! 1808: SDIVcc_I	sdivcc 	%r10, 0x0001, %r25
	.word 0x87802016  ! 1809: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9f802001  ! 1810: SIR	sir	0x0001
	.word 0xf28008a0  ! 1811: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8151c000  ! 1812: RDPR_TL	rdpr	%tl, %r0
	.word 0x81982ac9  ! 1813: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac9, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902129  ! 1815: WRPR_TT_I	wrpr	%r0, 0x0129, %tt
	.word 0x87902317  ! 1816: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
	.word 0x96f9a001  ! 1817: SDIVcc_I	sdivcc 	%r6, 0x0001, %r11
	.word 0x81982c93  ! 1818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c93, %hpstate
	.word 0x8ba000db  ! 1819: FNEGd	fnegd	%f58, %f36
	.word 0x9f802001  ! 1820: SIR	sir	0x0001
	.word 0xa1902001  ! 1821: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8d802000  ! 1822: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8790202c  ! 1823: WRPR_TT_I	wrpr	%r0, 0x002c, %tt
	.word 0x8790238d  ! 1824: WRPR_TT_I	wrpr	%r0, 0x038d, %tt
	.word 0x97a20dc8  ! 1825: FdMULq	fdmulq	
	.word 0x8d902293  ! 1826: WRPR_PSTATE_I	wrpr	%r0, 0x0293, %pstate
	.word 0x8198221c  ! 1827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021c, %hpstate
	.word 0xa5480000  ! 1828: RDHPR_HPSTATE	rdhpr	%hpstate, %r18
	.word 0x8d480000  ! 1829: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x81982a05  ! 1830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a05, %hpstate
	.word 0x9f802001  ! 1831: SIR	sir	0x0001
change_to_tl1_142:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xccd7e020  ! 1833: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r6
	.word 0xb0fca001  ! 1834: SDIVcc_I	sdivcc 	%r18, 0x0001, %r24
DS_143:
	.word 0x22800001  ! 1836: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1835: SAVE_R	save	%r31, %r0, %r31
	.word 0xf04fe001  ! 1836: LDSB_I	ldsb	[%r31 + 0x0001], %r24
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1837: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_144:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1838: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x81982b14  ! 1839: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b14, %hpstate
	.word 0x92fa8007  ! 1840: SDIVcc_R	sdivcc 	%r10, %r7, %r9
	.word 0x81982edd  ! 1841: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edd, %hpstate
	.word 0x879022c3  ! 1842: WRPR_TT_I	wrpr	%r0, 0x02c3, %tt
	.word 0x87802014  ! 1843: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x95a5c9ec  ! 1844: FDIVq	dis not found

	.word 0x91d02033  ! 1845: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81982c49  ! 1846: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c49, %hpstate
	.word 0xad494000  ! 1847: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0x93902005  ! 1848: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xad51c000  ! 1849: RDPR_TL	rdpr	%tl, %r22
	.word 0x819829cc  ! 1850: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cc, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1851: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02035  ! 1852: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa151c000  ! 1853: RDPR_TL	rdpr	%tl, %r16
	.word 0xe127c00c  ! 1854: STF_R	st	%f16, [%r12, %r31]
	.word 0x8da00545  ! 1855: FSQRTd	fsqrt	
	.word 0x91a209a0  ! 1856: FDIVs	fdivs	%f8, %f0, %f8
	.word 0x8d902009  ! 1857: WRPR_PSTATE_I	wrpr	%r0, 0x0009, %pstate
	.word 0x93902006  ! 1858: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902001  ! 1859: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02034  ! 1860: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802004  ! 1862: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa481a001  ! 1863: ADDcc_I	addcc 	%r6, 0x0001, %r18
	.word 0x98696001  ! 1864: UDIVX_I	udivx 	%r5, 0x0001, %r12
	.word 0x93d02031  ! 1865: Tcc_I	tne	icc_or_xcc, %r0 + 49
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1866: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 1867: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x879022d4  ! 1868: WRPR_TT_I	wrpr	%r0, 0x02d4, %tt
	.word 0x8790209f  ! 1869: WRPR_TT_I	wrpr	%r0, 0x009f, %tt
	.word 0x96d20001  ! 1870: UMULcc_R	umulcc 	%r8, %r1, %r11
	.word 0xa5a6cd25  ! 1871: FsMULd	fsmuld	%f27, %f36, %f18
	.word 0x8d902248  ! 1872: WRPR_PSTATE_I	wrpr	%r0, 0x0248, %pstate
	.word 0x879023a1  ! 1873: WRPR_TT_I	wrpr	%r0, 0x03a1, %tt
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1874: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8fa10d2a  ! 1875: FsMULd	fsmuld	%f4, %f10, %f38
	.word 0x91d02035  ! 1876: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa190200e  ! 1877: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1878: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982044  ! 1879: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0044, %hpstate
	.word 0x93504000  ! 1880: RDPR_TNPC	rdpr	%tnpc, %r9
DS_145:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1881: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_146:
	.word 0x22800001  ! 1883: BE	be,a	<label_0x1>
	pdist %f0, %f6, %f6
	.word 0xa9b28315  ! 1882: ALLIGNADDRESS	alignaddr	%r10, %r21, %r20
	.word 0x91d02035  ! 1883: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982356  ! 1884: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0356, %hpstate
	.word 0xe937e001  ! 1885: STQF_I	-	%f20, [0x0001, %r31]
	.word 0x93d02031  ! 1886: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x93902000  ! 1887: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982ecb  ! 1888: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecb, %hpstate
	.word 0xa1902001  ! 1889: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x9f802001  ! 1890: SIR	sir	0x0001
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1891: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x916e0008  ! 1892: SDIVX_R	sdivx	%r24, %r8, %r8
	.word 0x93902007  ! 1893: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa669401a  ! 1894: UDIVX_R	udivx 	%r5, %r26, %r19
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1895: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93d02031  ! 1896: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xa8f84000  ! 1897: SDIVcc_R	sdivcc 	%r1, %r0, %r20
	.word 0x8d902880  ! 1898: WRPR_PSTATE_I	wrpr	%r0, 0x0880, %pstate
	.word 0x81982ed6  ! 1899: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed6, %hpstate
reduce_priv_level_147:
	.word 0x8f902000  ! 1901: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01973  ! 1900: FqTOd	dis not found

	.word 0xa3504000  ! 1901: RDPR_TNPC	rdpr	%tnpc, %r17
DS_148:
	.word 0x20800001  ! 1903: BN	bn,a	<label_0x1>
	.word 0xc5336001  ! 1903: STQF_I	-	%f2, [0x0001, %r13]
	normalw
	.word 0x83458000  ! 1902: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x87480000  ! 1903: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
change_to_randtl_149:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1904: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa1902009  ! 1905: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xb3508000  ! 1906: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xb751c000  ! 1907: RDPR_TL	<illegal instruction>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1908: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902358  ! 1909: WRPR_TT_I	wrpr	%r0, 0x0358, %tt
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1910: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 1911: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d902a59  ! 1912: WRPR_PSTATE_I	wrpr	%r0, 0x0a59, %pstate
	.word 0x879021b7  ! 1913: WRPR_TT_I	wrpr	%r0, 0x01b7, %tt
	.word 0xa1902001  ! 1914: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_150:
	.word 0x20800001  ! 1916: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1915: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8790222b  ! 1916: WRPR_TT_I	wrpr	%r0, 0x022b, %tt
	.word 0xb3a089ec  ! 1917: FDIVq	dis not found

	.word 0x9f802001  ! 1918: SIR	sir	0x0001
	.word 0x836a4012  ! 1919: SDIVX_R	sdivx	%r9, %r18, %r1
	.word 0x89504000  ! 1920: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x8790216a  ! 1921: WRPR_TT_I	wrpr	%r0, 0x016a, %tt
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1922: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 1923: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802016  ! 1924: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc8bfe001  ! 1925: STDA_I	stda	%r4, [%r31 + 0x0001] %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc8800c00  ! 1927: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r4
	.word 0x91d02031  ! 1928: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xafb10fe7  ! 1929: FONES	fones	%f23
	.word 0x93902003  ! 1930: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xeec804a0  ! 1931: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r23
	.word 0x81982718  ! 1932: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0718, %hpstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1933: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_151:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1934: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
DS_152:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1935: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x93902006  ! 1936: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_tl1_153:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8790224c  ! 1938: WRPR_TT_I	wrpr	%r0, 0x024c, %tt
	.word 0x85a01a68  ! 1939: FqTOi	fqtoi	
	.word 0xa4fe401a  ! 1940: SDIVcc_R	sdivcc 	%r25, %r26, %r18
	.word 0x93902003  ! 1941: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe4d804a0  ! 1942: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0xa1902007  ! 1943: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe48008a0  ! 1944: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xa1902003  ! 1945: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x9f802001  ! 1946: SIR	sir	0x0001
	.word 0x81982308  ! 1947: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0308, %hpstate
	.word 0xe41fc000  ! 1948: LDD_R	ldd	[%r31 + %r0], %r18
	.word 0x9f802001  ! 1949: SIR	sir	0x0001
DS_154:
	.word 0x20800001  ! 1951: BN	bn,a	<label_0x1>
	.word 0xf734a001  ! 1951: STQF_I	-	%f27, [0x0001, %r18]
	normalw
	.word 0x8d458000  ! 1950: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x8198245c  ! 1951: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045c, %hpstate
	.word 0xb26c6001  ! 1952: UDIVX_I	udivx 	%r17, 0x0001, %r25
	.word 0xb7a0c9c1  ! 1953: FDIVd	fdivd	%f34, %f32, %f58
	.word 0xa9a1cdd6  ! 1954: FdMULq	fdmulq	
	.word 0x93902002  ! 1955: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x88d42001  ! 1956: UMULcc_I	umulcc 	%r16, 0x0001, %r4
	.word 0x819822c2  ! 1957: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c2, %hpstate
	.word 0xc8c00e40  ! 1958: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r4
	.word 0xa190200c  ! 1959: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902003  ! 1960: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_tl1_155:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1962: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc8800c60  ! 1963: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r4
	.word 0x91d02033  ! 1964: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc8ffc036  ! 1965: SWAPA_R	swapa	%r4, [%r31 + %r22] 0x01
	.word 0xa190200b  ! 1966: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x879021c0  ! 1967: WRPR_TT_I	wrpr	%r0, 0x01c0, %tt
	.word 0x9ba249e6  ! 1968: FDIVq	dis not found

	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1969: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdaffc026  ! 1970: SWAPA_R	swapa	%r13, [%r31 + %r6] 0x01
	.word 0x8d902c4b  ! 1971: WRPR_PSTATE_I	wrpr	%r0, 0x0c4b, %pstate
	.word 0xda07e001  ! 1972: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0x8d902015  ! 1973: WRPR_PSTATE_I	wrpr	%r0, 0x0015, %pstate
	.word 0xb7494000  ! 1974: RDHPR_HTBA	rdhpr	%htba, %r27
	.word 0x8ba349ea  ! 1975: FDIVq	dis not found

	.word 0x8198298f  ! 1976: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098f, %hpstate
	.word 0x8d90285c  ! 1977: WRPR_PSTATE_I	wrpr	%r0, 0x085c, %pstate
	.word 0x93902000  ! 1978: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902000  ! 1979: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1980: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca07e001  ! 1981: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0xcad7e030  ! 1982: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
	.word 0x8d9024c1  ! 1983: WRPR_PSTATE_I	wrpr	%r0, 0x04c1, %pstate
	.word 0x8b494000  ! 1984: RDHPR_HTBA	rdhpr	%htba, %r5
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1985: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8198255d  ! 1986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055d, %hpstate
	.word 0xcb27e001  ! 1987: STF_I	st	%f5, [0x0001, %r31]
reduce_priv_level_156:
	.word 0x8f902000  ! 1989: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 1988: SIAM	siam	1
	.word 0x819825cb  ! 1989: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cb, %hpstate
	.word 0xca37e001  ! 1990: STH_I	sth	%r5, [%r31 + 0x0001]
	.word 0x91d02030  ! 1991: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93514000  ! 1992: RDPR_TBA	rdpr	%tba, %r9
	.word 0x8b514000  ! 1993: RDPR_TBA	rdpr	%tba, %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d02030  ! 1995: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x91d02031  ! 1996: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x80690015  ! 1997: UDIVX_R	udivx 	%r4, %r21, %r0
	.word 0x82822001  ! 1998: ADDcc_I	addcc 	%r8, 0x0001, %r1


.global user_data_start
.data
user_data_start:
	.xword	0xae7083c7ef50815a
	.xword	0x5127632639647441
	.xword	0xa4c1c52bea2e525b
	.xword	0xc138d8ba3309302d
	.xword	0xf4908dd64e31b11b
	.xword	0xbdf2a317d0a84dc6
	.xword	0x017d7fde0dabcf2f
	.xword	0xdd42d0f5949fbf53
	.xword	0x30b316405d88d4a4
	.xword	0x8ed967254b3d5ade
	.xword	0x21e5b7d8bedb9b50
	.xword	0x5e8599575566b086
	.xword	0x16573dc0e9b29094
	.xword	0x308c42fe95af9ac9
	.xword	0x4a11345f986f4e56
	.xword	0x58e72e135f3e2784
	.xword	0x05010ae36f38684b
	.xword	0x048838e99cc12e85
	.xword	0x607029dfc6e07165
	.xword	0xd6b8af6cea2529f4
	.xword	0xec65babc1405f5c3
	.xword	0xb9f481711fc7e75e
	.xword	0xb4fac4f230c69e60
	.xword	0x0121104cc7b54358
	.xword	0xf1fc21d3f669a612
	.xword	0xe120ee4f20ba09b8
	.xword	0x6fc8e06fa42b080d
	.xword	0x24b474b5bbd4c751
	.xword	0x8f45970283f2c188
	.xword	0x96a85c3f1db688da
	.xword	0xe98a108dacd95a9a
	.xword	0x799f334e389bd969
	.xword	0x3f0df986a2aa2c45
	.xword	0xabb5892c29d181f0
	.xword	0x80a68557b112241d
	.xword	0x4bc41996cc78b31e
	.xword	0x9ec3d73198d66e12
	.xword	0x21c260c8ad5ba787
	.xword	0x39dabb421e5645ed
	.xword	0x5b2b95cf97cbfd69
	.xword	0x3ad6502304ef8434
	.xword	0x305c6aa9abc337f5
	.xword	0x85359cc61a6ec1e2
	.xword	0x8b9a565773bec87f
	.xword	0x70f2d3b006703377
	.xword	0x901eaf51b5a6b74f
	.xword	0xba9f114bf53f1400
	.xword	0x5cdedd01eb488fcf
	.xword	0xe0074c1f86617db6
	.xword	0x0977f166ce340a43
	.xword	0x035e128650151e4d
	.xword	0xcc3ec73dde878816
	.xword	0xee1ecde0665592b6
	.xword	0xcc5c06f954757921
	.xword	0x96cdb134934b732d
	.xword	0x001f13877384661f
	.xword	0x89adb1618d79dfb8
	.xword	0x65636cc2195bbd8e
	.xword	0x892dc7e9f831c6bd
	.xword	0x7a23acd14dce041f
	.xword	0xc9cd5dfc66b86bf9
	.xword	0xcacf8141ba79b233
	.xword	0x5b85e6831568b2c5
	.xword	0x814aca987f7500e0
	.xword	0x6b002ba9144a8629
	.xword	0x613bce11edf42b3d
	.xword	0xf833d45a30e1df02
	.xword	0xe7ca714257ddb15b
	.xword	0x1f5b90ad9ab1d221
	.xword	0x76c2bad899ba25a5
	.xword	0xa110e830d3baaff3
	.xword	0xfa1177ccd78e0684
	.xword	0x1cc1914c9b4d961b
	.xword	0xebae94b98955ddd3
	.xword	0x7140e9e48a3bc788
	.xword	0x75afeb8712892987
	.xword	0xddb13c3d54c131e6
	.xword	0x61aee8bf06a42bce
	.xword	0x07a055e6c848f5f3
	.xword	0x551742fa6ad3c518
	.xword	0x6f46fb4902694638
	.xword	0x86dc29318bf67f6f
	.xword	0xd16edc518d41d63e
	.xword	0x34b5569a12961bd1
	.xword	0xb79376e8f5bb6495
	.xword	0xf9d25df82a17b719
	.xword	0x328c4356a0cd9426
	.xword	0x7ac2612e0bf3c0c4
	.xword	0x2aa65487bd76792d
	.xword	0x8ed2cb395d38d338
	.xword	0xfb33f1a28054f8fa
	.xword	0x8f4be814e770fa56
	.xword	0xc6bd1660dc4cf796
	.xword	0x236dd561f48e2841
	.xword	0x87a407f40540eeab
	.xword	0x59ac8108282b8207
	.xword	0x88994eca26e7fca2
	.xword	0x5454f25e45c4ab4c
	.xword	0xdbb0e1e21d9c05e3
	.xword	0x7558eb26f828d2ca
	.xword	0xd31633272ac6e8a9
	.xword	0xb5772d37fc0a4ff4
	.xword	0x4048cec9c3a34058
	.xword	0xd495a1891a02e665
	.xword	0x24d4bcf626f75a35
	.xword	0xe32a6fe9be6bb4da
	.xword	0x188ab0064ea9a5c6
	.xword	0xf11585b83566e41b
	.xword	0x504e25c6d5239a78
	.xword	0x62ebd5ffa863ab67
	.xword	0x48a0ffd87164d7a7
	.xword	0x77682e4562beeba1
	.xword	0x8747b245edd45190
	.xword	0x5cbbad708366467c
	.xword	0xed3f54cd63e69e92
	.xword	0x8818f7f0918e1a98
	.xword	0xa4269a57e8810d51
	.xword	0xe65c61b5400b1cdf
	.xword	0x766daffe32f0e60c
	.xword	0xac5cc58743428728
	.xword	0x21d23d9139be0565
	.xword	0xb30f2cb378f43e26
	.xword	0x5cc56d389a8a30e8
	.xword	0x2504af924826602f
	.xword	0x58701439aa9581b7
	.xword	0x0d0680bb835122a5
	.xword	0xec298ea4790203c8
	.xword	0x1469189e0cc7a85a
	.xword	0xb995144295a8a6aa
	.xword	0xf2b78ece247b02e5
	.xword	0x3fb1312b86a17bca
	.xword	0x9b39e6cb7d3fccc7
	.xword	0x34a72ff263159149
	.xword	0x4fbb7fe88b3f4ec4
	.xword	0x831826463dda0cb7
	.xword	0xa529531a1856f380
	.xword	0xc2cb71b4962b75ab
	.xword	0xf764ab3fdc2c7a5d
	.xword	0x7523a5de6eec110c
	.xword	0x55f43a13571f274e
	.xword	0x463b1ee829ef5af3
	.xword	0xe48f11ac5a0bc77e
	.xword	0x3c5a06756ef586ad
	.xword	0x440c17d51b742761
	.xword	0x5503638737d64a87
	.xword	0xa1125f10e79a53e3
	.xword	0x03f0374e26e5dbc6
	.xword	0x96f5e4112afc8224
	.xword	0xc89e50c25511fa50
	.xword	0x4776b35520f371e1
	.xword	0xccaa51a53f973261
	.xword	0x64fdbacbacd06e06
	.xword	0x3711aeb73715402d
	.xword	0xedeec626cae460d3
	.xword	0x974e609d7715d908
	.xword	0x8a09de633a274d31
	.xword	0x9cccfb6a9c704c5f
	.xword	0x1f0b63904e750846
	.xword	0xa07f2e3be4f8b2bd
	.xword	0xa7493df800f28932
	.xword	0x0cccd44d1294373a
	.xword	0x54b5d5d7bfd35184
	.xword	0x3a2f96292cc381a4
	.xword	0xdeef01a85ad5156a
	.xword	0x14a8370bbccec250
	.xword	0xf936875a014f33f5
	.xword	0x52e25c564d3312b0
	.xword	0xecc61912b6cbbd76
	.xword	0x65e112939c0b2182
	.xword	0xb6e4568bc3b5fa3d
	.xword	0xd5eee63de833798e
	.xword	0x6035acff197bd42f
	.xword	0xa15a44921b08061d
	.xword	0xc731972fbc5fad2b
	.xword	0xb675bdccbc47ee7a
	.xword	0x97fbd0f8767abd6a
	.xword	0xa51be231de395b63
	.xword	0x2a6fb8aafcf4fd78
	.xword	0x6fea3a179c4f4b01
	.xword	0xdd6ee8af5e903e43
	.xword	0x02840e6e13588a45
	.xword	0x47e2097ce7c3bce7
	.xword	0x6fa887db1a0588bb
	.xword	0x00e5367fb4e5d151
	.xword	0x64b71d952f5a82b4
	.xword	0x1f8782e632a4b890
	.xword	0xbb69cf99dd026a72
	.xword	0xd77d215163bc3a11
	.xword	0x1dad174a89e48f8f
	.xword	0x0ba3bf702b703b89
	.xword	0xaed1ba82731057b3
	.xword	0x9edd681b97be6499
	.xword	0xead30bda1a20f875
	.xword	0x64360669eb09a443
	.xword	0xbeed876d83ed5f09
	.xword	0x90bfb5cda44b8c7b
	.xword	0x4ab2124958b5cdd2
	.xword	0xaf9f864cc76c0706
	.xword	0x8be91ef5edfd939e
	.xword	0x0ea61ebcff370277
	.xword	0x9ff1746cb994fc1b
	.xword	0xe923ce217fc6c4c2
	.xword	0x2cd035f048e1ad0a
	.xword	0xfa0a57c38f59f10d
	.xword	0xe1e216cc7220b307
	.xword	0xf3a3baab1ed2efb7
	.xword	0xbfe8f318134f5c1e
	.xword	0x8edda16bb937010f
	.xword	0x3dd7108469304153
	.xword	0x17a1f605061b134c
	.xword	0x75af322c208e7bd8
	.xword	0xe2bd14117bdec952
	.xword	0x6ae313e048f0a6e5
	.xword	0x1e46cb0d28e33df8
	.xword	0xc4231742fa7eef4e
	.xword	0xe0bdbe9a9926b9e1
	.xword	0xff2c97ef57f33134
	.xword	0xfc19f79dbcb4ce10
	.xword	0xc637298764e00d86
	.xword	0xdb13410da08a35b9
	.xword	0xf865243e3c1989d6
	.xword	0x737aeb96f4b77007
	.xword	0xd54cbd778acf68c9
	.xword	0x47ed6fe0b7ac6af7
	.xword	0xc2e895eccb74cf66
	.xword	0x0250771fce45e8e0
	.xword	0x05c53dfb79b14f39
	.xword	0xba469e1b1ceaca52
	.xword	0x5c76b8be48a6b123
	.xword	0xa2680bbb6870d367
	.xword	0x424d00178fa5195d
	.xword	0xd9d0d8a43f0e1ad7
	.xword	0x73a80915b6ccb1d4
	.xword	0x898b28773761c2e9
	.xword	0x1243c5d2b25c5598
	.xword	0xdb14bbddd58a6f50
	.xword	0x7df5a281edd2018d
	.xword	0x45448d3a27f20338
	.xword	0x77e7c84dc68a5a36
	.xword	0x5ffcdc9103292729
	.xword	0xb6259dd6874cb142
	.xword	0x4bf7b2ef7a819145
	.xword	0x494e18d1a25fc31f
	.xword	0x83533d693b3cc375
	.xword	0xcd222eb28a129e0b
	.xword	0xd60f88aefa1f7ff3
	.xword	0x623f6fb9ce6f528f
	.xword	0x3c26a07e2024ae07
	.xword	0x26f257b458776c86
	.xword	0xe48f0ea988325b40
	.xword	0xdd12d525f4906eb4
	.xword	0x3217252946877be9
	.xword	0x4931b15e092ad887
	.xword	0xb8304b7ed9f794d4
	.xword	0xca56665e485b7d0c
	.xword	0x2db7750d48bbb41d


.text
    nop
    nop
    nop
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

#if 0
!!# /*
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Thu Apr 29 17:14:17 2004
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!#     int label = 0;
!!# 
!!# #define HTRAPS	0
!!# #define RED_SEC	1
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#     IJ_bind_thread_group("diag.j", 35, th0, 0x01);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 38, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     IJ_set_rvar("diag.j", 41, Rv_pdist_reg,"5'brrrr0");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!# 
!!#     IJ_set_ropr_fld("diag.j", 49, ijdefault, Ft_Rs1, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 50, ijdefault, Ft_Rs2, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 51, ijdefault, Ft_Rd, "{0..13,16..27}");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 54, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 57, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 58, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 61, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x16, 0x80, 0x88}");
!!#     IJ_set_ropr_fld("diag.j", 62, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 63, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 64, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 66, Ro_nontrap_ldasi_z, Ft_Imm_Asi, "{0x45, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 67, Ro_nontrap_ldasi_z, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 68, Ro_nontrap_ldasi_z, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 69, Ro_nontrap_ldasi_z, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 72, Ro_nontrap_ld, Fm_align_Simm13, "{0x0..0x6:5,0x7:1}");
!!#     IJ_set_ropr_fld("diag.j", 73, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 74, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 77, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 78, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 79, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 80, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     //IJ_set_ropr_fld(Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_ropr_fld("diag.j", 84, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35}");
!!#     IJ_set_ropr_fld("diag.j", 85, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 86, Ro_traps_i, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 87, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 88, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 89, Ro_traps_r, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 90, Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     //IJ_set_ropr_fld(Ro_traps_r, Ft_Simm13, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_rvar("diag.j", 92, Rv_init_trap, "{0x30..0x35}");
!!#     //IJ_set_rvar(Rv_init_trap, "{0x30..0x35, 0xb0..0xb5}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 96, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 97, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Pstate splash
!!#     IJ_set_ropr_fld("diag.j", 100, Ro_wrpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 101, Ro_wrpstate, Ft_Simm13, "12'b0rrr0rr0rrrrr");
!!# 
!!#     // Hpstate splash
!!#     IJ_set_ropr_fld("diag.j", 104, Ro_wrhpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 105, Ro_wrhpstate, Ft_Simm13, "12'brrrrrr0rrrrr");
!!# 
!!#     // TT splash
!!#     IJ_set_ropr_fld("diag.j", 108, Ro_wrtt, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 109, Ro_wrtt, Ft_Simm13, "10'brrrrrrrrrr");
!!# 
!!#     // GL splash
!!#     IJ_set_ropr_fld("diag.j", 112, Ro_wrgl, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 113, Ro_wrgl, Ft_Simm13, "4'brrrr");
!!# 
!!#     // TL splash
!!#     IJ_set_ropr_fld("diag.j", 116, Ro_tl, Ft_Simm13, "{0..5}");
!!#     IJ_set_ropr_fld("diag.j", 117, Ro_tl, Ft_Rs1,    "{0}");
!!# 
!!#     // CWP splash
!!#     IJ_set_ropr_fld("diag.j", 120, Ro_wrcwp, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 121, Ro_wrcwp, Ft_Simm13, "3'brrr");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 123, Ro_save_restore, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 124, Ro_save_restore, Ft_Rd,  "{31}");
!!#     IJ_set_ropr_fld("diag.j", 125, Ro_save_restore, Ft_Rs2, "{0}");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 127, Ro_winops, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 128, Ro_winops, Ft_Simm13, "{0..5}");
!!# 
!!#     // Weights
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 131,"{10}");
!!#     IJ_set_rvar("diag.j", 132, wt_high, "{90}");
!!#     IJ_set_rvar("diag.j", 133, wt_med,  "{40}");
!!#     IJ_set_rvar("diag.j", 134, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 138, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<7; k++) {
!!#         for (i = 0; i < 30; i++) {
!!#             if (i==15) {
!!#                 IJ_printf  ("diag.j", 142, th0,"\tmov %%r31, %%r15\n");
!!#                 continue;
!!#             }
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 146, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 148, th0,"\tmov 0x%rx, %%r14\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 149, th0,"\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 150, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 153, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 156, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 159, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 162, th0,"!Initializing Trap Stack \n");
!!#     IJ_printf  ("diag.j", 163, th0,"\tta T_CHANGE_HPRIV \n");
!!#     for (i = 1; i <=6; i++) {
!!#         IJ_printf  ("diag.j", 165, th0,"\twrpr 0x%d, %%tl\n", i);
!!#         IJ_printf  ("diag.j", 166, th0,"\twrpr 0x1, %%tt\n");
!!#         IJ_printf  ("diag.j", 167, th0,"\twrpr 0x1, %%tpc\n");
!!#         IJ_printf  ("diag.j", 168, th0,"\twrpr 0x1, %%tnpc\n");
!!#         IJ_printf  ("diag.j", 169, th0,"\twrpr 0x1, %%tstate\n");
!!#         IJ_printf  ("diag.j", 170, th0,"\twrhpr 0x1, %%htstate\n");
!!#     }
!!#     IJ_printf  ("diag.j", 172, th0,"\twrpr 0x0, %%tl\n");
!!#     IJ_printf  ("diag.j", 173, th0,"\tta T_CHANGE_NONHPRIV \n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#     int i;
!!#     IJ_printf  ("diag.j", 178, th0,"\n\n.global user_data_start\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 180, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
!!#     }
!!# 
!!# }
!!# 
!!# %%
!!# %%section map
!!# 
!!# %%
!!# %%section grammar
!!# 
!!# 
!!# block: inst | block inst
!!#     {
!!#         IJ_generate ("diag.j", 223, th0, $2);
!!#     };
!!# 
!!# inst:      trap_asr     %rvar  wt_med
!!#         |  trap_asi     %rvar  wt_low
!!#         |  tcc          %rvar  wt_high
!!#         | ldst_excp     %rvar  wt_low
!!#         | ldstasi_excp  %rvar  wt_low
!!#         | ldstasi_excp_z  %rvar  wt_low
!!#         | change_mode   %rvar  wt_med
!!#         | alu           %rvar  wt_high
!!#         | branches      %rvar  wt_med
!!#         | wrasi         %rvar  wt_low
!!#         | splash_fprs   %rvar  wt_low
!!#         | splash_pstate %rvar  wt_med
!!#         | splash_hpstate %rvar  wt_med
!!#         | splash_cwp    %rvar  wt_med
!!#         | splash_gl     %rvar  wt_med
!!#         | splash_tt     %rvar  wt_med
!!#         | stores        %rvar  wt_low
!!#         | sir           %rvar  wt_low
!!# ;
!!# 
!!# dummy :tCHANGE_NONHPRIV | tCHANGE_NONPRIV ;
!!# 
!!# sir : tSIR ;
!!# 
!!# change_mode :   
!!#     reduce_priv_level
!!#     | tCHANGE_HPRIV 
!!#     | tCHANGE_PRIV 
!!#     | change_to_tl1
!!#     | change_to_randtl
!!#     | tCHANGE_TO_TL0 
!!# ;
!!# 
!!# pt1: tFqTOd | tSDIVX_I | tSIAM | tWRTICK_R;
!!# 
!!# reduce_priv_level: pt1 
!!#     {
!!#         IJ_printf("diag.j", 264, th0, "reduce_priv_level_%d:\n", label);
!!#         IJ_set_ropr_fld("diag.j", 265, Ro_tl, Ft_Simm13, "{0..2}");
!!#         IJ_generate_from_token("diag.j", 266,1, th0, Ro_tl, tWRPR_TL_I, -1);;
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 268,1, th0, ijdefault, tCHANGE_NONHPRIV, -1);;
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 270,1, th0, ijdefault, tCHANGE_NONPRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_randtl: tWRPR_TL_I %ropr  Ro_tl
!!#     {
!!#         IJ_printf("diag.j", 278, th0, "change_to_randtl_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_set_ropr_fld("diag.j", 280, Ro_tl, Ft_Simm13, "{3..5}");
!!#             IJ_generate_from_token("diag.j", 281,1, th0, ijdefault, tCHANGE_HPRIV, -1);;
!!#         } else {
!!#             IJ_set_ropr_fld("diag.j", 283, Ro_tl, Ft_Simm13, "{0..2}");
!!#             IJ_generate_from_token("diag.j", 284,1, th0, ijdefault, tCHANGE_PRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_tl1 : tCHANGE_TO_TL1
!!#     {
!!#         IJ_printf("diag.j", 292, th0, "change_to_tl1_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 294, th0, "\tta T_CHANGE_HPRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 296, th0, "\tta T_CHANGE_PRIV\n");
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
!!#         IJ_printf("diag.j", 344, th0, "\totherw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      } else {
!!#         IJ_printf("diag.j", 346, th0, "\tinvalw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!# load_r: tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDX_R 
!!#         | tLDQF_R 
!!# ;
!!# 
!!# load_i: tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDUW_I | tLDX_I 
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
!!#         IJ_printf("diag.j", 431, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 432,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 433,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 434, th0, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 438, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 439,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 441,1, th0, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 443, th0, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 445, th0, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 450, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 451,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 453, th0, "\tilltrap\n");
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 455,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 457,1, th0, ijdefault, tFSQRTd, tLDQF_R, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 464, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 465,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 469, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 470,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 474, th0, "DS_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 475, th0, "\tnop\n\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 476, th0, "\tjmp %%g2\n");
!!#     }
!!# ;
!!# 
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

