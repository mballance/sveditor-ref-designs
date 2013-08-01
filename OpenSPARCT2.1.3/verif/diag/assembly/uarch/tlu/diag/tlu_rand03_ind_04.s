/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand03_ind_04.s
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
	mov 0x34, %r14
	mov 0x35, %r30
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
	.word 0x2e800001  ! 1: BVS	bvs,a	<label_0x1>
	.word 0x879022c1  ! 2: WRPR_TT_I	wrpr	%r0, 0x02c1, %tt
	.word 0x93902003  ! 3: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81500000  ! 4: RDPR_TPC	rdpr	%tpc, %r0
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 5: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x819821df  ! 6: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01df, %hpstate
	.word 0x81982614  ! 7: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0614, %hpstate
	.word 0x8d90209c  ! 8: WRPR_PSTATE_I	wrpr	%r0, 0x009c, %pstate
	.word 0x8ad48016  ! 9: UMULcc_R	umulcc 	%r18, %r22, %r5
	.word 0x86aa8007  ! 10: ANDNcc_R	andncc 	%r10, %r7, %r3
	.word 0x91d02033  ! 11: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8198288e  ! 12: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088e, %hpstate
	.word 0x91d02034  ! 13: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x819822d7  ! 14: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d7, %hpstate
	.word 0xc68008a0  ! 15: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x879022d1  ! 16: WRPR_TT_I	wrpr	%r0, 0x02d1, %tt
	.word 0x8198230b  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030b, %hpstate
	.word 0xb2d8c000  ! 18: SMULcc_R	smulcc 	%r3, %r0, %r25
	.word 0x8d9024cb  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x04cb, %pstate
	.word 0x9af8800a  ! 20: SDIVcc_R	sdivcc 	%r2, %r10, %r13
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 21: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819824d3  ! 22: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d3, %hpstate
	.word 0xdacfe030  ! 23: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r13
	.word 0x879021b6  ! 24: WRPR_TT_I	wrpr	%r0, 0x01b6, %tt
	.word 0x8d9022c5  ! 25: WRPR_PSTATE_I	wrpr	%r0, 0x02c5, %pstate
	.word 0x819827c3  ! 26: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c3, %hpstate
	ta	T_CHANGE_PRIV	! macro
DS_0:
	.word 0x20800001  ! 29: BN	bn,a	<label_0x1>
	.word 0xcd306001  ! 29: STQF_I	-	%f6, [0x0001, %r1]
	normalw
	.word 0xa3458000  ! 28: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x8d902e8f  ! 29: WRPR_PSTATE_I	wrpr	%r0, 0x0e8f, %pstate
	.word 0x22800001  ! 30: BE	be,a	<label_0x1>
	.word 0x8790209e  ! 31: WRPR_TT_I	wrpr	%r0, 0x009e, %tt
	.word 0x99494000  ! 32: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x8da589cc  ! 33: FDIVd	fdivd	%f22, %f12, %f6
	.word 0x8d902681  ! 34: WRPR_PSTATE_I	wrpr	%r0, 0x0681, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 35: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 36: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_1:
	.word 0x32800001  ! 38: BNE	bne,a	<label_0x1>
	pdist %f22, %f22, %f30
	.word 0x95b50301  ! 37: ALLIGNADDRESS	alignaddr	%r20, %r1, %r10
	.word 0x93d02033  ! 38: Tcc_I	tne	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902003  ! 40: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d9024db  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x04db, %pstate
	.word 0xd437e001  ! 42: STH_I	sth	%r10, [%r31 + 0x0001]
	.word 0x8d902294  ! 43: WRPR_PSTATE_I	wrpr	%r0, 0x0294, %pstate
	.word 0x93902007  ! 44: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93d02034  ! 46: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8d902605  ! 47: WRPR_PSTATE_I	wrpr	%r0, 0x0605, %pstate
change_to_randtl_2:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 48: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93a149e7  ! 49: FDIVq	dis not found

	.word 0xd337e001  ! 50: STQF_I	-	%f9, [0x0001, %r31]
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 51: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d6a4006  ! 52: SDIVX_R	sdivx	%r9, %r6, %r6
	.word 0x9ba30ddb  ! 53: FdMULq	fdmulq	
	.word 0x91d02032  ! 54: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xda27e001  ! 55: STW_I	stw	%r13, [%r31 + 0x0001]
	.word 0x8d9022cf  ! 56: WRPR_PSTATE_I	wrpr	%r0, 0x02cf, %pstate
	.word 0x87902361  ! 57: WRPR_TT_I	wrpr	%r0, 0x0361, %tt
	.word 0x93902005  ! 58: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 59: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xacd00011  ! 60: UMULcc_R	umulcc 	%r0, %r17, %r22
	.word 0x8da01a68  ! 61: FqTOi	fqtoi	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93d02034  ! 63: Tcc_I	tne	icc_or_xcc, %r0 + 52
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 64: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 65: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xccc004a0  ! 66: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
	.word 0x93902005  ! 67: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 68: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_3:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902002  ! 69: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8790204b  ! 70: WRPR_TT_I	wrpr	%r0, 0x004b, %tt
	.word 0x87902118  ! 71: WRPR_TT_I	wrpr	%r0, 0x0118, %tt
	.word 0x9b540000  ! 72: RDPR_GL	rdpr	%-, %r13
	.word 0x819829d3  ! 73: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d3, %hpstate
	.word 0xa5702001  ! 74: POPC_I	popc	0x0001, %r18
	.word 0xe4880e40  ! 75: LDUBA_R	lduba	[%r0, %r0] 0x72, %r18
	.word 0x81982a87  ! 76: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a87, %hpstate
	.word 0xe48008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x8d90285b  ! 78: WRPR_PSTATE_I	wrpr	%r0, 0x085b, %pstate
	.word 0x846a4017  ! 79: UDIVX_R	udivx 	%r9, %r23, %r2
	.word 0xb568a001  ! 80: SDIVX_I	sdivx	%r2, 0x0001, %r26
	.word 0x81982684  ! 81: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0684, %hpstate
	.word 0x81982ac7  ! 82: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac7, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 83: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf497e000  ! 84: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r26
	ta	T_CHANGE_NONHPRIV	! macro
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 86: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa3504000  ! 87: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x93902003  ! 88: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902003  ! 89: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02035  ! 90: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_NONHPRIV	! macro
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 92: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b494000  ! 93: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0x879023df  ! 94: WRPR_TT_I	wrpr	%r0, 0x03df, %tt
	.word 0x93902006  ! 95: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xcb27c017  ! 96: STF_R	st	%f5, [%r23, %r31]
	.word 0x93902002  ! 97: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8790206e  ! 98: WRPR_TT_I	wrpr	%r0, 0x006e, %tt
	.word 0x8cfd6001  ! 99: SDIVcc_I	sdivcc 	%r21, 0x0001, %r6
	.word 0x87902256  ! 100: WRPR_TT_I	wrpr	%r0, 0x0256, %tt
	.word 0xcc1fe001  ! 101: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x8d902006  ! 102: WRPR_PSTATE_I	wrpr	%r0, 0x0006, %pstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 103: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021e3  ! 104: WRPR_TT_I	wrpr	%r0, 0x01e3, %tt
	.word 0x92c1a001  ! 105: ADDCcc_I	addccc 	%r6, 0x0001, %r9
	.word 0x3e800001  ! 106: BVC	bvc,a	<label_0x1>
	.word 0x8d802004  ! 107: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd28008a0  ! 108: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 109: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd327e001  ! 110: STF_I	st	%f9, [0x0001, %r31]
	.word 0x98fa0002  ! 111: SDIVcc_R	sdivcc 	%r8, %r2, %r12
	.word 0x89480000  ! 112: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x93d02035  ! 113: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xc88008a0  ! 114: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xb750c000  ! 116: RDPR_TT	rdpr	%tt, %r27
	.word 0xb6f9c003  ! 117: SDIVcc_R	sdivcc 	%r7, %r3, %r27
	.word 0x99902005  ! 118: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x99902003  ! 119: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x8d902650  ! 120: WRPR_PSTATE_I	wrpr	%r0, 0x0650, %pstate
	.word 0x91d02033  ! 121: Tcc_I	ta	icc_or_xcc, %r0 + 51
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 122: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 123: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8ba1c9b3  ! 124: FDIVs	fdivs	%f7, %f19, %f5
	.word 0xb5a649d2  ! 125: FDIVd	fdivd	%f56, %f18, %f26
	.word 0xf4c7e020  ! 126: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r26
	.word 0x8d802000  ! 127: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xf4d00e80  ! 128: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r26
	.word 0xf537e001  ! 129: STQF_I	-	%f26, [0x0001, %r31]
	.word 0x8d902c5e  ! 130: WRPR_PSTATE_I	wrpr	%r0, 0x0c5e, %pstate
	.word 0x8198294b  ! 131: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094b, %hpstate
DS_4:
	.word 0x34800001  ! 133: BG	bg,a	<label_0x1>
	.word 0xc532401a  ! 133: STQF_R	-	%f2, [%r26, %r9]
	normalw
	.word 0xa3458000  ! 132: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x844dc00c  ! 133: MULX_R	mulx 	%r23, %r12, %r2
	.word 0xc427e001  ! 134: STW_I	stw	%r2, [%r31 + 0x0001]
	.word 0x93902002  ! 135: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d504000  ! 136: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0xb0d4c00d  ! 137: UMULcc_R	umulcc 	%r19, %r13, %r24
	.word 0x8d9026c5  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x06c5, %pstate
	.word 0x81982a04  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a04, %hpstate
	.word 0x93902005  ! 140: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93504000  ! 141: RDPR_TNPC	rdpr	%tnpc, %r9
DS_5:
	.word 0x32800001  ! 143: BNE	bne,a	<label_0x1>
	.word 0xcf318002  ! 143: STQF_R	-	%f7, [%r2, %r6]
	normalw
	.word 0x89458000  ! 142: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x93d02035  ! 143: Tcc_I	tne	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
