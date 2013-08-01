/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand03_ind_09.s
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
	mov 0x30, %r14
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
	mov 0x30, %r14
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
	mov 0x31, %r14
	mov 0x32, %r30
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
	.word 0x99b54fe5  ! 1: FONES	fones	%f12
	.word 0xd837e001  ! 2: STH_I	sth	%r12, [%r31 + 0x0001]
	.word 0x93902003  ! 3: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x879022e8  ! 4: WRPR_TT_I	wrpr	%r0, 0x02e8, %tt
	.word 0x8d9022dc  ! 5: WRPR_PSTATE_I	wrpr	%r0, 0x02dc, %pstate
	.word 0x87902337  ! 6: WRPR_TT_I	wrpr	%r0, 0x0337, %tt
	.word 0x8d802004  ! 7: WRFPRS_I	wr	%r0, 0x0004, %fprs
reduce_priv_level_0:
	.word 0x8f902000  ! 9: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1854003  ! 8: WR_STICK_REG_R	wr	%r21, %r3, %-
	.word 0x8d9022db  ! 9: WRPR_PSTATE_I	wrpr	%r0, 0x02db, %pstate
	.word 0xd85fe001  ! 10: LDX_I	ldx	[%r31 + 0x0001], %r12
	.word 0x99902000  ! 11: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8ac1e001  ! 12: ADDCcc_I	addccc 	%r7, 0x0001, %r5
	.word 0xa190200f  ! 13: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 14: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 15: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02033  ! 16: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x2e700001  ! 17: BPVS	<illegal instruction>
	.word 0x99902001  ! 18: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x81982f4d  ! 19: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4d, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 20: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcadfe020  ! 21: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r5
	.word 0x81982f5d  ! 22: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5d, %hpstate
	.word 0x8b702001  ! 23: POPC_I	popc	0x0001, %r5
	.word 0x8d802000  ! 24: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8350c000  ! 25: RDPR_TT	rdpr	%tt, %r1
	.word 0x91d02032  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d90201a  ! 27: WRPR_PSTATE_I	wrpr	%r0, 0x001a, %pstate
	.word 0xa190200f  ! 28: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x93902004  ! 29: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xc21fe001  ! 30: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0x9f802001  ! 31: SIR	sir	0x0001
	.word 0x32700001  ! 32: BPNE	<illegal instruction>
change_to_randtl_1:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 33: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x87902225  ! 34: WRPR_TT_I	wrpr	%r0, 0x0225, %tt
reduce_priv_level_2:
	.word 0x8f902001  ! 36: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8fa01978  ! 35: FqTOd	dis not found

	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 36: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 37: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81508000  ! 38: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x8198259c  ! 39: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059c, %hpstate
	.word 0x81982f9e  ! 40: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9e, %hpstate
	.word 0xc08008a0  ! 41: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x9f802001  ! 42: SIR	sir	0x0001
	.word 0x81460000  ! 43: RD_STICK_REG	stbar
	.word 0x81982457  ! 44: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0457, %hpstate
	.word 0x93902001  ! 45: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 46: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 47: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93902005  ! 48: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc0ffc038  ! 50: SWAPA_R	swapa	%r0, [%r31 + %r24] 0x01
	.word 0x879023ee  ! 51: WRPR_TT_I	wrpr	%r0, 0x03ee, %tt
	.word 0x93902002  ! 52: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8a49c004  ! 53: MULX_R	mulx 	%r7, %r4, %r5
	.word 0x8d902405  ! 54: WRPR_PSTATE_I	wrpr	%r0, 0x0405, %pstate
	.word 0x81982a9f  ! 55: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9f, %hpstate
	.word 0xaed8c00d  ! 56: SMULcc_R	smulcc 	%r3, %r13, %r23
	.word 0x8b504000  ! 57: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x81982554  ! 58: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0554, %hpstate
	.word 0xa1902007  ! 59: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 60: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c0a  ! 61: WRPR_PSTATE_I	wrpr	%r0, 0x0c0a, %pstate
	.word 0xa1902005  ! 62: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xb6d8c005  ! 63: SMULcc_R	smulcc 	%r3, %r5, %r27
	.word 0x91d02034  ! 64: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8751c000  ! 65: RDPR_TL	rdpr	%tl, %r3
	.word 0xc69fe001  ! 66: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
	.word 0x81982a0f  ! 67: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0f, %hpstate
	.word 0xc61fc000  ! 68: LDD_R	ldd	[%r31 + %r0], %r3
DS_3:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 69: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x81982b95  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b95, %hpstate
	.word 0x8198294c  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094c, %hpstate
	.word 0x91d02032  ! 72: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc67fe001  ! 73: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x8790207e  ! 74: WRPR_TT_I	wrpr	%r0, 0x007e, %tt
	.word 0xa190200e  ! 75: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 76: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f45c000  ! 77: RD_TICK_CMPR_REG	rd	%-, %r7
	.word 0x36800001  ! 78: BGE	bge,a	<label_0x1>
	.word 0x81982a9e  ! 79: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9e, %hpstate
	.word 0x86d10014  ! 80: UMULcc_R	umulcc 	%r4, %r20, %r3
	.word 0xc6d004a0  ! 81: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	.word 0x81982e8d  ! 82: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8d, %hpstate
	.word 0x87902019  ! 83: WRPR_TT_I	wrpr	%r0, 0x0019, %tt
	.word 0x8d902e5f  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x0e5f, %pstate
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 85: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x26800001  ! 86: BL	bl,a	<label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 87: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 88: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_randtl_4:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 89: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902007  ! 90: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 91: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81a01a69  ! 92: FqTOi	fqtoi	
	.word 0x81982b97  ! 93: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b97, %hpstate
	.word 0x879022c5  ! 94: WRPR_TT_I	wrpr	%r0, 0x02c5, %tt
	.word 0x93902000  ! 95: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 96: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982807  ! 97: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0807, %hpstate
	.word 0xc0c804a0  ! 98: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0x93902004  ! 99: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xb2da4016  ! 100: SMULcc_R	smulcc 	%r9, %r22, %r25
	.word 0x95a0cd2c  ! 101: FsMULd	fsmuld	%f3, %f12, %f10
change_to_tl1_5:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9f802001  ! 103: SIR	sir	0x0001
	.word 0x87802004  ! 104: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93494000  ! 105: RDHPR_HTBA	rdhpr	%htba, %r9
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 106: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 107: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9b50c000  ! 109: RDPR_TT	rdpr	%tt, %r13
	.word 0x879022a2  ! 110: WRPR_TT_I	wrpr	%r0, 0x02a2, %tt
	.word 0x93d02033  ! 111: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x91d02033  ! 112: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81508000  ! 113: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x99902000  ! 114: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x846b2001  ! 115: UDIVX_I	udivx 	%r12, 0x0001, %r2
	.word 0x81982714  ! 116: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0714, %hpstate
	.word 0xa5a00540  ! 117: FSQRTd	fsqrt	
	.word 0xa3514000  ! 118: RDPR_TBA	rdpr	%tba, %r17
	.word 0x93902006  ! 119: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902008  ! 120: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe2c004a0  ! 121: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r17
	.word 0xaf50c000  ! 122: RDPR_TT	rdpr	%tt, %r23
	.word 0x976b0001  ! 123: SDIVX_R	sdivx	%r12, %r1, %r11
	.word 0x87680015  ! 124: SDIVX_R	sdivx	%r0, %r21, %r3
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 125: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc64fe001  ! 126: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	.word 0x87902048  ! 127: WRPR_TT_I	wrpr	%r0, 0x0048, %tt
	.word 0x879020e3  ! 128: WRPR_TT_I	wrpr	%r0, 0x00e3, %tt
	.word 0x8d902692  ! 129: WRPR_PSTATE_I	wrpr	%r0, 0x0692, %pstate
	.word 0xc6ffc035  ! 130: SWAPA_R	swapa	%r3, [%r31 + %r21] 0x01
	.word 0x8ad6800a  ! 131: UMULcc_R	umulcc 	%r26, %r10, %r5
	.word 0x2e700001  ! 132: BPVS	<illegal instruction>
	.word 0x8d902407  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x0407, %pstate
	.word 0x8efaa001  ! 134: SDIVcc_I	sdivcc 	%r10, 0x0001, %r7
	.word 0x8198221e  ! 135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021e, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xce800c80  ! 137: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r7
	.word 0xa1902003  ! 138: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x22700001  ! 139: BPE	<illegal instruction>
	.word 0x91d02032  ! 140: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xce4fc000  ! 141: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0xce800b00  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r7
	.word 0x8d902ccf  ! 143: WRPR_PSTATE_I	wrpr	%r0, 0x0ccf, %pstate
	.word 0x91d02031  ! 144: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x91d02030  ! 145: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93540000  ! 146: RDPR_GL	rdpr	%-, %r9
	.word 0xaf504000  ! 147: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x81982606  ! 148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0606, %hpstate
	.word 0x8198268d  ! 149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068d, %hpstate
	.word 0x9f802001  ! 150: SIR	sir	0x0001
	.word 0x99a349e4  ! 151: FDIVq	dis not found

	.word 0x8b50c000  ! 152: RDPR_TT	rdpr	%tt, %r5
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 153: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 154: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d902e11  ! 155: WRPR_PSTATE_I	wrpr	%r0, 0x0e11, %pstate
	.word 0x8d90281d  ! 156: WRPR_PSTATE_I	wrpr	%r0, 0x081d, %pstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 157: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca8008a0  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xca800a80  ! 159: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r5
	.word 0xb5480000  ! 160: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xa190200e  ! 161: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8790202e  ! 162: WRPR_TT_I	wrpr	%r0, 0x002e, %tt
	.word 0xa5702001  ! 163: POPC_I	popc	0x0001, %r18
	.word 0xa8d18000  ! 164: UMULcc_R	umulcc 	%r6, %r0, %r20
	.word 0x93480000  ! 165: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x93902003  ! 166: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xb1540000  ! 167: RDPR_GL	rdpr	%-, %r24
DS_6:
	.word 0x20800001  ! 169: BN	bn,a	<label_0x1>
	illtrap
	.word 0x83a00558  ! 169: FSQRTd	fsqrt	
	.word 0x83a5483a  ! 168: FADDs	fadds	%f21, %f26, %f1
reduce_priv_level_7:
	.word 0x8f902002  ! 170: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89820005  ! 169: WRTICK_R	wr	%r8, %r5, %tick
	.word 0xa1902002  ! 170: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x95540000  ! 171: RDPR_GL	rdpr	%-, %r10
	.word 0xa1902004  ! 172: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x9b500000  ! 173: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x87902264  ! 174: WRPR_TT_I	wrpr	%r0, 0x0264, %tt
	.word 0x8d802000  ! 175: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902338  ! 176: WRPR_TT_I	wrpr	%r0, 0x0338, %tt
	.word 0xda8008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x91d02031  ! 178: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xda27e001  ! 179: STW_I	stw	%r13, [%r31 + 0x0001]
	.word 0xdad7e020  ! 180: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	.word 0x91d02035  ! 181: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902003  ! 182: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x819828cc  ! 183: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cc, %hpstate
DS_8:
	.word 0x32800001  ! 185: BNE	bne,a	<label_0x1>
	.word 0xd1334005  ! 185: STQF_R	-	%f8, [%r5, %r13]
	normalw
	.word 0x9b458000  ! 184: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x81982957  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0957, %hpstate
	.word 0xdadfe000  ! 186: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
	.word 0xb6f90014  ! 187: SDIVcc_R	sdivcc 	%r4, %r20, %r27
	.word 0x8d802000  ! 188: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8551c000  ! 189: RDPR_TL	rdpr	%tl, %r2
	.word 0x87802004  ! 190: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8b480000  ! 191: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x93902002  ! 192: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902841  ! 193: WRPR_PSTATE_I	wrpr	%r0, 0x0841, %pstate
reduce_priv_level_9:
	.word 0x8f902001  ! 195: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x85a01970  ! 194: FqTOd	dis not found

	.word 0x81982f47  ! 195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f47, %hpstate
	.word 0x87902131  ! 196: WRPR_TT_I	wrpr	%r0, 0x0131, %tt
	.word 0xa1902006  ! 197: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x81460000  ! 198: RD_STICK_REG	stbar
	.word 0x91d02030  ! 199: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x87902372  ! 200: WRPR_TT_I	wrpr	%r0, 0x0372, %tt
	.word 0x8d514000  ! 201: RDPR_TBA	rdpr	%tba, %r6
	.word 0xcd27c010  ! 202: STF_R	st	%f6, [%r16, %r31]
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 203: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 204: WRPR_GL_I	wrpr	%r0, 0x0005, %-
reduce_priv_level_10:
	.word 0x8f902001  ! 206: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5682001  ! 205: SDIVX_I	sdivx	%r0, 0x0001, %r18
	.word 0xa8d12001  ! 206: UMULcc_I	umulcc 	%r4, 0x0001, %r20
	.word 0x93902006  ! 207: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe847c000  ! 208: LDSW_R	ldsw	[%r31 + %r0], %r20
	.word 0xa1902009  ! 209: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x9f802001  ! 210: SIR	sir	0x0001
	.word 0xb3a00541  ! 211: FSQRTd	fsqrt	
	.word 0xf337c001  ! 212: STQF_R	-	%f25, [%r1, %r31]
	.word 0xf23fe001  ! 213: STD_I	std	%r25, [%r31 + 0x0001]
	.word 0x8d902ad1  ! 214: WRPR_PSTATE_I	wrpr	%r0, 0x0ad1, %pstate
	.word 0x94fa4019  ! 215: SDIVcc_R	sdivcc 	%r9, %r25, %r10
	.word 0x90aa0001  ! 216: ANDNcc_R	andncc 	%r8, %r1, %r8
	.word 0x879022d6  ! 217: WRPR_TT_I	wrpr	%r0, 0x02d6, %tt
	.word 0x83480000  ! 218: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0x93902003  ! 219: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc25fc000  ! 220: LDX_R	ldx	[%r31 + %r0], %r1
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 221: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790213c  ! 222: WRPR_TT_I	wrpr	%r0, 0x013c, %tt
	.word 0x8d902acf  ! 223: WRPR_PSTATE_I	wrpr	%r0, 0x0acf, %pstate
	.word 0x93464000  ! 224: RD_STICK_CMPR_REG	rd	%-, %r9
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
DS_11:
	.word 0x32800001  ! 228: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 227: SAVE_R	save	%r31, %r0, %r31
	.word 0x93902004  ! 228: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d802004  ! 229: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9f802001  ! 230: SIR	sir	0x0001
	.word 0x87802088  ! 231: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d902843  ! 232: WRPR_PSTATE_I	wrpr	%r0, 0x0843, %pstate
	.word 0x91d02032  ! 233: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x879023cb  ! 234: WRPR_TT_I	wrpr	%r0, 0x03cb, %tt
	.word 0xae85a001  ! 235: ADDcc_I	addcc 	%r22, 0x0001, %r23
	.word 0xa1902003  ! 236: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8a80a001  ! 237: ADDcc_I	addcc 	%r2, 0x0001, %r5
	.word 0xa1902008  ! 238: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x879021ab  ! 239: WRPR_TT_I	wrpr	%r0, 0x01ab, %tt
	.word 0x97514000  ! 240: RDPR_TBA	rdpr	%tba, %r11
	.word 0x28700001  ! 241: BPLEU	<illegal instruction>
	.word 0x81982306  ! 242: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0306, %hpstate
DS_12:
	.word 0x32800001  ! 244: BNE	bne,a	<label_0x1>
	.word 0xc936000c  ! 244: STQF_R	-	%f4, [%r12, %r24]
	normalw
	.word 0xb7458000  ! 243: RD_SOFTINT_REG	rd	%softint, %r27
	.word 0x93902007  ! 244: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902894  ! 245: WRPR_PSTATE_I	wrpr	%r0, 0x0894, %pstate
	.word 0xa7a01a70  ! 246: FqTOi	fqtoi	
	.word 0x8da48dcb  ! 247: FdMULq	fdmulq	
	.word 0x81982716  ! 248: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0716, %hpstate
	.word 0x8d802004  ! 249: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87514000  ! 250: RDPR_TBA	rdpr	%tba, %r3
	.word 0x8951c000  ! 251: RDPR_TL	rdpr	%tl, %r4
	.word 0xc88804a0  ! 252: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	.word 0x91d02032  ! 253: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902007  ! 254: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc8c004a0  ! 255: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r4
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 256: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9afdc012  ! 257: SDIVcc_R	sdivcc 	%r23, %r18, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x34800001  ! 259: BG	bg,a	<label_0x1>
	.word 0x819822c5  ! 260: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c5, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 262: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879022c6  ! 263: WRPR_TT_I	wrpr	%r0, 0x02c6, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdb3fe001  ! 265: STDF_I	std	%f13, [0x0001, %r31]
	.word 0x8d902a1f  ! 266: WRPR_PSTATE_I	wrpr	%r0, 0x0a1f, %pstate
	.word 0x9f802001  ! 267: SIR	sir	0x0001
	.word 0x93902001  ! 268: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902006  ! 269: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87802088  ! 270: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902003  ! 271: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa0ab0004  ! 272: ANDNcc_R	andncc 	%r12, %r4, %r16
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 273: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982686  ! 274: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0686, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 276: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879022f3  ! 277: WRPR_TT_I	wrpr	%r0, 0x02f3, %tt
	.word 0xe08008a0  ! 278: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe0d00e60  ! 279: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r16
reduce_priv_level_13:
	.word 0x8f902001  ! 281: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8b6a2001  ! 280: SDIVX_I	sdivx	%r8, 0x0001, %r5
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 281: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 282: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 283: SIR	sir	0x0001
DS_14:
	.word 0x22800001  ! 285: BE	be,a	<label_0x1>
	pdist %f30, %f14, %f10
	.word 0x95b64307  ! 284: ALLIGNADDRESS	alignaddr	%r25, %r7, %r10
	.word 0xa1902006  ! 285: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_tl1_15:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02034  ! 287: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 288: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 289: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8882c01a  ! 290: ADDcc_R	addcc 	%r11, %r26, %r4
change_to_tl1_16:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x89b50ff2  ! 293: FONES	fones	%f4
	.word 0x3e700001  ! 294: BPVC	<illegal instruction>
	.word 0x93902001  ! 295: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc81fe001  ! 296: LDD_I	ldd	[%r31 + 0x0001], %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802088  ! 298: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xb6d2800b  ! 299: UMULcc_R	umulcc 	%r10, %r11, %r27
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 300: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xaf504000  ! 301: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x8d902801  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x0801, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 303: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90224c  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x024c, %pstate
	.word 0x91504000  ! 305: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x93d02032  ! 306: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd1e7c02b  ! 307: CASA_I	casa	[%r31] 0x 1, %r11, %r8
	.word 0x879020c1  ! 308: WRPR_TT_I	wrpr	%r0, 0x00c1, %tt
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 309: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd08008a0  ! 310: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902298  ! 312: WRPR_PSTATE_I	wrpr	%r0, 0x0298, %pstate
	.word 0x83d02033  ! 313: Tcc_I	te	icc_or_xcc, %r0 + 51
