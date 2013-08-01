/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_07.s
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
	mov 0xb4, %r14
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
	mov 0xb1, %r14
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
	mov 0x35, %r14
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
	.word 0xada54d25  ! 1: FsMULd	fsmuld	%f21, %f36, %f22
	.word 0x93902002  ! 2: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87902185  ! 3: WRPR_TT_I	wrpr	%r0, 0x0185, %tt
	.word 0x84de8001  ! 4: SMULcc_R	smulcc 	%r26, %r1, %r2
	.word 0x81982b0e  ! 5: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0e, %hpstate
	.word 0xc4ffc021  ! 6: SWAPA_R	swapa	%r2, [%r31 + %r1] 0x01
	.word 0x81982f0f  ! 7: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0f, %hpstate
	.word 0xc4c004a0  ! 8: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
splash_cmpr_0:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 9: WR_STICK_REG_I	wr	%r13, 0x0001, %-
splash_tba_1:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 10: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879020e7  ! 11: WRPR_TT_I	wrpr	%r0, 0x00e7, %tt
	.word 0x91d02031  ! 12: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_2:
	.word 0x22800001  ! 14: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 13: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200a  ! 14: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87902291  ! 15: WRPR_TT_I	wrpr	%r0, 0x0291, %tt
	.word 0xaf494000  ! 16: RDHPR_HTBA	rdhpr	%htba, %r23
	.word 0xa1902001  ! 17: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93d02035  ! 18: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xee8008a0  ! 19: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0xa190200d  ! 20: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91d02034  ! 21: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xee17e001  ! 22: LDUH_I	lduh	[%r31 + 0x0001], %r23
	.word 0x8d514000  ! 23: RDPR_TBA	rdpr	%tba, %r6
	.word 0x81460000  ! 24: RD_STICK_REG	stbar
	.word 0x87902184  ! 25: WRPR_TT_I	wrpr	%r0, 0x0184, %tt
	.word 0x8d902ec8  ! 26: WRPR_PSTATE_I	wrpr	%r0, 0x0ec8, %pstate
	.word 0xccd804a0  ! 27: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0x87902104  ! 28: WRPR_TT_I	wrpr	%r0, 0x0104, %tt
	.word 0x93902000  ! 29: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902004  ! 30: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x92fac019  ! 31: SDIVcc_R	sdivcc 	%r11, %r25, %r9
	.word 0xd2c7e020  ! 32: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r9
	.word 0x93902003  ! 33: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902c03  ! 34: WRPR_PSTATE_I	wrpr	%r0, 0x0c03, %pstate
	.word 0x8af92001  ! 35: SDIVcc_I	sdivcc 	%r4, 0x0001, %r5
	.word 0x93902006  ! 36: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa190200d  ! 37: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d902c8b  ! 38: WRPR_PSTATE_I	wrpr	%r0, 0x0c8b, %pstate
	.word 0xb16b0015  ! 39: SDIVX_R	sdivx	%r12, %r21, %r24
	.word 0xf08804a0  ! 40: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x879020b2  ! 41: WRPR_TT_I	wrpr	%r0, 0x00b2, %tt
	.word 0x93902003  ! 42: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8ec02001  ! 43: ADDCcc_I	addccc 	%r0, 0x0001, %r7
	.word 0x93514000  ! 44: RDPR_TBA	rdpr	%tba, %r9
	.word 0x30800001  ! 45: BA	ba,a	<label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 46: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90244e  ! 47: WRPR_PSTATE_I	wrpr	%r0, 0x044e, %pstate
	.word 0xd2ffc035  ! 48: SWAPA_R	swapa	%r9, [%r31 + %r21] 0x01
	.word 0xa8826001  ! 49: ADDcc_I	addcc 	%r9, 0x0001, %r20
splash_htba_3:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 50: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_4:
	.word 0x34800001  ! 52: BG	bg,a	<label_0x1>
	.word 0xd134a001  ! 52: STQF_I	-	%f8, [0x0001, %r18]
	normalw
	.word 0x8d458000  ! 51: RD_SOFTINT_REG	rd	%softint, %r6
change_to_tl1_5:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93d02032  ! 53: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x83d02031  ! 54: Tcc_I	te	icc_or_xcc, %r0 + 49
splash_htba_6:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 55: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x83d02035  ! 56: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_tba_7:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 57: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9024d4  ! 58: WRPR_PSTATE_I	wrpr	%r0, 0x04d4, %pstate
	.word 0x87902225  ! 59: WRPR_TT_I	wrpr	%r0, 0x0225, %tt
	.word 0x8d902eda  ! 60: WRPR_PSTATE_I	wrpr	%r0, 0x0eda, %pstate
	.word 0xcc9fe001  ! 61: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	.word 0x9f802001  ! 62: SIR	sir	0x0001
DS_8:
	.word 0x22800001  ! 64: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 63: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d902a0e  ! 64: WRPR_PSTATE_I	wrpr	%r0, 0x0a0e, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 65: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 66: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xb2d88012  ! 67: SMULcc_R	smulcc 	%r2, %r18, %r25
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 68: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xb4d52001  ! 69: UMULcc_I	umulcc 	%r20, 0x0001, %r26
splash_tba_9:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 70: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf4c804a0  ! 71: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r26
	.word 0xa1a48d25  ! 72: FsMULd	fsmuld	%f18, %f36, %f16
	ta	T_CHANGE_PRIV	! macro
	.word 0x93508000  ! 74: RDPR_TSTATE	rdpr	%tstate, %r9
	.word 0x8cd18010  ! 75: UMULcc_R	umulcc 	%r6, %r16, %r6
	ta	T_CHANGE_TO_TL0	! macro
splash_cmpr_10:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184a001  ! 77: WR_STICK_REG_I	wr	%r18, 0x0001, %-
splash_tba_11:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 78: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02035  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02031  ! 80: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xcc7fe001  ! 81: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x93902002  ! 82: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8ec6a001  ! 83: ADDCcc_I	addccc 	%r26, 0x0001, %r7
	.word 0x87902331  ! 84: WRPR_TT_I	wrpr	%r0, 0x0331, %tt
	.word 0x879020f2  ! 85: WRPR_TT_I	wrpr	%r0, 0x00f2, %tt
	.word 0x2a700001  ! 86: BPCS	<illegal instruction>
	.word 0x83540000  ! 87: RDPR_GL	rdpr	%-, %r1
	.word 0x91d02031  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x9f802001  ! 89: SIR	sir	0x0001
splash_cmpr_12:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186e001  ! 90: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0x8d902ac7  ! 91: WRPR_PSTATE_I	wrpr	%r0, 0x0ac7, %pstate
	.word 0x93902006  ! 92: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d9022d6  ! 93: WRPR_PSTATE_I	wrpr	%r0, 0x02d6, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 94: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_13:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 95: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 96: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x83d02034  ! 97: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x93902007  ! 98: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d9022d2  ! 99: WRPR_PSTATE_I	wrpr	%r0, 0x02d2, %pstate
change_to_tl1_14:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d9026d0  ! 101: WRPR_PSTATE_I	wrpr	%r0, 0x06d0, %pstate
	.word 0xc28008a0  ! 102: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x91d02033  ! 103: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x964a4013  ! 104: MULX_R	mulx 	%r9, %r19, %r11
	.word 0x93902005  ! 105: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93d02034  ! 106: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_lsu_15:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 107: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_cmpr_16:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1846001  ! 108: WR_STICK_REG_I	wr	%r17, 0x0001, %-
	.word 0x8d902055  ! 109: WRPR_PSTATE_I	wrpr	%r0, 0x0055, %pstate
	.word 0x87902085  ! 110: WRPR_TT_I	wrpr	%r0, 0x0085, %tt
	.word 0x87902298  ! 111: WRPR_TT_I	wrpr	%r0, 0x0298, %tt
	.word 0x8d90244d  ! 112: WRPR_PSTATE_I	wrpr	%r0, 0x044d, %pstate
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 113: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_17:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 115: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181a001  ! 114: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x93902002  ! 115: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x85540000  ! 116: RDPR_GL	rdpr	%-, %r2
	.word 0xa190200c  ! 117: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x964a4015  ! 118: MULX_R	mulx 	%r9, %r21, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 120: SIR	sir	0x0001
	.word 0x8d9026db  ! 121: WRPR_PSTATE_I	wrpr	%r0, 0x06db, %pstate
	.word 0x826b2001  ! 122: UDIVX_I	udivx 	%r12, 0x0001, %r1
	.word 0xa190200f  ! 123: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xc2cfe020  ! 124: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r1
	.word 0x91d02030  ! 125: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x97a689a2  ! 126: FDIVs	fdivs	%f26, %f2, %f11
	.word 0xb3540000  ! 127: RDPR_GL	rdpr	%-, %r25
	.word 0x81982097  ! 128: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0097, %hpstate
splash_tba_18:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 129: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200b  ! 130: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 131: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_19:
	.word 0x32800001  ! 133: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 133: BE	be,a	<label_0x1>
	.word 0x97a0054a  ! 133: FSQRTd	fsqrt	
	.word 0xa5a6483a  ! 132: FADDs	fadds	%f25, %f26, %f18
	.word 0x93902001  ! 133: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x80c2e001  ! 134: ADDCcc_I	addccc 	%r11, 0x0001, %r0
	.word 0x8b504000  ! 135: RDPR_TNPC	rdpr	%tnpc, %r5
change_to_tl1_20:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xca7fe001  ! 137: SWAP_I	swap	%r5, [%r31 + 0x0001]
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcac004a0  ! 139: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0x93902005  ! 140: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_htba_21:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 141: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02033  ! 142: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa2852001  ! 143: ADDcc_I	addcc 	%r20, 0x0001, %r17
	.word 0xe2ffc03a  ! 144: SWAPA_R	swapa	%r17, [%r31 + %r26] 0x01
	.word 0x8d802004  ! 145: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802088  ! 146: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x3e700001  ! 147: BPVC	<illegal instruction>
	.word 0x8d902c50  ! 148: WRPR_PSTATE_I	wrpr	%r0, 0x0c50, %pstate
	.word 0xa190200a  ! 149: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 150: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 151: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xacc5e001  ! 152: ADDCcc_I	addccc 	%r23, 0x0001, %r22
	.word 0x93508000  ! 153: RDPR_TSTATE	rdpr	%tstate, %r9
	.word 0x81982314  ! 154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0314, %hpstate
	.word 0xd27fe001  ! 155: SWAP_I	swap	%r9, [%r31 + 0x0001]
	.word 0xd2d80e40  ! 156: LDXA_R	ldxa	[%r0, %r0] 0x72, %r9
	.word 0xa1902008  ! 157: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd3e7c03a  ! 158: CASA_I	casa	[%r31] 0x 1, %r26, %r9
	.word 0xd2800b40  ! 159: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r9
	.word 0x93902004  ! 160: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902007  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87902216  ! 162: WRPR_TT_I	wrpr	%r0, 0x0216, %tt
	.word 0x819826c4  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c4, %hpstate
splash_htba_22:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 164: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x81464000  ! 165: RD_STICK_CMPR_REG	stbar
	.word 0xab702001  ! 166: POPC_I	popc	0x0001, %r21
splash_lsu_23:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 167: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xead804a0  ! 168: LDXA_R	ldxa	[%r0, %r0] 0x25, %r21
	.word 0x9bb1cff5  ! 169: FONES	fones	%f13
	.word 0xa190200f  ! 170: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa190200d  ! 171: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87802016  ! 172: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81982e54  ! 173: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e54, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 174: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdadfe010  ! 175: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x93902005  ! 176: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
change_to_tl1_24:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xdad004a0  ! 178: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xda8008a0  ! 179: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
splash_cmpr_25:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 181: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1826001  ! 180: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 181: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_26:
	.word 0x34800001  ! 183: BG	bg,a	<label_0x1>
	illtrap
	.word 0x99a0054d  ! 183: FSQRTd	fsqrt	
	.word 0xa7a1c82c  ! 182: FADDs	fadds	%f7, %f12, %f19
	.word 0x9751c000  ! 183: RDPR_TL	<illegal instruction>
splash_lsu_27:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 184: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902299  ! 185: WRPR_TT_I	wrpr	%r0, 0x0299, %tt
	.word 0x99902000  ! 186: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xd6d004a0  ! 187: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
splash_cmpr_28:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 188: WR_STICK_REG_I	wr	%r7, 0x0001, %-
DS_29:
	.word 0x22800001  ! 190: BE	be,a	<label_0x1>
	pdist %f0, %f2, %f12
	.word 0xadb6430a  ! 189: ALLIGNADDRESS	alignaddr	%r25, %r10, %r22
	.word 0x87902123  ! 190: WRPR_TT_I	wrpr	%r0, 0x0123, %tt
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 191: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982b0e  ! 192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0e, %hpstate
	.word 0x8945c000  ! 193: RD_TICK_CMPR_REG	rd	%-, %r4
	.word 0xc88008a0  ! 194: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc81fc000  ! 195: LDD_R	ldd	[%r31 + %r0], %r4
splash_cmpr_30:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 196: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0x87902371  ! 197: WRPR_TT_I	wrpr	%r0, 0x0371, %tt
	.word 0x91d02033  ! 198: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_cmpr_31:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 200: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184a001  ! 199: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0x95480000  ! 200: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
DS_32:
	.word 0x34800001  ! 202: BG	bg,a	<label_0x1>
	pdist %f6, %f4, %f10
	.word 0xa9b58316  ! 201: ALLIGNADDRESS	alignaddr	%r22, %r22, %r20
	.word 0x8d90200e  ! 202: WRPR_PSTATE_I	wrpr	%r0, 0x000e, %pstate
	.word 0x8945c000  ! 203: RD_TICK_CMPR_REG	rd	%-, %r4
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 204: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 205: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93d02031  ! 206: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xc897e010  ! 207: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r4
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 208: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83a00563  ! 209: FSQRTq	fsqrt	
splash_cmpr_33:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 211: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1846001  ! 210: WR_STICK_REG_I	wr	%r17, 0x0001, %-
	.word 0x87902209  ! 211: WRPR_TT_I	wrpr	%r0, 0x0209, %tt
	.word 0xa1902002  ! 212: WRPR_GL_I	wrpr	%r0, 0x0002, %-
DS_34:
	.word 0x22800001  ! 214: BE	be,a	<label_0x1>
	.word 0xf5350008  ! 214: STQF_R	-	%f26, [%r8, %r20]
	normalw
	.word 0xa9458000  ! 213: RD_SOFTINT_REG	rd	%softint, %r20
DS_35:
	.word 0x32800001  ! 215: BNE	bne,a	<label_0x1>
	.word 0xd130e001  ! 215: STQF_I	-	%f8, [0x0001, %r3]
	normalw
	.word 0xab458000  ! 214: RD_SOFTINT_REG	rd	%softint, %r21
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_36:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 216: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa190200d  ! 217: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x99a0056c  ! 218: FSQRTq	fsqrt	
	.word 0x8198210c  ! 219: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010c, %hpstate
	.word 0x8d504000  ! 220: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0x879020ab  ! 221: WRPR_TT_I	wrpr	%r0, 0x00ab, %tt
	.word 0x32700001  ! 222: BPNE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x819829d5  ! 224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d5, %hpstate
	.word 0xccd7e000  ! 225: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r6
	.word 0x8d902a9e  ! 226: WRPR_PSTATE_I	wrpr	%r0, 0x0a9e, %pstate
	.word 0x87802014  ! 227: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8790218e  ! 228: WRPR_TT_I	wrpr	%r0, 0x018e, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902000  ! 230: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87802014  ! 231: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x22800001  ! 232: BE	be,a	<label_0x1>
	.word 0x87480000  ! 233: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0x93902005  ! 234: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa190200e  ! 235: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x879020e1  ! 236: WRPR_TT_I	wrpr	%r0, 0x00e1, %tt
	.word 0x81982f1f  ! 237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1f, %hpstate
	.word 0x8d902447  ! 238: WRPR_PSTATE_I	wrpr	%r0, 0x0447, %pstate
	.word 0x87802004  ! 239: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91494000  ! 240: RDHPR_HTBA	rdhpr	%htba, %r8
splash_cmpr_37:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 242: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1846001  ! 241: WR_STICK_REG_I	wr	%r17, 0x0001, %-
	.word 0x93d02034  ! 242: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa1a249ea  ! 243: FDIVq	dis not found

reduce_priv_level_38:
	.word 0x8f902000  ! 245: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1808013  ! 244: WR_STICK_REG_R	wr	%r2, %r19, %-
	.word 0x8d902c1d  ! 245: WRPR_PSTATE_I	wrpr	%r0, 0x0c1d, %pstate
	.word 0x8198255f  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055f, %hpstate
	.word 0xe08008a0  ! 247: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8d902a15  ! 248: WRPR_PSTATE_I	wrpr	%r0, 0x0a15, %pstate
DS_39:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 249: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x93500000  ! 250: RDPR_TPC	rdpr	%tpc, %r9
	.word 0xd21fe001  ! 251: LDD_I	ldd	[%r31 + 0x0001], %r9
splash_htba_40:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 252: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802000  ! 253: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879021ee  ! 254: WRPR_TT_I	wrpr	%r0, 0x01ee, %tt
	.word 0x89a00543  ! 255: FSQRTd	fsqrt	
	.word 0x93902007  ! 256: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x879023df  ! 257: WRPR_TT_I	wrpr	%r0, 0x03df, %tt
	.word 0xb751c000  ! 258: RDPR_TL	rdpr	%tl, %r27
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa7a01a6a  ! 260: FqTOi	fqtoi	
	.word 0x87902378  ! 261: WRPR_TT_I	wrpr	%r0, 0x0378, %tt
	.word 0x81982d8d  ! 262: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8d, %hpstate
	.word 0x95a289c3  ! 263: FDIVd	fdivd	%f10, %f34, %f10
	.word 0xd4c804a0  ! 264: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
change_to_tl1_41:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91508000  ! 266: RDPR_TSTATE	rdpr	%tstate, %r8
	.word 0x91d02030  ! 267: Tcc_I	ta	icc_or_xcc, %r0 + 48
change_to_tl1_42:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa190200a  ! 269: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 270: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902e98  ! 271: WRPR_PSTATE_I	wrpr	%r0, 0x0e98, %pstate
DS_43:
	.word 0x34800001  ! 273: BG	bg,a	<label_0x1>
	pdist %f10, %f16, %f10
	.word 0x93b0c309  ! 272: ALLIGNADDRESS	alignaddr	%r3, %r9, %r9
	.word 0xd247c000  ! 273: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0xd21fc000  ! 274: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0xa8ab000d  ! 275: ANDNcc_R	andncc 	%r12, %r13, %r20
	.word 0xe89004a0  ! 276: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0xe88008a0  ! 277: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x87902235  ! 278: WRPR_TT_I	wrpr	%r0, 0x0235, %tt
reduce_priv_level_44:
	.word 0x8f902001  ! 280: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89858000  ! 279: WRTICK_R	wr	%r22, %r0, %tick
	.word 0x8d90281f  ! 280: WRPR_PSTATE_I	wrpr	%r0, 0x081f, %pstate
	.word 0xa8494017  ! 281: MULX_R	mulx 	%r5, %r23, %r20
	.word 0x8d902ecf  ! 282: WRPR_PSTATE_I	wrpr	%r0, 0x0ecf, %pstate
	.word 0xe8cfe030  ! 283: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r20
	.word 0x32800001  ! 284: BNE	bne,a	<label_0x1>
	.word 0x93902001  ! 285: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902001  ! 286: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
reduce_priv_level_45:
	.word 0x8f902000  ! 288: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83682001  ! 287: SDIVX_I	sdivx	%r0, 0x0001, %r1
	.word 0x34800001  ! 288: BG	bg,a	<label_0x1>
	.word 0x93902003  ! 289: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc22fe001  ! 290: STB_I	stb	%r1, [%r31 + 0x0001]
	.word 0x93a00553  ! 291: FSQRTd	fsqrt	
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 292: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 293: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d90240a  ! 294: WRPR_PSTATE_I	wrpr	%r0, 0x040a, %pstate
	.word 0x879021bd  ! 295: WRPR_TT_I	wrpr	%r0, 0x01bd, %tt
	.word 0xa1902005  ! 296: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81982306  ! 297: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0306, %hpstate
change_to_randtl_46:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 298: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902003  ! 299: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x83d02032  ! 300: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_tba_47:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 301: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd2800aa0  ! 302: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r9
	.word 0x91d02031  ! 303: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d902aca  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x0aca, %pstate
	.word 0x8d802004  ! 305: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8198239f  ! 306: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039f, %hpstate
	.word 0x91d02032  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x95a249e3  ! 308: FDIVq	dis not found

	.word 0xb6d02001  ! 309: UMULcc_I	umulcc 	%r0, 0x0001, %r27
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902009  ! 311: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902003  ! 312: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91a249da  ! 313: FDIVd	fdivd	%f40, %f26, %f8
	.word 0xd1e7c03a  ! 314: CASA_I	casa	[%r31] 0x 1, %r26, %r8
	.word 0xa1902007  ! 315: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93902004  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8790204b  ! 317: WRPR_TT_I	wrpr	%r0, 0x004b, %tt
	.word 0xa190200a  ! 318: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87902119  ! 319: WRPR_TT_I	wrpr	%r0, 0x0119, %tt
	.word 0x93902005  ! 320: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f802001  ! 321: SIR	sir	0x0001
	.word 0x8ad9c003  ! 322: SMULcc_R	smulcc 	%r7, %r3, %r5
splash_htba_48:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 323: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcac804a0  ! 324: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
	.word 0xa1902003  ! 325: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902007  ! 327: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xb080a001  ! 328: ADDcc_I	addcc 	%r2, 0x0001, %r24
	.word 0x83d02032  ! 329: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x81982a57  ! 330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a57, %hpstate
	.word 0xf007e001  ! 331: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0x819828c5  ! 332: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c5, %hpstate
	.word 0x91d02035  ! 333: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902688  ! 334: WRPR_PSTATE_I	wrpr	%r0, 0x0688, %pstate
	.word 0xf1e7c023  ! 335: CASA_I	casa	[%r31] 0x 1, %r3, %r24
	.word 0xa1902004  ! 336: WRPR_GL_I	wrpr	%r0, 0x0004, %-
