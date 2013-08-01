/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_04.s
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
	mov 0x35, %r14
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
	mov 0xb5, %r14
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
	.word 0xa5540000  ! 1: RDPR_GL	rdpr	%-, %r18
	.word 0x879020f5  ! 2: WRPR_TT_I	wrpr	%r0, 0x00f5, %tt
	.word 0x8d802000  ! 3: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802080  ! 4: WRASI_I	wr	%r0, 0x0080, %asi
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 5: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982f0e  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0e, %hpstate
	.word 0x93902002  ! 7: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902003  ! 8: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 10: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x3c700001  ! 11: BPPOS	<illegal instruction>
	.word 0xe4d7e020  ! 12: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
splash_cmpr_0:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 15: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x91d02033  ! 16: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_tba_1:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 17: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902ed8  ! 18: WRPR_PSTATE_I	wrpr	%r0, 0x0ed8, %pstate
	.word 0x93902003  ! 19: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe4800c40  ! 20: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r18
	.word 0x91d02032  ! 21: Tcc_I	ta	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	.word 0x95a20d28  ! 23: FsMULd	fsmuld	%f8, %f8, %f10
	.word 0x9f802001  ! 24: SIR	sir	0x0001
splash_htba_2:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 25: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xb6fde001  ! 26: SDIVcc_I	sdivcc 	%r23, 0x0001, %r27
	.word 0x80fdc01a  ! 27: SDIVcc_R	sdivcc 	%r23, %r26, %r0
	.word 0x97a089c3  ! 28: FDIVd	fdivd	%f2, %f34, %f42
	.word 0x8d902c8e  ! 29: WRPR_PSTATE_I	wrpr	%r0, 0x0c8e, %pstate
	.word 0x91a109e5  ! 30: FDIVq	dis not found

	.word 0x91d02030  ! 31: Tcc_I	ta	icc_or_xcc, %r0 + 48
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 32: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_3:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 33: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 34: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982e97  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e97, %hpstate
	.word 0xd07fe001  ! 36: SWAP_I	swap	%r8, [%r31 + 0x0001]
change_to_tl1_4:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xd0ffc025  ! 38: SWAPA_R	swapa	%r8, [%r31 + %r5] 0x01
	.word 0x93902003  ! 39: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x9f802001  ! 40: SIR	sir	0x0001
	.word 0x8d90269c  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x069c, %pstate
	.word 0x93902004  ! 42: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xb7540000  ! 43: RDPR_GL	rdpr	%-, %r27
	.word 0xa190200a  ! 44: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x91d02034  ! 45: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x879020ef  ! 46: WRPR_TT_I	wrpr	%r0, 0x00ef, %tt
	.word 0x8790217d  ! 47: WRPR_TT_I	wrpr	%r0, 0x017d, %tt
	.word 0x8d802004  ! 48: WRFPRS_I	wr	%r0, 0x0004, %fprs
change_to_randtl_5:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 49: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8f508000  ! 50: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0x99514000  ! 51: RDPR_TBA	rdpr	%tba, %r12
	.word 0x8c800016  ! 52: ADDcc_R	addcc 	%r0, %r22, %r6
	.word 0x93d02035  ! 53: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x91d02032  ! 54: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xcc97e030  ! 55: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r6
	.word 0x93902007  ! 56: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8198230d  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030d, %hpstate
	.word 0xcc8008a0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xa3a01a6b  ! 59: FqTOi	fqtoi	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x97a00557  ! 61: FSQRTd	fsqrt	
	.word 0xa1902002  ! 62: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8198208c  ! 63: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008c, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x81a2c9cd  ! 65: FDIVd	fdivd	%f42, %f44, %f0
splash_tba_6:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 66: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982287  ! 67: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0287, %hpstate
	.word 0x9f802001  ! 68: SIR	sir	0x0001
	.word 0x82a94012  ! 69: ANDNcc_R	andncc 	%r5, %r18, %r1
	.word 0xc25fc000  ! 70: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0x91d02033  ! 71: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9f802001  ! 72: SIR	sir	0x0001
	.word 0x90804001  ! 73: ADDcc_R	addcc 	%r1, %r1, %r8
	.word 0xb1504000  ! 74: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x879020c5  ! 75: WRPR_TT_I	wrpr	%r0, 0x00c5, %tt
	.word 0x2c700001  ! 76: BPNEG	<illegal instruction>
splash_tba_7:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 77: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa468e001  ! 78: UDIVX_I	udivx 	%r3, 0x0001, %r18
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 79: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02031  ! 80: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xb0694008  ! 81: UDIVX_R	udivx 	%r5, %r8, %r24
change_to_randtl_8:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 82: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x94d1c013  ! 83: UMULcc_R	umulcc 	%r7, %r19, %r10
	.word 0xb7a209c0  ! 84: FDIVd	fdivd	%f8, %f0, %f58
	.word 0xf697e010  ! 85: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r27
	.word 0xb351c000  ! 86: RDPR_TL	rdpr	%tl, %r25
	.word 0x8d9022da  ! 87: WRPR_PSTATE_I	wrpr	%r0, 0x02da, %pstate
	.word 0xa0d24005  ! 88: UMULcc_R	umulcc 	%r9, %r5, %r16
	.word 0x984c000b  ! 89: MULX_R	mulx 	%r16, %r11, %r12
	.word 0x8790223b  ! 90: WRPR_TT_I	wrpr	%r0, 0x023b, %tt
	.word 0x97a689c8  ! 91: FDIVd	fdivd	%f26, %f8, %f42
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3a40dc5  ! 93: FdMULq	fdmulq	
	.word 0x83d02034  ! 94: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xa1902008  ! 95: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02030  ! 97: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x91d02033  ! 98: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_9:
	.word 0x22800001  ! 100: BE	be,a	<label_0x1>
	.word 0xc1308008  ! 100: STQF_R	-	%f0, [%r8, %r2]
	normalw
	.word 0x8b458000  ! 99: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x87902033  ! 100: WRPR_TT_I	wrpr	%r0, 0x0033, %tt
	.word 0x91d02034  ! 101: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_htba_10:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 102: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcacfe030  ! 103: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r5
	.word 0x95a089e4  ! 104: FDIVq	dis not found

	.word 0x92d44005  ! 105: UMULcc_R	umulcc 	%r17, %r5, %r9
	.word 0x91b30ffb  ! 106: FONES	fones	%f8
	.word 0x819821d5  ! 107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d5, %hpstate
	.word 0x93902004  ! 108: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902005  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8bb1cff3  ! 110: FONES	fones	%f5
	.word 0xca800c20  ! 111: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r5
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 112: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902329  ! 113: WRPR_TT_I	wrpr	%r0, 0x0329, %tt
	.word 0x99a28dc4  ! 114: FdMULq	fdmulq	
	.word 0x93902005  ! 115: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8198240d  ! 116: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040d, %hpstate
	.word 0x93d02034  ! 117: Tcc_I	tne	icc_or_xcc, %r0 + 52
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 118: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 119: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_11:
	.word 0x32800001  ! 121: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 120: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d9026c6  ! 121: WRPR_PSTATE_I	wrpr	%r0, 0x06c6, %pstate
	.word 0x91d02034  ! 122: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_12:
	.word 0x34800001  ! 124: BG	bg,a	<label_0x1>
	.word 0xed32a001  ! 124: STQF_I	-	%f22, [0x0001, %r10]
	normalw
	.word 0x99458000  ! 123: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8790230b  ! 124: WRPR_TT_I	wrpr	%r0, 0x030b, %tt
	.word 0x8d902055  ! 125: WRPR_PSTATE_I	wrpr	%r0, 0x0055, %pstate
	.word 0x8d902edc  ! 126: WRPR_PSTATE_I	wrpr	%r0, 0x0edc, %pstate
	.word 0x99508000  ! 127: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x819826c4  ! 128: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c4, %hpstate
	.word 0x93902003  ! 129: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_13:
	.word 0x34800001  ! 131: BG	bg,a	<label_0x1>
	.word 0xd9304019  ! 131: STQF_R	-	%f12, [%r25, %r1]
	normalw
	.word 0x85458000  ! 130: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x81982f8e  ! 131: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8e, %hpstate
	.word 0x8ad20004  ! 132: UMULcc_R	umulcc 	%r8, %r4, %r5
	.word 0xca3fc004  ! 133: STD_R	std	%r5, [%r31 + %r4]
	.word 0x81982b16  ! 134: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b16, %hpstate
	.word 0x879022b0  ! 135: WRPR_TT_I	wrpr	%r0, 0x02b0, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902a4b  ! 137: WRPR_PSTATE_I	wrpr	%r0, 0x0a4b, %pstate
	.word 0x82d90005  ! 138: SMULcc_R	smulcc 	%r4, %r5, %r1
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 139: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc3e7c025  ! 140: CASA_I	casa	[%r31] 0x 1, %r5, %r1
change_to_tl1_14:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 142: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902043  ! 143: WRPR_TT_I	wrpr	%r0, 0x0043, %tt
change_to_randtl_15:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 144: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x81982c16  ! 145: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c16, %hpstate
	.word 0x99a0054c  ! 146: FSQRTd	fsqrt	
	.word 0x91d02035  ! 147: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902004  ! 148: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd8ffc02c  ! 149: SWAPA_R	swapa	%r12, [%r31 + %r12] 0x01
	.word 0x886cc00c  ! 150: UDIVX_R	udivx 	%r19, %r12, %r4
	.word 0x8351c000  ! 151: RDPR_TL	rdpr	%tl, %r1
	.word 0x83a549fa  ! 152: FDIVq	dis not found

DS_16:
	.word 0x22800001  ! 154: BE	be,a	<label_0x1>
	.word 0xe7368008  ! 154: STQF_R	-	%f19, [%r8, %r26]
	normalw
	.word 0xb7458000  ! 153: RD_SOFTINT_REG	rd	%softint, %r27
	.word 0x81982616  ! 154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0616, %hpstate
	.word 0x8d540000  ! 155: RDPR_GL	rdpr	%-, %r6
	.word 0xb750c000  ! 156: RDPR_TT	rdpr	%tt, %r27
	.word 0x8d902ade  ! 157: WRPR_PSTATE_I	wrpr	%r0, 0x0ade, %pstate
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 158: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 159: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02034  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902e9d  ! 161: WRPR_PSTATE_I	wrpr	%r0, 0x0e9d, %pstate
	.word 0x26700001  ! 162: BPL	<illegal instruction>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 163: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 164: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_17:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 165: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x85a000ca  ! 166: FNEGd	fnegd	%f10, %f2
	.word 0x8d902e5b  ! 167: WRPR_PSTATE_I	wrpr	%r0, 0x0e5b, %pstate
	.word 0xc407c000  ! 168: LDUW_R	lduw	[%r31 + %r0], %r2
change_to_randtl_18:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 169: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91d02032  ! 170: Tcc_I	ta	icc_or_xcc, %r0 + 50
reduce_priv_level_19:
	.word 0x8f902001  ! 172: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89828011  ! 171: WRTICK_R	wr	%r10, %r17, %tick
	.word 0x99a509e6  ! 172: FDIVq	dis not found

	.word 0x81982c5d  ! 173: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5d, %hpstate
	.word 0xd8800aa0  ! 174: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r12
	.word 0xd81fe001  ! 175: LDD_I	ldd	[%r31 + 0x0001], %r12
	.word 0xd937e001  ! 176: STQF_I	-	%f12, [0x0001, %r31]
	.word 0xd89004a0  ! 177: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0x91d02035  ! 178: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87a01a61  ! 179: FqTOi	fqtoi	
	.word 0xc6ffc021  ! 180: SWAPA_R	swapa	%r3, [%r31 + %r1] 0x01
	.word 0x8d802004  ! 181: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xb6d6c019  ! 182: UMULcc_R	umulcc 	%r27, %r25, %r27
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 183: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9750c000  ! 184: RDPR_TT	rdpr	%tt, %r11
DS_20:
	.word 0x34800001  ! 186: BG	bg,a	<label_0x1>
	pdist %f0, %f0, %f6
	.word 0x97b0c318  ! 185: ALLIGNADDRESS	alignaddr	%r3, %r24, %r11
	.word 0xd67fe001  ! 186: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x9285c002  ! 187: ADDcc_R	addcc 	%r23, %r2, %r9
DS_21:
	.word 0x34800001  ! 189: BG	bg,a	<label_0x1>
	.word 0xcd310005  ! 189: STQF_R	-	%f6, [%r5, %r4]
	normalw
	.word 0x99458000  ! 188: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8d902200  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x0200, %pstate
	.word 0x8d902e54  ! 190: WRPR_PSTATE_I	wrpr	%r0, 0x0e54, %pstate
change_to_randtl_22:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 191: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa190200a  ! 192: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d902a1f  ! 193: WRPR_PSTATE_I	wrpr	%r0, 0x0a1f, %pstate
	.word 0x91d02034  ! 194: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x83d02034  ! 195: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x30800001  ! 196: BA	ba,a	<label_0x1>
	.word 0xd8d7e020  ! 197: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r12
	.word 0x98a98006  ! 198: ANDNcc_R	andncc 	%r6, %r6, %r12
	.word 0x81982007  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0007, %hpstate
	.word 0x85500000  ! 200: RDPR_TPC	rdpr	%tpc, %r2
	.word 0x8d9026c0  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x06c0, %pstate
	.word 0x81982456  ! 202: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0456, %hpstate
	.word 0xa1902008  ! 203: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x9f802001  ! 204: SIR	sir	0x0001
	.word 0x87802004  ! 205: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc43fc006  ! 206: STD_R	std	%r2, [%r31 + %r6]
	.word 0x28700001  ! 207: BPLEU	<illegal instruction>
	.word 0x93d02031  ! 208: Tcc_I	tne	icc_or_xcc, %r0 + 49
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 209: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 210: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902396  ! 212: WRPR_TT_I	wrpr	%r0, 0x0396, %tt
	.word 0x93902003  ! 213: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902007  ! 214: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_23:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 215: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xa1902005  ! 216: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x91d02033  ! 217: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902c50  ! 218: WRPR_PSTATE_I	wrpr	%r0, 0x0c50, %pstate
	.word 0x8d500000  ! 219: RDPR_TPC	rdpr	%tpc, %r6
DS_24:
	.word 0x32800001  ! 221: BNE	bne,a	<label_0x1>
	.word 0xd130c00b  ! 221: STQF_R	-	%f8, [%r11, %r3]
	normalw
	.word 0xb5458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r26
	.word 0xf49fc020  ! 221: LDDA_R	ldda	[%r31, %r0] 0x01, %r26
	.word 0x99902000  ! 222: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x81982c14  ! 223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c14, %hpstate
	.word 0x8198205c  ! 224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005c, %hpstate
	.word 0x91a10d2b  ! 225: FsMULd	fsmuld	%f4, %f42, %f8
	.word 0xd08008a0  ! 226: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0d004a0  ! 227: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0x93902000  ! 228: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9751c000  ! 229: RDPR_TL	rdpr	%tl, %r11
	.word 0x81540000  ! 230: RDPR_GL	rdpr	%-, %r0
	.word 0x8790217b  ! 231: WRPR_TT_I	wrpr	%r0, 0x017b, %tt
	.word 0xc137c00b  ! 232: STQF_R	-	%f0, [%r11, %r31]
	.word 0xc0d004a0  ! 233: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r0
change_to_tl1_25:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x81540000  ! 235: RDPR_GL	rdpr	%-, %r0
	.word 0xc0cfe010  ! 236: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r0
	.word 0xc09fe001  ! 237: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r0
	.word 0xa1902000  ! 238: WRPR_GL_I	wrpr	%r0, 0x0000, %-
reduce_priv_level_26:
	.word 0x8f902000  ! 240: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa5a01974  ! 239: FqTOd	dis not found

	.word 0x81982155  ! 240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0155, %hpstate
	.word 0x93902005  ! 241: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x83d02033  ! 242: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x819821c4  ! 243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c4, %hpstate
	.word 0x8d902c11  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x0c11, %pstate
	.word 0x86d80019  ! 245: SMULcc_R	smulcc 	%r0, %r25, %r3
	.word 0x8d802000  ! 246: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1a000c6  ! 247: FNEGd	fnegd	%f6, %f16
DS_27:
	.word 0x32800001  ! 249: BNE	bne,a	<label_0x1>
	allclean
	.word 0x97b6c309  ! 248: ALLIGNADDRESS	alignaddr	%r27, %r9, %r11
DS_28:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 249: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x2c700001  ! 250: BPNEG	<illegal instruction>
	.word 0x93902006  ! 251: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd69004a0  ! 252: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
splash_cmpr_29:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 254: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1862001  ! 253: WR_STICK_REG_I	wr	%r24, 0x0001, %-
	.word 0xa3508000  ! 254: RDPR_TSTATE	<illegal instruction>
	.word 0x93902006  ! 255: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x879023e2  ! 256: WRPR_TT_I	wrpr	%r0, 0x03e2, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879022b5  ! 258: WRPR_TT_I	wrpr	%r0, 0x02b5, %tt
	.word 0xa7508000  ! 259: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0xb5702001  ! 260: POPC_I	popc	0x0001, %r26
	.word 0x819822de  ! 261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02de, %hpstate
reduce_priv_level_30:
	.word 0x8f902001  ! 263: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb76a2001  ! 262: SDIVX_I	sdivx	%r8, 0x0001, %r27
	.word 0x91d02033  ! 263: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902002  ! 264: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982a4d  ! 265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4d, %hpstate
	.word 0xa1902000  ! 266: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_31:
	.word 0x20800001  ! 268: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 267: SAVE_R	save	%r31, %r0, %r31
DS_32:
	.word 0x34800001  ! 269: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 268: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8951c000  ! 269: RDPR_TL	rdpr	%tl, %r4
	.word 0x8d902081  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0081, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3a800001  ! 272: BCC	bcc,a	<label_0x1>
change_to_tl1_33:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 274: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902190  ! 275: WRPR_TT_I	wrpr	%r0, 0x0190, %tt
	.word 0x3a700001  ! 276: BPCC	<illegal instruction>
reduce_priv_level_34:
	.word 0x8f902001  ! 278: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb181000d  ! 277: WR_STICK_REG_R	wr	%r4, %r13, %-
	.word 0x93902005  ! 278: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87902237  ! 279: WRPR_TT_I	wrpr	%r0, 0x0237, %tt
splash_tba_35:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 280: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xb1508000  ! 281: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x8790218e  ! 282: WRPR_TT_I	wrpr	%r0, 0x018e, %tt
DS_36:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 283: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 284: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 285: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902000  ! 286: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x81982d94  ! 287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d94, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xab51c000  ! 289: RDPR_TL	rdpr	%tl, %r21
	.word 0xa1902007  ! 290: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa190200c  ! 291: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xea8008a0  ! 292: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
splash_tba_37:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 293: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902196  ! 294: WRPR_TT_I	wrpr	%r0, 0x0196, %tt
	.word 0x8198240d  ! 295: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040d, %hpstate
	.word 0x90d84008  ! 296: SMULcc_R	smulcc 	%r1, %r8, %r8
change_to_randtl_38:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 297: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 298: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902317  ! 299: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
	.word 0x91d02030  ! 300: Tcc_I	ta	icc_or_xcc, %r0 + 48
splash_htba_39:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 301: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8198294d  ! 302: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094d, %hpstate
	.word 0xd08804a0  ! 303: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	.word 0xd07fe001  ! 304: SWAP_I	swap	%r8, [%r31 + 0x0001]
	.word 0x99500000  ! 305: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x30800001  ! 306: BA	ba,a	<label_0x1>
	.word 0x8d902c07  ! 307: WRPR_PSTATE_I	wrpr	%r0, 0x0c07, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 308: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd80fe001  ! 309: LDUB_I	ldub	[%r31 + 0x0001], %r12
	.word 0x8f50c000  ! 310: RDPR_TT	rdpr	%tt, %r7
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 311: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x86c16001  ! 313: ADDCcc_I	addccc 	%r5, 0x0001, %r3
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1902007  ! 315: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xafa309e0  ! 316: FDIVq	dis not found

	.word 0x966a6001  ! 317: UDIVX_I	udivx 	%r9, 0x0001, %r11
splash_cmpr_40:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182a001  ! 318: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0x91702001  ! 319: POPC_I	popc	0x0001, %r8
	.word 0x8282a001  ! 320: ADDcc_I	addcc 	%r10, 0x0001, %r1
	.word 0x8198201d  ! 321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001d, %hpstate
	.word 0x81982a17  ! 322: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a17, %hpstate
splash_cmpr_41:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 324: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1802001  ! 323: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	.word 0x8d902c51  ! 324: WRPR_PSTATE_I	wrpr	%r0, 0x0c51, %pstate
splash_cmpr_42:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1866001  ! 325: WR_STICK_REG_I	wr	%r25, 0x0001, %-
	.word 0x3e800001  ! 326: BVC	bvc,a	<label_0x1>
	.word 0x87902380  ! 327: WRPR_TT_I	wrpr	%r0, 0x0380, %tt
	.word 0x85a049c2  ! 328: FDIVd	fdivd	%f32, %f2, %f2
	.word 0xc5e7c022  ! 329: CASA_I	casa	[%r31] 0x 1, %r2, %r2
	.word 0x8d902e05  ! 330: WRPR_PSTATE_I	wrpr	%r0, 0x0e05, %pstate
	.word 0x93902003  ! 331: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc527c002  ! 332: STF_R	st	%f2, [%r2, %r31]
	.word 0x93902002  ! 333: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93d02032  ! 334: Tcc_I	tne	icc_or_xcc, %r0 + 50
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 335: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 336: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982d0d  ! 337: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0d, %hpstate
	.word 0xa190200c  ! 338: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x9950c000  ! 339: RDPR_TT	rdpr	%tt, %r12
splash_cmpr_43:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 341: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182a001  ! 340: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0xac6d8002  ! 341: UDIVX_R	udivx 	%r22, %r2, %r22
	.word 0xacfd000d  ! 342: SDIVcc_R	sdivcc 	%r20, %r13, %r22
	ta	T_CHANGE_PRIV	! macro
	.word 0x83d02030  ! 344: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x8790218a  ! 345: WRPR_TT_I	wrpr	%r0, 0x018a, %tt
	.word 0x8d902ccd  ! 346: WRPR_PSTATE_I	wrpr	%r0, 0x0ccd, %pstate
	.word 0x8b684014  ! 347: SDIVX_R	sdivx	%r1, %r20, %r5
	.word 0x87802004  ! 348: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902006  ! 349: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_tba_44:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 350: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x924a400b  ! 351: MULX_R	mulx 	%r9, %r11, %r9
	.word 0x91d02034  ! 352: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 354: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9026da  ! 355: WRPR_PSTATE_I	wrpr	%r0, 0x06da, %pstate
	.word 0xd2cfe010  ! 356: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x87902148  ! 357: WRPR_TT_I	wrpr	%r0, 0x0148, %tt
	.word 0x8d802000  ! 358: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa9508000  ! 359: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0xe8c7e020  ! 360: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r20
	.word 0xb2d1e001  ! 361: UMULcc_I	umulcc 	%r7, 0x0001, %r25
	.word 0x93902005  ! 362: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x819820ce  ! 363: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00ce, %hpstate
	.word 0x87902160  ! 364: WRPR_TT_I	wrpr	%r0, 0x0160, %tt
