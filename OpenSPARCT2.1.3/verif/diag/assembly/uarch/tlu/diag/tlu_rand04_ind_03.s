/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_03.s
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
	mov 0xb2, %r14
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
	mov 0xb4, %r14
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
	mov 0x33, %r14
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
	mov 0x31, %r14
	mov 0xb1, %r30
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
	.word 0x81a149e5  ! 1: FDIVq	dis not found

	.word 0xb3a54d2c  ! 2: FsMULd	fsmuld	%f21, %f12, %f56
	.word 0xf2c7e010  ! 3: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r25
	.word 0xb6808016  ! 4: ADDcc_R	addcc 	%r2, %r22, %r27
	.word 0x879021f0  ! 5: WRPR_TT_I	wrpr	%r0, 0x01f0, %tt
splash_tba_0:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 6: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802001  ! 7: SIR	sir	0x0001
	.word 0x93902002  ! 8: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902e1d  ! 9: WRPR_PSTATE_I	wrpr	%r0, 0x0e1d, %pstate
	.word 0xf69fe001  ! 10: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r27
	.word 0x2c700001  ! 11: BPNEG	<illegal instruction>
	.word 0x8d902c18  ! 12: WRPR_PSTATE_I	wrpr	%r0, 0x0c18, %pstate
splash_cmpr_1:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 14: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184e001  ! 13: WR_STICK_REG_I	wr	%r19, 0x0001, %-
DS_2:
	.word 0x34800001  ! 15: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 14: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa9a08dc8  ! 15: FdMULq	fdmulq	
	.word 0xe837c008  ! 16: STH_R	sth	%r20, [%r31 + %r8]
	.word 0x8d902256  ! 17: WRPR_PSTATE_I	wrpr	%r0, 0x0256, %pstate
	.word 0x93902007  ! 18: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa7a01a60  ! 19: FqTOi	fqtoi	
	.word 0x81982d97  ! 20: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d97, %hpstate
	.word 0x8790211d  ! 21: WRPR_TT_I	wrpr	%r0, 0x011d, %tt
	.word 0xe647c000  ! 22: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x87902035  ! 23: WRPR_TT_I	wrpr	%r0, 0x0035, %tt
	.word 0xa2d58013  ! 24: UMULcc_R	umulcc 	%r22, %r19, %r17
	.word 0xe28008a0  ! 25: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x91d02031  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x9b514000  ! 27: RDPR_TBA	rdpr	%tba, %r13
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 28: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 29: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_3:
	.word 0x32800001  ! 31: BNE	bne,a	<label_0x1>
	allclean
	.word 0x8db14301  ! 30: ALLIGNADDRESS	alignaddr	%r5, %r1, %r6
	.word 0x8d9024d8  ! 31: WRPR_PSTATE_I	wrpr	%r0, 0x04d8, %pstate
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 32: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 33: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xcc27c001  ! 34: STW_R	stw	%r6, [%r31 + %r1]
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 35: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83b44ff1  ! 36: FONES	fones	%f1
	.word 0x93902005  ! 37: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x819822cd  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cd, %hpstate
	.word 0xa1902001  ! 39: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x879020d5  ! 40: WRPR_TT_I	wrpr	%r0, 0x00d5, %tt
	.word 0x8d902a90  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x0a90, %pstate
	.word 0x93902007  ! 42: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1a44d34  ! 43: FsMULd	fsmuld	%f17, %f20, %f16
	.word 0xa1902005  ! 44: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_4:
	.word 0x32800001  ! 46: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 45: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902005  ! 46: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa1902002  ! 47: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x9950c000  ! 48: RDPR_TT	rdpr	%tt, %r12
	.word 0x9f802001  ! 49: SIR	sir	0x0001
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 50: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 51: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 52: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 53: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93d02031  ! 54: Tcc_I	tne	icc_or_xcc, %r0 + 49
reduce_priv_level_5:
	.word 0x8f902002  ! 56: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xaba01967  ! 55: FqTOd	dis not found

	.word 0x879022f3  ! 56: WRPR_TT_I	wrpr	%r0, 0x02f3, %tt
	.word 0xebe7c027  ! 57: CASA_I	casa	[%r31] 0x 1, %r7, %r21
	.word 0x93902000  ! 58: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xb5514000  ! 59: RDPR_TBA	rdpr	%tba, %r26
	.word 0xa1514000  ! 60: RDPR_TBA	<illegal instruction>
	.word 0x879022cf  ! 61: WRPR_TT_I	wrpr	%r0, 0x02cf, %tt
	.word 0x90d1c01a  ! 62: UMULcc_R	umulcc 	%r7, %r26, %r8
	.word 0xd097e010  ! 63: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	.word 0x83d02034  ! 64: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xa1540000  ! 65: RDPR_GL	rdpr	%-, %r16
	.word 0x93902004  ! 66: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9ba00560  ! 67: FSQRTq	fsqrt	
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 68: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 69: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 70: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8da01a70  ! 71: FqTOi	fqtoi	
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982c17  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c17, %hpstate
DS_6:
	.word 0x22800001  ! 75: BE	be,a	<label_0x1>
	.xword 0xd5c88e93	! Random illegal ?
	.word 0x8da00554  ! 75: FSQRTd	fsqrt	
	.word 0x8ba00831  ! 74: FADDs	fadds	%f0, %f17, %f5
	.word 0x96d84002  ! 75: SMULcc_R	smulcc 	%r1, %r2, %r11
	.word 0xa190200c  ! 76: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1902003  ! 77: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd60fc000  ! 78: LDUB_R	ldub	[%r31 + %r0], %r11
	.word 0xd607e001  ! 79: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xa190200b  ! 80: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xa1902009  ! 81: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902000  ! 82: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902adc  ! 83: WRPR_PSTATE_I	wrpr	%r0, 0x0adc, %pstate
	.word 0x8198208c  ! 84: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008c, %hpstate
	.word 0x97508000  ! 85: RDPR_TSTATE	rdpr	%tstate, %r11
DS_7:
	.word 0x20800001  ! 87: BN	bn,a	<label_0x1>
	.word 0xd934800d  ! 87: STQF_R	-	%f12, [%r13, %r18]
	normalw
	.word 0x83458000  ! 86: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x87902020  ! 87: WRPR_TT_I	wrpr	%r0, 0x0020, %tt
	.word 0x83d02031  ! 88: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x87902021  ! 89: WRPR_TT_I	wrpr	%r0, 0x0021, %tt
change_to_randtl_8:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 90: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902001  ! 91: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8ac12001  ! 92: ADDCcc_I	addccc 	%r4, 0x0001, %r5
	.word 0xb5b04ffa  ! 93: FONES	fones	%f26
	.word 0xf47fe001  ! 94: SWAP_I	swap	%r26, [%r31 + 0x0001]
splash_cmpr_9:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 96: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1836001  ! 95: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x96fec007  ! 96: SDIVcc_R	sdivcc 	%r27, %r7, %r11
	.word 0x83d02033  ! 97: Tcc_I	te	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa190200c  ! 99: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd6cfe030  ! 100: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r11
	.word 0x91d02032  ! 101: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81982f4c  ! 102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4c, %hpstate
	.word 0x8d90249a  ! 103: WRPR_PSTATE_I	wrpr	%r0, 0x049a, %pstate
	.word 0x93d02033  ! 104: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x93902002  ! 105: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f802001  ! 106: SIR	sir	0x0001
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 107: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 108: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93902005  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902007  ! 110: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x879023d1  ! 111: WRPR_TT_I	wrpr	%r0, 0x03d1, %tt
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 113: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd627e001  ! 114: STW_I	stw	%r11, [%r31 + 0x0001]
	.word 0x8d802004  ! 115: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902005  ! 116: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xaadd000d  ! 117: SMULcc_R	smulcc 	%r20, %r13, %r21
	.word 0x8790234d  ! 118: WRPR_TT_I	wrpr	%r0, 0x034d, %tt
	.word 0x87802004  ! 119: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02035  ! 120: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x94d6e001  ! 121: UMULcc_I	umulcc 	%r27, 0x0001, %r10
	.word 0x87902171  ! 122: WRPR_TT_I	wrpr	%r0, 0x0171, %tt
	.word 0x9f802001  ! 123: SIR	sir	0x0001
reduce_priv_level_10:
	.word 0x8f902001  ! 125: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1834016  ! 124: WR_STICK_REG_R	wr	%r13, %r22, %-
	.word 0x85b24fe1  ! 125: FONES	fones	%f2
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 126: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_11:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 127: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xb568c018  ! 128: SDIVX_R	sdivx	%r3, %r24, %r26
splash_cmpr_12:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1832001  ! 129: WR_STICK_REG_I	wr	%r12, 0x0001, %-
splash_tba_13:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 130: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x856b0009  ! 131: SDIVX_R	sdivx	%r12, %r9, %r2
	.word 0x87902303  ! 132: WRPR_TT_I	wrpr	%r0, 0x0303, %tt
	.word 0xc4cfe010  ! 133: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r2
	.word 0xc48008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x81982596  ! 135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0596, %hpstate
	.word 0xc43fc009  ! 136: STD_R	std	%r2, [%r31 + %r9]
	.word 0x9150c000  ! 137: RDPR_TT	rdpr	%tt, %r8
	.word 0xd0d7e010  ! 138: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r8
	.word 0xd1e7c029  ! 139: CASA_I	casa	[%r31] 0x 1, %r9, %r8
	.word 0xd0c004a0  ! 140: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 141: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x91d02034  ! 143: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd0d004a0  ! 144: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0x9f802001  ! 145: SIR	sir	0x0001
	.word 0xa1902005  ! 146: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8198265d  ! 147: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065d, %hpstate
reduce_priv_level_14:
	.word 0x8f902001  ! 149: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb180c007  ! 148: WR_STICK_REG_R	wr	%r3, %r7, %-
	.word 0x8198281f  ! 149: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081f, %hpstate
change_to_tl1_15:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8790232a  ! 151: WRPR_TT_I	wrpr	%r0, 0x032a, %tt
	.word 0x87a00540  ! 152: FSQRTd	fsqrt	
	.word 0x8b6e8016  ! 153: SDIVX_R	sdivx	%r26, %r22, %r5
	.word 0x98684000  ! 154: UDIVX_R	udivx 	%r1, %r0, %r12
	.word 0xd8d804a0  ! 155: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1902005  ! 157: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x91d02034  ! 158: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93d02033  ! 159: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x85a109c1  ! 160: FDIVd	fdivd	%f4, %f32, %f2
	.word 0xa1902002  ! 161: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x32700001  ! 162: BPNE	<illegal instruction>
	.word 0x9f802001  ! 163: SIR	sir	0x0001
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 164: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 165: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_16:
	.word 0x22800001  ! 167: BE	be,a	<label_0x1>
	.xword 0x814fd993	! Random illegal ?
	.word 0xb5a00543  ! 167: FSQRTd	fsqrt	
	.word 0x8fa1882b  ! 166: FADDs	fadds	%f6, %f11, %f7
	.word 0xa1902000  ! 167: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x89500000  ! 168: RDPR_TPC	rdpr	%tpc, %r4
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 169: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa0fdc008  ! 170: SDIVcc_R	sdivcc 	%r23, %r8, %r16
	.word 0x87902273  ! 171: WRPR_TT_I	wrpr	%r0, 0x0273, %tt
	.word 0x986de001  ! 172: UDIVX_I	udivx 	%r23, 0x0001, %r12
	.word 0x8198249c  ! 173: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049c, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 174: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 175: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x24800001  ! 176: BLE	ble,a	<label_0x1>
	.word 0x8aa88016  ! 177: ANDNcc_R	andncc 	%r2, %r22, %r5
	.word 0x91d02032  ! 178: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 179: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcad00e80  ! 180: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r5
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 181: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8efc2001  ! 182: SDIVcc_I	sdivcc 	%r16, 0x0001, %r7
DS_17:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 183: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xcf17c000  ! 184: LDQF_R	-	[%r31, %r0], %f7
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 185: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 186: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce8008a0  ! 187: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 188: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_18:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 189: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xb7a109a8  ! 190: FDIVs	fdivs	%f4, %f8, %f27
	.word 0x8790218a  ! 191: WRPR_TT_I	wrpr	%r0, 0x018a, %tt
	.word 0x879022cd  ! 192: WRPR_TT_I	wrpr	%r0, 0x02cd, %tt
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 193: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_htba_19:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 194: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 196: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xb2fde001  ! 197: SDIVcc_I	sdivcc 	%r23, 0x0001, %r25
	.word 0x9f802001  ! 198: SIR	sir	0x0001
	.word 0xb6ab4010  ! 199: ANDNcc_R	andncc 	%r13, %r16, %r27
	.word 0x81982785  ! 200: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0785, %hpstate
	.word 0x87a000c6  ! 201: FNEGd	fnegd	%f6, %f34
	.word 0xa3508000  ! 202: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0x99540000  ! 203: RDPR_GL	<illegal instruction>
	.word 0xd8800c80  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r12
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 205: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb3a00556  ! 206: FSQRTd	fsqrt	
	.word 0x8790232b  ! 207: WRPR_TT_I	wrpr	%r0, 0x032b, %tt
DS_20:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 208: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8790203a  ! 209: WRPR_TT_I	wrpr	%r0, 0x003a, %tt
	.word 0x83d02034  ! 210: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xaf500000  ! 211: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x8d90284e  ! 212: WRPR_PSTATE_I	wrpr	%r0, 0x084e, %pstate
	.word 0x9950c000  ! 213: RDPR_TT	rdpr	%tt, %r12
splash_htba_21:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 214: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 215: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_22:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 216: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
change_to_randtl_23:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 217: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x819826c4  ! 218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c4, %hpstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x98ad8006  ! 220: ANDNcc_R	andncc 	%r22, %r6, %r12
	.word 0xa1902006  ! 221: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x84fdc008  ! 222: SDIVcc_R	sdivcc 	%r23, %r8, %r2
	.word 0x2c700001  ! 223: BPNEG	<illegal instruction>
	.word 0x819827c7  ! 224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c7, %hpstate
	.word 0x93d02031  ! 225: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8198209c  ! 226: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009c, %hpstate
	.word 0x93902000  ! 227: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982415  ! 228: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0415, %hpstate
	.word 0xa268e001  ! 229: UDIVX_I	udivx 	%r3, 0x0001, %r17
reduce_priv_level_24:
	.word 0x8f902002  ! 231: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x856a6001  ! 230: SDIVX_I	sdivx	%r9, 0x0001, %r2
	.word 0x93902005  ! 231: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x879021b1  ! 232: WRPR_TT_I	wrpr	%r0, 0x01b1, %tt
	.word 0x8198200e  ! 233: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000e, %hpstate
	.word 0x91d02035  ! 234: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_25:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 235: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_htba_26:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 236: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9bb48fe6  ! 237: FONES	fones	%f13
	.word 0xa1902000  ! 238: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d02034  ! 239: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902001  ! 240: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8f6a4007  ! 241: SDIVX_R	sdivx	%r9, %r7, %r7
	.word 0xa1902003  ! 242: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x83540000  ! 243: RDPR_GL	rdpr	%-, %r1
	.word 0x8d902651  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x0651, %pstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 245: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982c05  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c05, %hpstate
	.word 0x87540000  ! 247: RDPR_GL	rdpr	%-, %r3
	.word 0x8681c01b  ! 248: ADDcc_R	addcc 	%r7, %r27, %r3
	.word 0xc7e7c03b  ! 249: CASA_I	casa	[%r31] 0x 1, %r27, %r3
	.word 0x87902065  ! 250: WRPR_TT_I	wrpr	%r0, 0x0065, %tt
	.word 0x81982354  ! 251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0354, %hpstate
	.word 0xc737c01b  ! 252: STQF_R	-	%f3, [%r27, %r31]
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 253: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3e800001  ! 254: BVC	bvc,a	<label_0x1>
	.word 0x81a00577  ! 255: FSQRTq	fsqrt	
	ta	T_CHANGE_PRIV	! macro
splash_tba_27:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 257: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902315  ! 258: WRPR_TT_I	wrpr	%r0, 0x0315, %tt
	.word 0x92a84011  ! 259: ANDNcc_R	andncc 	%r1, %r17, %r9
DS_28:
	.word 0x20800001  ! 261: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 260: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 261: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 262: WRASI_I	wr	%r0, 0x0016, %asi
	!.word 0xd22fc011  ! 263: STB_R	
    stb	%r9, [%r31 + 0x1234]
	.word 0x8d802004  ! 264: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_29:
	.word 0x32800001  ! 266: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 265: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 266: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd29fc020  ! 267: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	.word 0xa1902002  ! 268: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8790212d  ! 269: WRPR_TT_I	wrpr	%r0, 0x012d, %tt
	.word 0xd2dfe010  ! 270: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r9
DS_30:
	.word 0x20800001  ! 272: BN	bn,a	<label_0x1>
	.word 0xd3300010  ! 272: STQF_R	-	%f9, [%r16, %r0]
	normalw
	.word 0xaf458000  ! 271: RD_SOFTINT_REG	rd	%softint, %r23
	.word 0x81982f5e  ! 272: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5e, %hpstate
	.word 0x93902002  ! 273: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8790216d  ! 274: WRPR_TT_I	wrpr	%r0, 0x016d, %tt
	.word 0x8d902603  ! 275: WRPR_PSTATE_I	wrpr	%r0, 0x0603, %pstate
	.word 0x81982a54  ! 276: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a54, %hpstate
	.word 0x91702001  ! 277: POPC_I	popc	0x0001, %r8
	.word 0xb4d68014  ! 278: UMULcc_R	umulcc 	%r26, %r20, %r26
	.word 0x8d802000  ! 279: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902310  ! 280: WRPR_TT_I	wrpr	%r0, 0x0310, %tt
	.word 0xa190200e  ! 281: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8198285c  ! 282: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085c, %hpstate
	.word 0x8750c000  ! 283: RDPR_TT	rdpr	%tt, %r3
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 284: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc737e001  ! 285: STQF_I	-	%f3, [0x0001, %r31]
	.word 0x87902058  ! 286: WRPR_TT_I	wrpr	%r0, 0x0058, %tt
	.word 0x93902002  ! 287: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8ba28d37  ! 288: FsMULd	fsmuld	%f10, %f54, %f36
	.word 0x8550c000  ! 289: RDPR_TT	rdpr	%tt, %r2
	.word 0xc417e001  ! 290: LDUH_I	lduh	[%r31 + 0x0001], %r2
	.word 0x81b1cfe5  ! 291: FONES	fones	%f0
DS_31:
	.word 0x20800001  ! 293: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 293: BNE	bne,a	<label_0x1>
	.word 0xc111800c  ! 293: LDQF_R	-	[%r6, %r12], %f0
	.word 0x97a48828  ! 292: FADDs	fadds	%f18, %f8, %f11
DS_32:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 293: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
change_to_randtl_33:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 294: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
change_to_tl1_34:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x86da0009  ! 296: SMULcc_R	smulcc 	%r8, %r9, %r3
	.word 0x3e800001  ! 297: BVC	bvc,a	<label_0x1>
	.word 0x8d802000  ! 298: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc6800a80  ! 299: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r3
	.word 0xa190200d  ! 300: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa1902000  ! 301: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d02034  ! 302: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902003  ! 303: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87802089  ! 304: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8486c011  ! 305: ADDcc_R	addcc 	%r27, %r17, %r2
	.word 0xc4ffc031  ! 306: SWAPA_R	swapa	%r2, [%r31 + %r17] 0x01
	.word 0xa0da0007  ! 307: SMULcc_R	smulcc 	%r8, %r7, %r16
	.word 0xa1902006  ! 308: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x9151c000  ! 309: RDPR_TL	rdpr	%tl, %r8
	.word 0x81982214  ! 310: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0214, %hpstate
splash_cmpr_35:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 312: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1842001  ! 311: WR_STICK_REG_I	wr	%r16, 0x0001, %-
	.word 0x9f802001  ! 312: SIR	sir	0x0001
reduce_priv_level_36:
	.word 0x8f902000  ! 314: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1834004  ! 313: WR_STICK_REG_R	wr	%r13, %r4, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 314: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902ed5  ! 315: WRPR_PSTATE_I	wrpr	%r0, 0x0ed5, %pstate
	.word 0xa350c000  ! 316: RDPR_TT	rdpr	%tt, %r17
	.word 0xe337e001  ! 317: STQF_I	-	%f17, [0x0001, %r31]
	.word 0xa6d9c00b  ! 318: SMULcc_R	smulcc 	%r7, %r11, %r19
	.word 0x81982084  ! 319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0084, %hpstate
	.word 0xa1902001  ! 320: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93902004  ! 321: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x32800001  ! 322: BNE	bne,a	<label_0x1>
	.word 0x99902003  ! 323: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x93902000  ! 324: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_37:
	.word 0x20800001  ! 326: BN	bn,a	<label_0x1>
	pdist %f28, %f8, %f26
	.word 0xb1b30315  ! 325: ALLIGNADDRESS	alignaddr	%r12, %r21, %r24
	.word 0xa190200e  ! 326: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x85a000d1  ! 327: FNEGd	fnegd	%f48, %f2
DS_38:
	.word 0x20800001  ! 329: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 328: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc48804a0  ! 329: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc4ffc031  ! 330: SWAPA_R	swapa	%r2, [%r31 + %r17] 0x01
	.word 0xc48fe010  ! 331: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r2
	.word 0x9ad42001  ! 332: UMULcc_I	umulcc 	%r16, 0x0001, %r13
	.word 0xa8c46001  ! 333: ADDCcc_I	addccc 	%r17, 0x0001, %r20
	.word 0x81b1cfe2  ! 334: FONES	fones	%f0