DS_49:
	.word 0x20800001  ! 338: BN	bn,a	<label_0x1>
	pdist %f16, %f16, %f18
	.word 0x91b24307  ! 337: ALLIGNADDRESS	alignaddr	%r9, %r7, %r8
	.word 0x91d02033  ! 338: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa190200a  ! 339: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d902843  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x0843, %pstate
	.word 0xd0ffc027  ! 341: SWAPA_R	swapa	%r8, [%r31 + %r7] 0x01
	.word 0xa190200a  ! 342: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xa1902004  ! 343: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x99902001  ! 344: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x91494000  ! 345: RDHPR_HTBA	rdhpr	%htba, %r8
splash_cmpr_50:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1802001  ! 346: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	.word 0x87902280  ! 347: WRPR_TT_I	wrpr	%r0, 0x0280, %tt
	.word 0x8d802000  ! 348: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83d02034  ! 349: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d902a8d  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x0a8d, %pstate
	.word 0x8790238c  ! 351: WRPR_TT_I	wrpr	%r0, 0x038c, %tt
	.word 0x879023dd  ! 352: WRPR_TT_I	wrpr	%r0, 0x03dd, %tt
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 353: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_51:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 355: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1826001  ! 354: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0x8ea90013  ! 355: ANDNcc_R	andncc 	%r4, %r19, %r7
	.word 0xa3464000  ! 356: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0x8d902cc3  ! 357: WRPR_PSTATE_I	wrpr	%r0, 0x0cc3, %pstate
	.word 0x81982f44  ! 358: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f44, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xe2ffc033  ! 360: SWAPA_R	swapa	%r17, [%r31 + %r19] 0x01
splash_lsu_52:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 361: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x879022ee  ! 362: WRPR_TT_I	wrpr	%r0, 0x02ee, %tt
	.word 0xe28fe010  ! 363: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
	.word 0x94804010  ! 364: ADDcc_R	addcc 	%r1, %r16, %r10
	.word 0x81982784  ! 365: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0784, %hpstate
	.word 0xd4d804a0  ! 366: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x9480c011  ! 367: ADDcc_R	addcc 	%r3, %r17, %r10
	.word 0xb351c000  ! 368: RDPR_TL	rdpr	%tl, %r25
	.word 0x9f802001  ! 369: SIR	sir	0x0001
	.word 0x81a00543  ! 370: FSQRTd	fsqrt	
	.word 0x93902001  ! 371: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87504000  ! 372: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x2a700001  ! 373: BPCS	<illegal instruction>
reduce_priv_level_53:
	.word 0x8f902001  ! 375: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89834011  ! 374: WRTICK_R	wr	%r13, %r17, %tick
	.word 0x8198259c  ! 375: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059c, %hpstate
splash_tba_54:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 376: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8ef96001  ! 377: SDIVcc_I	sdivcc 	%r5, 0x0001, %r7
	.word 0x8d90281c  ! 378: WRPR_PSTATE_I	wrpr	%r0, 0x081c, %pstate
splash_cmpr_55:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 380: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184a001  ! 379: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0xab504000  ! 380: RDPR_TNPC	<illegal instruction>
	.word 0x879022f3  ! 381: WRPR_TT_I	wrpr	%r0, 0x02f3, %tt
reduce_priv_level_56:
	.word 0x8f902002  ! 383: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb7a0196b  ! 382: FqTOd	dis not found

splash_cmpr_57:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 384: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb185a001  ! 383: WR_STICK_REG_I	wr	%r22, 0x0001, %-
	.word 0x8d902610  ! 384: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	.word 0xf637c00b  ! 385: STH_R	sth	%r27, [%r31 + %r11]
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 386: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 387: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_htba_58:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 388: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xad45c000  ! 389: RD_TICK_CMPR_REG	rd	%-, %r22
	.word 0x81982886  ! 390: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0886, %hpstate
	.word 0xaba309db  ! 391: FDIVd	fdivd	%f12, %f58, %f52
	.word 0x81460000  ! 392: RD_STICK_REG	stbar
	.word 0xeacfe030  ! 393: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r21
	.word 0x8d902a5a  ! 394: WRPR_PSTATE_I	wrpr	%r0, 0x0a5a, %pstate
	.word 0xb151c000  ! 395: RDPR_TL	rdpr	%tl, %r24
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902006  ! 397: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982904  ! 398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0904, %hpstate
	.word 0x8d902a19  ! 399: WRPR_PSTATE_I	wrpr	%r0, 0x0a19, %pstate
	.word 0x91d02030  ! 400: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x819828cf  ! 401: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cf, %hpstate
splash_tba_59:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 402: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x83d02032  ! 403: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xf0800c00  ! 404: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r24
	.word 0x87902100  ! 405: WRPR_TT_I	wrpr	%r0, 0x0100, %tt
splash_cmpr_60:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1802001  ! 406: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 407: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xf047c000  ! 408: LDSW_R	ldsw	[%r31 + %r0], %r24
	.word 0x93902002  ! 409: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902007  ! 410: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8da60dc9  ! 411: FdMULq	fdmulq	
DS_61:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 412: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x83d02032  ! 413: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xa190200c  ! 414: WRPR_GL_I	wrpr	%r0, 0x000c, %-
DS_62:
	.word 0x34800001  ! 416: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 415: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d902a53  ! 416: WRPR_PSTATE_I	wrpr	%r0, 0x0a53, %pstate
	.word 0xcc1fe001  ! 417: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x91d02030  ! 418: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902005  ! 419: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xcc8008a0  ! 420: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
change_to_randtl_63:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 421: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xcc8008a0  ! 422: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xcc8008a0  ! 423: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xa190200c  ! 424: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x879020dc  ! 425: WRPR_TT_I	wrpr	%r0, 0x00dc, %tt
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 426: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xcc900e60  ! 427: LDUHA_R	lduha	[%r0, %r0] 0x73, %r6
	.word 0x9282a001  ! 428: ADDcc_I	addcc 	%r10, 0x0001, %r9
	.word 0x8d902ec6  ! 429: WRPR_PSTATE_I	wrpr	%r0, 0x0ec6, %pstate
	.word 0x8d902689  ! 430: WRPR_PSTATE_I	wrpr	%r0, 0x0689, %pstate
	.word 0x879022b6  ! 431: WRPR_TT_I	wrpr	%r0, 0x02b6, %tt
	.word 0xd247e001  ! 432: LDSW_I	ldsw	[%r31 + 0x0001], %r9
	.word 0xb680c015  ! 433: ADDcc_R	addcc 	%r3, %r21, %r27
	.word 0xf68fe010  ! 434: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r27
	.word 0xf68008a0  ! 435: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
	.word 0x95a01a74  ! 436: FqTOi	fqtoi	
	.word 0x8d902c47  ! 437: WRPR_PSTATE_I	wrpr	%r0, 0x0c47, %pstate
DS_64:
	.word 0x22800001  ! 439: BE	be,a	<label_0x1>
	illtrap
	.word 0xc512800a  ! 439: LDQF_R	-	[%r10, %r10], %f2
	.word 0xa5a14825  ! 438: FADDs	fadds	%f5, %f5, %f18
	.word 0x99a2cd39  ! 439: FsMULd	fsmuld	%f11, %f56, %f12
	.word 0xd927c019  ! 440: STF_R	st	%f12, [%r25, %r31]
	.word 0x87802016  ! 441: WRASI_I	wr	%r0, 0x0016, %asi
DS_65:
	.word 0x34800001  ! 443: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 442: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02035  ! 443: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd87fe001  ! 444: SWAP_I	swap	%r12, [%r31 + 0x0001]
reduce_priv_level_66:
	.word 0x8f902000  ! 446: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8980c008  ! 445: WRTICK_R	wr	%r3, %r8, %tick
	.word 0xb36ac000  ! 446: SDIVX_R	sdivx	%r11, %r0, %r25
	.word 0x93902007  ! 447: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_67:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 448: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 449: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 450: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902003  ! 451: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8fa0057a  ! 452: FSQRTq	fsqrt	
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 453: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_68:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 454: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90240a  ! 455: WRPR_PSTATE_I	wrpr	%r0, 0x040a, %pstate
	.word 0x81a01a6b  ! 456: FqTOi	fqtoi	
	.word 0xc0ffc02b  ! 457: SWAPA_R	swapa	%r0, [%r31 + %r11] 0x01
	.word 0x93d02030  ! 458: Tcc_I	tne	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902009  ! 460: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa1902002  ! 461: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x98acc008  ! 462: ANDNcc_R	andncc 	%r19, %r8, %r12
	.word 0x9f802001  ! 463: SIR	sir	0x0001
	.word 0x93902007  ! 464: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_69:
	.word 0x22800001  ! 466: BE	be,a	<label_0x1>
	.word 0xf1334006  ! 466: STQF_R	-	%f24, [%r6, %r13]
	normalw
	.word 0xa3458000  ! 465: RD_SOFTINT_REG	rd	%softint, %r17
DS_70:
	.word 0x20800001  ! 467: BN	bn,a	<label_0x1>
	.word 0xc932c006  ! 467: STQF_R	-	%f4, [%r6, %r11]
	normalw
	.word 0x95458000  ! 466: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xd4c004a0  ! 467: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd4800a80  ! 469: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r10
	.word 0xa1902007  ! 470: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87802004  ! 471: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87902309  ! 472: WRPR_TT_I	wrpr	%r0, 0x0309, %tt
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 473: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 474: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x91d02030  ! 475: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x87500000  ! 476: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x97702001  ! 477: POPC_I	popc	0x0001, %r11
change_to_randtl_71:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 478: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 479: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xb3a00557  ! 480: FSQRTd	fsqrt	
	.word 0xb282e001  ! 481: ADDcc_I	addcc 	%r11, 0x0001, %r25
	.word 0x93902002  ! 482: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_72:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 483: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_73:
	.word 0x32800001  ! 485: BNE	bne,a	<label_0x1>
	.word 0xcb322001  ! 485: STQF_I	-	%f5, [0x0001, %r8]
	normalw
	.word 0x8d458000  ! 484: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcc4fc000  ! 485: LDSB_R	ldsb	[%r31 + %r0], %r6
DS_74:
	.word 0x22800001  ! 487: BE	be,a	<label_0x1>
	pdist %f8, %f2, %f30
	.word 0xb7b48300  ! 486: ALLIGNADDRESS	alignaddr	%r18, %r0, %r27
	.word 0x80696001  ! 487: UDIVX_I	udivx 	%r5, 0x0001, %r0
	.word 0xada00572  ! 488: FSQRTq	fsqrt	
	.word 0x8d90284b  ! 489: WRPR_PSTATE_I	wrpr	%r0, 0x084b, %pstate
	.word 0x83b6cfed  ! 490: FONES	fones	%f1
	.word 0x87902387  ! 491: WRPR_TT_I	wrpr	%r0, 0x0387, %tt
	.word 0x8cd36001  ! 492: UMULcc_I	umulcc 	%r13, 0x0001, %r6
	.word 0x81982c8e  ! 493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8e, %hpstate
DS_75:
	.word 0x34800001  ! 495: BG	bg,a	<label_0x1>
	.word 0xcf362001  ! 495: STQF_I	-	%f7, [0x0001, %r24]
	normalw
	.word 0xa3458000  ! 494: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0xa1902001  ! 495: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xe327c00d  ! 496: STF_R	st	%f17, [%r13, %r31]
	.word 0x966ae001  ! 497: UDIVX_I	udivx 	%r11, 0x0001, %r11
	.word 0x8d90201e  ! 498: WRPR_PSTATE_I	wrpr	%r0, 0x001e, %pstate
	.word 0x81982787  ! 499: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0787, %hpstate
	.word 0xa190200b  ! 500: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd69004a0  ! 501: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
splash_htba_76:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 502: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902441  ! 503: WRPR_PSTATE_I	wrpr	%r0, 0x0441, %pstate
DS_77:
	.word 0x32800001  ! 505: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 505: BN	bn,a	<label_0x1>
	.word 0xf5114008  ! 505: LDQF_R	-	[%r5, %r8], %f26
	.word 0x93a6883b  ! 504: FADDs	fadds	%f26, %f27, %f9
	.word 0xaa864002  ! 505: ADDcc_R	addcc 	%r25, %r2, %r21
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 506: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x30800001  ! 507: BA	ba,a	<label_0x1>
	.word 0x8790232b  ! 508: WRPR_TT_I	wrpr	%r0, 0x032b, %tt
	.word 0x83d02035  ! 509: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xeb3fe001  ! 510: STDF_I	std	%f21, [0x0001, %r31]
	.word 0x91d02030  ! 511: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93d02030  ! 512: Tcc_I	tne	icc_or_xcc, %r0 + 48
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 513: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_78:
	.word 0x22800001  ! 515: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 514: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x96682001  ! 515: UDIVX_I	udivx 	%r0, 0x0001, %r11
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 516: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 517: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802089  ! 519: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x9945c000  ! 520: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0x9f802001  ! 521: SIR	sir	0x0001
	.word 0x83480000  ! 522: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0x87802004  ! 523: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x84806001  ! 524: ADDcc_I	addcc 	%r1, 0x0001, %r2
	.word 0xc4c7e000  ! 525: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r2
	.word 0x99902001  ! 526: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_lsu_79:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 527: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_80:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 528: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200e  ! 529: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x964a4017  ! 530: MULX_R	mulx 	%r9, %r23, %r11
	.word 0xd737c017  ! 531: STQF_R	-	%f11, [%r23, %r31]
	.word 0x8198215f  ! 532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015f, %hpstate
	.word 0xad540000  ! 533: RDPR_GL	rdpr	%-, %r22
	.word 0x91d02032  ! 534: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xec1fe001  ! 535: LDD_I	ldd	[%r31 + 0x0001], %r22
	.word 0x91d02030  ! 536: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8790221f  ! 537: WRPR_TT_I	wrpr	%r0, 0x021f, %tt
	.word 0xecd80e60  ! 538: LDXA_R	ldxa	[%r0, %r0] 0x73, %r22
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 539: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_81:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 540: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8198289d  ! 541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089d, %hpstate
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 542: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xecdfe010  ! 543: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r22
DS_82:
	.word 0x20800001  ! 545: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 544: SAVE_R	save	%r31, %r0, %r31
	.word 0x93902005  ! 545: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
change_to_tl1_83:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02035  ! 547: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x2c800001  ! 548: BNEG	bneg,a	<label_0x1>
	.word 0x81460000  ! 549: RD_STICK_REG	stbar
	.word 0x95480000  ! 550: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x8ec2e001  ! 551: ADDCcc_I	addccc 	%r11, 0x0001, %r7
	.word 0x91d02030  ! 552: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xced80e60  ! 553: LDXA_R	ldxa	[%r0, %r0] 0x73, %r7
	.word 0x81982544  ! 554: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0544, %hpstate
DS_84:
	.word 0x20800001  ! 556: BN	bn,a	<label_0x1>
	allclean
	.word 0xabb40304  ! 555: ALLIGNADDRESS	alignaddr	%r16, %r4, %r21
	.word 0x89702001  ! 556: POPC_I	popc	0x0001, %r4
	.word 0x8d802000  ! 557: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902457  ! 558: WRPR_PSTATE_I	wrpr	%r0, 0x0457, %pstate
	.word 0x8780201c  ! 559: WRASI_I	wr	%r0, 0x001c, %asi
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 560: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_85:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 561: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90244c  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x044c, %pstate
DS_86:
	.word 0x32800001  ! 564: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 563: SAVE_R	save	%r31, %r0, %r31
	.word 0x93902000  ! 564: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902003  ! 565: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_TO_TL0	! macro
change_to_randtl_87:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 567: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x8198225d  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025d, %hpstate
	.word 0x9b500000  ! 569: RDPR_TPC	rdpr	%tpc, %r13
DS_88:
	.word 0x32800001  ! 571: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xc711400c  ! 571: LDQF_R	-	[%r5, %r12], %f3
	.word 0x8ba0c82b  ! 570: FADDs	fadds	%f3, %f11, %f5
	.word 0x85a18d39  ! 571: FsMULd	fsmuld	%f6, %f56, %f2
	.word 0xa190200f  ! 572: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 573: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879022cf  ! 574: WRPR_TT_I	wrpr	%r0, 0x02cf, %tt
	.word 0x91d02035  ! 575: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902000  ! 576: WRPR_GL_I	wrpr	%r0, 0x0000, %-
change_to_tl1_89:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1480000  ! 578: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
splash_lsu_90:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 579: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 580: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87902182  ! 581: WRPR_TT_I	wrpr	%r0, 0x0182, %tt
	.word 0xa4d08002  ! 582: UMULcc_R	umulcc 	%r2, %r2, %r18
	.word 0x91a00543  ! 583: FSQRTd	fsqrt	
	.word 0x8790207f  ! 584: WRPR_TT_I	wrpr	%r0, 0x007f, %tt
	.word 0x8198295e  ! 585: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095e, %hpstate
	.word 0xd097e020  ! 586: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r8
	.word 0x91d02035  ! 587: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02034  ! 588: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8a4a0016  ! 589: MULX_R	mulx 	%r8, %r22, %r5
	.word 0x8198258f  ! 590: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058f, %hpstate
	.word 0xcabfe001  ! 591: STDA_I	stda	%r5, [%r31 + 0x0001] %asi
	.word 0x9b504000  ! 592: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x87902357  ! 593: WRPR_TT_I	wrpr	%r0, 0x0357, %tt
splash_lsu_91:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 594: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xda97e000  ! 595: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
DS_92:
	.word 0x22800001  ! 597: BE	be,a	<label_0x1>
	illtrap
	.word 0x95a0055b  ! 597: FSQRTd	fsqrt	
	.word 0x97a20824  ! 596: FADDs	fadds	%f8, %f4, %f11
	.word 0x93a00543  ! 597: FSQRTd	fsqrt	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02031  ! 599: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87802014  ! 600: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902004  ! 601: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd2d804a0  ! 602: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0x93902003  ! 603: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x9a48c00b  ! 604: MULX_R	mulx 	%r3, %r11, %r13
	.word 0x87902370  ! 605: WRPR_TT_I	wrpr	%r0, 0x0370, %tt
DS_93:
	.word 0x20800001  ! 607: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 606: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902006  ! 607: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_94:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 608: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d902211  ! 609: WRPR_PSTATE_I	wrpr	%r0, 0x0211, %pstate
splash_tba_95:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 610: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91a10d34  ! 611: FsMULd	fsmuld	%f4, %f20, %f8
	.word 0xd08fe020  ! 612: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r8
	.word 0xd08804a0  ! 613: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
change_to_tl1_96:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 615: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 616: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198268d  ! 617: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068d, %hpstate
	.word 0xa1902004  ! 618: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 619: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd08008a0  ! 620: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 621: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 622: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87a289ad  ! 623: FDIVs	fdivs	%f10, %f13, %f3
	.word 0xc6800c20  ! 624: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r3
	.word 0x87902254  ! 625: WRPR_TT_I	wrpr	%r0, 0x0254, %tt
	.word 0x879021e9  ! 626: WRPR_TT_I	wrpr	%r0, 0x01e9, %tt
	.word 0x81982295  ! 627: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0295, %hpstate
	.word 0x93902001  ! 628: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa9540000  ! 629: RDPR_GL	rdpr	%-, %r20
splash_cmpr_97:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 631: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1862001  ! 630: WR_STICK_REG_I	wr	%r24, 0x0001, %-
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 631: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_98:
	.word 0x34800001  ! 633: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8da00544  ! 633: FSQRTd	fsqrt	
	.word 0x87a6082d  ! 632: FADDs	fadds	%f24, %f13, %f3
	.word 0x99902001  ! 633: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xb545c000  ! 634: RD_TICK_CMPR_REG	rd	%-, %r26
	.word 0xa9a000c3  ! 635: FNEGd	fnegd	%f34, %f20
reduce_priv_level_99:
	.word 0x8f902001  ! 637: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 636: SIAM	siam	1
	.word 0x8d902810  ! 637: WRPR_PSTATE_I	wrpr	%r0, 0x0810, %pstate
	.word 0x81982d5e  ! 638: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5e, %hpstate
	.word 0xe937e001  ! 639: STQF_I	-	%f20, [0x0001, %r31]
	.word 0x32800001  ! 640: BNE	bne,a	<label_0x1>
	.word 0xa1902003  ! 641: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xb145c000  ! 642: RD_TICK_CMPR_REG	rd	%-, %r24
	.word 0x8198271e  ! 643: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071e, %hpstate
	.word 0x81982c07  ! 644: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c07, %hpstate
splash_lsu_100:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 645: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8198244d  ! 646: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044d, %hpstate
	.word 0x87802080  ! 647: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8790207d  ! 648: WRPR_TT_I	wrpr	%r0, 0x007d, %tt
	.word 0x9150c000  ! 649: RDPR_TT	rdpr	%tt, %r8
	.word 0x93902005  ! 650: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90261f  ! 652: WRPR_PSTATE_I	wrpr	%r0, 0x061f, %pstate
	.word 0xa190200d  ! 653: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd0d804a0  ! 654: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
splash_htba_101:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 655: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_102:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 656: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_tl1_103:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_104:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 658: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xaba000c3  ! 659: FNEGd	fnegd	%f34, %f52
DS_105:
	.word 0x22800001  ! 661: BE	be,a	<label_0x1>
	.word 0xef346001  ! 661: STQF_I	-	%f23, [0x0001, %r17]
	normalw
	.word 0x97458000  ! 660: RD_SOFTINT_REG	rd	%softint, %r11
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 661: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d90260d  ! 662: WRPR_PSTATE_I	wrpr	%r0, 0x060d, %pstate
	.word 0x8d902a13  ! 663: WRPR_PSTATE_I	wrpr	%r0, 0x0a13, %pstate
	.word 0x97a009ec  ! 664: FDIVq	dis not found

	.word 0xaba18dc3  ! 665: FdMULq	fdmulq	
	.word 0xea7fe001  ! 666: SWAP_I	swap	%r21, [%r31 + 0x0001]
	.word 0xa1902001  ! 667: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 668: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902003  ! 669: WRPR_PSTATE_I	wrpr	%r0, 0x0003, %pstate
	.word 0xead80e60  ! 670: LDXA_R	ldxa	[%r0, %r0] 0x73, %r21
