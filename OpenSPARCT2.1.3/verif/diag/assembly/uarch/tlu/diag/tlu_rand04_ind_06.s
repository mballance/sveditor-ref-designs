/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_06.s
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
	mov 0xb4, %r14
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
	mov 0xb5, %r14
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
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8ad4c00a  ! 2: UMULcc_R	umulcc 	%r19, %r10, %r5
	.word 0x85a01a73  ! 3: FqTOi	fqtoi	
	.word 0x81982307  ! 4: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
	.word 0x9351c000  ! 5: RDPR_TL	rdpr	%tl, %r9
	.word 0x89a489a0  ! 6: FDIVs	fdivs	%f18, %f0, %f4
	.word 0x87a04dc0  ! 7: FdMULq	fdmulq	
	.word 0xc68fe030  ! 8: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r3
	.word 0xc6c004a0  ! 9: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
splash_htba_0:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 10: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02033  ! 11: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d540000  ! 12: RDPR_GL	rdpr	%-, %r6
	.word 0xa751c000  ! 13: RDPR_TL	rdpr	%tl, %r19
	.word 0xa190200f  ! 14: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8790214a  ! 15: WRPR_TT_I	wrpr	%r0, 0x014a, %tt
splash_cmpr_1:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 17: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1812001  ! 16: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 17: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_cmpr_2:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb185a001  ! 18: WR_STICK_REG_I	wr	%r22, 0x0001, %-
	.word 0x99a049c8  ! 19: FDIVd	fdivd	%f32, %f8, %f12
change_to_tl1_3:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9ac0e001  ! 21: ADDCcc_I	addccc 	%r3, 0x0001, %r13
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 22: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_4:
	.word 0x34800001  ! 24: BG	bg,a	<label_0x1>
	pdist %f12, %f20, %f8
	.word 0xa1b0830c  ! 23: ALLIGNADDRESS	alignaddr	%r2, %r12, %r16
	.word 0x8790212d  ! 24: WRPR_TT_I	wrpr	%r0, 0x012d, %tt
	.word 0x8790219b  ! 25: WRPR_TT_I	wrpr	%r0, 0x019b, %tt
	.word 0x93902004  ! 26: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x819829df  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09df, %hpstate
	.word 0x8d902e83  ! 28: WRPR_PSTATE_I	wrpr	%r0, 0x0e83, %pstate
splash_htba_5:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 29: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902005  ! 30: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x95a000c3  ! 31: FNEGd	fnegd	%f34, %f10
	.word 0xd447c000  ! 32: LDSW_R	ldsw	[%r31 + %r0], %r10
DS_6:
	.word 0x20800001  ! 34: BN	bn,a	<label_0x1>
	.word 0xcd340010  ! 34: STQF_R	-	%f6, [%r16, %r16]
	normalw
	.word 0x91458000  ! 33: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8d9026d8  ! 34: WRPR_PSTATE_I	wrpr	%r0, 0x06d8, %pstate
	.word 0xad684009  ! 35: SDIVX_R	sdivx	%r1, %r9, %r22
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 37: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902006  ! 38: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8780201c  ! 39: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x91d02035  ! 40: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa24c0008  ! 41: MULX_R	mulx 	%r16, %r8, %r17
	.word 0xa190200e  ! 42: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x91d02032  ! 43: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91a44dca  ! 44: FdMULq	fdmulq	
	.word 0xd0d7e030  ! 45: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r8
	.word 0xa1902000  ! 46: WRPR_GL_I	wrpr	%r0, 0x0000, %-
change_to_tl1_7:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02032  ! 48: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902e17  ! 49: WRPR_PSTATE_I	wrpr	%r0, 0x0e17, %pstate
	.word 0x9a6de001  ! 50: UDIVX_I	udivx 	%r23, 0x0001, %r13
	.word 0x83a349e2  ! 51: FDIVq	dis not found

	.word 0x8cd0c009  ! 52: UMULcc_R	umulcc 	%r3, %r9, %r6
	.word 0x81982204  ! 53: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0204, %hpstate
splash_htba_8:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 54: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d9020de  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x00de, %pstate
	.word 0x879022c1  ! 56: WRPR_TT_I	wrpr	%r0, 0x02c1, %tt
	.word 0x97500000  ! 57: RDPR_TPC	rdpr	%tpc, %r11
	.word 0xa190200a  ! 58: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93902003  ! 59: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd68008a0  ! 60: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 61: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 62: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd6d804a0  ! 63: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x24700001  ! 64: BPLE	<illegal instruction>
	.word 0x9af8401b  ! 65: SDIVcc_R	sdivcc 	%r1, %r27, %r13
	.word 0x87902297  ! 66: WRPR_TT_I	wrpr	%r0, 0x0297, %tt
	.word 0x93902003  ! 67: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02034  ! 68: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x80d2e001  ! 69: UMULcc_I	umulcc 	%r11, 0x0001, %r0
	.word 0x88842001  ! 70: ADDcc_I	addcc 	%r16, 0x0001, %r4
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_9:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 72: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xa0856001  ! 73: ADDcc_I	addcc 	%r21, 0x0001, %r16
	.word 0x93902000  ! 74: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x80fe2001  ! 75: SDIVcc_I	sdivcc 	%r24, 0x0001, %r0
	.word 0x8b504000  ! 76: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x8780201c  ! 77: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8d902694  ! 78: WRPR_PSTATE_I	wrpr	%r0, 0x0694, %pstate
	.word 0x8c6c4002  ! 79: UDIVX_R	udivx 	%r17, %r2, %r6
	.word 0x93902000  ! 80: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 81: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879022db  ! 82: WRPR_TT_I	wrpr	%r0, 0x02db, %tt
	.word 0xa1902002  ! 83: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8790212d  ! 84: WRPR_TT_I	wrpr	%r0, 0x012d, %tt
	.word 0x9f802001  ! 85: SIR	sir	0x0001
	.word 0x9ba00542  ! 86: FSQRTd	fsqrt	
	.word 0x8151c000  ! 87: RDPR_TL	rdpr	%tl, %r0
	.word 0xc08804a0  ! 88: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0x87902225  ! 89: WRPR_TT_I	wrpr	%r0, 0x0225, %tt
splash_htba_10:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 90: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xaba4c9db  ! 91: FDIVd	fdivd	%f50, %f58, %f52
	.word 0xea97e010  ! 92: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r21
	.word 0x91d02030  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x819824c7  ! 94: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c7, %hpstate
	.word 0x83d02030  ! 95: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x86d6a001  ! 96: UMULcc_I	umulcc 	%r26, 0x0001, %r3
	.word 0xa1902002  ! 97: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8790204a  ! 98: WRPR_TT_I	wrpr	%r0, 0x004a, %tt
	.word 0x81982194  ! 99: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0194, %hpstate
	.word 0x91d02031  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa1902000  ! 101: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 103: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb7504000  ! 104: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x93902005  ! 105: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8198295c  ! 106: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095c, %hpstate
DS_11:
	.word 0x22800001  ! 108: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 107: SAVE_R	save	%r31, %r0, %r31
	.word 0x93d02030  ! 108: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x8d902888  ! 109: WRPR_PSTATE_I	wrpr	%r0, 0x0888, %pstate
	.word 0x93902004  ! 110: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x85540000  ! 111: RDPR_GL	rdpr	%-, %r2
	.word 0xb3540000  ! 112: RDPR_GL	rdpr	%-, %r25
	.word 0x9b504000  ! 113: RDPR_TNPC	<illegal instruction>
	.word 0xdad7e020  ! 114: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
splash_tba_12:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 115: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02031  ! 116: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa190200c  ! 117: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x819822ce  ! 118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02ce, %hpstate
	.word 0x93902002  ! 119: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 120: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xaba01a71  ! 121: FqTOi	fqtoi	
	.word 0xb7514000  ! 122: RDPR_TBA	rdpr	%tba, %r27
	.word 0xa9504000  ! 123: RDPR_TNPC	<illegal instruction>
	.word 0x93902006  ! 124: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f802001  ! 125: SIR	sir	0x0001
	.word 0xa190200e  ! 126: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x93902000  ! 127: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x83d02032  ! 128: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xb151c000  ! 129: RDPR_TL	rdpr	%tl, %r24
	.word 0x8d902a0f  ! 130: WRPR_PSTATE_I	wrpr	%r0, 0x0a0f, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xf137c011  ! 132: STQF_R	-	%f24, [%r17, %r31]
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 133: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 134: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9020c2  ! 135: WRPR_PSTATE_I	wrpr	%r0, 0x00c2, %pstate
	.word 0x36700001  ! 136: BPGE	<illegal instruction>
splash_cmpr_13:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 138: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1832001  ! 137: WR_STICK_REG_I	wr	%r12, 0x0001, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 138: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9bb28ff2  ! 139: FONES	fones	%f13
	.word 0xa3a00549  ! 140: FSQRTd	fsqrt	
	.word 0x87902379  ! 141: WRPR_TT_I	wrpr	%r0, 0x0379, %tt
	.word 0x94d4a001  ! 142: UMULcc_I	umulcc 	%r18, 0x0001, %r10
	.word 0x87802004  ! 143: WRASI_I	wr	%r0, 0x0004, %asi
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 144: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd4d804a0  ! 145: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0xd537c009  ! 146: STQF_R	-	%f10, [%r9, %r31]
	.word 0x8350c000  ! 147: RDPR_TT	rdpr	%tt, %r1
change_to_tl1_14:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8780201c  ! 149: WRASI_I	wr	%r0, 0x001c, %asi
splash_cmpr_15:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 151: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186e001  ! 150: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0x8d802004  ! 151: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa8d08002  ! 152: UMULcc_R	umulcc 	%r2, %r2, %r20
	.word 0xe8cfe030  ! 153: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r20
	.word 0x91d02031  ! 154: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa1902003  ! 155: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa5540000  ! 156: RDPR_GL	rdpr	%-, %r18
	.word 0x8d902e02  ! 157: WRPR_PSTATE_I	wrpr	%r0, 0x0e02, %pstate
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 158: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 159: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe4cfe030  ! 160: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r18
	.word 0x93902000  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa190200b  ! 162: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x91d02033  ! 163: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87902189  ! 164: WRPR_TT_I	wrpr	%r0, 0x0189, %tt
	.word 0x93902007  ! 165: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 166: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 167: SIR	sir	0x0001
	.word 0x8198289d  ! 168: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089d, %hpstate
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 169: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x96a88000  ! 170: ANDNcc_R	andncc 	%r2, %r0, %r11
	.word 0x87902180  ! 171: WRPR_TT_I	wrpr	%r0, 0x0180, %tt
	.word 0x9f802001  ! 172: SIR	sir	0x0001
	.word 0x8d902657  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x0657, %pstate
	.word 0x93902003  ! 174: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_tl1_16:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x879022a7  ! 176: WRPR_TT_I	wrpr	%r0, 0x02a7, %tt
	.word 0x8790237c  ! 177: WRPR_TT_I	wrpr	%r0, 0x037c, %tt
	.word 0x8198289d  ! 178: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089d, %hpstate
	.word 0x81982106  ! 179: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0106, %hpstate
DS_17:
	.word 0x32800001  ! 181: BNE	bne,a	<label_0x1>
	.word 0xd730a001  ! 181: STQF_I	-	%f11, [0x0001, %r2]
	normalw
	.word 0x91458000  ! 180: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x81982a1f  ! 181: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1f, %hpstate
	.word 0xd047e001  ! 182: LDSW_I	ldsw	[%r31 + 0x0001], %r8
	.word 0x91d02033  ! 183: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902e8c  ! 184: WRPR_PSTATE_I	wrpr	%r0, 0x0e8c, %pstate
	.word 0xa7a189ea  ! 185: FDIVq	dis not found

	.word 0x8d902051  ! 186: WRPR_PSTATE_I	wrpr	%r0, 0x0051, %pstate
	.word 0x91d02032  ! 187: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93d02032  ! 188: Tcc_I	tne	icc_or_xcc, %r0 + 50
DS_18:
	.word 0x34800001  ! 190: BG	bg,a	<label_0x1>
	.word 0xed34c008  ! 190: STQF_R	-	%f22, [%r8, %r19]
	normalw
	.word 0xb7458000  ! 189: RD_SOFTINT_REG	rd	%softint, %r27
	.word 0xb5500000  ! 190: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xb7540000  ! 191: RDPR_GL	<illegal instruction>
	.word 0xf67fe001  ! 192: SWAP_I	swap	%r27, [%r31 + 0x0001]
	.word 0xf67fe001  ! 193: SWAP_I	swap	%r27, [%r31 + 0x0001]
	.word 0x8868a001  ! 194: UDIVX_I	udivx 	%r2, 0x0001, %r4
DS_19:
	.word 0x22800001  ! 196: BE	be,a	<label_0x1>
	.word 0xf1322001  ! 196: STQF_I	-	%f24, [0x0001, %r8]
	normalw
	.word 0x8f458000  ! 195: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xaec36001  ! 196: ADDCcc_I	addccc 	%r13, 0x0001, %r23
	.word 0x91d02032  ! 197: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8cf9c00a  ! 198: SDIVcc_R	sdivcc 	%r7, %r10, %r6
	.word 0x819822ce  ! 199: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02ce, %hpstate
	.word 0xb286000d  ! 200: ADDcc_R	addcc 	%r24, %r13, %r25
	.word 0x8198250d  ! 201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050d, %hpstate
	.word 0x87902359  ! 202: WRPR_TT_I	wrpr	%r0, 0x0359, %tt
	.word 0xf28008a0  ! 203: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0xa1902002  ! 204: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8db30ff4  ! 205: FONES	fones	%f6
	.word 0x9a812001  ! 206: ADDcc_I	addcc 	%r4, 0x0001, %r13
	.word 0x93d02030  ! 207: Tcc_I	tne	icc_or_xcc, %r0 + 48
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 208: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_20:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 209: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x81982dc7  ! 210: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc7, %hpstate
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 211: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 212: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x36800001  ! 213: BGE	bge,a	<label_0x1>
	.word 0x81982e84  ! 214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e84, %hpstate
	.word 0xa9540000  ! 215: RDPR_GL	rdpr	%-, %r20
	.word 0x879021aa  ! 216: WRPR_TT_I	wrpr	%r0, 0x01aa, %tt
DS_21:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 217: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xe927c014  ! 218: STF_R	st	%f20, [%r20, %r31]
	.word 0x93902007  ! 219: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x2a700001  ! 220: BPCS	<illegal instruction>
	.word 0x92c12001  ! 221: ADDCcc_I	addccc 	%r4, 0x0001, %r9
	.word 0x9085a001  ! 222: ADDcc_I	addcc 	%r22, 0x0001, %r8
	.word 0xb46c8006  ! 223: UDIVX_R	udivx 	%r18, %r6, %r26
	.word 0x91d02033  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 51
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 225: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 226: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8750c000  ! 227: RDPR_TT	rdpr	%tt, %r3
DS_22:
	.word 0x34800001  ! 229: BG	bg,a	<label_0x1>
	.xword 0xddcb791b	! Random illegal ?
	.word 0x85a00552  ! 229: FSQRTd	fsqrt	
	.word 0xa1a30820  ! 228: FADDs	fadds	%f12, %f0, %f16
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 229: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 230: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_tl1_23:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902ad0  ! 232: WRPR_PSTATE_I	wrpr	%r0, 0x0ad0, %pstate
	.word 0xa7702001  ! 233: POPC_I	popc	0x0001, %r19
	.word 0x9f802001  ! 234: SIR	sir	0x0001
	.word 0x93902004  ! 235: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe6800c60  ! 236: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r19
	.word 0x8d802000  ! 237: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8790224c  ! 238: WRPR_TT_I	wrpr	%r0, 0x024c, %tt
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 239: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d90288c  ! 240: WRPR_PSTATE_I	wrpr	%r0, 0x088c, %pstate
	.word 0x9151c000  ! 241: RDPR_TL	rdpr	%tl, %r8
	.word 0x97a000c7  ! 242: FNEGd	fnegd	%f38, %f42
	.word 0x93d02031  ! 243: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x879020f9  ! 244: WRPR_TT_I	wrpr	%r0, 0x00f9, %tt
	.word 0x879020ee  ! 245: WRPR_TT_I	wrpr	%r0, 0x00ee, %tt
	.word 0x844dc001  ! 246: MULX_R	mulx 	%r23, %r1, %r2
	.word 0xab540000  ! 247: RDPR_GL	rdpr	%-, %r21
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 248: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982f44  ! 249: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f44, %hpstate
DS_24:
	.word 0x22800001  ! 251: BE	be,a	<label_0x1>
	.word 0xe9300000  ! 251: STQF_R	-	%f20, [%r0, %r0]
	normalw
	.word 0xb3458000  ! 250: RD_SOFTINT_REG	rd	%softint, %r25
	.word 0x879023b0  ! 251: WRPR_TT_I	wrpr	%r0, 0x03b0, %tt
	.word 0x91d02033  ! 252: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8b51c000  ! 253: RDPR_TL	rdpr	%tl, %r5
	.word 0x92680007  ! 254: UDIVX_R	udivx 	%r0, %r7, %r9
change_to_tl1_25:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 256: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021b4  ! 257: WRPR_TT_I	wrpr	%r0, 0x01b4, %tt
	.word 0x819829d7  ! 258: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d7, %hpstate
	.word 0x91d02035  ! 259: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa0ddc012  ! 260: SMULcc_R	smulcc 	%r23, %r18, %r16
	.word 0x38700001  ! 261: BPGU	<illegal instruction>
	.word 0x8d9020c6  ! 262: WRPR_PSTATE_I	wrpr	%r0, 0x00c6, %pstate
	.word 0x81982705  ! 263: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0705, %hpstate
	.word 0xa190200a  ! 264: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x826d6001  ! 265: UDIVX_I	udivx 	%r21, 0x0001, %r1
	.word 0x93902005  ! 266: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_26:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1822001  ! 267: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 268: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 269: SIR	sir	0x0001
	.word 0x93902000  ! 270: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa5a049f7  ! 272: FDIVq	dis not found

	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_27:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
change_to_randtl_28:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 275: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8fa00544  ! 276: FSQRTd	fsqrt	
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 277: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879023d1  ! 278: WRPR_TT_I	wrpr	%r0, 0x03d1, %tt
	.word 0x34800001  ! 279: BG	bg,a	<label_0x1>
	.word 0x81982a9f  ! 280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9f, %hpstate
	.word 0x819824c5  ! 281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c5, %hpstate
	.word 0x879023c8  ! 282: WRPR_TT_I	wrpr	%r0, 0x03c8, %tt
	.word 0xa1902007  ! 283: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87902082  ! 284: WRPR_TT_I	wrpr	%r0, 0x0082, %tt
	.word 0xced004a0  ! 285: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0xcfe7c024  ! 286: CASA_I	casa	[%r31] 0x 1, %r4, %r7
reduce_priv_level_29:
	.word 0x8f902000  ! 288: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1840006  ! 287: WR_STICK_REG_R	wr	%r16, %r6, %-
	.word 0x8d802000  ! 288: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xce3fc006  ! 289: STD_R	std	%r7, [%r31 + %r6]
	.word 0xa2c16001  ! 290: ADDCcc_I	addccc 	%r5, 0x0001, %r17
	.word 0xe237e001  ! 291: STH_I	sth	%r17, [%r31 + 0x0001]
	.word 0x91d02034  ! 292: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d90221b  ! 293: WRPR_PSTATE_I	wrpr	%r0, 0x021b, %pstate
	.word 0x81982187  ! 294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0187, %hpstate
DS_30:
	.word 0x34800001  ! 296: BG	bg,a	<label_0x1>
	allclean
	.word 0xa5b08306  ! 295: ALLIGNADDRESS	alignaddr	%r2, %r6, %r18
	.word 0x8351c000  ! 296: RDPR_TL	rdpr	%tl, %r1
	.word 0xc327c006  ! 297: STF_R	st	%f1, [%r6, %r31]
splash_tba_31:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 298: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_32:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 299: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 300: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 301: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa76d4005  ! 302: SDIVX_R	sdivx	%r21, %r5, %r19
splash_cmpr_33:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 304: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb185e001  ! 303: WR_STICK_REG_I	wr	%r23, 0x0001, %-
	.word 0x8d90280f  ! 304: WRPR_PSTATE_I	wrpr	%r0, 0x080f, %pstate
	.word 0x8d802000  ! 305: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902a0d  ! 306: WRPR_PSTATE_I	wrpr	%r0, 0x0a0d, %pstate
	.word 0x93902001  ! 307: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87902177  ! 308: WRPR_TT_I	wrpr	%r0, 0x0177, %tt
	.word 0x879021db  ! 309: WRPR_TT_I	wrpr	%r0, 0x01db, %tt
splash_cmpr_34:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1802001  ! 310: WR_STICK_REG_I	wr	%r0, 0x0001, %-
splash_cmpr_35:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 312: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181e001  ! 311: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0xe67fe001  ! 312: SWAP_I	swap	%r19, [%r31 + 0x0001]
	.word 0x9f802001  ! 313: SIR	sir	0x0001
	.word 0x93902007  ! 314: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9f802001  ! 315: SIR	sir	0x0001
	.word 0x93902002  ! 316: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe6bfe001  ! 317: STDA_I	stda	%r19, [%r31 + 0x0001] %asi
DS_36:
	.word 0x32800001  ! 319: BNE	bne,a	<label_0x1>
	.xword 0xd37ad9c3	! Random illegal ?
	.word 0xcf10001b  ! 319: LDQF_R	-	[%r0, %r27], %f7
	.word 0x83a60829  ! 318: FADDs	fadds	%f24, %f9, %f1
splash_htba_37:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 319: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9751c000  ! 320: RDPR_TL	rdpr	%tl, %r11
	.word 0x81982196  ! 321: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0196, %hpstate
	.word 0x87902249  ! 322: WRPR_TT_I	wrpr	%r0, 0x0249, %tt
	.word 0xa1902001  ! 323: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8198230f  ! 324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030f, %hpstate
	.word 0xd727c009  ! 325: STF_R	st	%f11, [%r9, %r31]