DS_6:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 145: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x87902083  ! 146: WRPR_TT_I	wrpr	%r0, 0x0083, %tt
	.word 0x8d90245e  ! 147: WRPR_PSTATE_I	wrpr	%r0, 0x045e, %pstate
	.word 0x93902005  ! 148: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc9e7c022  ! 149: CASA_I	casa	[%r31] 0x 1, %r2, %r4
	.word 0x9951c000  ! 150: RDPR_TL	rdpr	%tl, %r12
	.word 0x819824cf  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cf, %hpstate
	.word 0xd8d00e80  ! 152: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r12
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 153: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9ba149ad  ! 154: FDIVs	fdivs	%f5, %f13, %f13
	.word 0xb3514000  ! 155: RDPR_TBA	rdpr	%tba, %r25
	.word 0x87902310  ! 156: WRPR_TT_I	wrpr	%r0, 0x0310, %tt
	.word 0x91d02033  ! 157: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902001  ! 158: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02032  ! 160: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xf2dfe000  ! 161: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r25
	.word 0x83d02030  ! 162: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xf29fc020  ! 163: LDDA_R	ldda	[%r31, %r0] 0x01, %r25
	.word 0x99902002  ! 164: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xf327e001  ! 165: STF_I	st	%f25, [0x0001, %r31]
	.word 0x87802080  ! 166: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9b514000  ! 167: RDPR_TBA	rdpr	%tba, %r13
	.word 0x8b51c000  ! 168: RDPR_TL	rdpr	%tl, %r5
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xca800ac0  ! 170: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r5
	ta	T_CHANGE_NONPRIV	! macro
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 172: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcad7e000  ! 173: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r5
	.word 0x8d802000  ! 174: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902e47  ! 175: WRPR_PSTATE_I	wrpr	%r0, 0x0e47, %pstate
	.word 0x879022e5  ! 176: WRPR_TT_I	wrpr	%r0, 0x02e5, %tt
	.word 0x83a289da  ! 177: FDIVd	fdivd	%f10, %f26, %f32
	.word 0x8d50c000  ! 178: RDPR_TT	rdpr	%tt, %r6
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 179: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x82d08015  ! 180: UMULcc_R	umulcc 	%r2, %r21, %r1
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 181: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_7:
	.word 0x22800001  ! 183: BE	be,a	<label_0x1>
	pdist %f12, %f12, %f22
	.word 0x87b4c309  ! 182: ALLIGNADDRESS	alignaddr	%r19, %r9, %r3
	.word 0xc6c7e020  ! 183: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r3
	.word 0x83d02030  ! 184: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x81982019  ! 185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0019, %hpstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 186: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819822cb  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cb, %hpstate
	.word 0x8d902c0d  ! 188: WRPR_PSTATE_I	wrpr	%r0, 0x0c0d, %pstate
	.word 0x879023eb  ! 189: WRPR_TT_I	wrpr	%r0, 0x03eb, %tt
	.word 0x97494000  ! 190: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0x91d02035  ! 191: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902294  ! 192: WRPR_TT_I	wrpr	%r0, 0x0294, %tt
	.word 0x81982794  ! 193: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0794, %hpstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 194: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902362  ! 195: WRPR_TT_I	wrpr	%r0, 0x0362, %tt
	.word 0xd68008a0  ! 196: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x9169a001  ! 198: SDIVX_I	sdivx	%r6, 0x0001, %r8
change_to_randtl_8:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 199: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
DS_9:
	.word 0x32800001  ! 201: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 201: BG	bg,a	<label_0x1>
	.word 0x8ba00540  ! 201: FSQRTd	fsqrt	
	.word 0xa1a64836  ! 200: FADDs	fadds	%f25, %f22, %f16
	.word 0x8d802000  ! 201: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 202: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81500000  ! 203: RDPR_TPC	rdpr	%tpc, %r0
	.word 0x93902003  ! 204: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87902122  ! 205: WRPR_TT_I	wrpr	%r0, 0x0122, %tt
	.word 0x99514000  ! 206: RDPR_TBA	rdpr	%tba, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x926e6001  ! 208: UDIVX_I	udivx 	%r25, 0x0001, %r9
DS_10:
	.word 0x22800001  ! 210: BE	be,a	<label_0x1>
	pdist %f28, %f8, %f18
	.word 0xb7b4c31a  ! 209: ALLIGNADDRESS	alignaddr	%r19, %r26, %r27
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 210: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902230  ! 211: WRPR_TT_I	wrpr	%r0, 0x0230, %tt
	.word 0x81982045  ! 212: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0045, %hpstate
	.word 0x8d802000  ! 213: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8790212a  ! 215: WRPR_TT_I	wrpr	%r0, 0x012a, %tt
	.word 0x93902007  ! 216: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8b514000  ! 217: RDPR_TBA	rdpr	%tba, %r5
DS_11:
	.word 0x32800001  ! 219: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 219: BN	bn,a	<label_0x1>
	.word 0xcf14400c  ! 219: LDQF_R	-	[%r17, %r12], %f7
	.word 0x8da68827  ! 218: FADDs	fadds	%f26, %f7, %f6
	.word 0xccffc027  ! 219: SWAPA_R	swapa	%r6, [%r31 + %r7] 0x01
	.word 0x83d02035  ! 220: Tcc_I	te	icc_or_xcc, %r0 + 53
DS_12:
	.word 0x32800001  ! 222: BNE	bne,a	<label_0x1>
	allclean
	.word 0xa3b6c314  ! 221: ALLIGNADDRESS	alignaddr	%r27, %r20, %r17
	.word 0xaf514000  ! 222: RDPR_TBA	rdpr	%tba, %r23
	.word 0xee8fe000  ! 223: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r23
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982400  ! 225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0400, %hpstate
	.word 0x93902001  ! 226: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d90225a  ! 227: WRPR_PSTATE_I	wrpr	%r0, 0x025a, %pstate
	.word 0x91d02032  ! 228: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02030  ! 229: Tcc_I	ta	icc_or_xcc, %r0 + 48
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 230: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x3e800001  ! 231: BVC	bvc,a	<label_0x1>
	.word 0x83504000  ! 232: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0xc2c804a0  ! 233: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 235: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 236: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81a649e6  ! 237: FDIVq	dis not found

DS_13:
	.word 0x34800001  ! 239: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 238: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d9028c6  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x08c6, %pstate
	.word 0xa5500000  ! 240: RDPR_TPC	rdpr	%tpc, %r18
	.word 0x93d02030  ! 241: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xb7504000  ! 242: RDPR_TNPC	<illegal instruction>
	.word 0x93d02033  ! 243: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d902a0a  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x0a0a, %pstate
	.word 0x81514000  ! 245: RDPR_TBA	rdpr	%tba, %r0
	.word 0x819828c7  ! 246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c7, %hpstate
	.word 0xc047e001  ! 247: LDSW_I	ldsw	[%r31 + 0x0001], %r0
	.word 0xa84ac013  ! 248: MULX_R	mulx 	%r11, %r19, %r20
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xe807c000  ! 250: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0xb7a34d25  ! 251: FsMULd	fsmuld	%f13, %f36, %f58
	ta	T_CHANGE_HPRIV	! macro
	.word 0xf6dfe030  ! 253: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r27
	.word 0x879020ba  ! 254: WRPR_TT_I	wrpr	%r0, 0x00ba, %tt
	.word 0x81982558  ! 255: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0558, %hpstate
	.word 0xa9480000  ! 256: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xe857e001  ! 257: LDSH_I	ldsh	[%r31 + 0x0001], %r20
	.word 0x87a000d7  ! 258: FNEGd	fnegd	%f54, %f34
	.word 0x26800001  ! 259: BL	bl,a	<label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 260: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90268f  ! 261: WRPR_PSTATE_I	wrpr	%r0, 0x068f, %pstate
	.word 0x92da8003  ! 262: SMULcc_R	smulcc 	%r10, %r3, %r9
	.word 0x91d02031  ! 263: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81982e82  ! 264: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e82, %hpstate
	.word 0x87902224  ! 265: WRPR_TT_I	wrpr	%r0, 0x0224, %tt
	.word 0x87902186  ! 266: WRPR_TT_I	wrpr	%r0, 0x0186, %tt
	.word 0x81982117  ! 267: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0117, %hpstate
	.word 0xd29fc020  ! 268: LDDA_R	ldda	[%r31, %r0] 0x01, %r9
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93902007  ! 270: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x926de001  ! 271: UDIVX_I	udivx 	%r23, 0x0001, %r9
	.word 0x8d902ec2  ! 272: WRPR_PSTATE_I	wrpr	%r0, 0x0ec2, %pstate
	.word 0xd2d00e60  ! 273: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r9
DS_14:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 274: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x81982607  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0607, %hpstate
	.word 0x87802014  ! 276: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd22fe001  ! 277: STB_I	stb	%r9, [%r31 + 0x0001]
	.word 0x8f514000  ! 278: RDPR_TBA	rdpr	%tba, %r7
	.word 0xa4fd4017  ! 279: SDIVcc_R	sdivcc 	%r21, %r23, %r18
	.word 0x87902023  ! 280: WRPR_TT_I	wrpr	%r0, 0x0023, %tt
	.word 0x85a6c9e2  ! 281: FDIVq	dis not found

	.word 0xb750c000  ! 282: RDPR_TT	rdpr	%tt, %r27
	.word 0x8d802004  ! 283: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x38700001  ! 284: BPGU	<illegal instruction>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 285: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 286: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02031  ! 287: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87902073  ! 288: WRPR_TT_I	wrpr	%r0, 0x0073, %tt
	.word 0x8d9020c9  ! 289: WRPR_PSTATE_I	wrpr	%r0, 0x00c9, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902850  ! 291: WRPR_PSTATE_I	wrpr	%r0, 0x0850, %pstate
change_to_tl1_15:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902001  ! 293: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 295: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf797e001  ! 296: LDQFA_I	-	[%r31, 0x0001], %f27
	.word 0x93902007  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902cc6  ! 298: WRPR_PSTATE_I	wrpr	%r0, 0x0cc6, %pstate
	.word 0xa1480000  ! 299: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x8d902a87  ! 300: WRPR_PSTATE_I	wrpr	%r0, 0x0a87, %pstate
	.word 0x8d902e10  ! 301: WRPR_PSTATE_I	wrpr	%r0, 0x0e10, %pstate
	.word 0x87a0054c  ! 302: FSQRTd	fsqrt	
	.word 0x99902004  ! 303: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x89514000  ! 304: RDPR_TBA	rdpr	%tba, %r4
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f480000  ! 306: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x91500000  ! 307: RDPR_TPC	rdpr	%tpc, %r8
	.word 0xada509a1  ! 308: FDIVs	fdivs	%f20, %f1, %f22
	.word 0x93902003  ! 309: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902a99  ! 310: WRPR_PSTATE_I	wrpr	%r0, 0x0a99, %pstate
	.word 0x83d02035  ! 311: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d902c9e  ! 312: WRPR_PSTATE_I	wrpr	%r0, 0x0c9e, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x32700001  ! 315: BPNE	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2a700001  ! 317: BPCS	<illegal instruction>
	.word 0x99a30d34  ! 318: FsMULd	fsmuld	%f12, %f20, %f12
