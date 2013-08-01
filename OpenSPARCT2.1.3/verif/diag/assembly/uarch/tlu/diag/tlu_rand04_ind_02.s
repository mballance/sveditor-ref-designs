/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_02.s
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
	mov 0x30, %r14
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
	mov 0x31, %r14
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
	mov 0xb2, %r14
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
	.word 0x8198295e  ! 1: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095e, %hpstate
	.word 0x93d02034  ! 2: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x81982f1d  ! 3: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1d, %hpstate
	.word 0xb4d68013  ! 4: UMULcc_R	umulcc 	%r26, %r19, %r26
	.word 0x90ae0002  ! 5: ANDNcc_R	andncc 	%r24, %r2, %r8
	.word 0x8751c000  ! 6: RDPR_TL	rdpr	%tl, %r3
change_to_randtl_0:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 7: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa1902008  ! 8: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x34800001  ! 9: BG	bg,a	<label_0x1>
splash_lsu_1:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 10: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90204e  ! 11: WRPR_PSTATE_I	wrpr	%r0, 0x004e, %pstate
splash_lsu_2:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 12: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99902003  ! 14: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xa1902006  ! 15: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x81982357  ! 16: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0357, %hpstate
reduce_priv_level_3:
	.word 0x8f902001  ! 18: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89858008  ! 17: WRTICK_R	wr	%r22, %r8, %tick
	.word 0x879022f2  ! 18: WRPR_TT_I	wrpr	%r0, 0x02f2, %tt
	.word 0xc697e030  ! 19: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r3
	.word 0x9f802001  ! 20: SIR	sir	0x0001
	.word 0x87902138  ! 21: WRPR_TT_I	wrpr	%r0, 0x0138, %tt
	.word 0x8198219f  ! 22: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019f, %hpstate
	.word 0x86dc4005  ! 23: SMULcc_R	smulcc 	%r17, %r5, %r3
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 24: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_4:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 25: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902ecb  ! 26: WRPR_PSTATE_I	wrpr	%r0, 0x0ecb, %pstate
	.word 0x8198298e  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098e, %hpstate
	.word 0x879021ba  ! 28: WRPR_TT_I	wrpr	%r0, 0x01ba, %tt
	.word 0x91d02030  ! 29: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x87902276  ! 30: WRPR_TT_I	wrpr	%r0, 0x0276, %tt
	.word 0xc69fc020  ! 31: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0x93902003  ! 32: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902004  ! 33: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93d02034  ! 34: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x93902004  ! 35: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_5:
	.word 0x20800001  ! 37: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 36: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87902232  ! 37: WRPR_TT_I	wrpr	%r0, 0x0232, %tt
	.word 0x81982e9c  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9c, %hpstate
	.word 0xa9514000  ! 39: RDPR_TBA	rdpr	%tba, %r20
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 40: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9882c00b  ! 41: ADDcc_R	addcc 	%r11, %r11, %r12
	ta	T_CHANGE_HPRIV	! macro
splash_htba_6:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 43: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x95540000  ! 44: RDPR_GL	rdpr	%-, %r10
	.word 0x83d02033  ! 45: Tcc_I	te	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd4c804a0  ! 47: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0xaf50c000  ! 48: RDPR_TT	rdpr	%tt, %r23
	.word 0x8d90288c  ! 49: WRPR_PSTATE_I	wrpr	%r0, 0x088c, %pstate
DS_7:
	.word 0x22800001  ! 51: BE	be,a	<label_0x1>
	.word 0x20800001  ! 51: BN	bn,a	<label_0x1>
	.word 0x97a00540  ! 51: FSQRTd	fsqrt	
	.word 0x8ba6c829  ! 50: FADDs	fadds	%f27, %f9, %f5
splash_htba_8:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 51: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02031  ! 52: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa3a14d34  ! 53: FsMULd	fsmuld	%f5, %f20, %f48
	.word 0x38700001  ! 54: BPGU	<illegal instruction>
	.word 0x8d802004  ! 55: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90281d  ! 56: WRPR_PSTATE_I	wrpr	%r0, 0x081d, %pstate
splash_htba_9:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 57: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa7b44fe0  ! 58: FONES	fones	%f19
change_to_randtl_10:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 59: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x28700001  ! 60: BPLEU	<illegal instruction>
	.word 0xa1902007  ! 61: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x879021bc  ! 62: WRPR_TT_I	wrpr	%r0, 0x01bc, %tt
	.word 0xa3514000  ! 63: RDPR_TBA	rdpr	%tba, %r17
DS_11:
	.word 0x22800001  ! 65: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 64: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902003  ! 65: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902006  ! 66: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x83d02032  ! 67: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x93d02031  ! 68: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xe3e7c020  ! 69: CASA_I	casa	[%r31] 0x 1, %r0, %r17
	.word 0xb7a049c3  ! 70: FDIVd	fdivd	%f32, %f34, %f58
	.word 0x91d02034  ! 71: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa5508000  ! 72: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0xb3a089f3  ! 73: FDIVq	dis not found

	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 74: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902449  ! 75: WRPR_PSTATE_I	wrpr	%r0, 0x0449, %pstate
	.word 0xf24fe001  ! 76: LDSB_I	ldsb	[%r31 + 0x0001], %r25
	.word 0xaf50c000  ! 77: RDPR_TT	rdpr	%tt, %r23
	.word 0x91d02033  ! 78: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87902039  ! 79: WRPR_TT_I	wrpr	%r0, 0x0039, %tt
	.word 0xa084000d  ! 80: ADDcc_R	addcc 	%r16, %r13, %r16
	.word 0xe097e000  ! 81: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 82: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902007  ! 85: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xb7a049f7  ! 86: FDIVq	dis not found

	.word 0x81982d4e  ! 87: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4e, %hpstate
	.word 0x819829cc  ! 88: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cc, %hpstate
	.word 0x819820d4  ! 89: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d4, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 90: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 91: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902002  ! 92: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa190200e  ! 93: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x946d8014  ! 94: UDIVX_R	udivx 	%r22, %r20, %r10
	.word 0x91d02035  ! 95: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902004  ! 96: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902ece  ! 97: WRPR_PSTATE_I	wrpr	%r0, 0x0ece, %pstate
	.word 0xab540000  ! 98: RDPR_GL	rdpr	%-, %r21
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 99: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 100: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_12:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 101: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_13:
	.word 0x20800001  ! 103: BN	bn,a	<label_0x1>
	pdist %f6, %f2, %f6
	.word 0x9bb10304  ! 102: ALLIGNADDRESS	alignaddr	%r4, %r4, %r13
	.word 0x8d802000  ! 103: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8ea80009  ! 104: ANDNcc_R	andncc 	%r0, %r9, %r7
	.word 0x95540000  ! 105: RDPR_GL	rdpr	%-, %r10
	.word 0x9f802001  ! 106: SIR	sir	0x0001
	.word 0x8d902cda  ! 107: WRPR_PSTATE_I	wrpr	%r0, 0x0cda, %pstate
	.word 0x8d802000  ! 108: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd407c000  ! 109: LDUW_R	lduw	[%r31 + %r0], %r10
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd44fc000  ! 111: LDSB_R	ldsb	[%r31 + %r0], %r10
change_to_randtl_14:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 112: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x81982586  ! 113: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0586, %hpstate
	.word 0x91540000  ! 114: RDPR_GL	rdpr	%-, %r8
	.word 0x90d80008  ! 115: SMULcc_R	smulcc 	%r0, %r8, %r8
	.word 0xb6f92001  ! 116: SDIVcc_I	sdivcc 	%r4, 0x0001, %r27
	.word 0xa9b44fe6  ! 117: FONES	fones	%f20
	.word 0x87902353  ! 118: WRPR_TT_I	wrpr	%r0, 0x0353, %tt
	.word 0x819823cf  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03cf, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 120: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x85508000  ! 121: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x8d902859  ! 122: WRPR_PSTATE_I	wrpr	%r0, 0x0859, %pstate
change_to_randtl_15:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 123: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 124: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 125: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83d02032  ! 126: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_lsu_16:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 127: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc4d7e020  ! 128: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r2
	.word 0xb3508000  ! 129: RDPR_TSTATE	rdpr	%tstate, %r25
change_to_tl1_17:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02030  ! 131: Tcc_I	ta	icc_or_xcc, %r0 + 48
change_to_randtl_18:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 132: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xf2900e40  ! 133: LDUHA_R	lduha	[%r0, %r0] 0x72, %r25
	.word 0x87902199  ! 134: WRPR_TT_I	wrpr	%r0, 0x0199, %tt
	.word 0x8d902c09  ! 135: WRPR_PSTATE_I	wrpr	%r0, 0x0c09, %pstate
	.word 0x81982d07  ! 136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d07, %hpstate
splash_lsu_19:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 137: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 138: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 139: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 140: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93d02030  ! 141: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x93902007  ! 142: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93d02032  ! 143: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d540000  ! 144: RDPR_GL	rdpr	%-, %r6
	ta	T_CHANGE_TO_TL0	! macro
change_to_randtl_20:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 146: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8da64dd7  ! 147: FdMULq	fdmulq	
	.word 0xcc8008a0  ! 148: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8d902c55  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x0c55, %pstate
	.word 0x8d902ed2  ! 150: WRPR_PSTATE_I	wrpr	%r0, 0x0ed2, %pstate
	.word 0x93902005  ! 151: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902002  ! 153: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x819829cc  ! 155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cc, %hpstate
	.word 0x91d02033  ! 156: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xcc800b40  ! 157: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r6
	.word 0xa4ab4005  ! 158: ANDNcc_R	andncc 	%r13, %r5, %r18
	.word 0x8790218d  ! 159: WRPR_TT_I	wrpr	%r0, 0x018d, %tt
	.word 0xa1902002  ! 160: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x83d02032  ! 161: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xa190200f  ! 162: WRPR_GL_I	wrpr	%r0, 0x000f, %-