reduce_priv_level_38:
	.word 0x8f902002  ! 327: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb182000a  ! 326: WR_STICK_REG_R	wr	%r8, %r10, %-
	.word 0x9668000b  ! 327: UDIVX_R	udivx 	%r0, %r11, %r11
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 328: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd65fc000  ! 329: LDX_R	ldx	[%r31 + %r0], %r11
	.word 0x8d802004  ! 330: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902689  ! 332: WRPR_PSTATE_I	wrpr	%r0, 0x0689, %pstate
change_to_randtl_39:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 333: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
splash_htba_40:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 334: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 335: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 336: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0xd60fe001  ! 338: LDUB_I	ldub	[%r31 + 0x0001], %r11
reduce_priv_level_41:
	.word 0x8f902001  ! 340: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 339: SIAM	siam	1
	.word 0x9f802001  ! 340: SIR	sir	0x0001
	.word 0x9f802001  ! 341: SIR	sir	0x0001
	.word 0xd68008a0  ! 342: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_42:
	.word 0x32800001  ! 344: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa1b0c308  ! 343: ALLIGNADDRESS	alignaddr	%r3, %r8, %r16
	ta	T_CHANGE_PRIV	! macro
	.word 0x806e2001  ! 345: UDIVX_I	udivx 	%r24, 0x0001, %r0
	.word 0xc017e001  ! 346: LDUH_I	lduh	[%r31 + 0x0001], %r0
splash_cmpr_43:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 348: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 347: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0x879023e1  ! 348: WRPR_TT_I	wrpr	%r0, 0x03e1, %tt
DS_44:
	.word 0x20800001  ! 350: BN	bn,a	<label_0x1>
	pdist %f28, %f18, %f2
	.word 0x81b44319  ! 349: ALLIGNADDRESS	alignaddr	%r17, %r25, %r0
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 350: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902006  ! 352: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_45:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 353: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8efa6001  ! 354: SDIVcc_I	sdivcc 	%r9, 0x0001, %r7
	.word 0x8d902e12  ! 355: WRPR_PSTATE_I	wrpr	%r0, 0x0e12, %pstate
	.word 0x9f802001  ! 356: SIR	sir	0x0001
	.word 0x83d02034  ! 357: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x96d0a001  ! 358: UMULcc_I	umulcc 	%r2, 0x0001, %r11
	.word 0x8790200f  ! 359: WRPR_TT_I	wrpr	%r0, 0x000f, %tt
splash_tba_46:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 360: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982756  ! 361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0756, %hpstate
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 362: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790226c  ! 363: WRPR_TT_I	wrpr	%r0, 0x026c, %tt
	.word 0xd737e001  ! 364: STQF_I	-	%f11, [0x0001, %r31]
DS_47:
	.word 0x32800001  ! 366: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 365: SAVE_R	save	%r31, %r0, %r31
	.word 0x93d02032  ! 366: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x93902006  ! 367: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d9022de  ! 368: WRPR_PSTATE_I	wrpr	%r0, 0x02de, %pstate
	.word 0x9b508000  ! 369: RDPR_TSTATE	rdpr	%tstate, %r13
DS_48:
	.word 0x34800001  ! 371: BG	bg,a	<label_0x1>
	.word 0xdb332001  ! 371: STQF_I	-	%f13, [0x0001, %r12]
	normalw
	.word 0x9b458000  ! 370: RD_SOFTINT_REG	rd	%softint, %r13
splash_htba_49:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 371: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xaf504000  ! 372: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0xee9fc020  ! 373: LDDA_R	ldda	[%r31, %r0] 0x01, %r23
	.word 0x8d902ac3  ! 374: WRPR_PSTATE_I	wrpr	%r0, 0x0ac3, %pstate
	.word 0xee8008a0  ! 375: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0x93902005  ! 376: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x99902002  ! 377: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xeec80e40  ! 378: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r23
	.word 0x879021fa  ! 379: WRPR_TT_I	wrpr	%r0, 0x01fa, %tt
	.word 0x8d6ec00d  ! 380: SDIVX_R	sdivx	%r27, %r13, %r6
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 381: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb1b10ff7  ! 382: FONES	fones	%f24
	.word 0xa3a000d2  ! 383: FNEGd	fnegd	%f18, %f48
	.word 0xe27fe001  ! 384: SWAP_I	swap	%r17, [%r31 + 0x0001]
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 386: SIR	sir	0x0001
	.word 0x2a800001  ! 387: BCS	bcs,a	<label_0x1>
	.word 0x94d6001b  ! 388: UMULcc_R	umulcc 	%r24, %r27, %r10
	.word 0xa190200b  ! 389: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x81982514  ! 390: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0514, %hpstate
splash_tba_50:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 391: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02030  ! 392: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d902412  ! 393: WRPR_PSTATE_I	wrpr	%r0, 0x0412, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99540000  ! 395: RDPR_GL	rdpr	%-, %r12
	.word 0xd88fe020  ! 396: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r12
	.word 0x32800001  ! 397: BNE	bne,a	<label_0x1>
	.word 0x8d902002  ! 398: WRPR_PSTATE_I	wrpr	%r0, 0x0002, %pstate
	.word 0x87902166  ! 399: WRPR_TT_I	wrpr	%r0, 0x0166, %tt
	.word 0x83d02032  ! 400: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d90208e  ! 401: WRPR_PSTATE_I	wrpr	%r0, 0x008e, %pstate
	.word 0x87a0cdd4  ! 402: FdMULq	fdmulq	
	.word 0xc627c014  ! 403: STW_R	stw	%r3, [%r31 + %r20]
	.word 0xc6ffc034  ! 404: SWAPA_R	swapa	%r3, [%r31 + %r20] 0x01
	.word 0x83d02031  ! 405: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x8d902e5c  ! 406: WRPR_PSTATE_I	wrpr	%r0, 0x0e5c, %pstate
	.word 0x93902005  ! 407: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc6ffc034  ! 408: SWAPA_R	swapa	%r3, [%r31 + %r20] 0x01
	.word 0xb5a00562  ! 409: FSQRTq	fsqrt	
	.word 0x8790211f  ! 410: WRPR_TT_I	wrpr	%r0, 0x011f, %tt
change_to_tl1_51:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9f802001  ! 412: SIR	sir	0x0001
	.word 0x879023d3  ! 413: WRPR_TT_I	wrpr	%r0, 0x03d3, %tt
	.word 0xab51c000  ! 414: RDPR_TL	rdpr	%tl, %r21
	.word 0x87802089  ! 415: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87902353  ! 416: WRPR_TT_I	wrpr	%r0, 0x0353, %tt
	.word 0x8d902893  ! 417: WRPR_PSTATE_I	wrpr	%r0, 0x0893, %pstate
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 418: Tcc_R	te	icc_or_xcc, %r0 + %r30
reduce_priv_level_52:
	.word 0x8f902000  ! 420: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 419: SIAM	siam	1
	.word 0x91d02033  ! 420: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xead7e000  ! 421: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r21
	.word 0x91d02031  ! 422: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xea07c000  ! 423: LDUW_R	lduw	[%r31 + %r0], %r21
	.word 0xa190200b  ! 424: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x91d02034  ! 425: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 426: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 427: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790224e  ! 428: WRPR_TT_I	wrpr	%r0, 0x024e, %tt
	.word 0x24700001  ! 429: BPLE	<illegal instruction>
	.word 0x81982114  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0114, %hpstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 431: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 432: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xeb97e001  ! 433: LDQFA_I	-	[%r31, 0x0001], %f21
	.word 0x93902004  ! 434: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81982fd6  ! 435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd6, %hpstate
	.word 0x8d902e13  ! 436: WRPR_PSTATE_I	wrpr	%r0, 0x0e13, %pstate
	.word 0x87902054  ! 437: WRPR_TT_I	wrpr	%r0, 0x0054, %tt
	.word 0x81982cc4  ! 438: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc4, %hpstate
	.word 0xeb3fc002  ! 439: STDF_R	std	%f21, [%r2, %r31]
	.word 0x81540000  ! 440: RDPR_GL	rdpr	%-, %r0
	.word 0xa1902003  ! 441: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x83a0054c  ! 442: FSQRTd	fsqrt	
	ta	T_CHANGE_PRIV	! macro
splash_cmpr_53:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 445: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1852001  ! 444: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	.word 0x81982cd7  ! 445: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd7, %hpstate
	.word 0x91d02033  ! 446: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xb3a689ad  ! 447: FDIVs	fdivs	%f26, %f13, %f25
	.word 0x8790224f  ! 448: WRPR_TT_I	wrpr	%r0, 0x024f, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02032  ! 450: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xf297e010  ! 451: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r25
change_to_tl1_54:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902006  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02035  ! 454: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902405  ! 455: WRPR_PSTATE_I	wrpr	%r0, 0x0405, %pstate
DS_55:
	.word 0x22800001  ! 457: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 456: SAVE_R	save	%r31, %r0, %r31
DS_56:
	.word 0x22800001  ! 458: BE	be,a	<label_0x1>
	.word 0xf330a001  ! 458: STQF_I	-	%f25, [0x0001, %r2]
	normalw
	.word 0xa1458000  ! 457: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x8d802004  ! 458: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902009  ! 459: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x879020cf  ! 461: WRPR_TT_I	wrpr	%r0, 0x00cf, %tt
	.word 0xe08008a0  ! 462: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe0800b40  ! 463: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r16
	.word 0xa1902000  ! 464: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa1902007  ! 465: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xe08804a0  ! 466: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
	.word 0x8d802004  ! 467: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87902238  ! 468: WRPR_TT_I	wrpr	%r0, 0x0238, %tt
DS_57:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 469: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x8d802004  ! 470: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9f802001  ! 471: SIR	sir	0x0001
DS_58:
	.word 0x20800001  ! 473: BN	bn,a	<label_0x1>
	pdist %f18, %f28, %f8
	.word 0xb5b18308  ! 472: ALLIGNADDRESS	alignaddr	%r6, %r8, %r26
	.word 0x9f802001  ! 473: SIR	sir	0x0001
	.word 0xab500000  ! 474: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x93902000  ! 475: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x80d22001  ! 476: UMULcc_I	umulcc 	%r8, 0x0001, %r0
	.word 0x93902003  ! 477: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93a349c8  ! 478: FDIVd	fdivd	%f44, %f8, %f40
	.word 0x8d902444  ! 479: WRPR_PSTATE_I	wrpr	%r0, 0x0444, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x83d02031  ! 481: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xa1902002  ! 482: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd2d004a0  ! 483: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r9
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 484: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902007  ! 485: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1902002  ! 486: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 487: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99902005  ! 488: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8d802000  ! 489: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90249e  ! 490: WRPR_PSTATE_I	wrpr	%r0, 0x049e, %pstate
	.word 0x8b500000  ! 491: RDPR_TPC	rdpr	%tpc, %r5
	.word 0x92f8a001  ! 492: SDIVcc_I	sdivcc 	%r2, 0x0001, %r9
	.word 0x93902003  ! 493: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd2ffc028  ! 494: SWAPA_R	swapa	%r9, [%r31 + %r8] 0x01
	.word 0x83d02030  ! 495: Tcc_I	te	icc_or_xcc, %r0 + 48
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 496: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902e0a  ! 497: WRPR_PSTATE_I	wrpr	%r0, 0x0e0a, %pstate
	.word 0xa1902003  ! 498: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 499: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_59:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 500: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87a01a6c  ! 501: FqTOi	fqtoi	
	.word 0x91d02033  ! 502: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa7540000  ! 503: RDPR_GL	rdpr	%-, %r19
	.word 0x93902001  ! 504: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02035  ! 505: Tcc_I	ta	icc_or_xcc, %r0 + 53
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 506: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_60:
	.word 0x34800001  ! 508: BG	bg,a	<label_0x1>
	.word 0xcb302001  ! 508: STQF_I	-	%f5, [0x0001, %r0]
	normalw
	.word 0x9b458000  ! 507: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x93d02034  ! 508: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x9ba18dc2  ! 509: FdMULq	fdmulq	
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 510: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x819821c5  ! 511: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c5, %hpstate
	.word 0x93902006  ! 512: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xab508000  ! 513: RDPR_TSTATE	rdpr	%tstate, %r21
splash_tba_61:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 514: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_62:
	.word 0x22800001  ! 516: BE	be,a	<label_0x1>
	.xword 0xbfd430fd	! Random illegal ?
	.word 0xada0055b  ! 516: FSQRTd	fsqrt	
	.word 0x85a30827  ! 515: FADDs	fadds	%f12, %f7, %f2
	.word 0x8d802000  ! 516: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc4c7e010  ! 517: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0x8550c000  ! 518: RDPR_TT	rdpr	%tt, %r2
	.word 0x93d02035  ! 519: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8ec16001  ! 520: ADDCcc_I	addccc 	%r5, 0x0001, %r7
	.word 0x9f802001  ! 521: SIR	sir	0x0001
	.word 0xb5508000  ! 522: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x81982c5d  ! 523: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5d, %hpstate
	.word 0x93902005  ! 524: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xab540000  ! 525: RDPR_GL	rdpr	%-, %r21
	.word 0x8950c000  ! 526: RDPR_TT	<illegal instruction>
	.word 0xc93fe001  ! 527: STDF_I	std	%f4, [0x0001, %r31]
splash_cmpr_63:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 529: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1822001  ! 528: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	.word 0x8d9022d7  ! 529: WRPR_PSTATE_I	wrpr	%r0, 0x02d7, %pstate
	.word 0x8198211f  ! 530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011f, %hpstate
DS_64:
	.word 0x22800001  ! 532: BE	be,a	<label_0x1>
	.xword 0xa3422985	! Random illegal ?
	.word 0x81a00543  ! 532: FSQRTd	fsqrt	
	.word 0xa5a08831  ! 531: FADDs	fadds	%f2, %f17, %f18
	.word 0x8198250f  ! 532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050f, %hpstate
	.word 0x9f802001  ! 533: SIR	sir	0x0001
	.word 0x91514000  ! 534: RDPR_TBA	rdpr	%tba, %r8
	.word 0xd0880e60  ! 535: LDUBA_R	lduba	[%r0, %r0] 0x73, %r8
	.word 0x32800001  ! 536: BNE	bne,a	<label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 537: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819826df  ! 540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06df, %hpstate
	.word 0x879023d6  ! 541: WRPR_TT_I	wrpr	%r0, 0x03d6, %tt
	.word 0x83d02033  ! 542: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x93902003  ! 543: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8198259e  ! 544: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059e, %hpstate
	.word 0xa5a30dc0  ! 545: FdMULq	fdmulq	
	.word 0x93d02034  ! 546: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xab514000  ! 547: RDPR_TBA	rdpr	%tba, %r21
	.word 0xb5a34d38  ! 548: FsMULd	fsmuld	%f13, %f24, %f26
	.word 0x90f92001  ! 549: SDIVcc_I	sdivcc 	%r4, 0x0001, %r8
	.word 0x8198239d  ! 550: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039d, %hpstate
	.word 0xa1902004  ! 551: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_htba_65:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 552: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_66:
	.word 0x22800001  ! 554: BE	be,a	<label_0x1>
	allclean
	.word 0xb3b1c303  ! 553: ALLIGNADDRESS	alignaddr	%r7, %r3, %r25
	ta	T_CHANGE_HPRIV	! macro
reduce_priv_level_67:
	.word 0x8f902002  ! 556: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8da0196b  ! 555: FqTOd	dis not found

	.word 0x879023c2  ! 556: WRPR_TT_I	wrpr	%r0, 0x03c2, %tt
	.word 0x93902005  ! 557: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 558: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99a409e1  ! 559: FDIVq	dis not found

	.word 0x8ba20d25  ! 560: FsMULd	fsmuld	%f8, %f36, %f36
	.word 0x8198225c  ! 561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025c, %hpstate
	.word 0x8d90208f  ! 562: WRPR_PSTATE_I	wrpr	%r0, 0x008f, %pstate
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 563: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879022a7  ! 564: WRPR_TT_I	wrpr	%r0, 0x02a7, %tt
	.word 0xa3702001  ! 565: POPC_I	popc	0x0001, %r17
	.word 0x91d02034  ! 566: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d02034  ! 567: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xb5514000  ! 568: RDPR_TBA	rdpr	%tba, %r26
	.word 0xa6836001  ! 569: ADDcc_I	addcc 	%r13, 0x0001, %r19
	.word 0xae85a001  ! 570: ADDcc_I	addcc 	%r22, 0x0001, %r23
	.word 0xa1902006  ! 571: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa1a08d21  ! 572: FsMULd	fsmuld	%f2, %f32, %f16
	.word 0x83d02035  ! 573: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x819822d6  ! 574: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d6, %hpstate
DS_68:
	.word 0x32800001  ! 576: BNE	bne,a	<label_0x1>
	pdist %f10, %f4, %f4
	.word 0x99b04313  ! 575: ALLIGNADDRESS	alignaddr	%r1, %r19, %r12
	.word 0xa1902001  ! 576: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x91d02035  ! 577: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xada30dc0  ! 578: FdMULq	fdmulq	
	.word 0x8750c000  ! 579: RDPR_TT	rdpr	%tt, %r3
DS_69:
	.word 0x20800001  ! 581: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 581: BNE	bne,a	<label_0x1>
	.word 0xeb14c009  ! 581: LDQF_R	-	[%r19, %r9], %f21
	.word 0x89a48829  ! 580: FADDs	fadds	%f18, %f9, %f4
	.word 0x97500000  ! 581: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x85514000  ! 582: RDPR_TBA	rdpr	%tba, %r2
	.word 0x8d902454  ! 583: WRPR_PSTATE_I	wrpr	%r0, 0x0454, %pstate
	.word 0xc47fe001  ! 584: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0x93902002  ! 585: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xb0832001  ! 586: ADDcc_I	addcc 	%r12, 0x0001, %r24
	.word 0x93902001  ! 587: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8790205b  ! 588: WRPR_TT_I	wrpr	%r0, 0x005b, %tt
	.word 0xf01fe001  ! 589: LDD_I	ldd	[%r31 + 0x0001], %r24
	.word 0x87902360  ! 590: WRPR_TT_I	wrpr	%r0, 0x0360, %tt
	.word 0x81982916  ! 591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0916, %hpstate
	.word 0xa3a00d26  ! 592: FsMULd	fsmuld	%f0, %f6, %f48
DS_70:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 593: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x30800001  ! 594: BA	ba,a	<label_0x1>
	.word 0x86d24014  ! 595: UMULcc_R	umulcc 	%r9, %r20, %r3
	.word 0x30700001  ! 596: BPA	<illegal instruction>
	.word 0xc727c014  ! 597: STF_R	st	%f3, [%r20, %r31]
	.word 0x879022b4  ! 598: WRPR_TT_I	wrpr	%r0, 0x02b4, %tt
	.word 0x8d902c95  ! 599: WRPR_PSTATE_I	wrpr	%r0, 0x0c95, %pstate
	.word 0x22800001  ! 600: BE	be,a	<label_0x1>
	.word 0x8d9024ca  ! 601: WRPR_PSTATE_I	wrpr	%r0, 0x04ca, %pstate
splash_htba_71:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 602: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902001  ! 603: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xb751c000  ! 604: RDPR_TL	rdpr	%tl, %r27
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d9024c0  ! 606: WRPR_PSTATE_I	wrpr	%r0, 0x04c0, %pstate
	.word 0xb3500000  ! 607: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x8d902a5e  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x0a5e, %pstate
	.word 0x8d902cc3  ! 609: WRPR_PSTATE_I	wrpr	%r0, 0x0cc3, %pstate
	.word 0x8d802000  ! 610: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa5702001  ! 611: POPC_I	popc	0x0001, %r18
	.word 0xa1902007  ! 612: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8da00557  ! 613: FSQRTd	fsqrt	
DS_72:
	.word 0x20800001  ! 615: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 614: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902007  ! 616: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xccd7e020  ! 617: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r6
DS_73:
	.word 0x32800001  ! 619: BNE	bne,a	<label_0x1>
	.word 0xe534e001  ! 619: STQF_I	-	%f18, [0x0001, %r19]
	normalw
	.word 0x97458000  ! 618: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x9481a001  ! 619: ADDcc_I	addcc 	%r6, 0x0001, %r10
splash_cmpr_74:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1822001  ! 620: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	.word 0x98d5a001  ! 621: UMULcc_I	umulcc 	%r22, 0x0001, %r12
	.word 0xa1902000  ! 622: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d02033  ! 623: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 625: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa9a01a67  ! 626: FqTOi	fqtoi	
	.word 0xa1902007  ! 627: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8198211c  ! 628: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011c, %hpstate
	.word 0x91d02032  ! 629: Tcc_I	ta	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_HPRIV	! macro
splash_tba_75:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 631: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x26700001  ! 632: BPL	<illegal instruction>
	.word 0x8198229d  ! 633: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029d, %hpstate
	.word 0x93902001  ! 634: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x83d02035  ! 635: Tcc_I	te	icc_or_xcc, %r0 + 53
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 636: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982794  ! 637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0794, %hpstate
	.word 0x93a609f9  ! 638: FDIVq	dis not found

	.word 0xd28008a0  ! 639: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 640: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982457  ! 641: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0457, %hpstate
	.word 0xa1902005  ! 642: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x879022d7  ! 643: WRPR_TT_I	wrpr	%r0, 0x02d7, %tt
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 644: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95702001  ! 645: POPC_I	popc	0x0001, %r10
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 646: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x89514000  ! 647: RDPR_TBA	rdpr	%tba, %r4
	.word 0x8f514000  ! 648: RDPR_TBA	rdpr	%tba, %r7
	.word 0x81982a4e  ! 649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4e, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 650: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_76:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1816001  ! 651: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0xce8804a0  ! 652: LDUBA_R	lduba	[%r0, %r0] 0x25, %r7
DS_77:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 653: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x819822dc  ! 654: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02dc, %hpstate
	.word 0xb750c000  ! 655: RDPR_TT	rdpr	%tt, %r27
	.word 0xa190200c  ! 656: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8a68c01a  ! 657: UDIVX_R	udivx 	%r3, %r26, %r5
	.word 0x93902000  ! 658: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902004  ! 659: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902002  ! 660: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982d45  ! 661: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d45, %hpstate
	.word 0xcaffc03a  ! 662: SWAPA_R	swapa	%r5, [%r31 + %r26] 0x01
	.word 0xa1902009  ! 663: WRPR_GL_I	wrpr	%r0, 0x0009, %-