DS_17:
	.word 0x32800001  ! 315: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 314: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d902403  ! 315: WRPR_PSTATE_I	wrpr	%r0, 0x0403, %pstate
	.word 0x8790228e  ! 316: WRPR_TT_I	wrpr	%r0, 0x028e, %tt
	.word 0x8d902c92  ! 317: WRPR_PSTATE_I	wrpr	%r0, 0x0c92, %pstate
DS_18:
	.word 0x32800001  ! 319: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xe1104009  ! 319: LDQF_R	-	[%r1, %r9], %f16
	.word 0x87a54822  ! 318: FADDs	fadds	%f21, %f2, %f3
	.word 0x95a549e9  ! 319: FDIVq	dis not found

	.word 0x91d02033  ! 320: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x97508000  ! 321: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0xa1902002  ! 322: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902006  ! 323: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x2e700001  ! 324: BPVS	<illegal instruction>
	.word 0x93d02035  ! 325: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x81a149a8  ! 326: FDIVs	fdivs	%f5, %f8, %f0
	.word 0xc0900e80  ! 327: LDUHA_R	lduha	[%r0, %r0] 0x74, %r0
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 328: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_tl1_19:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xc0800c80  ! 330: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r0
	.word 0x87802080  ! 331: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93902005  ! 332: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x879023d4  ! 333: WRPR_TT_I	wrpr	%r0, 0x03d4, %tt
	.word 0x93d02034  ! 334: Tcc_I	tne	icc_or_xcc, %r0 + 52
change_to_tl1_20:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87902075  ! 336: WRPR_TT_I	wrpr	%r0, 0x0075, %tt
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 337: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902178  ! 338: WRPR_TT_I	wrpr	%r0, 0x0178, %tt
	.word 0x99902001  ! 339: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8d90224d  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x024d, %pstate
	.word 0x9ba01a75  ! 341: FqTOi	fqtoi	
	.word 0x8790238b  ! 342: WRPR_TT_I	wrpr	%r0, 0x038b, %tt
reduce_priv_level_21:
	.word 0x8f902000  ! 344: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 343: SIAM	siam	1
	.word 0x83d02033  ! 344: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x93902001  ! 345: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 346: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902008  ! 347: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x91d02031  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d9020dc  ! 349: WRPR_PSTATE_I	wrpr	%r0, 0x00dc, %pstate
	.word 0x93d02030  ! 350: Tcc_I	tne	icc_or_xcc, %r0 + 48
DS_22:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 351: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x91d02033  ! 352: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902005  ! 353: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xab540000  ! 354: RDPR_GL	rdpr	%-, %r21
	.word 0xeaffc035  ! 355: SWAPA_R	swapa	%r21, [%r31 + %r21] 0x01
	.word 0x99702001  ! 356: POPC_I	popc	0x0001, %r12
	.word 0xa7464000  ! 357: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0xaed02001  ! 358: UMULcc_I	umulcc 	%r0, 0x0001, %r23
	.word 0xee1fc000  ! 359: LDD_R	ldd	[%r31 + %r0], %r23
DS_23:
	.word 0x32800001  ! 361: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 360: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 361: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8ba249a1  ! 362: FDIVs	fdivs	%f9, %f1, %f5
reduce_priv_level_24:
	.word 0x8f902002  ! 364: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 363: SIAM	siam	1
	.word 0xa1902001  ! 364: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 365: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902369  ! 367: WRPR_TT_I	wrpr	%r0, 0x0369, %tt
	.word 0x83d02035  ! 368: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x879021f5  ! 369: WRPR_TT_I	wrpr	%r0, 0x01f5, %tt
	.word 0x8d902c9f  ! 370: WRPR_PSTATE_I	wrpr	%r0, 0x0c9f, %pstate
	.word 0x91d02031  ! 371: Tcc_I	ta	icc_or_xcc, %r0 + 49
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 372: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca9fe001  ! 373: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
	.word 0x83b6cfea  ! 374: FONES	fones	%f1
DS_25:
	.word 0x20800001  ! 376: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 375: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x879023f1  ! 376: WRPR_TT_I	wrpr	%r0, 0x03f1, %tt
	.word 0xc2bfe001  ! 377: STDA_I	stda	%r1, [%r31 + 0x0001] %asi
	.word 0x9f802001  ! 378: SIR	sir	0x0001
	.word 0xc28008a0  ! 379: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x81982185  ! 380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0185, %hpstate
	.word 0xa190200c  ! 381: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8790224b  ! 382: WRPR_TT_I	wrpr	%r0, 0x024b, %tt
	.word 0x8d902adc  ! 383: WRPR_PSTATE_I	wrpr	%r0, 0x0adc, %pstate
	.word 0x8751c000  ! 384: RDPR_TL	rdpr	%tl, %r3
	.word 0x81982955  ! 385: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0955, %hpstate
	.word 0xa190200c  ! 386: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9750c000  ! 388: RDPR_TT	rdpr	%tt, %r11
	.word 0x91d02033  ! 389: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x97a00550  ! 390: FSQRTd	fsqrt	
	.word 0x93902001  ! 391: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd67fe001  ! 392: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x83d02034  ! 393: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xd60fc000  ! 394: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0x879023cf  ! 395: WRPR_TT_I	wrpr	%r0, 0x03cf, %tt
	.word 0x9f802001  ! 396: SIR	sir	0x0001
	.word 0x9f802001  ! 397: SIR	sir	0x0001
DS_26:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 398: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x879022c6  ! 399: WRPR_TT_I	wrpr	%r0, 0x02c6, %tt
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 400: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982b56  ! 401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b56, %hpstate
	.word 0x8198279f  ! 402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079f, %hpstate
	.word 0xa2d2e001  ! 403: UMULcc_I	umulcc 	%r11, 0x0001, %r17
	.word 0xe23fe001  ! 404: STD_I	std	%r17, [%r31 + 0x0001]
	.word 0xa190200c  ! 405: WRPR_GL_I	wrpr	%r0, 0x000c, %-
DS_27:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 406: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x93902004  ! 407: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe247e001  ! 408: LDSW_I	ldsw	[%r31 + 0x0001], %r17
	.word 0x8d902809  ! 409: WRPR_PSTATE_I	wrpr	%r0, 0x0809, %pstate
	.word 0xe2d804a0  ! 410: LDXA_R	ldxa	[%r0, %r0] 0x25, %r17
change_to_tl1_28:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
reduce_priv_level_29:
	.word 0x8f902001  ! 413: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ba01962  ! 412: FqTOd	dis not found

DS_30:
	.word 0x32800001  ! 414: BNE	bne,a	<label_0x1>
	allclean
	.word 0x97b0c304  ! 413: ALLIGNADDRESS	alignaddr	%r3, %r4, %r11
DS_31:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 414: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x8d902280  ! 415: WRPR_PSTATE_I	wrpr	%r0, 0x0280, %pstate
	.word 0x99a0c9f8  ! 416: FDIVq	dis not found

	.word 0x8d902888  ! 417: WRPR_PSTATE_I	wrpr	%r0, 0x0888, %pstate
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 419: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982456  ! 420: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0456, %hpstate
	.word 0x87902075  ! 421: WRPR_TT_I	wrpr	%r0, 0x0075, %tt
	.word 0x9f802001  ! 422: SIR	sir	0x0001
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 423: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 424: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x95a00568  ! 425: FSQRTq	fsqrt	
	.word 0x87802014  ! 426: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902003  ! 427: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd5e7c028  ! 428: CASA_I	casa	[%r31] 0x 1, %r8, %r10
	.word 0x8d508000  ! 429: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0xa1902008  ! 430: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x3c700001  ! 431: BPPOS	<illegal instruction>
	.word 0xcc7fe001  ! 432: SWAP_I	swap	%r6, [%r31 + 0x0001]
DS_32:
	.word 0x32800001  ! 434: BNE	bne,a	<label_0x1>
	pdist %f10, %f18, %f14
	.word 0x99b1c309  ! 433: ALLIGNADDRESS	alignaddr	%r7, %r9, %r12
	.word 0xd8800a60  ! 434: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r12
	.word 0x86802001  ! 435: ADDcc_I	addcc 	%r0, 0x0001, %r3
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02031  ! 438: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xc6c00e60  ! 439: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r3
	.word 0x81982655  ! 440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0655, %hpstate
	.word 0x93d02034  ! 441: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8198268f  ! 442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068f, %hpstate
	.word 0xa1902001  ! 443: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x96db400c  ! 444: SMULcc_R	smulcc 	%r13, %r12, %r11
DS_33:
	.word 0x20800001  ! 446: BN	bn,a	<label_0x1>
	allclean
	.word 0x81b24307  ! 445: ALLIGNADDRESS	alignaddr	%r9, %r7, %r0
	.word 0xab698009  ! 446: SDIVX_R	sdivx	%r6, %r9, %r21
	.word 0x91d02032  ! 447: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81982955  ! 448: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0955, %hpstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 449: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xea9004a0  ! 450: LDUHA_R	lduha	[%r0, %r0] 0x25, %r21
	.word 0x93902000  ! 451: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902004  ! 452: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x82696001  ! 454: UDIVX_I	udivx 	%r5, 0x0001, %r1
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 455: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902269  ! 456: WRPR_TT_I	wrpr	%r0, 0x0269, %tt
	.word 0x91d02033  ! 457: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902001  ! 458: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982c9e  ! 459: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9e, %hpstate
	.word 0x8d902c91  ! 460: WRPR_PSTATE_I	wrpr	%r0, 0x0c91, %pstate
change_to_tl1_34:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x2c800001  ! 462: BNEG	bneg,a	<label_0x1>
	.word 0x91d02032  ! 463: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200d  ! 464: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa1902002  ! 465: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93494000  ! 466: RDHPR_HTBA	rdhpr	%htba, %r9
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 467: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c4f  ! 468: WRPR_PSTATE_I	wrpr	%r0, 0x0c4f, %pstate
	.word 0xd397e001  ! 469: LDQFA_I	-	[%r31, 0x0001], %f9
	.word 0xa7504000  ! 470: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x2e800001  ! 471: BVS	bvs,a	<label_0x1>
	.word 0xaac66001  ! 472: ADDCcc_I	addccc 	%r25, 0x0001, %r21
	.word 0x38800001  ! 473: BGU	bgu,a	<label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 474: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902007  ! 475: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x81982cdc  ! 476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdc, %hpstate
	.word 0x91d02031  ! 477: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x946ce001  ! 478: UDIVX_I	udivx 	%r19, 0x0001, %r10
	.word 0x85a00548  ! 479: FSQRTd	fsqrt	
	.word 0x9aad8018  ! 480: ANDNcc_R	andncc 	%r22, %r24, %r13
change_to_randtl_35:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 481: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa1902007  ! 482: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xda5fe001  ! 483: LDX_I	ldx	[%r31 + 0x0001], %r13
	.word 0xb0c2e001  ! 484: ADDCcc_I	addccc 	%r11, 0x0001, %r24
	.word 0x8d902619  ! 485: WRPR_PSTATE_I	wrpr	%r0, 0x0619, %pstate
	.word 0x91d02034  ! 486: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902a51  ! 487: WRPR_PSTATE_I	wrpr	%r0, 0x0a51, %pstate
	.word 0x93902004  ! 488: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87514000  ! 489: RDPR_TBA	rdpr	%tba, %r3
	.word 0x879021f7  ! 490: WRPR_TT_I	wrpr	%r0, 0x01f7, %tt
	.word 0x83a01a62  ! 491: FqTOi	fqtoi	
	.word 0xb4d18009  ! 492: UMULcc_R	umulcc 	%r6, %r9, %r26
	.word 0x9f802001  ! 493: SIR	sir	0x0001
	.word 0x87902069  ! 494: WRPR_TT_I	wrpr	%r0, 0x0069, %tt
DS_36:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 495: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x8d802000  ! 496: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982bcf  ! 497: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcf, %hpstate
	.word 0xf47fe001  ! 498: SWAP_I	swap	%r26, [%r31 + 0x0001]
	.word 0x83a30dc2  ! 499: FdMULq	fdmulq	
	.word 0x93494000  ! 500: RDHPR_HTBA	rdhpr	%htba, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802089  ! 502: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd28008a0  ! 503: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d9028d0  ! 504: WRPR_PSTATE_I	wrpr	%r0, 0x08d0, %pstate
	.word 0x99902003  ! 505: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xd21fe001  ! 506: LDD_I	ldd	[%r31 + 0x0001], %r9
change_to_randtl_37:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 507: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8d9028d5  ! 508: WRPR_PSTATE_I	wrpr	%r0, 0x08d5, %pstate
	.word 0xa1902009  ! 509: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd29004a0  ! 510: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0x81982a8c  ! 511: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8c, %hpstate
DS_38:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 512: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x24700001  ! 513: BPLE	<illegal instruction>
	.word 0x81982c15  ! 514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c15, %hpstate
	.word 0x83a00550  ! 515: FSQRTd	fsqrt	
	.word 0x81460000  ! 516: RD_STICK_REG	stbar
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 517: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 518: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 519: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc2800c40  ! 520: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r1
	.word 0xa7a349e1  ! 521: FDIVq	dis not found

	.word 0xe6d7e030  ! 522: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r19
	.word 0x93902003  ! 523: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x9685000b  ! 524: ADDcc_R	addcc 	%r20, %r11, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x8cd12001  ! 526: UMULcc_I	umulcc 	%r4, 0x0001, %r6
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 527: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 528: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa190200c  ! 529: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x91d02034  ! 530: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x85514000  ! 531: RDPR_TBA	rdpr	%tba, %r2
	.word 0x91d02031  ! 532: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8ec4e001  ! 533: ADDCcc_I	addccc 	%r19, 0x0001, %r7
reduce_priv_level_39:
	.word 0x8f902002  ! 535: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb186c001  ! 534: WR_STICK_REG_R	wr	%r27, %r1, %-
	.word 0x8d902e1a  ! 535: WRPR_PSTATE_I	wrpr	%r0, 0x0e1a, %pstate
	.word 0xa1902004  ! 536: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8790230b  ! 537: WRPR_TT_I	wrpr	%r0, 0x030b, %tt
	.word 0xad514000  ! 538: RDPR_TBA	rdpr	%tba, %r22
DS_40:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 539: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x93902005  ! 540: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x94c16001  ! 542: ADDCcc_I	addccc 	%r5, 0x0001, %r10
	.word 0x93902007  ! 543: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_tl1_41:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xaba589c9  ! 545: FDIVd	fdivd	%f22, %f40, %f52
	.word 0x9f802001  ! 546: SIR	sir	0x0001
	.word 0xeac7e000  ! 547: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r21
	.word 0x81982057  ! 548: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0057, %hpstate
	.word 0x38800001  ! 549: BGU	bgu,a	<label_0x1>
	.word 0xeac7e000  ! 550: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r21
	.word 0xa190200d  ! 551: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xeb37e001  ! 552: STQF_I	-	%f21, [0x0001, %r31]
	.word 0x8d902098  ! 553: WRPR_PSTATE_I	wrpr	%r0, 0x0098, %pstate
	.word 0x8790226a  ! 554: WRPR_TT_I	wrpr	%r0, 0x026a, %tt
	.word 0x8790237c  ! 555: WRPR_TT_I	wrpr	%r0, 0x037c, %tt
	.word 0x8d802004  ! 556: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802089  ! 557: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8198229f  ! 558: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029f, %hpstate
	.word 0x89464000  ! 559: RD_STICK_CMPR_REG	rd	%-, %r4
	.word 0x99902004  ! 560: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x91d02035  ! 561: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8fa28dc1  ! 562: FdMULq	fdmulq	
	.word 0xa1902002  ! 563: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8ad4a001  ! 564: UMULcc_I	umulcc 	%r18, 0x0001, %r5
	.word 0x91d02030  ! 565: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d902e9c  ! 566: WRPR_PSTATE_I	wrpr	%r0, 0x0e9c, %pstate
	.word 0xca8008a0  ! 567: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8d902c58  ! 568: WRPR_PSTATE_I	wrpr	%r0, 0x0c58, %pstate
	.word 0x93902002  ! 569: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_42:
	.word 0x20800001  ! 571: BN	bn,a	<label_0x1>
	illtrap
	.word 0x87a00545  ! 571: FSQRTd	fsqrt	
	.word 0x85a2c839  ! 570: FADDs	fadds	%f11, %f25, %f2
	.word 0x99540000  ! 571: RDPR_GL	rdpr	%-, %r12
	.word 0xd84fe001  ! 572: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0x87902305  ! 573: WRPR_TT_I	wrpr	%r0, 0x0305, %tt
	.word 0xd927c019  ! 574: STF_R	st	%f12, [%r25, %r31]
change_to_randtl_43:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 575: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x93902004  ! 576: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_tl1_44:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902002  ! 578: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
reduce_priv_level_45:
	.word 0x8f902000  ! 580: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89834012  ! 579: WRTICK_R	wr	%r13, %r18, %tick
	.word 0x87902381  ! 580: WRPR_TT_I	wrpr	%r0, 0x0381, %tt
	.word 0xd817e001  ! 581: LDUH_I	lduh	[%r31 + 0x0001], %r12
DS_46:
	.word 0x34800001  ! 583: BG	bg,a	<label_0x1>
	illtrap
	.word 0xe116c00c  ! 583: LDQF_R	-	[%r27, %r12], %f16
	.word 0xa7a48830  ! 582: FADDs	fadds	%f18, %f16, %f19
	.word 0x87902200  ! 583: WRPR_TT_I	wrpr	%r0, 0x0200, %tt
	.word 0x87902175  ! 584: WRPR_TT_I	wrpr	%r0, 0x0175, %tt
	.word 0x91d02034  ! 585: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa3a0c9f6  ! 586: FDIVq	dis not found

	.word 0x8d802004  ! 587: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x38700001  ! 588: BPGU	<illegal instruction>
	.word 0x83d02030  ! 589: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x91d02031  ! 590: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x91d02032  ! 591: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 592: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 593: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x819827ce  ! 594: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ce, %hpstate
	.word 0xe3e7c036  ! 595: CASA_I	casa	[%r31] 0x 1, %r22, %r17
	.word 0xe2c80e60  ! 596: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r17
	.word 0x80f8001a  ! 597: SDIVcc_R	sdivcc 	%r0, %r26, %r0
	.word 0x81982fdc  ! 598: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdc, %hpstate
	.word 0x93902000  ! 599: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902c17  ! 600: WRPR_PSTATE_I	wrpr	%r0, 0x0c17, %pstate
	.word 0x99902001  ! 601: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 602: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc08008a0  ! 603: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x85508000  ! 604: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x8790209e  ! 605: WRPR_TT_I	wrpr	%r0, 0x009e, %tt
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 606: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x88ab4019  ! 607: ANDNcc_R	andncc 	%r13, %r25, %r4
	.word 0x8d9022c7  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x02c7, %pstate
	.word 0xc937c019  ! 609: STQF_R	-	%f4, [%r25, %r31]
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 610: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902007  ! 611: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x91d02034  ! 612: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802010  ! 613: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xaf50c000  ! 614: RDPR_TT	rdpr	%tt, %r23
	.word 0x93a00561  ! 615: FSQRTq	fsqrt	
	.word 0x81982145  ! 616: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0145, %hpstate
	.word 0xa44a0016  ! 617: MULX_R	mulx 	%r8, %r22, %r18
	.word 0x8d902ad0  ! 618: WRPR_PSTATE_I	wrpr	%r0, 0x0ad0, %pstate
	.word 0x81982ece  ! 619: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ece, %hpstate
	.word 0x9b480000  ! 620: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 621: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 622: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 623: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93902000  ! 624: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xda8fe030  ! 625: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0x93d02034  ! 626: Tcc_I	tne	icc_or_xcc, %r0 + 52
