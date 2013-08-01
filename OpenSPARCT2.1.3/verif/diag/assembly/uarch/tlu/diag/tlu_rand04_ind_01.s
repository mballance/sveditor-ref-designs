/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_01.s
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
	mov 0xb2, %r14
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
	mov 0xb2, %r14
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
	mov 0x32, %r14
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
	mov 0xb3, %r14
	mov 0xb5, %r30
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
splash_htba_0:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x91d02033  ! 1: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d9020c4  ! 2: WRPR_PSTATE_I	wrpr	%r0, 0x00c4, %pstate
	.word 0x89a009c7  ! 3: FDIVd	fdivd	%f0, %f38, %f4
	.word 0x87802089  ! 4: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9b500000  ! 5: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x8d902a56  ! 6: WRPR_PSTATE_I	wrpr	%r0, 0x0a56, %pstate
	.word 0x91d02030  ! 7: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8f514000  ! 8: RDPR_TBA	rdpr	%tba, %r7
	.word 0x8198234c  ! 9: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034c, %hpstate
	.word 0xceffc027  ! 10: SWAPA_R	swapa	%r7, [%r31 + %r7] 0x01
	.word 0x81982ad4  ! 11: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad4, %hpstate
	.word 0x8198240c  ! 12: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040c, %hpstate
	.word 0xa1902003  ! 13: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x91d02033  ! 14: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xcfe7c027  ! 15: CASA_I	casa	[%r31] 0x 1, %r7, %r7
	.word 0x8f6b4003  ! 16: SDIVX_R	sdivx	%r13, %r3, %r7
splash_lsu_1:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 17: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8551c000  ! 18: RDPR_TL	rdpr	%tl, %r2
	.word 0xa1902007  ! 19: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xc48008a0  ! 20: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 21: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb0d2e001  ! 22: UMULcc_I	umulcc 	%r11, 0x0001, %r24
	.word 0xa1902004  ! 23: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_tba_2:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 24: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8751c000  ! 25: RDPR_TL	rdpr	%tl, %r3
	.word 0x81982e54  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e54, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xb4846001  ! 28: ADDcc_I	addcc 	%r17, 0x0001, %r26
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 29: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf447c000  ! 30: LDSW_R	ldsw	[%r31 + %r0], %r26
	.word 0x879022d8  ! 31: WRPR_TT_I	wrpr	%r0, 0x02d8, %tt
	.word 0xad500000  ! 32: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x8951c000  ! 33: RDPR_TL	<illegal instruction>
	.word 0x87a5c9c3  ! 34: FDIVd	fdivd	%f54, %f34, %f34
	.word 0x91500000  ! 35: RDPR_TPC	<illegal instruction>
	.word 0x81982dcf  ! 36: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcf, %hpstate
	.word 0x93902005  ! 37: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 38: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_3:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 39: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 40: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 41: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8049000b  ! 42: MULX_R	mulx 	%r4, %r11, %r0
	.word 0x88c2a001  ! 43: ADDCcc_I	addccc 	%r10, 0x0001, %r4
	.word 0xb7a00541  ! 44: FSQRTd	fsqrt	
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 45: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 46: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902002  ! 47: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x9f802001  ! 48: SIR	sir	0x0001
	.word 0xa1902001  ! 49: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8d90244d  ! 50: WRPR_PSTATE_I	wrpr	%r0, 0x044d, %pstate
	.word 0xaba01a72  ! 51: FqTOi	fqtoi	
	.word 0x906ea001  ! 52: UDIVX_I	udivx 	%r26, 0x0001, %r8
	.word 0xa9a109c2  ! 53: FDIVd	fdivd	%f4, %f2, %f20
splash_lsu_4:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 54: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91a349f4  ! 55: FDIVq	dis not found

	.word 0x3e800001  ! 56: BVC	bvc,a	<label_0x1>
	.word 0x91540000  ! 57: RDPR_GL	rdpr	%-, %r8
splash_tba_5:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 58: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_6:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 59: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd0880e80  ! 60: LDUBA_R	lduba	[%r0, %r0] 0x74, %r8
	.word 0x8ba01a63  ! 61: FqTOi	fqtoi	
	.word 0x28700001  ! 62: BPLEU	<illegal instruction>
	.word 0xcad00e60  ! 63: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r5
	.word 0x9ba149cd  ! 64: FDIVd	fdivd	%f36, %f44, %f44
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8790226f  ! 66: WRPR_TT_I	wrpr	%r0, 0x026f, %tt
	.word 0xa1a349f8  ! 67: FDIVq	dis not found

	.word 0x3a800001  ! 68: BCC	bcc,a	<label_0x1>
	.word 0x8d902445  ! 69: WRPR_PSTATE_I	wrpr	%r0, 0x0445, %pstate
	.word 0x83d02034  ! 70: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87902338  ! 71: WRPR_TT_I	wrpr	%r0, 0x0338, %tt
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902005  ! 74: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xb1702001  ! 75: POPC_I	popc	0x0001, %r24
	.word 0x93902003  ! 76: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87902381  ! 77: WRPR_TT_I	wrpr	%r0, 0x0381, %tt
	.word 0x8d902002  ! 78: WRPR_PSTATE_I	wrpr	%r0, 0x0002, %pstate
	.word 0x91d02035  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa751c000  ! 80: RDPR_TL	rdpr	%tl, %r19
	.word 0x81a24dd1  ! 81: FdMULq	fdmulq	
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902007  ! 83: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93902002  ! 84: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982d06  ! 85: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d06, %hpstate
	.word 0xc0ffc031  ! 86: SWAPA_R	swapa	%r0, [%r31 + %r17] 0x01
DS_7:
	.word 0x32800001  ! 88: BNE	bne,a	<label_0x1>
	pdist %f24, %f14, %f22
	.word 0xa7b34304  ! 87: ALLIGNADDRESS	alignaddr	%r13, %r4, %r19
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 88: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_8:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 89: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 90: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_9:
	.word 0x32800001  ! 92: BNE	bne,a	<label_0x1>
	.word 0xd5308007  ! 92: STQF_R	-	%f10, [%r7, %r2]
	normalw
	.word 0x85458000  ! 91: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x8d802000  ! 92: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_10:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 93: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_randtl_11:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 94: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x8ba000c0  ! 95: FNEGd	fnegd	%f0, %f36
change_to_randtl_12:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 96: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x83500000  ! 97: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x8d902ada  ! 98: WRPR_PSTATE_I	wrpr	%r0, 0x0ada, %pstate
	.word 0x87802088  ! 99: WRASI_I	wr	%r0, 0x0088, %asi
splash_tba_13:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 100: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982a9e  ! 101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9e, %hpstate
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 102: Tcc_R	tne	icc_or_xcc, %r0 + %r30
reduce_priv_level_14:
	.word 0x8f902002  ! 104: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8982c004  ! 103: WRTICK_R	wr	%r11, %r4, %tick
	.word 0x8fb24ff3  ! 104: FONES	fones	%f7
	.word 0x8d902c95  ! 105: WRPR_PSTATE_I	wrpr	%r0, 0x0c95, %pstate
	.word 0xb04dc00a  ! 106: MULX_R	mulx 	%r23, %r10, %r24
	.word 0x8d9024d3  ! 107: WRPR_PSTATE_I	wrpr	%r0, 0x04d3, %pstate
	.word 0xa190200e  ! 108: WRPR_GL_I	wrpr	%r0, 0x000e, %-
DS_15:
	.word 0x34800001  ! 110: BG	bg,a	<label_0x1>
	allclean
	.word 0x8fb0030c  ! 109: ALLIGNADDRESS	alignaddr	%r0, %r12, %r7
	.word 0xa9508000  ! 110: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x93902002  ! 111: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02034  ! 112: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8790211a  ! 113: WRPR_TT_I	wrpr	%r0, 0x011a, %tt
	.word 0x8790220d  ! 114: WRPR_TT_I	wrpr	%r0, 0x020d, %tt
	.word 0x97504000  ! 115: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0x8198210d  ! 116: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010d, %hpstate
	.word 0xaf508000  ! 117: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x8d902e1b  ! 118: WRPR_PSTATE_I	wrpr	%r0, 0x0e1b, %pstate
	.word 0x91d02035  ! 119: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02030  ! 120: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x87902123  ! 121: WRPR_TT_I	wrpr	%r0, 0x0123, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xeecfe020  ! 123: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r23
DS_16:
	.word 0x20800001  ! 125: BN	bn,a	<label_0x1>
	illtrap
	.word 0xcb10800b  ! 125: LDQF_R	-	[%r2, %r11], %f5
	.word 0x93a2c828  ! 124: FADDs	fadds	%f11, %f8, %f9
	.word 0x81982b45  ! 125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b45, %hpstate
	.word 0x93902000  ! 126: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x99902002  ! 127: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 128: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 129: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x819829d6  ! 130: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d6, %hpstate
	.word 0x93902000  ! 131: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982a1f  ! 132: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1f, %hpstate
	.word 0xd28008a0  ! 133: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 134: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 136: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902212  ! 137: WRPR_TT_I	wrpr	%r0, 0x0212, %tt
	.word 0x91d02035  ! 138: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x94ddc008  ! 139: SMULcc_R	smulcc 	%r23, %r8, %r10
	.word 0xb0d1001b  ! 140: UMULcc_R	umulcc 	%r4, %r27, %r24
	.word 0x97a01a69  ! 141: FqTOi	fqtoi	
	.word 0xa1902004  ! 142: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd69fe001  ! 143: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 144: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982884  ! 145: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0884, %hpstate
	.word 0x87802004  ! 146: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x83a00564  ! 147: FSQRTq	fsqrt	
	.word 0xc217c000  ! 148: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0xc277c004  ! 149: STX_R	stx	%r1, [%r31 + %r4]
	.word 0xc2c00e60  ! 150: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r1
	.word 0x94854003  ! 151: ADDcc_R	addcc 	%r21, %r3, %r10
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 152: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 153: WRASI_I	wr	%r0, 0x0089, %asi
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 154: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 155: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xaa818010  ! 156: ADDcc_R	addcc 	%r6, %r16, %r21
change_to_tl1_17:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93d02035  ! 158: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x81982edd  ! 159: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edd, %hpstate
	.word 0x2e700001  ! 160: BPVS	<illegal instruction>
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 161: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879020c1  ! 162: WRPR_TT_I	wrpr	%r0, 0x00c1, %tt
	.word 0x8d902813  ! 163: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 165: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902002  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902001  ! 167: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa0c52001  ! 168: ADDCcc_I	addccc 	%r20, 0x0001, %r16
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8fa000cd  ! 170: FNEGd	fnegd	%f44, %f38
	.word 0x8d802000  ! 171: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3c800001  ! 172: BPOS	bpos,a	<label_0x1>