splash_tba_39:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 335: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902003  ! 336: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902e83  ! 337: WRPR_PSTATE_I	wrpr	%r0, 0x0e83, %pstate
	.word 0xc02fe001  ! 338: STB_I	stb	%r0, [%r31 + 0x0001]
	.word 0x8790223a  ! 339: WRPR_TT_I	wrpr	%r0, 0x023a, %tt
splash_tba_40:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 340: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802014  ! 341: WRASI_I	wr	%r0, 0x0014, %asi
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 342: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_41:
	.word 0x22800001  ! 344: BE	be,a	<label_0x1>
	pdist %f28, %f28, %f26
	.word 0x93b0430a  ! 343: ALLIGNADDRESS	alignaddr	%r1, %r10, %r9
	.word 0x8d902288  ! 344: WRPR_PSTATE_I	wrpr	%r0, 0x0288, %pstate
	.word 0xd2d00e80  ! 345: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r9
	.word 0x81982a95  ! 346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a95, %hpstate
change_to_tl1_42:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1902007  ! 348: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d9022dc  ! 349: WRPR_PSTATE_I	wrpr	%r0, 0x02dc, %pstate
	.word 0x91d02030  ! 350: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902000  ! 351: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x95a00568  ! 352: FSQRTq	fsqrt	
	.word 0x91d02032  ! 353: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd5e7c028  ! 354: CASA_I	casa	[%r31] 0x 1, %r8, %r10
	.word 0xd42fc008  ! 355: STB_R	stb	%r10, [%r31 + %r8]
	.word 0xb3a5c9c1  ! 356: FDIVd	fdivd	%f54, %f32, %f56
reduce_priv_level_43:
	.word 0x8f902001  ! 358: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa7686001  ! 357: SDIVX_I	sdivx	%r1, 0x0001, %r19
	.word 0x86fa8012  ! 358: SDIVcc_R	sdivcc 	%r10, %r18, %r3
	.word 0x87802004  ! 359: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9f802001  ! 360: SIR	sir	0x0001
	.word 0xa1902005  ! 361: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa951c000  ! 362: RDPR_TL	rdpr	%tl, %r20
	.word 0xa190200e  ! 363: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_htba_44:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 364: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8f540000  ! 365: RDPR_GL	rdpr	%-, %r7
	.word 0x91d02032  ! 366: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d9020d2  ! 367: WRPR_PSTATE_I	wrpr	%r0, 0x00d2, %pstate
change_to_randtl_45:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 368: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x83d02032  ! 369: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x81982e06  ! 370: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e06, %hpstate
	.word 0x99902001  ! 371: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x879023c0  ! 372: WRPR_TT_I	wrpr	%r0, 0x03c0, %tt
	.word 0x91d02030  ! 373: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xce7fe001  ! 374: SWAP_I	swap	%r7, [%r31 + 0x0001]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8c82c014  ! 376: ADDcc_R	addcc 	%r11, %r20, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xb5514000  ! 378: RDPR_TBA	rdpr	%tba, %r26
	.word 0x87902011  ! 379: WRPR_TT_I	wrpr	%r0, 0x0011, %tt
	.word 0xf5e7c034  ! 380: CASA_I	casa	[%r31] 0x 1, %r20, %r26
	.word 0x91d02034  ! 381: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d02035  ! 382: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902001  ! 383: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xf4c004a0  ! 384: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r26
	.word 0xa5500000  ! 385: RDPR_TPC	rdpr	%tpc, %r18
	.word 0xb1508000  ! 386: RDPR_TSTATE	<illegal instruction>
splash_tba_46:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 387: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200c  ! 388: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xf0d804a0  ! 389: LDXA_R	ldxa	[%r0, %r0] 0x25, %r24
	.word 0x81982c96  ! 390: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c96, %hpstate
	.word 0xacfb6001  ! 391: SDIVcc_I	sdivcc 	%r13, 0x0001, %r22
	.word 0xede7c034  ! 392: CASA_I	casa	[%r31] 0x 1, %r20, %r22
	.word 0x87902292  ! 393: WRPR_TT_I	wrpr	%r0, 0x0292, %tt
	.word 0x91a0c9d4  ! 394: FDIVd	fdivd	%f34, %f20, %f8
	.word 0x8790221a  ! 395: WRPR_TT_I	wrpr	%r0, 0x021a, %tt
	.word 0x866e8015  ! 396: UDIVX_R	udivx 	%r26, %r21, %r3
	.word 0xaba4cd26  ! 397: FsMULd	fsmuld	%f19, %f6, %f52
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 398: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902008  ! 399: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xead004a0  ! 400: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r21
	.word 0x9f802001  ! 401: SIR	sir	0x0001
	.word 0xea1fc000  ! 402: LDD_R	ldd	[%r31 + %r0], %r21
	.word 0x91d02031  ! 403: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa190200f  ! 404: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x879021d2  ! 405: WRPR_TT_I	wrpr	%r0, 0x01d2, %tt
	.word 0x91d02030  ! 406: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x83d02033  ! 407: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x879023a1  ! 408: WRPR_TT_I	wrpr	%r0, 0x03a1, %tt
	.word 0xea900e80  ! 409: LDUHA_R	lduha	[%r0, %r0] 0x74, %r21
	.word 0xead80e80  ! 410: LDXA_R	ldxa	[%r0, %r0] 0x74, %r21
	.word 0xb6c1e001  ! 411: ADDCcc_I	addccc 	%r7, 0x0001, %r27
	.word 0x93902000  ! 412: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879022c0  ! 413: WRPR_TT_I	wrpr	%r0, 0x02c0, %tt
	.word 0xa3a00571  ! 414: FSQRTq	fsqrt	
	.word 0xa190200d  ! 415: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93d02030  ! 416: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x91d02034  ! 417: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8790209c  ! 418: WRPR_TT_I	wrpr	%r0, 0x009c, %tt
	.word 0x8950c000  ! 419: RDPR_TT	rdpr	%tt, %r4
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 420: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_47:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 421: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa3504000  ! 422: RDPR_TNPC	rdpr	%tnpc, %r17
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 423: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b500000  ! 424: RDPR_TPC	<illegal instruction>
	.word 0x24800001  ! 425: BLE	ble,a	<label_0x1>
	.word 0xa190200e  ! 426: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xcad7e010  ! 427: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r5
	.word 0x8d902c15  ! 428: WRPR_PSTATE_I	wrpr	%r0, 0x0c15, %pstate
	.word 0x91d02030  ! 429: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93d02035  ! 430: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8d902c4d  ! 431: WRPR_PSTATE_I	wrpr	%r0, 0x0c4d, %pstate
	.word 0x81982d5e  ! 432: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5e, %hpstate
	.word 0xa190200c  ! 433: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x91d02034  ! 434: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x99902003  ! 435: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 436: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca37e001  ! 437: STH_I	sth	%r5, [%r31 + 0x0001]
	.word 0x91d02032  ! 438: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902001  ! 439: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8fa44dcd  ! 440: FdMULq	fdmulq	
splash_tba_48:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 441: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902006  ! 442: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x819824c5  ! 443: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c5, %hpstate
	.word 0x8d802004  ! 444: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9f802001  ! 445: SIR	sir	0x0001
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 446: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xaf51c000  ! 447: RDPR_TL	rdpr	%tl, %r23
	.word 0xb1508000  ! 448: RDPR_TSTATE	<illegal instruction>
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 449: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d90284c  ! 450: WRPR_PSTATE_I	wrpr	%r0, 0x084c, %pstate
	.word 0x8d902ed1  ! 451: WRPR_PSTATE_I	wrpr	%r0, 0x0ed1, %pstate
	.word 0x8d902804  ! 452: WRPR_PSTATE_I	wrpr	%r0, 0x0804, %pstate
	.word 0x9f802001  ! 453: SIR	sir	0x0001
change_to_tl1_49:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02031  ! 455: Tcc_I	ta	icc_or_xcc, %r0 + 49
splash_tba_50:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 456: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802014  ! 457: WRASI_I	wr	%r0, 0x0014, %asi
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 458: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 459: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
reduce_priv_level_51:
	.word 0x8f902000  ! 461: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83a01964  ! 460: FqTOd	dis not found

	ta	T_CHANGE_PRIV	! macro
change_to_randtl_52:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 462: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc2cfe030  ! 463: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r1
	.word 0x8d9026de  ! 464: WRPR_PSTATE_I	wrpr	%r0, 0x06de, %pstate
	.word 0x93902007  ! 465: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc3e7c024  ! 466: CASA_I	casa	[%r31] 0x 1, %r4, %r1
	.word 0x89a349b3  ! 467: FDIVs	fdivs	%f13, %f19, %f4
	.word 0xc877c013  ! 468: STX_R	stx	%r4, [%r31 + %r19]
	.word 0xaa494017  ! 469: MULX_R	mulx 	%r5, %r23, %r21
	.word 0xa1902008  ! 470: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_53:
	.word 0x34800001  ! 472: BG	bg,a	<label_0x1>
	pdist %f18, %f18, %f24
	.word 0x8fb50314  ! 471: ALLIGNADDRESS	alignaddr	%r20, %r20, %r7
	.word 0x81982857  ! 472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0857, %hpstate
	.word 0x93902001  ! 473: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8db2cfe9  ! 474: FONES	fones	%f6
	.word 0xccd7e030  ! 475: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r6
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 476: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc8008a0  ! 477: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8ede0002  ! 478: SMULcc_R	smulcc 	%r24, %r2, %r7
	.word 0x8790225b  ! 479: WRPR_TT_I	wrpr	%r0, 0x025b, %tt
	.word 0x98684017  ! 480: UDIVX_R	udivx 	%r1, %r23, %r12
	.word 0x8d902c05  ! 481: WRPR_PSTATE_I	wrpr	%r0, 0x0c05, %pstate
	.word 0x9f802001  ! 482: SIR	sir	0x0001
	.word 0x8d902ac7  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x0ac7, %pstate
splash_tba_54:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 484: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x36800001  ! 485: BGE	bge,a	<label_0x1>
	.word 0x8790208d  ! 486: WRPR_TT_I	wrpr	%r0, 0x008d, %tt
splash_htba_55:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 487: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8198268d  ! 488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068d, %hpstate
splash_htba_56:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 489: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8f504000  ! 490: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x91d02034  ! 491: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 492: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 493: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9551c000  ! 494: RDPR_TL	rdpr	%tl, %r10
	.word 0x8d802004  ! 495: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87500000  ! 496: RDPR_TPC	rdpr	%tpc, %r3
DS_57:
	.word 0x20800001  ! 498: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 497: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200f  ! 498: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d802000  ! 499: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_58:
	.word 0x22800001  ! 501: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 500: SAVE_R	save	%r31, %r0, %r31
	.word 0x95a309a7  ! 501: FDIVs	fdivs	%f12, %f7, %f10
	.word 0x98fa0019  ! 502: SDIVcc_R	sdivcc 	%r8, %r25, %r12
	.word 0x88842001  ! 503: ADDcc_I	addcc 	%r16, 0x0001, %r4
DS_59:
	.word 0x34800001  ! 505: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 504: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x38800001  ! 505: BGU	bgu,a	<label_0x1>
splash_tba_60:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 506: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87702001  ! 507: POPC_I	popc	0x0001, %r3
	.word 0x93902004  ! 508: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x92fb0000  ! 509: SDIVcc_R	sdivcc 	%r12, %r0, %r9
	.word 0x87540000  ! 510: RDPR_GL	rdpr	%-, %r3
DS_61:
	.word 0x20800001  ! 512: BN	bn,a	<label_0x1>
	pdist %f24, %f16, %f2
	.word 0x8db30316  ! 511: ALLIGNADDRESS	alignaddr	%r12, %r22, %r6
	.word 0x8790204a  ! 512: WRPR_TT_I	wrpr	%r0, 0x004a, %tt
	.word 0x97540000  ! 513: RDPR_GL	rdpr	%-, %r11
	ta	T_CHANGE_PRIV	! macro
DS_62:
	.word 0x20800001  ! 516: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 515: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x83d02034  ! 516: Tcc_I	te	icc_or_xcc, %r0 + 52
DS_63:
	.word 0x32800001  ! 518: BNE	bne,a	<label_0x1>
	allclean
	.word 0x89b5c302  ! 517: ALLIGNADDRESS	alignaddr	%r23, %r2, %r4
	.word 0xa0c12001  ! 518: ADDCcc_I	addccc 	%r4, 0x0001, %r16
reduce_priv_level_64:
	.word 0x8f902001  ! 520: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb56da001  ! 519: SDIVX_I	sdivx	%r22, 0x0001, %r26
	.word 0x26800001  ! 520: BL	bl,a	<label_0x1>
	.word 0xa1902006  ! 521: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8b500000  ! 522: RDPR_TPC	rdpr	%tpc, %r5
	.word 0x8d802004  ! 523: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa44ac015  ! 524: MULX_R	mulx 	%r11, %r21, %r18
	.word 0x89a349f3  ! 525: FDIVq	dis not found

	.word 0x91d02030  ! 526: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x87902170  ! 527: WRPR_TT_I	wrpr	%r0, 0x0170, %tt
	.word 0x8cd40010  ! 528: UMULcc_R	umulcc 	%r16, %r16, %r6
	.word 0x93902003  ! 529: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xcc97e030  ! 530: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r6
	.word 0x20700001  ! 531: BPN	<illegal instruction>
	.word 0x91d02035  ! 532: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902005  ! 533: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802004  ! 535: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_65:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 537: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1806001  ! 536: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0x8790205f  ! 537: WRPR_TT_I	wrpr	%r0, 0x005f, %tt
	.word 0x9f802001  ! 538: SIR	sir	0x0001
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 539: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879020d6  ! 540: WRPR_TT_I	wrpr	%r0, 0x00d6, %tt
	.word 0x96d5a001  ! 541: UMULcc_I	umulcc 	%r22, 0x0001, %r11
	.word 0x87902184  ! 542: WRPR_TT_I	wrpr	%r0, 0x0184, %tt
	.word 0x91d02033  ! 543: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02033  ! 544: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d802000  ! 545: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200c  ! 546: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8aab0016  ! 547: ANDNcc_R	andncc 	%r12, %r22, %r5
	.word 0x87802080  ! 548: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x83d02035  ! 549: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x81982a9e  ! 550: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9e, %hpstate
	.word 0x8d9020c3  ! 551: WRPR_PSTATE_I	wrpr	%r0, 0x00c3, %pstate
	.word 0xa190200c  ! 552: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902001  ! 553: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_66:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 554: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 555: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 556: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 557: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02031  ! 558: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902005  ! 559: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87802014  ! 560: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9f802001  ! 561: SIR	sir	0x0001
	.word 0x80d16001  ! 562: UMULcc_I	umulcc 	%r5, 0x0001, %r0
	.word 0x93902003  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02031  ! 564: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xc0d7e020  ! 565: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r0
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 566: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9020dc  ! 567: WRPR_PSTATE_I	wrpr	%r0, 0x00dc, %pstate
	.word 0x89a01a78  ! 568: FqTOi	fqtoi	
	ta	T_CHANGE_PRIV	! macro
	.word 0x95514000  ! 570: RDPR_TBA	rdpr	%tba, %r10
	.word 0x8790201f  ! 571: WRPR_TT_I	wrpr	%r0, 0x001f, %tt
	.word 0xa1902007  ! 572: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8f508000  ! 573: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0x91d02035  ! 574: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902000  ! 575: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8780201c  ! 576: WRASI_I	wr	%r0, 0x001c, %asi
reduce_priv_level_67:
	.word 0x8f902002  ! 578: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89858016  ! 577: WRTICK_R	wr	%r22, %r22, %tick
	.word 0xa190200c  ! 578: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 579: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902818  ! 580: WRPR_PSTATE_I	wrpr	%r0, 0x0818, %pstate
	.word 0x93d02034  ! 581: Tcc_I	tne	icc_or_xcc, %r0 + 52
DS_68:
	.word 0x34800001  ! 583: BG	bg,a	<label_0x1>
	.word 0xcf34800c  ! 583: STQF_R	-	%f7, [%r12, %r18]
	normalw
	.word 0x83458000  ! 582: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x81982556  ! 583: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0556, %hpstate
change_to_randtl_69:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 584: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
splash_htba_70:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 585: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_cmpr_71:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 587: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1832001  ! 586: WR_STICK_REG_I	wr	%r12, 0x0001, %-
	.word 0x91d02032  ! 587: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802089  ! 588: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xb3a68d24  ! 589: FsMULd	fsmuld	%f26, %f4, %f56
	.word 0x8d902c59  ! 590: WRPR_PSTATE_I	wrpr	%r0, 0x0c59, %pstate
DS_72:
	.word 0x32800001  ! 592: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 591: SAVE_R	save	%r31, %r0, %r31
	.word 0x93902005  ! 592: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87802080  ! 593: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93902004  ! 594: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa190200a  ! 595: WRPR_GL_I	wrpr	%r0, 0x000a, %-
DS_73:
	.word 0x32800001  ! 597: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 597: BN	bn,a	<label_0x1>
	.word 0x83a00547  ! 597: FSQRTd	fsqrt	
	.word 0x81a08825  ! 596: FADDs	fadds	%f2, %f5, %f0
	.word 0xa1902006  ! 597: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87802089  ! 598: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x91d02032  ! 599: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8780201c  ! 600: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8b50c000  ! 601: RDPR_TT	rdpr	%tt, %r5
	.word 0xca8008a0  ! 602: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xa5a000c1  ! 603: FNEGd	fnegd	%f32, %f18
	.word 0x879020ae  ! 604: WRPR_TT_I	wrpr	%r0, 0x00ae, %tt
	.word 0x8d902482  ! 605: WRPR_PSTATE_I	wrpr	%r0, 0x0482, %pstate
	.word 0x91d02030  ! 606: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902000  ! 607: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9ba000cc  ! 609: FNEGd	fnegd	%f12, %f44
	.word 0xda7fe001  ! 610: SWAP_I	swap	%r13, [%r31 + 0x0001]
splash_htba_74:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 611: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa3504000  ! 612: RDPR_TNPC	rdpr	%tnpc, %r17
splash_tba_75:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 613: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
change_to_randtl_76:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 615: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902002  ! 616: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xb7a109e0  ! 617: FDIVq	dis not found

	.word 0x8790209d  ! 618: WRPR_TT_I	wrpr	%r0, 0x009d, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xf6ffc020  ! 620: SWAPA_R	swapa	%r27, [%r31 + %r0] 0x01
	.word 0x91d02030  ! 621: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x3c700001  ! 622: BPPOS	<illegal instruction>
reduce_priv_level_77:
	.word 0x8f902000  ! 624: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89840000  ! 623: WRTICK_R	wr	%r16, %r0, %tick
	.word 0xf6900e60  ! 624: LDUHA_R	lduha	[%r0, %r0] 0x73, %r27
	.word 0x87902111  ! 625: WRPR_TT_I	wrpr	%r0, 0x0111, %tt
	.word 0x38700001  ! 626: BPGU	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902053  ! 628: WRPR_PSTATE_I	wrpr	%r0, 0x0053, %pstate
	.word 0xf68008a0  ! 629: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
	.word 0x879022f0  ! 630: WRPR_TT_I	wrpr	%r0, 0x02f0, %tt
	.word 0x81982e5e  ! 631: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5e, %hpstate
	.word 0x8d902ed5  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x0ed5, %pstate
	.word 0x95a00568  ! 633: FSQRTq	fsqrt	
	.word 0x8d9020da  ! 634: WRPR_PSTATE_I	wrpr	%r0, 0x00da, %pstate
change_to_randtl_78:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 635: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa9504000  ! 636: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x91d02035  ! 637: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa8fa4004  ! 638: SDIVcc_R	sdivcc 	%r9, %r4, %r20
	.word 0x93902001  ! 639: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 640: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x82806001  ! 641: ADDcc_I	addcc 	%r1, 0x0001, %r1
	.word 0x99a0c9b2  ! 642: FDIVs	fdivs	%f3, %f18, %f12
reduce_priv_level_79:
	.word 0x8f902001  ! 644: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89830019  ! 643: WRTICK_R	wr	%r12, %r25, %tick
	.word 0x91d02030  ! 644: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xd8c7e020  ! 645: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r12
	.word 0xd8d80e80  ! 646: LDXA_R	ldxa	[%r0, %r0] 0x74, %r12
	.word 0xd827e001  ! 647: STW_I	stw	%r12, [%r31 + 0x0001]
	.word 0xd927c019  ! 648: STF_R	st	%f12, [%r25, %r31]
	.word 0x93902001  ! 649: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd88008a0  ! 650: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xa1514000  ! 651: RDPR_TBA	rdpr	%tba, %r16
	.word 0xa190200c  ! 652: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 653: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 654: SIR	sir	0x0001
	.word 0xb3504000  ! 655: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0xa5a00540  ! 656: FSQRTd	fsqrt	
	.word 0x81982e5d  ! 657: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5d, %hpstate
	.word 0xa1902000  ! 658: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91500000  ! 659: RDPR_TPC	rdpr	%tpc, %r8
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87500000  ! 661: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x8d802000  ! 662: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x819826dc  ! 663: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06dc, %hpstate
	.word 0xc727e001  ! 664: STF_I	st	%f3, [0x0001, %r31]
	.word 0x81982555  ! 665: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0555, %hpstate
	.word 0x819822cc  ! 666: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cc, %hpstate
splash_htba_80:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 667: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9f802001  ! 668: SIR	sir	0x0001
	.word 0xa1902008  ! 669: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa1902008  ! 670: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 671: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982394  ! 672: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0394, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 673: Tcc_R	ta	icc_or_xcc, %r0 + %r30