splash_htba_45:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 365: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8198219e  ! 366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019e, %hpstate
splash_cmpr_46:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182e001  ! 367: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0xa1902002  ! 368: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x88fda001  ! 369: SDIVcc_I	sdivcc 	%r22, 0x0001, %r4
	.word 0x93902000  ! 370: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_47:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 371: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x879022f9  ! 372: WRPR_TT_I	wrpr	%r0, 0x02f9, %tt
	.word 0xa7540000  ! 373: RDPR_GL	rdpr	%-, %r19
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 374: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe6800ba0  ! 375: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r19
	.word 0xa190200c  ! 376: WRPR_GL_I	wrpr	%r0, 0x000c, %-
change_to_randtl_48:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 377: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d90241b  ! 378: WRPR_PSTATE_I	wrpr	%r0, 0x041b, %pstate
	.word 0xa7508000  ! 379: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x81982807  ! 380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0807, %hpstate
	.word 0x8d902c48  ! 381: WRPR_PSTATE_I	wrpr	%r0, 0x0c48, %pstate
	.word 0xa1902001  ! 382: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93902005  ! 383: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe69004a0  ! 384: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	.word 0xe697e030  ! 385: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r19
	.word 0x9b50c000  ! 386: RDPR_TT	rdpr	%tt, %r13
	.word 0x99508000  ! 387: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x93a10dc7  ! 388: FdMULq	fdmulq	
	.word 0xd28008a0  ! 389: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x87802080  ! 390: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 392: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 393: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902000  ! 394: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa6fc4000  ! 395: SDIVcc_R	sdivcc 	%r17, %r0, %r19
	.word 0x8efca001  ! 396: SDIVcc_I	sdivcc 	%r18, 0x0001, %r7
	.word 0xa190200b  ! 397: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d90200b  ! 398: WRPR_PSTATE_I	wrpr	%r0, 0x000b, %pstate
	.word 0xa1902006  ! 399: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x94856001  ! 400: ADDcc_I	addcc 	%r21, 0x0001, %r10
	.word 0x8790214f  ! 401: WRPR_TT_I	wrpr	%r0, 0x014f, %tt
DS_49:
	.word 0x34800001  ! 403: BG	bg,a	<label_0x1>
	pdist %f18, %f6, %f18
	.word 0x83b5c301  ! 402: ALLIGNADDRESS	alignaddr	%r23, %r1, %r1
	.word 0x8c6e6001  ! 403: UDIVX_I	udivx 	%r25, 0x0001, %r6
	.word 0xb1a0cdc0  ! 404: FdMULq	fdmulq	
	.word 0x95b4cfe2  ! 405: FONES	fones	%f10
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 406: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9151c000  ! 407: RDPR_TL	rdpr	%tl, %r8
	.word 0x84696001  ! 408: UDIVX_I	udivx 	%r5, 0x0001, %r2
	.word 0x81982217  ! 409: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0217, %hpstate
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 410: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 411: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x879023fc  ! 412: WRPR_TT_I	wrpr	%r0, 0x03fc, %tt
	.word 0x8d508000  ! 413: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0xcccfe030  ! 414: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r6
	.word 0x8790225c  ! 415: WRPR_TT_I	wrpr	%r0, 0x025c, %tt
DS_50:
	.word 0x32800001  ! 417: BNE	bne,a	<label_0x1>
	.word 0xc7348009  ! 417: STQF_R	-	%f3, [%r9, %r18]
	normalw
	.word 0x95458000  ! 416: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd41fc000  ! 417: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0xa9a0056d  ! 418: FSQRTq	fsqrt	
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 419: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_51:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 420: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x95a01a68  ! 421: FqTOi	fqtoi	
	.word 0x84802001  ! 422: ADDcc_I	addcc 	%r0, 0x0001, %r2
	.word 0x8069e001  ! 423: UDIVX_I	udivx 	%r7, 0x0001, %r0
	ta	T_CHANGE_TO_TL0	! macro
reduce_priv_level_52:
	.word 0x8f902000  ! 426: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89850015  ! 425: WRTICK_R	wr	%r20, %r21, %tick
DS_53:
	.word 0x22800001  ! 427: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 426: SAVE_R	save	%r31, %r0, %r31
	.word 0x8198238d  ! 427: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038d, %hpstate
	.word 0x91d02033  ! 428: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x879022f2  ! 429: WRPR_TT_I	wrpr	%r0, 0x02f2, %tt
	.word 0x8198200d  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000d, %hpstate
	.word 0x8d9022c8  ! 431: WRPR_PSTATE_I	wrpr	%r0, 0x02c8, %pstate
	.word 0x91514000  ! 432: RDPR_TBA	rdpr	%tba, %r8
	.word 0x8790236e  ! 433: WRPR_TT_I	wrpr	%r0, 0x036e, %tt
	.word 0xa2d80004  ! 434: SMULcc_R	smulcc 	%r0, %r4, %r17
	.word 0x87902108  ! 435: WRPR_TT_I	wrpr	%r0, 0x0108, %tt
	.word 0xaaf8a001  ! 436: SDIVcc_I	sdivcc 	%r2, 0x0001, %r21
	.word 0x879023b5  ! 437: WRPR_TT_I	wrpr	%r0, 0x03b5, %tt
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 438: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 439: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xea9fe001  ! 440: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r21
	.word 0xa1902007  ! 441: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa5698003  ! 442: SDIVX_R	sdivx	%r6, %r3, %r18
	.word 0x81982b06  ! 443: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b06, %hpstate
	.word 0x90dcc00c  ! 444: SMULcc_R	smulcc 	%r19, %r12, %r8
	.word 0x93d02032  ! 445: Tcc_I	tne	icc_or_xcc, %r0 + 50
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 446: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 447: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x99504000  ! 448: RDPR_TNPC	rdpr	%tnpc, %r12
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 449: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81540000  ! 450: RDPR_GL	rdpr	%-, %r0
	.word 0xb069a001  ! 451: UDIVX_I	udivx 	%r6, 0x0001, %r24
	.word 0x8d902614  ! 452: WRPR_PSTATE_I	wrpr	%r0, 0x0614, %pstate
	.word 0x20800001  ! 453: BN	bn,a	<label_0x1>
splash_cmpr_54:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184a001  ! 454: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0xa1902007  ! 455: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x83d02033  ! 456: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x87902023  ! 457: WRPR_TT_I	wrpr	%r0, 0x0023, %tt
	.word 0x91d02035  ! 458: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xf0ffc02c  ! 459: SWAPA_R	swapa	%r24, [%r31 + %r12] 0x01
	.word 0xa1902004  ! 460: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xf127c00c  ! 461: STF_R	st	%f24, [%r12, %r31]
	.word 0xf0cfe020  ! 462: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r24
	.word 0x8afa8018  ! 463: SDIVcc_R	sdivcc 	%r10, %r24, %r5
	.word 0x879020d6  ! 464: WRPR_TT_I	wrpr	%r0, 0x00d6, %tt
	.word 0xb7504000  ! 465: RDPR_TNPC	rdpr	%tnpc, %r27
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 466: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf6dfe000  ! 467: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r27
	.word 0xf617e001  ! 468: LDUH_I	lduh	[%r31 + 0x0001], %r27
	.word 0x99902002  ! 469: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 470: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879023de  ! 471: WRPR_TT_I	wrpr	%r0, 0x03de, %tt
	.word 0x8d902a14  ! 472: WRPR_PSTATE_I	wrpr	%r0, 0x0a14, %pstate
	.word 0x81982d4d  ! 473: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4d, %hpstate
	.word 0x87902186  ! 474: WRPR_TT_I	wrpr	%r0, 0x0186, %tt
	.word 0x8351c000  ! 475: RDPR_TL	rdpr	%tl, %r1
	.word 0x8d9028c9  ! 476: WRPR_PSTATE_I	wrpr	%r0, 0x08c9, %pstate
	.word 0x8d902e5a  ! 477: WRPR_PSTATE_I	wrpr	%r0, 0x0e5a, %pstate
	.word 0x8d802000  ! 478: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200d  ! 479: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 480: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xb4a8c008  ! 481: ANDNcc_R	andncc 	%r3, %r8, %r26
	.word 0x93902001  ! 482: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902007  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x0007, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 484: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 485: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02035  ! 486: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902004  ! 487: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902003  ! 488: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_55:
	.word 0x32800001  ! 490: BNE	bne,a	<label_0x1>
	.word 0xdb336001  ! 490: STQF_I	-	%f13, [0x0001, %r13]
	normalw
	.word 0x8f458000  ! 489: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x91d02031  ! 490: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa190200d  ! 491: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa1902002  ! 492: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x91d02033  ! 493: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9aa88007  ! 494: ANDNcc_R	andncc 	%r2, %r7, %r13
	.word 0x95504000  ! 495: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x30700001  ! 496: BPA	<illegal instruction>
	.word 0x93902007  ! 497: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902004  ! 498: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd4c804a0  ! 499: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x91d02034  ! 500: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902a41  ! 501: WRPR_PSTATE_I	wrpr	%r0, 0x0a41, %pstate
	.word 0x8d90280e  ! 502: WRPR_PSTATE_I	wrpr	%r0, 0x080e, %pstate
	.word 0x8d902e51  ! 503: WRPR_PSTATE_I	wrpr	%r0, 0x0e51, %pstate
	.word 0x91d02033  ! 504: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902004  ! 505: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 506: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd517c000  ! 507: LDQF_R	-	[%r31, %r0], %f10
	.word 0x90fb2001  ! 508: SDIVcc_I	sdivcc 	%r12, 0x0001, %r8
	.word 0xa9702001  ! 509: POPC_I	popc	0x0001, %r20
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 510: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83d02034  ! 511: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 512: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982b0f  ! 513: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0f, %hpstate
	.word 0xe87fe001  ! 514: SWAP_I	swap	%r20, [%r31 + 0x0001]
	.word 0x87902300  ! 515: WRPR_TT_I	wrpr	%r0, 0x0300, %tt
	.word 0x87802014  ! 516: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x81982bd5  ! 517: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd5, %hpstate
reduce_priv_level_56:
	.word 0x8f902000  ! 519: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89808015  ! 518: WRTICK_R	wr	%r2, %r21, %tick
	.word 0x98c52001  ! 519: ADDCcc_I	addccc 	%r20, 0x0001, %r12
splash_htba_57:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 520: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_58:
	.word 0x32800001  ! 522: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 521: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd857c000  ! 522: LDSH_R	ldsh	[%r31 + %r0], %r12
	.word 0x87802089  ! 523: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d802000  ! 524: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902004  ! 525: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902084  ! 526: WRPR_PSTATE_I	wrpr	%r0, 0x0084, %pstate
	.word 0x87802014  ! 527: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x3c700001  ! 528: BPPOS	<illegal instruction>
	.word 0x8d90205e  ! 529: WRPR_PSTATE_I	wrpr	%r0, 0x005e, %pstate
	.word 0x91a1c9e5  ! 530: FDIVq	dis not found

	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 531: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 532: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa190200b  ! 533: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_cmpr_59:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 535: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1816001  ! 534: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0xd0800c20  ! 535: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r8
	.word 0x8d902697  ! 536: WRPR_PSTATE_I	wrpr	%r0, 0x0697, %pstate
	.word 0x9f802001  ! 537: SIR	sir	0x0001
	.word 0xa1902005  ! 538: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xd0c004a0  ! 540: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
DS_60:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 541: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8d51c000  ! 542: RDPR_TL	rdpr	%tl, %r6
	.word 0x8d902a1f  ! 543: WRPR_PSTATE_I	wrpr	%r0, 0x0a1f, %pstate
	.word 0x87802014  ! 544: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x89a01a6c  ! 545: FqTOi	fqtoi	
	.word 0x81982944  ! 546: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0944, %hpstate
	.word 0x87902303  ! 547: WRPR_TT_I	wrpr	%r0, 0x0303, %tt
	.word 0x81a489b4  ! 548: FDIVs	fdivs	%f18, %f20, %f0
	.word 0x83d02032  ! 549: Tcc_I	te	icc_or_xcc, %r0 + 50
reduce_priv_level_61:
	.word 0x8f902002  ! 551: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 550: SIAM	siam	1
	.word 0xa64d0001  ! 551: MULX_R	mulx 	%r20, %r1, %r19
	.word 0x91d02034  ! 552: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x879020be  ! 553: WRPR_TT_I	wrpr	%r0, 0x00be, %tt
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 554: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 555: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x89540000  ! 556: RDPR_GL	rdpr	%-, %r4
	.word 0x8d9028d7  ! 557: WRPR_PSTATE_I	wrpr	%r0, 0x08d7, %pstate
splash_tba_62:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 558: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982346  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0346, %hpstate
	.word 0x879023ec  ! 560: WRPR_TT_I	wrpr	%r0, 0x03ec, %tt
	.word 0x81982a85  ! 561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a85, %hpstate
DS_63:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 562: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xa7500000  ! 563: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x8bb24fe0  ! 564: FONES	fones	%f5
	.word 0xa1902001  ! 565: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x83d02032  ! 566: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x91d02032  ! 567: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902e01  ! 568: WRPR_PSTATE_I	wrpr	%r0, 0x0e01, %pstate
	.word 0x8d802000  ! 569: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902003  ! 570: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x91d02031  ! 571: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xcaffc020  ! 572: SWAPA_R	swapa	%r5, [%r31 + %r0] 0x01
splash_htba_64:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 573: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8751c000  ! 574: RDPR_TL	rdpr	%tl, %r3
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 575: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 576: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa5b48fe2  ! 577: FONES	fones	%f18
	.word 0x93902005  ! 578: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_65:
	.word 0x20800001  ! 580: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 579: RESTORE_R	restore	%r31, %r0, %r31
splash_cmpr_66:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1842001  ! 580: WR_STICK_REG_I	wr	%r16, 0x0001, %-
	.word 0x91d02033  ! 581: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02030  ! 582: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x2a700001  ! 583: BPCS	<illegal instruction>
	.word 0x8790214a  ! 584: WRPR_TT_I	wrpr	%r0, 0x014a, %tt
	.word 0x91d02035  ! 585: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 586: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 587: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d902c4a  ! 588: WRPR_PSTATE_I	wrpr	%r0, 0x0c4a, %pstate
	.word 0x81982b17  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b17, %hpstate
	.word 0x886d2001  ! 590: UDIVX_I	udivx 	%r20, 0x0001, %r4
	.word 0x8d902c9b  ! 591: WRPR_PSTATE_I	wrpr	%r0, 0x0c9b, %pstate
	.word 0xc8900e60  ! 592: LDUHA_R	lduha	[%r0, %r0] 0x73, %r4
DS_67:
	.word 0x22800001  ! 594: BE	be,a	<label_0x1>
	pdist %f26, %f6, %f10
	.word 0xb1b20312  ! 593: ALLIGNADDRESS	alignaddr	%r8, %r18, %r24
	.word 0xf05fc000  ! 594: LDX_R	ldx	[%r31 + %r0], %r24
	.word 0x8d902804  ! 595: WRPR_PSTATE_I	wrpr	%r0, 0x0804, %pstate
	.word 0x8790221b  ! 596: WRPR_TT_I	wrpr	%r0, 0x021b, %tt
	.word 0x8d802000  ! 597: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902415  ! 598: WRPR_PSTATE_I	wrpr	%r0, 0x0415, %pstate
	.word 0x8d802004  ! 599: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8198240f  ! 600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040f, %hpstate
	.word 0xf08fe000  ! 601: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r24
	.word 0xf127c012  ! 602: STF_R	st	%f24, [%r18, %r31]
DS_68:
	.word 0x22800001  ! 604: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 603: SAVE_R	save	%r31, %r0, %r31
	.word 0xf0d00e40  ! 604: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r24
	.word 0x9f802001  ! 605: SIR	sir	0x0001
	.word 0xa1902005  ! 606: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x8790206c  ! 608: WRPR_TT_I	wrpr	%r0, 0x006c, %tt
	.word 0x8d902c8d  ! 609: WRPR_PSTATE_I	wrpr	%r0, 0x0c8d, %pstate
DS_69:
	.word 0x32800001  ! 611: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 610: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d802004  ! 611: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902009  ! 612: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa0a8c007  ! 613: ANDNcc_R	andncc 	%r3, %r7, %r16
splash_tba_70:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 614: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902004  ! 615: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa190200d  ! 616: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91d02035  ! 617: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x89a309b2  ! 618: FDIVs	fdivs	%f12, %f18, %f4
	.word 0xc8c80e40  ! 619: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r4
	.word 0x8198259f  ! 620: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059f, %hpstate
	.word 0xc837c012  ! 621: STH_R	sth	%r4, [%r31 + %r18]
	.word 0xc8d7e020  ! 622: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r4
	.word 0x8d902c97  ! 623: WRPR_PSTATE_I	wrpr	%r0, 0x0c97, %pstate
	.word 0x93902003  ! 624: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x879023ae  ! 625: WRPR_TT_I	wrpr	%r0, 0x03ae, %tt
	.word 0x93a0cd25  ! 626: FsMULd	fsmuld	%f3, %f36, %f40
splash_tba_71:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 627: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83508000  ! 628: RDPR_TSTATE	rdpr	%tstate, %r1
DS_72:
	.word 0x32800001  ! 630: BNE	bne,a	<label_0x1>
	.word 0xe530c000  ! 630: STQF_R	-	%f18, [%r0, %r3]
	normalw
	.word 0x89458000  ! 629: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8d802000  ! 630: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902133  ! 631: WRPR_TT_I	wrpr	%r0, 0x0133, %tt
	.word 0x879021bf  ! 632: WRPR_TT_I	wrpr	%r0, 0x01bf, %tt
	.word 0x879023f5  ! 633: WRPR_TT_I	wrpr	%r0, 0x03f5, %tt
	.word 0x8951c000  ! 634: RDPR_TL	rdpr	%tl, %r4
	.word 0x81982505  ! 635: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0505, %hpstate
	.word 0x8d902412  ! 636: WRPR_PSTATE_I	wrpr	%r0, 0x0412, %pstate
	.word 0xb0488002  ! 637: MULX_R	mulx 	%r2, %r2, %r24
	.word 0x84da8004  ! 638: SMULcc_R	smulcc 	%r10, %r4, %r2
	.word 0x99902001  ! 639: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x9268a001  ! 640: UDIVX_I	udivx 	%r2, 0x0001, %r9
	.word 0x8b540000  ! 641: RDPR_GL	rdpr	%-, %r5
	.word 0xa1902001  ! 642: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xcac80e80  ! 643: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r5
	.word 0x93902001  ! 644: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
reduce_priv_level_73:
	.word 0x8f902001  ! 646: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x836ca001  ! 645: SDIVX_I	sdivx	%r18, 0x0001, %r1
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 646: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x85a24d23  ! 647: FsMULd	fsmuld	%f9, %f34, %f2
	.word 0x91d02031  ! 648: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8198299d  ! 649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099d, %hpstate
	.word 0x93a0054b  ! 650: FSQRTd	fsqrt	
	.word 0x8550c000  ! 651: RDPR_TT	rdpr	%tt, %r2
	.word 0x91d02034  ! 652: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8790235c  ! 653: WRPR_TT_I	wrpr	%r0, 0x035c, %tt
reduce_priv_level_74:
	.word 0x8f902001  ! 655: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99686001  ! 654: SDIVX_I	sdivx	%r1, 0x0001, %r12
	.word 0x91a000c3  ! 655: FNEGd	fnegd	%f34, %f8
	.word 0x8d802000  ! 656: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8551c000  ! 657: RDPR_TL	rdpr	%tl, %r2
	.word 0x9f802001  ! 658: SIR	sir	0x0001
	.word 0x3a700001  ! 659: BPCC	<illegal instruction>
	.word 0x93902004  ! 660: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 661: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 662: WRPR_GL_I	wrpr	%r0, 0x000c, %-
change_to_tl1_75:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
splash_tba_76:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 664: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc48804a0  ! 665: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
reduce_priv_level_77:
	.word 0x8f902000  ! 667: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb186400c  ! 666: WR_STICK_REG_R	wr	%r25, %r12, %-
	.word 0x87802088  ! 667: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802004  ! 668: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x83d02031  ! 669: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xc417c000  ! 670: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x24800001  ! 671: BLE	ble,a	<label_0x1>
	.word 0xa2aac005  ! 672: ANDNcc_R	andncc 	%r11, %r5, %r17
DS_78:
	.word 0x34800001  ! 674: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 673: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02034  ! 674: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8468a001  ! 675: UDIVX_I	udivx 	%r2, 0x0001, %r2
	.word 0x83d02034  ! 676: Tcc_I	te	icc_or_xcc, %r0 + 52
change_to_randtl_79:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 677: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8d802004  ! 678: WRFPRS_I	wr	%r0, 0x0004, %fprs
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 679: Tcc_R	ta	icc_or_xcc, %r0 + %r30
reduce_priv_level_80:
	.word 0x8f902000  ! 681: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1800013  ! 680: WR_STICK_REG_R	wr	%r0, %r19, %-
	.word 0x91d02031  ! 681: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8b688006  ! 682: SDIVX_R	sdivx	%r2, %r6, %r5
splash_tba_81:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 683: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x97a689c3  ! 684: FDIVd	fdivd	%f26, %f34, %f42
	.word 0x22700001  ! 685: BPE	<illegal instruction>
	.word 0x91504000  ! 686: RDPR_TNPC	rdpr	%tnpc, %r8
splash_tba_82:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 687: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_83:
	.word 0x22800001  ! 689: BE	be,a	<label_0x1>
	pdist %f0, %f0, %f18
	.word 0x87b08318  ! 688: ALLIGNADDRESS	alignaddr	%r2, %r24, %r3
	.word 0x20800001  ! 689: BN	bn,a	<label_0x1>
	.word 0xa1902008  ! 690: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d902ac5  ! 691: WRPR_PSTATE_I	wrpr	%r0, 0x0ac5, %pstate
	.word 0x96d10009  ! 692: UMULcc_R	umulcc 	%r4, %r9, %r11
	.word 0x8951c000  ! 693: RDPR_TL	rdpr	%tl, %r4
	.word 0xa1902000  ! 694: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d902ecb  ! 695: WRPR_PSTATE_I	wrpr	%r0, 0x0ecb, %pstate
	.word 0x93902005  ! 696: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa190200d  ! 697: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xc8dfe020  ! 698: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r4