DS_106:
	.word 0x22800001  ! 672: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 671: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93d02031  ! 672: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x91d02034  ! 673: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x99902000  ! 674: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x93d02031  ! 675: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8d902609  ! 676: WRPR_PSTATE_I	wrpr	%r0, 0x0609, %pstate
	.word 0x8d902815  ! 677: WRPR_PSTATE_I	wrpr	%r0, 0x0815, %pstate
	.word 0x91d02032  ! 678: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xea1fe001  ! 679: LDD_I	ldd	[%r31 + 0x0001], %r21
	.word 0x8fa00565  ! 680: FSQRTq	fsqrt	
	.word 0x87a000c2  ! 681: FNEGd	fnegd	%f2, %f34
	.word 0xafa00541  ! 682: FSQRTd	fsqrt	
DS_107:
	.word 0x32800001  ! 684: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 684: BG	bg,a	<label_0x1>
	.word 0xc5104015  ! 684: LDQF_R	-	[%r1, %r21], %f2
	.word 0x95a18826  ! 683: FADDs	fadds	%f6, %f6, %f10
	.word 0x9f802001  ! 684: SIR	sir	0x0001
	.word 0x3a700001  ! 685: BPCC	<illegal instruction>
splash_htba_108:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 686: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8ba609ab  ! 687: FDIVs	fdivs	%f24, %f11, %f5
	.word 0xb2a94005  ! 688: ANDNcc_R	andncc 	%r5, %r5, %r25
	.word 0xb0fb6001  ! 689: SDIVcc_I	sdivcc 	%r13, 0x0001, %r24
	.word 0x87802010  ! 690: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x986ce001  ! 691: UDIVX_I	udivx 	%r19, 0x0001, %r12
	.word 0x91d02035  ! 692: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x82ae8018  ! 693: ANDNcc_R	andncc 	%r26, %r24, %r1
	.word 0x879023cb  ! 694: WRPR_TT_I	wrpr	%r0, 0x03cb, %tt
	.word 0x20700001  ! 695: BPN	<illegal instruction>
	.word 0x91d02032  ! 696: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc3e7c038  ! 697: CASA_I	casa	[%r31] 0x 1, %r24, %r1
	.word 0x93902005  ! 698: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d02030  ! 699: Tcc_I	ta	icc_or_xcc, %r0 + 48
DS_109:
	.word 0x34800001  ! 701: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 701: BNE	bne,a	<label_0x1>
	.word 0xe5164008  ! 701: LDQF_R	-	[%r25, %r8], %f18
	.word 0x8fa5882b  ! 700: FADDs	fadds	%f22, %f11, %f7
	.word 0x879021b7  ! 701: WRPR_TT_I	wrpr	%r0, 0x01b7, %tt
	.word 0x87902108  ! 702: WRPR_TT_I	wrpr	%r0, 0x0108, %tt
	.word 0x879020f7  ! 703: WRPR_TT_I	wrpr	%r0, 0x00f7, %tt
splash_htba_110:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 704: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x81a00556  ! 705: FSQRTd	fsqrt	
	.word 0xb1a1c9c6  ! 706: FDIVd	fdivd	%f38, %f6, %f24
	.word 0xf08804a0  ! 707: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
splash_tba_111:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 708: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d90264a  ! 709: WRPR_PSTATE_I	wrpr	%r0, 0x064a, %pstate
	.word 0x819829c7  ! 710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c7, %hpstate
	.word 0xf0800ba0  ! 711: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r24
splash_cmpr_112:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 712: WR_STICK_REG_I	wr	%r7, 0x0001, %-
splash_lsu_113:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 713: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90244f  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x044f, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 715: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xf00fe001  ! 717: LDUB_I	ldub	[%r31 + 0x0001], %r24
	.word 0x93902005  ! 718: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x819825cf  ! 719: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cf, %hpstate
	.word 0x93902006  ! 720: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87902054  ! 721: WRPR_TT_I	wrpr	%r0, 0x0054, %tt
	.word 0x81460000  ! 722: RD_STICK_REG	stbar
	.word 0x99902000  ! 723: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x83d02030  ! 724: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x89a00540  ! 725: FSQRTd	fsqrt	
	.word 0xa190200e  ! 726: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x81982c16  ! 727: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c16, %hpstate
	.word 0xa1902008  ! 728: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8b6e8003  ! 729: SDIVX_R	sdivx	%r26, %r3, %r5
	.word 0x93902001  ! 730: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 731: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91500000  ! 732: RDPR_TPC	rdpr	%tpc, %r8
	.word 0x3c800001  ! 733: BPOS	bpos,a	<label_0x1>
	.word 0x8950c000  ! 734: RDPR_TT	rdpr	%tt, %r4
	.word 0xa1902006  ! 735: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x81460000  ! 736: RD_STICK_REG	stbar
	.word 0x93902003  ! 737: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_htba_114:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 738: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8790215a  ! 739: WRPR_TT_I	wrpr	%r0, 0x015a, %tt
	.word 0xc8c804a0  ! 740: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
	.word 0x91d02034  ! 741: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 742: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x90c52001  ! 743: ADDCcc_I	addccc 	%r20, 0x0001, %r8
	.word 0x879021f8  ! 744: WRPR_TT_I	wrpr	%r0, 0x01f8, %tt
	ta	T_CHANGE_PRIV	! macro
splash_tba_115:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 746: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02030  ! 747: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x99480000  ! 748: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x93902005  ! 749: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8ba000c9  ! 750: FNEGd	fnegd	%f40, %f36
	.word 0x93902001  ! 751: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982814  ! 752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0814, %hpstate
	.word 0x97a149c0  ! 753: FDIVd	fdivd	%f36, %f0, %f42
	.word 0x93902006  ! 754: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87802010  ! 755: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd6800b80  ! 756: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
	.word 0x93902004  ! 757: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81982097  ! 758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0097, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x879023ee  ! 760: WRPR_TT_I	wrpr	%r0, 0x03ee, %tt
	.word 0x83d02035  ! 761: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x81a000d0  ! 762: FNEGd	fnegd	%f16, %f0
reduce_priv_level_116:
	.word 0x8f902001  ! 764: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1848010  ! 763: WR_STICK_REG_R	wr	%r18, %r16, %-
	.word 0x879021c2  ! 764: WRPR_TT_I	wrpr	%r0, 0x01c2, %tt
DS_117:
	.word 0x34800001  ! 766: BG	bg,a	<label_0x1>
	allclean
	.word 0x9bb1c30b  ! 765: ALLIGNADDRESS	alignaddr	%r7, %r11, %r13
	ta	T_CHANGE_TO_TL0	! macro
splash_cmpr_118:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 767: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0x8d9028ce  ! 768: WRPR_PSTATE_I	wrpr	%r0, 0x08ce, %pstate
	.word 0x87902152  ! 769: WRPR_TT_I	wrpr	%r0, 0x0152, %tt
	.word 0x91d02032  ! 770: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87902075  ! 771: WRPR_TT_I	wrpr	%r0, 0x0075, %tt
	.word 0x9f802001  ! 772: SIR	sir	0x0001
	.word 0x91d02030  ! 773: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d802000  ! 774: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 775: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 776: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8345c000  ! 777: RD_TICK_CMPR_REG	rd	%-, %r1
	.word 0x81982b05  ! 778: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b05, %hpstate
	.word 0x26800001  ! 779: BL	bl,a	<label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x87902012  ! 781: WRPR_TT_I	wrpr	%r0, 0x0012, %tt
	.word 0x8d902457  ! 782: WRPR_PSTATE_I	wrpr	%r0, 0x0457, %pstate
	.word 0x85702001  ! 783: POPC_I	popc	0x0001, %r2
	.word 0x87a00dc8  ! 784: FdMULq	fdmulq	
	.word 0x93902006  ! 785: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 786: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc737c008  ! 787: STQF_R	-	%f3, [%r8, %r31]
	.word 0x81982d8d  ! 788: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8d, %hpstate
	.word 0x91d02031  ! 789: Tcc_I	ta	icc_or_xcc, %r0 + 49
change_to_tl1_119:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x879022d5  ! 791: WRPR_TT_I	wrpr	%r0, 0x02d5, %tt
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 792: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc6ffc028  ! 793: SWAPA_R	swapa	%r3, [%r31 + %r8] 0x01
	.word 0x91d02033  ! 794: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9bb00ff5  ! 795: FONES	fones	%f13
	.word 0x8d802004  ! 796: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x83d02032  ! 797: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xdad004a0  ! 798: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 799: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9024d2  ! 800: WRPR_PSTATE_I	wrpr	%r0, 0x04d2, %pstate
	.word 0xb3a30dca  ! 801: FdMULq	fdmulq	
	.word 0x8d802000  ! 802: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f802001  ! 803: SIR	sir	0x0001
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 804: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879022ef  ! 805: WRPR_TT_I	wrpr	%r0, 0x02ef, %tt
	.word 0x81982e4c  ! 806: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4c, %hpstate
	.word 0x8d9028cd  ! 807: WRPR_PSTATE_I	wrpr	%r0, 0x08cd, %pstate
	.word 0x8d802000  ! 808: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xaafaa001  ! 809: SDIVcc_I	sdivcc 	%r10, 0x0001, %r21
	.word 0x8d902a58  ! 810: WRPR_PSTATE_I	wrpr	%r0, 0x0a58, %pstate
	.word 0x87902026  ! 811: WRPR_TT_I	wrpr	%r0, 0x0026, %tt
	.word 0x81480000  ! 812: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
splash_tba_120:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 813: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879022df  ! 814: WRPR_TT_I	wrpr	%r0, 0x02df, %tt
	.word 0x879020f0  ! 815: WRPR_TT_I	wrpr	%r0, 0x00f0, %tt
	.word 0x8ad2e001  ! 816: UMULcc_I	umulcc 	%r11, 0x0001, %r5
	.word 0x879021db  ! 817: WRPR_TT_I	wrpr	%r0, 0x01db, %tt
	.word 0x81982d95  ! 818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d95, %hpstate
DS_121:
	.word 0x34800001  ! 820: BG	bg,a	<label_0x1>
	.word 0x34800001  ! 820: BG	bg,a	<label_0x1>
	.word 0xb3a0054a  ! 820: FSQRTd	fsqrt	
	.word 0x93a44830  ! 819: FADDs	fadds	%f17, %f16, %f9
	.word 0x2e800001  ! 820: BVS	bvs,a	<label_0x1>
DS_122:
	.word 0x34800001  ! 822: BG	bg,a	<label_0x1>
	illtrap
	.word 0xd7140007  ! 822: LDQF_R	-	[%r16, %r7], %f11
	.word 0x9ba6883b  ! 821: FADDs	fadds	%f26, %f27, %f13
	.word 0x8b500000  ! 822: RDPR_TPC	rdpr	%tpc, %r5
	.word 0x93902007  ! 823: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8f480000  ! 824: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x87802014  ! 825: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93d02030  ! 826: Tcc_I	tne	icc_or_xcc, %r0 + 48
splash_lsu_123:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 827: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xce2fe001  ! 828: STB_I	stb	%r7, [%r31 + 0x0001]
	.word 0x87902263  ! 829: WRPR_TT_I	wrpr	%r0, 0x0263, %tt
	.word 0x91d02030  ! 830: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xce8fe010  ! 831: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r7
	.word 0xa8c0a001  ! 832: ADDCcc_I	addccc 	%r2, 0x0001, %r20
	.word 0x91d02032  ! 833: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xaf69800a  ! 834: SDIVX_R	sdivx	%r6, %r10, %r23
	.word 0xee8008a0  ! 835: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0x8d902a89  ! 836: WRPR_PSTATE_I	wrpr	%r0, 0x0a89, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90204e  ! 838: WRPR_PSTATE_I	wrpr	%r0, 0x004e, %pstate
	.word 0x81982405  ! 839: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0405, %hpstate
	.word 0x93902004  ! 840: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_124:
	.word 0x32800001  ! 842: BNE	bne,a	<label_0x1>
	.word 0xe732800a  ! 842: STQF_R	-	%f19, [%r10, %r10]
	normalw
	.word 0x87458000  ! 841: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc62fe001  ! 842: STB_I	stb	%r3, [%r31 + 0x0001]
	.word 0xc6d804a0  ! 843: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0x8f6cc010  ! 844: SDIVX_R	sdivx	%r19, %r16, %r7
	.word 0xce9004a0  ! 845: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0x819824d7  ! 846: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d7, %hpstate
	.word 0xce1fe001  ! 847: LDD_I	ldd	[%r31 + 0x0001], %r7
	.word 0x87802088  ! 848: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xce9004a0  ! 849: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0xce8008a0  ! 850: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x9aadc007  ! 851: ANDNcc_R	andncc 	%r23, %r7, %r13
splash_lsu_125:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 852: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8351c000  ! 853: RDPR_TL	rdpr	%tl, %r1
	.word 0x9f802001  ! 854: SIR	sir	0x0001
	.word 0x93902005  ! 855: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x86f8c016  ! 856: SDIVcc_R	sdivcc 	%r3, %r22, %r3
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 857: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90265b  ! 858: WRPR_PSTATE_I	wrpr	%r0, 0x065b, %pstate
change_to_tl1_126:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d802000  ! 860: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902002  ! 861: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_127:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 862: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902001  ! 863: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc61fc000  ! 864: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xa04b0017  ! 865: MULX_R	mulx 	%r12, %r23, %r16
	.word 0x38700001  ! 866: BPGU	<illegal instruction>
	.word 0x8d90209f  ! 867: WRPR_PSTATE_I	wrpr	%r0, 0x009f, %pstate
splash_htba_128:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 868: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8780201c  ! 869: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8d902a83  ! 870: WRPR_PSTATE_I	wrpr	%r0, 0x0a83, %pstate
	.word 0x8d9028d9  ! 871: WRPR_PSTATE_I	wrpr	%r0, 0x08d9, %pstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 872: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 873: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_tba_129:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 874: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0c7e020  ! 875: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
DS_130:
	.word 0x32800001  ! 877: BNE	bne,a	<label_0x1>
	pdist %f12, %f28, %f10
	.word 0x9bb4c305  ! 876: ALLIGNADDRESS	alignaddr	%r19, %r5, %r13
change_to_randtl_131:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 877: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x826a6001  ! 878: UDIVX_I	udivx 	%r9, 0x0001, %r1
	.word 0x81982c9e  ! 879: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9e, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xc27fe001  ! 881: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0x93540000  ! 882: RDPR_GL	rdpr	%-, %r9
DS_132:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 883: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
splash_tba_133:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 884: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_htba_134:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 885: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902008  ! 886: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xb1504000  ! 887: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x819827df  ! 888: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
	.word 0xa1902007  ! 889: WRPR_GL_I	wrpr	%r0, 0x0007, %-
change_to_tl1_135:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 891: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a86  ! 892: WRPR_PSTATE_I	wrpr	%r0, 0x0a86, %pstate
	.word 0x81460000  ! 893: RD_STICK_REG	stbar
	.word 0x97a000c5  ! 894: FNEGd	fnegd	%f36, %f42
DS_136:
	.word 0x34800001  ! 896: BG	bg,a	<label_0x1>
	illtrap
	.word 0xe3130002  ! 896: LDQF_R	-	[%r12, %r2], %f17
	.word 0x97a68824  ! 895: FADDs	fadds	%f26, %f4, %f11
	.word 0x93902000  ! 896: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879023a9  ! 897: WRPR_TT_I	wrpr	%r0, 0x03a9, %tt
	.word 0x9551c000  ! 898: RDPR_TL	rdpr	%tl, %r10
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 899: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 900: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x96d28001  ! 902: UMULcc_R	umulcc 	%r10, %r1, %r11
	.word 0x9f802001  ! 903: SIR	sir	0x0001
	.word 0x8d802004  ! 904: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd68008a0  ! 905: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xa1902009  ! 906: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x946d2001  ! 907: UDIVX_I	udivx 	%r20, 0x0001, %r10
	.word 0x83d02030  ! 908: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x8cf86001  ! 909: SDIVcc_I	sdivcc 	%r1, 0x0001, %r6
	.word 0x8d902c9b  ! 910: WRPR_PSTATE_I	wrpr	%r0, 0x0c9b, %pstate
	.word 0x8d9026d2  ! 911: WRPR_PSTATE_I	wrpr	%r0, 0x06d2, %pstate
splash_cmpr_137:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 913: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182e001  ! 912: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0xa1902000  ! 913: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xb345c000  ! 914: RD_TICK_CMPR_REG	rd	%-, %r25
	.word 0x85508000  ! 915: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0xc417c000  ! 916: LDUH_R	lduh	[%r31 + %r0], %r2
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 917: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 918: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 919: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8e806001  ! 920: ADDcc_I	addcc 	%r1, 0x0001, %r7
	.word 0x8d902483  ! 921: WRPR_PSTATE_I	wrpr	%r0, 0x0483, %pstate
	.word 0x81982644  ! 922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0644, %hpstate
	.word 0xa1902004  ! 923: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87802004  ! 924: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02034  ! 925: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d02031  ! 926: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8790211d  ! 927: WRPR_TT_I	wrpr	%r0, 0x011d, %tt
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 928: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_138:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 929: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_139:
	.word 0x32800001  ! 931: BNE	bne,a	<label_0x1>
	.word 0xd134e001  ! 931: STQF_I	-	%f8, [0x0001, %r19]
	normalw
	.word 0xad458000  ! 930: RD_SOFTINT_REG	rd	%softint, %r22
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 931: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 932: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81460000  ! 933: RD_STICK_REG	stbar
	.word 0xecc7e030  ! 934: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r22
	.word 0x879022d8  ! 935: WRPR_TT_I	wrpr	%r0, 0x02d8, %tt
	.word 0x87802016  ! 936: WRASI_I	wr	%r0, 0x0016, %asi
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 937: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 938: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x86dc000d  ! 939: SMULcc_R	smulcc 	%r16, %r13, %r3
	.word 0x879021d6  ! 940: WRPR_TT_I	wrpr	%r0, 0x01d6, %tt
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 941: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc727c00d  ! 942: STF_R	st	%f3, [%r13, %r31]
	.word 0x95a00546  ! 943: FSQRTd	fsqrt	
change_to_randtl_140:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 944: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x944d4002  ! 945: MULX_R	mulx 	%r21, %r2, %r10
	.word 0x879021c5  ! 946: WRPR_TT_I	wrpr	%r0, 0x01c5, %tt
	.word 0x87802080  ! 947: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d802004  ! 948: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902006  ! 949: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902001  ! 950: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1902004  ! 951: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x866b0016  ! 952: UDIVX_R	udivx 	%r12, %r22, %r3
	.word 0x87802088  ! 953: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x886a0017  ! 954: UDIVX_R	udivx 	%r8, %r23, %r4
change_to_tl1_141:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_142:
	.word 0x32800001  ! 957: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 956: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982f17  ! 957: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f17, %hpstate
	.word 0x93902003  ! 958: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_143:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 959: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x81982ecc  ! 960: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecc, %hpstate
	.word 0xc8d00e60  ! 961: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r4
	.word 0x82d26001  ! 962: UMULcc_I	umulcc 	%r9, 0x0001, %r1
	.word 0x80fa400b  ! 963: SDIVcc_R	sdivcc 	%r9, %r11, %r0
DS_144:
	.word 0x32800001  ! 965: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 964: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8c4c4008  ! 965: MULX_R	mulx 	%r17, %r8, %r6
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 966: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa9a349e5  ! 967: FDIVq	dis not found

	.word 0xa190200d  ! 968: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902006  ! 969: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_145:
	.word 0x34800001  ! 971: BG	bg,a	<label_0x1>
	pdist %f10, %f16, %f6
	.word 0x95b20309  ! 970: ALLIGNADDRESS	alignaddr	%r8, %r9, %r10
	.word 0xd4bfe001  ! 971: STDA_I	stda	%r10, [%r31 + 0x0001] %asi
	.word 0x91d02031  ! 972: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d902eda  ! 973: WRPR_PSTATE_I	wrpr	%r0, 0x0eda, %pstate
	.word 0x91d02032  ! 974: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9f802001  ! 975: SIR	sir	0x0001
	.word 0xd40fe001  ! 976: LDUB_I	ldub	[%r31 + 0x0001], %r10
	.word 0x95500000  ! 977: RDPR_TPC	rdpr	%tpc, %r10
	.word 0x93a0cdd2  ! 978: FdMULq	fdmulq	
	.word 0xa068a001  ! 979: UDIVX_I	udivx 	%r2, 0x0001, %r16
	.word 0xe0d804a0  ! 980: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	.word 0x81982644  ! 981: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0644, %hpstate
	.word 0x81982e9e  ! 982: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9e, %hpstate
	.word 0x85508000  ! 983: RDPR_TSTATE	rdpr	%tstate, %r2
splash_lsu_146:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 984: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_tl1_147:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87902306  ! 986: WRPR_TT_I	wrpr	%r0, 0x0306, %tt
	.word 0x93b54fed  ! 987: FONES	fones	%f9
	.word 0x8790229c  ! 988: WRPR_TT_I	wrpr	%r0, 0x029c, %tt
	.word 0x84d0a001  ! 989: UMULcc_I	umulcc 	%r2, 0x0001, %r2
	.word 0xc49fc020  ! 990: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x83d02035  ! 991: Tcc_I	te	icc_or_xcc, %r0 + 53