change_to_tl1_21:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xe477c005  ! 164: STX_R	stx	%r18, [%r31 + %r5]
	.word 0x9f802001  ! 165: SIR	sir	0x0001
	.word 0x87902199  ! 166: WRPR_TT_I	wrpr	%r0, 0x0199, %tt
	.word 0xa190200c  ! 167: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93d02032  ! 168: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x87902308  ! 169: WRPR_TT_I	wrpr	%r0, 0x0308, %tt
	.word 0x91d02030  ! 170: Tcc_I	ta	icc_or_xcc, %r0 + 48
change_to_tl1_22:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1902009  ! 172: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87802004  ! 173: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8780201c  ! 174: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8d51c000  ! 175: RDPR_TL	rdpr	%tl, %r6
	.word 0x91d02031  ! 176: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xccd7e020  ! 177: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r6
	.word 0x38800001  ! 178: BGU	bgu,a	<label_0x1>
	.word 0xa682400a  ! 179: ADDcc_R	addcc 	%r9, %r10, %r19
	.word 0x879023ff  ! 180: WRPR_TT_I	wrpr	%r0, 0x03ff, %tt
splash_lsu_23:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 181: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 182: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87902201  ! 183: WRPR_TT_I	wrpr	%r0, 0x0201, %tt
	.word 0xe68008a0  ! 184: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x93d02034  ! 185: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_lsu_24:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 186: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8885e001  ! 187: ADDcc_I	addcc 	%r23, 0x0001, %r4
	.word 0x8790221e  ! 188: WRPR_TT_I	wrpr	%r0, 0x021e, %tt
	.word 0x8d902450  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x0450, %pstate
	.word 0x81982b04  ! 190: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b04, %hpstate
	.word 0xa1902008  ! 191: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8afec00c  ! 192: SDIVcc_R	sdivcc 	%r27, %r12, %r5
reduce_priv_level_25:
	.word 0x8f902001  ! 194: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8986401b  ! 193: WRTICK_R	wr	%r25, %r27, %tick
splash_tba_26:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 194: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcb37c01b  ! 195: STQF_R	-	%f5, [%r27, %r31]
	.word 0x99902002  ! 196: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x91d02030  ! 197: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d902a88  ! 198: WRPR_PSTATE_I	wrpr	%r0, 0x0a88, %pstate
splash_tba_27:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 199: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02030  ! 200: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x2a700001  ! 201: BPCS	<illegal instruction>
	.word 0x879021dc  ! 202: WRPR_TT_I	wrpr	%r0, 0x01dc, %tt
	.word 0x87802089  ! 203: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9ba00557  ! 204: FSQRTd	fsqrt	
	.word 0x83d02030  ! 205: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xda900e80  ! 206: LDUHA_R	lduha	[%r0, %r0] 0x74, %r13
	.word 0x8d504000  ! 207: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0x93902001  ! 208: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982edc  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edc, %hpstate
	.word 0x8d902e18  ! 210: WRPR_PSTATE_I	wrpr	%r0, 0x0e18, %pstate
	.word 0x879020f7  ! 211: WRPR_TT_I	wrpr	%r0, 0x00f7, %tt
	.word 0x87508000  ! 212: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x8780201c  ! 213: WRASI_I	wr	%r0, 0x001c, %asi
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 214: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_28:
	.word 0x32800001  ! 216: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 215: SAVE_R	save	%r31, %r0, %r31
	.word 0x879021a9  ! 216: WRPR_TT_I	wrpr	%r0, 0x01a9, %tt
	.word 0x81982fd5  ! 217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd5, %hpstate
	.word 0x22700001  ! 218: BPE	<illegal instruction>
	.word 0x97508000  ! 219: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0x93902000  ! 220: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93d02031  ! 221: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8d902249  ! 222: WRPR_PSTATE_I	wrpr	%r0, 0x0249, %pstate
	.word 0xa1902001  ! 223: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8a814012  ! 224: ADDcc_R	addcc 	%r5, %r18, %r5
	.word 0x83508000  ! 225: RDPR_TSTATE	rdpr	%tstate, %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x88c26001  ! 227: ADDCcc_I	addccc 	%r9, 0x0001, %r4
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 228: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8da28dda  ! 229: FdMULq	fdmulq	
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 230: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 231: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xccffc03a  ! 232: SWAPA_R	swapa	%r6, [%r31 + %r26] 0x01
	.word 0xa190200e  ! 233: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d902004  ! 234: WRPR_PSTATE_I	wrpr	%r0, 0x0004, %pstate
	.word 0x8d802000  ! 235: WRFPRS_I	wr	%r0, 0x0000, %fprs
change_to_tl1_29:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
reduce_priv_level_30:
	.word 0x8f902000  ! 238: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 237: SIAM	siam	1
	.word 0x91d02030  ! 238: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x879021b4  ! 239: WRPR_TT_I	wrpr	%r0, 0x01b4, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x99902002  ! 241: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 242: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc7fe001  ! 243: SWAP_I	swap	%r6, [%r31 + 0x0001]
DS_31:
	.word 0x34800001  ! 245: BG	bg,a	<label_0x1>
	pdist %f4, %f6, %f14
	.word 0x8bb58311  ! 244: ALLIGNADDRESS	alignaddr	%r22, %r17, %r5
	.word 0x8b508000  ! 245: RDPR_TSTATE	rdpr	%tstate, %r5
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 246: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_32:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 247: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x81982856  ! 248: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0856, %hpstate
	.word 0x87802080  ! 249: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02032  ! 250: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x89a01a6b  ! 251: FqTOi	fqtoi	
	.word 0x22800001  ! 252: BE	be,a	<label_0x1>
	.word 0xc8c7e030  ! 253: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r4
	.word 0x85540000  ! 254: RDPR_GL	rdpr	%-, %r2
	.word 0x9b514000  ! 255: RDPR_TBA	rdpr	%tba, %r13
	.word 0xda9fc020  ! 256: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	.word 0xa1902005  ! 257: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8281e001  ! 258: ADDcc_I	addcc 	%r7, 0x0001, %r1
	.word 0x8d802000  ! 259: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902007  ! 260: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x91d02030  ! 261: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8198240f  ! 262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040f, %hpstate
	.word 0xa5508000  ! 263: RDPR_TSTATE	rdpr	%tstate, %r18
DS_33:
	.word 0x20800001  ! 265: BN	bn,a	<label_0x1>
	.word 0xef352001  ! 265: STQF_I	-	%f23, [0x0001, %r20]
	normalw
	.word 0xa5458000  ! 264: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x24800001  ! 265: BLE	ble,a	<label_0x1>
	.word 0xa190200c  ! 266: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe537c00b  ! 267: STQF_R	-	%f18, [%r11, %r31]
	.word 0x93902006  ! 268: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982fd4  ! 269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd4, %hpstate
	.word 0x8d90220e  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
	.word 0x8751c000  ! 271: RDPR_TL	rdpr	%tl, %r3
change_to_tl1_34:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9a84e001  ! 273: ADDcc_I	addcc 	%r19, 0x0001, %r13
	.word 0x99a000d7  ! 274: FNEGd	fnegd	%f54, %f12
	.word 0x93902006  ! 275: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d90200b  ! 276: WRPR_PSTATE_I	wrpr	%r0, 0x000b, %pstate
	.word 0xaea9000a  ! 277: ANDNcc_R	andncc 	%r4, %r10, %r23
	.word 0x8fa6c9f5  ! 278: FDIVq	dis not found

	.word 0x96d88017  ! 279: SMULcc_R	smulcc 	%r2, %r23, %r11
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 280: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 281: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x82d4c01a  ! 282: UMULcc_R	umulcc 	%r19, %r26, %r1
	.word 0x8d9024c1  ! 283: WRPR_PSTATE_I	wrpr	%r0, 0x04c1, %pstate
	.word 0x8d902c9c  ! 284: WRPR_PSTATE_I	wrpr	%r0, 0x0c9c, %pstate
	.word 0x87902318  ! 285: WRPR_TT_I	wrpr	%r0, 0x0318, %tt
	.word 0x93902002  ! 286: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x879023ad  ! 287: WRPR_TT_I	wrpr	%r0, 0x03ad, %tt
DS_35:
	.word 0x22800001  ! 289: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 288: SAVE_R	save	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
DS_36:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 290: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8d9026d1  ! 291: WRPR_PSTATE_I	wrpr	%r0, 0x06d1, %pstate
	.word 0x81982c95  ! 292: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c95, %hpstate
	.word 0x86a9c001  ! 293: ANDNcc_R	andncc 	%r7, %r1, %r3
	.word 0xa190200c  ! 294: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x2a700001  ! 295: BPCS	<illegal instruction>
	.word 0x93902005  ! 296: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 297: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 298: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc6c804a0  ! 300: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
	.word 0x95a00544  ! 301: FSQRTd	fsqrt	
	.word 0x98fc0000  ! 302: SDIVcc_R	sdivcc 	%r16, %r0, %r12
	.word 0x8d902a4f  ! 303: WRPR_PSTATE_I	wrpr	%r0, 0x0a4f, %pstate
	.word 0x87902038  ! 304: WRPR_TT_I	wrpr	%r0, 0x0038, %tt
	.word 0x91d02035  ! 305: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd8d004a0  ! 306: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r12
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 307: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902001  ! 308: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xd8d7e020  ! 309: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
	.word 0x8198215c  ! 310: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015c, %hpstate
	.word 0x93902006  ! 311: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
reduce_priv_level_37:
	.word 0x8f902001  ! 313: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89a0196d  ! 312: FqTOd	dis not found

	.word 0x95500000  ! 313: RDPR_TPC	rdpr	%tpc, %r10
	.word 0x93902007  ! 314: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_tba_38:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 315: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200c  ! 316: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x819829dc  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09dc, %hpstate