reduce_priv_level_81:
	.word 0x8f902001  ! 675: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89800000  ! 674: WRTICK_R	wr	%r0, %r0, %tick
	.word 0x8d902457  ! 675: WRPR_PSTATE_I	wrpr	%r0, 0x0457, %pstate
	.word 0xa1902007  ! 676: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1902004  ! 677: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x95508000  ! 678: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0xb3500000  ! 679: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x81982d45  ! 680: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d45, %hpstate
	.word 0xf2d804a0  ! 681: LDXA_R	ldxa	[%r0, %r0] 0x25, %r25
	.word 0x3c700001  ! 682: BPPOS	<illegal instruction>
	.word 0x36800001  ! 683: BGE	bge,a	<label_0x1>
	.word 0x82fb4013  ! 684: SDIVcc_R	sdivcc 	%r13, %r19, %r1
	.word 0xc337c013  ! 685: STQF_R	-	%f1, [%r19, %r31]
	.word 0x8fa01a60  ! 686: FqTOi	fqtoi	
	.word 0x88d14010  ! 687: UMULcc_R	umulcc 	%r5, %r16, %r4
	.word 0x83a0055b  ! 688: FSQRTd	fsqrt	
	.word 0x93902003  ! 689: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902009  ! 690: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xb0d4801b  ! 691: UMULcc_R	umulcc 	%r18, %r27, %r24
	.word 0x9f802001  ! 692: SIR	sir	0x0001
	.word 0x93902003  ! 693: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902003  ! 694: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_tba_82:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 695: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8b51c000  ! 696: RDPR_TL	rdpr	%tl, %r5
	.word 0x8fa109e9  ! 697: FDIVq	dis not found

	.word 0xb7504000  ! 698: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x93902002  ! 699: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02034  ! 700: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902007  ! 701: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x99902001  ! 702: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 703: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_83:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 705: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 704: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0x93902001  ! 705: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 707: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02031  ! 708: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8d902848  ! 709: WRPR_PSTATE_I	wrpr	%r0, 0x0848, %pstate
	.word 0xf737e001  ! 710: STQF_I	-	%f27, [0x0001, %r31]
change_to_randtl_84:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 711: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8e48c004  ! 712: MULX_R	mulx 	%r3, %r4, %r7
	.word 0x9f802001  ! 713: SIR	sir	0x0001
	.word 0x8198275e  ! 714: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075e, %hpstate
change_to_tl1_85:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x879020a8  ! 716: WRPR_TT_I	wrpr	%r0, 0x00a8, %tt
splash_cmpr_86:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182a001  ! 717: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0x8d902ec8  ! 718: WRPR_PSTATE_I	wrpr	%r0, 0x0ec8, %pstate
	.word 0x98fd400b  ! 719: SDIVcc_R	sdivcc 	%r21, %r11, %r12
	.word 0xd88804a0  ! 720: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0xd8ffc02b  ! 721: SWAPA_R	swapa	%r12, [%r31 + %r11] 0x01
	.word 0x93d02034  ! 722: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa1902004  ! 723: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8198279f  ! 724: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079f, %hpstate
	.word 0xd83fe001  ! 725: STD_I	std	%r12, [%r31 + 0x0001]
	.word 0x9a81000b  ! 726: ADDcc_R	addcc 	%r4, %r11, %r13
	.word 0xda8008a0  ! 727: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
change_to_tl1_87:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xdaffc02b  ! 729: SWAPA_R	swapa	%r13, [%r31 + %r11] 0x01
	.word 0xa1902008  ! 730: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xdbe7c02b  ! 731: CASA_I	casa	[%r31] 0x 1, %r11, %r13
	.word 0xdb17c000  ! 732: LDQF_R	-	[%r31, %r0], %f13
	.word 0x92c0e001  ! 733: ADDCcc_I	addccc 	%r3, 0x0001, %r9
	.word 0x87508000  ! 734: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x81982f04  ! 735: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f04, %hpstate
	.word 0x83514000  ! 736: RDPR_TBA	rdpr	%tba, %r1
	.word 0xa1902006  ! 737: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d90240d  ! 738: WRPR_PSTATE_I	wrpr	%r0, 0x040d, %pstate
	.word 0x87902384  ! 739: WRPR_TT_I	wrpr	%r0, 0x0384, %tt
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 740: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 741: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_88:
	.word 0x22800001  ! 743: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 742: SAVE_R	save	%r31, %r0, %r31
	.word 0x87902361  ! 743: WRPR_TT_I	wrpr	%r0, 0x0361, %tt
	.word 0xa1902007  ! 744: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa190200a  ! 745: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 746: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc22fe001  ! 747: STB_I	stb	%r1, [%r31 + 0x0001]
	.word 0x8d90281b  ! 748: WRPR_PSTATE_I	wrpr	%r0, 0x081b, %pstate
	.word 0x91a000c4  ! 749: FNEGd	fnegd	%f4, %f8
	.word 0xd0800b80  ! 750: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r8
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 751: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd127e001  ! 752: STF_I	st	%f8, [0x0001, %r31]
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 753: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 754: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879021c2  ! 755: WRPR_TT_I	wrpr	%r0, 0x01c2, %tt
	.word 0xae6ac012  ! 756: UDIVX_R	udivx 	%r11, %r18, %r23
	.word 0x879020e2  ! 757: WRPR_TT_I	wrpr	%r0, 0x00e2, %tt
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 758: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_89:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xee8008a0  ! 760: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0x8d90261c  ! 761: WRPR_PSTATE_I	wrpr	%r0, 0x061c, %pstate
	.word 0x93902004  ! 762: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902007  ! 763: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 764: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a80  ! 765: WRPR_PSTATE_I	wrpr	%r0, 0x0a80, %pstate
DS_90:
	.word 0x20800001  ! 767: BN	bn,a	<label_0x1>
	.xword 0x97dc01cd	! Random illegal ?
	.word 0xf716c011  ! 767: LDQF_R	-	[%r27, %r17], %f27
	.word 0xa9a24828  ! 766: FADDs	fadds	%f9, %f8, %f20
	.word 0x819827dc  ! 767: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07dc, %hpstate
	.word 0x91d02034  ! 768: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xb1500000  ! 769: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x91b44fe3  ! 770: FONES	fones	%f8
	.word 0xa5a64dc5  ! 771: FdMULq	fdmulq	
	.word 0x89a509d1  ! 772: FDIVd	fdivd	%f20, %f48, %f4
	.word 0xa1902000  ! 773: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x81982997  ! 774: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0997, %hpstate
	.word 0x81500000  ! 775: RDPR_TPC	rdpr	%tpc, %r0
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 776: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_tl1_91:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x99902005  ! 778: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x93902001  ! 779: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xb6d58016  ! 780: UMULcc_R	umulcc 	%r22, %r22, %r27
reduce_priv_level_92:
	.word 0x8f902001  ! 782: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb181c018  ! 781: WR_STICK_REG_R	wr	%r7, %r24, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 782: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8950c000  ! 783: RDPR_TT	<illegal instruction>
	.word 0x91d02035  ! 784: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x86fc400c  ! 785: SDIVcc_R	sdivcc 	%r17, %r12, %r3
	.word 0x8d90229b  ! 786: WRPR_PSTATE_I	wrpr	%r0, 0x029b, %pstate
	.word 0xa190200e  ! 787: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x819826d4  ! 788: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d4, %hpstate
	.word 0x81982415  ! 789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0415, %hpstate
	.word 0x81982d8e  ! 790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8e, %hpstate
	.word 0x8849400c  ! 791: MULX_R	mulx 	%r5, %r12, %r4
	.word 0x87902342  ! 792: WRPR_TT_I	wrpr	%r0, 0x0342, %tt
	.word 0x87802016  ! 793: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x91d02030  ! 794: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xc8d004a0  ! 795: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0x8d802000  ! 796: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc89004a0  ! 797: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
	.word 0x93902007  ! 798: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902001  ! 799: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x36800001  ! 800: BGE	bge,a	<label_0x1>
	.word 0x8d902e8f  ! 801: WRPR_PSTATE_I	wrpr	%r0, 0x0e8f, %pstate
	.word 0x8790231a  ! 802: WRPR_TT_I	wrpr	%r0, 0x031a, %tt
	.word 0x87802004  ! 803: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8da01a65  ! 804: FqTOi	fqtoi	
	.word 0x886a801b  ! 805: UDIVX_R	udivx 	%r10, %r27, %r4
	.word 0xc897e010  ! 806: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r4
	.word 0x8198231e  ! 807: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031e, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 808: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x97a34d30  ! 809: FsMULd	fsmuld	%f13, %f16, %f42
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 810: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 811: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_tl1_93:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x819825d5  ! 813: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d5, %hpstate
	.word 0x90850009  ! 814: ADDcc_R	addcc 	%r20, %r9, %r8
	.word 0x81982544  ! 815: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0544, %hpstate
	.word 0x98a94000  ! 816: ANDNcc_R	andncc 	%r5, %r0, %r12
	.word 0x879023ca  ! 817: WRPR_TT_I	wrpr	%r0, 0x03ca, %tt
DS_94:
	.word 0x32800001  ! 819: BNE	bne,a	<label_0x1>
	.xword 0xb9f2096d	! Random illegal ?
	.word 0xd910000d  ! 819: LDQF_R	-	[%r0, %r13], %f12
	.word 0x8fa28838  ! 818: FADDs	fadds	%f10, %f24, %f7
	.word 0xb0d94017  ! 819: SMULcc_R	smulcc 	%r5, %r23, %r24
	.word 0xf0bfe001  ! 820: STDA_I	stda	%r24, [%r31 + 0x0001] %asi
	.word 0x93902005  ! 821: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x3e700001  ! 822: BPVC	<illegal instruction>
	.word 0x8d90200b  ! 823: WRPR_PSTATE_I	wrpr	%r0, 0x000b, %pstate
	.word 0x8198250f  ! 824: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050f, %hpstate
	.word 0xaf702001  ! 825: POPC_I	popc	0x0001, %r23
	.word 0x8d802004  ! 826: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902685  ! 827: WRPR_PSTATE_I	wrpr	%r0, 0x0685, %pstate
	.word 0x95514000  ! 828: RDPR_TBA	rdpr	%tba, %r10
	.word 0x8d902a1e  ! 829: WRPR_PSTATE_I	wrpr	%r0, 0x0a1e, %pstate
	.word 0xa3540000  ! 830: RDPR_GL	rdpr	%-, %r17
	.word 0x91a049e5  ! 831: FDIVq	dis not found

	.word 0xa1902002  ! 832: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x94826001  ! 833: ADDcc_I	addcc 	%r9, 0x0001, %r10
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 834: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_95:
	.word 0x34800001  ! 836: BG	bg,a	<label_0x1>
	.word 0xd736000c  ! 836: STQF_R	-	%f11, [%r12, %r24]
	normalw
	.word 0x8d458000  ! 835: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x8d902c16  ! 836: WRPR_PSTATE_I	wrpr	%r0, 0x0c16, %pstate
	.word 0xa66c0008  ! 837: UDIVX_R	udivx 	%r16, %r8, %r19
	.word 0xaba01a67  ! 838: FqTOi	fqtoi	
	.word 0x93902006  ! 839: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xea97e020  ! 840: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r21
splash_htba_96:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 841: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_cmpr_97:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 843: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1826001  ! 842: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0x98dd0003  ! 843: SMULcc_R	smulcc 	%r20, %r3, %r12
	.word 0x8d902ed7  ! 844: WRPR_PSTATE_I	wrpr	%r0, 0x0ed7, %pstate
DS_98:
	.word 0x32800001  ! 846: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 845: SAVE_R	save	%r31, %r0, %r31
	.word 0xa4fd6001  ! 846: SDIVcc_I	sdivcc 	%r21, 0x0001, %r18
	.word 0x81982f8f  ! 847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8f, %hpstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 848: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 849: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d802000  ! 850: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982fc5  ! 851: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc5, %hpstate
	.word 0xe49004a0  ! 852: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x8d902ecd  ! 853: WRPR_PSTATE_I	wrpr	%r0, 0x0ecd, %pstate
	.word 0x8b50c000  ! 854: RDPR_TT	rdpr	%tt, %r5
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 855: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcad7e030  ! 856: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 857: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x819826df  ! 858: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06df, %hpstate
change_to_tl1_99:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xaf514000  ! 860: RDPR_TBA	rdpr	%tba, %r23
	.word 0xb1a000cb  ! 861: FNEGd	fnegd	%f42, %f24
	.word 0x8d902c1b  ! 862: WRPR_PSTATE_I	wrpr	%r0, 0x0c1b, %pstate
	.word 0x8a6c0014  ! 863: UDIVX_R	udivx 	%r16, %r20, %r5
	.word 0xa3a0054c  ! 864: FSQRTd	fsqrt	
	.word 0x87902382  ! 865: WRPR_TT_I	wrpr	%r0, 0x0382, %tt
	.word 0x93902004  ! 866: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902a4c  ! 867: WRPR_PSTATE_I	wrpr	%r0, 0x0a4c, %pstate
	.word 0x86f96001  ! 868: SDIVcc_I	sdivcc 	%r5, 0x0001, %r3
	.word 0xa1902009  ! 869: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x9b540000  ! 870: RDPR_GL	rdpr	%-, %r13
	.word 0x8d902610  ! 871: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 872: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8685e001  ! 873: ADDcc_I	addcc 	%r23, 0x0001, %r3
	.word 0x89a6cdc6  ! 874: FdMULq	fdmulq	
	.word 0xc8d004a0  ! 875: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0xa1902008  ! 876: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8198270f  ! 877: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070f, %hpstate
	.word 0x8790201a  ! 878: WRPR_TT_I	wrpr	%r0, 0x001a, %tt
	.word 0x8d902407  ! 879: WRPR_PSTATE_I	wrpr	%r0, 0x0407, %pstate
splash_cmpr_100:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1802001  ! 880: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 881: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93d02031  ! 882: Tcc_I	tne	icc_or_xcc, %r0 + 49
splash_cmpr_101:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 884: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181a001  ! 883: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x93902003  ! 884: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_tl1_102:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87a00543  ! 886: FSQRTd	fsqrt	
	.word 0x89a6c9c4  ! 887: FDIVd	fdivd	%f58, %f4, %f4
	.word 0x82826001  ! 888: ADDcc_I	addcc 	%r9, 0x0001, %r1
	.word 0x87802010  ! 889: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87902116  ! 890: WRPR_TT_I	wrpr	%r0, 0x0116, %tt
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 891: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02034  ! 892: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x93d02030  ! 893: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x91d02030  ! 894: Tcc_I	ta	icc_or_xcc, %r0 + 48
reduce_priv_level_103:
	.word 0x8f902000  ! 896: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1814015  ! 895: WR_STICK_REG_R	wr	%r5, %r21, %-
	.word 0x93902006  ! 896: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc3e7c035  ! 897: CASA_I	casa	[%r31] 0x 1, %r21, %r1
	.word 0x9f802001  ! 898: SIR	sir	0x0001
splash_htba_104:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 899: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc33fc015  ! 900: STDF_R	std	%f1, [%r21, %r31]
	.word 0x819826c7  ! 901: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c7, %hpstate
splash_htba_105:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 902: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_106:
	.word 0x20800001  ! 904: BN	bn,a	<label_0x1>
	.word 0xd1306001  ! 904: STQF_I	-	%f8, [0x0001, %r1]
	normalw
	.word 0xb5458000  ! 903: RD_SOFTINT_REG	rd	%softint, %r26
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f802001  ! 905: SIR	sir	0x0001
	.word 0x8751c000  ! 906: RDPR_TL	rdpr	%tl, %r3
	.word 0x83d02033  ! 907: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x9f802001  ! 908: SIR	sir	0x0001
	.word 0xc68008a0  ! 909: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc6dfe020  ! 910: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r3
	.word 0x8d9026cc  ! 911: WRPR_PSTATE_I	wrpr	%r0, 0x06cc, %pstate
splash_cmpr_107:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 913: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1862001  ! 912: WR_STICK_REG_I	wr	%r24, 0x0001, %-
	.word 0xa1902004  ! 913: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_htba_108:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 914: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xaf50c000  ! 915: RDPR_TT	rdpr	%tt, %r23
	.word 0xee9004a0  ! 916: LDUHA_R	lduha	[%r0, %r0] 0x25, %r23
	.word 0xeec7e000  ! 917: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r23
	.word 0xee37e001  ! 918: STH_I	sth	%r23, [%r31 + 0x0001]
DS_109:
	.word 0x20800001  ! 920: BN	bn,a	<label_0x1>
	.word 0xd1302001  ! 920: STQF_I	-	%f8, [0x0001, %r0]
	normalw
	.word 0x81458000  ! 919: RD_SOFTINT_REG	stbar
	.word 0xa1902002  ! 920: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x81982fdc  ! 921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdc, %hpstate
splash_htba_110:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 922: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87902063  ! 923: WRPR_TT_I	wrpr	%r0, 0x0063, %tt
	.word 0x93902004  ! 924: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9ba00565  ! 925: FSQRTq	fsqrt	
	.word 0x93902005  ! 926: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d802000  ! 927: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xdaffc025  ! 928: SWAPA_R	swapa	%r13, [%r31 + %r5] 0x01
	.word 0x8d902c19  ! 929: WRPR_PSTATE_I	wrpr	%r0, 0x0c19, %pstate
	.word 0x85514000  ! 930: RDPR_TBA	rdpr	%tba, %r2
	.word 0x93902002  ! 931: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8fa349ad  ! 932: FDIVs	fdivs	%f13, %f13, %f7
	.word 0x8d802004  ! 933: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902002  ! 934: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02031  ! 935: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xce2fc00d  ! 936: STB_R	stb	%r7, [%r31 + %r13]
	.word 0x97702001  ! 937: POPC_I	popc	0x0001, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 939: SIR	sir	0x0001
	.word 0x81982614  ! 940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0614, %hpstate
	.word 0x93508000  ! 941: RDPR_TSTATE	rdpr	%tstate, %r9
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 942: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 943: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d902847  ! 944: WRPR_PSTATE_I	wrpr	%r0, 0x0847, %pstate
	.word 0x8790208c  ! 945: WRPR_TT_I	wrpr	%r0, 0x008c, %tt
	.word 0x89a349a0  ! 946: FDIVs	fdivs	%f13, %f0, %f4
	.word 0x87902129  ! 947: WRPR_TT_I	wrpr	%r0, 0x0129, %tt
	.word 0xc93fc000  ! 948: STDF_R	std	%f4, [%r0, %r31]
	.word 0x879020cb  ! 949: WRPR_TT_I	wrpr	%r0, 0x00cb, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc8c804a0  ! 951: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
	.word 0x8d902293  ! 952: WRPR_PSTATE_I	wrpr	%r0, 0x0293, %pstate
	.word 0xa190200e  ! 953: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9ba009d9  ! 955: FDIVd	fdivd	%f0, %f56, %f44
	.word 0x89a01a79  ! 956: FqTOi	fqtoi	
	.word 0xc9e7c039  ! 957: CASA_I	casa	[%r31] 0x 1, %r25, %r4
	.word 0x87802089  ! 958: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d802000  ! 959: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02035  ! 960: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902003  ! 961: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x9f802001  ! 962: SIR	sir	0x0001
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 963: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982d07  ! 964: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d07, %hpstate
	.word 0x93902001  ! 965: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xaba689e1  ! 966: FDIVq	dis not found

	.word 0x97a14d2c  ! 967: FsMULd	fsmuld	%f5, %f12, %f42
splash_tba_111:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 968: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d02033  ! 969: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x83d02035  ! 970: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8790234f  ! 971: WRPR_TT_I	wrpr	%r0, 0x034f, %tt
	.word 0xa190200b  ! 972: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d902cc2  ! 973: WRPR_PSTATE_I	wrpr	%r0, 0x0cc2, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 974: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb2698009  ! 975: UDIVX_R	udivx 	%r6, %r9, %r25
	.word 0xa190200d  ! 976: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d802000  ! 977: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802080  ! 978: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xf247c000  ! 979: LDSW_R	ldsw	[%r31 + %r0], %r25
	.word 0x91d02032  ! 980: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8790212e  ! 981: WRPR_TT_I	wrpr	%r0, 0x012e, %tt
	.word 0x93902001  ! 982: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87902133  ! 983: WRPR_TT_I	wrpr	%r0, 0x0133, %tt
	.word 0x8d90220f  ! 984: WRPR_PSTATE_I	wrpr	%r0, 0x020f, %pstate
DS_112:
	.word 0x22800001  ! 986: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 985: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8db34fe4  ! 986: FONES	fones	%f6
splash_cmpr_113:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 988: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 987: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0x83d02031  ! 988: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x87902352  ! 989: WRPR_TT_I	wrpr	%r0, 0x0352, %tt
	.word 0x93902005  ! 990: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xcc8fe000  ! 991: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r6
	.word 0x8d90248a  ! 992: WRPR_PSTATE_I	wrpr	%r0, 0x048a, %pstate
DS_114:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 993: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xccd7e000  ! 994: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r6
	.word 0x91d02031  ! 995: Tcc_I	ta	icc_or_xcc, %r0 + 49