reduce_priv_level_148:
	.word 0x8f902000  ! 993: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01974  ! 992: FqTOd	dis not found

	.word 0x8d902e57  ! 993: WRPR_PSTATE_I	wrpr	%r0, 0x0e57, %pstate
	.word 0xd5e7c034  ! 994: CASA_I	casa	[%r31] 0x 1, %r20, %r10
	.word 0xd4800c80  ! 995: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r10
	.word 0xd4ffc034  ! 996: SWAPA_R	swapa	%r10, [%r31 + %r20] 0x01
	.word 0x81982ddd  ! 997: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddd, %hpstate
	.word 0xd48008a0  ! 998: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x81460000  ! 999: RD_STICK_REG	stbar
	.word 0x87902046  ! 1000: WRPR_TT_I	wrpr	%r0, 0x0046, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902c89  ! 1002: WRPR_PSTATE_I	wrpr	%r0, 0x0c89, %pstate
	.word 0x83d02030  ! 1003: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x8d902088  ! 1004: WRPR_PSTATE_I	wrpr	%r0, 0x0088, %pstate
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1005: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_149:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1006: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902030  ! 1007: WRPR_TT_I	wrpr	%r0, 0x0030, %tt
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1008: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982b95  ! 1009: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b95, %hpstate
	.word 0x8d802000  ! 1010: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200b  ! 1011: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1012: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4c7e030  ! 1013: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1014: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_150:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1015: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02031  ! 1016: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902006  ! 1017: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_151:
	.word 0x22800001  ! 1019: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1018: SAVE_R	save	%r31, %r0, %r31
	.word 0xd4c80e60  ! 1019: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r10
	.word 0x879023c9  ! 1020: WRPR_TT_I	wrpr	%r0, 0x03c9, %tt
	.word 0x9b494000  ! 1021: RDHPR_HTBA	rdhpr	%htba, %r13
change_to_randtl_152:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1022: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x81982b4e  ! 1023: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4e, %hpstate
	.word 0x99902003  ! 1024: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x8790228b  ! 1025: WRPR_TT_I	wrpr	%r0, 0x028b, %tt
	.word 0x879022c3  ! 1026: WRPR_TT_I	wrpr	%r0, 0x02c3, %tt
	.word 0xa1902000  ! 1027: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x84d4c008  ! 1028: UMULcc_R	umulcc 	%r19, %r8, %r2
	.word 0x8d902e0e  ! 1029: WRPR_PSTATE_I	wrpr	%r0, 0x0e0e, %pstate
	.word 0xc4c80e80  ! 1030: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r2
	.word 0x83494000  ! 1031: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0x9f802001  ! 1032: SIR	sir	0x0001
	.word 0xc3e7c028  ! 1033: CASA_I	casa	[%r31] 0x 1, %r8, %r1
	.word 0x93902004  ! 1034: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x94484016  ! 1035: MULX_R	mulx 	%r1, %r22, %r10
splash_cmpr_153:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1037: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1826001  ! 1036: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0xa190200b  ! 1037: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x94498018  ! 1038: MULX_R	mulx 	%r6, %r24, %r10
	.word 0x879023e9  ! 1039: WRPR_TT_I	wrpr	%r0, 0x03e9, %tt
	.word 0xd4800c00  ! 1040: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r10
	.word 0x8d902210  ! 1041: WRPR_PSTATE_I	wrpr	%r0, 0x0210, %pstate
	.word 0xa1902008  ! 1042: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa190200c  ! 1043: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_tba_154:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1044: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93d02035  ! 1045: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa951c000  ! 1046: RDPR_TL	rdpr	%tl, %r20
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1047: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe897e020  ! 1048: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r20
	.word 0x87902081  ! 1049: WRPR_TT_I	wrpr	%r0, 0x0081, %tt
	.word 0x93902005  ! 1050: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902689  ! 1052: WRPR_PSTATE_I	wrpr	%r0, 0x0689, %pstate
	.word 0x8d90249c  ! 1053: WRPR_PSTATE_I	wrpr	%r0, 0x049c, %pstate
	.word 0xe85fc000  ! 1054: LDX_R	ldx	[%r31 + %r0], %r20
	.word 0x866da001  ! 1055: UDIVX_I	udivx 	%r22, 0x0001, %r3
	.word 0x95a0c9b9  ! 1056: FDIVs	fdivs	%f3, %f25, %f10
	.word 0xb3494000  ! 1057: RDHPR_HTBA	rdhpr	%htba, %r25
	.word 0x8d802004  ! 1058: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_155:
	.word 0x22800001  ! 1060: BE	be,a	<label_0x1>
	pdist %f12, %f2, %f2
	.word 0xa3b64301  ! 1059: ALLIGNADDRESS	alignaddr	%r25, %r1, %r17
	.word 0x8d90209e  ! 1060: WRPR_PSTATE_I	wrpr	%r0, 0x009e, %pstate
	.word 0x97464000  ! 1061: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0xa190200c  ! 1062: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87802004  ! 1063: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802004  ! 1064: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81460000  ! 1065: RD_STICK_REG	stbar
	.word 0x87902384  ! 1066: WRPR_TT_I	wrpr	%r0, 0x0384, %tt
	.word 0x8d902ecf  ! 1067: WRPR_PSTATE_I	wrpr	%r0, 0x0ecf, %pstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1068: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90201e  ! 1069: WRPR_PSTATE_I	wrpr	%r0, 0x001e, %pstate
	.word 0xab500000  ! 1070: RDPR_TPC	rdpr	%tpc, %r21
reduce_priv_level_156:
	.word 0x8f902001  ! 1072: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a0196a  ! 1071: FqTOd	dis not found

	.word 0x8d902690  ! 1072: WRPR_PSTATE_I	wrpr	%r0, 0x0690, %pstate
	.word 0xa1902007  ! 1073: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x819827cc  ! 1074: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cc, %hpstate
	.word 0x8198234e  ! 1075: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034e, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902e03  ! 1077: WRPR_PSTATE_I	wrpr	%r0, 0x0e03, %pstate
DS_157:
	.word 0x34800001  ! 1079: BG	bg,a	<label_0x1>
	pdist %f0, %f14, %f28
	.word 0x83b30306  ! 1078: ALLIGNADDRESS	alignaddr	%r12, %r6, %r1
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1079: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9b51c000  ! 1080: RDPR_TL	rdpr	%tl, %r13
	.word 0x81982897  ! 1081: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0897, %hpstate
	.word 0xda8008a0  ! 1082: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8d9026d2  ! 1083: WRPR_PSTATE_I	wrpr	%r0, 0x06d2, %pstate
	.word 0x9f802001  ! 1084: SIR	sir	0x0001
splash_tba_158:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1085: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902004  ! 1086: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_159:
	.word 0x34800001  ! 1088: BG	bg,a	<label_0x1>
	allclean
	.word 0x99b1c30c  ! 1087: ALLIGNADDRESS	alignaddr	%r7, %r12, %r12
	.word 0xb7a08d25  ! 1088: FsMULd	fsmuld	%f2, %f36, %f58
	.word 0x91d02035  ! 1089: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902004  ! 1090: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902007  ! 1091: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xafa089a7  ! 1093: FDIVs	fdivs	%f2, %f7, %f23
reduce_priv_level_160:
	.word 0x8f902002  ! 1095: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a01962  ! 1094: FqTOd	dis not found

	.word 0x81982094  ! 1095: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0094, %hpstate
	.word 0x8d902281  ! 1096: WRPR_PSTATE_I	wrpr	%r0, 0x0281, %pstate
	.word 0x93d02033  ! 1097: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa190200a  ! 1098: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd297e030  ! 1099: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r9
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1100: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8cd10005  ! 1101: UMULcc_R	umulcc 	%r4, %r5, %r6
	.word 0x83a00567  ! 1102: FSQRTq	fsqrt	
	.word 0x93902001  ! 1103: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802004  ! 1104: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902080  ! 1105: WRPR_PSTATE_I	wrpr	%r0, 0x0080, %pstate
	.word 0x89508000  ! 1106: RDPR_TSTATE	rdpr	%tstate, %r4
DS_161:
	.word 0x22800001  ! 1108: BE	be,a	<label_0x1>
	pdist %f24, %f10, %f2
	.word 0x93b10319  ! 1107: ALLIGNADDRESS	alignaddr	%r4, %r25, %r9
	.word 0x91d02031  ! 1108: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d90241b  ! 1109: WRPR_PSTATE_I	wrpr	%r0, 0x041b, %pstate
	.word 0x87902336  ! 1110: WRPR_TT_I	wrpr	%r0, 0x0336, %tt
	.word 0xada000c3  ! 1111: FNEGd	fnegd	%f34, %f22
	.word 0xecc00e60  ! 1112: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r22
	.word 0xecd004a0  ! 1113: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r22
	.word 0x8d902edd  ! 1114: WRPR_PSTATE_I	wrpr	%r0, 0x0edd, %pstate
	.word 0x93d02034  ! 1115: Tcc_I	tne	icc_or_xcc, %r0 + 52
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1116: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 1117: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91504000  ! 1118: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x81982b5c  ! 1119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5c, %hpstate
	.word 0xa1902005  ! 1120: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd08008a0  ! 1121: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x93d02034  ! 1122: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xd0d804a0  ! 1123: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0xd1e7c023  ! 1124: CASA_I	casa	[%r31] 0x 1, %r3, %r8
DS_162:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1125: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xd0d00e40  ! 1126: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r8
	.word 0xa1902002  ! 1127: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x81982bd6  ! 1128: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd6, %hpstate
	.word 0x93902005  ! 1129: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902004  ! 1130: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d902cd8  ! 1131: WRPR_PSTATE_I	wrpr	%r0, 0x0cd8, %pstate
	.word 0xa0c52001  ! 1132: ADDCcc_I	addccc 	%r20, 0x0001, %r16
DS_163:
	.word 0x20800001  ! 1134: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1134: BN	bn,a	<label_0x1>
	.word 0xd5100015  ! 1134: LDQF_R	-	[%r0, %r21], %f10
	.word 0xa3a2882b  ! 1133: FADDs	fadds	%f10, %f11, %f17
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902e52  ! 1135: WRPR_PSTATE_I	wrpr	%r0, 0x0e52, %pstate
	.word 0x8d902c88  ! 1136: WRPR_PSTATE_I	wrpr	%r0, 0x0c88, %pstate
	.word 0xe3e7c02b  ! 1137: CASA_I	casa	[%r31] 0x 1, %r11, %r17
	.word 0x87902047  ! 1138: WRPR_TT_I	wrpr	%r0, 0x0047, %tt
	.word 0xe28804a0  ! 1139: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x87902214  ! 1140: WRPR_TT_I	wrpr	%r0, 0x0214, %tt
	.word 0x87902359  ! 1141: WRPR_TT_I	wrpr	%r0, 0x0359, %tt
	.word 0x87508000  ! 1142: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x81982405  ! 1143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0405, %hpstate
DS_164:
	.word 0x32800001  ! 1145: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1144: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x97500000  ! 1145: RDPR_TPC	rdpr	%tpc, %r11
splash_htba_165:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1146: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_htba_166:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1147: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x81982a9e  ! 1148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9e, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1149: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x94d08008  ! 1150: UMULcc_R	umulcc 	%r2, %r8, %r10
DS_167:
	.word 0x22800001  ! 1152: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1151: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802089  ! 1152: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa1902001  ! 1153: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x94fb6001  ! 1154: SDIVcc_I	sdivcc 	%r13, 0x0001, %r10
	.word 0x879021a6  ! 1155: WRPR_TT_I	wrpr	%r0, 0x01a6, %tt
	.word 0xa190200a  ! 1156: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87902225  ! 1157: WRPR_TT_I	wrpr	%r0, 0x0225, %tt
	.word 0x8d902618  ! 1158: WRPR_PSTATE_I	wrpr	%r0, 0x0618, %pstate
	.word 0xd5e7c028  ! 1159: CASA_I	casa	[%r31] 0x 1, %r8, %r10
	.word 0x93902004  ! 1160: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902337  ! 1161: WRPR_TT_I	wrpr	%r0, 0x0337, %tt
	.word 0xa190200c  ! 1162: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902005  ! 1163: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xaad0c00d  ! 1164: UMULcc_R	umulcc 	%r3, %r13, %r21
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1165: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x819822d7  ! 1166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d7, %hpstate
	.word 0xea800c20  ! 1167: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r21
	.word 0x819825d4  ! 1168: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d4, %hpstate
	.word 0x87902031  ! 1169: WRPR_TT_I	wrpr	%r0, 0x0031, %tt
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1170: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_168:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1171: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_tba_169:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1172: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879021c6  ! 1173: WRPR_TT_I	wrpr	%r0, 0x01c6, %tt
	.word 0x8790222d  ! 1174: WRPR_TT_I	wrpr	%r0, 0x022d, %tt
splash_tba_170:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1175: WRPR_TBA_R	wrpr	%r0, %r2, %tba
change_to_tl1_171:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_HPRIV	! macro
DS_172:
	.word 0x22800001  ! 1179: BE	be,a	<label_0x1>
	illtrap
	.word 0xd3158002  ! 1179: LDQF_R	-	[%r22, %r2], %f9
	.word 0xb3a3482b  ! 1178: FADDs	fadds	%f13, %f11, %f25
	.word 0x94ad4003  ! 1179: ANDNcc_R	andncc 	%r21, %r3, %r10
	.word 0x866ec002  ! 1180: UDIVX_R	udivx 	%r27, %r2, %r3
	.word 0xc617c000  ! 1181: LDUH_R	lduh	[%r31 + %r0], %r3
	.word 0x81982a4d  ! 1182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4d, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1183: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xaba00577  ! 1184: FSQRTq	fsqrt	
	.word 0x93902003  ! 1185: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x3a800001  ! 1186: BCC	bcc,a	<label_0x1>
	.word 0x93902004  ! 1187: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xead804a0  ! 1188: LDXA_R	ldxa	[%r0, %r0] 0x25, %r21
	.word 0x81494000  ! 1189: RDHPR_HTBA	rdhpr	%htba, %r0
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1191: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab500000  ! 1192: RDPR_TPC	rdpr	%tpc, %r21
	.word 0xea0fe001  ! 1193: LDUB_I	ldub	[%r31 + 0x0001], %r21
	.word 0x91d02033  ! 1194: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x99902004  ! 1195: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xb7a01a74  ! 1196: FqTOi	fqtoi	
	.word 0xa1902002  ! 1197: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8198280f  ! 1198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080f, %hpstate
	.word 0x8afb6001  ! 1199: SDIVcc_I	sdivcc 	%r13, 0x0001, %r5
	.word 0x87902037  ! 1200: WRPR_TT_I	wrpr	%r0, 0x0037, %tt
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1201: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xb1514000  ! 1202: RDPR_TBA	rdpr	%tba, %r24
	.word 0x91d02034  ! 1203: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d802004  ! 1204: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa190200e  ! 1205: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x87902239  ! 1206: WRPR_TT_I	wrpr	%r0, 0x0239, %tt
	.word 0x8950c000  ! 1207: RDPR_TT	rdpr	%tt, %r4
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1208: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x96d90006  ! 1209: SMULcc_R	smulcc 	%r4, %r6, %r11
	.word 0x99902004  ! 1210: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa3a249a5  ! 1211: FDIVs	fdivs	%f9, %f5, %f17
	.word 0x9f802001  ! 1212: SIR	sir	0x0001
	.word 0xe27fe001  ! 1213: SWAP_I	swap	%r17, [%r31 + 0x0001]
	.word 0x91d02034  ! 1214: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8a81c000  ! 1215: ADDcc_R	addcc 	%r7, %r0, %r5
	.word 0x81982e57  ! 1216: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e57, %hpstate
	.word 0x83d02031  ! 1217: Tcc_I	te	icc_or_xcc, %r0 + 49
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 1218: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8b50c000  ! 1219: RDPR_TT	rdpr	%tt, %r5
	.word 0x87802004  ! 1220: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xca8fe000  ! 1221: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r5
	.word 0x81982d9d  ! 1222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9d, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1223: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xcb27e001  ! 1224: STF_I	st	%f5, [0x0001, %r31]
	.word 0x81460000  ! 1225: RD_STICK_REG	stbar
change_to_randtl_173:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1226: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
splash_htba_174:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1227: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x97a000c4  ! 1228: FNEGd	fnegd	%f4, %f42
	.word 0x83d02033  ! 1229: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xd6d004a0  ! 1230: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1231: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 1232: BPOS	bpos,a	<label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1233: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x846d2001  ! 1234: UDIVX_I	udivx 	%r20, 0x0001, %r2
	.word 0x93902006  ! 1235: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc527e001  ! 1236: STF_I	st	%f2, [0x0001, %r31]
	.word 0x8d802004  ! 1237: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902007  ! 1238: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_tl1_175:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa190200d  ! 1240: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xc517c000  ! 1241: LDQF_R	-	[%r31, %r0], %f2
	.word 0xa8836001  ! 1242: ADDcc_I	addcc 	%r13, 0x0001, %r20
	.word 0x87902024  ! 1243: WRPR_TT_I	wrpr	%r0, 0x0024, %tt
change_to_tl1_176:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1245: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021cd  ! 1246: WRPR_TT_I	wrpr	%r0, 0x01cd, %tt
	.word 0xa1902004  ! 1247: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa1902000  ! 1248: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x9f802001  ! 1249: SIR	sir	0x0001
DS_177:
	.word 0x20800001  ! 1251: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1251: BE	be,a	<label_0x1>
	.word 0xc110400c  ! 1251: LDQF_R	-	[%r1, %r12], %f0
	.word 0xada14828  ! 1250: FADDs	fadds	%f5, %f8, %f22
	.word 0x8d90280b  ! 1251: WRPR_PSTATE_I	wrpr	%r0, 0x080b, %pstate
change_to_tl1_178:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902007  ! 1253: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902007  ! 1254: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902004  ! 1255: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8780201c  ! 1256: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x2c700001  ! 1257: BPNEG	<illegal instruction>
	.word 0x81982dc6  ! 1258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc6, %hpstate
	.word 0x83d02032  ! 1259: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_htba_179:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1260: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_180:
	.word 0x32800001  ! 1262: BNE	bne,a	<label_0x1>
	.word 0xd535c013  ! 1262: STQF_R	-	%f10, [%r19, %r23]
	normalw
	.word 0x91458000  ! 1261: RD_SOFTINT_REG	rd	%softint, %r8
DS_181:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1262: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xa4d28002  ! 1263: UMULcc_R	umulcc 	%r10, %r2, %r18
	.word 0x93902007  ! 1264: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 1266: SIR	sir	0x0001
	.word 0xa1902005  ! 1267: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xe537c002  ! 1268: STQF_R	-	%f18, [%r2, %r31]
	.word 0x81982e06  ! 1269: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e06, %hpstate
splash_tba_182:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1270: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_183:
	.word 0x32800001  ! 1272: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1272: BG	bg,a	<label_0x1>
	.word 0xe9130007  ! 1272: LDQF_R	-	[%r12, %r7], %f20
	.word 0xafa2c82b  ! 1271: FADDs	fadds	%f11, %f11, %f23
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1272: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x36700001  ! 1273: BPGE	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x86fc8009  ! 1276: SDIVcc_R	sdivcc 	%r18, %r9, %r3
	.word 0xa7494000  ! 1277: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0x8d902e5e  ! 1278: WRPR_PSTATE_I	wrpr	%r0, 0x0e5e, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x946a0015  ! 1280: UDIVX_R	udivx 	%r8, %r21, %r10
	.word 0x97464000  ! 1281: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0x93902006  ! 1282: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1283: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd68804a0  ! 1284: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xb069e001  ! 1285: UDIVX_I	udivx 	%r7, 0x0001, %r24
	.word 0xb3508000  ! 1286: RDPR_TSTATE	rdpr	%tstate, %r25
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1287: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1288: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf25fc000  ! 1289: LDX_R	ldx	[%r31 + %r0], %r25
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1290: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_184:
	.word 0x34800001  ! 1292: BG	bg,a	<label_0x1>
	illtrap
	.word 0xd913000a  ! 1292: LDQF_R	-	[%r12, %r10], %f12
	.word 0x83a54839  ! 1291: FADDs	fadds	%f21, %f25, %f1
	.word 0x819829c7  ! 1292: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c7, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02034  ! 1294: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d02032  ! 1295: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902002  ! 1296: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9ba189c7  ! 1297: FDIVd	fdivd	%f6, %f38, %f44
	.word 0xb2c1a001  ! 1298: ADDCcc_I	addccc 	%r6, 0x0001, %r25
	.word 0x81982984  ! 1299: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0984, %hpstate
	.word 0xa1902009  ! 1300: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_cmpr_185:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1302: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180e001  ! 1301: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x85a2c9cd  ! 1302: FDIVd	fdivd	%f42, %f44, %f2
splash_htba_186:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1303: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8790236b  ! 1304: WRPR_TT_I	wrpr	%r0, 0x036b, %tt
DS_187:
	.word 0x20800001  ! 1306: BN	bn,a	<label_0x1>
	pdist %f22, %f16, %f0
	.word 0x91b20302  ! 1305: ALLIGNADDRESS	alignaddr	%r8, %r2, %r8
	.word 0x91d02033  ! 1306: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_tl1_188:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x98d16001  ! 1308: UMULcc_I	umulcc 	%r5, 0x0001, %r12
	.word 0x8d902055  ! 1309: WRPR_PSTATE_I	wrpr	%r0, 0x0055, %pstate
	.word 0x87802004  ! 1310: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8198268f  ! 1311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068f, %hpstate
DS_189:
	.word 0x20800001  ! 1313: BN	bn,a	<label_0x1>
	.word 0xd930a001  ! 1313: STQF_I	-	%f12, [0x0001, %r2]
	normalw
	.word 0x85458000  ! 1312: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x93902003  ! 1313: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982006  ! 1314: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0006, %hpstate
	.word 0xa1902003  ! 1315: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x89508000  ! 1316: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0x8780201c  ! 1317: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8d902483  ! 1318: WRPR_PSTATE_I	wrpr	%r0, 0x0483, %pstate
	.word 0x91d02032  ! 1319: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902083  ! 1320: WRPR_PSTATE_I	wrpr	%r0, 0x0083, %pstate
	.word 0x8d902a48  ! 1321: WRPR_PSTATE_I	wrpr	%r0, 0x0a48, %pstate