splash_cmpr_84:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1806001  ! 699: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0x91d02030  ! 700: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x81982f84  ! 701: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f84, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02034  ! 703: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902243  ! 704: WRPR_PSTATE_I	wrpr	%r0, 0x0243, %pstate
	.word 0xa190200d  ! 705: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d90244e  ! 706: WRPR_PSTATE_I	wrpr	%r0, 0x044e, %pstate
	.word 0xc82fe001  ! 707: STB_I	stb	%r4, [%r31 + 0x0001]
splash_cmpr_85:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 709: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181a001  ! 708: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x8d9020d1  ! 709: WRPR_PSTATE_I	wrpr	%r0, 0x00d1, %pstate
	.word 0x91d02030  ! 710: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa5b00fea  ! 711: FONES	fones	%f18
	.word 0x8d902050  ! 712: WRPR_PSTATE_I	wrpr	%r0, 0x0050, %pstate
	.word 0xe48fe020  ! 713: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r18
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 714: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 715: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x836ac001  ! 716: SDIVX_R	sdivx	%r11, %r1, %r1
	.word 0x97a209a5  ! 717: FDIVs	fdivs	%f8, %f5, %f11
	.word 0x91d02034  ! 718: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8198285f  ! 719: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085f, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 720: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 721: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902004  ! 722: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x2c800001  ! 723: BNEG	bneg,a	<label_0x1>
splash_cmpr_86:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1826001  ! 724: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0x93902007  ! 725: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd737c005  ! 726: STQF_R	-	%f11, [%r5, %r31]
splash_cmpr_87:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 728: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180e001  ! 727: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x93902001  ! 728: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_88:
	.word 0x22800001  ! 730: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 729: RESTORE_R	restore	%r31, %r0, %r31
splash_tba_89:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 730: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8db18fe4  ! 731: FONES	fones	%f6
splash_htba_90:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 732: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
reduce_priv_level_91:
	.word 0x8f902001  ! 734: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1828005  ! 733: WR_STICK_REG_R	wr	%r10, %r5, %-
	.word 0xacae400b  ! 734: ANDNcc_R	andncc 	%r25, %r11, %r22
DS_92:
	.word 0x32800001  ! 736: BNE	bne,a	<label_0x1>
	pdist %f26, %f28, %f10
	.word 0x8db30309  ! 735: ALLIGNADDRESS	alignaddr	%r12, %r9, %r6
	.word 0xa7504000  ! 736: RDPR_TNPC	<illegal instruction>
	.word 0x84682001  ! 737: UDIVX_I	udivx 	%r0, 0x0001, %r2
	.word 0x85514000  ! 738: RDPR_TBA	<illegal instruction>
	.word 0x86c26001  ! 739: ADDCcc_I	addccc 	%r9, 0x0001, %r3
splash_tba_93:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 740: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc7e7c029  ! 741: CASA_I	casa	[%r31] 0x 1, %r9, %r3
	.word 0x926b4003  ! 742: UDIVX_R	udivx 	%r13, %r3, %r9
change_to_randtl_94:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 743: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_randtl_95:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 744: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x2c700001  ! 745: BPNEG	<illegal instruction>
DS_96:
	.word 0x32800001  ! 747: BNE	bne,a	<label_0x1>
	.word 0xcf35c002  ! 747: STQF_R	-	%f7, [%r2, %r23]
	normalw
	.word 0xad458000  ! 746: RD_SOFTINT_REG	rd	%softint, %r22
	.word 0xaf504000  ! 747: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x93902006  ! 748: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902004  ! 749: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xeec804a0  ! 750: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r23
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 751: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 752: SIR	sir	0x0001
	.word 0x81982b0e  ! 753: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0e, %hpstate
change_to_tl1_97:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902cd5  ! 755: WRPR_PSTATE_I	wrpr	%r0, 0x0cd5, %pstate
	.word 0x93d02030  ! 756: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xa1902000  ! 757: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
DS_98:
	.word 0x20800001  ! 760: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 759: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902004  ! 760: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87902098  ! 761: WRPR_TT_I	wrpr	%r0, 0x0098, %tt
	.word 0x8d902606  ! 762: WRPR_PSTATE_I	wrpr	%r0, 0x0606, %pstate
	.word 0x879023c4  ! 763: WRPR_TT_I	wrpr	%r0, 0x03c4, %tt
	.word 0x83a0054a  ! 764: FSQRTd	fsqrt	
	.word 0x91d02031  ! 765: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93d02035  ! 766: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x93d02031  ! 767: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x2c800001  ! 768: BNEG	bneg,a	<label_0x1>
	.word 0x93902003  ! 769: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802014  ! 770: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902001  ! 771: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902001  ! 772: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9f802001  ! 773: SIR	sir	0x0001
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa248800d  ! 775: MULX_R	mulx 	%r2, %r13, %r17
	.word 0x91d02033  ! 776: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81982845  ! 777: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0845, %hpstate
	.word 0xa4f90006  ! 778: SDIVcc_R	sdivcc 	%r4, %r6, %r18
	.word 0x99508000  ! 779: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x8d902e5b  ! 780: WRPR_PSTATE_I	wrpr	%r0, 0x0e5b, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd82fe001  ! 782: STB_I	stb	%r12, [%r31 + 0x0001]
	.word 0x87902246  ! 783: WRPR_TT_I	wrpr	%r0, 0x0246, %tt
	.word 0x2c800001  ! 784: BNEG	bneg,a	<label_0x1>
	.word 0x91d02034  ! 785: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa190200a  ! 786: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93902007  ! 787: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd8c804a0  ! 788: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x93a000d2  ! 789: FNEGd	fnegd	%f18, %f40
	.word 0xd2ffc032  ! 790: SWAPA_R	swapa	%r9, [%r31 + %r18] 0x01
change_to_randtl_99:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 791: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x9a69a001  ! 792: UDIVX_I	udivx 	%r6, 0x0001, %r13
	.word 0x81982a04  ! 793: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a04, %hpstate
	.word 0xdb27c012  ! 794: STF_R	st	%f13, [%r18, %r31]
	.word 0x32700001  ! 795: BPNE	<illegal instruction>
change_to_tl1_100:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902a93  ! 797: WRPR_PSTATE_I	wrpr	%r0, 0x0a93, %pstate
splash_htba_101:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 798: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902007  ! 799: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x816e8009  ! 800: SDIVX_R	sdivx	%r26, %r9, %r0
	.word 0x93902001  ! 801: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8b504000  ! 802: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x81982f0f  ! 803: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0f, %hpstate
	.word 0x8d902412  ! 804: WRPR_PSTATE_I	wrpr	%r0, 0x0412, %pstate
	.word 0x8ed30002  ! 805: UMULcc_R	umulcc 	%r12, %r2, %r7
	.word 0xcf37c002  ! 806: STQF_R	-	%f7, [%r2, %r31]
	.word 0x95a6cdc0  ! 807: FdMULq	fdmulq	
	.word 0x8d802004  ! 808: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xab540000  ! 809: RDPR_GL	rdpr	%-, %r21
	.word 0x93508000  ! 810: RDPR_TSTATE	<illegal instruction>
reduce_priv_level_102:
	.word 0x8f902002  ! 812: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81a0196d  ! 811: FqTOd	dis not found

	.word 0x36700001  ! 812: BPGE	<illegal instruction>
DS_103:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 813: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8d9028ce  ! 814: WRPR_PSTATE_I	wrpr	%r0, 0x08ce, %pstate
reduce_priv_level_104:
	.word 0x8f902002  ! 816: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1868000  ! 815: WR_STICK_REG_R	wr	%r26, %r0, %-
	.word 0x93902000  ! 816: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc0800b40  ! 817: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r0
	.word 0xc08008a0  ! 818: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc0c004a0  ! 819: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 820: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc03fe001  ! 821: STD_I	std	%r0, [%r31 + 0x0001]
	.word 0x97514000  ! 822: RDPR_TBA	rdpr	%tba, %r11
	.word 0x91d02032  ! 823: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8198245f  ! 824: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045f, %hpstate
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 825: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_105:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x879023f1  ! 827: WRPR_TT_I	wrpr	%r0, 0x03f1, %tt
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 828: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8790213a  ! 829: WRPR_TT_I	wrpr	%r0, 0x013a, %tt
splash_tba_106:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 830: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982a4c  ! 831: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4c, %hpstate
	.word 0x22700001  ! 832: BPE	<illegal instruction>
	.word 0xd65fc000  ! 833: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x81982614  ! 834: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0614, %hpstate
	.word 0x9f802001  ! 835: SIR	sir	0x0001
	.word 0x8f508000  ! 836: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0xa190200e  ! 837: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xada1c9d8  ! 838: FDIVd	fdivd	%f38, %f24, %f22
	.word 0xa1902002  ! 839: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x91d02032  ! 840: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8790219b  ! 841: WRPR_TT_I	wrpr	%r0, 0x019b, %tt
	.word 0xb1b08fe3  ! 842: FONES	fones	%f24
	.word 0x8198275c  ! 843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075c, %hpstate
	.word 0xb5514000  ! 844: RDPR_TBA	rdpr	%tba, %r26
	.word 0x96d6400b  ! 845: UMULcc_R	umulcc 	%r25, %r11, %r11
	.word 0xd697e010  ! 846: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x81982d54  ! 847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d54, %hpstate
	.word 0x81982d4d  ! 848: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4d, %hpstate
	.word 0x8d902206  ! 849: WRPR_PSTATE_I	wrpr	%r0, 0x0206, %pstate
	.word 0x87802080  ! 850: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xad69c01a  ! 851: SDIVX_R	sdivx	%r7, %r26, %r22
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902008  ! 853: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x81982305  ! 854: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0305, %hpstate
DS_107:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 855: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
change_to_tl1_108:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87802014  ! 857: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x819821c6  ! 858: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c6, %hpstate
	.word 0x819829cf  ! 859: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cf, %hpstate
	.word 0xa190200e  ! 860: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d902e0c  ! 861: WRPR_PSTATE_I	wrpr	%r0, 0x0e0c, %pstate
	.word 0x99a1cdd1  ! 862: FdMULq	fdmulq	
	.word 0xd9e7c031  ! 863: CASA_I	casa	[%r31] 0x 1, %r17, %r12
	.word 0x9f802001  ! 864: SIR	sir	0x0001
	.word 0x8d902809  ! 865: WRPR_PSTATE_I	wrpr	%r0, 0x0809, %pstate
splash_tba_109:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 866: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200a  ! 867: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd88fe000  ! 868: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0xaa6ac00c  ! 869: UDIVX_R	udivx 	%r11, %r12, %r21
splash_cmpr_110:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 870: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0x87902103  ! 871: WRPR_TT_I	wrpr	%r0, 0x0103, %tt
	.word 0x9ad1a001  ! 872: UMULcc_I	umulcc 	%r6, 0x0001, %r13
	.word 0x92dcc003  ! 873: SMULcc_R	smulcc 	%r19, %r3, %r9
	.word 0x8198284d  ! 874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084d, %hpstate
	.word 0x8d802004  ! 875: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 876: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982905  ! 877: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0905, %hpstate
	.word 0x8d50c000  ! 878: RDPR_TT	rdpr	%tt, %r6
	.word 0xa150c000  ! 879: RDPR_TT	rdpr	%tt, %r16
	.word 0x87902131  ! 880: WRPR_TT_I	wrpr	%r0, 0x0131, %tt
splash_cmpr_111:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 882: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1832001  ! 881: WR_STICK_REG_I	wr	%r12, 0x0001, %-
	.word 0x91d02035  ! 882: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x98d28013  ! 883: UMULcc_R	umulcc 	%r10, %r19, %r12
	.word 0xa1902003  ! 884: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_htba_112:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 885: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87902234  ! 886: WRPR_TT_I	wrpr	%r0, 0x0234, %tt
	.word 0xd85fc000  ! 887: LDX_R	ldx	[%r31 + %r0], %r12
	.word 0x8d902ada  ! 888: WRPR_PSTATE_I	wrpr	%r0, 0x0ada, %pstate
	.word 0x93902006  ! 889: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x30800001  ! 891: BA	ba,a	<label_0x1>
	.word 0x93902002  ! 892: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902c0d  ! 893: WRPR_PSTATE_I	wrpr	%r0, 0x0c0d, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8790231a  ! 895: WRPR_TT_I	wrpr	%r0, 0x031a, %tt
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 896: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd8c00e80  ! 897: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r12
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 898: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90245c  ! 899: WRPR_PSTATE_I	wrpr	%r0, 0x045c, %pstate
	.word 0x3e800001  ! 900: BVC	bvc,a	<label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 901: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982107  ! 902: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0107, %hpstate
	.word 0xd88008a0  ! 903: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd9e7c033  ! 904: CASA_I	casa	[%r31] 0x 1, %r19, %r12
	.word 0x91d02031  ! 905: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8198255e  ! 906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055e, %hpstate
	.word 0xa190200c  ! 907: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x846d800d  ! 908: UDIVX_R	udivx 	%r22, %r13, %r2
	.word 0x91d02035  ! 909: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902ac5  ! 910: WRPR_PSTATE_I	wrpr	%r0, 0x0ac5, %pstate
	.word 0x93902002  ! 911: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f802001  ! 912: SIR	sir	0x0001
	.word 0x87702001  ! 913: POPC_I	popc	0x0001, %r3
	.word 0x87b2cfed  ! 914: FONES	fones	%f3
splash_tba_113:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 915: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902007  ! 916: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9150c000  ! 917: RDPR_TT	rdpr	%tt, %r8
	.word 0x82696001  ! 918: UDIVX_I	udivx 	%r5, 0x0001, %r1
	.word 0x8790227a  ! 919: WRPR_TT_I	wrpr	%r0, 0x027a, %tt
	.word 0x91d02035  ! 920: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95a00543  ! 922: FSQRTd	fsqrt	
	.word 0x87902296  ! 923: WRPR_TT_I	wrpr	%r0, 0x0296, %tt
	.word 0x81982317  ! 924: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0317, %hpstate
	.word 0x81508000  ! 925: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x91d02032  ! 926: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81982b57  ! 927: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b57, %hpstate
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 928: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x846e2001  ! 929: UDIVX_I	udivx 	%r24, 0x0001, %r2
	.word 0x83d02032  ! 930: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xa04a0009  ! 931: MULX_R	mulx 	%r8, %r9, %r16
	.word 0x81982f05  ! 932: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f05, %hpstate
	.word 0x986b2001  ! 933: UDIVX_I	udivx 	%r12, 0x0001, %r12
	.word 0x93902006  ! 934: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa351c000  ! 935: RDPR_TL	rdpr	%tl, %r17
	.word 0xa1902008  ! 936: WRPR_GL_I	wrpr	%r0, 0x0008, %-
change_to_tl1_114:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa8d94010  ! 938: SMULcc_R	smulcc 	%r5, %r16, %r20
	.word 0x9f802001  ! 939: SIR	sir	0x0001
	.word 0x8d9020de  ! 940: WRPR_PSTATE_I	wrpr	%r0, 0x00de, %pstate
	.word 0xb66d0002  ! 941: UDIVX_R	udivx 	%r20, %r2, %r27
	.word 0x93902006  ! 942: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa480000a  ! 943: ADDcc_R	addcc 	%r0, %r10, %r18
	.word 0xe4ffc02a  ! 944: SWAPA_R	swapa	%r18, [%r31 + %r10] 0x01
	.word 0x81982004  ! 945: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0004, %hpstate
	.word 0x91d02032  ! 946: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x879021d6  ! 947: WRPR_TT_I	wrpr	%r0, 0x01d6, %tt
	.word 0x879020ae  ! 948: WRPR_TT_I	wrpr	%r0, 0x00ae, %tt
	.word 0x93902007  ! 949: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x82d4400c  ! 950: UMULcc_R	umulcc 	%r17, %r12, %r1
	.word 0x96d0e001  ! 951: UMULcc_I	umulcc 	%r3, 0x0001, %r11
	.word 0xb6c22001  ! 952: ADDCcc_I	addccc 	%r8, 0x0001, %r27
	.word 0x97504000  ! 953: RDPR_TNPC	rdpr	%tnpc, %r11
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 954: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 955: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x88f80008  ! 956: SDIVcc_R	sdivcc 	%r0, %r8, %r4
	.word 0x8790201e  ! 957: WRPR_TT_I	wrpr	%r0, 0x001e, %tt
	.word 0x8d902ade  ! 958: WRPR_PSTATE_I	wrpr	%r0, 0x0ade, %pstate
	.word 0x93902007  ! 959: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x819823d5  ! 960: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d5, %hpstate
	.word 0xb2aa0003  ! 961: ANDNcc_R	andncc 	%r8, %r3, %r25
	.word 0xa1902002  ! 962: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_tba_115:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 963: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902002  ! 964: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8790222e  ! 965: WRPR_TT_I	wrpr	%r0, 0x022e, %tt
	.word 0xa190200f  ! 966: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xf29fe001  ! 967: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r25
	.word 0xf28804a0  ! 968: LDUBA_R	lduba	[%r0, %r0] 0x25, %r25
	.word 0x91d02032  ! 969: Tcc_I	ta	icc_or_xcc, %r0 + 50
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 970: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_116:
	.word 0x32800001  ! 972: BNE	bne,a	<label_0x1>
	pdist %f30, %f16, %f6
	.word 0x81b5830d  ! 971: ALLIGNADDRESS	alignaddr	%r22, %r13, %r0
	.word 0x87902160  ! 972: WRPR_TT_I	wrpr	%r0, 0x0160, %tt
	.word 0xa6804015  ! 973: ADDcc_R	addcc 	%r1, %r21, %r19
	.word 0xe67fe001  ! 974: SWAP_I	swap	%r19, [%r31 + 0x0001]
	.word 0x8198298e  ! 975: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098e, %hpstate
	.word 0x93902002  ! 976: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902005  ! 977: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x91d02033  ! 978: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87902154  ! 979: WRPR_TT_I	wrpr	%r0, 0x0154, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xe737e001  ! 981: STQF_I	-	%f19, [0x0001, %r31]
	.word 0xe6800a60  ! 982: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r19
	.word 0xa190200a  ! 983: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xb3514000  ! 984: RDPR_TBA	rdpr	%tba, %r25
	.word 0x81982f45  ! 985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f45, %hpstate
	.word 0x8d902a9b  ! 986: WRPR_PSTATE_I	wrpr	%r0, 0x0a9b, %pstate
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 987: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 988: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02030  ! 989: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xf2800aa0  ! 990: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r25
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 991: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879023ce  ! 992: WRPR_TT_I	wrpr	%r0, 0x03ce, %tt
	.word 0x97508000  ! 993: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0xd697e010  ! 994: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
	.word 0x93902001  ! 995: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd737c015  ! 997: STQF_R	-	%f11, [%r21, %r31]
	.word 0x91d02034  ! 998: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902003  ! 999: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_117:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1000: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1001: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd68008a0  ! 1002: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x8198275d  ! 1003: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075d, %hpstate
	.word 0x87902118  ! 1004: WRPR_TT_I	wrpr	%r0, 0x0118, %tt
	.word 0xd7e7c035  ! 1005: CASA_I	casa	[%r31] 0x 1, %r21, %r11
	.word 0x91d02032  ! 1006: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd647c000  ! 1007: LDSW_R	ldsw	[%r31 + %r0], %r11
DS_118:
	.word 0x22800001  ! 1009: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1008: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x879020e1  ! 1009: WRPR_TT_I	wrpr	%r0, 0x00e1, %tt
	.word 0x38800001  ! 1010: BGU	bgu,a	<label_0x1>
	.word 0x93902003  ! 1011: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_randtl_119:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1012: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xa190200d  ! 1013: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa7514000  ! 1014: RDPR_TBA	rdpr	%tba, %r19
	.word 0x93902004  ! 1015: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1016: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1017: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902002  ! 1019: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x99504000  ! 1020: RDPR_TNPC	rdpr	%tnpc, %r12
	.word 0x93902003  ! 1021: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd93fe001  ! 1022: STDF_I	std	%f12, [0x0001, %r31]
	.word 0xa1902005  ! 1023: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8790204a  ! 1024: WRPR_TT_I	wrpr	%r0, 0x004a, %tt
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1025: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8150c000  ! 1026: RDPR_TT	rdpr	%tt, %r0
	.word 0x9f802001  ! 1027: SIR	sir	0x0001
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902002  ! 1029: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x26700001  ! 1030: BPL	<illegal instruction>
	.word 0x93902003  ! 1031: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x83d02030  ! 1032: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x81982a1c  ! 1033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1c, %hpstate
	.word 0x8198255d  ! 1034: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055d, %hpstate
	.word 0x8d690004  ! 1035: SDIVX_R	sdivx	%r4, %r4, %r6
	.word 0x879020df  ! 1036: WRPR_TT_I	wrpr	%r0, 0x00df, %tt
	.word 0xcc47c000  ! 1037: LDSW_R	ldsw	[%r31 + %r0], %r6
DS_120:
	.word 0x34800001  ! 1039: BG	bg,a	<label_0x1>
	.word 0xcb36a001  ! 1039: STQF_I	-	%f5, [0x0001, %r26]
	normalw
	.word 0xb7458000  ! 1038: RD_SOFTINT_REG	rd	%softint, %r27
	.word 0x8d9026d9  ! 1039: WRPR_PSTATE_I	wrpr	%r0, 0x06d9, %pstate
	.word 0x9b6e8003  ! 1040: SDIVX_R	sdivx	%r26, %r3, %r13
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1041: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 1042: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xda17c000  ! 1043: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0x8d500000  ! 1044: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x9f802001  ! 1045: SIR	sir	0x0001
	.word 0xcc8008a0  ! 1046: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x87802016  ! 1047: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9f802001  ! 1048: SIR	sir	0x0001
	.word 0x91d02033  ! 1049: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8790213b  ! 1050: WRPR_TT_I	wrpr	%r0, 0x013b, %tt
	.word 0x87902035  ! 1051: WRPR_TT_I	wrpr	%r0, 0x0035, %tt
	.word 0x8d90268f  ! 1052: WRPR_PSTATE_I	wrpr	%r0, 0x068f, %pstate
	.word 0x879022ef  ! 1053: WRPR_TT_I	wrpr	%r0, 0x02ef, %tt
	.word 0x93902000  ! 1054: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902e01  ! 1055: WRPR_PSTATE_I	wrpr	%r0, 0x0e01, %pstate
	.word 0xcc8008a0  ! 1056: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x91d02034  ! 1057: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8ed8400b  ! 1058: SMULcc_R	smulcc 	%r1, %r11, %r7
	.word 0x97504000  ! 1059: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0x91d02031  ! 1060: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8086e001  ! 1061: ADDcc_I	addcc 	%r27, 0x0001, %r0
	.word 0xc0cfe020  ! 1062: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r0