change_to_randtl_16:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 319: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x91d02031  ! 320: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d902e92  ! 321: WRPR_PSTATE_I	wrpr	%r0, 0x0e92, %pstate
	.word 0x8d902ad7  ! 322: WRPR_PSTATE_I	wrpr	%r0, 0x0ad7, %pstate
	.word 0xaea8c019  ! 323: ANDNcc_R	andncc 	%r3, %r25, %r23
	.word 0x91d02034  ! 324: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f540000  ! 325: RDPR_GL	rdpr	%-, %r7
	.word 0xcec7e010  ! 326: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r7
	.word 0x8790221a  ! 327: WRPR_TT_I	wrpr	%r0, 0x021a, %tt
	.word 0x91d02035  ! 328: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_17:
	.word 0x34800001  ! 330: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 329: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xce800ae0  ! 330: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r7
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 331: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 332: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xce97e000  ! 333: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r7
	.word 0x8790233a  ! 334: WRPR_TT_I	wrpr	%r0, 0x033a, %tt
	.word 0x81982840  ! 335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0840, %hpstate
	.word 0x93902000  ! 336: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1a0054c  ! 337: FSQRTd	fsqrt	
	.word 0x83a000c4  ! 338: FNEGd	fnegd	%f4, %f32
	.word 0x93902006  ! 339: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d90261c  ! 340: WRPR_PSTATE_I	wrpr	%r0, 0x061c, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93902007  ! 342: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 343: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 344: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc2dfe010  ! 345: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r1
	.word 0x8d90229b  ! 346: WRPR_PSTATE_I	wrpr	%r0, 0x029b, %pstate
	.word 0x8d902883  ! 347: WRPR_PSTATE_I	wrpr	%r0, 0x0883, %pstate
	.word 0x93902005  ! 348: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902005  ! 349: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982405  ! 350: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0405, %hpstate
	.word 0x8790229f  ! 351: WRPR_TT_I	wrpr	%r0, 0x029f, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9020ca  ! 353: WRPR_PSTATE_I	wrpr	%r0, 0x00ca, %pstate
	.word 0x95a000d4  ! 354: FNEGd	fnegd	%f20, %f10
	.word 0x9ba00571  ! 355: FSQRTq	fsqrt	
	.word 0xda97e010  ! 356: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
	.word 0x8d902ad6  ! 357: WRPR_PSTATE_I	wrpr	%r0, 0x0ad6, %pstate
	.word 0x93902005  ! 358: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xdb37c011  ! 359: STQF_R	-	%f13, [%r17, %r31]
	.word 0x81702001  ! 360: POPC_I	popc	0x0001, %r0
	.word 0x85a0056d  ! 361: FSQRTq	fsqrt	
	.word 0x9649000c  ! 362: MULX_R	mulx 	%r4, %r12, %r11
	.word 0xa4d90001  ! 363: SMULcc_R	smulcc 	%r4, %r1, %r18
	.word 0x8d902016  ! 364: WRPR_PSTATE_I	wrpr	%r0, 0x0016, %pstate
	.word 0x8d902c1e  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x0c1e, %pstate
	.word 0xe4c004a0  ! 366: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r18
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d90221d  ! 368: WRPR_PSTATE_I	wrpr	%r0, 0x021d, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xb4d2e001  ! 370: UMULcc_I	umulcc 	%r11, 0x0001, %r26
	.word 0x879022fd  ! 371: WRPR_TT_I	wrpr	%r0, 0x02fd, %tt
	.word 0xa5508000  ! 372: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x81982dc5  ! 373: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc5, %hpstate
	.word 0xe4d004a0  ! 374: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
	.word 0x8d9022d7  ! 375: WRPR_PSTATE_I	wrpr	%r0, 0x02d7, %pstate
	.word 0x93902007  ! 376: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d02031  ! 377: Tcc_I	ta	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xe48fe020  ! 379: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r18
	.word 0x93902007  ! 380: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_18:
	.word 0x32800001  ! 382: BNE	bne,a	<label_0x1>
	.word 0xd5328004  ! 382: STQF_R	-	%f10, [%r4, %r10]
	normalw
	.word 0x87458000  ! 381: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xc6d804a0  ! 382: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0x8d90221f  ! 383: WRPR_PSTATE_I	wrpr	%r0, 0x021f, %pstate
	.word 0x91d02034  ! 384: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_TO_TL0	! macro
change_to_tl1_19:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xc6d7e020  ! 387: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r3
DS_20:
	.word 0x22800001  ! 389: BE	be,a	<label_0x1>
	pdist %f12, %f6, %f14
	.word 0xabb18301  ! 388: ALLIGNADDRESS	alignaddr	%r6, %r1, %r21
	.word 0xebe7c021  ! 389: CASA_I	casa	[%r31] 0x 1, %r1, %r21
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 390: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902300  ! 391: WRPR_TT_I	wrpr	%r0, 0x0300, %tt
	.word 0xea8008a0  ! 392: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0xeabfc021  ! 393: STDA_R	stda	%r21, [%r31 + %r1] 0x01
	.word 0x81982844  ! 394: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0844, %hpstate
	.word 0xebe7c021  ! 395: CASA_I	casa	[%r31] 0x 1, %r1, %r21
	.word 0x93902004  ! 396: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xb7a2c9e6  ! 397: FDIVq	dis not found

	.word 0x91d02031  ! 398: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8790218b  ! 399: WRPR_TT_I	wrpr	%r0, 0x018b, %tt
	.word 0x8aaa801a  ! 400: ANDNcc_R	andncc 	%r10, %r26, %r5
	.word 0x93a2c9d8  ! 401: FDIVd	fdivd	%f42, %f24, %f40
	.word 0x9ba04dda  ! 402: FdMULq	fdmulq	
DS_21:
	.word 0x20800001  ! 404: BN	bn,a	<label_0x1>
	.word 0xd5332001  ! 404: STQF_I	-	%f10, [0x0001, %r12]
	normalw
	.word 0xb5458000  ! 403: RD_SOFTINT_REG	rd	%softint, %r26
	.word 0x81a50dc5  ! 404: FdMULq	fdmulq	
	.word 0x94c6e001  ! 405: ADDCcc_I	addccc 	%r27, 0x0001, %r10
	.word 0x93d02033  ! 406: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x81982587  ! 407: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0587, %hpstate
DS_22:
	.word 0x22800001  ! 409: BE	be,a	<label_0x1>
	illtrap
	.word 0xd112c001  ! 409: LDQF_R	-	[%r11, %r1], %f8
	.word 0x81a44820  ! 408: FADDs	fadds	%f17, %f0, %f0
	.word 0xc07fe001  ! 409: SWAP_I	swap	%r0, [%r31 + 0x0001]
	.word 0xc0c004a0  ! 410: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	.word 0x81982614  ! 411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0614, %hpstate
	.word 0x8790212f  ! 412: WRPR_TT_I	wrpr	%r0, 0x012f, %tt
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 414: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902cdc  ! 415: WRPR_PSTATE_I	wrpr	%r0, 0x0cdc, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 416: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_23:
	.word 0x34800001  ! 418: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 417: SAVE_R	save	%r31, %r0, %r31
	.word 0x8790216b  ! 418: WRPR_TT_I	wrpr	%r0, 0x016b, %tt
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 419: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b702001  ! 421: POPC_I	popc	0x0001, %r13
	.word 0x8b69c008  ! 422: SDIVX_R	sdivx	%r7, %r8, %r5
	.word 0x8ec0a001  ! 423: ADDCcc_I	addccc 	%r2, 0x0001, %r7
DS_24:
	.word 0x32800001  ! 425: BNE	bne,a	<label_0x1>
	allclean
	.word 0x93b48303  ! 424: ALLIGNADDRESS	alignaddr	%r18, %r3, %r9
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 426: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9026cc  ! 427: WRPR_PSTATE_I	wrpr	%r0, 0x06cc, %pstate
	.word 0x93902002  ! 428: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87902329  ! 429: WRPR_TT_I	wrpr	%r0, 0x0329, %tt
	.word 0x2c700001  ! 430: BPNEG	<illegal instruction>
	.word 0x93902004  ! 431: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x92696001  ! 432: UDIVX_I	udivx 	%r5, 0x0001, %r9
	.word 0x91d02030  ! 433: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902003  ! 434: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982f95  ! 435: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f95, %hpstate
	.word 0x86db400c  ! 436: SMULcc_R	smulcc 	%r13, %r12, %r3
	.word 0xc67fe001  ! 437: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0x97a109ac  ! 438: FDIVs	fdivs	%f4, %f12, %f11
	ta	T_CHANGE_HPRIV	! macro
change_to_randtl_25:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 440: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 441: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d514000  ! 442: RDPR_TBA	rdpr	%tba, %r6
	.word 0xcccfe010  ! 443: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r6
	.word 0x8b514000  ! 444: RDPR_TBA	rdpr	%tba, %r5
	.word 0x8d902a93  ! 445: WRPR_PSTATE_I	wrpr	%r0, 0x0a93, %pstate
	.word 0x8d902c17  ! 446: WRPR_PSTATE_I	wrpr	%r0, 0x0c17, %pstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 447: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_26:
	.word 0x32800001  ! 449: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 448: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xcb17c000  ! 449: LDQF_R	-	[%r31, %r0], %f5
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 450: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 451: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_27:
	.word 0x34800001  ! 453: BG	bg,a	<label_0x1>
	.word 0xc1322001  ! 453: STQF_I	-	%f0, [0x0001, %r8]
	normalw
	.word 0x91458000  ! 452: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x8da0054a  ! 453: FSQRTd	fsqrt	
	.word 0x81982e54  ! 454: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e54, %hpstate
	.word 0x8d9026c2  ! 455: WRPR_PSTATE_I	wrpr	%r0, 0x06c2, %pstate
	.word 0x8d90220e  ! 456: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
	.word 0xccc004a0  ! 457: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r6
DS_28:
	.word 0x22800001  ! 459: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 458: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902000  ! 459: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902004  ! 460: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902001  ! 461: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xafa58d2c  ! 462: FsMULd	fsmuld	%f22, %f12, %f54
	.word 0xa1a000d5  ! 463: FNEGd	fnegd	%f52, %f16
	.word 0xe137c015  ! 464: STQF_R	-	%f16, [%r21, %r31]
	.word 0xb1a0054d  ! 465: FSQRTd	fsqrt	
DS_29:
	.word 0x20800001  ! 467: BN	bn,a	<label_0x1>
	.word 0xcf31e001  ! 467: STQF_I	-	%f7, [0x0001, %r7]
	normalw
	.word 0xb5458000  ! 466: RD_SOFTINT_REG	rd	%softint, %r26
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 468: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 469: BPE	<illegal instruction>
	.word 0x8f902002  ! 440: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982299  ! 470: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0299, %hpstate
	.word 0xb7508000  ! 471: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x83d02030  ! 472: Tcc_I	te	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 474: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982b80  ! 475: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b80, %hpstate
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 476: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902376  ! 477: WRPR_TT_I	wrpr	%r0, 0x0376, %tt
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 478: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_30:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87802080  ! 480: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902812  ! 481: WRPR_PSTATE_I	wrpr	%r0, 0x0812, %pstate
	.word 0xa9a04dc2  ! 482: FdMULq	fdmulq	
