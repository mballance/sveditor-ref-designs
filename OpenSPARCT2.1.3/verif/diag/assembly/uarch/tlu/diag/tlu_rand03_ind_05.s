/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand03_ind_05.s
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
	mov 0x30, %r14
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
	mov 0x35, %r14
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
	mov 0x33, %r14
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
	.word 0x87a149e8  ! 1: FDIVq	dis not found

	.word 0x24700001  ! 2: BPLE	<illegal instruction>
	.word 0x8790224a  ! 3: WRPR_TT_I	wrpr	%r0, 0x024a, %tt
	.word 0xc647e001  ! 4: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x81982247  ! 5: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0247, %hpstate
	.word 0x8790235c  ! 6: WRPR_TT_I	wrpr	%r0, 0x035c, %tt
	.word 0x95a0055b  ! 7: FSQRTd	fsqrt	
	.word 0x93902001  ! 8: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x85514000  ! 9: RDPR_TBA	rdpr	%tba, %r2
	.word 0x8d902886  ! 10: WRPR_PSTATE_I	wrpr	%r0, 0x0886, %pstate
	.word 0x93902003  ! 11: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902006  ! 12: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8790230b  ! 13: WRPR_TT_I	wrpr	%r0, 0x030b, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x8198298e  ! 15: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098e, %hpstate
	.word 0x81982153  ! 16: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0153, %hpstate
	.word 0x81982dd9  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd9, %hpstate
	.word 0x93902004  ! 18: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_0:
	.word 0x22800001  ! 20: BE	be,a	<label_0x1>
	allclean
	.word 0x83b44311  ! 19: ALLIGNADDRESS	alignaddr	%r17, %r17, %r1
DS_1:
	.word 0x32800001  ! 21: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 20: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1494000  ! 21: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0x8790206e  ! 22: WRPR_TT_I	wrpr	%r0, 0x006e, %tt
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 23: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_2:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 24: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xa9500000  ! 27: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x89494000  ! 28: RDHPR_HTBA	rdhpr	%htba, %r4
DS_3:
	.word 0x22800001  ! 30: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 29: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02035  ! 30: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x819828cc  ! 31: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cc, %hpstate
	.word 0x8d90281e  ! 32: WRPR_PSTATE_I	wrpr	%r0, 0x081e, %pstate
	.word 0x8d9026dc  ! 33: WRPR_PSTATE_I	wrpr	%r0, 0x06dc, %pstate
	.word 0x8d9022c3  ! 34: WRPR_PSTATE_I	wrpr	%r0, 0x02c3, %pstate
	.word 0x8790207c  ! 35: WRPR_TT_I	wrpr	%r0, 0x007c, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 36: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xad702001  ! 37: POPC_I	popc	0x0001, %r22
DS_4:
	.word 0x22800001  ! 39: BE	be,a	<label_0x1>
	pdist %f14, %f12, %f28
	.word 0x89b6c304  ! 38: ALLIGNADDRESS	alignaddr	%r27, %r4, %r4
	.word 0xa9a4c9a2  ! 39: FDIVs	fdivs	%f19, %f2, %f20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa190200f  ! 41: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x93902003  ! 42: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 43: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 44: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa7694017  ! 45: SDIVX_R	sdivx	%r5, %r23, %r19
	.word 0x87902104  ! 46: WRPR_TT_I	wrpr	%r0, 0x0104, %tt
DS_5:
	.word 0x34800001  ! 48: BG	bg,a	<label_0x1>
	.word 0xf132a001  ! 48: STQF_I	-	%f24, [0x0001, %r10]
	normalw
	.word 0x91458000  ! 47: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x93d02032  ! 48: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd0d004a0  ! 49: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r8
	.word 0xa1902002  ! 50: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8ba00573  ! 51: FSQRTq	fsqrt	
	.word 0xcad7e010  ! 52: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r5
	.word 0x87902292  ! 53: WRPR_TT_I	wrpr	%r0, 0x0292, %tt
	.word 0x91d02031  ! 54: Tcc_I	ta	icc_or_xcc, %r0 + 49
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 55: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 56: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8f494000  ! 57: RDHPR_HTBA	rdhpr	%htba, %r7
DS_6:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 58: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xa9a609e6  ! 59: FDIVq	dis not found

	.word 0x81982ec7  ! 60: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec7, %hpstate
	.word 0xe87fe001  ! 61: SWAP_I	swap	%r20, [%r31 + 0x0001]
	.word 0x8d802004  ! 62: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xb0dd0000  ! 63: SMULcc_R	smulcc 	%r20, %r0, %r24
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 64: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 65: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f802001  ! 66: SIR	sir	0x0001
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 67: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902005  ! 68: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8efe400c  ! 69: SDIVcc_R	sdivcc 	%r25, %r12, %r7
	.word 0x8d902cda  ! 70: WRPR_PSTATE_I	wrpr	%r0, 0x0cda, %pstate
	.word 0xa1902003  ! 71: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8198228b  ! 72: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028b, %hpstate
	.word 0x8d802004  ! 73: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xb1a00547  ! 74: FSQRTd	fsqrt	
	.word 0x91540000  ! 75: RDPR_GL	rdpr	%-, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902694  ! 77: WRPR_PSTATE_I	wrpr	%r0, 0x0694, %pstate
	.word 0x93902000  ! 78: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_7:
	.word 0x34800001  ! 80: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 79: SAVE_R	save	%r31, %r0, %r31
	.word 0x9ad1c012  ! 80: UMULcc_R	umulcc 	%r7, %r18, %r13
	.word 0x91d02033  ! 81: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d90289a  ! 82: WRPR_PSTATE_I	wrpr	%r0, 0x089a, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91d02032  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xda7fe001  ! 85: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0xdad80e80  ! 86: LDXA_R	ldxa	[%r0, %r0] 0x74, %r13
	.word 0x9f802001  ! 87: SIR	sir	0x0001
change_to_randtl_8:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 88: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x81982310  ! 89: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0310, %hpstate
	.word 0x9b540000  ! 90: RDPR_GL	rdpr	%-, %r13
	.word 0x93902005  ! 91: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902003  ! 92: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982618  ! 93: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0618, %hpstate
	.word 0x93902004  ! 94: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xdacfe000  ! 95: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x90f96001  ! 97: SDIVcc_I	sdivcc 	%r5, 0x0001, %r8
	.word 0xa1902002  ! 98: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902001  ! 99: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_9:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 100: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_10:
	.word 0x32800001  ! 102: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 101: SAVE_R	save	%r31, %r0, %r31
	.word 0x87802089  ! 102: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_NONPRIV	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 104: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 105: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 106: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 107: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902000  ! 108: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91a0054d  ! 109: FSQRTd	fsqrt	
change_to_tl1_11:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x83d02031  ! 111: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x8d9026c7  ! 112: WRPR_PSTATE_I	wrpr	%r0, 0x06c7, %pstate
	.word 0xa1902001  ! 113: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802004  ! 115: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902000  ! 116: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d902445  ! 117: WRPR_PSTATE_I	wrpr	%r0, 0x0445, %pstate
DS_12:
	.word 0x34800001  ! 119: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 118: SAVE_R	save	%r31, %r0, %r31
	.word 0x81982b49  ! 119: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b49, %hpstate
	.word 0x81982ac5  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac5, %hpstate
	.word 0xa190200c  ! 121: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x879023e9  ! 122: WRPR_TT_I	wrpr	%r0, 0x03e9, %tt
	.word 0x93902005  ! 123: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_13:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 124: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x83d02035  ! 125: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa1902003  ! 126: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x879022f8  ! 127: WRPR_TT_I	wrpr	%r0, 0x02f8, %tt
	.word 0xd0c804a0  ! 128: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0x879021db  ! 129: WRPR_TT_I	wrpr	%r0, 0x01db, %tt
	.word 0x87902292  ! 130: WRPR_TT_I	wrpr	%r0, 0x0292, %tt
	.word 0x83d02035  ! 131: Tcc_I	te	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02030  ! 133: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x819820d8  ! 134: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d8, %hpstate
	.word 0x8d9020c1  ! 135: WRPR_PSTATE_I	wrpr	%r0, 0x00c1, %pstate
	.word 0xa1902004  ! 136: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x879023af  ! 137: WRPR_TT_I	wrpr	%r0, 0x03af, %tt
DS_14:
	.word 0x20800001  ! 139: BN	bn,a	<label_0x1>
	illtrap
	.word 0xf3140009  ! 139: LDQF_R	-	[%r16, %r9], %f25
	.word 0x83a0082a  ! 138: FADDs	fadds	%f0, %f10, %f1
	.word 0xc28008a0  ! 139: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc25fc000  ! 140: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xafb08fed  ! 141: FONES	fones	%f23
	.word 0xad480000  ! 142: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0xada01a67  ! 143: FqTOi	fqtoi	
	.word 0x84498001  ! 144: MULX_R	mulx 	%r6, %r1, %r2
	.word 0xa1902009  ! 145: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902007  ! 146: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x879020bc  ! 147: WRPR_TT_I	wrpr	%r0, 0x00bc, %tt
	.word 0x819821d9  ! 148: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d9, %hpstate
	.word 0xc48008a0  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc40fe001  ! 150: LDUB_I	ldub	[%r31 + 0x0001], %r2
	.word 0x876b2001  ! 151: SDIVX_I	sdivx	%r12, 0x0001, %r3
	.word 0xb2804003  ! 152: ADDcc_R	addcc 	%r1, %r3, %r25
	.word 0xf337c003  ! 153: STQF_R	-	%f25, [%r3, %r31]
	.word 0x81982d15  ! 154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d15, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 156: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xf28fe010  ! 157: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r25
	.word 0xb26de001  ! 158: UDIVX_I	udivx 	%r23, 0x0001, %r25
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 159: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf2cfe000  ! 160: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r25
	.word 0x26700001  ! 161: BPL	<illegal instruction>
	.word 0x95514000  ! 162: RDPR_TBA	rdpr	%tba, %r10
	.word 0x8ef98007  ! 163: SDIVcc_R	sdivcc 	%r6, %r7, %r7
	.word 0x97508000  ! 164: RDPR_TSTATE	rdpr	%tstate, %r11
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 165: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa5a00574  ! 166: FSQRTq	fsqrt	
DS_15:
	.word 0x22800001  ! 168: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 167: RESTORE_R	restore	%r31, %r0, %r31
DS_16:
	.word 0x20800001  ! 169: BN	bn,a	<label_0x1>
	pdist %f10, %f16, %f22
	.word 0x8bb20308  ! 168: ALLIGNADDRESS	alignaddr	%r8, %r8, %r5
	.word 0x8790232d  ! 169: WRPR_TT_I	wrpr	%r0, 0x032d, %tt
	.word 0x916ca001  ! 170: SDIVX_I	sdivx	%r18, 0x0001, %r8
	.word 0x91d02035  ! 171: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982801  ! 173: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0801, %hpstate
	.word 0x2a700001  ! 174: BPCS	<illegal instruction>
	.word 0x904d8004  ! 175: MULX_R	mulx 	%r22, %r4, %r8
	.word 0x9f802001  ! 176: SIR	sir	0x0001
	.word 0x8d90204c  ! 177: WRPR_PSTATE_I	wrpr	%r0, 0x004c, %pstate
	.word 0x95a449b4  ! 178: FDIVs	fdivs	%f17, %f20, %f10
	.word 0x819829cc  ! 179: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cc, %hpstate
	.word 0x87802089  ! 180: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902a45  ! 181: WRPR_PSTATE_I	wrpr	%r0, 0x0a45, %pstate
	.word 0x93902000  ! 182: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902004  ! 183: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02035  ! 184: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87a1cdcd  ! 185: FdMULq	fdmulq	
	.word 0xafa6cd3a  ! 186: FsMULd	fsmuld	%f27, %f26, %f54
	.word 0x93902004  ! 187: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_NONPRIV	! macro
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 189: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819825d3  ! 190: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d3, %hpstate
	.word 0x95a00565  ! 191: FSQRTq	fsqrt	
	.word 0x84fae001  ! 192: SDIVcc_I	sdivcc 	%r11, 0x0001, %r2
	.word 0xc48008a0  ! 193: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x82d30008  ! 194: UMULcc_R	umulcc 	%r12, %r8, %r1
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 195: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91494000  ! 196: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x91d02032  ! 197: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87902110  ! 198: WRPR_TT_I	wrpr	%r0, 0x0110, %tt
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 199: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200d  ! 200: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d902a55  ! 201: WRPR_PSTATE_I	wrpr	%r0, 0x0a55, %pstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 202: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879020d8  ! 203: WRPR_TT_I	wrpr	%r0, 0x00d8, %tt
	.word 0x879023a7  ! 204: WRPR_TT_I	wrpr	%r0, 0x03a7, %tt
	.word 0x8d902882  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x0882, %pstate
	.word 0xd137c008  ! 206: STQF_R	-	%f8, [%r8, %r31]
	.word 0x8d802004  ! 207: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902003  ! 208: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902007  ! 209: WRPR_GL_I	wrpr	%r0, 0x0007, %-
DS_17:
	.word 0x20800001  ! 211: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 210: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa190200d  ! 211: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	ta	T_CHANGE_NONPRIV	! macro
DS_18:
	.word 0x22800001  ! 214: BE	be,a	<label_0x1>
	.word 0xed366001  ! 214: STQF_I	-	%f22, [0x0001, %r25]
	normalw
	.word 0x8f458000  ! 213: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x83d02035  ! 214: Tcc_I	te	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02034  ! 216: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982508  ! 218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0508, %hpstate
	.word 0xa190200f  ! 219: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 220: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982502  ! 221: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0502, %hpstate
	.word 0x93902000  ! 222: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x85a5c9c3  ! 223: FDIVd	fdivd	%f54, %f34, %f2
	.word 0xc4bfc023  ! 224: STDA_R	stda	%r2, [%r31 + %r3] 0x01
DS_19:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 225: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x96fb0000  ! 226: SDIVcc_R	sdivcc 	%r12, %r0, %r11
	.word 0x8d902e59  ! 227: WRPR_PSTATE_I	wrpr	%r0, 0x0e59, %pstate
	.word 0x8d9020cc  ! 228: WRPR_PSTATE_I	wrpr	%r0, 0x00cc, %pstate
	.word 0x81982d00  ! 229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d00, %hpstate
	.word 0x8d90209f  ! 230: WRPR_PSTATE_I	wrpr	%r0, 0x009f, %pstate
	.word 0xb1a489f3  ! 231: FDIVq	dis not found

	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 232: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x976d4008  ! 234: SDIVX_R	sdivx	%r21, %r8, %r11
	.word 0x8198291b  ! 235: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091b, %hpstate
	.word 0x91d02031  ! 236: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902002  ! 237: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x34800001  ! 238: BG	bg,a	<label_0x1>
	.word 0x81982802  ! 239: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
	.word 0x9afc8009  ! 240: SDIVcc_R	sdivcc 	%r18, %r9, %r13
	.word 0x3a700001  ! 241: BPCC	<illegal instruction>
	.word 0x91d02032  ! 242: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902000  ! 243: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879021d2  ! 244: WRPR_TT_I	wrpr	%r0, 0x01d2, %tt
	.word 0x81982c53  ! 245: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c53, %hpstate
	.word 0x8d9024d6  ! 246: WRPR_PSTATE_I	wrpr	%r0, 0x04d6, %pstate
	.word 0x8d902054  ! 247: WRPR_PSTATE_I	wrpr	%r0, 0x0054, %pstate
change_to_randtl_20:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 248: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x83d02030  ! 249: Tcc_I	te	icc_or_xcc, %r0 + 48
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 250: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198268d  ! 251: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068d, %hpstate
	.word 0xa248801b  ! 252: MULX_R	mulx 	%r2, %r27, %r17
	.word 0x8d802000  ! 253: WRFPRS_I	wr	%r0, 0x0000, %fprs
change_to_tl1_21:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902296  ! 255: WRPR_PSTATE_I	wrpr	%r0, 0x0296, %pstate
	.word 0x81982e58  ! 256: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e58, %hpstate
	.word 0x95a309ab  ! 257: FDIVs	fdivs	%f12, %f11, %f10
	.word 0xa5a000d9  ! 258: FNEGd	fnegd	%f56, %f18
	.word 0x91d02030  ! 259: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xb750c000  ! 260: RDPR_TT	rdpr	%tt, %r27
	.word 0x93902005  ! 261: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_22:
	.word 0x22800001  ! 263: BE	be,a	<label_0x1>
	illtrap
	.word 0xada00541  ! 263: FSQRTd	fsqrt	
	.word 0x85a50825  ! 262: FADDs	fadds	%f20, %f5, %f2
	.word 0x98d80008  ! 263: SMULcc_R	smulcc 	%r0, %r8, %r12
	.word 0x8d902610  ! 264: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 265: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 266: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902607  ! 267: WRPR_PSTATE_I	wrpr	%r0, 0x0607, %pstate
	.word 0xd9e7c028  ! 268: CASA_I	casa	[%r31] 0x 1, %r8, %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982f15  ! 270: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f15, %hpstate
	.word 0x8d9026c3  ! 271: WRPR_PSTATE_I	wrpr	%r0, 0x06c3, %pstate
	.word 0x8d802000  ! 272: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x86806001  ! 273: ADDcc_I	addcc 	%r1, 0x0001, %r3
	.word 0xa1902003  ! 274: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x819824cb  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cb, %hpstate
	.word 0x8d802000  ! 276: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87a0054c  ! 277: FSQRTd	fsqrt	
	.word 0xa1902003  ! 278: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xb6f94000  ! 279: SDIVcc_R	sdivcc 	%r5, %r0, %r27
	.word 0x8281001b  ! 280: ADDcc_R	addcc 	%r4, %r27, %r1
	.word 0x879021eb  ! 281: WRPR_TT_I	wrpr	%r0, 0x01eb, %tt
	.word 0xa1902008  ! 282: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d802000  ! 283: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 285: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902007  ! 286: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xc327c01b  ! 287: STF_R	st	%f1, [%r27, %r31]
	.word 0x81982209  ! 288: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0209, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02030  ! 290: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x879022a3  ! 291: WRPR_TT_I	wrpr	%r0, 0x02a3, %tt
	.word 0x819822c0  ! 292: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c0, %hpstate
	.word 0x81982349  ! 293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0349, %hpstate
	.word 0x879022d1  ! 294: WRPR_TT_I	wrpr	%r0, 0x02d1, %tt
	.word 0xa9a109cc  ! 295: FDIVd	fdivd	%f4, %f12, %f20
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 296: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_23:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x83d02034  ! 298: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d500000  ! 299: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x93902003  ! 300: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982a19  ! 301: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a19, %hpstate
	.word 0xcc8008a0  ! 302: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x879021de  ! 303: WRPR_TT_I	wrpr	%r0, 0x01de, %tt
	.word 0x3a800001  ! 304: BCC	bcc,a	<label_0x1>
	.word 0x90806001  ! 305: ADDcc_I	addcc 	%r1, 0x0001, %r8
	.word 0x99902003  ! 306: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x81494000  ! 307: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0x879022d0  ! 308: WRPR_TT_I	wrpr	%r0, 0x02d0, %tt
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 311: SIR	sir	0x0001
	.word 0x87902091  ! 312: WRPR_TT_I	wrpr	%r0, 0x0091, %tt
	.word 0x8198285a  ! 313: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085a, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982682  ! 315: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0682, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 316: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982908  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0908, %hpstate
	.word 0x91d02032  ! 318: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93d02030  ! 319: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x87902274  ! 320: WRPR_TT_I	wrpr	%r0, 0x0274, %tt
	.word 0x8d902e4f  ! 321: WRPR_PSTATE_I	wrpr	%r0, 0x0e4f, %pstate
	.word 0x81982581  ! 322: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0581, %hpstate
	.word 0xb5494000  ! 323: RDHPR_HTBA	rdhpr	%htba, %r26
	.word 0x87802080  ! 324: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02031  ! 325: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x84690001  ! 326: UDIVX_R	udivx 	%r4, %r1, %r2
	.word 0x8d902adb  ! 327: WRPR_PSTATE_I	wrpr	%r0, 0x0adb, %pstate
	.word 0x8d802000  ! 328: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902a94  ! 329: WRPR_PSTATE_I	wrpr	%r0, 0x0a94, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902000  ! 331: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d902290  ! 332: WRPR_PSTATE_I	wrpr	%r0, 0x0290, %pstate
	.word 0xc4c7e030  ! 333: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
	.word 0x81982b9b  ! 334: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9b, %hpstate