splash_htba_115:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 996: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902002  ! 997: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902298  ! 998: WRPR_PSTATE_I	wrpr	%r0, 0x0298, %pstate
splash_tba_116:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 999: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83508000  ! 1000: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0x93902007  ! 1001: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902002  ! 1003: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8198250f  ! 1004: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050f, %hpstate
	.word 0xc2800be0  ! 1005: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r1
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1006: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c42  ! 1007: WRPR_PSTATE_I	wrpr	%r0, 0x0c42, %pstate
	.word 0x91d02033  ! 1008: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1009: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 1010: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d9028d8  ! 1011: WRPR_PSTATE_I	wrpr	%r0, 0x08d8, %pstate
	.word 0xa1902009  ! 1012: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1013: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93a000c1  ! 1014: FNEGd	fnegd	%f32, %f40
	.word 0xa5a00565  ! 1015: FSQRTq	fsqrt	
	.word 0xe47fe001  ! 1016: SWAP_I	swap	%r18, [%r31 + 0x0001]
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1017: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982e8f  ! 1018: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8f, %hpstate
	.word 0x8af90019  ! 1019: SDIVcc_R	sdivcc 	%r4, %r25, %r5
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1020: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 1021: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_cmpr_117:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1023: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180e001  ! 1022: WR_STICK_REG_I	wr	%r3, 0x0001, %-
change_to_randtl_118:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1023: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x83a049f4  ! 1024: FDIVq	dis not found

	.word 0x85a01a78  ! 1025: FqTOi	fqtoi	
	.word 0x83d02034  ! 1026: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8198265d  ! 1027: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065d, %hpstate
	.word 0x91500000  ! 1028: RDPR_TPC	rdpr	%tpc, %r8
	.word 0x87802004  ! 1029: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87902219  ! 1030: WRPR_TT_I	wrpr	%r0, 0x0219, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902c93  ! 1032: WRPR_PSTATE_I	wrpr	%r0, 0x0c93, %pstate
	.word 0x91d02031  ! 1033: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d802004  ! 1034: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd017c000  ! 1035: LDUH_R	lduh	[%r31 + %r0], %r8
	.word 0x81982897  ! 1036: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0897, %hpstate
	.word 0x984cc018  ! 1037: MULX_R	mulx 	%r19, %r24, %r12
splash_htba_119:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1038: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd81fe001  ! 1039: LDD_I	ldd	[%r31 + 0x0001], %r12
	.word 0x93d02034  ! 1040: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x93d02033  ! 1041: Tcc_I	tne	icc_or_xcc, %r0 + 51
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1042: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9af92001  ! 1043: SDIVcc_I	sdivcc 	%r4, 0x0001, %r13
	.word 0x879020d4  ! 1044: WRPR_TT_I	wrpr	%r0, 0x00d4, %tt
	.word 0x91d02033  ! 1045: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_htba_120:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1046: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902002  ! 1047: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x99902002  ! 1048: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x81982a4c  ! 1049: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4c, %hpstate
	.word 0x93902007  ! 1050: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902004  ! 1051: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87802080  ! 1052: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9f802001  ! 1053: SIR	sir	0x0001
	.word 0x884b0006  ! 1054: MULX_R	mulx 	%r12, %r6, %r4
	.word 0xa750c000  ! 1055: RDPR_TT	rdpr	%tt, %r19
	.word 0x81982d05  ! 1056: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d05, %hpstate
	.word 0x8d9028c9  ! 1057: WRPR_PSTATE_I	wrpr	%r0, 0x08c9, %pstate
	.word 0x93902000  ! 1058: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9750c000  ! 1059: RDPR_TT	rdpr	%tt, %r11
	.word 0x83504000  ! 1060: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x91d02032  ! 1061: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x99514000  ! 1062: RDPR_TBA	rdpr	%tba, %r12
	.word 0xa190200d  ! 1063: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xb5508000  ! 1064: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x91d02033  ! 1065: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81982c9f  ! 1066: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9f, %hpstate
reduce_priv_level_121:
	.word 0x8f902001  ! 1068: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xaba01963  ! 1067: FqTOd	dis not found

	.word 0xa190200a  ! 1068: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xafb1cfe3  ! 1069: FONES	fones	%f23
	.word 0x8fb20fe8  ! 1070: FONES	fones	%f7
	.word 0x81982b05  ! 1071: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b05, %hpstate
	.word 0x81514000  ! 1072: RDPR_TBA	rdpr	%tba, %r0
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 1073: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8b514000  ! 1074: RDPR_TBA	rdpr	%tba, %r5
	.word 0x93902007  ! 1075: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902009  ! 1076: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa190200c  ! 1078: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d902a09  ! 1079: WRPR_PSTATE_I	wrpr	%r0, 0x0a09, %pstate
	.word 0x97500000  ! 1080: RDPR_TPC	rdpr	%tpc, %r11
	.word 0xd67fe001  ! 1081: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0xb5a1cdcb  ! 1082: FdMULq	fdmulq	
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1083: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 1084: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87802010  ! 1085: WRASI_I	wr	%r0, 0x0010, %asi
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 1086: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x83d02035  ! 1087: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8198229f  ! 1088: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029f, %hpstate
	.word 0x81982a06  ! 1089: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a06, %hpstate
	.word 0x82d9c00c  ! 1090: SMULcc_R	smulcc 	%r7, %r12, %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902007  ! 1092: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x30700001  ! 1094: BPA	<illegal instruction>
	.word 0x87902170  ! 1095: WRPR_TT_I	wrpr	%r0, 0x0170, %tt
	.word 0xa9a000cb  ! 1096: FNEGd	fnegd	%f42, %f20
	.word 0x91d02035  ! 1097: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe8c00e60  ! 1098: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r20
	.word 0x99a0054c  ! 1099: FSQRTd	fsqrt	
splash_cmpr_122:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 1100: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0xa1902002  ! 1101: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d90220b  ! 1102: WRPR_PSTATE_I	wrpr	%r0, 0x020b, %pstate
splash_tba_123:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1103: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83a08d20  ! 1104: FsMULd	fsmuld	%f2, %f0, %f32
	.word 0xa190200a  ! 1105: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x9350c000  ! 1106: RDPR_TT	rdpr	%tt, %r9
	.word 0xa1902003  ! 1107: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d902659  ! 1108: WRPR_PSTATE_I	wrpr	%r0, 0x0659, %pstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1109: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x26800001  ! 1110: BL	bl,a	<label_0x1>
	.word 0x819820cd  ! 1111: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00cd, %hpstate
splash_cmpr_124:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1816001  ! 1112: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0x93902002  ! 1113: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd257c000  ! 1114: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x81a54d2a  ! 1115: FsMULd	fsmuld	%f21, %f10, %f0
	.word 0x8d902ec1  ! 1116: WRPR_PSTATE_I	wrpr	%r0, 0x0ec1, %pstate
	.word 0xc137c00a  ! 1117: STQF_R	-	%f0, [%r10, %r31]
	.word 0x93902002  ! 1118: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902003  ! 1119: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8790224a  ! 1120: WRPR_TT_I	wrpr	%r0, 0x024a, %tt
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1121: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x86d9c017  ! 1122: SMULcc_R	smulcc 	%r7, %r23, %r3
	.word 0x87802004  ! 1123: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87a01a69  ! 1124: FqTOi	fqtoi	
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1125: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xb6fe4015  ! 1127: SDIVcc_R	sdivcc 	%r25, %r21, %r27
	.word 0xf61fc000  ! 1128: LDD_R	ldd	[%r31 + %r0], %r27
	.word 0x86c52001  ! 1129: ADDCcc_I	addccc 	%r20, 0x0001, %r3
DS_125:
	.word 0x32800001  ! 1131: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1130: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa190200e  ! 1131: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa190200e  ! 1132: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x9951c000  ! 1133: RDPR_TL	rdpr	%tl, %r12
DS_126:
	.word 0x34800001  ! 1135: BG	bg,a	<label_0x1>
	.xword 0xcfe828b7	! Random illegal ?
	.word 0xc9108015  ! 1135: LDQF_R	-	[%r2, %r21], %f4
	.word 0x87a0082c  ! 1134: FADDs	fadds	%f0, %f12, %f3
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1135: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982517  ! 1136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0517, %hpstate
	.word 0x8198250d  ! 1137: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050d, %hpstate
	.word 0x93a289c4  ! 1138: FDIVd	fdivd	%f10, %f4, %f40
	.word 0x91d02032  ! 1139: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa8826001  ! 1140: ADDcc_I	addcc 	%r9, 0x0001, %r20
	.word 0x83514000  ! 1141: RDPR_TBA	rdpr	%tba, %r1
	.word 0xc2900e40  ! 1142: LDUHA_R	lduha	[%r0, %r0] 0x72, %r1
	.word 0x8d9022c0  ! 1143: WRPR_PSTATE_I	wrpr	%r0, 0x02c0, %pstate
	.word 0x87902023  ! 1144: WRPR_TT_I	wrpr	%r0, 0x0023, %tt
	.word 0xa7b64ff6  ! 1145: FONES	fones	%f19
	.word 0xb7a40dc0  ! 1146: FdMULq	fdmulq	
	.word 0x8d902843  ! 1147: WRPR_PSTATE_I	wrpr	%r0, 0x0843, %pstate
	.word 0x96d16001  ! 1148: UMULcc_I	umulcc 	%r5, 0x0001, %r11
	.word 0xa1902000  ! 1149: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa190200f  ! 1150: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x83a01a60  ! 1151: FqTOi	fqtoi	
	.word 0xc3e7c020  ! 1152: CASA_I	casa	[%r31] 0x 1, %r0, %r1
	.word 0xc327e001  ! 1153: STF_I	st	%f1, [0x0001, %r31]
	.word 0xa190200a  ! 1154: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x83d02031  ! 1155: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x91d02030  ! 1156: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902005  ! 1157: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902e4e  ! 1158: WRPR_PSTATE_I	wrpr	%r0, 0x0e4e, %pstate
	.word 0xb7514000  ! 1159: RDPR_TBA	rdpr	%tba, %r27
	.word 0xa1902001  ! 1160: WRPR_GL_I	wrpr	%r0, 0x0001, %-
change_to_tl1_127:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902006  ! 1162: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982486  ! 1163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0486, %hpstate
	.word 0x8b540000  ! 1164: RDPR_GL	rdpr	%-, %r5
	.word 0x87802080  ! 1165: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x38700001  ! 1166: BPGU	<illegal instruction>
	.word 0x8150c000  ! 1167: RDPR_TT	rdpr	%tt, %r0
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93d02030  ! 1169: Tcc_I	tne	icc_or_xcc, %r0 + 48
splash_htba_128:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1170: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_htba_129:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1171: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc08008a0  ! 1172: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xa1902004  ! 1173: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x9f802001  ! 1174: SIR	sir	0x0001
	.word 0x24700001  ! 1175: BPLE	<illegal instruction>
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1176: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb6802001  ! 1177: ADDcc_I	addcc 	%r0, 0x0001, %r27
	.word 0x91d02034  ! 1178: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1179: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 1180: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902004  ! 1181: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 1183: SIR	sir	0x0001
splash_tba_130:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1184: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982f86  ! 1185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f86, %hpstate
	.word 0x9f802001  ! 1186: SIR	sir	0x0001
	.word 0x8d9026da  ! 1187: WRPR_PSTATE_I	wrpr	%r0, 0x06da, %pstate
	.word 0x8d902ad2  ! 1188: WRPR_PSTATE_I	wrpr	%r0, 0x0ad2, %pstate
	.word 0x8b514000  ! 1189: RDPR_TBA	rdpr	%tba, %r5
	.word 0xcacfe000  ! 1190: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r5
	.word 0x97504000  ! 1191: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0xa3500000  ! 1192: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xa1902007  ! 1193: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xafa01a71  ! 1194: FqTOi	fqtoi	
	.word 0x8d9020d5  ! 1195: WRPR_PSTATE_I	wrpr	%r0, 0x00d5, %pstate
	.word 0x8d902003  ! 1196: WRPR_PSTATE_I	wrpr	%r0, 0x0003, %pstate
	.word 0x879022ed  ! 1197: WRPR_TT_I	wrpr	%r0, 0x02ed, %tt
	.word 0xeed7e000  ! 1198: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r23
splash_htba_131:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1199: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9550c000  ! 1200: RDPR_TT	rdpr	%tt, %r10
	.word 0xd48008a0  ! 1201: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x9f802001  ! 1202: SIR	sir	0x0001
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1203: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_132:
	.word 0x22800001  ! 1205: BE	be,a	<label_0x1>
	allclean
	.word 0x89b14313  ! 1204: ALLIGNADDRESS	alignaddr	%r5, %r19, %r4
	.word 0xc89004a0  ! 1205: LDUHA_R	lduha	[%r0, %r0] 0x25, %r4
	.word 0x8d902a8b  ! 1206: WRPR_PSTATE_I	wrpr	%r0, 0x0a8b, %pstate
	.word 0xc8d004a0  ! 1207: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1208: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902001  ! 1209: WRPR_PSTATE_I	wrpr	%r0, 0x0001, %pstate
	.word 0x87802016  ! 1210: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9a6b6001  ! 1211: UDIVX_I	udivx 	%r13, 0x0001, %r13
	.word 0x91d02033  ! 1212: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa7540000  ! 1213: RDPR_GL	rdpr	%-, %r19
	.word 0x91d02032  ! 1214: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_133:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1215: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x93902002  ! 1216: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe737e001  ! 1217: STQF_I	-	%f19, [0x0001, %r31]
change_to_tl1_134:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87802010  ! 1219: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x81982e04  ! 1220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e04, %hpstate
	.word 0x93d02031  ! 1221: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x93902004  ! 1222: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa7500000  ! 1223: RDPR_TPC	rdpr	%tpc, %r19
	.word 0xe797e001  ! 1224: LDQFA_I	-	[%r31, 0x0001], %f19
	.word 0x8198279f  ! 1225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079f, %hpstate
	.word 0x87902125  ! 1226: WRPR_TT_I	wrpr	%r0, 0x0125, %tt
	.word 0x879023e9  ! 1227: WRPR_TT_I	wrpr	%r0, 0x03e9, %tt
change_to_tl1_135:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902a5c  ! 1229: WRPR_PSTATE_I	wrpr	%r0, 0x0a5c, %pstate
	.word 0x87902188  ! 1230: WRPR_TT_I	wrpr	%r0, 0x0188, %tt
	.word 0x9b504000  ! 1231: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x87802016  ! 1232: WRASI_I	wr	%r0, 0x0016, %asi
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1233: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xda27c013  ! 1234: STW_R	stw	%r13, [%r31 + %r19]
	.word 0x81982746  ! 1235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0746, %hpstate
	.word 0xa1902006  ! 1236: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87802014  ! 1237: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xdb17c000  ! 1238: LDQF_R	-	[%r31, %r0], %f13
	.word 0x8d902a89  ! 1239: WRPR_PSTATE_I	wrpr	%r0, 0x0a89, %pstate
	.word 0x8d51c000  ! 1240: RDPR_TL	rdpr	%tl, %r6
reduce_priv_level_136:
	.word 0x8f902000  ! 1242: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb181c000  ! 1241: WR_STICK_REG_R	wr	%r7, %r0, %-
	.word 0x98a9c008  ! 1242: ANDNcc_R	andncc 	%r7, %r8, %r12
	.word 0x8198229c  ! 1243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029c, %hpstate
	.word 0x8d802000  ! 1244: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902003  ! 1245: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd88804a0  ! 1246: LDUBA_R	lduba	[%r0, %r0] 0x25, %r12
	.word 0x8d90288e  ! 1247: WRPR_PSTATE_I	wrpr	%r0, 0x088e, %pstate
DS_137:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1248: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8d902cc8  ! 1249: WRPR_PSTATE_I	wrpr	%r0, 0x0cc8, %pstate
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1250: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902e89  ! 1251: WRPR_PSTATE_I	wrpr	%r0, 0x0e89, %pstate
	.word 0xa190200f  ! 1252: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x93902003  ! 1253: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1254: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90221f  ! 1255: WRPR_PSTATE_I	wrpr	%r0, 0x021f, %pstate
	.word 0x93902000  ! 1256: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902002  ! 1257: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x956dc003  ! 1258: SDIVX_R	sdivx	%r23, %r3, %r10
	.word 0x93902006  ! 1259: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x97514000  ! 1260: RDPR_TBA	rdpr	%tba, %r11
	.word 0x91d02031  ! 1261: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa190200f  ! 1262: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd7e7c023  ! 1263: CASA_I	casa	[%r31] 0x 1, %r3, %r11
	.word 0x93d02033  ! 1264: Tcc_I	tne	icc_or_xcc, %r0 + 51
change_to_tl1_138:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8790201f  ! 1267: WRPR_TT_I	wrpr	%r0, 0x001f, %tt
	.word 0x9f802001  ! 1268: SIR	sir	0x0001
	.word 0x8d504000  ! 1269: RDPR_TNPC	rdpr	%tnpc, %r6
splash_htba_139:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1270: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xb6c0e001  ! 1271: ADDCcc_I	addccc 	%r3, 0x0001, %r27
	.word 0x91d02033  ! 1272: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d90225f  ! 1273: WRPR_PSTATE_I	wrpr	%r0, 0x025f, %pstate
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 1274: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa3a1c9ac  ! 1275: FDIVs	fdivs	%f7, %f12, %f17
	.word 0x879021b4  ! 1276: WRPR_TT_I	wrpr	%r0, 0x01b4, %tt
	.word 0x9f802001  ! 1277: SIR	sir	0x0001
	.word 0x93902003  ! 1278: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x90fa2001  ! 1279: SDIVcc_I	sdivcc 	%r8, 0x0001, %r8
	.word 0x9951c000  ! 1280: RDPR_TL	rdpr	%tl, %r12
	.word 0xb2f9801b  ! 1281: SDIVcc_R	sdivcc 	%r6, %r27, %r25
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x32800001  ! 1283: BNE	bne,a	<label_0x1>
	.word 0xf2880e80  ! 1284: LDUBA_R	lduba	[%r0, %r0] 0x74, %r25
	.word 0x83d02030  ! 1285: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x93902003  ! 1286: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_randtl_140:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1287: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8ba0cd39  ! 1288: FsMULd	fsmuld	%f3, %f56, %f36
	.word 0x8d902ec6  ! 1289: WRPR_PSTATE_I	wrpr	%r0, 0x0ec6, %pstate
	.word 0x87802010  ! 1290: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93902003  ! 1291: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d802000  ! 1292: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_tba_141:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1293: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902004  ! 1294: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_randtl_142:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1295: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa9504000  ! 1296: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x8198239c  ! 1297: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039c, %hpstate