reduce_priv_level_78:
	.word 0x8f902002  ! 665: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8981c00c  ! 664: WRTICK_R	wr	%r7, %r12, %tick
	.word 0x87802004  ! 665: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x819829c7  ! 666: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c7, %hpstate
	.word 0x93902001  ! 667: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902000  ! 668: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa668e001  ! 669: UDIVX_I	udivx 	%r3, 0x0001, %r19
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 670: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xa190200e  ! 673: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x81508000  ! 674: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0xc0c00e80  ! 675: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r0
	.word 0x93902005  ! 676: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93d02031  ! 677: Tcc_I	tne	icc_or_xcc, %r0 + 49
DS_79:
	.word 0x20800001  ! 679: BN	bn,a	<label_0x1>
	.word 0xcb314005  ! 679: STQF_R	-	%f5, [%r5, %r5]
	normalw
	.word 0xb3458000  ! 678: RD_SOFTINT_REG	rd	%softint, %r25
	.word 0xf33fc005  ! 679: STDF_R	std	%f25, [%r5, %r31]
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 680: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 681: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902000  ! 682: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982414  ! 683: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0414, %hpstate
	.word 0x84d10003  ! 684: UMULcc_R	umulcc 	%r4, %r3, %r2
	.word 0x81982ace  ! 685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ace, %hpstate
	.word 0x9b508000  ! 686: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0xa190200d  ! 687: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xda2fc003  ! 688: STB_R	stb	%r13, [%r31 + %r3]
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 689: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x84fa4008  ! 690: SDIVcc_R	sdivcc 	%r9, %r8, %r2
	.word 0xa1902006  ! 691: WRPR_GL_I	wrpr	%r0, 0x0006, %-
DS_80:
	.word 0x34800001  ! 693: BG	bg,a	<label_0x1>
	.word 0xf736c003  ! 693: STQF_R	-	%f27, [%r3, %r27]
	normalw
	.word 0xb5458000  ! 692: RD_SOFTINT_REG	rd	%softint, %r26
	.word 0xa1902007  ! 693: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xf497e030  ! 694: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r26
change_to_randtl_81:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 695: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa350c000  ! 696: RDPR_TT	rdpr	%tt, %r17
	.word 0x8fa00545  ! 697: FSQRTd	fsqrt	
	.word 0xaec2a001  ! 698: ADDCcc_I	addccc 	%r10, 0x0001, %r23
	.word 0xee8fe020  ! 699: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r23
change_to_tl1_82:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
splash_htba_83:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 701: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902004  ! 702: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x86f82001  ! 703: SDIVcc_I	sdivcc 	%r0, 0x0001, %r3
change_to_tl1_84:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02031  ! 705: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xafa58d3b  ! 706: FsMULd	fsmuld	%f22, %f58, %f54
	.word 0x879020fa  ! 707: WRPR_TT_I	wrpr	%r0, 0x00fa, %tt
	.word 0x8cd0e001  ! 708: UMULcc_I	umulcc 	%r3, 0x0001, %r6
	.word 0x87902119  ! 709: WRPR_TT_I	wrpr	%r0, 0x0119, %tt
	.word 0xcc8008a0  ! 710: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8d902212  ! 711: WRPR_PSTATE_I	wrpr	%r0, 0x0212, %pstate
	.word 0x879020ad  ! 712: WRPR_TT_I	wrpr	%r0, 0x00ad, %tt
	.word 0xa1902008  ! 713: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_cmpr_85:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 715: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1842001  ! 714: WR_STICK_REG_I	wr	%r16, 0x0001, %-
	.word 0xac68001a  ! 715: UDIVX_R	udivx 	%r0, %r26, %r22
	.word 0x879020e2  ! 716: WRPR_TT_I	wrpr	%r0, 0x00e2, %tt
	.word 0x3c800001  ! 717: BPOS	bpos,a	<label_0x1>
	.word 0x8c696001  ! 718: UDIVX_I	udivx 	%r5, 0x0001, %r6
	.word 0x8198240d  ! 719: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040d, %hpstate
	.word 0x87902092  ! 720: WRPR_TT_I	wrpr	%r0, 0x0092, %tt
	.word 0x879020d6  ! 721: WRPR_TT_I	wrpr	%r0, 0x00d6, %tt
	.word 0x88a9400a  ! 722: ANDNcc_R	andncc 	%r5, %r10, %r4
	.word 0x91d02034  ! 723: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902002  ! 724: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x91d02033  ! 725: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d90240c  ! 726: WRPR_PSTATE_I	wrpr	%r0, 0x040c, %pstate
DS_86:
	.word 0x20800001  ! 728: BN	bn,a	<label_0x1>
	.xword 0xb1d2d3ed	! Random illegal ?
	.word 0xf7154003  ! 728: LDQF_R	-	[%r21, %r3], %f27
	.word 0xa5a4c830  ! 727: FADDs	fadds	%f19, %f16, %f18
	.word 0xa3514000  ! 728: RDPR_TBA	rdpr	%tba, %r17
	.word 0x8d802004  ! 729: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x88808001  ! 730: ADDcc_R	addcc 	%r2, %r1, %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0xc927c001  ! 732: STF_R	st	%f4, [%r1, %r31]
	.word 0x81982dcf  ! 733: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcf, %hpstate
	otherw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 734: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc847c000  ! 735: LDSW_R	ldsw	[%r31 + %r0], %r4
	.word 0x8ba289c1  ! 736: FDIVd	fdivd	%f10, %f32, %f36
	.word 0xa1902009  ! 737: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xcac804a0  ! 738: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
	.word 0x87902382  ! 739: WRPR_TT_I	wrpr	%r0, 0x0382, %tt
change_to_randtl_87:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 740: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8d902edb  ! 741: WRPR_PSTATE_I	wrpr	%r0, 0x0edb, %pstate
	.word 0xca8008a0  ! 742: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8d902819  ! 743: WRPR_PSTATE_I	wrpr	%r0, 0x0819, %pstate
	.word 0x8d902ed8  ! 744: WRPR_PSTATE_I	wrpr	%r0, 0x0ed8, %pstate
	.word 0xca3fc001  ! 745: STD_R	std	%r5, [%r31 + %r1]
change_to_randtl_88:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 746: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x83d02033  ! 747: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xb7500000  ! 748: RDPR_TPC	rdpr	%tpc, %r27
DS_89:
	.word 0x34800001  ! 750: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 749: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa9500000  ! 750: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902004  ! 752: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_90:
	.word 0x34800001  ! 754: BG	bg,a	<label_0x1>
	allclean
	.word 0x87b0c301  ! 753: ALLIGNADDRESS	alignaddr	%r3, %r1, %r3
	.word 0xc7e7c021  ! 754: CASA_I	casa	[%r31] 0x 1, %r1, %r3
	.word 0xc68008a0  ! 755: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8f508000  ! 756: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0xce37e001  ! 757: STH_I	sth	%r7, [%r31 + 0x0001]
	.word 0x8d90288d  ! 758: WRPR_PSTATE_I	wrpr	%r0, 0x088d, %pstate
	.word 0x93d02035  ! 759: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8d902e05  ! 760: WRPR_PSTATE_I	wrpr	%r0, 0x0e05, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9ba00569  ! 762: FSQRTq	fsqrt	
	.word 0xa190200a  ! 763: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xdbe7c029  ! 764: CASA_I	casa	[%r31] 0x 1, %r9, %r13
	.word 0xa190200c  ! 765: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa190200a  ! 766: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_htba_91:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 767: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8f508000  ! 768: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0xcec004a0  ! 769: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0x9f802001  ! 770: SIR	sir	0x0001
	.word 0xcfe7c029  ! 771: CASA_I	casa	[%r31] 0x 1, %r9, %r7
	.word 0x8d902ece  ! 772: WRPR_PSTATE_I	wrpr	%r0, 0x0ece, %pstate
	.word 0x99a0054d  ! 773: FSQRTd	fsqrt	
	.word 0x93902003  ! 774: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa751c000  ! 775: RDPR_TL	rdpr	%tl, %r19
	.word 0x93902005  ! 776: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_htba_92:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 777: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x81982886  ! 778: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0886, %hpstate
	.word 0x91d02033  ! 779: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x879021cb  ! 780: WRPR_TT_I	wrpr	%r0, 0x01cb, %tt
	.word 0x28700001  ! 781: BPLEU	<illegal instruction>
	.word 0x879022e1  ! 782: WRPR_TT_I	wrpr	%r0, 0x02e1, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982f0d  ! 784: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0d, %hpstate
	.word 0x8f504000  ! 785: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0xce7fe001  ! 786: SWAP_I	swap	%r7, [%r31 + 0x0001]
	.word 0x824ec00c  ! 787: MULX_R	mulx 	%r27, %r12, %r1
	.word 0xc3e7c02c  ! 788: CASA_I	casa	[%r31] 0x 1, %r12, %r1
	.word 0x879022a1  ! 789: WRPR_TT_I	wrpr	%r0, 0x02a1, %tt
	.word 0xc337e001  ! 790: STQF_I	-	%f1, [0x0001, %r31]
	.word 0x87802014  ! 791: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x879021d1  ! 792: WRPR_TT_I	wrpr	%r0, 0x01d1, %tt
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 793: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9b514000  ! 794: RDPR_TBA	rdpr	%tba, %r13
	.word 0xa9504000  ! 795: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x8d902c84  ! 796: WRPR_PSTATE_I	wrpr	%r0, 0x0c84, %pstate
	.word 0x9f802001  ! 797: SIR	sir	0x0001
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 798: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 799: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x85a1cdcb  ! 800: FdMULq	fdmulq	
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 801: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc5e7c02b  ! 802: CASA_I	casa	[%r31] 0x 1, %r11, %r2
	.word 0xaf6a0019  ! 803: SDIVX_R	sdivx	%r8, %r25, %r23
	.word 0xa190200b  ! 804: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xa350c000  ! 805: RDPR_TT	rdpr	%tt, %r17
	.word 0x98fa2001  ! 806: SDIVcc_I	sdivcc 	%r8, 0x0001, %r12
	.word 0xa7a18dd6  ! 807: FdMULq	fdmulq	
	.word 0x8d504000  ! 808: RDPR_TNPC	<illegal instruction>
	.word 0x8d902897  ! 809: WRPR_PSTATE_I	wrpr	%r0, 0x0897, %pstate
	.word 0xcc8fe010  ! 810: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r6
	.word 0x87802089  ! 811: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x3e800001  ! 812: BVC	bvc,a	<label_0x1>
	.word 0x93902007  ! 813: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902009  ! 814: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xcc8804a0  ! 815: LDUBA_R	lduba	[%r0, %r0] 0x25, %r6
	.word 0xa1902007  ! 816: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xb7a00540  ! 817: FSQRTd	fsqrt	
	.word 0x986e000b  ! 818: UDIVX_R	udivx 	%r24, %r11, %r12
	.word 0x93902007  ! 819: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d802004  ! 820: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90244a  ! 821: WRPR_PSTATE_I	wrpr	%r0, 0x044a, %pstate
	.word 0x91d02033  ! 822: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_93:
	.word 0x32800001  ! 824: BNE	bne,a	<label_0x1>
	.word 0xcd32c014  ! 824: STQF_R	-	%f6, [%r20, %r11]
	normalw
	.word 0x8b458000  ! 823: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x97a249db  ! 824: FDIVd	fdivd	%f40, %f58, %f42
change_to_randtl_94:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 825: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x819820d4  ! 826: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d4, %hpstate
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 827: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83a000d5  ! 828: FNEGd	fnegd	%f52, %f32
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 829: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a50  ! 830: WRPR_PSTATE_I	wrpr	%r0, 0x0a50, %pstate
	.word 0x87802014  ! 831: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x946c8008  ! 832: UDIVX_R	udivx 	%r18, %r8, %r10
	.word 0x81982987  ! 833: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0987, %hpstate
	.word 0x81982895  ! 834: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0895, %hpstate
	.word 0x879023e9  ! 835: WRPR_TT_I	wrpr	%r0, 0x03e9, %tt
	.word 0x81982344  ! 836: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0344, %hpstate
	.word 0x8d902edc  ! 837: WRPR_PSTATE_I	wrpr	%r0, 0x0edc, %pstate
	ta	T_CHANGE_TO_TL0	! macro
splash_htba_95:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 839: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 840: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 841: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd48008a0  ! 842: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa190200a  ! 843: WRPR_GL_I	wrpr	%r0, 0x000a, %-
DS_96:
	.word 0x34800001  ! 845: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 844: SAVE_R	save	%r31, %r0, %r31
	.word 0x32800001  ! 845: BNE	bne,a	<label_0x1>
	.word 0xd4d7e010  ! 846: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
	.word 0x82d1800d  ! 847: UMULcc_R	umulcc 	%r6, %r13, %r1
	.word 0xaf508000  ! 848: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xeeffc02d  ! 849: SWAPA_R	swapa	%r23, [%r31 + %r13] 0x01
	.word 0x819827d7  ! 850: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d7, %hpstate
	.word 0x91d02035  ! 851: Tcc_I	ta	icc_or_xcc, %r0 + 53
reduce_priv_level_97:
	.word 0x8f902002  ! 853: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb182c00a  ! 852: WR_STICK_REG_R	wr	%r11, %r10, %-
	.word 0x93902007  ! 853: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81982e0d  ! 854: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0d, %hpstate
change_to_randtl_98:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 855: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xee2fc00a  ! 856: STB_R	stb	%r23, [%r31 + %r10]
change_to_tl1_99:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x884c001a  ! 858: MULX_R	mulx 	%r16, %r26, %r4
	.word 0x83d02031  ! 859: Tcc_I	te	icc_or_xcc, %r0 + 49
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 860: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_100:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 861: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902297  ! 863: WRPR_PSTATE_I	wrpr	%r0, 0x0297, %pstate
change_to_randtl_101:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 864: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 865: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_102:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 866: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x93902003  ! 867: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d802000  ! 868: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87a409e9  ! 869: FDIVq	dis not found

	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 870: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x924ec010  ! 871: MULX_R	mulx 	%r27, %r16, %r9
	.word 0x8280c00c  ! 872: ADDcc_R	addcc 	%r3, %r12, %r1
	.word 0xb482c002  ! 873: ADDcc_R	addcc 	%r11, %r2, %r26
	.word 0xa190200e  ! 874: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa1902002  ! 875: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa3514000  ! 876: RDPR_TBA	rdpr	%tba, %r17
	.word 0xb150c000  ! 877: RDPR_TT	<illegal instruction>
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 878: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_103:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 879: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xf017e001  ! 880: LDUH_I	lduh	[%r31 + 0x0001], %r24
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 881: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xb5a00562  ! 882: FSQRTq	fsqrt	
	.word 0x91514000  ! 883: RDPR_TBA	rdpr	%tba, %r8
DS_104:
	.word 0x32800001  ! 885: BNE	bne,a	<label_0x1>
	pdist %f26, %f14, %f28
	.word 0xb5b40301  ! 884: ALLIGNADDRESS	alignaddr	%r16, %r1, %r26
	.word 0x95508000  ! 885: RDPR_TSTATE	rdpr	%tstate, %r10
DS_105:
	.word 0x20800001  ! 887: BN	bn,a	<label_0x1>
	allclean
	.word 0x99b24310  ! 886: ALLIGNADDRESS	alignaddr	%r9, %r16, %r12
	.word 0x30800001  ! 887: BA	ba,a	<label_0x1>
	.word 0x87902348  ! 888: WRPR_TT_I	wrpr	%r0, 0x0348, %tt
	.word 0xb7a6c9a0  ! 889: FDIVs	fdivs	%f27, %f0, %f27
	.word 0x96f94005  ! 890: SDIVcc_R	sdivcc 	%r5, %r5, %r11
	.word 0x87902109  ! 891: WRPR_TT_I	wrpr	%r0, 0x0109, %tt
	.word 0x8d902246  ! 892: WRPR_PSTATE_I	wrpr	%r0, 0x0246, %pstate
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 893: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd6d004a0  ! 894: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r11
splash_tba_106:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 895: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879020c5  ! 896: WRPR_TT_I	wrpr	%r0, 0x00c5, %tt
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 897: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x2e800001  ! 898: BVS	bvs,a	<label_0x1>
DS_107:
	.word 0x22800001  ! 900: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 899: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 900: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91540000  ! 901: RDPR_GL	rdpr	%-, %r8
	.word 0x26700001  ! 902: BPL	<illegal instruction>
	.word 0x95a000c3  ! 903: FNEGd	fnegd	%f34, %f10
	.word 0x93902007  ! 904: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x88d40017  ! 905: UMULcc_R	umulcc 	%r16, %r23, %r4
	.word 0x9ba00569  ! 906: FSQRTq	fsqrt	
	.word 0x91a2cdc2  ! 907: FdMULq	fdmulq	
	.word 0x93902000  ! 908: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa7514000  ! 909: RDPR_TBA	rdpr	%tba, %r19
	.word 0x8d802004  ! 910: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982fd6  ! 911: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd6, %hpstate
	.word 0xe68fe030  ! 912: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r19
	.word 0x89a00547  ! 913: FSQRTd	fsqrt	
	.word 0x8ed0e001  ! 914: UMULcc_I	umulcc 	%r3, 0x0001, %r7
	.word 0xa190200d  ! 915: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xce8008a0  ! 916: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xa1a0054a  ! 917: FSQRTd	fsqrt	
	.word 0x9f802001  ! 918: SIR	sir	0x0001
	.word 0x879022c0  ! 919: WRPR_TT_I	wrpr	%r0, 0x02c0, %tt
	.word 0x8d802000  ! 920: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d02030  ! 921: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xa1504000  ! 922: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x93902003  ! 923: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902418  ! 924: WRPR_PSTATE_I	wrpr	%r0, 0x0418, %pstate
	.word 0x8b514000  ! 925: RDPR_TBA	rdpr	%tba, %r5
	.word 0xa7500000  ! 926: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x87902307  ! 927: WRPR_TT_I	wrpr	%r0, 0x0307, %tt
	.word 0x87802016  ! 928: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x9f802001  ! 929: SIR	sir	0x0001
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 930: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_108:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902001  ! 932: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe6d004a0  ! 933: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r19
	.word 0x91d02031  ! 934: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x9f802001  ! 935: SIR	sir	0x0001
	.word 0x8d9020d3  ! 936: WRPR_PSTATE_I	wrpr	%r0, 0x00d3, %pstate
splash_htba_109:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 937: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe73fc00a  ! 938: STDF_R	std	%f19, [%r10, %r31]
	.word 0x87902174  ! 939: WRPR_TT_I	wrpr	%r0, 0x0174, %tt
	.word 0x819827df  ! 940: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
	.word 0x91d02031  ! 941: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa190200f  ! 942: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_cmpr_110:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 943: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0x87802004  ! 944: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa190200a  ! 945: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xa1902007  ! 946: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8198255f  ! 947: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055f, %hpstate
	.word 0x26700001  ! 948: BPL	<illegal instruction>
	.word 0x87902088  ! 949: WRPR_TT_I	wrpr	%r0, 0x0088, %tt
splash_tba_111:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 950: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902a47  ! 951: WRPR_PSTATE_I	wrpr	%r0, 0x0a47, %pstate
	.word 0xad504000  ! 952: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x87902357  ! 953: WRPR_TT_I	wrpr	%r0, 0x0357, %tt
	.word 0xb0f9400b  ! 954: SDIVcc_R	sdivcc 	%r5, %r11, %r24
	.word 0x93902004  ! 955: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 956: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 957: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902e1b  ! 958: WRPR_PSTATE_I	wrpr	%r0, 0x0e1b, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 959: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb1a000db  ! 960: FNEGd	fnegd	%f58, %f24
	ta	T_CHANGE_HPRIV	! macro
	.word 0xb151c000  ! 962: RDPR_TL	rdpr	%tl, %r24
	.word 0x87802088  ! 963: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x81982815  ! 964: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0815, %hpstate
	.word 0x8d902a1f  ! 965: WRPR_PSTATE_I	wrpr	%r0, 0x0a1f, %pstate
splash_tba_112:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 966: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x97a000cc  ! 967: FNEGd	fnegd	%f12, %f42
	.word 0xa1902002  ! 968: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x819821ce  ! 969: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01ce, %hpstate
	.word 0x879020cf  ! 970: WRPR_TT_I	wrpr	%r0, 0x00cf, %tt
DS_113:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 971: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x91d02030  ! 972: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902006  ! 973: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x91d02035  ! 974: Tcc_I	ta	icc_or_xcc, %r0 + 53
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 975: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 976: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902407  ! 977: WRPR_PSTATE_I	wrpr	%r0, 0x0407, %pstate
DS_114:
	.word 0x20800001  ! 979: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 978: SAVE_R	save	%r31, %r0, %r31
splash_cmpr_115:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 980: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181e001  ! 979: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0x8198280d  ! 980: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080d, %hpstate
	.word 0x22800001  ! 981: BE	be,a	<label_0x1>
	.word 0x94828016  ! 982: ADDcc_R	addcc 	%r10, %r22, %r10
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 983: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 984: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 985: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa8816001  ! 986: ADDcc_I	addcc 	%r5, 0x0001, %r20
	.word 0xaafa8008  ! 987: SDIVcc_R	sdivcc 	%r10, %r8, %r21
	.word 0x87902104  ! 988: WRPR_TT_I	wrpr	%r0, 0x0104, %tt
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 989: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879020f0  ! 990: WRPR_TT_I	wrpr	%r0, 0x00f0, %tt
	.word 0x91d02034  ! 991: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_116:
	.word 0x22800001  ! 993: BE	be,a	<label_0x1>
	.word 0xc530e001  ! 993: STQF_I	-	%f2, [0x0001, %r3]
	normalw
	.word 0x81458000  ! 992: RD_SOFTINT_REG	stbar
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 993: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc0d00e80  ! 994: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r0
splash_htba_117:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 995: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d9024c5  ! 996: WRPR_PSTATE_I	wrpr	%r0, 0x04c5, %pstate
	.word 0x36800001  ! 997: BGE	bge,a	<label_0x1>
	.word 0x90fa800b  ! 998: SDIVcc_R	sdivcc 	%r10, %r11, %r8
	.word 0x83702001  ! 999: POPC_I	popc	0x0001, %r1
	.word 0xa5500000  ! 1000: RDPR_TPC	rdpr	%tpc, %r18