DS_190:
	.word 0x34800001  ! 1323: BG	bg,a	<label_0x1>
	pdist %f26, %f2, %f24
	.word 0x89b44306  ! 1322: ALLIGNADDRESS	alignaddr	%r17, %r6, %r4
	.word 0x879021da  ! 1323: WRPR_TT_I	wrpr	%r0, 0x01da, %tt
	.word 0xb6fc6001  ! 1324: SDIVcc_I	sdivcc 	%r17, 0x0001, %r27
splash_cmpr_191:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1326: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1812001  ! 1325: WR_STICK_REG_I	wr	%r4, 0x0001, %-
change_to_tl1_192:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d9020c4  ! 1327: WRPR_PSTATE_I	wrpr	%r0, 0x00c4, %pstate
splash_htba_193:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1328: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1a01a6c  ! 1329: FqTOi	fqtoi	
	.word 0x91d02034  ! 1330: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8790238e  ! 1331: WRPR_TT_I	wrpr	%r0, 0x038e, %tt
	.word 0xa190200c  ! 1332: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa2698012  ! 1333: UDIVX_R	udivx 	%r6, %r18, %r17
	.word 0xa190200c  ! 1334: WRPR_GL_I	wrpr	%r0, 0x000c, %-
DS_194:
	.word 0x20800001  ! 1336: BN	bn,a	<label_0x1>
	.word 0xcf328016  ! 1336: STQF_R	-	%f7, [%r22, %r10]
	normalw
	.word 0xa3458000  ! 1335: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x93902006  ! 1336: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa190200d  ! 1337: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902002  ! 1338: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902002  ! 1339: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x81a249ca  ! 1340: FDIVd	fdivd	%f40, %f10, %f0
	.word 0xc0c804a0  ! 1341: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0x3e700001  ! 1342: BPVC	<illegal instruction>
splash_tba_195:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1343: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xb7b58fe3  ! 1344: FONES	fones	%f27
DS_196:
	.word 0x22800001  ! 1346: BE	be,a	<label_0x1>
	illtrap
	.word 0xa3a00548  ! 1346: FSQRTd	fsqrt	
	.word 0x9ba4883a  ! 1345: FADDs	fadds	%f18, %f26, %f13
	.word 0x87902036  ! 1346: WRPR_TT_I	wrpr	%r0, 0x0036, %tt
splash_cmpr_197:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1348: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182a001  ! 1347: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0x83a000d1  ! 1348: FNEGd	fnegd	%f48, %f32
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 1349: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x96840001  ! 1350: ADDcc_R	addcc 	%r16, %r1, %r11
DS_198:
	.word 0x22800001  ! 1352: BE	be,a	<label_0x1>
	.word 0xdb312001  ! 1352: STQF_I	-	%f13, [0x0001, %r4]
	normalw
	.word 0x85458000  ! 1351: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xc447c000  ! 1352: LDSW_R	ldsw	[%r31 + %r0], %r2
	.word 0xa190200b  ! 1353: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x879023f3  ! 1354: WRPR_TT_I	wrpr	%r0, 0x03f3, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xad500000  ! 1356: RDPR_TPC	rdpr	%tpc, %r22
	.word 0x879020fb  ! 1357: WRPR_TT_I	wrpr	%r0, 0x00fb, %tt
change_to_tl1_199:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93464000  ! 1359: RD_STICK_CMPR_REG	rd	%-, %r9
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x96da400b  ! 1361: SMULcc_R	smulcc 	%r9, %r11, %r11
	.word 0x8d902c91  ! 1362: WRPR_PSTATE_I	wrpr	%r0, 0x0c91, %pstate
	.word 0x8790235f  ! 1363: WRPR_TT_I	wrpr	%r0, 0x035f, %tt
	.word 0xb3504000  ! 1364: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x96d14007  ! 1365: UMULcc_R	umulcc 	%r5, %r7, %r11
	.word 0x91d02030  ! 1366: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x81982ddc  ! 1367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddc, %hpstate
	.word 0x8d802004  ! 1368: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x96fe6001  ! 1369: SDIVcc_I	sdivcc 	%r25, 0x0001, %r11
	.word 0x93902004  ! 1370: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_200:
	.word 0x34800001  ! 1372: BG	bg,a	<label_0x1>
	illtrap
	.word 0xcd154009  ! 1372: LDQF_R	-	[%r21, %r9], %f6
	.word 0x8ba34826  ! 1371: FADDs	fadds	%f13, %f6, %f5
splash_lsu_201:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1372: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 1373: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xb7a000d6  ! 1374: FNEGd	fnegd	%f22, %f58
	.word 0x8cfe4009  ! 1375: SDIVcc_R	sdivcc 	%r25, %r9, %r6
	.word 0xcd3fc009  ! 1376: STDF_R	std	%f6, [%r9, %r31]
	.word 0x819823ce  ! 1377: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03ce, %hpstate
	.word 0x9f802001  ! 1378: SIR	sir	0x0001
	.word 0x819826c6  ! 1379: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c6, %hpstate
	.word 0xa1902004  ! 1380: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xcc7fe001  ! 1381: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x8198208d  ! 1382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008d, %hpstate
	.word 0x806cc00d  ! 1383: UDIVX_R	udivx 	%r19, %r13, %r0
	.word 0x8198279f  ! 1384: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079f, %hpstate
	.word 0x8790204a  ! 1385: WRPR_TT_I	wrpr	%r0, 0x004a, %tt
	.word 0x93902004  ! 1386: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902005  ! 1387: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902006  ! 1388: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x85494000  ! 1389: RDHPR_HTBA	rdhpr	%htba, %r2
	.word 0xc47fe001  ! 1390: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0x93902000  ! 1391: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_202:
	.word 0x34800001  ! 1393: BG	bg,a	<label_0x1>
	pdist %f18, %f28, %f18
	.word 0x8fb5c30c  ! 1392: ALLIGNADDRESS	alignaddr	%r23, %r12, %r7
	.word 0xab68000c  ! 1393: SDIVX_R	sdivx	%r0, %r12, %r21
	.word 0xeaffc02c  ! 1394: SWAPA_R	swapa	%r21, [%r31 + %r12] 0x01
	.word 0xb1a00567  ! 1395: FSQRTq	fsqrt	
	.word 0x8d902ed5  ! 1396: WRPR_PSTATE_I	wrpr	%r0, 0x0ed5, %pstate
	.word 0x91d02031  ! 1397: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902004  ! 1398: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8198215d  ! 1399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015d, %hpstate
	.word 0x91d02032  ! 1400: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xb2d08008  ! 1401: UMULcc_R	umulcc 	%r2, %r8, %r25
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 1402: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_203:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1403: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1404: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8269a001  ! 1405: UDIVX_I	udivx 	%r6, 0x0001, %r1
	.word 0x8d902ccc  ! 1406: WRPR_PSTATE_I	wrpr	%r0, 0x0ccc, %pstate
	.word 0xc2bfc028  ! 1407: STDA_R	stda	%r1, [%r31 + %r8] 0x01
	.word 0xa190200c  ! 1408: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x879020f9  ! 1409: WRPR_TT_I	wrpr	%r0, 0x00f9, %tt
	.word 0xa190200b  ! 1410: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x91d02030  ! 1411: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1413: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902377  ! 1414: WRPR_TT_I	wrpr	%r0, 0x0377, %tt
reduce_priv_level_204:
	.word 0x8f902000  ! 1416: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1810003  ! 1415: WR_STICK_REG_R	wr	%r4, %r3, %-
	.word 0xa1902003  ! 1416: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1417: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790235e  ! 1418: WRPR_TT_I	wrpr	%r0, 0x035e, %tt
	.word 0x86d36001  ! 1419: UMULcc_I	umulcc 	%r13, 0x0001, %r3
	.word 0x879023a0  ! 1420: WRPR_TT_I	wrpr	%r0, 0x03a0, %tt
	.word 0x9f802001  ! 1421: SIR	sir	0x0001
splash_cmpr_205:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1423: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1866001  ! 1422: WR_STICK_REG_I	wr	%r25, 0x0001, %-
	.word 0x8951c000  ! 1423: RDPR_TL	<illegal instruction>
	.word 0x8d802000  ! 1424: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902124  ! 1425: WRPR_TT_I	wrpr	%r0, 0x0124, %tt
	.word 0x9b514000  ! 1426: RDPR_TBA	rdpr	%tba, %r13
	.word 0x9ba20d20  ! 1427: FsMULd	fsmuld	%f8, %f0, %f44
	.word 0x8d902e02  ! 1428: WRPR_PSTATE_I	wrpr	%r0, 0x0e02, %pstate
	.word 0xa1902001  ! 1429: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93902006  ! 1430: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02033  ! 1431: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81982e56  ! 1432: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e56, %hpstate
	.word 0x91d02034  ! 1433: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1434: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xda7fe001  ! 1435: SWAP_I	swap	%r13, [%r31 + 0x0001]
	ta	T_CHANGE_PRIV	! macro
	.word 0x8790235b  ! 1437: WRPR_TT_I	wrpr	%r0, 0x035b, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1438: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xda7fe001  ! 1439: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0xa1902004  ! 1440: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa190200f  ! 1441: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x3a800001  ! 1442: BCC	bcc,a	<label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1443: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb27e001  ! 1444: STF_I	st	%f13, [0x0001, %r31]
	.word 0x8d802000  ! 1445: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982a17  ! 1446: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a17, %hpstate
	.word 0x87802004  ! 1447: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xdad004a0  ! 1448: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xda3fc000  ! 1449: STD_R	std	%r13, [%r31 + %r0]
	.word 0x8d90229e  ! 1450: WRPR_PSTATE_I	wrpr	%r0, 0x029e, %pstate
	.word 0x93902003  ! 1451: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x906ca001  ! 1452: UDIVX_I	udivx 	%r18, 0x0001, %r8
	.word 0x93902000  ! 1453: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x819824d6  ! 1454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d6, %hpstate
	.word 0x9f802001  ! 1455: SIR	sir	0x0001
	.word 0x91d02031  ! 1456: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x88db4011  ! 1457: SMULcc_R	smulcc 	%r13, %r17, %r4
	.word 0x87902303  ! 1458: WRPR_TT_I	wrpr	%r0, 0x0303, %tt
	.word 0x91d02034  ! 1459: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802014  ! 1460: WRASI_I	wr	%r0, 0x0014, %asi
splash_lsu_206:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1461: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 1462: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x86d12001  ! 1463: UMULcc_I	umulcc 	%r4, 0x0001, %r3
	.word 0x81982884  ! 1464: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0884, %hpstate
	.word 0x83d02032  ! 1465: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x28800001  ! 1466: BLEU	bleu,a	<label_0x1>
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1468: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982394  ! 1469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0394, %hpstate
	.word 0xc6ffc031  ! 1470: SWAPA_R	swapa	%r3, [%r31 + %r17] 0x01
	.word 0xc6900e40  ! 1471: LDUHA_R	lduha	[%r0, %r0] 0x72, %r3
change_to_tl1_207:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1473: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1474: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1475: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_208:
	.word 0x22800001  ! 1477: BE	be,a	<label_0x1>
	.word 0xc7344004  ! 1477: STQF_R	-	%f3, [%r4, %r17]
	normalw
	.word 0x8b458000  ! 1476: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x8d902451  ! 1477: WRPR_PSTATE_I	wrpr	%r0, 0x0451, %pstate
	.word 0x8790206d  ! 1478: WRPR_TT_I	wrpr	%r0, 0x006d, %tt
	.word 0x8d802000  ! 1479: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x819821d4  ! 1481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d4, %hpstate
	.word 0xca9fe001  ! 1482: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
DS_209:
	.word 0x22800001  ! 1484: BE	be,a	<label_0x1>
	.word 0xcb30000a  ! 1484: STQF_R	-	%f5, [%r10, %r0]
	normalw
	.word 0xa1458000  ! 1483: RD_SOFTINT_REG	rd	%softint, %r16
change_to_randtl_210:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1484: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8a6a6001  ! 1485: UDIVX_I	udivx 	%r9, 0x0001, %r5
	.word 0x81982ddc  ! 1486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddc, %hpstate
	.word 0x8db30fe7  ! 1487: FONES	fones	%f6
	.word 0x8d902640  ! 1488: WRPR_PSTATE_I	wrpr	%r0, 0x0640, %pstate
	.word 0x91d02030  ! 1489: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x83d02033  ! 1490: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x93902006  ! 1491: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1492: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982986  ! 1493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0986, %hpstate
	.word 0xab494000  ! 1494: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0x93902007  ! 1495: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1496: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_211:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1497: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa3a000d2  ! 1498: FNEGd	fnegd	%f18, %f48
	.word 0x99a0cd36  ! 1499: FsMULd	fsmuld	%f3, %f22, %f12
	.word 0x879023cf  ! 1500: WRPR_TT_I	wrpr	%r0, 0x03cf, %tt
	.word 0x8198248d  ! 1501: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048d, %hpstate
DS_212:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1502: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1503: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb3464000  ! 1504: RD_STICK_CMPR_REG	rd	%-, %r25
	.word 0xa190200c  ! 1505: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8198249d  ! 1506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049d, %hpstate
	.word 0x9f802001  ! 1507: SIR	sir	0x0001
	.word 0x8790220c  ! 1508: WRPR_TT_I	wrpr	%r0, 0x020c, %tt
	.word 0x8d902813  ! 1509: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	.word 0xa190200b  ! 1510: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xb1a34dd4  ! 1511: FdMULq	fdmulq	
	.word 0x8a6b6001  ! 1512: UDIVX_I	udivx 	%r13, 0x0001, %r5
splash_lsu_213:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1513: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0xca8fe000  ! 1515: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r5
splash_htba_214:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1516: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902c94  ! 1517: WRPR_PSTATE_I	wrpr	%r0, 0x0c94, %pstate
	.word 0xa1902002  ! 1518: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1519: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_215:
	.word 0x22800001  ! 1521: BE	be,a	<label_0x1>
	.word 0xe533001b  ! 1521: STQF_R	-	%f18, [%r27, %r12]
	normalw
	.word 0xa1458000  ! 1520: RD_SOFTINT_REG	rd	%softint, %r16
change_to_tl1_216:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xe097e000  ! 1522: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
	.word 0x8d902c8b  ! 1523: WRPR_PSTATE_I	wrpr	%r0, 0x0c8b, %pstate
	.word 0xe0c7e000  ! 1524: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r16
	.word 0x80c16001  ! 1525: ADDCcc_I	addccc 	%r5, 0x0001, %r0
	.word 0xc0ffc03b  ! 1526: SWAPA_R	swapa	%r0, [%r31 + %r27] 0x01
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1527: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902005  ! 1529: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa950c000  ! 1530: RDPR_TT	rdpr	%tt, %r20
	.word 0x91d02030  ! 1531: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xe927c01b  ! 1532: STF_R	st	%f20, [%r27, %r31]
	.word 0xe8800ac0  ! 1533: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r20
	.word 0x8551c000  ! 1534: RDPR_TL	<illegal instruction>
	.word 0x36800001  ! 1535: BGE	bge,a	<label_0x1>
	.word 0x81982697  ! 1536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0697, %hpstate
	.word 0x879021fd  ! 1537: WRPR_TT_I	wrpr	%r0, 0x01fd, %tt
	.word 0x93d02030  ! 1538: Tcc_I	tne	icc_or_xcc, %r0 + 48
change_to_randtl_217:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1539: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
DS_218:
	.word 0x34800001  ! 1541: BG	bg,a	<label_0x1>
	.word 0xd336401b  ! 1541: STQF_R	-	%f9, [%r27, %r25]
	normalw
	.word 0xab458000  ! 1540: RD_SOFTINT_REG	rd	%softint, %r21
	.word 0xa1902008  ! 1541: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8ad4c002  ! 1542: UMULcc_R	umulcc 	%r19, %r2, %r5
	.word 0x95504000  ! 1543: RDPR_TNPC	rdpr	%tnpc, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x8cc4a001  ! 1545: ADDCcc_I	addccc 	%r18, 0x0001, %r6
	.word 0x8d802000  ! 1546: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902007  ! 1547: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902a91  ! 1548: WRPR_PSTATE_I	wrpr	%r0, 0x0a91, %pstate
	.word 0xb5480000  ! 1549: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x93d02033  ! 1550: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x99902001  ! 1551: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x28800001  ! 1552: BLEU	bleu,a	<label_0x1>
change_to_randtl_219:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1553: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x81982f04  ! 1554: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f04, %hpstate
	.word 0xf4c80e40  ! 1555: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r26
	.word 0xf4dfe020  ! 1556: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r26
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1557: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa680c004  ! 1558: ADDcc_R	addcc 	%r3, %r4, %r19
	.word 0x99a549ad  ! 1559: FDIVs	fdivs	%f21, %f13, %f12
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1560: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902adb  ! 1561: WRPR_PSTATE_I	wrpr	%r0, 0x0adb, %pstate
	.word 0x91d02035  ! 1562: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_lsu_220:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1563: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790228b  ! 1564: WRPR_TT_I	wrpr	%r0, 0x028b, %tt
	.word 0x87802004  ! 1565: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8fa01a6b  ! 1566: FqTOi	fqtoi	
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 1567: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xce47c000  ! 1568: LDSW_R	ldsw	[%r31 + %r0], %r7
splash_cmpr_221:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1570: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1846001  ! 1569: WR_STICK_REG_I	wr	%r17, 0x0001, %-
	.word 0x8d90245d  ! 1570: WRPR_PSTATE_I	wrpr	%r0, 0x045d, %pstate
	.word 0x8198281e  ! 1571: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081e, %hpstate
	.word 0x91d02030  ! 1572: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xce8804a0  ! 1573: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1574: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_222:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 1576: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902e52  ! 1577: WRPR_PSTATE_I	wrpr	%r0, 0x0e52, %pstate
	.word 0x87802088  ! 1578: WRASI_I	wr	%r0, 0x0088, %asi
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1579: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_223:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1580: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_224:
	.word 0x34800001  ! 1582: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1581: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1582: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 1583: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87802080  ! 1584: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x3c700001  ! 1585: BPPOS	<illegal instruction>
	.word 0x8f45c000  ! 1586: RD_TICK_CMPR_REG	rd	%-, %r7
	.word 0x93902002  ! 1587: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xce9fc020  ! 1588: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa190200e  ! 1590: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1591: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x36700001  ! 1592: BPGE	<illegal instruction>
	.word 0x8d902c5d  ! 1593: WRPR_PSTATE_I	wrpr	%r0, 0x0c5d, %pstate
	.word 0xa190200a  ! 1594: WRPR_GL_I	wrpr	%r0, 0x000a, %-
change_to_tl1_225:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1596: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83a0054a  ! 1597: FSQRTd	fsqrt	
	.word 0xb4862001  ! 1598: ADDcc_I	addcc 	%r24, 0x0001, %r26
	.word 0xf48008a0  ! 1599: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0x81982b54  ! 1600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b54, %hpstate
	.word 0xa1902008  ! 1601: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x30700001  ! 1602: BPA	<illegal instruction>
splash_tba_226:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1603: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1604: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1605: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1606: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 1607: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9f802001  ! 1608: SIR	sir	0x0001
reduce_priv_level_227:
	.word 0x8f902001  ! 1610: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89830006  ! 1609: WRTICK_R	wr	%r12, %r6, %tick
DS_228:
	.word 0x32800001  ! 1611: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x97a00557  ! 1611: FSQRTd	fsqrt	
	.word 0xaba24825  ! 1610: FADDs	fadds	%f9, %f5, %f21
	.word 0x81982fdf  ! 1611: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdf, %hpstate
	.word 0x819824c6  ! 1612: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c6, %hpstate
	.word 0xea9fc020  ! 1613: LDDA_R	ldda	[%r31, %r0] 0x01, %r21
splash_lsu_229:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1614: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902108  ! 1615: WRPR_TT_I	wrpr	%r0, 0x0108, %tt
DS_230:
	.word 0x32800001  ! 1617: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1616: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d802000  ! 1617: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902173  ! 1618: WRPR_TT_I	wrpr	%r0, 0x0173, %tt
	.word 0x91d02030  ! 1619: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902005  ! 1620: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8ac4a001  ! 1621: ADDCcc_I	addccc 	%r18, 0x0001, %r5
	.word 0xca7fe001  ! 1622: SWAP_I	swap	%r5, [%r31 + 0x0001]
	ta	T_CHANGE_PRIV	! macro
	.word 0xcad004a0  ! 1624: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0x91d02033  ! 1625: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8951c000  ! 1626: RDPR_TL	rdpr	%tl, %r4
	.word 0x91d02030  ! 1627: Tcc_I	ta	icc_or_xcc, %r0 + 48
splash_htba_231:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1628: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802000  ! 1629: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879021d8  ! 1630: WRPR_TT_I	wrpr	%r0, 0x01d8, %tt
	.word 0xc88008a0  ! 1631: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0xc8d80e40  ! 1632: LDXA_R	ldxa	[%r0, %r0] 0x72, %r4
splash_lsu_232:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1633: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_233:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1634: WRPR_TBA_R	wrpr	%r0, %r2, %tba
reduce_priv_level_234:
	.word 0x8f902000  ! 1636: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1a0196b  ! 1635: FqTOd	dis not found

	.word 0xa7a6cd2c  ! 1636: FsMULd	fsmuld	%f27, %f12, %f50