DS_24:
	.word 0x32800001  ! 336: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xada0054b  ! 336: FSQRTd	fsqrt	
	.word 0x95a5082c  ! 335: FADDs	fadds	%f20, %f12, %f10
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 336: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90268e  ! 337: WRPR_PSTATE_I	wrpr	%r0, 0x068e, %pstate
	.word 0x879022f2  ! 338: WRPR_TT_I	wrpr	%r0, 0x02f2, %tt
DS_25:
	.word 0x22800001  ! 340: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 339: SAVE_R	save	%r31, %r0, %r31
DS_26:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 340: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x87802014  ! 341: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa3702001  ! 342: POPC_I	popc	0x0001, %r17
	.word 0xa1902009  ! 343: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xe327e001  ! 344: STF_I	st	%f17, [0x0001, %r31]
	.word 0x8198228c  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028c, %hpstate
	.word 0x9f802001  ! 346: SIR	sir	0x0001
	.word 0x95500000  ! 347: RDPR_TPC	rdpr	%tpc, %r10
	.word 0xa190200c  ! 348: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x83514000  ! 349: RDPR_TBA	rdpr	%tba, %r1
change_to_tl1_27:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x2e700001  ! 351: BPVS	<illegal instruction>
	.word 0x8d50c000  ! 352: RDPR_TT	rdpr	%tt, %r6
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 353: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1a24dd2  ! 354: FdMULq	fdmulq	
	.word 0xa190200b  ! 355: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x9b504000  ! 356: RDPR_TNPC	rdpr	%tnpc, %r13
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9550c000  ! 358: RDPR_TT	rdpr	%tt, %r10
	.word 0x89a589a6  ! 359: FDIVs	fdivs	%f22, %f6, %f4
	.word 0x8d9020c3  ! 360: WRPR_PSTATE_I	wrpr	%r0, 0x00c3, %pstate
change_to_tl1_28:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xaa6b6001  ! 362: UDIVX_I	udivx 	%r13, 0x0001, %r21
	.word 0x9f802001  ! 363: SIR	sir	0x0001
	.word 0x38800001  ! 364: BGU	bgu,a	<label_0x1>
	.word 0x93902004  ! 365: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902389  ! 366: WRPR_TT_I	wrpr	%r0, 0x0389, %tt
	.word 0xaa6ec014  ! 367: UDIVX_R	udivx 	%r27, %r20, %r21
	.word 0x93902003  ! 368: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_29:
	.word 0x32800001  ! 370: BNE	bne,a	<label_0x1>
	pdist %f10, %f24, %f26
	.word 0x8bb1031b  ! 369: ALLIGNADDRESS	alignaddr	%r4, %r27, %r5
	.word 0x91b24ff1  ! 370: FONES	fones	%f8
	.word 0x91d02031  ! 371: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d902a07  ! 372: WRPR_PSTATE_I	wrpr	%r0, 0x0a07, %pstate
	.word 0x87802010  ! 373: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d902846  ! 374: WRPR_PSTATE_I	wrpr	%r0, 0x0846, %pstate
	.word 0xb4a8401a  ! 375: ANDNcc_R	andncc 	%r1, %r26, %r26
	.word 0xb3a000d1  ! 376: FNEGd	fnegd	%f48, %f56
	.word 0x91d02034  ! 377: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 378: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83a0c9cd  ! 379: FDIVd	fdivd	%f34, %f44, %f32
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83d02035  ! 381: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xb4844006  ! 382: ADDcc_R	addcc 	%r17, %r6, %r26
	.word 0xf4ffc026  ! 383: SWAPA_R	swapa	%r26, [%r31 + %r6] 0x01
	.word 0xb2806001  ! 384: ADDcc_I	addcc 	%r1, 0x0001, %r25
	.word 0x87902052  ! 385: WRPR_TT_I	wrpr	%r0, 0x0052, %tt
	.word 0x8d9020d9  ! 386: WRPR_PSTATE_I	wrpr	%r0, 0x00d9, %pstate
	.word 0xf237c006  ! 387: STH_R	sth	%r25, [%r31 + %r6]
	.word 0x99a00561  ! 388: FSQRTq	fsqrt	
	.word 0x8d902a15  ! 389: WRPR_PSTATE_I	wrpr	%r0, 0x0a15, %pstate
	.word 0x83d02033  ! 390: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x89a0054d  ! 391: FSQRTd	fsqrt	
	.word 0xa1508000  ! 392: RDPR_TSTATE	rdpr	%tstate, %r16
	.word 0x81982e5d  ! 393: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5d, %hpstate
	.word 0x91d02034  ! 394: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d9028d8  ! 395: WRPR_PSTATE_I	wrpr	%r0, 0x08d8, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 396: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902e15  ! 397: WRPR_PSTATE_I	wrpr	%r0, 0x0e15, %pstate
	.word 0x87902308  ! 398: WRPR_TT_I	wrpr	%r0, 0x0308, %tt
DS_30:
	.word 0x22800001  ! 400: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 399: SAVE_R	save	%r31, %r0, %r31
	.word 0xaefb0010  ! 400: SDIVcc_R	sdivcc 	%r12, %r16, %r23
	.word 0x83d02032  ! 401: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xee8008a0  ! 402: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0xa1902005  ! 403: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xaefa8000  ! 404: SDIVcc_R	sdivcc 	%r10, %r0, %r23
	.word 0xa1902000  ! 405: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x879021ae  ! 406: WRPR_TT_I	wrpr	%r0, 0x01ae, %tt
	.word 0xa1902002  ! 407: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x81982698  ! 408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0698, %hpstate
DS_31:
	.word 0x20800001  ! 410: BN	bn,a	<label_0x1>
	.word 0xc7316001  ! 410: STQF_I	-	%f3, [0x0001, %r5]
	normalw
	.word 0xad458000  ! 409: RD_SOFTINT_REG	rd	%softint, %r22
	.word 0x87902174  ! 410: WRPR_TT_I	wrpr	%r0, 0x0174, %tt
	.word 0x97696001  ! 411: SDIVX_I	sdivx	%r5, 0x0001, %r11
	.word 0x91d02030  ! 412: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d90285b  ! 413: WRPR_PSTATE_I	wrpr	%r0, 0x085b, %pstate
DS_32:
	.word 0x20800001  ! 415: BN	bn,a	<label_0x1>
	illtrap
	.word 0xa1a0054a  ! 415: FSQRTd	fsqrt	
	.word 0x93a10820  ! 414: FADDs	fadds	%f4, %f0, %f9
DS_33:
	.word 0x20800001  ! 416: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 416: BNE	bne,a	<label_0x1>
	.word 0xcd11400c  ! 416: LDQF_R	-	[%r5, %r12], %f6
	.word 0xa7a2c826  ! 415: FADDs	fadds	%f11, %f6, %f19
	.word 0xe6ffc026  ! 416: SWAPA_R	swapa	%r19, [%r31 + %r6] 0x01
	.word 0x87902211  ! 417: WRPR_TT_I	wrpr	%r0, 0x0211, %tt
	.word 0x81982d81  ! 418: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d81, %hpstate
	.word 0xe6800aa0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r19
	.word 0xe7e7c026  ! 420: CASA_I	casa	[%r31] 0x 1, %r6, %r19
	.word 0x81982189  ! 421: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0189, %hpstate
	.word 0x8d9020d4  ! 422: WRPR_PSTATE_I	wrpr	%r0, 0x00d4, %pstate
	.word 0x81982c4a  ! 423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4a, %hpstate
	.word 0xe6800b60  ! 424: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r19
	.word 0xb0d5a001  ! 425: UMULcc_I	umulcc 	%r22, 0x0001, %r24
	.word 0x91d02035  ! 426: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x956a8005  ! 427: SDIVX_R	sdivx	%r10, %r5, %r10
	.word 0x93d02031  ! 428: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x93902005  ! 429: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x82814016  ! 430: ADDcc_R	addcc 	%r5, %r22, %r1
	.word 0x87902029  ! 431: WRPR_TT_I	wrpr	%r0, 0x0029, %tt
	.word 0xc27fe001  ! 432: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0x8d802004  ! 433: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc2800ae0  ! 434: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r1
	.word 0x93902003  ! 435: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902496  ! 436: WRPR_PSTATE_I	wrpr	%r0, 0x0496, %pstate
	.word 0x2a700001  ! 437: BPCS	<illegal instruction>
	.word 0xc2800b20  ! 438: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r1
	.word 0xc2c004a0  ! 439: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r1
	.word 0xc2bfc036  ! 440: STDA_R	stda	%r1, [%r31 + %r22] 0x01
	.word 0x9f802001  ! 441: SIR	sir	0x0001
	.word 0x8d902441  ! 442: WRPR_PSTATE_I	wrpr	%r0, 0x0441, %pstate
	.word 0x93d02033  ! 443: Tcc_I	tne	icc_or_xcc, %r0 + 51
DS_34:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 444: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x89a2c9cb  ! 445: FDIVd	fdivd	%f42, %f42, %f4
	.word 0x26800001  ! 446: BL	bl,a	<label_0x1>
	.word 0x819824d8  ! 447: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d8, %hpstate
	.word 0x846c4008  ! 448: UDIVX_R	udivx 	%r17, %r8, %r2
	.word 0x87802089  ! 449: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_35:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 451: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x91d02031  ! 452: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x97504000  ! 453: RDPR_TNPC	rdpr	%tnpc, %r11
DS_36:
	.word 0x32800001  ! 455: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xc3114011  ! 455: LDQF_R	-	[%r5, %r17], %f1
	.word 0xafa1c821  ! 454: FADDs	fadds	%f7, %f1, %f23
	.word 0x8d480000  ! 455: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x97514000  ! 456: RDPR_TBA	rdpr	%tba, %r11
	.word 0x89a000c6  ! 457: FNEGd	fnegd	%f6, %f4
	.word 0x93902003  ! 458: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc9e7c026  ! 459: CASA_I	casa	[%r31] 0x 1, %r6, %r4
	.word 0x9f802001  ! 460: SIR	sir	0x0001
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9f802001  ! 462: SIR	sir	0x0001
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 463: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902806  ! 464: WRPR_PSTATE_I	wrpr	%r0, 0x0806, %pstate
	.word 0x87540000  ! 465: RDPR_GL	rdpr	%-, %r3
DS_37:
	.word 0x20800001  ! 467: BN	bn,a	<label_0x1>
	.word 0xcf350017  ! 467: STQF_R	-	%f7, [%r23, %r20]
	normalw
	.word 0x87458000  ! 466: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x98d88007  ! 467: SMULcc_R	smulcc 	%r2, %r7, %r12
DS_38:
	.word 0x32800001  ! 469: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xcf15c013  ! 469: LDQF_R	-	[%r23, %r19], %f7
	.word 0x95a1482c  ! 468: FADDs	fadds	%f5, %f12, %f10
	.word 0x8d902e87  ! 469: WRPR_PSTATE_I	wrpr	%r0, 0x0e87, %pstate
	.word 0xd437e001  ! 470: STH_I	sth	%r10, [%r31 + 0x0001]
	.word 0x8f902002  ! 451: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x819821c1  ! 471: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c1, %hpstate
	.word 0xd47fe001  ! 472: SWAP_I	swap	%r10, [%r31 + 0x0001]
	.word 0x99a000c1  ! 473: FNEGd	fnegd	%f32, %f12
	.word 0x24800001  ! 474: BLE	ble,a	<label_0x1>
	.word 0xb4680012  ! 475: UDIVX_R	udivx 	%r0, %r18, %r26
	.word 0x91d02031  ! 452: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81982452  ! 476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0452, %hpstate
	.word 0x93902004  ! 477: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9751c000  ! 478: RDPR_TL	rdpr	%tl, %r11
	.word 0x83d02033  ! 479: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xa1494000  ! 480: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0x8d802000  ! 481: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x85500000  ! 482: RDPR_TPC	rdpr	%tpc, %r2
	.word 0xc49004a0  ! 483: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
change_to_randtl_39:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 484: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xa2d6400d  ! 485: UMULcc_R	umulcc 	%r25, %r13, %r17
	.word 0x8d902cd7  ! 486: WRPR_PSTATE_I	wrpr	%r0, 0x0cd7, %pstate
	.word 0x99514000  ! 487: RDPR_TBA	rdpr	%tba, %r12
	.word 0x81982e8b  ! 488: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e8b, %hpstate
	.word 0x87802014  ! 489: WRASI_I	wr	%r0, 0x0014, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1902007  ! 491: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x896de001  ! 492: SDIVX_I	sdivx	%r23, 0x0001, %r4
	.word 0x99a249d2  ! 493: FDIVd	fdivd	%f40, %f18, %f12
	.word 0xd84fc000  ! 494: LDSB_R	ldsb	[%r31 + %r0], %r12
change_to_randtl_40:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 495: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x9350c000  ! 496: RDPR_TT	rdpr	%tt, %r9
change_to_tl1_41:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x819824c3  ! 498: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c3, %hpstate
	.word 0x91d02031  ! 499: Tcc_I	ta	icc_or_xcc, %r0 + 49
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 500: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 501: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87802080  ! 502: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02031  ! 503: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xd28008a0  ! 504: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x83504000  ! 505: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0xb3a00555  ! 506: FSQRTd	fsqrt	
DS_42:
	.word 0x34800001  ! 508: BG	bg,a	<label_0x1>
	.word 0xef304006  ! 508: STQF_R	-	%f23, [%r6, %r1]
	normalw
	.word 0x8b458000  ! 507: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xa190200b  ! 508: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 509: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879021cd  ! 510: WRPR_TT_I	wrpr	%r0, 0x01cd, %tt
	.word 0x87802088  ! 511: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x95a01a66  ! 512: FqTOi	fqtoi	
	.word 0x9950c000  ! 513: RDPR_TT	rdpr	%tt, %r12
	.word 0x91d02032  ! 514: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x98816001  ! 515: ADDcc_I	addcc 	%r5, 0x0001, %r12
DS_43:
	.word 0x20800001  ! 517: BN	bn,a	<label_0x1>
	pdist %f24, %f18, %f6
	.word 0x95b28316  ! 516: ALLIGNADDRESS	alignaddr	%r10, %r22, %r10
DS_44:
	.word 0x34800001  ! 518: BG	bg,a	<label_0x1>
	illtrap
	.word 0x97a00555  ! 518: FSQRTd	fsqrt	
	.word 0x81a00822  ! 517: FADDs	fadds	%f0, %f2, %f0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93902000  ! 519: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982cc2  ! 520: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc2, %hpstate
	.word 0x93902007  ! 521: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902001  ! 522: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02035  ! 523: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902148  ! 524: WRPR_TT_I	wrpr	%r0, 0x0148, %tt
	.word 0xaf494000  ! 525: RDHPR_HTBA	rdhpr	%htba, %r23
	.word 0x9f802001  ! 526: SIR	sir	0x0001
	.word 0x936c0012  ! 527: SDIVX_R	sdivx	%r16, %r18, %r9
	.word 0x8d902654  ! 528: WRPR_PSTATE_I	wrpr	%r0, 0x0654, %pstate
	.word 0x93902003  ! 529: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa190200d  ! 530: WRPR_GL_I	wrpr	%r0, 0x000d, %-
change_to_tl1_45:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 532: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_46:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 533: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa1902005  ! 534: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x93902000  ! 535: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd28008a0  ! 536: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd28fe010  ! 537: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r9
	.word 0x956b4006  ! 538: SDIVX_R	sdivx	%r13, %r6, %r10
	.word 0xd4c7e020  ! 539: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r10
	.word 0xd527c006  ! 540: STF_R	st	%f10, [%r6, %r31]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93902004  ! 542: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x97504000  ! 543: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0xd68008a0  ! 544: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x87802014  ! 545: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x99902000  ! 546: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x87a2c9ec  ! 547: FDIVq	dis not found

	.word 0x8d90289a  ! 548: WRPR_PSTATE_I	wrpr	%r0, 0x089a, %pstate
	.word 0xc6d80e60  ! 549: LDXA_R	ldxa	[%r0, %r0] 0x73, %r3
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 550: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 551: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902362  ! 552: WRPR_TT_I	wrpr	%r0, 0x0362, %tt
	.word 0xc6c00e80  ! 553: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r3
	.word 0x91d02033  ! 554: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x80f82001  ! 555: SDIVcc_I	sdivcc 	%r0, 0x0001, %r0
	.word 0x97480000  ! 556: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x99902005  ! 557: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x896d2001  ! 558: SDIVX_I	sdivx	%r20, 0x0001, %r4
	.word 0xc8dfe010  ! 559: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r4
	.word 0x93902005  ! 560: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982b5b  ! 561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5b, %hpstate
	.word 0xc81fe001  ! 562: LDD_I	ldd	[%r31 + 0x0001], %r4
DS_47:
	.word 0x22800001  ! 564: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 563: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26700001  ! 564: BPL	<illegal instruction>
	.word 0xb351c000  ! 565: RDPR_TL	rdpr	%tl, %r25
	.word 0x91702001  ! 566: POPC_I	popc	0x0001, %r8
	.word 0x93902001  ! 567: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902003  ! 568: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902004  ! 569: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x85702001  ! 570: POPC_I	popc	0x0001, %r2
change_to_tl1_48:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 572: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d9026cb  ! 573: WRPR_PSTATE_I	wrpr	%r0, 0x06cb, %pstate
	.word 0x81a01a63  ! 574: FqTOi	fqtoi	
DS_49:
	.word 0x22800001  ! 576: BE	be,a	<label_0x1>
	.word 0xf732000c  ! 576: STQF_R	-	%f27, [%r12, %r8]
	normalw
	.word 0xa9458000  ! 575: RD_SOFTINT_REG	rd	%softint, %r20
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 576: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 578: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902205  ! 579: WRPR_TT_I	wrpr	%r0, 0x0205, %tt
	.word 0xafa4c9fa  ! 580: FDIVq	dis not found

	.word 0x8d902440  ! 581: WRPR_PSTATE_I	wrpr	%r0, 0x0440, %pstate
	.word 0xee5fc000  ! 582: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0xef37c01a  ! 583: STQF_R	-	%f23, [%r26, %r31]
	.word 0x81982ed5  ! 584: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed5, %hpstate
	.word 0x32700001  ! 585: BPNE	<illegal instruction>
	.word 0xee8008a0  ! 586: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
	.word 0xeeffc03a  ! 587: SWAPA_R	swapa	%r23, [%r31 + %r26] 0x01
	.word 0x879023c1  ! 588: WRPR_TT_I	wrpr	%r0, 0x03c1, %tt
	.word 0x87508000  ! 589: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x81982bc8  ! 590: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc8, %hpstate
	.word 0x8d902092  ! 591: WRPR_PSTATE_I	wrpr	%r0, 0x0092, %pstate
	.word 0x81982a4f  ! 592: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4f, %hpstate
	.word 0xc637c01a  ! 593: STH_R	sth	%r3, [%r31 + %r26]
	.word 0x93902002  ! 594: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc6c80e80  ! 595: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r3
	.word 0x8cfa800d  ! 596: SDIVcc_R	sdivcc 	%r10, %r13, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa0d4c002  ! 598: UMULcc_R	umulcc 	%r19, %r2, %r16
	.word 0x8d802004  ! 599: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902007  ! 600: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa190200e  ! 601: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xe0900e60  ! 602: LDUHA_R	lduha	[%r0, %r0] 0x73, %r16
	.word 0xe0c7e020  ! 603: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r16
	.word 0x93d02035  ! 604: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x81982094  ! 605: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0094, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 608: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f802001  ! 609: SIR	sir	0x0001