splash_lsu_39:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 318: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902600  ! 319: WRPR_PSTATE_I	wrpr	%r0, 0x0600, %pstate
	.word 0x89514000  ! 320: RDPR_TBA	rdpr	%tba, %r4
	.word 0x8480c017  ! 321: ADDcc_R	addcc 	%r3, %r23, %r2
	.word 0x89a049f2  ! 322: FDIVq	dis not found

	.word 0xb6828018  ! 323: ADDcc_R	addcc 	%r10, %r24, %r27
	.word 0x30700001  ! 324: BPA	<illegal instruction>
	.word 0x91d02034  ! 325: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa9508000  ! 326: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x93902006  ! 327: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_40:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 328: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91514000  ! 329: RDPR_TBA	rdpr	%tba, %r8
	.word 0x8d802004  ! 330: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9f802001  ! 331: SIR	sir	0x0001
DS_41:
	.word 0x32800001  ! 333: BNE	bne,a	<label_0x1>
	pdist %f18, %f8, %f0
	.word 0x87b4030c  ! 332: ALLIGNADDRESS	alignaddr	%r16, %r12, %r3
change_to_tl1_42:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_43:
	.word 0x34800001  ! 335: BG	bg,a	<label_0x1>
	pdist %f20, %f30, %f20
	.word 0xb1b3430a  ! 334: ALLIGNADDRESS	alignaddr	%r13, %r10, %r24
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 335: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982fdf  ! 336: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdf, %hpstate
	.word 0x91d02030  ! 337: Tcc_I	ta	icc_or_xcc, %r0 + 48
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 338: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 339: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982d5e  ! 340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5e, %hpstate
	.word 0x95702001  ! 341: POPC_I	popc	0x0001, %r10
	.word 0x8d508000  ! 342: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0x8d902e5c  ! 343: WRPR_PSTATE_I	wrpr	%r0, 0x0e5c, %pstate
	.word 0x8f508000  ! 344: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0xb080c005  ! 345: ADDcc_R	addcc 	%r3, %r5, %r24
	.word 0x87902152  ! 346: WRPR_TT_I	wrpr	%r0, 0x0152, %tt
	.word 0x8d802000  ! 347: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02031  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x879022ce  ! 349: WRPR_TT_I	wrpr	%r0, 0x02ce, %tt
	.word 0x8ec1a001  ! 350: ADDCcc_I	addccc 	%r6, 0x0001, %r7
	.word 0xce7fe001  ! 351: SWAP_I	swap	%r7, [%r31 + 0x0001]
	.word 0x2e800001  ! 352: BVS	bvs,a	<label_0x1>
	.word 0x81982c1d  ! 353: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1d, %hpstate
	.word 0x879021a2  ! 354: WRPR_TT_I	wrpr	%r0, 0x01a2, %tt
	.word 0x97a28dc1  ! 355: FdMULq	fdmulq	
splash_tba_44:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 356: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 357: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 358: WRPR_GL_I	wrpr	%r0, 0x000f, %-
DS_45:
	.word 0x20800001  ! 360: BN	bn,a	<label_0x1>
	allclean
	.word 0x85b18311  ! 359: ALLIGNADDRESS	alignaddr	%r6, %r17, %r2
	.word 0x91d02035  ! 360: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8198285c  ! 361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085c, %hpstate
	.word 0x97702001  ! 362: POPC_I	popc	0x0001, %r11
	.word 0x8790218e  ! 363: WRPR_TT_I	wrpr	%r0, 0x018e, %tt
	.word 0x819828cd  ! 364: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cd, %hpstate
splash_tba_46:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 365: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x99902001  ! 366: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8d802000  ! 367: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02035  ! 368: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02035  ! 369: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_htba_47:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 370: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902007  ! 371: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd69fe001  ! 372: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
DS_48:
	.word 0x20800001  ! 374: BN	bn,a	<label_0x1>
	allclean
	.word 0x89b5c302  ! 373: ALLIGNADDRESS	alignaddr	%r23, %r2, %r4
	.word 0x99514000  ! 374: RDPR_TBA	rdpr	%tba, %r12
	.word 0x8790210d  ! 375: WRPR_TT_I	wrpr	%r0, 0x010d, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x85a2c9a2  ! 377: FDIVs	fdivs	%f11, %f2, %f2
	.word 0x83d02031  ! 378: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x9f802001  ! 379: SIR	sir	0x0001
	.word 0xc48008a0  ! 380: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x81982844  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0844, %hpstate
change_to_tl1_49:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02031  ! 383: Tcc_I	ta	icc_or_xcc, %r0 + 49
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8ba00570  ! 385: FSQRTq	fsqrt	
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 386: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83a1cd21  ! 387: FsMULd	fsmuld	%f7, %f32, %f32
DS_50:
	.word 0x20800001  ! 389: BN	bn,a	<label_0x1>
	.word 0xe9308003  ! 389: STQF_R	-	%f20, [%r3, %r2]
	normalw
	.word 0x81458000  ! 388: RD_SOFTINT_REG	stbar
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 389: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 390: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200f  ! 391: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d9024d6  ! 392: WRPR_PSTATE_I	wrpr	%r0, 0x04d6, %pstate
	.word 0x83d02035  ! 393: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x819829df  ! 394: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09df, %hpstate
	.word 0xc0800b20  ! 395: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r0
	.word 0x87902230  ! 396: WRPR_TT_I	wrpr	%r0, 0x0230, %tt
	.word 0x93902002  ! 397: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d802000  ! 398: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90208d  ! 399: WRPR_PSTATE_I	wrpr	%r0, 0x008d, %pstate
	.word 0x8790237f  ! 400: WRPR_TT_I	wrpr	%r0, 0x037f, %tt
	.word 0xaed02001  ! 401: UMULcc_I	umulcc 	%r0, 0x0001, %r23
	.word 0x81982fcf  ! 402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcf, %hpstate
	.word 0x819825ce  ! 403: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05ce, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xef37e001  ! 405: STQF_I	-	%f23, [0x0001, %r31]
	.word 0xee1fe001  ! 406: LDD_I	ldd	[%r31 + 0x0001], %r23
	.word 0x93540000  ! 407: RDPR_GL	rdpr	%-, %r9
	.word 0x8780201c  ! 408: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x93902005  ! 409: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd27fe001  ! 410: SWAP_I	swap	%r9, [%r31 + 0x0001]
splash_lsu_51:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 411: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902307  ! 412: WRPR_TT_I	wrpr	%r0, 0x0307, %tt
	.word 0xa1902002  ! 413: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa8d24000  ! 414: UMULcc_R	umulcc 	%r9, %r0, %r20
	.word 0x93902003  ! 415: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_52:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 416: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902001  ! 417: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902002  ! 418: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 419: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 420: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8ba00541  ! 421: FSQRTd	fsqrt	
	.word 0x8790210d  ! 422: WRPR_TT_I	wrpr	%r0, 0x010d, %tt
	.word 0x8e682001  ! 423: UDIVX_I	udivx 	%r0, 0x0001, %r7
	.word 0x8d902c4b  ! 424: WRPR_PSTATE_I	wrpr	%r0, 0x0c4b, %pstate
	.word 0x91d02031  ! 425: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902004  ! 426: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8790226e  ! 427: WRPR_TT_I	wrpr	%r0, 0x026e, %tt
	.word 0x81982cd7  ! 428: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd7, %hpstate
splash_htba_53:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 429: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902003  ! 430: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x81982b8d  ! 431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8d, %hpstate
	.word 0xaba109a4  ! 432: FDIVs	fdivs	%f4, %f4, %f21
DS_54:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 433: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
reduce_priv_level_55:
	.word 0x8f902002  ! 435: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 434: SIAM	siam	1
DS_56:
	.word 0x22800001  ! 436: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 435: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02031  ! 436: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902000  ! 437: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879021a3  ! 438: WRPR_TT_I	wrpr	%r0, 0x01a3, %tt
	.word 0x81982394  ! 439: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0394, %hpstate
	.word 0x87902129  ! 440: WRPR_TT_I	wrpr	%r0, 0x0129, %tt
	.word 0xac4a800c  ! 441: MULX_R	mulx 	%r10, %r12, %r22
	.word 0x9ac5e001  ! 442: ADDCcc_I	addccc 	%r23, 0x0001, %r13
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 443: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879022bc  ! 444: WRPR_TT_I	wrpr	%r0, 0x02bc, %tt
	.word 0x8d9022da  ! 445: WRPR_PSTATE_I	wrpr	%r0, 0x02da, %pstate
	.word 0x93540000  ! 446: RDPR_GL	rdpr	%-, %r9
	.word 0xa1902009  ! 447: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x97a009d5  ! 448: FDIVd	fdivd	%f0, %f52, %f42
	.word 0x95508000  ! 449: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x91d02030  ! 450: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xd41fc000  ! 451: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xa1902009  ! 452: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8ba01a69  ! 453: FqTOi	fqtoi	
	.word 0x93902006  ! 454: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_tba_57:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 455: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802001  ! 456: SIR	sir	0x0001
	.word 0x8198269e  ! 457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069e, %hpstate
	.word 0x9484a001  ! 458: ADDcc_I	addcc 	%r18, 0x0001, %r10
	.word 0x85a1c9b6  ! 459: FDIVs	fdivs	%f7, %f22, %f2
	.word 0xc4cfe000  ! 460: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r2
	.word 0xa190200c  ! 461: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d902681  ! 462: WRPR_PSTATE_I	wrpr	%r0, 0x0681, %pstate
	.word 0xa150c000  ! 463: RDPR_TT	rdpr	%tt, %r16
change_to_randtl_58:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 464: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8c6ce001  ! 465: UDIVX_I	udivx 	%r19, 0x0001, %r6
	.word 0x91d02035  ! 466: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 467: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790216a  ! 468: WRPR_TT_I	wrpr	%r0, 0x016a, %tt
	.word 0x8d902650  ! 469: WRPR_PSTATE_I	wrpr	%r0, 0x0650, %pstate