splash_lsu_235:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1637: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 1638: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x879022be  ! 1639: WRPR_TT_I	wrpr	%r0, 0x02be, %tt
splash_htba_236:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1640: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xad51c000  ! 1641: RDPR_TL	rdpr	%tl, %r22
	.word 0x9f802001  ! 1642: SIR	sir	0x0001
	.word 0x879023c8  ! 1643: WRPR_TT_I	wrpr	%r0, 0x03c8, %tt
	.word 0x87902162  ! 1644: WRPR_TT_I	wrpr	%r0, 0x0162, %tt
change_to_randtl_237:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1645: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x926aa001  ! 1646: UDIVX_I	udivx 	%r10, 0x0001, %r9
	.word 0x93902002  ! 1647: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9bb24ff2  ! 1648: FONES	fones	%f13
splash_cmpr_238:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182e001  ! 1649: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0xb5a01a64  ! 1650: FqTOi	fqtoi	
splash_lsu_239:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1651: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xf48008a0  ! 1652: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0x8b494000  ! 1653: RDHPR_HTBA	rdhpr	%htba, %r5
splash_cmpr_240:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181a001  ! 1654: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x81982f54  ! 1655: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f54, %hpstate
	.word 0x91d02033  ! 1656: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xca800b40  ! 1657: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r5
	.word 0xa350c000  ! 1658: RDPR_TT	rdpr	%tt, %r17
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879022a0  ! 1660: WRPR_TT_I	wrpr	%r0, 0x02a0, %tt
	.word 0x87902255  ! 1661: WRPR_TT_I	wrpr	%r0, 0x0255, %tt
	.word 0x8198265f  ! 1662: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065f, %hpstate
	.word 0x8d90261c  ! 1663: WRPR_PSTATE_I	wrpr	%r0, 0x061c, %pstate
	.word 0x91d02033  ! 1664: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x906e6001  ! 1665: UDIVX_I	udivx 	%r25, 0x0001, %r8
	.word 0xd0bfc024  ! 1666: STDA_R	stda	%r8, [%r31 + %r4] 0x01
	.word 0x9f802001  ! 1667: SIR	sir	0x0001
	.word 0x8d9020cd  ! 1668: WRPR_PSTATE_I	wrpr	%r0, 0x00cd, %pstate
	.word 0x81982746  ! 1669: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0746, %hpstate
	.word 0xa1902007  ! 1670: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_tba_241:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1671: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902a81  ! 1672: WRPR_PSTATE_I	wrpr	%r0, 0x0a81, %pstate
	.word 0x87802010  ! 1673: WRASI_I	wr	%r0, 0x0010, %asi
DS_242:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1674: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1902007  ! 1676: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	ta	T_CHANGE_PRIV	! macro
splash_htba_243:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1678: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902002  ! 1679: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_244:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1680: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87902143  ! 1681: WRPR_TT_I	wrpr	%r0, 0x0143, %tt
	.word 0x91d02031  ! 1682: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_245:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1683: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xd117c000  ! 1684: LDQF_R	-	[%r31, %r0], %f8
DS_246:
	.word 0x22800001  ! 1686: BE	be,a	<label_0x1>
	allclean
	.word 0x83b1830a  ! 1685: ALLIGNADDRESS	alignaddr	%r6, %r10, %r1
	.word 0x93902007  ! 1686: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902009  ! 1687: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_cmpr_247:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1689: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186e001  ! 1688: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0x8790212f  ! 1689: WRPR_TT_I	wrpr	%r0, 0x012f, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1690: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_248:
	.word 0x20800001  ! 1692: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1691: SAVE_R	save	%r31, %r0, %r31
DS_249:
	.word 0x22800001  ! 1693: BE	be,a	<label_0x1>
	.word 0xc332c019  ! 1693: STQF_R	-	%f1, [%r25, %r11]
	normalw
	.word 0x89458000  ! 1692: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8d902a95  ! 1693: WRPR_PSTATE_I	wrpr	%r0, 0x0a95, %pstate
	.word 0x99902000  ! 1694: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xaac4e001  ! 1695: ADDCcc_I	addccc 	%r19, 0x0001, %r21
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1696: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d90265e  ! 1697: WRPR_PSTATE_I	wrpr	%r0, 0x065e, %pstate
	.word 0x83d02032  ! 1698: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x93902004  ! 1699: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xb1a000c9  ! 1700: FNEGd	fnegd	%f40, %f24
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xf08804a0  ! 1702: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0xaa6ae001  ! 1703: UDIVX_I	udivx 	%r11, 0x0001, %r21
	.word 0xea8008a0  ! 1704: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0xa150c000  ! 1705: RDPR_TT	rdpr	%tt, %r16
	.word 0xe097e010  ! 1706: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r16
	.word 0x8d802004  ! 1707: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_tba_250:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1708: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe117c000  ! 1709: LDQF_R	-	[%r31, %r0], %f16
	.word 0x98d22001  ! 1710: UMULcc_I	umulcc 	%r8, 0x0001, %r12
	.word 0x93902002  ! 1711: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902002  ! 1712: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x89a1c9c1  ! 1713: FDIVd	fdivd	%f38, %f32, %f4
splash_lsu_251:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1714: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982a15  ! 1715: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a15, %hpstate
	.word 0x81982cc7  ! 1716: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc7, %hpstate
	.word 0x91d02032  ! 1717: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87902277  ! 1718: WRPR_TT_I	wrpr	%r0, 0x0277, %tt
	.word 0x93902002  ! 1719: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982257  ! 1720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0257, %hpstate
	.word 0xa190200c  ! 1721: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x9750c000  ! 1722: RDPR_TT	rdpr	%tt, %r11
	.word 0xa3a000d8  ! 1723: FNEGd	fnegd	%f24, %f48
DS_252:
	.word 0x22800001  ! 1725: BE	be,a	<label_0x1>
	.word 0xe7334000  ! 1725: STQF_R	-	%f19, [%r0, %r13]
	normalw
	.word 0x91458000  ! 1724: RD_SOFTINT_REG	rd	%softint, %r8
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1725: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 1726: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1a54d22  ! 1727: FsMULd	fsmuld	%f21, %f2, %f16
change_to_tl1_253:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02032  ! 1729: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xab494000  ! 1730: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0x879020f0  ! 1731: WRPR_TT_I	wrpr	%r0, 0x00f0, %tt
	.word 0x8d902a50  ! 1732: WRPR_PSTATE_I	wrpr	%r0, 0x0a50, %pstate
splash_cmpr_254:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1806001  ! 1733: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0xaba00544  ! 1734: FSQRTd	fsqrt	
	.word 0xeaffc024  ! 1735: SWAPA_R	swapa	%r21, [%r31 + %r4] 0x01
change_to_randtl_255:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1736: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x91d02034  ! 1737: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x97a0056b  ! 1738: FSQRTq	fsqrt	
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1739: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_256:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902002  ! 1741: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8286e001  ! 1742: ADDcc_I	addcc 	%r27, 0x0001, %r1
	.word 0x8b51c000  ! 1743: RDPR_TL	rdpr	%tl, %r5
	.word 0xcac7e000  ! 1744: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r5
	.word 0x91d02030  ! 1745: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d9028da  ! 1746: WRPR_PSTATE_I	wrpr	%r0, 0x08da, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1747: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 1748: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x97a689ad  ! 1750: FDIVs	fdivs	%f26, %f13, %f11
	.word 0xa8682001  ! 1751: UDIVX_I	udivx 	%r0, 0x0001, %r20
splash_tba_257:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1752: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902007  ! 1753: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8284a001  ! 1754: ADDcc_I	addcc 	%r18, 0x0001, %r1
	.word 0x8d802004  ! 1755: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d9020d1  ! 1756: WRPR_PSTATE_I	wrpr	%r0, 0x00d1, %pstate
splash_lsu_258:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1757: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93480000  ! 1758: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x81982f4d  ! 1759: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4d, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1760: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200b  ! 1761: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x91d02031  ! 1762: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81982b94  ! 1763: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b94, %hpstate
	.word 0xa3a189d8  ! 1764: FDIVd	fdivd	%f6, %f24, %f48
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1765: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879020ee  ! 1766: WRPR_TT_I	wrpr	%r0, 0x00ee, %tt
	.word 0x8d902244  ! 1767: WRPR_PSTATE_I	wrpr	%r0, 0x0244, %pstate
splash_htba_259:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1768: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902843  ! 1769: WRPR_PSTATE_I	wrpr	%r0, 0x0843, %pstate
	.word 0xa1902001  ! 1770: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x92fe000d  ! 1771: SDIVcc_R	sdivcc 	%r24, %r13, %r9
	.word 0x91d02031  ! 1772: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa190200f  ! 1773: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x93902003  ! 1774: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d802000  ! 1775: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902001  ! 1776: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x38700001  ! 1777: BPGU	<illegal instruction>
	.word 0x99508000  ! 1778: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0xa1902008  ! 1779: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1780: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 1781: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8ba01a6d  ! 1782: FqTOi	fqtoi	
	.word 0x93902005  ! 1783: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d802004  ! 1784: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_260:
	.word 0x32800001  ! 1786: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1785: RESTORE_R	restore	%r31, %r0, %r31
splash_htba_261:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1786: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902a16  ! 1787: WRPR_PSTATE_I	wrpr	%r0, 0x0a16, %pstate
	.word 0xa190200a  ! 1788: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1789: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902202  ! 1790: WRPR_TT_I	wrpr	%r0, 0x0202, %tt
	.word 0xca8008a0  ! 1791: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8d90200c  ! 1792: WRPR_PSTATE_I	wrpr	%r0, 0x000c, %pstate
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1793: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81504000  ! 1794: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0x81460000  ! 1795: RD_STICK_REG	stbar
	.word 0x91684003  ! 1796: SDIVX_R	sdivx	%r1, %r3, %r8
	.word 0x93688012  ! 1797: SDIVX_R	sdivx	%r2, %r18, %r9
splash_lsu_262:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1798: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_PRIV	! macro
	.word 0x99902000  ! 1800: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x83d02030  ! 1801: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xa1902001  ! 1802: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x83d02031  ! 1803: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xa1902000  ! 1804: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_TO_TL0	! macro
splash_htba_263:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1806: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902000  ! 1807: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902607  ! 1808: WRPR_PSTATE_I	wrpr	%r0, 0x0607, %pstate
change_to_randtl_264:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1809: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8f702001  ! 1810: POPC_I	popc	0x0001, %r7
splash_cmpr_265:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1812: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1852001  ! 1811: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	.word 0x87a00545  ! 1812: FSQRTd	fsqrt	
	.word 0xc68008a0  ! 1813: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x9f802001  ! 1814: SIR	sir	0x0001
	.word 0xc6d7e010  ! 1815: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r3
DS_266:
	.word 0x22800001  ! 1817: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1816: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc7e7c025  ! 1817: CASA_I	casa	[%r31] 0x 1, %r5, %r3
splash_cmpr_267:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1819: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1826001  ! 1818: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0x8cd28005  ! 1819: UMULcc_R	umulcc 	%r10, %r5, %r6
	.word 0x8790209d  ! 1820: WRPR_TT_I	wrpr	%r0, 0x009d, %tt
splash_lsu_268:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1821: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_tba_269:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1822: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982bc5  ! 1823: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc5, %hpstate
	.word 0xcc57e001  ! 1824: LDSH_I	ldsh	[%r31 + 0x0001], %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902003  ! 1826: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982585  ! 1827: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0585, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1828: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 1829: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982acd  ! 1830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acd, %hpstate
	.word 0x81982404  ! 1831: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0404, %hpstate
	.word 0x81508000  ! 1832: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x879023a5  ! 1833: WRPR_TT_I	wrpr	%r0, 0x03a5, %tt
	.word 0xc0d804a0  ! 1834: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
	.word 0x93902004  ! 1835: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x83d02032  ! 1836: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xa1902000  ! 1837: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d02032  ! 1838: Tcc_I	ta	icc_or_xcc, %r0 + 50
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1839: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7514000  ! 1840: RDPR_TBA	rdpr	%tba, %r19
	.word 0x8f702001  ! 1841: POPC_I	popc	0x0001, %r7
	.word 0xcec80e40  ! 1842: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8790238a  ! 1844: WRPR_TT_I	wrpr	%r0, 0x038a, %tt
splash_cmpr_270:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180e001  ! 1845: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x8d902298  ! 1846: WRPR_PSTATE_I	wrpr	%r0, 0x0298, %pstate
	.word 0x97464000  ! 1847: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0xd6800a80  ! 1848: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r11
	.word 0xb06b000d  ! 1849: UDIVX_R	udivx 	%r12, %r13, %r24
	.word 0x81982e84  ! 1850: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e84, %hpstate
	.word 0x91d02031  ! 1851: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902003  ! 1852: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xf08008a0  ! 1853: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x87802004  ! 1854: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8afce001  ! 1855: SDIVcc_I	sdivcc 	%r19, 0x0001, %r5
	.word 0x879021d7  ! 1856: WRPR_TT_I	wrpr	%r0, 0x01d7, %tt
	.word 0x85508000  ! 1857: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0xb1480000  ! 1858: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
change_to_tl1_271:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x90d0c014  ! 1861: UMULcc_R	umulcc 	%r3, %r20, %r8
	.word 0x83d02030  ! 1862: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x879023d1  ! 1863: WRPR_TT_I	wrpr	%r0, 0x03d1, %tt
	.word 0x8d9026cb  ! 1864: WRPR_PSTATE_I	wrpr	%r0, 0x06cb, %pstate
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1865: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902618  ! 1867: WRPR_PSTATE_I	wrpr	%r0, 0x0618, %pstate
	.word 0x8d902008  ! 1868: WRPR_PSTATE_I	wrpr	%r0, 0x0008, %pstate
DS_272:
	.word 0x34800001  ! 1870: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1869: SAVE_R	save	%r31, %r0, %r31
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1902003  ! 1871: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902000  ! 1872: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87902380  ! 1873: WRPR_TT_I	wrpr	%r0, 0x0380, %tt
	.word 0x91d02030  ! 1874: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x87504000  ! 1875: RDPR_TNPC	rdpr	%tnpc, %r3
splash_htba_273:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1876: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87802080  ! 1877: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93902004  ! 1878: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x83504000  ! 1879: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x8d902ed4  ! 1880: WRPR_PSTATE_I	wrpr	%r0, 0x0ed4, %pstate
change_to_tl1_274:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa190200c  ! 1882: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d902c48  ! 1883: WRPR_PSTATE_I	wrpr	%r0, 0x0c48, %pstate
change_to_tl1_275:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8790236a  ! 1886: WRPR_TT_I	wrpr	%r0, 0x036a, %tt
	.word 0x9f802001  ! 1887: SIR	sir	0x0001
	.word 0x87902362  ! 1888: WRPR_TT_I	wrpr	%r0, 0x0362, %tt
	.word 0x81982bcc  ! 1889: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcc, %hpstate
	.word 0x8d902450  ! 1890: WRPR_PSTATE_I	wrpr	%r0, 0x0450, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc2d7e030  ! 1892: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r1
	.word 0x8790220f  ! 1893: WRPR_TT_I	wrpr	%r0, 0x020f, %tt
	.word 0xa190200a  ! 1894: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93902006  ! 1895: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x85b1cff1  ! 1896: FONES	fones	%f2
	.word 0x80c6e001  ! 1897: ADDCcc_I	addccc 	%r27, 0x0001, %r0
	.word 0x8f514000  ! 1898: RDPR_TBA	rdpr	%tba, %r7
	.word 0x8d802004  ! 1899: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982605  ! 1900: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0605, %hpstate
	.word 0x87902243  ! 1901: WRPR_TT_I	wrpr	%r0, 0x0243, %tt
	.word 0xab540000  ! 1902: RDPR_GL	rdpr	%-, %r21
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1903: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xeb27c011  ! 1904: STF_R	st	%f21, [%r17, %r31]
DS_276:
	.word 0x20800001  ! 1906: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1905: SAVE_R	save	%r31, %r0, %r31
	.word 0xea880e40  ! 1906: LDUBA_R	lduba	[%r0, %r0] 0x72, %r21
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1907: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 1908: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d802004  ! 1909: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1910: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_277:
	.word 0x20800001  ! 1912: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1911: SAVE_R	save	%r31, %r0, %r31
	.word 0xb3a01a69  ! 1912: FqTOi	fqtoi	
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1913: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 1914: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d902e57  ! 1915: WRPR_PSTATE_I	wrpr	%r0, 0x0e57, %pstate
	.word 0x22800001  ! 1916: BE	be,a	<label_0x1>
	.word 0x91d02034  ! 1917: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d02032  ! 1918: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xf2c804a0  ! 1919: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r25
	.word 0x8d902c07  ! 1920: WRPR_PSTATE_I	wrpr	%r0, 0x0c07, %pstate
	.word 0x89a18dd3  ! 1921: FdMULq	fdmulq	
	.word 0x8db0cfe7  ! 1922: FONES	fones	%f6
	.word 0xa2836001  ! 1923: ADDcc_I	addcc 	%r13, 0x0001, %r17
DS_278:
	.word 0x20800001  ! 1925: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1924: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_279:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1926: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180e001  ! 1925: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200f  ! 1927: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	ta	T_CHANGE_TO_TL0	! macro
splash_lsu_280:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1929: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_htba_281:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1930: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902004  ! 1931: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xe317c000  ! 1932: LDQF_R	-	[%r31, %r0], %f17
	.word 0x9ba00573  ! 1933: FSQRTq	fsqrt	
splash_tba_282:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1934: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02032  ! 1935: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02030  ! 1936: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xda77e001  ! 1937: STX_I	stx	%r13, [%r31 + 0x0001]
	.word 0x8d902287  ! 1938: WRPR_PSTATE_I	wrpr	%r0, 0x0287, %pstate
	.word 0x81982ec6  ! 1939: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec6, %hpstate
	.word 0x8d902c99  ! 1940: WRPR_PSTATE_I	wrpr	%r0, 0x0c99, %pstate
	.word 0x8b494000  ! 1941: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0x9f802001  ! 1942: SIR	sir	0x0001
	.word 0x87902047  ! 1943: WRPR_TT_I	wrpr	%r0, 0x0047, %tt
	.word 0x34800001  ! 1944: BG	bg,a	<label_0x1>
splash_htba_283:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1945: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02035  ! 1946: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_tl1_284:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902846  ! 1948: WRPR_PSTATE_I	wrpr	%r0, 0x0846, %pstate
	.word 0x81982e87  ! 1949: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e87, %hpstate
	.word 0x93902003  ! 1950: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_285:
	.word 0x32800001  ! 1952: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1952: BG	bg,a	<label_0x1>
	.word 0xf515c000  ! 1952: LDQF_R	-	[%r23, %r0], %f26
	.word 0x8fa54828  ! 1951: FADDs	fadds	%f21, %f8, %f7
	.word 0xa7480000  ! 1952: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
splash_htba_286:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1953: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902009  ! 1954: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d802000  ! 1955: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x22700001  ! 1956: BPE	<illegal instruction>
splash_cmpr_287:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1958: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1802001  ! 1957: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	.word 0x87802088  ! 1958: WRASI_I	wr	%r0, 0x0088, %asi
splash_cmpr_288:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1822001  ! 1959: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	.word 0xe7e7c028  ! 1960: CASA_I	casa	[%r31] 0x 1, %r8, %r19
	.word 0x87902194  ! 1961: WRPR_TT_I	wrpr	%r0, 0x0194, %tt
	.word 0xb1a00557  ! 1962: FSQRTd	fsqrt	
	.word 0x93902002  ! 1963: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_289:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 1964: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902013  ! 1965: WRPR_PSTATE_I	wrpr	%r0, 0x0013, %pstate
	.word 0x8198219e  ! 1966: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019e, %hpstate
	.word 0x22700001  ! 1967: BPE	<illegal instruction>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1968: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8882e001  ! 1969: ADDcc_I	addcc 	%r11, 0x0001, %r4
	.word 0x99902001  ! 1970: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8d902a0c  ! 1971: WRPR_PSTATE_I	wrpr	%r0, 0x0a0c, %pstate
	.word 0x8d802000  ! 1972: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d02031  ! 1973: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xb2aec000  ! 1974: ANDNcc_R	andncc 	%r27, %r0, %r25
	.word 0x87902025  ! 1975: WRPR_TT_I	wrpr	%r0, 0x0025, %tt
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8fb28fe6  ! 1978: FONES	fones	%f7
	.word 0x8d802004  ! 1979: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa3480000  ! 1980: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x93902002  ! 1981: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91504000  ! 1982: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0xa1902008  ! 1983: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_290:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1984: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	ta	T_CHANGE_TO_TL0	! macro
DS_291:
	.word 0x22800001  ! 1987: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1986: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_292:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1987: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d9020d0  ! 1988: WRPR_PSTATE_I	wrpr	%r0, 0x00d0, %pstate
	.word 0x879021e6  ! 1989: WRPR_TT_I	wrpr	%r0, 0x01e6, %tt
DS_293:
	.word 0x22800001  ! 1991: BE	be,a	<label_0x1>
	.word 0xdb30a001  ! 1991: STQF_I	-	%f13, [0x0001, %r2]
	normalw
	.word 0xb5458000  ! 1990: RD_SOFTINT_REG	rd	%softint, %r26
	.word 0x8d902e01  ! 1991: WRPR_PSTATE_I	wrpr	%r0, 0x0e01, %pstate
	.word 0x826a8005  ! 1992: UDIVX_R	udivx 	%r10, %r5, %r1
	.word 0xc28008a0  ! 1993: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xa3a149d2  ! 1994: FDIVd	fdivd	%f36, %f18, %f48
	.word 0xe28008a0  ! 1995: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x87802004  ! 1996: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8081e001  ! 1997: ADDcc_I	addcc 	%r7, 0x0001, %r0
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1998: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc127e001  ! 1999: STF_I	st	%f0, [0x0001, %r31]
	.word 0x87802089  ! 2000: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982956  ! 2001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0956, %hpstate
	.word 0xa190200c  ! 2002: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x91d02033  ! 2003: Tcc_I	ta	icc_or_xcc, %r0 + 51