reduce_priv_level_47:
	.word 0x8f902001  ! 628: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 627: SIAM	siam	1
DS_48:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 628: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xa1902002  ! 629: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xdad7e030  ! 630: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	.word 0x95494000  ! 631: RDHPR_HTBA	rdhpr	%htba, %r10
	.word 0x9f802001  ! 632: SIR	sir	0x0001
	.word 0xd497e020  ! 633: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0x8d802004  ! 634: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa190200d  ! 635: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 636: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x864b0018  ! 637: MULX_R	mulx 	%r12, %r24, %r3
	.word 0x3a700001  ! 638: BPCC	<illegal instruction>
	.word 0xc68008a0  ! 639: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xb1a009e0  ! 640: FDIVq	dis not found

	.word 0x81982916  ! 641: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0916, %hpstate
	.word 0x8d902619  ! 642: WRPR_PSTATE_I	wrpr	%r0, 0x0619, %pstate
	.word 0x9f802001  ! 643: SIR	sir	0x0001
	.word 0x8d902852  ! 644: WRPR_PSTATE_I	wrpr	%r0, 0x0852, %pstate
	.word 0x91d02032  ! 645: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81982857  ! 646: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0857, %hpstate
	.word 0x93902002  ! 647: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902003  ! 648: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 649: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8f51c000  ! 650: RDPR_TL	rdpr	%tl, %r7
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790209a  ! 652: WRPR_TT_I	wrpr	%r0, 0x009a, %tt
	.word 0x879023fb  ! 653: WRPR_TT_I	wrpr	%r0, 0x03fb, %tt
	.word 0xceffc020  ! 654: SWAPA_R	swapa	%r7, [%r31 + %r0] 0x01
	.word 0x8198230c  ! 655: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030c, %hpstate
	.word 0x8d90285e  ! 656: WRPR_PSTATE_I	wrpr	%r0, 0x085e, %pstate
	.word 0x819820cc  ! 657: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00cc, %hpstate
	.word 0x89514000  ! 658: RDPR_TBA	rdpr	%tba, %r4
	.word 0x81a0054d  ! 659: FSQRTd	fsqrt	
	.word 0xc08fe020  ! 660: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r0
change_to_randtl_49:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 661: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa190200e  ! 662: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d902447  ! 663: WRPR_PSTATE_I	wrpr	%r0, 0x0447, %pstate
	.word 0x8d902492  ! 664: WRPR_PSTATE_I	wrpr	%r0, 0x0492, %pstate
	.word 0x93540000  ! 665: RDPR_GL	rdpr	%-, %r9
	.word 0x8d9028c3  ! 666: WRPR_PSTATE_I	wrpr	%r0, 0x08c3, %pstate
change_to_tl1_50:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xd27fe001  ! 668: SWAP_I	swap	%r9, [%r31 + 0x0001]
	.word 0x819827c7  ! 669: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c7, %hpstate
	.word 0x93902007  ! 670: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x89514000  ! 671: RDPR_TBA	rdpr	%tba, %r4
	.word 0x97494000  ! 672: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0x8d902883  ! 673: WRPR_PSTATE_I	wrpr	%r0, 0x0883, %pstate
	.word 0xd697e020  ! 674: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r11
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 675: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 676: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd6c004a0  ! 677: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
change_to_tl1_51:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87a01a69  ! 679: FqTOi	fqtoi	
	.word 0x87902190  ! 680: WRPR_TT_I	wrpr	%r0, 0x0190, %tt
	.word 0xc60fc000  ! 681: LDUB_R	ldub	[%r31 + %r0], %r3
	.word 0xc7e7c029  ! 682: CASA_I	casa	[%r31] 0x 1, %r9, %r3
	.word 0x81982957  ! 683: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0957, %hpstate
	.word 0x87a549a1  ! 684: FDIVs	fdivs	%f21, %f1, %f3
	.word 0x93902003  ! 685: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_52:
	.word 0x32800001  ! 687: BNE	bne,a	<label_0x1>
	pdist %f16, %f18, %f8
	.word 0x9bb08307  ! 686: ALLIGNADDRESS	alignaddr	%r2, %r7, %r13
	.word 0x91d02034  ! 687: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xdbe7c027  ! 688: CASA_I	casa	[%r31] 0x 1, %r7, %r13
	.word 0x87902231  ! 689: WRPR_TT_I	wrpr	%r0, 0x0231, %tt
	.word 0x38800001  ! 690: BGU	bgu,a	<label_0x1>
	.word 0xdaffc027  ! 691: SWAPA_R	swapa	%r13, [%r31 + %r7] 0x01
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 692: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x819821cd  ! 693: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cd, %hpstate
	.word 0x20800001  ! 694: BN	bn,a	<label_0x1>
	.word 0xdb37e001  ! 695: STQF_I	-	%f13, [0x0001, %r31]
change_to_tl1_53:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d90225a  ! 697: WRPR_PSTATE_I	wrpr	%r0, 0x025a, %pstate
	.word 0x81982556  ! 698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0556, %hpstate
DS_54:
	.word 0x20800001  ! 700: BN	bn,a	<label_0x1>
	illtrap
	.word 0xafa00558  ! 700: FSQRTd	fsqrt	
	.word 0x99a24834  ! 699: FADDs	fadds	%f9, %f20, %f12
	.word 0x81982d57  ! 700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d57, %hpstate
	.word 0x93702001  ! 701: POPC_I	popc	0x0001, %r9
	.word 0xd28fe030  ! 702: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0x87902172  ! 704: WRPR_TT_I	wrpr	%r0, 0x0172, %tt
	.word 0xa9702001  ! 705: POPC_I	popc	0x0001, %r20
	.word 0xe84fe001  ! 706: LDSB_I	ldsb	[%r31 + 0x0001], %r20
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 707: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 708: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 709: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x30700001  ! 710: BPA	<illegal instruction>
	.word 0xe82fc014  ! 711: STB_R	stb	%r20, [%r31 + %r20]
	.word 0x91d02031  ! 712: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902003  ! 713: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982f5e  ! 714: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5e, %hpstate
	.word 0x93902000  ! 715: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902005  ! 716: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x879022e7  ! 717: WRPR_TT_I	wrpr	%r0, 0x02e7, %tt
	.word 0xa3a00545  ! 718: FSQRTd	fsqrt	
	.word 0xad51c000  ! 719: RDPR_TL	rdpr	%tl, %r22
	.word 0xec8fe030  ! 720: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r22
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 721: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xb1508000  ! 722: RDPR_TSTATE	<illegal instruction>
	.word 0x886aa001  ! 723: UDIVX_I	udivx 	%r10, 0x0001, %r4
	.word 0x879020e8  ! 724: WRPR_TT_I	wrpr	%r0, 0x00e8, %tt
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 725: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81460000  ! 726: RD_STICK_REG	stbar
	.word 0xb3a009e5  ! 727: FDIVq	dis not found

	.word 0x91d02031  ! 728: Tcc_I	ta	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93d02035  ! 730: Tcc_I	tne	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982a5f  ! 733: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5f, %hpstate
	.word 0x91d02035  ! 734: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802004  ! 735: WRASI_I	wr	%r0, 0x0004, %asi
reduce_priv_level_55:
	.word 0x8f902002  ! 737: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb36a2001  ! 736: SDIVX_I	sdivx	%r8, 0x0001, %r25
	.word 0x85514000  ! 737: RDPR_TBA	rdpr	%tba, %r2
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 738: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198239d  ! 739: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039d, %hpstate
	.word 0xc417c000  ! 740: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x91508000  ! 741: RDPR_TSTATE	rdpr	%tstate, %r8
	.word 0x8198205f  ! 742: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005f, %hpstate
	.word 0x879022e2  ! 743: WRPR_TT_I	wrpr	%r0, 0x02e2, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xa3480000  ! 745: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x91d02031  ! 746: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902004  ! 747: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d90268a  ! 748: WRPR_PSTATE_I	wrpr	%r0, 0x068a, %pstate
reduce_priv_level_56:
	.word 0x8f902002  ! 750: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1818018  ! 749: WR_STICK_REG_R	wr	%r6, %r24, %-
	.word 0x81982fcf  ! 750: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcf, %hpstate
	.word 0xb0696001  ! 751: UDIVX_I	udivx 	%r5, 0x0001, %r24
	.word 0x93902004  ! 752: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x32700001  ! 753: BPNE	<illegal instruction>
	.word 0x93d02031  ! 754: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xa1902002  ! 755: WRPR_GL_I	wrpr	%r0, 0x0002, %-
DS_57:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 756: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
change_to_randtl_58:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 757: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91d02032  ! 758: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 759: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8551c000  ! 760: RDPR_TL	rdpr	%tl, %r2
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 761: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 762: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902157  ! 763: WRPR_TT_I	wrpr	%r0, 0x0157, %tt
	.word 0x93902004  ! 764: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x99500000  ! 765: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x86d52001  ! 766: UMULcc_I	umulcc 	%r20, 0x0001, %r3
	.word 0xc6ffc038  ! 767: SWAPA_R	swapa	%r3, [%r31 + %r24] 0x01
	.word 0xc6d004a0  ! 768: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	.word 0x91d02032  ! 769: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 770: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982b4f  ! 772: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4f, %hpstate
	.word 0x8d9028d0  ! 773: WRPR_PSTATE_I	wrpr	%r0, 0x08d0, %pstate
	.word 0x81982d86  ! 774: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d86, %hpstate
	.word 0x87902102  ! 775: WRPR_TT_I	wrpr	%r0, 0x0102, %tt
	.word 0x8145c000  ! 776: RD_TICK_CMPR_REG	stbar
	.word 0x80ae8007  ! 777: ANDNcc_R	andncc 	%r26, %r7, %r0
	.word 0x8d902ed8  ! 778: WRPR_PSTATE_I	wrpr	%r0, 0x0ed8, %pstate
	.word 0xa190200c  ! 779: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xb1a409b3  ! 780: FDIVs	fdivs	%f16, %f19, %f24
	.word 0x93902000  ! 781: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_59:
	.word 0x34800001  ! 783: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 782: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xf09fe001  ! 783: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r24
	.word 0x9ba00552  ! 784: FSQRTd	fsqrt	
	.word 0x91d02033  ! 785: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8ac16001  ! 786: ADDCcc_I	addccc 	%r5, 0x0001, %r5
	.word 0x93902003  ! 787: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
reduce_priv_level_60:
	.word 0x8f902002  ! 789: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0197b  ! 788: FqTOd	dis not found

	.word 0x20800001  ! 789: BN	bn,a	<label_0x1>
change_to_randtl_61:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 790: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 792: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 793: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982e45  ! 794: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e45, %hpstate
DS_62:
	.word 0x32800001  ! 796: BNE	bne,a	<label_0x1>
	pdist %f16, %f28, %f30
	.word 0xa1b14312  ! 795: ALLIGNADDRESS	alignaddr	%r5, %r18, %r16
	.word 0x9ad0800d  ! 796: UMULcc_R	umulcc 	%r2, %r13, %r13
	.word 0x8d90244a  ! 797: WRPR_PSTATE_I	wrpr	%r0, 0x044a, %pstate
	.word 0x8790201c  ! 798: WRPR_TT_I	wrpr	%r0, 0x001c, %tt
	.word 0x8790211c  ! 799: WRPR_TT_I	wrpr	%r0, 0x011c, %tt
	.word 0x93d02033  ! 800: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x80d80011  ! 801: SMULcc_R	smulcc 	%r0, %r17, %r0
change_to_tl1_63:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8198271e  ! 803: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071e, %hpstate
	.word 0x81982085  ! 804: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0085, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87902258  ! 806: WRPR_TT_I	wrpr	%r0, 0x0258, %tt
	.word 0x8d802000  ! 807: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02032  ! 808: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200f  ! 809: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 810: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc127c011  ! 811: STF_R	st	%f0, [%r17, %r31]
	.word 0xc0800be0  ! 812: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r0
	.word 0x93a58d30  ! 813: FsMULd	fsmuld	%f22, %f16, %f40
	.word 0xd2880e80  ! 814: LDUBA_R	lduba	[%r0, %r0] 0x74, %r9
	.word 0x87802004  ! 815: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd27fe001  ! 816: SWAP_I	swap	%r9, [%r31 + 0x0001]
DS_64:
	.word 0x20800001  ! 818: BN	bn,a	<label_0x1>
	.word 0xcd36400d  ! 818: STQF_R	-	%f6, [%r13, %r25]
	normalw
	.word 0x85458000  ! 817: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x34800001  ! 818: BG	bg,a	<label_0x1>
	.word 0x93902004  ! 819: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa190200e  ! 820: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa1902005  ! 821: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87902196  ! 822: WRPR_TT_I	wrpr	%r0, 0x0196, %tt
	.word 0x93902002  ! 823: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_65:
	.word 0x22800001  ! 825: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 824: SAVE_R	save	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902003  ! 826: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc497e000  ! 827: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r2
	.word 0x81982446  ! 828: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0446, %hpstate
	.word 0x879021da  ! 829: WRPR_TT_I	wrpr	%r0, 0x01da, %tt
	.word 0x8d9024d5  ! 830: WRPR_PSTATE_I	wrpr	%r0, 0x04d5, %pstate
	.word 0x96a9c005  ! 831: ANDNcc_R	andncc 	%r7, %r5, %r11
DS_66:
	.word 0x20800001  ! 833: BN	bn,a	<label_0x1>
	allclean
	.word 0xb5b5c304  ! 832: ALLIGNADDRESS	alignaddr	%r23, %r4, %r26
	.word 0x95504000  ! 833: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x87a5c9d9  ! 834: FDIVd	fdivd	%f54, %f56, %f34
	.word 0x93d02035  ! 835: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x93902002  ! 836: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87514000  ! 837: RDPR_TBA	rdpr	%tba, %r3
	.word 0x93902007  ! 838: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 840: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902003  ! 841: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8790214b  ! 842: WRPR_TT_I	wrpr	%r0, 0x014b, %tt
	.word 0x8351c000  ! 843: RDPR_TL	rdpr	%tl, %r1
	.word 0x8d902007  ! 844: WRPR_PSTATE_I	wrpr	%r0, 0x0007, %pstate
	.word 0x87802010  ! 845: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc2d7e010  ! 846: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
	.word 0x84c46001  ! 847: ADDCcc_I	addccc 	%r17, 0x0001, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc4d7e020  ! 849: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r2
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 850: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_67:
	.word 0x32800001  ! 852: BNE	bne,a	<label_0x1>
	.word 0xf332800a  ! 852: STQF_R	-	%f25, [%r10, %r10]
	normalw
	.word 0xa1458000  ! 851: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x83d02034  ! 852: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xe09fc020  ! 853: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
	.word 0x8b504000  ! 854: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0xa1902000  ! 855: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 857: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902008  ! 858: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_68:
	.word 0x34800001  ! 860: BG	bg,a	<label_0x1>
	.word 0xdb302001  ! 860: STQF_I	-	%f13, [0x0001, %r0]
	normalw
	.word 0xa1458000  ! 859: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x91d02032  ! 860: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02032  ! 861: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902004  ! 862: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x91d02035  ! 863: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93a489c3  ! 864: FDIVd	fdivd	%f18, %f34, %f40
	.word 0x8d802000  ! 865: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f802001  ! 866: SIR	sir	0x0001
	.word 0xa1902007  ! 867: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x9751c000  ! 868: RDPR_TL	rdpr	%tl, %r11
	.word 0x87902205  ! 869: WRPR_TT_I	wrpr	%r0, 0x0205, %tt
	.word 0x83514000  ! 870: RDPR_TBA	rdpr	%tba, %r1
	.word 0x8d902c4f  ! 871: WRPR_PSTATE_I	wrpr	%r0, 0x0c4f, %pstate
	.word 0xa1902005  ! 872: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa1902005  ! 873: WRPR_GL_I	wrpr	%r0, 0x0005, %-
change_to_tl1_69:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x97a2cd26  ! 875: FsMULd	fsmuld	%f11, %f6, %f42
	.word 0xa4fa8019  ! 876: SDIVcc_R	sdivcc 	%r10, %r25, %r18
	.word 0x93902005  ! 877: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02035  ! 879: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d90264a  ! 880: WRPR_PSTATE_I	wrpr	%r0, 0x064a, %pstate
	.word 0x86f84005  ! 881: SDIVcc_R	sdivcc 	%r1, %r5, %r3
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 882: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 883: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xaf69c005  ! 884: SDIVX_R	sdivx	%r7, %r5, %r23
	.word 0x8ba01a6d  ! 885: FqTOi	fqtoi	
	.word 0xa6856001  ! 886: ADDcc_I	addcc 	%r21, 0x0001, %r19
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 887: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02035  ! 888: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x879021a6  ! 889: WRPR_TT_I	wrpr	%r0, 0x01a6, %tt
	.word 0xa1902001  ! 890: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x91d02031  ! 891: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xe6800c60  ! 892: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r19
	.word 0x95480000  ! 893: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x81460000  ! 894: RD_STICK_REG	stbar
	.word 0x83d02034  ! 895: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xd4ffc02d  ! 896: SWAPA_R	swapa	%r10, [%r31 + %r13] 0x01
	.word 0x87902010  ! 897: WRPR_TT_I	wrpr	%r0, 0x0010, %tt
	.word 0x87802089  ! 898: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa190200d  ! 899: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91d02030  ! 900: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x81a109e7  ! 901: FDIVq	dis not found

	.word 0xab508000  ! 902: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x8d9028d1  ! 903: WRPR_PSTATE_I	wrpr	%r0, 0x08d1, %pstate
DS_70:
	.word 0x32800001  ! 905: BNE	bne,a	<label_0x1>
	.word 0xe731001b  ! 905: STQF_R	-	%f19, [%r27, %r4]
	normalw
	.word 0x87458000  ! 904: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x93902001  ! 905: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902002  ! 906: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902007  ! 907: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902006  ! 908: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9026c5  ! 910: WRPR_PSTATE_I	wrpr	%r0, 0x06c5, %pstate
	.word 0xa1902006  ! 911: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x99a01a78  ! 912: FqTOi	fqtoi	
	.word 0x81982f5f  ! 913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5f, %hpstate
	.word 0xa06a0000  ! 914: UDIVX_R	udivx 	%r8, %r0, %r16
	.word 0xa1902008  ! 915: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa848401a  ! 916: MULX_R	mulx 	%r1, %r26, %r20
	.word 0x8790233d  ! 917: WRPR_TT_I	wrpr	%r0, 0x033d, %tt
	.word 0x8d802000  ! 918: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 919: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02034  ! 920: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902005  ! 921: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8198205e  ! 922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005e, %hpstate
	.word 0xa3a209ca  ! 923: FDIVd	fdivd	%f8, %f10, %f48
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902001  ! 925: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xe33fc00a  ! 926: STDF_R	std	%f17, [%r10, %r31]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902617  ! 928: WRPR_PSTATE_I	wrpr	%r0, 0x0617, %pstate
	.word 0x8198254d  ! 929: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054d, %hpstate