splash_tba_59:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 470: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902001  ! 471: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 472: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982854  ! 473: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0854, %hpstate
splash_lsu_60:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 474: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 475: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x96d22001  ! 476: UMULcc_I	umulcc 	%r8, 0x0001, %r11
	.word 0x8950c000  ! 477: RDPR_TT	rdpr	%tt, %r4
	.word 0x95540000  ! 478: RDPR_GL	rdpr	%-, %r10
	.word 0x81982605  ! 479: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0605, %hpstate
splash_lsu_61:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 480: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd5e7c036  ! 481: CASA_I	casa	[%r31] 0x 1, %r22, %r10
	.word 0x9b508000  ! 482: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0x8d902a5c  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x0a5c, %pstate
	.word 0x91d02033  ! 484: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x83d02032  ! 485: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xacd52001  ! 486: UMULcc_I	umulcc 	%r20, 0x0001, %r22
	.word 0x81982b96  ! 487: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b96, %hpstate
	.word 0xec8008a0  ! 488: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0xecc7e030  ! 489: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r22
	.word 0x87902356  ! 490: WRPR_TT_I	wrpr	%r0, 0x0356, %tt
	.word 0x91d02031  ! 491: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d902698  ! 492: WRPR_PSTATE_I	wrpr	%r0, 0x0698, %pstate
	.word 0x8ba5c9b1  ! 493: FDIVs	fdivs	%f23, %f17, %f5
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 494: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8c4e8017  ! 495: MULX_R	mulx 	%r26, %r23, %r6
	.word 0x8d902e4c  ! 496: WRPR_PSTATE_I	wrpr	%r0, 0x0e4c, %pstate
	.word 0x93902000  ! 497: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902cdd  ! 498: WRPR_PSTATE_I	wrpr	%r0, 0x0cdd, %pstate
	.word 0x8d902e8a  ! 499: WRPR_PSTATE_I	wrpr	%r0, 0x0e8a, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902242  ! 501: WRPR_PSTATE_I	wrpr	%r0, 0x0242, %pstate
	.word 0xcc800c20  ! 502: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r6
	.word 0x8d902287  ! 503: WRPR_PSTATE_I	wrpr	%r0, 0x0287, %pstate
	.word 0x85504000  ! 504: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x8790219f  ! 505: WRPR_TT_I	wrpr	%r0, 0x019f, %tt
	.word 0x90ac4001  ! 506: ANDNcc_R	andncc 	%r17, %r1, %r8
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 507: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902005  ! 508: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x99902004  ! 509: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x82ac400a  ! 510: ANDNcc_R	andncc 	%r17, %r10, %r1
	.word 0x93902004  ! 511: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x20700001  ! 512: BPN	<illegal instruction>
change_to_tl1_62:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
splash_lsu_63:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 514: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 515: SIR	sir	0x0001
	.word 0x91d02035  ! 516: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_randtl_64:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 517: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1902003  ! 518: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 519: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 520: WRPR_GL_I	wrpr	%r0, 0x000a, %-
DS_65:
	.word 0x20800001  ! 522: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 522: BNE	bne,a	<label_0x1>
	.word 0xdb120015  ! 522: LDQF_R	-	[%r8, %r21], %f13
	.word 0xaba64834  ! 521: FADDs	fadds	%f25, %f20, %f21
	ta	T_CHANGE_PRIV	! macro
splash_lsu_66:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 523: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 524: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xada209b3  ! 525: FDIVs	fdivs	%f8, %f19, %f22
	.word 0xa1902000  ! 526: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_tba_67:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 527: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8198241f  ! 528: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041f, %hpstate
	.word 0x93902000  ! 529: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982c46  ! 530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c46, %hpstate
	.word 0xa1902008  ! 531: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_lsu_68:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 532: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902805  ! 533: WRPR_PSTATE_I	wrpr	%r0, 0x0805, %pstate
splash_lsu_69:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 534: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
reduce_priv_level_70:
	.word 0x8f902001  ! 536: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 535: SIAM	siam	1
	.word 0x8d902e87  ! 536: WRPR_PSTATE_I	wrpr	%r0, 0x0e87, %pstate
	.word 0x91d02032  ! 537: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xb5702001  ! 538: POPC_I	popc	0x0001, %r26
	.word 0xf48fe010  ! 539: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r26
	.word 0x22700001  ! 540: BPE	<illegal instruction>
	.word 0x30700001  ! 541: BPA	<illegal instruction>
	.word 0x81982987  ! 542: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0987, %hpstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8caa4002  ! 544: ANDNcc_R	andncc 	%r9, %r2, %r6
splash_tba_71:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 545: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xaf702001  ! 546: POPC_I	popc	0x0001, %r23
	.word 0x87902228  ! 547: WRPR_TT_I	wrpr	%r0, 0x0228, %tt
	.word 0x86844015  ! 548: ADDcc_R	addcc 	%r17, %r21, %r3
	.word 0x99902005  ! 549: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x87902072  ! 550: WRPR_TT_I	wrpr	%r0, 0x0072, %tt
	.word 0x93902005  ! 551: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 552: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8da189c9  ! 553: FDIVd	fdivd	%f6, %f40, %f6
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 554: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982b97  ! 555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b97, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa7508000  ! 557: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0xe6900e80  ! 558: LDUHA_R	lduha	[%r0, %r0] 0x74, %r19
	.word 0x93902000  ! 559: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x83d02033  ! 560: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x2c800001  ! 561: BNEG	bneg,a	<label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 562: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 563: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 564: SIR	sir	0x0001
	.word 0xa6d34009  ! 565: UMULcc_R	umulcc 	%r13, %r9, %r19
	.word 0x94d2e001  ! 566: UMULcc_I	umulcc 	%r11, 0x0001, %r10
	.word 0x8d902805  ! 567: WRPR_PSTATE_I	wrpr	%r0, 0x0805, %pstate
	.word 0xd4bfc029  ! 568: STDA_R	stda	%r10, [%r31 + %r9] 0x01
	.word 0x9f802001  ! 569: SIR	sir	0x0001
	.word 0xd4d804a0  ! 570: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x93902001  ! 571: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8950c000  ! 572: RDPR_TT	rdpr	%tt, %r4
	.word 0x81982295  ! 573: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0295, %hpstate
reduce_priv_level_72:
	.word 0x8f902000  ! 575: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1830000  ! 574: WR_STICK_REG_R	wr	%r12, %r0, %-
	.word 0x91d02035  ! 575: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 576: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc87fe001  ! 577: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0xa190200a  ! 578: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x84d2000d  ! 579: UMULcc_R	umulcc 	%r8, %r13, %r2
	.word 0x81982854  ! 580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0854, %hpstate
	.word 0x879020ac  ! 581: WRPR_TT_I	wrpr	%r0, 0x00ac, %tt
	.word 0x93902002  ! 582: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x98836001  ! 583: ADDcc_I	addcc 	%r13, 0x0001, %r12
	.word 0x87902076  ! 584: WRPR_TT_I	wrpr	%r0, 0x0076, %tt
	.word 0x89a189b6  ! 585: FDIVs	fdivs	%f6, %f22, %f4
	.word 0x3c800001  ! 586: BPOS	bpos,a	<label_0x1>
	.word 0x93902005  ! 587: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc8d80e80  ! 588: LDXA_R	ldxa	[%r0, %r0] 0x74, %r4
	.word 0x88d18007  ! 589: UMULcc_R	umulcc 	%r6, %r7, %r4
DS_73:
	.word 0x20800001  ! 591: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 591: BNE	bne,a	<label_0x1>
	.word 0xc515c005  ! 591: LDQF_R	-	[%r23, %r5], %f2
	.word 0x8da2482d  ! 590: FADDs	fadds	%f9, %f13, %f6
	.word 0x93d02031  ! 591: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x91a00566  ! 592: FSQRTq	fsqrt	
	.word 0x8d902217  ! 593: WRPR_PSTATE_I	wrpr	%r0, 0x0217, %pstate
	.word 0xa4c6e001  ! 594: ADDCcc_I	addccc 	%r27, 0x0001, %r18
DS_74:
	.word 0x32800001  ! 596: BNE	bne,a	<label_0x1>
	pdist %f28, %f20, %f22
	.word 0x83b24309  ! 595: ALLIGNADDRESS	alignaddr	%r9, %r9, %r1
	.word 0x81982195  ! 596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0195, %hpstate
	.word 0x8d902c44  ! 597: WRPR_PSTATE_I	wrpr	%r0, 0x0c44, %pstate
	.word 0xc3e7c029  ! 598: CASA_I	casa	[%r31] 0x 1, %r9, %r1
	.word 0x87802080  ! 599: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93902004  ! 600: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d802000  ! 601: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902002  ! 602: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902002  ! 603: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xc3e7c029  ! 604: CASA_I	casa	[%r31] 0x 1, %r9, %r1
	.word 0x8d90248b  ! 605: WRPR_PSTATE_I	wrpr	%r0, 0x048b, %pstate
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 606: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 607: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa190200d  ! 608: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa369800a  ! 609: SDIVX_R	sdivx	%r6, %r10, %r17
reduce_priv_level_75:
	.word 0x8f902002  ! 611: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1a0196a  ! 610: FqTOd	dis not found

	.word 0xe0c7e010  ! 611: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r16
	.word 0xe0d004a0  ! 612: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r16
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 613: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_76:
	.word 0x22800001  ! 615: BE	be,a	<label_0x1>
	.word 0xd135a001  ! 615: STQF_I	-	%f8, [0x0001, %r22]
	normalw
	.word 0xa1458000  ! 614: RD_SOFTINT_REG	rd	%softint, %r16