splash_htba_118:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1001: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_cmpr_119:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1003: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1806001  ! 1002: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0xa9a01a68  ! 1003: FqTOi	fqtoi	
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1004: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819828dc  ! 1005: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08dc, %hpstate
	.word 0xe84fc000  ! 1006: LDSB_R	ldsb	[%r31 + %r0], %r20
	.word 0x93d02034  ! 1007: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xe82fe001  ! 1008: STB_I	stb	%r20, [%r31 + 0x0001]
	.word 0xa1902005  ! 1009: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902a02  ! 1010: WRPR_PSTATE_I	wrpr	%r0, 0x0a02, %pstate
	.word 0x93902006  ! 1011: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02030  ! 1012: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x819824c6  ! 1013: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c6, %hpstate
	.word 0x8d902449  ! 1014: WRPR_PSTATE_I	wrpr	%r0, 0x0449, %pstate
	.word 0x93902000  ! 1015: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe8900e60  ! 1016: LDUHA_R	lduha	[%r0, %r0] 0x73, %r20
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1017: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe88008a0  ! 1018: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xe88008a0  ! 1019: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
change_to_randtl_120:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1020: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8790210f  ! 1021: WRPR_TT_I	wrpr	%r0, 0x010f, %tt
	.word 0xe8d7e010  ! 1022: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r20
	.word 0x81982a8d  ! 1023: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8d, %hpstate
	.word 0x93d02034  ! 1024: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xa1902004  ! 1025: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8198265e  ! 1026: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065e, %hpstate
	.word 0x9550c000  ! 1027: RDPR_TT	rdpr	%tt, %r10
	.word 0x879021ed  ! 1028: WRPR_TT_I	wrpr	%r0, 0x01ed, %tt
	.word 0x93902002  ! 1029: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f802001  ! 1030: SIR	sir	0x0001
	.word 0x87802016  ! 1031: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa1902006  ! 1032: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x81982d04  ! 1033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d04, %hpstate
	.word 0x8790214f  ! 1034: WRPR_TT_I	wrpr	%r0, 0x014f, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd417e001  ! 1036: LDUH_I	lduh	[%r31 + 0x0001], %r10
	.word 0x87902060  ! 1037: WRPR_TT_I	wrpr	%r0, 0x0060, %tt
	.word 0x9750c000  ! 1038: RDPR_TT	rdpr	%tt, %r11
	.word 0x93d02033  ! 1039: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x879022a3  ! 1040: WRPR_TT_I	wrpr	%r0, 0x02a3, %tt
	.word 0x83d02032  ! 1041: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xd637e001  ! 1042: STH_I	sth	%r11, [%r31 + 0x0001]
splash_cmpr_121:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1044: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182e001  ! 1043: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0x9f802001  ! 1044: SIR	sir	0x0001
	.word 0x8d902cd8  ! 1045: WRPR_PSTATE_I	wrpr	%r0, 0x0cd8, %pstate
	.word 0x91d02033  ! 1046: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902000  ! 1047: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1048: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200d  ! 1049: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd68008a0  ! 1050: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
DS_122:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1051: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd6dfe010  ! 1052: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0xd73fc008  ! 1053: STDF_R	std	%f11, [%r8, %r31]
splash_cmpr_123:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1055: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1802001  ! 1054: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	.word 0x91d02033  ! 1055: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902005  ! 1056: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982315  ! 1057: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0315, %hpstate
	.word 0xd69fe001  ! 1058: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r11
	.word 0x984ac016  ! 1059: MULX_R	mulx 	%r11, %r22, %r12
	.word 0xd89fc020  ! 1060: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x8f540000  ! 1061: RDPR_GL	rdpr	%-, %r7
	.word 0x81982c57  ! 1062: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c57, %hpstate
	.word 0xa1902004  ! 1063: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xce800ae0  ! 1064: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r7
	.word 0xa190200d  ! 1065: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93d02035  ! 1066: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa190200c  ! 1067: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_cmpr_124:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1852001  ! 1068: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	.word 0x87500000  ! 1069: RDPR_TPC	<illegal instruction>
	.word 0x8d902e8d  ! 1070: WRPR_PSTATE_I	wrpr	%r0, 0x0e8d, %pstate
	.word 0x879023ec  ! 1071: WRPR_TT_I	wrpr	%r0, 0x03ec, %tt
DS_125:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1072: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xa8692001  ! 1073: UDIVX_I	udivx 	%r4, 0x0001, %r20
	.word 0x95a01a68  ! 1074: FqTOi	fqtoi	
	.word 0x87902136  ! 1075: WRPR_TT_I	wrpr	%r0, 0x0136, %tt
	.word 0x93902004  ! 1076: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d802004  ! 1077: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8b508000  ! 1078: RDPR_TSTATE	rdpr	%tstate, %r5
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 1079: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 1080: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8198201d  ! 1081: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001d, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1082: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_126:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1083: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902004  ! 1084: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1085: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 1086: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902005  ! 1087: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x91d02031  ! 1088: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87802010  ! 1089: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xca8804a0  ! 1090: LDUBA_R	lduba	[%r0, %r0] 0x25, %r5
	.word 0x8cf8c016  ! 1091: SDIVcc_R	sdivcc 	%r3, %r22, %r6
splash_tba_127:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1092: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc7fe001  ! 1093: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x91d02034  ! 1094: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1095: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x30700001  ! 1096: BPA	<illegal instruction>
	.word 0xa0830013  ! 1097: ADDcc_R	addcc 	%r12, %r19, %r16
DS_128:
	.word 0x32800001  ! 1099: BNE	bne,a	<label_0x1>
	pdist %f2, %f8, %f4
	.word 0x85b6c311  ! 1098: ALLIGNADDRESS	alignaddr	%r27, %r17, %r2
	.word 0x8d902417  ! 1099: WRPR_PSTATE_I	wrpr	%r0, 0x0417, %pstate
splash_htba_129:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1100: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1101: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc4c804a0  ! 1102: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r2
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1103: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83a000c5  ! 1104: FNEGd	fnegd	%f36, %f32
	.word 0x93902001  ! 1105: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902495  ! 1106: WRPR_PSTATE_I	wrpr	%r0, 0x0495, %pstate
	.word 0xc327e001  ! 1107: STF_I	st	%f1, [0x0001, %r31]
	.word 0x93902002  ! 1108: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x879023c4  ! 1109: WRPR_TT_I	wrpr	%r0, 0x03c4, %tt
	.word 0x9f802001  ! 1110: SIR	sir	0x0001
	.word 0x81a409a3  ! 1111: FDIVs	fdivs	%f16, %f3, %f0
	.word 0x819820dc  ! 1112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dc, %hpstate
	.word 0x8d50c000  ! 1113: RDPR_TT	rdpr	%tt, %r6
	.word 0x93902005  ! 1114: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f802001  ! 1115: SIR	sir	0x0001
	.word 0x8d902284  ! 1116: WRPR_PSTATE_I	wrpr	%r0, 0x0284, %pstate
	.word 0xa1902006  ! 1117: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d902210  ! 1118: WRPR_PSTATE_I	wrpr	%r0, 0x0210, %pstate
	.word 0x97a000cd  ! 1119: FNEGd	fnegd	%f44, %f42
	.word 0x8198210f  ! 1120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010f, %hpstate
	.word 0x87902216  ! 1121: WRPR_TT_I	wrpr	%r0, 0x0216, %tt
splash_htba_130:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1122: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02032  ! 1123: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd68008a0  ! 1124: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x8d90224d  ! 1125: WRPR_PSTATE_I	wrpr	%r0, 0x024d, %pstate
	.word 0x8b500000  ! 1126: RDPR_TPC	rdpr	%tpc, %r5
	.word 0x91a00546  ! 1127: FSQRTd	fsqrt	
	.word 0x93902002  ! 1128: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902005  ! 1129: WRPR_GL_I	wrpr	%r0, 0x0005, %-
reduce_priv_level_131:
	.word 0x8f902000  ! 1131: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1858017  ! 1130: WR_STICK_REG_R	wr	%r22, %r23, %-
reduce_priv_level_132:
	.word 0x8f902000  ! 1132: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8b6ce001  ! 1131: SDIVX_I	sdivx	%r19, 0x0001, %r5
	.word 0x99902005  ! 1132: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xb06c0005  ! 1133: UDIVX_R	udivx 	%r16, %r5, %r24
	.word 0x93902006  ! 1134: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8198259d  ! 1135: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059d, %hpstate
	.word 0x83d02032  ! 1136: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xa1902008  ! 1137: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x81982c9e  ! 1138: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9e, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1139: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982f9e  ! 1140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9e, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902646  ! 1142: WRPR_PSTATE_I	wrpr	%r0, 0x0646, %pstate
	.word 0x8d90245f  ! 1143: WRPR_PSTATE_I	wrpr	%r0, 0x045f, %pstate
	.word 0xf08804a0  ! 1144: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
reduce_priv_level_133:
	.word 0x8f902002  ! 1146: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81b01021  ! 1145: SIAM	siam	1
	ta	T_CHANGE_PRIV	! macro
	.word 0xaf508000  ! 1147: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x8d902885  ! 1148: WRPR_PSTATE_I	wrpr	%r0, 0x0885, %pstate
	.word 0x91d02034  ! 1149: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902442  ! 1150: WRPR_PSTATE_I	wrpr	%r0, 0x0442, %pstate
	.word 0xa190200d  ! 1151: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d802000  ! 1152: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91a209e2  ! 1153: FDIVq	dis not found

	.word 0x93902004  ! 1154: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x879023e3  ! 1155: WRPR_TT_I	wrpr	%r0, 0x03e3, %tt
	.word 0x93d02033  ! 1156: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d9028c1  ! 1157: WRPR_PSTATE_I	wrpr	%r0, 0x08c1, %pstate
	.word 0x8790224e  ! 1158: WRPR_TT_I	wrpr	%r0, 0x024e, %tt
	.word 0x24700001  ! 1159: BPLE	<illegal instruction>
	.word 0x81982795  ! 1160: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0795, %hpstate
	.word 0x8f540000  ! 1161: RDPR_GL	rdpr	%-, %r7
	.word 0xa190200f  ! 1162: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_134:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1163: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_cmpr_135:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1165: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180e001  ! 1164: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x93514000  ! 1165: RDPR_TBA	<illegal instruction>
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1166: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd2c7e000  ! 1167: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
	.word 0x91d02032  ! 1168: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200d  ! 1169: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa1504000  ! 1170: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0x93902006  ! 1171: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f802001  ! 1172: SIR	sir	0x0001
	.word 0x8d902448  ! 1173: WRPR_PSTATE_I	wrpr	%r0, 0x0448, %pstate
	.word 0x8d902c44  ! 1174: WRPR_PSTATE_I	wrpr	%r0, 0x0c44, %pstate
	.word 0x9f802001  ! 1175: SIR	sir	0x0001
	.word 0x91500000  ! 1176: RDPR_TPC	rdpr	%tpc, %r8
	.word 0x83d02034  ! 1177: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d9028d9  ! 1178: WRPR_PSTATE_I	wrpr	%r0, 0x08d9, %pstate
	.word 0xa190200e  ! 1179: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa1902003  ! 1180: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8790211a  ! 1181: WRPR_TT_I	wrpr	%r0, 0x011a, %tt
	.word 0xa1902008  ! 1182: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x91d02033  ! 1183: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902002  ! 1184: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_136:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184e001  ! 1185: WR_STICK_REG_I	wr	%r19, 0x0001, %-
	.word 0x98d2c005  ! 1186: UMULcc_R	umulcc 	%r11, %r5, %r12
	.word 0x89a01a77  ! 1187: FqTOi	fqtoi	
	.word 0x879022b6  ! 1188: WRPR_TT_I	wrpr	%r0, 0x02b6, %tt
	.word 0x8198209e  ! 1189: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009e, %hpstate
	.word 0xc88008a0  ! 1190: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x8198258f  ! 1191: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058f, %hpstate
	.word 0xc8d7e030  ! 1192: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r4
change_to_randtl_137:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1193: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x91d02031  ! 1194: Tcc_I	ta	icc_or_xcc, %r0 + 49
splash_htba_138:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 1195: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc8ffc037  ! 1196: SWAPA_R	swapa	%r4, [%r31 + %r23] 0x01
	.word 0xa1902002  ! 1197: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902000  ! 1198: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x99902003  ! 1199: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
change_to_randtl_139:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1200: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xc927c017  ! 1201: STF_R	st	%f4, [%r23, %r31]
	.word 0x93902005  ! 1202: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8c6d6001  ! 1203: UDIVX_I	udivx 	%r21, 0x0001, %r6
	.word 0x8d902e5d  ! 1204: WRPR_PSTATE_I	wrpr	%r0, 0x0e5d, %pstate
	.word 0xaefa401b  ! 1205: SDIVcc_R	sdivcc 	%r9, %r27, %r23
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1206: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902008  ! 1207: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xee9004a0  ! 1208: LDUHA_R	lduha	[%r0, %r0] 0x25, %r23
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1209: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902271  ! 1210: WRPR_TT_I	wrpr	%r0, 0x0271, %tt
	.word 0x93902004  ! 1211: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9f802001  ! 1212: SIR	sir	0x0001
	.word 0x93902000  ! 1213: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02030  ! 1214: Tcc_I	ta	icc_or_xcc, %r0 + 48
DS_140:
	.word 0x32800001  ! 1216: BNE	bne,a	<label_0x1>
	.xword 0x9b5f568e	! Random illegal ?
	.word 0x89a0054b  ! 1216: FSQRTd	fsqrt	
	.word 0xa1a5483a  ! 1215: FADDs	fadds	%f21, %f26, %f16
	.word 0x826a2001  ! 1216: UDIVX_I	udivx 	%r8, 0x0001, %r1
	.word 0x90f8a001  ! 1217: SDIVcc_I	sdivcc 	%r2, 0x0001, %r8
	.word 0x819827cd  ! 1218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cd, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902e4c  ! 1220: WRPR_PSTATE_I	wrpr	%r0, 0x0e4c, %pstate
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1221: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x94fc6001  ! 1222: SDIVcc_I	sdivcc 	%r17, 0x0001, %r10
splash_tba_141:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1223: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91d02031  ! 1224: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x9f802001  ! 1225: SIR	sir	0x0001
	.word 0xd48008a0  ! 1226: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x9f802001  ! 1227: SIR	sir	0x0001
	.word 0xd4c804a0  ! 1228: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0x8d90205b  ! 1229: WRPR_PSTATE_I	wrpr	%r0, 0x005b, %pstate
	.word 0xb5a509cb  ! 1230: FDIVd	fdivd	%f20, %f42, %f26
	.word 0x91d02032  ! 1231: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x92ae0016  ! 1232: ANDNcc_R	andncc 	%r24, %r22, %r9
	.word 0xb6c1e001  ! 1233: ADDCcc_I	addccc 	%r7, 0x0001, %r27
	.word 0x93902004  ! 1234: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_cmpr_142:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1852001  ! 1235: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	.word 0xa190200b  ! 1236: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93902007  ! 1237: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902004  ! 1238: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8950c000  ! 1239: RDPR_TT	rdpr	%tt, %r4
	.word 0xc897e000  ! 1240: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r4
	.word 0x93902005  ! 1241: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902005  ! 1242: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1514000  ! 1243: RDPR_TBA	rdpr	%tba, %r16
	.word 0x91d02032  ! 1244: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8ad24016  ! 1245: UMULcc_R	umulcc 	%r9, %r22, %r5
	.word 0x8d902494  ! 1246: WRPR_PSTATE_I	wrpr	%r0, 0x0494, %pstate
	.word 0x81982e04  ! 1247: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e04, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1248: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_143:
	.word 0x34800001  ! 1250: BG	bg,a	<label_0x1>
	.word 0xd3326001  ! 1250: STQF_I	-	%f9, [0x0001, %r9]
	normalw
	.word 0x81458000  ! 1249: RD_SOFTINT_REG	stbar
	.word 0x826d000c  ! 1250: UDIVX_R	udivx 	%r20, %r12, %r1
	.word 0xc337c00c  ! 1251: STQF_R	-	%f1, [%r12, %r31]
	.word 0x819827d7  ! 1252: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d7, %hpstate
	.word 0x8d902cd2  ! 1253: WRPR_PSTATE_I	wrpr	%r0, 0x0cd2, %pstate
	.word 0xb3500000  ! 1254: RDPR_TPC	rdpr	%tpc, %r25
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1255: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1256: SIR	sir	0x0001
	.word 0x87802089  ! 1257: WRASI_I	wr	%r0, 0x0089, %asi
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1258: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_cmpr_144:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186a001  ! 1259: WR_STICK_REG_I	wr	%r26, 0x0001, %-
splash_cmpr_145:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1261: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1856001  ! 1260: WR_STICK_REG_I	wr	%r21, 0x0001, %-
	.word 0x81982ccc  ! 1261: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ccc, %hpstate
	.word 0xa1902001  ! 1262: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x91d02035  ! 1263: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x879023b7  ! 1264: WRPR_TT_I	wrpr	%r0, 0x03b7, %tt
	.word 0x93902007  ! 1265: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x85540000  ! 1266: RDPR_GL	rdpr	%-, %r2
splash_cmpr_146:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1842001  ! 1267: WR_STICK_REG_I	wr	%r16, 0x0001, %-
	.word 0x99902003  ! 1268: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1269: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc47fe001  ! 1270: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0x826ae001  ! 1271: UDIVX_I	udivx 	%r11, 0x0001, %r1
	.word 0x26700001  ! 1272: BPL	<illegal instruction>
	.word 0x93902001  ! 1273: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa190200b  ! 1274: WRPR_GL_I	wrpr	%r0, 0x000b, %-
reduce_priv_level_147:
	.word 0x8f902001  ! 1276: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb5a01965  ! 1275: FqTOd	dis not found

	.word 0x80ac0019  ! 1276: ANDNcc_R	andncc 	%r16, %r25, %r0
splash_tba_148:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1277: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879021f2  ! 1278: WRPR_TT_I	wrpr	%r0, 0x01f2, %tt
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1279: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81a209c9  ! 1280: FDIVd	fdivd	%f8, %f40, %f0
	.word 0x83d02035  ! 1281: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x81982ede  ! 1282: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ede, %hpstate
	.word 0x99702001  ! 1283: POPC_I	popc	0x0001, %r12
	.word 0x93902001  ! 1284: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x86d54011  ! 1285: UMULcc_R	umulcc 	%r21, %r17, %r3
	.word 0xc67fe001  ! 1286: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0xa1902002  ! 1287: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1288: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 1289: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02034  ! 1290: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x22800001  ! 1291: BE	be,a	<label_0x1>
DS_149:
	.word 0x32800001  ! 1293: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 1293: BNE	bne,a	<label_0x1>
	.word 0x9ba0055b  ! 1293: FSQRTd	fsqrt	
	.word 0x83a40839  ! 1292: FADDs	fadds	%f16, %f25, %f1
	.word 0x98acc015  ! 1293: ANDNcc_R	andncc 	%r19, %r21, %r12
	.word 0x87902089  ! 1294: WRPR_TT_I	wrpr	%r0, 0x0089, %tt
	.word 0xa190200b  ! 1295: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d902093  ! 1296: WRPR_PSTATE_I	wrpr	%r0, 0x0093, %pstate
	.word 0xa1902009  ! 1297: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d02030  ! 1298: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xd927c015  ! 1299: STF_R	st	%f12, [%r21, %r31]
splash_htba_150:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 1300: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd87fe001  ! 1301: SWAP_I	swap	%r12, [%r31 + 0x0001]
DS_151:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1302: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8d902c52  ! 1303: WRPR_PSTATE_I	wrpr	%r0, 0x0c52, %pstate
	.word 0xd83fc015  ! 1304: STD_R	std	%r12, [%r31 + %r21]
	.word 0x93d02032  ! 1305: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd87fe001  ! 1306: SWAP_I	swap	%r12, [%r31 + 0x0001]
reduce_priv_level_152:
	.word 0x8f902001  ! 1308: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 1307: SIAM	siam	1
	.word 0x9f802001  ! 1308: SIR	sir	0x0001
	.word 0x93902000  ! 1309: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x95b2cff9  ! 1310: FONES	fones	%f10
	.word 0xd5e7c039  ! 1311: CASA_I	casa	[%r31] 0x 1, %r25, %r10
splash_cmpr_153:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1313: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 1312: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa7504000  ! 1314: RDPR_TNPC	<illegal instruction>
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1315: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9ad5e001  ! 1316: UMULcc_I	umulcc 	%r23, 0x0001, %r13
	.word 0x91d02035  ! 1317: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902146  ! 1318: WRPR_TT_I	wrpr	%r0, 0x0146, %tt
	.word 0x81982b4f  ! 1319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4f, %hpstate
	.word 0xa1902000  ! 1320: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87902266  ! 1321: WRPR_TT_I	wrpr	%r0, 0x0266, %tt
	.word 0x81982906  ! 1322: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0906, %hpstate
	.word 0x91d02035  ! 1323: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93d02033  ! 1324: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x93902006  ! 1325: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982246  ! 1326: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0246, %hpstate
	.word 0x93902002  ! 1327: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_154:
	.word 0x34800001  ! 1329: BG	bg,a	<label_0x1>
	pdist %f10, %f28, %f30
	.word 0x83b0c312  ! 1328: ALLIGNADDRESS	alignaddr	%r3, %r18, %r1
	.word 0x8a6d000b  ! 1329: UDIVX_R	udivx 	%r20, %r11, %r5
splash_cmpr_155:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1331: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1846001  ! 1330: WR_STICK_REG_I	wr	%r17, 0x0001, %-
	.word 0x81982cd5  ! 1331: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd5, %hpstate
	.word 0x93902001  ! 1332: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_randtl_156:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1333: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x84d46001  ! 1334: UMULcc_I	umulcc 	%r17, 0x0001, %r2
	.word 0xc48008a0  ! 1335: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x81982bd4  ! 1336: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd4, %hpstate