change_to_randtl_31:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 483: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x99902005  ! 484: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 485: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 486: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 487: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_32:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xe8c804a0  ! 489: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
DS_33:
	.word 0x20800001  ! 491: BN	bn,a	<label_0x1>
	allclean
	.word 0x8fb10315  ! 490: ALLIGNADDRESS	alignaddr	%r4, %r21, %r7
	.word 0xa9500000  ! 491: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x81494000  ! 492: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0x93d02034  ! 493: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xc0ffc035  ! 494: SWAPA_R	swapa	%r0, [%r31 + %r21] 0x01
	.word 0xc00fe001  ! 495: LDUB_I	ldub	[%r31 + 0x0001], %r0
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 496: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 497: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902448  ! 498: WRPR_PSTATE_I	wrpr	%r0, 0x0448, %pstate
	.word 0xa7a24dd2  ! 499: FdMULq	fdmulq	
	.word 0x85540000  ! 500: RDPR_GL	rdpr	%-, %r2
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8198211c  ! 503: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011c, %hpstate
DS_34:
	.word 0x22800001  ! 505: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 504: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_35:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 505: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xc4c004a0  ! 506: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
	.word 0x87802010  ! 507: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8790227d  ! 508: WRPR_TT_I	wrpr	%r0, 0x027d, %tt
	.word 0x82fde001  ! 509: SDIVcc_I	sdivcc 	%r23, 0x0001, %r1
	.word 0x8790235f  ! 510: WRPR_TT_I	wrpr	%r0, 0x035f, %tt
	.word 0x8790233c  ! 511: WRPR_TT_I	wrpr	%r0, 0x033c, %tt
	.word 0x8f902002  ! 505: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9280e001  ! 513: ADDcc_I	addcc 	%r3, 0x0001, %r9
	.word 0x81982f85  ! 514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f85, %hpstate
	.word 0xd2c7e000  ! 515: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r9
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 516: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 518: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_36:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 519: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8151c000  ! 520: RDPR_TL	rdpr	%tl, %r0
	.word 0x83d02033  ! 521: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x80f9c01b  ! 522: SDIVcc_R	sdivcc 	%r7, %r27, %r0
	.word 0x8d902807  ! 523: WRPR_PSTATE_I	wrpr	%r0, 0x0807, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 524: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 525: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xab514000  ! 526: RDPR_TBA	rdpr	%tba, %r21
	.word 0x879022e3  ! 527: WRPR_TT_I	wrpr	%r0, 0x02e3, %tt
	.word 0x8ed32001  ! 528: UMULcc_I	umulcc 	%r12, 0x0001, %r7
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 529: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902886  ! 530: WRPR_PSTATE_I	wrpr	%r0, 0x0886, %pstate
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 531: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902a53  ! 532: WRPR_PSTATE_I	wrpr	%r0, 0x0a53, %pstate
	.word 0x8d90248d  ! 533: WRPR_PSTATE_I	wrpr	%r0, 0x048d, %pstate
	.word 0x81a0055b  ! 534: FSQRTd	fsqrt	
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 535: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xc0cfe000  ! 537: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r0
	.word 0xc0d80e80  ! 538: LDXA_R	ldxa	[%r0, %r0] 0x74, %r0
	.word 0x81a00544  ! 539: FSQRTd	fsqrt	
	.word 0x8d902441  ! 540: WRPR_PSTATE_I	wrpr	%r0, 0x0441, %pstate
	.word 0x93902004  ! 541: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 542: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 543: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xb56e6001  ! 544: SDIVX_I	sdivx	%r25, 0x0001, %r26
	.word 0x8151c000  ! 545: RDPR_TL	rdpr	%tl, %r0
	.word 0x8198204e  ! 546: WRHPR_HPSTATE_I	wrhpr	%r0, 0x004e, %hpstate
	.word 0x8d9022d7  ! 547: WRPR_PSTATE_I	wrpr	%r0, 0x02d7, %pstate
	.word 0x93d02033  ! 548: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x81982046  ! 549: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0046, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb5480000  ! 551: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 552: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb4c12001  ! 553: ADDCcc_I	addccc 	%r4, 0x0001, %r26
	.word 0x91d02033  ! 554: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93d02033  ! 555: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x91d02032  ! 556: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xf4800bc0  ! 557: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r26
	.word 0x8d802000  ! 558: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198278d  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078d, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xb5514000  ! 561: RDPR_TBA	rdpr	%tba, %r26
	.word 0x87802004  ! 562: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902005  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8790209c  ! 564: WRPR_TT_I	wrpr	%r0, 0x009c, %tt
	.word 0x87802089  ! 565: WRASI_I	wr	%r0, 0x0089, %asi
change_to_randtl_37:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 566: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x87802088  ! 567: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x879023c0  ! 568: WRPR_TT_I	wrpr	%r0, 0x03c0, %tt
	.word 0x819824ca  ! 569: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ca, %hpstate
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 570: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xaed06001  ! 571: UMULcc_I	umulcc 	%r1, 0x0001, %r23
	.word 0x81982554  ! 572: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0554, %hpstate
	.word 0x93d02030  ! 573: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x81480000  ! 574: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0x95514000  ! 575: RDPR_TBA	rdpr	%tba, %r10
	.word 0xaba109c5  ! 576: FDIVd	fdivd	%f4, %f36, %f52
	.word 0x9b514000  ! 577: RDPR_TBA	rdpr	%tba, %r13
	.word 0x8d90204d  ! 578: WRPR_PSTATE_I	wrpr	%r0, 0x004d, %pstate
	.word 0xa1494000  ! 579: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0x8790233d  ! 580: WRPR_TT_I	wrpr	%r0, 0x033d, %tt
	.word 0x85a449e6  ! 581: FDIVq	dis not found

	.word 0xc49004a0  ! 582: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
change_to_tl1_38:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902001  ! 584: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa0f88004  ! 585: SDIVcc_R	sdivcc 	%r2, %r4, %r16
	.word 0x87494000  ! 586: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0x85514000  ! 587: RDPR_TBA	rdpr	%tba, %r2
	.word 0x81982fd0  ! 588: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd0, %hpstate
	.word 0xc4c7e000  ! 589: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r2
	.word 0x91d02034  ! 590: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_39:
	.word 0x34800001  ! 592: BG	bg,a	<label_0x1>
	.word 0xd9354018  ! 592: STQF_R	-	%f12, [%r24, %r21]
	normalw
	.word 0x83458000  ! 591: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x87902295  ! 592: WRPR_TT_I	wrpr	%r0, 0x0295, %tt
DS_40:
	.word 0x32800001  ! 594: BNE	bne,a	<label_0x1>
	pdist %f6, %f22, %f2
	.word 0xb7b2c309  ! 593: ALLIGNADDRESS	alignaddr	%r11, %r9, %r27
	.word 0x819824c8  ! 594: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c8, %hpstate
	.word 0x87508000  ! 595: RDPR_TSTATE	rdpr	%tstate, %r3
DS_41:
	.word 0x20800001  ! 597: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 597: BN	bn,a	<label_0x1>
	.word 0x97a00557  ! 597: FSQRTd	fsqrt	
	.word 0xb1a1482a  ! 596: FADDs	fadds	%f5, %f10, %f24
	.word 0x8790200e  ! 597: WRPR_TT_I	wrpr	%r0, 0x000e, %tt
	.word 0x879020bc  ! 598: WRPR_TT_I	wrpr	%r0, 0x00bc, %tt
	.word 0x91d02034  ! 599: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8198270e  ! 600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070e, %hpstate
	.word 0x8d902607  ! 601: WRPR_PSTATE_I	wrpr	%r0, 0x0607, %pstate
	.word 0x879023f1  ! 602: WRPR_TT_I	wrpr	%r0, 0x03f1, %tt
	.word 0x89a000c1  ! 603: FNEGd	fnegd	%f32, %f4
	.word 0x91d02032  ! 604: Tcc_I	ta	icc_or_xcc, %r0 + 50
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 605: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xada489b2  ! 606: FDIVs	fdivs	%f18, %f18, %f22
change_to_randtl_42:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 607: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902007  ! 608: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d02031  ! 609: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xec8008a0  ! 610: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x81982bcb  ! 611: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bcb, %hpstate
	.word 0x896a6001  ! 612: SDIVX_I	sdivx	%r9, 0x0001, %r4
	.word 0xc8800b60  ! 613: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r4
change_to_tl1_43:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x83d02031  ! 615: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x91d02033  ! 616: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02030  ! 617: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982b0e  ! 619: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0e, %hpstate
	.word 0xc88804a0  ! 620: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	.word 0x93902005  ! 621: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902001  ! 622: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d9020d0  ! 623: WRPR_PSTATE_I	wrpr	%r0, 0x00d0, %pstate
	.word 0x879020e2  ! 624: WRPR_TT_I	wrpr	%r0, 0x00e2, %tt
	.word 0x91d02032  ! 625: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa7a000da  ! 626: FNEGd	fnegd	%f26, %f50
	.word 0x91d02031  ! 627: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d90208e  ! 628: WRPR_PSTATE_I	wrpr	%r0, 0x008e, %pstate
	.word 0x93902005  ! 629: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8fa00579  ! 630: FSQRTq	fsqrt	
	.word 0xa6f88005  ! 631: SDIVcc_R	sdivcc 	%r2, %r5, %r19
DS_44:
	.word 0x32800001  ! 633: BNE	bne,a	<label_0x1>
	.word 0xcf312001  ! 633: STQF_I	-	%f7, [0x0001, %r4]
	normalw
	.word 0x9b458000  ! 632: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x93902006  ! 633: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
change_to_randtl_45:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902002  ! 634: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a289c8  ! 636: FDIVd	fdivd	%f10, %f8, %f48
	.word 0x8951c000  ! 637: RDPR_TL	rdpr	%tl, %r4