DS_50:
	.word 0x22800001  ! 611: BE	be,a	<label_0x1>
	pdist %f12, %f14, %f22
	.word 0xabb5c318  ! 610: ALLIGNADDRESS	alignaddr	%r23, %r24, %r21
	.word 0x93902003  ! 611: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d9026cb  ! 612: WRPR_PSTATE_I	wrpr	%r0, 0x06cb, %pstate
	.word 0x81982509  ! 613: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0509, %hpstate
	.word 0x8790216a  ! 614: WRPR_TT_I	wrpr	%r0, 0x016a, %tt
	.word 0x87902182  ! 615: WRPR_TT_I	wrpr	%r0, 0x0182, %tt
	.word 0xa06c6001  ! 616: UDIVX_I	udivx 	%r17, 0x0001, %r16
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 617: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 618: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x99b00ff8  ! 619: FONES	fones	%f12
	.word 0xa1902005  ! 620: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87540000  ! 621: RDPR_GL	rdpr	%-, %r3
	.word 0xa1902001  ! 622: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x91d02031  ! 623: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87802016  ! 624: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xb5694014  ! 625: SDIVX_R	sdivx	%r5, %r20, %r26
	.word 0x819820d5  ! 626: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d5, %hpstate
	.word 0x97a00567  ! 627: FSQRTq	fsqrt	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa0490000  ! 629: MULX_R	mulx 	%r4, %r0, %r16
	.word 0x8d802004  ! 630: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93a34dd8  ! 631: FdMULq	fdmulq	
	.word 0x8d90204a  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x004a, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802088  ! 634: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa1902001  ! 635: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x87902257  ! 636: WRPR_TT_I	wrpr	%r0, 0x0257, %tt
	.word 0x81982a04  ! 637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a04, %hpstate
	.word 0x93902002  ! 638: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902001  ! 639: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87a64dca  ! 640: FdMULq	fdmulq	
	.word 0x8d902e94  ! 641: WRPR_PSTATE_I	wrpr	%r0, 0x0e94, %pstate
	.word 0x9950c000  ! 642: RDPR_TT	rdpr	%tt, %r12
	.word 0xd87fe001  ! 643: SWAP_I	swap	%r12, [%r31 + 0x0001]
	.word 0xd87fe001  ! 644: SWAP_I	swap	%r12, [%r31 + 0x0001]
	.word 0xd8880e80  ! 645: LDUBA_R	lduba	[%r0, %r0] 0x74, %r12
	.word 0x81982bc9  ! 646: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc9, %hpstate
	.word 0x8d6ac016  ! 647: SDIVX_R	sdivx	%r11, %r22, %r6
	.word 0x91d02033  ! 648: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xccbfe001  ! 649: STDA_I	stda	%r6, [%r31 + 0x0001] %asi
	.word 0x87802088  ! 650: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87902094  ! 651: WRPR_TT_I	wrpr	%r0, 0x0094, %tt
	.word 0x8d902e88  ! 652: WRPR_PSTATE_I	wrpr	%r0, 0x0e88, %pstate
	.word 0x9f802001  ! 653: SIR	sir	0x0001
change_to_tl1_51:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87802088  ! 655: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93d02030  ! 656: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x83d02030  ! 657: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x93902000  ! 658: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8968c009  ! 659: SDIVX_R	sdivx	%r3, %r9, %r4
	.word 0xc8ffc029  ! 660: SWAPA_R	swapa	%r4, [%r31 + %r9] 0x01
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 661: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x85508000  ! 662: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0xa190200f  ! 663: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 664: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_52:
	.word 0x32800001  ! 666: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 665: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d9024cb  ! 666: WRPR_PSTATE_I	wrpr	%r0, 0x04cb, %pstate
	.word 0x8d802000  ! 667: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902007  ! 668: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81982e06  ! 669: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e06, %hpstate
	.word 0x81982d57  ! 670: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d57, %hpstate
change_to_randtl_53:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 671: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xc527e001  ! 672: STF_I	st	%f2, [0x0001, %r31]
	.word 0xad51c000  ! 673: RDPR_TL	rdpr	%tl, %r22
	.word 0x93d02030  ! 674: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x8790239a  ! 675: WRPR_TT_I	wrpr	%r0, 0x039a, %tt
	.word 0xecc7e010  ! 676: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r22
	.word 0x8d90288a  ! 677: WRPR_PSTATE_I	wrpr	%r0, 0x088a, %pstate
	.word 0xecdfe010  ! 678: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r22
	.word 0x8d902819  ! 679: WRPR_PSTATE_I	wrpr	%r0, 0x0819, %pstate
	.word 0x9f802001  ! 680: SIR	sir	0x0001
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 681: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 682: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93d02030  ! 683: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x81982ccd  ! 684: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ccd, %hpstate
	.word 0x81982c8f  ! 685: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8f, %hpstate
	.word 0x9482401a  ! 686: ADDcc_R	addcc 	%r9, %r26, %r10
	.word 0x92f96001  ! 687: SDIVcc_I	sdivcc 	%r5, 0x0001, %r9
	.word 0x93902006  ! 688: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x89702001  ! 689: POPC_I	popc	0x0001, %r4
	.word 0x91d02035  ! 690: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982bd1  ! 692: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bd1, %hpstate
DS_54:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 693: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x9550c000  ! 694: RDPR_TT	rdpr	%tt, %r10
change_to_randtl_55:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 695: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8d902a42  ! 696: WRPR_PSTATE_I	wrpr	%r0, 0x0a42, %pstate
	.word 0xa190200f  ! 697: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87902391  ! 698: WRPR_TT_I	wrpr	%r0, 0x0391, %tt
	.word 0x28800001  ! 699: BLEU	bleu,a	<label_0x1>
	.word 0x81982bce  ! 700: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bce, %hpstate
	.word 0xa5540000  ! 701: RDPR_GL	rdpr	%-, %r18
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 702: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_56:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 703: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x9f802001  ! 704: SIR	sir	0x0001
	.word 0x93902002  ! 705: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02034  ! 706: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902003  ! 707: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 708: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8c490003  ! 709: MULX_R	mulx 	%r4, %r3, %r6
	.word 0x856ec00b  ! 710: SDIVX_R	sdivx	%r27, %r11, %r2
	.word 0xc527c00b  ! 711: STF_R	st	%f2, [%r11, %r31]
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 712: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982f06  ! 713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f06, %hpstate
	.word 0xc4c004a0  ! 714: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r2
DS_57:
	.word 0x20800001  ! 716: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 715: SAVE_R	save	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
	.word 0xc4dfe010  ! 717: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r2
	.word 0xa9a289b5  ! 718: FDIVs	fdivs	%f10, %f21, %f20
	.word 0x87494000  ! 719: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0x81982f9d  ! 720: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9d, %hpstate
	.word 0xc737e001  ! 721: STQF_I	-	%f3, [0x0001, %r31]
	.word 0x97480000  ! 722: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
DS_58:
	.word 0x20800001  ! 724: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 723: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 724: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83d02030  ! 725: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x91d02033  ! 726: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 727: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 728: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d802000  ! 729: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd6cfe010  ! 730: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r11
	.word 0x8d902459  ! 731: WRPR_PSTATE_I	wrpr	%r0, 0x0459, %pstate
	.word 0x8790228d  ! 732: WRPR_TT_I	wrpr	%r0, 0x028d, %tt
	.word 0x8d902258  ! 733: WRPR_PSTATE_I	wrpr	%r0, 0x0258, %pstate
	.word 0x86a94002  ! 734: ANDNcc_R	andncc 	%r5, %r2, %r3
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 735: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 736: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8f902002  ! 695: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982a41  ! 737: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a41, %hpstate
	.word 0x87902091  ! 738: WRPR_TT_I	wrpr	%r0, 0x0091, %tt
	.word 0x20700001  ! 739: BPN	<illegal instruction>
	.word 0xc6d7e020  ! 740: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r3
	.word 0xa1902009  ! 741: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x89480000  ! 743: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x8d90260b  ! 744: WRPR_PSTATE_I	wrpr	%r0, 0x060b, %pstate
	.word 0x819826ce  ! 745: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06ce, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 746: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879022d2  ! 747: WRPR_TT_I	wrpr	%r0, 0x02d2, %tt
	.word 0x8790203b  ! 748: WRPR_TT_I	wrpr	%r0, 0x003b, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87902188  ! 750: WRPR_TT_I	wrpr	%r0, 0x0188, %tt
	.word 0xc807e001  ! 751: LDUW_I	lduw	[%r31 + 0x0001], %r4
DS_59:
	.word 0x32800001  ! 753: BNE	bne,a	<label_0x1>
	.word 0xc3368003  ! 753: STQF_R	-	%f1, [%r3, %r26]
	normalw
	.word 0xb1458000  ! 752: RD_SOFTINT_REG	rd	%softint, %r24
	.word 0x93902003  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93d02031  ! 754: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x81982891  ! 755: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0891, %hpstate
	.word 0x38700001  ! 756: BPGU	<illegal instruction>
	.word 0xa1902000  ! 757: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x88834011  ! 759: ADDcc_R	addcc 	%r13, %r17, %r4
	.word 0xc997e001  ! 760: LDQFA_I	-	[%r31, 0x0001], %f4
	.word 0x879023fb  ! 761: WRPR_TT_I	wrpr	%r0, 0x03fb, %tt
	.word 0xa3500000  ! 762: RDPR_TPC	rdpr	%tpc, %r17
	.word 0xe28008a0  ! 763: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe227c011  ! 764: STW_R	stw	%r17, [%r31 + %r17]
	.word 0x91d02034  ! 765: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 766: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8ed1a001  ! 767: UMULcc_I	umulcc 	%r6, 0x0001, %r7
	.word 0xcf27e001  ! 768: STF_I	st	%f7, [0x0001, %r31]
	.word 0x91702001  ! 769: POPC_I	popc	0x0001, %r8
	.word 0xd08804a0  ! 770: LDUBA_R	lduba	[%r0, %r0] 0x25, %r8
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 771: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91a00567  ! 772: FSQRTq	fsqrt	
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 773: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902007  ! 774: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93902002  ! 775: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_60:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 776: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x819822dd  ! 777: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02dd, %hpstate
	.word 0xa1500000  ! 778: RDPR_TPC	rdpr	%tpc, %r16
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902006  ! 780: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9882e001  ! 781: ADDcc_I	addcc 	%r11, 0x0001, %r12
	.word 0x91d02032  ! 782: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x99902001  ! 783: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8d90285c  ! 784: WRPR_PSTATE_I	wrpr	%r0, 0x085c, %pstate
	.word 0x9f802001  ! 785: SIR	sir	0x0001
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89b10ff5  ! 787: FONES	fones	%f4
	.word 0x8790206a  ! 788: WRPR_TT_I	wrpr	%r0, 0x006a, %tt
	.word 0xa190200f  ! 789: WRPR_GL_I	wrpr	%r0, 0x000f, %-
DS_61:
	.word 0x32800001  ! 791: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 791: BG	bg,a	<label_0x1>
	.word 0xada00547  ! 791: FSQRTd	fsqrt	
	.word 0x95a34820  ! 790: FADDs	fadds	%f13, %f0, %f10
	.word 0x22800001  ! 791: BE	be,a	<label_0x1>
	.word 0x81982d83  ! 792: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d83, %hpstate
	.word 0x83b54fe8  ! 793: FONES	fones	%f1
	.word 0x8d902e06  ! 794: WRPR_PSTATE_I	wrpr	%r0, 0x0e06, %pstate
	.word 0x87902345  ! 795: WRPR_TT_I	wrpr	%r0, 0x0345, %tt
	.word 0xc2ffc028  ! 796: SWAPA_R	swapa	%r1, [%r31 + %r8] 0x01
	.word 0x3e700001  ! 797: BPVC	<illegal instruction>
	.word 0x87902130  ! 798: WRPR_TT_I	wrpr	%r0, 0x0130, %tt
	.word 0xc23fc008  ! 799: STD_R	std	%r1, [%r31 + %r8]
	.word 0x8d902243  ! 800: WRPR_PSTATE_I	wrpr	%r0, 0x0243, %pstate
	.word 0x93d02030  ! 801: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x8d902041  ! 802: WRPR_PSTATE_I	wrpr	%r0, 0x0041, %pstate
	.word 0x99500000  ! 803: RDPR_TPC	rdpr	%tpc, %r12
	.word 0xa190200e  ! 804: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa1902006  ! 805: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_62:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 806: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x9f802001  ! 807: SIR	sir	0x0001
	.word 0x81504000  ! 808: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0xa6862001  ! 809: ADDcc_I	addcc 	%r24, 0x0001, %r19
	.word 0x93902004  ! 810: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87802080  ! 811: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8198220a  ! 812: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020a, %hpstate
	.word 0x93d02032  ! 813: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x93902002  ! 814: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xb7a01a77  ! 815: FqTOi	fqtoi	
	.word 0x8d90204e  ! 816: WRPR_PSTATE_I	wrpr	%r0, 0x004e, %pstate
	.word 0x87902100  ! 817: WRPR_TT_I	wrpr	%r0, 0x0100, %tt
	.word 0x8d9020c3  ! 818: WRPR_PSTATE_I	wrpr	%r0, 0x00c3, %pstate
	.word 0x8d90245f  ! 819: WRPR_PSTATE_I	wrpr	%r0, 0x045f, %pstate
	.word 0x85a00578  ! 820: FSQRTq	fsqrt	
	.word 0x8d902ec9  ! 821: WRPR_PSTATE_I	wrpr	%r0, 0x0ec9, %pstate
	.word 0xa1902006  ! 822: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa1902007  ! 823: WRPR_GL_I	wrpr	%r0, 0x0007, %-
DS_63:
	.word 0x32800001  ! 825: BNE	bne,a	<label_0x1>
	.word 0xf532000c  ! 825: STQF_R	-	%f26, [%r12, %r8]
	normalw
	.word 0x8f458000  ! 824: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x9b500000  ! 825: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xda0fc000  ! 826: LDUB_R	ldub	[%r31 + %r0], %r13
	.word 0x91d02033  ! 827: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902005  ! 828: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xda1fc000  ! 829: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x9151c000  ! 830: RDPR_TL	rdpr	%tl, %r8
	.word 0x8ba00541  ! 831: FSQRTd	fsqrt	
	.word 0x879023e0  ! 832: WRPR_TT_I	wrpr	%r0, 0x03e0, %tt
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 833: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8b6d2001  ! 835: SDIVX_I	sdivx	%r20, 0x0001, %r5
	.word 0x8d802000  ! 836: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x92f90014  ! 837: SDIVcc_R	sdivcc 	%r4, %r20, %r9
	.word 0x87a00572  ! 838: FSQRTq	fsqrt	
	.word 0x9f802001  ! 839: SIR	sir	0x0001
	.word 0x91d02031  ! 840: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87902236  ! 841: WRPR_TT_I	wrpr	%r0, 0x0236, %tt
	.word 0xa1902003  ! 842: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8da000c8  ! 843: FNEGd	fnegd	%f8, %f6
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 844: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xccd7e030  ! 845: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r6
	.word 0xa1902005  ! 846: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x93902000  ! 847: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x20700001  ! 848: BPN	<illegal instruction>
DS_64:
	.word 0x22800001  ! 850: BE	be,a	<label_0x1>
	pdist %f0, %f16, %f0
	.word 0x95b1831b  ! 849: ALLIGNADDRESS	alignaddr	%r6, %r27, %r10
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 850: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 851: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902003  ! 852: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d902c54  ! 853: WRPR_PSTATE_I	wrpr	%r0, 0x0c54, %pstate
	.word 0x8d802004  ! 854: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8790218f  ! 855: WRPR_TT_I	wrpr	%r0, 0x018f, %tt
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 856: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd48804a0  ! 857: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 858: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 859: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8790211a  ! 860: WRPR_TT_I	wrpr	%r0, 0x011a, %tt
	.word 0x8b494000  ! 861: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0x8d90245c  ! 862: WRPR_PSTATE_I	wrpr	%r0, 0x045c, %pstate
	.word 0x91d02034  ! 863: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902e95  ! 864: WRPR_PSTATE_I	wrpr	%r0, 0x0e95, %pstate
	.word 0xa1902009  ! 865: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8198248c  ! 866: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048c, %hpstate
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 867: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x97702001  ! 868: POPC_I	popc	0x0001, %r11
	.word 0x8790224a  ! 869: WRPR_TT_I	wrpr	%r0, 0x024a, %tt
	.word 0x87802004  ! 870: WRASI_I	wr	%r0, 0x0004, %asi
DS_65:
	.word 0x34800001  ! 872: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 871: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9f802001  ! 872: SIR	sir	0x0001
	.word 0x87902063  ! 873: WRPR_TT_I	wrpr	%r0, 0x0063, %tt
	.word 0x8d802000  ! 874: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd6c00e80  ! 875: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r11
	.word 0xa86c6001  ! 876: UDIVX_I	udivx 	%r17, 0x0001, %r20
	.word 0x8790213f  ! 877: WRPR_TT_I	wrpr	%r0, 0x013f, %tt
	.word 0x93902004  ! 878: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902484  ! 879: WRPR_PSTATE_I	wrpr	%r0, 0x0484, %pstate
	.word 0x9f802001  ! 880: SIR	sir	0x0001
	.word 0x8790209c  ! 881: WRPR_TT_I	wrpr	%r0, 0x009c, %tt
	.word 0x91d02035  ! 882: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa190200d  ! 883: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8198295b  ! 884: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095b, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xe81fc000  ! 886: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0x87902336  ! 887: WRPR_TT_I	wrpr	%r0, 0x0336, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9f802001  ! 889: SIR	sir	0x0001
	.word 0xa9a309b3  ! 890: FDIVs	fdivs	%f12, %f19, %f20
	.word 0x3e700001  ! 891: BPVC	<illegal instruction>
	.word 0x8d51c000  ! 892: RDPR_TL	rdpr	%tl, %r6
	.word 0xcc8008a0  ! 893: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8fa00567  ! 894: FSQRTq	fsqrt	
	.word 0xa1902000  ! 895: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8790211f  ! 896: WRPR_TT_I	wrpr	%r0, 0x011f, %tt
	.word 0x89a01a72  ! 897: FqTOi	fqtoi	
	.word 0xa4484002  ! 898: MULX_R	mulx 	%r1, %r2, %r18
	.word 0xb7508000  ! 899: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x8790205f  ! 900: WRPR_TT_I	wrpr	%r0, 0x005f, %tt
	.word 0x91d02032  ! 901: Tcc_I	ta	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa6f8e001  ! 903: SDIVcc_I	sdivcc 	%r3, 0x0001, %r19
	.word 0x9f802001  ! 904: SIR	sir	0x0001
	.word 0x9f802001  ! 905: SIR	sir	0x0001
	.word 0x87902344  ! 906: WRPR_TT_I	wrpr	%r0, 0x0344, %tt
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 907: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97702001  ! 908: POPC_I	popc	0x0001, %r11
	.word 0x26700001  ! 909: BPL	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb3514000  ! 911: RDPR_TBA	rdpr	%tba, %r25
	.word 0x93902003  ! 912: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8198269f  ! 913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069f, %hpstate
	.word 0x8790202f  ! 914: WRPR_TT_I	wrpr	%r0, 0x002f, %tt
	.word 0xf217c000  ! 915: LDUH_R	lduh	[%r31 + %r0], %r25
change_to_tl1_66:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902007  ! 917: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87480000  ! 918: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0x8d802004  ! 919: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x26700001  ! 920: BPL	<illegal instruction>
	.word 0x9351c000  ! 921: RDPR_TL	rdpr	%tl, %r9
	.word 0xd327c002  ! 922: STF_R	st	%f9, [%r2, %r31]
change_to_tl1_67:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9f802001  ! 924: SIR	sir	0x0001
	ta	T_CHANGE_NONPRIV	! macro