DS_71:
	.word 0x20800001  ! 931: BN	bn,a	<label_0x1>
	.word 0xcd31a001  ! 931: STQF_I	-	%f6, [0x0001, %r6]
	normalw
	.word 0x91458000  ! 930: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x91d02033  ! 931: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8ba1c9e6  ! 932: FDIVq	dis not found

	.word 0x8d698011  ! 933: SDIVX_R	sdivx	%r6, %r17, %r6
DS_72:
	.word 0x20800001  ! 935: BN	bn,a	<label_0x1>
	.word 0xc931c00d  ! 935: STQF_R	-	%f4, [%r13, %r7]
	normalw
	.word 0x85458000  ! 934: RD_SOFTINT_REG	rd	%softint, %r2
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 935: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 936: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_73:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 937: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x8790215b  ! 938: WRPR_TT_I	wrpr	%r0, 0x015b, %tt
	.word 0xa1902000  ! 939: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xc4800ae0  ! 940: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r2
	.word 0x8d902219  ! 941: WRPR_PSTATE_I	wrpr	%r0, 0x0219, %pstate
	.word 0xada04dd9  ! 942: FdMULq	fdmulq	
	.word 0xec8804a0  ! 943: LDUBA_R	lduba	[%r0, %r0] 0x25, %r22
	.word 0xa1902000  ! 944: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x81982554  ! 945: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0554, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 946: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xb151c000  ! 948: RDPR_TL	rdpr	%tl, %r24
	.word 0xa1902002  ! 949: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8790220c  ! 950: WRPR_TT_I	wrpr	%r0, 0x020c, %tt
	.word 0x8b464000  ! 951: RD_STICK_CMPR_REG	rd	%-, %r5
	.word 0x8d9022dc  ! 952: WRPR_PSTATE_I	wrpr	%r0, 0x02dc, %pstate
	.word 0xb0ac4013  ! 953: ANDNcc_R	andncc 	%r17, %r19, %r24
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 954: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xaaad4011  ! 955: ANDNcc_R	andncc 	%r21, %r17, %r21
	.word 0x8b504000  ! 956: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x8198238f  ! 957: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038f, %hpstate
	.word 0x81982b5e  ! 958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5e, %hpstate
	.word 0x8d9026c2  ! 959: WRPR_PSTATE_I	wrpr	%r0, 0x06c2, %pstate
DS_74:
	.word 0x22800001  ! 961: BE	be,a	<label_0x1>
	.word 0xcf32e001  ! 961: STQF_I	-	%f7, [0x0001, %r11]
	normalw
	.word 0xab458000  ! 960: RD_SOFTINT_REG	rd	%softint, %r21
change_to_randtl_75:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 961: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x28700001  ! 962: BPLEU	<illegal instruction>
	.word 0x91d02030  ! 963: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x81982cc4  ! 964: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc4, %hpstate
	.word 0x93d02034  ! 965: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x93902003  ! 966: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902e99  ! 967: WRPR_PSTATE_I	wrpr	%r0, 0x0e99, %pstate
DS_76:
	.word 0x22800001  ! 969: BE	be,a	<label_0x1>
	pdist %f24, %f8, %f12
	.word 0x8db4c304  ! 968: ALLIGNADDRESS	alignaddr	%r19, %r4, %r6
	.word 0x93902006  ! 969: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8edc800a  ! 970: SMULcc_R	smulcc 	%r18, %r10, %r7
	.word 0x91d02033  ! 971: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x38700001  ! 972: BPGU	<illegal instruction>
	.word 0xa190200d  ! 973: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x83d02030  ! 974: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x8d802004  ! 975: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 976: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_77:
	.word 0x22800001  ! 978: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 977: SAVE_R	save	%r31, %r0, %r31
	.word 0xcebfe001  ! 978: STDA_I	stda	%r7, [%r31 + 0x0001] %asi
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 979: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x86c36001  ! 980: ADDCcc_I	addccc 	%r13, 0x0001, %r3
	.word 0x879020f0  ! 981: WRPR_TT_I	wrpr	%r0, 0x00f0, %tt
	.word 0x8b540000  ! 982: RDPR_GL	rdpr	%-, %r5
	.word 0xb1a01a64  ! 983: FqTOi	fqtoi	
	.word 0x89a00552  ! 984: FSQRTd	fsqrt	
	.word 0x8d902846  ! 985: WRPR_PSTATE_I	wrpr	%r0, 0x0846, %pstate
	.word 0x87802010  ! 986: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xc81fc000  ! 987: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0x8198284e  ! 988: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084e, %hpstate
	.word 0xa190200d  ! 989: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8790238d  ! 990: WRPR_TT_I	wrpr	%r0, 0x038d, %tt
	.word 0x36700001  ! 991: BPGE	<illegal instruction>
	.word 0x8d90249e  ! 992: WRPR_PSTATE_I	wrpr	%r0, 0x049e, %pstate
	.word 0xa1902006  ! 993: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x879020b0  ! 994: WRPR_TT_I	wrpr	%r0, 0x00b0, %tt
	.word 0x8d902c98  ! 995: WRPR_PSTATE_I	wrpr	%r0, 0x0c98, %pstate
	.word 0xa1902004  ! 996: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xc917c000  ! 997: LDQF_R	-	[%r31, %r0], %f4
	.word 0x8790231c  ! 998: WRPR_TT_I	wrpr	%r0, 0x031c, %tt
	.word 0x93902004  ! 999: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902009  ! 1000: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x81982a54  ! 1001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a54, %hpstate
	.word 0xa190200b  ! 1002: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x866a8009  ! 1003: UDIVX_R	udivx 	%r10, %r9, %r3
	.word 0x87802004  ! 1004: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x3c800001  ! 1005: BPOS	bpos,a	<label_0x1>
	.word 0x8d902840  ! 1006: WRPR_PSTATE_I	wrpr	%r0, 0x0840, %pstate
	.word 0x9f802001  ! 1007: SIR	sir	0x0001
	.word 0x87902046  ! 1008: WRPR_TT_I	wrpr	%r0, 0x0046, %tt
	.word 0x93902004  ! 1009: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1010: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c9f  ! 1011: WRPR_PSTATE_I	wrpr	%r0, 0x0c9f, %pstate
	.word 0x91d02032  ! 1012: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902ed0  ! 1013: WRPR_PSTATE_I	wrpr	%r0, 0x0ed0, %pstate
	.word 0x8d902e04  ! 1014: WRPR_PSTATE_I	wrpr	%r0, 0x0e04, %pstate
	.word 0x9f802001  ! 1015: SIR	sir	0x0001
	.word 0x91d02033  ! 1016: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa190200f  ! 1017: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8198285c  ! 1018: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085c, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1019: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81a049ca  ! 1020: FDIVd	fdivd	%f32, %f10, %f0
	.word 0x3e700001  ! 1021: BPVC	<illegal instruction>
	.word 0x879023d3  ! 1022: WRPR_TT_I	wrpr	%r0, 0x03d3, %tt
	.word 0x9f802001  ! 1023: SIR	sir	0x0001
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1024: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1025: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902001  ! 1026: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xa1902006  ! 1027: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x91d02033  ! 1028: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902e9e  ! 1029: WRPR_PSTATE_I	wrpr	%r0, 0x0e9e, %pstate
	.word 0x9b508000  ! 1030: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0xa84e8001  ! 1031: MULX_R	mulx 	%r26, %r1, %r20
	.word 0x87508000  ! 1032: RDPR_TSTATE	rdpr	%tstate, %r3
DS_78:
	.word 0x32800001  ! 1034: BNE	bne,a	<label_0x1>
	allclean
	.word 0xadb54309  ! 1033: ALLIGNADDRESS	alignaddr	%r21, %r9, %r22
	.word 0x879023d5  ! 1034: WRPR_TT_I	wrpr	%r0, 0x03d5, %tt
	.word 0x819822dd  ! 1035: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02dd, %hpstate
	.word 0xecd7e030  ! 1036: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r22
	.word 0x9f802001  ! 1037: SIR	sir	0x0001
	.word 0x93902005  ! 1038: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x879020bd  ! 1039: WRPR_TT_I	wrpr	%r0, 0x00bd, %tt
	.word 0xecd004a0  ! 1040: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r22
	.word 0x8d902690  ! 1041: WRPR_PSTATE_I	wrpr	%r0, 0x0690, %pstate
	.word 0x87802089  ! 1042: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xed37e001  ! 1043: STQF_I	-	%f22, [0x0001, %r31]
	.word 0x8d504000  ! 1044: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0xa1902006  ! 1045: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d902e9c  ! 1046: WRPR_PSTATE_I	wrpr	%r0, 0x0e9c, %pstate
	.word 0xa190200f  ! 1047: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xb0c06001  ! 1048: ADDCcc_I	addccc 	%r1, 0x0001, %r24
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1049: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91514000  ! 1050: RDPR_TBA	rdpr	%tba, %r8
	.word 0x8d802000  ! 1051: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9024c2  ! 1052: WRPR_PSTATE_I	wrpr	%r0, 0x04c2, %pstate
	.word 0x819826cc  ! 1053: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cc, %hpstate
	.word 0x93d02035  ! 1054: Tcc_I	tne	icc_or_xcc, %r0 + 53
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1055: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd0ffc029  ! 1056: SWAPA_R	swapa	%r8, [%r31 + %r9] 0x01
	.word 0x9145c000  ! 1057: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x8d902806  ! 1058: WRPR_PSTATE_I	wrpr	%r0, 0x0806, %pstate
DS_79:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1059: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
change_to_tl1_80:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xaf464000  ! 1061: RD_STICK_CMPR_REG	rd	%-, %r23
change_to_randtl_81:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1062: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8d902e48  ! 1063: WRPR_PSTATE_I	wrpr	%r0, 0x0e48, %pstate
	.word 0xeed804a0  ! 1064: LDXA_R	ldxa	[%r0, %r0] 0x25, %r23
	.word 0xeecfe030  ! 1065: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r23
	.word 0x8790214a  ! 1066: WRPR_TT_I	wrpr	%r0, 0x014a, %tt
	.word 0x8f514000  ! 1067: RDPR_TBA	rdpr	%tba, %r7
	.word 0x8751c000  ! 1068: RDPR_TL	rdpr	%tl, %r3
	.word 0x8d802000  ! 1069: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902007  ! 1070: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1071: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c04  ! 1072: WRPR_PSTATE_I	wrpr	%r0, 0x0c04, %pstate
	.word 0x91d02032  ! 1073: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc68008a0  ! 1074: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x93902007  ! 1075: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1076: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c5f  ! 1077: WRPR_PSTATE_I	wrpr	%r0, 0x0c5f, %pstate
	.word 0xa7a649a0  ! 1078: FDIVs	fdivs	%f25, %f0, %f19
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1079: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 1080: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902000  ! 1081: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x81982b0d  ! 1082: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0d, %hpstate
	.word 0xe67fe001  ! 1083: SWAP_I	swap	%r19, [%r31 + 0x0001]
	.word 0x93902001  ! 1084: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d9024ce  ! 1085: WRPR_PSTATE_I	wrpr	%r0, 0x04ce, %pstate
	.word 0x99a01a63  ! 1086: FqTOi	fqtoi	
	.word 0x3a800001  ! 1087: BCC	bcc,a	<label_0x1>
	.word 0x8d902090  ! 1088: WRPR_PSTATE_I	wrpr	%r0, 0x0090, %pstate
	.word 0x8d902403  ! 1089: WRPR_PSTATE_I	wrpr	%r0, 0x0403, %pstate
	.word 0xa6d12001  ! 1090: UMULcc_I	umulcc 	%r4, 0x0001, %r19
	.word 0x879021e8  ! 1091: WRPR_TT_I	wrpr	%r0, 0x01e8, %tt
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1092: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1093: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe68fe030  ! 1094: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r19
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1095: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9b494000  ! 1096: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0xa190200b  ! 1097: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xdbe7c023  ! 1098: CASA_I	casa	[%r31] 0x 1, %r3, %r13
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8198294f  ! 1100: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094f, %hpstate
	.word 0x20700001  ! 1101: BPN	<illegal instruction>
reduce_priv_level_82:
	.word 0x8f902000  ! 1103: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb7696001  ! 1102: SDIVX_I	sdivx	%r5, 0x0001, %r27
	.word 0x8d9022d7  ! 1103: WRPR_PSTATE_I	wrpr	%r0, 0x02d7, %pstate
	.word 0xa190200c  ! 1104: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x91d02031  ! 1105: Tcc_I	ta	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_TO_TL0	! macro
DS_83:
	.word 0x22800001  ! 1108: BE	be,a	<label_0x1>
	pdist %f16, %f16, %f4
	.word 0xb7b3031b  ! 1107: ALLIGNADDRESS	alignaddr	%r12, %r27, %r27
	.word 0xb5514000  ! 1108: RDPR_TBA	rdpr	%tba, %r26
	.word 0xb0c2e001  ! 1109: ADDCcc_I	addccc 	%r11, 0x0001, %r24
	.word 0x8d902803  ! 1110: WRPR_PSTATE_I	wrpr	%r0, 0x0803, %pstate
DS_84:
	.word 0x32800001  ! 1112: BNE	bne,a	<label_0x1>
	.word 0xc1346001  ! 1112: STQF_I	-	%f0, [0x0001, %r17]
	normalw
	.word 0xad458000  ! 1111: RD_SOFTINT_REG	rd	%softint, %r22
	.word 0xa9a00542  ! 1112: FSQRTd	fsqrt	
	.word 0x82f9c002  ! 1113: SDIVcc_R	sdivcc 	%r7, %r2, %r1
	.word 0x93902001  ! 1114: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xb1a000da  ! 1115: FNEGd	fnegd	%f26, %f24
	.word 0x8da20d21  ! 1116: FsMULd	fsmuld	%f8, %f32, %f6
DS_85:
	.word 0x20800001  ! 1118: BN	bn,a	<label_0x1>
	.word 0xc934000b  ! 1118: STQF_R	-	%f4, [%r11, %r16]
	normalw
	.word 0xa7458000  ! 1117: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x86d14001  ! 1118: UMULcc_R	umulcc 	%r5, %r1, %r3
	.word 0x8d902e97  ! 1119: WRPR_PSTATE_I	wrpr	%r0, 0x0e97, %pstate
change_to_randtl_86:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1120: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_PRIV	! macro
	.word 0x87a01a6d  ! 1122: FqTOi	fqtoi	
	.word 0xa190200a  ! 1123: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x81982edc  ! 1124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edc, %hpstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1125: Tcc_R	ta	icc_or_xcc, %r0 + %r30
reduce_priv_level_87:
	.word 0x8f902001  ! 1127: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8980c016  ! 1126: WRTICK_R	wr	%r3, %r22, %tick
change_to_randtl_88:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1127: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902001  ! 1128: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x83d02035  ! 1129: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x879020b5  ! 1130: WRPR_TT_I	wrpr	%r0, 0x00b5, %tt
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1131: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1132: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x94aac001  ! 1133: ANDNcc_R	andncc 	%r11, %r1, %r10
reduce_priv_level_89:
	.word 0x8f902002  ! 1135: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 1134: SIAM	siam	1
	.word 0x8d802000  ! 1135: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1136: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9028c0  ! 1138: WRPR_PSTATE_I	wrpr	%r0, 0x08c0, %pstate
	.word 0x8d9020d8  ! 1139: WRPR_PSTATE_I	wrpr	%r0, 0x00d8, %pstate
	.word 0xb5514000  ! 1140: RDPR_TBA	rdpr	%tba, %r26
	.word 0xafa00546  ! 1141: FSQRTd	fsqrt	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982946  ! 1143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0946, %hpstate
	.word 0x93902007  ! 1144: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81982cde  ! 1145: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cde, %hpstate
DS_90:
	.word 0x32800001  ! 1147: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1146: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1147: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9869c00b  ! 1148: UDIVX_R	udivx 	%r7, %r11, %r12
	.word 0x9f802001  ! 1149: SIR	sir	0x0001
	.word 0x8d902044  ! 1150: WRPR_PSTATE_I	wrpr	%r0, 0x0044, %pstate
	.word 0x92d5c01b  ! 1151: UMULcc_R	umulcc 	%r23, %r27, %r9
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83514000  ! 1153: RDPR_TBA	rdpr	%tba, %r1
	.word 0x93902000  ! 1154: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa190200c  ! 1155: WRPR_GL_I	wrpr	%r0, 0x000c, %-
DS_91:
	.word 0x34800001  ! 1157: BG	bg,a	<label_0x1>
	pdist %f30, %f24, %f8
	.word 0x89b58305  ! 1156: ALLIGNADDRESS	alignaddr	%r22, %r5, %r4
	.word 0x91d02031  ! 1157: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x879023db  ! 1158: WRPR_TT_I	wrpr	%r0, 0x03db, %tt
	.word 0x93902000  ! 1159: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93d02031  ! 1160: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x81982f0d  ! 1161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0d, %hpstate
	.word 0x8d9022dc  ! 1162: WRPR_PSTATE_I	wrpr	%r0, 0x02dc, %pstate
	.word 0xc89fe001  ! 1163: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1164: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8b702001  ! 1165: POPC_I	popc	0x0001, %r5
	.word 0x8cd6e001  ! 1166: UMULcc_I	umulcc 	%r27, 0x0001, %r6
	.word 0x8d902203  ! 1167: WRPR_PSTATE_I	wrpr	%r0, 0x0203, %pstate
	.word 0x91d02034  ! 1168: Tcc_I	ta	icc_or_xcc, %r0 + 52
reduce_priv_level_92:
	.word 0x8f902001  ! 1170: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01972  ! 1169: FqTOd	dis not found

	.word 0xa2834005  ! 1170: ADDcc_R	addcc 	%r13, %r5, %r17
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1171: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x819822c4  ! 1172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c4, %hpstate
	.word 0x98d6e001  ! 1173: UMULcc_I	umulcc 	%r27, 0x0001, %r12
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1174: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 1175: WRPR_GL_I	wrpr	%r0, 0x000c, %-
DS_93:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1176: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_94:
	.word 0x32800001  ! 1178: BNE	bne,a	<label_0x1>
	pdist %f6, %f8, %f4
	.word 0xb3b3430c  ! 1177: ALLIGNADDRESS	alignaddr	%r13, %r12, %r25
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1178: Tcc_R	tne	icc_or_xcc, %r0 + %r30
reduce_priv_level_95:
	.word 0x8f902002  ! 1180: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x97a01975  ! 1179: FqTOd	dis not found

	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1180: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93514000  ! 1181: RDPR_TBA	rdpr	%tba, %r9
	.word 0x91d02035  ! 1182: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xb46b4014  ! 1183: UDIVX_R	udivx 	%r13, %r20, %r26
	.word 0xf517c000  ! 1184: LDQF_R	-	[%r31, %r0], %f26
	.word 0x8ba049c0  ! 1185: FDIVd	fdivd	%f32, %f0, %f36
	.word 0x8d90261c  ! 1186: WRPR_PSTATE_I	wrpr	%r0, 0x061c, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1187: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902086  ! 1188: WRPR_TT_I	wrpr	%r0, 0x0086, %tt
	.word 0x8ba149e8  ! 1189: FDIVq	dis not found

	.word 0x8d902edc  ! 1190: WRPR_PSTATE_I	wrpr	%r0, 0x0edc, %pstate
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1191: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83a01a6a  ! 1192: FqTOi	fqtoi	
	.word 0x93902004  ! 1193: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9f802001  ! 1194: SIR	sir	0x0001
	.word 0x87902033  ! 1195: WRPR_TT_I	wrpr	%r0, 0x0033, %tt
	.word 0x8d802000  ! 1196: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_96:
	.word 0x20800001  ! 1198: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1197: SAVE_R	save	%r31, %r0, %r31
	.word 0x81a000d8  ! 1198: FNEGd	fnegd	%f24, %f0