splash_lsu_77:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 615: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97514000  ! 616: RDPR_TBA	rdpr	%tba, %r11
splash_htba_78:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 617: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802000  ! 618: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902003  ! 619: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x91d02031  ! 620: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x97a000cb  ! 621: FNEGd	fnegd	%f42, %f42
	.word 0x879023a8  ! 622: WRPR_TT_I	wrpr	%r0, 0x03a8, %tt
	.word 0x8d902610  ! 623: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	.word 0xa1902001  ! 624: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa9a00547  ! 625: FSQRTd	fsqrt	
	.word 0x81982515  ! 626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0515, %hpstate
	.word 0xe8c7e020  ! 627: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r20
DS_79:
	.word 0x22800001  ! 629: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 628: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d90289b  ! 629: WRPR_PSTATE_I	wrpr	%r0, 0x089b, %pstate
	.word 0x8d802000  ! 630: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99a20d27  ! 631: FsMULd	fsmuld	%f8, %f38, %f12
	.word 0x8790221e  ! 632: WRPR_TT_I	wrpr	%r0, 0x021e, %tt
	.word 0xa485e001  ! 633: ADDcc_I	addcc 	%r23, 0x0001, %r18
	.word 0xa1902005  ! 634: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_80:
	.word 0x32800001  ! 636: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xa3a00540  ! 636: FSQRTd	fsqrt	
	.word 0x9ba14824  ! 635: FADDs	fadds	%f5, %f4, %f13
	.word 0x8d902018  ! 636: WRPR_PSTATE_I	wrpr	%r0, 0x0018, %pstate
	.word 0xda57e001  ! 637: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0x91d02035  ! 638: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 639: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_81:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 640: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 641: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8350c000  ! 642: RDPR_TT	rdpr	%tt, %r1
	.word 0xa1902009  ! 643: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 644: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa64d4008  ! 645: MULX_R	mulx 	%r21, %r8, %r19
	.word 0x879020a3  ! 646: WRPR_TT_I	wrpr	%r0, 0x00a3, %tt
	.word 0xaad84009  ! 647: SMULcc_R	smulcc 	%r1, %r9, %r21
reduce_priv_level_82:
	.word 0x8f902002  ! 649: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x856ea001  ! 648: SDIVX_I	sdivx	%r26, 0x0001, %r2
	.word 0x9f802001  ! 649: SIR	sir	0x0001
	.word 0x86dd4000  ! 650: SMULcc_R	smulcc 	%r21, %r0, %r3
	.word 0x81702001  ! 651: POPC_I	popc	0x0001, %r0
	.word 0x93902007  ! 652: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902005  ! 653: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d02032  ! 654: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 655: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_83:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 656: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790235b  ! 657: WRPR_TT_I	wrpr	%r0, 0x035b, %tt
	.word 0x91d02033  ! 658: Tcc_I	ta	icc_or_xcc, %r0 + 51
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 659: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 660: BPE	<illegal instruction>
	.word 0x83508000  ! 661: RDPR_TSTATE	rdpr	%tstate, %r1
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 662: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb6c1e001  ! 663: ADDCcc_I	addccc 	%r7, 0x0001, %r27
	.word 0x87902355  ! 664: WRPR_TT_I	wrpr	%r0, 0x0355, %tt
	.word 0x8d9026c1  ! 665: WRPR_PSTATE_I	wrpr	%r0, 0x06c1, %pstate
	.word 0xf6c004a0  ! 666: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r27
	.word 0x87902315  ! 667: WRPR_TT_I	wrpr	%r0, 0x0315, %tt
	.word 0xa1902004  ! 668: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93902000  ! 669: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xb751c000  ! 670: RDPR_TL	rdpr	%tl, %r27
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 671: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb7a089f8  ! 672: FDIVq	dis not found

	.word 0xf67fe001  ! 673: SWAP_I	swap	%r27, [%r31 + 0x0001]
	.word 0x81b30feb  ! 674: FONES	fones	%f0
	.word 0x9f802001  ! 675: SIR	sir	0x0001
	.word 0x93902001  ! 676: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02034  ! 677: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902000  ! 678: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x819825d6  ! 679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d6, %hpstate
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 680: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 681: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x91d02032  ! 682: Tcc_I	ta	icc_or_xcc, %r0 + 50
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 683: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_84:
	.word 0x22800001  ! 685: BE	be,a	<label_0x1>
	.word 0xcf366001  ! 685: STQF_I	-	%f7, [0x0001, %r25]
	normalw
	.word 0x8d458000  ! 684: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x89a6cdc4  ! 685: FdMULq	fdmulq	
	.word 0xc85fc000  ! 686: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x8280c009  ! 687: ADDcc_R	addcc 	%r3, %r9, %r1
	.word 0x8fa109d3  ! 688: FDIVd	fdivd	%f4, %f50, %f38
	.word 0xce47c000  ! 689: LDSW_R	ldsw	[%r31 + %r0], %r7
	.word 0x3c700001  ! 690: BPPOS	<illegal instruction>
	.word 0x9f802001  ! 691: SIR	sir	0x0001
	.word 0x8790208d  ! 692: WRPR_TT_I	wrpr	%r0, 0x008d, %tt
splash_htba_85:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 693: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02031  ! 694: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x97a289b9  ! 695: FDIVs	fdivs	%f10, %f25, %f11
	.word 0x879023c9  ! 696: WRPR_TT_I	wrpr	%r0, 0x03c9, %tt
	.word 0x8d802000  ! 697: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd697e000  ! 698: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r11
	.word 0x20700001  ! 699: BPN	<illegal instruction>
	.word 0x8198200f  ! 700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000f, %hpstate
	.word 0xa1902004  ! 701: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa1902006  ! 702: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d902659  ! 703: WRPR_PSTATE_I	wrpr	%r0, 0x0659, %pstate
	.word 0x97514000  ! 704: RDPR_TBA	rdpr	%tba, %r11
	ta	T_CHANGE_TO_TL0	! macro
splash_lsu_86:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 706: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 707: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd6dfe020  ! 708: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r11
	.word 0xd737c019  ! 709: STQF_R	-	%f11, [%r25, %r31]
splash_tba_87:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 710: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902343  ! 711: WRPR_TT_I	wrpr	%r0, 0x0343, %tt
	.word 0x93902003  ! 712: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xada609cd  ! 713: FDIVd	fdivd	%f24, %f44, %f22
splash_htba_88:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 714: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 715: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 716: Tcc_I	ta	icc_or_xcc, %r0 + 48
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 717: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99540000  ! 718: RDPR_GL	rdpr	%-, %r12
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 719: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9024d7  ! 720: WRPR_PSTATE_I	wrpr	%r0, 0x04d7, %pstate
splash_tba_89:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 721: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 722: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83d02035  ! 723: Tcc_I	te	icc_or_xcc, %r0 + 53
DS_90:
	.word 0x20800001  ! 725: BN	bn,a	<label_0x1>
	allclean
	.word 0x8bb14310  ! 724: ALLIGNADDRESS	alignaddr	%r5, %r16, %r5
splash_lsu_91:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 725: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 726: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790205e  ! 727: WRPR_TT_I	wrpr	%r0, 0x005e, %tt
	.word 0x8d902805  ! 728: WRPR_PSTATE_I	wrpr	%r0, 0x0805, %pstate
DS_92:
	.word 0x32800001  ! 730: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 729: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d902a42  ! 730: WRPR_PSTATE_I	wrpr	%r0, 0x0a42, %pstate
	.word 0xa1902009  ! 731: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa7a54d20  ! 733: FsMULd	fsmuld	%f21, %f0, %f50
	.word 0x93902003  ! 734: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902006  ! 735: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x9f802001  ! 736: SIR	sir	0x0001
	.word 0x94498007  ! 737: MULX_R	mulx 	%r6, %r7, %r10
splash_lsu_93:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 738: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 739: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_94:
	.word 0x34800001  ! 741: BG	bg,a	<label_0x1>
	illtrap
	.word 0xd710401b  ! 741: LDQF_R	-	[%r1, %r27], %f11
	.word 0x87a30835  ! 740: FADDs	fadds	%f12, %f21, %f3
DS_95:
	.word 0x20800001  ! 742: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 742: BN	bn,a	<label_0x1>
	.word 0x93a00544  ! 742: FSQRTd	fsqrt	
	.word 0x9ba68836  ! 741: FADDs	fadds	%f26, %f22, %f13
	.word 0x99902003  ! 742: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x93902003  ! 743: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xda8008a0  ! 744: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_htba_96:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 745: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902005  ! 746: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_lsu_97:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 747: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 748: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8198268d  ! 750: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068d, %hpstate
	.word 0x83d02031  ! 751: Tcc_I	te	icc_or_xcc, %r0 + 49
reduce_priv_level_98:
	.word 0x8f902001  ! 753: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 752: SIAM	siam	1
	.word 0x93902002  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x99902000  ! 754: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x93d02032  ! 755: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8790213b  ! 756: WRPR_TT_I	wrpr	%r0, 0x013b, %tt
	.word 0xa1902007  ! 757: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8790212d  ! 758: WRPR_TT_I	wrpr	%r0, 0x012d, %tt
	.word 0x93d02035  ! 759: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x91d02033  ! 760: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x83d02031  ! 761: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x93902000  ! 762: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x83d02032  ! 763: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x9f802001  ! 764: SIR	sir	0x0001
	.word 0xa0c52001  ! 765: ADDCcc_I	addccc 	%r20, 0x0001, %r16
	.word 0x9f802001  ! 766: SIR	sir	0x0001
	.word 0xa1902006  ! 767: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x879023c4  ! 768: WRPR_TT_I	wrpr	%r0, 0x03c4, %tt
	.word 0xb3504000  ! 769: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x8790220a  ! 770: WRPR_TT_I	wrpr	%r0, 0x020a, %tt
	.word 0xa190200f  ! 771: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 772: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95500000  ! 773: RDPR_TPC	rdpr	%tpc, %r10
	.word 0x879022a6  ! 774: WRPR_TT_I	wrpr	%r0, 0x02a6, %tt
	.word 0x81982b85  ! 775: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b85, %hpstate
	.word 0xa1902000  ! 776: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x93902000  ! 777: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x83d02035  ! 778: Tcc_I	te	icc_or_xcc, %r0 + 53
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 779: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 780: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_99:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 781: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x879022c2  ! 782: WRPR_TT_I	wrpr	%r0, 0x02c2, %tt
	.word 0xb5a00dc9  ! 783: FdMULq	fdmulq	
	.word 0x2e800001  ! 784: BVS	bvs,a	<label_0x1>
	.word 0x819828d6  ! 785: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d6, %hpstate
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 786: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a85  ! 787: WRPR_PSTATE_I	wrpr	%r0, 0x0a85, %pstate
	.word 0x81982a15  ! 788: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a15, %hpstate
	.word 0xf4ffc029  ! 789: SWAPA_R	swapa	%r26, [%r31 + %r9] 0x01
	.word 0x93902004  ! 790: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8198215d  ! 791: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015d, %hpstate
	.word 0x2e700001  ! 792: BPVS	<illegal instruction>