reduce_priv_level_18:
	.word 0x8f902001  ! 174: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 173: SIAM	siam	1
	.word 0x8790228e  ! 174: WRPR_TT_I	wrpr	%r0, 0x028e, %tt
	.word 0x36700001  ! 175: BPGE	<illegal instruction>
	.word 0x8d9020c5  ! 176: WRPR_PSTATE_I	wrpr	%r0, 0x00c5, %pstate
	.word 0x81702001  ! 177: POPC_I	popc	0x0001, %r0
	.word 0xa1902001  ! 178: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x85a00dc9  ! 179: FdMULq	fdmulq	
	.word 0x9f802001  ! 180: SIR	sir	0x0001
	.word 0x30800001  ! 181: BA	ba,a	<label_0x1>
DS_19:
	.word 0x20800001  ! 183: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 183: BNE	bne,a	<label_0x1>
	.word 0xa7a00552  ! 183: FSQRTd	fsqrt	
	.word 0xb3a4883b  ! 182: FADDs	fadds	%f18, %f27, %f25
splash_tba_20:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 183: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 184: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 185: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x28700001  ! 186: BPLEU	<illegal instruction>
DS_21:
	.word 0x22800001  ! 188: BE	be,a	<label_0x1>
	.word 0x20800001  ! 188: BN	bn,a	<label_0x1>
	.word 0x83a00542  ! 188: FSQRTd	fsqrt	
	.word 0xb1a18837  ! 187: FADDs	fadds	%f6, %f23, %f24
change_to_randtl_22:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 188: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xf057e001  ! 189: LDSH_I	ldsh	[%r31 + 0x0001], %r24
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 190: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_23:
	.word 0x22800001  ! 192: BE	be,a	<label_0x1>
	.word 0xc7356001  ! 192: STQF_I	-	%f3, [0x0001, %r21]
	normalw
	.word 0xa1458000  ! 191: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0xe08fe010  ! 192: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r16
	.word 0xe0d7e010  ! 193: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
	.word 0x81982444  ! 194: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0444, %hpstate
	.word 0xe0cfe000  ! 195: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r16
	.word 0x93902000  ! 196: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa190200a  ! 197: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x879021d8  ! 198: WRPR_TT_I	wrpr	%r0, 0x01d8, %tt
	.word 0x8d90244b  ! 199: WRPR_PSTATE_I	wrpr	%r0, 0x044b, %pstate
	.word 0x91a01a63  ! 200: FqTOi	fqtoi	
	.word 0xaa81c00a  ! 201: ADDcc_R	addcc 	%r7, %r10, %r21
	.word 0xea77c00a  ! 202: STX_R	stx	%r21, [%r31 + %r10]
	.word 0x87902325  ! 203: WRPR_TT_I	wrpr	%r0, 0x0325, %tt
	.word 0x8d802000  ! 204: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x819827cf  ! 205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cf, %hpstate
splash_htba_24:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 206: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x83d02031  ! 207: Tcc_I	te	icc_or_xcc, %r0 + 49
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 208: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902896  ! 209: WRPR_PSTATE_I	wrpr	%r0, 0x0896, %pstate
	.word 0x93902006  ! 210: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_tba_25:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 211: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902012  ! 212: WRPR_TT_I	wrpr	%r0, 0x0012, %tt
	.word 0xea800aa0  ! 213: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r21
DS_26:
	.word 0x32800001  ! 215: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 214: SAVE_R	save	%r31, %r0, %r31
reduce_priv_level_27:
	.word 0x8f902000  ! 216: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 215: SIAM	siam	1
	.word 0x91d02031  ! 216: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x9b50c000  ! 217: RDPR_TT	rdpr	%tt, %r13
splash_htba_28:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 218: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902005  ! 219: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 220: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 221: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 222: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8790227b  ! 223: WRPR_TT_I	wrpr	%r0, 0x027b, %tt
change_to_tl1_29:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
splash_tba_30:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 225: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81b00ff0  ! 226: FONES	fones	%f0
	.word 0x8d902c1c  ! 227: WRPR_PSTATE_I	wrpr	%r0, 0x0c1c, %pstate
	.word 0x8cf8c006  ! 228: SDIVcc_R	sdivcc 	%r3, %r6, %r6
	.word 0xb1500000  ! 229: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8790215a  ! 230: WRPR_TT_I	wrpr	%r0, 0x015a, %tt
	.word 0x93902000  ! 231: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879021d5  ! 232: WRPR_TT_I	wrpr	%r0, 0x01d5, %tt
	.word 0x8d90245d  ! 233: WRPR_PSTATE_I	wrpr	%r0, 0x045d, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 234: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 235: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf0c004a0  ! 236: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r24
	.word 0xa1902001  ! 237: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x879021fe  ! 238: WRPR_TT_I	wrpr	%r0, 0x01fe, %tt
	.word 0x81982357  ! 239: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0357, %hpstate
	.word 0x9f802001  ! 240: SIR	sir	0x0001
	.word 0x8d90248e  ! 241: WRPR_PSTATE_I	wrpr	%r0, 0x048e, %pstate
	.word 0x91d02031  ! 242: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902002  ! 243: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902c86  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x0c86, %pstate
	.word 0x879022da  ! 245: WRPR_TT_I	wrpr	%r0, 0x02da, %tt
	.word 0x8198238d  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038d, %hpstate
	.word 0x8069c00d  ! 247: UDIVX_R	udivx 	%r7, %r13, %r0
	.word 0xc0dfe000  ! 248: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r0
	.word 0x8ba000c3  ! 249: FNEGd	fnegd	%f34, %f36
	.word 0x93902003  ! 250: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xca7fe001  ! 251: SWAP_I	swap	%r5, [%r31 + 0x0001]
DS_31:
	.word 0x20800001  ! 253: BN	bn,a	<label_0x1>
	pdist %f22, %f4, %f2
	.word 0x95b18308  ! 252: ALLIGNADDRESS	alignaddr	%r6, %r8, %r10
	.word 0x91d02030  ! 253: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902007  ! 254: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x91d02034  ! 255: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d02030  ! 256: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xd437c008  ! 257: STH_R	sth	%r10, [%r31 + %r8]
	ta	T_CHANGE_TO_TL0	! macro
splash_lsu_32:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 259: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_33:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 260: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9b514000  ! 261: RDPR_TBA	rdpr	%tba, %r13
	.word 0x879021ae  ! 262: WRPR_TT_I	wrpr	%r0, 0x01ae, %tt
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 263: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_34:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 264: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982fc6  ! 265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc6, %hpstate
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 266: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 267: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_35:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 268: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879023c7  ! 269: WRPR_TT_I	wrpr	%r0, 0x03c7, %tt
	.word 0x87902286  ! 270: WRPR_TT_I	wrpr	%r0, 0x0286, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x879022b0  ! 272: WRPR_TT_I	wrpr	%r0, 0x02b0, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902080  ! 274: WRPR_TT_I	wrpr	%r0, 0x0080, %tt
	.word 0x93902006  ! 275: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0xa2de801a  ! 277: SMULcc_R	smulcc 	%r26, %r26, %r17
	.word 0x8c842001  ! 278: ADDcc_I	addcc 	%r16, 0x0001, %r6
	.word 0x87902356  ! 279: WRPR_TT_I	wrpr	%r0, 0x0356, %tt
	ta	T_CHANGE_PRIV	! macro
DS_36:
	.word 0x34800001  ! 282: BG	bg,a	<label_0x1>
	.word 0xf5336001  ! 282: STQF_I	-	%f26, [0x0001, %r13]
	normalw
	.word 0x8b458000  ! 281: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x8d902e41  ! 282: WRPR_PSTATE_I	wrpr	%r0, 0x0e41, %pstate
	.word 0x91d02033  ! 283: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_tl1_37:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1902001  ! 285: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa190200a  ! 286: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xcac804a0  ! 287: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
	.word 0x83d02030  ! 288: Tcc_I	te	icc_or_xcc, %r0 + 48
reduce_priv_level_38:
	.word 0x8f902001  ! 290: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83692001  ! 289: SDIVX_I	sdivx	%r4, 0x0001, %r1
	.word 0x87a689d5  ! 290: FDIVd	fdivd	%f26, %f52, %f34
	.word 0x8d802000  ! 291: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902006  ! 292: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xb4852001  ! 293: ADDcc_I	addcc 	%r20, 0x0001, %r26
	.word 0xf4c7e010  ! 294: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r26
	.word 0x87802010  ! 295: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x879023b3  ! 296: WRPR_TT_I	wrpr	%r0, 0x03b3, %tt
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 297: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02030  ! 298: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x93d02032  ! 299: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8a862001  ! 300: ADDcc_I	addcc 	%r24, 0x0001, %r5
	.word 0x81982a06  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a06, %hpstate
	.word 0xcbe7c035  ! 302: CASA_I	casa	[%r31] 0x 1, %r21, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902005  ! 304: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 305: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 306: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902004  ! 307: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d802000  ! 308: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9350c000  ! 309: RDPR_TT	rdpr	%tt, %r9
	.word 0x93508000  ! 310: RDPR_TSTATE	rdpr	%tstate, %r9
	.word 0x30800001  ! 311: BA	ba,a	<label_0x1>
	.word 0x96fa6001  ! 312: SDIVcc_I	sdivcc 	%r9, 0x0001, %r11
	.word 0x86d1e001  ! 313: UMULcc_I	umulcc 	%r7, 0x0001, %r3
	.word 0xc68008a0  ! 314: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x879022e5  ! 315: WRPR_TT_I	wrpr	%r0, 0x02e5, %tt
	.word 0x93902005  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87902116  ! 317: WRPR_TT_I	wrpr	%r0, 0x0116, %tt
DS_39:
	.word 0x32800001  ! 319: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 318: RESTORE_R	restore	%r31, %r0, %r31