DS_97:
	.word 0x20800001  ! 1200: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1199: SAVE_R	save	%r31, %r0, %r31
	.word 0xc01fe001  ! 1200: LDD_I	ldd	[%r31 + 0x0001], %r0
	.word 0x93d02034  ! 1201: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x81982ac7  ! 1202: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac7, %hpstate
	.word 0x81982294  ! 1203: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0294, %hpstate
	.word 0x82f8a001  ! 1204: SDIVcc_I	sdivcc 	%r2, 0x0001, %r1
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1205: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc21fc000  ! 1206: LDD_R	ldd	[%r31 + %r0], %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200a  ! 1208: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d902202  ! 1209: WRPR_PSTATE_I	wrpr	%r0, 0x0202, %pstate
	.word 0xa7494000  ! 1210: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0x81982547  ! 1211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0547, %hpstate
DS_98:
	.word 0x22800001  ! 1213: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1212: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802000  ! 1213: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902c43  ! 1214: WRPR_PSTATE_I	wrpr	%r0, 0x0c43, %pstate
DS_99:
	.word 0x20800001  ! 1216: BN	bn,a	<label_0x1>
	allclean
	.word 0x89b34305  ! 1215: ALLIGNADDRESS	alignaddr	%r13, %r5, %r4
	.word 0x85b4cfe4  ! 1216: FONES	fones	%f2
	ta	T_CHANGE_PRIV	! macro
	.word 0x93d02034  ! 1218: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xc4dfe030  ! 1219: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r2
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x819824df  ! 1221: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04df, %hpstate
DS_100:
	.word 0x34800001  ! 1223: BG	bg,a	<label_0x1>
	pdist %f8, %f26, %f6
	.word 0xabb64301  ! 1222: ALLIGNADDRESS	alignaddr	%r25, %r1, %r21
	.word 0x8790200c  ! 1223: WRPR_TT_I	wrpr	%r0, 0x000c, %tt
	.word 0xa1702001  ! 1224: POPC_I	popc	0x0001, %r16
change_to_randtl_101:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1225: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
DS_102:
	.word 0x22800001  ! 1227: BE	be,a	<label_0x1>
	illtrap
	.word 0xe710800c  ! 1227: LDQF_R	-	[%r2, %r12], %f19
	.word 0xaba1483a  ! 1226: FADDs	fadds	%f5, %f26, %f21
	.word 0xa751c000  ! 1227: RDPR_TL	rdpr	%tl, %r19
	.word 0x83a00557  ! 1228: FSQRTd	fsqrt	
	.word 0x9b702001  ! 1229: POPC_I	popc	0x0001, %r13
	.word 0x2c700001  ! 1230: BPNEG	<illegal instruction>
	.word 0xb4480001  ! 1231: MULX_R	mulx 	%r0, %r1, %r26
	.word 0x819826cf  ! 1232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cf, %hpstate
	.word 0x879022f7  ! 1233: WRPR_TT_I	wrpr	%r0, 0x02f7, %tt
DS_103:
	.word 0x22800001  ! 1235: BE	be,a	<label_0x1>
	.word 0xc935c00b  ! 1235: STQF_R	-	%f4, [%r11, %r23]
	normalw
	.word 0xb3458000  ! 1234: RD_SOFTINT_REG	rd	%softint, %r25
	.word 0x8790209d  ! 1235: WRPR_TT_I	wrpr	%r0, 0x009d, %tt
	.word 0x81982214  ! 1236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0214, %hpstate
	.word 0x81982b0f  ! 1237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0f, %hpstate
	.word 0x81480000  ! 1238: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0xc09fc020  ! 1239: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0xa1902000  ! 1240: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x879021e5  ! 1241: WRPR_TT_I	wrpr	%r0, 0x01e5, %tt
	.word 0x8d902253  ! 1242: WRPR_PSTATE_I	wrpr	%r0, 0x0253, %pstate
	.word 0x93902006  ! 1243: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f802001  ! 1244: SIR	sir	0x0001
	.word 0x879020ec  ! 1245: WRPR_TT_I	wrpr	%r0, 0x00ec, %tt
	.word 0x8fa0056c  ! 1246: FSQRTq	fsqrt	
	.word 0x38700001  ! 1247: BPGU	<illegal instruction>
	.word 0x3e700001  ! 1248: BPVC	<illegal instruction>
	.word 0xce8008a0  ! 1249: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
change_to_randtl_104:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1250: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902000  ! 1251: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02030  ! 1252: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902000  ! 1253: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x879020cc  ! 1254: WRPR_TT_I	wrpr	%r0, 0x00cc, %tt
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1255: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902641  ! 1256: WRPR_PSTATE_I	wrpr	%r0, 0x0641, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1257: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_105:
	.word 0x32800001  ! 1259: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 1259: BE	be,a	<label_0x1>
	.word 0x89a00553  ! 1259: FSQRTd	fsqrt	
	.word 0xb5a2082b  ! 1258: FADDs	fadds	%f8, %f11, %f26
	.word 0x88d9c006  ! 1259: SMULcc_R	smulcc 	%r7, %r6, %r4
	.word 0x87902263  ! 1260: WRPR_TT_I	wrpr	%r0, 0x0263, %tt
	.word 0x93902003  ! 1261: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x879022ad  ! 1262: WRPR_TT_I	wrpr	%r0, 0x02ad, %tt
	.word 0x82684010  ! 1263: UDIVX_R	udivx 	%r1, %r16, %r1
	.word 0xa1902005  ! 1264: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87494000  ! 1265: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0xc69fe001  ! 1266: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r3
	.word 0xa1902002  ! 1267: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xc67fe001  ! 1268: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x93902005  ! 1269: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_106:
	.word 0x22800001  ! 1271: BE	be,a	<label_0x1>
	illtrap
	.word 0xc5108002  ! 1271: LDQF_R	-	[%r2, %r2], %f2
	.word 0x8da24821  ! 1270: FADDs	fadds	%f9, %f1, %f6
DS_107:
	.word 0x34800001  ! 1272: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1271: SAVE_R	save	%r31, %r0, %r31
	.word 0x91a049cb  ! 1272: FDIVd	fdivd	%f32, %f42, %f8
	.word 0x81982854  ! 1273: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0854, %hpstate
	.word 0x93902005  ! 1274: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d02034  ! 1275: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xb3a00570  ! 1276: FSQRTq	fsqrt	
	.word 0x8d90249d  ! 1277: WRPR_PSTATE_I	wrpr	%r0, 0x049d, %pstate
	.word 0x93d02031  ! 1278: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8d902c9f  ! 1279: WRPR_PSTATE_I	wrpr	%r0, 0x0c9f, %pstate
	.word 0xf257c000  ! 1280: LDSH_R	ldsh	[%r31 + %r0], %r25
	.word 0x8d902c13  ! 1281: WRPR_PSTATE_I	wrpr	%r0, 0x0c13, %pstate
	.word 0x8790200c  ! 1282: WRPR_TT_I	wrpr	%r0, 0x000c, %tt
	.word 0x8790235f  ! 1283: WRPR_TT_I	wrpr	%r0, 0x035f, %tt
	.word 0xa1902001  ! 1284: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8950c000  ! 1285: RDPR_TT	rdpr	%tt, %r4
	.word 0xa190200f  ! 1286: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xc85fe001  ! 1287: LDX_I	ldx	[%r31 + 0x0001], %r4
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1288: Tcc_R	tne	icc_or_xcc, %r0 + %r30
reduce_priv_level_108:
	.word 0x8f902000  ! 1290: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x85a01963  ! 1289: FqTOd	dis not found

	.word 0xa1902002  ! 1290: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d802000  ! 1291: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902005  ! 1292: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902a0f  ! 1293: WRPR_PSTATE_I	wrpr	%r0, 0x0a0f, %pstate
	.word 0x8d802004  ! 1294: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902005  ! 1295: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902001  ! 1296: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xc5e7c023  ! 1297: CASA_I	casa	[%r31] 0x 1, %r3, %r2
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1298: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_109:
	.word 0x34800001  ! 1300: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 1300: BE	be,a	<label_0x1>
	.word 0x89a00553  ! 1300: FSQRTd	fsqrt	
	.word 0xaba18832  ! 1299: FADDs	fadds	%f6, %f18, %f21
	.word 0x8d902c46  ! 1300: WRPR_PSTATE_I	wrpr	%r0, 0x0c46, %pstate
	.word 0xea8008a0  ! 1301: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0x8d90241d  ! 1302: WRPR_PSTATE_I	wrpr	%r0, 0x041d, %pstate
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1304: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8cfa0002  ! 1305: SDIVcc_R	sdivcc 	%r8, %r2, %r6
	.word 0x87902250  ! 1306: WRPR_TT_I	wrpr	%r0, 0x0250, %tt
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1307: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x89508000  ! 1308: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0x93b20fe6  ! 1309: FONES	fones	%f9
	.word 0x81982185  ! 1310: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0185, %hpstate
	.word 0x8d902c55  ! 1311: WRPR_PSTATE_I	wrpr	%r0, 0x0c55, %pstate
	.word 0x93902005  ! 1312: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8ba00541  ! 1313: FSQRTd	fsqrt	
	.word 0x83d02032  ! 1314: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x89500000  ! 1315: RDPR_TPC	rdpr	%tpc, %r4
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8198274d  ! 1318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074d, %hpstate
	.word 0x81a14d27  ! 1319: FsMULd	fsmuld	%f5, %f38, %f0
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1320: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2c800001  ! 1321: BNEG	bneg,a	<label_0x1>
	.word 0x93902000  ! 1322: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f464000  ! 1324: RD_STICK_CMPR_REG	rd	%-, %r7
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1325: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce9fc020  ! 1326: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
DS_110:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1327: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 1329: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8790228a  ! 1330: WRPR_TT_I	wrpr	%r0, 0x028a, %tt
	.word 0x97a289e8  ! 1331: FDIVq	dis not found

	.word 0xa46b6001  ! 1332: UDIVX_I	udivx 	%r13, 0x0001, %r18
	.word 0x93902005  ! 1333: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902cd7  ! 1334: WRPR_PSTATE_I	wrpr	%r0, 0x0cd7, %pstate
	.word 0xb6faa001  ! 1335: SDIVcc_I	sdivcc 	%r10, 0x0001, %r27
	.word 0x91d02035  ! 1336: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902000  ! 1337: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902619  ! 1338: WRPR_PSTATE_I	wrpr	%r0, 0x0619, %pstate
	.word 0x91d02030  ! 1339: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_PRIV	! macro
	.word 0xf65fc000  ! 1341: LDX_R	ldx	[%r31 + %r0], %r27
	.word 0x85508000  ! 1342: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0xa190200b  ! 1343: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93d02033  ! 1344: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa1494000  ! 1345: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0x93a00546  ! 1346: FSQRTd	fsqrt	
	.word 0x8790228e  ! 1347: WRPR_TT_I	wrpr	%r0, 0x028e, %tt
	.word 0xa1902009  ! 1348: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa345c000  ! 1349: RD_TICK_CMPR_REG	rd	%-, %r17
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1350: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe2800bc0  ! 1351: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r17
change_to_tl1_111:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9f802001  ! 1353: SIR	sir	0x0001
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83540000  ! 1355: RDPR_GL	rdpr	%-, %r1
	.word 0x8d902091  ! 1356: WRPR_PSTATE_I	wrpr	%r0, 0x0091, %pstate
DS_112:
	.word 0x22800001  ! 1358: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1357: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x83d02032  ! 1358: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x83d02033  ! 1359: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x81982d94  ! 1360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d94, %hpstate
	.word 0x81982246  ! 1361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0246, %hpstate
	.word 0x879023b9  ! 1362: WRPR_TT_I	wrpr	%r0, 0x03b9, %tt
	.word 0x8198209c  ! 1363: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009c, %hpstate
	.word 0x9ba5cdca  ! 1364: FdMULq	fdmulq	
DS_113:
	.word 0x22800001  ! 1366: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1366: BE	be,a	<label_0x1>
	.word 0xdb120004  ! 1366: LDQF_R	-	[%r8, %r4], %f13
	.word 0x83a08824  ! 1365: FADDs	fadds	%f2, %f4, %f1
	.word 0x8790202c  ! 1366: WRPR_TT_I	wrpr	%r0, 0x002c, %tt
	.word 0x93902005  ! 1367: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982b47  ! 1368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b47, %hpstate
	.word 0xc2ffc024  ! 1369: SWAPA_R	swapa	%r1, [%r31 + %r4] 0x01
	.word 0xc2c004a0  ! 1370: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0x879023e3  ! 1371: WRPR_TT_I	wrpr	%r0, 0x03e3, %tt
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1372: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x904a4014  ! 1373: MULX_R	mulx 	%r9, %r20, %r8
	.word 0x8d902e8a  ! 1374: WRPR_PSTATE_I	wrpr	%r0, 0x0e8a, %pstate
	.word 0x87902189  ! 1375: WRPR_TT_I	wrpr	%r0, 0x0189, %tt
	.word 0x8d9028cb  ! 1376: WRPR_PSTATE_I	wrpr	%r0, 0x08cb, %pstate
	.word 0xb286a001  ! 1377: ADDcc_I	addcc 	%r26, 0x0001, %r25
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902004  ! 1379: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x83d02032  ! 1380: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d902c91  ! 1381: WRPR_PSTATE_I	wrpr	%r0, 0x0c91, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1382: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 1383: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa190200a  ! 1384: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8198294c  ! 1385: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094c, %hpstate
	.word 0xa190200d  ! 1386: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d802004  ! 1387: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xf2c7e030  ! 1388: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r25
	.word 0x91d02033  ! 1389: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81982c94  ! 1390: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c94, %hpstate
	.word 0xa745c000  ! 1391: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0x38700001  ! 1392: BPGU	<illegal instruction>
	.word 0xe64fc000  ! 1393: LDSB_R	ldsb	[%r31 + %r0], %r19
	.word 0x8d90285b  ! 1394: WRPR_PSTATE_I	wrpr	%r0, 0x085b, %pstate
	.word 0xaa80400c  ! 1395: ADDcc_R	addcc 	%r1, %r12, %r21
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1396: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902256  ! 1397: WRPR_PSTATE_I	wrpr	%r0, 0x0256, %pstate
DS_114:
	.word 0x34800001  ! 1399: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1398: SAVE_R	save	%r31, %r0, %r31
	.word 0x8ad1a001  ! 1399: UMULcc_I	umulcc 	%r6, 0x0001, %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa4fa6001  ! 1401: SDIVcc_I	sdivcc 	%r9, 0x0001, %r18
	.word 0x87902132  ! 1402: WRPR_TT_I	wrpr	%r0, 0x0132, %tt
	.word 0x91d02035  ! 1403: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xb3494000  ! 1404: RDHPR_HTBA	rdhpr	%htba, %r25
	ta	T_CHANGE_PRIV	! macro
reduce_priv_level_115:
	.word 0x8f902001  ! 1407: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89854014  ! 1406: WRTICK_R	wr	%r21, %r20, %tick
	.word 0x93d02030  ! 1407: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x819825de  ! 1408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05de, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1409: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91680000  ! 1410: SDIVX_R	sdivx	%r0, %r0, %r8
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1411: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97702001  ! 1412: POPC_I	popc	0x0001, %r11
	.word 0x8198209e  ! 1413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009e, %hpstate
	.word 0x84db000d  ! 1414: SMULcc_R	smulcc 	%r12, %r13, %r2
	.word 0xc4800bc0  ! 1415: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r2
	.word 0x8790210d  ! 1416: WRPR_TT_I	wrpr	%r0, 0x010d, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879022b6  ! 1418: WRPR_TT_I	wrpr	%r0, 0x02b6, %tt
	.word 0x9b6e800a  ! 1419: SDIVX_R	sdivx	%r26, %r10, %r13
change_to_randtl_116:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1420: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x81a0c9d3  ! 1421: FDIVd	fdivd	%f34, %f50, %f0
DS_117:
	.word 0x20800001  ! 1423: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1422: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc08008a0  ! 1423: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x87a509d0  ! 1424: FDIVd	fdivd	%f20, %f16, %f34
	.word 0xa1902000  ! 1425: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x97504000  ! 1426: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0x8d902493  ! 1427: WRPR_PSTATE_I	wrpr	%r0, 0x0493, %pstate
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1428: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87a000c9  ! 1429: FNEGd	fnegd	%f40, %f34
	.word 0x8d802000  ! 1430: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879021b1  ! 1431: WRPR_TT_I	wrpr	%r0, 0x01b1, %tt
	.word 0xb4ad8019  ! 1432: ANDNcc_R	andncc 	%r22, %r25, %r26
	.word 0xf417c000  ! 1433: LDUH_R	lduh	[%r31 + %r0], %r26
	.word 0x89540000  ! 1434: RDPR_GL	rdpr	%-, %r4
	.word 0x8198261d  ! 1435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061d, %hpstate
	.word 0xc8d004a0  ! 1436: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0xa8f8a001  ! 1437: SDIVcc_I	sdivcc 	%r2, 0x0001, %r20
	.word 0xe88008a0  ! 1438: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x8d902cdc  ! 1439: WRPR_PSTATE_I	wrpr	%r0, 0x0cdc, %pstate
	.word 0xa9540000  ! 1440: RDPR_GL	rdpr	%-, %r20
	.word 0x90ab400c  ! 1441: ANDNcc_R	andncc 	%r13, %r12, %r8
	.word 0x9b702001  ! 1442: POPC_I	popc	0x0001, %r13
	.word 0x91d02031  ! 1443: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902006  ! 1444: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902816  ! 1445: WRPR_PSTATE_I	wrpr	%r0, 0x0816, %pstate
	.word 0x879021bb  ! 1446: WRPR_TT_I	wrpr	%r0, 0x01bb, %tt