reduce_priv_level_294:
	.word 0x8f902000  ! 2005: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x85a0196b  ! 2004: FqTOd	dis not found

	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2005: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x36800001  ! 2006: BGE	bge,a	<label_0x1>
	.word 0xb06b6001  ! 2007: UDIVX_I	udivx 	%r13, 0x0001, %r24
	.word 0x93902000  ! 2008: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_htba_295:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2009: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2010: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902007  ! 2012: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d02035  ! 2013: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0x97494000  ! 2015: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0x81504000  ! 2016: RDPR_TNPC	rdpr	%tnpc, %r0
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2017: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 2018: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 2019: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 2020: Tcc_I	ta	icc_or_xcc, %r0 + 48
DS_296:
	.word 0x34800001  ! 2022: BG	bg,a	<label_0x1>
	illtrap
	.word 0xa5a00547  ! 2022: FSQRTd	fsqrt	
	.word 0x9ba18826  ! 2021: FADDs	fadds	%f6, %f6, %f13
	.word 0x8790225c  ! 2022: WRPR_TT_I	wrpr	%r0, 0x025c, %tt
	.word 0x8d802000  ! 2023: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02035  ! 2024: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902008  ! 2025: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93902003  ! 2026: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8198260e  ! 2027: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060e, %hpstate
splash_lsu_297:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2028: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902a5c  ! 2029: WRPR_PSTATE_I	wrpr	%r0, 0x0a5c, %pstate
	.word 0x91d02031  ! 2030: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8790224d  ! 2031: WRPR_TT_I	wrpr	%r0, 0x024d, %tt
	.word 0x87902397  ! 2032: WRPR_TT_I	wrpr	%r0, 0x0397, %tt
	.word 0x8d90285f  ! 2033: WRPR_PSTATE_I	wrpr	%r0, 0x085f, %pstate
	.word 0xda57e001  ! 2034: LDSH_I	ldsh	[%r31 + 0x0001], %r13
DS_298:
	.word 0x20800001  ! 2036: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 2035: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200e  ! 2036: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa190200a  ! 2037: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8ed90004  ! 2038: SMULcc_R	smulcc 	%r4, %r4, %r7
	.word 0x93d02034  ! 2039: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x9f802001  ! 2040: SIR	sir	0x0001
	.word 0x93902007  ! 2041: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xce2fc004  ! 2042: STB_R	stb	%r7, [%r31 + %r4]
	.word 0x36700001  ! 2043: BPGE	<illegal instruction>
	.word 0x93902003  ! 2044: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
reduce_priv_level_299:
	.word 0x8f902000  ! 2046: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16c6001  ! 2045: SDIVX_I	sdivx	%r17, 0x0001, %r16
	.word 0x819821c6  ! 2046: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c6, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 2048: SIR	sir	0x0001
	.word 0x8d902c8d  ! 2049: WRPR_PSTATE_I	wrpr	%r0, 0x0c8d, %pstate
	.word 0x81982644  ! 2050: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0644, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
splash_cmpr_300:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1826001  ! 2052: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0xe0cfe010  ! 2053: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r16
	.word 0x87802088  ! 2054: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xe037c004  ! 2055: STH_R	sth	%r16, [%r31 + %r4]
	.word 0xb56a0019  ! 2056: SDIVX_R	sdivx	%r8, %r25, %r26
DS_301:
	.word 0x34800001  ! 2058: BG	bg,a	<label_0x1>
	.word 0xf1332001  ! 2058: STQF_I	-	%f24, [0x0001, %r12]
	normalw
	.word 0x95458000  ! 2057: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8fa6cd3b  ! 2058: FsMULd	fsmuld	%f27, %f58, %f38
	.word 0xce17e001  ! 2059: LDUH_I	lduh	[%r31 + 0x0001], %r7
	.word 0x8f6a0009  ! 2060: SDIVX_R	sdivx	%r8, %r9, %r7
	.word 0x8198235d  ! 2061: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035d, %hpstate
	.word 0xb3a0c9b5  ! 2062: FDIVs	fdivs	%f3, %f21, %f25
splash_cmpr_302:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180e001  ! 2063: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x91d02032  ! 2064: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 2065: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa3a01a78  ! 2066: FqTOi	fqtoi	
	.word 0x34800001  ! 2067: BG	bg,a	<label_0x1>
	.word 0xada000da  ! 2068: FNEGd	fnegd	%f26, %f22
	.word 0x8d9020d9  ! 2069: WRPR_PSTATE_I	wrpr	%r0, 0x00d9, %pstate
	.word 0x93d02031  ! 2070: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8d9028d0  ! 2071: WRPR_PSTATE_I	wrpr	%r0, 0x08d0, %pstate
	.word 0x93902004  ! 2072: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x98fac003  ! 2073: SDIVcc_R	sdivcc 	%r11, %r3, %r12
	.word 0x8d802004  ! 2074: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xb5a00543  ! 2075: FSQRTd	fsqrt	
	.word 0x34800001  ! 2076: BG	bg,a	<label_0x1>
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2077: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 2078: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982c47  ! 2079: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c47, %hpstate
change_to_randtl_303:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 2080: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8482e001  ! 2081: ADDcc_I	addcc 	%r11, 0x0001, %r2
	ta	T_CHANGE_TO_TL0	! macro
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2083: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb36b4014  ! 2084: SDIVX_R	sdivx	%r13, %r20, %r25
	.word 0x93902005  ! 2085: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87802080  ! 2086: WRASI_I	wr	%r0, 0x0080, %asi
splash_htba_304:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2087: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200e  ! 2088: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x81460000  ! 2089: RD_STICK_REG	stbar
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2090: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2091: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982cc7  ! 2092: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc7, %hpstate
	.word 0xb6fe8003  ! 2093: SDIVcc_R	sdivcc 	%r26, %r3, %r27
	.word 0xf627c003  ! 2094: STW_R	stw	%r27, [%r31 + %r3]
	.word 0xa1902009  ! 2095: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x9069000d  ! 2096: UDIVX_R	udivx 	%r4, %r13, %r8
splash_cmpr_305:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2098: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1816001  ! 2097: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0x9f802001  ! 2098: SIR	sir	0x0001
	.word 0xd08fe000  ! 2099: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r8
	.word 0x8d902c0c  ! 2100: WRPR_PSTATE_I	wrpr	%r0, 0x0c0c, %pstate
	.word 0x8f514000  ! 2101: RDPR_TBA	rdpr	%tba, %r7
	.word 0x8d902607  ! 2102: WRPR_PSTATE_I	wrpr	%r0, 0x0607, %pstate
splash_cmpr_306:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 2103: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x879021ca  ! 2104: WRPR_TT_I	wrpr	%r0, 0x01ca, %tt
	.word 0xa56a0001  ! 2105: SDIVX_R	sdivx	%r8, %r1, %r18
	.word 0x8b494000  ! 2106: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0x93902005  ! 2107: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
change_to_tl1_307:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xca3fc001  ! 2110: STD_R	std	%r5, [%r31 + %r1]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982445  ! 2112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0445, %hpstate
	.word 0xaa81a001  ! 2113: ADDcc_I	addcc 	%r6, 0x0001, %r21
	.word 0x819829c5  ! 2114: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c5, %hpstate
	.word 0xb0d0800d  ! 2115: UMULcc_R	umulcc 	%r2, %r13, %r24
	.word 0xf0bfc02d  ! 2116: STDA_R	stda	%r24, [%r31 + %r13] 0x01
reduce_priv_level_308:
	.word 0x8f902000  ! 2118: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 2117: SIAM	siam	1
	ta	T_CHANGE_HPRIV	! macro
	.word 0xb5500000  ! 2119: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8198270c  ! 2120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070c, %hpstate
	.word 0xf48008a0  ! 2121: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0xf44fe001  ! 2122: LDSB_I	ldsb	[%r31 + 0x0001], %r26
	.word 0x93902004  ! 2123: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81982b8c  ! 2124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8c, %hpstate
	.word 0x93902003  ! 2125: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 2126: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 2127: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8198250c  ! 2128: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050c, %hpstate
	.word 0x93902004  ! 2129: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2130: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 2131: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8a81a001  ! 2132: ADDcc_I	addcc 	%r6, 0x0001, %r5
	.word 0x93902002  ! 2133: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x99902000  ! 2134: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xca1fe001  ! 2135: LDD_I	ldd	[%r31 + 0x0001], %r5
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 2136: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2137: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8edd4008  ! 2138: SMULcc_R	smulcc 	%r21, %r8, %r7
	.word 0x87802080  ! 2139: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xb4d52001  ! 2140: UMULcc_I	umulcc 	%r20, 0x0001, %r26
	.word 0x8ac16001  ! 2141: ADDCcc_I	addccc 	%r5, 0x0001, %r5
	.word 0x93d02033  ! 2142: Tcc_I	tne	icc_or_xcc, %r0 + 51
splash_tba_309:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 2143: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x85a01a64  ! 2144: FqTOi	fqtoi	
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 2145: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 2146: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x88de4000  ! 2147: SMULcc_R	smulcc 	%r25, %r0, %r4
	.word 0xa1494000  ! 2148: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0x91d02033  ! 2149: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe09fc020  ! 2150: LDDA_R	ldda	[%r31, %r0] 0x01, %r16
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2151: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 2152: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902007  ! 2153: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8198265c  ! 2154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065c, %hpstate
	.word 0x819826cf  ! 2155: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06cf, %hpstate
	.word 0x8198288e  ! 2156: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088e, %hpstate
	.word 0x96d0e001  ! 2157: UMULcc_I	umulcc 	%r3, 0x0001, %r11
	.word 0x8d802000  ! 2158: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2159: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81a489b7  ! 2160: FDIVs	fdivs	%f18, %f23, %f0
	ta	T_CHANGE_TO_TL0	! macro
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 2162: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x96f9c005  ! 2163: SDIVcc_R	sdivcc 	%r7, %r5, %r11
	.word 0xd6c804a0  ! 2164: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r11
	.word 0x93902000  ! 2165: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9f802001  ! 2166: SIR	sir	0x0001
	.word 0xa1902000  ! 2167: WRPR_GL_I	wrpr	%r0, 0x0000, %-
change_to_randtl_310:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 2168: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x819829dc  ! 2169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09dc, %hpstate
	.word 0x92a80017  ! 2170: ANDNcc_R	andncc 	%r0, %r23, %r9
	.word 0x93902007  ! 2171: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xae82c00a  ! 2172: ADDcc_R	addcc 	%r11, %r10, %r23
	.word 0x8d802000  ! 2173: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 2174: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb2f90013  ! 2175: SDIVcc_R	sdivcc 	%r4, %r19, %r25
change_to_randtl_311:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 2176: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 2177: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982c57  ! 2178: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c57, %hpstate
	.word 0x93902004  ! 2179: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d90229e  ! 2180: WRPR_PSTATE_I	wrpr	%r0, 0x029e, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2181: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf28008a0  ! 2182: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0xa1902002  ! 2183: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_htba_312:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 2184: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200b  ! 2185: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xa190200c  ! 2186: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x879020d1  ! 2187: WRPR_TT_I	wrpr	%r0, 0x00d1, %tt
	.word 0xf22fe001  ! 2188: STB_I	stb	%r25, [%r31 + 0x0001]
	ta	T_CHANGE_HPRIV	! macro
splash_cmpr_313:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2191: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184e001  ! 2190: WR_STICK_REG_I	wr	%r19, 0x0001, %-
	.word 0x8198294f  ! 2191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094f, %hpstate
	.word 0x85540000  ! 2192: RDPR_GL	rdpr	%-, %r2
	.word 0x83d02030  ! 2193: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x8d902848  ! 2194: WRPR_PSTATE_I	wrpr	%r0, 0x0848, %pstate
	.word 0x8d90225d  ! 2195: WRPR_PSTATE_I	wrpr	%r0, 0x025d, %pstate
	.word 0x91d02033  ! 2196: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d9028c3  ! 2197: WRPR_PSTATE_I	wrpr	%r0, 0x08c3, %pstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2198: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 2199: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x34800001  ! 2200: BG	bg,a	<label_0x1>
	.word 0xa1902001  ! 2201: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x89a0054a  ! 2202: FSQRTd	fsqrt	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc8ffc02a  ! 2204: SWAPA_R	swapa	%r4, [%r31 + %r10] 0x01
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2205: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb345c000  ! 2206: RD_TICK_CMPR_REG	rd	%-, %r25
	.word 0xaf702001  ! 2207: POPC_I	popc	0x0001, %r23
	.word 0x93902002  ! 2208: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02030  ! 2209: Tcc_I	ta	icc_or_xcc, %r0 + 48
change_to_randtl_314:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 2210: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 2211: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902609  ! 2212: WRPR_PSTATE_I	wrpr	%r0, 0x0609, %pstate
DS_315:
	.word 0x32800001  ! 2214: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 2213: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902003  ! 2214: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 2215: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8a690000  ! 2216: UDIVX_R	udivx 	%r4, %r0, %r5
	.word 0x8b68c005  ! 2217: SDIVX_R	sdivx	%r3, %r5, %r5
	.word 0x9f802001  ! 2218: SIR	sir	0x0001
	.word 0x9f802001  ! 2219: SIR	sir	0x0001
	.word 0x8780201c  ! 2220: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8d902cdf  ! 2221: WRPR_PSTATE_I	wrpr	%r0, 0x0cdf, %pstate
	.word 0x8198211f  ! 2222: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011f, %hpstate
	.word 0x81982607  ! 2223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0607, %hpstate
	.word 0x80fca001  ! 2224: SDIVcc_I	sdivcc 	%r18, 0x0001, %r0
	.word 0xb5500000  ! 2225: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x93902000  ! 2226: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02035  ! 2227: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902087  ! 2228: WRPR_TT_I	wrpr	%r0, 0x0087, %tt
	.word 0x879022c2  ! 2229: WRPR_TT_I	wrpr	%r0, 0x02c2, %tt
	.word 0x8afae001  ! 2230: SDIVcc_I	sdivcc 	%r11, 0x0001, %r5
	.word 0xa3a01a7b  ! 2231: FqTOi	fqtoi	
	.word 0x819823d6  ! 2232: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d6, %hpstate
	.word 0x83b60ffa  ! 2233: FONES	fones	%f1
	.word 0x82866001  ! 2234: ADDcc_I	addcc 	%r25, 0x0001, %r1
	.word 0xc29fe001  ! 2235: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x93902002  ! 2236: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982855  ! 2237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0855, %hpstate
	.word 0x8d90268e  ! 2238: WRPR_PSTATE_I	wrpr	%r0, 0x068e, %pstate
change_to_randtl_316:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 2239: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
splash_lsu_317:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2240: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 2241: SIR	sir	0x0001
	.word 0xc2880e80  ! 2242: LDUBA_R	lduba	[%r0, %r0] 0x74, %r1
	.word 0x99902001  ! 2243: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8ba0054a  ! 2244: FSQRTd	fsqrt	
	.word 0xa190200d  ! 2245: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x824c4012  ! 2246: MULX_R	mulx 	%r17, %r18, %r1
	.word 0x91d02032  ! 2247: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902050  ! 2248: WRPR_PSTATE_I	wrpr	%r0, 0x0050, %pstate
change_to_randtl_318:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 2249: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902002  ! 2251: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2252: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb56dc009  ! 2253: SDIVX_R	sdivx	%r23, %r9, %r26
	.word 0x93902005  ! 2254: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_319:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2255: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81982ac4  ! 2256: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac4, %hpstate
	.word 0xf47fe001  ! 2257: SWAP_I	swap	%r26, [%r31 + 0x0001]
	.word 0x8d902a5c  ! 2258: WRPR_PSTATE_I	wrpr	%r0, 0x0a5c, %pstate
	.word 0xb7a20dc6  ! 2259: FdMULq	fdmulq	
	.word 0x8d902404  ! 2260: WRPR_PSTATE_I	wrpr	%r0, 0x0404, %pstate
	.word 0xf6c004a0  ! 2261: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r27
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2262: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf737e001  ! 2263: STQF_I	-	%f27, [0x0001, %r31]
	.word 0x96f90013  ! 2264: SDIVcc_R	sdivcc 	%r4, %r19, %r11
	.word 0x91d02031  ! 2265: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8edd4001  ! 2266: SMULcc_R	smulcc 	%r21, %r1, %r7
	.word 0x81460000  ! 2267: RD_STICK_REG	stbar
	.word 0x83504000  ! 2268: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0xa190200c  ! 2269: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87802004  ! 2270: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02034  ! 2271: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 2272: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_320:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87802010  ! 2275: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x97a00550  ! 2276: FSQRTd	fsqrt	
	.word 0x8d802004  ! 2277: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9ba01a61  ! 2278: FqTOi	fqtoi	
	.word 0x93902001  ! 2279: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1902001  ! 2280: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8d902e59  ! 2281: WRPR_PSTATE_I	wrpr	%r0, 0x0e59, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xda9fe001  ! 2283: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0x9081c018  ! 2284: ADDcc_R	addcc 	%r7, %r24, %r8
DS_321:
	.word 0x32800001  ! 2286: BNE	bne,a	<label_0x1>
	allclean
	.word 0x85b24311  ! 2285: ALLIGNADDRESS	alignaddr	%r9, %r17, %r2
	.word 0x8198221e  ! 2286: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021e, %hpstate
	.word 0x8d90200a  ! 2287: WRPR_PSTATE_I	wrpr	%r0, 0x000a, %pstate
	.word 0x819827df  ! 2288: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
	.word 0x879021b3  ! 2289: WRPR_TT_I	wrpr	%r0, 0x01b3, %tt
	.word 0x8790203a  ! 2290: WRPR_TT_I	wrpr	%r0, 0x003a, %tt
	.word 0xc497e030  ! 2291: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r2
splash_htba_322:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2292: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2293: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2294: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902004  ! 2295: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_randtl_323:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 2296: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 2297: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc4d004a0  ! 2298: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r2
	.word 0x89702001  ! 2299: POPC_I	popc	0x0001, %r4
	.word 0x8d902a92  ! 2300: WRPR_PSTATE_I	wrpr	%r0, 0x0a92, %pstate
	.word 0xa1902008  ! 2301: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8da20dd4  ! 2302: FdMULq	fdmulq	
	.word 0x91d02033  ! 2303: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02034  ! 2304: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xcde7c034  ! 2305: CASA_I	casa	[%r31] 0x 1, %r20, %r6
splash_tba_324:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 2306: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8da00544  ! 2307: FSQRTd	fsqrt	
	.word 0x91d02032  ! 2308: Tcc_I	ta	icc_or_xcc, %r0 + 50
reduce_priv_level_325:
	.word 0x8f902002  ! 2310: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 2309: SIAM	siam	1
change_to_randtl_326:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 2310: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa1902004  ! 2311: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_tba_327:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 2312: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8ad30005  ! 2313: UMULcc_R	umulcc 	%r12, %r5, %r5
	.word 0x91d02030  ! 2314: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x81982e86  ! 2315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e86, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8ba209e8  ! 2318: FDIVq	dis not found

splash_htba_328:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2319: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x819820d5  ! 2320: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d5, %hpstate
	.word 0x81460000  ! 2321: RD_STICK_REG	stbar
	.word 0xa190200c  ! 2322: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d902c53  ! 2323: WRPR_PSTATE_I	wrpr	%r0, 0x0c53, %pstate
	.word 0x87902032  ! 2324: WRPR_TT_I	wrpr	%r0, 0x0032, %tt
	.word 0x8a4c0018  ! 2325: MULX_R	mulx 	%r16, %r24, %r5
	ta	T_CHANGE_PRIV	! macro
	.word 0xb6828003  ! 2327: ADDcc_R	addcc 	%r10, %r3, %r27
	.word 0x87494000  ! 2328: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0x92a88001  ! 2329: ANDNcc_R	andncc 	%r2, %r1, %r9
splash_cmpr_329:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2331: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1816001  ! 2330: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0xd28008a0  ! 2331: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x87902060  ! 2332: WRPR_TT_I	wrpr	%r0, 0x0060, %tt
	.word 0xd217c000  ! 2333: LDUH_R	lduh	[%r31 + %r0], %r9
	.word 0x93902006  ! 2334: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_PRIV	! macro
DS_330:
	.word 0x32800001  ! 2337: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xc3128019  ! 2337: LDQF_R	-	[%r10, %r25], %f1
	.word 0xafa6c831  ! 2336: FADDs	fadds	%f27, %f17, %f23
	.word 0x9f802001  ! 2337: SIR	sir	0x0001
	.word 0x8ac2a001  ! 2338: ADDCcc_I	addccc 	%r10, 0x0001, %r5
	.word 0x8d90249c  ! 2339: WRPR_PSTATE_I	wrpr	%r0, 0x049c, %pstate
	.word 0x8d902018  ! 2340: WRPR_PSTATE_I	wrpr	%r0, 0x0018, %pstate
	.word 0x93902001  ! 2341: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xcad7e020  ! 2342: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r5
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 2343: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8751c000  ! 2344: RDPR_TL	rdpr	%tl, %r3
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90280d  ! 2346: WRPR_PSTATE_I	wrpr	%r0, 0x080d, %pstate
	.word 0x93902002  ! 2347: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81a609c0  ! 2348: FDIVd	fdivd	%f24, %f0, %f0
	.word 0x99902005  ! 2349: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x819820cd  ! 2350: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00cd, %hpstate
	.word 0x85494000  ! 2351: RDHPR_HTBA	rdhpr	%htba, %r2
	.word 0x81982c15  ! 2352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c15, %hpstate
	.word 0x98fcc004  ! 2353: SDIVcc_R	sdivcc 	%r19, %r4, %r12
	.word 0xd8c004a0  ! 2354: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0xad702001  ! 2355: POPC_I	popc	0x0001, %r22
	ta	T_CHANGE_HPRIV	! macro