DS_40:
	.word 0x34800001  ! 320: BG	bg,a	<label_0x1>
	illtrap
	.word 0x83a00544  ! 320: FSQRTd	fsqrt	
	.word 0xa7a6882a  ! 319: FADDs	fadds	%f26, %f10, %f19
	.word 0xe6c00e40  ! 320: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r19
	.word 0x87902070  ! 321: WRPR_TT_I	wrpr	%r0, 0x0070, %tt
	.word 0x8790227a  ! 322: WRPR_TT_I	wrpr	%r0, 0x027a, %tt
	.word 0x93d02035  ! 323: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xe697e010  ! 324: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r19
	.word 0x86c26001  ! 325: ADDCcc_I	addccc 	%r9, 0x0001, %r3
	.word 0x99902003  ! 326: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xc737c00a  ! 327: STQF_R	-	%f3, [%r10, %r31]
	.word 0x8fa00565  ! 328: FSQRTq	fsqrt	
	.word 0xa8c0e001  ! 329: ADDCcc_I	addccc 	%r3, 0x0001, %r20
	.word 0xa1902009  ! 330: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87902047  ! 331: WRPR_TT_I	wrpr	%r0, 0x0047, %tt
	.word 0x87504000  ! 332: RDPR_TNPC	rdpr	%tnpc, %r3
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 333: Tcc_R	te	icc_or_xcc, %r0 + %r30
reduce_priv_level_41:
	.word 0x8f902000  ! 335: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 334: SIAM	siam	1
	.word 0xa1902004  ! 335: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d90244f  ! 336: WRPR_PSTATE_I	wrpr	%r0, 0x044f, %pstate
	.word 0x8a6b2001  ! 337: UDIVX_I	udivx 	%r12, 0x0001, %r5
splash_lsu_42:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 338: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 339: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x819829df  ! 340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09df, %hpstate
	.word 0x93d02034  ! 341: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa1902007  ! 342: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 343: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcb37e001  ! 344: STQF_I	-	%f5, [0x0001, %r31]
	.word 0x8d802000  ! 345: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99508000  ! 346: RDPR_TSTATE	rdpr	%tstate, %r12
DS_43:
	.word 0x32800001  ! 348: BNE	bne,a	<label_0x1>
	.word 0xe730a001  ! 348: STQF_I	-	%f19, [0x0001, %r2]
	normalw
	.word 0xa9458000  ! 347: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x93d02031  ! 348: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xb0d90017  ! 349: SMULcc_R	smulcc 	%r4, %r23, %r24
	.word 0x93902001  ! 350: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982b9f  ! 352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9f, %hpstate
change_to_tl1_44:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_45:
	.word 0x22800001  ! 355: BE	be,a	<label_0x1>
	allclean
	.word 0x87b2c30a  ! 354: ALLIGNADDRESS	alignaddr	%r11, %r10, %r3
	.word 0x8198254d  ! 355: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054d, %hpstate
	.word 0xc68008a0  ! 356: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xa6d2e001  ! 357: UMULcc_I	umulcc 	%r11, 0x0001, %r19
DS_46:
	.word 0x22800001  ! 359: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 358: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d9022c1  ! 359: WRPR_PSTATE_I	wrpr	%r0, 0x02c1, %pstate
	.word 0x8ba0cdc2  ! 360: FdMULq	fdmulq	
	ta	T_CHANGE_PRIV	! macro
	.word 0x879022ea  ! 362: WRPR_TT_I	wrpr	%r0, 0x02ea, %tt
	.word 0xa1902001  ! 363: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x9950c000  ! 364: RDPR_TT	rdpr	%tt, %r12
	.word 0x83d02030  ! 365: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x91d02034  ! 366: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902007  ! 367: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd847c000  ! 368: LDSW_R	ldsw	[%r31 + %r0], %r12
	.word 0x93d02032  ! 369: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8c6ac00d  ! 370: UDIVX_R	udivx 	%r11, %r13, %r6
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 371: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9ba449cb  ! 372: FDIVd	fdivd	%f48, %f42, %f44
	.word 0x879023ad  ! 373: WRPR_TT_I	wrpr	%r0, 0x03ad, %tt
	.word 0x93d02032  ! 374: Tcc_I	tne	icc_or_xcc, %r0 + 50
change_to_tl1_47:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xad540000  ! 376: RDPR_GL	rdpr	%-, %r22
	.word 0x879022b0  ! 377: WRPR_TT_I	wrpr	%r0, 0x02b0, %tt
	.word 0x9551c000  ! 378: RDPR_TL	rdpr	%tl, %r10
	.word 0x93902003  ! 379: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_randtl_48:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 380: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa190200d  ! 381: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa1902002  ! 382: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x91d02030  ! 383: Tcc_I	ta	icc_or_xcc, %r0 + 48
splash_htba_49:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 384: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802000  ! 385: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 386: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 387: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8198244f  ! 388: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044f, %hpstate
	.word 0xb1a5cdc6  ! 389: FdMULq	fdmulq	
	.word 0x9b50c000  ! 390: RDPR_TT	rdpr	%tt, %r13
	.word 0x8d902210  ! 391: WRPR_PSTATE_I	wrpr	%r0, 0x0210, %pstate
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 392: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 393: Tcc_I	ta	icc_or_xcc, %r0 + 51
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 394: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xb150c000  ! 395: RDPR_TT	rdpr	%tt, %r24
	.word 0x81982b04  ! 396: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b04, %hpstate
	.word 0x93d02035  ! 397: Tcc_I	tne	icc_or_xcc, %r0 + 53
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 398: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xf08008a0  ! 399: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x81982c95  ! 400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c95, %hpstate
	.word 0xa06aa001  ! 401: UDIVX_I	udivx 	%r10, 0x0001, %r16
	.word 0x93902003  ! 402: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902002  ! 403: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x86fb6001  ! 404: SDIVcc_I	sdivcc 	%r13, 0x0001, %r3
	.word 0xc7e7c026  ! 405: CASA_I	casa	[%r31] 0x 1, %r6, %r3
splash_lsu_50:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 406: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc61fc000  ! 407: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x87802004  ! 408: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x83d02034  ! 409: Tcc_I	te	icc_or_xcc, %r0 + 52
splash_lsu_51:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 410: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 411: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_52:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 412: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xc737e001  ! 413: STQF_I	-	%f3, [0x0001, %r31]
splash_htba_53:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 414: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 415: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 416: BVS	bvs,a	<label_0x1>
	.word 0x83d02032  ! 417: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x85514000  ! 418: RDPR_TBA	rdpr	%tba, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902005  ! 420: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x93a089c9  ! 421: FDIVd	fdivd	%f2, %f40, %f40
	.word 0x946d2001  ! 422: UDIVX_I	udivx 	%r20, 0x0001, %r10
DS_54:
	.word 0x20800001  ! 424: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 423: SAVE_R	save	%r31, %r0, %r31
	.word 0xd47fe001  ! 424: SWAP_I	swap	%r10, [%r31 + 0x0001]
	.word 0x93d02034  ! 425: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8d9020d4  ! 426: WRPR_PSTATE_I	wrpr	%r0, 0x00d4, %pstate
	.word 0x8d902ec1  ! 427: WRPR_PSTATE_I	wrpr	%r0, 0x0ec1, %pstate
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 428: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902ad4  ! 429: WRPR_PSTATE_I	wrpr	%r0, 0x0ad4, %pstate
	.word 0x81982355  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0355, %hpstate
	.word 0x93902000  ! 431: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd48fe030  ! 432: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0x8d90261a  ! 433: WRPR_PSTATE_I	wrpr	%r0, 0x061a, %pstate
	.word 0x91a000d2  ! 434: FNEGd	fnegd	%f18, %f8
	.word 0x87902370  ! 435: WRPR_TT_I	wrpr	%r0, 0x0370, %tt
	.word 0x8198271f  ! 436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071f, %hpstate
DS_55:
	.word 0x20800001  ! 438: BN	bn,a	<label_0x1>
	pdist %f16, %f30, %f22
	.word 0x81b40308  ! 437: ALLIGNADDRESS	alignaddr	%r16, %r8, %r0
	.word 0x81982a4e  ! 438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4e, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa76cc005  ! 440: SDIVX_R	sdivx	%r19, %r5, %r19
DS_56:
	.word 0x34800001  ! 442: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 441: SAVE_R	save	%r31, %r0, %r31
DS_57:
	.word 0x22800001  ! 443: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 442: SAVE_R	save	%r31, %r0, %r31
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d540000  ! 444: RDPR_GL	rdpr	%-, %r6
splash_lsu_58:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 445: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 446: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802004  ! 447: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81982a05  ! 448: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a05, %hpstate
	.word 0x8198268c  ! 449: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068c, %hpstate
	.word 0x819828d4  ! 450: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d4, %hpstate
DS_59:
	.word 0x34800001  ! 452: BG	bg,a	<label_0x1>
	pdist %f20, %f10, %f2
	.word 0x89b18304  ! 451: ALLIGNADDRESS	alignaddr	%r6, %r4, %r4
	.word 0xc927e001  ! 452: STF_I	st	%f4, [0x0001, %r31]
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 453: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x906e001a  ! 454: UDIVX_R	udivx 	%r24, %r26, %r8
	.word 0xaf540000  ! 455: RDPR_GL	rdpr	%-, %r23
	.word 0x8d902cdf  ! 456: WRPR_PSTATE_I	wrpr	%r0, 0x0cdf, %pstate
	.word 0x87902301  ! 457: WRPR_TT_I	wrpr	%r0, 0x0301, %tt
	.word 0x99902005  ! 458: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xacd80008  ! 459: SMULcc_R	smulcc 	%r0, %r8, %r22
	.word 0x8d902c55  ! 460: WRPR_PSTATE_I	wrpr	%r0, 0x0c55, %pstate
	.word 0x91504000  ! 461: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x8d902c5f  ! 462: WRPR_PSTATE_I	wrpr	%r0, 0x0c5f, %pstate
DS_60:
	.word 0x20800001  ! 464: BN	bn,a	<label_0x1>
	allclean
	.word 0x8bb18310  ! 463: ALLIGNADDRESS	alignaddr	%r6, %r16, %r5
	.word 0xcb37e001  ! 464: STQF_I	-	%f5, [0x0001, %r31]
	.word 0x93d02034  ! 465: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x90fca001  ! 466: SDIVcc_I	sdivcc 	%r18, 0x0001, %r8
	.word 0xa1902009  ! 467: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87802016  ! 468: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87902010  ! 469: WRPR_TT_I	wrpr	%r0, 0x0010, %tt
	.word 0x81982e54  ! 470: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e54, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83d02034  ! 472: Tcc_I	te	icc_or_xcc, %r0 + 52
splash_lsu_61:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 473: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_62:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 474: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x93902002  ! 475: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8da0055b  ! 476: FSQRTd	fsqrt	
	.word 0x81982b44  ! 477: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b44, %hpstate
	.word 0x81982cd7  ! 478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd7, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902cc1  ! 481: WRPR_PSTATE_I	wrpr	%r0, 0x0cc1, %pstate
	.word 0x90c16001  ! 482: ADDCcc_I	addccc 	%r5, 0x0001, %r8
	.word 0x93a00546  ! 483: FSQRTd	fsqrt	
	.word 0x9ad58002  ! 484: UMULcc_R	umulcc 	%r22, %r2, %r13
	.word 0x879023ca  ! 485: WRPR_TT_I	wrpr	%r0, 0x03ca, %tt
	.word 0x9f802001  ! 486: SIR	sir	0x0001