DS_121:
	.word 0x20800001  ! 1064: BN	bn,a	<label_0x1>
	pdist %f14, %f18, %f18
	.word 0x97b00303  ! 1063: ALLIGNADDRESS	alignaddr	%r0, %r3, %r11
	.word 0x93902005  ! 1064: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87802089  ! 1065: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd657e001  ! 1066: LDSH_I	ldsh	[%r31 + 0x0001], %r11
	.word 0x87902156  ! 1067: WRPR_TT_I	wrpr	%r0, 0x0156, %tt
	.word 0x8fa489e1  ! 1068: FDIVq	dis not found

	.word 0x93902001  ! 1069: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_122:
	.word 0x32800001  ! 1071: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1070: SAVE_R	save	%r31, %r0, %r31
	.word 0x93d02035  ! 1071: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_tba_123:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1072: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1074: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93a20d20  ! 1075: FsMULd	fsmuld	%f8, %f0, %f40
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1077: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982b56  ! 1078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b56, %hpstate
	.word 0x99902000  ! 1079: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xd2800ae0  ! 1080: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r9
	.word 0x91d02035  ! 1081: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8790239d  ! 1082: WRPR_TT_I	wrpr	%r0, 0x039d, %tt
	.word 0x91a20dd8  ! 1083: FdMULq	fdmulq	
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1084: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 1085: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02030  ! 1086: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x83d02034  ! 1087: Tcc_I	te	icc_or_xcc, %r0 + 52
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1088: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790238f  ! 1089: WRPR_TT_I	wrpr	%r0, 0x038f, %tt
	.word 0x92680018  ! 1090: UDIVX_R	udivx 	%r0, %r24, %r9
	.word 0x91d02033  ! 1091: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802004  ! 1092: WRASI_I	wr	%r0, 0x0004, %asi
splash_htba_124:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1093: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87902245  ! 1094: WRPR_TT_I	wrpr	%r0, 0x0245, %tt
	.word 0x91d02032  ! 1095: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x83d02031  ! 1096: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x91d02031  ! 1097: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xd337e001  ! 1098: STQF_I	-	%f9, [0x0001, %r31]
	.word 0x8d902285  ! 1099: WRPR_PSTATE_I	wrpr	%r0, 0x0285, %pstate
	.word 0xd2c00e40  ! 1100: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r9
	.word 0x81982e1d  ! 1101: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1d, %hpstate
	.word 0x8d802000  ! 1102: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1103: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87a01a60  ! 1104: FqTOi	fqtoi	
	.word 0x87802016  ! 1105: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc68008a0  ! 1106: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x9f802001  ! 1107: SIR	sir	0x0001
	.word 0x8f51c000  ! 1108: RDPR_TL	rdpr	%tl, %r7
	.word 0x9868e001  ! 1109: UDIVX_I	udivx 	%r3, 0x0001, %r12
	.word 0x9f802001  ! 1110: SIR	sir	0x0001
	.word 0x8d902a81  ! 1111: WRPR_PSTATE_I	wrpr	%r0, 0x0a81, %pstate
splash_tba_125:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1112: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902487  ! 1113: WRPR_PSTATE_I	wrpr	%r0, 0x0487, %pstate
	.word 0x8198270f  ! 1114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070f, %hpstate
DS_126:
	.word 0x32800001  ! 1116: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1115: SAVE_R	save	%r31, %r0, %r31
	.word 0xd937c000  ! 1116: STQF_R	-	%f12, [%r0, %r31]
	.word 0x87902068  ! 1117: WRPR_TT_I	wrpr	%r0, 0x0068, %tt
	.word 0xd88008a0  ! 1118: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
change_to_tl1_127:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
splash_tba_128:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1120: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902001  ! 1121: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_htba_129:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1122: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8198278f  ! 1123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078f, %hpstate
splash_htba_130:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1124: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_PRIV	! macro
	.word 0x81a0c9f1  ! 1126: FDIVq	dis not found

	.word 0xc1e7c031  ! 1127: CASA_I	casa	[%r31] 0x 1, %r17, %r0
	.word 0x81982b85  ! 1128: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b85, %hpstate
	.word 0x93902002  ! 1129: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93504000  ! 1130: RDPR_TNPC	rdpr	%tnpc, %r9
	ta	T_CHANGE_HPRIV	! macro
splash_htba_131:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1132: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87902051  ! 1133: WRPR_TT_I	wrpr	%r0, 0x0051, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902002  ! 1135: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d902208  ! 1136: WRPR_PSTATE_I	wrpr	%r0, 0x0208, %pstate
splash_cmpr_132:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186e001  ! 1137: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0x879022d6  ! 1138: WRPR_TT_I	wrpr	%r0, 0x02d6, %tt
splash_cmpr_133:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1140: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186e001  ! 1139: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0x87902237  ! 1140: WRPR_TT_I	wrpr	%r0, 0x0237, %tt
	.word 0x819825d4  ! 1141: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d4, %hpstate
	.word 0x879021f6  ! 1142: WRPR_TT_I	wrpr	%r0, 0x01f6, %tt
	.word 0x93902002  ! 1143: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982315  ! 1144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0315, %hpstate
splash_tba_134:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1145: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902003  ! 1146: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x819827dc  ! 1147: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07dc, %hpstate
	.word 0x879022f1  ! 1148: WRPR_TT_I	wrpr	%r0, 0x02f1, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8780201c  ! 1150: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x819821d6  ! 1151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d6, %hpstate
	.word 0x93902005  ! 1152: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f802001  ! 1153: SIR	sir	0x0001
	.word 0xa150c000  ! 1154: RDPR_TT	rdpr	%tt, %r16
	.word 0x81982f87  ! 1155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f87, %hpstate
	.word 0x81982c4d  ! 1156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4d, %hpstate
	.word 0x879020c0  ! 1157: WRPR_TT_I	wrpr	%r0, 0x00c0, %tt
	.word 0x99a48dda  ! 1158: FdMULq	fdmulq	
	.word 0xa7514000  ! 1159: RDPR_TBA	rdpr	%tba, %r19
	.word 0x8790230e  ! 1160: WRPR_TT_I	wrpr	%r0, 0x030e, %tt
	.word 0xe68008a0  ! 1161: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1162: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_135:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1163: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x87902045  ! 1164: WRPR_TT_I	wrpr	%r0, 0x0045, %tt
	.word 0x879023d9  ! 1165: WRPR_TT_I	wrpr	%r0, 0x03d9, %tt
	.word 0xa085e001  ! 1166: ADDcc_I	addcc 	%r23, 0x0001, %r16
	.word 0xe0800c60  ! 1167: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r16
	.word 0x91d02034  ! 1168: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 1169: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879023a4  ! 1170: WRPR_TT_I	wrpr	%r0, 0x03a4, %tt
	.word 0x87902131  ! 1171: WRPR_TT_I	wrpr	%r0, 0x0131, %tt
	.word 0xe127e001  ! 1172: STF_I	st	%f16, [0x0001, %r31]
	.word 0x9469a001  ! 1173: UDIVX_I	udivx 	%r6, 0x0001, %r10
	.word 0x8d902a94  ! 1174: WRPR_PSTATE_I	wrpr	%r0, 0x0a94, %pstate
	.word 0x8d90220d  ! 1175: WRPR_PSTATE_I	wrpr	%r0, 0x020d, %pstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1176: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_136:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1178: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x92814018  ! 1179: ADDcc_R	addcc 	%r5, %r24, %r9
	.word 0x96804002  ! 1180: ADDcc_R	addcc 	%r1, %r2, %r11
	.word 0x97a30dc6  ! 1181: FdMULq	fdmulq	
	.word 0xa751c000  ! 1182: RDPR_TL	rdpr	%tl, %r19
	.word 0x3c800001  ! 1183: BPOS	bpos,a	<label_0x1>
	.word 0xe6800ae0  ! 1184: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r19
	.word 0xa1902000  ! 1185: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x916b000d  ! 1186: SDIVX_R	sdivx	%r12, %r13, %r8
	.word 0x81982a8d  ! 1187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8d, %hpstate
	.word 0x24700001  ! 1188: BPLE	<illegal instruction>
	.word 0x819822d4  ! 1189: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d4, %hpstate
	.word 0xa8f96001  ! 1190: SDIVcc_I	sdivcc 	%r5, 0x0001, %r20
	.word 0xaed1400c  ! 1191: UMULcc_R	umulcc 	%r5, %r12, %r23
	.word 0x93d02031  ! 1192: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8d902081  ! 1193: WRPR_PSTATE_I	wrpr	%r0, 0x0081, %pstate
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1194: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 1195: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xee8008a0  ! 1196: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0x82fb4009  ! 1197: SDIVcc_R	sdivcc 	%r13, %r9, %r1
	.word 0x8198279e  ! 1198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079e, %hpstate
splash_htba_137:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1199: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xb1a10dc4  ! 1200: FdMULq	fdmulq	
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1201: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83500000  ! 1202: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x8d802000  ! 1203: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1204: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1205: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902005  ! 1206: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	ta	T_CHANGE_PRIV	! macro
splash_htba_138:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1208: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93d02032  ! 1209: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x82f8e001  ! 1210: SDIVcc_I	sdivcc 	%r3, 0x0001, %r1
	.word 0x8d902459  ! 1211: WRPR_PSTATE_I	wrpr	%r0, 0x0459, %pstate
	.word 0xc2dfe030  ! 1212: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r1
	.word 0xc337e001  ! 1213: STQF_I	-	%f1, [0x0001, %r31]
	.word 0x93902001  ! 1214: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_tba_139:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1215: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802000  ! 1216: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902367  ! 1217: WRPR_TT_I	wrpr	%r0, 0x0367, %tt
	.word 0x8d90221c  ! 1218: WRPR_PSTATE_I	wrpr	%r0, 0x021c, %pstate
	.word 0xc277e001  ! 1219: STX_I	stx	%r1, [%r31 + 0x0001]
	.word 0x8b508000  ! 1220: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0x81982a05  ! 1221: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a05, %hpstate
	.word 0x93902000  ! 1222: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x99500000  ! 1223: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x38800001  ! 1224: BGU	bgu,a	<label_0x1>
	.word 0x9f802001  ! 1225: SIR	sir	0x0001
	.word 0x91d02031  ! 1226: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d802000  ! 1227: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_140:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181a001  ! 1228: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x87902387  ! 1229: WRPR_TT_I	wrpr	%r0, 0x0387, %tt
	.word 0xd8d00e60  ! 1230: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r12
	.word 0xa190200e  ! 1231: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x879020ed  ! 1232: WRPR_TT_I	wrpr	%r0, 0x00ed, %tt
	.word 0x93a01a60  ! 1233: FqTOi	fqtoi	
	.word 0x91d02032  ! 1234: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8790217a  ! 1235: WRPR_TT_I	wrpr	%r0, 0x017a, %tt
	.word 0x30800001  ! 1236: BA	ba,a	<label_0x1>
	.word 0xa1902004  ! 1237: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x85a1c9f5  ! 1238: FDIVq	dis not found

	ta	T_CHANGE_HPRIV	! macro
	.word 0x879020a6  ! 1240: WRPR_TT_I	wrpr	%r0, 0x00a6, %tt
	.word 0x9681e001  ! 1241: ADDcc_I	addcc 	%r7, 0x0001, %r11
	.word 0x30800001  ! 1242: BA	ba,a	<label_0x1>
	.word 0xa1902008  ! 1243: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d802004  ! 1244: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87902211  ! 1245: WRPR_TT_I	wrpr	%r0, 0x0211, %tt
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1246: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982705  ! 1247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0705, %hpstate
	.word 0xd6ffc035  ! 1248: SWAPA_R	swapa	%r11, [%r31 + %r21] 0x01
	.word 0x8f508000  ! 1249: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0xcebfe001  ! 1250: STDA_I	stda	%r7, [%r31 + 0x0001] %asi
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1251: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x85a01a65  ! 1252: FqTOi	fqtoi	
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1253: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d90244c  ! 1254: WRPR_PSTATE_I	wrpr	%r0, 0x044c, %pstate
	.word 0x91d02030  ! 1255: Tcc_I	ta	icc_or_xcc, %r0 + 48
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 1256: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902058  ! 1257: WRPR_TT_I	wrpr	%r0, 0x0058, %tt
	.word 0x96d46001  ! 1258: UMULcc_I	umulcc 	%r17, 0x0001, %r11
splash_htba_141:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1259: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
change_to_randtl_142:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1260: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x87902308  ! 1261: WRPR_TT_I	wrpr	%r0, 0x0308, %tt
splash_htba_143:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1262: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902005  ! 1263: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d9026df  ! 1264: WRPR_PSTATE_I	wrpr	%r0, 0x06df, %pstate
	.word 0x93902003  ! 1265: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_tl1_144:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xa190200e  ! 1268: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x99a1cdc7  ! 1269: FdMULq	fdmulq	
	.word 0x81982c84  ! 1270: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c84, %hpstate
	.word 0x93902003  ! 1271: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02033  ! 1272: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x97500000  ! 1273: RDPR_TPC	rdpr	%tpc, %r11
	.word 0xd68008a0  ! 1274: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_145:
	.word 0x22800001  ! 1276: BE	be,a	<label_0x1>
	pdist %f22, %f10, %f24
	.word 0x81b44314  ! 1275: ALLIGNADDRESS	alignaddr	%r17, %r20, %r0
splash_tba_146:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1276: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902003  ! 1277: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d902088  ! 1278: WRPR_PSTATE_I	wrpr	%r0, 0x0088, %pstate
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902178  ! 1280: WRPR_TT_I	wrpr	%r0, 0x0178, %tt
DS_147:
	.word 0x22800001  ! 1282: BE	be,a	<label_0x1>
	.word 0xc7322001  ! 1282: STQF_I	-	%f3, [0x0001, %r8]
	normalw
	.word 0x85458000  ! 1281: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x93b34fe4  ! 1282: FONES	fones	%f9
change_to_tl1_148:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d90225b  ! 1284: WRPR_PSTATE_I	wrpr	%r0, 0x025b, %pstate
	.word 0x9b51c000  ! 1285: RDPR_TL	rdpr	%tl, %r13
	.word 0x84fb2001  ! 1286: SDIVcc_I	sdivcc 	%r12, 0x0001, %r2
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1287: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 1288: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xaba000d9  ! 1289: FNEGd	fnegd	%f56, %f52
	.word 0x9f802001  ! 1290: SIR	sir	0x0001
	.word 0xa1902000  ! 1291: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x93902006  ! 1292: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d802000  ! 1293: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200c  ! 1294: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xb6aec007  ! 1295: ANDNcc_R	andncc 	%r27, %r7, %r27
	.word 0x93902006  ! 1296: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902e08  ! 1297: WRPR_PSTATE_I	wrpr	%r0, 0x0e08, %pstate
	.word 0x9f802001  ! 1298: SIR	sir	0x0001
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1299: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9750c000  ! 1300: RDPR_TT	rdpr	%tt, %r11
	.word 0x8d902c02  ! 1301: WRPR_PSTATE_I	wrpr	%r0, 0x0c02, %pstate
	.word 0x81500000  ! 1302: RDPR_TPC	rdpr	%tpc, %r0
DS_149:
	.word 0x34800001  ! 1304: BG	bg,a	<label_0x1>
	.word 0xc9302001  ! 1304: STQF_I	-	%f4, [0x0001, %r0]
	normalw
	.word 0xa7458000  ! 1303: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xa9a01a63  ! 1304: FqTOi	fqtoi	
DS_150:
	.word 0x20800001  ! 1306: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1305: SAVE_R	save	%r31, %r0, %r31
	.word 0x36800001  ! 1306: BGE	bge,a	<label_0x1>
splash_htba_151:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1307: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902004  ! 1308: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1309: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe89fe001  ! 1310: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r20
	.word 0x8d902816  ! 1311: WRPR_PSTATE_I	wrpr	%r0, 0x0816, %pstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1312: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb5a50d23  ! 1313: FsMULd	fsmuld	%f20, %f34, %f26
splash_cmpr_152:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180a001  ! 1314: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0xada1c9bb  ! 1315: FDIVs	fdivs	%f7, %f27, %f22
	.word 0x81982144  ! 1316: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0144, %hpstate
	.word 0xa1902006  ! 1317: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90204a  ! 1319: WRPR_PSTATE_I	wrpr	%r0, 0x004a, %pstate
	.word 0x91d02032  ! 1320: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa06b2001  ! 1321: UDIVX_I	udivx 	%r12, 0x0001, %r16
	.word 0x879020c5  ! 1322: WRPR_TT_I	wrpr	%r0, 0x00c5, %tt
change_to_randtl_153:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1323: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
DS_154:
	.word 0x22800001  ! 1325: BE	be,a	<label_0x1>
	.word 0xd7320006  ! 1325: STQF_R	-	%f11, [%r6, %r8]
	normalw
	.word 0x85458000  ! 1324: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x819825ce  ! 1325: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05ce, %hpstate
change_to_tl1_155:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02032  ! 1328: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902005  ! 1329: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1330: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_156:
	.word 0x32800001  ! 1332: BNE	bne,a	<label_0x1>
	.word 0xc332400b  ! 1332: STQF_R	-	%f1, [%r11, %r9]
	normalw
	.word 0x85458000  ! 1331: RD_SOFTINT_REG	rd	%softint, %r2
change_to_tl1_157:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x99902002  ! 1333: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa1902004  ! 1334: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9028cf  ! 1337: WRPR_PSTATE_I	wrpr	%r0, 0x08cf, %pstate
	.word 0x93902000  ! 1338: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9f802001  ! 1339: SIR	sir	0x0001
	.word 0xa190200a  ! 1340: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x83d02034  ! 1341: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d902ed9  ! 1342: WRPR_PSTATE_I	wrpr	%r0, 0x0ed9, %pstate
	.word 0x99500000  ! 1343: RDPR_TPC	rdpr	%tpc, %r12
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1344: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8880e40  ! 1345: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9ba00568  ! 1347: FSQRTq	fsqrt	
	.word 0x8d9020c1  ! 1348: WRPR_PSTATE_I	wrpr	%r0, 0x00c1, %pstate
	.word 0x879023c5  ! 1349: WRPR_TT_I	wrpr	%r0, 0x03c5, %tt
	.word 0xa190200a  ! 1350: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8198254f  ! 1351: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054f, %hpstate
	.word 0xa1902000  ! 1352: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8fa309b5  ! 1353: FDIVs	fdivs	%f12, %f21, %f7
	.word 0xa668e001  ! 1354: UDIVX_I	udivx 	%r3, 0x0001, %r19
	.word 0x2a800001  ! 1355: BCS	bcs,a	<label_0x1>
	.word 0x81982346  ! 1356: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0346, %hpstate
	.word 0xb1508000  ! 1357: RDPR_TSTATE	rdpr	%tstate, %r24
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1358: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982d5c  ! 1359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5c, %hpstate
	.word 0xa1902003  ! 1360: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xb7508000  ! 1361: RDPR_TSTATE	rdpr	%tstate, %r27
DS_158:
	.word 0x20800001  ! 1363: BN	bn,a	<label_0x1>
	pdist %f24, %f14, %f14
	.word 0xabb2c316  ! 1362: ALLIGNADDRESS	alignaddr	%r11, %r22, %r21
	.word 0x87902245  ! 1363: WRPR_TT_I	wrpr	%r0, 0x0245, %tt
	.word 0x87902311  ! 1364: WRPR_TT_I	wrpr	%r0, 0x0311, %tt
	.word 0x83d02030  ! 1365: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xeb27c016  ! 1366: STF_R	st	%f21, [%r22, %r31]
DS_159:
	.word 0x34800001  ! 1368: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1368: BNE	bne,a	<label_0x1>
	.word 0xc9128009  ! 1368: LDQF_R	-	[%r10, %r9], %f4
	.word 0x83a2082d  ! 1367: FADDs	fadds	%f8, %f13, %f1
	.word 0x93902000  ! 1368: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x85702001  ! 1369: POPC_I	popc	0x0001, %r2
	.word 0xa5540000  ! 1370: RDPR_GL	rdpr	%-, %r18
	.word 0x8d90220b  ! 1371: WRPR_PSTATE_I	wrpr	%r0, 0x020b, %pstate
	.word 0x819821c4  ! 1372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c4, %hpstate
	.word 0x8da14dd5  ! 1373: FdMULq	fdmulq	
	.word 0x8d9026d1  ! 1374: WRPR_PSTATE_I	wrpr	%r0, 0x06d1, %pstate
	.word 0xa1902008  ! 1375: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902006  ! 1377: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 1379: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902480  ! 1381: WRPR_PSTATE_I	wrpr	%r0, 0x0480, %pstate
	.word 0x91d02032  ! 1382: Tcc_I	ta	icc_or_xcc, %r0 + 50
reduce_priv_level_160:
	.word 0x8f902000  ! 1384: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 1383: SIAM	siam	1
	.word 0xcc8008a0  ! 1384: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x81982bd7  ! 1385: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd7, %hpstate
DS_161:
	.word 0x20800001  ! 1387: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1386: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9f802001  ! 1387: SIR	sir	0x0001
	.word 0x8f504000  ! 1388: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x91d02035  ! 1389: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xaf500000  ! 1390: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x91d02033  ! 1391: Tcc_I	ta	icc_or_xcc, %r0 + 51
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1392: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902005  ! 1394: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902e58  ! 1395: WRPR_PSTATE_I	wrpr	%r0, 0x0e58, %pstate
	.word 0x91d02030  ! 1396: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xee800c00  ! 1397: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r23
	.word 0x9a484005  ! 1398: MULX_R	mulx 	%r1, %r5, %r13
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa190200c  ! 1400: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87902187  ! 1401: WRPR_TT_I	wrpr	%r0, 0x0187, %tt
	.word 0xa1902005  ! 1402: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8790215e  ! 1403: WRPR_TT_I	wrpr	%r0, 0x015e, %tt
DS_162:
	.word 0x32800001  ! 1405: BNE	bne,a	<label_0x1>
	.xword 0xf35fd039	! Random illegal ?
	.word 0xe7108002  ! 1405: LDQF_R	-	[%r2, %r2], %f19
	.word 0x97a0c837  ! 1404: FADDs	fadds	%f3, %f23, %f11
	.word 0x83d02034  ! 1405: Tcc_I	te	icc_or_xcc, %r0 + 52