DS_118:
	.word 0x22800001  ! 1448: BE	be,a	<label_0x1>
	illtrap
	.word 0xdb16400c  ! 1448: LDQF_R	-	[%r25, %r12], %f13
	.word 0xada3482d  ! 1447: FADDs	fadds	%f13, %f13, %f22
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1448: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902004  ! 1450: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81494000  ! 1451: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0x93902007  ! 1452: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc0ffc02d  ! 1453: SWAPA_R	swapa	%r0, [%r31 + %r13] 0x01
	.word 0x81982fc4  ! 1454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc4, %hpstate
	.word 0x8d902641  ! 1455: WRPR_PSTATE_I	wrpr	%r0, 0x0641, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1456: Tcc_R	ta	icc_or_xcc, %r0 + %r30
reduce_priv_level_119:
	.word 0x8f902002  ! 1458: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87a01969  ! 1457: FqTOd	dis not found

	.word 0xc727e001  ! 1458: STF_I	st	%f3, [0x0001, %r31]
	.word 0xa3a01a71  ! 1459: FqTOi	fqtoi	
reduce_priv_level_120:
	.word 0x8f902000  ! 1461: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 1460: SIAM	siam	1
	.word 0xa8686001  ! 1461: UDIVX_I	udivx 	%r1, 0x0001, %r20
	.word 0x93d02034  ! 1462: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x9ac52001  ! 1463: ADDCcc_I	addccc 	%r20, 0x0001, %r13
	.word 0x87802004  ! 1464: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93d02030  ! 1465: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x83504000  ! 1466: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x8d802000  ! 1467: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902005  ! 1468: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d802004  ! 1469: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902416  ! 1470: WRPR_PSTATE_I	wrpr	%r0, 0x0416, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1471: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902164  ! 1472: WRPR_TT_I	wrpr	%r0, 0x0164, %tt
	.word 0x86866001  ! 1473: ADDcc_I	addcc 	%r25, 0x0001, %r3
	.word 0xb4800007  ! 1474: ADDcc_R	addcc 	%r0, %r7, %r26
	.word 0x93902003  ! 1475: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xb151c000  ! 1476: RDPR_TL	rdpr	%tl, %r24
	.word 0x80fae001  ! 1477: SDIVcc_I	sdivcc 	%r11, 0x0001, %r0
	.word 0x97a00542  ! 1478: FSQRTd	fsqrt	
	.word 0xb1a0c9e2  ! 1479: FDIVq	dis not found

	.word 0x984e0019  ! 1480: MULX_R	mulx 	%r24, %r25, %r12
	.word 0x22700001  ! 1481: BPE	<illegal instruction>
	.word 0x8d902045  ! 1482: WRPR_PSTATE_I	wrpr	%r0, 0x0045, %pstate
	.word 0xb1a01a68  ! 1483: FqTOi	fqtoi	
	.word 0xa1902003  ! 1484: WRPR_GL_I	wrpr	%r0, 0x0003, %-
reduce_priv_level_121:
	.word 0x8f902001  ! 1486: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89814017  ! 1485: WRTICK_R	wr	%r5, %r23, %tick
	.word 0xa9514000  ! 1486: RDPR_TBA	rdpr	%tba, %r20
	.word 0x83d02033  ! 1487: Tcc_I	te	icc_or_xcc, %r0 + 51
DS_122:
	.word 0x22800001  ! 1489: BE	be,a	<label_0x1>
	illtrap
	.word 0xc3120004  ! 1489: LDQF_R	-	[%r8, %r4], %f1
	.word 0xada0483b  ! 1488: FADDs	fadds	%f1, %f27, %f22
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1489: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xec07c000  ! 1490: LDUW_R	lduw	[%r31 + %r0], %r22
	.word 0xec5fc000  ! 1491: LDX_R	ldx	[%r31 + %r0], %r22
	.word 0x91d02030  ! 1492: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902002  ! 1493: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x89a01a6a  ! 1494: FqTOi	fqtoi	
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1495: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 1496: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x91d02035  ! 1497: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x879020e0  ! 1498: WRPR_TT_I	wrpr	%r0, 0x00e0, %tt
	.word 0x87802004  ! 1499: WRASI_I	wr	%r0, 0x0004, %asi
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1500: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc87fe001  ! 1501: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0x8d902218  ! 1502: WRPR_PSTATE_I	wrpr	%r0, 0x0218, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9545c000  ! 1504: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0x8d9026d0  ! 1505: WRPR_PSTATE_I	wrpr	%r0, 0x06d0, %pstate
	.word 0xd40fc000  ! 1506: LDUB_R	ldub	[%r31 + %r0], %r10
	.word 0x8d90224c  ! 1507: WRPR_PSTATE_I	wrpr	%r0, 0x024c, %pstate
	.word 0x8fa28d36  ! 1508: FsMULd	fsmuld	%f10, %f22, %f38
	.word 0x8ba189b0  ! 1509: FDIVs	fdivs	%f6, %f16, %f5
	.word 0x91d02030  ! 1510: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d90225a  ! 1511: WRPR_PSTATE_I	wrpr	%r0, 0x025a, %pstate
	.word 0x8150c000  ! 1512: RDPR_TT	rdpr	%tt, %r0
	.word 0x8d702001  ! 1513: POPC_I	popc	0x0001, %r6
	.word 0x30700001  ! 1514: BPA	<illegal instruction>
change_to_randtl_123:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1515: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
DS_124:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1516: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1517: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021f8  ! 1518: WRPR_TT_I	wrpr	%r0, 0x01f8, %tt
	.word 0x93902005  ! 1519: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8ad9801b  ! 1520: SMULcc_R	smulcc 	%r6, %r27, %r5
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1521: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b508000  ! 1522: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0xca2fe001  ! 1523: STB_I	stb	%r5, [%r31 + 0x0001]
	.word 0xcadfe030  ! 1524: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r5
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1525: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xca17e001  ! 1526: LDUH_I	lduh	[%r31 + 0x0001], %r5
	.word 0xb5a000d6  ! 1527: FNEGd	fnegd	%f22, %f26
	.word 0xab494000  ! 1528: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0x8d802000  ! 1529: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa3508000  ! 1530: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xa1902008  ! 1531: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93902002  ! 1532: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8e866001  ! 1533: ADDcc_I	addcc 	%r25, 0x0001, %r7
	.word 0x93902005  ! 1534: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x83d02035  ! 1535: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d902c41  ! 1536: WRPR_PSTATE_I	wrpr	%r0, 0x0c41, %pstate
	.word 0x93902001  ! 1537: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xced80e80  ! 1538: LDXA_R	ldxa	[%r0, %r0] 0x74, %r7
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1539: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8e6a6001  ! 1540: UDIVX_I	udivx 	%r9, 0x0001, %r7
	.word 0x99464000  ! 1541: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x9a6a0010  ! 1542: UDIVX_R	udivx 	%r8, %r16, %r13
	.word 0x87504000  ! 1543: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x90d1a001  ! 1544: UMULcc_I	umulcc 	%r6, 0x0001, %r8
	.word 0x9951c000  ! 1545: RDPR_TL	rdpr	%tl, %r12
	.word 0x8e6d4014  ! 1546: UDIVX_R	udivx 	%r21, %r20, %r7
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1548: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 1549: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x879020b3  ! 1550: WRPR_TT_I	wrpr	%r0, 0x00b3, %tt
	.word 0x81982b5c  ! 1551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5c, %hpstate
	.word 0x93902001  ! 1552: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982f85  ! 1553: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f85, %hpstate
	.word 0xa1902008  ! 1554: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x99902001  ! 1555: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x91d02035  ! 1556: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xcf37e001  ! 1557: STQF_I	-	%f7, [0x0001, %r31]
change_to_tl1_125:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02035  ! 1559: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x99464000  ! 1560: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x8198225d  ! 1561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025d, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902008  ! 1563: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd997e001  ! 1564: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0xd8dfe000  ! 1565: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
	.word 0xa1902004  ! 1566: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1567: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 1568: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x83d02032  ! 1569: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d90245e  ! 1570: WRPR_PSTATE_I	wrpr	%r0, 0x045e, %pstate
	.word 0x83d02030  ! 1571: Tcc_I	te	icc_or_xcc, %r0 + 48
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1572: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_126:
	.word 0x32800001  ! 1574: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xcb128019  ! 1574: LDQF_R	-	[%r10, %r25], %f5
	.word 0xada20820  ! 1573: FADDs	fadds	%f8, %f0, %f22
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1574: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xecc804a0  ! 1575: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r22
	.word 0x93902004  ! 1576: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8790232c  ! 1577: WRPR_TT_I	wrpr	%r0, 0x032c, %tt
	.word 0xa5a149b9  ! 1578: FDIVs	fdivs	%f5, %f25, %f18
	.word 0xe437c019  ! 1579: STH_R	sth	%r18, [%r31 + %r25]
	.word 0xe4800ba0  ! 1580: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r18
	.word 0x8790213f  ! 1581: WRPR_TT_I	wrpr	%r0, 0x013f, %tt
	.word 0x8198259d  ! 1582: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059d, %hpstate
	.word 0xe48008a0  ! 1583: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
DS_127:
	.word 0x34800001  ! 1585: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1584: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d802000  ! 1585: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902681  ! 1586: WRPR_PSTATE_I	wrpr	%r0, 0x0681, %pstate
	.word 0x8d9028c7  ! 1587: WRPR_PSTATE_I	wrpr	%r0, 0x08c7, %pstate
	.word 0x91d02032  ! 1588: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x879023ee  ! 1589: WRPR_TT_I	wrpr	%r0, 0x03ee, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902494  ! 1591: WRPR_PSTATE_I	wrpr	%r0, 0x0494, %pstate
	.word 0x8d902883  ! 1592: WRPR_PSTATE_I	wrpr	%r0, 0x0883, %pstate
reduce_priv_level_128:
	.word 0x8f902002  ! 1594: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8982c018  ! 1593: WRTICK_R	wr	%r11, %r24, %tick
	.word 0xe45fe001  ! 1594: LDX_I	ldx	[%r31 + 0x0001], %r18
	.word 0xa1902005  ! 1595: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x83d02030  ! 1596: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x91d02032  ! 1597: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xb6fa000c  ! 1598: SDIVcc_R	sdivcc 	%r8, %r12, %r27
	.word 0x8d802000  ! 1599: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982dde  ! 1600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dde, %hpstate
	.word 0xf697e010  ! 1601: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r27
	.word 0xa1902009  ! 1602: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902006  ! 1603: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xf67fe001  ! 1604: SWAP_I	swap	%r27, [%r31 + 0x0001]
change_to_tl1_129:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa5504000  ! 1606: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x91d02030  ! 1607: Tcc_I	ta	icc_or_xcc, %r0 + 48
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1608: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 1609: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa945c000  ! 1610: RD_TICK_CMPR_REG	rd	%-, %r20
change_to_tl1_130:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87480000  ! 1612: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0xb3514000  ! 1613: RDPR_TBA	rdpr	%tba, %r25
	.word 0xf227c00c  ! 1614: STW_R	stw	%r25, [%r31 + %r12]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902006  ! 1616: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xaf6ac002  ! 1617: SDIVX_R	sdivx	%r11, %r2, %r23
	.word 0x8198214d  ! 1618: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014d, %hpstate
	.word 0x879023bf  ! 1619: WRPR_TT_I	wrpr	%r0, 0x03bf, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879023de  ! 1621: WRPR_TT_I	wrpr	%r0, 0x03de, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90240c  ! 1623: WRPR_PSTATE_I	wrpr	%r0, 0x040c, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1624: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982ece  ! 1625: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ece, %hpstate
	.word 0xee47e001  ! 1626: LDSW_I	ldsw	[%r31 + 0x0001], %r23
	.word 0x8d902e43  ! 1627: WRPR_PSTATE_I	wrpr	%r0, 0x0e43, %pstate
	.word 0xee5fe001  ! 1628: LDX_I	ldx	[%r31 + 0x0001], %r23
	.word 0xee97e030  ! 1629: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r23
	.word 0x8d902609  ! 1630: WRPR_PSTATE_I	wrpr	%r0, 0x0609, %pstate
	.word 0x81982b5d  ! 1631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5d, %hpstate
	.word 0xefe7c022  ! 1632: CASA_I	casa	[%r31] 0x 1, %r2, %r23
	.word 0xa1902008  ! 1633: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x9f802001  ! 1634: SIR	sir	0x0001
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1635: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 1636: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d90289b  ! 1637: WRPR_PSTATE_I	wrpr	%r0, 0x089b, %pstate
	.word 0x93902006  ! 1638: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d9022c5  ! 1639: WRPR_PSTATE_I	wrpr	%r0, 0x02c5, %pstate
	.word 0xa190200d  ! 1640: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x9f802001  ! 1641: SIR	sir	0x0001
	.word 0x8269e001  ! 1642: UDIVX_I	udivx 	%r7, 0x0001, %r1
	.word 0xc21fe001  ! 1643: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0x8d508000  ! 1644: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0x8d90241f  ! 1645: WRPR_PSTATE_I	wrpr	%r0, 0x041f, %pstate
	.word 0x8790209c  ! 1646: WRPR_TT_I	wrpr	%r0, 0x009c, %tt
	.word 0x8d902c87  ! 1647: WRPR_PSTATE_I	wrpr	%r0, 0x0c87, %pstate
	.word 0x8d902e0b  ! 1648: WRPR_PSTATE_I	wrpr	%r0, 0x0e0b, %pstate
	.word 0x91d02034  ! 1649: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_randtl_131:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1650: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
DS_132:
	.word 0x22800001  ! 1652: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1651: SAVE_R	save	%r31, %r0, %r31
	.word 0xcd27e001  ! 1652: STF_I	st	%f6, [0x0001, %r31]
	.word 0xa9494000  ! 1653: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0x87494000  ! 1654: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0x93a01a6a  ! 1655: FqTOi	fqtoi	
	.word 0xa1902007  ! 1656: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa7a0c9d8  ! 1657: FDIVd	fdivd	%f34, %f24, %f50
	.word 0xa3a01a7b  ! 1658: FqTOi	fqtoi	
	.word 0xa1902008  ! 1659: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe247e001  ! 1660: LDSW_I	ldsw	[%r31 + 0x0001], %r17
	.word 0x81982b4d  ! 1661: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4d, %hpstate
	.word 0x8d9020da  ! 1662: WRPR_PSTATE_I	wrpr	%r0, 0x00da, %pstate
	.word 0x34700001  ! 1663: BPG	<illegal instruction>
	.word 0x81982296  ! 1664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0296, %hpstate
	.word 0x88fa0002  ! 1665: SDIVcc_R	sdivcc 	%r8, %r2, %r4
	.word 0x93d02033  ! 1666: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x93902006  ! 1667: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x95702001  ! 1668: POPC_I	popc	0x0001, %r10
	.word 0x8d9026ce  ! 1669: WRPR_PSTATE_I	wrpr	%r0, 0x06ce, %pstate
	.word 0x36800001  ! 1670: BGE	bge,a	<label_0x1>
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1671: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1672: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982387  ! 1673: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0387, %hpstate
	.word 0x99508000  ! 1674: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x9f802001  ! 1675: SIR	sir	0x0001
	.word 0x879020cd  ! 1676: WRPR_TT_I	wrpr	%r0, 0x00cd, %tt
	.word 0x8790224b  ! 1677: WRPR_TT_I	wrpr	%r0, 0x024b, %tt
	.word 0x8198294d  ! 1678: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094d, %hpstate
	.word 0x8f464000  ! 1679: RD_STICK_CMPR_REG	rd	%-, %r7
DS_133:
	.word 0x22800001  ! 1681: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1681: BNE	bne,a	<label_0x1>
	.word 0x95a00559  ! 1681: FSQRTd	fsqrt	
	.word 0x81a28822  ! 1680: FADDs	fadds	%f10, %f2, %f0
	.word 0x8a6c6001  ! 1681: UDIVX_I	udivx 	%r17, 0x0001, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902007  ! 1683: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8790230d  ! 1684: WRPR_TT_I	wrpr	%r0, 0x030d, %tt
	.word 0x93902002  ! 1685: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8ba049d9  ! 1686: FDIVd	fdivd	%f32, %f56, %f36
	.word 0x91d02033  ! 1687: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802088  ! 1688: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902001  ! 1689: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982686  ! 1690: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0686, %hpstate
	.word 0x2e800001  ! 1691: BVS	bvs,a	<label_0x1>
	.word 0x81982f1f  ! 1692: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1f, %hpstate
	.word 0xa1902005  ! 1693: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x819828d4  ! 1694: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d4, %hpstate
	.word 0x93902001  ! 1695: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xcad80e40  ! 1696: LDXA_R	ldxa	[%r0, %r0] 0x72, %r5
	.word 0x99702001  ! 1697: POPC_I	popc	0x0001, %r12
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1698: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd9e7c039  ! 1699: CASA_I	casa	[%r31] 0x 1, %r25, %r12
	.word 0xd84fc000  ! 1700: LDSB_R	ldsb	[%r31 + %r0], %r12
change_to_tl1_134:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8790233d  ! 1702: WRPR_TT_I	wrpr	%r0, 0x033d, %tt
	.word 0x89508000  ! 1703: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0xa190200a  ! 1704: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xa190200e  ! 1705: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x93902002  ! 1706: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87802080  ! 1707: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xc8cfe030  ! 1708: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r4
	.word 0x8fa189fa  ! 1709: FDIVq	dis not found

	.word 0x8d500000  ! 1710: RDPR_TPC	rdpr	%tpc, %r6
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1711: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982507  ! 1712: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0507, %hpstate
	.word 0xa1902004  ! 1713: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1714: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81460000  ! 1715: RD_STICK_REG	stbar
	.word 0x9ad64000  ! 1716: UMULcc_R	umulcc 	%r25, %r0, %r13
	.word 0x93902000  ! 1717: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa190200d  ! 1718: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d902c44  ! 1719: WRPR_PSTATE_I	wrpr	%r0, 0x0c44, %pstate
	.word 0x93902003  ! 1720: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902006  ! 1721: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02034  ! 1722: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x98d1001a  ! 1723: UMULcc_R	umulcc 	%r4, %r26, %r12
	.word 0x85464000  ! 1724: RD_STICK_CMPR_REG	rd	%-, %r2
	.word 0x93902007  ! 1725: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d02031  ! 1726: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d902a0c  ! 1727: WRPR_PSTATE_I	wrpr	%r0, 0x0a0c, %pstate
	.word 0xa1902005  ! 1728: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x92c6a001  ! 1729: ADDCcc_I	addccc 	%r26, 0x0001, %r9
	.word 0x9a6e2001  ! 1730: UDIVX_I	udivx 	%r24, 0x0001, %r13
	.word 0xda97e030  ! 1731: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1732: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xda5fc000  ! 1733: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0xa468e001  ! 1734: UDIVX_I	udivx 	%r3, 0x0001, %r18
change_to_randtl_135:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1735: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1736: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe48008a0  ! 1737: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x83a000c1  ! 1738: FNEGd	fnegd	%f32, %f32
	.word 0x93902007  ! 1739: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902649  ! 1740: WRPR_PSTATE_I	wrpr	%r0, 0x0649, %pstate
	.word 0x93902002  ! 1741: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa5a209c5  ! 1742: FDIVd	fdivd	%f8, %f36, %f18
	.word 0xe4800ac0  ! 1743: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r18
	.word 0x8d9028c2  ! 1744: WRPR_PSTATE_I	wrpr	%r0, 0x08c2, %pstate
	.word 0x81982985  ! 1745: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0985, %hpstate