splash_lsu_100:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 793: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 794: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_101:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 795: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xf497e020  ! 796: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r26
	.word 0x8d902093  ! 797: WRPR_PSTATE_I	wrpr	%r0, 0x0093, %pstate
	.word 0xa351c000  ! 798: RDPR_TL	rdpr	%tl, %r17
	.word 0x81982e95  ! 799: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e95, %hpstate
	.word 0x93d02033  ! 800: Tcc_I	tne	icc_or_xcc, %r0 + 51
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 801: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x2e700001  ! 803: BPVS	<illegal instruction>
DS_102:
	.word 0x20800001  ! 805: BN	bn,a	<label_0x1>
	illtrap
	.word 0xcd10400a  ! 805: LDQF_R	-	[%r1, %r10], %f6
	.word 0x95a60828  ! 804: FADDs	fadds	%f24, %f8, %f10
	.word 0x906e0000  ! 805: UDIVX_R	udivx 	%r24, %r0, %r8
	.word 0x2c800001  ! 806: BNEG	bneg,a	<label_0x1>
	.word 0x93902000  ! 807: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x83d02032  ! 808: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xd0c004a0  ! 809: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x93902007  ! 810: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d802000  ! 811: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8285e001  ! 812: ADDcc_I	addcc 	%r23, 0x0001, %r1
	.word 0x36800001  ! 813: BGE	bge,a	<label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 814: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198258f  ! 815: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058f, %hpstate
	.word 0x83d02032  ! 816: Tcc_I	te	icc_or_xcc, %r0 + 50
DS_103:
	.word 0x20800001  ! 818: BN	bn,a	<label_0x1>
	pdist %f30, %f4, %f28
	.word 0x8bb14301  ! 817: ALLIGNADDRESS	alignaddr	%r5, %r1, %r5
	.word 0xa190200f  ! 818: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87902075  ! 819: WRPR_TT_I	wrpr	%r0, 0x0075, %tt
	.word 0x93902000  ! 820: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902605  ! 821: WRPR_PSTATE_I	wrpr	%r0, 0x0605, %pstate
	.word 0xac4d801a  ! 822: MULX_R	mulx 	%r22, %r26, %r22
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 823: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 824: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93902000  ! 825: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_htba_104:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 826: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902003  ! 827: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802010  ! 828: WRASI_I	wr	%r0, 0x0010, %asi
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 829: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_105:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 830: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x87902206  ! 831: WRPR_TT_I	wrpr	%r0, 0x0206, %tt
	.word 0x879020e3  ! 832: WRPR_TT_I	wrpr	%r0, 0x00e3, %tt
DS_106:
	.word 0x34800001  ! 834: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 833: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200a  ! 834: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x88d1a001  ! 835: UMULcc_I	umulcc 	%r6, 0x0001, %r4
splash_tba_107:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 836: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81a01a6a  ! 837: FqTOi	fqtoi	
	.word 0x8d902c8a  ! 838: WRPR_PSTATE_I	wrpr	%r0, 0x0c8a, %pstate
	.word 0x91d02032  ! 839: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_lsu_108:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 840: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x89a40dc8  ! 841: FdMULq	fdmulq	
	.word 0x8d902a5e  ! 842: WRPR_PSTATE_I	wrpr	%r0, 0x0a5e, %pstate
	.word 0x81982a04  ! 843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a04, %hpstate
	.word 0x91d02035  ! 844: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902002  ! 845: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 846: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x22800001  ! 847: BE	be,a	<label_0x1>
	.word 0xa190200e  ! 848: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_tba_109:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 849: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 850: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 851: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x93a149b1  ! 852: FDIVs	fdivs	%f5, %f17, %f9
	ta	T_CHANGE_PRIV	! macro
	.word 0x8790212c  ! 854: WRPR_TT_I	wrpr	%r0, 0x012c, %tt
	.word 0x91d02030  ! 855: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xad508000  ! 856: RDPR_TSTATE	rdpr	%tstate, %r22
	.word 0x87902004  ! 857: WRPR_TT_I	wrpr	%r0, 0x0004, %tt
	.word 0xa1902006  ! 858: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x95a2c9b0  ! 859: FDIVs	fdivs	%f11, %f16, %f10
	.word 0xa1902008  ! 860: WRPR_GL_I	wrpr	%r0, 0x0008, %-
change_to_tl1_110:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_111:
	.word 0x20800001  ! 863: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 862: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902009  ! 863: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902005  ! 864: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x83d02031  ! 865: Tcc_I	te	icc_or_xcc, %r0 + 49
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 866: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9ba449da  ! 867: FDIVd	fdivd	%f48, %f26, %f44
	.word 0x8198229c  ! 868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029c, %hpstate
splash_htba_112:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 869: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 870: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 871: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xb3a00553  ! 872: FSQRTd	fsqrt	
	.word 0x93a009c3  ! 873: FDIVd	fdivd	%f0, %f34, %f40
DS_113:
	.word 0x32800001  ! 875: BNE	bne,a	<label_0x1>
	.word 0xd530a001  ! 875: STQF_I	-	%f10, [0x0001, %r2]
	normalw
	.word 0x93458000  ! 874: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x94c56001  ! 875: ADDCcc_I	addccc 	%r21, 0x0001, %r10
	.word 0xd5e7c023  ! 876: CASA_I	casa	[%r31] 0x 1, %r3, %r10
	.word 0x8da64d38  ! 877: FsMULd	fsmuld	%f25, %f24, %f6
	.word 0x8198240d  ! 878: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040d, %hpstate
	.word 0xcc800b40  ! 879: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r6
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 880: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8ed6a001  ! 881: UMULcc_I	umulcc 	%r26, 0x0001, %r7
	.word 0x81982bcc  ! 882: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcc, %hpstate
	.word 0x89a00d2a  ! 883: FsMULd	fsmuld	%f0, %f10, %f4
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 884: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 885: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8790233c  ! 886: WRPR_TT_I	wrpr	%r0, 0x033c, %tt
	.word 0x93902001  ! 887: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x34800001  ! 888: BG	bg,a	<label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 889: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 890: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902205  ! 891: WRPR_PSTATE_I	wrpr	%r0, 0x0205, %pstate
	.word 0xa081e001  ! 892: ADDcc_I	addcc 	%r7, 0x0001, %r16
splash_htba_114:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 893: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982fdf  ! 895: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdf, %hpstate
	.word 0x99902002  ! 896: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x93702001  ! 897: POPC_I	popc	0x0001, %r9
	.word 0xa1902005  ! 898: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x879021b4  ! 899: WRPR_TT_I	wrpr	%r0, 0x01b4, %tt
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 900: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902005  ! 901: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x93d02034  ! 902: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8d902adc  ! 903: WRPR_PSTATE_I	wrpr	%r0, 0x0adc, %pstate
	.word 0x91d02030  ! 904: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	.word 0xafa049c6  ! 906: FDIVd	fdivd	%f32, %f6, %f54
	.word 0x8951c000  ! 907: RDPR_TL	rdpr	%tl, %r4
	.word 0xc88fe000  ! 908: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r4
	ta	T_CHANGE_TO_TL0	! macro
splash_htba_115:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 910: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902002  ! 911: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02034  ! 912: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xb0820005  ! 913: ADDcc_R	addcc 	%r8, %r5, %r24
	.word 0x93a01a63  ! 914: FqTOi	fqtoi	
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 915: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_tl1_116:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87902097  ! 917: WRPR_TT_I	wrpr	%r0, 0x0097, %tt
	.word 0x8d902cd5  ! 918: WRPR_PSTATE_I	wrpr	%r0, 0x0cd5, %pstate
	.word 0xd207e001  ! 919: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x8d802000  ! 920: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd2c804a0  ! 921: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0x9f802001  ! 922: SIR	sir	0x0001
	.word 0x81982ec6  ! 923: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec6, %hpstate
	.word 0xa1902001  ! 924: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xb7508000  ! 925: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0xab514000  ! 926: RDPR_TBA	<illegal instruction>
	.word 0xa190200a  ! 927: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93902007  ! 928: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xea800b60  ! 929: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r21
	.word 0xa7508000  ! 930: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x8790220c  ! 931: WRPR_TT_I	wrpr	%r0, 0x020c, %tt
	.word 0x93902002  ! 932: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8790214c  ! 933: WRPR_TT_I	wrpr	%r0, 0x014c, %tt
reduce_priv_level_117:
	.word 0x8f902001  ! 935: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916ca001  ! 934: SDIVX_I	sdivx	%r18, 0x0001, %r8
	.word 0xa1902001  ! 935: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x9ad3401a  ! 936: UMULcc_R	umulcc 	%r13, %r26, %r13
	.word 0x8d802000  ! 937: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902004  ! 938: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xda8fe030  ! 939: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0xda8008a0  ! 940: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xdac7e030  ! 941: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
	.word 0x8790237a  ! 942: WRPR_TT_I	wrpr	%r0, 0x037a, %tt