reduce_priv_level_163:
	.word 0x8f902001  ! 1407: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7a01961  ! 1406: FqTOd	dis not found

	.word 0x81982755  ! 1407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0755, %hpstate
reduce_priv_level_164:
	.word 0x8f902001  ! 1409: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8ba01963  ! 1408: FqTOd	dis not found

	.word 0x26700001  ! 1409: BPL	<illegal instruction>
	.word 0xcac004a0  ! 1410: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0x879021a4  ! 1411: WRPR_TT_I	wrpr	%r0, 0x01a4, %tt
splash_tba_165:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1412: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879020bb  ! 1413: WRPR_TT_I	wrpr	%r0, 0x00bb, %tt
	.word 0x93902002  ! 1414: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d90245e  ! 1415: WRPR_PSTATE_I	wrpr	%r0, 0x045e, %pstate
	.word 0x93902002  ! 1416: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_htba_166:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1417: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902000  ! 1418: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1419: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_167:
	.word 0x20800001  ! 1421: BN	bn,a	<label_0x1>
	.word 0xe3332001  ! 1421: STQF_I	-	%f17, [0x0001, %r12]
	normalw
	.word 0x99458000  ! 1420: RD_SOFTINT_REG	rd	%softint, %r12
change_to_tl1_168:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xd9e7c023  ! 1422: CASA_I	casa	[%r31] 0x 1, %r3, %r12
change_to_tl1_169:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
splash_htba_170:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1424: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1425: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902172  ! 1426: WRPR_TT_I	wrpr	%r0, 0x0172, %tt
	.word 0x819826c5  ! 1427: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c5, %hpstate
	.word 0x91d02030  ! 1428: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902005  ! 1429: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa190200a  ! 1430: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d802000  ! 1431: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xb351c000  ! 1432: RDPR_TL	rdpr	%tl, %r25
	.word 0xf2d004a0  ! 1433: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r25
	.word 0x87a00544  ! 1434: FSQRTd	fsqrt	
	.word 0xa190200b  ! 1435: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93d02030  ! 1436: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x99902002  ! 1437: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x8d902650  ! 1438: WRPR_PSTATE_I	wrpr	%r0, 0x0650, %pstate
	.word 0x91d02033  ! 1439: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9f802001  ! 1440: SIR	sir	0x0001
splash_tba_171:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1441: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02031  ! 1442: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d90241c  ! 1443: WRPR_PSTATE_I	wrpr	%r0, 0x041c, %pstate
	.word 0x8fa000cb  ! 1444: FNEGd	fnegd	%f42, %f38
	.word 0xcec004a0  ! 1445: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xa46a6001  ! 1446: UDIVX_I	udivx 	%r9, 0x0001, %r18
	.word 0xb3a60d29  ! 1447: FsMULd	fsmuld	%f24, %f40, %f56
	.word 0x8d902496  ! 1448: WRPR_PSTATE_I	wrpr	%r0, 0x0496, %pstate
	.word 0xa1902001  ! 1449: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x9bb20ff1  ! 1450: FONES	fones	%f13
	.word 0x98fa8002  ! 1451: SDIVcc_R	sdivcc 	%r10, %r2, %r12
	.word 0x93902002  ! 1452: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_172:
	.word 0x22800001  ! 1454: BE	be,a	<label_0x1>
	pdist %f0, %f4, %f4
	.word 0xb7b48311  ! 1453: ALLIGNADDRESS	alignaddr	%r18, %r17, %r27
	.word 0x81982f5c  ! 1454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5c, %hpstate
	.word 0x91d02032  ! 1455: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902002  ! 1456: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1457: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_173:
	.word 0x32800001  ! 1459: BNE	bne,a	<label_0x1>
	pdist %f0, %f2, %f8
	.word 0xa9b00306  ! 1458: ALLIGNADDRESS	alignaddr	%r0, %r6, %r20
	.word 0x8e832001  ! 1459: ADDcc_I	addcc 	%r12, 0x0001, %r7
	.word 0x96c2e001  ! 1460: ADDCcc_I	addccc 	%r11, 0x0001, %r11
	.word 0x2c700001  ! 1461: BPNEG	<illegal instruction>
	.word 0x93902003  ! 1462: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1463: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 1464: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8ed1c003  ! 1465: UMULcc_R	umulcc 	%r7, %r3, %r7
	.word 0x93902005  ! 1466: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x99902003  ! 1467: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
DS_174:
	.word 0x32800001  ! 1469: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1468: SAVE_R	save	%r31, %r0, %r31
	.word 0x93514000  ! 1469: RDPR_TBA	rdpr	%tba, %r9
	.word 0xa1902009  ! 1470: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93d02033  ! 1471: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d802000  ! 1472: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02031  ! 1473: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xab51c000  ! 1474: RDPR_TL	rdpr	%tl, %r21
	.word 0x8d902659  ! 1475: WRPR_PSTATE_I	wrpr	%r0, 0x0659, %pstate
	.word 0x99902002  ! 1476: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x81982d9c  ! 1477: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9c, %hpstate
	.word 0xea7fe001  ! 1478: SWAP_I	swap	%r21, [%r31 + 0x0001]
	.word 0x91d02035  ! 1479: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x89500000  ! 1480: RDPR_TPC	rdpr	%tpc, %r4
	.word 0xc837c003  ! 1481: STH_R	sth	%r4, [%r31 + %r3]
	.word 0xc88804a0  ! 1482: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	.word 0xc847e001  ! 1483: LDSW_I	ldsw	[%r31 + 0x0001], %r4
	.word 0x93902001  ! 1484: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_175:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1485: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x8f508000  ! 1486: RDPR_TSTATE	rdpr	%tstate, %r7
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 1488: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87802088  ! 1489: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802004  ! 1490: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9ba209c5  ! 1491: FDIVd	fdivd	%f8, %f36, %f44
	.word 0xdad004a0  ! 1492: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
DS_176:
	.word 0x20800001  ! 1494: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1493: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902000  ! 1494: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87902213  ! 1496: WRPR_TT_I	wrpr	%r0, 0x0213, %tt
	.word 0x93902004  ! 1497: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02030  ! 1499: Tcc_I	ta	icc_or_xcc, %r0 + 48
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1500: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9a24d35  ! 1501: FsMULd	fsmuld	%f9, %f52, %f20
	.word 0x8d902a8c  ! 1502: WRPR_PSTATE_I	wrpr	%r0, 0x0a8c, %pstate
	.word 0xe8c7e000  ! 1503: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r20
	.word 0x8d902e8d  ! 1504: WRPR_PSTATE_I	wrpr	%r0, 0x0e8d, %pstate
	.word 0x87802004  ! 1505: WRASI_I	wr	%r0, 0x0004, %asi
splash_cmpr_177:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1507: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181a001  ! 1506: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x879023f3  ! 1507: WRPR_TT_I	wrpr	%r0, 0x03f3, %tt
	.word 0x886b0009  ! 1508: UDIVX_R	udivx 	%r12, %r9, %r4
	.word 0x819822cd  ! 1509: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cd, %hpstate
	.word 0x93902006  ! 1510: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xb2a84012  ! 1511: ANDNcc_R	andncc 	%r1, %r18, %r25
	.word 0x93d02031  ! 1512: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x9f802001  ! 1513: SIR	sir	0x0001
	.word 0x91d02035  ! 1514: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1a01a73  ! 1515: FqTOi	fqtoi	
	.word 0xa190200b  ! 1516: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xb1508000  ! 1517: RDPR_TSTATE	rdpr	%tstate, %r24
change_to_tl1_178:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87802080  ! 1519: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x83d02030  ! 1520: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x91d02034  ! 1521: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x95a689b3  ! 1523: FDIVs	fdivs	%f26, %f19, %f10
	.word 0xa0d1a001  ! 1524: UMULcc_I	umulcc 	%r6, 0x0001, %r16
	.word 0xa1902003  ! 1525: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8f504000  ! 1526: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x9ba6c9cd  ! 1527: FDIVd	fdivd	%f58, %f44, %f44
reduce_priv_level_179:
	.word 0x8f902002  ! 1529: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8982c008  ! 1528: WRTICK_R	wr	%r11, %r8, %tick
	.word 0xa190200c  ! 1529: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x9ba6cdda  ! 1530: FdMULq	fdmulq	
	.word 0x85a00569  ! 1531: FSQRTq	fsqrt	
	.word 0x81982507  ! 1532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0507, %hpstate
	.word 0xc4d80e40  ! 1533: LDXA_R	ldxa	[%r0, %r0] 0x72, %r2
	.word 0xa3a5c9cb  ! 1534: FDIVd	fdivd	%f54, %f42, %f48
	.word 0xa190200e  ! 1535: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8790236d  ! 1536: WRPR_TT_I	wrpr	%r0, 0x036d, %tt
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1537: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_180:
	.word 0x20800001  ! 1539: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1538: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1540: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1541: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7508000  ! 1542: RDPR_TSTATE	rdpr	%tstate, %r19
DS_181:
	.word 0x20800001  ! 1544: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1543: SAVE_R	save	%r31, %r0, %r31
	.word 0x93902005  ! 1544: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_tba_182:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1545: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982306  ! 1546: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0306, %hpstate
	.word 0x91d02034  ! 1547: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_htba_183:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1548: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802000  ! 1549: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902a40  ! 1550: WRPR_PSTATE_I	wrpr	%r0, 0x0a40, %pstate
	.word 0x81982296  ! 1551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0296, %hpstate
	.word 0xa1902001  ! 1552: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1553: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 1554: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902813  ! 1555: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
splash_cmpr_184:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1842001  ! 1556: WR_STICK_REG_I	wr	%r16, 0x0001, %-
	.word 0x8790227e  ! 1557: WRPR_TT_I	wrpr	%r0, 0x027e, %tt
	.word 0x8d90245f  ! 1558: WRPR_PSTATE_I	wrpr	%r0, 0x045f, %pstate
	.word 0x879020f7  ! 1559: WRPR_TT_I	wrpr	%r0, 0x00f7, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02033  ! 1561: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa3514000  ! 1562: RDPR_TBA	rdpr	%tba, %r17
	.word 0xe21fe001  ! 1563: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0xa1a44d2d  ! 1564: FsMULd	fsmuld	%f17, %f44, %f16
	.word 0xa8fda001  ! 1565: SDIVcc_I	sdivcc 	%r22, 0x0001, %r20
	.word 0x93902003  ! 1566: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x879022c5  ! 1567: WRPR_TT_I	wrpr	%r0, 0x02c5, %tt
DS_185:
	.word 0x20800001  ! 1569: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1568: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9ba489c4  ! 1569: FDIVd	fdivd	%f18, %f4, %f44
	.word 0x93902004  ! 1570: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902ccc  ! 1571: WRPR_PSTATE_I	wrpr	%r0, 0x0ccc, %pstate
	.word 0x87a01a6d  ! 1572: FqTOi	fqtoi	
	.word 0x91a4c9a7  ! 1573: FDIVs	fdivs	%f19, %f7, %f8
	.word 0x9f802001  ! 1574: SIR	sir	0x0001
	.word 0xd047e001  ! 1575: LDSW_I	ldsw	[%r31 + 0x0001], %r8
splash_htba_186:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1576: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8c480011  ! 1577: MULX_R	mulx 	%r0, %r17, %r6
	.word 0x3e800001  ! 1578: BVC	bvc,a	<label_0x1>
reduce_priv_level_187:
	.word 0x8f902002  ! 1580: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81a0196a  ! 1579: FqTOd	dis not found

	.word 0x81982fcd  ! 1580: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcd, %hpstate
	.word 0xa190200c  ! 1581: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x83a00540  ! 1582: FSQRTd	fsqrt	
reduce_priv_level_188:
	.word 0x8f902002  ! 1584: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a01979  ! 1583: FqTOd	dis not found

	.word 0xe08008a0  ! 1584: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xa951c000  ! 1585: RDPR_TL	rdpr	%tl, %r20
	.word 0x30800001  ! 1586: BA	ba,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95b10feb  ! 1588: FONES	fones	%f10
	.word 0x8151c000  ! 1589: RDPR_TL	rdpr	%tl, %r0
	.word 0x8f504000  ! 1590: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x3c800001  ! 1591: BPOS	bpos,a	<label_0x1>
	.word 0xce07e001  ! 1592: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0xced7e030  ! 1593: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r7
	.word 0x8d90205c  ! 1594: WRPR_PSTATE_I	wrpr	%r0, 0x005c, %pstate
	.word 0x8790208c  ! 1595: WRPR_TT_I	wrpr	%r0, 0x008c, %tt
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1596: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1902002  ! 1598: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x9f802001  ! 1599: SIR	sir	0x0001
	.word 0x32800001  ! 1600: BNE	bne,a	<label_0x1>
	.word 0xa1902005  ! 1601: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa1902003  ! 1602: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa190200a  ! 1603: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8b684006  ! 1604: SDIVX_R	sdivx	%r1, %r6, %r5
	.word 0xb151c000  ! 1605: RDPR_TL	rdpr	%tl, %r24
	.word 0x87902391  ! 1606: WRPR_TT_I	wrpr	%r0, 0x0391, %tt
	.word 0x8198290f  ! 1607: WRHPR_HPSTATE_I	wrhpr	%r0, 0x090f, %hpstate
	.word 0x9b500000  ! 1608: RDPR_TPC	rdpr	%tpc, %r13
splash_htba_189:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1609: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa5a549bb  ! 1610: FDIVs	fdivs	%f21, %f27, %f18
	.word 0xe4ffc03b  ! 1611: SWAPA_R	swapa	%r18, [%r31 + %r27] 0x01
	.word 0xa190200e  ! 1612: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x91514000  ! 1613: RDPR_TBA	rdpr	%tba, %r8
	.word 0xd0c7e010  ! 1614: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r8
	.word 0x93902003  ! 1615: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x82d00018  ! 1616: UMULcc_R	umulcc 	%r0, %r24, %r1
	.word 0x93902005  ! 1617: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x89a48d2b  ! 1618: FsMULd	fsmuld	%f18, %f42, %f4
reduce_priv_level_190:
	.word 0x8f902000  ! 1620: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 1619: SIAM	siam	1
	.word 0x93500000  ! 1620: RDPR_TPC	rdpr	%tpc, %r9
	.word 0x8fa01a64  ! 1621: FqTOi	fqtoi	
	.word 0x93902004  ! 1622: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x879022ac  ! 1623: WRPR_TT_I	wrpr	%r0, 0x02ac, %tt
	.word 0x8d90264f  ! 1624: WRPR_PSTATE_I	wrpr	%r0, 0x064f, %pstate
	.word 0xcecfe010  ! 1625: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r7
	.word 0xce800b80  ! 1626: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r7
	.word 0x91d02030  ! 1627: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902003  ! 1628: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902007  ! 1629: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_191:
	.word 0x22800001  ! 1631: BE	be,a	<label_0x1>
	pdist %f20, %f26, %f28
	.word 0xabb20301  ! 1630: ALLIGNADDRESS	alignaddr	%r8, %r1, %r21
DS_192:
	.word 0x20800001  ! 1632: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1631: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902007  ! 1632: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_193:
	.word 0x34800001  ! 1634: BG	bg,a	<label_0x1>
	pdist %f4, %f28, %f18
	.word 0x85b00312  ! 1633: ALLIGNADDRESS	alignaddr	%r0, %r18, %r2
splash_htba_194:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1634: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d90260a  ! 1635: WRPR_PSTATE_I	wrpr	%r0, 0x060a, %pstate
	.word 0x9a494001  ! 1636: MULX_R	mulx 	%r5, %r1, %r13
	.word 0x91d02033  ! 1637: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1638: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9ad66001  ! 1639: UMULcc_I	umulcc 	%r25, 0x0001, %r13
	.word 0x8d802000  ! 1640: WRFPRS_I	wr	%r0, 0x0000, %fprs
change_to_tl1_195:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x30800001  ! 1642: BA	ba,a	<label_0x1>
	.word 0x9b540000  ! 1643: RDPR_GL	rdpr	%-, %r13
	.word 0x93902006  ! 1644: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_196:
	.word 0x22800001  ! 1646: BE	be,a	<label_0x1>
	.xword 0xa7c84491	! Random illegal ?
	.word 0xd7140000  ! 1646: LDQF_R	-	[%r16, %r0], %f11
	.word 0x93a1882a  ! 1645: FADDs	fadds	%f6, %f10, %f9
	.word 0xd29004a0  ! 1646: LDUHA_R	lduha	[%r0, %r0] 0x25, %r9
	.word 0x91d02032  ! 1647: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_tl1_197:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x96c46001  ! 1649: ADDCcc_I	addccc 	%r17, 0x0001, %r11
	.word 0x93a00555  ! 1650: FSQRTd	fsqrt	
	.word 0x8d90284f  ! 1651: WRPR_PSTATE_I	wrpr	%r0, 0x084f, %pstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1652: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd22fc015  ! 1653: STB_R	stb	%r9, [%r31 + %r21]
	.word 0x83504000  ! 1654: RDPR_TNPC	rdpr	%tnpc, %r1
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8f50c000  ! 1656: RDPR_TT	rdpr	%tt, %r7
	.word 0xa1902003  ! 1657: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa1902000  ! 1658: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x3e800001  ! 1659: BVC	bvc,a	<label_0x1>
	.word 0x91d02035  ! 1660: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8b51c000  ! 1661: RDPR_TL	rdpr	%tl, %r5
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1662: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83d02030  ! 1663: Tcc_I	te	icc_or_xcc, %r0 + 48
DS_198:
	.word 0x22800001  ! 1665: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1664: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x83d02034  ! 1665: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xca7fe001  ! 1666: SWAP_I	swap	%r5, [%r31 + 0x0001]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902a9f  ! 1668: WRPR_PSTATE_I	wrpr	%r0, 0x0a9f, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8ba01a62  ! 1670: FqTOi	fqtoi	
	.word 0x87902276  ! 1671: WRPR_TT_I	wrpr	%r0, 0x0276, %tt
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1672: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_199:
	.word 0x20800001  ! 1674: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1673: SAVE_R	save	%r31, %r0, %r31
change_to_tl1_200:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02030  ! 1675: Tcc_I	ta	icc_or_xcc, %r0 + 48
splash_htba_201:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1676: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902001  ! 1677: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_202:
	.word 0x34800001  ! 1679: BG	bg,a	<label_0x1>
	.xword 0xb7636171	! Random illegal ?
	.word 0xc715800c  ! 1679: LDQF_R	-	[%r22, %r12], %f3
	.word 0x99a5c824  ! 1678: FADDs	fadds	%f23, %f4, %f12
	.word 0x87902018  ! 1679: WRPR_TT_I	wrpr	%r0, 0x0018, %tt
	.word 0x8d902499  ! 1680: WRPR_PSTATE_I	wrpr	%r0, 0x0499, %pstate
	.word 0xd847e001  ! 1681: LDSW_I	ldsw	[%r31 + 0x0001], %r12
	.word 0x87902280  ! 1682: WRPR_TT_I	wrpr	%r0, 0x0280, %tt
splash_htba_203:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1683: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902005  ! 1684: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_cmpr_204:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1866001  ! 1685: WR_STICK_REG_I	wr	%r25, 0x0001, %-
	.word 0x91d02030  ! 1686: Tcc_I	ta	icc_or_xcc, %r0 + 48
splash_htba_205:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1687: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x98db4003  ! 1688: SMULcc_R	smulcc 	%r13, %r3, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99504000  ! 1690: RDPR_TNPC	rdpr	%tnpc, %r12
	.word 0x8d902e81  ! 1691: WRPR_PSTATE_I	wrpr	%r0, 0x0e81, %pstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1692: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1693: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902651  ! 1694: WRPR_PSTATE_I	wrpr	%r0, 0x0651, %pstate
	.word 0x93902005  ! 1695: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902202  ! 1696: WRPR_PSTATE_I	wrpr	%r0, 0x0202, %pstate
	.word 0x8198201e  ! 1697: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001e, %hpstate
	.word 0xb5a000c0  ! 1698: FNEGd	fnegd	%f0, %f26
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1699: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8fa01a73  ! 1700: FqTOi	fqtoi	
	.word 0xcf27c013  ! 1701: STF_R	st	%f7, [%r19, %r31]
	.word 0x8d51c000  ! 1702: RDPR_TL	rdpr	%tl, %r6
	.word 0x8151c000  ! 1703: RDPR_TL	rdpr	%tl, %r0
	.word 0xa1902005  ! 1704: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa190200b  ! 1705: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8198211e  ! 1706: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011e, %hpstate
	.word 0x91d02030  ! 1707: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x91d02030  ! 1708: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982607  ! 1710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0607, %hpstate
DS_206:
	.word 0x34800001  ! 1712: BG	bg,a	<label_0x1>
	.xword 0xad47d2fb	! Random illegal ?
	.word 0xe7130003  ! 1712: LDQF_R	-	[%r12, %r3], %f19
	.word 0x8da4c82d  ! 1711: FADDs	fadds	%f19, %f13, %f6
	.word 0x879022de  ! 1712: WRPR_TT_I	wrpr	%r0, 0x02de, %tt
splash_cmpr_207:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1714: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1836001  ! 1713: WR_STICK_REG_I	wr	%r13, 0x0001, %-
DS_208:
	.word 0x22800001  ! 1715: BE	be,a	<label_0x1>
	pdist %f28, %f28, %f28
	.word 0x9bb4c30c  ! 1714: ALLIGNADDRESS	alignaddr	%r19, %r12, %r13
	.word 0xa1902009  ! 1715: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902001  ! 1716: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_cmpr_209:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1718: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb185e001  ! 1717: WR_STICK_REG_I	wr	%r23, 0x0001, %-
	.word 0x8d902e98  ! 1718: WRPR_PSTATE_I	wrpr	%r0, 0x0e98, %pstate
	.word 0x93902001  ! 1719: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902004  ! 1720: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1721: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021e7  ! 1722: WRPR_TT_I	wrpr	%r0, 0x01e7, %tt
change_to_tl1_210:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8f702001  ! 1724: POPC_I	popc	0x0001, %r7
DS_211:
	.word 0x22800001  ! 1726: BE	be,a	<label_0x1>
	.word 0xcd35e001  ! 1726: STQF_I	-	%f6, [0x0001, %r23]
	normalw
	.word 0xab458000  ! 1725: RD_SOFTINT_REG	rd	%softint, %r21
	.word 0x91d02033  ! 1726: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x83500000  ! 1727: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x93902007  ! 1728: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902004  ! 1729: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x80fe4003  ! 1730: SDIVcc_R	sdivcc 	%r25, %r3, %r0
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa190200b  ! 1733: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1734: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99504000  ! 1735: RDPR_TNPC	rdpr	%tnpc, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0xa3a5c9e8  ! 1737: FDIVq	dis not found

	.word 0xa1902000  ! 1738: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xb3514000  ! 1739: RDPR_TBA	rdpr	%tba, %r25