DS_46:
	.word 0x22800001  ! 639: BE	be,a	<label_0x1>
	pdist %f2, %f22, %f2
	.word 0xb1b60302  ! 638: ALLIGNADDRESS	alignaddr	%r24, %r2, %r24
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902847  ! 640: WRPR_PSTATE_I	wrpr	%r0, 0x0847, %pstate
	.word 0xa7a00571  ! 641: FSQRTq	fsqrt	
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 642: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe68008a0  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0x93902001  ! 644: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93d02032  ! 645: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x87902118  ! 646: WRPR_TT_I	wrpr	%r0, 0x0118, %tt
	.word 0xe62fc011  ! 647: STB_R	stb	%r19, [%r31 + %r17]
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 648: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 649: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x93902007  ! 650: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93d02032  ! 651: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x93902005  ! 652: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_47:
	.word 0x32800001  ! 654: BNE	bne,a	<label_0x1>
	.word 0x20800001  ! 654: BN	bn,a	<label_0x1>
	.word 0xd7100004  ! 654: LDQF_R	-	[%r0, %r4], %f11
	.word 0x83a1c822  ! 653: FADDs	fadds	%f7, %f2, %f1
	.word 0xc3e7c022  ! 654: CASA_I	casa	[%r31] 0x 1, %r2, %r1
	.word 0x8198201d  ! 655: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001d, %hpstate
	.word 0x87902022  ! 656: WRPR_TT_I	wrpr	%r0, 0x0022, %tt
	.word 0xa048000d  ! 657: MULX_R	mulx 	%r0, %r13, %r16
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x92f8c003  ! 659: SDIVcc_R	sdivcc 	%r3, %r3, %r9
	.word 0x8d902683  ! 660: WRPR_PSTATE_I	wrpr	%r0, 0x0683, %pstate
	.word 0x8d90241f  ! 661: WRPR_PSTATE_I	wrpr	%r0, 0x041f, %pstate
	.word 0x92d88003  ! 662: SMULcc_R	smulcc 	%r2, %r3, %r9
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 663: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd397e001  ! 664: LDQFA_I	-	[%r31, 0x0001], %f9
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 665: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa8d26001  ! 666: UMULcc_I	umulcc 	%r9, 0x0001, %r20
	.word 0x91d02033  ! 667: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe88008a0  ! 668: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0xb7a00544  ! 669: FSQRTd	fsqrt	
	.word 0x98c1e001  ! 670: ADDCcc_I	addccc 	%r7, 0x0001, %r12
	.word 0x91d02032  ! 671: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x98c52001  ! 672: ADDCcc_I	addccc 	%r20, 0x0001, %r12
	.word 0x93902006  ! 673: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d802004  ! 674: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x81982a8c  ! 675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8c, %hpstate
	.word 0xacdd000d  ! 676: SMULcc_R	smulcc 	%r20, %r13, %r22
	.word 0x36700001  ! 677: BPGE	<illegal instruction>
change_to_randtl_48:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 678: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902007  ! 679: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902000  ! 680: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02031  ! 681: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x879022d1  ! 682: WRPR_TT_I	wrpr	%r0, 0x02d1, %tt
	.word 0x8d902acf  ! 683: WRPR_PSTATE_I	wrpr	%r0, 0x0acf, %pstate
	.word 0x81982f5a  ! 684: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5a, %hpstate
	.word 0x8d9024d4  ! 685: WRPR_PSTATE_I	wrpr	%r0, 0x04d4, %pstate
	.word 0x83d02034  ! 686: Tcc_I	te	icc_or_xcc, %r0 + 52
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 687: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a50  ! 688: WRPR_PSTATE_I	wrpr	%r0, 0x0a50, %pstate
	.word 0xecd80e80  ! 689: LDXA_R	ldxa	[%r0, %r0] 0x74, %r22
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 690: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8fa01a71  ! 691: FqTOi	fqtoi	
	.word 0x93902002  ! 692: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902003  ! 693: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x96c46001  ! 694: ADDCcc_I	addccc 	%r17, 0x0001, %r11
	.word 0xd6ffc031  ! 695: SWAPA_R	swapa	%r11, [%r31 + %r17] 0x01
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d9020cc  ! 697: WRPR_PSTATE_I	wrpr	%r0, 0x00cc, %pstate
	.word 0x91a00579  ! 698: FSQRTq	fsqrt	
	.word 0x82d48017  ! 699: UMULcc_R	umulcc 	%r18, %r23, %r1
	.word 0x87802004  ! 700: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902002  ! 701: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902006  ! 702: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc2800b80  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r1
	.word 0x91d02032  ! 704: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8ad6e001  ! 705: UMULcc_I	umulcc 	%r27, 0x0001, %r5
	.word 0x87802080  ! 706: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9ad0e001  ! 707: UMULcc_I	umulcc 	%r3, 0x0001, %r13
	.word 0x91d02031  ! 708: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d802004  ! 709: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 710: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x86c4a001  ! 711: ADDCcc_I	addccc 	%r18, 0x0001, %r3
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87902255  ! 713: WRPR_TT_I	wrpr	%r0, 0x0255, %tt
	.word 0x8d902452  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x0452, %pstate
	.word 0x87902099  ! 715: WRPR_TT_I	wrpr	%r0, 0x0099, %tt
DS_49:
	.word 0x32800001  ! 717: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 717: BG	bg,a	<label_0x1>
	.word 0xb1a00557  ! 717: FSQRTd	fsqrt	
	.word 0x99a50827  ! 716: FADDs	fadds	%f20, %f7, %f12
	.word 0xacd34004  ! 717: UMULcc_R	umulcc 	%r13, %r4, %r22
	.word 0x91a0056d  ! 718: FSQRTq	fsqrt	
	.word 0x93902000  ! 719: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902652  ! 720: WRPR_PSTATE_I	wrpr	%r0, 0x0652, %pstate
	.word 0x81982043  ! 721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0043, %hpstate
	.word 0x8d9022c9  ! 722: WRPR_PSTATE_I	wrpr	%r0, 0x02c9, %pstate
	.word 0x8d902ec4  ! 723: WRPR_PSTATE_I	wrpr	%r0, 0x0ec4, %pstate
	.word 0x83a4c9ea  ! 724: FDIVq	dis not found

	.word 0x93902004  ! 725: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa5a1cd27  ! 726: FsMULd	fsmuld	%f7, %f38, %f18
	.word 0x879020f6  ! 727: WRPR_TT_I	wrpr	%r0, 0x00f6, %tt
	.word 0xe49004a0  ! 728: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 729: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 730: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8790219f  ! 731: WRPR_TT_I	wrpr	%r0, 0x019f, %tt
	.word 0xe527e001  ! 732: STF_I	st	%f18, [0x0001, %r31]
	.word 0x8d802000  ! 733: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802004  ! 734: WRASI_I	wr	%r0, 0x0004, %asi
change_to_randtl_50:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 735: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d9028c8  ! 736: WRPR_PSTATE_I	wrpr	%r0, 0x08c8, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 737: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x96d90005  ! 738: SMULcc_R	smulcc 	%r4, %r5, %r11
DS_51:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 739: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x83d02032  ! 740: Tcc_I	te	icc_or_xcc, %r0 + 50
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 741: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 742: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 743: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8efa2001  ! 744: SDIVcc_I	sdivcc 	%r8, 0x0001, %r7
	.word 0x84d24012  ! 745: UMULcc_R	umulcc 	%r9, %r18, %r2
	.word 0x8790238d  ! 746: WRPR_TT_I	wrpr	%r0, 0x038d, %tt
	.word 0x99514000  ! 747: RDPR_TBA	rdpr	%tba, %r12
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 748: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a5d  ! 749: WRPR_PSTATE_I	wrpr	%r0, 0x0a5d, %pstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 750: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_52:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 752: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd85fe001  ! 753: LDX_I	ldx	[%r31 + 0x0001], %r12
	.word 0xd8d804a0  ! 754: LDXA_R	ldxa	[%r0, %r0] 0x25, %r12
	.word 0x93d02032  ! 755: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x91d02033  ! 756: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8ba44dcc  ! 757: FdMULq	fdmulq	
	.word 0x96d4c015  ! 758: UMULcc_R	umulcc 	%r19, %r21, %r11
	.word 0x81982a42  ! 759: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a42, %hpstate
	.word 0xaba209e6  ! 760: FDIVq	dis not found

	.word 0x81982cc6  ! 761: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc6, %hpstate
	.word 0x81982408  ! 762: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0408, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 763: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb7508000  ! 764: RDPR_TSTATE	rdpr	%tstate, %r27
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 765: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819823de  ! 766: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03de, %hpstate
	.word 0x8d902e82  ! 767: WRPR_PSTATE_I	wrpr	%r0, 0x0e82, %pstate
	.word 0xa0d30017  ! 768: UMULcc_R	umulcc 	%r12, %r23, %r16
	.word 0xe0ffc037  ! 769: SWAPA_R	swapa	%r16, [%r31 + %r23] 0x01
	.word 0x20800001  ! 770: BN	bn,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa64c4002  ! 772: MULX_R	mulx 	%r17, %r2, %r19
DS_53:
	.word 0x32800001  ! 774: BNE	bne,a	<label_0x1>
	.word 0xd132000c  ! 774: STQF_R	-	%f8, [%r12, %r8]
	normalw
	.word 0x91458000  ! 773: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x819820c0  ! 774: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c0, %hpstate
	.word 0x8da0054d  ! 775: FSQRTd	fsqrt	
	.word 0x81982e9e  ! 776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9e, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 777: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790232e  ! 778: WRPR_TT_I	wrpr	%r0, 0x032e, %tt
	.word 0x83504000  ! 779: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0xc28008a0  ! 780: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xa3a18ddb  ! 781: FdMULq	fdmulq	
	.word 0x91d02033  ! 782: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_54:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 783: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902006  ! 784: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 785: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902108  ! 786: WRPR_TT_I	wrpr	%r0, 0x0108, %tt
	.word 0x8d902a9e  ! 787: WRPR_PSTATE_I	wrpr	%r0, 0x0a9e, %pstate
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 788: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa5b0cff5  ! 789: FONES	fones	%f18
	.word 0xe48008a0  ! 790: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe43fe001  ! 791: STD_I	std	%r18, [%r31 + 0x0001]
	.word 0x87902038  ! 792: WRPR_TT_I	wrpr	%r0, 0x0038, %tt
	.word 0xe4d004a0  ! 793: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
	.word 0x93902001  ! 794: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xacd6e001  ! 795: UMULcc_I	umulcc 	%r27, 0x0001, %r22
	.word 0x88c12001  ! 796: ADDCcc_I	addccc 	%r4, 0x0001, %r4
	.word 0x93902000  ! 797: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xb2d8c00c  ! 798: SMULcc_R	smulcc 	%r3, %r12, %r25
	.word 0x83d02034  ! 799: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xb5540000  ! 800: RDPR_GL	rdpr	%-, %r26
	.word 0x879022e4  ! 801: WRPR_TT_I	wrpr	%r0, 0x02e4, %tt
	.word 0x8d9020de  ! 802: WRPR_PSTATE_I	wrpr	%r0, 0x00de, %pstate
	.word 0x879021ed  ! 803: WRPR_TT_I	wrpr	%r0, 0x01ed, %tt
	.word 0x81982d0d  ! 804: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0d, %hpstate
	.word 0xa3480000  ! 805: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x9b6c8019  ! 806: SDIVX_R	sdivx	%r18, %r25, %r13
	.word 0xa9a01a66  ! 807: FqTOi	fqtoi	
	.word 0xb2de0017  ! 808: SMULcc_R	smulcc 	%r24, %r23, %r25
	.word 0xf2ffc037  ! 809: SWAPA_R	swapa	%r25, [%r31 + %r23] 0x01
	.word 0x8790237f  ! 810: WRPR_TT_I	wrpr	%r0, 0x037f, %tt
	.word 0x91d02035  ! 811: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 812: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902004  ! 813: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_55:
	.word 0x32800001  ! 815: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 815: BG	bg,a	<label_0x1>
	.word 0xe9104008  ! 815: LDQF_R	-	[%r1, %r8], %f20
	.word 0x95a0c82b  ! 814: FADDs	fadds	%f3, %f11, %f10
	.word 0x81982ac6  ! 815: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac6, %hpstate
	.word 0x8da000c3  ! 816: FNEGd	fnegd	%f34, %f6