splash_htba_157:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1337: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902009  ! 1338: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d902e85  ! 1339: WRPR_PSTATE_I	wrpr	%r0, 0x0e85, %pstate
	.word 0xc4cfe030  ! 1340: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r2
	.word 0x93d02035  ! 1341: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8ad8c002  ! 1342: SMULcc_R	smulcc 	%r3, %r2, %r5
	.word 0x8f500000  ! 1343: RDPR_TPC	rdpr	%tpc, %r7
	.word 0xcec00e60  ! 1344: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r7
	.word 0x93902002  ! 1345: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xce800ba0  ! 1346: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r7
	.word 0x81982c4e  ! 1347: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4e, %hpstate
	.word 0x8790216e  ! 1348: WRPR_TT_I	wrpr	%r0, 0x016e, %tt
	.word 0xa1902004  ! 1349: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x91d02033  ! 1350: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x99a01a77  ! 1351: FqTOi	fqtoi	
	.word 0x93902001  ! 1352: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9f802001  ! 1353: SIR	sir	0x0001
	.word 0x93902002  ! 1354: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f802001  ! 1355: SIR	sir	0x0001
	.word 0x8da34dc0  ! 1356: FdMULq	fdmulq	
reduce_priv_level_158:
	.word 0x8f902000  ! 1358: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89804005  ! 1357: WRTICK_R	wr	%r1, %r5, %tick
	.word 0xa7a00540  ! 1358: FSQRTd	fsqrt	
	.word 0x819825c4  ! 1359: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c4, %hpstate
	.word 0x879021a4  ! 1360: WRPR_TT_I	wrpr	%r0, 0x01a4, %tt
	.word 0x819821d7  ! 1361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d7, %hpstate
	.word 0xe6c004a0  ! 1362: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
	.word 0x8d802000  ! 1363: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902162  ! 1364: WRPR_TT_I	wrpr	%r0, 0x0162, %tt
	.word 0xe68fe000  ! 1365: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r19
	.word 0x8d90289a  ! 1366: WRPR_PSTATE_I	wrpr	%r0, 0x089a, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1367: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xacc02001  ! 1368: ADDCcc_I	addccc 	%r0, 0x0001, %r22
	.word 0xed17c000  ! 1369: LDQF_R	-	[%r31, %r0], %f22
	.word 0x93902005  ! 1370: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8790218a  ! 1371: WRPR_TT_I	wrpr	%r0, 0x018a, %tt
reduce_priv_level_159:
	.word 0x8f902001  ! 1373: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89818003  ! 1372: WRTICK_R	wr	%r6, %r3, %tick
	.word 0xa190200f  ! 1373: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x93d02032  ! 1374: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_cmpr_160:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180a001  ! 1375: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0x93902001  ! 1376: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8790221f  ! 1377: WRPR_TT_I	wrpr	%r0, 0x021f, %tt
	.word 0x87902326  ! 1378: WRPR_TT_I	wrpr	%r0, 0x0326, %tt
	.word 0x93902001  ! 1379: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1380: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_161:
	.word 0x34800001  ! 1382: BG	bg,a	<label_0x1>
	pdist %f4, %f14, %f26
	.word 0x8db48305  ! 1381: ALLIGNADDRESS	alignaddr	%r18, %r5, %r6
	.word 0x8790234f  ! 1382: WRPR_TT_I	wrpr	%r0, 0x034f, %tt
	.word 0xcc1fc000  ! 1383: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0xac836001  ! 1384: ADDcc_I	addcc 	%r13, 0x0001, %r22
	.word 0x91d02031  ! 1385: Tcc_I	ta	icc_or_xcc, %r0 + 49
splash_cmpr_162:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1866001  ! 1386: WR_STICK_REG_I	wr	%r25, 0x0001, %-
	.word 0x8198299e  ! 1387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099e, %hpstate
	.word 0x99902003  ! 1388: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x84aa8007  ! 1389: ANDNcc_R	andncc 	%r10, %r7, %r2
	.word 0xa1902005  ! 1390: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xb0d0c00a  ! 1391: UMULcc_R	umulcc 	%r3, %r10, %r24
	.word 0x85702001  ! 1392: POPC_I	popc	0x0001, %r2
	.word 0xa1902009  ! 1393: WRPR_GL_I	wrpr	%r0, 0x0009, %-
DS_163:
	.word 0x32800001  ! 1395: BNE	bne,a	<label_0x1>
	.word 0xd5352001  ! 1395: STQF_I	-	%f10, [0x0001, %r20]
	normalw
	.word 0x91458000  ! 1394: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x99a0c9f8  ! 1395: FDIVq	dis not found

	.word 0x91d02032  ! 1396: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd8c7e020  ! 1397: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r12
	.word 0x879022da  ! 1398: WRPR_TT_I	wrpr	%r0, 0x02da, %tt
	.word 0x30800001  ! 1399: BA	ba,a	<label_0x1>
	.word 0xada000c3  ! 1400: FNEGd	fnegd	%f34, %f22
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 1401: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x82fe400d  ! 1402: SDIVcc_R	sdivcc 	%r25, %r13, %r1
	.word 0x8f702001  ! 1403: POPC_I	popc	0x0001, %r7
	.word 0x93902001  ! 1404: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87902139  ! 1405: WRPR_TT_I	wrpr	%r0, 0x0139, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819828cf  ! 1407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cf, %hpstate
	.word 0x91d02031  ! 1408: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x91d02034  ! 1409: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xb2a94002  ! 1410: ANDNcc_R	andncc 	%r5, %r2, %r25
	.word 0xa1902002  ! 1411: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1412: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_164:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d802000  ! 1414: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 1415: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_165:
	.word 0x34800001  ! 1417: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1416: RESTORE_R	restore	%r31, %r0, %r31
DS_166:
	.word 0x22800001  ! 1418: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1417: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02034  ! 1418: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xf337c002  ! 1419: STQF_R	-	%f25, [%r2, %r31]
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1420: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1421: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x82fee001  ! 1422: SDIVcc_I	sdivcc 	%r27, 0x0001, %r1
	.word 0x91d02031  ! 1423: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x9281e001  ! 1424: ADDcc_I	addcc 	%r7, 0x0001, %r9
	.word 0xa190200b  ! 1425: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_167:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1426: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
splash_tba_168:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 1427: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd28fe020  ! 1428: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r9
	.word 0x8d802000  ! 1429: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902002  ! 1430: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa190200b  ! 1431: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xafa149b3  ! 1432: FDIVs	fdivs	%f5, %f19, %f23
	.word 0xa1902005  ! 1433: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x88d2e001  ! 1434: UMULcc_I	umulcc 	%r11, 0x0001, %r4
	.word 0x81982a04  ! 1435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a04, %hpstate
	.word 0x8198248d  ! 1436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048d, %hpstate
	.word 0xa1902000  ! 1437: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa190200e  ! 1438: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d802000  ! 1439: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982bc5  ! 1440: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc5, %hpstate
reduce_priv_level_169:
	.word 0x8f902001  ! 1442: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89814007  ! 1441: WRTICK_R	wr	%r5, %r7, %tick
	.word 0x8286e001  ! 1442: ADDcc_I	addcc 	%r27, 0x0001, %r1
	.word 0xc28008a0  ! 1443: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x8198259f  ! 1444: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059f, %hpstate
	.word 0x93902003  ! 1445: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02035  ! 1446: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc28fe010  ! 1447: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r1
	.word 0x93902000  ! 1448: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02033  ! 1449: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902a03  ! 1450: WRPR_PSTATE_I	wrpr	%r0, 0x0a03, %pstate
	.word 0x87802004  ! 1451: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8198275c  ! 1452: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075c, %hpstate
	.word 0xc2c004a0  ! 1453: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0x81982306  ! 1454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0306, %hpstate
	.word 0x879020f4  ! 1455: WRPR_TT_I	wrpr	%r0, 0x00f4, %tt
DS_170:
	.word 0x32800001  ! 1457: BNE	bne,a	<label_0x1>
	.word 0xc933000c  ! 1457: STQF_R	-	%f4, [%r12, %r12]
	normalw
	.word 0x97458000  ! 1456: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x81982315  ! 1457: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0315, %hpstate
	.word 0x85500000  ! 1458: RDPR_TPC	rdpr	%tpc, %r2
DS_171:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1459: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8d902ec3  ! 1460: WRPR_PSTATE_I	wrpr	%r0, 0x0ec3, %pstate
	.word 0x8780201c  ! 1461: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x819825d4  ! 1462: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d4, %hpstate
	.word 0x81982a97  ! 1463: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a97, %hpstate
	.word 0x34700001  ! 1464: BPG	<illegal instruction>
splash_htba_172:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1465: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8ba249a5  ! 1466: FDIVs	fdivs	%f9, %f5, %f5
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1467: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 1468: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xca8008a0  ! 1469: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
splash_cmpr_173:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1471: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1852001  ! 1470: WR_STICK_REG_I	wr	%r20, 0x0001, %-
	.word 0x91d02033  ! 1471: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902005  ! 1472: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x819827d5  ! 1473: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d5, %hpstate
	.word 0xcaffc025  ! 1474: SWAPA_R	swapa	%r5, [%r31 + %r5] 0x01
	ta	T_CHANGE_HPRIV	! macro
change_to_randtl_174:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1476: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x90c1a001  ! 1478: ADDCcc_I	addccc 	%r6, 0x0001, %r8
	.word 0x8d902802  ! 1479: WRPR_PSTATE_I	wrpr	%r0, 0x0802, %pstate
	.word 0x85a00573  ! 1480: FSQRTq	fsqrt	
	.word 0xc407e001  ! 1481: LDUW_I	lduw	[%r31 + 0x0001], %r2
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1482: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x96d4000a  ! 1484: UMULcc_R	umulcc 	%r16, %r10, %r11
	.word 0x87504000  ! 1485: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x91d02032  ! 1486: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 1488: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc6ffc02a  ! 1489: SWAPA_R	swapa	%r3, [%r31 + %r10] 0x01
	.word 0x87902103  ! 1490: WRPR_TT_I	wrpr	%r0, 0x0103, %tt
	.word 0x8f500000  ! 1491: RDPR_TPC	rdpr	%tpc, %r7
	.word 0xceffc02a  ! 1492: SWAPA_R	swapa	%r7, [%r31 + %r10] 0x01
	.word 0x93902006  ! 1493: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902ad7  ! 1495: WRPR_PSTATE_I	wrpr	%r0, 0x0ad7, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1496: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8efb0019  ! 1497: SDIVcc_R	sdivcc 	%r12, %r25, %r7
	.word 0xcec004a0  ! 1498: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xce37c019  ! 1499: STH_R	sth	%r7, [%r31 + %r25]
	.word 0x8950c000  ! 1500: RDPR_TT	rdpr	%tt, %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0xac806001  ! 1502: ADDcc_I	addcc 	%r1, 0x0001, %r22
	.word 0x8d90228a  ! 1503: WRPR_PSTATE_I	wrpr	%r0, 0x028a, %pstate
change_to_tl1_175:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x81982b9e  ! 1505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9e, %hpstate
	.word 0x864c001b  ! 1506: MULX_R	mulx 	%r16, %r27, %r3
	.word 0xa190200e  ! 1507: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x93902002  ! 1508: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc6dfe010  ! 1509: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r3
	.word 0x8d902e4c  ! 1510: WRPR_PSTATE_I	wrpr	%r0, 0x0e4c, %pstate
	.word 0x87902228  ! 1511: WRPR_TT_I	wrpr	%r0, 0x0228, %tt
splash_cmpr_176:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 1512: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0x93902005  ! 1513: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x97540000  ! 1514: RDPR_GL	rdpr	%-, %r11
	.word 0x83702001  ! 1515: POPC_I	popc	0x0001, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x8cd08016  ! 1517: UMULcc_R	umulcc 	%r2, %r22, %r6
	.word 0x8790224e  ! 1518: WRPR_TT_I	wrpr	%r0, 0x024e, %tt
splash_cmpr_177:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1520: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181e001  ! 1519: WR_STICK_REG_I	wr	%r7, 0x0001, %-
splash_htba_178:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1520: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1522: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb0a80002  ! 1523: ANDNcc_R	andncc 	%r0, %r2, %r24
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1524: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf08008a0  ! 1525: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x91d02033  ! 1526: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902a8f  ! 1528: WRPR_PSTATE_I	wrpr	%r0, 0x0a8f, %pstate
	.word 0xf05fe001  ! 1529: LDX_I	ldx	[%r31 + 0x0001], %r24
	.word 0x87902205  ! 1530: WRPR_TT_I	wrpr	%r0, 0x0205, %tt
	.word 0xa1902002  ! 1531: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x91d02034  ! 1532: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_tl1_179:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x3e800001  ! 1534: BVC	bvc,a	<label_0x1>
	.word 0x22800001  ! 1535: BE	be,a	<label_0x1>
	.word 0x9151c000  ! 1536: RDPR_TL	rdpr	%tl, %r8
	.word 0x8d902653  ! 1537: WRPR_PSTATE_I	wrpr	%r0, 0x0653, %pstate
	.word 0x8790212f  ! 1538: WRPR_TT_I	wrpr	%r0, 0x012f, %tt
	.word 0x8d802000  ! 1539: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879020c6  ! 1540: WRPR_TT_I	wrpr	%r0, 0x00c6, %tt
	.word 0x91d02033  ! 1541: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9a69e001  ! 1542: UDIVX_I	udivx 	%r7, 0x0001, %r13
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198284e  ! 1544: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084e, %hpstate
	.word 0xab504000  ! 1545: RDPR_TNPC	rdpr	%tnpc, %r21
DS_180:
	.word 0x32800001  ! 1547: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1546: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982486  ! 1547: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0486, %hpstate
	.word 0x91d02035  ! 1548: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982e1f  ! 1549: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1f, %hpstate
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1550: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_181:
	.word 0x22800001  ! 1552: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1552: BN	bn,a	<label_0x1>
	.word 0xb3a00550  ! 1552: FSQRTd	fsqrt	
	.word 0x95a4c834  ! 1551: FADDs	fadds	%f19, %f20, %f10
DS_182:
	.word 0x34800001  ! 1553: BG	bg,a	<label_0x1>
	.word 0xcb316001  ! 1553: STQF_I	-	%f5, [0x0001, %r5]
	normalw
	.word 0x85458000  ! 1552: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0xa480e001  ! 1553: ADDcc_I	addcc 	%r3, 0x0001, %r18
DS_183:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1554: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_184:
	.word 0x22800001  ! 1556: BE	be,a	<label_0x1>
	pdist %f2, %f2, %f8
	.word 0x8bb18303  ! 1555: ALLIGNADDRESS	alignaddr	%r6, %r3, %r5
	.word 0x91a00558  ! 1556: FSQRTd	fsqrt	
	.word 0xd047c000  ! 1557: LDSW_R	ldsw	[%r31 + %r0], %r8
	.word 0x93902004  ! 1558: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91a08d25  ! 1559: FsMULd	fsmuld	%f2, %f36, %f8
	.word 0x8d9020d6  ! 1560: WRPR_PSTATE_I	wrpr	%r0, 0x00d6, %pstate
DS_185:
	.word 0x22800001  ! 1562: BE	be,a	<label_0x1>
	pdist %f24, %f18, %f8
	.word 0xb5b1c30d  ! 1561: ALLIGNADDRESS	alignaddr	%r7, %r13, %r26
	.word 0x8d90280e  ! 1562: WRPR_PSTATE_I	wrpr	%r0, 0x080e, %pstate
	.word 0x8790227d  ! 1563: WRPR_TT_I	wrpr	%r0, 0x027d, %tt
	.word 0x8068e001  ! 1564: UDIVX_I	udivx 	%r3, 0x0001, %r0
	.word 0xb66a0001  ! 1565: UDIVX_R	udivx 	%r8, %r1, %r27
	.word 0x8af92001  ! 1566: SDIVcc_I	sdivcc 	%r4, 0x0001, %r5
splash_tba_186:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 1567: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_187:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1568: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902c96  ! 1570: WRPR_PSTATE_I	wrpr	%r0, 0x0c96, %pstate
	.word 0x91d02034  ! 1571: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81688001  ! 1572: SDIVX_R	sdivx	%r2, %r1, %r0
	.word 0xa1902005  ! 1573: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x93902007  ! 1574: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x83d02030  ! 1575: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x8790239b  ! 1576: WRPR_TT_I	wrpr	%r0, 0x039b, %tt
	.word 0xa190200c  ! 1577: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93d02032  ! 1578: Tcc_I	tne	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8aa8c01b  ! 1580: ANDNcc_R	andncc 	%r3, %r27, %r5
	.word 0x91a00568  ! 1581: FSQRTq	fsqrt	
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1582: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa56a4019  ! 1583: SDIVX_R	sdivx	%r9, %r25, %r18
	.word 0x9f802001  ! 1584: SIR	sir	0x0001
	.word 0x8198251c  ! 1585: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051c, %hpstate
	.word 0x81982504  ! 1586: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0504, %hpstate
	.word 0xa190200d  ! 1587: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x95a009e0  ! 1588: FDIVq	dis not found

	.word 0x93540000  ! 1589: RDPR_GL	rdpr	%-, %r9
	.word 0x9f802001  ! 1590: SIR	sir	0x0001
	.word 0x8790229e  ! 1591: WRPR_TT_I	wrpr	%r0, 0x029e, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902005  ! 1593: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x85a000d2  ! 1594: FNEGd	fnegd	%f18, %f2
	.word 0x87902169  ! 1595: WRPR_TT_I	wrpr	%r0, 0x0169, %tt
	.word 0x87902202  ! 1596: WRPR_TT_I	wrpr	%r0, 0x0202, %tt
	.word 0x8d9026da  ! 1597: WRPR_PSTATE_I	wrpr	%r0, 0x06da, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x83d02030  ! 1599: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x91d02034  ! 1600: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902cc9  ! 1601: WRPR_PSTATE_I	wrpr	%r0, 0x0cc9, %pstate
	.word 0x8d802000  ! 1602: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 1603: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_188:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 1604: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0x8d802000  ! 1605: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x89504000  ! 1606: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x99702001  ! 1607: POPC_I	popc	0x0001, %r12
splash_htba_189:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 1608: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902003  ! 1609: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902003  ! 1610: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
reduce_priv_level_190:
	.word 0x8f902000  ! 1612: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89848005  ! 1611: WRTICK_R	wr	%r18, %r5, %tick
	.word 0xd8ffc025  ! 1612: SWAPA_R	swapa	%r12, [%r31 + %r5] 0x01
	.word 0x95a01a60  ! 1613: FqTOi	fqtoi	
	.word 0xd537e001  ! 1614: STQF_I	-	%f10, [0x0001, %r31]
	.word 0xd4d7e000  ! 1615: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r10
	.word 0xa1902001  ! 1616: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa190200d  ! 1617: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x85a01a62  ! 1618: FqTOi	fqtoi	
	.word 0x97a549da  ! 1619: FDIVd	fdivd	%f52, %f26, %f42
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 1620: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1621: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb351c000  ! 1622: RDPR_TL	rdpr	%tl, %r25
	.word 0x8790215e  ! 1623: WRPR_TT_I	wrpr	%r0, 0x015e, %tt
	.word 0x87902202  ! 1624: WRPR_TT_I	wrpr	%r0, 0x0202, %tt
	.word 0x93902007  ! 1625: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x94806001  ! 1626: ADDcc_I	addcc 	%r1, 0x0001, %r10
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9024d0  ! 1628: WRPR_PSTATE_I	wrpr	%r0, 0x04d0, %pstate
	.word 0x81982d4c  ! 1629: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4c, %hpstate
	.word 0x91d02032  ! 1630: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802004  ! 1631: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902005  ! 1633: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902603  ! 1634: WRPR_PSTATE_I	wrpr	%r0, 0x0603, %pstate
	.word 0xa1902005  ! 1635: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x91d02031  ! 1636: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa1902009  ! 1637: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x879022f3  ! 1638: WRPR_TT_I	wrpr	%r0, 0x02f3, %tt
	.word 0x93902006  ! 1639: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x94494016  ! 1640: MULX_R	mulx 	%r5, %r22, %r10
	.word 0x24700001  ! 1641: BPLE	<illegal instruction>
	.word 0xd5e7c036  ! 1642: CASA_I	casa	[%r31] 0x 1, %r22, %r10
	.word 0xa190200d  ! 1643: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x83a01a66  ! 1644: FqTOi	fqtoi	
	.word 0x9751c000  ! 1645: RDPR_TL	rdpr	%tl, %r11
	.word 0x81982c17  ! 1646: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c17, %hpstate
	.word 0x8b500000  ! 1647: RDPR_TPC	rdpr	%tpc, %r5
	.word 0x8d902680  ! 1648: WRPR_PSTATE_I	wrpr	%r0, 0x0680, %pstate
	.word 0x819826c4  ! 1649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c4, %hpstate
DS_191:
	.word 0x34800001  ! 1651: BG	bg,a	<label_0x1>
	pdist %f2, %f28, %f20
	.word 0xb1b2c30a  ! 1650: ALLIGNADDRESS	alignaddr	%r11, %r10, %r24
	.word 0xf0d7e020  ! 1651: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r24
	.word 0x93902000  ! 1652: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1653: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x24700001  ! 1654: BPLE	<illegal instruction>
	.word 0xf137e001  ! 1655: STQF_I	-	%f24, [0x0001, %r31]
splash_tba_192:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 1656: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa9a60dd3  ! 1657: FdMULq	fdmulq	
	.word 0xb351c000  ! 1658: RDPR_TL	rdpr	%tl, %r25
	.word 0x98d1a001  ! 1659: UMULcc_I	umulcc 	%r6, 0x0001, %r12
	.word 0xb1a000c5  ! 1660: FNEGd	fnegd	%f36, %f24