DS_212:
	.word 0x20800001  ! 1741: BN	bn,a	<label_0x1>
	.word 0xc5324013  ! 1741: STQF_R	-	%f2, [%r19, %r9]
	normalw
	.word 0xad458000  ! 1740: RD_SOFTINT_REG	rd	%softint, %r22
splash_cmpr_213:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1742: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1846001  ! 1741: WR_STICK_REG_I	wr	%r17, 0x0001, %-
	.word 0x99500000  ! 1742: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa190200f  ! 1744: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x9b508000  ! 1745: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0x8790207c  ! 1746: WRPR_TT_I	wrpr	%r0, 0x007c, %tt
	.word 0x95500000  ! 1747: RDPR_TPC	rdpr	%tpc, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902025  ! 1749: WRPR_TT_I	wrpr	%r0, 0x0025, %tt
	.word 0xa950c000  ! 1750: RDPR_TT	rdpr	%tt, %r20
	.word 0x8d802004  ! 1751: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902005  ! 1752: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8b50c000  ! 1753: RDPR_TT	rdpr	%tt, %r5
	.word 0x9f802001  ! 1754: SIR	sir	0x0001
	.word 0x94c0e001  ! 1755: ADDCcc_I	addccc 	%r3, 0x0001, %r10
	.word 0x9aa8c017  ! 1756: ANDNcc_R	andncc 	%r3, %r23, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83a60dc8  ! 1758: FdMULq	fdmulq	
	.word 0x87902147  ! 1759: WRPR_TT_I	wrpr	%r0, 0x0147, %tt
	.word 0x8d90228f  ! 1760: WRPR_PSTATE_I	wrpr	%r0, 0x028f, %pstate
	.word 0x81982c9d  ! 1761: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9d, %hpstate
	.word 0x9f802001  ! 1762: SIR	sir	0x0001
	.word 0xa1902006  ! 1763: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87902325  ! 1764: WRPR_TT_I	wrpr	%r0, 0x0325, %tt
	.word 0x8d902e1c  ! 1765: WRPR_PSTATE_I	wrpr	%r0, 0x0e1c, %pstate
	.word 0x2e700001  ! 1766: BPVS	<illegal instruction>
	.word 0x93902002  ! 1767: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc28008a0  ! 1769: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x87902123  ! 1770: WRPR_TT_I	wrpr	%r0, 0x0123, %tt
	.word 0x91d02032  ! 1771: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9551c000  ! 1772: RDPR_TL	rdpr	%tl, %r10
splash_cmpr_214:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1856001  ! 1773: WR_STICK_REG_I	wr	%r21, 0x0001, %-
	.word 0x879021ac  ! 1774: WRPR_TT_I	wrpr	%r0, 0x01ac, %tt
change_to_tl1_215:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87540000  ! 1777: RDPR_GL	rdpr	%-, %r3
	.word 0x93902003  ! 1778: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x819821c6  ! 1779: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c6, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1780: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819828d5  ! 1781: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d5, %hpstate
	.word 0xa190200f  ! 1782: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1783: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3b50ff6  ! 1784: FONES	fones	%f17
reduce_priv_level_216:
	.word 0x8f902002  ! 1786: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x936b2001  ! 1785: SDIVX_I	sdivx	%r12, 0x0001, %r9
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902005  ! 1787: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa190200a  ! 1788: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x91d02035  ! 1789: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902215  ! 1790: WRPR_PSTATE_I	wrpr	%r0, 0x0215, %pstate
	.word 0x8d90249f  ! 1791: WRPR_PSTATE_I	wrpr	%r0, 0x049f, %pstate
	.word 0xa1902007  ! 1792: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8790234e  ! 1793: WRPR_TT_I	wrpr	%r0, 0x034e, %tt
	.word 0xd2800a60  ! 1794: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r9
	.word 0x81b20fe2  ! 1795: FONES	fones	%f0
	.word 0xa1902001  ! 1796: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_cmpr_217:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1798: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180e001  ! 1797: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x93500000  ! 1798: RDPR_TPC	<illegal instruction>
	.word 0x8d802004  ! 1799: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_htba_218:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1800: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd2800be0  ! 1801: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r9
	.word 0x8d802000  ! 1802: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 1803: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902000  ! 1804: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902007  ! 1805: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_cmpr_219:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1807: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1852001  ! 1806: WR_STICK_REG_I	wr	%r20, 0x0001, %-
change_to_tl1_220:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02032  ! 1808: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02032  ! 1809: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_221:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1810: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8d902218  ! 1811: WRPR_PSTATE_I	wrpr	%r0, 0x0218, %pstate
DS_222:
	.word 0x20800001  ! 1813: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1812: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02035  ! 1813: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8790220b  ! 1814: WRPR_TT_I	wrpr	%r0, 0x020b, %tt
	.word 0xa190200d  ! 1815: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x83d02030  ! 1816: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x879023e8  ! 1817: WRPR_TT_I	wrpr	%r0, 0x03e8, %tt
	.word 0x916c800c  ! 1818: SDIVX_R	sdivx	%r18, %r12, %r8
	.word 0x93d02031  ! 1819: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x879021ae  ! 1820: WRPR_TT_I	wrpr	%r0, 0x01ae, %tt
	.word 0xd07fe001  ! 1821: SWAP_I	swap	%r8, [%r31 + 0x0001]
	.word 0x8198251d  ! 1822: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051d, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1823: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_223:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1824: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x93902005  ! 1825: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902a98  ! 1826: WRPR_PSTATE_I	wrpr	%r0, 0x0a98, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xb7a2cdca  ! 1828: FdMULq	fdmulq	
	.word 0xf73fc00a  ! 1829: STDF_R	std	%f27, [%r10, %r31]
	.word 0x91d02032  ! 1830: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02035  ! 1831: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa751c000  ! 1832: RDPR_TL	rdpr	%tl, %r19
	.word 0x92c2e001  ! 1833: ADDCcc_I	addccc 	%r11, 0x0001, %r9
	.word 0x83d02035  ! 1834: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x81982fce  ! 1835: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fce, %hpstate
	.word 0x879022de  ! 1836: WRPR_TT_I	wrpr	%r0, 0x02de, %tt
DS_224:
	.word 0x34800001  ! 1838: BG	bg,a	<label_0x1>
	.xword 0x85fe7adc	! Random illegal ?
	.word 0xb1a0055a  ! 1838: FSQRTd	fsqrt	
	.word 0x99a2c829  ! 1837: FADDs	fadds	%f11, %f9, %f12
	.word 0x8790203c  ! 1838: WRPR_TT_I	wrpr	%r0, 0x003c, %tt
	.word 0x8550c000  ! 1839: RDPR_TT	rdpr	%tt, %r2
change_to_randtl_225:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1840: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
splash_htba_226:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1841: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_227:
	.word 0x34800001  ! 1843: BG	bg,a	<label_0x1>
	.word 0xcf330000  ! 1843: STQF_R	-	%f7, [%r0, %r12]
	normalw
	.word 0x95458000  ! 1842: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd4ffc020  ! 1843: SWAPA_R	swapa	%r10, [%r31 + %r0] 0x01
	.word 0xd48008a0  ! 1844: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x9350c000  ! 1845: RDPR_TT	rdpr	%tt, %r9
	.word 0x87902174  ! 1846: WRPR_TT_I	wrpr	%r0, 0x0174, %tt
	.word 0x93902006  ! 1847: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93d02034  ! 1848: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x879020b6  ! 1849: WRPR_TT_I	wrpr	%r0, 0x00b6, %tt
splash_tba_228:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1850: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_229:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1851: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1852: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819824c6  ! 1853: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c6, %hpstate
splash_tba_230:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1854: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1855: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 1856: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_htba_231:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1857: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902007  ! 1858: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x85508000  ! 1859: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x86c26001  ! 1860: ADDCcc_I	addccc 	%r9, 0x0001, %r3
reduce_priv_level_232:
	.word 0x8f902002  ! 1862: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89818001  ! 1861: WRTICK_R	wr	%r6, %r1, %tick
splash_htba_233:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1862: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902002  ! 1863: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc6cfe020  ! 1864: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r3
	.word 0xc7e7c021  ! 1865: CASA_I	casa	[%r31] 0x 1, %r1, %r3
	.word 0x8f51c000  ! 1866: RDPR_TL	rdpr	%tl, %r7
	.word 0x8d902cd7  ! 1867: WRPR_PSTATE_I	wrpr	%r0, 0x0cd7, %pstate
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1868: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_234:
	.word 0x22800001  ! 1870: BE	be,a	<label_0x1>
	.word 0xc9306001  ! 1870: STQF_I	-	%f4, [0x0001, %r1]
	normalw
	.word 0x9b458000  ! 1869: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x8790211d  ! 1870: WRPR_TT_I	wrpr	%r0, 0x011d, %tt
	.word 0xa190200c  ! 1871: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8a68c01a  ! 1872: UDIVX_R	udivx 	%r3, %r26, %r5
DS_235:
	.word 0x22800001  ! 1874: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1874: BE	be,a	<label_0x1>
	.word 0xdb124005  ! 1874: LDQF_R	-	[%r9, %r5], %f13
	.word 0x9ba24821  ! 1873: FADDs	fadds	%f9, %f1, %f13
	.word 0xda7fe001  ! 1874: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x81982fd7  ! 1875: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd7, %hpstate
	.word 0x81982a0f  ! 1876: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0f, %hpstate
	.word 0x8d802004  ! 1877: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902004  ! 1878: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xaef8e001  ! 1879: SDIVcc_I	sdivcc 	%r3, 0x0001, %r23
	.word 0x8d902e15  ! 1880: WRPR_PSTATE_I	wrpr	%r0, 0x0e15, %pstate
	.word 0x8198251f  ! 1881: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051f, %hpstate
	.word 0x91d02034  ! 1882: Tcc_I	ta	icc_or_xcc, %r0 + 52
reduce_priv_level_236:
	.word 0x8f902000  ! 1884: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1864016  ! 1883: WR_STICK_REG_R	wr	%r25, %r22, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0xeed004a0  ! 1885: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r23
	ta	T_CHANGE_PRIV	! macro
DS_237:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1887: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x879023e7  ! 1888: WRPR_TT_I	wrpr	%r0, 0x03e7, %tt
	.word 0xa190200f  ! 1889: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d902c94  ! 1890: WRPR_PSTATE_I	wrpr	%r0, 0x0c94, %pstate
	.word 0xafb60ff4  ! 1891: FONES	fones	%f23
	.word 0x87802088  ! 1892: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93500000  ! 1893: RDPR_TPC	rdpr	%tpc, %r9
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1894: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8cac0011  ! 1895: ANDNcc_R	andncc 	%r16, %r17, %r6
	.word 0xa8814002  ! 1896: ADDcc_R	addcc 	%r5, %r2, %r20
	.word 0x9a4a8002  ! 1897: MULX_R	mulx 	%r10, %r2, %r13
	.word 0x87802004  ! 1898: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902004  ! 1899: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
reduce_priv_level_238:
	.word 0x8f902002  ! 1901: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89828000  ! 1900: WRTICK_R	wr	%r10, %r0, %tick
	.word 0xda9fc020  ! 1901: LDDA_R	ldda	[%r31, %r0] 0x01, %r13
	.word 0x85b10fe4  ! 1902: FONES	fones	%f2
	.word 0x879022f8  ! 1903: WRPR_TT_I	wrpr	%r0, 0x02f8, %tt
splash_htba_239:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1904: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02033  ! 1905: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x90818012  ! 1906: ADDcc_R	addcc 	%r6, %r18, %r8
	.word 0xa1902002  ! 1907: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_cmpr_240:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186e001  ! 1908: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0xa1902003  ! 1909: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8790202f  ! 1910: WRPR_TT_I	wrpr	%r0, 0x002f, %tt
	.word 0x91d02031  ! 1911: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x96fea001  ! 1912: SDIVcc_I	sdivcc 	%r26, 0x0001, %r11
	.word 0xa190200f  ! 1913: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d90248c  ! 1914: WRPR_PSTATE_I	wrpr	%r0, 0x048c, %pstate
	.word 0x9adac016  ! 1915: SMULcc_R	smulcc 	%r11, %r22, %r13
	.word 0x98d02001  ! 1916: UMULcc_I	umulcc 	%r0, 0x0001, %r12
	.word 0xd88804a0  ! 1917: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x8d902ccc  ! 1918: WRPR_PSTATE_I	wrpr	%r0, 0x0ccc, %pstate
	.word 0x8d902a0a  ! 1919: WRPR_PSTATE_I	wrpr	%r0, 0x0a0a, %pstate
	.word 0xb1a049cc  ! 1920: FDIVd	fdivd	%f32, %f12, %f24
	.word 0x95702001  ! 1921: POPC_I	popc	0x0001, %r10
	.word 0x36800001  ! 1922: BGE	bge,a	<label_0x1>
	.word 0xa190200b  ! 1923: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_htba_241:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1924: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87802080  ! 1925: WRASI_I	wr	%r0, 0x0080, %asi
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1926: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02034  ! 1927: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x91d02035  ! 1928: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x819828d5  ! 1929: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d5, %hpstate
	.word 0x32700001  ! 1930: BPNE	<illegal instruction>
	.word 0x8d902c1d  ! 1931: WRPR_PSTATE_I	wrpr	%r0, 0x0c1d, %pstate
	.word 0x8d902099  ! 1932: WRPR_PSTATE_I	wrpr	%r0, 0x0099, %pstate
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1933: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902e17  ! 1934: WRPR_PSTATE_I	wrpr	%r0, 0x0e17, %pstate
	.word 0x8fb14ff6  ! 1935: FONES	fones	%f7
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1936: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcfe7c036  ! 1937: CASA_I	casa	[%r31] 0x 1, %r22, %r7
	.word 0x8d902202  ! 1938: WRPR_PSTATE_I	wrpr	%r0, 0x0202, %pstate
	.word 0x22700001  ! 1939: BPE	<illegal instruction>
	.word 0x87514000  ! 1940: RDPR_TBA	rdpr	%tba, %r3
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1941: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 1942: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982d1e  ! 1943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1e, %hpstate
	.word 0xc6c80e60  ! 1944: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r3
	.word 0x93902003  ! 1945: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1946: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x86db4016  ! 1947: SMULcc_R	smulcc 	%r13, %r22, %r3
	.word 0x8d902ade  ! 1948: WRPR_PSTATE_I	wrpr	%r0, 0x0ade, %pstate
	.word 0xc677c016  ! 1949: STX_R	stx	%r3, [%r31 + %r22]
	.word 0xc68008a0  ! 1950: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x93902002  ! 1951: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa3a28dc3  ! 1952: FdMULq	fdmulq	
	.word 0x8cfac01a  ! 1953: SDIVcc_R	sdivcc 	%r11, %r26, %r6
	.word 0xa190200a  ! 1954: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87902091  ! 1955: WRPR_TT_I	wrpr	%r0, 0x0091, %tt
	.word 0x8d902c8a  ! 1956: WRPR_PSTATE_I	wrpr	%r0, 0x0c8a, %pstate
	.word 0x91d02033  ! 1957: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902002  ! 1958: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02033  ! 1959: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xaf514000  ! 1960: RDPR_TBA	rdpr	%tba, %r23
	.word 0x8ede4003  ! 1961: SMULcc_R	smulcc 	%r25, %r3, %r7
	.word 0x8d802004  ! 1962: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902003  ! 1963: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x96836001  ! 1964: ADDcc_I	addcc 	%r13, 0x0001, %r11
DS_242:
	.word 0x22800001  ! 1966: BE	be,a	<label_0x1>
	.xword 0x8769c829	! Random illegal ?
	.word 0xe712c011  ! 1966: LDQF_R	-	[%r11, %r17], %f19
	.word 0xa1a2482b  ! 1965: FADDs	fadds	%f9, %f11, %f16
	.word 0xa190200f  ! 1966: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x879023a4  ! 1967: WRPR_TT_I	wrpr	%r0, 0x03a4, %tt
	.word 0x99540000  ! 1968: RDPR_GL	rdpr	%-, %r12
	.word 0x96826001  ! 1969: ADDcc_I	addcc 	%r9, 0x0001, %r11
	.word 0xb7508000  ! 1970: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x36700001  ! 1971: BPGE	<illegal instruction>
	.word 0x92d26001  ! 1972: UMULcc_I	umulcc 	%r9, 0x0001, %r9
	.word 0x87902026  ! 1973: WRPR_TT_I	wrpr	%r0, 0x0026, %tt
	.word 0xaed10006  ! 1974: UMULcc_R	umulcc 	%r4, %r6, %r23
change_to_tl1_243:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93540000  ! 1976: RDPR_GL	rdpr	%-, %r9
	.word 0xaad14004  ! 1977: UMULcc_R	umulcc 	%r5, %r4, %r21
splash_tba_244:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1978: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 1979: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8e488003  ! 1980: MULX_R	mulx 	%r2, %r3, %r7
	.word 0x8ac22001  ! 1981: ADDCcc_I	addccc 	%r8, 0x0001, %r5
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1982: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90228a  ! 1984: WRPR_PSTATE_I	wrpr	%r0, 0x028a, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x81a000c9  ! 1986: FNEGd	fnegd	%f40, %f0
	.word 0xb24a400b  ! 1987: MULX_R	mulx 	%r9, %r11, %r25
	.word 0x87902362  ! 1988: WRPR_TT_I	wrpr	%r0, 0x0362, %tt
	.word 0x8350c000  ! 1989: RDPR_TT	rdpr	%tt, %r1
	.word 0x93902006  ! 1990: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1991: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_245:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1992: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802004  ! 1993: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x879021fc  ! 1994: WRPR_TT_I	wrpr	%r0, 0x01fc, %tt
	.word 0xc2c00e60  ! 1995: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r1
	.word 0x93902005  ! 1996: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902e01  ! 1997: WRPR_PSTATE_I	wrpr	%r0, 0x0e01, %pstate
	.word 0x9750c000  ! 1998: RDPR_TT	rdpr	%tt, %r11
	.word 0xd6c80e80  ! 1999: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r11
	.word 0x87902144  ! 2000: WRPR_TT_I	wrpr	%r0, 0x0144, %tt
	.word 0xd6c804a0  ! 2001: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	.word 0xa1902004  ! 2002: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d802000  ! 2003: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_246:
	.word 0x22800001  ! 2005: BE	be,a	<label_0x1>
	.xword 0xefd76e29	! Random illegal ?
	.word 0xc1128007  ! 2005: LDQF_R	-	[%r10, %r7], %f0
	.word 0x9ba5482d  ! 2004: FADDs	fadds	%f21, %f13, %f13
	.word 0xa190200d  ! 2005: WRPR_GL_I	wrpr	%r0, 0x000d, %-
change_to_tl1_247:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x819826d5  ! 2007: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d5, %hpstate
	.word 0x8550c000  ! 2008: RDPR_TT	rdpr	%tt, %r2
	.word 0x85508000  ! 2009: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x9f802001  ! 2010: SIR	sir	0x0001
	.word 0x91d02033  ! 2011: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02030  ! 2013: Tcc_I	ta	icc_or_xcc, %r0 + 48
splash_cmpr_248:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 2014: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0x8caa0010  ! 2015: ANDNcc_R	andncc 	%r8, %r16, %r6
	.word 0x81982cd7  ! 2016: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd7, %hpstate
splash_cmpr_249:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2018: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180e001  ! 2017: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x8d802000  ! 2018: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902364  ! 2019: WRPR_TT_I	wrpr	%r0, 0x0364, %tt
	.word 0xa1902006  ! 2020: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	ta	T_CHANGE_TO_TL0	! macro
change_to_tl1_250:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xcc8008a0  ! 2023: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x91d02032  ! 2024: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902005  ! 2025: WRPR_GL_I	wrpr	%r0, 0x0005, %-
change_to_randtl_251:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 2026: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xcc8008a0  ! 2027: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8198264e  ! 2028: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064e, %hpstate
	.word 0x91d02031  ! 2029: Tcc_I	ta	icc_or_xcc, %r0 + 49
change_to_tl1_252:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 2031: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 2032: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 2033: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xb4854015  ! 2034: ADDcc_R	addcc 	%r21, %r21, %r26
	.word 0x8d902a92  ! 2035: WRPR_PSTATE_I	wrpr	%r0, 0x0a92, %pstate
	.word 0x8881800b  ! 2036: ADDcc_R	addcc 	%r6, %r11, %r4
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 2037: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 2038: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 2039: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x90498001  ! 2040: MULX_R	mulx 	%r6, %r1, %r8
	.word 0x9ad6a001  ! 2041: UMULcc_I	umulcc 	%r26, 0x0001, %r13
	.word 0x87902386  ! 2042: WRPR_TT_I	wrpr	%r0, 0x0386, %tt
	.word 0x93902006  ! 2043: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xda8008a0  ! 2044: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x81982f5f  ! 2045: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5f, %hpstate
	.word 0x93902003  ! 2046: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xda0fe001  ! 2047: LDUB_I	ldub	[%r31 + 0x0001], %r13
	.word 0x8da4c9e5  ! 2048: FDIVq	dis not found

	.word 0xa7540000  ! 2049: RDPR_GL	rdpr	%-, %r19
	.word 0x93902002  ! 2050: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902004  ! 2051: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02034  ! 2052: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe7e7c025  ! 2053: CASA_I	casa	[%r31] 0x 1, %r5, %r19
	.word 0xe73fc005  ! 2054: STDF_R	std	%f19, [%r5, %r31]
	.word 0x81982c4d  ! 2055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4d, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 2056: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe63fe001  ! 2057: STD_I	std	%r19, [%r31 + 0x0001]
	.word 0xa190200c  ! 2058: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe6c7e030  ! 2059: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
	.word 0x81982b54  ! 2060: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b54, %hpstate
	.word 0xe7e7c025  ! 2061: CASA_I	casa	[%r31] 0x 1, %r5, %r19
	.word 0xa684c00d  ! 2062: ADDcc_R	addcc 	%r19, %r13, %r19
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2063: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 2064: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe627c00d  ! 2065: STW_R	stw	%r19, [%r31 + %r13]
	.word 0x98804016  ! 2066: ADDcc_R	addcc 	%r1, %r22, %r12
	.word 0x81982b0f  ! 2067: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0f, %hpstate
	.word 0x8d802000  ! 2068: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200f  ! 2069: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x81982b9e  ! 2070: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9e, %hpstate
	.word 0x93902005  ! 2071: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x89a24d22  ! 2072: FsMULd	fsmuld	%f9, %f2, %f4
	.word 0xacc36001  ! 2073: ADDCcc_I	addccc 	%r13, 0x0001, %r22
	.word 0x8d9024da  ! 2074: WRPR_PSTATE_I	wrpr	%r0, 0x04da, %pstate