change_to_tl1_118:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1902003  ! 944: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa1902004  ! 945: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 946: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 947: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xada589ac  ! 948: FDIVs	fdivs	%f22, %f12, %f22
	.word 0x8ba489b1  ! 949: FDIVs	fdivs	%f18, %f17, %f5
	.word 0x8d802000  ! 950: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879023ff  ! 951: WRPR_TT_I	wrpr	%r0, 0x03ff, %tt
	.word 0x93d02033  ! 952: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8790208c  ! 953: WRPR_TT_I	wrpr	%r0, 0x008c, %tt
	.word 0x93902004  ! 954: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x879023b0  ! 955: WRPR_TT_I	wrpr	%r0, 0x03b0, %tt
	.word 0x8790215a  ! 956: WRPR_TT_I	wrpr	%r0, 0x015a, %tt
splash_tba_119:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 957: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xca900e40  ! 958: LDUHA_R	lduha	[%r0, %r0] 0x72, %r5
splash_tba_120:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 959: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_121:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 960: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xb0a94009  ! 961: ANDNcc_R	andncc 	%r5, %r9, %r24
	.word 0x8790227b  ! 962: WRPR_TT_I	wrpr	%r0, 0x027b, %tt
	.word 0x93902001  ! 963: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8a812001  ! 964: ADDcc_I	addcc 	%r4, 0x0001, %r5
	.word 0x81982a44  ! 965: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a44, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902006  ! 967: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xcaffc029  ! 968: SWAPA_R	swapa	%r5, [%r31 + %r9] 0x01
	.word 0xa190200e  ! 969: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x93902006  ! 970: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8b50c000  ! 971: RDPR_TT	rdpr	%tt, %r5
	.word 0x8198251d  ! 972: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051d, %hpstate
	.word 0x87540000  ! 973: RDPR_GL	rdpr	%-, %r3
change_to_tl1_122:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8790205d  ! 975: WRPR_TT_I	wrpr	%r0, 0x005d, %tt
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 976: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 977: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb3a28d2d  ! 978: FsMULd	fsmuld	%f10, %f44, %f56
	.word 0x91d02032  ! 979: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xf337e001  ! 980: STQF_I	-	%f25, [0x0001, %r31]
	.word 0x879022f4  ! 981: WRPR_TT_I	wrpr	%r0, 0x02f4, %tt
	.word 0x819828de  ! 982: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08de, %hpstate
change_to_tl1_123:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa190200f  ! 984: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d902cc5  ! 985: WRPR_PSTATE_I	wrpr	%r0, 0x0cc5, %pstate
	.word 0x3e700001  ! 986: BPVC	<illegal instruction>
	.word 0x8198200f  ! 987: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000f, %hpstate
	.word 0x87902081  ! 988: WRPR_TT_I	wrpr	%r0, 0x0081, %tt
change_to_randtl_124:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 989: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8198295f  ! 990: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095f, %hpstate
	.word 0xa1902003  ! 991: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x81982144  ! 992: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0144, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982a1f  ! 994: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1f, %hpstate
	.word 0x85504000  ! 995: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x91d02034  ! 996: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8e81c000  ! 997: ADDcc_R	addcc 	%r7, %r0, %r7
splash_htba_125:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 998: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba


.global user_data_start
.data
user_data_start:
	.xword	0x9f19bbe2f2d53e19
	.xword	0x722ce78314908b8a
	.xword	0x6ca38e4136af15ca
	.xword	0x3d153a31718f3f98
	.xword	0x15627e363d6fe61f
	.xword	0x1754ab2371be26af
	.xword	0x9ff6c005f36d5ee6
	.xword	0xc57b18d9a87e7c0f
	.xword	0x9f835d870d566209
	.xword	0x237f01fe6696d68c
	.xword	0x792dfa01e8728b0a
	.xword	0x3d14e319ed20c8c7
	.xword	0xa2348d14973461f2
	.xword	0xc6b4d6b170c5d48e
	.xword	0x276e54dd3569f608
	.xword	0x298d21a570ff901a
	.xword	0x7462ee7655bef261
	.xword	0xc40899a1bb14a0a6
	.xword	0x5aecb8338a1e3cd2
	.xword	0xd15dac9125377bf4
	.xword	0x56d3e63aab91f53f
	.xword	0xd40f9f3092341815
	.xword	0x9c30e3f87bf574d7
	.xword	0x9395456772a96ae4
	.xword	0xda94a596d8e61854
	.xword	0xfcedf6b49af11f08
	.xword	0xf6b37aa9812395c6
	.xword	0xc751fe92af9bc898
	.xword	0x5dc05a66bf0c16d6
	.xword	0xf89c042f48bd284d
	.xword	0xac16ebffefb10d33
	.xword	0x75c3b44b4290c91c
	.xword	0x04fc22f8ae239900
	.xword	0x5377ef2d3ffa5d01
	.xword	0x4d2d6f05eed55982
	.xword	0x04de45e5d0f7bc02
	.xword	0x26aa5c4f8400a496
	.xword	0x9c0b6aed746dcb81
	.xword	0x6e9d482b0f788ab6
	.xword	0xf0618c6c6e0c2915
	.xword	0xc93e38cf81ae3149
	.xword	0x6ae3a8a9d4538445
	.xword	0xafb40c43edb1a9c7
	.xword	0x579e814d952a5cbe
	.xword	0x26bcc772e046c170
	.xword	0x41378806a9035bb0
	.xword	0x4d696a694fbade65
	.xword	0x683b5160e13d57dd
	.xword	0xdb525813e722041b
	.xword	0x7f2fe986fdd8987a
	.xword	0xd97f80a5c8554611
	.xword	0xed17a13016c8f2e3
	.xword	0x6b671b302b7fb3c2
	.xword	0xb017b48cdbff861b
	.xword	0x5793ffdbd396a04b
	.xword	0xb597e2c3c0ef2e11
	.xword	0x4e41827ace3f50f6
	.xword	0x6693e24f5c4c6a20
	.xword	0x5c438bc90a437fbb
	.xword	0x35f863b65b4c02f3
	.xword	0xfc60c67cac387374
	.xword	0x7cd2c6a510bc6b45
	.xword	0xff34593f12dcff32
	.xword	0x2f20682417d668d6
	.xword	0x1893223440e75970
	.xword	0xe21a66e0790d2d73
	.xword	0x11d6ecf8284563dd
	.xword	0xef317dea3dcbd1fb
	.xword	0x5246dba3421d3e25
	.xword	0x8b1d96272d9e9ea7
	.xword	0xac35b11feebb9c00
	.xword	0x61c8fa26500657d6
	.xword	0xd13137f8469dbd2a
	.xword	0xbdffdb8772fe03e1
	.xword	0x537d9657dd7ad741
	.xword	0x171142645482a893
	.xword	0xcd49d86d8537efe6
	.xword	0x75a4f924b81f6c07
	.xword	0x9e4e8a311744937e
	.xword	0x3459e102964f1782
	.xword	0xe73411dee567d1ba
	.xword	0x18dc0de2bb60899c
	.xword	0xeb5bbd3256eee453
	.xword	0x33ad435ad76ca273
	.xword	0xcbf1a87ceada7e5a
	.xword	0x1f8afb05c52e27ac
	.xword	0x008c4fcf2ef01f48
	.xword	0x5c4c6c96eca2b1dc
	.xword	0x17d39c9991e43631
	.xword	0xf0d013efa24e0571
	.xword	0x8d6a0bab3df0d239
	.xword	0x3c734c92c69745d7
	.xword	0x8c3ab9c23b79668a
	.xword	0x255cb99cb122658b
	.xword	0x307139a61a4a2962
	.xword	0x59bb6fc5c5838488
	.xword	0xe735cf45ede43ed0
	.xword	0x39fbe8ece22818f4
	.xword	0x1ff18723bff7ad5b
	.xword	0x4bf01d0fa0306eb5
	.xword	0xfc4a47f4b3d4fd7d
	.xword	0xd64f5a4a9bfbf4a0
	.xword	0x397771b97b97004e
	.xword	0xf6d779406d3bdf17
	.xword	0xd30946ccb7a166ff
	.xword	0x20a6792569bdf280
	.xword	0xe2d68e7f85924a19
	.xword	0xa4b4c41e8a7b1fcc
	.xword	0x00418a08835d9a3a
	.xword	0xb4a37d40ac7f5a98
	.xword	0xc150997573d038fd
	.xword	0x5276c2403933587a
	.xword	0xdd499a2d95f4db1f
	.xword	0x1de47833df5d489a
	.xword	0xa09a26774ac5e369
	.xword	0xab27e3e8038bfcdd
	.xword	0xd6216a148a3ba71a
	.xword	0x2bd3f3fe8037cba4
	.xword	0x3e19a39a17d2468c
	.xword	0xc901a44758b7495e
	.xword	0xf5809c82a01fea45
	.xword	0xfa1eb0ab5788e06e
	.xword	0x8fc5f6ad67dde4c7
	.xword	0x8eed9f8d823a5513
	.xword	0xfc6c559715e3ec24
	.xword	0xe800a804d0a00a76
	.xword	0xd4b920abaf0c879f
	.xword	0xd4683cae2d19edf6
	.xword	0xc957d2381fbf8d40
	.xword	0x83f72f9bb85ce103
	.xword	0xec190c09b709d912
	.xword	0xc34272a7e22126fe
	.xword	0xe9b6b36aed22081d
	.xword	0xf0df088671f8f60b
	.xword	0xbf1cd174d2e94d51
	.xword	0x3fd16ae16d7c59cc
	.xword	0x2bd13b5e355a57a9
	.xword	0x47d481232fe3ed34
	.xword	0xe6851b86c92c8dd0
	.xword	0xae1b58ec39c0cc16
	.xword	0xeac5b27995d7c1d1
	.xword	0x9b9704ca4920d40b
	.xword	0x1559fe8cae9eb373
	.xword	0x10c37a461ef082ab
	.xword	0x2b988a3cfb28b889
	.xword	0x766337ba5b91fb2b
	.xword	0x5c869d268079e876
	.xword	0xe17fecc3e748a60b
	.xword	0x9382dedae42e875d
	.xword	0xf0a899add9485084
	.xword	0xe0034a1748f440da
	.xword	0x5d6efeace10d35b0
	.xword	0x55cee051a5c836b4
	.xword	0xfda274864c81182b
	.xword	0x627337a566744592
	.xword	0xd6cc49ccaff7c564
	.xword	0x30d2eb8eb0bee65d
	.xword	0xcfa6215a720bccf1
	.xword	0xae28b6bbbe55997e
	.xword	0x3388a2477e11b6ac
	.xword	0xb09f3eb0567a6f4b
	.xword	0x7a476903beff16d3
	.xword	0x5903d3fee75815bf
	.xword	0xea35ce0b447e872c
	.xword	0x827cf4904dc68c7a
	.xword	0xd1ccbe850611801d
	.xword	0x407e748161349ce8
	.xword	0xb0867b4de42410a8
	.xword	0xf170daee789b582b
	.xword	0x7641c1e37929768e
	.xword	0xfa3a3003c97fe54c
	.xword	0xbc2dac5cc7dfa5a8
	.xword	0x4148a0371f3803a7
	.xword	0xd7ec18ac9a76fd6f
	.xword	0xbd97377910ac37e5
	.xword	0xe5a6078cba4cf4bb
	.xword	0x62a564e177103a27
	.xword	0x311c7bd2f0365eba
	.xword	0xa5d610df3c0d1f81
	.xword	0xaff1b6c01247017e
	.xword	0x8fdebe6bd950873c
	.xword	0xf971ddc8de3218ed
	.xword	0x28874522b407932a
	.xword	0xcd3b57fb1677b6cc
	.xword	0x6fcd26aa8e5e02e3
	.xword	0x95428d136486cc5d
	.xword	0xf7a22b7ec15cb6a5
	.xword	0x9609809b8dbfea46
	.xword	0x271d4efb885590fb
	.xword	0xf9a3f82257912f0b
	.xword	0x3e69a217d6cf8f31
	.xword	0xe6a80ef4e825eaa9
	.xword	0xdac9979e2f728e0a
	.xword	0x9c640fa59d37cb31
	.xword	0x28c85d537f588495
	.xword	0xf5f561472a1d89a7
	.xword	0x5f0dc77a69c64b6a
	.xword	0x813758443f0ef56f
	.xword	0x1da38fafba4f60b6
	.xword	0x519a1c5f1894a588
	.xword	0x9d3369a9f80d253d
	.xword	0x2b6fee7af2706375
	.xword	0xf585469b6551b465
	.xword	0x5d79d207e67e1cf1
	.xword	0x4c1a53d31de1bf88
	.xword	0x8eb2591aee56d7c6
	.xword	0x8147c0665a28eef6
	.xword	0x116227225ee8191b
	.xword	0xfa196f6f45649253
	.xword	0xe57bec3c09e8e27b
	.xword	0x30d450a7b354ddb7
	.xword	0xdb21d47e7f5e5617
	.xword	0x651bd763e92e31a5
	.xword	0xd56b57f676ebddec
	.xword	0x6390f3384e7914c8
	.xword	0xa1b7297052c669da
	.xword	0x2086be2930318ffb
	.xword	0xca192011e12e5abd
	.xword	0x0c68d3bb0a0b370f
	.xword	0x74a883984e55eb4e
	.xword	0x2a6006bcf7acaa68
	.xword	0x084f3b26981a15a4
	.xword	0x2801b4e5f329566a
	.xword	0x7aafde2113e0b686
	.xword	0x2bcbe4704ef76d52
	.xword	0x262ed17e3a31fc60
	.xword	0xc38eed1529757536
	.xword	0x44a14687d88c54d8
	.xword	0xc97503360d530ec4
	.xword	0x8ccf5dac96059092
	.xword	0xcbe1d617cbe08055
	.xword	0x7e7b7926216a67c8
	.xword	0x8c8cd45b0915c519
	.xword	0x9a97b04ccdf32d75
	.xword	0x094d2d97aaccab03
	.xword	0x57b84a37b34121ac
	.xword	0x67042c606acebbd5
	.xword	0xdd8bd6a7d90d1f2e
	.xword	0x921b81c888690186
	.xword	0x1f2a1091fd617e78
	.xword	0x9a9cc195359cc14b
	.xword	0x4b6b2f9fa67e682a
	.xword	0x61d06d7babcf0da3
	.xword	0x75feb4215a2dbfdd
	.xword	0xf6056189b0358e8b
	.xword	0x9864c44fd4a21b1b
	.xword	0x470a1dda517d626c
	.xword	0x191a23f5aeb1ab36
	.xword	0xef3f4b52052f1ee2
	.xword	0xb9e0bb901d31a333
	.xword	0xc6dffcdb36f28a63
	.xword	0x9df5ae7a6af614c9
	.xword	0x27ad1a3466300442
	.xword	0x5493cedb956951ba
	.xword	0x524d380f5393455b
	.xword	0x8074715be3340ec7


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Thu May  6 10:36:57 2004
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
!!#     IJ_set_ropr_fld("diag.j", 81, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x1c, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 84, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x16, 0x1c, 0x80, 0x88}");
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
!!#         IJ_generate ("diag.j", 315, th0, $2);
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
!!#         IJ_printf("diag.j", 363, th0, "reduce_priv_level_%d:\n", label);
!!#         IJ_set_ropr_fld("diag.j", 364, Ro_tl, Ft_Simm13, "{0..2}");
!!#         IJ_generate_from_token("diag.j", 365,1, th0, Ro_tl, tWRPR_TL_I, -1);;
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 367,1, th0, ijdefault, tCHANGE_NONHPRIV, -1);;
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 369,1, th0, ijdefault, tCHANGE_NONPRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_randtl: tWRPR_TL_I %ropr  Ro_tl
!!#     {
!!#         IJ_printf("diag.j", 377, th0, "change_to_randtl_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_set_ropr_fld("diag.j", 379, Ro_tl, Ft_Simm13, "{3..5}");
!!#             IJ_generate_from_token("diag.j", 380,1, th0, ijdefault, tCHANGE_HPRIV, -1);;
!!#         } else {
!!#             IJ_set_ropr_fld("diag.j", 382, Ro_tl, Ft_Simm13, "{0..2}");
!!#             IJ_generate_from_token("diag.j", 383,1, th0, ijdefault, tCHANGE_PRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_tl1 : tCHANGE_TO_TL1
!!#     {
!!#         IJ_printf("diag.j", 391, th0, "change_to_tl1_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 393, th0, "\tta T_CHANGE_HPRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 395, th0, "\tta T_CHANGE_PRIV\n");
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
!!#         IJ_printf("diag.j", 417, th0, "splash_lsu_%d:\n", label);
!!#         IJ_printf("diag.j", 418, th0, "\tset 0x%rx, %%r2\n", Rv_lsucntl);
!!#         IJ_printf("diag.j", 419, th0, "\tstxa %%r2, [%%r0] ASI_LSU_CONTROL\n");
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_tba: tWRPR_TBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 426, th0, "splash_tba_%d:\n", label);
!!#         IJ_printf("diag.j", 427, th0, "\tta T_CHANGE_PRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 429, th0, "\tset 0x120000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 431, th0, "\tset 0x%08llrx, %%r2\n", Rv_tba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# splash_htba: tWRHPR_HTBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 438, th0, "splash_htba_%d:\n", label);
!!#         IJ_printf("diag.j", 439, th0, "\tta T_CHANGE_HPRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 441, th0, "\tset 0x80000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 443, th0, "\tset 0x%08llrx, %%r2\n", Rv_htba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_cmpr: tWR_STICK_REG_I
!!#     {
!!#         IJ_printf("diag.j", 451, th0, "splash_cmpr_%d:\n", label);
!!#         IJ_set_rvar("diag.j", 452, Rv_rand_60,"64'h8rrrrrrr_rrrrrrrr");
!!#         IJ_set_ropr_fld("diag.j", 453, Ro_cmpr, Ft_Rs1, "{0}");
!!#         IJ_set_ropr_fld("diag.j", 454, Ro_cmpr, Ft_Rs2, "{1}");
!!#         IJ_printf  ("diag.j", 455, th0,"\tnop\n\tmov 1, %%g2\n");
!!#         IJ_printf  ("diag.j", 456, th0,"\tsllx %%g2, 63, %%g2\n");
!!#         IJ_printf  ("diag.j", 457, th0,"\tor %%g1, %%g2, %%g1\n");
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 459,1, th0, Ro_cmpr, tWR_STICK_CMPR_REG_R, tWR_TICK_CMPR_REG_R, -1);;
!!#         } else {
!!#            IJ_printf("diag.j", 461, th0, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
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
!!#         IJ_printf("diag.j", 499, th0, "\totherw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      } else {
!!#         IJ_printf("diag.j", 501, th0, "\tinvalw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!#         IJ_printf("diag.j", 586, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 587,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 588,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 589, th0, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 593, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 594,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 596,1, th0, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 598, th0, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 600, th0, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 605, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 606,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 608, th0, "\tilltrap\n");
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 610,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 612,1, th0, ijdefault, tFSQRTd, tLDQF_R, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 619, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 620,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 624, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 625,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 629, th0, "DS_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 630, th0, "\tnop\n\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 631, th0, "\tjmp %%g2\n");
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