splash_lsu_331:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2357: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_332:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2358: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x28700001  ! 2359: BPLEU	<illegal instruction>
	.word 0x89a2cd2b  ! 2360: FsMULd	fsmuld	%f11, %f42, %f4
	.word 0xc81fc000  ! 2361: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xa1508000  ! 2362: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0xe097e000  ! 2363: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
	.word 0xe08008a0  ! 2364: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xa190200b  ! 2365: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x81982355  ! 2366: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0355, %hpstate
	.word 0x9f802001  ! 2367: SIR	sir	0x0001
	.word 0x87a609f9  ! 2368: FDIVq	dis not found

	.word 0xc62fe001  ! 2369: STB_I	stb	%r3, [%r31 + 0x0001]
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 2370: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x86498019  ! 2371: MULX_R	mulx 	%r6, %r25, %r3
reduce_priv_level_333:
	.word 0x8f902002  ! 2373: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xad6e2001  ! 2372: SDIVX_I	sdivx	%r24, 0x0001, %r22
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 2373: Tcc_R	ta	icc_or_xcc, %r0 + %r30
reduce_priv_level_334:
	.word 0x8f902001  ! 2375: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8b6a6001  ! 2374: SDIVX_I	sdivx	%r9, 0x0001, %r5
	.word 0x87902398  ! 2375: WRPR_TT_I	wrpr	%r0, 0x0398, %tt
reduce_priv_level_335:
	.word 0x8f902000  ! 2377: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 2376: SIAM	siam	1
	.word 0x879020f4  ! 2377: WRPR_TT_I	wrpr	%r0, 0x00f4, %tt
	.word 0x8d902ac0  ! 2378: WRPR_PSTATE_I	wrpr	%r0, 0x0ac0, %pstate
	.word 0x8198230f  ! 2379: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030f, %hpstate
	.word 0x87902050  ! 2380: WRPR_TT_I	wrpr	%r0, 0x0050, %tt
	.word 0xa190200d  ! 2381: WRPR_GL_I	wrpr	%r0, 0x000d, %-
change_to_randtl_336:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 2382: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x83d02034  ! 2383: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x93902007  ! 2384: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_htba_337:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2385: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902009  ! 2386: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902007  ! 2387: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2389: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 2390: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xca17c000  ! 2391: LDUH_R	lduh	[%r31 + %r0], %r5
	.word 0x8790238d  ! 2392: WRPR_TT_I	wrpr	%r0, 0x038d, %tt
	.word 0xcad7e020  ! 2393: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r5
	.word 0xab6ac008  ! 2394: SDIVX_R	sdivx	%r11, %r8, %r21
	.word 0x87802004  ! 2395: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02034  ! 2397: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 2398: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982286  ! 2399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0286, %hpstate
splash_lsu_338:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2400: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 2401: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa190200c  ! 2402: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x81982c57  ! 2403: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c57, %hpstate
	.word 0x81982544  ! 2404: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0544, %hpstate
DS_339:
	.word 0x20800001  ! 2406: BN	bn,a	<label_0x1>
	.word 0xc734401a  ! 2406: STQF_R	-	%f3, [%r26, %r17]
	normalw
	.word 0x87458000  ! 2405: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x24700001  ! 2406: BPLE	<illegal instruction>
	.word 0x98690012  ! 2407: UDIVX_R	udivx 	%r4, %r18, %r12
	.word 0x87902388  ! 2408: WRPR_TT_I	wrpr	%r0, 0x0388, %tt
	.word 0x90fb4010  ! 2409: SDIVcc_R	sdivcc 	%r13, %r16, %r8
change_to_tl1_340:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9482a001  ! 2411: ADDcc_I	addcc 	%r10, 0x0001, %r10
	.word 0x82f9a001  ! 2412: SDIVcc_I	sdivcc 	%r6, 0x0001, %r1
	.word 0x8d902e0d  ! 2413: WRPR_PSTATE_I	wrpr	%r0, 0x0e0d, %pstate
splash_htba_341:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2414: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9b500000  ! 2415: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x91d02032  ! 2416: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa9a00563  ! 2417: FSQRTq	fsqrt	
	.word 0x93a00543  ! 2418: FSQRTd	fsqrt	
	.word 0x93902003  ! 2419: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 2420: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8cdb001b  ! 2421: SMULcc_R	smulcc 	%r12, %r27, %r6
	.word 0x879021b7  ! 2422: WRPR_TT_I	wrpr	%r0, 0x01b7, %tt
	.word 0xa6d1c007  ! 2423: UMULcc_R	umulcc 	%r7, %r7, %r19
	.word 0x98f8000a  ! 2424: SDIVcc_R	sdivcc 	%r0, %r10, %r12
	.word 0xb5a0057a  ! 2425: FSQRTq	fsqrt	
splash_cmpr_342:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182e001  ! 2426: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0x81982156  ! 2427: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0156, %hpstate
	.word 0x81460000  ! 2428: RD_STICK_REG	stbar
splash_tba_343:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2429: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xb0d9801b  ! 2430: SMULcc_R	smulcc 	%r6, %r27, %r24
	.word 0x8d90248b  ! 2431: WRPR_PSTATE_I	wrpr	%r0, 0x048b, %pstate
	.word 0x81982806  ! 2432: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0806, %hpstate
DS_344:
	.word 0x32800001  ! 2434: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xed118006  ! 2434: LDQF_R	-	[%r6, %r6], %f22
	.word 0xa7a48838  ! 2433: FADDs	fadds	%f18, %f24, %f19
splash_tba_345:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 2434: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 2435: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa7504000  ! 2436: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x92d2000c  ! 2437: UMULcc_R	umulcc 	%r8, %r12, %r9
	.word 0x38800001  ! 2438: BGU	bgu,a	<label_0x1>
	.word 0x89a00566  ! 2439: FSQRTq	fsqrt	
	.word 0x8790218d  ! 2440: WRPR_TT_I	wrpr	%r0, 0x018d, %tt
	.word 0x8790237f  ! 2441: WRPR_TT_I	wrpr	%r0, 0x037f, %tt
	.word 0x83d02034  ! 2442: Tcc_I	te	icc_or_xcc, %r0 + 52
DS_346:
	.word 0x22800001  ! 2444: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 2443: SAVE_R	save	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90228b  ! 2445: WRPR_PSTATE_I	wrpr	%r0, 0x028b, %pstate
	.word 0x81982815  ! 2446: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0815, %hpstate
	.word 0xb3a00577  ! 2447: FSQRTq	fsqrt	
	.word 0x2a700001  ! 2448: BPCS	<illegal instruction>
	.word 0x2c700001  ! 2449: BPNEG	<illegal instruction>
splash_cmpr_347:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2451: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1846001  ! 2450: WR_STICK_REG_I	wr	%r17, 0x0001, %-
	.word 0xa190200e  ! 2451: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d902c1e  ! 2452: WRPR_PSTATE_I	wrpr	%r0, 0x0c1e, %pstate
	.word 0x93902002  ! 2453: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2454: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982a57  ! 2455: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a57, %hpstate
	.word 0x8790234c  ! 2456: WRPR_TT_I	wrpr	%r0, 0x034c, %tt
	.word 0xf33fe001  ! 2457: STDF_I	std	%f25, [0x0001, %r31]
	.word 0x87902215  ! 2458: WRPR_TT_I	wrpr	%r0, 0x0215, %tt
	.word 0x3c700001  ! 2459: BPPOS	<illegal instruction>
	.word 0x87902067  ! 2460: WRPR_TT_I	wrpr	%r0, 0x0067, %tt
	.word 0x819820d4  ! 2461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d4, %hpstate
	.word 0xf2d7e010  ! 2462: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r25
	.word 0x99902004  ! 2463: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x93902001  ! 2464: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x2e800001  ! 2465: BVS	bvs,a	<label_0x1>
DS_348:
	.word 0x34800001  ! 2467: BG	bg,a	<label_0x1>
	.word 0xe334a001  ! 2467: STQF_I	-	%f17, [0x0001, %r18]
	normalw
	.word 0x83458000  ! 2466: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x8d90280b  ! 2467: WRPR_PSTATE_I	wrpr	%r0, 0x080b, %pstate
	.word 0x93902005  ! 2468: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x92d1e001  ! 2469: UMULcc_I	umulcc 	%r7, 0x0001, %r9
splash_lsu_349:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 2470: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8da5c9ba  ! 2471: FDIVs	fdivs	%f23, %f26, %f6
	.word 0xcd17c000  ! 2472: LDQF_R	-	[%r31, %r0], %f6
	.word 0xb3a01a72  ! 2473: FqTOi	fqtoi	
	.word 0x93d02033  ! 2474: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x896e0019  ! 2475: SDIVX_R	sdivx	%r24, %r25, %r4
	.word 0xc8880e80  ! 2476: LDUBA_R	lduba	[%r0, %r0] 0x74, %r4
	.word 0x81982ecf  ! 2477: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecf, %hpstate
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 2478: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2479: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc847c000  ! 2480: LDSW_R	ldsw	[%r31 + %r0], %r4
	.word 0xa190200d  ! 2481: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91d02030  ! 2482: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x81982d8c  ! 2483: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8c, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x97500000  ! 2485: RDPR_TPC	rdpr	%tpc, %r11
change_to_tl1_350:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xd617c000  ! 2487: LDUH_R	lduh	[%r31 + %r0], %r11
	.word 0x9f802001  ! 2488: SIR	sir	0x0001
	.word 0xa1902009  ! 2489: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902003  ! 2490: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_tl1_351:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902898  ! 2492: WRPR_PSTATE_I	wrpr	%r0, 0x0898, %pstate
	.word 0x93902006  ! 2493: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x99902002  ! 2494: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xd68fe000  ! 2495: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r11
	.word 0x93902007  ! 2496: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_tl1_352:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_HPRIV	! macro


.global user_data_start
.data
user_data_start:
	.xword	0xa0166bae7c2d2534
	.xword	0x7f26de8fe7e5487b
	.xword	0x3e789cf174d0d81c
	.xword	0xe9091b7250f87826
	.xword	0xea3d9b6c5b7e10f3
	.xword	0x3bfda4e47c6af6dd
	.xword	0x16ec214336ab6eeb
	.xword	0x1e0dad2bd2ac4627
	.xword	0x57fa84f1139d56be
	.xword	0x678bd937f94c2c29
	.xword	0x8781690373653aaf
	.xword	0x532c3c9723ee5540
	.xword	0x95ebf14232f103e2
	.xword	0x6a8fb405e430e074
	.xword	0x9b08c7b49b3a2b01
	.xword	0x0004789d84d1e1a2
	.xword	0x22ba34ac8f4d1adf
	.xword	0x9b1aebb56bd53276
	.xword	0x9d1afb218770d32a
	.xword	0x0869cad2421a5426
	.xword	0x921fe95392f7a194
	.xword	0x08f2c33c9c29fd0e
	.xword	0x2d2972e02a563168
	.xword	0xa86ebef6cad2beac
	.xword	0xf6289b2dc6f16f80
	.xword	0x7e23ddaf0ce545bf
	.xword	0xbc4cbc407ffaece1
	.xword	0xc662e371e3925e5d
	.xword	0x84b69b52d692bbad
	.xword	0x55568fd3c69bd33b
	.xword	0xd663018d8cf99a28
	.xword	0x434a2ece3040b2af
	.xword	0xd7d1df7c697940bb
	.xword	0xbea3afed0d2475ab
	.xword	0x912e46153d571240
	.xword	0x12b4a211c5f3a688
	.xword	0x19e7dbaea41050a6
	.xword	0x57ff8f7380fd8383
	.xword	0x8618422629c676f8
	.xword	0x92db2391e0d7a57f
	.xword	0x22b87e167091e0dd
	.xword	0x7a0c780e0ef74660
	.xword	0xa78101c023b339fc
	.xword	0x6908d498564aea33
	.xword	0x60ac60cb236bcfb3
	.xword	0xd06f4f033209639b
	.xword	0x336d2d50c46dcca4
	.xword	0x2bfcf1204483d66b
	.xword	0xbe05673d1145d2d7
	.xword	0xed4722c1fab6fb9d
	.xword	0x9187f43ab52b1abe
	.xword	0x45108e3e9a86daf1
	.xword	0x4ac536215c5a03ca
	.xword	0xfc531fc3a41b2a42
	.xword	0xf0f44b74bdcf64c1
	.xword	0xbaca9f74c32fdf84
	.xword	0x2259a0eba484b89b
	.xword	0xae10f239a37ef552
	.xword	0xda5f565d089d702e
	.xword	0xf373f60c0de827b9
	.xword	0xf08418ee82d345d7
	.xword	0x19a92e3948896319
	.xword	0xf02099231df374bf
	.xword	0x6ce78aa6a5e025f2
	.xword	0x5be4b11f93d9b662
	.xword	0x2dac3f43977bd19e
	.xword	0x11f1c494643230af
	.xword	0x4e989edac46efb5d
	.xword	0x14ac2989713bd7c8
	.xword	0x43a6707b1980f35d
	.xword	0x4f368693c27c3c46
	.xword	0x62708dcb47ba63cb
	.xword	0x019e6d2cb217b8f5
	.xword	0x8faa6bf5efeafb72
	.xword	0x2dfe15032f552f6f
	.xword	0x9076c0a3ae6a70ff
	.xword	0x9ad61f666610672e
	.xword	0x818c6a7f2fc70317
	.xword	0x9adc6e55ebdf0e16
	.xword	0x40f5f8701ef41a80
	.xword	0x3009d76d673f3ca5
	.xword	0xdcd3160925b585fc
	.xword	0x6366b2e447060242
	.xword	0x663ebe257c4087bc
	.xword	0x65a0b41942c200bb
	.xword	0x58434f6a040d1ec2
	.xword	0x9a9ab46a9c930c76
	.xword	0xf3a1d9e03a819771
	.xword	0xc8308bd67888651a
	.xword	0x4b756fe5bb9763e8
	.xword	0xea737d063d0aa582
	.xword	0x1b2ded51ae656eab
	.xword	0x7af59ebb33c45aff
	.xword	0xbc8ca0f0086980b5
	.xword	0x32c0e6a389b35110
	.xword	0x6d9b1f12b833d311
	.xword	0x245cdd9ec9d66347
	.xword	0x0784f49cadb5fb35
	.xword	0xc49e18a3621b242d
	.xword	0x8a10b9d62852b188
	.xword	0xb8e4e99113833f80
	.xword	0xe34fb8cae1e2173f
	.xword	0xfb638f3fb396de18
	.xword	0x8d5d3e9244b2c865
	.xword	0x6d6f6f6f32bbf0aa
	.xword	0x30b7c0781d08de0c
	.xword	0x5e6789afc834aff6
	.xword	0x5ff4157cfaafa9cc
	.xword	0xe95eb1f310e30358
	.xword	0xe43ee9de872c6d9d
	.xword	0xf5a6b463a5106b56
	.xword	0x14176c129837c390
	.xword	0x432245dc0cc6f695
	.xword	0x33326b29ba191053
	.xword	0xe6d2c24a91d9f121
	.xword	0x43224da0726607c7
	.xword	0x0033e8cc6cab2eb5
	.xword	0xd6f9f15790e8a27d
	.xword	0x81951aafe91df00d
	.xword	0x897e9645336382ce
	.xword	0x63961bceb0382331
	.xword	0xa563c9e49cb856e8
	.xword	0xeeb9a4446bafb15e
	.xword	0xf2c288952c513fca
	.xword	0x38f004403cc88c6e
	.xword	0xfdf62864ffafceac
	.xword	0xd5adea1131e088f3
	.xword	0x38ba93b61f4262a8
	.xword	0x99c389fba949d91c
	.xword	0xbbceca15a7923a0a
	.xword	0x7f6e0ab9f7c6bf79
	.xword	0x4c28097e982ee485
	.xword	0xba7f97ac69a2d95c
	.xword	0x10c20a568fa4faa0
	.xword	0xc6d2767c97599f6e
	.xword	0x8ad709e9604fdb7d
	.xword	0x58815ce7d8b5cf5d
	.xword	0x473b717a27f11f66
	.xword	0x1da58c636bad70a9
	.xword	0x3f0f922a78011e08
	.xword	0xfc48b81cd9e9bcfe
	.xword	0xab7ae686a9ef8b96
	.xword	0xb4ce363b9bcd333c
	.xword	0x0797be4b50c4668c
	.xword	0xd69a212211f2b345
	.xword	0x737d8712e8c0c280
	.xword	0x4f821e7b24dadfbf
	.xword	0x74a42d04c855a4c8
	.xword	0x0bde9d791716f4ac
	.xword	0x35525a8904c7aca4
	.xword	0xd6216cddbbad0e24
	.xword	0xcd35a4221ab04aca
	.xword	0x0c880f387d9c1699
	.xword	0x3d50c63082e76211
	.xword	0x9b0a90470d63ca31
	.xword	0xcda12fd2f807644b
	.xword	0xabba59535a01da03
	.xword	0x68915dd9668c8a0f
	.xword	0x2b2f7c095b425599
	.xword	0x0be3b6dbd1210a12
	.xword	0x956b5169941c2afe
	.xword	0xbfec56ddf9069c04
	.xword	0x703538a0104fcba7
	.xword	0x2688c71e86d040c3
	.xword	0xe4562fd1257cd15f
	.xword	0x06270dbebc54e24e
	.xword	0xea56c11d5a0e2ed0
	.xword	0x265b9ceb11efb938
	.xword	0x1ccd7c583e5020d6
	.xword	0xa0b49b481f2cf53f
	.xword	0x9311d9a5e26a06e4
	.xword	0x53697669ad62f258
	.xword	0xccaca4c0e5572b1b
	.xword	0x48555d938e2325ca
	.xword	0x916c8d8706c85a1a
	.xword	0x0a200f148937ec71
	.xword	0xc42cec7859bcb87c
	.xword	0x61a8d031429ef432
	.xword	0xdb5a5970d3b8e1d2
	.xword	0x2d592084045a1f19
	.xword	0xb439f20c7472384d
	.xword	0x98c2a3ade76b28e7
	.xword	0xd40ba9c3c0d8025d
	.xword	0x7f6a8b046a650577
	.xword	0x35c3170849c5102e
	.xword	0x5b0e24b932f2494d
	.xword	0x60119ddd3220bf89
	.xword	0x365d951658bad4ee
	.xword	0xee8c45d42fc9573e
	.xword	0xb0119b52f2f6a827
	.xword	0x3340032b251be2fd
	.xword	0xd8871cefd880bad7
	.xword	0x007b95e363c11885
	.xword	0x580a0610b35c45c5
	.xword	0xb05851f8763b7b8e
	.xword	0xe31e9eb3360922eb
	.xword	0x74845304185bd68c
	.xword	0x9bb88340d36678a9
	.xword	0x9bd0d1a1e9372fe8
	.xword	0x5df8fc5d07747da3
	.xword	0x86925af3d86c6cac
	.xword	0x0baf6923a9faf1d0
	.xword	0x92d9b927cdd92aa9
	.xword	0x9f95eecf553cfc89
	.xword	0xb5c6c7d5bbfabe90
	.xword	0x46250222a75a32d2
	.xword	0x0f7ff255a9fe6bec
	.xword	0xffacd60810c4e5d1
	.xword	0xeb63d1b2ca31bc15
	.xword	0xb54ec25dbd17bd55
	.xword	0xfd3c123d79d027cc
	.xword	0x68fc61348cb06ed8
	.xword	0x5fa3136e87f4f26d
	.xword	0x6414828a6ac88119
	.xword	0xc44919a63ef22e2a
	.xword	0xd7e55fbafaae6b04
	.xword	0xc092cddf36af6032
	.xword	0xe57d285eef605e68
	.xword	0x06ff13ce13ae240d
	.xword	0xcb1287efb46a90d9
	.xword	0xfb602c506b9dae0a
	.xword	0x6fc349d40749cf4a
	.xword	0x49a6c06fad77970c
	.xword	0xa49059f125139008
	.xword	0x1d30dbab588af803
	.xword	0x7ca61ef763493e04
	.xword	0xa304f941724fb32b
	.xword	0x788defff767e9aed
	.xword	0x64fbfbb0d23d48d1
	.xword	0x03b6730387007324
	.xword	0x9a3db2cce6ece7da
	.xword	0x41dbcef82433a1dc
	.xword	0xd7a3fc888ea681f0
	.xword	0x2bc8ca75139d2dc4
	.xword	0x8a63f8f248bc46a2
	.xword	0xed3aae3d92ff0a8a
	.xword	0x629d2a78b7d92dbc
	.xword	0x548acf130bf84664
	.xword	0xff2848dc99707053
	.xword	0x49e2d68ff146acd6
	.xword	0x8a28a1cc22042e74
	.xword	0x634a59f23e765f19
	.xword	0x7aba0bd7a6bb02a5
	.xword	0x18796467ea36833b
	.xword	0xcdcf658d22594986
	.xword	0x1fde8182f29af67c
	.xword	0xdc7c461188d68dc5
	.xword	0x036028f5ba950fd2
	.xword	0xb1e659908e2114f4
	.xword	0x9a63e073d709eac4
	.xword	0xed90d8335bc362d3
	.xword	0xaf3b1924dc921fbe
	.xword	0xeac17da33e7363ff
	.xword	0xdeac667237eb7078
	.xword	0xe13b69830ead77ba
	.xword	0xa68a8465626c5f74


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Thu May 13 20:17:03 2004
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
!!#         | splash_lsucnt %rvar  wt_low
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
!!#     | tRDHPR_HTBA
!!#     | tRDHPR_HPSTATE
!!#     | tRD_TICK_CMPR_REG
!!#     | tRD_STICK_CMPR_REG
!!#     | tRD_STICK_REG         %ropr   Ro_rd0
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
!!#             //IJ_printf(th0, "\t.xword 0x%rx\t! Random illegal ?\n", Rv_illtrap);
!!#             IJ_printf("diag.j", 615, th0, "\tilltrap\n");
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 617,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 619,1, th0, ijdefault, tFSQRTd, tLDQF_R, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 626, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 627,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 631, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 632,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 636, th0, "DS_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 637, th0, "\tnop\n\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 638, th0, "\tjmp %%g2\n");
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