change_to_randtl_56:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 817: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d50c000  ! 818: RDPR_TT	rdpr	%tt, %r6
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 819: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5a14d23  ! 820: FsMULd	fsmuld	%f5, %f34, %f18
	.word 0x3a800001  ! 821: BCC	bcc,a	<label_0x1>
	.word 0x8ba00d32  ! 822: FsMULd	fsmuld	%f0, %f18, %f36
	.word 0x8d902085  ! 823: WRPR_PSTATE_I	wrpr	%r0, 0x0085, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 824: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 825: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b6ac00a  ! 826: SDIVX_R	sdivx	%r11, %r10, %r5
DS_57:
	.word 0x20800001  ! 828: BN	bn,a	<label_0x1>
	.word 0xd9358000  ! 828: STQF_R	-	%f12, [%r0, %r22]
	normalw
	.word 0x99458000  ! 827: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0xd89fc020  ! 828: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x87802010  ! 829: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93d02031  ! 830: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x83d02035  ! 831: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 832: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90221c  ! 833: WRPR_PSTATE_I	wrpr	%r0, 0x021c, %pstate
	.word 0x87802089  ! 834: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902a13  ! 835: WRPR_PSTATE_I	wrpr	%r0, 0x0a13, %pstate
	.word 0xa1540000  ! 836: RDPR_GL	rdpr	%-, %r16
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 837: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790227e  ! 838: WRPR_TT_I	wrpr	%r0, 0x027e, %tt
	.word 0x93902004  ! 839: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 840: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_58:
	.word 0x20800001  ! 842: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 841: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x879020df  ! 842: WRPR_TT_I	wrpr	%r0, 0x00df, %tt
	.word 0x93702001  ! 843: POPC_I	popc	0x0001, %r9
	.word 0x826c800d  ! 844: UDIVX_R	udivx 	%r18, %r13, %r1
	.word 0x8d90224c  ! 845: WRPR_PSTATE_I	wrpr	%r0, 0x024c, %pstate
	.word 0x8d9022cd  ! 846: WRPR_PSTATE_I	wrpr	%r0, 0x02cd, %pstate
	.word 0x91d02030  ! 847: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xc28008a0  ! 848: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x99480000  ! 849: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x93902002  ! 850: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_59:
	.word 0x20800001  ! 852: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 851: SAVE_R	save	%r31, %r0, %r31
	.word 0x879023de  ! 852: WRPR_TT_I	wrpr	%r0, 0x03de, %tt
	.word 0x879023ff  ! 853: WRPR_TT_I	wrpr	%r0, 0x03ff, %tt
	.word 0x81982b0f  ! 854: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0f, %hpstate
	.word 0xd88008a0  ! 855: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x81a01a65  ! 856: FqTOi	fqtoi	
	.word 0x8d902e92  ! 857: WRPR_PSTATE_I	wrpr	%r0, 0x0e92, %pstate
DS_60:
	.word 0x20800001  ! 859: BN	bn,a	<label_0x1>
	illtrap
	.word 0xaba0054d  ! 859: FSQRTd	fsqrt	
	.word 0x87a24822  ! 858: FADDs	fadds	%f9, %f2, %f3
	.word 0x879022ec  ! 859: WRPR_TT_I	wrpr	%r0, 0x02ec, %tt
	.word 0xc737e001  ! 860: STQF_I	-	%f3, [0x0001, %r31]
	.word 0x9b494000  ! 861: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0xb150c000  ! 862: RDPR_TT	rdpr	%tt, %r24
	.word 0xf0dfe010  ! 863: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r24
	.word 0x93d02031  ! 864: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x91d02032  ! 865: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_tl1_61:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902456  ! 867: WRPR_PSTATE_I	wrpr	%r0, 0x0456, %pstate
	.word 0x81982009  ! 868: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0009, %hpstate
	.word 0x836c8016  ! 869: SDIVX_R	sdivx	%r18, %r22, %r1
	.word 0x8198205a  ! 870: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005a, %hpstate
	.word 0x819826d2  ! 871: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d2, %hpstate
	.word 0xa551c000  ! 872: RDPR_TL	rdpr	%tl, %r18
DS_62:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 873: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x879023dd  ! 874: WRPR_TT_I	wrpr	%r0, 0x03dd, %tt
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 875: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 876: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d802000  ! 877: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902075  ! 878: WRPR_TT_I	wrpr	%r0, 0x0075, %tt
	.word 0x8d90284e  ! 879: WRPR_PSTATE_I	wrpr	%r0, 0x084e, %pstate
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 880: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902006  ! 882: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02035  ! 883: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_63:
	.word 0x20800001  ! 885: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 884: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902003  ! 885: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xaf702001  ! 886: POPC_I	popc	0x0001, %r23
	.word 0x8790221c  ! 887: WRPR_TT_I	wrpr	%r0, 0x021c, %tt
DS_64:
	.word 0x20800001  ! 889: BN	bn,a	<label_0x1>
	.word 0xe734e001  ! 889: STQF_I	-	%f19, [0x0001, %r19]
	normalw
	.word 0xa7458000  ! 888: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x8790201f  ! 889: WRPR_TT_I	wrpr	%r0, 0x001f, %tt
	.word 0x81982f04  ! 890: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f04, %hpstate
	.word 0x81982c46  ! 891: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c46, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 892: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879020ca  ! 893: WRPR_TT_I	wrpr	%r0, 0x00ca, %tt
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 894: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe67fe001  ! 895: SWAP_I	swap	%r19, [%r31 + 0x0001]
	.word 0x91d02030  ! 896: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d480000  ! 897: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x8d802000  ! 898: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcc9004a0  ! 899: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
	.word 0x91d02032  ! 900: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_65:
	.word 0x20800001  ! 902: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 902: BN	bn,a	<label_0x1>
	.word 0x8fa0055a  ! 902: FSQRTd	fsqrt	
	.word 0x8da4c82a  ! 901: FADDs	fadds	%f19, %f10, %f6
	.word 0x87802089  ! 902: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902a18  ! 903: WRPR_PSTATE_I	wrpr	%r0, 0x0a18, %pstate
	.word 0x93902005  ! 904: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8790225e  ! 905: WRPR_TT_I	wrpr	%r0, 0x025e, %tt
	.word 0x8f690015  ! 906: SDIVX_R	sdivx	%r4, %r21, %r7
	.word 0x9b6e2001  ! 907: SDIVX_I	sdivx	%r24, 0x0001, %r13
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 908: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 909: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902a5f  ! 910: WRPR_PSTATE_I	wrpr	%r0, 0x0a5f, %pstate
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 911: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 912: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 913: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x85540000  ! 914: RDPR_GL	rdpr	%-, %r2
change_to_tl1_66:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87902128  ! 916: WRPR_TT_I	wrpr	%r0, 0x0128, %tt
	.word 0x879022d8  ! 917: WRPR_TT_I	wrpr	%r0, 0x02d8, %tt
	.word 0x8d902ac8  ! 918: WRPR_PSTATE_I	wrpr	%r0, 0x0ac8, %pstate
	.word 0xc48fe020  ! 919: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8198288c  ! 921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088c, %hpstate
	.word 0x87902142  ! 922: WRPR_TT_I	wrpr	%r0, 0x0142, %tt
	.word 0x879023c8  ! 923: WRPR_TT_I	wrpr	%r0, 0x03c8, %tt
	.word 0x91d02035  ! 924: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 925: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9ba2cd2a  ! 926: FsMULd	fsmuld	%f11, %f10, %f44
	.word 0x81982956  ! 927: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0956, %hpstate
	.word 0x8d902683  ! 928: WRPR_PSTATE_I	wrpr	%r0, 0x0683, %pstate
	.word 0x8790236d  ! 929: WRPR_TT_I	wrpr	%r0, 0x036d, %tt
	.word 0x8f902002  ! 505: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879022a8  ! 931: WRPR_TT_I	wrpr	%r0, 0x02a8, %tt
	.word 0x8d902c91  ! 932: WRPR_PSTATE_I	wrpr	%r0, 0x0c91, %pstate
	.word 0x8edec005  ! 933: SMULcc_R	smulcc 	%r27, %r5, %r7