DS_63:
	.word 0x32800001  ! 488: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 487: SAVE_R	save	%r31, %r0, %r31
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x2e700001  ! 489: BPVS	<illegal instruction>
	.word 0x86a84008  ! 490: ANDNcc_R	andncc 	%r1, %r8, %r3
	.word 0x93902001  ! 491: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x36800001  ! 492: BGE	bge,a	<label_0x1>
	.word 0x87902078  ! 493: WRPR_TT_I	wrpr	%r0, 0x0078, %tt
	.word 0xc737c008  ! 494: STQF_R	-	%f3, [%r8, %r31]
	.word 0xb7508000  ! 495: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x93d02031  ! 496: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xa190200d  ! 497: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902006  ! 498: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d9020d9  ! 499: WRPR_PSTATE_I	wrpr	%r0, 0x00d9, %pstate
splash_htba_64:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 500: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x88d98003  ! 501: SMULcc_R	smulcc 	%r6, %r3, %r4
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 502: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90224c  ! 503: WRPR_PSTATE_I	wrpr	%r0, 0x024c, %pstate
	.word 0x8d902c0b  ! 504: WRPR_PSTATE_I	wrpr	%r0, 0x0c0b, %pstate
	.word 0xb76d4000  ! 505: SDIVX_R	sdivx	%r21, %r0, %r27
	.word 0x87902297  ! 506: WRPR_TT_I	wrpr	%r0, 0x0297, %tt
	.word 0x81982f56  ! 507: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f56, %hpstate
change_to_randtl_65:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 508: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x81982116  ! 509: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0116, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 510: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_tl1_66:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
change_to_randtl_67:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 512: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xf69004a0  ! 513: LDUHA_R	lduha	[%r0, %r0] 0x25, %r27
	.word 0xf6d004a0  ! 514: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r27
	.word 0xf68008a0  ! 515: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 516: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf6800a80  ! 517: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r27
	.word 0x93902007  ! 518: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xf6d7e010  ! 519: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r27
reduce_priv_level_68:
	.word 0x8f902000  ! 521: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8981c002  ! 520: WRTICK_R	wr	%r7, %r2, %tick
	.word 0x93902007  ! 521: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87902271  ! 522: WRPR_TT_I	wrpr	%r0, 0x0271, %tt
	.word 0x95508000  ! 523: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x93a00546  ! 524: FSQRTd	fsqrt	
	.word 0x82fcc006  ! 525: SDIVcc_R	sdivcc 	%r19, %r6, %r1
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xad500000  ! 527: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x87902024  ! 528: WRPR_TT_I	wrpr	%r0, 0x0024, %tt
	.word 0x95508000  ! 529: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x81982307  ! 530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
DS_69:
	.word 0x20800001  ! 532: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 532: BE	be,a	<label_0x1>
	.word 0xc1108015  ! 532: LDQF_R	-	[%r2, %r21], %f0
	.word 0x97a5c82d  ! 531: FADDs	fadds	%f23, %f13, %f11
	.word 0xb751c000  ! 532: RDPR_TL	rdpr	%tl, %r27
	.word 0x9f802001  ! 533: SIR	sir	0x0001
	.word 0xa190200f  ! 534: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x93902006  ! 535: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902006  ! 536: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_70:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 537: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 538: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81982d5c  ! 539: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5c, %hpstate
splash_tba_71:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 540: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902a16  ! 541: WRPR_PSTATE_I	wrpr	%r0, 0x0a16, %pstate
	.word 0xf67fe001  ! 542: SWAP_I	swap	%r27, [%r31 + 0x0001]
	.word 0x8198295e  ! 543: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095e, %hpstate
	.word 0x8f6b4019  ! 544: SDIVX_R	sdivx	%r13, %r25, %r7
change_to_randtl_72:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 545: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa86ec004  ! 546: UDIVX_R	udivx 	%r27, %r4, %r20
	.word 0xe88008a0  ! 547: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
reduce_priv_level_73:
	.word 0x8f902000  ! 551: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 550: SIAM	siam	1
	.word 0xa4d4c009  ! 551: UMULcc_R	umulcc 	%r19, %r9, %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902a4a  ! 553: WRPR_PSTATE_I	wrpr	%r0, 0x0a4a, %pstate
	.word 0x8d902e05  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x0e05, %pstate
	.word 0xae82c002  ! 555: ADDcc_R	addcc 	%r11, %r2, %r23
	.word 0x9f802001  ! 556: SIR	sir	0x0001
	.word 0x9351c000  ! 557: RDPR_TL	rdpr	%tl, %r9
DS_74:
	.word 0x32800001  ! 559: BNE	bne,a	<label_0x1>
	.word 0xc135c001  ! 559: STQF_R	-	%f0, [%r1, %r23]
	normalw
	.word 0x9b458000  ! 558: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xda8008a0  ! 559: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x9b51c000  ! 560: RDPR_TL	rdpr	%tl, %r13
	.word 0x87802010  ! 561: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x83a000d0  ! 562: FNEGd	fnegd	%f16, %f32
	.word 0xc2d7e010  ! 563: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
	.word 0xc28008a0  ! 564: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x93902007  ! 565: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc237c010  ! 566: STH_R	sth	%r1, [%r31 + %r16]
	.word 0xa190200e  ! 567: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x87540000  ! 568: RDPR_GL	rdpr	%-, %r3
	.word 0x8e81e001  ! 569: ADDcc_I	addcc 	%r7, 0x0001, %r7
reduce_priv_level_75:
	.word 0x8f902000  ! 571: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1834008  ! 570: WR_STICK_REG_R	wr	%r13, %r8, %-
DS_76:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 571: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xcecfe000  ! 572: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r7
	.word 0x91d02030  ! 573: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d90240e  ! 574: WRPR_PSTATE_I	wrpr	%r0, 0x040e, %pstate
	.word 0x819823c4  ! 575: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c4, %hpstate
	.word 0xa8fe2001  ! 576: SDIVcc_I	sdivcc 	%r24, 0x0001, %r20
	.word 0x8d902899  ! 577: WRPR_PSTATE_I	wrpr	%r0, 0x0899, %pstate
change_to_randtl_77:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 578: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x81982d1f  ! 579: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1f, %hpstate
DS_78:
	.word 0x32800001  ! 581: BNE	bne,a	<label_0x1>
	.word 0xe3334011  ! 581: STQF_R	-	%f17, [%r17, %r13]
	normalw
	.word 0x83458000  ! 580: RD_SOFTINT_REG	rd	%softint, %r1
DS_79:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 581: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x9b540000  ! 583: RDPR_GL	rdpr	%-, %r13
	.word 0x93902005  ! 584: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902a0d  ! 585: WRPR_PSTATE_I	wrpr	%r0, 0x0a0d, %pstate
	.word 0x906b0019  ! 586: UDIVX_R	udivx 	%r12, %r25, %r8
	.word 0x95540000  ! 587: RDPR_GL	rdpr	%-, %r10
	.word 0x879023c3  ! 588: WRPR_TT_I	wrpr	%r0, 0x03c3, %tt
DS_80:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 589: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xa550c000  ! 590: RDPR_TT	rdpr	%tt, %r18
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 591: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982dcd  ! 592: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcd, %hpstate
	.word 0xe4800b40  ! 593: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r18
	.word 0x91d02031  ! 594: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8e806001  ! 595: ADDcc_I	addcc 	%r1, 0x0001, %r7
	.word 0x8d802000  ! 596: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902004  ! 597: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81982154  ! 598: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0154, %hpstate
splash_lsu_81:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 599: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902274  ! 600: WRPR_TT_I	wrpr	%r0, 0x0274, %tt
	.word 0x26800001  ! 601: BL	bl,a	<label_0x1>
	.word 0xce17c000  ! 602: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0x9f802001  ! 603: SIR	sir	0x0001