DS_68:
	.word 0x20800001  ! 927: BN	bn,a	<label_0x1>
	.word 0xc7362001  ! 927: STQF_I	-	%f3, [0x0001, %r24]
	normalw
	.word 0xa5458000  ! 926: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0x84fde001  ! 927: SDIVcc_I	sdivcc 	%r23, 0x0001, %r2
	.word 0x8d50c000  ! 928: RDPR_TT	rdpr	%tt, %r6
	.word 0x876aa001  ! 929: SDIVX_I	sdivx	%r10, 0x0001, %r3
	.word 0xa190200a  ! 930: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x99500000  ! 931: RDPR_TPC	rdpr	%tpc, %r12
	.word 0xd8c7e020  ! 932: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r12
	.word 0x8d902a50  ! 933: WRPR_PSTATE_I	wrpr	%r0, 0x0a50, %pstate
	.word 0xb2d66001  ! 934: UMULcc_I	umulcc 	%r25, 0x0001, %r25
	ta	T_CHANGE_HPRIV	! macro
	.word 0xb7514000  ! 936: RDPR_TBA	rdpr	%tba, %r27
	.word 0x93902000  ! 937: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902000  ! 938: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902006  ! 939: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87902296  ! 941: WRPR_TT_I	wrpr	%r0, 0x0296, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902810  ! 943: WRPR_PSTATE_I	wrpr	%r0, 0x0810, %pstate
	.word 0xf6d00e80  ! 944: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r27
	.word 0x83d02035  ! 945: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x93902007  ! 946: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902c4c  ! 947: WRPR_PSTATE_I	wrpr	%r0, 0x0c4c, %pstate
	.word 0xa1902005  ! 948: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d9028d9  ! 949: WRPR_PSTATE_I	wrpr	%r0, 0x08d9, %pstate
	.word 0x93902005  ! 950: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xf657e001  ! 951: LDSH_I	ldsh	[%r31 + 0x0001], %r27
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 952: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 953: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa1902006  ! 954: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa1902000  ! 955: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xf697e020  ! 956: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r27
	.word 0x8d902203  ! 957: WRPR_PSTATE_I	wrpr	%r0, 0x0203, %pstate
	.word 0x8d802004  ! 958: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87902097  ! 959: WRPR_TT_I	wrpr	%r0, 0x0097, %tt
	.word 0x87a0cdcc  ! 960: FdMULq	fdmulq	
	.word 0xc69fc020  ! 961: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0x87802080  ! 962: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8198259d  ! 963: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059d, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 964: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6ffc02c  ! 965: SWAPA_R	swapa	%r3, [%r31 + %r12] 0x01
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc68008a0  ! 967: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99540000  ! 969: RDPR_GL	rdpr	%-, %r12
	.word 0xa1902006  ! 970: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x819827d7  ! 971: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d7, %hpstate
	.word 0x8d902a12  ! 972: WRPR_PSTATE_I	wrpr	%r0, 0x0a12, %pstate
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 973: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 974: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902004  ! 975: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 976: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8ca8c009  ! 977: ANDNcc_R	andncc 	%r3, %r9, %r6
DS_69:
	.word 0x34800001  ! 979: BG	bg,a	<label_0x1>
	.word 0xcf340000  ! 979: STQF_R	-	%f7, [%r0, %r16]
	normalw
	.word 0x89458000  ! 978: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x8d902081  ! 979: WRPR_PSTATE_I	wrpr	%r0, 0x0081, %pstate
	.word 0x93902005  ! 980: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8198280b  ! 981: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080b, %hpstate
change_to_tl1_70:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 983: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 984: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d802004  ! 985: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 986: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97480000  ! 987: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xab702001  ! 988: POPC_I	popc	0x0001, %r21
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982e5f  ! 990: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5f, %hpstate
	.word 0x87902084  ! 991: WRPR_TT_I	wrpr	%r0, 0x0084, %tt
	.word 0x8d902818  ! 992: WRPR_PSTATE_I	wrpr	%r0, 0x0818, %pstate
	.word 0xea47c000  ! 993: LDSW_R	ldsw	[%r31 + %r0], %r21
	.word 0x8d802000  ! 994: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9ba509a4  ! 995: FDIVs	fdivs	%f20, %f4, %f13
	.word 0xdabfe001  ! 996: STDA_I	stda	%r13, [%r31 + 0x0001] %asi
	.word 0x8f514000  ! 997: RDPR_TBA	rdpr	%tba, %r7
	.word 0x93d02032  ! 998: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d902c59  ! 999: WRPR_PSTATE_I	wrpr	%r0, 0x0c59, %pstate
	.word 0x91d02035  ! 1000: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x85a00567  ! 1001: FSQRTq	fsqrt	
	.word 0x8ec52001  ! 1002: ADDCcc_I	addccc 	%r20, 0x0001, %r7
	ta	T_CHANGE_HPRIV	! macro
	.word 0x20800001  ! 1004: BN	bn,a	<label_0x1>
	.word 0x88f9401a  ! 1005: SDIVcc_R	sdivcc 	%r5, %r26, %r4
	.word 0x81982a50  ! 1006: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a50, %hpstate
	.word 0x8d90264a  ! 1007: WRPR_PSTATE_I	wrpr	%r0, 0x064a, %pstate
	.word 0x93902001  ! 1008: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93d02032  ! 1009: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x32800001  ! 1010: BNE	bne,a	<label_0x1>
	.word 0x91d02030  ! 1011: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8198204b  ! 1012: WRHPR_HPSTATE_I	wrhpr	%r0, 0x004b, %hpstate
	.word 0xa1902007  ! 1013: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1014: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_71:
	.word 0x22800001  ! 1016: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1015: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02030  ! 1016: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x83b34ff4  ! 1017: FONES	fones	%f1
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1018: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc2d7e020  ! 1019: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r1
	.word 0x8d902806  ! 1020: WRPR_PSTATE_I	wrpr	%r0, 0x0806, %pstate
	.word 0xa1902005  ! 1021: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x93902002  ! 1022: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8950c000  ! 1023: RDPR_TT	rdpr	%tt, %r4
	.word 0x8d902898  ! 1024: WRPR_PSTATE_I	wrpr	%r0, 0x0898, %pstate
	.word 0xa1902008  ! 1025: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xc8c004a0  ! 1026: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r4
	.word 0x81982859  ! 1027: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0859, %hpstate
	.word 0xa3b0cff5  ! 1028: FONES	fones	%f17
	.word 0x9ac0a001  ! 1029: ADDCcc_I	addccc 	%r2, 0x0001, %r13
	.word 0x8790210a  ! 1030: WRPR_TT_I	wrpr	%r0, 0x010a, %tt
	.word 0x99a0056c  ! 1031: FSQRTq	fsqrt	
DS_72:
	.word 0x22800001  ! 1033: BE	be,a	<label_0x1>
	.word 0xf530a001  ! 1033: STQF_I	-	%f26, [0x0001, %r2]
	normalw
	.word 0x85458000  ! 1032: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x8198249c  ! 1033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049c, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1034: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1035: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x99540000  ! 1036: RDPR_GL	rdpr	%-, %r12
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1037: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x82f92001  ! 1038: SDIVcc_I	sdivcc 	%r4, 0x0001, %r1
	.word 0x87902304  ! 1039: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
	.word 0x99a109fa  ! 1040: FDIVq	dis not found

	.word 0x9f802001  ! 1041: SIR	sir	0x0001
	.word 0xd807c000  ! 1042: LDUW_R	lduw	[%r31 + %r0], %r12
	.word 0x9f802001  ! 1043: SIR	sir	0x0001
	.word 0x87902115  ! 1044: WRPR_TT_I	wrpr	%r0, 0x0115, %tt
	.word 0x8d9026c1  ! 1045: WRPR_PSTATE_I	wrpr	%r0, 0x06c1, %pstate
	.word 0x8d9022cc  ! 1046: WRPR_PSTATE_I	wrpr	%r0, 0x02cc, %pstate
	.word 0xad504000  ! 1047: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0xec0fc000  ! 1048: LDUB_R	ldub	[%r31 + %r0], %r22
	.word 0xb3508000  ! 1049: RDPR_TSTATE	<illegal instruction>
DS_73:
	.word 0x20800001  ! 1051: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 1051: BG	bg,a	<label_0x1>
	.word 0x8fa00559  ! 1051: FSQRTd	fsqrt	
	.word 0x95a20824  ! 1050: FADDs	fadds	%f8, %f4, %f10
	.word 0x8ba209d9  ! 1051: FDIVd	fdivd	%f8, %f56, %f36
	.word 0x8d802004  ! 1052: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9f802001  ! 1053: SIR	sir	0x0001
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902a84  ! 1055: WRPR_PSTATE_I	wrpr	%r0, 0x0a84, %pstate
	.word 0xa1902000  ! 1056: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xcad7e010  ! 1057: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r5
	.word 0x8da00549  ! 1058: FSQRTd	fsqrt	
	.word 0x87902234  ! 1059: WRPR_TT_I	wrpr	%r0, 0x0234, %tt
	.word 0x93902002  ! 1060: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902000  ! 1061: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902041  ! 1062: WRPR_PSTATE_I	wrpr	%r0, 0x0041, %pstate
	.word 0x8d802004  ! 1063: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91d02033  ! 1064: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902091  ! 1065: WRPR_PSTATE_I	wrpr	%r0, 0x0091, %pstate
	.word 0xa1902005  ! 1066: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x89508000  ! 1067: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0xae4ec00c  ! 1068: MULX_R	mulx 	%r27, %r12, %r23
	.word 0x91d02035  ! 1069: Tcc_I	ta	icc_or_xcc, %r0 + 53
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1070: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_74:
	.word 0x22800001  ! 1072: BE	be,a	<label_0x1>
	illtrap
	.word 0x83a00559  ! 1072: FSQRTd	fsqrt	
	.word 0x8da04839  ! 1071: FADDs	fadds	%f1, %f25, %f6
	.word 0xa5a5c9f9  ! 1072: FDIVq	dis not found

	.word 0x879023a0  ! 1073: WRPR_TT_I	wrpr	%r0, 0x03a0, %tt
	.word 0x93902005  ! 1074: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8790210a  ! 1075: WRPR_TT_I	wrpr	%r0, 0x010a, %tt
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1076: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x24700001  ! 1077: BPLE	<illegal instruction>
	.word 0x8d802000  ! 1078: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1079: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1080: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902241  ! 1081: WRPR_TT_I	wrpr	%r0, 0x0241, %tt
	.word 0x93902007  ! 1082: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902005  ! 1083: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x83d02035  ! 1084: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 1085: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83a28d2a  ! 1086: FsMULd	fsmuld	%f10, %f10, %f32
	.word 0x93d02030  ! 1087: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x81982908  ! 1088: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0908, %hpstate
	.word 0xa1a089cb  ! 1089: FDIVd	fdivd	%f2, %f42, %f16
	.word 0x98d26001  ! 1090: UMULcc_I	umulcc 	%r9, 0x0001, %r12
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1091: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd897e030  ! 1092: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r12
	.word 0x9f802001  ! 1093: SIR	sir	0x0001
	.word 0xa190200f  ! 1094: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x83504000  ! 1095: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x8790202f  ! 1096: WRPR_TT_I	wrpr	%r0, 0x002f, %tt
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1097: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc28008a0  ! 1098: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x81982757  ! 1099: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0757, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1100: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95508000  ! 1101: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0xa1902009  ! 1102: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa1902000  ! 1103: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x95a01a62  ! 1104: FqTOi	fqtoi	
	.word 0x91d02030  ! 1105: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93d02033  ! 1106: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x81982007  ! 1107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0007, %hpstate
	.word 0xd477e001  ! 1108: STX_I	stx	%r10, [%r31 + 0x0001]
	.word 0xb5504000  ! 1109: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0x93902005  ! 1110: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa190200f  ! 1111: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87902256  ! 1112: WRPR_TT_I	wrpr	%r0, 0x0256, %tt
	.word 0x93902006  ! 1113: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x804d800d  ! 1115: MULX_R	mulx 	%r22, %r13, %r0
	.word 0x3a800001  ! 1116: BCC	bcc,a	<label_0x1>
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1117: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa3480000  ! 1119: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x91d02034  ! 1120: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93480000  ! 1121: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x879021a1  ! 1122: WRPR_TT_I	wrpr	%r0, 0x01a1, %tt
	.word 0x91d02031  ! 1123: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xd2ffc02d  ! 1124: SWAPA_R	swapa	%r9, [%r31 + %r13] 0x01
	.word 0x819820da  ! 1125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00da, %hpstate
	.word 0x8d9026de  ! 1126: WRPR_PSTATE_I	wrpr	%r0, 0x06de, %pstate
	.word 0x91d02032  ! 1127: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87a01a70  ! 1128: FqTOi	fqtoi	
	.word 0x879021bd  ! 1129: WRPR_TT_I	wrpr	%r0, 0x01bd, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8b494000  ! 1131: RDHPR_HTBA	rdhpr	%htba, %r5
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1132: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02030  ! 1133: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x8790226f  ! 1134: WRPR_TT_I	wrpr	%r0, 0x026f, %tt
	.word 0x91d02032  ! 1135: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xcac7e000  ! 1136: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r5
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902a53  ! 1138: WRPR_PSTATE_I	wrpr	%r0, 0x0a53, %pstate
	.word 0xb282800a  ! 1139: ADDcc_R	addcc 	%r10, %r10, %r25
	.word 0x87902124  ! 1140: WRPR_TT_I	wrpr	%r0, 0x0124, %tt
	.word 0xa9a00549  ! 1141: FSQRTd	fsqrt	
	.word 0x2e800001  ! 1142: BVS	bvs,a	<label_0x1>
DS_75:
	.word 0x22800001  ! 1144: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1143: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x2c800001  ! 1144: BNEG	bneg,a	<label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1145: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c46  ! 1146: WRPR_PSTATE_I	wrpr	%r0, 0x0c46, %pstate
	.word 0x8d902ac3  ! 1147: WRPR_PSTATE_I	wrpr	%r0, 0x0ac3, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902005  ! 1149: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81982b44  ! 1150: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b44, %hpstate
	.word 0x99508000  ! 1151: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x91d02035  ! 1152: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982ad7  ! 1153: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad7, %hpstate
DS_76:
	.word 0x32800001  ! 1155: BNE	bne,a	<label_0x1>
	pdist %f2, %f28, %f30
	.word 0x87b28300  ! 1154: ALLIGNADDRESS	alignaddr	%r10, %r0, %r3
	.word 0x91d02033  ! 1155: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8fb64feb  ! 1156: FONES	fones	%f7
	.word 0xa3b10fe8  ! 1157: FONES	fones	%f17
	.word 0x8790221b  ! 1158: WRPR_TT_I	wrpr	%r0, 0x021b, %tt
	.word 0x85508000  ! 1159: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x93902001  ! 1160: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02032  ! 1161: Tcc_I	ta	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1163: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790234c  ! 1164: WRPR_TT_I	wrpr	%r0, 0x034c, %tt
	.word 0x81982cd9  ! 1165: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd9, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1166: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 1167: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xc48008a0  ! 1168: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x8198271c  ! 1169: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071c, %hpstate
	.word 0x87802004  ! 1170: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc48008a0  ! 1171: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
change_to_randtl_77:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1172: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97702001  ! 1174: POPC_I	popc	0x0001, %r11
	.word 0xaf540000  ! 1175: RDPR_GL	rdpr	%-, %r23
	.word 0xef37e001  ! 1176: STQF_I	-	%f23, [0x0001, %r31]
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 1178: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87902052  ! 1179: WRPR_TT_I	wrpr	%r0, 0x0052, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0xaf702001  ! 1181: POPC_I	popc	0x0001, %r23
	.word 0x8d902e5f  ! 1182: WRPR_PSTATE_I	wrpr	%r0, 0x0e5f, %pstate
	.word 0x879023cd  ! 1183: WRPR_TT_I	wrpr	%r0, 0x03cd, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982243  ! 1185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0243, %hpstate
	.word 0xee7fe001  ! 1186: SWAP_I	swap	%r23, [%r31 + 0x0001]
	.word 0x8f902002  ! 1172: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982c9a  ! 1187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9a, %hpstate
	.word 0x93902003  ! 1188: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1189: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1190: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902005  ! 1192: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa350c000  ! 1193: RDPR_TT	rdpr	%tt, %r17
	.word 0x87902164  ! 1194: WRPR_TT_I	wrpr	%r0, 0x0164, %tt
	.word 0x819823d0  ! 1195: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d0, %hpstate
	.word 0x8b480000  ! 1196: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x819829d4  ! 1197: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d4, %hpstate
	.word 0x91500000  ! 1198: RDPR_TPC	rdpr	%tpc, %r8
	.word 0x879022e7  ! 1199: WRPR_TT_I	wrpr	%r0, 0x02e7, %tt
	.word 0x93902001  ! 1200: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x97a000db  ! 1201: FNEGd	fnegd	%f58, %f42
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1202: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 1203: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x866b2001  ! 1204: UDIVX_I	udivx 	%r12, 0x0001, %r3
	.word 0x92d1a001  ! 1205: UMULcc_I	umulcc 	%r6, 0x0001, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 1207: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f802001  ! 1208: SIR	sir	0x0001
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1209: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902040  ! 1210: WRPR_PSTATE_I	wrpr	%r0, 0x0040, %pstate
	.word 0x85540000  ! 1211: RDPR_GL	rdpr	%-, %r2
	.word 0x93902000  ! 1212: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1213: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 1214: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x95a00559  ! 1215: FSQRTd	fsqrt	
	.word 0x8d902244  ! 1216: WRPR_PSTATE_I	wrpr	%r0, 0x0244, %pstate
	.word 0x8d9026dd  ! 1217: WRPR_PSTATE_I	wrpr	%r0, 0x06dd, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd477e001  ! 1219: STX_I	stx	%r10, [%r31 + 0x0001]
	.word 0x99a00540  ! 1220: FSQRTd	fsqrt	
DS_78:
	.word 0x20800001  ! 1222: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1221: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xb2d02001  ! 1222: UMULcc_I	umulcc 	%r0, 0x0001, %r25
DS_79:
	.word 0x32800001  ! 1224: BNE	bne,a	<label_0x1>
	.word 0xc1308011  ! 1224: STQF_R	-	%f0, [%r17, %r2]
	normalw
	.word 0xb3458000  ! 1223: RD_SOFTINT_REG	rd	%softint, %r25
	.word 0xa190200b  ! 1224: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93902002  ! 1225: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xb1508000  ! 1226: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x81982716  ! 1227: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0716, %hpstate
	.word 0xa1902002  ! 1228: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa1902009  ! 1229: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa190200c  ! 1230: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x91d02032  ! 1231: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x96a88015  ! 1232: ANDNcc_R	andncc 	%r2, %r21, %r11
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1233: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xaa4d0013  ! 1234: MULX_R	mulx 	%r20, %r19, %r21
	.word 0x879020d7  ! 1235: WRPR_TT_I	wrpr	%r0, 0x00d7, %tt
	.word 0xea8008a0  ! 1236: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0xa1902002  ! 1237: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x819823c4  ! 1238: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c4, %hpstate
	.word 0xeaffc033  ! 1239: SWAPA_R	swapa	%r21, [%r31 + %r19] 0x01
	.word 0x81982242  ! 1240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0242, %hpstate
change_to_randtl_80:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1241: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xeacfe030  ! 1242: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r21
	.word 0x819820c1  ! 1243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c1, %hpstate
	.word 0xea9fc020  ! 1244: LDDA_R	ldda	[%r31, %r0] 0x01, %r21
	.word 0x8d902e1a  ! 1245: WRPR_PSTATE_I	wrpr	%r0, 0x0e1a, %pstate
	.word 0x879020eb  ! 1246: WRPR_TT_I	wrpr	%r0, 0x00eb, %tt
	.word 0x8da649e6  ! 1247: FDIVq	dis not found

	.word 0x93902000  ! 1248: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa8848002  ! 1249: ADDcc_R	addcc 	%r18, %r2, %r20
	.word 0x8790206a  ! 1250: WRPR_TT_I	wrpr	%r0, 0x006a, %tt
	.word 0xa190200c  ! 1251: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x85682001  ! 1252: SDIVX_I	sdivx	%r0, 0x0001, %r2
	.word 0x93902000  ! 1253: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902002  ! 1254: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x879022d3  ! 1255: WRPR_TT_I	wrpr	%r0, 0x02d3, %tt
	.word 0x81982bde  ! 1256: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bde, %hpstate
	.word 0xc4d804a0  ! 1257: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0xc4800b60  ! 1258: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r2
	.word 0xa1902005  ! 1259: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81a04dc3  ! 1260: FdMULq	fdmulq	
	.word 0x8d90225e  ! 1261: WRPR_PSTATE_I	wrpr	%r0, 0x025e, %pstate
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1262: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 1263: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x99500000  ! 1265: RDPR_TPC	rdpr	%tpc, %r12
	.word 0xd8c804a0  ! 1266: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x87540000  ! 1267: RDPR_GL	rdpr	%-, %r3
	.word 0x93d02033  ! 1268: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa1902000  ! 1269: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x8c80400c  ! 1271: ADDcc_R	addcc 	%r1, %r12, %r6
	.word 0xae490001  ! 1272: MULX_R	mulx 	%r4, %r1, %r23