splash_tba_143:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1298: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_144:
	.word 0x34800001  ! 1300: BG	bg,a	<label_0x1>
	allclean
	.word 0x81b14301  ! 1299: ALLIGNADDRESS	alignaddr	%r5, %r1, %r0
	.word 0x8d902a4d  ! 1300: WRPR_PSTATE_I	wrpr	%r0, 0x0a4d, %pstate
	.word 0x3c800001  ! 1301: BPOS	bpos,a	<label_0x1>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802088  ! 1303: WRASI_I	wr	%r0, 0x0088, %asi
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1304: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_145:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1305: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x3a700001  ! 1306: BPCC	<illegal instruction>
	.word 0xc137e001  ! 1307: STQF_I	-	%f0, [0x0001, %r31]
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1308: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 1309: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_htba_146:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1310: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa151c000  ! 1311: RDPR_TL	rdpr	%tl, %r16
	.word 0xaeac4005  ! 1312: ANDNcc_R	andncc 	%r17, %r5, %r23
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1313: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x26700001  ! 1315: BPL	<illegal instruction>
	.word 0x98d2c011  ! 1316: UMULcc_R	umulcc 	%r11, %r17, %r12
	.word 0xd927e001  ! 1317: STF_I	st	%f12, [0x0001, %r31]
	.word 0x8d902ecf  ! 1318: WRPR_PSTATE_I	wrpr	%r0, 0x0ecf, %pstate
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 1319: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1320: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8790218f  ! 1321: WRPR_TT_I	wrpr	%r0, 0x018f, %tt
	.word 0x95508000  ! 1322: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x879023a6  ! 1323: WRPR_TT_I	wrpr	%r0, 0x03a6, %tt
	.word 0x9b500000  ! 1324: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xa3540000  ! 1325: RDPR_GL	rdpr	%-, %r17
	.word 0x82f9a001  ! 1326: SDIVcc_I	sdivcc 	%r6, 0x0001, %r1
	.word 0x93902000  ! 1327: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d9028d2  ! 1328: WRPR_PSTATE_I	wrpr	%r0, 0x08d2, %pstate
	.word 0xc28804a0  ! 1329: LDUBA_R	lduba	[%r0, %r0] 0x25, %r1
	.word 0x93902001  ! 1330: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1331: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902385  ! 1332: WRPR_TT_I	wrpr	%r0, 0x0385, %tt
	.word 0x879020db  ! 1333: WRPR_TT_I	wrpr	%r0, 0x00db, %tt
	.word 0x81982955  ! 1334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0955, %hpstate
	.word 0x81982f45  ! 1335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f45, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1336: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc2cfe010  ! 1337: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r1
	.word 0xc327e001  ! 1338: STF_I	st	%f1, [0x0001, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0x879023de  ! 1340: WRPR_TT_I	wrpr	%r0, 0x03de, %tt
splash_tba_147:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1341: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1342: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 1343: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_148:
	.word 0x34800001  ! 1345: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1344: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8198254d  ! 1345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054d, %hpstate
	.word 0xb5508000  ! 1346: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0xa190200e  ! 1347: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x36800001  ! 1348: BGE	bge,a	<label_0x1>
	.word 0x8d902c9c  ! 1349: WRPR_PSTATE_I	wrpr	%r0, 0x0c9c, %pstate
	.word 0x83d02034  ! 1350: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x91508000  ! 1351: RDPR_TSTATE	rdpr	%tstate, %r8
DS_149:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1352: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x93902002  ! 1353: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902ad2  ! 1354: WRPR_PSTATE_I	wrpr	%r0, 0x0ad2, %pstate
	.word 0x8198235f  ! 1355: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035f, %hpstate
	.word 0x879022d3  ! 1356: WRPR_TT_I	wrpr	%r0, 0x02d3, %tt
	.word 0xd097e020  ! 1357: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
	.word 0xb1514000  ! 1358: RDPR_TBA	rdpr	%tba, %r24
	.word 0xf0d7e030  ! 1359: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r24
	.word 0x8d902252  ! 1360: WRPR_PSTATE_I	wrpr	%r0, 0x0252, %pstate
	.word 0x89a049c5  ! 1361: FDIVd	fdivd	%f32, %f36, %f4
	.word 0x94c1e001  ! 1362: ADDCcc_I	addccc 	%r7, 0x0001, %r10
	.word 0xd4dfe020  ! 1363: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1364: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9a846001  ! 1366: ADDcc_I	addcc 	%r17, 0x0001, %r13
reduce_priv_level_150:
	.word 0x8f902000  ! 1368: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89810001  ! 1367: WRTICK_R	wr	%r4, %r1, %tick
	.word 0x91d02035  ! 1368: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902009  ! 1369: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8951c000  ! 1370: RDPR_TL	rdpr	%tl, %r4
DS_151:
	.word 0x20800001  ! 1372: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1372: BG	bg,a	<label_0x1>
	.word 0xada00540  ! 1372: FSQRTd	fsqrt	
	.word 0xaba30834  ! 1371: FADDs	fadds	%f12, %f20, %f21
	.word 0x87802004  ! 1372: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa1902000  ! 1373: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87802089  ! 1374: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982f4e  ! 1375: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4e, %hpstate
	.word 0x93902001  ! 1376: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8790207e  ! 1377: WRPR_TT_I	wrpr	%r0, 0x007e, %tt
splash_tba_152:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1378: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02032  ! 1379: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x83d02031  ! 1380: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xea8804a0  ! 1381: LDUBA_R	lduba	[%r0, %r0] 0x25, %r21
	.word 0xb551c000  ! 1382: RDPR_TL	rdpr	%tl, %r26
	.word 0x8790221f  ! 1383: WRPR_TT_I	wrpr	%r0, 0x021f, %tt
splash_tba_153:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1384: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_154:
	.word 0x20800001  ! 1386: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1385: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x824c4005  ! 1386: MULX_R	mulx 	%r17, %r5, %r1
	.word 0xa190200e  ! 1387: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x97a109c2  ! 1388: FDIVd	fdivd	%f4, %f2, %f42
	.word 0x819828cc  ! 1389: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cc, %hpstate
	.word 0x81982087  ! 1390: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0087, %hpstate
	.word 0x83d02030  ! 1391: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xa1902006  ! 1392: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xb7a009e7  ! 1393: FDIVq	dis not found

	.word 0x93902002  ! 1394: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa4fa0004  ! 1395: SDIVcc_R	sdivcc 	%r8, %r4, %r18
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1396: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982384  ! 1397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0384, %hpstate
	.word 0x81982c54  ! 1398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c54, %hpstate
	.word 0x93902003  ! 1399: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d802000  ! 1400: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9ad88010  ! 1401: SMULcc_R	smulcc 	%r2, %r16, %r13
	.word 0xdac7e030  ! 1402: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r13
change_to_randtl_155:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1403: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x8790221d  ! 1404: WRPR_TT_I	wrpr	%r0, 0x021d, %tt
	.word 0x87802016  ! 1405: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa2680003  ! 1406: UDIVX_R	udivx 	%r0, %r3, %r17
	.word 0x2c700001  ! 1407: BPNEG	<illegal instruction>
	.word 0xe28008a0  ! 1408: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x87902114  ! 1409: WRPR_TT_I	wrpr	%r0, 0x0114, %tt
	.word 0xe297e000  ! 1410: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	.word 0x93d02033  ! 1411: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8af86001  ! 1412: SDIVcc_I	sdivcc 	%r1, 0x0001, %r5
	.word 0x9b6d4000  ! 1413: SDIVX_R	sdivx	%r21, %r0, %r13
	.word 0x93902003  ! 1414: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xda5fc000  ! 1415: LDX_R	ldx	[%r31 + %r0], %r13
	.word 0x91d02030  ! 1416: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x83d02035  ! 1417: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x866b000d  ! 1418: UDIVX_R	udivx 	%r12, %r13, %r3
	.word 0x93540000  ! 1419: RDPR_GL	rdpr	%-, %r9
	.word 0x879020ba  ! 1420: WRPR_TT_I	wrpr	%r0, 0x00ba, %tt
	.word 0xd2800b40  ! 1421: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r9
	.word 0x93902003  ! 1422: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x95504000  ! 1423: RDPR_TNPC	rdpr	%tnpc, %r10
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1424: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982dc6  ! 1425: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc6, %hpstate
	.word 0x83d02033  ! 1426: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xaed62001  ! 1427: UMULcc_I	umulcc 	%r24, 0x0001, %r23
	.word 0xee8008a0  ! 1428: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0x8d902082  ! 1429: WRPR_PSTATE_I	wrpr	%r0, 0x0082, %pstate
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1430: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_156:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184a001  ! 1431: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0xa1902004  ! 1432: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x86d8400a  ! 1433: SMULcc_R	smulcc 	%r1, %r10, %r3
	.word 0x8d90209a  ! 1434: WRPR_PSTATE_I	wrpr	%r0, 0x009a, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8ad2c015  ! 1436: UMULcc_R	umulcc 	%r11, %r21, %r5
	.word 0x93902007  ! 1437: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9f802001  ! 1438: SIR	sir	0x0001
	.word 0x8d90265c  ! 1439: WRPR_PSTATE_I	wrpr	%r0, 0x065c, %pstate
splash_tba_157:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1440: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x85a000da  ! 1441: FNEGd	fnegd	%f26, %f2
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc437c01a  ! 1443: STH_R	sth	%r2, [%r31 + %r26]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879021a7  ! 1445: WRPR_TT_I	wrpr	%r0, 0x01a7, %tt
	.word 0xb350c000  ! 1446: RDPR_TT	rdpr	%tt, %r25
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1447: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879023f8  ! 1449: WRPR_TT_I	wrpr	%r0, 0x03f8, %tt
splash_htba_158:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1450: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x89702001  ! 1451: POPC_I	popc	0x0001, %r4
	.word 0x91d02033  ! 1452: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9b508000  ! 1453: RDPR_TSTATE	rdpr	%tstate, %r13
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1454: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819829df  ! 1455: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09df, %hpstate
	.word 0x8d902aca  ! 1456: WRPR_PSTATE_I	wrpr	%r0, 0x0aca, %pstate
	.word 0xab50c000  ! 1457: RDPR_TT	rdpr	%tt, %r21
	.word 0xea4fe001  ! 1458: LDSB_I	ldsb	[%r31 + 0x0001], %r21
	.word 0x8a68e001  ! 1459: UDIVX_I	udivx 	%r3, 0x0001, %r5
	.word 0x879022e8  ! 1460: WRPR_TT_I	wrpr	%r0, 0x02e8, %tt
	.word 0x879023e6  ! 1461: WRPR_TT_I	wrpr	%r0, 0x03e6, %tt
	.word 0x86d42001  ! 1462: UMULcc_I	umulcc 	%r16, 0x0001, %r3
	.word 0xb1500000  ! 1463: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8d902e97  ! 1464: WRPR_PSTATE_I	wrpr	%r0, 0x0e97, %pstate
	.word 0x8d902e13  ! 1465: WRPR_PSTATE_I	wrpr	%r0, 0x0e13, %pstate
	.word 0x986ae001  ! 1466: UDIVX_I	udivx 	%r11, 0x0001, %r12
	.word 0x93902004  ! 1467: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_htba_159:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1468: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd8c7e010  ! 1469: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0xaaa94005  ! 1470: ANDNcc_R	andncc 	%r5, %r5, %r21
	.word 0x93902002  ! 1471: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982244  ! 1472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0244, %hpstate
	.word 0x819827ce  ! 1473: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ce, %hpstate
	.word 0xb6faa001  ! 1474: SDIVcc_I	sdivcc 	%r10, 0x0001, %r27
	.word 0x93902002  ! 1475: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d802000  ! 1476: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83d02034  ! 1477: Tcc_I	te	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87a34dc4  ! 1479: FdMULq	fdmulq	
	.word 0x22800001  ! 1480: BE	be,a	<label_0x1>
	.word 0x94ae8003  ! 1481: ANDNcc_R	andncc 	%r26, %r3, %r10
	.word 0x91508000  ! 1482: RDPR_TSTATE	rdpr	%tstate, %r8
	.word 0x8d902e90  ! 1483: WRPR_PSTATE_I	wrpr	%r0, 0x0e90, %pstate
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 1484: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
splash_cmpr_160:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184e001  ! 1487: WR_STICK_REG_I	wr	%r19, 0x0001, %-
	.word 0xa1902009  ! 1488: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d02035  ! 1489: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa9a00547  ! 1490: FSQRTd	fsqrt	
	.word 0x9f802001  ! 1491: SIR	sir	0x0001
	.word 0x93902006  ! 1492: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_161:
	.word 0x20800001  ! 1494: BN	bn,a	<label_0x1>
	.word 0xc7334005  ! 1494: STQF_R	-	%f3, [%r5, %r13]
	normalw
	.word 0x95458000  ! 1493: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x99a58d38  ! 1494: FsMULd	fsmuld	%f22, %f24, %f12
	.word 0xd897e030  ! 1495: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	.word 0x86d1e001  ! 1496: UMULcc_I	umulcc 	%r7, 0x0001, %r3
	.word 0x8d802000  ! 1497: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9a6e2001  ! 1498: UDIVX_I	udivx 	%r24, 0x0001, %r13
	.word 0x8d902240  ! 1499: WRPR_PSTATE_I	wrpr	%r0, 0x0240, %pstate
	.word 0xdbe7c038  ! 1500: CASA_I	casa	[%r31] 0x 1, %r24, %r13
	.word 0x91d02030  ! 1501: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xdaffc038  ! 1502: SWAPA_R	swapa	%r13, [%r31 + %r24] 0x01
	.word 0x91d02030  ! 1503: Tcc_I	ta	icc_or_xcc, %r0 + 48
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1504: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982216  ! 1505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0216, %hpstate
	.word 0x8d9024d2  ! 1506: WRPR_PSTATE_I	wrpr	%r0, 0x04d2, %pstate
	.word 0x93902006  ! 1507: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_htba_162:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1508: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x89a009cb  ! 1509: FDIVd	fdivd	%f0, %f42, %f4
	.word 0x91d02033  ! 1510: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x94d24011  ! 1511: UMULcc_R	umulcc 	%r9, %r17, %r10
	.word 0x879023d2  ! 1512: WRPR_TT_I	wrpr	%r0, 0x03d2, %tt
change_to_tl1_163:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93d02031  ! 1514: Tcc_I	tne	icc_or_xcc, %r0 + 49
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1515: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93a01a7b  ! 1516: FqTOi	fqtoi	
	.word 0xa8fac00b  ! 1517: SDIVcc_R	sdivcc 	%r11, %r11, %r20
	.word 0xe8ffc02b  ! 1518: SWAPA_R	swapa	%r20, [%r31 + %r11] 0x01
splash_tba_164:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1519: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x34700001  ! 1520: BPG	<illegal instruction>
	.word 0x8790215e  ! 1521: WRPR_TT_I	wrpr	%r0, 0x015e, %tt
	.word 0xa190200c  ! 1522: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x9f802001  ! 1523: SIR	sir	0x0001
	.word 0xa190200e  ! 1524: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x80806001  ! 1525: ADDcc_I	addcc 	%r1, 0x0001, %r0
	.word 0x91d02035  ! 1526: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902005  ! 1527: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x88da8006  ! 1528: SMULcc_R	smulcc 	%r10, %r6, %r4
	.word 0x83d02032  ! 1529: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xab702001  ! 1530: POPC_I	popc	0x0001, %r21
	.word 0xaca98008  ! 1531: ANDNcc_R	andncc 	%r6, %r8, %r22
	.word 0x93902007  ! 1532: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x896ec019  ! 1533: SDIVX_R	sdivx	%r27, %r25, %r4
	.word 0x95a2cd32  ! 1534: FsMULd	fsmuld	%f11, %f18, %f10
	.word 0x9f802001  ! 1535: SIR	sir	0x0001
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87902207  ! 1537: WRPR_TT_I	wrpr	%r0, 0x0207, %tt
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1538: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1539: SIR	sir	0x0001
	.word 0xa1902006  ! 1540: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd48fe010  ! 1541: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x81982fc5  ! 1542: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc5, %hpstate
	.word 0xa1902003  ! 1543: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xb1702001  ! 1544: POPC_I	popc	0x0001, %r24
	.word 0x99a00550  ! 1545: FSQRTd	fsqrt	
	.word 0x93902007  ! 1546: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1547: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd9e7c030  ! 1548: CASA_I	casa	[%r31] 0x 1, %r16, %r12
change_to_randtl_165:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1549: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xd927c010  ! 1550: STF_R	st	%f12, [%r16, %r31]
	.word 0x8d9028d7  ! 1551: WRPR_PSTATE_I	wrpr	%r0, 0x08d7, %pstate
	.word 0x93d02032  ! 1552: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x93902002  ! 1553: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1554: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 1555: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d802000  ! 1556: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xb569c019  ! 1557: SDIVX_R	sdivx	%r7, %r25, %r26
	.word 0x976ac006  ! 1558: SDIVX_R	sdivx	%r11, %r6, %r11
	.word 0x87a509f3  ! 1559: FDIVq	dis not found

	.word 0xa1500000  ! 1560: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x83500000  ! 1561: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x91d02034  ! 1562: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa5a24dc8  ! 1563: FdMULq	fdmulq	
	.word 0x9951c000  ! 1564: RDPR_TL	rdpr	%tl, %r12
	.word 0xd8ffc028  ! 1565: SWAPA_R	swapa	%r12, [%r31 + %r8] 0x01
	.word 0x91d02033  ! 1566: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93d02034  ! 1568: Tcc_I	tne	icc_or_xcc, %r0 + 52
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1569: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 1570: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02034  ! 1571: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d02034  ! 1572: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902c9f  ! 1573: WRPR_PSTATE_I	wrpr	%r0, 0x0c9f, %pstate
	.word 0x87802016  ! 1574: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8cd56001  ! 1575: UMULcc_I	umulcc 	%r21, 0x0001, %r6
	.word 0xcc9fe001  ! 1576: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	.word 0x93902000  ! 1577: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902004  ! 1578: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xb76dc00d  ! 1579: SDIVX_R	sdivx	%r23, %r13, %r27
	.word 0x83a000d0  ! 1580: FNEGd	fnegd	%f16, %f32
	.word 0x99902004  ! 1581: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa1902004  ! 1582: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x80682001  ! 1583: UDIVX_I	udivx 	%r0, 0x0001, %r0
	.word 0x879022eb  ! 1584: WRPR_TT_I	wrpr	%r0, 0x02eb, %tt
	.word 0xc0800b40  ! 1585: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r0
	.word 0x8da649c5  ! 1586: FDIVd	fdivd	%f56, %f36, %f6
	.word 0x9f802001  ! 1587: SIR	sir	0x0001
	.word 0xcc8008a0  ! 1588: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8d902c42  ! 1589: WRPR_PSTATE_I	wrpr	%r0, 0x0c42, %pstate
reduce_priv_level_166:
	.word 0x8f902002  ! 1591: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 1590: SIAM	siam	1
	.word 0x8d802004  ! 1591: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1592: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90265e  ! 1593: WRPR_PSTATE_I	wrpr	%r0, 0x065e, %pstate
	.word 0xa190200e  ! 1594: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x93902002  ! 1595: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902ec5  ! 1596: WRPR_PSTATE_I	wrpr	%r0, 0x0ec5, %pstate
	.word 0x87902314  ! 1597: WRPR_TT_I	wrpr	%r0, 0x0314, %tt
	.word 0x87802016  ! 1598: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x91d02033  ! 1599: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xcc97e030  ! 1600: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r6
splash_cmpr_167:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1602: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1806001  ! 1601: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0x8198245c  ! 1602: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045c, %hpstate
	.word 0x99508000  ! 1603: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x8d902057  ! 1604: WRPR_PSTATE_I	wrpr	%r0, 0x0057, %pstate
splash_htba_168:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1605: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x97500000  ! 1606: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x99508000  ! 1607: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x87500000  ! 1608: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x85a24d3b  ! 1609: FsMULd	fsmuld	%f9, %f58, %f2
	.word 0xc4d804a0  ! 1610: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0xa190200e  ! 1611: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x91d02034  ! 1612: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_cmpr_169:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1614: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181a001  ! 1613: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x91d02032  ! 1614: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902006  ! 1615: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc537e001  ! 1616: STQF_I	-	%f2, [0x0001, %r31]
	.word 0x81982d04  ! 1617: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d04, %hpstate
change_to_tl1_170:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87540000  ! 1619: RDPR_GL	rdpr	%-, %r3
	.word 0x8790207c  ! 1620: WRPR_TT_I	wrpr	%r0, 0x007c, %tt
	.word 0xb6d4801a  ! 1621: UMULcc_R	umulcc 	%r18, %r26, %r27
	.word 0x87902122  ! 1622: WRPR_TT_I	wrpr	%r0, 0x0122, %tt
	.word 0x8d802000  ! 1623: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879023bd  ! 1624: WRPR_TT_I	wrpr	%r0, 0x03bd, %tt
	.word 0x9ba58d2d  ! 1625: FsMULd	fsmuld	%f22, %f44, %f44
	.word 0x90f8e001  ! 1626: SDIVcc_I	sdivcc 	%r3, 0x0001, %r8
	.word 0x96812001  ! 1627: ADDcc_I	addcc 	%r4, 0x0001, %r11
	.word 0x9f802001  ! 1628: SIR	sir	0x0001
	.word 0x80a80004  ! 1629: ANDNcc_R	andncc 	%r0, %r4, %r0
	.word 0xc08fe000  ! 1630: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r0
splash_cmpr_171:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1632: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1812001  ! 1631: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0x826c0006  ! 1632: UDIVX_R	udivx 	%r16, %r6, %r1
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1633: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_172:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 1634: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0x83d02031  ! 1635: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x93902005  ! 1636: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x819822de  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02de, %hpstate
change_to_tl1_173:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xc2800ba0  ! 1639: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r1
	.word 0xc28008a0  ! 1640: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc28008a0  ! 1641: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc20fc000  ! 1642: LDUB_R	ldub	[%r31 + %r0], %r1
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1643: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 1644: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_htba_174:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1645: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902441  ! 1646: WRPR_PSTATE_I	wrpr	%r0, 0x0441, %pstate
DS_175:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1647: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xa2c46001  ! 1648: ADDCcc_I	addccc 	%r17, 0x0001, %r17
	.word 0x87508000  ! 1649: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0xa1902004  ! 1650: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x81a4cdd4  ! 1651: FdMULq	fdmulq	
	.word 0xc017e001  ! 1652: LDUH_I	lduh	[%r31 + 0x0001], %r0
	.word 0xa1902009  ! 1653: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8198255d  ! 1654: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055d, %hpstate
	.word 0x8d9028c1  ! 1655: WRPR_PSTATE_I	wrpr	%r0, 0x08c1, %pstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1656: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879020ab  ! 1657: WRPR_TT_I	wrpr	%r0, 0x00ab, %tt
	.word 0x87902096  ! 1658: WRPR_TT_I	wrpr	%r0, 0x0096, %tt
	.word 0x8198234d  ! 1659: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034d, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1660: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x89a209d0  ! 1661: FDIVd	fdivd	%f8, %f16, %f4
	.word 0x91d02035  ! 1662: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc8ffc030  ! 1663: SWAPA_R	swapa	%r4, [%r31 + %r16] 0x01
DS_176:
	.word 0x32800001  ! 1665: BNE	bne,a	<label_0x1>
	pdist %f28, %f2, %f4
	.word 0xafb1c301  ! 1664: ALLIGNADDRESS	alignaddr	%r7, %r1, %r23
	.word 0x81982c0d  ! 1665: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0d, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1666: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1667: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x85508000  ! 1668: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x8d508000  ! 1669: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0x95508000  ! 1670: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0xd527c001  ! 1671: STF_R	st	%f10, [%r1, %r31]
	.word 0x9f802001  ! 1672: SIR	sir	0x0001
	.word 0x93902007  ! 1673: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd4dfe010  ! 1674: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r10
	.word 0x81982816  ! 1675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0816, %hpstate
	.word 0x9ba04d2a  ! 1676: FsMULd	fsmuld	%f1, %f10, %f44
DS_177:
	.word 0x32800001  ! 1678: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1677: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xab504000  ! 1678: RDPR_TNPC	rdpr	%tnpc, %r21
DS_178:
	.word 0x22800001  ! 1680: BE	be,a	<label_0x1>
	.xword 0xbff936f7	! Random illegal ?
	.word 0x99a0054c  ! 1680: FSQRTd	fsqrt	
	.word 0x89a10836  ! 1679: FADDs	fadds	%f4, %f22, %f4
	.word 0x8069a001  ! 1680: UDIVX_I	udivx 	%r6, 0x0001, %r0
reduce_priv_level_179:
	.word 0x8f902000  ! 1682: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb16e2001  ! 1681: SDIVX_I	sdivx	%r24, 0x0001, %r24
reduce_priv_level_180:
	.word 0x8f902001  ! 1683: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8da0196c  ! 1682: FqTOd	dis not found

	.word 0xa6f92001  ! 1683: SDIVcc_I	sdivcc 	%r4, 0x0001, %r19
	.word 0x8d802000  ! 1684: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982587  ! 1685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0587, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879023fc  ! 1687: WRPR_TT_I	wrpr	%r0, 0x03fc, %tt
	.word 0x26700001  ! 1688: BPL	<illegal instruction>
	.word 0x93902003  ! 1689: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8790214b  ! 1690: WRPR_TT_I	wrpr	%r0, 0x014b, %tt
	.word 0x91d02031  ! 1691: Tcc_I	ta	icc_or_xcc, %r0 + 49
splash_tba_181:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1692: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902481  ! 1693: WRPR_PSTATE_I	wrpr	%r0, 0x0481, %pstate
	.word 0x87902092  ! 1694: WRPR_TT_I	wrpr	%r0, 0x0092, %tt
reduce_priv_level_182:
	.word 0x8f902002  ! 1696: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89834009  ! 1695: WRTICK_R	wr	%r13, %r9, %tick
	.word 0x87902003  ! 1696: WRPR_TT_I	wrpr	%r0, 0x0003, %tt
	.word 0x89a00557  ! 1697: FSQRTd	fsqrt	
	.word 0x2c800001  ! 1698: BNEG	bneg,a	<label_0x1>
	.word 0xc8ffc037  ! 1699: SWAPA_R	swapa	%r4, [%r31 + %r23] 0x01
	.word 0x8d902a89  ! 1700: WRPR_PSTATE_I	wrpr	%r0, 0x0a89, %pstate
	.word 0x81982e8e  ! 1701: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8e, %hpstate
	.word 0x8d90289f  ! 1702: WRPR_PSTATE_I	wrpr	%r0, 0x089f, %pstate
	.word 0x87902075  ! 1703: WRPR_TT_I	wrpr	%r0, 0x0075, %tt
DS_183:
	.word 0x22800001  ! 1705: BE	be,a	<label_0x1>
	.word 0xf5332001  ! 1705: STQF_I	-	%f26, [0x0001, %r12]
	normalw
	.word 0x97458000  ! 1704: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x2c800001  ! 1705: BNEG	bneg,a	<label_0x1>
	.word 0x879020df  ! 1706: WRPR_TT_I	wrpr	%r0, 0x00df, %tt
	.word 0xa190200f  ! 1707: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa1902009  ! 1708: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87802080  ! 1709: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81982886  ! 1710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0886, %hpstate
DS_184:
	.word 0x20800001  ! 1712: BN	bn,a	<label_0x1>
	pdist %f24, %f26, %f4
	.word 0xb5b50312  ! 1711: ALLIGNADDRESS	alignaddr	%r20, %r18, %r26
	.word 0xf447c000  ! 1712: LDSW_R	ldsw	[%r31 + %r0], %r26
	.word 0xf5e7c032  ! 1713: CASA_I	casa	[%r31] 0x 1, %r18, %r26
	.word 0x8ed6c00d  ! 1714: UMULcc_R	umulcc 	%r27, %r13, %r7
	.word 0x8198274c  ! 1715: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074c, %hpstate
	.word 0x93902003  ! 1716: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_tba_185:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1717: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_186:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1718: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x83d02033  ! 1719: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xcf37e001  ! 1720: STQF_I	-	%f7, [0x0001, %r31]
	.word 0x8198209e  ! 1721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009e, %hpstate
	.word 0xce8008a0  ! 1722: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x91d02034  ! 1723: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1724: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 1725: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xce800c80  ! 1726: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r7
	.word 0x91d02030  ! 1727: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x9b51c000  ! 1728: RDPR_TL	rdpr	%tl, %r13
	.word 0xb3540000  ! 1729: RDPR_GL	rdpr	%-, %r25
	.word 0x8d902486  ! 1730: WRPR_PSTATE_I	wrpr	%r0, 0x0486, %pstate
	.word 0x81982b87  ! 1731: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b87, %hpstate
	.word 0x93902006  ! 1732: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x34800001  ! 1733: BG	bg,a	<label_0x1>
	.word 0x8d90265c  ! 1734: WRPR_PSTATE_I	wrpr	%r0, 0x065c, %pstate
	.word 0x8d902494  ! 1735: WRPR_PSTATE_I	wrpr	%r0, 0x0494, %pstate
	.word 0x87902154  ! 1736: WRPR_TT_I	wrpr	%r0, 0x0154, %tt
	.word 0x99902005  ! 1737: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x93540000  ! 1738: RDPR_GL	rdpr	%-, %r9
	.word 0x8790230c  ! 1739: WRPR_TT_I	wrpr	%r0, 0x030c, %tt
	.word 0x93902007  ! 1740: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8790214a  ! 1741: WRPR_TT_I	wrpr	%r0, 0x014a, %tt
	.word 0x8b698005  ! 1742: SDIVX_R	sdivx	%r6, %r5, %r5
	.word 0x8d802000  ! 1743: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8790216b  ! 1744: WRPR_TT_I	wrpr	%r0, 0x016b, %tt
	.word 0xa1902002  ! 1745: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x819822cc  ! 1746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cc, %hpstate
	.word 0x81982505  ! 1747: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0505, %hpstate
	.word 0xcac7e010  ! 1748: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
	.word 0x8d802000  ! 1749: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_htba_187:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1750: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93d02030  ! 1751: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xcb37c005  ! 1752: STQF_R	-	%f5, [%r5, %r31]
	.word 0x8d504000  ! 1753: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0x9f802001  ! 1754: SIR	sir	0x0001
	.word 0x91d02030  ! 1755: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902006  ! 1756: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_188:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1757: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8e484009  ! 1758: MULX_R	mulx 	%r1, %r9, %r7
	.word 0x91d02034  ! 1759: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9350c000  ! 1760: RDPR_TT	rdpr	%tt, %r9
	.word 0x8198231d  ! 1761: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031d, %hpstate
	.word 0x8d802000  ! 1762: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200a  ! 1763: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d90260d  ! 1764: WRPR_PSTATE_I	wrpr	%r0, 0x060d, %pstate
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 1765: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8682c000  ! 1766: ADDcc_R	addcc 	%r11, %r0, %r3
splash_htba_189:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1767: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_190:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1768: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa486a001  ! 1769: ADDcc_I	addcc 	%r26, 0x0001, %r18
	.word 0xa1902007  ! 1770: WRPR_GL_I	wrpr	%r0, 0x0007, %-
DS_191:
	.word 0x22800001  ! 1772: BE	be,a	<label_0x1>
	pdist %f12, %f12, %f26
	.word 0x91b3031b  ! 1771: ALLIGNADDRESS	alignaddr	%r12, %r27, %r8
	.word 0xa9540000  ! 1772: RDPR_GL	rdpr	%-, %r20
	.word 0xb36e0010  ! 1773: SDIVX_R	sdivx	%r24, %r16, %r25
	.word 0x87902338  ! 1774: WRPR_TT_I	wrpr	%r0, 0x0338, %tt
	.word 0xf3e7c030  ! 1775: CASA_I	casa	[%r31] 0x 1, %r16, %r25
	.word 0x87802016  ! 1776: WRASI_I	wr	%r0, 0x0016, %asi
splash_cmpr_192:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1852001  ! 1777: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	.word 0x8d9026c7  ! 1778: WRPR_PSTATE_I	wrpr	%r0, 0x06c7, %pstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1779: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02035  ! 1780: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xf2c804a0  ! 1781: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r25
	.word 0x81982797  ! 1782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0797, %hpstate
	.word 0x85500000  ! 1783: RDPR_TPC	rdpr	%tpc, %r2
	.word 0xc527c010  ! 1784: STF_R	st	%f2, [%r16, %r31]
	.word 0x95a049d6  ! 1785: FDIVd	fdivd	%f32, %f22, %f10
	.word 0xa9514000  ! 1786: RDPR_TBA	rdpr	%tba, %r20
	.word 0xa6800012  ! 1787: ADDcc_R	addcc 	%r0, %r18, %r19
	.word 0xa1902009  ! 1788: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d802004  ! 1789: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1790: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97504000  ! 1791: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0x93902000  ! 1792: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8550c000  ! 1793: RDPR_TT	rdpr	%tt, %r2
DS_193:
	.word 0x32800001  ! 1795: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1794: SAVE_R	save	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1796: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902338  ! 1797: WRPR_TT_I	wrpr	%r0, 0x0338, %tt
reduce_priv_level_194:
	.word 0x8f902000  ! 1799: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 1798: SIAM	siam	1
	.word 0xb5504000  ! 1799: RDPR_TNPC	rdpr	%tnpc, %r26
splash_cmpr_195:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1801: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1852001  ! 1800: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	.word 0x81982f5f  ! 1801: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5f, %hpstate
	.word 0x30800001  ! 1802: BA	ba,a	<label_0x1>
	.word 0x91d02030  ! 1803: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x81a0057a  ! 1804: FSQRTq	fsqrt	
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 1805: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8198219c  ! 1806: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019c, %hpstate
	.word 0xc0dfe020  ! 1807: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r0
	.word 0xc0d804a0  ! 1808: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
change_to_randtl_196:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1809: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d514000  ! 1810: RDPR_TBA	rdpr	%tba, %r6
splash_tba_197:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1811: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902c16  ! 1812: WRPR_PSTATE_I	wrpr	%r0, 0x0c16, %pstate
	.word 0x81982816  ! 1813: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0816, %hpstate
	.word 0x87902072  ! 1814: WRPR_TT_I	wrpr	%r0, 0x0072, %tt
	.word 0x87902142  ! 1815: WRPR_TT_I	wrpr	%r0, 0x0142, %tt
	.word 0x9ba00548  ! 1816: FSQRTd	fsqrt	
	.word 0xa1902002  ! 1817: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1818: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02032  ! 1819: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xa86d2001  ! 1820: UDIVX_I	udivx 	%r20, 0x0001, %r20
	.word 0x8790237d  ! 1821: WRPR_TT_I	wrpr	%r0, 0x037d, %tt
	.word 0x80834006  ! 1822: ADDcc_R	addcc 	%r13, %r6, %r0
	.word 0xb3a00567  ! 1823: FSQRTq	fsqrt	
	.word 0x83d02031  ! 1824: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x87902274  ! 1825: WRPR_TT_I	wrpr	%r0, 0x0274, %tt
	.word 0xf20fe001  ! 1826: LDUB_I	ldub	[%r31 + 0x0001], %r25
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1827: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 1828: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902005  ! 1829: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xf29004a0  ! 1830: LDUHA_R	lduha	[%r0, %r0] 0x25, %r25
	.word 0x8e4d4005  ! 1831: MULX_R	mulx 	%r21, %r5, %r7
	.word 0x8d802000  ! 1832: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1833: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xce97e010  ! 1834: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r7
	.word 0x8d802004  ! 1835: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93d02033  ! 1836: Tcc_I	tne	icc_or_xcc, %r0 + 51
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1837: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_198:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186a001  ! 1838: WR_STICK_REG_I	wr	%r26, 0x0001, %-
	ta	T_CHANGE_PRIV	! macro
DS_199:
	.word 0x34800001  ! 1841: BG	bg,a	<label_0x1>
	.word 0xc132001a  ! 1841: STQF_R	-	%f0, [%r26, %r8]
	normalw
	.word 0x8f458000  ! 1840: RD_SOFTINT_REG	rd	%softint, %r7
DS_200:
	.word 0x34800001  ! 1842: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1841: SAVE_R	save	%r31, %r0, %r31
	.word 0x8ed0a001  ! 1842: UMULcc_I	umulcc 	%r2, 0x0001, %r7
reduce_priv_level_201:
	.word 0x8f902001  ! 1844: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83a01973  ! 1843: FqTOd	dis not found

	.word 0xa190200b  ! 1844: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x83a6c9e7  ! 1845: FDIVq	dis not found

	.word 0x8ba01a67  ! 1846: FqTOi	fqtoi	
	.word 0xa1902008  ! 1847: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1848: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982b1d  ! 1849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1d, %hpstate
change_to_randtl_202:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1850: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x20700001  ! 1851: BPN	<illegal instruction>
	.word 0xa190200a  ! 1852: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d902045  ! 1853: WRPR_PSTATE_I	wrpr	%r0, 0x0045, %pstate
DS_203:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1854: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8fa549d6  ! 1855: FDIVd	fdivd	%f52, %f22, %f38
	.word 0xb2d2c019  ! 1856: UMULcc_R	umulcc 	%r11, %r25, %r25
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_204:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1858: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9f802001  ! 1859: SIR	sir	0x0001
	.word 0xf2800b60  ! 1860: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r25
	.word 0x87902005  ! 1861: WRPR_TT_I	wrpr	%r0, 0x0005, %tt
	.word 0x879022ad  ! 1862: WRPR_TT_I	wrpr	%r0, 0x02ad, %tt
	.word 0xa190200d  ! 1863: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f802001  ! 1865: SIR	sir	0x0001
	.word 0x8950c000  ! 1866: RDPR_TT	rdpr	%tt, %r4
splash_cmpr_205:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1868: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1822001  ! 1867: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	.word 0xb1a2cdd3  ! 1868: FdMULq	fdmulq	
	.word 0xf0800b60  ! 1869: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r24
	.word 0x8198255e  ! 1870: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055e, %hpstate
	.word 0x83d02033  ! 1871: Tcc_I	te	icc_or_xcc, %r0 + 51
DS_206:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1872: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x81982b16  ! 1873: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b16, %hpstate
	.word 0x8d90200d  ! 1874: WRPR_PSTATE_I	wrpr	%r0, 0x000d, %pstate
	.word 0xf0bfe001  ! 1875: STDA_I	stda	%r24, [%r31 + 0x0001] %asi
	.word 0x87802014  ! 1876: WRASI_I	wr	%r0, 0x0014, %asi
DS_207:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1877: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
change_to_tl1_208:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x879021d8  ! 1879: WRPR_TT_I	wrpr	%r0, 0x01d8, %tt
splash_tba_209:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1880: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982b96  ! 1881: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b96, %hpstate
	.word 0x81982bd5  ! 1882: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd5, %hpstate
change_to_tl1_210:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa8de0002  ! 1884: SMULcc_R	smulcc 	%r24, %r2, %r20
	.word 0xb480a001  ! 1885: ADDcc_I	addcc 	%r2, 0x0001, %r26
splash_tba_211:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1886: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982e57  ! 1887: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e57, %hpstate
	.word 0x93902006  ! 1888: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902c92  ! 1889: WRPR_PSTATE_I	wrpr	%r0, 0x0c92, %pstate
	.word 0xf497e000  ! 1890: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r26
	.word 0x8d902a01  ! 1891: WRPR_PSTATE_I	wrpr	%r0, 0x0a01, %pstate
	.word 0x9b514000  ! 1892: RDPR_TBA	rdpr	%tba, %r13
DS_212:
	.word 0x32800001  ! 1894: BNE	bne,a	<label_0x1>
	.xword 0xb745e61d	! Random illegal ?
	.word 0x81a0055b  ! 1894: FSQRTd	fsqrt	
	.word 0xa5a08829  ! 1893: FADDs	fadds	%f2, %f9, %f18
	.word 0xa1902002  ! 1894: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa190200e  ! 1895: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1896: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87508000  ! 1897: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0xa190200d  ! 1898: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902004  ! 1899: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93508000  ! 1900: RDPR_TSTATE	rdpr	%tstate, %r9
	.word 0xd327c009  ! 1901: STF_R	st	%f9, [%r9, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9020cd  ! 1903: WRPR_PSTATE_I	wrpr	%r0, 0x00cd, %pstate
DS_213:
	.word 0x20800001  ! 1905: BN	bn,a	<label_0x1>
	.word 0xcb336001  ! 1905: STQF_I	-	%f5, [0x0001, %r13]
	normalw
	.word 0x99458000  ! 1904: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8790220f  ! 1905: WRPR_TT_I	wrpr	%r0, 0x020f, %tt
DS_214:
	.word 0x22800001  ! 1907: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1906: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 1907: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd8800bc0  ! 1908: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r12
	.word 0x3a700001  ! 1909: BPCC	<illegal instruction>
	.word 0x8d9028d1  ! 1910: WRPR_PSTATE_I	wrpr	%r0, 0x08d1, %pstate
	.word 0xd8c804a0  ! 1911: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x93902006  ! 1912: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xb6842001  ! 1913: ADDcc_I	addcc 	%r16, 0x0001, %r27
	.word 0x8d802000  ! 1914: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xb3a60d33  ! 1915: FsMULd	fsmuld	%f24, %f50, %f56
splash_tba_215:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1916: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_tl1_216:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
splash_cmpr_217:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1919: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181e001  ! 1918: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0x8d9020c0  ! 1919: WRPR_PSTATE_I	wrpr	%r0, 0x00c0, %pstate
	.word 0x8d90280e  ! 1920: WRPR_PSTATE_I	wrpr	%r0, 0x080e, %pstate
	.word 0x879023f6  ! 1921: WRPR_TT_I	wrpr	%r0, 0x03f6, %tt
	.word 0x83b08ff2  ! 1922: FONES	fones	%f1
change_to_tl1_218:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902005  ! 1924: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902094  ! 1925: WRPR_PSTATE_I	wrpr	%r0, 0x0094, %pstate
	.word 0xb3a249f7  ! 1926: FDIVq	dis not found

	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 1927: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa0fd0015  ! 1928: SDIVcc_R	sdivcc 	%r20, %r21, %r16
DS_219:
	.word 0x20800001  ! 1930: BN	bn,a	<label_0x1>
	allclean
	.word 0x8db10303  ! 1929: ALLIGNADDRESS	alignaddr	%r4, %r3, %r6
DS_220:
	.word 0x20800001  ! 1931: BN	bn,a	<label_0x1>
	pdist %f8, %f24, %f28
	.word 0x97b6c314  ! 1930: ALLIGNADDRESS	alignaddr	%r27, %r20, %r11
	.word 0xafa00577  ! 1931: FSQRTq	fsqrt	
	.word 0xa3a5cd35  ! 1932: FsMULd	fsmuld	%f23, %f52, %f48
	.word 0x81982c87  ! 1933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c87, %hpstate
DS_221:
	.word 0x34800001  ! 1935: BG	bg,a	<label_0x1>
	pdist %f4, %f12, %f2
	.word 0xabb34304  ! 1934: ALLIGNADDRESS	alignaddr	%r13, %r4, %r21
	.word 0xb7a01a68  ! 1935: FqTOi	fqtoi	
splash_cmpr_222:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb185a001  ! 1936: WR_STICK_REG_I	wr	%r22, 0x0001, %-
	.word 0x84858012  ! 1937: ADDcc_R	addcc 	%r22, %r18, %r2
	.word 0xc48fe000  ! 1938: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r2
	.word 0x93702001  ! 1939: POPC_I	popc	0x0001, %r9
	.word 0x8d902e1f  ! 1940: WRPR_PSTATE_I	wrpr	%r0, 0x0e1f, %pstate
	.word 0x8d802004  ! 1941: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 1942: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902008  ! 1943: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x819825df  ! 1944: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05df, %hpstate
	.word 0xd2c804a0  ! 1945: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0xa1902002  ! 1946: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x87a58d2a  ! 1947: FsMULd	fsmuld	%f22, %f10, %f34
	.word 0x2e800001  ! 1948: BVS	bvs,a	<label_0x1>
	.word 0x87802004  ! 1949: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x84d06001  ! 1950: UMULcc_I	umulcc 	%r1, 0x0001, %r2
	.word 0xa1902002  ! 1951: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa951c000  ! 1952: RDPR_TL	rdpr	%tl, %r20
	.word 0x87902354  ! 1953: WRPR_TT_I	wrpr	%r0, 0x0354, %tt
	.word 0x91d02033  ! 1954: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe88008a0  ! 1955: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x99902000  ! 1956: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xe88804a0  ! 1957: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
	.word 0x9f802001  ! 1958: SIR	sir	0x0001
	.word 0x98aa8009  ! 1959: ANDNcc_R	andncc 	%r10, %r9, %r12
	.word 0x8ba24d38  ! 1960: FsMULd	fsmuld	%f9, %f24, %f36
	.word 0xcbe7c038  ! 1961: CASA_I	casa	[%r31] 0x 1, %r24, %r5
	.word 0x83d02035  ! 1962: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x20700001  ! 1963: BPN	<illegal instruction>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1964: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x38800001  ! 1965: BGU	bgu,a	<label_0x1>
	.word 0x87802080  ! 1966: WRASI_I	wr	%r0, 0x0080, %asi
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1967: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902610  ! 1968: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d02031  ! 1970: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x819824d6  ! 1971: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d6, %hpstate
	.word 0x98d56001  ! 1972: UMULcc_I	umulcc 	%r21, 0x0001, %r12
	.word 0x87902164  ! 1973: WRPR_TT_I	wrpr	%r0, 0x0164, %tt
DS_223:
	.word 0x32800001  ! 1975: BNE	bne,a	<label_0x1>
	pdist %f10, %f18, %f12
	.word 0x81b5c30b  ! 1974: ALLIGNADDRESS	alignaddr	%r23, %r11, %r0
	.word 0xaf504000  ! 1975: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x879021d4  ! 1976: WRPR_TT_I	wrpr	%r0, 0x01d4, %tt
	.word 0xab514000  ! 1977: RDPR_TBA	rdpr	%tba, %r21
	.word 0x93d02031  ! 1978: Tcc_I	tne	icc_or_xcc, %r0 + 49
reduce_priv_level_224:
	.word 0x8f902000  ! 1980: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb185800d  ! 1979: WR_STICK_REG_R	wr	%r22, %r13, %-
	.word 0x8d902c18  ! 1980: WRPR_PSTATE_I	wrpr	%r0, 0x0c18, %pstate
	.word 0x91d02033  ! 1981: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902000  ! 1982: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8ed00009  ! 1983: UMULcc_R	umulcc 	%r0, %r9, %r7
	.word 0x819821dc  ! 1984: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01dc, %hpstate
	.word 0x8d802000  ! 1985: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
splash_tba_225:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1987: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xced004a0  ! 1988: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0x84f9e001  ! 1989: SDIVcc_I	sdivcc 	%r7, 0x0001, %r2
	.word 0xc4ffc029  ! 1990: SWAPA_R	swapa	%r2, [%r31 + %r9] 0x01
	.word 0xa1902009  ! 1991: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d02032  ! 1992: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902ac2  ! 1993: WRPR_PSTATE_I	wrpr	%r0, 0x0ac2, %pstate
	.word 0x83d02035  ! 1994: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xc48008a0  ! 1995: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x8d802000  ! 1996: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x946a2001  ! 1997: UDIVX_I	udivx 	%r8, 0x0001, %r10
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1998: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd48fe000  ! 1999: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0xd4880e60  ! 2000: LDUBA_R	lduba	[%r0, %r0] 0x73, %r10
	.word 0x87902194  ! 2001: WRPR_TT_I	wrpr	%r0, 0x0194, %tt
	.word 0xa1902009  ! 2002: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902003  ! 2003: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 2004: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902886  ! 2005: WRPR_PSTATE_I	wrpr	%r0, 0x0886, %pstate
	.word 0x8d9024cd  ! 2006: WRPR_PSTATE_I	wrpr	%r0, 0x04cd, %pstate
	.word 0xa190200e  ! 2007: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xd4800c00  ! 2008: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r10
	.word 0xd457c000  ! 2009: LDSH_R	ldsh	[%r31 + %r0], %r10
	.word 0x8cd9c015  ! 2010: SMULcc_R	smulcc 	%r7, %r21, %r6
	.word 0x95702001  ! 2011: POPC_I	popc	0x0001, %r10
	.word 0xd4cfe020  ! 2012: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
DS_226:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 2013: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8d902c4e  ! 2014: WRPR_PSTATE_I	wrpr	%r0, 0x0c4e, %pstate
	.word 0x93902003  ! 2015: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
reduce_priv_level_227:
	.word 0x8f902002  ! 2017: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x85a0196c  ! 2016: FqTOd	dis not found

	.word 0x93504000  ! 2017: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0x93d02033  ! 2018: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x99902002  ! 2019: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x8790217c  ! 2020: WRPR_TT_I	wrpr	%r0, 0x017c, %tt
	.word 0xa190200a  ! 2021: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x819823d5  ! 2022: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d5, %hpstate
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 2023: Tcc_R	tne	icc_or_xcc, %r0 + %r30
reduce_priv_level_228:
	.word 0x8f902001  ! 2025: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 2024: SIAM	siam	1
splash_htba_229:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2025: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87802016  ! 2026: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8a84e001  ! 2027: ADDcc_I	addcc 	%r19, 0x0001, %r5
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 2028: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x98850002  ! 2029: ADDcc_R	addcc 	%r20, %r2, %r12
	.word 0x91d02031  ! 2030: Tcc_I	ta	icc_or_xcc, %r0 + 49
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2031: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c4b  ! 2032: WRPR_PSTATE_I	wrpr	%r0, 0x0c4b, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902001  ! 2034: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 2035: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87508000  ! 2036: RDPR_TSTATE	rdpr	%tstate, %r3
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 2037: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc69fc020  ! 2038: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0x8686e001  ! 2039: ADDcc_I	addcc 	%r27, 0x0001, %r3
	.word 0x8198254e  ! 2040: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054e, %hpstate
DS_230:
	.word 0x20800001  ! 2042: BN	bn,a	<label_0x1>
	.xword 0xed635063	! Random illegal ?
	.word 0x8ba0054b  ! 2042: FSQRTd	fsqrt	
	.word 0x9ba50835  ! 2041: FADDs	fadds	%f20, %f21, %f13
	.word 0x8d802000  ! 2042: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_htba_231:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 2043: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8cfea001  ! 2044: SDIVcc_I	sdivcc 	%r26, 0x0001, %r6
	.word 0xccffc035  ! 2045: SWAPA_R	swapa	%r6, [%r31 + %r21] 0x01
	.word 0x8d9020cd  ! 2046: WRPR_PSTATE_I	wrpr	%r0, 0x00cd, %pstate
	.word 0x87a309cc  ! 2047: FDIVd	fdivd	%f12, %f12, %f34
	.word 0x9f802001  ! 2048: SIR	sir	0x0001
	.word 0xa1902004  ! 2049: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x879021d2  ! 2050: WRPR_TT_I	wrpr	%r0, 0x01d2, %tt
	.word 0xa1902006  ! 2051: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xc68008a0  ! 2052: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2053: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2054: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x98ae000d  ! 2055: ANDNcc_R	andncc 	%r24, %r13, %r12
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2056: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 2057: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 2058: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 2059: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8198270f  ! 2060: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070f, %hpstate
	.word 0x93902003  ! 2061: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_232:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 2062: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xa1902001  ! 2063: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8cfd6001  ! 2064: SDIVcc_I	sdivcc 	%r21, 0x0001, %r6
	.word 0x8da689b0  ! 2065: FDIVs	fdivs	%f26, %f16, %f6
	.word 0x99902003  ! 2066: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xcc8804a0  ! 2067: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 2068: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 2069: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_htba_233:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2070: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xccc7e010  ! 2071: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r6
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2072: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 2073: Tcc_I	ta	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	.word 0x8790206e  ! 2075: WRPR_TT_I	wrpr	%r0, 0x006e, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2076: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_234:
	.word 0x20800001  ! 2078: BN	bn,a	<label_0x1>
	.word 0xdb30c000  ! 2078: STQF_R	-	%f13, [%r0, %r3]
	normalw
	.word 0x8b458000  ! 2077: RD_SOFTINT_REG	rd	%softint, %r5
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 2078: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8fa0054a  ! 2079: FSQRTd	fsqrt	
	.word 0x93902003  ! 2080: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87902226  ! 2081: WRPR_TT_I	wrpr	%r0, 0x0226, %tt
	.word 0x87902158  ! 2082: WRPR_TT_I	wrpr	%r0, 0x0158, %tt
	.word 0xce9fe001  ! 2083: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r7
	.word 0x91d02032  ! 2084: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xad540000  ! 2085: RDPR_GL	rdpr	%-, %r22
	.word 0x93902004  ! 2086: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8790211b  ! 2087: WRPR_TT_I	wrpr	%r0, 0x011b, %tt
	.word 0xa1902003  ! 2088: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87902140  ! 2089: WRPR_TT_I	wrpr	%r0, 0x0140, %tt
	.word 0x95540000  ! 2090: RDPR_GL	rdpr	%-, %r10
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2091: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4dfe000  ! 2092: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x95500000  ! 2093: RDPR_TPC	rdpr	%tpc, %r10
	.word 0x93902002  ! 2094: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_235:
	.word 0x20800001  ! 2096: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 2096: BNE	bne,a	<label_0x1>
	.word 0xcf164015  ! 2096: LDQF_R	-	[%r25, %r21], %f7
	.word 0x8da0c83b  ! 2095: FADDs	fadds	%f3, %f27, %f6
	.word 0xa190200b  ! 2096: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8790237b  ! 2097: WRPR_TT_I	wrpr	%r0, 0x037b, %tt
	.word 0xccdfe000  ! 2098: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2099: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_236:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 2100: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 2102: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 2103: SIR	sir	0x0001
splash_tba_237:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 2104: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x98d28008  ! 2105: UMULcc_R	umulcc 	%r10, %r8, %r12
	.word 0xa1902007  ! 2106: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8780201c  ! 2107: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x879020d8  ! 2108: WRPR_TT_I	wrpr	%r0, 0x00d8, %tt
	.word 0xa1902002  ! 2109: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93d02032  ! 2110: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xb0c22001  ! 2111: ADDCcc_I	addccc 	%r8, 0x0001, %r24
	.word 0x8d902600  ! 2112: WRPR_PSTATE_I	wrpr	%r0, 0x0600, %pstate
DS_238:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 2113: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x3e700001  ! 2114: BPVC	<illegal instruction>
	.word 0xf08008a0  ! 2115: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x2e800001  ! 2116: BVS	bvs,a	<label_0x1>
	.word 0x81982e44  ! 2117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e44, %hpstate
	.word 0x8d902246  ! 2118: WRPR_PSTATE_I	wrpr	%r0, 0x0246, %pstate
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 2119: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8198284d  ! 2120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084d, %hpstate
	.word 0xf0cfe000  ! 2121: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r24
	.word 0xabb68feb  ! 2122: FONES	fones	%f21
	.word 0x81982c07  ! 2123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c07, %hpstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 2124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 2125: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xea8008a0  ! 2126: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0xead7e030  ! 2127: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r21
	.word 0x91d02031  ! 2128: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x91d02031  ! 2129: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d9020cd  ! 2130: WRPR_PSTATE_I	wrpr	%r0, 0x00cd, %pstate
	.word 0x91d02034  ! 2131: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x99500000  ! 2132: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x8790217e  ! 2133: WRPR_TT_I	wrpr	%r0, 0x017e, %tt
	.word 0x93902001  ! 2134: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x92852001  ! 2135: ADDcc_I	addcc 	%r20, 0x0001, %r9
	.word 0xd2c804a0  ! 2136: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	.word 0x93902007  ! 2137: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_239:
	.word 0x32800001  ! 2139: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 2138: SAVE_R	save	%r31, %r0, %r31
	.word 0x9950c000  ! 2139: RDPR_TT	rdpr	%tt, %r12
	.word 0xd88008a0  ! 2140: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x93d02031  ! 2141: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x83a000c9  ! 2142: FNEGd	fnegd	%f40, %f32
	.word 0xc2d7e030  ! 2143: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r1
	.word 0xa3514000  ! 2144: RDPR_TBA	rdpr	%tba, %r17
splash_cmpr_240:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 2145: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0xb4f8e001  ! 2146: SDIVcc_I	sdivcc 	%r3, 0x0001, %r26
	.word 0x93902001  ! 2147: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902007  ! 2148: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa190200e  ! 2149: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xf457e001  ! 2150: LDSH_I	ldsh	[%r31 + 0x0001], %r26
	.word 0x879020a2  ! 2151: WRPR_TT_I	wrpr	%r0, 0x00a2, %tt
	.word 0x99902005  ! 2152: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x83d02030  ! 2153: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x966aa001  ! 2154: UDIVX_I	udivx 	%r10, 0x0001, %r11
	.word 0x8780201c  ! 2155: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x93d02035  ! 2156: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 2157: WRFPRS_I	wr	%r0, 0x0000, %fprs
change_to_tl1_241:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1902001  ! 2159: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8d902058  ! 2160: WRPR_PSTATE_I	wrpr	%r0, 0x0058, %pstate
change_to_tl1_242:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1902003  ! 2162: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x879020dc  ! 2163: WRPR_TT_I	wrpr	%r0, 0x00dc, %tt
	.word 0x87500000  ! 2164: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x93514000  ! 2165: RDPR_TBA	rdpr	%tba, %r9
	.word 0x93d02035  ! 2166: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xb7a00563  ! 2167: FSQRTq	fsqrt	
	.word 0x91d02031  ! 2168: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87802080  ! 2169: WRASI_I	wr	%r0, 0x0080, %asi
change_to_tl1_243:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xf6800ae0  ! 2171: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r27
	.word 0x8790224a  ! 2172: WRPR_TT_I	wrpr	%r0, 0x024a, %tt
	.word 0xa190200e  ! 2173: WRPR_GL_I	wrpr	%r0, 0x000e, %-
change_to_tl1_244:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91a0c9d2  ! 2175: FDIVd	fdivd	%f34, %f18, %f8
	.word 0x879023dc  ! 2176: WRPR_TT_I	wrpr	%r0, 0x03dc, %tt
	.word 0x81982d54  ! 2177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d54, %hpstate
	.word 0xa1902002  ! 2178: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_htba_245:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2179: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_htba_246:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 2180: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_247:
	.word 0x22800001  ! 2182: BE	be,a	<label_0x1>
	.word 0x32800001  ! 2182: BNE	bne,a	<label_0x1>
	.word 0x89a0055b  ! 2182: FSQRTd	fsqrt	
	.word 0xa9a00828  ! 2181: FADDs	fadds	%f0, %f8, %f20
	.word 0x87902365  ! 2182: WRPR_TT_I	wrpr	%r0, 0x0365, %tt
	.word 0x9f802001  ! 2183: SIR	sir	0x0001
	.word 0xe89fc020  ! 2184: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0xa1902005  ! 2185: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81982f54  ! 2186: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f54, %hpstate
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 2187: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe897e000  ! 2189: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r20
	.word 0x20700001  ! 2190: BPN	<illegal instruction>
	.word 0x2e700001  ! 2191: BPVS	<illegal instruction>
	.word 0x8198231f  ! 2192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031f, %hpstate
	.word 0x93902006  ! 2193: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x83d02033  ! 2194: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xa1902004  ! 2195: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 2196: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 2197: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe87fe001  ! 2198: SWAP_I	swap	%r20, [%r31 + 0x0001]
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 2199: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2200: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02030  ! 2201: Tcc_I	ta	icc_or_xcc, %r0 + 48
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 2202: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8a6a6001  ! 2203: UDIVX_I	udivx 	%r9, 0x0001, %r5
	.word 0x8ad80003  ! 2204: SMULcc_R	smulcc 	%r0, %r3, %r5
	.word 0x83d02032  ! 2205: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x83d02034  ! 2206: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xab508000  ! 2207: RDPR_TSTATE	rdpr	%tstate, %r21
change_to_randtl_248:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 2208: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
change_to_tl1_249:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902005  ! 2210: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d9024c4  ! 2211: WRPR_PSTATE_I	wrpr	%r0, 0x04c4, %pstate
change_to_tl1_250:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1902004  ! 2213: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8350c000  ! 2214: RDPR_TT	rdpr	%tt, %r1
	.word 0xa190200d  ! 2215: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_cmpr_251:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2217: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181e001  ! 2216: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0x91d02033  ! 2217: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02031  ! 2218: Tcc_I	ta	icc_or_xcc, %r0 + 49
change_to_randtl_252:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 2219: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc237e001  ! 2220: STH_I	sth	%r1, [%r31 + 0x0001]
	.word 0x87802014  ! 2221: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8198294f  ! 2222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094f, %hpstate
	.word 0x93902002  ! 2223: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2224: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc27fe001  ! 2225: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0x8d90285f  ! 2226: WRPR_PSTATE_I	wrpr	%r0, 0x085f, %pstate
	.word 0x93902001  ! 2227: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
reduce_priv_level_253:
	.word 0x8f902002  ! 2229: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1800004  ! 2228: WR_STICK_REG_R	wr	%r0, %r4, %-
	.word 0x91d02034  ! 2229: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x99902000  ! 2230: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x93902001  ! 2231: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982c5c  ! 2232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5c, %hpstate
	.word 0x93902000  ! 2233: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902001  ! 2234: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc2c7e000  ! 2235: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r1
	.word 0xc28fe030  ! 2236: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r1
	.word 0x81982fc7  ! 2237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc7, %hpstate
	.word 0x81982514  ! 2238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0514, %hpstate
	.word 0xa190200a  ! 2239: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_cmpr_254:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182e001  ! 2240: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0x8d902893  ! 2241: WRPR_PSTATE_I	wrpr	%r0, 0x0893, %pstate
	.word 0x22700001  ! 2242: BPE	<illegal instruction>
	.word 0x9f802001  ! 2243: SIR	sir	0x0001
	.word 0x8d9024d1  ! 2244: WRPR_PSTATE_I	wrpr	%r0, 0x04d1, %pstate
	.word 0x81982cce  ! 2245: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cce, %hpstate
	.word 0xa2816001  ! 2246: ADDcc_I	addcc 	%r5, 0x0001, %r17
	.word 0x8d802000  ! 2247: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_255:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2249: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb185a001  ! 2248: WR_STICK_REG_I	wr	%r22, 0x0001, %-
	.word 0xa190200c  ! 2249: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d90221d  ! 2250: WRPR_PSTATE_I	wrpr	%r0, 0x021d, %pstate
	.word 0x91d02034  ! 2251: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87a00561  ! 2252: FSQRTq	fsqrt	
DS_256:
	.word 0x22800001  ! 2254: BE	be,a	<label_0x1>
	.xword 0x8144db77	! Random illegal ?
	.word 0xb3a00544  ! 2254: FSQRTd	fsqrt	
	.word 0x8da5082a  ! 2253: FADDs	fadds	%f20, %f10, %f6
	.word 0x81982acd  ! 2254: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acd, %hpstate
reduce_priv_level_257:
	.word 0x8f902001  ! 2256: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 2255: SIAM	siam	1
	.word 0x93d02035  ! 2256: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x879022f4  ! 2257: WRPR_TT_I	wrpr	%r0, 0x02f4, %tt
	.word 0x9b500000  ! 2258: RDPR_TPC	rdpr	%tpc, %r13
splash_tba_258:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 2259: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200f  ! 2260: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x9669000c  ! 2261: UDIVX_R	udivx 	%r4, %r12, %r11
splash_cmpr_259:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2263: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1842001  ! 2262: WR_STICK_REG_I	wr	%r16, 0x0001, %-
	.word 0x87802088  ! 2263: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd69fc020  ! 2264: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
reduce_priv_level_260:
	.word 0x8f902001  ! 2266: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89810000  ! 2265: WRTICK_R	wr	%r4, %r0, %tick
	.word 0x8d902680  ! 2266: WRPR_PSTATE_I	wrpr	%r0, 0x0680, %pstate
splash_htba_261:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 2267: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd6ffc020  ! 2268: SWAPA_R	swapa	%r11, [%r31 + %r0] 0x01
	.word 0xa1902005  ! 2269: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d90241b  ! 2270: WRPR_PSTATE_I	wrpr	%r0, 0x041b, %pstate
	.word 0xd657c000  ! 2271: LDSH_R	ldsh	[%r31 + %r0], %r11
	.word 0xafa68d27  ! 2272: FsMULd	fsmuld	%f26, %f38, %f54
	.word 0x87902367  ! 2273: WRPR_TT_I	wrpr	%r0, 0x0367, %tt
	.word 0x87902204  ! 2274: WRPR_TT_I	wrpr	%r0, 0x0204, %tt
	.word 0x8198201e  ! 2275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001e, %hpstate
	.word 0x95a0056d  ! 2276: FSQRTq	fsqrt	
	.word 0x87802014  ! 2277: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902006  ! 2278: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x82d84012  ! 2280: SMULcc_R	smulcc 	%r1, %r18, %r1
	.word 0xb1702001  ! 2281: POPC_I	popc	0x0001, %r24
	.word 0x8198295f  ! 2282: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095f, %hpstate
	.word 0xa1902000  ! 2283: WRPR_GL_I	wrpr	%r0, 0x0000, %-
change_to_randtl_262:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 2284: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902005  ! 2285: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xf0d7e000  ! 2286: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r24
change_to_randtl_263:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 2287: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xf1e7c032  ! 2288: CASA_I	casa	[%r31] 0x 1, %r18, %r24
	.word 0x8790230c  ! 2289: WRPR_TT_I	wrpr	%r0, 0x030c, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x99a000ca  ! 2291: FNEGd	fnegd	%f10, %f12
	.word 0x81982a55  ! 2292: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a55, %hpstate
	.word 0x93902000  ! 2293: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd88008a0  ! 2294: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x89702001  ! 2295: POPC_I	popc	0x0001, %r4
	.word 0x93d02033  ! 2296: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa1902009  ! 2297: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xc927e001  ! 2298: STF_I	st	%f4, [0x0001, %r31]
	.word 0x8d9022c3  ! 2299: WRPR_PSTATE_I	wrpr	%r0, 0x02c3, %pstate
DS_264:
	.word 0x32800001  ! 2301: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 2300: SAVE_R	save	%r31, %r0, %r31
	.word 0x88fd6001  ! 2301: SDIVcc_I	sdivcc 	%r21, 0x0001, %r4
DS_265:
	.word 0x34800001  ! 2303: BG	bg,a	<label_0x1>
	pdist %f26, %f18, %f10
	.word 0x81b5c317  ! 2302: ALLIGNADDRESS	alignaddr	%r23, %r23, %r0
	.word 0xc137e001  ! 2303: STQF_I	-	%f0, [0x0001, %r31]
	.word 0xc0800c60  ! 2304: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r0
	.word 0xc0bfe001  ! 2305: STDA_I	stda	%r0, [%r31 + 0x0001] %asi
	.word 0xc017c000  ! 2306: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0x81982bd4  ! 2307: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd4, %hpstate
	.word 0x8d902049  ! 2308: WRPR_PSTATE_I	wrpr	%r0, 0x0049, %pstate
	.word 0x96852001  ! 2309: ADDcc_I	addcc 	%r20, 0x0001, %r11
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982805  ! 2311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0805, %hpstate
	.word 0x8198200e  ! 2312: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000e, %hpstate
	.word 0x81982e54  ! 2313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e54, %hpstate
	.word 0x83d02035  ! 2314: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa190200d  ! 2315: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8ad54007  ! 2316: UMULcc_R	umulcc 	%r21, %r7, %r5
	.word 0x91d02034  ! 2317: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9a484019  ! 2318: MULX_R	mulx 	%r1, %r25, %r13
	.word 0x81982d5f  ! 2319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5f, %hpstate
	.word 0x8d9020d2  ! 2320: WRPR_PSTATE_I	wrpr	%r0, 0x00d2, %pstate
splash_htba_266:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2321: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8da0056d  ! 2322: FSQRTq	fsqrt	
	.word 0x93902002  ! 2323: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982285  ! 2324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0285, %hpstate
	.word 0xb0c0a001  ! 2325: ADDCcc_I	addccc 	%r2, 0x0001, %r24
	.word 0x87802004  ! 2326: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x90a8400a  ! 2327: ANDNcc_R	andncc 	%r1, %r10, %r8
	.word 0xa1902007  ! 2328: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8668a001  ! 2329: UDIVX_I	udivx 	%r2, 0x0001, %r3
	.word 0x8790209a  ! 2330: WRPR_TT_I	wrpr	%r0, 0x009a, %tt
	.word 0x93902003  ! 2331: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02032  ! 2332: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xb3500000  ! 2333: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x806ee001  ! 2334: UDIVX_I	udivx 	%r27, 0x0001, %r0
	.word 0xa1902007  ! 2335: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xb7702001  ! 2336: POPC_I	popc	0x0001, %r27
	.word 0x91d02032  ! 2337: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902000  ! 2338: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 2339: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2340: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf737c00a  ! 2341: STQF_R	-	%f27, [%r10, %r31]
	.word 0x91d02031  ! 2342: Tcc_I	ta	icc_or_xcc, %r0 + 49
change_to_tl1_267:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa9540000  ! 2344: RDPR_GL	rdpr	%-, %r20
	.word 0x85500000  ! 2345: RDPR_TPC	<illegal instruction>
	.word 0xa1902007  ! 2346: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x81982915  ! 2347: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0915, %hpstate
	.word 0x8d902c00  ! 2348: WRPR_PSTATE_I	wrpr	%r0, 0x0c00, %pstate
	.word 0x8790215f  ! 2349: WRPR_TT_I	wrpr	%r0, 0x015f, %tt
	.word 0xb086e001  ! 2350: ADDcc_I	addcc 	%r27, 0x0001, %r24
	.word 0x83d02035  ! 2351: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_tba_268:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2352: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9afc800d  ! 2353: SDIVcc_R	sdivcc 	%r18, %r13, %r13
	.word 0x8198280f  ! 2354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080f, %hpstate
	.word 0x93d02033  ! 2355: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d902c5a  ! 2356: WRPR_PSTATE_I	wrpr	%r0, 0x0c5a, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902001  ! 2358: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8da0c9f8  ! 2359: FDIVq	dis not found

	.word 0x8d902a9f  ! 2360: WRPR_PSTATE_I	wrpr	%r0, 0x0a9f, %pstate
	.word 0x9f802001  ! 2361: SIR	sir	0x0001
	.word 0xcc07c000  ! 2362: LDUW_R	lduw	[%r31 + %r0], %r6
splash_cmpr_269:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2364: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1836001  ! 2363: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0xa190200d  ! 2364: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91d02032  ! 2365: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_randtl_270:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 2366: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 2367: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 2368: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902003  ! 2369: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xccd804a0  ! 2370: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0x879023df  ! 2371: WRPR_TT_I	wrpr	%r0, 0x03df, %tt
	.word 0x9f802001  ! 2372: SIR	sir	0x0001
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2373: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790225a  ! 2374: WRPR_TT_I	wrpr	%r0, 0x025a, %tt
	.word 0x8d902412  ! 2375: WRPR_PSTATE_I	wrpr	%r0, 0x0412, %pstate
	.word 0xa951c000  ! 2376: RDPR_TL	rdpr	%tl, %r20
	.word 0xa190200e  ! 2377: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8da489f2  ! 2378: FDIVq	dis not found

	.word 0x87902181  ! 2379: WRPR_TT_I	wrpr	%r0, 0x0181, %tt
	.word 0xcc7fe001  ! 2380: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x8198225c  ! 2381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025c, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982edd  ! 2383: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0edd, %hpstate
	.word 0xa190200b  ! 2384: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d802000  ! 2385: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f702001  ! 2386: POPC_I	popc	0x0001, %r7
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 2387: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 2388: SIR	sir	0x0001
	.word 0x9f802001  ! 2389: SIR	sir	0x0001
	.word 0x93902003  ! 2390: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982796  ! 2391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0796, %hpstate
	.word 0x89a1c9b5  ! 2392: FDIVs	fdivs	%f7, %f21, %f4
	.word 0xa1902003  ! 2393: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_htba_271:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2394: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x81982e0e  ! 2395: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0e, %hpstate
	.word 0x89a58dcc  ! 2396: FdMULq	fdmulq	
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 2397: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902046  ! 2398: WRPR_PSTATE_I	wrpr	%r0, 0x0046, %pstate
	.word 0x8f540000  ! 2399: RDPR_GL	rdpr	%-, %r7
	.word 0x819826ce  ! 2400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06ce, %hpstate
	.word 0xa1902005  ! 2401: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_272:
	.word 0x22800001  ! 2403: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 2402: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8790227f  ! 2403: WRPR_TT_I	wrpr	%r0, 0x027f, %tt
	.word 0x93902005  ! 2404: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982184  ! 2405: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0184, %hpstate
splash_tba_273:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 2406: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8198270f  ! 2407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070f, %hpstate
	.word 0x91d02035  ! 2408: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9b51c000  ! 2409: RDPR_TL	rdpr	%tl, %r13
	.word 0x87802088  ! 2410: WRASI_I	wr	%r0, 0x0088, %asi
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2411: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 2412: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902ccb  ! 2413: WRPR_PSTATE_I	wrpr	%r0, 0x0ccb, %pstate
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 2414: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902e1c  ! 2415: WRPR_PSTATE_I	wrpr	%r0, 0x0e1c, %pstate
	.word 0x8d902e8c  ! 2416: WRPR_PSTATE_I	wrpr	%r0, 0x0e8c, %pstate
	.word 0xdb37e001  ! 2417: STQF_I	-	%f13, [0x0001, %r31]
	ta	T_CHANGE_PRIV	! macro
	.word 0x22700001  ! 2419: BPE	<illegal instruction>
	.word 0x8790202b  ! 2420: WRPR_TT_I	wrpr	%r0, 0x002b, %tt
	.word 0x8d902cc4  ! 2421: WRPR_PSTATE_I	wrpr	%r0, 0x0cc4, %pstate
splash_htba_274:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2422: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 2423: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2424: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2426: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_275:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 2427: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x81982985  ! 2428: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0985, %hpstate
	.word 0xa1902001  ! 2429: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x22700001  ! 2430: BPE	<illegal instruction>
	.word 0xda800be0  ! 2431: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r13
	.word 0xdb27c00c  ! 2432: STF_R	st	%f13, [%r12, %r31]
	.word 0x83d02035  ! 2433: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x87802080  ! 2434: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xda1fc000  ! 2435: LDD_R	ldd	[%r31 + %r0], %r13
change_to_tl1_276:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902617  ! 2437: WRPR_PSTATE_I	wrpr	%r0, 0x0617, %pstate
	.word 0xa5500000  ! 2438: RDPR_TPC	rdpr	%tpc, %r18
	.word 0x8f540000  ! 2439: RDPR_GL	<illegal instruction>
	.word 0x8550c000  ! 2440: RDPR_TT	<illegal instruction>
splash_htba_277:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2441: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8198270c  ! 2442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070c, %hpstate
	.word 0x93902005  ! 2443: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x22800001  ! 2444: BE	be,a	<label_0x1>
	.word 0x36700001  ! 2445: BPGE	<illegal instruction>
	.word 0xc4d004a0  ! 2446: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r2
	.word 0x87802014  ! 2447: WRASI_I	wr	%r0, 0x0014, %asi
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2448: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902288  ! 2449: WRPR_TT_I	wrpr	%r0, 0x0288, %tt
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 2450: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90284c  ! 2451: WRPR_PSTATE_I	wrpr	%r0, 0x084c, %pstate
	.word 0x83d02032  ! 2452: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8ad34001  ! 2453: UMULcc_R	umulcc 	%r13, %r1, %r5
	.word 0xa3504000  ! 2454: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xa6d12001  ! 2455: UMULcc_I	umulcc 	%r4, 0x0001, %r19
	.word 0x83d02030  ! 2456: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xa1902004  ! 2457: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa190200d  ! 2458: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d540000  ! 2459: RDPR_GL	rdpr	%-, %r6
	.word 0x9b514000  ! 2460: RDPR_TBA	rdpr	%tba, %r13
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 2461: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_278:
	.word 0x22800001  ! 2463: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 2462: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d902483  ! 2463: WRPR_PSTATE_I	wrpr	%r0, 0x0483, %pstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2464: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982595  ! 2465: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0595, %hpstate
	.word 0xa869000c  ! 2466: UDIVX_R	udivx 	%r4, %r12, %r20
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2467: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_279:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 2468: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 2469: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02035  ! 2470: Tcc_I	tne	icc_or_xcc, %r0 + 53
change_to_tl1_280:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xe847e001  ! 2472: LDSW_I	ldsw	[%r31 + 0x0001], %r20
	.word 0xe8d804a0  ! 2473: LDXA_R	ldxa	[%r0, %r0] 0x25, %r20
	.word 0x879020ff  ! 2474: WRPR_TT_I	wrpr	%r0, 0x00ff, %tt
	.word 0x87902198  ! 2475: WRPR_TT_I	wrpr	%r0, 0x0198, %tt
	.word 0x9f802001  ! 2476: SIR	sir	0x0001
	ta	T_CHANGE_PRIV	! macro
	.word 0xa8da4009  ! 2478: SMULcc_R	smulcc 	%r9, %r9, %r20
	.word 0xe88804a0  ! 2479: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
reduce_priv_level_281:
	.word 0x8f902001  ! 2481: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 2480: SIAM	siam	1
	.word 0xe87fe001  ! 2481: SWAP_I	swap	%r20, [%r31 + 0x0001]
	.word 0x88d08012  ! 2482: UMULcc_R	umulcc 	%r2, %r18, %r4
	.word 0x83d02030  ! 2483: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xa1902000  ! 2484: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x81982d5e  ! 2485: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5e, %hpstate
	.word 0xa1902008  ! 2486: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x819827cf  ! 2488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cf, %hpstate
	.word 0xc8dfe030  ! 2489: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r4
	.word 0xa190200d  ! 2490: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa190200e  ! 2491: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8f500000  ! 2492: RDPR_TPC	rdpr	%tpc, %r7
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 2493: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 2494: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200f  ! 2495: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8ad0800a  ! 2496: UMULcc_R	umulcc 	%r2, %r10, %r5
	.word 0x93902000  ! 2497: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87902116  ! 2498: WRPR_TT_I	wrpr	%r0, 0x0116, %tt


.global user_data_start
.data
user_data_start:
	.xword	0x470dc779310180f7
	.xword	0x80163818d0c24cf7
	.xword	0xbea915ea983a591a
	.xword	0xc7b6860ae156acca
	.xword	0xff8412eb93130c3c
	.xword	0x7cc274f8fb391269
	.xword	0x279016fc6117af34
	.xword	0xe9099944506dfc5b
	.xword	0xbc7b74184f551bf0
	.xword	0x4ffd92cf35b3731c
	.xword	0xdb1ff8d0ae8e2f37
	.xword	0x27153180153baba1
	.xword	0xfaaec2b1f88f6042
	.xword	0x43aa159653524442
	.xword	0x3b3a16c14ca92443
	.xword	0xc5f69a8eb39886b3
	.xword	0x86a49f367b1e96c1
	.xword	0x56cacbb4c2a0e615
	.xword	0x8c0ed6b4e9ce6911
	.xword	0x8c91992b46333a59
	.xword	0x808f78f53c059637
	.xword	0xfa3341a4cfa774ea
	.xword	0x0c3ef0de433a9066
	.xword	0x9c4b99621cab5d73
	.xword	0xe7d3f3099717cf45
	.xword	0x01f1172a666ed9b2
	.xword	0x6b939c0273d63f6e
	.xword	0x87c0dc85dc361ec4
	.xword	0x868142dd656f5c70
	.xword	0x60d4958b74828847
	.xword	0x9347dbbeaa38cbeb
	.xword	0x2e16b14e3484baab
	.xword	0x7f0920b31928e968
	.xword	0xa7060b9ff44279ee
	.xword	0x38297e3d605641e6
	.xword	0x7bd937b371908495
	.xword	0xa32a84dff31c23d3
	.xword	0x66fde0751d38e883
	.xword	0xa49422d786dc072c
	.xword	0xe4043c4b780db05e
	.xword	0x4d16f239417be59b
	.xword	0x6331b76110c0f9e5
	.xword	0x4748f1e687b59019
	.xword	0x1bb8d2ab43a3cd00
	.xword	0x5cdddc3f41d1fa22
	.xword	0x6eb0ef82c5361e3e
	.xword	0x7a70e1befb20e46a
	.xword	0xc2ab788999b5528f
	.xword	0x441c36d7e016d12b
	.xword	0xdd4df272a2a18a25
	.xword	0x6a6d31b30d553a46
	.xword	0xafff5f7e6d06050e
	.xword	0x65e3cfda84bc7c18
	.xword	0xc32476a3b3a85d56
	.xword	0x142874713faa88cd
	.xword	0x182dcb2001645500
	.xword	0xedb43d473b531c4e
	.xword	0x1218f9265012f60b
	.xword	0x82360c3944fcff8e
	.xword	0xba5a67dab525d6e9
	.xword	0x2c33dd75118044c2
	.xword	0x6bfb5a15e0e2a0e2
	.xword	0x1b922e9430eb325b
	.xword	0x5e06e5a8bdcba245
	.xword	0x1ad46cc1a73a6861
	.xword	0x08a565c663bb5aec
	.xword	0xb0d77fc352f31e9a
	.xword	0xd78bd2e71e9b3b83
	.xword	0x7d5e1661d9296319
	.xword	0x60005b11d09d0b01
	.xword	0x537643716243af37
	.xword	0x5b2dbc1cb1340bf1
	.xword	0xeb1bced279ef19cb
	.xword	0x10571b0fdc0250d0
	.xword	0x255037908af8c77c
	.xword	0xe14c2f021bf138e3
	.xword	0x5a338b4b5daa55a5
	.xword	0x18b0075016410dec
	.xword	0x424f6bccff04fba0
	.xword	0x56ab4503cb3b2966
	.xword	0xc705620c0c356f63
	.xword	0x31a7b912228eaac7
	.xword	0x65a9b124383fc2b9
	.xword	0xbb7703ee5e5140e7
	.xword	0xd1f1a559416e10b4
	.xword	0x69f0faf3ec63cd25
	.xword	0x862e1c659a442f87
	.xword	0x15d54ad3735af06c
	.xword	0x886606cdc1ad4c54
	.xword	0x2078df59dd2dccf5
	.xword	0x4c867ba1596437d4
	.xword	0x3ae98d575769b2b3
	.xword	0x022a2fe983ab0bc7
	.xword	0x640a71ff7681a03f
	.xword	0xabeb7f3e727dee1b
	.xword	0xef50bc427b222c61
	.xword	0xafa0a9613886f41b
	.xword	0xf3ff258729a209f7
	.xword	0x44e1fc9ba4e9715c
	.xword	0x69ceb77bc9409b0f
	.xword	0xd45b876c0b992e58
	.xword	0xc475714127d0d497
	.xword	0x32854dbcd792a7d4
	.xword	0xa242184e396e8d94
	.xword	0x7d90d4bb8fdb3a1a
	.xword	0x062f39068c2b4477
	.xword	0x23fcd03b881d24d4
	.xword	0x7e01142375730121
	.xword	0x34d2e9a31d248f0d
	.xword	0xf65ac3e8445e4304
	.xword	0x8f2179a9691ed6a1
	.xword	0x821dfd9d4bcfbda7
	.xword	0x138c7e3068507544
	.xword	0x145953c328641ba4
	.xword	0x3ee75853019d7b52
	.xword	0x518526d4d49babb9
	.xword	0x9be8fd4903f4c0cf
	.xword	0x939466c805ecbda7
	.xword	0x92c0e431e0ac19e3
	.xword	0x89280af3f40f40db
	.xword	0xd27220d8dbc7d4f9
	.xword	0x8c231e9fc82e4b4e
	.xword	0xc3159a904e28b815
	.xword	0x30511b1a87951802
	.xword	0x24bee9b95d312ea5
	.xword	0x06ecab324a3aa90e
	.xword	0x7d81ce60bf2acba2
	.xword	0x6109ae78a3769c28
	.xword	0x94182aef50279300
	.xword	0xe0c3bfe35fe68a58
	.xword	0xb983f55836446636
	.xword	0x15c1fa9a3e1cdede
	.xword	0x251528adc673ccf2
	.xword	0x837416600c74aa7e
	.xword	0xdaa676eccee8979b
	.xword	0x2b6728e0fa208fcd
	.xword	0x82b2d9996d997cba
	.xword	0xaffa6c3fbf4d4c9d
	.xword	0x1a4fc724e0dd24c4
	.xword	0xb032d46a6b891f80
	.xword	0xd6343c4882e8a809
	.xword	0xd7686d3951b563e1
	.xword	0xde6fe143efd02848
	.xword	0x132361198a34fde7
	.xword	0xc18af85e583d60c4
	.xword	0x43d8fe7730dd9a76
	.xword	0x2f6965b1c344b34e
	.xword	0xc69db4e11371854c
	.xword	0x0fe80741ff3faa4f
	.xword	0x69b51f30903a7ad5
	.xword	0x6dc93559dc0b758a
	.xword	0x323d88acc46a1cdc
	.xword	0xf15a8710001cf762
	.xword	0xe174898f59c5aad6
	.xword	0x37a98dab71d7321c
	.xword	0x899bd954d07f9014
	.xword	0xd92cc1159c2165b8
	.xword	0xec314ea736de4af4
	.xword	0xdfa735090ee0cde8
	.xword	0x5ea5ef3989ae228e
	.xword	0xbc3b2d124b29a105
	.xword	0x3684fd74338a7e5f
	.xword	0x4ae544e1c6b9098b
	.xword	0x0796fe031a35206f
	.xword	0xa371c2066a14462a
	.xword	0x8ecd59d95d731728
	.xword	0xef34958256d345bc
	.xword	0x9ca47b3775d90f6f
	.xword	0xfa5f99503cb75258
	.xword	0xf6f4231ebd94de82
	.xword	0x7f53e86027210643
	.xword	0x5081b4dfa35ab277
	.xword	0x6ed3f5dd33b3f089
	.xword	0x12a030f4f9cde89b
	.xword	0x42b82314f9f33eef
	.xword	0x7a07a589f0980a3b
	.xword	0x63f172e8c2591d81
	.xword	0x16eeb22f72c048d4
	.xword	0x3e7ba090e84b34c6
	.xword	0x84fc7946a212a4f5
	.xword	0xd5fae80db0a10525
	.xword	0xd0dc9f66169499b5
	.xword	0xa0d73afe3abf7d48
	.xword	0xa258c3f7fc350887
	.xword	0x31048b24079f3f87
	.xword	0x741f6a1779166142
	.xword	0x92b18bd2be633797
	.xword	0x02efb957d1819e42
	.xword	0xcee5ebedd702344c
	.xword	0x35d298e2591892e5
	.xword	0xeec287c17fe3040c
	.xword	0x407b6ceb75b594a8
	.xword	0x6fd072c7a8f9aa46
	.xword	0x4e4a8aa0c151d0ee
	.xword	0x8af053db879891dd
	.xword	0x65639632812e947a
	.xword	0xd75af9bd123ece29
	.xword	0xb83a986db1e93c4f
	.xword	0x4642b9ca1d397f79
	.xword	0x03716c3ca3823d0c
	.xword	0x0969f2ca92d725e4
	.xword	0xc87a20c6677bf4ee
	.xword	0x7e8b082891f9a511
	.xword	0x641f897d31035e2e
	.xword	0xf135d9b8364ace21
	.xword	0xbd46cb135f1a00c3
	.xword	0x42b61693b8ea2221
	.xword	0xeeceba4567a28786
	.xword	0xe1a1e63e60572f39
	.xword	0x3e432d0f5885ed03
	.xword	0x5a5b44a12dd3a009
	.xword	0xe9de58a8c70dec69
	.xword	0x50b37f4e91de4c06
	.xword	0x1e5d860fed37abda
	.xword	0x9ced7148521beb00
	.xword	0x077b896c340f5d09
	.xword	0x0b435d8b22ce7668
	.xword	0x12e1ea70e7151663
	.xword	0x5fb726007df7eafe
	.xword	0xe0f27edb38329a9f
	.xword	0x3ba3844ea5aba601
	.xword	0xa8e24aef447b8b56
	.xword	0x4e0ea3d24ce80b55
	.xword	0xc26702177309bd0a
	.xword	0x7602eb7c70c8ab66
	.xword	0x281027e27c12accd
	.xword	0xe1def204947c0d88
	.xword	0x3fc2467179543427
	.xword	0x290bc70e564bf813
	.xword	0x6d9a7a8c6cd7e88e
	.xword	0x11463055e5072268
	.xword	0x39498e30e8de530e
	.xword	0x439e9f8f03f5e3c4
	.xword	0x6a849f438a30ec6f
	.xword	0xc4f3127958798db7
	.xword	0xe450279bf0ea68d4
	.xword	0x94c014f78d88963f
	.xword	0xd168d0f5e0968ee4
	.xword	0xdea6acc89da0da54
	.xword	0x5a52909dc619444e
	.xword	0x5d7b48f9819ecced
	.xword	0xaa352d34fcc3f1f8
	.xword	0x8d62942467bed2e3
	.xword	0xa40571d5a1afcc6d
	.xword	0x12cc0b9cb2b403b2
	.xword	0x446960257b49f30a
	.xword	0x0594a7762735829c
	.xword	0x2cd4d6a458bb9b14
	.xword	0xb48dfc6e02bc3ddc
	.xword	0xc44445f6a510a3d8
	.xword	0x460fa9d9034e3693
	.xword	0x053b41bb91f3b6e6
	.xword	0xb661512e79d8bb28
	.xword	0x4ea05ccf3a00a9a6
	.xword	0x8569ef2fbc522a58
	.xword	0x440d7fa99bd47602


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Wed May 12 14:02:38 2004
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