reduce_priv_level_253:
	.word 0x8f902001  ! 2076: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 2075: SIAM	siam	1
	.word 0x8d802000  ! 2076: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xecc80e40  ! 2077: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r22
	.word 0x91d02034  ! 2078: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_254:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 2079: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x8790223f  ! 2080: WRPR_TT_I	wrpr	%r0, 0x023f, %tt
	.word 0x93902001  ! 2081: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982916  ! 2082: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0916, %hpstate
	.word 0xa5500000  ! 2083: RDPR_TPC	rdpr	%tpc, %r18
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 2084: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe42fc002  ! 2085: STB_R	stb	%r18, [%r31 + %r2]
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 2086: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_255:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 2087: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xaf504000  ! 2089: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x8b504000  ! 2090: RDPR_TNPC	<illegal instruction>
	.word 0xa3540000  ! 2091: RDPR_GL	<illegal instruction>
splash_htba_256:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2092: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x879022d7  ! 2093: WRPR_TT_I	wrpr	%r0, 0x02d7, %tt
	.word 0x81982a5c  ! 2094: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5c, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2095: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3508000  ! 2096: RDPR_TSTATE	rdpr	%tstate, %r17
	ta	T_CHANGE_PRIV	! macro
	.word 0xe2c00e40  ! 2098: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r17
	.word 0x89a64dcb  ! 2099: FdMULq	fdmulq	
	.word 0x93902005  ! 2100: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa6fe0019  ! 2101: SDIVcc_R	sdivcc 	%r24, %r25, %r19
	.word 0xe6d7e000  ! 2102: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r19
	.word 0x8cab4000  ! 2103: ANDNcc_R	andncc 	%r13, %r0, %r6
	.word 0xcc97e020  ! 2104: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r6
	.word 0x99a00545  ! 2105: FSQRTd	fsqrt	
	.word 0xd85fe001  ! 2106: LDX_I	ldx	[%r31 + 0x0001], %r12
	.word 0x8d902ec9  ! 2107: WRPR_PSTATE_I	wrpr	%r0, 0x0ec9, %pstate
	.word 0x91a109c1  ! 2108: FDIVd	fdivd	%f4, %f32, %f8
	.word 0x93902003  ! 2109: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_tl1_257:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8b500000  ! 2111: RDPR_TPC	rdpr	%tpc, %r5
	.word 0x819822c4  ! 2112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c4, %hpstate
	.word 0x93902000  ! 2113: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902007  ! 2114: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8f540000  ! 2115: RDPR_GL	rdpr	%-, %r7
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 2116: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2117: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97500000  ! 2118: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x94ac400c  ! 2119: ANDNcc_R	andncc 	%r17, %r12, %r10
	.word 0x85a0c9cc  ! 2120: FDIVd	fdivd	%f34, %f12, %f2
splash_tba_258:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 2121: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xb0da4007  ! 2122: SMULcc_R	smulcc 	%r9, %r7, %r24
	.word 0x93504000  ! 2123: RDPR_TNPC	rdpr	%tnpc, %r9
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 2124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8fa000d5  ! 2125: FNEGd	fnegd	%f52, %f38
	.word 0x93902002  ! 2126: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8cd90004  ! 2127: SMULcc_R	smulcc 	%r4, %r4, %r6
	.word 0x87802004  ! 2128: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa1902009  ! 2129: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xccd804a0  ! 2130: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0x87902169  ! 2131: WRPR_TT_I	wrpr	%r0, 0x0169, %tt
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 2132: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xccffc024  ! 2133: SWAPA_R	swapa	%r6, [%r31 + %r4] 0x01
	.word 0x8790205b  ! 2134: WRPR_TT_I	wrpr	%r0, 0x005b, %tt
	.word 0x8d902ed8  ! 2135: WRPR_PSTATE_I	wrpr	%r0, 0x0ed8, %pstate
	.word 0x93902003  ! 2136: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_TO_TL0	! macro
splash_cmpr_259:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2139: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1856001  ! 2138: WR_STICK_REG_I	wr	%r21, 0x0001, %-
	.word 0x819827df  ! 2139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
splash_cmpr_260:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1866001  ! 2140: WR_STICK_REG_I	wr	%r25, 0x0001, %-
	.word 0x91d02031  ! 2141: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x9951c000  ! 2142: RDPR_TL	<illegal instruction>
	.word 0x91d02030  ! 2143: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xb7504000  ! 2144: RDPR_TNPC	<illegal instruction>
DS_261:
	.word 0x22800001  ! 2146: BE	be,a	<label_0x1>
	allclean
	.word 0x9bb28308  ! 2145: ALLIGNADDRESS	alignaddr	%r10, %r8, %r13
	.word 0x93902007  ! 2146: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8b50c000  ! 2147: RDPR_TT	rdpr	%tt, %r5
	.word 0xa190200d  ! 2148: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x879020a8  ! 2149: WRPR_TT_I	wrpr	%r0, 0x00a8, %tt
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 2150: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xca07e001  ! 2151: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x8d802000  ! 2152: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902cda  ! 2153: WRPR_PSTATE_I	wrpr	%r0, 0x0cda, %pstate
	.word 0x8d802000  ! 2154: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902c81  ! 2155: WRPR_PSTATE_I	wrpr	%r0, 0x0c81, %pstate
splash_htba_262:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2156: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902006  ! 2157: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa8d1a001  ! 2159: UMULcc_I	umulcc 	%r6, 0x0001, %r20
	.word 0x81982e1f  ! 2160: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1f, %hpstate
	.word 0x93902004  ! 2161: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x879022b4  ! 2162: WRPR_TT_I	wrpr	%r0, 0x02b4, %tt
DS_263:
	.word 0x22800001  ! 2164: BE	be,a	<label_0x1>
	.word 0xdb35c002  ! 2164: STQF_R	-	%f13, [%r2, %r23]
	normalw
	.word 0x87458000  ! 2163: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x87902011  ! 2164: WRPR_TT_I	wrpr	%r0, 0x0011, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83d02035  ! 2166: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x87902144  ! 2167: WRPR_TT_I	wrpr	%r0, 0x0144, %tt
	.word 0x8869c016  ! 2168: UDIVX_R	udivx 	%r7, %r22, %r4
	.word 0x8d902ecd  ! 2169: WRPR_PSTATE_I	wrpr	%r0, 0x0ecd, %pstate
	.word 0x87802004  ! 2170: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xad504000  ! 2171: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x87902075  ! 2172: WRPR_TT_I	wrpr	%r0, 0x0075, %tt
	ta	T_CHANGE_PRIV	! macro
change_to_tl1_264:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9f802001  ! 2175: SIR	sir	0x0001
	.word 0x8d902e0f  ! 2176: WRPR_PSTATE_I	wrpr	%r0, 0x0e0f, %pstate
	.word 0x8d802000  ! 2177: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_265:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 2178: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x81982494  ! 2179: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0494, %hpstate
	.word 0xb7514000  ! 2180: RDPR_TBA	rdpr	%tba, %r27
	.word 0xf6ffc036  ! 2181: SWAPA_R	swapa	%r27, [%r31 + %r22] 0x01
	.word 0x93a34d28  ! 2182: FsMULd	fsmuld	%f13, %f8, %f40
	.word 0xa3b50ffa  ! 2183: FONES	fones	%f17
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2184: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3e800001  ! 2185: BVC	bvc,a	<label_0x1>
	.word 0x8d902a98  ! 2186: WRPR_PSTATE_I	wrpr	%r0, 0x0a98, %pstate
	.word 0xa190200d  ! 2187: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902005  ! 2188: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902002  ! 2189: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xe2ffc03a  ! 2190: SWAPA_R	swapa	%r17, [%r31 + %r26] 0x01
	.word 0xa190200e  ! 2191: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x91d02035  ! 2192: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d9028c0  ! 2193: WRPR_PSTATE_I	wrpr	%r0, 0x08c0, %pstate
	.word 0x93902003  ! 2194: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x879020fa  ! 2195: WRPR_TT_I	wrpr	%r0, 0x00fa, %tt
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2196: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 2197: SIR	sir	0x0001
splash_htba_266:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2198: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe2800b80  ! 2199: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r17
	.word 0xb0f98006  ! 2200: SDIVcc_R	sdivcc 	%r6, %r6, %r24
	.word 0xf137c006  ! 2201: STQF_R	-	%f24, [%r6, %r31]
	.word 0x91d02030  ! 2202: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xf057e001  ! 2203: LDSH_I	ldsh	[%r31 + 0x0001], %r24
	.word 0xab702001  ! 2204: POPC_I	popc	0x0001, %r21
	.word 0xea4fe001  ! 2205: LDSB_I	ldsb	[%r31 + 0x0001], %r21
	.word 0x93902006  ! 2206: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8780201c  ! 2207: WRASI_I	wr	%r0, 0x001c, %asi
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2208: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 2209: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93902002  ! 2210: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_267:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 2211: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x81982c9f  ! 2212: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9f, %hpstate
	.word 0x81982e15  ! 2213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e15, %hpstate
	.word 0x81982a07  ! 2214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a07, %hpstate
	.word 0x80c16001  ! 2215: ADDCcc_I	addccc 	%r5, 0x0001, %r0
	.word 0xc137c006  ! 2216: STQF_R	-	%f0, [%r6, %r31]
	.word 0x8af8e001  ! 2217: SDIVcc_I	sdivcc 	%r3, 0x0001, %r5
	.word 0x93902002  ! 2218: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 2219: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902e90  ! 2220: WRPR_PSTATE_I	wrpr	%r0, 0x0e90, %pstate
	.word 0x81982c04  ! 2221: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c04, %hpstate
	.word 0xa190200d  ! 2222: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x856b4007  ! 2223: SDIVX_R	sdivx	%r13, %r7, %r2
	.word 0x8751c000  ! 2224: RDPR_TL	rdpr	%tl, %r3
splash_htba_268:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2225: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x83d02031  ! 2226: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x8d802004  ! 2227: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 2228: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3a01a6b  ! 2229: FqTOi	fqtoi	
	.word 0xa1902006  ! 2230: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xe28008a0  ! 2231: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x879022d5  ! 2232: WRPR_TT_I	wrpr	%r0, 0x02d5, %tt
	.word 0x819823d7  ! 2233: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d7, %hpstate
	.word 0x32700001  ! 2234: BPNE	<illegal instruction>
splash_htba_269:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2235: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x879022c3  ! 2236: WRPR_TT_I	wrpr	%r0, 0x02c3, %tt
change_to_randtl_270:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 2237: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
reduce_priv_level_271:
	.word 0x8f902000  ! 2239: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x836e6001  ! 2238: SDIVX_I	sdivx	%r25, 0x0001, %r1
	.word 0x8d902c82  ! 2239: WRPR_PSTATE_I	wrpr	%r0, 0x0c82, %pstate
	.word 0x20800001  ! 2240: BN	bn,a	<label_0x1>
	.word 0x81982b5f  ! 2241: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5f, %hpstate
	.word 0x8da000c9  ! 2242: FNEGd	fnegd	%f40, %f6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87902078  ! 2244: WRPR_TT_I	wrpr	%r0, 0x0078, %tt
	.word 0x8d902ccb  ! 2245: WRPR_PSTATE_I	wrpr	%r0, 0x0ccb, %pstate
splash_cmpr_272:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180a001  ! 2246: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0x86a94016  ! 2247: ANDNcc_R	andncc 	%r5, %r22, %r3
	.word 0x20800001  ! 2248: BN	bn,a	<label_0x1>
	.word 0x38700001  ! 2249: BPGU	<illegal instruction>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 2250: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 2251: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x819824c7  ! 2252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c7, %hpstate
	.word 0x8d902cc7  ! 2253: WRPR_PSTATE_I	wrpr	%r0, 0x0cc7, %pstate
	.word 0x9481e001  ! 2254: ADDcc_I	addcc 	%r7, 0x0001, %r10
	.word 0x81982e4c  ! 2255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4c, %hpstate
	.word 0x91d02035  ! 2256: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa190200b  ! 2257: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x89a00565  ! 2258: FSQRTq	fsqrt	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc87fe001  ! 2260: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0x93902000  ! 2261: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93d02032  ! 2262: Tcc_I	tne	icc_or_xcc, %r0 + 50
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2263: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87508000  ! 2264: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x91d02031  ! 2265: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902003  ! 2266: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2267: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95a00579  ! 2268: FSQRTq	fsqrt	
	.word 0xaad1a001  ! 2269: UMULcc_I	umulcc 	%r6, 0x0001, %r21
	.word 0x83a44dd6  ! 2270: FdMULq	fdmulq	
	.word 0xa0820018  ! 2271: ADDcc_R	addcc 	%r8, %r24, %r16
	.word 0xe01fc000  ! 2272: LDD_R	ldd	[%r31 + %r0], %r16
	.word 0x8d9020d6  ! 2273: WRPR_PSTATE_I	wrpr	%r0, 0x00d6, %pstate
	.word 0x24700001  ! 2274: BPLE	<illegal instruction>
	.word 0x8d9020d6  ! 2275: WRPR_PSTATE_I	wrpr	%r0, 0x00d6, %pstate
	.word 0x93902005  ! 2276: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
reduce_priv_level_273:
	.word 0x8f902002  ! 2278: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x85a0196d  ! 2277: FqTOd	dis not found

	.word 0x87902172  ! 2278: WRPR_TT_I	wrpr	%r0, 0x0172, %tt
	ta	T_CHANGE_HPRIV	! macro
splash_htba_274:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2280: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802004  ! 2281: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2282: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc42fc00d  ! 2283: STB_R	stb	%r2, [%r31 + %r13]
	.word 0x8d90224a  ! 2284: WRPR_PSTATE_I	wrpr	%r0, 0x024a, %pstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2285: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198211f  ! 2286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011f, %hpstate
	.word 0x2c700001  ! 2287: BPNEG	<illegal instruction>
	.word 0x91d02034  ! 2288: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93d02031  ! 2289: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8d9020ca  ! 2290: WRPR_PSTATE_I	wrpr	%r0, 0x00ca, %pstate
	.word 0x8d902813  ! 2291: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	.word 0x879023a1  ! 2292: WRPR_TT_I	wrpr	%r0, 0x03a1, %tt
	.word 0xa190200b  ! 2293: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93902002  ! 2294: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa6d68006  ! 2295: UMULcc_R	umulcc 	%r26, %r6, %r19
	.word 0x91d02030  ! 2296: Tcc_I	ta	icc_or_xcc, %r0 + 48
splash_cmpr_275:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2298: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182a001  ! 2297: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0xa06a0006  ! 2298: UDIVX_R	udivx 	%r8, %r6, %r16
	.word 0x93902001  ! 2299: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2300: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0d7e000  ! 2301: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	.word 0x8d802004  ! 2302: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa26c2001  ! 2303: UDIVX_I	udivx 	%r16, 0x0001, %r17
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 2304: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 2305: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa551c000  ! 2306: RDPR_TL	rdpr	%tl, %r18
	.word 0x8ba000d3  ! 2307: FNEGd	fnegd	%f50, %f36
	.word 0x86d34013  ! 2308: UMULcc_R	umulcc 	%r13, %r19, %r3
	.word 0x93902004  ! 2309: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9bb10fe3  ! 2310: FONES	fones	%f13
	.word 0x8ad06001  ! 2311: UMULcc_I	umulcc 	%r1, 0x0001, %r5
	.word 0x81508000  ! 2312: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x81982357  ! 2313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0357, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 2314: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 2315: BNE	bne,a	<label_0x1>
	.word 0xc08804a0  ! 2316: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 2318: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x84494011  ! 2319: MULX_R	mulx 	%r5, %r17, %r2
	.word 0x92d34014  ! 2320: UMULcc_R	umulcc 	%r13, %r20, %r9
	.word 0x91d02035  ! 2321: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902e08  ! 2322: WRPR_PSTATE_I	wrpr	%r0, 0x0e08, %pstate
	.word 0x9f802001  ! 2323: SIR	sir	0x0001
reduce_priv_level_276:
	.word 0x8f902000  ! 2325: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8568a001  ! 2324: SDIVX_I	sdivx	%r2, 0x0001, %r2
	.word 0x986b000b  ! 2325: UDIVX_R	udivx 	%r12, %r11, %r12
	.word 0xd837c00b  ! 2326: STH_R	sth	%r12, [%r31 + %r11]
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2327: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982a47  ! 2328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a47, %hpstate
DS_277:
	.word 0x20800001  ! 2330: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 2329: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xd937c00b  ! 2330: STQF_R	-	%f12, [%r11, %r31]
splash_htba_278:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2331: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_279:
	.word 0x20800001  ! 2333: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 2332: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02035  ! 2333: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902005  ! 2334: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xb7504000  ! 2335: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x8d802000  ! 2336: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2337: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902344  ! 2338: WRPR_TT_I	wrpr	%r0, 0x0344, %tt
	.word 0x99a14d38  ! 2339: FsMULd	fsmuld	%f5, %f24, %f12
	.word 0x26800001  ! 2340: BL	bl,a	<label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2341: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91a109e5  ! 2342: FDIVq	dis not found

	.word 0x8fa0057b  ! 2343: FSQRTq	fsqrt	
splash_tba_280:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2344: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_htba_281:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2345: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xce880e80  ! 2346: LDUBA_R	lduba	[%r0, %r0] 0x74, %r7
	.word 0x8790210e  ! 2347: WRPR_TT_I	wrpr	%r0, 0x010e, %tt
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 2348: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_282:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 2349: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_283:
	.word 0x34800001  ! 2351: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 2350: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02035  ! 2351: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x3a800001  ! 2352: BCC	bcc,a	<label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 2353: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_randtl_284:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 2354: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d902200  ! 2355: WRPR_PSTATE_I	wrpr	%r0, 0x0200, %pstate
	.word 0x81982c04  ! 2356: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c04, %hpstate
	.word 0x87500000  ! 2357: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x2c800001  ! 2358: BNEG	bneg,a	<label_0x1>
	.word 0x81982e15  ! 2359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e15, %hpstate
	.word 0x97540000  ! 2360: RDPR_GL	rdpr	%-, %r11
	.word 0xd6800c60  ! 2361: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
	.word 0xa3508000  ! 2362: RDPR_TSTATE	rdpr	%tstate, %r17
DS_285:
	.word 0x22800001  ! 2364: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 2363: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02034  ! 2364: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87a2c9ad  ! 2365: FDIVs	fdivs	%f11, %f13, %f3
change_to_tl1_286:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87802088  ! 2367: WRASI_I	wr	%r0, 0x0088, %asi
splash_cmpr_287:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2369: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186e001  ! 2368: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0x91d02035  ! 2369: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982b8f  ! 2370: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8f, %hpstate
	.word 0xada50dc1  ! 2371: FdMULq	fdmulq	
	.word 0x91d02034  ! 2372: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f802001  ! 2373: SIR	sir	0x0001
	.word 0x97b5cfe1  ! 2374: FONES	fones	%f11
	.word 0x87802014  ! 2375: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8790226d  ! 2376: WRPR_TT_I	wrpr	%r0, 0x026d, %tt
	.word 0x91d02031  ! 2377: Tcc_I	ta	icc_or_xcc, %r0 + 49
change_to_randtl_288:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 2378: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x819824d7  ! 2379: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d7, %hpstate
	.word 0x8551c000  ! 2380: RDPR_TL	rdpr	%tl, %r2
	.word 0xa1902003  ! 2381: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d902094  ! 2382: WRPR_PSTATE_I	wrpr	%r0, 0x0094, %pstate
	.word 0x91d02034  ! 2383: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xb1540000  ! 2384: RDPR_GL	rdpr	%-, %r24
splash_htba_289:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2385: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x879021a6  ! 2386: WRPR_TT_I	wrpr	%r0, 0x01a6, %tt
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 2387: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf077e001  ! 2388: STX_I	stx	%r24, [%r31 + 0x0001]
	.word 0x9ac52001  ! 2389: ADDCcc_I	addccc 	%r20, 0x0001, %r13
DS_290:
	.word 0x32800001  ! 2391: BNE	bne,a	<label_0x1>
	.xword 0xed79bdbe	! Random illegal ?
	.word 0xef10c001  ! 2391: LDQF_R	-	[%r3, %r1], %f23
	.word 0x8fa20822  ! 2390: FADDs	fadds	%f8, %f2, %f7
	.word 0xabb0cfe9  ! 2391: FONES	fones	%f21
	.word 0xea97e010  ! 2392: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r21
	.word 0x93504000  ! 2393: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0x91d02034  ! 2394: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xb4fd4007  ! 2395: SDIVcc_R	sdivcc 	%r21, %r7, %r26
	.word 0x95514000  ! 2396: RDPR_TBA	rdpr	%tba, %r10
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2397: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd597e001  ! 2398: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x8afa0003  ! 2399: SDIVcc_R	sdivcc 	%r8, %r3, %r5
	.word 0x8790223e  ! 2400: WRPR_TT_I	wrpr	%r0, 0x023e, %tt
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 2401: Tcc_R	te	icc_or_xcc, %r0 + %r30
reduce_priv_level_291:
	.word 0x8f902001  ! 2403: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 2402: SIAM	siam	1
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 2403: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7a4cd2b  ! 2404: FsMULd	fsmuld	%f19, %f42, %f50
	.word 0xe68008a0  ! 2405: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xe697e000  ! 2406: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r19
	.word 0x8198228f  ! 2407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028f, %hpstate
	.word 0xafa609a4  ! 2408: FDIVs	fdivs	%f24, %f4, %f23
	.word 0x91d02032  ! 2409: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902006  ! 2410: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xee800c40  ! 2411: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r23
	.word 0x93902002  ! 2412: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_292:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182e001  ! 2413: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0x804d000b  ! 2414: MULX_R	mulx 	%r20, %r11, %r0
	.word 0x8790211e  ! 2415: WRPR_TT_I	wrpr	%r0, 0x011e, %tt
	.word 0xa7a409db  ! 2416: FDIVd	fdivd	%f16, %f58, %f50
	.word 0x8d9028df  ! 2417: WRPR_PSTATE_I	wrpr	%r0, 0x08df, %pstate
	.word 0xa1902009  ! 2418: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87902149  ! 2419: WRPR_TT_I	wrpr	%r0, 0x0149, %tt
	.word 0xa84e401a  ! 2420: MULX_R	mulx 	%r25, %r26, %r20
	.word 0xe8ffc03a  ! 2421: SWAPA_R	swapa	%r20, [%r31 + %r26] 0x01
	.word 0x8d902e55  ! 2422: WRPR_PSTATE_I	wrpr	%r0, 0x0e55, %pstate
	.word 0xe8dfe030  ! 2423: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r20
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 2424: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa151c000  ! 2425: RDPR_TL	rdpr	%tl, %r16
	.word 0xa190200d  ! 2426: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_htba_293:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2427: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802004  ! 2428: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x879022c8  ! 2429: WRPR_TT_I	wrpr	%r0, 0x02c8, %tt
	.word 0x81982514  ! 2430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0514, %hpstate
	.word 0x8d802000  ! 2431: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8790203d  ! 2432: WRPR_TT_I	wrpr	%r0, 0x003d, %tt
	.word 0x81982354  ! 2433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0354, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2434: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902217  ! 2435: WRPR_PSTATE_I	wrpr	%r0, 0x0217, %pstate
	.word 0x8d9026db  ! 2436: WRPR_PSTATE_I	wrpr	%r0, 0x06db, %pstate
	.word 0xa190200e  ! 2437: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xe09fe001  ! 2438: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r16
	.word 0x93902000  ! 2439: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8790205f  ! 2440: WRPR_TT_I	wrpr	%r0, 0x005f, %tt
	.word 0x879022ac  ! 2441: WRPR_TT_I	wrpr	%r0, 0x02ac, %tt
	.word 0x38700001  ! 2442: BPGU	<illegal instruction>
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 2443: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902050  ! 2444: WRPR_PSTATE_I	wrpr	%r0, 0x0050, %pstate
	.word 0x89500000  ! 2445: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x99500000  ! 2446: RDPR_TPC	rdpr	%tpc, %r12