DS_81:
	.word 0x34800001  ! 1274: BG	bg,a	<label_0x1>
	allclean
	.word 0x85b44319  ! 1273: ALLIGNADDRESS	alignaddr	%r17, %r25, %r2
	.word 0x87902035  ! 1274: WRPR_TT_I	wrpr	%r0, 0x0035, %tt
	.word 0x91d02031  ! 1275: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902005  ! 1276: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87902195  ! 1277: WRPR_TT_I	wrpr	%r0, 0x0195, %tt
	.word 0x91d02034  ! 1278: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x879020ee  ! 1279: WRPR_TT_I	wrpr	%r0, 0x00ee, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x819825db  ! 1281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05db, %hpstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1282: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc48fe020  ! 1283: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r2
	.word 0x81982355  ! 1284: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0355, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1285: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93540000  ! 1286: RDPR_GL	rdpr	%-, %r9
	.word 0xd207c000  ! 1287: LDUW_R	lduw	[%r31 + %r0], %r9
	.word 0x879023d7  ! 1288: WRPR_TT_I	wrpr	%r0, 0x03d7, %tt
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1289: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790212e  ! 1290: WRPR_TT_I	wrpr	%r0, 0x012e, %tt
	.word 0x879020a3  ! 1291: WRPR_TT_I	wrpr	%r0, 0x00a3, %tt
	.word 0x91d02030  ! 1292: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8fa58d26  ! 1293: FsMULd	fsmuld	%f22, %f6, %f38
	.word 0xa190200b  ! 1294: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xce800b40  ! 1295: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r7
	.word 0x91d02030  ! 1296: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x95a2cdc4  ! 1297: FdMULq	fdmulq	
	.word 0xa190200a  ! 1298: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93902000  ! 1299: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902007  ! 1300: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd4800c00  ! 1301: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r10
	.word 0x93902003  ! 1302: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x9afa2001  ! 1303: SDIVcc_I	sdivcc 	%r8, 0x0001, %r13
DS_82:
	.word 0x34800001  ! 1305: BG	bg,a	<label_0x1>
	pdist %f22, %f24, %f20
	.word 0x93b1831a  ! 1304: ALLIGNADDRESS	alignaddr	%r6, %r26, %r9
	.word 0xa5a00dc0  ! 1305: FdMULq	fdmulq	
	.word 0x91d02030  ! 1306: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1a64dcc  ! 1308: FdMULq	fdmulq	
	.word 0x91d02031  ! 1309: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa190200c  ! 1310: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1311: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x20800001  ! 1312: BN	bn,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02031  ! 1314: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8082400c  ! 1315: ADDcc_R	addcc 	%r9, %r12, %r0
	.word 0x8d902c18  ! 1316: WRPR_PSTATE_I	wrpr	%r0, 0x0c18, %pstate
	.word 0x2c800001  ! 1317: BNEG	bneg,a	<label_0x1>
	.word 0x879020a1  ! 1318: WRPR_TT_I	wrpr	%r0, 0x00a1, %tt
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1319: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc097e030  ! 1320: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r0
	.word 0x8d902e4d  ! 1321: WRPR_PSTATE_I	wrpr	%r0, 0x0e4d, %pstate
	.word 0x81982985  ! 1322: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0985, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
change_to_tl1_83:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87802014  ! 1325: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902000  ! 1326: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa190200f  ! 1327: WRPR_GL_I	wrpr	%r0, 0x000f, %-
DS_84:
	.word 0x22800001  ! 1329: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1328: SAVE_R	save	%r31, %r0, %r31
	.word 0x8790201f  ! 1329: WRPR_TT_I	wrpr	%r0, 0x001f, %tt
	.word 0x8d902285  ! 1330: WRPR_PSTATE_I	wrpr	%r0, 0x0285, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1331: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902008  ! 1332: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x85b58fe8  ! 1333: FONES	fones	%f2
	.word 0x87902185  ! 1334: WRPR_TT_I	wrpr	%r0, 0x0185, %tt
	.word 0x879020a8  ! 1335: WRPR_TT_I	wrpr	%r0, 0x00a8, %tt
	.word 0x87802004  ! 1336: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902e17  ! 1337: WRPR_PSTATE_I	wrpr	%r0, 0x0e17, %pstate
	.word 0x8d504000  ! 1338: RDPR_TNPC	rdpr	%tnpc, %r6
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1339: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02031  ! 1340: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x8d802000  ! 1341: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879022e7  ! 1342: WRPR_TT_I	wrpr	%r0, 0x02e7, %tt
	.word 0x87540000  ! 1343: RDPR_GL	rdpr	%-, %r3
	.word 0x91d02033  ! 1344: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902a4d  ! 1345: WRPR_PSTATE_I	wrpr	%r0, 0x0a4d, %pstate
	.word 0x87902188  ! 1346: WRPR_TT_I	wrpr	%r0, 0x0188, %tt
	.word 0x8d902655  ! 1347: WRPR_PSTATE_I	wrpr	%r0, 0x0655, %pstate
	.word 0x9b540000  ! 1348: RDPR_GL	rdpr	%-, %r13
	.word 0x816c8010  ! 1349: SDIVX_R	sdivx	%r18, %r16, %r0
	.word 0x87902237  ! 1350: WRPR_TT_I	wrpr	%r0, 0x0237, %tt
	.word 0xb5500000  ! 1351: RDPR_TPC	rdpr	%tpc, %r26
	.word 0xa5a00571  ! 1352: FSQRTq	fsqrt	
	.word 0x89a6c9a0  ! 1353: FDIVs	fdivs	%f27, %f0, %f4
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02034  ! 1355: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1356: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc8800b80  ! 1357: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r4
	.word 0x8b514000  ! 1358: RDPR_TBA	<illegal instruction>
	.word 0x93902005  ! 1359: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819820d8  ! 1361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d8, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83d02032  ! 1363: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x99902003  ! 1364: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x93902003  ! 1365: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02033  ! 1366: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1367: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 1368: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93508000  ! 1369: RDPR_TSTATE	rdpr	%tstate, %r9
	.word 0xd28008a0  ! 1370: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xa190200b  ! 1371: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93902007  ! 1372: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1373: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902243  ! 1374: WRPR_PSTATE_I	wrpr	%r0, 0x0243, %pstate
	.word 0x93902002  ! 1375: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x92da000b  ! 1376: SMULcc_R	smulcc 	%r8, %r11, %r9
	.word 0x90d24014  ! 1377: UMULcc_R	umulcc 	%r9, %r20, %r8
	.word 0x91d02030  ! 1378: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d90229c  ! 1379: WRPR_PSTATE_I	wrpr	%r0, 0x029c, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d504000  ! 1381: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0x81982582  ! 1382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0582, %hpstate
DS_85:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1383: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x87902144  ! 1384: WRPR_TT_I	wrpr	%r0, 0x0144, %tt
	.word 0x81982f07  ! 1385: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f07, %hpstate
	.word 0x8b508000  ! 1386: RDPR_TSTATE	rdpr	%tstate, %r5
DS_86:
	.word 0x32800001  ! 1388: BNE	bne,a	<label_0x1>
	pdist %f12, %f10, %f26
	.word 0xa3b00304  ! 1387: ALLIGNADDRESS	alignaddr	%r0, %r4, %r17
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1388: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x90fb6001  ! 1389: SDIVcc_I	sdivcc 	%r13, 0x0001, %r8
change_to_randtl_87:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1390: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x879023f5  ! 1391: WRPR_TT_I	wrpr	%r0, 0x03f5, %tt
	.word 0x81982e84  ! 1392: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e84, %hpstate
	.word 0x91d02031  ! 1393: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87902308  ! 1394: WRPR_TT_I	wrpr	%r0, 0x0308, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d500000  ! 1396: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x8790201a  ! 1397: WRPR_TT_I	wrpr	%r0, 0x001a, %tt
	.word 0x87a00568  ! 1398: FSQRTq	fsqrt	
	.word 0xc727e001  ! 1399: STF_I	st	%f3, [0x0001, %r31]
	.word 0x879023f9  ! 1400: WRPR_TT_I	wrpr	%r0, 0x03f9, %tt
	.word 0xc64fc000  ! 1401: LDSB_R	ldsb	[%r31 + %r0], %r3
	.word 0x8d802000  ! 1402: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902007  ! 1403: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1404: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1405: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879021c4  ! 1406: WRPR_TT_I	wrpr	%r0, 0x01c4, %tt
	.word 0x9b68c00d  ! 1407: SDIVX_R	sdivx	%r3, %r13, %r13
	.word 0xa1902001  ! 1408: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1409: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 1410: Tcc_I	ta	icc_or_xcc, %r0 + 48
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1411: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8790237b  ! 1412: WRPR_TT_I	wrpr	%r0, 0x037b, %tt
	.word 0x89a000d4  ! 1413: FNEGd	fnegd	%f20, %f4
	.word 0x80d42001  ! 1414: UMULcc_I	umulcc 	%r16, 0x0001, %r0
	.word 0xa1902006  ! 1415: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87802089  ! 1416: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa1902007  ! 1417: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa190200d  ! 1418: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1419: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 1420: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8ba00559  ! 1421: FSQRTd	fsqrt	
	.word 0xca07c000  ! 1422: LDUW_R	lduw	[%r31 + %r0], %r5
	.word 0x8950c000  ! 1423: RDPR_TT	rdpr	%tt, %r4
	.word 0x99494000  ! 1424: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0x8d902005  ! 1425: WRPR_PSTATE_I	wrpr	%r0, 0x0005, %pstate
DS_88:
	.word 0x22800001  ! 1427: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1426: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02030  ! 1427: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x83d02034  ! 1428: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87902391  ! 1429: WRPR_TT_I	wrpr	%r0, 0x0391, %tt
	.word 0xa1902004  ! 1430: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x89a10dcc  ! 1431: FdMULq	fdmulq	
	.word 0x9ba1c9d0  ! 1432: FDIVd	fdivd	%f38, %f16, %f44
	.word 0x91d02030  ! 1433: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x91d02033  ! 1434: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1435: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902814  ! 1436: WRPR_PSTATE_I	wrpr	%r0, 0x0814, %pstate
	.word 0x87802010  ! 1437: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8f514000  ! 1438: RDPR_TBA	rdpr	%tba, %r7
	.word 0x8d902247  ! 1439: WRPR_PSTATE_I	wrpr	%r0, 0x0247, %pstate
change_to_randtl_89:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1440: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x879020c3  ! 1441: WRPR_TT_I	wrpr	%r0, 0x00c3, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1442: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x886a000c  ! 1443: UDIVX_R	udivx 	%r8, %r12, %r4
	.word 0x819829c7  ! 1444: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c7, %hpstate
	.word 0xc85fe001  ! 1445: LDX_I	ldx	[%r31 + 0x0001], %r4
	.word 0x99514000  ! 1446: RDPR_TBA	rdpr	%tba, %r12
	.word 0x93d02034  ! 1447: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x93d02032  ! 1448: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8f514000  ! 1449: RDPR_TBA	rdpr	%tba, %r7
	.word 0x93902005  ! 1450: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902e97  ! 1451: WRPR_PSTATE_I	wrpr	%r0, 0x0e97, %pstate
change_to_randtl_90:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1452: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d9028da  ! 1453: WRPR_PSTATE_I	wrpr	%r0, 0x08da, %pstate
	.word 0x8cdcc018  ! 1454: SMULcc_R	smulcc 	%r19, %r24, %r6
	.word 0xcc7fe001  ! 1455: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0xa190200e  ! 1456: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x91d02034  ! 1457: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x85a000d0  ! 1458: FNEGd	fnegd	%f16, %f2
	.word 0x8790212b  ! 1459: WRPR_TT_I	wrpr	%r0, 0x012b, %tt
	.word 0x8f504000  ! 1460: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0xcedfe000  ! 1461: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	.word 0xce07c000  ! 1462: LDUW_R	lduw	[%r31 + %r0], %r7
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1463: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790216f  ! 1464: WRPR_TT_I	wrpr	%r0, 0x016f, %tt
	.word 0x879021a7  ! 1465: WRPR_TT_I	wrpr	%r0, 0x01a7, %tt
	.word 0x91d02031  ! 1466: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d9022c9  ! 1467: WRPR_PSTATE_I	wrpr	%r0, 0x02c9, %pstate
	.word 0x83d02034  ! 1468: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8f480000  ! 1469: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x9f802001  ! 1470: SIR	sir	0x0001
	.word 0x879020e4  ! 1471: WRPR_TT_I	wrpr	%r0, 0x00e4, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x24700001  ! 1473: BPLE	<illegal instruction>
	.word 0xa1902004  ! 1474: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93902004  ! 1475: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81982682  ! 1476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0682, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93902004  ! 1478: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8cfe4016  ! 1479: SDIVcc_R	sdivcc 	%r25, %r22, %r6
	.word 0x80682001  ! 1480: UDIVX_I	udivx 	%r0, 0x0001, %r0
	.word 0xa190200c  ! 1481: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x826d2001  ! 1482: UDIVX_I	udivx 	%r20, 0x0001, %r1
	.word 0xa190200f  ! 1483: WRPR_GL_I	wrpr	%r0, 0x000f, %-
change_to_tl1_91:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xc29fc020  ! 1485: LDDA_R	ldda	[%r31, %r0] 0x01, %r1
	.word 0x9ad3400b  ! 1486: UMULcc_R	umulcc 	%r13, %r11, %r13
	.word 0x8790221e  ! 1487: WRPR_TT_I	wrpr	%r0, 0x021e, %tt
	.word 0xb2fd6001  ! 1488: SDIVcc_I	sdivcc 	%r21, 0x0001, %r25
	.word 0xf2c804a0  ! 1489: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r25
	.word 0x91d02034  ! 1490: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa190200e  ! 1491: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xf2ffc02b  ! 1492: SWAPA_R	swapa	%r25, [%r31 + %r11] 0x01
	.word 0xa1902000  ! 1493: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_92:
	.word 0x22800001  ! 1495: BE	be,a	<label_0x1>
	illtrap
	.word 0x91a00545  ! 1495: FSQRTd	fsqrt	
	.word 0x8fa14837  ! 1494: FADDs	fadds	%f5, %f23, %f7
	.word 0x83d02030  ! 1495: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x8d6d6001  ! 1496: SDIVX_I	sdivx	%r21, 0x0001, %r6
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1497: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902313  ! 1498: WRPR_TT_I	wrpr	%r0, 0x0313, %tt
	.word 0xaad1c003  ! 1499: UMULcc_R	umulcc 	%r7, %r3, %r21
	.word 0xb0c62001  ! 1500: ADDCcc_I	addccc 	%r24, 0x0001, %r24
	.word 0xa190200e  ! 1501: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa1902003  ! 1502: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x91d02032  ! 1503: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81a01a62  ! 1504: FqTOi	fqtoi	
	.word 0x91d02032  ! 1505: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81982dce  ! 1506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dce, %hpstate
	.word 0x9f802001  ! 1507: SIR	sir	0x0001
	.word 0x9f802001  ! 1508: SIR	sir	0x0001
	.word 0xa7a00540  ! 1509: FSQRTd	fsqrt	
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982b53  ! 1511: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b53, %hpstate
	.word 0x81982a82  ! 1512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a82, %hpstate
	.word 0x85a00dc0  ! 1513: FdMULq	fdmulq	
	.word 0x9950c000  ! 1514: RDPR_TT	rdpr	%tt, %r12
	.word 0x9f802001  ! 1515: SIR	sir	0x0001
	.word 0xa190200d  ! 1516: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x879022a2  ! 1517: WRPR_TT_I	wrpr	%r0, 0x02a2, %tt
	.word 0xd89fc020  ! 1518: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x90d0e001  ! 1519: UMULcc_I	umulcc 	%r3, 0x0001, %r8
	.word 0x93902001  ! 1520: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902006  ! 1521: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d9026c7  ! 1522: WRPR_PSTATE_I	wrpr	%r0, 0x06c7, %pstate
	.word 0x8d90249f  ! 1523: WRPR_PSTATE_I	wrpr	%r0, 0x049f, %pstate
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1524: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd03fe001  ! 1525: STD_I	std	%r8, [%r31 + 0x0001]
	.word 0xaad12001  ! 1526: UMULcc_I	umulcc 	%r4, 0x0001, %r21
	.word 0x93902002  ! 1527: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91a58d37  ! 1528: FsMULd	fsmuld	%f22, %f54, %f8
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1529: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 1530: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1531: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902056  ! 1532: WRPR_TT_I	wrpr	%r0, 0x0056, %tt
	.word 0xd0d80e60  ! 1533: LDXA_R	ldxa	[%r0, %r0] 0x73, %r8
change_to_tl1_93:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902c8c  ! 1535: WRPR_PSTATE_I	wrpr	%r0, 0x0c8c, %pstate
	.word 0x93902007  ! 1536: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8790205e  ! 1537: WRPR_TT_I	wrpr	%r0, 0x005e, %tt
DS_94:
	.word 0x22800001  ! 1539: BE	be,a	<label_0x1>
	.word 0xf3332001  ! 1539: STQF_I	-	%f25, [0x0001, %r12]
	normalw
	.word 0x99458000  ! 1538: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8790229d  ! 1539: WRPR_TT_I	wrpr	%r0, 0x029d, %tt
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1540: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99702001  ! 1541: POPC_I	popc	0x0001, %r12
	.word 0x9f802001  ! 1542: SIR	sir	0x0001
	.word 0x8d802000  ! 1543: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902006  ! 1544: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x90d42001  ! 1545: UMULcc_I	umulcc 	%r16, 0x0001, %r8
	.word 0x8ba01a60  ! 1546: FqTOi	fqtoi	
	.word 0x89a000c2  ! 1547: FNEGd	fnegd	%f2, %f4
	.word 0x22700001  ! 1548: BPE	<illegal instruction>
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1549: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 1550: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x81982419  ! 1551: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0419, %hpstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1552: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02031  ! 1553: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xa1902000  ! 1554: WRPR_GL_I	wrpr	%r0, 0x0000, %-
change_to_tl1_95:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1902002  ! 1556: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x91d02031  ! 1557: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902002  ! 1558: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902007  ! 1559: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83500000  ! 1561: RDPR_TPC	rdpr	%tpc, %r1
DS_96:
	.word 0x34800001  ! 1563: BG	bg,a	<label_0x1>
	.word 0xcd300007  ! 1563: STQF_R	-	%f6, [%r7, %r0]
	normalw
	.word 0x8d458000  ! 1562: RD_SOFTINT_REG	rd	%softint, %r6
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1563: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc97e020  ! 1564: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r6
	.word 0x85504000  ! 1565: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x8d902e59  ! 1566: WRPR_PSTATE_I	wrpr	%r0, 0x0e59, %pstate
	.word 0x93902003  ! 1567: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_tl1_97:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x83d02032  ! 1569: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x879020df  ! 1570: WRPR_TT_I	wrpr	%r0, 0x00df, %tt
change_to_randtl_98:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1571: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x92aa0008  ! 1572: ANDNcc_R	andncc 	%r8, %r8, %r9
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1573: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1574: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02032  ! 1575: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_99:
	.word 0x20800001  ! 1577: BN	bn,a	<label_0x1>
	allclean
	.word 0x8fb0c30c  ! 1576: ALLIGNADDRESS	alignaddr	%r3, %r12, %r7
	.word 0xcf27c00c  ! 1577: STF_R	st	%f7, [%r12, %r31]
	.word 0xa9a000da  ! 1578: FNEGd	fnegd	%f26, %f20
	.word 0x95a64d21  ! 1579: FsMULd	fsmuld	%f25, %f32, %f10
	.word 0x8d902483  ! 1580: WRPR_PSTATE_I	wrpr	%r0, 0x0483, %pstate
	.word 0x93902007  ! 1581: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa150c000  ! 1582: RDPR_TT	rdpr	%tt, %r16
	.word 0x8198281b  ! 1583: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081b, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1584: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 1585: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8aae400a  ! 1586: ANDNcc_R	andncc 	%r25, %r10, %r5
	.word 0x95a00550  ! 1587: FSQRTd	fsqrt	
	.word 0x8b51c000  ! 1588: RDPR_TL	rdpr	%tl, %r5
	.word 0x93902003  ! 1589: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902483  ! 1590: WRPR_PSTATE_I	wrpr	%r0, 0x0483, %pstate
	.word 0x92822001  ! 1591: ADDcc_I	addcc 	%r8, 0x0001, %r9
	.word 0x81982dc3  ! 1592: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc3, %hpstate
	.word 0x81982690  ! 1593: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0690, %hpstate
	.word 0xa190200e  ! 1594: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xd28008a0  ! 1595: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d902a17  ! 1596: WRPR_PSTATE_I	wrpr	%r0, 0x0a17, %pstate
	.word 0x93902001  ! 1597: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1598: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1599: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02035  ! 1600: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982f82  ! 1601: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f82, %hpstate
	.word 0x8d902655  ! 1602: WRPR_PSTATE_I	wrpr	%r0, 0x0655, %pstate
	.word 0x91d02030  ! 1603: Tcc_I	ta	icc_or_xcc, %r0 + 48
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd2c7e020  ! 1605: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r9
	.word 0x91d02031  ! 1606: Tcc_I	ta	icc_or_xcc, %r0 + 49