splash_htba_193:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1661: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902640  ! 1662: WRPR_PSTATE_I	wrpr	%r0, 0x0640, %pstate
	.word 0x88d6a001  ! 1663: UMULcc_I	umulcc 	%r26, 0x0001, %r4
	.word 0x81504000  ! 1664: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0xb1a309aa  ! 1665: FDIVs	fdivs	%f12, %f10, %f24
	.word 0x8198285c  ! 1666: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085c, %hpstate
	.word 0x87902141  ! 1667: WRPR_TT_I	wrpr	%r0, 0x0141, %tt
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 1668: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982e46  ! 1669: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e46, %hpstate
	.word 0x9f802001  ! 1670: SIR	sir	0x0001
	.word 0x38700001  ! 1671: BPGU	<illegal instruction>
	.word 0x87902294  ! 1672: WRPR_TT_I	wrpr	%r0, 0x0294, %tt
	.word 0x8adb4007  ! 1673: SMULcc_R	smulcc 	%r13, %r7, %r5
	.word 0x879021a0  ! 1674: WRPR_TT_I	wrpr	%r0, 0x01a0, %tt
	.word 0xa1902002  ! 1675: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xac850009  ! 1676: ADDcc_R	addcc 	%r20, %r9, %r22
	.word 0x87902015  ! 1677: WRPR_TT_I	wrpr	%r0, 0x0015, %tt
	.word 0x93902005  ! 1678: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x88f92001  ! 1679: SDIVcc_I	sdivcc 	%r4, 0x0001, %r4
	.word 0xa190200e  ! 1680: WRPR_GL_I	wrpr	%r0, 0x000e, %-
change_to_randtl_194:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1681: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x879022af  ! 1682: WRPR_TT_I	wrpr	%r0, 0x02af, %tt
	.word 0xa1902000  ! 1683: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xc84fe001  ! 1684: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0x81982945  ! 1685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0945, %hpstate
	.word 0x8d902c44  ! 1686: WRPR_PSTATE_I	wrpr	%r0, 0x0c44, %pstate
	.word 0x8f50c000  ! 1687: RDPR_TT	rdpr	%tt, %r7
change_to_randtl_195:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1688: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x93902005  ! 1689: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d9020c5  ! 1690: WRPR_PSTATE_I	wrpr	%r0, 0x00c5, %pstate
	.word 0xa3500000  ! 1691: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x81982b0f  ! 1692: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0f, %hpstate
change_to_tl1_196:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902648  ! 1694: WRPR_PSTATE_I	wrpr	%r0, 0x0648, %pstate
	.word 0xe21fe001  ! 1695: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0x8d902086  ! 1696: WRPR_PSTATE_I	wrpr	%r0, 0x0086, %pstate
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1697: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902255  ! 1698: WRPR_TT_I	wrpr	%r0, 0x0255, %tt
	.word 0x9086000b  ! 1699: ADDcc_R	addcc 	%r24, %r11, %r8
	.word 0x8551c000  ! 1700: RDPR_TL	rdpr	%tl, %r2
	.word 0xc48008a0  ! 1701: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x99698018  ! 1702: SDIVX_R	sdivx	%r6, %r24, %r12
	.word 0x82836001  ! 1703: ADDcc_I	addcc 	%r13, 0x0001, %r1
	.word 0x91d02031  ! 1704: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa1902002  ! 1705: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d902a18  ! 1706: WRPR_PSTATE_I	wrpr	%r0, 0x0a18, %pstate
	.word 0x9f802001  ! 1707: SIR	sir	0x0001
	ta	T_CHANGE_PRIV	! macro
splash_cmpr_197:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1710: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186a001  ! 1709: WR_STICK_REG_I	wr	%r26, 0x0001, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1710: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb351c000  ! 1711: RDPR_TL	<illegal instruction>
DS_198:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1712: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xa6faa001  ! 1713: SDIVcc_I	sdivcc 	%r10, 0x0001, %r19
	.word 0xaefb0016  ! 1714: SDIVcc_R	sdivcc 	%r12, %r22, %r23
	.word 0xa1902000  ! 1715: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87902273  ! 1716: WRPR_TT_I	wrpr	%r0, 0x0273, %tt
	.word 0x97540000  ! 1717: RDPR_GL	rdpr	%-, %r11
	.word 0x81982284  ! 1718: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0284, %hpstate
	.word 0x87902195  ! 1719: WRPR_TT_I	wrpr	%r0, 0x0195, %tt
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1720: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd6d7e000  ! 1721: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
	.word 0x8790229e  ! 1722: WRPR_TT_I	wrpr	%r0, 0x029e, %tt
splash_tba_199:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1723: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9f802001  ! 1724: SIR	sir	0x0001
	.word 0x93902004  ! 1725: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8790216c  ! 1726: WRPR_TT_I	wrpr	%r0, 0x016c, %tt
	.word 0x8d90281e  ! 1727: WRPR_PSTATE_I	wrpr	%r0, 0x081e, %pstate
	.word 0x87902198  ! 1728: WRPR_TT_I	wrpr	%r0, 0x0198, %tt
	.word 0x8ba049c1  ! 1729: FDIVd	fdivd	%f32, %f32, %f36
	.word 0x91d02033  ! 1730: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9f802001  ! 1731: SIR	sir	0x0001
	.word 0x879021d8  ! 1732: WRPR_TT_I	wrpr	%r0, 0x01d8, %tt
splash_htba_200:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1733: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcb27e001  ! 1734: STF_I	st	%f5, [0x0001, %r31]
	.word 0x879020bb  ! 1735: WRPR_TT_I	wrpr	%r0, 0x00bb, %tt
	.word 0x8198230f  ! 1736: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030f, %hpstate
	.word 0x879021a9  ! 1737: WRPR_TT_I	wrpr	%r0, 0x01a9, %tt
	.word 0x91d02035  ! 1738: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xca8008a0  ! 1739: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xa9a209d5  ! 1740: FDIVd	fdivd	%f8, %f52, %f20
	.word 0x91d02031  ! 1741: Tcc_I	ta	icc_or_xcc, %r0 + 49
splash_tba_201:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 1742: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902006  ! 1743: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9469e001  ! 1744: UDIVX_I	udivx 	%r7, 0x0001, %r10
DS_202:
	.word 0x32800001  ! 1746: BNE	bne,a	<label_0x1>
	.word 0xf5324009  ! 1746: STQF_R	-	%f26, [%r9, %r9]
	normalw
	.word 0x81458000  ! 1745: RD_SOFTINT_REG	stbar
	.word 0x93902000  ! 1746: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902640  ! 1747: WRPR_PSTATE_I	wrpr	%r0, 0x0640, %pstate
	.word 0x9351c000  ! 1748: RDPR_TL	rdpr	%tl, %r9
	.word 0x91d02033  ! 1749: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd20fc000  ! 1750: LDUB_R	ldub	[%r31 + %r0], %r9
	.word 0x93902000  ! 1751: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93d02032  ! 1752: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_cmpr_203:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1754: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1832001  ! 1753: WR_STICK_REG_I	wr	%r12, 0x0001, %-
splash_cmpr_204:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 1754: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x91d02033  ! 1755: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902e9b  ! 1756: WRPR_PSTATE_I	wrpr	%r0, 0x0e9b, %pstate
	.word 0xa1504000  ! 1757: RDPR_TNPC	rdpr	%tnpc, %r16
	.word 0xa1902009  ! 1758: WRPR_GL_I	wrpr	%r0, 0x0009, %-
DS_205:
	.word 0x32800001  ! 1760: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1759: SAVE_R	save	%r31, %r0, %r31
DS_206:
	.word 0x34800001  ! 1761: BG	bg,a	<label_0x1>
	.word 0xed35e001  ! 1761: STQF_I	-	%f22, [0x0001, %r23]
	normalw
	.word 0x99458000  ! 1760: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x87902218  ! 1761: WRPR_TT_I	wrpr	%r0, 0x0218, %tt
	.word 0xd8dfe020  ! 1762: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	.word 0x85504000  ! 1763: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0xc4800be0  ! 1764: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r2
	.word 0x81514000  ! 1765: RDPR_TBA	rdpr	%tba, %r0
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1766: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 1767: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9ad8c00d  ! 1768: SMULcc_R	smulcc 	%r3, %r13, %r13
	.word 0x87902192  ! 1769: WRPR_TT_I	wrpr	%r0, 0x0192, %tt
	.word 0xda9004a0  ! 1770: LDUHA_R	lduha	[%r0, %r0] 0x25, %r13
	.word 0x8790209d  ! 1771: WRPR_TT_I	wrpr	%r0, 0x009d, %tt
	.word 0xa4fb4001  ! 1772: SDIVcc_R	sdivcc 	%r13, %r1, %r18
	.word 0xe49004a0  ! 1773: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0xb7a109c0  ! 1774: FDIVd	fdivd	%f4, %f0, %f58
	.word 0x8d802000  ! 1775: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02031  ! 1776: Tcc_I	ta	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_TO_TL0	! macro
change_to_tl1_207:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902011  ! 1779: WRPR_PSTATE_I	wrpr	%r0, 0x0011, %pstate
	.word 0xf68fe030  ! 1780: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r27
	.word 0xa190200c  ! 1781: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d902cd2  ! 1782: WRPR_PSTATE_I	wrpr	%r0, 0x0cd2, %pstate
	.word 0x87902298  ! 1783: WRPR_TT_I	wrpr	%r0, 0x0298, %tt
	.word 0x99902002  ! 1784: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x879020fd  ! 1785: WRPR_TT_I	wrpr	%r0, 0x00fd, %tt
	.word 0x93902000  ! 1786: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902006  ! 1787: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x85a049a8  ! 1788: FDIVs	fdivs	%f1, %f8, %f2
	.word 0x91d02030  ! 1789: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xb1b00fe3  ! 1790: FONES	fones	%f24
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1791: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8790230a  ! 1792: WRPR_TT_I	wrpr	%r0, 0x030a, %tt
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1793: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1514000  ! 1794: RDPR_TBA	rdpr	%tba, %r16
DS_208:
	.word 0x34800001  ! 1796: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1795: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93d02035  ! 1796: Tcc_I	tne	icc_or_xcc, %r0 + 53
DS_209:
	.word 0x34800001  ! 1798: BG	bg,a	<label_0x1>
	pdist %f20, %f26, %f4
	.word 0xa7b30312  ! 1797: ALLIGNADDRESS	alignaddr	%r12, %r18, %r19
	.word 0x81982797  ! 1798: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0797, %hpstate
	.word 0x87802004  ! 1799: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9f802001  ! 1800: SIR	sir	0x0001
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1801: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_210:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184e001  ! 1802: WR_STICK_REG_I	wr	%r19, 0x0001, %-
	.word 0x85b5cffa  ! 1803: FONES	fones	%f2
	.word 0x81982d44  ! 1804: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d44, %hpstate
	.word 0x87802004  ! 1805: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc5e7c03a  ! 1806: CASA_I	casa	[%r31] 0x 1, %r26, %r2
	.word 0x93902006  ! 1807: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x83d02033  ! 1808: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xc41fe001  ! 1809: LDD_I	ldd	[%r31 + 0x0001], %r2
	.word 0xa2812001  ! 1810: ADDcc_I	addcc 	%r4, 0x0001, %r17
	.word 0xe2c7e020  ! 1811: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r17
	.word 0xe397e001  ! 1812: LDQFA_I	-	[%r31, 0x0001], %f17
	.word 0xe27fe001  ! 1813: SWAP_I	swap	%r17, [%r31 + 0x0001]
	.word 0x8198244e  ! 1814: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044e, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982a95  ! 1816: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a95, %hpstate
DS_211:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1817: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_cmpr_212:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182e001  ! 1818: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0x8d90225f  ! 1819: WRPR_PSTATE_I	wrpr	%r0, 0x025f, %pstate
	.word 0x38700001  ! 1820: BPGU	<illegal instruction>
	.word 0x99902001  ! 1821: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x93902006  ! 1822: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_213:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1823: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xe28008a0  ! 1824: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe2ffc03a  ! 1825: SWAPA_R	swapa	%r17, [%r31 + %r26] 0x01
	.word 0x83540000  ! 1826: RDPR_GL	rdpr	%-, %r1
	.word 0x9f802001  ! 1827: SIR	sir	0x0001
	.word 0xa1902000  ! 1828: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8198228c  ! 1829: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028c, %hpstate
	.word 0x81504000  ! 1830: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0xc0cfe000  ! 1831: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r0
	.word 0x87902377  ! 1832: WRPR_TT_I	wrpr	%r0, 0x0377, %tt
	.word 0x819822d6  ! 1833: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d6, %hpstate
DS_214:
	.word 0x22800001  ! 1835: BE	be,a	<label_0x1>
	pdist %f12, %f6, %f14
	.word 0x95b34309  ! 1834: ALLIGNADDRESS	alignaddr	%r13, %r9, %r10
	.word 0x87902240  ! 1835: WRPR_TT_I	wrpr	%r0, 0x0240, %tt
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1836: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 1837: WRASI_I	wr	%r0, 0x0014, %asi
splash_tba_215:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1838: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa0d1400d  ! 1840: UMULcc_R	umulcc 	%r5, %r13, %r16
	ta	T_CHANGE_PRIV	! macro
change_to_tl1_216:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9951c000  ! 1843: RDPR_TL	rdpr	%tl, %r12
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1844: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902323  ! 1845: WRPR_TT_I	wrpr	%r0, 0x0323, %tt
splash_cmpr_217:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1847: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186e001  ! 1846: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0xab540000  ! 1847: RDPR_GL	<illegal instruction>
	.word 0x91d02031  ! 1848: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87902295  ! 1849: WRPR_TT_I	wrpr	%r0, 0x0295, %tt
	.word 0x2e700001  ! 1850: BPVS	<illegal instruction>
	.word 0x8fa01a63  ! 1851: FqTOi	fqtoi	
	.word 0x9f802001  ! 1852: SIR	sir	0x0001
	.word 0x87902122  ! 1853: WRPR_TT_I	wrpr	%r0, 0x0122, %tt
	.word 0x93902006  ! 1854: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f802001  ! 1855: SIR	sir	0x0001
	.word 0x93d02030  ! 1856: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x86adc004  ! 1857: ANDNcc_R	andncc 	%r23, %r4, %r3
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1858: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1859: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc67fe001  ! 1860: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x81982d1d  ! 1861: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1d, %hpstate
	.word 0xa190200e  ! 1862: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa1902006  ! 1863: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87902123  ! 1864: WRPR_TT_I	wrpr	%r0, 0x0123, %tt
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 1865: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc60fc000  ! 1866: LDUB_R	ldub	[%r31 + %r0], %r3
	.word 0xc67fe001  ! 1867: SWAP_I	swap	%r3, [%r31 + 0x0001]
splash_cmpr_218:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182a001  ! 1868: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1869: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_219:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 1870: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xab50c000  ! 1871: RDPR_TT	rdpr	%tt, %r21
	.word 0xea8008a0  ! 1872: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0x20700001  ! 1873: BPN	<illegal instruction>
	.word 0x87802010  ! 1874: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x83d02030  ! 1875: Tcc_I	te	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902007  ! 1878: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xac4e8004  ! 1879: MULX_R	mulx 	%r26, %r4, %r22
DS_220:
	.word 0x22800001  ! 1881: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1880: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902005  ! 1881: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x93902001  ! 1882: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982696  ! 1883: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0696, %hpstate
	.word 0x87902309  ! 1884: WRPR_TT_I	wrpr	%r0, 0x0309, %tt
change_to_tl1_221:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02033  ! 1886: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902c4f  ! 1887: WRPR_PSTATE_I	wrpr	%r0, 0x0c4f, %pstate
	.word 0x20700001  ! 1888: BPN	<illegal instruction>
	.word 0x91d02031  ! 1889: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_222:
	.word 0x22800001  ! 1891: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1890: RESTORE_R	restore	%r31, %r0, %r31
reduce_priv_level_223:
	.word 0x8f902000  ! 1892: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb7a01976  ! 1891: FqTOd	dis not found

	.word 0xb1a2c9ed  ! 1892: FDIVq	dis not found

	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1893: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf09fc020  ! 1894: LDDA_R	ldda	[%r31, %r0] 0x01, %r24
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99902003  ! 1896: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x91d02030  ! 1897: Tcc_I	ta	icc_or_xcc, %r0 + 48
DS_224:
	.word 0x34800001  ! 1899: BG	bg,a	<label_0x1>
	pdist %f28, %f30, %f26
	.word 0x9bb54310  ! 1898: ALLIGNADDRESS	alignaddr	%r21, %r16, %r13
	.word 0x93902007  ! 1899: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99514000  ! 1900: RDPR_TBA	rdpr	%tba, %r12
	.word 0xa1902006  ! 1901: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902006  ! 1902: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x83d02030  ! 1903: Tcc_I	te	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8790225c  ! 1905: WRPR_TT_I	wrpr	%r0, 0x025c, %tt
	.word 0x8b508000  ! 1906: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0x83a509c0  ! 1907: FDIVd	fdivd	%f20, %f0, %f32
	.word 0x9a866001  ! 1908: ADDcc_I	addcc 	%r25, 0x0001, %r13
	.word 0x36700001  ! 1909: BPGE	<illegal instruction>
	.word 0xa1902007  ! 1910: WRPR_GL_I	wrpr	%r0, 0x0007, %-
DS_225:
	.word 0x22800001  ! 1912: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1911: SAVE_R	save	%r31, %r0, %r31
	.word 0x93902007  ! 1912: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902004  ! 1913: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x91d02031  ! 1914: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902004  ! 1915: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xdac804a0  ! 1916: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0x8d902892  ! 1917: WRPR_PSTATE_I	wrpr	%r0, 0x0892, %pstate
	.word 0xa1902006  ! 1918: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xaf51c000  ! 1919: RDPR_TL	rdpr	%tl, %r23
	.word 0xeecfe030  ! 1920: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r23
	.word 0x93902004  ! 1921: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902c9d  ! 1922: WRPR_PSTATE_I	wrpr	%r0, 0x0c9d, %pstate
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 1923: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198285e  ! 1924: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085e, %hpstate
splash_cmpr_226:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182e001  ! 1925: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 1926: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879021f7  ! 1927: WRPR_TT_I	wrpr	%r0, 0x01f7, %tt
	.word 0x8d9026d0  ! 1928: WRPR_PSTATE_I	wrpr	%r0, 0x06d0, %pstate
	.word 0x81982dc7  ! 1929: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc7, %hpstate
	.word 0xee800c60  ! 1930: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r23
	.word 0x81982c1f  ! 1931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1f, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1932: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879023e1  ! 1933: WRPR_TT_I	wrpr	%r0, 0x03e1, %tt
	.word 0x81982d9c  ! 1934: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9c, %hpstate
	.word 0xa1902004  ! 1935: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87902316  ! 1936: WRPR_TT_I	wrpr	%r0, 0x0316, %tt
	.word 0x81982594  ! 1937: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0594, %hpstate
	.word 0xa190200f  ! 1938: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d802004  ! 1939: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d540000  ! 1940: RDPR_GL	rdpr	%-, %r6
reduce_priv_level_227:
	.word 0x8f902000  ! 1942: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91696001  ! 1941: SDIVX_I	sdivx	%r5, 0x0001, %r8
	.word 0x8790228b  ! 1942: WRPR_TT_I	wrpr	%r0, 0x028b, %tt
	.word 0xd0c00e60  ! 1943: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r8
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1944: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_228:
	.word 0x32800001  ! 1946: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1945: SAVE_R	save	%r31, %r0, %r31
	.word 0x964b000d  ! 1946: MULX_R	mulx 	%r12, %r13, %r11
	.word 0xd68008a0  ! 1947: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1948: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 1949: BNE	bne,a	<label_0x1>
	.word 0xa190200b  ! 1950: WRPR_GL_I	wrpr	%r0, 0x000b, %-
splash_cmpr_229:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1952: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 1951: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 1952: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb0824003  ! 1953: ADDcc_R	addcc 	%r9, %r3, %r24
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200a  ! 1955: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d90220c  ! 1956: WRPR_PSTATE_I	wrpr	%r0, 0x020c, %pstate
	.word 0xb5a34d2b  ! 1957: FsMULd	fsmuld	%f13, %f42, %f26
	.word 0x91d02035  ! 1958: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02030  ! 1959: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x81982ade  ! 1960: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ade, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1961: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9a000c7  ! 1962: FNEGd	fnegd	%f38, %f20
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xe857c000  ! 1964: LDSH_R	ldsh	[%r31 + %r0], %r20
	.word 0xa1902000  ! 1965: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d514000  ! 1966: RDPR_TBA	rdpr	%tba, %r6
	.word 0x8fa0c9ca  ! 1967: FDIVd	fdivd	%f34, %f10, %f38
	.word 0x8d902083  ! 1968: WRPR_PSTATE_I	wrpr	%r0, 0x0083, %pstate
splash_htba_230:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1969: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x91d02034  ! 1970: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa8ad001a  ! 1971: ANDNcc_R	andncc 	%r20, %r26, %r20
	.word 0xe8ffc03a  ! 1972: SWAPA_R	swapa	%r20, [%r31 + %r26] 0x01
	.word 0xa1902001  ! 1973: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xe89004a0  ! 1974: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0x9f802001  ! 1975: SIR	sir	0x0001
	.word 0xe80fc000  ! 1976: LDUB_R	ldub	[%r31 + %r0], %r20
splash_cmpr_231:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1978: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1842001  ! 1977: WR_STICK_REG_I	wr	%r16, 0x0001, %-
splash_tba_232:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1978: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_tba_233:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 1979: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8b514000  ! 1980: RDPR_TBA	rdpr	%tba, %r5
	.word 0x91d02030  ! 1981: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902001  ! 1982: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902001  ! 1983: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982a44  ! 1985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a44, %hpstate
	.word 0xa550c000  ! 1986: RDPR_TT	rdpr	%tt, %r18
	.word 0x83d02031  ! 1987: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x91d02034  ! 1988: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe48fe030  ! 1989: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r18
	.word 0x22700001  ! 1990: BPE	<illegal instruction>