DS_294:
	.word 0x34800001  ! 2448: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 2447: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982f5e  ! 2448: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5e, %hpstate
	.word 0x91514000  ! 2449: RDPR_TBA	rdpr	%tba, %r8
splash_tba_295:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2450: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902004  ! 2451: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x879023a2  ! 2452: WRPR_TT_I	wrpr	%r0, 0x03a2, %tt
	.word 0x8d902283  ! 2453: WRPR_PSTATE_I	wrpr	%r0, 0x0283, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x87902085  ! 2455: WRPR_TT_I	wrpr	%r0, 0x0085, %tt
	.word 0x879022f1  ! 2456: WRPR_TT_I	wrpr	%r0, 0x02f1, %tt
	.word 0x8351c000  ! 2457: RDPR_TL	rdpr	%tl, %r1
	.word 0xa1902008  ! 2458: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x99902000  ! 2459: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xc28008a0  ! 2460: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xa190200e  ! 2461: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xc397e001  ! 2462: LDQFA_I	-	[%r31, 0x0001], %f1
	.word 0x91d02034  ! 2463: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d90221b  ! 2464: WRPR_PSTATE_I	wrpr	%r0, 0x021b, %pstate
	.word 0x8ada8018  ! 2465: SMULcc_R	smulcc 	%r10, %r24, %r5
	.word 0xca8008a0  ! 2466: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x91d02033  ! 2467: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa0faa001  ! 2468: SDIVcc_I	sdivcc 	%r10, 0x0001, %r16
DS_296:
	.word 0x22800001  ! 2470: BE	be,a	<label_0x1>
	.xword 0xdde6d6ed	! Random illegal ?
	.word 0xafa00557  ! 2470: FSQRTd	fsqrt	
	.word 0x89a14822  ! 2469: FADDs	fadds	%f5, %f2, %f4
	.word 0x92d12001  ! 2470: UMULcc_I	umulcc 	%r4, 0x0001, %r9
	.word 0x8d902a42  ! 2471: WRPR_PSTATE_I	wrpr	%r0, 0x0a42, %pstate
	.word 0xa1902007  ! 2472: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x9f802001  ! 2473: SIR	sir	0x0001
change_to_tl1_297:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902608  ! 2475: WRPR_PSTATE_I	wrpr	%r0, 0x0608, %pstate
	.word 0x83a48dd4  ! 2476: FdMULq	fdmulq	
	.word 0xa1902009  ! 2477: WRPR_GL_I	wrpr	%r0, 0x0009, %-
change_to_tl1_298:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902005  ! 2479: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 2480: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8ed2e001  ! 2481: UMULcc_I	umulcc 	%r11, 0x0001, %r7
	.word 0xa1902004  ! 2482: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xcec7e020  ! 2483: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r7
	.word 0xada01a63  ! 2484: FqTOi	fqtoi	
	.word 0xaa802001  ! 2485: ADDcc_I	addcc 	%r0, 0x0001, %r21
	.word 0xb1a01a66  ! 2486: FqTOi	fqtoi	
	.word 0x91d02031  ! 2487: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa1902006  ! 2488: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_299:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 2489: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8f6b0010  ! 2490: SDIVX_R	sdivx	%r12, %r16, %r7
splash_htba_300:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 2491: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d9020d4  ! 2492: WRPR_PSTATE_I	wrpr	%r0, 0x00d4, %pstate
DS_301:
	.word 0x20800001  ! 2494: BN	bn,a	<label_0x1>
	pdist %f4, %f24, %f28
	.word 0xabb1830b  ! 2493: ALLIGNADDRESS	alignaddr	%r6, %r11, %r21
change_to_tl1_302:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xeb27c00b  ! 2495: STF_R	st	%f21, [%r11, %r31]
	.word 0x8cd46001  ! 2496: UMULcc_I	umulcc 	%r17, 0x0001, %r6
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 2497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 2498: WRPR_GL_I	wrpr	%r0, 0x0005, %-


.global user_data_start
.data
user_data_start:
	.xword	0xb218b23eb1275a14
	.xword	0x8db82b32469ab149
	.xword	0x9e36a69044ca5831
	.xword	0xedf4d9c231782443
	.xword	0x29bf86319e201c1b
	.xword	0x0c78d6dee0687c8e
	.xword	0x0f21a81a87c7c42f
	.xword	0x2d1506b50e068f2a
	.xword	0x3e53adfb0f695219
	.xword	0xe70d3e36146dc5d4
	.xword	0x15e6661f7cde6027
	.xword	0x9a7e831da1958cab
	.xword	0x3a1ebb996136865e
	.xword	0x595e741423fc1412
	.xword	0x1224afec99bc0bb4
	.xword	0xd8213b676e0d2db5
	.xword	0x35bdcbfe8c6e5ba7
	.xword	0xca5b1ea7c4a82bfe
	.xword	0x5dcf663d07d1a753
	.xword	0xe5684b620ec9c017
	.xword	0x01b48454c5918533
	.xword	0x324f49720709b615
	.xword	0x9d530911ef5c1a98
	.xword	0xd1a698fbf8e1cb4f
	.xword	0xab278cd9bc5afd91
	.xword	0xc3422445fafcb7d6
	.xword	0x630265760219ed6f
	.xword	0x162ad206cca677e1
	.xword	0x401a1e48411180c2
	.xword	0xe19f95e91b065351
	.xword	0x080a93ca2b79a5e6
	.xword	0xd05e3e7c88913314
	.xword	0x0869be975d3469ca
	.xword	0x7937b153eeda751c
	.xword	0x1bfa46de9ce909a1
	.xword	0x4916e0c1c14a4f85
	.xword	0x6c1b57dbb478dfa5
	.xword	0xdea0f0ae5a8beaf8
	.xword	0x0da5703dea5d6eb6
	.xword	0x7ec3651ca0238733
	.xword	0xf721c7cef8067027
	.xword	0x35c412c5eda528a2
	.xword	0x00100b6e46285456
	.xword	0xded36371cf5a3147
	.xword	0x1fd9061f96528c44
	.xword	0x3e297ada5c662a4f
	.xword	0xa860ac67fd3837e4
	.xword	0xd217be12eb8860a1
	.xword	0x2b08a845b44761e9
	.xword	0x1d8c26a3cf5046a0
	.xword	0x7e82ffc8284d1dfd
	.xword	0x01ce64fb93da1106
	.xword	0x31dbafb2a8372577
	.xword	0xff169b7a31d06853
	.xword	0xd35c4eea8eac911d
	.xword	0x45e28ea1e4396304
	.xword	0x639314566791c8ce
	.xword	0x1895b61b1299e385
	.xword	0x61e7a4673a523d05
	.xword	0x73543012d2eeb156
	.xword	0xeac9a7233c8b0b60
	.xword	0xe63c63dc08d4f70b
	.xword	0x0a17997cd00e5821
	.xword	0x499050c4ac0f012b
	.xword	0x1444766d0c7b4680
	.xword	0x43097ea2c8fe7ef5
	.xword	0xdc18de8a6abb2d7f
	.xword	0xd134b222926fd252
	.xword	0x98f1d94d949fcd6d
	.xword	0x39b2c859c61cb796
	.xword	0x57f3b9347b16cb73
	.xword	0x9f1e4f38614514fd
	.xword	0x5468a442555265f6
	.xword	0x02822c21c2410a62
	.xword	0x1b994dc7fcebccb1
	.xword	0xb5b7ff4027e00645
	.xword	0x65b387bd34349b49
	.xword	0x4aff8cf6f1de4463
	.xword	0xedc6d08fb7cc5013
	.xword	0x15b0fe1d697540cb
	.xword	0xdbe3bfc90cf2ec34
	.xword	0x30a9d381325c2afb
	.xword	0x527f97e0d3171eba
	.xword	0xd2503009ad918a25
	.xword	0x48fa2c673eaad7e5
	.xword	0xd30904d714a687b6
	.xword	0xca1ec097b017ca5a
	.xword	0xdeb1edc3ebc12316
	.xword	0x2dfa34248048e3c3
	.xword	0x5fd68ecbd1e1e0b0
	.xword	0x34a6a69584c4a4e3
	.xword	0x7156ead5e36cc41e
	.xword	0xd145b3f44e72d392
	.xword	0x6c28636fdc95ffd7
	.xword	0xdb3d22058e02d0c5
	.xword	0xf94c6ad39369fcf5
	.xword	0xcc13b08ecec7528b
	.xword	0x78f7098c65d397f0
	.xword	0xda6abcb61b9566a7
	.xword	0x46d2d6c021896b41
	.xword	0x1c70b63ea90b33ac
	.xword	0x496fa5c128617778
	.xword	0x6721f3e8c5b0d57b
	.xword	0x74b6942a3cd6bc76
	.xword	0x1fc4f598f3f52f9c
	.xword	0x675e71e6a50e5d46
	.xword	0x8f1f69a949a27bfd
	.xword	0xe069bbb9974671f7
	.xword	0xeae30ffde8d956c2
	.xword	0x36f7ecca362a2d8e
	.xword	0xd08ec29d4d605c52
	.xword	0x654eb42e8adc601e
	.xword	0x2d491f07fcd79ead
	.xword	0xec7e91504d08b29f
	.xword	0x3e86dec2b19d7166
	.xword	0x430948211d7f2d80
	.xword	0xdf86383b14e978ae
	.xword	0x5de7880b8a5cc471
	.xword	0xc7f16f3907747992
	.xword	0xa116fc47de9fd8c1
	.xword	0x7dc56746cf3d4303
	.xword	0x80ae8961b1249428
	.xword	0x622ddac2ff675fc8
	.xword	0x7c840d765d20a56c
	.xword	0xbf3ecf4c5ab4f1f6
	.xword	0x85f5137111fc52b3
	.xword	0xedd245cbe6da78e4
	.xword	0x74ec0709553221ef
	.xword	0x2d62ca0cab0c2dd1
	.xword	0x75e59f29a39bd204
	.xword	0xf2f2847cc11898ff
	.xword	0x0375da6d37318c3e
	.xword	0xc71d1e15689b1b4e
	.xword	0xa2866ed849d2f98c
	.xword	0x0144ed7021f10bac
	.xword	0x815f6643ec1bfa15
	.xword	0xa645cb88d2a2d084
	.xword	0x87246fdb6e9e40af
	.xword	0x69ef6f234ffad5b2
	.xword	0xc84b64d59ee6effb
	.xword	0x1a431e12a7626568
	.xword	0xae205796c30e8c6d
	.xword	0x54b369a7bc37eb39
	.xword	0x8475c959e774251c
	.xword	0x98f3b185e6f1851c
	.xword	0x5c72b97b661862d8
	.xword	0x0ecec5c7c6854693
	.xword	0xa63cf0ddb692785d
	.xword	0xce390ee5e6e3d9f7
	.xword	0x5cd063b5bb5c39d7
	.xword	0x9384963aee792ff1
	.xword	0x3c9e70ab2b2c4562
	.xword	0x9009efb1b1c951d7
	.xword	0xa31d4f7eb8f94bf9
	.xword	0x16a840c21801df1f
	.xword	0xb026fefcd0a44cc5
	.xword	0x1ceecf530f36dbd6
	.xword	0xb267541f57aac975
	.xword	0x6dc217b138337404
	.xword	0xf7083ebce62960d1
	.xword	0xe1c201e7c26905a0
	.xword	0x12720f8f15ff5d68
	.xword	0x541bda840a0568da
	.xword	0x5d678d0c33213df8
	.xword	0xbf2f0538063f2c21
	.xword	0x0ddf30b5aeb6a2ba
	.xword	0x1a3aaf5b834a175c
	.xword	0xcb25793db224975d
	.xword	0x19cbada14ef0f7fb
	.xword	0x86f5ad8570e5066b
	.xword	0x4bdaf57502345114
	.xword	0x29ba70c12273f40e
	.xword	0x489ed85b8bf18755
	.xword	0x0122370c61121e4f
	.xword	0xde054e04606617cf
	.xword	0xc821a623ded33c4f
	.xword	0xedc08e39e11ab169
	.xword	0x39dba8b86d4fa674
	.xword	0xcb7987529cb2a09d
	.xword	0x9350760ce09884af
	.xword	0xdf6cf07869a52687
	.xword	0x23a42e5d051bd6e5
	.xword	0xe10a2587a4c62b0a
	.xword	0x9fdf57cc1ecf7927
	.xword	0x0424057c5cd8c112
	.xword	0x32a4ed1ccb22f542
	.xword	0xfee5fed1d9f212be
	.xword	0x84b26ff1507ef32b
	.xword	0x493809bf2113171d
	.xword	0xf4fd804956952760
	.xword	0x91d855ed876a43df
	.xword	0xbeec9a6b79163d62
	.xword	0x57be08e1475f7377
	.xword	0x058f1a1713639188
	.xword	0x0437e825459c9fe4
	.xword	0x97d978e1107cf9ff
	.xword	0x358c52ab9d733f1e
	.xword	0x6036d05eb79934ef
	.xword	0xf7a32bbfff3ebd88
	.xword	0xd79e387854e0e076
	.xword	0x7414a43f722a0733
	.xword	0x19a88e2c2b21d077
	.xword	0x6e78b4814d8633fa
	.xword	0xd8287d24fe88233e
	.xword	0x9762060e3c6dfe78
	.xword	0x659c8fabebf80bf4
	.xword	0x23eee00f2da295fe
	.xword	0xb36f6e0e2a96d8fb
	.xword	0xdcd1cf3174b02ae0
	.xword	0xcff593a8575f482d
	.xword	0xe5b236fe8454af3a
	.xword	0x32096e8e9c3d7d5f
	.xword	0x391d4d79be01df98
	.xword	0xef343252994a7e96
	.xword	0xd2aa97bea4423c1f
	.xword	0xab235737e1ad4e8b
	.xword	0x3cbc95c81553a9d0
	.xword	0x2554ef4bc8216b80
	.xword	0x19da39c124505e60
	.xword	0x1e14cf136fee58a8
	.xword	0xde1b4ae9d7cfc20a
	.xword	0xe48aede3ed3bc71d
	.xword	0xe93dcecd03f7bc9f
	.xword	0x6fb5023c66866e87
	.xword	0xd94d254c3adf8395
	.xword	0xe6f908772cf79acf
	.xword	0x0f9f0b052871fe1c
	.xword	0x96829ca45d307edb
	.xword	0xf47c2b059611d0ad
	.xword	0x8fdfe12bcebefc12
	.xword	0xc9fdd2874deb7788
	.xword	0xd6474fe0fb352284
	.xword	0xa59a16c37e3df479
	.xword	0x14d119937e4bc252
	.xword	0xfcba9e6f9004ba6c
	.xword	0xbc5d0e5a69d26b04
	.xword	0x7982f50ee1ccaccb
	.xword	0xe146141338c50930
	.xword	0x774e2eac45bd9fe5
	.xword	0x30ba995fc8cd1005
	.xword	0x2183fe5910435248
	.xword	0x652cccaa1de4d5df
	.xword	0xe8dc80415428a285
	.xword	0x5af4d4099216136f
	.xword	0x75e40dfeecc0515c
	.xword	0xd2b643ee82ea5ce5
	.xword	0xfd2a1dd14f2993aa
	.xword	0xd28858016590c778
	.xword	0xe74612bf8b4cf94f
	.xword	0x71fee9d4375c1690
	.xword	0x159d7533b1f5b981
	.xword	0x2e404de120206f90
	.xword	0x3a28586b161cc386
	.xword	0x5eba8cb0cec9ab88
	.xword	0xc25b3b70eda3657e
	.xword	0x221eb8ac181e9cd6


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Wed May 12 13:34:29 2004
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
!!#     IJ_set_ropr_fld("diag.j", 84, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x1c, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 87, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x16, 0x1c, 0x80, 0x88}");
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
!!#     IJ_set_ropr_fld("diag.j", 110, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35}");
!!#     IJ_set_ropr_fld("diag.j", 111, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 112, Ro_traps_i, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 113, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 114, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 115, Ro_traps_r, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     //IJ_set_ropr_fld(Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     IJ_set_ropr_fld("diag.j", 117, Ro_traps_r, Ft_Simm13, "{0x30..0x35, 0xb0..0xb5}");
!!#     //IJ_set_rvar(Rv_init_trap, "{0x30..0x35}");
!!#     IJ_set_rvar("diag.j", 119, Rv_init_trap, "{0x30..0x35, 0xb0..0xb5}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 122, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 123, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Pstate splash
!!#     IJ_set_ropr_fld("diag.j", 126, Ro_wrpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 127, Ro_wrpstate, Ft_Simm13, "12'b0rrr0rr0rrrrr");
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
!!#         | splash_cmpr   %rvar  wt_low
!!#         | splash_tba    %rvar  wt_low
!!#         | splash_htba   %rvar  wt_low
!!#         //| splash_lsucnt %rvar wt_low
!!# ;
!!# 
!!# dummy :tCHANGE_NONHPRIV | tCHANGE_NONPRIV | 
!!#        tWR_STICK_CMPR_REG_R | tWR_TICK_CMPR_REG_R |
!!#        tILLTRAP
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
!!#         IJ_printf("diag.j", 369, th0, "reduce_priv_level_%d:\n", label);
!!#         IJ_set_ropr_fld("diag.j", 370, Ro_tl, Ft_Simm13, "{0..2}");
!!#         IJ_generate_from_token("diag.j", 371,1, th0, Ro_tl, tWRPR_TL_I, -1);;
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 373,1, th0, ijdefault, tCHANGE_NONHPRIV, -1);;
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 375,1, th0, ijdefault, tCHANGE_NONPRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_randtl: tWRPR_TL_I %ropr  Ro_tl
!!#     {
!!#         IJ_printf("diag.j", 383, th0, "change_to_randtl_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_set_ropr_fld("diag.j", 385, Ro_tl, Ft_Simm13, "{3..5}");
!!#             IJ_generate_from_token("diag.j", 386,1, th0, ijdefault, tCHANGE_HPRIV, -1);;
!!#         } else {
!!#             IJ_set_ropr_fld("diag.j", 388, Ro_tl, Ft_Simm13, "{0..2}");
!!#             IJ_generate_from_token("diag.j", 389,1, th0, ijdefault, tCHANGE_PRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_tl1 : tCHANGE_TO_TL1
!!#     {
!!#         IJ_printf("diag.j", 397, th0, "change_to_tl1_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 399, th0, "\tta T_CHANGE_HPRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 401, th0, "\tta T_CHANGE_PRIV\n");
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
!!#         IJ_printf("diag.j", 423, th0, "splash_lsu_%d:\n", label);
!!#         IJ_printf("diag.j", 424, th0, "\tset 0x%rx, %%r2\n", Rv_lsucntl);
!!#         IJ_printf("diag.j", 425, th0, "\tstxa %%r2, [%%r0] ASI_LSU_CONTROL\n");
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_tba: tWRPR_TBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 432, th0, "splash_tba_%d:\n", label);
!!#         IJ_printf("diag.j", 433, th0, "\tta T_CHANGE_PRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 435, th0, "\tset 0x120000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 437, th0, "\tset 0x%08llrx, %%r2\n", Rv_tba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# splash_htba: tWRHPR_HTBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 444, th0, "splash_htba_%d:\n", label);
!!#         IJ_printf("diag.j", 445, th0, "\tta T_CHANGE_HPRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 447, th0, "\tset 0x80000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 449, th0, "\tset 0x%08llrx, %%r2\n", Rv_htba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_cmpr: tWR_STICK_REG_I
!!#     {
!!#         IJ_printf("diag.j", 457, th0, "splash_cmpr_%d:\n", label);
!!#         IJ_set_rvar("diag.j", 458, Rv_rand_60,"64'h8rrrrrrr_rrrrrrrr");
!!#         IJ_set_ropr_fld("diag.j", 459, Ro_cmpr, Ft_Rs1, "{0}");
!!#         IJ_set_ropr_fld("diag.j", 460, Ro_cmpr, Ft_Rs2, "{1}");
!!#         IJ_printf  ("diag.j", 461, th0,"\tnop\n\tmov 1, %%g2\n");
!!#         IJ_printf  ("diag.j", 462, th0,"\tsllx %%g2, 63, %%g2\n");
!!#         IJ_printf  ("diag.j", 463, th0,"\tor %%g1, %%g2, %%g1\n");
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 465,1, th0, Ro_cmpr, tWR_STICK_CMPR_REG_R, tWR_TICK_CMPR_REG_R, -1);;
!!#         } else {
!!#            IJ_printf("diag.j", 467, th0, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
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
!!#         IJ_printf("diag.j", 505, th0, "\totherw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      } else {
!!#         IJ_printf("diag.j", 507, th0, "\tinvalw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!#         IJ_printf("diag.j", 592, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 593,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 594,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 595, th0, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 599, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 600,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 602,1, th0, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 604, th0, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 606, th0, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 611, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 612,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 614, th0, "\t.xword 0x%rx\t! Random illegal ?\n", Rv_illtrap);
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 616,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 618,1, th0, ijdefault, tFSQRTd, tLDQF_R, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 625, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 626,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 630, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 631,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 635, th0, "DS_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 636, th0, "\tnop\n\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 637, th0, "\tjmp %%g2\n");
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