change_to_tl1_100:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb66e2001  ! 1609: UDIVX_I	udivx 	%r24, 0x0001, %r27
DS_101:
	.word 0x32800001  ! 1611: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1610: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x95504000  ! 1611: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0xd4880e60  ! 1612: LDUBA_R	lduba	[%r0, %r0] 0x73, %r10
	.word 0x91d02034  ! 1613: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7514000  ! 1615: RDPR_TBA	rdpr	%tba, %r19
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90201e  ! 1617: WRPR_PSTATE_I	wrpr	%r0, 0x001e, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x866ac007  ! 1619: UDIVX_R	udivx 	%r11, %r7, %r3
	.word 0xa1902001  ! 1620: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x9ad52001  ! 1621: UMULcc_I	umulcc 	%r20, 0x0001, %r13
	.word 0x93902007  ! 1622: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xda1fc000  ! 1623: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x84aa0009  ! 1624: ANDNcc_R	andncc 	%r8, %r9, %r2
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1625: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc47fe001  ! 1627: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0x879021aa  ! 1628: WRPR_TT_I	wrpr	%r0, 0x01aa, %tt
	.word 0xc407e001  ! 1629: LDUW_I	lduw	[%r31 + 0x0001], %r2
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1630: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200b  ! 1631: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93902003  ! 1632: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_NONHPRIV	! macro
DS_102:
	.word 0x34800001  ! 1635: BG	bg,a	<label_0x1>
	.word 0xd736a001  ! 1635: STQF_I	-	%f11, [0x0001, %r26]
	normalw
	.word 0x91458000  ! 1634: RD_SOFTINT_REG	rd	%softint, %r8
	ta	T_CHANGE_PRIV	! macro
	.word 0xa190200f  ! 1636: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x819825c2  ! 1637: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c2, %hpstate
	.word 0x99902005  ! 1638: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902009  ! 1640: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa190200c  ! 1641: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1642: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd0c7e010  ! 1643: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r8
	.word 0xa169800c  ! 1644: SDIVX_R	sdivx	%r6, %r12, %r16
DS_103:
	.word 0x20800001  ! 1646: BN	bn,a	<label_0x1>
	pdist %f12, %f14, %f26
	.word 0xafb08306  ! 1645: ALLIGNADDRESS	alignaddr	%r2, %r6, %r23
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1646: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb2832001  ! 1647: ADDcc_I	addcc 	%r12, 0x0001, %r25
	.word 0x81982654  ! 1648: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0654, %hpstate
	.word 0x93902005  ! 1649: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982d50  ! 1650: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d50, %hpstate
	.word 0x8d9024c3  ! 1651: WRPR_PSTATE_I	wrpr	%r0, 0x04c3, %pstate
	.word 0xa1902003  ! 1652: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8790209b  ! 1653: WRPR_TT_I	wrpr	%r0, 0x009b, %tt
	.word 0x91d02034  ! 1654: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa190200e  ! 1655: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa0fc6001  ! 1656: SDIVcc_I	sdivcc 	%r17, 0x0001, %r16
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8790227d  ! 1658: WRPR_TT_I	wrpr	%r0, 0x027d, %tt
	.word 0x93902001  ! 1659: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1660: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1661: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 1662: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1663: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x819824d2  ! 1664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d2, %hpstate
	.word 0x8d51c000  ! 1665: RDPR_TL	rdpr	%tl, %r6
	.word 0x87902392  ! 1666: WRPR_TT_I	wrpr	%r0, 0x0392, %tt
	.word 0xa190200f  ! 1667: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x879022e9  ! 1668: WRPR_TT_I	wrpr	%r0, 0x02e9, %tt
	.word 0x81504000  ! 1669: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0xa190200b  ! 1670: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1671: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902070  ! 1672: WRPR_TT_I	wrpr	%r0, 0x0070, %tt
	.word 0xa1902003  ! 1673: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xc077e001  ! 1674: STX_I	stx	%r0, [%r31 + 0x0001]
	.word 0xc0c7e000  ! 1675: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1676: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879022bd  ! 1677: WRPR_TT_I	wrpr	%r0, 0x02bd, %tt
	.word 0xa1902002  ! 1678: WRPR_GL_I	wrpr	%r0, 0x0002, %-
DS_104:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1679: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x879020c9  ! 1680: WRPR_TT_I	wrpr	%r0, 0x00c9, %tt
	.word 0x8d802000  ! 1681: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1682: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x34800001  ! 1683: BG	bg,a	<label_0x1>
	.word 0x93902006  ! 1684: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x926c2001  ! 1685: UDIVX_I	udivx 	%r16, 0x0001, %r9
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd257c000  ! 1687: LDSH_R	ldsh	[%r31 + %r0], %r9
	.word 0x8168800c  ! 1688: SDIVX_R	sdivx	%r2, %r12, %r0
	.word 0x8198230f  ! 1689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030f, %hpstate
	.word 0x93902002  ! 1690: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x99902000  ! 1691: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8790210b  ! 1692: WRPR_TT_I	wrpr	%r0, 0x010b, %tt
	.word 0x93902006  ! 1693: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d802004  ! 1694: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc09fc020  ! 1695: LDDA_R	ldda	[%r31, %r0] 0x01, %r0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9f802001  ! 1697: SIR	sir	0x0001
change_to_randtl_105:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1698: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x91d02031  ! 1699: Tcc_I	ta	icc_or_xcc, %r0 + 49
change_to_randtl_106:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1700: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8198289c  ! 1701: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089c, %hpstate
	.word 0x819828d5  ! 1702: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d5, %hpstate
	.word 0x89a00563  ! 1703: FSQRTq	fsqrt	
	.word 0x92acc007  ! 1704: ANDNcc_R	andncc 	%r19, %r7, %r9
	.word 0x2c700001  ! 1705: BPNEG	<illegal instruction>
	.word 0xd337e001  ! 1706: STQF_I	-	%f9, [0x0001, %r31]
	.word 0x81982197  ! 1707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0197, %hpstate
change_to_tl1_107:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x84fb6001  ! 1709: SDIVcc_I	sdivcc 	%r13, 0x0001, %r2
	.word 0xb1a10dd0  ! 1710: FdMULq	fdmulq	
	.word 0xf09004a0  ! 1711: LDUHA_R	lduha	[%r0, %r0] 0x25, %r24
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1712: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1713: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 1714: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa7500000  ! 1715: RDPR_TPC	rdpr	%tpc, %r19
	.word 0x91d02033  ! 1716: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d702001  ! 1717: POPC_I	popc	0x0001, %r6
	.word 0x87802010  ! 1718: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87902223  ! 1719: WRPR_TT_I	wrpr	%r0, 0x0223, %tt
	.word 0x9f802001  ! 1720: SIR	sir	0x0001
	.word 0x81982408  ! 1721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0408, %hpstate
	.word 0x81982e98  ! 1722: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e98, %hpstate
	.word 0x879021c3  ! 1723: WRPR_TT_I	wrpr	%r0, 0x01c3, %tt
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90204d  ! 1725: WRPR_PSTATE_I	wrpr	%r0, 0x004d, %pstate
	.word 0x819826dc  ! 1726: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06dc, %hpstate
	.word 0x81982dc0  ! 1727: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc0, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1728: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8951c000  ! 1729: RDPR_TL	rdpr	%tl, %r4
	.word 0x93d02031  ! 1730: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x81982446  ! 1731: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0446, %hpstate
	.word 0x87902119  ! 1732: WRPR_TT_I	wrpr	%r0, 0x0119, %tt
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9b540000  ! 1734: RDPR_GL	rdpr	%-, %r13
	.word 0x8d90268d  ! 1735: WRPR_PSTATE_I	wrpr	%r0, 0x068d, %pstate
	.word 0x91d02030  ! 1736: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xdb37e001  ! 1737: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x93902002  ! 1738: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02035  ! 1739: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xda97e000  ! 1740: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
	.word 0x87802016  ! 1741: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xdb27e001  ! 1742: STF_I	st	%f13, [0x0001, %r31]
	.word 0x91d02034  ! 1743: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xda3fe001  ! 1744: STD_I	std	%r13, [%r31 + 0x0001]
	.word 0xb3504000  ! 1745: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x97514000  ! 1746: RDPR_TBA	<illegal instruction>
	.word 0xd6d7e000  ! 1747: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
	.word 0x87802014  ! 1748: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa1902009  ! 1749: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd6ffc030  ! 1750: SWAPA_R	swapa	%r11, [%r31 + %r16] 0x01
	.word 0xa190200f  ! 1751: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x90682001  ! 1752: UDIVX_I	udivx 	%r0, 0x0001, %r8
	.word 0x87902302  ! 1753: WRPR_TT_I	wrpr	%r0, 0x0302, %tt
	.word 0xacaec018  ! 1754: ANDNcc_R	andncc 	%r27, %r24, %r22
	.word 0x87494000  ! 1755: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0x93696001  ! 1756: SDIVX_I	sdivx	%r5, 0x0001, %r9
	.word 0xd2cfe030  ! 1757: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r9
	.word 0x8d514000  ! 1758: RDPR_TBA	rdpr	%tba, %r6
	.word 0x93902007  ! 1759: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81a1cd27  ! 1760: FsMULd	fsmuld	%f7, %f38, %f0
	.word 0x81982c4e  ! 1761: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4e, %hpstate
	.word 0xa3504000  ! 1762: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x8d9022d5  ! 1763: WRPR_PSTATE_I	wrpr	%r0, 0x02d5, %pstate
	.word 0x93902005  ! 1764: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe2d804a0  ! 1765: LDXA_R	ldxa	[%r0, %r0] 0x25, %r17
	.word 0x8d802004  ! 1766: WRFPRS_I	wr	%r0, 0x0004, %fprs
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1767: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1768: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe24fe001  ! 1769: LDSB_I	ldsb	[%r31 + 0x0001], %r17
	.word 0x93902000  ! 1770: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8b500000  ! 1771: RDPR_TPC	rdpr	%tpc, %r5
	.word 0x87902355  ! 1772: WRPR_TT_I	wrpr	%r0, 0x0355, %tt
	.word 0xa190200e  ! 1773: WRPR_GL_I	wrpr	%r0, 0x000e, %-
DS_108:
	.word 0x22800001  ! 1775: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1774: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa1902007  ! 1776: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x26800001  ! 1777: BL	bl,a	<label_0x1>
change_to_randtl_109:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1778: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
change_to_randtl_110:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1779: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x879020cd  ! 1780: WRPR_TT_I	wrpr	%r0, 0x00cd, %tt
	.word 0x93902005  ! 1781: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xcb37e001  ! 1782: STQF_I	-	%f5, [0x0001, %r31]
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02031  ! 1784: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xcad004a0  ! 1785: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0x99902004  ! 1786: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x81982a02  ! 1787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a02, %hpstate
	.word 0x8198280f  ! 1788: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080f, %hpstate
	.word 0x879020ff  ! 1789: WRPR_TT_I	wrpr	%r0, 0x00ff, %tt
	.word 0x93902000  ! 1790: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1791: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93d02032  ! 1792: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xca9fe001  ! 1793: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
	ta	T_CHANGE_NONPRIV	! macro
change_to_randtl_111:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1795: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x82868014  ! 1796: ADDcc_R	addcc 	%r26, %r20, %r1
	.word 0x8d802004  ! 1797: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x38700001  ! 1798: BPGU	<illegal instruction>
	ta	T_CHANGE_PRIV	! macro
	.word 0xafb44fe5  ! 1800: FONES	fones	%f23
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1801: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xeedfe000  ! 1802: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r23
	.word 0xaa82c007  ! 1803: ADDcc_R	addcc 	%r11, %r7, %r21
	.word 0x81982346  ! 1804: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0346, %hpstate
	.word 0xea0fe001  ! 1805: LDUB_I	ldub	[%r31 + 0x0001], %r21
	.word 0xb2684015  ! 1806: UDIVX_R	udivx 	%r1, %r21, %r25
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1807: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90288e  ! 1808: WRPR_PSTATE_I	wrpr	%r0, 0x088e, %pstate
	.word 0x9b500000  ! 1809: RDPR_TPC	rdpr	%tpc, %r13
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1810: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x83540000  ! 1811: RDPR_GL	rdpr	%-, %r1
	.word 0xa0a90011  ! 1812: ANDNcc_R	andncc 	%r4, %r17, %r16
	.word 0x28700001  ! 1813: BPLEU	<illegal instruction>
	.word 0x93902002  ! 1814: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02033  ! 1815: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d9028c9  ! 1816: WRPR_PSTATE_I	wrpr	%r0, 0x08c9, %pstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1817: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 1818: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982a80  ! 1819: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a80, %hpstate
	.word 0x91d02033  ! 1820: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x88802001  ! 1821: ADDcc_I	addcc 	%r0, 0x0001, %r4
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1822: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc8c00e60  ! 1823: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r4
	.word 0x93902000  ! 1824: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802010  ! 1825: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xb1702001  ! 1826: POPC_I	popc	0x0001, %r24
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1827: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1828: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xaad1c013  ! 1829: UMULcc_R	umulcc 	%r7, %r19, %r21
	.word 0x93902003  ! 1830: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_tl1_112:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x85b30ff2  ! 1832: FONES	fones	%f2
DS_113:
	.word 0x22800001  ! 1834: BE	be,a	<label_0x1>
	pdist %f26, %f2, %f26
	.word 0xb7b0831b  ! 1833: ALLIGNADDRESS	alignaddr	%r2, %r27, %r27
	.word 0xf627c01b  ! 1834: STW_R	stw	%r27, [%r31 + %r27]
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1835: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa4fb4009  ! 1836: SDIVcc_R	sdivcc 	%r13, %r9, %r18
	.word 0x9068a001  ! 1837: UDIVX_I	udivx 	%r2, 0x0001, %r8
	.word 0x93d02032  ! 1838: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xa4d8400d  ! 1839: SMULcc_R	smulcc 	%r1, %r13, %r18
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1840: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 1841: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xe5e7c02d  ! 1842: CASA_I	casa	[%r31] 0x 1, %r13, %r18
	.word 0x8d50c000  ! 1843: RDPR_TT	rdpr	%tt, %r6
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1844: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 1845: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87902342  ! 1846: WRPR_TT_I	wrpr	%r0, 0x0342, %tt
	.word 0xcc8008a0  ! 1847: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1848: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982d4e  ! 1849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4e, %hpstate
	.word 0xb44a8006  ! 1850: MULX_R	mulx 	%r10, %r6, %r26
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1851: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91a00545  ! 1852: FSQRTd	fsqrt	
	.word 0x93d02032  ! 1853: Tcc_I	tne	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f802001  ! 1855: SIR	sir	0x0001
	.word 0xa1902002  ! 1856: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd057e001  ! 1857: LDSH_I	ldsh	[%r31 + 0x0001], %r8
change_to_randtl_114:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1858: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1859: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 1860: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa1902004  ! 1861: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d802000  ! 1862: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1863: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99702001  ! 1864: POPC_I	popc	0x0001, %r12
	.word 0x87902238  ! 1865: WRPR_TT_I	wrpr	%r0, 0x0238, %tt
	.word 0xd8800be0  ! 1866: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r12
	.word 0xd8dfe000  ! 1867: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r12
	.word 0xa190200a  ! 1868: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x81982943  ! 1869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0943, %hpstate
DS_115:
	.word 0x20800001  ! 1871: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1870: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802000  ! 1871: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x84836001  ! 1872: ADDcc_I	addcc 	%r13, 0x0001, %r2
	.word 0x81982210  ! 1873: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0210, %hpstate
	.word 0xc427c005  ! 1874: STW_R	stw	%r2, [%r31 + %r5]
	.word 0x8790200b  ! 1875: WRPR_TT_I	wrpr	%r0, 0x000b, %tt
DS_116:
	.word 0x22800001  ! 1877: BE	be,a	<label_0x1>
	illtrap
	.word 0x99a0054b  ! 1877: FSQRTd	fsqrt	
	.word 0xa3a5c821  ! 1876: FADDs	fadds	%f23, %f1, %f17
	.word 0x8d802004  ! 1877: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8790200f  ! 1878: WRPR_TT_I	wrpr	%r0, 0x000f, %tt
	.word 0x81982989  ! 1879: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0989, %hpstate
	.word 0xa7508000  ! 1880: RDPR_TSTATE	rdpr	%tstate, %r19
	.word 0x9f802001  ! 1881: SIR	sir	0x0001
	.word 0x91d02035  ! 1882: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa7a00564  ! 1883: FSQRTq	fsqrt	
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1884: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1504000  ! 1885: RDPR_TNPC	rdpr	%tnpc, %r16
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1886: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1902004  ! 1888: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93902002  ! 1889: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_117:
	.word 0x32800001  ! 1891: BNE	bne,a	<label_0x1>
	allclean
	.word 0x8fb44311  ! 1890: ALLIGNADDRESS	alignaddr	%r17, %r17, %r7
	.word 0xce800b80  ! 1891: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r7
	.word 0xce800b80  ! 1892: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r7
	.word 0x8db04fe4  ! 1893: FONES	fones	%f6
	.word 0xcde7c024  ! 1894: CASA_I	casa	[%r31] 0x 1, %r4, %r6
	.word 0x8790221c  ! 1895: WRPR_TT_I	wrpr	%r0, 0x021c, %tt
	.word 0x8ef9400c  ! 1896: SDIVcc_R	sdivcc 	%r5, %r12, %r7
	.word 0x32700001  ! 1897: BPNE	<illegal instruction>
	.word 0xa1902001  ! 1898: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8d90260b  ! 1899: WRPR_PSTATE_I	wrpr	%r0, 0x060b, %pstate
	.word 0xa3b1cfec  ! 1900: FONES	fones	%f17
	.word 0x87902258  ! 1901: WRPR_TT_I	wrpr	%r0, 0x0258, %tt
	.word 0xa3702001  ! 1902: POPC_I	popc	0x0001, %r17
	.word 0x91d02035  ! 1903: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902268  ! 1904: WRPR_TT_I	wrpr	%r0, 0x0268, %tt
	.word 0x93902000  ! 1905: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902004  ! 1906: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902272  ! 1907: WRPR_TT_I	wrpr	%r0, 0x0272, %tt
	.word 0x93902000  ! 1908: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982916  ! 1909: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0916, %hpstate
	.word 0x92d5e001  ! 1910: UMULcc_I	umulcc 	%r23, 0x0001, %r9
	.word 0xa190200c  ! 1911: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87802004  ! 1912: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802004  ! 1914: WRFPRS_I	wr	%r0, 0x0004, %fprs
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1915: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93a00542  ! 1916: FSQRTd	fsqrt	
change_to_randtl_118:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1917: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91d02033  ! 1918: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa7514000  ! 1919: RDPR_TBA	rdpr	%tba, %r19
	.word 0x879022c8  ! 1920: WRPR_TT_I	wrpr	%r0, 0x02c8, %tt
	.word 0x91d02035  ! 1921: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x90ae0008  ! 1922: ANDNcc_R	andncc 	%r24, %r8, %r8
	.word 0xa1902008  ! 1923: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93902000  ! 1924: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902259  ! 1925: WRPR_PSTATE_I	wrpr	%r0, 0x0259, %pstate
	.word 0x91d02035  ! 1926: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802004  ! 1927: WRASI_I	wr	%r0, 0x0004, %asi
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1928: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 1929: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x819820c8  ! 1930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c8, %hpstate
	.word 0x93902007  ! 1931: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1932: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 1933: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982653  ! 1934: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0653, %hpstate
	.word 0x8d51c000  ! 1935: RDPR_TL	rdpr	%tl, %r6
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1936: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 1937: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1938: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xcc8fe030  ! 1939: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r6
	.word 0x93902004  ! 1940: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_119:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1941: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x95b54fe0  ! 1942: FONES	fones	%f10