DS_82:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 604: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x2a700001  ! 605: BPCS	<illegal instruction>
	.word 0xcf27c019  ! 606: STF_R	st	%f7, [%r25, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0x2a800001  ! 608: BCS	bcs,a	<label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 609: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb3504000  ! 610: RDPR_TNPC	rdpr	%tnpc, %r25
change_to_tl1_83:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 612: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 613: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902003  ! 614: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa2810003  ! 615: ADDcc_R	addcc 	%r4, %r3, %r17
	.word 0x83d02035  ! 616: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x91504000  ! 617: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x81982994  ! 618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0994, %hpstate
	ta	T_CHANGE_PRIV	! macro
DS_84:
	.word 0x20800001  ! 621: BN	bn,a	<label_0x1>
	allclean
	.word 0x8db00308  ! 620: ALLIGNADDRESS	alignaddr	%r0, %r8, %r6
	.word 0x93702001  ! 621: POPC_I	popc	0x0001, %r9
	.word 0x819826ce  ! 622: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06ce, %hpstate
	.word 0xd29004a0  ! 623: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0x8d802000  ! 624: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 625: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_85:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 626: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90261f  ! 627: WRPR_PSTATE_I	wrpr	%r0, 0x061f, %pstate
	.word 0xb3a01a75  ! 628: FqTOi	fqtoi	
	.word 0x87802010  ! 629: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93902000  ! 630: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99902002  ! 632: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x8790235a  ! 633: WRPR_TT_I	wrpr	%r0, 0x035a, %tt
	.word 0xa5504000  ! 634: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x8d902c4c  ! 635: WRPR_PSTATE_I	wrpr	%r0, 0x0c4c, %pstate
	.word 0xe4d804a0  ! 636: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0x87a309b4  ! 637: FDIVs	fdivs	%f12, %f20, %f3
	.word 0xc6ffc034  ! 638: SWAPA_R	swapa	%r3, [%r31 + %r20] 0x01
	.word 0x93902004  ! 639: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8a698011  ! 640: UDIVX_R	udivx 	%r6, %r17, %r5
	.word 0x91d02030  ! 641: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa190200b  ! 642: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 644: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x30700001  ! 645: BPA	<illegal instruction>
change_to_randtl_86:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 646: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 647: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x99702001  ! 648: POPC_I	popc	0x0001, %r12
	.word 0xb6480013  ! 649: MULX_R	mulx 	%r0, %r19, %r27
	.word 0x93902006  ! 650: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f802001  ! 651: SIR	sir	0x0001
	.word 0x8d90260c  ! 652: WRPR_PSTATE_I	wrpr	%r0, 0x060c, %pstate
	.word 0x8b540000  ! 653: RDPR_GL	rdpr	%-, %r5
	.word 0x93902001  ! 654: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa190200f  ! 656: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 658: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xca77c013  ! 660: STX_R	stx	%r5, [%r31 + %r19]
	.word 0xab500000  ! 661: RDPR_TPC	rdpr	%tpc, %r21
	.word 0xea800ac0  ! 662: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r21
	.word 0xa190200c  ! 663: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 664: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 665: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa1902000  ! 666: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xea7fe001  ! 667: SWAP_I	swap	%r21, [%r31 + 0x0001]
	.word 0x8d902c15  ! 668: WRPR_PSTATE_I	wrpr	%r0, 0x0c15, %pstate
	.word 0xa190200e  ! 669: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xeac7e030  ! 670: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r21
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 671: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8efb0002  ! 672: SDIVcc_R	sdivcc 	%r12, %r2, %r7
	.word 0x9151c000  ! 673: RDPR_TL	rdpr	%tl, %r8
	.word 0x83b14fe8  ! 674: FONES	fones	%f1
DS_87:
	.word 0x32800001  ! 676: BNE	bne,a	<label_0x1>
	allclean
	.word 0x93b5031a  ! 675: ALLIGNADDRESS	alignaddr	%r20, %r26, %r9
	.word 0x94d1e001  ! 676: UMULcc_I	umulcc 	%r7, 0x0001, %r10
	.word 0x8d902ed8  ! 677: WRPR_PSTATE_I	wrpr	%r0, 0x0ed8, %pstate
	.word 0xb7a049db  ! 678: FDIVd	fdivd	%f32, %f58, %f58
	.word 0x8ba089e9  ! 679: FDIVq	dis not found

	.word 0x8d90284a  ! 680: WRPR_PSTATE_I	wrpr	%r0, 0x084a, %pstate
	.word 0x8198278f  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078f, %hpstate
splash_lsu_88:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 682: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8c6aa001  ! 683: UDIVX_I	udivx 	%r10, 0x0001, %r6
	.word 0x91d02030  ! 684: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902003  ! 685: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xb2d5c017  ! 686: UMULcc_R	umulcc 	%r23, %r23, %r25
	.word 0x8da009ea  ! 687: FDIVq	dis not found

	.word 0x93902007  ! 688: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_tba_89:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 689: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d698003  ! 690: SDIVX_R	sdivx	%r6, %r3, %r6
	.word 0x81982c54  ! 691: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c54, %hpstate
	.word 0x8d902e89  ! 692: WRPR_PSTATE_I	wrpr	%r0, 0x0e89, %pstate
	.word 0x93902001  ! 693: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_HPRIV	! macro
splash_tba_90:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 695: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8fa189e9  ! 696: FDIVq	dis not found

	.word 0x81982a0f  ! 697: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0f, %hpstate
	.word 0x8d902e5b  ! 698: WRPR_PSTATE_I	wrpr	%r0, 0x0e5b, %pstate
change_to_randtl_91:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 699: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 700: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xaba24d2c  ! 701: FsMULd	fsmuld	%f9, %f12, %f52
	.word 0x8fa1c9d3  ! 702: FDIVd	fdivd	%f38, %f50, %f38
splash_lsu_92:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 703: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 704: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_93:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 705: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_94:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 706: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xce8008a0  ! 707: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x93902001  ! 708: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9951c000  ! 709: RDPR_TL	rdpr	%tl, %r12
	.word 0xd8d804a0  ! 710: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 711: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8cfe030  ! 712: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r12
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 713: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902416  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x0416, %pstate
	.word 0x2a800001  ! 715: BCS	bcs,a	<label_0x1>
	.word 0xa0fa6001  ! 716: SDIVcc_I	sdivcc 	%r9, 0x0001, %r16
	.word 0x91d02031  ! 717: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_95:
	.word 0x32800001  ! 719: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 718: SAVE_R	save	%r31, %r0, %r31
	.word 0xe08804a0  ! 719: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
	.word 0xa1902000  ! 720: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x84680005  ! 721: UDIVX_R	udivx 	%r0, %r5, %r2
splash_htba_96:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 722: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc4cfe010  ! 723: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r2
	.word 0x91d02032  ! 724: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_97:
	.word 0x32800001  ! 726: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 725: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 726: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982a97  ! 727: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a97, %hpstate
	.word 0xa190200c  ! 728: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87902158  ! 729: WRPR_TT_I	wrpr	%r0, 0x0158, %tt
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 730: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a00544  ! 731: FSQRTd	fsqrt	
	.word 0xa1902008  ! 732: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x9a6c2001  ! 733: UDIVX_I	udivx 	%r16, 0x0001, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902cc3  ! 735: WRPR_PSTATE_I	wrpr	%r0, 0x0cc3, %pstate
	.word 0x93902006  ! 736: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d802000  ! 737: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902004  ! 738: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_lsu_98:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 739: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790200d  ! 740: WRPR_TT_I	wrpr	%r0, 0x000d, %tt
	.word 0x93d02031  ! 741: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x87902116  ! 742: WRPR_TT_I	wrpr	%r0, 0x0116, %tt
	.word 0x93902007  ! 743: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_99:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 744: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x9f802001  ! 745: SIR	sir	0x0001
	.word 0x879020f4  ! 746: WRPR_TT_I	wrpr	%r0, 0x00f4, %tt
	.word 0xdacfe000  ! 747: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
	.word 0x9f802001  ! 748: SIR	sir	0x0001
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 749: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_100:
	.word 0x22800001  ! 751: BE	be,a	<label_0x1>
	.word 0xc7330011  ! 751: STQF_R	-	%f3, [%r17, %r12]
	normalw
	.word 0x8f458000  ! 750: RD_SOFTINT_REG	rd	%softint, %r7
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 751: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 752: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcec804a0  ! 753: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0x91d02034  ! 754: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xce9fe001  ! 755: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	.word 0x97540000  ! 756: RDPR_GL	rdpr	%-, %r11
	.word 0x9b6a8001  ! 757: SDIVX_R	sdivx	%r10, %r1, %r13
	.word 0x91d02030  ! 758: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x81982847  ! 759: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0847, %hpstate
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 760: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_101:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 761: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xda8fe010  ! 762: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r13
	.word 0x8d9022cb  ! 763: WRPR_PSTATE_I	wrpr	%r0, 0x02cb, %pstate
	.word 0x30700001  ! 764: BPA	<illegal instruction>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 765: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982616  ! 766: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0616, %hpstate
	.word 0x8750c000  ! 767: RDPR_TT	rdpr	%tt, %r3
	.word 0x819827d7  ! 768: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d7, %hpstate
	.word 0x8d90205f  ! 769: WRPR_PSTATE_I	wrpr	%r0, 0x005f, %pstate
	.word 0xad508000  ! 770: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0xecd004a0  ! 771: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r22
	.word 0x879022b9  ! 772: WRPR_TT_I	wrpr	%r0, 0x02b9, %tt
	.word 0x91d02034  ! 773: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81982795  ! 774: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0795, %hpstate
	.word 0x9f802001  ! 775: SIR	sir	0x0001
	.word 0x91d02034  ! 776: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x879023d3  ! 777: WRPR_TT_I	wrpr	%r0, 0x03d3, %tt
	.word 0xa1514000  ! 778: RDPR_TBA	rdpr	%tba, %r16
	.word 0x81982acc  ! 779: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acc, %hpstate
splash_tba_102:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 780: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 781: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 782: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0ffc021  ! 783: SWAPA_R	swapa	%r16, [%r31 + %r1] 0x01
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 785: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 786: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe127e001  ! 787: STF_I	st	%f16, [0x0001, %r31]
	.word 0x93902002  ! 788: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879020c8  ! 790: WRPR_TT_I	wrpr	%r0, 0x00c8, %tt
	.word 0xa2d4800b  ! 791: UMULcc_R	umulcc 	%r18, %r11, %r17
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 792: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_103:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 793: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02030  ! 794: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902007  ! 795: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 796: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe3e7c02b  ! 797: CASA_I	casa	[%r31] 0x 1, %r11, %r17
	.word 0x93902001  ! 798: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_tba_104:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 799: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 800: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 801: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe2d004a0  ! 802: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x91d02033  ! 803: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x836a4013  ! 804: SDIVX_R	sdivx	%r9, %r19, %r1
	.word 0x8d902edf  ! 805: WRPR_PSTATE_I	wrpr	%r0, 0x0edf, %pstate
	.word 0x2a800001  ! 806: BCS	bcs,a	<label_0x1>
	.word 0x8790221c  ! 807: WRPR_TT_I	wrpr	%r0, 0x021c, %tt
	.word 0x93902002  ! 808: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x92d6800c  ! 809: UMULcc_R	umulcc 	%r26, %r12, %r9
	.word 0xd2ffc02c  ! 810: SWAPA_R	swapa	%r9, [%r31 + %r12] 0x01
	ta	T_CHANGE_TO_TL0	! macro
DS_105:
	.word 0x20800001  ! 813: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 812: SAVE_R	save	%r31, %r0, %r31
	.word 0x87902326  ! 813: WRPR_TT_I	wrpr	%r0, 0x0326, %tt
	.word 0x8ad4001b  ! 814: UMULcc_R	umulcc 	%r16, %r27, %r5
change_to_tl1_106:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 816: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 817: Tcc_I	ta	icc_or_xcc, %r0 + 49
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 818: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02034  ! 819: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xaefd6001  ! 820: SDIVcc_I	sdivcc 	%r21, 0x0001, %r23
	.word 0x87802004  ! 821: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xee8fe000  ! 822: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r23
	.word 0xee900e40  ! 823: LDUHA_R	lduha	[%r0, %r0] 0x72, %r23
	.word 0x22800001  ! 824: BE	be,a	<label_0x1>
	.word 0x87508000  ! 825: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x95a000ca  ! 826: FNEGd	fnegd	%f10, %f10
	.word 0xaadd4018  ! 827: SMULcc_R	smulcc 	%r21, %r24, %r21
	.word 0x8d902203  ! 828: WRPR_PSTATE_I	wrpr	%r0, 0x0203, %pstate
	.word 0xea8804a0  ! 829: LDUBA_R	lduba	[%r0, %r0] 0x25, %r21
	.word 0x9ba0057a  ! 830: FSQRTq	fsqrt	
splash_tba_107:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 831: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xaf540000  ! 832: RDPR_GL	rdpr	%-, %r23
	.word 0xeed804a0  ! 833: LDXA_R	ldxa	[%r0, %r0] 0x25, %r23
	.word 0x856a401a  ! 834: SDIVX_R	sdivx	%r9, %r26, %r2
	.word 0x8b504000  ! 835: RDPR_TNPC	<illegal instruction>
splash_tba_108:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 836: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_109:
	.word 0x32800001  ! 838: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 837: SAVE_R	save	%r31, %r0, %r31
	.word 0xa5a00571  ! 838: FSQRTq	fsqrt	
	.word 0xe527e001  ! 839: STF_I	st	%f18, [0x0001, %r31]
	.word 0x8d902e47  ! 840: WRPR_PSTATE_I	wrpr	%r0, 0x0e47, %pstate
splash_htba_110:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 841: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93d02035  ! 842: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x93902002  ! 843: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_111:
	.word 0x20800001  ! 845: BN	bn,a	<label_0x1>
	allclean
	.word 0xa1b08304  ! 844: ALLIGNADDRESS	alignaddr	%r2, %r4, %r16
	.word 0x81982e07  ! 845: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e07, %hpstate
	.word 0xa1902009  ! 846: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x81982807  ! 847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0807, %hpstate
	.word 0x81982f5d  ! 848: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5d, %hpstate
	.word 0xa9a249e9  ! 849: FDIVq	dis not found

	.word 0xe88008a0  ! 850: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x87902292  ! 851: WRPR_TT_I	wrpr	%r0, 0x0292, %tt
	.word 0x87802080  ! 852: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_TO_TL0	! macro
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 854: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x86d84010  ! 855: SMULcc_R	smulcc 	%r1, %r16, %r3
	.word 0x91d02032  ! 856: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc6c80e80  ! 857: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r3
	.word 0x93b34fe1  ! 858: FONES	fones	%f9
	.word 0x879021da  ! 859: WRPR_TT_I	wrpr	%r0, 0x01da, %tt
	.word 0xd2cfe020  ! 860: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
	.word 0x91d02031  ! 861: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x3a700001  ! 862: BPCC	<illegal instruction>
	.word 0xa1902002  ! 863: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa1902004  ! 864: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xb4804005  ! 865: ADDcc_R	addcc 	%r1, %r5, %r26
	.word 0x87802080  ! 866: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93902002  ! 867: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xf4cfe000  ! 868: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r26
	.word 0xa1500000  ! 869: RDPR_TPC	rdpr	%tpc, %r16
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8f504000  ! 871: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x879021ec  ! 872: WRPR_TT_I	wrpr	%r0, 0x01ec, %tt
splash_htba_112:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 873: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x83d02031  ! 874: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x81982a5e  ! 875: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5e, %hpstate
reduce_priv_level_113:
	.word 0x8f902000  ! 877: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b6da001  ! 876: SDIVX_I	sdivx	%r22, 0x0001, %r13
	.word 0x93d02030  ! 877: Tcc_I	tne	icc_or_xcc, %r0 + 48
change_to_tl1_114:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02034  ! 879: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 880: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982485  ! 881: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0485, %hpstate
	.word 0xa1902001  ! 882: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xda8008a0  ! 883: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
DS_115:
	.word 0x32800001  ! 885: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 884: SAVE_R	save	%r31, %r0, %r31
	.word 0x99902005  ! 885: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x81982d9e  ! 886: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9e, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 887: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_116:
	.word 0x20800001  ! 889: BN	bn,a	<label_0x1>
	illtrap
	.word 0x85a00541  ! 889: FSQRTd	fsqrt	
	.word 0xb1a68835  ! 888: FADDs	fadds	%f26, %f21, %f24
	.word 0xb6c0e001  ! 889: ADDCcc_I	addccc 	%r3, 0x0001, %r27
change_to_tl1_117:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902000  ! 891: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x819828dc  ! 892: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08dc, %hpstate
splash_lsu_118:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 893: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 894: SIR	sir	0x0001
	.word 0xa190200f  ! 895: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xf67fe001  ! 896: SWAP_I	swap	%r27, [%r31 + 0x0001]
	.word 0x87802016  ! 897: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902c13  ! 898: WRPR_PSTATE_I	wrpr	%r0, 0x0c13, %pstate
	.word 0x81982615  ! 899: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0615, %hpstate
	.word 0xf67fe001  ! 900: SWAP_I	swap	%r27, [%r31 + 0x0001]
	.word 0x81982787  ! 901: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0787, %hpstate
	.word 0x91d02032  ! 902: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_119:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 903: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8cab4000  ! 904: ANDNcc_R	andncc 	%r13, %r0, %r6
	.word 0x93902000  ! 905: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xcc57c000  ! 906: LDSH_R	ldsh	[%r31 + %r0], %r6
	.word 0x93d02032  ! 907: Tcc_I	tne	icc_or_xcc, %r0 + 50
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 908: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_120:
	.word 0x34800001  ! 910: BG	bg,a	<label_0x1>
	allclean
	.word 0xafb20311  ! 909: ALLIGNADDRESS	alignaddr	%r8, %r17, %r23
splash_htba_121:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 910: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200e  ! 911: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xb3508000  ! 912: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0x87902351  ! 913: WRPR_TT_I	wrpr	%r0, 0x0351, %tt
	.word 0x87a20d2a  ! 914: FsMULd	fsmuld	%f8, %f10, %f34
	.word 0x81982e15  ! 915: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e15, %hpstate
	.word 0x9f802001  ! 916: SIR	sir	0x0001
	.word 0x81982d97  ! 917: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d97, %hpstate
	.word 0x93902005  ! 918: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902006  ! 919: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87902361  ! 920: WRPR_TT_I	wrpr	%r0, 0x0361, %tt
	!.word 0xc637c00a  ! 921: STH_R	sth	%r3, [%r31 + %r10]
	.word 0x93902003  ! 922: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02034  ! 923: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x819823cf  ! 924: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cf, %hpstate
	.word 0x879023ef  ! 925: WRPR_TT_I	wrpr	%r0, 0x03ef, %tt
	.word 0x8d902284  ! 926: WRPR_PSTATE_I	wrpr	%r0, 0x0284, %pstate
	.word 0x879023d1  ! 927: WRPR_TT_I	wrpr	%r0, 0x03d1, %tt
	.word 0x8b51c000  ! 928: RDPR_TL	rdpr	%tl, %r5
	.word 0x94faa001  ! 929: SDIVcc_I	sdivcc 	%r10, 0x0001, %r10
	.word 0x91d02034  ! 930: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d9026d8  ! 931: WRPR_PSTATE_I	wrpr	%r0, 0x06d8, %pstate
	.word 0x9150c000  ! 932: RDPR_TT	rdpr	%tt, %r8
change_to_randtl_122:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 933: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9ad66001  ! 934: UMULcc_I	umulcc 	%r25, 0x0001, %r13
	.word 0xa150c000  ! 935: RDPR_TT	rdpr	%tt, %r16
	.word 0xa1902009  ! 936: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x89a01a68  ! 937: FqTOi	fqtoi	
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 938: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 939: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 940: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xb6fec015  ! 941: SDIVcc_R	sdivcc 	%r27, %r21, %r27
	.word 0x30700001  ! 942: BPA	<illegal instruction>
	.word 0xf61fc000  ! 943: LDD_R	ldd	[%r31 + %r0], %r27
	.word 0xf6d7e010  ! 944: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r27
	.word 0x9f802001  ! 945: SIR	sir	0x0001
splash_htba_123:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 946: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200b  ! 947: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_lsu_124:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 948: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902221  ! 949: WRPR_TT_I	wrpr	%r0, 0x0221, %tt
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 950: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf68fe010  ! 951: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r27
	.word 0x81982644  ! 952: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0644, %hpstate
	.word 0x3a800001  ! 953: BCC	bcc,a	<label_0x1>
	.word 0xa190200e  ! 954: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8790229b  ! 955: WRPR_TT_I	wrpr	%r0, 0x029b, %tt
	.word 0x81982045  ! 956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0045, %hpstate
	.word 0x8790223e  ! 957: WRPR_TT_I	wrpr	%r0, 0x023e, %tt
	.word 0x8d902c58  ! 958: WRPR_PSTATE_I	wrpr	%r0, 0x0c58, %pstate
	.word 0x8d902290  ! 959: WRPR_PSTATE_I	wrpr	%r0, 0x0290, %pstate
	.word 0x81a01a7b  ! 960: FqTOi	fqtoi	
	.word 0x879023d9  ! 961: WRPR_TT_I	wrpr	%r0, 0x03d9, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982516  ! 963: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0516, %hpstate
	.word 0xa4fa2001  ! 964: SDIVcc_I	sdivcc 	%r8, 0x0001, %r18
	.word 0x91d02031  ! 965: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x82fcc016  ! 966: SDIVcc_R	sdivcc 	%r19, %r22, %r1
	.word 0xb5500000  ! 967: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8d9028c9  ! 968: WRPR_PSTATE_I	wrpr	%r0, 0x08c9, %pstate
	.word 0xa3500000  ! 969: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x99902004  ! 970: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x93902000  ! 971: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02030  ! 972: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xe327e001  ! 973: STF_I	st	%f17, [0x0001, %r31]
	.word 0xa3b30fe8  ! 974: FONES	fones	%f17
	.word 0x97688009  ! 975: SDIVX_R	sdivx	%r2, %r9, %r11
	.word 0x93702001  ! 976: POPC_I	popc	0x0001, %r9
	.word 0x2c800001  ! 977: BNEG	bneg,a	<label_0x1>
	.word 0xb2fac012  ! 978: SDIVcc_R	sdivcc 	%r11, %r18, %r25
	.word 0x879023c6  ! 979: WRPR_TT_I	wrpr	%r0, 0x03c6, %tt
	.word 0x91d02034  ! 980: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xf2c7e010  ! 981: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r25
DS_125:
	.word 0x20800001  ! 983: BN	bn,a	<label_0x1>
	.word 0xe9300000  ! 983: STQF_R	-	%f20, [%r0, %r0]
	normalw
	.word 0xb3458000  ! 982: RD_SOFTINT_REG	rd	%softint, %r25
	.word 0x87902200  ! 983: WRPR_TT_I	wrpr	%r0, 0x0200, %tt
change_to_randtl_126:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 984: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d9024d9  ! 985: WRPR_PSTATE_I	wrpr	%r0, 0x04d9, %pstate
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 986: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 987: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 988: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_randtl_127:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 989: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x8d902a4a  ! 990: WRPR_PSTATE_I	wrpr	%r0, 0x0a4a, %pstate
splash_tba_128:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 991: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8150c000  ! 992: RDPR_TT	rdpr	%tt, %r0
	.word 0x81982c0f  ! 993: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0f, %hpstate
	.word 0x30700001  ! 994: BPA	<illegal instruction>
	.word 0x81982fcc  ! 995: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcc, %hpstate
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 996: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 997: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_129:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 998: WRPR_TBA_R	wrpr	%r0, %r2, %tba


.global user_data_start
.data
user_data_start:
	.xword	0x82bdc8d579fbbce8
	.xword	0x7faf90850b212d65
	.xword	0x10af1bfebf6b26d9
	.xword	0xaa30052b78fb3c19
	.xword	0x8a557fa656ae46e0
	.xword	0x8e15c0fb74305017
	.xword	0x4f1cc53e98e0b4c9
	.xword	0xb781e593a2650a18
	.xword	0x92fbd950af3dbf0d
	.xword	0x6f764875c542bb89
	.xword	0x6c065759e4c4080d
	.xword	0x48c902ac7c334da1
	.xword	0xea808ba7804e5d2e
	.xword	0xe92aae536a1f77fd
	.xword	0xb3b047477fd22f0f
	.xword	0xa760bb603ffb5b90
	.xword	0x90d0903a2a56b0c9
	.xword	0xe1c02c8bf15d072a
	.xword	0x98fe6d0a73ee72b8
	.xword	0x61617aea6dd4984e
	.xword	0x08342deb5a9f7e8d
	.xword	0xabb20731d594faa2
	.xword	0x469b491ac3ed1e57
	.xword	0xd31980d608a8baa6
	.xword	0xb149ee673f11c6f1
	.xword	0xe7199a2e7edd3106
	.xword	0xd7df498c7f8179f0
	.xword	0xcfdc87987d7c3ad5
	.xword	0x7b44549579ccbc74
	.xword	0xa328e90391737e65
	.xword	0x857db560887fc31d
	.xword	0xe2ad5db4dd84ad48
	.xword	0x4c925de1f2e60c22
	.xword	0x7c84db8e897b2465
	.xword	0xc63b7e9b65d37122
	.xword	0x65ecb6fcd86d830e
	.xword	0x84fd5bf4393ac09b
	.xword	0x3debb72dfd3be5ca
	.xword	0x0123bef9cb299b57
	.xword	0x720bf90fafde12a2
	.xword	0x1784212bcec35309
	.xword	0x564ddba81ce1c090
	.xword	0x0435f479e48707a4
	.xword	0xb18ca21214f1d315
	.xword	0xcb70acc57e2ce7d5
	.xword	0xa71b75d63449a8bd
	.xword	0xd61628fa4a9efabb
	.xword	0x24a2a5a5b42f5074
	.xword	0x1642a5efedfc9244
	.xword	0xd7938b6be0e70209
	.xword	0x3288d5d3b2a2568b
	.xword	0x58cc3ad3784e3643
	.xword	0xb65ea64f1614db53
	.xword	0x720bb85bbfd34396
	.xword	0xd705ea7feab74b06
	.xword	0x069e0a6e8cdeeef1
	.xword	0x0e3cb7b53934a17b
	.xword	0x95901e97f6321e1b
	.xword	0x36efda5550e8e4d2
	.xword	0xf8f2e2c752116fec
	.xword	0x55d7311606843e75
	.xword	0xfd66221065b6a3d7
	.xword	0xa78e2ae44065f1c7
	.xword	0x04804e0779061749
	.xword	0xcd71d25b9db79e35
	.xword	0xf21a86ced3ad1961
	.xword	0xef666909044e9b93
	.xword	0x42306e78cb856b72
	.xword	0xd044604af734f2f2
	.xword	0x27ad899bcd6c74d6
	.xword	0x3894713d3c2087e3
	.xword	0xc9e193fe5dfbab34
	.xword	0xa2612bd1b50eabe1
	.xword	0xe7ca4233b5f40019
	.xword	0xc1046f56dbb24fe9
	.xword	0xbeb1d6c6f76e23e1
	.xword	0x48d1b14e5d5815a9
	.xword	0x029800935bfa9984
	.xword	0x1da8fb6524a74451
	.xword	0xf62a581aab51c08b
	.xword	0x1ecbac41b0da5ade
	.xword	0xa9abfffcc90638da
	.xword	0x95fbf47056c803a9
	.xword	0x82d995514697a9c6
	.xword	0xc5d2b1cc559f5a07
	.xword	0xdb2d84d60eca457d
	.xword	0x381c5661045a904c
	.xword	0x94356ab483a22d71
	.xword	0xcb599b2cfc7c2677
	.xword	0xd45bb815cb77d14a
	.xword	0x99689e7383d5aad1
	.xword	0xcddd83cf5569581b
	.xword	0x9eba2859596e381c
	.xword	0xc5f96ec46d92dcd6
	.xword	0xcb5d685efd5431a4
	.xword	0x5b28aa6e689d0183
	.xword	0x0bfb2fbf54e4cc93
	.xword	0x0e19989574db6c7f
	.xword	0x143fe092fe6b2f18
	.xword	0x3df1e038f7929817
	.xword	0x9838797db8cd3577
	.xword	0x72b0fc9b205c3f3c
	.xword	0xad37d505c3d45570
	.xword	0xf2c4238b959d4eb6
	.xword	0xdbce51105e334ee5
	.xword	0xd233c5a54ce62802
	.xword	0x5158bbdfca65eeda
	.xword	0x58b9790d4c8d246a
	.xword	0x0c0c4217d14f15d5
	.xword	0x580c475c9aca13eb
	.xword	0x593109b692d94400
	.xword	0xcaee87763d4f765f
	.xword	0x00e59480039910dd
	.xword	0xff43e561edc4dc75
	.xword	0xeb952c43c75f7f1f
	.xword	0xbbccdbf65cadb10e
	.xword	0xe9a82000ce39665a
	.xword	0x311ae7c34d6768ca
	.xword	0xedc9a6bb83f277ea
	.xword	0x8cba52f2b0d7d36b
	.xword	0xc04925c6f4cb9a81
	.xword	0x9109c7faaf741d13
	.xword	0xec7273807401fc3d
	.xword	0x0a679f60c5de86fe
	.xword	0x40169627cb777641
	.xword	0x420e622d0dd713fc
	.xword	0x210e1dcde6f78389
	.xword	0x2c6d50d928a4c348
	.xword	0xada0b2342dd062c6
	.xword	0x956c1f985988bc02
	.xword	0x8d603dd5401c6bec
	.xword	0x318e4fb53fb57de0
	.xword	0x9df84fee56056fd7
	.xword	0xa9f78678a853a732
	.xword	0x92559d698877350c
	.xword	0xb9f63a67463bc74f
	.xword	0xb12da564c837eedb
	.xword	0x8456fb8817db051f
	.xword	0xf1c2c6e32240832f
	.xword	0x1e63ada1e0720b4f
	.xword	0x062af49c5606a660
	.xword	0x8349651a0ee5bd1f
	.xword	0xe40ef2de1933603e
	.xword	0x2c2a40abafe73410
	.xword	0xf10bbdbe33b21e4f
	.xword	0xca1365c242feed85
	.xword	0x3105765f29db9a8f
	.xword	0xc8177f3ee9821cae
	.xword	0xdac574cfacf96806
	.xword	0xb8f7d07a0831fec0
	.xword	0xdeeae247bc237812
	.xword	0xef2d873d2f041cf4
	.xword	0xe11e1cae5a1255a9
	.xword	0xc5df44358698e022
	.xword	0xa8f886b673589eb9
	.xword	0x462bfdc9a07a1a0b
	.xword	0xad2fa1196f11dd45
	.xword	0x119789ed99447589
	.xword	0x6ce06f463e6afad2
	.xword	0xdf5676b6d7034b92
	.xword	0xc4d945e02a29b6a5
	.xword	0xc188f614cbf783a7
	.xword	0x119abd9965c2486d
	.xword	0xaf7b264046a83ebf
	.xword	0x250460576ccb0d63
	.xword	0x58200ef1c4d568b2
	.xword	0xb755c6076f01a54a
	.xword	0xacff2d79239da034
	.xword	0x028531e204a07b3d
	.xword	0xb8ab2c5f387e2093
	.xword	0x20f30890171fbade
	.xword	0x99577f9307745b67
	.xword	0xb172395f2349da40
	.xword	0xd31e62112749a689
	.xword	0x5de76b541999712e
	.xword	0x53953c17ef47b5b0
	.xword	0xd7e728eec4ef7d78
	.xword	0x50d879b48abb4cdd
	.xword	0xcbbd04d96db1ecbb
	.xword	0x3f7491b283ae6aac
	.xword	0x0731391789b7d3c0
	.xword	0xc1904808cb59e82c
	.xword	0xd495acfe64548c16
	.xword	0xa652d00f03ca5857
	.xword	0x8387f45ff0f1a0bc
	.xword	0x922ee9f2fa6bb20b
	.xword	0xd8b1843f6f94a46b
	.xword	0x6c2a3ab4f1fb905a
	.xword	0x1eed38c02b3a3030
	.xword	0xb305d8202b8fb768
	.xword	0x1dae2644a2b2dabb
	.xword	0x21de4c5310ad5d4d
	.xword	0x25866d17c6ad8f65
	.xword	0xe6c8fb1207a74931
	.xword	0x6dc01da57df75f30
	.xword	0xea92802bf30ca687
	.xword	0x6aa24b27b7e048f4
	.xword	0x929109bfab258f8b
	.xword	0x98651b9143360fcb
	.xword	0xbfed169441da217c
	.xword	0x4b29633fb92e764b
	.xword	0x89557d6da15a39b0
	.xword	0x3820c37f9714232f
	.xword	0x9a3c03fd4e491e1a
	.xword	0x814216a5d373fbe1
	.xword	0x27d3339bbf0f0445
	.xword	0xd7601152f239dc99
	.xword	0x6bd80546980f1f6f
	.xword	0x43f15c6138e8bd7f
	.xword	0x4fcb1d36c445ea89
	.xword	0x6030e5ddf87df63f
	.xword	0x83e3ba8d124593a1
	.xword	0xfb925ae31eda3883
	.xword	0x2aff3e5951cb3448
	.xword	0xfd6c2dc2fb5ecd41
	.xword	0xc6f3709778cb184d
	.xword	0x858f55b0c33c97d2
	.xword	0x952176ac71740084
	.xword	0x977d00468e5e6049
	.xword	0xf9493720c1e5a5fb
	.xword	0x140344a39d175aef
	.xword	0xff2f3a9eb4e06fa2
	.xword	0x5edbc4d876bb55d3
	.xword	0x577cec93d0a50ee6
	.xword	0x9b6e8bc430a52cc4
	.xword	0xb26861a7453b2be2
	.xword	0xe501233073facb15
	.xword	0x9c1e9123635cb498
	.xword	0x321f6a5f825629ed
	.xword	0x73ec9b825b9c1235
	.xword	0xad46167e45b79e64
	.xword	0x17ed45544150d225
	.xword	0xc651128259f8e11d
	.xword	0x8060879243b1635c
	.xword	0x0c78e6209aef057c
	.xword	0x2577e0411a1da318
	.xword	0xa73e9c93bd328ab9
	.xword	0x0cef8f65629c0412
	.xword	0x31e87e1e793c5c1d
	.xword	0x4b7b9984edbbe295
	.xword	0x6530f08ffc9c8c0d
	.xword	0xe3b91050a4ebb948
	.xword	0x4cfc2da51acc68ec
	.xword	0x9a75f6e8e59a85ac
	.xword	0xd85463a5dc79ac9d
	.xword	0xc120cd4cbfc1a38d
	.xword	0x030bbe622a84f7ed
	.xword	0x3606ba3bd87f9388
	.xword	0xc47fcf5aad7c8a5c
	.xword	0x98ec398beddfdf86
	.xword	0x4ac0c0d532de9614
	.xword	0x5953a035ff237d43
	.xword	0xeca619532928cfba
	.xword	0x92a8d76e6379839f
	.xword	0xe41ea7e9403fcf7b
	.xword	0x3437e71cdf48b70e


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Thu May  6 09:19:24 2004
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
!!#     IJ_set_rvar("diag.j", 65, Rv_lsucntl, "5'brrr11");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!# 
!!#     IJ_set_ropr_fld("diag.j", 72, ijdefault, Ft_Rs1, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 73, ijdefault, Ft_Rs2, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 74, ijdefault, Ft_Rd, "{0..13,16..27}");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 77, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 80, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 81, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 84, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x16, 0x80, 0x88}");
!!#     IJ_set_ropr_fld("diag.j", 85, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 86, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 87, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 89, Ro_nontrap_ldasi_z, Ft_Imm_Asi, "{0x45, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 90, Ro_nontrap_ldasi_z, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 91, Ro_nontrap_ldasi_z, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 92, Ro_nontrap_ldasi_z, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 95, Ro_nontrap_ld, Fm_align_Simm13, "{0x0..0x6:5,0x7:1}");
!!#     IJ_set_ropr_fld("diag.j", 96, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 97, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 100, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 101, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 102, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 103, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     //IJ_set_ropr_fld(Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_ropr_fld("diag.j", 107, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35}");
!!#     IJ_set_ropr_fld("diag.j", 108, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 109, Ro_traps_i, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 110, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 111, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 112, Ro_traps_r, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     //IJ_set_ropr_fld(Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     IJ_set_ropr_fld("diag.j", 114, Ro_traps_r, Ft_Simm13, "{0x30..0x35, 0xb0..0xb5}");
!!#     //IJ_set_rvar(Rv_init_trap, "{0x30..0x35}");
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
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 161,"{10}");
!!#     IJ_set_rvar("diag.j", 162, wt_high, "{90}");
!!#     IJ_set_rvar("diag.j", 163, wt_med,  "{40}");
!!#     IJ_set_rvar("diag.j", 164, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 168, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<7; k++) {
!!#         for (i = 0; i < 30; i++) {
!!#             if (i==15) {
!!#                 IJ_printf  ("diag.j", 172, th0,"\tmov %%r31, %%r15\n");
!!#                 continue;
!!#             }
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 176, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 178, th0,"\tmov 0x%rx, %%r14\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 179, th0,"\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 180, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 183, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 186, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 189, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 192, th0,"\tta T_CHANGE_HPRIV \n");
!!#     IJ_printf  ("diag.j", 193, th0,"!Initializing Tick Cmprs \n");
!!#     IJ_printf  ("diag.j", 194, th0,"\tmov 1, %%g2\n");
!!#     IJ_printf  ("diag.j", 195, th0,"\tsllx %%g2, 63, %%g2\n");
!!#     IJ_printf  ("diag.j", 196, th0,"\tor %%g1, %%g2, %%g1\n");
!!#     IJ_printf("diag.j", 197, th0, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
!!#     IJ_printf("diag.j", 198, th0, "\twr %%g1, %%g0, %%tick_cmpr\n");
!!#     IJ_printf("diag.j", 199, th0, "\twr %%g1, %%g0, %%sys_tick_cmpr\n");
!!#     IJ_printf  ("diag.j", 200, th0,"!Initializing Trap Stack \n");
!!#     for (i = 1; i <=6; i++) {
!!#         IJ_printf  ("diag.j", 202, th0,"\twrpr 0x%d, %%tl\n", i);
!!#         IJ_printf  ("diag.j", 203, th0,"\twrpr 0x1, %%tt\n");
!!#         IJ_printf  ("diag.j", 204, th0,"\twrpr 0x1, %%tpc\n");
!!#         IJ_printf  ("diag.j", 205, th0,"\twrpr 0x1, %%tnpc\n");
!!#         IJ_printf  ("diag.j", 206, th0,"\twrpr 0x1, %%tstate\n");
!!#         IJ_printf  ("diag.j", 207, th0,"\twrhpr 0x1, %%htstate\n");
!!#     }
!!#     IJ_printf  ("diag.j", 209, th0,"\twrpr 0x0, %%tl\n");
!!#     IJ_printf  ("diag.j", 210, th0,"\tta T_CHANGE_NONHPRIV \n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#     int i;
!!#     IJ_printf  ("diag.j", 259, th0,"\n\n.global user_data_start\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 261, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
!!#     }
!!# 
!!#     for (i = 0; i < 4; i++) {
!!#         IJ_iseg_printf  ("diag.j", 265,MyHTRAPS, i, th0, "#include \"htraps.s\"\n");
!!#         IJ_iseg_printf  ("diag.j", 266,MyHTRAPS, i, th0,"#include \"tlu_htraps_ext.s\"\n");
!!#         IJ_iseg_printf  ("diag.j", 267,MyTRAPS, i, th0,"#include \"traps.s\"\n");
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
!!#         IJ_generate ("diag.j", 312, th0, $2);
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
!!#         //| splash_cmpr   %rvar wt_low
!!#         | splash_tba    %rvar  wt_low
!!#         | splash_htba   %rvar  wt_low
!!#         | splash_lsucnt %rvar  wt_low
!!# ;
!!# 
!!# dummy :tCHANGE_NONHPRIV | tCHANGE_NONPRIV | 
!!#        tWR_STICK_CMPR_REG_R | tWR_TICK_CMPR_REG_R
!!# ;
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
!!# pt1: tFqTOd | tSDIVX_I | tSIAM | tWRTICK_R | tWR_STICK_REG_R
!!# ;
!!# 
!!# reduce_priv_level: pt1 
!!#     {
!!#         IJ_printf("diag.j", 360, th0, "reduce_priv_level_%d:\n", label);
!!#         IJ_set_ropr_fld("diag.j", 361, Ro_tl, Ft_Simm13, "{0..2}");
!!#         IJ_generate_from_token("diag.j", 362,1, th0, Ro_tl, tWRPR_TL_I, -1);;
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 364,1, th0, ijdefault, tCHANGE_NONHPRIV, -1);;
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 366,1, th0, ijdefault, tCHANGE_NONPRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_randtl: tWRPR_TL_I %ropr  Ro_tl
!!#     {
!!#         IJ_printf("diag.j", 374, th0, "change_to_randtl_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_set_ropr_fld("diag.j", 376, Ro_tl, Ft_Simm13, "{3..5}");
!!#             IJ_generate_from_token("diag.j", 377,1, th0, ijdefault, tCHANGE_HPRIV, -1);;
!!#         } else {
!!#             IJ_set_ropr_fld("diag.j", 379, Ro_tl, Ft_Simm13, "{0..2}");
!!#             IJ_generate_from_token("diag.j", 380,1, th0, ijdefault, tCHANGE_PRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_tl1 : tCHANGE_TO_TL1
!!#     {
!!#         IJ_printf("diag.j", 388, th0, "change_to_tl1_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 390, th0, "\tta T_CHANGE_HPRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 392, th0, "\tta T_CHANGE_PRIV\n");
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
!!#     //| tRDHPR_HTBA
!!#     //| tRDHPR_HPSTATE
!!#     //| tRD_TICK_CMPR_REG
!!#     //| tRD_STICK_CMPR_REG
!!#     //| tRD_STICK_REG         %ropr  Ro_rd0
!!# ;
!!# 
!!# splash_lsucnt: tFBPULE
!!#     {
!!#         IJ_printf("diag.j", 414, th0, "splash_lsu_%d:\n", label);
!!#         IJ_printf("diag.j", 415, th0, "\tset 0x%rx, %%r2\n", Rv_lsucntl);
!!#         IJ_printf("diag.j", 416, th0, "\tstxa %%r2, [%%r0] ASI_LSU_CONTROL\n");
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_tba: tWRPR_TBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 423, th0, "splash_tba_%d:\n", label);
!!#         IJ_printf("diag.j", 424, th0, "\tta T_CHANGE_PRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 426, th0, "\tset 0x120000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 428, th0, "\tset 0x%08llrx, %%r2\n", Rv_tba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# splash_htba: tWRHPR_HTBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 435, th0, "splash_htba_%d:\n", label);
!!#         IJ_printf("diag.j", 436, th0, "\tta T_CHANGE_HPRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 438, th0, "\tset 0x80000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 440, th0, "\tset 0x%08llrx, %%r2\n", Rv_htba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_cmpr: tWR_STICK_REG_I
!!#     {
!!#         IJ_printf("diag.j", 448, th0, "splash_cmpr_%d:\n", label);
!!#         IJ_set_rvar("diag.j", 449, Rv_rand_60,"64'h8rrrrrrr_rrrrrrrr");
!!#         IJ_set_ropr_fld("diag.j", 450, Ro_cmpr, Ft_Rs1, "{0}");
!!#         IJ_set_ropr_fld("diag.j", 451, Ro_cmpr, Ft_Rs2, "{1}");
!!#         IJ_printf  ("diag.j", 452, th0,"\tnop\n\tmov 1, %%g2\n");
!!#         IJ_printf  ("diag.j", 453, th0,"\tsllx %%g2, 63, %%g2\n");
!!#         IJ_printf  ("diag.j", 454, th0,"\tor %%g1, %%g2, %%g1\n");
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 456,1, th0, Ro_cmpr, tWR_STICK_CMPR_REG_R, tWR_TICK_CMPR_REG_R, -1);;
!!#         } else {
!!#            IJ_printf("diag.j", 458, th0, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
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
!!#         IJ_printf("diag.j", 496, th0, "\totherw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      } else {
!!#         IJ_printf("diag.j", 498, th0, "\tinvalw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!#         IJ_printf("diag.j", 583, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 584,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 585,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 586, th0, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 590, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 591,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 593,1, th0, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 595, th0, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 597, th0, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 602, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 603,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 605, th0, "\tilltrap\n");
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 607,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 609,1, th0, ijdefault, tFSQRTd, tLDQF_R, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 616, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 617,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 621, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 622,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 626, th0, "DS_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 627, th0, "\tnop\n\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 628, th0, "\tjmp %%g2\n");
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