change_to_randtl_136:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1746: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902004  ! 1747: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x82d08013  ! 1748: UMULcc_R	umulcc 	%r2, %r19, %r1
	.word 0x30800001  ! 1749: BA	ba,a	<label_0x1>
	.word 0x879023aa  ! 1750: WRPR_TT_I	wrpr	%r0, 0x03aa, %tt
	.word 0x9f802001  ! 1751: SIR	sir	0x0001
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc327c013  ! 1753: STF_R	st	%f1, [%r19, %r31]
	.word 0xa1902005  ! 1754: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xc2cfe030  ! 1755: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r1
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1756: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902ac6  ! 1757: WRPR_PSTATE_I	wrpr	%r0, 0x0ac6, %pstate
	.word 0x81982254  ! 1758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0254, %hpstate
	.word 0xa190200b  ! 1759: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xc2800c40  ! 1760: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r1
	.word 0x879022fe  ! 1761: WRPR_TT_I	wrpr	%r0, 0x02fe, %tt
	.word 0x8d802000  ! 1762: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1763: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1764: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 1765: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f802001  ! 1766: SIR	sir	0x0001
	ta	T_CHANGE_TO_TL0	! macro
change_to_tl1_137:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x879022b5  ! 1769: WRPR_TT_I	wrpr	%r0, 0x02b5, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879020ae  ! 1771: WRPR_TT_I	wrpr	%r0, 0x00ae, %tt
	.word 0xc2dfe010  ! 1772: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r1
	.word 0xc20fe001  ! 1773: LDUB_I	ldub	[%r31 + 0x0001], %r1
DS_138:
	.word 0x34800001  ! 1775: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1774: SAVE_R	save	%r31, %r0, %r31
	.word 0xc337c013  ! 1775: STQF_R	-	%f1, [%r19, %r31]
	.word 0x8d902a41  ! 1776: WRPR_PSTATE_I	wrpr	%r0, 0x0a41, %pstate
	.word 0x91d02033  ! 1777: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902003  ! 1778: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x94db0005  ! 1779: SMULcc_R	smulcc 	%r12, %r5, %r10
	.word 0xa190200b  ! 1780: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xae6d0002  ! 1781: UDIVX_R	udivx 	%r20, %r2, %r23
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1782: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8ed24000  ! 1783: UMULcc_R	umulcc 	%r9, %r0, %r7
	.word 0xce97e030  ! 1784: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r7
	.word 0x8d9020d2  ! 1785: WRPR_PSTATE_I	wrpr	%r0, 0x00d2, %pstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1786: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x36800001  ! 1787: BGE	bge,a	<label_0x1>
	.word 0x8198245c  ! 1788: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045c, %hpstate
	.word 0x8d902e05  ! 1789: WRPR_PSTATE_I	wrpr	%r0, 0x0e05, %pstate
DS_139:
	.word 0x32800001  ! 1791: BNE	bne,a	<label_0x1>
	.word 0xd936a001  ! 1791: STQF_I	-	%f12, [0x0001, %r26]
	normalw
	.word 0x83458000  ! 1790: RD_SOFTINT_REG	rd	%softint, %r1
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x84c5a001  ! 1792: ADDCcc_I	addccc 	%r22, 0x0001, %r2
	.word 0x81982d8c  ! 1793: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8c, %hpstate
	.word 0x8d802000  ! 1794: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc427c000  ! 1795: STW_R	stw	%r2, [%r31 + %r0]
	.word 0x91d02030  ! 1796: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x91d02033  ! 1797: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81982f56  ! 1798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f56, %hpstate
DS_140:
	.word 0x34800001  ! 1800: BG	bg,a	<label_0x1>
	pdist %f22, %f12, %f16
	.word 0xabb20310  ! 1799: ALLIGNADDRESS	alignaddr	%r8, %r16, %r21
	.word 0xead804a0  ! 1800: LDXA_R	ldxa	[%r0, %r0] 0x25, %r21
	.word 0x8198280f  ! 1801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080f, %hpstate
	.word 0xa1902007  ! 1802: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xeb27c010  ! 1803: STF_R	st	%f21, [%r16, %r31]
	.word 0x8d802000  ! 1804: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879020e4  ! 1805: WRPR_TT_I	wrpr	%r0, 0x00e4, %tt
	.word 0x8d802000  ! 1806: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f802001  ! 1807: SIR	sir	0x0001
	.word 0x87902322  ! 1808: WRPR_TT_I	wrpr	%r0, 0x0322, %tt
	.word 0x81982605  ! 1809: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0605, %hpstate
	.word 0x24700001  ! 1810: BPLE	<illegal instruction>
	.word 0x87802088  ! 1811: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x99b48fe4  ! 1812: FONES	fones	%f12
	.word 0x879020ae  ! 1813: WRPR_TT_I	wrpr	%r0, 0x00ae, %tt
	.word 0x8d902e02  ! 1814: WRPR_PSTATE_I	wrpr	%r0, 0x0e02, %pstate
	.word 0x93902007  ! 1815: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xb750c000  ! 1816: RDPR_TT	rdpr	%tt, %r27
	.word 0x91d02033  ! 1817: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x22800001  ! 1818: BE	be,a	<label_0x1>
	.word 0x8d802000  ! 1819: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_141:
	.word 0x20800001  ! 1821: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1820: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d9024cc  ! 1821: WRPR_PSTATE_I	wrpr	%r0, 0x04cc, %pstate
	.word 0x8d802004  ! 1822: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902002  ! 1823: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xf737c004  ! 1824: STQF_R	-	%f27, [%r4, %r31]
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1825: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9249001a  ! 1826: MULX_R	mulx 	%r4, %r26, %r9
change_to_tl1_142:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902600  ! 1829: WRPR_PSTATE_I	wrpr	%r0, 0x0600, %pstate
	.word 0x83d02034  ! 1830: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xd2d804a0  ! 1831: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0x879021a4  ! 1832: WRPR_TT_I	wrpr	%r0, 0x01a4, %tt
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1833: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xaf540000  ! 1834: RDPR_GL	rdpr	%-, %r23
	.word 0x95b2cfed  ! 1835: FONES	fones	%f10
	.word 0x87802016  ! 1836: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa7b30ff3  ! 1837: FONES	fones	%f19
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1838: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879021f8  ! 1839: WRPR_TT_I	wrpr	%r0, 0x01f8, %tt
	.word 0xa7a000c9  ! 1840: FNEGd	fnegd	%f40, %f50
	.word 0x8198209f  ! 1841: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009f, %hpstate
	.word 0x9f802001  ! 1842: SIR	sir	0x0001
	.word 0x91d02035  ! 1843: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 1844: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8b494000  ! 1845: RDHPR_HTBA	rdhpr	%htba, %r5
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1846: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 1847: WRASI_I	wr	%r0, 0x0010, %asi
DS_143:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1848: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x87902313  ! 1849: WRPR_TT_I	wrpr	%r0, 0x0313, %tt
	.word 0x97702001  ! 1850: POPC_I	popc	0x0001, %r11
	.word 0xa190200d  ! 1851: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902005  ! 1852: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8790209b  ! 1853: WRPR_TT_I	wrpr	%r0, 0x009b, %tt
	.word 0xd64fe001  ! 1854: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0x8d902a8a  ! 1855: WRPR_PSTATE_I	wrpr	%r0, 0x0a8a, %pstate
reduce_priv_level_144:
	.word 0x8f902002  ! 1857: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x856b2001  ! 1856: SDIVX_I	sdivx	%r12, 0x0001, %r2
	.word 0x89540000  ! 1857: RDPR_GL	rdpr	%-, %r4
	.word 0x93902002  ! 1858: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902007  ! 1859: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x28800001  ! 1860: BLEU	bleu,a	<label_0x1>
change_to_randtl_145:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1861: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x879022a4  ! 1862: WRPR_TT_I	wrpr	%r0, 0x02a4, %tt
	.word 0x93902000  ! 1863: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xb351c000  ! 1864: RDPR_TL	rdpr	%tl, %r25
	.word 0x91d02031  ! 1865: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x95504000  ! 1866: RDPR_TNPC	<illegal instruction>
	.word 0x36800001  ! 1867: BGE	bge,a	<label_0x1>
	.word 0x9f802001  ! 1868: SIR	sir	0x0001
	.word 0xa1902008  ! 1869: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_146:
	.word 0x32800001  ! 1871: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1870: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982edc  ! 1871: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edc, %hpstate
	.word 0xb2d12001  ! 1872: UMULcc_I	umulcc 	%r4, 0x0001, %r25
	.word 0x879023e8  ! 1873: WRPR_TT_I	wrpr	%r0, 0x03e8, %tt
DS_147:
	.word 0x22800001  ! 1875: BE	be,a	<label_0x1>
	allclean
	.word 0xa7b5c30a  ! 1874: ALLIGNADDRESS	alignaddr	%r23, %r10, %r19
	.word 0x93902002  ! 1875: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9351c000  ! 1876: RDPR_TL	rdpr	%tl, %r9
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1877: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982cdc  ! 1878: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdc, %hpstate
	.word 0x879022d0  ! 1879: WRPR_TT_I	wrpr	%r0, 0x02d0, %tt
	.word 0xa1902009  ! 1880: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa1902001  ! 1881: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd3e7c02a  ! 1882: CASA_I	casa	[%r31] 0x 1, %r10, %r9
	.word 0x8790217c  ! 1883: WRPR_TT_I	wrpr	%r0, 0x017c, %tt
	.word 0x93902000  ! 1884: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8751c000  ! 1885: RDPR_TL	rdpr	%tl, %r3
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1886: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc67fe001  ! 1887: SWAP_I	swap	%r3, [%r31 + 0x0001]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8790208a  ! 1889: WRPR_TT_I	wrpr	%r0, 0x008a, %tt
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1890: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902a8f  ! 1891: WRPR_PSTATE_I	wrpr	%r0, 0x0a8f, %pstate
	.word 0xa1902000  ! 1892: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xc6d00e60  ! 1893: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r3
	.word 0x3a800001  ! 1894: BCC	bcc,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902006  ! 1896: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d90281d  ! 1897: WRPR_PSTATE_I	wrpr	%r0, 0x081d, %pstate
	.word 0x91d02034  ! 1898: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_148:
	.word 0x34800001  ! 1900: BG	bg,a	<label_0x1>
	pdist %f14, %f24, %f28
	.word 0xadb10305  ! 1899: ALLIGNADDRESS	alignaddr	%r4, %r5, %r22
	.word 0xa1902002  ! 1900: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xecffc025  ! 1901: SWAPA_R	swapa	%r22, [%r31 + %r5] 0x01
	.word 0x99902003  ! 1902: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x8d902600  ! 1903: WRPR_PSTATE_I	wrpr	%r0, 0x0600, %pstate
	.word 0x8790222d  ! 1904: WRPR_TT_I	wrpr	%r0, 0x022d, %tt
	.word 0x88f96001  ! 1905: SDIVcc_I	sdivcc 	%r5, 0x0001, %r4
	.word 0xa1902001  ! 1906: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa7500000  ! 1907: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x83d02035  ! 1908: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x9f802001  ! 1909: SIR	sir	0x0001
DS_149:
	.word 0x32800001  ! 1911: BNE	bne,a	<label_0x1>
	.word 0xd333000b  ! 1911: STQF_R	-	%f9, [%r11, %r12]
	normalw
	.word 0xad458000  ! 1910: RD_SOFTINT_REG	rd	%softint, %r22
	.word 0x93902006  ! 1911: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8ca8800b  ! 1912: ANDNcc_R	andncc 	%r2, %r11, %r6
	.word 0xccd80e60  ! 1913: LDXA_R	ldxa	[%r0, %r0] 0x73, %r6
	.word 0x91d02035  ! 1914: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902ed6  ! 1915: WRPR_PSTATE_I	wrpr	%r0, 0x0ed6, %pstate
change_to_tl1_150:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x81982d0f  ! 1917: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0f, %hpstate
	.word 0x91d02031  ! 1918: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87902144  ! 1919: WRPR_TT_I	wrpr	%r0, 0x0144, %tt
	.word 0x81982d1f  ! 1920: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1f, %hpstate
	.word 0xccc7e020  ! 1921: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r6
	.word 0x91d02030  ! 1922: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xcc7fe001  ! 1923: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0xa3504000  ! 1924: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x8198240d  ! 1925: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040d, %hpstate
	.word 0xa1902002  ! 1926: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1927: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1928: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1929: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9028d9  ! 1930: WRPR_PSTATE_I	wrpr	%r0, 0x08d9, %pstate
	.word 0x8198224f  ! 1931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024f, %hpstate
	.word 0xa1902000  ! 1932: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x2e800001  ! 1933: BVS	bvs,a	<label_0x1>
	.word 0xe28008a0  ! 1934: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe297e020  ! 1935: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
	.word 0x83d02030  ! 1936: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xa1902006  ! 1937: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xe337e001  ! 1938: STQF_I	-	%f17, [0x0001, %r31]
	.word 0x879020d2  ! 1939: WRPR_TT_I	wrpr	%r0, 0x00d2, %tt
	.word 0x8ec26001  ! 1940: ADDCcc_I	addccc 	%r9, 0x0001, %r7
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1941: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_151:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1942: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x819822df  ! 1943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02df, %hpstate
	.word 0xce8008a0  ! 1944: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8868a001  ! 1945: UDIVX_I	udivx 	%r2, 0x0001, %r4
	.word 0x8d902c9c  ! 1946: WRPR_PSTATE_I	wrpr	%r0, 0x0c9c, %pstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1947: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790205d  ! 1948: WRPR_TT_I	wrpr	%r0, 0x005d, %tt
	.word 0x8069a001  ! 1949: UDIVX_I	udivx 	%r6, 0x0001, %r0
	.word 0x91d02031  ! 1950: Tcc_I	ta	icc_or_xcc, %r0 + 49
change_to_tl1_152:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902cdd  ! 1952: WRPR_PSTATE_I	wrpr	%r0, 0x0cdd, %pstate
	.word 0xc007c000  ! 1953: LDUW_R	lduw	[%r31 + %r0], %r0
	.word 0xa1902009  ! 1954: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x81982186  ! 1955: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0186, %hpstate
	.word 0xc0c804a0  ! 1956: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0x8d45c000  ! 1957: RD_TICK_CMPR_REG	rd	%-, %r6
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1958: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1959: SIR	sir	0x0001
	.word 0xcc47c000  ! 1960: LDSW_R	ldsw	[%r31 + %r0], %r6
	.word 0x32700001  ! 1961: BPNE	<illegal instruction>
	.word 0x87902241  ! 1962: WRPR_TT_I	wrpr	%r0, 0x0241, %tt
	.word 0x83d02030  ! 1963: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xcd17c000  ! 1964: LDQF_R	-	[%r31, %r0], %f6
	.word 0xa190200d  ! 1965: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x81982504  ! 1966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0504, %hpstate
	.word 0x91d02032  ! 1967: Tcc_I	ta	icc_or_xcc, %r0 + 50
reduce_priv_level_153:
	.word 0x8f902000  ! 1969: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 1968: SIAM	siam	1
	.word 0xcc0fc000  ! 1969: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0xccd7e030  ! 1970: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r6
	.word 0x93902001  ! 1971: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902290  ! 1972: WRPR_PSTATE_I	wrpr	%r0, 0x0290, %pstate
	.word 0xcc0fc000  ! 1973: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x879021ee  ! 1974: WRPR_TT_I	wrpr	%r0, 0x01ee, %tt
	.word 0x8f45c000  ! 1975: RD_TICK_CMPR_REG	rd	%-, %r7
	.word 0x8d9020c5  ! 1976: WRPR_PSTATE_I	wrpr	%r0, 0x00c5, %pstate
	.word 0xa190200f  ! 1977: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x91d02032  ! 1978: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x879023fd  ! 1979: WRPR_TT_I	wrpr	%r0, 0x03fd, %tt
	.word 0x83a01a60  ! 1980: FqTOi	fqtoi	
	.word 0x819821c7  ! 1981: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c7, %hpstate
	.word 0x28700001  ! 1982: BPLEU	<illegal instruction>
	.word 0x819829ce  ! 1983: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ce, %hpstate
	.word 0x93902000  ! 1984: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87902304  ! 1985: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
	.word 0x819822d7  ! 1986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d7, %hpstate
DS_154:
	.word 0x20800001  ! 1988: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1987: SAVE_R	save	%r31, %r0, %r31
	.word 0x97514000  ! 1988: RDPR_TBA	rdpr	%tba, %r11
DS_155:
	.word 0x20800001  ! 1990: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1989: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1a409d5  ! 1990: FDIVd	fdivd	%f16, %f52, %f16
	.word 0x8d494000  ! 1991: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0x93902002  ! 1992: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xcc7fe001  ! 1993: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x87802016  ! 1994: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa1902000  ! 1995: WRPR_GL_I	wrpr	%r0, 0x0000, %-
change_to_tl1_156:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_157:
	.word 0x34800001  ! 1998: BG	bg,a	<label_0x1>
	.word 0xd732a001  ! 1998: STQF_I	-	%f11, [0x0001, %r10]
	normalw
	.word 0xa1458000  ! 1997: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x9145c000  ! 1998: RD_TICK_CMPR_REG	rd	%-, %r8