change_to_tl1_234:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
splash_htba_235:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 1992: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1993: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819825dc  ! 1994: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05dc, %hpstate
	.word 0xa190200a  ! 1995: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93902005  ! 1996: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x836e000d  ! 1997: SDIVX_R	sdivx	%r24, %r13, %r1
	.word 0x8550c000  ! 1998: RDPR_TT	rdpr	%tt, %r2
	.word 0xa190200d  ! 1999: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8790237d  ! 2000: WRPR_TT_I	wrpr	%r0, 0x037d, %tt
	.word 0x81982dde  ! 2001: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dde, %hpstate
	.word 0x81982e1c  ! 2002: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1c, %hpstate
	.word 0x8b702001  ! 2003: POPC_I	popc	0x0001, %r5
	.word 0x87902106  ! 2004: WRPR_TT_I	wrpr	%r0, 0x0106, %tt
splash_tba_236:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2005: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcac00e80  ! 2006: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r5
	.word 0x8198219e  ! 2007: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019e, %hpstate
	.word 0x97540000  ! 2008: RDPR_GL	rdpr	%-, %r11
	.word 0xd68804a0  ! 2009: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0xd697e010  ! 2010: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r11
DS_237:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 2011: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xa1902006  ! 2012: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xb0d02001  ! 2013: UMULcc_I	umulcc 	%r0, 0x0001, %r24
	.word 0xa7a30d29  ! 2014: FsMULd	fsmuld	%f12, %f40, %f50
	.word 0xe797e001  ! 2015: LDQFA_I	-	[%r31, 0x0001], %f19
DS_238:
	.word 0x22800001  ! 2017: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 2016: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x879023ed  ! 2017: WRPR_TT_I	wrpr	%r0, 0x03ed, %tt
	.word 0x83a01a6d  ! 2018: FqTOi	fqtoi	
	.word 0x93902002  ! 2019: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93d02030  ! 2020: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xa1902005  ! 2021: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81982d86  ! 2022: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d86, %hpstate
	.word 0x8790236e  ! 2023: WRPR_TT_I	wrpr	%r0, 0x036e, %tt
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 2024: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790210b  ! 2025: WRPR_TT_I	wrpr	%r0, 0x010b, %tt
splash_cmpr_239:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2027: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182a001  ! 2026: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 2027: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_htba_240:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 2028: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x86fb6001  ! 2029: SDIVcc_I	sdivcc 	%r13, 0x0001, %r3
	.word 0x8e6aa001  ! 2030: UDIVX_I	udivx 	%r10, 0x0001, %r7
	.word 0xceffc02d  ! 2031: SWAPA_R	swapa	%r7, [%r31 + %r13] 0x01
	.word 0x91a01a77  ! 2032: FqTOi	fqtoi	
	ta	T_CHANGE_HPRIV	! macro
DS_241:
	.word 0x22800001  ! 2035: BE	be,a	<label_0x1>
	.word 0x32800001  ! 2035: BNE	bne,a	<label_0x1>
	.word 0xd3144004  ! 2035: LDQF_R	-	[%r17, %r4], %f9
	.word 0xada40823  ! 2034: FADDs	fadds	%f16, %f3, %f22
splash_htba_242:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2035: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802000  ! 2036: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xec8008a0  ! 2037: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0xecffc023  ! 2038: SWAPA_R	swapa	%r22, [%r31 + %r3] 0x01
	.word 0x8790209e  ! 2039: WRPR_TT_I	wrpr	%r0, 0x009e, %tt
	.word 0x95514000  ! 2040: RDPR_TBA	rdpr	%tba, %r10
	.word 0xa1902006  ! 2041: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x879020c7  ! 2042: WRPR_TT_I	wrpr	%r0, 0x00c7, %tt
	.word 0x81982e0c  ! 2043: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0c, %hpstate
	.word 0x87802004  ! 2044: WRASI_I	wr	%r0, 0x0004, %asi
DS_243:
	.word 0x34800001  ! 2046: BG	bg,a	<label_0x1>
	.word 0x34800001  ! 2046: BG	bg,a	<label_0x1>
	.word 0xe912400a  ! 2046: LDQF_R	-	[%r9, %r10], %f20
	.word 0x89a24821  ! 2045: FADDs	fadds	%f9, %f1, %f4
	.word 0x2a800001  ! 2046: BCS	bcs,a	<label_0x1>
	.word 0x8d802000  ! 2047: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_244:
	.word 0x22800001  ! 2049: BE	be,a	<label_0x1>
	pdist %f18, %f4, %f22
	.word 0xb3b30303  ! 2048: ALLIGNADDRESS	alignaddr	%r12, %r3, %r25
	.word 0x87a189ba  ! 2049: FDIVs	fdivs	%f6, %f26, %f3
	.word 0x93902005  ! 2050: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc697e000  ! 2051: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r3
	.word 0x91d02030  ! 2052: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8790201a  ! 2053: WRPR_TT_I	wrpr	%r0, 0x001a, %tt
	.word 0xa1902008  ! 2054: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xc617c000  ! 2055: LDUH_R	lduh	[%r31 + %r0], %r3
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 2056: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x38800001  ! 2057: BGU	bgu,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902e9b  ! 2059: WRPR_PSTATE_I	wrpr	%r0, 0x0e9b, %pstate
	.word 0x91d02034  ! 2060: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902009  ! 2061: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x94fb400b  ! 2062: SDIVcc_R	sdivcc 	%r13, %r11, %r10
	.word 0xa1902002  ! 2063: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x81504000  ! 2064: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0x83d02033  ! 2065: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xa9684012  ! 2066: SDIVX_R	sdivx	%r1, %r18, %r20
	.word 0x91d02031  ! 2067: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x879021e2  ! 2068: WRPR_TT_I	wrpr	%r0, 0x01e2, %tt
	.word 0x8d9024db  ! 2069: WRPR_PSTATE_I	wrpr	%r0, 0x04db, %pstate
	.word 0x93902006  ! 2070: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x96696001  ! 2071: UDIVX_I	udivx 	%r5, 0x0001, %r11
	.word 0x8198251e  ! 2072: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051e, %hpstate
	.word 0x91d02030  ! 2073: Tcc_I	ta	icc_or_xcc, %r0 + 48
splash_cmpr_245:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2075: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181a001  ! 2074: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x93902002  ! 2075: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd61fc000  ! 2076: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x8790221e  ! 2077: WRPR_TT_I	wrpr	%r0, 0x021e, %tt
	.word 0x9f802001  ! 2078: SIR	sir	0x0001
	.word 0x87802016  ! 2079: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93d02033  ! 2080: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d90241b  ! 2081: WRPR_PSTATE_I	wrpr	%r0, 0x041b, %pstate
	.word 0xa190200b  ! 2082: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd69fc020  ! 2083: LDDA_R	ldda	[%r31, %r0] 0x01, %r11
	.word 0x87902376  ! 2084: WRPR_TT_I	wrpr	%r0, 0x0376, %tt
	.word 0xd6900e60  ! 2085: LDUHA_R	lduha	[%r0, %r0] 0x73, %r11
	.word 0x97a589b4  ! 2086: FDIVs	fdivs	%f22, %f20, %f11
splash_htba_246:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 2087: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8198248c  ! 2088: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048c, %hpstate
	.word 0xa1902002  ! 2089: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x83a209a7  ! 2090: FDIVs	fdivs	%f8, %f7, %f1
	.word 0x9b500000  ! 2091: RDPR_TPC	rdpr	%tpc, %r13
splash_htba_247:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2092: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_248:
	.word 0x22800001  ! 2094: BE	be,a	<label_0x1>
	.word 0xdb310008  ! 2094: STQF_R	-	%f13, [%r8, %r4]
	normalw
	.word 0x8f458000  ! 2093: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xa5504000  ! 2094: RDPR_TNPC	rdpr	%tnpc, %r18
	ta	T_CHANGE_TO_TL0	! macro
reduce_priv_level_249:
	.word 0x8f902002  ! 2097: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89800002  ! 2096: WRTICK_R	wr	%r0, %r2, %tick
change_to_randtl_250:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 2097: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa190200a  ! 2098: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xe517c000  ! 2099: LDQF_R	-	[%r31, %r0], %f18
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81a00549  ! 2101: FSQRTd	fsqrt	
	.word 0x87902002  ! 2102: WRPR_TT_I	wrpr	%r0, 0x0002, %tt
	.word 0xc07fe001  ! 2103: SWAP_I	swap	%r0, [%r31 + 0x0001]
splash_cmpr_251:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 2105: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186e001  ! 2104: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0x8d684003  ! 2105: SDIVX_R	sdivx	%r1, %r3, %r6
	.word 0xa190200b  ! 2106: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x879020a3  ! 2107: WRPR_TT_I	wrpr	%r0, 0x00a3, %tt
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2108: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982b5c  ! 2109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5c, %hpstate
	.word 0x879021e8  ! 2110: WRPR_TT_I	wrpr	%r0, 0x01e8, %tt
	.word 0x28700001  ! 2111: BPLEU	<illegal instruction>
	.word 0xcc77c003  ! 2112: STX_R	stx	%r6, [%r31 + %r3]
splash_tba_252:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 2113: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2114: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2115: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2116: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a0a  ! 2117: WRPR_PSTATE_I	wrpr	%r0, 0x0a0a, %pstate
	.word 0x92aac000  ! 2118: ANDNcc_R	andncc 	%r11, %r0, %r9
splash_tba_253:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2119: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 2120: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 2121: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 2122: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x879020c2  ! 2123: WRPR_TT_I	wrpr	%r0, 0x00c2, %tt
	.word 0x8790216a  ! 2124: WRPR_TT_I	wrpr	%r0, 0x016a, %tt
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2125: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9b508000  ! 2126: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0x804ac01b  ! 2127: MULX_R	mulx 	%r11, %r27, %r0
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 2128: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc057e001  ! 2129: LDSH_I	ldsh	[%r31 + 0x0001], %r0
	.word 0x8d9022db  ! 2130: WRPR_PSTATE_I	wrpr	%r0, 0x02db, %pstate
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 2131: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_254:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1822001  ! 2132: WR_STICK_REG_I	wr	%r8, 0x0001, %-
splash_htba_255:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 2133: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc09004a0  ! 2134: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
	.word 0x93902007  ! 2135: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99902001  ! 2136: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x93902003  ! 2137: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02031  ! 2138: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87902052  ! 2139: WRPR_TT_I	wrpr	%r0, 0x0052, %tt
	.word 0x93902007  ! 2140: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x819828d5  ! 2141: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d5, %hpstate
	.word 0x91d02033  ! 2142: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x94dd0011  ! 2143: SMULcc_R	smulcc 	%r20, %r17, %r10
	.word 0x9f802001  ! 2144: SIR	sir	0x0001
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2145: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902005  ! 2146: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x91d02031  ! 2147: Tcc_I	ta	icc_or_xcc, %r0 + 49
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 2148: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879020b7  ! 2149: WRPR_TT_I	wrpr	%r0, 0x00b7, %tt
	ta	T_CHANGE_TO_TL0	! macro
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 2151: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 2152: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2153: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_cmpr_256:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180e001  ! 2154: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0xd47fe001  ! 2155: SWAP_I	swap	%r10, [%r31 + 0x0001]
	.word 0xa1902003  ! 2156: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa150c000  ! 2157: RDPR_TT	rdpr	%tt, %r16
	.word 0x9ad04007  ! 2158: UMULcc_R	umulcc 	%r1, %r7, %r13
	.word 0x81982b06  ! 2159: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b06, %hpstate
	.word 0x9b508000  ! 2160: RDPR_TSTATE	rdpr	%tstate, %r13
	.word 0xdb37c007  ! 2161: STQF_R	-	%f13, [%r7, %r31]
	.word 0xa190200b  ! 2162: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1902008  ! 2164: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xda97e000  ! 2165: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
splash_htba_257:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2166: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xb7540000  ! 2167: RDPR_GL	rdpr	%-, %r27
	.word 0x9f802001  ! 2168: SIR	sir	0x0001
	.word 0x9f802001  ! 2169: SIR	sir	0x0001
DS_258:
	.word 0x34800001  ! 2171: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 2170: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02035  ! 2171: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_259:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2172: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982cd6  ! 2173: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd6, %hpstate
	.word 0xf737c007  ! 2174: STQF_R	-	%f27, [%r7, %r31]
	.word 0x22700001  ! 2175: BPE	<illegal instruction>
	.word 0x87802080  ! 2176: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xf727c007  ! 2177: STF_R	st	%f27, [%r7, %r31]
	.word 0xf61fc000  ! 2178: LDD_R	ldd	[%r31 + %r0], %r27
	.word 0x22700001  ! 2179: BPE	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0x90f94009  ! 2181: SDIVcc_R	sdivcc 	%r5, %r9, %r8
DS_260:
	.word 0x32800001  ! 2183: BNE	bne,a	<label_0x1>
	.xword 0xa7487ef0	! Random illegal ?
	.word 0xa9a0054a  ! 2183: FSQRTd	fsqrt	
	.word 0x83a04839  ! 2182: FADDs	fadds	%f1, %f25, %f1
	.word 0x8d902a96  ! 2183: WRPR_PSTATE_I	wrpr	%r0, 0x0a96, %pstate
splash_htba_261:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 2184: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x81982696  ! 2185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0696, %hpstate
	.word 0x93902002  ! 2186: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902002  ! 2187: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_cmpr_262:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1832001  ! 2188: WR_STICK_REG_I	wr	%r12, 0x0001, %-
	.word 0x91d02030  ! 2189: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xaca8c00d  ! 2190: ANDNcc_R	andncc 	%r3, %r13, %r22
	.word 0x93902002  ! 2191: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xb1500000  ! 2192: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8d902a93  ! 2193: WRPR_PSTATE_I	wrpr	%r0, 0x0a93, %pstate
	.word 0xa084400b  ! 2194: ADDcc_R	addcc 	%r17, %r11, %r16
	.word 0xe0d7e030  ! 2195: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
	.word 0x91d02032  ! 2196: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91a449e8  ! 2197: FDIVq	dis not found

	.word 0x8d902493  ! 2198: WRPR_PSTATE_I	wrpr	%r0, 0x0493, %pstate
	.word 0x8350c000  ! 2199: RDPR_TT	rdpr	%tt, %r1
	.word 0x93902000  ! 2200: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc28fe010  ! 2202: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r1
	.word 0x87a34dc7  ! 2203: FdMULq	fdmulq	
	.word 0xc697e000  ! 2204: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r3
	.word 0xc67fe001  ! 2205: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x8ba249a6  ! 2206: FDIVs	fdivs	%f9, %f6, %f5
	.word 0x81982e8c  ! 2207: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8c, %hpstate
	.word 0xca9fc020  ! 2208: LDDA_R	ldda	[%r31, %r0] 0x01, %r5
	.word 0x8790220d  ! 2209: WRPR_TT_I	wrpr	%r0, 0x020d, %tt
	.word 0xad540000  ! 2210: RDPR_GL	rdpr	%-, %r22
	.word 0x879020da  ! 2211: WRPR_TT_I	wrpr	%r0, 0x00da, %tt
	.word 0xa1902008  ! 2212: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x81508000  ! 2213: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x93902000  ! 2214: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_263:
	.word 0x22800001  ! 2216: BE	be,a	<label_0x1>
	.word 0xc9318004  ! 2216: STQF_R	-	%f4, [%r4, %r6]
	normalw
	.word 0x95458000  ! 2215: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x8d902a56  ! 2216: WRPR_PSTATE_I	wrpr	%r0, 0x0a56, %pstate
reduce_priv_level_264:
	.word 0x8f902000  ! 2218: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 2217: SIAM	siam	1
	.word 0xd497e000  ! 2218: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0x83b58feb  ! 2219: FONES	fones	%f1
	.word 0x8d902c9f  ! 2220: WRPR_PSTATE_I	wrpr	%r0, 0x0c9f, %pstate
	.word 0x9080e001  ! 2221: ADDcc_I	addcc 	%r3, 0x0001, %r8
	.word 0x8d902648  ! 2222: WRPR_PSTATE_I	wrpr	%r0, 0x0648, %pstate
	.word 0x81702001  ! 2223: POPC_I	popc	0x0001, %r0
change_to_tl1_265:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x81982984  ! 2225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0984, %hpstate
	.word 0x91d02031  ! 2226: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81982084  ! 2227: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0084, %hpstate
	.word 0xc09fc020  ! 2228: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	.word 0x97540000  ! 2229: RDPR_GL	rdpr	%-, %r11
	.word 0x8d9022cc  ! 2230: WRPR_PSTATE_I	wrpr	%r0, 0x02cc, %pstate
change_to_randtl_266:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 2231: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902006  ! 2232: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8790201d  ! 2233: WRPR_TT_I	wrpr	%r0, 0x001d, %tt
	.word 0x8198239f  ! 2234: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039f, %hpstate
	.word 0x84848002  ! 2235: ADDcc_R	addcc 	%r18, %r2, %r2
	.word 0x93902005  ! 2236: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902001  ! 2237: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xb4f80009  ! 2238: SDIVcc_R	sdivcc 	%r0, %r9, %r26
splash_htba_267:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 2239: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d802004  ! 2240: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9f802001  ! 2242: SIR	sir	0x0001
	.word 0x91d02032  ! 2243: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x879023cd  ! 2244: WRPR_TT_I	wrpr	%r0, 0x03cd, %tt
	.word 0x879021c0  ! 2245: WRPR_TT_I	wrpr	%r0, 0x01c0, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2246: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902edb  ! 2247: WRPR_PSTATE_I	wrpr	%r0, 0x0edb, %pstate
	.word 0x99902001  ! 2248: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8e6aa001  ! 2250: UDIVX_I	udivx 	%r10, 0x0001, %r7
	.word 0x90822001  ! 2251: ADDcc_I	addcc 	%r8, 0x0001, %r8
	.word 0x8d902a92  ! 2252: WRPR_PSTATE_I	wrpr	%r0, 0x0a92, %pstate
	.word 0xb0834010  ! 2253: ADDcc_R	addcc 	%r13, %r16, %r24
	.word 0x81982f9e  ! 2254: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9e, %hpstate
	.word 0x879020a7  ! 2255: WRPR_TT_I	wrpr	%r0, 0x00a7, %tt
	.word 0x2e700001  ! 2256: BPVS	<illegal instruction>
	.word 0x81982217  ! 2257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0217, %hpstate
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 2258: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c5f  ! 2259: WRPR_PSTATE_I	wrpr	%r0, 0x0c5f, %pstate
	.word 0x8198234d  ! 2260: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034d, %hpstate
	.word 0x93d02031  ! 2261: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xf0dfe030  ! 2262: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r24
	.word 0x9f802001  ! 2263: SIR	sir	0x0001
	.word 0x93902005  ! 2264: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902004  ! 2265: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93d02034  ! 2266: Tcc_I	tne	icc_or_xcc, %r0 + 52
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 2267: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902101  ! 2268: WRPR_TT_I	wrpr	%r0, 0x0101, %tt
	.word 0x8069a001  ! 2269: UDIVX_I	udivx 	%r6, 0x0001, %r0
	.word 0x93902004  ! 2270: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_htba_268:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2271: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200e  ! 2272: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x81982a4e  ! 2273: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4e, %hpstate
	.word 0x8790221e  ! 2274: WRPR_TT_I	wrpr	%r0, 0x021e, %tt
splash_tba_269:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2275: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81a2c9e4  ! 2276: FDIVq	dis not found

	.word 0xafa0057b  ! 2277: FSQRTq	fsqrt	
	.word 0x93902001  ! 2278: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_270:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 2279: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	ta	T_CHANGE_PRIV	! macro
splash_cmpr_271:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 2282: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180a001  ! 2281: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0x9951c000  ! 2282: RDPR_TL	<illegal instruction>
	.word 0x93902003  ! 2283: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802088  ! 2284: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8848c009  ! 2285: MULX_R	mulx 	%r3, %r9, %r4
	.word 0x83d02033  ! 2286: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x879020a1  ! 2287: WRPR_TT_I	wrpr	%r0, 0x00a1, %tt
	.word 0xc88008a0  ! 2288: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 2289: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 2290: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 2291: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02031  ! 2293: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x819820c5  ! 2294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c5, %hpstate
	.word 0x91504000  ! 2295: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0xa5540000  ! 2296: RDPR_GL	rdpr	%-, %r18
	.word 0x8d9022ce  ! 2297: WRPR_PSTATE_I	wrpr	%r0, 0x02ce, %pstate
	.word 0x8d90289e  ! 2298: WRPR_PSTATE_I	wrpr	%r0, 0x089e, %pstate
	.word 0x93902005  ! 2299: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_cmpr_272:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 2300: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0xe4c004a0  ! 2301: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	.word 0x8c81e001  ! 2302: ADDcc_I	addcc 	%r7, 0x0001, %r6
	.word 0xa1902007  ! 2303: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x91a01a75  ! 2304: FqTOi	fqtoi	
	.word 0xa3a00540  ! 2305: FSQRTd	fsqrt	
	.word 0x91d02034  ! 2306: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_273:
	.word 0x32800001  ! 2308: BNE	bne,a	<label_0x1>
	.word 0xdb32e001  ! 2308: STQF_I	-	%f13, [0x0001, %r11]
	normalw
	.word 0xad458000  ! 2307: RD_SOFTINT_REG	rd	%softint, %r22
DS_274:
	.word 0x22800001  ! 2309: BE	be,a	<label_0x1>
	.word 0xcd32c005  ! 2309: STQF_R	-	%f6, [%r5, %r11]
	normalw
	.word 0x81458000  ! 2308: RD_SOFTINT_REG	stbar