DS_120:
	.word 0x32800001  ! 1944: BNE	bne,a	<label_0x1>
	allclean
	.word 0x97b30309  ! 1943: ALLIGNADDRESS	alignaddr	%r12, %r9, %r11
	.word 0x91d02033  ! 1944: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x97508000  ! 1945: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0xa8832001  ! 1946: ADDcc_I	addcc 	%r12, 0x0001, %r20
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1947: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902ac1  ! 1948: WRPR_PSTATE_I	wrpr	%r0, 0x0ac1, %pstate
	.word 0x97514000  ! 1949: RDPR_TBA	rdpr	%tba, %r11
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1950: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 1951: WRASI_I	wr	%r0, 0x0016, %asi
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1952: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 1953: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d9024cf  ! 1954: WRPR_PSTATE_I	wrpr	%r0, 0x04cf, %pstate
	.word 0xd727e001  ! 1955: STF_I	st	%f11, [0x0001, %r31]
	.word 0x8d50c000  ! 1956: RDPR_TT	rdpr	%tt, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02033  ! 1958: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_tl1_121:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02032  ! 1960: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x28800001  ! 1961: BLEU	bleu,a	<label_0x1>
	.word 0x99a01a77  ! 1962: FqTOi	fqtoi	
	.word 0x8ba589a2  ! 1963: FDIVs	fdivs	%f22, %f2, %f5
	.word 0x8551c000  ! 1964: RDPR_TL	rdpr	%tl, %r2
	.word 0xa1902005  ! 1965: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xb7a00579  ! 1966: FSQRTq	fsqrt	
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1967: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xad514000  ! 1968: RDPR_TBA	rdpr	%tba, %r22
	.word 0xeccfe000  ! 1969: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r22
	.word 0x87902312  ! 1970: WRPR_TT_I	wrpr	%r0, 0x0312, %tt
	.word 0xa1902006  ! 1971: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x83d02030  ! 1972: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x87902392  ! 1973: WRPR_TT_I	wrpr	%r0, 0x0392, %tt
	.word 0x83d02033  ! 1974: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8d802000  ! 1975: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_122:
	.word 0x32800001  ! 1977: BNE	bne,a	<label_0x1>
	pdist %f26, %f18, %f8
	.word 0x97b1c30d  ! 1976: ALLIGNADDRESS	alignaddr	%r7, %r13, %r11
	.word 0xd67fe001  ! 1977: SWAP_I	swap	%r11, [%r31 + 0x0001]
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1978: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83508000  ! 1979: RDPR_TSTATE	rdpr	%tstate, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0x99902000  ! 1981: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8d500000  ! 1982: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x93902000  ! 1983: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
change_to_randtl_123:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1984: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x8350c000  ! 1985: RDPR_TT	rdpr	%tt, %r1
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc27fe001  ! 1987: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0x8d514000  ! 1988: RDPR_TBA	rdpr	%tba, %r6
	.word 0x8d480000  ! 1989: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x9b504000  ! 1990: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0xda7fe001  ! 1991: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x8f902002  ! 1984: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa190200b  ! 1993: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1994: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb27e001  ! 1995: STF_I	st	%f13, [0x0001, %r31]
	.word 0x8d514000  ! 1996: RDPR_TBA	rdpr	%tba, %r6
	.word 0x8790222d  ! 1997: WRPR_TT_I	wrpr	%r0, 0x022d, %tt
	.word 0x819828c1  ! 1998: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c1, %hpstate
	.word 0x81982516  ! 1999: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0516, %hpstate
	.word 0x9f802001  ! 2000: SIR	sir	0x0001
	.word 0x93b4cfe5  ! 2001: FONES	fones	%f9
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa190200d  ! 2004: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd217c000  ! 2005: LDUH_R	lduh	[%r31 + %r0], %r9
	.word 0x83a50d2a  ! 2006: FsMULd	fsmuld	%f20, %f10, %f32
	.word 0x38800001  ! 2007: BGU	bgu,a	<label_0x1>
	.word 0xc297e030  ! 2008: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r1
	.word 0x87902152  ! 2009: WRPR_TT_I	wrpr	%r0, 0x0152, %tt
	.word 0x93902007  ! 2010: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902c52  ! 2011: WRPR_PSTATE_I	wrpr	%r0, 0x0c52, %pstate
DS_124:
	.word 0x20800001  ! 2013: BN	bn,a	<label_0x1>
	pdist %f4, %f24, %f30
	.word 0x89b6431a  ! 2012: ALLIGNADDRESS	alignaddr	%r25, %r26, %r4
DS_125:
	.word 0x32800001  ! 2014: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 2013: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902007  ! 2014: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x83a489c0  ! 2015: FDIVd	fdivd	%f18, %f0, %f32
	.word 0xa1902003  ! 2016: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87902365  ! 2017: WRPR_TT_I	wrpr	%r0, 0x0365, %tt
	.word 0x85a000ca  ! 2018: FNEGd	fnegd	%f10, %f2
	.word 0x879022d5  ! 2019: WRPR_TT_I	wrpr	%r0, 0x02d5, %tt
	.word 0x9ba01a74  ! 2020: FqTOi	fqtoi	
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 2022: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2023: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902001  ! 2024: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x83d02032  ! 2025: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x819822c3  ! 2026: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c3, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2027: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790234e  ! 2028: WRPR_TT_I	wrpr	%r0, 0x034e, %tt
	.word 0xa1902008  ! 2029: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93d02032  ! 2030: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x87902166  ! 2031: WRPR_TT_I	wrpr	%r0, 0x0166, %tt
	.word 0x8a490009  ! 2032: MULX_R	mulx 	%r4, %r9, %r5
change_to_tl1_126:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902007  ! 2034: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x3c700001  ! 2035: BPPOS	<illegal instruction>
	.word 0x91d02031  ! 2036: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d802000  ! 2037: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879022f8  ! 2038: WRPR_TT_I	wrpr	%r0, 0x02f8, %tt
	.word 0x879020a6  ! 2039: WRPR_TT_I	wrpr	%r0, 0x00a6, %tt
	.word 0xa1902007  ! 2040: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x81982c44  ! 2041: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c44, %hpstate
	.word 0x8d802004  ! 2042: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_127:
	.word 0x20800001  ! 2044: BN	bn,a	<label_0x1>
	pdist %f16, %f22, %f4
	.word 0x81b58300  ! 2043: ALLIGNADDRESS	alignaddr	%r22, %r0, %r0
DS_128:
	.word 0x32800001  ! 2045: BNE	bne,a	<label_0x1>
	.word 0xe9342001  ! 2045: STQF_I	-	%f20, [0x0001, %r16]
	normalw
	.word 0x91458000  ! 2044: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd1e7c020  ! 2045: CASA_I	casa	[%r31] 0x 1, %r0, %r8
	.word 0xa190200d  ! 2046: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x819827c8  ! 2047: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c8, %hpstate
	.word 0x83d02033  ! 2048: Tcc_I	te	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1902000  ! 2050: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_129:
	.word 0x22800001  ! 2052: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 2051: SAVE_R	save	%r31, %r0, %r31
	.word 0xad702001  ! 2052: POPC_I	popc	0x0001, %r22
	.word 0x93902007  ! 2053: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902606  ! 2054: WRPR_PSTATE_I	wrpr	%r0, 0x0606, %pstate
	.word 0x81982099  ! 2055: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0099, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2057: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982b59  ! 2058: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b59, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xa190200a  ! 2060: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x9f802001  ! 2061: SIR	sir	0x0001
	.word 0x91d02030  ! 2062: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x91d02034  ! 2063: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d90288d  ! 2064: WRPR_PSTATE_I	wrpr	%r0, 0x088d, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x9b514000  ! 2067: RDPR_TBA	rdpr	%tba, %r13
	.word 0xda2fe001  ! 2068: STB_I	stb	%r13, [%r31 + 0x0001]
DS_130:
	.word 0x34800001  ! 2070: BG	bg,a	<label_0x1>
	illtrap
	.word 0x89a00544  ! 2070: FSQRTd	fsqrt	
	.word 0x97a24826  ! 2069: FADDs	fadds	%f9, %f6, %f11
	.word 0x8d902847  ! 2070: WRPR_PSTATE_I	wrpr	%r0, 0x0847, %pstate
	.word 0x81982990  ! 2071: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0990, %hpstate
	.word 0xd677e001  ! 2072: STX_I	stx	%r11, [%r31 + 0x0001]
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2073: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 2074: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_131:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 2075: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x8d802000  ! 2076: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa3a609b2  ! 2077: FDIVs	fdivs	%f24, %f18, %f17
	.word 0x8d902407  ! 2078: WRPR_PSTATE_I	wrpr	%r0, 0x0407, %pstate
	.word 0xa190200b  ! 2079: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x9f802001  ! 2080: SIR	sir	0x0001
	.word 0x9950c000  ! 2081: RDPR_TT	rdpr	%tt, %r12
	.word 0x87902149  ! 2082: WRPR_TT_I	wrpr	%r0, 0x0149, %tt
	.word 0xa1902003  ! 2083: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_132:
	.word 0x32800001  ! 2085: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x8fa00540  ! 2085: FSQRTd	fsqrt	
	.word 0xa7a0482b  ! 2084: FADDs	fadds	%f1, %f11, %f19
	.word 0x8f902002  ! 2075: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982381  ! 2085: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0381, %hpstate
	.word 0x30700001  ! 2086: BPA	<illegal instruction>
	.word 0x8790228b  ! 2087: WRPR_TT_I	wrpr	%r0, 0x028b, %tt
	.word 0xb7a00560  ! 2088: FSQRTq	fsqrt	
	.word 0xa1902004  ! 2089: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93d02032  ! 2090: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8da0055b  ! 2091: FSQRTd	fsqrt	
	.word 0x8790238f  ! 2092: WRPR_TT_I	wrpr	%r0, 0x038f, %tt
	.word 0x87902014  ! 2093: WRPR_TT_I	wrpr	%r0, 0x0014, %tt
change_to_tl1_133:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x996ce001  ! 2095: SDIVX_I	sdivx	%r19, 0x0001, %r12
	.word 0xd817c000  ! 2096: LDUH_R	lduh	[%r31 + %r0], %r12
change_to_tl1_134:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1902004  ! 2098: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa1902005  ! 2099: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa1902006  ! 2100: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802016  ! 2102: WRASI_I	wr	%r0, 0x0016, %asi
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 2103: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_135:
	.word 0x34800001  ! 2105: BG	bg,a	<label_0x1>
	allclean
	.word 0x81b6c300  ! 2104: ALLIGNADDRESS	alignaddr	%r27, %r0, %r0
	.word 0xc137c000  ! 2105: STQF_R	-	%f0, [%r0, %r31]
	.word 0xc08008a0  ! 2106: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x81982202  ! 2107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0202, %hpstate
	.word 0xada5c9c9  ! 2108: FDIVd	fdivd	%f54, %f40, %f22
	.word 0x87802089  ! 2109: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xab480000  ! 2110: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2111: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa2fa6001  ! 2112: SDIVcc_I	sdivcc 	%r9, 0x0001, %r17
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2113: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 2114: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879021e9  ! 2115: WRPR_TT_I	wrpr	%r0, 0x01e9, %tt
	.word 0xe27fe001  ! 2116: SWAP_I	swap	%r17, [%r31 + 0x0001]
	.word 0x81982403  ! 2117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0403, %hpstate
	.word 0x91d02033  ! 2118: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x946d0004  ! 2120: UDIVX_R	udivx 	%r20, %r4, %r10
	.word 0x9f802001  ! 2121: SIR	sir	0x0001
	.word 0x8d802000  ! 2122: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02031  ! 2123: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xd4d7e030  ! 2124: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r10
	.word 0xa1902000  ! 2125: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xad514000  ! 2126: RDPR_TBA	rdpr	%tba, %r22
	.word 0x81982854  ! 2127: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0854, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902003  ! 2129: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d902a9e  ! 2130: WRPR_PSTATE_I	wrpr	%r0, 0x0a9e, %pstate
	.word 0x8790223d  ! 2131: WRPR_TT_I	wrpr	%r0, 0x023d, %tt
	.word 0x93902001  ! 2132: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2133: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 2134: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 2135: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_NONHPRIV	! macro
DS_136:
	.word 0x22800001  ! 2138: BE	be,a	<label_0x1>
	.word 0xc531e001  ! 2138: STQF_I	-	%f2, [0x0001, %r7]
	normalw
	.word 0xab458000  ! 2137: RD_SOFTINT_REG	rd	%softint, %r21
	.word 0x93d02030  ! 2138: Tcc_I	tne	icc_or_xcc, %r0 + 48
change_to_tl1_137:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02033  ! 2140: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8198209e  ! 2141: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009e, %hpstate
	.word 0x8d902a82  ! 2142: WRPR_PSTATE_I	wrpr	%r0, 0x0a82, %pstate
	.word 0x93902007  ! 2143: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xeb37e001  ! 2144: STQF_I	-	%f21, [0x0001, %r31]
	.word 0x93d02032  ! 2145: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8790218f  ! 2146: WRPR_TT_I	wrpr	%r0, 0x018f, %tt
	.word 0x9ad18003  ! 2147: UMULcc_R	umulcc 	%r6, %r3, %r13
	.word 0xa190200d  ! 2148: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x81540000  ! 2149: RDPR_GL	rdpr	%-, %r0
	.word 0xc01fc000  ! 2150: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x8afa4018  ! 2151: SDIVcc_R	sdivcc 	%r9, %r24, %r5
	.word 0xcbe7c038  ! 2152: CASA_I	casa	[%r31] 0x 1, %r24, %r5
	.word 0x85494000  ! 2153: RDHPR_HTBA	rdhpr	%htba, %r2
	.word 0x30700001  ! 2154: BPA	<illegal instruction>
	.word 0xc527e001  ! 2155: STF_I	st	%f2, [0x0001, %r31]
	.word 0x8d902aca  ! 2156: WRPR_PSTATE_I	wrpr	%r0, 0x0aca, %pstate
	.word 0x8198298c  ! 2157: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098c, %hpstate
	.word 0x93902006  ! 2158: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2159: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x844ec012  ! 2160: MULX_R	mulx 	%r27, %r18, %r2
	.word 0xc4bfe001  ! 2161: STDA_I	stda	%r2, [%r31 + 0x0001] %asi
	.word 0x819823c6  ! 2162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c6, %hpstate
	.word 0xc437c012  ! 2163: STH_R	sth	%r2, [%r31 + %r18]
	.word 0xa190200c  ! 2164: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902001  ! 2165: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982dd1  ! 2166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd1, %hpstate
DS_138:
	.word 0x32800001  ! 2168: BNE	bne,a	<label_0x1>
	.word 0xf731a001  ! 2168: STQF_I	-	%f27, [0x0001, %r6]
	normalw
	.word 0x87458000  ! 2167: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xb0688006  ! 2168: UDIVX_R	udivx 	%r2, %r6, %r24
	.word 0x90dc4015  ! 2169: SMULcc_R	smulcc 	%r17, %r21, %r8
	.word 0x87a6c9a3  ! 2170: FDIVs	fdivs	%f27, %f3, %f3
	.word 0xc65fe001  ! 2171: LDX_I	ldx	[%r31 + 0x0001], %r3
	.word 0xa9a40d25  ! 2172: FsMULd	fsmuld	%f16, %f36, %f20
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2173: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902698  ! 2174: WRPR_PSTATE_I	wrpr	%r0, 0x0698, %pstate
	.word 0x87802014  ! 2175: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902cd1  ! 2176: WRPR_PSTATE_I	wrpr	%r0, 0x0cd1, %pstate
	.word 0x8d902e5b  ! 2177: WRPR_PSTATE_I	wrpr	%r0, 0x0e5b, %pstate
	.word 0xe8c004a0  ! 2178: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
	.word 0x86d18009  ! 2179: UMULcc_R	umulcc 	%r6, %r9, %r3
	.word 0x91d02030  ! 2180: Tcc_I	ta	icc_or_xcc, %r0 + 48
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2181: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x90db4008  ! 2183: SMULcc_R	smulcc 	%r13, %r8, %r8
	.word 0x8790226a  ! 2184: WRPR_TT_I	wrpr	%r0, 0x026a, %tt
	.word 0x87540000  ! 2185: RDPR_GL	rdpr	%-, %r3
	.word 0xc647e001  ! 2186: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x8b480000  ! 2187: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x87902307  ! 2188: WRPR_TT_I	wrpr	%r0, 0x0307, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x94d6e001  ! 2190: UMULcc_I	umulcc 	%r27, 0x0001, %r10
	.word 0x93902006  ! 2191: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 2192: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xb36a6001  ! 2193: SDIVX_I	sdivx	%r9, 0x0001, %r25
	.word 0xa64e4018  ! 2194: MULX_R	mulx 	%r25, %r24, %r19
DS_139:
	.word 0x22800001  ! 2196: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 2195: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902000  ! 2196: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902e53  ! 2197: WRPR_PSTATE_I	wrpr	%r0, 0x0e53, %pstate
	.word 0x93902002  ! 2198: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_140:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 2199: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902006  ! 2200: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02035  ! 2201: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x819823d2  ! 2202: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d2, %hpstate
	.word 0x926d8009  ! 2203: UDIVX_R	udivx 	%r22, %r9, %r9
	.word 0x8d902213  ! 2204: WRPR_PSTATE_I	wrpr	%r0, 0x0213, %pstate
	.word 0x81982c81  ! 2205: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c81, %hpstate
DS_141:
	.word 0x34800001  ! 2207: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 2206: SAVE_R	save	%r31, %r0, %r31
	.word 0xd327e001  ! 2207: STF_I	st	%f9, [0x0001, %r31]
	.word 0x36800001  ! 2208: BGE	bge,a	<label_0x1>
	.word 0x97480000  ! 2209: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x90d2e001  ! 2210: UMULcc_I	umulcc 	%r11, 0x0001, %r8
	.word 0x91d02030  ! 2211: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xd1e7c029  ! 2212: CASA_I	casa	[%r31] 0x 1, %r9, %r8
	.word 0xaa4b400a  ! 2213: MULX_R	mulx 	%r13, %r10, %r21
	.word 0x93902000  ! 2214: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02033  ! 2215: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902401  ! 2216: WRPR_PSTATE_I	wrpr	%r0, 0x0401, %pstate
	.word 0x93902000  ! 2217: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x86c62001  ! 2218: ADDCcc_I	addccc 	%r24, 0x0001, %r3
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 2219: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_randtl_142:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 2220: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x93902003  ! 2221: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8790209c  ! 2222: WRPR_TT_I	wrpr	%r0, 0x009c, %tt
change_to_randtl_143:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 2223: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x87902183  ! 2224: WRPR_TT_I	wrpr	%r0, 0x0183, %tt
	.word 0x93a089b4  ! 2225: FDIVs	fdivs	%f2, %f20, %f9
	.word 0x824e4004  ! 2226: MULX_R	mulx 	%r25, %r4, %r1
	.word 0x91d02035  ! 2227: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa3480000  ! 2228: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x83a01a7a  ! 2229: FqTOi	fqtoi	
	.word 0x91d02034  ! 2230: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x819824d5  ! 2231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d5, %hpstate
	.word 0xacfa4003  ! 2232: SDIVcc_R	sdivcc 	%r9, %r3, %r22
	.word 0xa0f8800d  ! 2233: SDIVcc_R	sdivcc 	%r2, %r13, %r16
	.word 0x8da689f2  ! 2234: FDIVq	dis not found

	.word 0x96804014  ! 2235: ADDcc_R	addcc 	%r1, %r20, %r11
	.word 0xd67fe001  ! 2236: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0xa1902000  ! 2237: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd647e001  ! 2238: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x819820d4  ! 2240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d4, %hpstate
change_to_randtl_144:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 2241: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87902368  ! 2242: WRPR_TT_I	wrpr	%r0, 0x0368, %tt
	.word 0x9aa9001b  ! 2243: ANDNcc_R	andncc 	%r4, %r27, %r13
	.word 0x9f802001  ! 2244: SIR	sir	0x0001
	.word 0x93902002  ! 2245: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8198210c  ! 2246: WRHPR_HPSTATE_I	wrhpr	%r0, 0x010c, %hpstate
DS_145:
	.word 0x22800001  ! 2248: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 2247: SAVE_R	save	%r31, %r0, %r31
	.word 0x83d02034  ! 2248: Tcc_I	te	icc_or_xcc, %r0 + 52
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 2249: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2251: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 2252: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xda880e60  ! 2253: LDUBA_R	lduba	[%r0, %r0] 0x73, %r13
	.word 0xda97e000  ! 2254: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r13
	.word 0xdb37c01b  ! 2255: STQF_R	-	%f13, [%r27, %r31]
	.word 0x8c86c003  ! 2256: ADDcc_R	addcc 	%r27, %r3, %r6
	.word 0x8198269b  ! 2257: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069b, %hpstate
	.word 0x32700001  ! 2258: BPNE	<illegal instruction>
	.word 0x81982215  ! 2259: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0215, %hpstate
	.word 0x8790201b  ! 2260: WRPR_TT_I	wrpr	%r0, 0x001b, %tt
	.word 0xa190200e  ! 2261: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xafa00d29  ! 2262: FsMULd	fsmuld	%f0, %f40, %f54
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2263: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 2264: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa0a94014  ! 2265: ANDNcc_R	andncc 	%r5, %r20, %r16
	.word 0x93902007  ! 2266: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xab480000  ! 2267: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0x8b480000  ! 2268: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0xca8008a0  ! 2269: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8790208d  ! 2270: WRPR_TT_I	wrpr	%r0, 0x008d, %tt