DS_67:
	.word 0x34800001  ! 935: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 934: SAVE_R	save	%r31, %r0, %r31
	.word 0xa5b60ff5  ! 935: FONES	fones	%f18
	.word 0x2e800001  ! 936: BVS	bvs,a	<label_0x1>
	.word 0x93902002  ! 937: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902255  ! 938: WRPR_PSTATE_I	wrpr	%r0, 0x0255, %pstate
	.word 0x88d04013  ! 939: UMULcc_R	umulcc 	%r1, %r19, %r4
	.word 0x879022ed  ! 940: WRPR_TT_I	wrpr	%r0, 0x02ed, %tt
	.word 0x8d902615  ! 941: WRPR_PSTATE_I	wrpr	%r0, 0x0615, %pstate
	.word 0xc927c013  ! 942: STF_R	st	%f4, [%r19, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 945: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_68:
	.word 0x20800001  ! 947: BN	bn,a	<label_0x1>
	.word 0xcd320002  ! 947: STQF_R	-	%f6, [%r2, %r8]
	normalw
	.word 0xa9458000  ! 946: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x93902007  ! 947: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe89004a0  ! 948: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 949: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982c59  ! 950: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c59, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 951: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x86800014  ! 952: ADDcc_R	addcc 	%r0, %r20, %r3
	.word 0x83d02034  ! 953: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xc68008a0  ! 954: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8d902cd9  ! 955: WRPR_PSTATE_I	wrpr	%r0, 0x0cd9, %pstate
	.word 0xa750c000  ! 956: RDPR_TT	rdpr	%tt, %r19
	.word 0x8d802000  ! 957: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_69:
	.word 0x32800001  ! 959: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 959: BE	be,a	<label_0x1>
	.word 0x9ba00546  ! 959: FSQRTd	fsqrt	
	.word 0x8da0c82a  ! 958: FADDs	fadds	%f3, %f10, %f6
	.word 0xccdfe030  ! 959: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
	.word 0xa1500000  ! 960: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x856d001b  ! 961: SDIVX_R	sdivx	%r20, %r27, %r2
	.word 0x91d02030  ! 962: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93d02031  ! 963: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8d540000  ! 964: RDPR_GL	rdpr	%-, %r6
	.word 0xcd27c01b  ! 965: STF_R	st	%f6, [%r27, %r31]
	.word 0x91d02030  ! 966: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8bb10fe5  ! 967: FONES	fones	%f5
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 968: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 969: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8198254f  ! 970: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054f, %hpstate
	.word 0xcadfe030  ! 971: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r5
DS_70:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 972: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xca3fc005  ! 973: STD_R	std	%r5, [%r31 + %r5]
	.word 0x91a00574  ! 974: FSQRTq	fsqrt	
	.word 0xd137c014  ! 975: STQF_R	-	%f8, [%r20, %r31]
	.word 0xd137c014  ! 976: STQF_R	-	%f8, [%r20, %r31]
	.word 0xd137e001  ! 977: STQF_I	-	%f8, [0x0001, %r31]
	.word 0x99902005  ! 978: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xd0ffc034  ! 979: SWAPA_R	swapa	%r8, [%r31 + %r20] 0x01
	.word 0xd0800bc0  ! 980: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r8
	.word 0xb750c000  ! 981: RDPR_TT	rdpr	%tt, %r27
	.word 0x83514000  ! 982: RDPR_TBA	<illegal instruction>
	.word 0x93902003  ! 983: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802088  ! 984: WRASI_I	wr	%r0, 0x0088, %asi
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 985: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902255  ! 986: WRPR_PSTATE_I	wrpr	%r0, 0x0255, %pstate
	.word 0x83d02030  ! 987: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x91d02033  ! 988: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc21fc000  ! 989: LDD_R	ldd	[%r31 + %r0], %r1
	.word 0x93902007  ! 990: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99a000cd  ! 991: FNEGd	fnegd	%f44, %f12
	.word 0xd8880e40  ! 992: LDUBA_R	lduba	[%r0, %r0] 0x72, %r12
	.word 0xd8d7e030  ! 993: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r12
DS_71:
	.word 0x32800001  ! 995: BNE	bne,a	<label_0x1>
	pdist %f28, %f18, %f14
	.word 0xa5b1430d  ! 994: ALLIGNADDRESS	alignaddr	%r5, %r13, %r18
	.word 0x95a00d35  ! 995: FsMULd	fsmuld	%f0, %f52, %f10
	.word 0x8d902c52  ! 996: WRPR_PSTATE_I	wrpr	%r0, 0x0c52, %pstate
	.word 0x93902006  ! 997: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982217  ! 998: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0217, %hpstate


.global user_data_start
.data
user_data_start:
	.xword	0x40f483c724f2815a
	.xword	0x9e0b482cbc1f6ac1
	.xword	0x7ccb2b2c61f6fd8f
	.xword	0x15c04bc4343cd008
	.xword	0xacef69b3e1035304
	.xword	0x16a5a46dc78a5b51
	.xword	0xed56eb492eeba5d1
	.xword	0x733fcde8e7e9a85f
	.xword	0x67a8aa0530c3809d
	.xword	0x4d5d8ca9f82db92c
	.xword	0xb135e405419ad5cd
	.xword	0xf842ab18aad84a54
	.xword	0x2706b050149a34d2
	.xword	0x17cb9da9d29e7d06
	.xword	0x64a18e571ffee651
	.xword	0x6a6c911431892128
	.xword	0x55cabff3a397fe48
	.xword	0x89d8b175be9bdef1
	.xword	0x4a7214828dba3f07
	.xword	0x910a218296b985b6
	.xword	0xfdca5cd9c17a980f
	.xword	0x744897f411fde251
	.xword	0xdfb6386562fc553e
	.xword	0x5ae3e8d8bb737e93
	.xword	0x0d8305f9ccd30f36
	.xword	0x55370d407f2eefca
	.xword	0xdaa2bd94294cba08
	.xword	0xf030dd8d31a21dee
	.xword	0xa180971f9a56a9bc
	.xword	0xae0a69cc1ac2cb2e
	.xword	0x0fa85a3990cc5781
	.xword	0x64eab503a80de474
	.xword	0x24b8a7e3b245110a
	.xword	0xa4de535e1279420b
	.xword	0xe5e6c2ffb249bf2b
	.xword	0x53fd1ad918ce9a13
	.xword	0xc36eb18390f5ec7e
	.xword	0xd3d9f7f4d8358c55
	.xword	0x361f103d7d23b57e
	.xword	0x5c568d303673f067
	.xword	0xad07741b92a4a64a
	.xword	0xac7c0575e38cbd60
	.xword	0x8882acbfc032a6b3
	.xword	0xad000f0ffa49cc2b
	.xword	0x12870023d292fec8
	.xword	0x3db279d7e5aba599
	.xword	0xc4c5f02dca8c714e
	.xword	0x79e623de117baf59
	.xword	0x9c2321d97be85582
	.xword	0xee1d83fe008763bb
	.xword	0x9919396af5300906
	.xword	0x506d297e4f87679f
	.xword	0x133b85151aed6a44
	.xword	0x1918aa55e3744f63
	.xword	0x0f59dbef5b56e8c0
	.xword	0xccebff863b8f596c
	.xword	0x6c031f4c0b12f90f
	.xword	0x7a31abed540f21ea
	.xword	0x82d70f8e9c6c717e
	.xword	0x064688e91bc747e3
	.xword	0x3b8ea63b99e09d8d
	.xword	0x12b4c01e77046b08
	.xword	0x1bb7bbe4031ff1ef
	.xword	0x1394f4ee4be9280d
	.xword	0xa159b72ee017b260
	.xword	0xb110476c5c47c5ad
	.xword	0x68f1d51e2ad5b046
	.xword	0xbe1c54bfe86ec0df
	.xword	0x6cb049f2fc61c808
	.xword	0x0e02914f616aeb3a
	.xword	0x4e3f7e8be448d5d3
	.xword	0x7451acf4e17613a4
	.xword	0xc73852764c40fd44
	.xword	0x401d7bdbff283984
	.xword	0xaee37a5062b8b8aa
	.xword	0x803f277c4dac422f
	.xword	0xe355f6abb61431b2
	.xword	0xdb4b139afc2e8bbf
	.xword	0xed77a38ca629212b
	.xword	0x2d0a94e8d2289c47
	.xword	0x73f6c94153b8bb0d
	.xword	0x781b63f90fd21bc4
	.xword	0x6a79552cc530286c
	.xword	0xbca87f28d8a0d361
	.xword	0x35f93aee0f8e6928
	.xword	0xf66dc3badc3cf5c2
	.xword	0xae4120d5503bb5e2
	.xword	0x812fd44f6ddbe527
	.xword	0x6c03c424f61b2061
	.xword	0xe0fd3261ea0bf14f
	.xword	0xaca7471984dff96b
	.xword	0x39bfbc302a2ba342
	.xword	0x87e922224c863f95
	.xword	0xc91c8a8891708916
	.xword	0xa5909c5e7dda18e5
	.xword	0xed51461a89254357
	.xword	0xff8d9d805e487236
	.xword	0x2ce9c8173facd28e
	.xword	0xbf9fda8e596c091f
	.xword	0x95ac9823937b60f0
	.xword	0xd8e5849981f7dc6f
	.xword	0xfe4b189471b28c81
	.xword	0x521ef31dd28d1f3a
	.xword	0xc900659113ebd3a0
	.xword	0x24879f9f9a33195f
	.xword	0x857d26ea47be5c31
	.xword	0xdd526f2a71b000aa
	.xword	0xf1cadb8f85c2884f
	.xword	0x47900e9235817583
	.xword	0x84a5c7d3cc6f3922
	.xword	0xa69e748d71a0ab2d
	.xword	0x87d53cacf7100e35
	.xword	0xad402cb0c7b85804
	.xword	0x262e9461e6a18769
	.xword	0x3674f6ee4907462f
	.xword	0xe43de694e7abe3ff
	.xword	0xb5f792194cd72a07
	.xword	0x83bee6ec3c13fc4e
	.xword	0x26b9e9c67ae04e4b
	.xword	0xbfae821c88d1e162
	.xword	0x84ed9badb6d8b26d
	.xword	0xb391af02f9219bbe
	.xword	0x82479dacb2941e7a
	.xword	0xe2a3d41e817ee5a5
	.xword	0xfd148afedca2c1f8
	.xword	0xb37d7cc170214f9e
	.xword	0x7e4879b65cda6734
	.xword	0x65d47c81f11d66ed
	.xword	0x1f57c8c3f05d8809
	.xword	0x467329f0ab819f57
	.xword	0x8f7d62b290942266
	.xword	0x99ac30a63e7495ad
	.xword	0xa9aa26bdfc9e53e7
	.xword	0xe204a1e274856231
	.xword	0xc4e590368dfcc03c
	.xword	0x02789b1dfc732777
	.xword	0x630849acff7f9c87
	.xword	0xc8c88e25c9e8bed7
	.xword	0x81138a69745ee342
	.xword	0xf2f2ae3ab1987522
	.xword	0x347d4e1fa57ade56
	.xword	0x60cc7f0bbbd600f5
	.xword	0xa06b8482cfb3d5fc
	.xword	0x661b3bc5138c2216
	.xword	0x42ba70f99b81190f
	.xword	0xe17254167dba1267
	.xword	0xe1bf8230cf861f0f
	.xword	0x8c7067785832a6eb
	.xword	0xf96af0c5fb01c6e0
	.xword	0x8325e7530b1ce20e
	.xword	0xe89871979fb87fe4
	.xword	0xcef9ecfb0e12e462
	.xword	0x31f3a0d55b494774
	.xword	0xc8696a290741b410
	.xword	0x4cb286fb614fd05a
	.xword	0x33b0e1cb86e45f6a
	.xword	0xef56c23d3fcd9e3b
	.xword	0xf54bb28a3f90531f
	.xword	0x9ff06de690420ee9
	.xword	0x049e0af758801643
	.xword	0x42a18f60ccfb3a8d
	.xword	0x7a91457e0f40fec8
	.xword	0x5aa99ca31baf7578
	.xword	0x630f990cd529c1d7
	.xword	0x7cb610ba09e8cfff
	.xword	0xa3bdae822e31a551
	.xword	0x6d6c7f041b3d15fb
	.xword	0x14a0cb72657668ab
	.xword	0x71493245ab8ad5b9
	.xword	0x4d8e590ad7fc9dc2
	.xword	0x504e88834bc3e527
	.xword	0x8562564d7610ed30
	.xword	0xe5849e57242ddead
	.xword	0xe1bce679868b388e
	.xword	0x25ef660409d61523
	.xword	0x9d8f9bdb374c052f
	.xword	0xbd6a02d7fb13ac80
	.xword	0xc72305ecc19ab8c1
	.xword	0xa7a15da0ee0a619d
	.xword	0x88beef9a90faf3c1
	.xword	0x47d228a525995895
	.xword	0xe8580bdab98d5123
	.xword	0x9f2337d238001e26
	.xword	0x0a7efe19ec709fbe
	.xword	0x29118109696cf92a
	.xword	0x76dffad476b296e3
	.xword	0xd1a6dc3ee382ac94
	.xword	0xed6b530abf6e8f96
	.xword	0xfd0eb7b677a3a3e7
	.xword	0xb0efb83e7f996b50
	.xword	0xc25bdb19f2afe365
	.xword	0x80f8e255fe646da2
	.xword	0x2b2467c13a8c7720
	.xword	0xbbb0bb968fee1712
	.xword	0x6856a79c22dae7d3
	.xword	0x0f5ab7bc371c2406
	.xword	0xd6035260fece67be
	.xword	0x95936652d597f131
	.xword	0x1f596237fda5b716
	.xword	0x643cbc60e96ab979
	.xword	0x2e0e9c6fac2d17c4
	.xword	0xd7bbdbe0bde49029
	.xword	0x7ebf1361b4dc98f8
	.xword	0x1a571963e0f36a20
	.xword	0xfc46c09a821b4a25
	.xword	0x5c0ac78dc021181b
	.xword	0x38b4327e47dc8c41
	.xword	0xece58bc748fded4d
	.xword	0x2b3535d8c69eec98
	.xword	0x3770e48d06fedd5e
	.xword	0xd8fe22f421ad142c
	.xword	0x0d05b12645aefa25
	.xword	0x4124e4f6a97c49bc
	.xword	0xbb34bfb200df432c
	.xword	0xee0a9595dc804bbf
	.xword	0x79b025aaa3f30cc0
	.xword	0xe050b17f13af3601
	.xword	0x3751ab24d51af8e5
	.xword	0x74f3efaac5295238
	.xword	0x839d41bfaacbbb01
	.xword	0x3d2e30678a8ba09f
	.xword	0xab3f5f926fa38c26
	.xword	0x04259d7387b3b0e8
	.xword	0xeae5f513cfe8e889
	.xword	0xdaafc699f4a38578
	.xword	0xb418b2d0af3f4e5e
	.xword	0x7381404768e4b00a
	.xword	0x92bc5969e09bed71
	.xword	0x9ac552481aa06286
	.xword	0x6ef48628ea0b02d4
	.xword	0xa821b4de365e45c5
	.xword	0xcef5ff201ef2d540
	.xword	0x9b4381feb227de58
	.xword	0x66d0e83d09b6bff8
	.xword	0x8a075d990f5befad
	.xword	0x1a530b3ead5fe900
	.xword	0x735a72866d33788a
	.xword	0x7e13c3c9c9820cbe
	.xword	0xbfeecc87669359a6
	.xword	0x537eff667f28baf2
	.xword	0x349772e1ba01a704
	.xword	0x30ae4bc40780265c
	.xword	0x874af1ce51913358
	.xword	0x26e304ab4ab7678e
	.xword	0x9ccbfaf1b0143b32
	.xword	0xd6b15ac76aeedbca
	.xword	0x426aa35bfd54d1ae
	.xword	0x225f9c6be08d0ede
	.xword	0x07ab3a1025f33590
	.xword	0x4b6582e141d8c330
	.xword	0x29f6a143c4cbf7fe
	.xword	0x8bc19f568b637035
	.xword	0xc905edad78e2fadb
	.xword	0x12810caf7c936785
	.xword	0x7ea0cfbdd88594ad
	.xword	0xcc235ec42bff9d63


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Wed Apr 14 12:02:08 2004
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
!!#     IJ_bind_thread_group("diag.j", 34, th0, 0x01);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 37, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     IJ_set_rvar("diag.j", 40, Rv_pdist_reg,"5'brrrr0");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!# 
!!#     IJ_set_ropr_fld("diag.j", 48, ijdefault, Ft_Rs1, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 49, ijdefault, Ft_Rs2, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 50, ijdefault, Ft_Rd, "{0..13,16..27}");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 53, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 56, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 57, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 60, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x16, 0x80, 0x88}");
!!#     IJ_set_ropr_fld("diag.j", 61, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 62, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 63, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 65, Ro_nontrap_ldasi_z, Ft_Imm_Asi, "{0x45, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 66, Ro_nontrap_ldasi_z, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 67, Ro_nontrap_ldasi_z, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 68, Ro_nontrap_ldasi_z, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 71, Ro_nontrap_ld, Fm_align_Simm13, "{0x0..0x6:5,0x7:1}");
!!#     IJ_set_ropr_fld("diag.j", 72, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 73, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 76, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 77, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 78, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 79, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     //IJ_set_ropr_fld(Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_ropr_fld("diag.j", 83, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35}");
!!#     IJ_set_ropr_fld("diag.j", 84, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 85, Ro_traps_i, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 86, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 87, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 88, Ro_traps_r, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 89, Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     //IJ_set_ropr_fld(Ro_traps_r, Ft_Simm13, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_rvar("diag.j", 91, Rv_init_trap, "{0x30..0x35}");
!!#     //IJ_set_rvar(Rv_init_trap, "{0x30..0x35, 0xb0..0xb5}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 95, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 96, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Pstate splash
!!#     IJ_set_ropr_fld("diag.j", 99, Ro_wrpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 100, Ro_wrpstate, Ft_Simm13, "12'b0rrr0rr0rrrrr");
!!# 
!!#     // Hpstate splash
!!#     IJ_set_ropr_fld("diag.j", 103, Ro_wrhpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 104, Ro_wrhpstate, Ft_Simm13, "12'brrrrrr0rrrrr");
!!# 
!!#     // TT splash
!!#     IJ_set_ropr_fld("diag.j", 107, Ro_wrtt, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 108, Ro_wrtt, Ft_Simm13, "10'brrrrrrrrrr");
!!# 
!!#     // GL splash
!!#     IJ_set_ropr_fld("diag.j", 111, Ro_wrgl, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 112, Ro_wrgl, Ft_Simm13, "4'brrrr");
!!# 
!!#     // TL splash
!!#     IJ_set_ropr_fld("diag.j", 115, Ro_tl, Ft_Simm13, "{0..5}");
!!#     IJ_set_ropr_fld("diag.j", 116, Ro_tl, Ft_Rs1,    "{0}");
!!# 
!!#     // CWP splash
!!#     IJ_set_ropr_fld("diag.j", 119, Ro_wrcwp, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 120, Ro_wrcwp, Ft_Simm13, "3'brrr");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 122, Ro_save_restore, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 123, Ro_save_restore, Ft_Rd,  "{31}");
!!#     IJ_set_ropr_fld("diag.j", 124, Ro_save_restore, Ft_Rs2, "{0}");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 126, Ro_winops, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 127, Ro_winops, Ft_Simm13, "{0..5}");
!!# 
!!#     // Weights
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 130,"{10}");
!!#     IJ_set_rvar("diag.j", 131, wt_high, "{90}");
!!#     IJ_set_rvar("diag.j", 132, wt_med,  "{40}");
!!#     IJ_set_rvar("diag.j", 133, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 137, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<7; k++) {
!!#         for (i = 0; i < 30; i++) {
!!#             if (i==15) {
!!#                 IJ_printf  ("diag.j", 141, th0,"\tmov %%r31, %%r15\n");
!!#                 continue;
!!#             }
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 145, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 147, th0,"\tmov 0x%rx, %%r14\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 148, th0,"\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 149, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 152, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 155, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 158, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
!!#     }
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#     int i;
!!#     IJ_printf  ("diag.j", 164, th0,"\n\n.global user_data_start\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 166, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
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
!!#         IJ_generate ("diag.j", 806, th0, $2);
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
!!#         //| splash_gl     %rvar wt_med
!!#         | splash_tt     %rvar  wt_med
!!#         | stores        %rvar  wt_low
!!#         //| sir           %rvar wt_low
!!# ;
!!# 
!!# sir : tSIR ;
!!# 
!!# change_mode :   
!!#       tCHANGE_NONPRIV 
!!#     | tCHANGE_NONHPRIV
!!#     | tCHANGE_HPRIV 
!!#     | tCHANGE_PRIV 
!!#     | change_to_tl1
!!#     | change_to_randtl
!!#     | tCHANGE_TO_TL0 
!!# ;
!!# 
!!# change_to_randtl: tWRPR_TL_I %ropr  Ro_tl
!!#     {
!!#         IJ_printf("diag.j", 844, th0, "change_to_randtl_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_set_ropr_fld("diag.j", 846, Ro_tl, Ft_Simm13, "{3..5}");
!!#             IJ_generate_from_token("diag.j", 847,1, th0, ijdefault, tCHANGE_HPRIV, -1);;
!!#         } else {
!!#             IJ_set_ropr_fld("diag.j", 849, Ro_tl, Ft_Simm13, "{0..2}");
!!#             IJ_generate_from_token("diag.j", 850,1, th0, ijdefault, tCHANGE_PRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_tl1 : tCHANGE_TO_TL1
!!#     {
!!#         IJ_printf("diag.j", 858, th0, "change_to_tl1_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 860, th0, "\tta T_CHANGE_HPRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 862, th0, "\tta T_CHANGE_PRIV\n");
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
!!#         IJ_printf("diag.j", 910, th0, "\totherw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      } else {
!!#         IJ_printf("diag.j", 912, th0, "\tinvalw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!#      tSMULcc_R | tSDIVX_R | tSDIVX_I |  tUDIVX_R |
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
!!#         IJ_printf("diag.j", 997, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 998,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 999,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 1000, th0, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 1004, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 1005,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 1007,1, th0, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 1009, th0, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 1011, th0, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 1016, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 1017,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 1019, th0, "\tilltrap\n");
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 1021,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 1023,1, th0, ijdefault, tFSQRTd, tLDQF_R, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 1030, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 1031,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 1035, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 1036,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 1040, th0, "DS_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 1041, th0, "\tnop\n\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 1042, th0, "\tjmp %%g2\n");
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