DS_275:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 2309: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x83508000  ! 2310: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0xa550c000  ! 2311: RDPR_TT	rdpr	%tt, %r18
	.word 0x87802088  ! 2312: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87902335  ! 2313: WRPR_TT_I	wrpr	%r0, 0x0335, %tt
	.word 0x87802088  ! 2314: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x81982c8d  ! 2315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8d, %hpstate
	.word 0x84fd2001  ! 2316: SDIVcc_I	sdivcc 	%r20, 0x0001, %r2
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 2317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 2318: Tcc_I	ta	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	.word 0xad51c000  ! 2320: RDPR_TL	rdpr	%tl, %r22
	.word 0xa190200c  ! 2321: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d902ad8  ! 2322: WRPR_PSTATE_I	wrpr	%r0, 0x0ad8, %pstate
	.word 0x81982515  ! 2323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0515, %hpstate
	.word 0x85a249ad  ! 2324: FDIVs	fdivs	%f9, %f13, %f2
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2325: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 2326: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc45fc000  ! 2327: LDX_R	ldx	[%r31 + %r0], %r2
	.word 0xc4800a60  ! 2328: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r2
	.word 0x819823d7  ! 2329: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d7, %hpstate
	.word 0xa9a289c4  ! 2330: FDIVd	fdivd	%f10, %f4, %f20
	.word 0xa190200a  ! 2331: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x9f802001  ! 2332: SIR	sir	0x0001
	.word 0x8d902648  ! 2333: WRPR_PSTATE_I	wrpr	%r0, 0x0648, %pstate
	.word 0xa1902007  ! 2334: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d902050  ! 2335: WRPR_PSTATE_I	wrpr	%r0, 0x0050, %pstate
	.word 0xaf540000  ! 2336: RDPR_GL	rdpr	%-, %r23
	.word 0x8682e001  ! 2337: ADDcc_I	addcc 	%r11, 0x0001, %r3
	.word 0xae80401a  ! 2338: ADDcc_R	addcc 	%r1, %r26, %r23
	.word 0x91d02032  ! 2339: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81982e9c  ! 2340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9c, %hpstate
	.word 0xa1902002  ! 2341: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xacfb0000  ! 2342: SDIVcc_R	sdivcc 	%r12, %r0, %r22
DS_276:
	.word 0x22800001  ! 2344: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 2343: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x83d02035  ! 2344: Tcc_I	te	icc_or_xcc, %r0 + 53
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2345: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790221b  ! 2346: WRPR_TT_I	wrpr	%r0, 0x021b, %tt
	.word 0x87902317  ! 2347: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
splash_htba_277:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2348: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x9ac2a001  ! 2349: ADDCcc_I	addccc 	%r10, 0x0001, %r13
splash_cmpr_278:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb186e001  ! 2350: WR_STICK_REG_I	wr	%r27, 0x0001, %-
	.word 0x93902007  ! 2351: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81982e8f  ! 2352: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8f, %hpstate
	.word 0x9f802001  ! 2353: SIR	sir	0x0001
	.word 0xdac7e020  ! 2354: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	.word 0xda8fe030  ! 2355: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0x87902144  ! 2356: WRPR_TT_I	wrpr	%r0, 0x0144, %tt
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 2357: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 2358: SIR	sir	0x0001
	.word 0x26800001  ! 2359: BL	bl,a	<label_0x1>
	.word 0x83d02035  ! 2360: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x91d02030  ! 2361: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xda8008a0  ! 2363: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8d902c5d  ! 2364: WRPR_PSTATE_I	wrpr	%r0, 0x0c5d, %pstate
	.word 0x93902002  ! 2365: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa190200d  ! 2366: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x879021fb  ! 2367: WRPR_TT_I	wrpr	%r0, 0x01fb, %tt
	.word 0x83d02035  ! 2368: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xaf508000  ! 2369: RDPR_TSTATE	rdpr	%tstate, %r23
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2371: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_htba_279:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 2372: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2373: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 2374: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93d02035  ! 2375: Tcc_I	tne	icc_or_xcc, %r0 + 53
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2376: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 2377: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1902008  ! 2378: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x98ac0007  ! 2379: ANDNcc_R	andncc 	%r16, %r7, %r12
	.word 0x8d508000  ! 2380: RDPR_TSTATE	rdpr	%tstate, %r6
DS_280:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 2381: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
change_to_randtl_281:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 2382: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8198261c  ! 2383: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061c, %hpstate
	.word 0xcc77e001  ! 2384: STX_I	stx	%r6, [%r31 + 0x0001]
	.word 0x93902000  ! 2385: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_cmpr_282:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181e001  ! 2386: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2387: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 2388: SIR	sir	0x0001
reduce_priv_level_283:
	.word 0x8f902000  ! 2390: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9769a001  ! 2389: SDIVX_I	sdivx	%r6, 0x0001, %r11
	.word 0xa5a000d9  ! 2390: FNEGd	fnegd	%f56, %f18
	.word 0x8d500000  ! 2391: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x93902003  ! 2392: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902005  ! 2393: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8198271c  ! 2394: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071c, %hpstate
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 2395: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2396: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 2397: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x84688007  ! 2398: UDIVX_R	udivx 	%r2, %r7, %r2
	.word 0x8198214c  ! 2399: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014c, %hpstate
	.word 0xc4800bc0  ! 2400: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r2
splash_tba_284:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2401: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc537e001  ! 2402: STQF_I	-	%f2, [0x0001, %r31]
	.word 0x8f50c000  ! 2403: RDPR_TT	rdpr	%tt, %r7
	.word 0x96d0e001  ! 2404: UMULcc_I	umulcc 	%r3, 0x0001, %r11
	.word 0x8d9020ca  ! 2405: WRPR_PSTATE_I	wrpr	%r0, 0x00ca, %pstate
	.word 0x93902006  ! 2406: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902004  ! 2407: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87802004  ! 2408: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8780201c  ! 2409: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd6c7e030  ! 2410: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
	.word 0xa1902001  ! 2411: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8d902441  ! 2412: WRPR_PSTATE_I	wrpr	%r0, 0x0441, %pstate
	.word 0x8b51c000  ! 2413: RDPR_TL	rdpr	%tl, %r5
	.word 0xca7fe001  ! 2414: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0xaed5a001  ! 2415: UMULcc_I	umulcc 	%r22, 0x0001, %r23
	.word 0x81982b8c  ! 2416: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8c, %hpstate
	.word 0xee3fe001  ! 2417: STD_I	std	%r23, [%r31 + 0x0001]
	.word 0xb5702001  ! 2418: POPC_I	popc	0x0001, %r26
	.word 0x8750c000  ! 2419: RDPR_TT	rdpr	%tt, %r3
	.word 0x8ba01a72  ! 2420: FqTOi	fqtoi	
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2421: Tcc_R	ta	icc_or_xcc, %r0 + %r30
reduce_priv_level_285:
	.word 0x8f902001  ! 2423: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1850006  ! 2422: WR_STICK_REG_R	wr	%r20, %r6, %-
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 2423: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xca3fc006  ! 2424: STD_R	std	%r5, [%r31 + %r6]
	.word 0x8f514000  ! 2425: RDPR_TBA	<illegal instruction>
	.word 0x83d02031  ! 2426: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x93902005  ! 2427: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xce1fc000  ! 2428: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0x9f802001  ! 2429: SIR	sir	0x0001
splash_tba_286:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 2430: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802010  ! 2431: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x91d02031  ! 2432: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x99902004  ! 2433: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x8d90261b  ! 2434: WRPR_PSTATE_I	wrpr	%r0, 0x061b, %pstate
	.word 0xb3500000  ! 2435: RDPR_TPC	rdpr	%tpc, %r25
splash_htba_287:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2436: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x89540000  ! 2437: RDPR_GL	rdpr	%-, %r4
	.word 0x93902007  ! 2438: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x36800001  ! 2439: BGE	bge,a	<label_0x1>
	.word 0xb5a000d6  ! 2440: FNEGd	fnegd	%f22, %f26
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 2441: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83a109c6  ! 2442: FDIVd	fdivd	%f4, %f6, %f32
	.word 0x9f802001  ! 2443: SIR	sir	0x0001
	.word 0x8d902a56  ! 2444: WRPR_PSTATE_I	wrpr	%r0, 0x0a56, %pstate
	.word 0xa1902000  ! 2445: WRPR_GL_I	wrpr	%r0, 0x0000, %-
change_to_tl1_288:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87902249  ! 2447: WRPR_TT_I	wrpr	%r0, 0x0249, %tt
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 2448: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902e92  ! 2449: WRPR_PSTATE_I	wrpr	%r0, 0x0e92, %pstate
	.word 0x93902005  ! 2450: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xb751c000  ! 2451: RDPR_TL	rdpr	%tl, %r27
	.word 0xf68008a0  ! 2452: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
	.word 0x99902003  ! 2453: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xf61fe001  ! 2454: LDD_I	ldd	[%r31 + 0x0001], %r27
	.word 0xacf9a001  ! 2455: SDIVcc_I	sdivcc 	%r6, 0x0001, %r22
	.word 0x91d02032  ! 2456: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02030  ! 2457: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902002  ! 2458: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa7a00546  ! 2459: FSQRTd	fsqrt	
	.word 0x85540000  ! 2460: RDPR_GL	rdpr	%-, %r2
	.word 0x93902003  ! 2461: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902003  ! 2462: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x81982f4e  ! 2463: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4e, %hpstate
	.word 0x819826c4  ! 2464: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c4, %hpstate
	.word 0x24700001  ! 2465: BPLE	<illegal instruction>
	.word 0x81982584  ! 2466: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0584, %hpstate
	.word 0xa190200b  ! 2467: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xc527e001  ! 2468: STF_I	st	%f2, [0x0001, %r31]
	.word 0x89500000  ! 2469: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x93902006  ! 2470: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x26700001  ! 2471: BPL	<illegal instruction>
	.word 0x93902005  ! 2472: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902495  ! 2473: WRPR_PSTATE_I	wrpr	%r0, 0x0495, %pstate
	.word 0x8790219a  ! 2474: WRPR_TT_I	wrpr	%r0, 0x019a, %tt
	.word 0x87902005  ! 2475: WRPR_TT_I	wrpr	%r0, 0x0005, %tt
splash_htba_289:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 2476: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x87802089  ! 2477: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa1902001  ! 2478: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93902002  ! 2479: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc89fe001  ! 2480: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	.word 0x8d902040  ! 2481: WRPR_PSTATE_I	wrpr	%r0, 0x0040, %pstate
	.word 0x91d02032  ! 2482: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9ba0056c  ! 2483: FSQRTq	fsqrt	
	.word 0xad514000  ! 2484: RDPR_TBA	rdpr	%tba, %r22
	.word 0xa190200b  ! 2485: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x819826d4  ! 2486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d4, %hpstate
	.word 0xb3a00564  ! 2487: FSQRTq	fsqrt	
	.word 0x93902001  ! 2488: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 2489: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 2490: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02033  ! 2491: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902007  ! 2492: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902001  ! 2493: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 2495: Tcc_R	te	icc_or_xcc, %r0 + %r30
reduce_priv_level_290:
	.word 0x8f902000  ! 2497: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81b01021  ! 2496: SIAM	siam	1
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200b  ! 2498: WRPR_GL_I	wrpr	%r0, 0x000b, %-


.global user_data_start
.data
user_data_start:
	.xword	0xfefb3d137cc8cf03
	.xword	0xefa9c83dbcab475c
	.xword	0x3b3bf0ffd4ad99d0
	.xword	0x89a06c53d569315d
	.xword	0xbb98773f205fa01d
	.xword	0x45f8e2a0aa1c0d23
	.xword	0xe7f3b2511216cc00
	.xword	0x153a79c70a52c896
	.xword	0xd42c970abf38f8e6
	.xword	0x4276320860677c02
	.xword	0xb7b0ae4937170a35
	.xword	0xfd2ea61d03f9fbf7
	.xword	0x7c41dc709c28645d
	.xword	0x4a7c7b9da297e1f0
	.xword	0x8ab446344de73842
	.xword	0x0f2670ac87f33c36
	.xword	0x47bb2be1388f734a
	.xword	0x5d031a23a105ce91
	.xword	0x98b949be357f6ff8
	.xword	0x3ca849bf0a56f5a0
	.xword	0xd859bd5e8e56f645
	.xword	0xdc01bd2586aa9f4a
	.xword	0x9bda0782adc352b7
	.xword	0x7348f91b8b01342e
	.xword	0x5794407355a87e10
	.xword	0x6cdfc4eaceeb09cf
	.xword	0xc29e77d04dfe79bf
	.xword	0x38c1ff6be9e54845
	.xword	0xcc589b66b8fcdcfe
	.xword	0x3bc1451173f15d00
	.xword	0xea850d2b1d7c3925
	.xword	0x1a6dfa3116b7f1e7
	.xword	0x2f6534410c1dcd6f
	.xword	0x9c5666f173a747cb
	.xword	0xd388e00e57abee6b
	.xword	0x6de59382e8ef19ff
	.xword	0x332291e3055ddb9c
	.xword	0xf06971ccf45075fa
	.xword	0xb1bcc95afea6814d
	.xword	0xfb9e334fa8c50da1
	.xword	0x8de9493aeedbbfe4
	.xword	0x5b29f5168fad4eb8
	.xword	0x30acdf29a4591252
	.xword	0xfe3920b4cca6b0bb
	.xword	0xc1cb8520e675cc81
	.xword	0x2e2c5e66e5144d07
	.xword	0x1027c31857b01771
	.xword	0x50240e05ee94bc0e
	.xword	0xd6af8a6d01410c57
	.xword	0x77a1a937f50907a5
	.xword	0xce98ef4ba6bfb520
	.xword	0x4c8fd0b50ca4140e
	.xword	0x4adca83ff0b0f4f1
	.xword	0x853fb14b513d1dc8
	.xword	0x4290e4f9eca50799
	.xword	0x783fb03df94f6be3
	.xword	0x4e59dc1993a62cf1
	.xword	0xdc818c8ad0a00c1d
	.xword	0x0108b0ce3cfe9189
	.xword	0xd4e759b7d69a5e99
	.xword	0xab3e2f235a2d84ad
	.xword	0xa1ff5b45bcb8e376
	.xword	0x8414522b8485259f
	.xword	0xf9fa2de6715474ce
	.xword	0x7af48e3d715bdaf7
	.xword	0x2934eae48afb9954
	.xword	0x66f0b6d003ada352
	.xword	0x32225499e57fb864
	.xword	0x0040a932195bfad5
	.xword	0xc7278467864ef6a8
	.xword	0x54aa2865524765f5
	.xword	0x790f579735fd59b7
	.xword	0xa54cfdf8cfa7c856
	.xword	0xa056fca19057e529
	.xword	0xbae38ed1639e2eff
	.xword	0x2bedf55e45b2a6a4
	.xword	0xf9edad1f4ef05d92
	.xword	0x2ee5492fbad310e6
	.xword	0x35f3a982e6db8bf9
	.xword	0x1173e6b1b5f535b7
	.xword	0xb661c000ef13287d
	.xword	0xb3ecb60f4de822e1
	.xword	0x6bea68b17952d2e9
	.xword	0xcc37088e2413f073
	.xword	0xb40e7e539b765b2c
	.xword	0x486f250a76884da9
	.xword	0x99ae703a09a7825a
	.xword	0xea052b15f2442fa5
	.xword	0xb6499b340341bdfc
	.xword	0x0cdec26ea0dab680
	.xword	0x14bfe376e6d1def6
	.xword	0xf5060439a75e2be4
	.xword	0x90804f031a3fb9c6
	.xword	0xeb350cc899bbcce6
	.xword	0x3a3c30da4fb17c26
	.xword	0x715c6765d5369b98
	.xword	0x76581300267c7c1c
	.xword	0x5b1b3d4a973f9b29
	.xword	0xcb39eae0fe15f53d
	.xword	0x9d60c50bed59ed54
	.xword	0x35f65b23659adfc5
	.xword	0x8b2cf180d6488986
	.xword	0x1949b78cecc7086a
	.xword	0x60892996ab780f4b
	.xword	0xae461975282bba07
	.xword	0xa2c48d1be5c61846
	.xword	0x535c2919578426e1
	.xword	0x0b4a586652a44b00
	.xword	0x1cb92257ab40f52a
	.xword	0x056df747ffcb032c
	.xword	0x00130eb334e50f5e
	.xword	0x471e3b3dcef40589
	.xword	0x506881d2c31470a9
	.xword	0x6f7c212ff0f80928
	.xword	0x9ecadc9680f6dbaa
	.xword	0x963c5e6e19cee660
	.xword	0x56c5a99700ebd81c
	.xword	0x477cdc435f1911d6
	.xword	0x9037756282d4d5ee
	.xword	0x3a6d73b9db05f8ac
	.xword	0x0b790e33315e0362
	.xword	0xea0896955a5822fe
	.xword	0xc62676b70a938816
	.xword	0x2c95dd24fe67d5d3
	.xword	0x490d7fdc49fd5747
	.xword	0x0e388f0502824945
	.xword	0x54859c19e5f702a1
	.xword	0xf7854cb067da8b98
	.xword	0x0ee5d55b92b06930
	.xword	0x334dce2801e944e8
	.xword	0x972a9d670c9056f3
	.xword	0x1249f7fcf6a121c0
	.xword	0x30536b8030a3cc9c
	.xword	0x9f2d1a74490b948f
	.xword	0x53d8f8d3e41cce47
	.xword	0x1fb2eeaf4a9988e1
	.xword	0xaee5d0ead602a7f9
	.xword	0x13ec03b46c141d2b
	.xword	0x2dcd942d68a9ef45
	.xword	0x6bda2f12283802e1
	.xword	0x17e020cbaf4774fc
	.xword	0xfef530a41208eb66
	.xword	0x6c7d92c034822a57
	.xword	0x7cff19c54718375f
	.xword	0xddb3342a30283187
	.xword	0x65e89faed4ce8c38
	.xword	0x82936f7d045ce6a9
	.xword	0x2bfc6f1ac3bbeacd
	.xword	0x777bbeb3d20eb124
	.xword	0x1ee68cf459ed3443
	.xword	0x25e69123df2f4692
	.xword	0x14b3f467bd716b58
	.xword	0xc64edc42d0cb9c5f
	.xword	0x7d4a4a09aa904752
	.xword	0x719e6a67305ec7da
	.xword	0x6c8edbefc9788ba0
	.xword	0xfa57080c008cc0b6
	.xword	0x24ea7749ead6f07b
	.xword	0x3bc0bc6e55cf40f0
	.xword	0xbd417d99e5118ca1
	.xword	0x2cdb22696d2cb45f
	.xword	0xb64b03de2c6c2c3f
	.xword	0xb6980a70be05b39a
	.xword	0x9a9c41187b4ea8ee
	.xword	0xc72f3d309db7f96c
	.xword	0x238c37a8792e18b7
	.xword	0x93be516bbd5752c0
	.xword	0x3caf6396ad6947e9
	.xword	0xdfe25cd7e7d9cabb
	.xword	0xca8ee907752432a5
	.xword	0x186555357b33004a
	.xword	0x35ff5d3a388d8f59
	.xword	0x4814ec33775c8bff
	.xword	0x6ba7738f2ba6b027
	.xword	0xe83537beba9b03c9
	.xword	0x555b5b8e50d7e576
	.xword	0x19f0e68b92262ec8
	.xword	0x141baf48fc2d7880
	.xword	0x43f150ae25e33a95
	.xword	0xcad91525644d65b4
	.xword	0x736b6d7246047b37
	.xword	0x2972081a65451952
	.xword	0x33fb060beb1896ef
	.xword	0x7bd0f042308d1af7
	.xword	0xf1d3d231ef56e062
	.xword	0x1f81e308636d3b21
	.xword	0x47610297d89303fa
	.xword	0xe03303104b7fb30e
	.xword	0x35984bb26b34f167
	.xword	0x88f05410c0246b70
	.xword	0x46ba7c355c34f92d
	.xword	0xc7a2ee6e7e016017
	.xword	0x3aeffca8554aceaa
	.xword	0x1b8bef39a71a7640
	.xword	0x2b4bcf82680ba678
	.xword	0xe6f77cff07a183b4
	.xword	0x0e62c5e12b71d8cf
	.xword	0x5a5af7435c4b3b83
	.xword	0x8285e86198ddd418
	.xword	0x3ced232588ae11a3
	.xword	0x740d9e7ff1c89048
	.xword	0x6078d1fa7e7f311c
	.xword	0xdd1d900b03caeb36
	.xword	0x20e361d33db2c0fd
	.xword	0x440a6280612111a2
	.xword	0xb6cbd9e683c432fd
	.xword	0xcf41a7e1a14496b1
	.xword	0xcd4948ca24a4b6ac
	.xword	0xe74d0315a43821b6
	.xword	0xfee7843ab92edbea
	.xword	0xc5f4adfc13f1d6ac
	.xword	0x89149e20dd9f774e
	.xword	0xaef8da5698ea8868
	.xword	0x6a959463aa35863d
	.xword	0x9d5bd9f7bfa0988c
	.xword	0x6bf9e7a64daccff8
	.xword	0x4c821c3bf27ae89a
	.xword	0x12e63347941c8bd2
	.xword	0x4100193146a3658c
	.xword	0x14c0a5b3ff6e469b
	.xword	0x20b776e6f3162f09
	.xword	0x42b0fa977f491507
	.xword	0x1c91903a90544c0f
	.xword	0xb516cac9da401245
	.xword	0x9c5b0c44727feb58
	.xword	0xfdb69933cdd48b2d
	.xword	0x7c79b2d52045f438
	.xword	0x8ea58274035ddfe9
	.xword	0x5c06e3bc166215b2
	.xword	0xb70a74ec7a1f985f
	.xword	0xe0d1853c3767c414
	.xword	0x86f21a7f51b9bd26
	.xword	0xb3f8346d928bfe3c
	.xword	0x79c300d3ff51b671
	.xword	0x3751e74cc15fa44e
	.xword	0x33f18022c5921b90
	.xword	0xea19471874fb5193
	.xword	0xa80116ead637a008
	.xword	0xfdef09e0677150f5
	.xword	0x0ba94bdf5775495c
	.xword	0x800c0a5adc858c55
	.xword	0x9f9ef7f9e9c8fd8d
	.xword	0xea589ef0e74bd842
	.xword	0x027bd669f3b7c3b3
	.xword	0x39c68c4a121f11cf
	.xword	0xfe76faf9304673b0
	.xword	0x4811118fb9cc52d8
	.xword	0x553e0d8ee4b7e51e
	.xword	0x6f0ffabae556cd5b
	.xword	0x32180e713e175aeb
	.xword	0xcc858af6521e376f
	.xword	0x246dca566d9c0d7b
	.xword	0x2540648c1781bfba
	.xword	0xb240ecef92907734
	.xword	0xc44fb06e977b14ff
	.xword	0xccd3b3cae8d01e8a


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Wed May 12 13:53:12 2004
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