change_to_randtl_146:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 2271: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x81982103  ! 2272: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0103, %hpstate
	.word 0xa1902003  ! 2273: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_147:
	.word 0x32800001  ! 2275: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 2274: SAVE_R	save	%r31, %r0, %r31
	.word 0xca57e001  ! 2275: LDSH_I	ldsh	[%r31 + 0x0001], %r5
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2276: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 2277: WRASI_I	wr	%r0, 0x0014, %asi
DS_148:
	.word 0x32800001  ! 2279: BNE	bne,a	<label_0x1>
	.word 0xd736c00c  ! 2279: STQF_R	-	%f11, [%r12, %r27]
	normalw
	.word 0x87458000  ! 2278: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x8d802000  ! 2279: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x819827cd  ! 2280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cd, %hpstate
	.word 0x8ad1e001  ! 2281: UMULcc_I	umulcc 	%r7, 0x0001, %r5
	.word 0xb6d0c007  ! 2282: UMULcc_R	umulcc 	%r3, %r7, %r27
	.word 0x879021d3  ! 2283: WRPR_TT_I	wrpr	%r0, 0x01d3, %tt
	.word 0xaefca001  ! 2284: SDIVcc_I	sdivcc 	%r18, 0x0001, %r23
	.word 0x99902004  ! 2285: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x93902002  ! 2286: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81500000  ! 2287: RDPR_TPC	rdpr	%tpc, %r0
	.word 0x879023d5  ! 2288: WRPR_TT_I	wrpr	%r0, 0x03d5, %tt
	.word 0xa190200e  ! 2289: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802004  ! 2291: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87902389  ! 2292: WRPR_TT_I	wrpr	%r0, 0x0389, %tt
	.word 0x91a00563  ! 2293: FSQRTq	fsqrt	
	.word 0x819826d3  ! 2294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d3, %hpstate
	.word 0x93d02031  ! 2295: Tcc_I	tne	icc_or_xcc, %r0 + 49
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 2296: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x95a30d35  ! 2297: FsMULd	fsmuld	%f12, %f52, %f10
	.word 0xd48008a0  ! 2298: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x81982ed4  ! 2299: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed4, %hpstate
	.word 0xd45fe001  ! 2300: LDX_I	ldx	[%r31 + 0x0001], %r10
	.word 0x8d902e59  ! 2301: WRPR_PSTATE_I	wrpr	%r0, 0x0e59, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02035  ! 2303: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xb1504000  ! 2304: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x94fb4006  ! 2305: SDIVcc_R	sdivcc 	%r13, %r6, %r10
	.word 0x81a409d8  ! 2306: FDIVd	fdivd	%f16, %f24, %f0
	.word 0x93902002  ! 2307: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc0c804a0  ! 2308: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r0
	.word 0x3a700001  ! 2309: BPCC	<illegal instruction>
	.word 0x93902003  ! 2310: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02035  ! 2311: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9f802001  ! 2312: SIR	sir	0x0001
	.word 0xaad22001  ! 2313: UMULcc_I	umulcc 	%r8, 0x0001, %r21
	.word 0x89500000  ! 2314: RDPR_TPC	rdpr	%tpc, %r4
DS_149:
	.word 0x22800001  ! 2316: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 2315: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87902257  ! 2316: WRPR_TT_I	wrpr	%r0, 0x0257, %tt
	.word 0x819825cd  ! 2317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cd, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc8800b80  ! 2319: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r4
	.word 0xa2dd8017  ! 2320: SMULcc_R	smulcc 	%r22, %r23, %r17
	.word 0x879023c8  ! 2321: WRPR_TT_I	wrpr	%r0, 0x03c8, %tt
	.word 0xa1902004  ! 2322: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d902a09  ! 2323: WRPR_PSTATE_I	wrpr	%r0, 0x0a09, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2324: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 2325: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902e85  ! 2326: WRPR_PSTATE_I	wrpr	%r0, 0x0e85, %pstate
	.word 0x879022e1  ! 2327: WRPR_TT_I	wrpr	%r0, 0x02e1, %tt
	.word 0x8bb1cfe5  ! 2328: FONES	fones	%f5
	.word 0x8d902a85  ! 2329: WRPR_PSTATE_I	wrpr	%r0, 0x0a85, %pstate
	.word 0xa1902008  ! 2330: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89500000  ! 2332: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x91d02030  ! 2333: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d802000  ! 2334: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8b698003  ! 2335: SDIVX_R	sdivx	%r6, %r3, %r5
	.word 0xa190200e  ! 2336: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa1902006  ! 2337: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xb46a800d  ! 2338: UDIVX_R	udivx 	%r10, %r13, %r26
	.word 0xa2d2801b  ! 2339: UMULcc_R	umulcc 	%r10, %r27, %r17
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2340: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x819829c2  ! 2342: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c2, %hpstate
	.word 0x96fd4017  ! 2343: SDIVcc_R	sdivcc 	%r21, %r23, %r11
	.word 0x93902002  ! 2344: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_150:
	.word 0x32800001  ! 2346: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x81a00552  ! 2346: FSQRTd	fsqrt	
	.word 0x85a1482b  ! 2345: FADDs	fadds	%f5, %f11, %f2
	.word 0x81982fd7  ! 2346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd7, %hpstate
	.word 0xc4c7e020  ! 2347: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	.word 0xa1902007  ! 2348: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1902002  ! 2349: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902006  ! 2350: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x879020d1  ! 2351: WRPR_TT_I	wrpr	%r0, 0x00d1, %tt
	.word 0x91540000  ! 2352: RDPR_GL	rdpr	%-, %r8
	.word 0x83d02031  ! 2353: Tcc_I	te	icc_or_xcc, %r0 + 49
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 2354: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902017  ! 2355: WRPR_TT_I	wrpr	%r0, 0x0017, %tt
	.word 0x87802014  ! 2356: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93a109d8  ! 2357: FDIVd	fdivd	%f4, %f24, %f40
	.word 0xa190200a  ! 2358: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd28008a0  ! 2359: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x81982d97  ! 2360: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d97, %hpstate
	.word 0x8f50c000  ! 2361: RDPR_TT	rdpr	%tt, %r7
	.word 0xa190200e  ! 2362: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8198288c  ! 2363: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088c, %hpstate
	.word 0x81a0056b  ! 2364: FSQRTq	fsqrt	
	.word 0x8d902699  ! 2365: WRPR_PSTATE_I	wrpr	%r0, 0x0699, %pstate
	.word 0x879023ac  ! 2366: WRPR_TT_I	wrpr	%r0, 0x03ac, %tt
	.word 0x93902001  ! 2367: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982d1e  ! 2368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1e, %hpstate
	.word 0xc137e001  ! 2369: STQF_I	-	%f0, [0x0001, %r31]
	.word 0xc08008a0  ! 2370: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x93902005  ! 2371: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9150c000  ! 2372: RDPR_TT	rdpr	%tt, %r8
	.word 0x8d90268e  ! 2373: WRPR_PSTATE_I	wrpr	%r0, 0x068e, %pstate


.global user_data_start
.data
user_data_start:
	.xword	0xac75c0c8f16c8515
	.xword	0xca35639eab8dd697
	.xword	0x7516c31864c91093
	.xword	0xd0317b2f2c877c67
	.xword	0xc0d85e7a249d4a11
	.xword	0x23ca7889b370fcbe
	.xword	0x2a0eb8212128ba5a
	.xword	0x8edc11a06bc80c50
	.xword	0x50af2f1a309320bd
	.xword	0x6df4d8095a77f39d
	.xword	0xeb14d291ef49ea4d
	.xword	0xdbc7394328831be9
	.xword	0x240e462d666beb1a
	.xword	0x0618a4f11b5a7f17
	.xword	0x3c232426e19cf3d5
	.xword	0x61abd720338ffb97
	.xword	0x33fd9b39f895700b
	.xword	0xabc7adbf2e1af3b2
	.xword	0x028abce2a5e6d45a
	.xword	0x0708ad5bebcae87a
	.xword	0xefdbc72b41712209
	.xword	0xfeef0f9b512843ad
	.xword	0xc9eb78bd969e01bd
	.xword	0x3a090c50b8df67d7
	.xword	0x10944600e3020ea5
	.xword	0x7d277be3223fddaf
	.xword	0x63667686261595bc
	.xword	0x19a6319247f8af16
	.xword	0xf7e2717963f55594
	.xword	0xa0920b34fadf6945
	.xword	0xac7a97b40f032e5e
	.xword	0xafc9b2753d80f0b2
	.xword	0xb90d033b94fc9e0e
	.xword	0xb92ff5bdb37304e6
	.xword	0x6192089912721836
	.xword	0x1cd87fe27382832e
	.xword	0x24831b5a0d2b175b
	.xword	0xe6be40ce26984917
	.xword	0x3db08b56268fa4dd
	.xword	0xcbe3739bdbac4c24
	.xword	0x0d25951997fa7de7
	.xword	0xdc7cf239b59c6f3d
	.xword	0x94d7a52cea8b5ab7
	.xword	0xbc90838984f6586e
	.xword	0x216858bddde982ef
	.xword	0x538d820cb91597e7
	.xword	0x8d0f167bb4ee920b
	.xword	0x72a921dd352624d3
	.xword	0x49c7ec00b2cf7a78
	.xword	0x0eb22bb09ba7c339
	.xword	0x8de0de193bd2c4f1
	.xword	0xebb4dcf4a1c426fb
	.xword	0xba0f38d07f4b0e35
	.xword	0xaf5e5c3595a8660b
	.xword	0xc7f5b7c9332d49f4
	.xword	0x7b8cb78b3cfc96a8
	.xword	0x82d9599ea3d91a2d
	.xword	0xce8ac4132058ac2b
	.xword	0xe3cdda5c4717681f
	.xword	0x9b087d7072016e12
	.xword	0xa4af73c4e11c813d
	.xword	0x2edffcd1a4db8dd8
	.xword	0xc5d2c26cf6a80317
	.xword	0x5b68c2b41fd900f1
	.xword	0x032fc674645a93c7
	.xword	0xd5609be9ce05e897
	.xword	0x8576515fef435bfa
	.xword	0xf690212e9903ab22
	.xword	0xaab9487faa7a71ba
	.xword	0x95da5b88e439e96c
	.xword	0x5e2a0f28cf3126da
	.xword	0x2205d7d26ca11a66
	.xword	0xd1fdc8e9a78a534d
	.xword	0xa71c848b61d63982
	.xword	0x909b12a01834fff6
	.xword	0xf387493d6d858513
	.xword	0xcad573b695ac1d85
	.xword	0x6d435d59052d49d3
	.xword	0x878b932ca71d8ff9
	.xword	0x26e1eea191584487
	.xword	0xf09d43b874d2aea3
	.xword	0x4c8065f945847d3a
	.xword	0x3fbb26b325618265
	.xword	0x3f76f74ddcac4d6a
	.xword	0x1293f7c209f0bf44
	.xword	0x1499b52a4e0a8343
	.xword	0x0c83e693a027b9a4
	.xword	0xb412a9c9dd651b3e
	.xword	0x26c30239361394ba
	.xword	0x0a8e5583789cdc83
	.xword	0x65e06e6d27cb8a15
	.xword	0xb716f1a98d065381
	.xword	0x8cb1097a26375f07
	.xword	0xac6ceb2eee29cbca
	.xword	0x5943d8f62de435f8
	.xword	0xd4db126940e7e6d4
	.xword	0x04d5f90682e62ff8
	.xword	0xea9e1ae2b7ea1a16
	.xword	0xe2b471a3bd7d01f4
	.xword	0xe63dcfbd0e2bc3e8
	.xword	0x646054be7dc6f99c
	.xword	0x97867f2e351d1f3a
	.xword	0x629b897968947b26
	.xword	0xb27e85182e74961a
	.xword	0x6f69c991552eb203
	.xword	0x402a964c48cffba0
	.xword	0xbd5d5d2f3263c13a
	.xword	0xe23abbc4be09381b
	.xword	0xa0ec5c13f1179393
	.xword	0x03cac0e1f0ebbb15
	.xword	0xb64418713767b9fc
	.xword	0x33119bc3dcc80543
	.xword	0xe11bd3579325a731
	.xword	0x4ca2cd076191c4cf
	.xword	0x805bda282f58da7f
	.xword	0x050e61eeaa55854e
	.xword	0xca0b85532e3e348c
	.xword	0xef55634cf205d050
	.xword	0x9a9a1019f84108a2
	.xword	0xad9db816a6090383
	.xword	0x4b8c2e2efad348df
	.xword	0xc77cb22a996c6bb4
	.xword	0xbe5fc54a63f572ce
	.xword	0x5d0f2f726cd9aa0a
	.xword	0xc954de0e7618bd2b
	.xword	0x7837a2b1d5d877dd
	.xword	0x25b3bd313c6f51b5
	.xword	0xa0e7deaa5cfac3c9
	.xword	0x8f34d2a16476c5dc
	.xword	0x86fd0112860285ae
	.xword	0xa4154fcb8e5dee30
	.xword	0x62ecf36f6d430723
	.xword	0x001ca84d956e9ac6
	.xword	0x89cfe5fce36e3dfa
	.xword	0x93603d8216c58ab6
	.xword	0x031831d9c77d7f64
	.xword	0x4faf6fffd0c90e46
	.xword	0x5713952a0650504d
	.xword	0x5761b410d25884d1
	.xword	0xf78fe634600883a0
	.xword	0xa5bef1ff81816c58
	.xword	0x75c1dc08c0923fba
	.xword	0x27d119ba7c5bed53
	.xword	0xd236afaf1b916762
	.xword	0x54fbe7681fe76952
	.xword	0xd841030e295bef8f
	.xword	0xb99485d810bf7ed9
	.xword	0x51f047bae4ddfaf2
	.xword	0x377c5b02ef6f2fb7
	.xword	0xf350fa3d4e6379a8
	.xword	0x1883a32b82b2f282
	.xword	0x6536e3683c254f4b
	.xword	0xb9685cfa8006b553
	.xword	0x19a027d82315ee44
	.xword	0xf1a59fdd5a21b43d
	.xword	0x9060ad93e5c12b5c
	.xword	0xe16fe7100cb0233f
	.xword	0x76b88d867373680a
	.xword	0x896154fdb17475ac
	.xword	0x91c62895434870e6
	.xword	0x96d6f7c0a894e5c9
	.xword	0x7f6aed5e8d2e93e5
	.xword	0xd9f2526dee1da956
	.xword	0x4cb6fce9e4a85071
	.xword	0xbe8c6e30c8964763
	.xword	0x7f2daa48b5b04050
	.xword	0xf15c921c5565c5db
	.xword	0xe4943282dbf77ec5
	.xword	0xb60df36f8349beb4
	.xword	0x6e5e551c6dbe4868
	.xword	0xc87c933fb14ae146
	.xword	0xce4f27f53b23f8bb
	.xword	0xed58b01eef08f419
	.xword	0xd662e3ea465cff5c
	.xword	0x8988e8828acf03d4
	.xword	0x84619cf98483a262
	.xword	0x8eaa09788198f1e7
	.xword	0x6a2f25af076f607e
	.xword	0x64d9d026f9c8fa87
	.xword	0x5552a3a34db7034d
	.xword	0x1c908377dba89dff
	.xword	0x571f43af412224f4
	.xword	0xcd2ad36154c6b48d
	.xword	0xff7c016abe3d1de5
	.xword	0x90bf17e5af6e0c86
	.xword	0x37ef8639c715e1c6
	.xword	0x718a69bf96791795
	.xword	0x5d6573b5e3bfd595
	.xword	0x9699194eac22ef2b
	.xword	0x9776a61f50d161f2
	.xword	0x578ff93f4eb7cbe3
	.xword	0xae6db1b6f5eebf6c
	.xword	0x8b4c2f198a09ac74
	.xword	0xd52a4e730205cc57
	.xword	0xfdf594f4d641dfbc
	.xword	0xed8ea19de31ad0a7
	.xword	0x8315327873ad60fb
	.xword	0xdc02929c24a07a5b
	.xword	0x7be0e171f8c68952
	.xword	0x9940a8075c8d2a2d
	.xword	0xafa52ac1710a8731
	.xword	0xcbd0c5f189ff19d4
	.xword	0xc628e61e95515170
	.xword	0x016efa91a39ecd15
	.xword	0x410267b4a723d9c0
	.xword	0x0188f7b0bbef80d8
	.xword	0x17298cb97aea7fc5
	.xword	0xba89ef0b90406b70
	.xword	0xd1fa296c0cdf951a
	.xword	0xbcaa53baf5481a9f
	.xword	0x3a18e5391da468a4
	.xword	0xeeedd8e4d2e0c96b
	.xword	0x82f7fa06362224ac
	.xword	0xfe9329ab9b5606f0
	.xword	0xd89d168e7f4bfeb1
	.xword	0x2bf931268c209268
	.xword	0x27f8982164c27bdc
	.xword	0xaa5da81a6ceccebf
	.xword	0x60c5963cf94baa0f
	.xword	0x4da3e2ca286781d9
	.xword	0xbfbb98100dd6470c
	.xword	0x40cab776f758781f
	.xword	0xf741001b9b7a9e22
	.xword	0x04de9bbcb563cf13
	.xword	0x653a215b8eddbe48
	.xword	0xa1535112fd8fb08e
	.xword	0xc1cf54691a1a75d0
	.xword	0xfcd7c02608799b08
	.xword	0x3ecb8eb5c55f3e33
	.xword	0x49eb0397052d3add
	.xword	0xb777709f2ae44ab8
	.xword	0xca69e914115bf79a
	.xword	0x2b845bbc9e96ed85
	.xword	0x30ab1c140e7e4bed
	.xword	0x3a761f8ba41de915
	.xword	0xd38513da85ac2502
	.xword	0xc2ecd3e8f731c667
	.xword	0xf520b9255be0b25d
	.xword	0xf237e78dce8544f1
	.xword	0x057659fee321ba32
	.xword	0xe3167f7fbf646288
	.xword	0x53e6c1990c81bd5d
	.xword	0x70a9d2ffadaa9cbb
	.xword	0xf7d1c3b1ea00b0b3
	.xword	0x32bb1f2896e2f72a
	.xword	0xe2548fd8ece47206
	.xword	0x9164516154b7f55b
	.xword	0x2f98e51ded65f5c3
	.xword	0x213c8bf6ea218931
	.xword	0x6ef0840a6d1a963f
	.xword	0x1f331e3fc108ccf3
	.xword	0xca7a563abdb92223
	.xword	0x33e8c9d9af189fec
	.xword	0x29a71958343186f1
	.xword	0xa8b221baaf5ff394
	.xword	0x9104ec1bb648450d


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Tue Apr 27 11:26:05 2004
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
!!#         IJ_generate ("diag.j", 848, th0, $2);
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
!!#         IJ_printf("diag.j", 886, th0, "change_to_randtl_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_set_ropr_fld("diag.j", 888, Ro_tl, Ft_Simm13, "{3..5}");
!!#             IJ_generate_from_token("diag.j", 889,1, th0, ijdefault, tCHANGE_HPRIV, -1);;
!!#         } else {
!!#             IJ_set_ropr_fld("diag.j", 891, Ro_tl, Ft_Simm13, "{0..2}");
!!#             IJ_generate_from_token("diag.j", 892,1, th0, ijdefault, tCHANGE_PRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_tl1 : tCHANGE_TO_TL1
!!#     {
!!#         IJ_printf("diag.j", 900, th0, "change_to_tl1_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 902, th0, "\tta T_CHANGE_HPRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 904, th0, "\tta T_CHANGE_PRIV\n");
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
!!#         IJ_printf("diag.j", 952, th0, "\totherw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      } else {
!!#         IJ_printf("diag.j", 954, th0, "\tinvalw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!#         IJ_printf("diag.j", 1039, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 1040,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 1041,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 1042, th0, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 1046, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 1047,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 1049,1, th0, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 1051, th0, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 1053, th0, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 1058, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 1059,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 1061, th0, "\tilltrap\n");
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 1063,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 1065,1, th0, ijdefault, tFSQRTd, tLDQF_R, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 1072, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 1073,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 1077, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 1078,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 1082, th0, "DS_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 1083, th0, "\tnop\n\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 1084, th0, "\tjmp %%g2\n");
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