.global user_data_start
.data
user_data_start:
	.xword	0xaa407d43a4973002
	.xword	0x76eb406ffff5d3e0
	.xword	0x270ed3cacd744ee8
	.xword	0x4ec6868a5a4ce135
	.xword	0xb4674a6b416692c7
	.xword	0x0fbcf105224730f5
	.xword	0xfce1955ecad3c582
	.xword	0x9599bebd1887be2a
	.xword	0x5dafd6e9137c60f8
	.xword	0x3e9878295d04b502
	.xword	0xc99e5663e820c0bd
	.xword	0x7c6deaeff2fb7438
	.xword	0xd58e79e7815e28a0
	.xword	0x7cb24bdfa538d8d8
	.xword	0x37584558d6c45873
	.xword	0x10b9db958cddf7b7
	.xword	0x3e6cb0dda06eeae2
	.xword	0x21b222045a27dd06
	.xword	0x5a15e0c4542a3ecc
	.xword	0xd37043742b96bf81
	.xword	0xa692d7216e699d56
	.xword	0xe6677bce2b06584e
	.xword	0x1e4dbc1ee8f9f101
	.xword	0x6eaa331934d1ab2e
	.xword	0xea063c2706ae3f23
	.xword	0xe5e65abbe1bbf3da
	.xword	0x45981113e2ecfc88
	.xword	0xd935d92efcafded4
	.xword	0x7600922764ca66e2
	.xword	0x08ada032a109e8d0
	.xword	0x26e0411a5bc1f751
	.xword	0x2f5545b6a3d337e3
	.xword	0x53cb2ab39ed58fd3
	.xword	0x62bd09f05d9b1e44
	.xword	0x726984a918c778f2
	.xword	0x82f6aa89fb426084
	.xword	0x5dc2d566786cda66
	.xword	0x5b77dba5095248ae
	.xword	0x84b57107c9150969
	.xword	0xddc6883bd0aa4649
	.xword	0xb412c85b67123681
	.xword	0xec7cafea12231671
	.xword	0xff5b3314134415b9
	.xword	0x474b0cabea3431b2
	.xword	0x07ec3bd57f776cd8
	.xword	0xf7ba5c8637038242
	.xword	0xa5542375ea509730
	.xword	0x96892feac6a8388d
	.xword	0xfb072f9ae0ee6377
	.xword	0x57e0dc2daa45f39d
	.xword	0xb5dddadf102e9f34
	.xword	0xb4e68e084101230e
	.xword	0xf1c03ebc784ee6da
	.xword	0x2aeb81a8ca55b8bb
	.xword	0xcabcffbc87ea4fd7
	.xword	0x8313a3e4a1f3bffa
	.xword	0x658cb2d469dfc8e6
	.xword	0x513ce054a8817eef
	.xword	0xfea34d339ade8904
	.xword	0x305759a6ae6d5689
	.xword	0xff6ab003b0e69e27
	.xword	0x35b2dc1412794e0f
	.xword	0x3eacfac8ea58b99d
	.xword	0x3e71a06b39729ce2
	.xword	0x2b4bb24f310fddfa
	.xword	0x03d03552ee17d4f4
	.xword	0x941945f1522d4fa6
	.xword	0xab0fdac05193a1d5
	.xword	0xda0200814c82358a
	.xword	0xf1b215733e808a96
	.xword	0xe6e3d3ea11b3f116
	.xword	0x2c4febe10581c35a
	.xword	0xe14bc462eb93a74f
	.xword	0xc19aeb06d1c537d6
	.xword	0xbfd1ce55d69d7ab6
	.xword	0x2bc72b6fe570476a
	.xword	0x7316cc9c07b38e94
	.xword	0xa6589990f2e8ec51
	.xword	0xe51cb65c9ddbd70a
	.xword	0xf5e476111df0a87d
	.xword	0x9ddc874fff5f4637
	.xword	0x252b3180a062e748
	.xword	0xa85276f7fbfa674a
	.xword	0x515a7325cd27e435
	.xword	0x207854e94dbccbcb
	.xword	0x088259d37ed39f4c
	.xword	0x5da53cf93fdf4f24
	.xword	0xefa29d098e6d7257
	.xword	0x4777077900f4f2f6
	.xword	0xcc46b6041bce4747
	.xword	0x3d317bccdffc0947
	.xword	0x5cfc8eba24eaf009
	.xword	0xc436e78c37afc86e
	.xword	0x32156eb46bf89f10
	.xword	0x50026db8eeb00451
	.xword	0x2ec407671663036b
	.xword	0x34b4474e8d68b6a8
	.xword	0x0b6315bfe6253a3a
	.xword	0xf356382a9aba0ae7
	.xword	0xf737d47e10996ddf
	.xword	0x55698684cea74897
	.xword	0x14a6de5cc987c825
	.xword	0xf30bbc6941a88f46
	.xword	0x94c599c8d3d5bf91
	.xword	0x5e4003b8783e03bd
	.xword	0x46b438dc23ba1798
	.xword	0x987316647b8e54f4
	.xword	0xd7397111b4d9828d
	.xword	0x5d25b381759f4ada
	.xword	0x6b99311562d662b4
	.xword	0x53c75b8a983afd50
	.xword	0x1ec5123a86b59bec
	.xword	0x2af525d7222495b6
	.xword	0x36fa98e329f84608
	.xword	0x092ddc9d4c9c42f9
	.xword	0xaca86b4af7b26bff
	.xword	0xe6daad92dcab3bbc
	.xword	0xd9dc49635f6e83b2
	.xword	0xab084944fe044609
	.xword	0x939e04108e44c12a
	.xword	0x5344aac08ccff32f
	.xword	0x23593c9a2e0e246d
	.xword	0x4eb9e5cef5820e7a
	.xword	0x4975984644b8725a
	.xword	0x309d8d2f883cdb44
	.xword	0xec3e49d15a3f57e8
	.xword	0x4ed4a81a0df9607d
	.xword	0xb10a5d18ce7f9fc5
	.xword	0xd328872a11755686
	.xword	0x7894975d89d5d404
	.xword	0x54762f12de8b69e6
	.xword	0x5c2155f35c2e1560
	.xword	0xb90b23d1f9298ec1
	.xword	0xd66d1d3a05f87917
	.xword	0x64bac9e6e2319f01
	.xword	0xecba34f7621f467f
	.xword	0x22c6087b8323d5ea
	.xword	0xf0075245f19122f8
	.xword	0xff857ac0711c2bdd
	.xword	0xca5a538d6d5c0f02
	.xword	0x34b4a1367df42ad8
	.xword	0xb1bc0decf63a6487
	.xword	0x848a1ffcdcb3df8d
	.xword	0x436eb2523f03258c
	.xword	0x5042e0f0da60677d
	.xword	0xefc25bb6699652ef
	.xword	0x068c789467d2db0d
	.xword	0x734189a6da7b4bd2
	.xword	0xbde9296b2dfa265c
	.xword	0x0c529e68773f9523
	.xword	0x16d4d6b898e062ea
	.xword	0x500433cf1a08eb5d
	.xword	0x7ff6bdd99252a438
	.xword	0x3fea35dbe3c7cf9b
	.xword	0xce2c5c58cb30fac1
	.xword	0xba77b2ce1a488452
	.xword	0xfbf2b22e1c5f7ccc
	.xword	0x6049d318f149be38
	.xword	0xa26e5f883a9fb70c
	.xword	0xfc6951b217b2a081
	.xword	0xfceb14b92f3fe402
	.xword	0xab69f949231c2719
	.xword	0xfa0b55bccb57a041
	.xword	0x0c8db61089e41ff6
	.xword	0xbb819d2f336749dc
	.xword	0x9b998fc609d4a59f
	.xword	0x0b8e0d0f1efc050f
	.xword	0xda89c980f6a6c8fc
	.xword	0xb964d2787c20e0b9
	.xword	0x72b0c48c850de4d9
	.xword	0x5bee43df8eac6f2b
	.xword	0x7c420cdefb4c2d27
	.xword	0x52cf7777dc419082
	.xword	0xa34cee51a1bade81
	.xword	0xeefb71a384cd36c9
	.xword	0xa6f4abaab0e82df8
	.xword	0xf0145f0aafe8319e
	.xword	0xf70dcebf917f0213
	.xword	0x094ddb3b8b6ad026
	.xword	0xd502f2c230aa688b
	.xword	0x56665359f6400b9f
	.xword	0x9c05a2edfd9ec3cd
	.xword	0x6229fe730652776c
	.xword	0xf58efc575a46e9da
	.xword	0xe67366280d7f5622
	.xword	0x109bd83999268f63
	.xword	0x1d58557f44f4e443
	.xword	0x3ac79bceaad0a7ae
	.xword	0xfe360a05f6a2cca7
	.xword	0x5a788de3bc609257
	.xword	0x2c412cd3810862ea
	.xword	0x4526b2e412948b07
	.xword	0x129afce0c489e5ab
	.xword	0x0339a8743059adf7
	.xword	0xb2f226a29274623e
	.xword	0x459ea6cd8447ebfd
	.xword	0x40e8bffaa3261644
	.xword	0x54352709b14f21d1
	.xword	0xb3930f094b0d49f6
	.xword	0x8351db2877d295a2
	.xword	0xa4b184702ef20850
	.xword	0xcbce8ad712b3fe84
	.xword	0x5b0e9d4790ed82bb
	.xword	0x5143c0ca9c278206
	.xword	0x79416b3b699a29cf
	.xword	0x79de13ed6ac4b369
	.xword	0xd63eb8152e8cca69
	.xword	0x734219811242caff
	.xword	0xb113f61bdc56aa1f
	.xword	0x27b7103afe9fe703
	.xword	0xc82ef517173eba2c
	.xword	0xc2fa3afc8adaf717
	.xword	0x334ccf0c52674a48
	.xword	0x7a1d7d460b96ebcc
	.xword	0xa4345d4b9e7ae159
	.xword	0xc5370e8695d1cb89
	.xword	0x7ebe8561a6a49826
	.xword	0xf36695f53ade6b1d
	.xword	0x7a65b0fa964885c9
	.xword	0xa88973f3960a203d
	.xword	0xc659017f896e9de5
	.xword	0xd99bfb05d4ceeb30
	.xword	0x2ee99c9571cfacad
	.xword	0xa364da60981ee0b4
	.xword	0xdfe5867035185f47
	.xword	0x81f7dd7ae7355639
	.xword	0xab860b6c8ba8ff18
	.xword	0x0db824548c7d9ab0
	.xword	0x01767cd0446b9891
	.xword	0x314400257c12b1bd
	.xword	0x29be92e91f89aca4
	.xword	0x4837bf4a433e5e3f
	.xword	0x99164125d4fadb0b
	.xword	0xea2b6bb15d29b261
	.xword	0xd6a8c940d345f30c
	.xword	0x67f6a086c02fd8fc
	.xword	0x47a078a18aeab9d1
	.xword	0x1b89f1532eb51e8e
	.xword	0xa8761c846e4af104
	.xword	0x1c03e77c427b0898
	.xword	0x16eead181de62e34
	.xword	0x042a9e7c9c735388
	.xword	0x0c61ccd36821e1b2
	.xword	0xbc15dc3ba30bfa2e
	.xword	0x17130ff34d711151
	.xword	0xdbed639595a091a7
	.xword	0x533933cae8632b09
	.xword	0xcfd648668d52e8e1
	.xword	0xefb1af10a04c57bc
	.xword	0x239bbb05e95082f3
	.xword	0xa19f89504296cde0
	.xword	0xdf381fb6788265b9
	.xword	0x2ab1773425204c2d
	.xword	0xff23b40220853792
	.xword	0x8c7344a022699c85
	.xword	0x208ce7f1bcb46f38


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Mon May  3 15:58:03 2004
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
!!#     IJ_bind_thread_group("diag.j", 38, th0, 0x01);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 41, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     IJ_set_rvar("diag.j", 44, Rv_pdist_reg,"5'brrrr0");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!# 
!!#     IJ_set_ropr_fld("diag.j", 52, ijdefault, Ft_Rs1, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 53, ijdefault, Ft_Rs2, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 54, ijdefault, Ft_Rd, "{0..13,16..27}");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 57, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 60, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 61, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 64, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x16, 0x80, 0x88}");
!!#     IJ_set_ropr_fld("diag.j", 65, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 66, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 67, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 69, Ro_nontrap_ldasi_z, Ft_Imm_Asi, "{0x45, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 70, Ro_nontrap_ldasi_z, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 71, Ro_nontrap_ldasi_z, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 72, Ro_nontrap_ldasi_z, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 75, Ro_nontrap_ld, Fm_align_Simm13, "{0x0..0x6:5,0x7:1}");
!!#     IJ_set_ropr_fld("diag.j", 76, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 77, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 80, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 81, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 82, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 83, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     //IJ_set_ropr_fld(Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_ropr_fld("diag.j", 87, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35}");
!!#     IJ_set_ropr_fld("diag.j", 88, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 89, Ro_traps_i, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 90, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 91, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 92, Ro_traps_r, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 93, Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     //IJ_set_ropr_fld(Ro_traps_r, Ft_Simm13, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_rvar("diag.j", 95, Rv_init_trap, "{0x30..0x35}");
!!#     //IJ_set_rvar(Rv_init_trap, "{0x30..0x35, 0xb0..0xb5}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 99, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 100, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Pstate splash
!!#     IJ_set_ropr_fld("diag.j", 103, Ro_wrpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 104, Ro_wrpstate, Ft_Simm13, "12'b0rrr0rr0rrrrr");
!!# 
!!#     // Hpstate splash
!!#     IJ_set_ropr_fld("diag.j", 107, Ro_wrhpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 108, Ro_wrhpstate, Ft_Simm13, "12'brrrrrr0rr1rr");
!!# 
!!#     // TT splash
!!#     IJ_set_ropr_fld("diag.j", 111, Ro_wrtt, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 112, Ro_wrtt, Ft_Simm13, "10'brrrrrrrrrr");
!!# 
!!#     // GL splash
!!#     IJ_set_ropr_fld("diag.j", 115, Ro_wrgl, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 116, Ro_wrgl, Ft_Simm13, "4'brrrr");
!!# 
!!#     // TL splash
!!#     IJ_set_ropr_fld("diag.j", 119, Ro_tl, Ft_Simm13, "{0..5}");
!!#     IJ_set_ropr_fld("diag.j", 120, Ro_tl, Ft_Rs1,    "{0}");
!!# 
!!#     // CWP splash
!!#     IJ_set_ropr_fld("diag.j", 123, Ro_wrcwp, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 124, Ro_wrcwp, Ft_Simm13, "3'brrr");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 126, Ro_save_restore, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 127, Ro_save_restore, Ft_Rd,  "{31}");
!!#     IJ_set_ropr_fld("diag.j", 128, Ro_save_restore, Ft_Rs2, "{0}");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 130, Ro_winops, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 131, Ro_winops, Ft_Simm13, "{0..5}");
!!# 
!!#     // Dest reg is %g0
!!#     IJ_set_ropr_fld("diag.j", 134, Ro_rd0, Ft_Rd, "{0}");
!!# 
!!#     // Weights
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 137,"{10}");
!!#     IJ_set_rvar("diag.j", 138, wt_high, "{90}");
!!#     IJ_set_rvar("diag.j", 139, wt_med,  "{40}");
!!#     IJ_set_rvar("diag.j", 140, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 144, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<7; k++) {
!!#         for (i = 0; i < 30; i++) {
!!#             if (i==15) {
!!#                 IJ_printf  ("diag.j", 148, th0,"\tmov %%r31, %%r15\n");
!!#                 continue;
!!#             }
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 152, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 154, th0,"\tmov 0x%rx, %%r14\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 155, th0,"\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 156, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 159, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 162, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 165, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 168, th0,"\tta T_CHANGE_HPRIV \n");
!!#     IJ_printf  ("diag.j", 169, th0,"!Initializing Tick Cmprs \n");
!!#     IJ_printf  ("diag.j", 170, th0,"\tmov 1, %%g2\n");
!!#     IJ_printf  ("diag.j", 171, th0,"\tsllx %%g2, 63, %%g2\n");
!!#     IJ_printf  ("diag.j", 172, th0,"\tor %%g1, %%g2, %%g1\n");
!!#     IJ_printf("diag.j", 173, th0, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
!!#     IJ_printf("diag.j", 174, th0, "\twr %%g1, %%g0, %%tick_cmpr\n");
!!#     IJ_printf("diag.j", 175, th0, "\twr %%g1, %%g0, %%sys_tick_cmpr\n");
!!#     IJ_printf  ("diag.j", 176, th0,"!Initializing Trap Stack \n");
!!#     for (i = 1; i <=6; i++) {
!!#         IJ_printf  ("diag.j", 178, th0,"\twrpr 0x%d, %%tl\n", i);
!!#         IJ_printf  ("diag.j", 179, th0,"\twrpr 0x1, %%tt\n");
!!#         IJ_printf  ("diag.j", 180, th0,"\twrpr 0x1, %%tpc\n");
!!#         IJ_printf  ("diag.j", 181, th0,"\twrpr 0x1, %%tnpc\n");
!!#         IJ_printf  ("diag.j", 182, th0,"\twrpr 0x1, %%tstate\n");
!!#         IJ_printf  ("diag.j", 183, th0,"\twrhpr 0x1, %%htstate\n");
!!#     }
!!#     IJ_printf  ("diag.j", 185, th0,"\twrpr 0x0, %%tl\n");
!!#     IJ_printf  ("diag.j", 186, th0,"\tta T_CHANGE_NONHPRIV \n");
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#     int i;
!!#     IJ_printf  ("diag.j", 191, th0,"\n\n.global user_data_start\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 193, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
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
!!#         IJ_generate ("diag.j", 236, th0, $2);
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
!!#         IJ_printf("diag.j", 281, th0, "reduce_priv_level_%d:\n", label);
!!#         IJ_set_ropr_fld("diag.j", 282, Ro_tl, Ft_Simm13, "{0..2}");
!!#         IJ_generate_from_token("diag.j", 283,1, th0, Ro_tl, tWRPR_TL_I, -1);;
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 285,1, th0, ijdefault, tCHANGE_NONHPRIV, -1);;
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 287,1, th0, ijdefault, tCHANGE_NONPRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_randtl: tWRPR_TL_I %ropr  Ro_tl
!!#     {
!!#         IJ_printf("diag.j", 295, th0, "change_to_randtl_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_set_ropr_fld("diag.j", 297, Ro_tl, Ft_Simm13, "{3..5}");
!!#             IJ_generate_from_token("diag.j", 298,1, th0, ijdefault, tCHANGE_HPRIV, -1);;
!!#         } else {
!!#             IJ_set_ropr_fld("diag.j", 300, Ro_tl, Ft_Simm13, "{0..2}");
!!#             IJ_generate_from_token("diag.j", 301,1, th0, ijdefault, tCHANGE_PRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_tl1 : tCHANGE_TO_TL1
!!#     {
!!#         IJ_printf("diag.j", 309, th0, "change_to_tl1_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 311, th0, "\tta T_CHANGE_HPRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 313, th0, "\tta T_CHANGE_PRIV\n");
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
!!# splash_cmpr: tWR_STICK_REG_I
!!#     {
!!#         IJ_printf("diag.j", 336, th0, "splash_cmpr_%d:\n", label);
!!#         IJ_set_rvar("diag.j", 337, Rv_rand_60,"64'h8rrrrrrr_rrrrrrrr");
!!#         IJ_set_ropr_fld("diag.j", 338, Ro_cmpr, Ft_Rs1, "{0}");
!!#         IJ_set_ropr_fld("diag.j", 339, Ro_cmpr, Ft_Rs2, "{1}");
!!#         IJ_printf  ("diag.j", 340, th0,"\tnop\n\tmov 1, %%g2\n");
!!#         IJ_printf  ("diag.j", 341, th0,"\tsllx %%g2, 63, %%g2\n");
!!#         IJ_printf  ("diag.j", 342, th0,"\tor %%g1, %%g2, %%g1\n");
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 344,1, th0, Ro_cmpr, tWR_STICK_CMPR_REG_R, tWR_TICK_CMPR_REG_R, -1);;
!!#         } else {
!!#            IJ_printf("diag.j", 346, th0, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
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
!!#         IJ_printf("diag.j", 384, th0, "\totherw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      } else {
!!#         IJ_printf("diag.j", 386, th0, "\tinvalw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!#         IJ_printf("diag.j", 471, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 472,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 473,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 474, th0, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 478, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 479,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 481,1, th0, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 483, th0, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 485, th0, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 490, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 491,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 493, th0, "\tilltrap\n");
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 495,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 497,1, th0, ijdefault, tFSQRTd, tLDQF_R, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 504, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 505,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 509, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 510,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 514, th0, "DS_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 515, th0, "\tnop\n\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 516, th0, "\tjmp %%g2\n");
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

