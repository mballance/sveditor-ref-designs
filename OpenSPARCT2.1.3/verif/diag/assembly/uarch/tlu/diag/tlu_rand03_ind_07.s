/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand03_ind_07.s
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
	mov 0x33, %r14
	mov 0x33, %r30
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
	.word 0x8fa6c9c4  ! 1: FDIVd	fdivd	%f58, %f4, %f38
	.word 0x93d02031  ! 2: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x91d02032  ! 3: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8fa6c9d7  ! 4: FDIVd	fdivd	%f58, %f54, %f38
	.word 0x83d02035  ! 5: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x926e2001  ! 6: UDIVX_I	udivx 	%r24, 0x0001, %r9
	.word 0x8d802000  ! 7: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902001  ! 8: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa3a609c0  ! 9: FDIVd	fdivd	%f24, %f0, %f48
	.word 0xa1500000  ! 10: RDPR_TPC	rdpr	%tpc, %r16
	.word 0xe127c000  ! 11: STF_R	st	%f16, [%r0, %r31]
	.word 0x9afa000a  ! 12: SDIVcc_R	sdivcc 	%r8, %r10, %r13
	.word 0x87802004  ! 13: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xda8804a0  ! 15: LDUBA_R	lduba	[%r0, %r0] 0x25, %r13
	.word 0x81982ed1  ! 16: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed1, %hpstate
	.word 0x8d90280e  ! 17: WRPR_PSTATE_I	wrpr	%r0, 0x080e, %pstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 18: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 19: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x93902004  ! 20: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902005  ! 21: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa1902002  ! 22: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x91d02034  ! 23: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x99902003  ! 24: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xa1902008  ! 25: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x91d02030  ! 26: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xda7fe001  ! 27: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x83d02030  ! 28: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x8d902894  ! 29: WRPR_PSTATE_I	wrpr	%r0, 0x0894, %pstate
	.word 0x91d02034  ! 30: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_tl1_0:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x879022d4  ! 32: WRPR_TT_I	wrpr	%r0, 0x02d4, %tt
	.word 0xda1fc000  ! 33: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xda8fe030  ! 34: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	.word 0xb64a8015  ! 35: MULX_R	mulx 	%r10, %r21, %r27
	.word 0x87494000  ! 36: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0x91d02032  ! 37: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x97504000  ! 38: RDPR_TNPC	rdpr	%tnpc, %r11
	ta	T_CHANGE_PRIV	! macro
DS_1:
	.word 0x20800001  ! 41: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 40: RESTORE_R	restore	%r31, %r0, %r31
DS_2:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 41: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8d902454  ! 42: WRPR_PSTATE_I	wrpr	%r0, 0x0454, %pstate
	.word 0x91d02032  ! 43: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd6ffc035  ! 44: SWAPA_R	swapa	%r11, [%r31 + %r21] 0x01
	.word 0x91d02033  ! 45: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802089  ! 46: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa1902005  ! 47: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd6800a80  ! 48: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r11
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90205d  ! 50: WRPR_PSTATE_I	wrpr	%r0, 0x005d, %pstate
	.word 0x8b702001  ! 51: POPC_I	popc	0x0001, %r5
	.word 0x97514000  ! 52: RDPR_TBA	rdpr	%tba, %r11
	.word 0x98d14004  ! 53: UMULcc_R	umulcc 	%r5, %r4, %r12
change_to_tl1_3:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87802010  ! 55: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8198280c  ! 56: WRHPR_HPSTATE_I	wrhpr	%r0, 0x080c, %hpstate
	.word 0x87902137  ! 57: WRPR_TT_I	wrpr	%r0, 0x0137, %tt
	.word 0xd83fc004  ! 58: STD_R	std	%r12, [%r31 + %r4]
	.word 0xa1902006  ! 59: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93d02033  ! 60: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x92810016  ! 61: ADDcc_R	addcc 	%r4, %r22, %r9
	.word 0x8d9026dd  ! 62: WRPR_PSTATE_I	wrpr	%r0, 0x06dd, %pstate
	.word 0xa1902008  ! 63: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d9026cb  ! 64: WRPR_PSTATE_I	wrpr	%r0, 0x06cb, %pstate
	.word 0xa6800017  ! 65: ADDcc_R	addcc 	%r0, %r23, %r19
	.word 0x91d02032  ! 66: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902a97  ! 67: WRPR_PSTATE_I	wrpr	%r0, 0x0a97, %pstate
	.word 0x87802080  ! 68: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93902002  ! 69: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902001  ! 70: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x91d02034  ! 71: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93d02030  ! 72: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x91a189c1  ! 73: FDIVd	fdivd	%f6, %f32, %f8
	.word 0x93902000  ! 74: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81702001  ! 75: POPC_I	popc	0x0001, %r0
	.word 0x9885a001  ! 76: ADDcc_I	addcc 	%r22, 0x0001, %r12
	.word 0x81982615  ! 77: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0615, %hpstate
	.word 0xd927c001  ! 78: STF_R	st	%f12, [%r1, %r31]
	.word 0x87508000  ! 79: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x8b6a4006  ! 80: SDIVX_R	sdivx	%r9, %r6, %r5
	.word 0x81982e06  ! 81: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e06, %hpstate
	.word 0x8d90288a  ! 82: WRPR_PSTATE_I	wrpr	%r0, 0x088a, %pstate
DS_4:
	.word 0x22800001  ! 84: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 83: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d902455  ! 84: WRPR_PSTATE_I	wrpr	%r0, 0x0455, %pstate
	.word 0xca97e020  ! 85: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r5
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 86: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93d02035  ! 87: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xb6d48015  ! 88: UMULcc_R	umulcc 	%r18, %r21, %r27
	.word 0x93902005  ! 89: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d90228f  ! 90: WRPR_PSTATE_I	wrpr	%r0, 0x028f, %pstate
	.word 0x93902002  ! 91: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xf727c015  ! 92: STF_R	st	%f27, [%r21, %r31]
	.word 0x91d02033  ! 93: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 95: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9683400a  ! 96: ADDcc_R	addcc 	%r13, %r10, %r11
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 97: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x2c800001  ! 99: BNEG	bneg,a	<label_0x1>
	.word 0x91d02030  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x2a800001  ! 101: BCS	bcs,a	<label_0x1>
DS_5:
	.word 0x32800001  ! 103: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 103: BNE	bne,a	<label_0x1>
	.word 0xed10c001  ! 103: LDQF_R	-	[%r3, %r1], %f22
	.word 0x9ba68823  ! 102: FADDs	fadds	%f26, %f3, %f13
	.word 0x879023c4  ! 103: WRPR_TT_I	wrpr	%r0, 0x03c4, %tt
	.word 0x9f802001  ! 104: SIR	sir	0x0001
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d51c000  ! 106: RDPR_TL	rdpr	%tl, %r6
	.word 0x879022b1  ! 107: WRPR_TT_I	wrpr	%r0, 0x02b1, %tt
	.word 0xa1902001  ! 108: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x81982111  ! 109: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0111, %hpstate
	ta	T_CHANGE_HPRIV	! macro
DS_6:
	.word 0x34800001  ! 112: BG	bg,a	<label_0x1>
	.word 0xe5310006  ! 112: STQF_R	-	%f18, [%r6, %r4]
	normalw
	.word 0xa7458000  ! 111: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x81982647  ! 112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0647, %hpstate
	.word 0xb3a1cdd0  ! 113: FdMULq	fdmulq	
	.word 0xa1b60ff9  ! 114: FONES	fones	%f16
	.word 0x93b44ff3  ! 115: FONES	fones	%f9
DS_7:
	.word 0x22800001  ! 117: BE	be,a	<label_0x1>
	.word 0xd9332001  ! 117: STQF_I	-	%f12, [0x0001, %r12]
	normalw
	.word 0x9b458000  ! 116: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x93902004  ! 117: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8f514000  ! 118: RDPR_TBA	rdpr	%tba, %r7
	.word 0x97a00d21  ! 119: FsMULd	fsmuld	%f0, %f32, %f42
	.word 0xaba00542  ! 120: FSQRTd	fsqrt	
	.word 0x8790226d  ! 121: WRPR_TT_I	wrpr	%r0, 0x026d, %tt
	.word 0xeac804a0  ! 122: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r21
	.word 0xb5a549b5  ! 123: FDIVs	fdivs	%f21, %f21, %f26
	.word 0xb351c000  ! 124: RDPR_TL	rdpr	%tl, %r25
	.word 0x91d02035  ! 125: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902007  ! 126: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902002  ! 127: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d902a58  ! 128: WRPR_PSTATE_I	wrpr	%r0, 0x0a58, %pstate
	.word 0xa190200a  ! 129: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87802016  ! 130: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x85a000d1  ! 131: FNEGd	fnegd	%f48, %f2
	.word 0x91d02034  ! 132: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902658  ! 133: WRPR_PSTATE_I	wrpr	%r0, 0x0658, %pstate
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 134: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x85a1c9d8  ! 135: FDIVd	fdivd	%f38, %f24, %f2
	.word 0x8d902084  ! 136: WRPR_PSTATE_I	wrpr	%r0, 0x0084, %pstate
	.word 0x8790201d  ! 137: WRPR_TT_I	wrpr	%r0, 0x001d, %tt
	.word 0x87902339  ! 138: WRPR_TT_I	wrpr	%r0, 0x0339, %tt
	.word 0x81982457  ! 139: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0457, %hpstate
	.word 0xc48008a0  ! 140: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x83504000  ! 141: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x93902006  ! 142: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa190200c  ! 143: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d902a0c  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x0a0c, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91684010  ! 146: SDIVX_R	sdivx	%r1, %r16, %r8
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 147: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87480000  ! 148: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0x91d02032  ! 149: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02035  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 53
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 151: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 152: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 153: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902140  ! 154: WRPR_TT_I	wrpr	%r0, 0x0140, %tt
	.word 0x87902238  ! 155: WRPR_TT_I	wrpr	%r0, 0x0238, %tt
	.word 0xad540000  ! 156: RDPR_GL	rdpr	%-, %r22
	.word 0x87902128  ! 157: WRPR_TT_I	wrpr	%r0, 0x0128, %tt
	.word 0xec800a80  ! 158: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r22
	.word 0x8d802000  ! 159: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x97a00562  ! 160: FSQRTq	fsqrt	
	.word 0x93902005  ! 161: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x83d02034  ! 162: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x93902007  ! 163: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902004  ! 164: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x83514000  ! 165: RDPR_TBA	rdpr	%tba, %r1
	.word 0x88fae001  ! 166: SDIVcc_I	sdivcc 	%r11, 0x0001, %r4
	.word 0xb5b14fe1  ! 167: FONES	fones	%f26
change_to_randtl_8:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 168: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879022e9  ! 170: WRPR_TT_I	wrpr	%r0, 0x02e9, %tt
	.word 0x93902003  ! 171: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xf4d7e030  ! 172: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r26
	.word 0x91d02034  ! 173: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xaba689a6  ! 174: FDIVs	fdivs	%f26, %f6, %f21
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 175: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 176: SIR	sir	0x0001
	.word 0x9b50c000  ! 177: RDPR_TT	rdpr	%tt, %r13
	.word 0x93902000  ! 178: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8ed84006  ! 179: SMULcc_R	smulcc 	%r1, %r6, %r7
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 180: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879023ac  ! 181: WRPR_TT_I	wrpr	%r0, 0x03ac, %tt
	.word 0x866b6001  ! 182: UDIVX_I	udivx 	%r13, 0x0001, %r3
	.word 0x8790210b  ! 183: WRPR_TT_I	wrpr	%r0, 0x010b, %tt
	.word 0x8b6a000a  ! 184: SDIVX_R	sdivx	%r8, %r10, %r5
	.word 0x91d02034  ! 185: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x879023e0  ! 186: WRPR_TT_I	wrpr	%r0, 0x03e0, %tt
	.word 0x8f6a4012  ! 187: SDIVX_R	sdivx	%r9, %r18, %r7
	.word 0x8d902c47  ! 188: WRPR_PSTATE_I	wrpr	%r0, 0x0c47, %pstate
	.word 0xb0fda001  ! 189: SDIVcc_I	sdivcc 	%r22, 0x0001, %r24
	.word 0x91d02035  ! 190: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8790200a  ! 191: WRPR_TT_I	wrpr	%r0, 0x000a, %tt
	.word 0x93d02035  ! 192: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x85b40ff7  ! 193: FONES	fones	%f2
	.word 0x9869a001  ! 194: UDIVX_I	udivx 	%r6, 0x0001, %r12
DS_9:
	.word 0x20800001  ! 196: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 195: SAVE_R	save	%r31, %r0, %r31
	.word 0x819824d4  ! 196: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d4, %hpstate
	.word 0xd937e001  ! 197: STQF_I	-	%f12, [0x0001, %r31]
	.word 0x81982b4e  ! 198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4e, %hpstate
	.word 0x93902006  ! 199: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_10:
	.word 0x34800001  ! 201: BG	bg,a	<label_0x1>
	illtrap
	.word 0xed10400c  ! 201: LDQF_R	-	[%r1, %r12], %f22
	.word 0xa7a68827  ! 200: FADDs	fadds	%f26, %f7, %f19
	.word 0x879022e1  ! 201: WRPR_TT_I	wrpr	%r0, 0x02e1, %tt
	.word 0x93902001  ! 202: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_11:
	.word 0x32800001  ! 204: BNE	bne,a	<label_0x1>
	.word 0x22800001  ! 204: BE	be,a	<label_0x1>
	.word 0xd3144004  ! 204: LDQF_R	-	[%r17, %r4], %f9
	.word 0xafa0c834  ! 203: FADDs	fadds	%f3, %f20, %f23
	.word 0xeec7e030  ! 204: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r23
	.word 0x836a0004  ! 205: SDIVX_R	sdivx	%r8, %r4, %r1
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 206: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc2dfe030  ! 207: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r1
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 208: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 209: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83d02031  ! 210: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x97500000  ! 211: RDPR_TPC	rdpr	%tpc, %r11
	.word 0x91d02033  ! 212: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x879023a1  ! 213: WRPR_TT_I	wrpr	%r0, 0x03a1, %tt
	.word 0xa1902006  ! 214: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d802000  ! 215: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902007  ! 216: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81982d9a  ! 217: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9a, %hpstate
	.word 0x87902209  ! 218: WRPR_TT_I	wrpr	%r0, 0x0209, %tt
	.word 0xa1902008  ! 219: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x91d02033  ! 220: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd737e001  ! 221: STQF_I	-	%f11, [0x0001, %r31]
	.word 0xd6ffc024  ! 222: SWAPA_R	swapa	%r11, [%r31 + %r4] 0x01
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 223: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 224: SIR	sir	0x0001
	.word 0x93902006  ! 225: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982b8b  ! 226: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8b, %hpstate
DS_12:
	.word 0x32800001  ! 228: BNE	bne,a	<label_0x1>
	.word 0xc5346001  ! 228: STQF_I	-	%f2, [0x0001, %r17]
	normalw
	.word 0xa7458000  ! 227: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x87902034  ! 228: WRPR_TT_I	wrpr	%r0, 0x0034, %tt
	.word 0x91d02033  ! 229: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902000  ! 230: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02031  ! 231: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87902127  ! 232: WRPR_TT_I	wrpr	%r0, 0x0127, %tt
	.word 0xe69004a0  ! 233: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	.word 0xb7a10dc6  ! 234: FdMULq	fdmulq	
	.word 0x93902007  ! 235: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93d02032  ! 236: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xa1902009  ! 237: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87902056  ! 238: WRPR_TT_I	wrpr	%r0, 0x0056, %tt
	.word 0x8d9020cd  ! 239: WRPR_PSTATE_I	wrpr	%r0, 0x00cd, %pstate
	.word 0x90d26001  ! 240: UMULcc_I	umulcc 	%r9, 0x0001, %r8
	.word 0xd0c7e000  ! 241: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r8
	.word 0x93902003  ! 242: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 243: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 244: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xab480000  ! 246: RDHPR_HPSTATE	rdhpr	%hpstate, %r21
	.word 0x879020bb  ! 247: WRPR_TT_I	wrpr	%r0, 0x00bb, %tt
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 248: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xeac004a0  ! 249: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r21
	.word 0xea800b60  ! 250: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r21
	.word 0x8d802000  ! 251: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902191  ! 252: WRPR_TT_I	wrpr	%r0, 0x0191, %tt
	.word 0x91d02034  ! 253: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x819824d8  ! 254: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d8, %hpstate
	.word 0x8b494000  ! 255: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0xcac004a0  ! 256: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0x87802088  ! 257: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87902100  ! 258: WRPR_TT_I	wrpr	%r0, 0x0100, %tt
	.word 0x89a649e7  ! 259: FDIVq	dis not found

DS_13:
	.word 0x32800001  ! 261: BNE	bne,a	<label_0x1>
	.word 0xf731c006  ! 261: STQF_R	-	%f27, [%r6, %r7]
	normalw
	.word 0x99458000  ! 260: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x87902327  ! 261: WRPR_TT_I	wrpr	%r0, 0x0327, %tt
	.word 0x30800001  ! 262: BA	ba,a	<label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 263: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_14:
	.word 0x34800001  ! 265: BG	bg,a	<label_0x1>
	.word 0xd5330000  ! 265: STQF_R	-	%f10, [%r0, %r12]
	normalw
	.word 0x8b458000  ! 264: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x83d02033  ! 265: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xcac7e030  ! 266: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r5
	.word 0xcadfe030  ! 267: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r5
	.word 0x8d9024ca  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x04ca, %pstate
	.word 0x91d02033  ! 269: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902eca  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0eca, %pstate
	.word 0x81b00fe1  ! 271: FONES	fones	%f0
	.word 0x87902035  ! 272: WRPR_TT_I	wrpr	%r0, 0x0035, %tt
	.word 0x93902007  ! 273: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 274: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902004  ! 276: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xc0900e40  ! 277: LDUHA_R	lduha	[%r0, %r0] 0x72, %r0
	ta	T_CHANGE_PRIV	! macro
	.word 0xa190200b  ! 279: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x81982540  ! 280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0540, %hpstate
	.word 0xc08008a0  ! 281: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x93902002  ! 282: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc09004a0  ! 283: LDUHA_R	lduha	[%r0, %r0] 0x25, %r0
DS_15:
	.word 0x20800001  ! 285: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 285: BE	be,a	<label_0x1>
	.word 0x87a00542  ! 285: FSQRTd	fsqrt	
	.word 0x8da6482d  ! 284: FADDs	fadds	%f25, %f13, %f6
	.word 0x8fa349ab  ! 285: FDIVs	fdivs	%f13, %f11, %f7
	.word 0x8d6a4012  ! 286: SDIVX_R	sdivx	%r9, %r18, %r6
	.word 0xa1902009  ! 287: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d902e5e  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0e5e, %pstate
	.word 0x87902172  ! 289: WRPR_TT_I	wrpr	%r0, 0x0172, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xada109c3  ! 291: FDIVd	fdivd	%f4, %f34, %f22
	.word 0x8adec00c  ! 292: SMULcc_R	smulcc 	%r27, %r12, %r5
	.word 0x8d902445  ! 293: WRPR_PSTATE_I	wrpr	%r0, 0x0445, %pstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 294: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879022d7  ! 295: WRPR_TT_I	wrpr	%r0, 0x02d7, %tt
	.word 0x8fa349e0  ! 296: FDIVq	dis not found

DS_16:
	.word 0x32800001  ! 298: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xc9108001  ! 298: LDQF_R	-	[%r2, %r1], %f4
	.word 0x83a60823  ! 297: FADDs	fadds	%f24, %f3, %f1
	.word 0xc29fe001  ! 298: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0xa3480000  ! 299: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0x879022d0  ! 300: WRPR_TT_I	wrpr	%r0, 0x02d0, %tt
	.word 0x36800001  ! 301: BGE	bge,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95a01a76  ! 303: FqTOi	fqtoi	
	.word 0xa5b5cfe5  ! 304: FONES	fones	%f18
change_to_tl1_17:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_18:
	.word 0x32800001  ! 307: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 306: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xb36a6001  ! 307: SDIVX_I	sdivx	%r9, 0x0001, %r25
	.word 0x8d90285c  ! 308: WRPR_PSTATE_I	wrpr	%r0, 0x085c, %pstate
	.word 0xf2d7e010  ! 309: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r25
	.word 0xa1902007  ! 310: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93902000  ! 311: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x94fa2001  ! 312: SDIVcc_I	sdivcc 	%r8, 0x0001, %r10
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 313: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982a92  ! 314: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a92, %hpstate
	.word 0xa1902000  ! 315: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d902482  ! 316: WRPR_PSTATE_I	wrpr	%r0, 0x0482, %pstate
change_to_tl1_19:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87802016  ! 318: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93902001  ! 319: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd48008a0  ! 320: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x93902003  ! 321: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x8cd12001  ! 323: UMULcc_I	umulcc 	%r4, 0x0001, %r6
	.word 0xa5a00573  ! 324: FSQRTq	fsqrt	
	.word 0x8c846001  ! 325: ADDcc_I	addcc 	%r17, 0x0001, %r6
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 326: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 327: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xb1494000  ! 328: RDHPR_HTBA	rdhpr	%htba, %r24
	.word 0x93902005  ! 329: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93a049f7  ! 330: FDIVq	dis not found

	.word 0xad68800c  ! 331: SDIVX_R	sdivx	%r2, %r12, %r22
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02030  ! 333: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x9ba14dd8  ! 334: FdMULq	fdmulq	
	.word 0xda17c000  ! 335: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0xa8fd6001  ! 336: SDIVcc_I	sdivcc 	%r21, 0x0001, %r20
	.word 0x8d902cd4  ! 337: WRPR_PSTATE_I	wrpr	%r0, 0x0cd4, %pstate
	.word 0x9551c000  ! 338: RDPR_TL	rdpr	%tl, %r10
	.word 0xd407e001  ! 339: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x3a800001  ! 340: BCC	bcc,a	<label_0x1>
	.word 0x8369400b  ! 341: SDIVX_R	sdivx	%r5, %r11, %r1
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc3e7c02b  ! 343: CASA_I	casa	[%r31] 0x 1, %r11, %r1
	.word 0x91d02032  ! 344: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81982b46  ! 345: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b46, %hpstate
	.word 0x8d902414  ! 346: WRPR_PSTATE_I	wrpr	%r0, 0x0414, %pstate
	.word 0x91d02035  ! 347: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x85698009  ! 348: SDIVX_R	sdivx	%r6, %r9, %r2
	.word 0xc4800c20  ! 349: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r2
	.word 0xc4880e40  ! 350: LDUBA_R	lduba	[%r0, %r0] 0x72, %r2
	.word 0xc427e001  ! 351: STW_I	stw	%r2, [%r31 + 0x0001]
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 352: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c94  ! 353: WRPR_PSTATE_I	wrpr	%r0, 0x0c94, %pstate
	.word 0x99702001  ! 354: POPC_I	popc	0x0001, %r12
	.word 0x91d02031  ! 355: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa1902002  ! 356: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x884dc00b  ! 357: MULX_R	mulx 	%r23, %r11, %r4
	.word 0x20800001  ! 358: BN	bn,a	<label_0x1>
	.word 0x8d902898  ! 359: WRPR_PSTATE_I	wrpr	%r0, 0x0898, %pstate
	.word 0xc8dfe000  ! 360: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r4
	.word 0x87902181  ! 361: WRPR_TT_I	wrpr	%r0, 0x0181, %tt
	.word 0x9f802001  ! 362: SIR	sir	0x0001
	ta	T_CHANGE_PRIV	! macro
	.word 0x93d02034  ! 364: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x87902211  ! 365: WRPR_TT_I	wrpr	%r0, 0x0211, %tt
	.word 0x95a649fb  ! 366: FDIVq	dis not found

	.word 0xa9508000  ! 367: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x81982100  ! 368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0100, %hpstate
	.word 0xb5a000ca  ! 369: FNEGd	fnegd	%f10, %f26
	.word 0xa9a00572  ! 370: FSQRTq	fsqrt	
	.word 0x879023d2  ! 371: WRPR_TT_I	wrpr	%r0, 0x03d2, %tt
	.word 0x93902006  ! 372: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x83d02031  ! 373: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x91d02033  ! 374: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93d02031  ! 375: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8ba0057b  ! 376: FSQRTq	fsqrt	
	.word 0xa190200d  ! 377: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87902079  ! 378: WRPR_TT_I	wrpr	%r0, 0x0079, %tt
	.word 0x879020db  ! 379: WRPR_TT_I	wrpr	%r0, 0x00db, %tt
	.word 0xca7fe001  ! 380: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x93504000  ! 381: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0xa1902003  ! 382: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902007  ! 383: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1a289c9  ! 384: FDIVd	fdivd	%f10, %f40, %f16
	.word 0x8d9028ce  ! 385: WRPR_PSTATE_I	wrpr	%r0, 0x08ce, %pstate
	.word 0xb5a5cd25  ! 386: FsMULd	fsmuld	%f23, %f36, %f26
	.word 0x8d902448  ! 387: WRPR_PSTATE_I	wrpr	%r0, 0x0448, %pstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 388: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a49  ! 389: WRPR_PSTATE_I	wrpr	%r0, 0x0a49, %pstate
	.word 0x9768c009  ! 390: SDIVX_R	sdivx	%r3, %r9, %r11
	.word 0xd67fe001  ! 391: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x8d902c5c  ! 392: WRPR_PSTATE_I	wrpr	%r0, 0x0c5c, %pstate
	.word 0xa1902005  ! 393: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902851  ! 395: WRPR_PSTATE_I	wrpr	%r0, 0x0851, %pstate
	.word 0x8751c000  ! 396: RDPR_TL	rdpr	%tl, %r3
	.word 0x97508000  ! 397: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0xd6c00e40  ! 398: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r11
	.word 0xd68804a0  ! 399: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0x93902002  ! 400: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d90204a  ! 401: WRPR_PSTATE_I	wrpr	%r0, 0x004a, %pstate
	.word 0x86aec013  ! 402: ANDNcc_R	andncc 	%r27, %r19, %r3
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x98d02001  ! 404: UMULcc_I	umulcc 	%r0, 0x0001, %r12
	.word 0x91a01a72  ! 405: FqTOi	fqtoi	
	.word 0x8d514000  ! 406: RDPR_TBA	rdpr	%tba, %r6
	.word 0xb084000d  ! 407: ADDcc_R	addcc 	%r16, %r13, %r24
	.word 0x87802004  ! 408: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf01fe001  ! 409: LDD_I	ldd	[%r31 + 0x0001], %r24
	.word 0x879020e7  ! 410: WRPR_TT_I	wrpr	%r0, 0x00e7, %tt
	.word 0x93902006  ! 411: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02035  ! 412: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa768c018  ! 413: SDIVX_R	sdivx	%r3, %r24, %r19
	.word 0x97a189d3  ! 414: FDIVd	fdivd	%f6, %f50, %f42
	.word 0x91d02031  ! 415: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8fa01a65  ! 416: FqTOi	fqtoi	
	.word 0x93902006  ! 417: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x38700001  ! 418: BPGU	<illegal instruction>
	.word 0x81982eca  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0eca, %hpstate
	.word 0xb66d4018  ! 420: UDIVX_R	udivx 	%r21, %r24, %r27
	.word 0xa1902002  ! 421: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xf6d00e60  ! 422: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r27
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 423: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02034  ! 424: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x99500000  ! 425: RDPR_TPC	rdpr	%tpc, %r12
	.word 0xd8ffc038  ! 426: SWAPA_R	swapa	%r12, [%r31 + %r24] 0x01
	.word 0x8d902a16  ! 427: WRPR_PSTATE_I	wrpr	%r0, 0x0a16, %pstate
	.word 0x8b702001  ! 428: POPC_I	popc	0x0001, %r5
	.word 0x8d90288d  ! 429: WRPR_PSTATE_I	wrpr	%r0, 0x088d, %pstate
	.word 0xb3494000  ! 430: RDHPR_HTBA	rdhpr	%htba, %r25
	.word 0x87902334  ! 431: WRPR_TT_I	wrpr	%r0, 0x0334, %tt
	.word 0xa2c56001  ! 432: ADDCcc_I	addccc 	%r21, 0x0001, %r17
	.word 0x81982a5e  ! 433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5e, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200c  ! 435: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87902230  ! 436: WRPR_TT_I	wrpr	%r0, 0x0230, %tt
DS_20:
	.word 0x22800001  ! 438: BE	be,a	<label_0x1>
	illtrap
	.word 0x91a0054d  ! 438: FSQRTd	fsqrt	
	.word 0x99a18838  ! 437: FADDs	fadds	%f6, %f24, %f12
	.word 0x879021b3  ! 438: WRPR_TT_I	wrpr	%r0, 0x01b3, %tt
	.word 0xd8ffc038  ! 439: SWAPA_R	swapa	%r12, [%r31 + %r24] 0x01
	.word 0x8790233e  ! 440: WRPR_TT_I	wrpr	%r0, 0x033e, %tt
	.word 0xd8c004a0  ! 441: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
	.word 0x8b69c010  ! 442: SDIVX_R	sdivx	%r7, %r16, %r5
	.word 0x879023b0  ! 443: WRPR_TT_I	wrpr	%r0, 0x03b0, %tt
	.word 0x8d802004  ! 444: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93d02032  ! 445: Tcc_I	tne	icc_or_xcc, %r0 + 50
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 446: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 447: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xca77e001  ! 448: STX_I	stx	%r5, [%r31 + 0x0001]
	.word 0x87902306  ! 449: WRPR_TT_I	wrpr	%r0, 0x0306, %tt
	.word 0xb5a20d39  ! 450: FsMULd	fsmuld	%f8, %f56, %f26
	.word 0x93902003  ! 451: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93d02031  ! 452: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8790234d  ! 453: WRPR_TT_I	wrpr	%r0, 0x034d, %tt
DS_21:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 454: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xf457c000  ! 455: LDSH_R	ldsh	[%r31 + %r0], %r26
	.word 0xaf508000  ! 456: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xa5a000c3  ! 457: FNEGd	fnegd	%f34, %f18
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 458: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_22:
	.word 0x32800001  ! 460: BNE	bne,a	<label_0x1>
	.word 0xc136800a  ! 460: STQF_R	-	%f0, [%r10, %r26]
	normalw
	.word 0xa9458000  ! 459: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0xa3540000  ! 460: RDPR_GL	<illegal instruction>
DS_23:
	.word 0x34800001  ! 462: BG	bg,a	<label_0x1>
	.word 0xc732a001  ! 462: STQF_I	-	%f3, [0x0001, %r10]
	normalw
	.word 0x8b458000  ! 461: RD_SOFTINT_REG	rd	%softint, %r5
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 462: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_randtl_24:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 463: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xa1902004  ! 464: WRPR_GL_I	wrpr	%r0, 0x0004, %-
DS_25:
	.word 0x32800001  ! 466: BNE	bne,a	<label_0x1>
	pdist %f2, %f24, %f6
	.word 0xa3b40311  ! 465: ALLIGNADDRESS	alignaddr	%r16, %r17, %r17
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 466: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe27fe001  ! 467: SWAP_I	swap	%r17, [%r31 + 0x0001]
	.word 0xb3494000  ! 468: RDHPR_HTBA	rdhpr	%htba, %r25
	.word 0xf2dfe010  ! 469: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r25
	.word 0x9550c000  ! 470: RDPR_TT	<illegal instruction>
	.word 0x86d0e001  ! 471: UMULcc_I	umulcc 	%r3, 0x0001, %r3
	.word 0x8550c000  ! 472: RDPR_TT	<illegal instruction>
	.word 0x87902059  ! 473: WRPR_TT_I	wrpr	%r0, 0x0059, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8198250f  ! 475: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050f, %hpstate
	.word 0x91d02030  ! 476: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902005  ! 477: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 478: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 479: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87802016  ! 480: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc48fe020  ! 481: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r2
	.word 0x3c700001  ! 482: BPPOS	<illegal instruction>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 483: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x89480000  ! 484: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x92fa2001  ! 485: SDIVcc_I	sdivcc 	%r8, 0x0001, %r9
	.word 0x93902001  ! 486: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02034  ! 487: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd20fc000  ! 488: LDUB_R	ldub	[%r31 + %r0], %r9
	.word 0x3c700001  ! 489: BPPOS	<illegal instruction>
	.word 0x81982ac8  ! 490: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac8, %hpstate
	.word 0x9f802001  ! 491: SIR	sir	0x0001
	.word 0xa1902002  ! 492: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa190200e  ! 493: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 494: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x85508000  ! 495: RDPR_TSTATE	rdpr	%tstate, %r2
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 496: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 497: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x83d02030  ! 498: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xc4cfe020  ! 499: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r2
DS_26:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 500: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x879021e3  ! 501: WRPR_TT_I	wrpr	%r0, 0x01e3, %tt
DS_27:
	.word 0x22800001  ! 503: BE	be,a	<label_0x1>
	.word 0x32800001  ! 503: BNE	bne,a	<label_0x1>
	.word 0x83a00546  ! 503: FSQRTd	fsqrt	
	.word 0x8da44827  ! 502: FADDs	fadds	%f17, %f7, %f6
DS_28:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 503: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x93d02033  ! 504: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x9f802001  ! 505: SIR	sir	0x0001
	.word 0xaf508000  ! 506: RDPR_TSTATE	rdpr	%tstate, %r23
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa190200c  ! 508: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x9469800d  ! 509: UDIVX_R	udivx 	%r6, %r13, %r10
DS_29:
	.word 0x22800001  ! 511: BE	be,a	<label_0x1>
	.word 0x32800001  ! 511: BNE	bne,a	<label_0x1>
	.word 0xe9164014  ! 511: LDQF_R	-	[%r25, %r20], %f20
	.word 0x95a24825  ! 510: FADDs	fadds	%f9, %f5, %f10
	.word 0x93902001  ! 511: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902002  ! 512: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8e4b001a  ! 513: MULX_R	mulx 	%r12, %r26, %r7
	.word 0x93902007  ! 514: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_30:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 515: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x90812001  ! 516: ADDcc_I	addcc 	%r4, 0x0001, %r8
	.word 0x8d9026d5  ! 517: WRPR_PSTATE_I	wrpr	%r0, 0x06d5, %pstate
	.word 0x89684016  ! 518: SDIVX_R	sdivx	%r1, %r22, %r4
	.word 0xc81fc000  ! 519: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0x8790203d  ! 520: WRPR_TT_I	wrpr	%r0, 0x003d, %tt
	.word 0x9b514000  ! 521: RDPR_TBA	rdpr	%tba, %r13
	.word 0x87902056  ! 522: WRPR_TT_I	wrpr	%r0, 0x0056, %tt
	.word 0x81508000  ! 523: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0xa190200c  ! 524: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8198268c  ! 525: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068c, %hpstate
	.word 0xc0dfe000  ! 526: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r0
	.word 0xa1902006  ! 527: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 528: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 529: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xc07fe001  ! 530: SWAP_I	swap	%r0, [%r31 + 0x0001]
	.word 0x87902322  ! 531: WRPR_TT_I	wrpr	%r0, 0x0322, %tt
	.word 0xa1902005  ! 532: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81982057  ! 533: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0057, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 536: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 537: SIR	sir	0x0001
	.word 0x8ad2a001  ! 538: UMULcc_I	umulcc 	%r10, 0x0001, %r5
	.word 0x83d02032  ! 539: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x93902005  ! 540: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xb7480000  ! 541: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x94aac011  ! 542: ANDNcc_R	andncc 	%r11, %r17, %r10
	.word 0x91d02033  ! 543: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8efb4003  ! 545: SDIVcc_R	sdivcc 	%r13, %r3, %r7
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 546: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 547: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902003  ! 548: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x83d02032  ! 549: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xce8008a0  ! 550: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
change_to_tl1_31:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8198274d  ! 552: WRHPR_HPSTATE_I	wrhpr	%r0, 0x074d, %hpstate
	.word 0x879021f8  ! 553: WRPR_TT_I	wrpr	%r0, 0x01f8, %tt
	.word 0xa1902007  ! 554: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1902008  ! 555: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 556: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce27e001  ! 557: STW_I	stw	%r7, [%r31 + 0x0001]
	.word 0x8d9026d3  ! 558: WRPR_PSTATE_I	wrpr	%r0, 0x06d3, %pstate
	.word 0x81982bdc  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdc, %hpstate
	.word 0xa190200b  ! 560: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x87902280  ! 561: WRPR_TT_I	wrpr	%r0, 0x0280, %tt
	.word 0x93902005  ! 562: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902003  ! 563: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d902485  ! 564: WRPR_PSTATE_I	wrpr	%r0, 0x0485, %pstate
	.word 0xcf27c003  ! 565: STF_R	st	%f7, [%r3, %r31]
	.word 0x87504000  ! 566: RDPR_TNPC	rdpr	%tnpc, %r3
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 567: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 568: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8198205a  ! 569: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005a, %hpstate
	.word 0xc727e001  ! 570: STF_I	st	%f3, [0x0001, %r31]
	.word 0x93d02032  ! 571: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d90261b  ! 572: WRPR_PSTATE_I	wrpr	%r0, 0x061b, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 573: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 574: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xb6c0a001  ! 575: ADDCcc_I	addccc 	%r2, 0x0001, %r27
	.word 0x30700001  ! 576: BPA	<illegal instruction>
	.word 0xf61fe001  ! 577: LDD_I	ldd	[%r31 + 0x0001], %r27
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 578: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9750c000  ! 579: RDPR_TT	rdpr	%tt, %r11
	.word 0x91d02033  ! 580: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa6d98001  ! 581: SMULcc_R	smulcc 	%r6, %r1, %r19
	.word 0xe68008a0  ! 582: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r19
	.word 0xa190200c  ! 583: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x97a0054a  ! 584: FSQRTd	fsqrt	
	.word 0x96ae800d  ! 585: ANDNcc_R	andncc 	%r26, %r13, %r11
	.word 0x99902004  ! 586: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x83d02034  ! 587: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xa190200c  ! 588: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902000  ! 589: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d9026d0  ! 590: WRPR_PSTATE_I	wrpr	%r0, 0x06d0, %pstate
	.word 0x8198234e  ! 591: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034e, %hpstate
	.word 0xa190200f  ! 592: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x83514000  ! 593: RDPR_TBA	rdpr	%tba, %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902893  ! 595: WRPR_PSTATE_I	wrpr	%r0, 0x0893, %pstate
	.word 0x87508000  ! 596: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x91d02035  ! 597: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x976ce001  ! 598: SDIVX_I	sdivx	%r19, 0x0001, %r11
	.word 0x819825d0  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d0, %hpstate
	.word 0xb3508000  ! 600: RDPR_TSTATE	rdpr	%tstate, %r25
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 601: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf27fe001  ! 602: SWAP_I	swap	%r25, [%r31 + 0x0001]
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 603: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_tl1_32:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d802000  ! 605: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02031  ! 606: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d902655  ! 607: WRPR_PSTATE_I	wrpr	%r0, 0x0655, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 608: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 609: SIR	sir	0x0001
	.word 0x8d9028cb  ! 610: WRPR_PSTATE_I	wrpr	%r0, 0x08cb, %pstate
	.word 0x87802080  ! 611: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81982ece  ! 612: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ece, %hpstate
	.word 0x879020b1  ! 613: WRPR_TT_I	wrpr	%r0, 0x00b1, %tt
	.word 0x8e694005  ! 614: UDIVX_R	udivx 	%r5, %r5, %r7
	.word 0xce8008a0  ! 615: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x93902007  ! 616: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8198275b  ! 617: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075b, %hpstate
	.word 0xa1902009  ! 618: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x88f90009  ! 619: SDIVcc_R	sdivcc 	%r4, %r9, %r4
	.word 0xb56c4008  ! 620: SDIVX_R	sdivx	%r17, %r8, %r26
	.word 0xa1902000  ! 621: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x93902003  ! 622: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902000  ! 623: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802016  ! 624: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xf48008a0  ! 626: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0x81982407  ! 627: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0407, %hpstate
	.word 0x81982f15  ! 628: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f15, %hpstate
	.word 0x8750c000  ! 629: RDPR_TT	rdpr	%tt, %r3
	.word 0x81982c43  ! 630: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c43, %hpstate
	.word 0x98680002  ! 631: UDIVX_R	udivx 	%r0, %r2, %r12
	.word 0x8e4ec010  ! 632: MULX_R	mulx 	%r27, %r16, %r7
	.word 0x8d902648  ! 633: WRPR_PSTATE_I	wrpr	%r0, 0x0648, %pstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 634: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_33:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x819824ca  ! 636: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04ca, %hpstate
	.word 0x91d02033  ! 637: Tcc_I	ta	icc_or_xcc, %r0 + 51
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 638: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a81  ! 639: WRPR_PSTATE_I	wrpr	%r0, 0x0a81, %pstate
	.word 0x81982253  ! 640: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0253, %hpstate
change_to_tl1_34:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xb351c000  ! 642: RDPR_TL	rdpr	%tl, %r25
	.word 0xf28008a0  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8d902092  ! 644: WRPR_PSTATE_I	wrpr	%r0, 0x0092, %pstate
	.word 0x81982119  ! 645: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0119, %hpstate
	.word 0x8d902c4d  ! 646: WRPR_PSTATE_I	wrpr	%r0, 0x0c4d, %pstate
	.word 0x93d02031  ! 647: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8d90280f  ! 648: WRPR_PSTATE_I	wrpr	%r0, 0x080f, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 649: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 650: Tcc_I	ta	icc_or_xcc, %r0 + 49
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2cfe010  ! 652: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r25
	.word 0x87802080  ! 653: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d90240a  ! 655: WRPR_PSTATE_I	wrpr	%r0, 0x040a, %pstate
	.word 0x3c800001  ! 656: BPOS	bpos,a	<label_0x1>
	.word 0x81540000  ! 657: RDPR_GL	rdpr	%-, %r0
	.word 0xc117c000  ! 658: LDQF_R	-	[%r31, %r0], %f0
	.word 0x91d02030  ! 659: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x89a10d26  ! 660: FsMULd	fsmuld	%f4, %f6, %f4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802000  ! 662: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9020d3  ! 663: WRPR_PSTATE_I	wrpr	%r0, 0x00d3, %pstate
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 664: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902c5a  ! 665: WRPR_PSTATE_I	wrpr	%r0, 0x0c5a, %pstate
	.word 0x8d902cdd  ! 666: WRPR_PSTATE_I	wrpr	%r0, 0x0cdd, %pstate
	.word 0x87902270  ! 667: WRPR_TT_I	wrpr	%r0, 0x0270, %tt
	.word 0x91d02032  ! 668: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81982d1d  ! 669: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d1d, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982018  ! 671: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0018, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902241  ! 673: WRPR_PSTATE_I	wrpr	%r0, 0x0241, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81a589b0  ! 675: FDIVs	fdivs	%f22, %f16, %f0
	.word 0x97a00548  ! 676: FSQRTd	fsqrt	
	.word 0x87902061  ! 677: WRPR_TT_I	wrpr	%r0, 0x0061, %tt
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 678: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 679: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 680: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902003  ! 681: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x9a82a001  ! 682: ADDcc_I	addcc 	%r10, 0x0001, %r13
	.word 0x8d802004  ! 683: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90240d  ! 684: WRPR_PSTATE_I	wrpr	%r0, 0x040d, %pstate
	.word 0x91d02031  ! 685: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xb5a18d2b  ! 686: FsMULd	fsmuld	%f6, %f42, %f26
	.word 0x8d902c51  ! 687: WRPR_PSTATE_I	wrpr	%r0, 0x0c51, %pstate
	.word 0x99b08feb  ! 688: FONES	fones	%f12
	.word 0xd88008a0  ! 689: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x8d902c58  ! 690: WRPR_PSTATE_I	wrpr	%r0, 0x0c58, %pstate
	.word 0x91d02032  ! 691: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd807c000  ! 692: LDUW_R	lduw	[%r31 + %r0], %r12
	.word 0x93d02034  ! 693: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x97504000  ! 694: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0x81982401  ! 695: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0401, %hpstate
	.word 0x8790204f  ! 696: WRPR_TT_I	wrpr	%r0, 0x004f, %tt
	.word 0x879021bd  ! 697: WRPR_TT_I	wrpr	%r0, 0x01bd, %tt
	.word 0x8d802000  ! 698: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83d02030  ! 699: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xa1902005  ! 700: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 701: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 702: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982816  ! 703: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0816, %hpstate
	.word 0xa1902005  ! 704: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x94816001  ! 705: ADDcc_I	addcc 	%r5, 0x0001, %r10
change_to_randtl_35:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 706: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x91d02030  ! 707: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa8d58016  ! 708: UMULcc_R	umulcc 	%r22, %r22, %r20
	.word 0x8d902e5d  ! 709: WRPR_PSTATE_I	wrpr	%r0, 0x0e5d, %pstate
	.word 0x81982f4d  ! 710: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4d, %hpstate
	.word 0x93902007  ! 711: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8198229e  ! 712: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029e, %hpstate
	.word 0x81982c4c  ! 713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4c, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 714: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93d02031  ! 715: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x93902002  ! 716: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8b480000  ! 717: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
DS_36:
	.word 0x22800001  ! 719: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 718: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9351c000  ! 719: RDPR_TL	rdpr	%tl, %r9
	.word 0xa190200d  ! 720: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd2880e60  ! 721: LDUBA_R	lduba	[%r0, %r0] 0x73, %r9
DS_37:
	.word 0x22800001  ! 723: BE	be,a	<label_0x1>
	.word 0x34800001  ! 723: BG	bg,a	<label_0x1>
	.word 0xb1a00544  ! 723: FSQRTd	fsqrt	
	.word 0x93a48827  ! 722: FADDs	fadds	%f18, %f7, %f9
	.word 0x8790208c  ! 723: WRPR_TT_I	wrpr	%r0, 0x008c, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8198211a  ! 725: WRHPR_HPSTATE_I	wrhpr	%r0, 0x011a, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982ad9  ! 727: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad9, %hpstate
change_to_tl1_38:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x95540000  ! 729: RDPR_GL	rdpr	%-, %r10
DS_39:
	.word 0x34800001  ! 731: BG	bg,a	<label_0x1>
	.word 0xe132a001  ! 731: STQF_I	-	%f16, [0x0001, %r10]
	normalw
	.word 0x81458000  ! 730: RD_SOFTINT_REG	stbar
	.word 0x87902275  ! 731: WRPR_TT_I	wrpr	%r0, 0x0275, %tt
	.word 0xb6d80006  ! 732: SMULcc_R	smulcc 	%r0, %r6, %r27
	.word 0x87902388  ! 733: WRPR_TT_I	wrpr	%r0, 0x0388, %tt
	.word 0xf69fc020  ! 734: LDDA_R	ldda	[%r31, %r0] 0x01, %r27
	.word 0x81982b44  ! 735: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b44, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 736: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 737: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x93702001  ! 738: POPC_I	popc	0x0001, %r9
	.word 0x9550c000  ! 739: RDPR_TT	rdpr	%tt, %r10
	.word 0xb1500000  ! 740: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8d902247  ! 741: WRPR_PSTATE_I	wrpr	%r0, 0x0247, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8198291f  ! 743: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091f, %hpstate
DS_40:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 744: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x85a44d2c  ! 745: FsMULd	fsmuld	%f17, %f12, %f2
	.word 0x8f504000  ! 746: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x2e700001  ! 747: BPVS	<illegal instruction>
	.word 0x8790220d  ! 748: WRPR_TT_I	wrpr	%r0, 0x020d, %tt
	.word 0xa1902008  ! 749: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 750: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90220b  ! 751: WRPR_PSTATE_I	wrpr	%r0, 0x020b, %pstate
	.word 0x81982c1d  ! 752: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1d, %hpstate
	.word 0xce0fe001  ! 753: LDUB_I	ldub	[%r31 + 0x0001], %r7
	.word 0x89a209d6  ! 754: FDIVd	fdivd	%f8, %f22, %f4
	.word 0x8e6b4019  ! 755: UDIVX_R	udivx 	%r13, %r25, %r7
	.word 0xa1902004  ! 756: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x81982957  ! 757: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0957, %hpstate
	.word 0x81a0054c  ! 758: FSQRTd	fsqrt	
	.word 0xc00fc000  ! 759: LDUB_R	ldub	[%r31 + %r0], %r0
	.word 0x8d902e58  ! 760: WRPR_PSTATE_I	wrpr	%r0, 0x0e58, %pstate
	.word 0x8d802004  ! 761: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xc197e001  ! 762: LDQFA_I	-	[%r31, 0x0001], %f0
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 763: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902023  ! 764: WRPR_TT_I	wrpr	%r0, 0x0023, %tt
	.word 0x83d02035  ! 765: Tcc_I	te	icc_or_xcc, %r0 + 53
DS_41:
	.word 0x32800001  ! 767: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 766: SAVE_R	save	%r31, %r0, %r31
DS_42:
	.word 0x22800001  ! 768: BE	be,a	<label_0x1>
	allclean
	.word 0xa1b28308  ! 767: ALLIGNADDRESS	alignaddr	%r10, %r8, %r16
	.word 0x8790218d  ! 768: WRPR_TT_I	wrpr	%r0, 0x018d, %tt
	.word 0xa1902000  ! 769: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe08008a0  ! 770: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xe0bfe001  ! 771: STDA_I	stda	%r16, [%r31 + 0x0001] %asi
	.word 0x8e49800a  ! 772: MULX_R	mulx 	%r6, %r10, %r7
	.word 0x93902000  ! 773: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93d02030  ! 774: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x8d902a5f  ! 775: WRPR_PSTATE_I	wrpr	%r0, 0x0a5f, %pstate
	.word 0xa190200f  ! 776: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x91d02030  ! 777: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x879022a9  ! 778: WRPR_TT_I	wrpr	%r0, 0x02a9, %tt
	.word 0x8d802000  ! 779: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90220e  ! 780: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
	.word 0x93902006  ! 781: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xb1480000  ! 782: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xa190200b  ! 783: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x9b500000  ! 784: RDPR_TPC	rdpr	%tpc, %r13
DS_43:
	.word 0x34800001  ! 786: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 785: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91a01a65  ! 786: FqTOi	fqtoi	
	.word 0xa1902000  ! 787: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x86d0400d  ! 788: UMULcc_R	umulcc 	%r1, %r13, %r3
	.word 0xa1902001  ! 789: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_44:
	.word 0x22800001  ! 791: BE	be,a	<label_0x1>
	illtrap
	.word 0xcf12000d  ! 791: LDQF_R	-	[%r8, %r13], %f7
	.word 0xa9a0082b  ! 790: FADDs	fadds	%f0, %f11, %f20
	.word 0xa1902003  ! 791: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0xe87fe001  ! 793: SWAP_I	swap	%r20, [%r31 + 0x0001]
change_to_tl1_45:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 795: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 796: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83a01a6c  ! 797: FqTOi	fqtoi	
	.word 0x91d02030  ! 798: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xc247e001  ! 799: LDSW_I	ldsw	[%r31 + 0x0001], %r1
	.word 0x87802004  ! 800: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02033  ! 801: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc227e001  ! 802: STW_I	stw	%r1, [%r31 + 0x0001]
	.word 0x93902005  ! 803: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 804: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_46:
	.word 0x34800001  ! 806: BG	bg,a	<label_0x1>
	.word 0xc133000c  ! 806: STQF_R	-	%f0, [%r12, %r12]
	normalw
	.word 0x85458000  ! 805: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x8d90224c  ! 806: WRPR_PSTATE_I	wrpr	%r0, 0x024c, %pstate
	.word 0x8d90225e  ! 807: WRPR_PSTATE_I	wrpr	%r0, 0x025e, %pstate
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 808: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 809: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa2fb000d  ! 810: SDIVcc_R	sdivcc 	%r12, %r13, %r17
	.word 0x88f8a001  ! 811: SDIVcc_I	sdivcc 	%r2, 0x0001, %r4
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9f802001  ! 813: SIR	sir	0x0001
	.word 0x8ba00541  ! 814: FSQRTd	fsqrt	
	.word 0xa190200a  ! 815: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x83d02033  ! 816: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8790205d  ! 817: WRPR_TT_I	wrpr	%r0, 0x005d, %tt
	.word 0x8198258f  ! 818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058f, %hpstate
	.word 0x9469a001  ! 819: UDIVX_I	udivx 	%r6, 0x0001, %r10
	.word 0xd517c000  ! 820: LDQF_R	-	[%r31, %r0], %f10
DS_47:
	.word 0x32800001  ! 822: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 821: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 822: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x819823c1  ! 823: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c1, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
change_to_tl1_48:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d9026dd  ! 826: WRPR_PSTATE_I	wrpr	%r0, 0x06dd, %pstate
	.word 0x83d02033  ! 827: Tcc_I	te	icc_or_xcc, %r0 + 51
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 828: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 829: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198269e  ! 830: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069e, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 831: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x96a8c005  ! 832: ANDNcc_R	andncc 	%r3, %r5, %r11
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 833: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd7e7c025  ! 834: CASA_I	casa	[%r31] 0x 1, %r5, %r11
	.word 0x81982e4e  ! 835: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4e, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd68fe000  ! 837: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r11
	.word 0x93902006  ! 838: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd6bfe001  ! 839: STDA_I	stda	%r11, [%r31 + 0x0001] %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902e03  ! 841: WRPR_PSTATE_I	wrpr	%r0, 0x0e03, %pstate
	.word 0xd7e7c025  ! 842: CASA_I	casa	[%r31] 0x 1, %r5, %r11
	.word 0x879021cb  ! 843: WRPR_TT_I	wrpr	%r0, 0x01cb, %tt
	.word 0x95a0054a  ! 844: FSQRTd	fsqrt	
	.word 0x8d902cc8  ! 845: WRPR_PSTATE_I	wrpr	%r0, 0x0cc8, %pstate
	.word 0x8198228f  ! 846: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028f, %hpstate
	.word 0x9b68e001  ! 847: SDIVX_I	sdivx	%r3, 0x0001, %r13
	.word 0x93902006  ! 848: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa190200e  ! 849: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8f50c000  ! 850: RDPR_TT	rdpr	%tt, %r7
	.word 0x8d902011  ! 851: WRPR_PSTATE_I	wrpr	%r0, 0x0011, %pstate
	.word 0xaf508000  ! 852: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0xee07e001  ! 853: LDUW_I	lduw	[%r31 + 0x0001], %r23
	.word 0x95500000  ! 854: RDPR_TPC	<illegal instruction>
	.word 0x91d02033  ! 855: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9028c4  ! 857: WRPR_PSTATE_I	wrpr	%r0, 0x08c4, %pstate
	.word 0xa3a28d38  ! 858: FsMULd	fsmuld	%f10, %f24, %f48
	.word 0xa3a2cd2c  ! 859: FsMULd	fsmuld	%f11, %f12, %f48
	.word 0xe2ffc02c  ! 860: SWAPA_R	swapa	%r17, [%r31 + %r12] 0x01
	.word 0x91d02033  ! 861: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902002  ! 862: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d802000  ! 863: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879023ab  ! 864: WRPR_TT_I	wrpr	%r0, 0x03ab, %tt
change_to_randtl_49:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 865: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe2c7e030  ! 866: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r17
	.word 0xa190200d  ! 867: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d802000  ! 868: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02032  ! 870: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe28008a0  ! 871: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe2d004a0  ! 872: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0xe2c804a0  ! 873: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 874: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81500000  ! 875: RDPR_TPC	rdpr	%tpc, %r0
	.word 0xa1694018  ! 876: SDIVX_R	sdivx	%r5, %r24, %r16
	.word 0xa190200e  ! 877: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 878: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 879: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 880: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_50:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 881: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xe097e000  ! 882: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
DS_51:
	.word 0x20800001  ! 884: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 883: SAVE_R	save	%r31, %r0, %r31
	ta	T_CHANGE_NONHPRIV	! macro
DS_52:
	.word 0x22800001  ! 886: BE	be,a	<label_0x1>
	illtrap
	.word 0x83a0054b  ! 886: FSQRTd	fsqrt	
	.word 0x85a28839  ! 885: FADDs	fadds	%f10, %f25, %f2
	.word 0x87802088  ! 886: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa1902006  ! 887: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x879021a6  ! 888: WRPR_TT_I	wrpr	%r0, 0x01a6, %tt
	.word 0xc48fe010  ! 889: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r2
	.word 0x93902001  ! 890: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc4dfe010  ! 891: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r2
	.word 0xa1902008  ! 892: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x81982747  ! 893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0747, %hpstate
	.word 0x8d500000  ! 894: RDPR_TPC	rdpr	%tpc, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xcc7fe001  ! 896: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x87902141  ! 897: WRPR_TT_I	wrpr	%r0, 0x0141, %tt
	.word 0x9aa8c010  ! 898: ANDNcc_R	andncc 	%r3, %r16, %r13
	.word 0xda97e030  ! 899: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r13
	.word 0x879023c5  ! 900: WRPR_TT_I	wrpr	%r0, 0x03c5, %tt
	.word 0x93d02031  ! 901: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xda07c000  ! 902: LDUW_R	lduw	[%r31 + %r0], %r13
	.word 0x8d902a81  ! 903: WRPR_PSTATE_I	wrpr	%r0, 0x0a81, %pstate
DS_53:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 904: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x93902001  ! 905: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa190200c  ! 906: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x9ba2c9e3  ! 907: FDIVq	dis not found

	.word 0x93902002  ! 908: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa190200c  ! 910: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1902009  ! 911: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 912: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xda97e010  ! 913: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r13
	.word 0xa5a00566  ! 914: FSQRTq	fsqrt	
	.word 0x8d902899  ! 915: WRPR_PSTATE_I	wrpr	%r0, 0x0899, %pstate
	.word 0x83d02032  ! 916: Tcc_I	te	icc_or_xcc, %r0 + 50
change_to_tl1_54:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa46ee001  ! 918: UDIVX_I	udivx 	%r27, 0x0001, %r18
	.word 0x8285c009  ! 919: ADDcc_R	addcc 	%r23, %r9, %r1
	.word 0x88d44000  ! 920: UMULcc_R	umulcc 	%r17, %r0, %r4
	.word 0x87802088  ! 921: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d90248e  ! 922: WRPR_PSTATE_I	wrpr	%r0, 0x048e, %pstate
	.word 0x34700001  ! 923: BPG	<illegal instruction>
	.word 0x91d02033  ! 924: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02031  ! 925: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_55:
	.word 0x22800001  ! 927: BE	be,a	<label_0x1>
	pdist %f30, %f24, %f20
	.word 0x89b24312  ! 926: ALLIGNADDRESS	alignaddr	%r9, %r18, %r4
	.word 0x87902333  ! 927: WRPR_TT_I	wrpr	%r0, 0x0333, %tt
	.word 0xa1902002  ! 928: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8e6e4013  ! 929: UDIVX_R	udivx 	%r25, %r19, %r7
	.word 0xce8008a0  ! 930: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x93d02031  ! 931: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x83d02031  ! 932: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x8198231c  ! 933: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031c, %hpstate
	.word 0x87902027  ! 934: WRPR_TT_I	wrpr	%r0, 0x0027, %tt
	.word 0x8ed16001  ! 935: UMULcc_I	umulcc 	%r5, 0x0001, %r7
	.word 0xa8684017  ! 936: UDIVX_R	udivx 	%r1, %r23, %r20
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 937: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 938: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790231c  ! 939: WRPR_TT_I	wrpr	%r0, 0x031c, %tt
change_to_randtl_56:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 940: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91d02030  ! 941: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902006  ! 942: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9950c000  ! 943: RDPR_TT	rdpr	%tt, %r12
	.word 0x87902279  ! 944: WRPR_TT_I	wrpr	%r0, 0x0279, %tt
	.word 0xab6e000b  ! 945: SDIVX_R	sdivx	%r24, %r11, %r21
	.word 0xeaffc02b  ! 946: SWAPA_R	swapa	%r21, [%r31 + %r11] 0x01
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8198268c  ! 948: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068c, %hpstate
	.word 0xa1902006  ! 949: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x91494000  ! 950: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x879023bf  ! 951: WRPR_TT_I	wrpr	%r0, 0x03bf, %tt
	.word 0x8d90280e  ! 952: WRPR_PSTATE_I	wrpr	%r0, 0x080e, %pstate
	.word 0x93902003  ! 953: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8751c000  ! 954: RDPR_TL	rdpr	%tl, %r3
	.word 0x8d90248c  ! 955: WRPR_PSTATE_I	wrpr	%r0, 0x048c, %pstate
	.word 0x87802014  ! 956: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902006  ! 957: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93d02031  ! 958: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8da00577  ! 959: FSQRTq	fsqrt	
	.word 0xcc8008a0  ! 960: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8da00546  ! 961: FSQRTd	fsqrt	
	.word 0x916a800a  ! 962: SDIVX_R	sdivx	%r10, %r10, %r8
	.word 0x91d02034  ! 963: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902001  ! 965: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x99b34fe1  ! 966: FONES	fones	%f12
	.word 0x8d802004  ! 967: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902007  ! 968: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa2d2e001  ! 969: UMULcc_I	umulcc 	%r11, 0x0001, %r17
	.word 0xe327e001  ! 970: STF_I	st	%f17, [0x0001, %r31]
	.word 0x8ed42001  ! 971: UMULcc_I	umulcc 	%r16, 0x0001, %r7
	.word 0x93902005  ! 972: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x92a90001  ! 973: ANDNcc_R	andncc 	%r4, %r1, %r9
	.word 0x8c68a001  ! 974: UDIVX_I	udivx 	%r2, 0x0001, %r6
	.word 0x8d902813  ! 975: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	.word 0x87802004  ! 976: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93a000ca  ! 977: FNEGd	fnegd	%f10, %f40
	.word 0x83d02033  ! 978: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xa190200e  ! 979: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xb0dc000b  ! 980: SMULcc_R	smulcc 	%r16, %r11, %r24
	.word 0x95540000  ! 981: RDPR_GL	rdpr	%-, %r10
	.word 0x8d902c17  ! 982: WRPR_PSTATE_I	wrpr	%r0, 0x0c17, %pstate
	.word 0x819827cd  ! 983: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cd, %hpstate
	.word 0xa5a000c2  ! 984: FNEGd	fnegd	%f2, %f18
DS_57:
	.word 0x34800001  ! 986: BG	bg,a	<label_0x1>
	allclean
	.word 0x81b00301  ! 985: ALLIGNADDRESS	alignaddr	%r0, %r1, %r0
	.word 0x87902322  ! 986: WRPR_TT_I	wrpr	%r0, 0x0322, %tt
	.word 0xc08008a0  ! 987: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x87902137  ! 988: WRPR_TT_I	wrpr	%r0, 0x0137, %tt
	.word 0x87902189  ! 989: WRPR_TT_I	wrpr	%r0, 0x0189, %tt
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 990: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc0ffc021  ! 991: SWAPA_R	swapa	%r0, [%r31 + %r1] 0x01
DS_58:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 992: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xc0c7e010  ! 993: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r0
	.word 0xc08008a0  ! 994: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x9f802001  ! 995: SIR	sir	0x0001
	.word 0x83d02032  ! 996: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x91d02033  ! 997: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 998: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9028c7  ! 999: WRPR_PSTATE_I	wrpr	%r0, 0x08c7, %pstate
	.word 0x93902006  ! 1000: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1001: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982209  ! 1003: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0209, %hpstate
	.word 0x93902007  ! 1004: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1005: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1006: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x97a309a4  ! 1007: FDIVs	fdivs	%f12, %f4, %f11
	.word 0x38800001  ! 1008: BGU	bgu,a	<label_0x1>
	.word 0x91d02032  ! 1009: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902007  ! 1010: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd647e001  ! 1011: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x90d3000b  ! 1012: UMULcc_R	umulcc 	%r12, %r11, %r8
	.word 0x8d902493  ! 1013: WRPR_PSTATE_I	wrpr	%r0, 0x0493, %pstate
	.word 0x9a854004  ! 1014: ADDcc_R	addcc 	%r21, %r4, %r13
	.word 0x92fe2001  ! 1015: SDIVcc_I	sdivcc 	%r24, 0x0001, %r9
	.word 0x819821c3  ! 1016: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c3, %hpstate
	.word 0x87902158  ! 1017: WRPR_TT_I	wrpr	%r0, 0x0158, %tt
	.word 0xd21fe001  ! 1018: LDD_I	ldd	[%r31 + 0x0001], %r9
	.word 0xd28008a0  ! 1019: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8750c000  ! 1020: RDPR_TT	rdpr	%tt, %r3
	.word 0x93902003  ! 1021: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x9f802001  ! 1022: SIR	sir	0x0001
	.word 0xc737c004  ! 1023: STQF_R	-	%f3, [%r4, %r31]
	.word 0x8d902456  ! 1024: WRPR_PSTATE_I	wrpr	%r0, 0x0456, %pstate
	.word 0xc63fc004  ! 1025: STD_R	std	%r3, [%r31 + %r4]
DS_59:
	.word 0x20800001  ! 1027: BN	bn,a	<label_0x1>
	pdist %f30, %f18, %f28
	.word 0x87b60314  ! 1026: ALLIGNADDRESS	alignaddr	%r24, %r20, %r3
	.word 0x83d02034  ! 1027: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x9ba000c0  ! 1028: FNEGd	fnegd	%f0, %f44
	.word 0x83d02035  ! 1029: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x93902006  ! 1030: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xda8008a0  ! 1031: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x8d9020d2  ! 1032: WRPR_PSTATE_I	wrpr	%r0, 0x00d2, %pstate
	.word 0xda17c000  ! 1033: LDUH_R	lduh	[%r31 + %r0], %r13
	.word 0x8d902ecf  ! 1034: WRPR_PSTATE_I	wrpr	%r0, 0x0ecf, %pstate
	.word 0x87902072  ! 1035: WRPR_TT_I	wrpr	%r0, 0x0072, %tt
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1036: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902445  ! 1037: WRPR_PSTATE_I	wrpr	%r0, 0x0445, %pstate
	.word 0x81982a0e  ! 1038: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a0e, %hpstate
	.word 0x93902004  ! 1039: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d90281e  ! 1040: WRPR_PSTATE_I	wrpr	%r0, 0x081e, %pstate
	.word 0x8d902615  ! 1041: WRPR_PSTATE_I	wrpr	%r0, 0x0615, %pstate
	.word 0x9f802001  ! 1042: SIR	sir	0x0001
	.word 0x9b480000  ! 1043: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0xdbe7c020  ! 1044: CASA_I	casa	[%r31] 0x 1, %r0, %r13
	.word 0xda7fe001  ! 1045: SWAP_I	swap	%r13, [%r31 + 0x0001]
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1046: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982610  ! 1047: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0610, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d802004  ! 1049: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d51c000  ! 1050: RDPR_TL	rdpr	%tl, %r6
DS_60:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1051: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xcc1fe001  ! 1052: LDD_I	ldd	[%r31 + 0x0001], %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9afca001  ! 1054: SDIVcc_I	sdivcc 	%r18, 0x0001, %r13
	.word 0x8950c000  ! 1055: RDPR_TT	rdpr	%tt, %r4
	.word 0x9ad08002  ! 1056: UMULcc_R	umulcc 	%r2, %r2, %r13
	ta	T_CHANGE_HPRIV	! macro
	.word 0xdac804a0  ! 1058: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
change_to_tl1_61:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02031  ! 1060: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d90224c  ! 1061: WRPR_PSTATE_I	wrpr	%r0, 0x024c, %pstate
	.word 0x8d902c9a  ! 1062: WRPR_PSTATE_I	wrpr	%r0, 0x0c9a, %pstate
	.word 0x88dd4002  ! 1063: SMULcc_R	smulcc 	%r21, %r2, %r4
	.word 0x81a149d3  ! 1064: FDIVd	fdivd	%f36, %f50, %f0
	.word 0x91d02030  ! 1065: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d902a0a  ! 1066: WRPR_PSTATE_I	wrpr	%r0, 0x0a0a, %pstate
	.word 0x8d508000  ! 1067: RDPR_TSTATE	rdpr	%tstate, %r6
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1068: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7a1cdc5  ! 1069: FdMULq	fdmulq	
	.word 0x91d02032  ! 1070: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_62:
	.word 0x34800001  ! 1072: BG	bg,a	<label_0x1>
	.word 0xc5322001  ! 1072: STQF_I	-	%f2, [0x0001, %r8]
	normalw
	.word 0x8b458000  ! 1071: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x93902004  ! 1072: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xcad004a0  ! 1073: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0x8b480000  ! 1074: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x879023c7  ! 1075: WRPR_TT_I	wrpr	%r0, 0x03c7, %tt
	.word 0xca47c000  ! 1076: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0x83d02030  ! 1077: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x99a000d5  ! 1078: FNEGd	fnegd	%f52, %f12
	.word 0x87902066  ! 1079: WRPR_TT_I	wrpr	%r0, 0x0066, %tt
	.word 0xd87fe001  ! 1080: SWAP_I	swap	%r12, [%r31 + 0x0001]
	.word 0x91d02030  ! 1081: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x81982a86  ! 1082: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a86, %hpstate
	.word 0x87902247  ! 1083: WRPR_TT_I	wrpr	%r0, 0x0247, %tt
	.word 0xa190200e  ! 1084: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x81982193  ! 1085: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0193, %hpstate
	.word 0xd8c7e010  ! 1086: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r12
	.word 0x87802089  ! 1087: WRASI_I	wr	%r0, 0x0089, %asi
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1088: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1089: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91540000  ! 1090: RDPR_GL	rdpr	%-, %r8
	.word 0x87a309c1  ! 1091: FDIVd	fdivd	%f12, %f32, %f34
	.word 0xc69004a0  ! 1092: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1093: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc697e020  ! 1094: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r3
	.word 0x8d902816  ! 1095: WRPR_PSTATE_I	wrpr	%r0, 0x0816, %pstate
	.word 0x879020ad  ! 1096: WRPR_TT_I	wrpr	%r0, 0x00ad, %tt
	.word 0x3a700001  ! 1097: BPCC	<illegal instruction>
	.word 0x91d02035  ! 1098: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902007  ! 1099: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1100: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 1101: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x819820c6  ! 1102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c6, %hpstate
	.word 0x89504000  ! 1103: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x8198275e  ! 1104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075e, %hpstate
	.word 0x81982588  ! 1105: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0588, %hpstate
DS_63:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1106: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xa7a00547  ! 1107: FSQRTd	fsqrt	
	.word 0x8b6ca001  ! 1108: SDIVX_I	sdivx	%r18, 0x0001, %r5
	.word 0x87514000  ! 1109: RDPR_TBA	rdpr	%tba, %r3
DS_64:
	.word 0x20800001  ! 1111: BN	bn,a	<label_0x1>
	illtrap
	.word 0x85a0055b  ! 1111: FSQRTd	fsqrt	
	.word 0xa3a14836  ! 1110: FADDs	fadds	%f5, %f22, %f17
	.word 0x93902004  ! 1111: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_65:
	.word 0x32800001  ! 1113: BNE	bne,a	<label_0x1>
	.word 0xeb362001  ! 1113: STQF_I	-	%f21, [0x0001, %r24]
	normalw
	.word 0xb3458000  ! 1112: RD_SOFTINT_REG	rd	%softint, %r25
	.word 0x8d90281e  ! 1113: WRPR_PSTATE_I	wrpr	%r0, 0x081e, %pstate
	.word 0x8d802000  ! 1114: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982354  ! 1115: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0354, %hpstate
	.word 0x879021eb  ! 1116: WRPR_TT_I	wrpr	%r0, 0x01eb, %tt
	.word 0x8d702001  ! 1117: POPC_I	popc	0x0001, %r6
	.word 0xa1902007  ! 1118: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa190200f  ! 1119: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d902403  ! 1120: WRPR_PSTATE_I	wrpr	%r0, 0x0403, %pstate
	.word 0x8d902ec9  ! 1121: WRPR_PSTATE_I	wrpr	%r0, 0x0ec9, %pstate
	.word 0x8d802000  ! 1122: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02032  ! 1123: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa0f82001  ! 1124: SDIVcc_I	sdivcc 	%r0, 0x0001, %r16
	.word 0x83d02033  ! 1125: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xb0fce001  ! 1126: SDIVcc_I	sdivcc 	%r19, 0x0001, %r24
	.word 0x3a700001  ! 1127: BPCC	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xf1e7c036  ! 1129: CASA_I	casa	[%r31] 0x 1, %r22, %r24
	.word 0xf0ffc036  ! 1130: SWAPA_R	swapa	%r24, [%r31 + %r22] 0x01
	.word 0xa5504000  ! 1131: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x91d02033  ! 1132: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982697  ! 1134: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0697, %hpstate
	.word 0xb1504000  ! 1135: RDPR_TNPC	rdpr	%tnpc, %r24
	.word 0x8790222c  ! 1136: WRPR_TT_I	wrpr	%r0, 0x022c, %tt
	.word 0x91d02031  ! 1137: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81982bdd  ! 1138: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdd, %hpstate
	.word 0x8790221c  ! 1139: WRPR_TT_I	wrpr	%r0, 0x021c, %tt
	.word 0x91d02034  ! 1140: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81982a1b  ! 1141: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1b, %hpstate
	.word 0x8198254b  ! 1142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054b, %hpstate
	.word 0xf13fc016  ! 1143: STDF_R	std	%f24, [%r22, %r31]
	.word 0xa190200d  ! 1144: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93d02035  ! 1145: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xf1e7c036  ! 1146: CASA_I	casa	[%r31] 0x 1, %r22, %r24
	.word 0x8d802004  ! 1147: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x85a00d24  ! 1148: FsMULd	fsmuld	%f0, %f4, %f2
	.word 0x8d902414  ! 1149: WRPR_PSTATE_I	wrpr	%r0, 0x0414, %pstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1150: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc447e001  ! 1151: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	.word 0x8bb18fea  ! 1152: FONES	fones	%f5
	.word 0xca7fe001  ! 1153: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x9f802001  ! 1154: SIR	sir	0x0001
	.word 0xa3a589c5  ! 1155: FDIVd	fdivd	%f22, %f36, %f48
	.word 0x89500000  ! 1156: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x98498008  ! 1157: MULX_R	mulx 	%r6, %r8, %r12
DS_66:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1158: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1159: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1480000  ! 1160: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95500000  ! 1162: RDPR_TPC	rdpr	%tpc, %r10
	.word 0xd41fc000  ! 1163: LDD_R	ldd	[%r31 + %r0], %r10
	.word 0x26800001  ! 1164: BL	bl,a	<label_0x1>
	.word 0x2a800001  ! 1165: BCS	bcs,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87802088  ! 1167: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd48fe020  ! 1168: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0x93902007  ! 1169: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x879023c8  ! 1170: WRPR_TT_I	wrpr	%r0, 0x03c8, %tt
	.word 0x24800001  ! 1171: BLE	ble,a	<label_0x1>
change_to_randtl_67:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1172: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1173: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x89504000  ! 1174: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x91d02030  ! 1175: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902000  ! 1176: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902487  ! 1177: WRPR_PSTATE_I	wrpr	%r0, 0x0487, %pstate
change_to_randtl_68:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1178: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa3540000  ! 1179: RDPR_GL	rdpr	%-, %r17
	.word 0x83d02033  ! 1180: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x34700001  ! 1181: BPG	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe207e001  ! 1183: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x81982203  ! 1184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0203, %hpstate
	.word 0x8d902c41  ! 1185: WRPR_PSTATE_I	wrpr	%r0, 0x0c41, %pstate
	.word 0x2a700001  ! 1186: BPCS	<illegal instruction>
	.word 0x81982b1e  ! 1187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1e, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
change_to_randtl_69:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1189: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x91d02030  ! 1190: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x91d02030  ! 1191: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8f902002  ! 1189: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982a1b  ! 1192: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1b, %hpstate
DS_70:
	.word 0x20800001  ! 1194: BN	bn,a	<label_0x1>
	pdist %f12, %f28, %f10
	.word 0xafb0c303  ! 1193: ALLIGNADDRESS	alignaddr	%r3, %r3, %r23
	.word 0x879020ca  ! 1194: WRPR_TT_I	wrpr	%r0, 0x00ca, %tt
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8790225d  ! 1196: WRPR_TT_I	wrpr	%r0, 0x025d, %tt
	.word 0xee7fe001  ! 1197: SWAP_I	swap	%r23, [%r31 + 0x0001]
	.word 0x93902007  ! 1198: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xad514000  ! 1199: RDPR_TBA	rdpr	%tba, %r22
	.word 0x83d02033  ! 1200: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xec8fe020  ! 1201: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r22
	.word 0x91d02033  ! 1202: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902007  ! 1203: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x91d02033  ! 1204: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x879023d4  ! 1205: WRPR_TT_I	wrpr	%r0, 0x03d4, %tt
	.word 0x879023f9  ! 1206: WRPR_TT_I	wrpr	%r0, 0x03f9, %tt
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1207: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8db34fea  ! 1208: FONES	fones	%f6
	.word 0xb06d6001  ! 1209: UDIVX_I	udivx 	%r21, 0x0001, %r24
	.word 0xa1902003  ! 1210: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x91d02033  ! 1211: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xf0d00e60  ! 1212: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r24
	.word 0xf08008a0  ! 1213: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0xf08008a0  ! 1214: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x88d14002  ! 1215: UMULcc_R	umulcc 	%r5, %r2, %r4
	.word 0xa1902003  ! 1216: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1217: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc87fe001  ! 1218: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0x93902006  ! 1219: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa190200f  ! 1220: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x9f802001  ! 1221: SIR	sir	0x0001
	.word 0xc88008a0  ! 1222: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
DS_71:
	.word 0x20800001  ! 1224: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1223: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02030  ! 1224: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902004  ! 1225: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87902341  ! 1226: WRPR_TT_I	wrpr	%r0, 0x0341, %tt
	.word 0x91692001  ! 1227: SDIVX_I	sdivx	%r4, 0x0001, %r8
	.word 0x80fca001  ! 1228: SDIVcc_I	sdivcc 	%r18, 0x0001, %r0
	.word 0x87902387  ! 1229: WRPR_TT_I	wrpr	%r0, 0x0387, %tt
	.word 0x81982d09  ! 1230: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d09, %hpstate
	.word 0xb3a00578  ! 1231: FSQRTq	fsqrt	
	.word 0xa1902007  ! 1232: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x81982589  ! 1233: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0589, %hpstate
	.word 0xa1902004  ! 1234: WRPR_GL_I	wrpr	%r0, 0x0004, %-
DS_72:
	.word 0x20800001  ! 1236: BN	bn,a	<label_0x1>
	.word 0xcd31e001  ! 1236: STQF_I	-	%f6, [0x0001, %r7]
	normalw
	.word 0x85458000  ! 1235: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x92812001  ! 1236: ADDcc_I	addcc 	%r4, 0x0001, %r9
	.word 0x8d902ccd  ! 1237: WRPR_PSTATE_I	wrpr	%r0, 0x0ccd, %pstate
	.word 0x87902148  ! 1238: WRPR_TT_I	wrpr	%r0, 0x0148, %tt
	.word 0x879022ed  ! 1239: WRPR_TT_I	wrpr	%r0, 0x02ed, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02033  ! 1241: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902003  ! 1242: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982fcc  ! 1243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcc, %hpstate
	.word 0x8d90264e  ! 1244: WRPR_PSTATE_I	wrpr	%r0, 0x064e, %pstate
	.word 0xd277e001  ! 1245: STX_I	stx	%r9, [%r31 + 0x0001]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93902007  ! 1247: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1248: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd24fc000  ! 1249: LDSB_R	ldsb	[%r31 + %r0], %r9
	.word 0x88498018  ! 1250: MULX_R	mulx 	%r6, %r24, %r4
	.word 0x93494000  ! 1251: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0xa1902006  ! 1252: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd2ffc038  ! 1253: SWAPA_R	swapa	%r9, [%r31 + %r24] 0x01
	.word 0xd2d80e40  ! 1254: LDXA_R	ldxa	[%r0, %r0] 0x72, %r9
	.word 0x8d902edb  ! 1255: WRPR_PSTATE_I	wrpr	%r0, 0x0edb, %pstate
	.word 0xd3e7c038  ! 1256: CASA_I	casa	[%r31] 0x 1, %r24, %r9
	.word 0x3a700001  ! 1257: BPCC	<illegal instruction>
	.word 0xa1902006  ! 1258: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x82da4007  ! 1259: SMULcc_R	smulcc 	%r9, %r7, %r1
	.word 0x91d02033  ! 1260: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902c5a  ! 1261: WRPR_PSTATE_I	wrpr	%r0, 0x0c5a, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
change_to_randtl_73:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1263: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xc2800b20  ! 1264: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r1
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1265: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8f902002  ! 1189: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982a98  ! 1266: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a98, %hpstate
	.word 0xa2d00007  ! 1267: UMULcc_R	umulcc 	%r0, %r7, %r17
	.word 0xb66c6001  ! 1268: UDIVX_I	udivx 	%r17, 0x0001, %r27
	.word 0x8d802004  ! 1269: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xf6800aa0  ! 1270: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r27
	.word 0x8d902010  ! 1271: WRPR_PSTATE_I	wrpr	%r0, 0x0010, %pstate
	.word 0xa1902006  ! 1272: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902005  ! 1273: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa96d8008  ! 1274: SDIVX_R	sdivx	%r22, %r8, %r20
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1275: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 1276: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87902193  ! 1277: WRPR_TT_I	wrpr	%r0, 0x0193, %tt
change_to_tl1_74:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1279: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879020e8  ! 1280: WRPR_TT_I	wrpr	%r0, 0x00e8, %tt
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1281: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1282: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa7480000  ! 1283: RDHPR_HPSTATE	rdhpr	%hpstate, %r19
	.word 0x8d90201c  ! 1284: WRPR_PSTATE_I	wrpr	%r0, 0x001c, %pstate
	.word 0x8790216a  ! 1285: WRPR_TT_I	wrpr	%r0, 0x016a, %tt
	.word 0x879022c2  ! 1286: WRPR_TT_I	wrpr	%r0, 0x02c2, %tt
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1287: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 1288: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa190200a  ! 1289: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93902005  ! 1290: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93d02034  ! 1292: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x81982d8b  ! 1293: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8b, %hpstate
	.word 0x81982e50  ! 1294: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e50, %hpstate
	.word 0x8d902a1c  ! 1295: WRPR_PSTATE_I	wrpr	%r0, 0x0a1c, %pstate
	.word 0x91d02033  ! 1296: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x879020e7  ! 1297: WRPR_TT_I	wrpr	%r0, 0x00e7, %tt
	.word 0x82fc0015  ! 1298: SDIVcc_R	sdivcc 	%r16, %r21, %r1
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91494000  ! 1300: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0xa1902004  ! 1301: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982441  ! 1303: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0441, %hpstate
	.word 0x8d902004  ! 1304: WRPR_PSTATE_I	wrpr	%r0, 0x0004, %pstate
	.word 0x8198225d  ! 1305: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025d, %hpstate
	.word 0xd03fe001  ! 1306: STD_I	std	%r8, [%r31 + 0x0001]
	.word 0x93902001  ! 1307: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1308: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_75:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902005  ! 1310: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd08008a0  ! 1311: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xa190200a  ! 1312: WRPR_GL_I	wrpr	%r0, 0x000a, %-
change_to_randtl_76:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1313: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982ec8  ! 1314: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec8, %hpstate
	.word 0x93902001  ! 1315: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 1317: SIR	sir	0x0001
	.word 0xd137e001  ! 1318: STQF_I	-	%f8, [0x0001, %r31]
	.word 0xd0ffc035  ! 1319: SWAPA_R	swapa	%r8, [%r31 + %r21] 0x01
	.word 0x91d02032  ! 1320: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8f6ce001  ! 1321: SDIVX_I	sdivx	%r19, 0x0001, %r7
	.word 0x32800001  ! 1322: BNE	bne,a	<label_0x1>
	.word 0xa3698005  ! 1323: SDIVX_R	sdivx	%r6, %r5, %r17
	.word 0x93902002  ! 1324: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa190200e  ! 1325: WRPR_GL_I	wrpr	%r0, 0x000e, %-
change_to_randtl_77:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1326: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x81982380  ! 1327: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0380, %hpstate
	.word 0x91d02034  ! 1328: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87902334  ! 1329: WRPR_TT_I	wrpr	%r0, 0x0334, %tt
	.word 0xada10d2d  ! 1330: FsMULd	fsmuld	%f4, %f44, %f22
	.word 0x91480000  ! 1331: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x99902005  ! 1332: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x93902004  ! 1333: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_randtl_78:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1334: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8790222f  ! 1335: WRPR_TT_I	wrpr	%r0, 0x022f, %tt
	.word 0xb350c000  ! 1336: RDPR_TT	rdpr	%tt, %r25
	.word 0xa190200b  ! 1337: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d902a90  ! 1338: WRPR_PSTATE_I	wrpr	%r0, 0x0a90, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1339: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982e18  ! 1340: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e18, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1341: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83480000  ! 1342: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0xc29004a0  ! 1343: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	.word 0xa150c000  ! 1344: RDPR_TT	rdpr	%tt, %r16
	.word 0x98c46001  ! 1345: ADDCcc_I	addccc 	%r17, 0x0001, %r12
	.word 0x93902006  ! 1346: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x806a4007  ! 1347: UDIVX_R	udivx 	%r9, %r7, %r0
change_to_tl1_79:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902000  ! 1349: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902000  ! 1350: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x28700001  ! 1351: BPLEU	<illegal instruction>
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1352: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802089  ! 1354: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982adf  ! 1355: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adf, %hpstate
	.word 0xc0ffc027  ! 1356: SWAPA_R	swapa	%r0, [%r31 + %r7] 0x01
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1357: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83d02034  ! 1358: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x36700001  ! 1359: BPGE	<illegal instruction>
	.word 0x85540000  ! 1360: RDPR_GL	rdpr	%-, %r2
	.word 0xc5e7c027  ! 1361: CASA_I	casa	[%r31] 0x 1, %r7, %r2
	.word 0x84c1a001  ! 1362: ADDCcc_I	addccc 	%r6, 0x0001, %r2
	.word 0x93902002  ! 1363: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_randtl_80:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1364: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc48008a0  ! 1365: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1366: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x83a209f6  ! 1367: FDIVq	dis not found

	.word 0x8d902cd0  ! 1368: WRPR_PSTATE_I	wrpr	%r0, 0x0cd0, %pstate
	.word 0xc28008a0  ! 1369: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x81982cd5  ! 1370: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd5, %hpstate
	.word 0x9f802001  ! 1371: SIR	sir	0x0001
	.word 0xab508000  ! 1372: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x2c700001  ! 1373: BPNEG	<illegal instruction>
	.word 0x95b08fe5  ! 1374: FONES	fones	%f10
	.word 0x81982e44  ! 1375: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e44, %hpstate
	.word 0xd48fe030  ! 1376: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0xa2a8801a  ! 1377: ANDNcc_R	andncc 	%r2, %r26, %r17
	.word 0x99902004  ! 1378: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xb4f9e001  ! 1379: SDIVcc_I	sdivcc 	%r7, 0x0001, %r26
	.word 0x879021fd  ! 1380: WRPR_TT_I	wrpr	%r0, 0x01fd, %tt
	.word 0x87902248  ! 1381: WRPR_TT_I	wrpr	%r0, 0x0248, %tt
	.word 0xf4900e80  ! 1382: LDUHA_R	lduha	[%r0, %r0] 0x74, %r26
	.word 0xf49004a0  ! 1383: LDUHA_R	lduha	[%r0, %r0] 0x25, %r26
DS_81:
	.word 0x20800001  ! 1385: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1384: SAVE_R	save	%r31, %r0, %r31
DS_82:
	.word 0x22800001  ! 1386: BE	be,a	<label_0x1>
	.word 0xc535400b  ! 1386: STQF_R	-	%f2, [%r11, %r21]
	normalw
	.word 0x8b458000  ! 1385: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xa190200c  ! 1386: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1388: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902161  ! 1389: WRPR_TT_I	wrpr	%r0, 0x0161, %tt
	.word 0xaedd4018  ! 1390: SMULcc_R	smulcc 	%r21, %r24, %r23
	.word 0x81982585  ! 1391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0585, %hpstate
change_to_tl1_83:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_84:
	.word 0x22800001  ! 1394: BE	be,a	<label_0x1>
	allclean
	.word 0xa7b20309  ! 1393: ALLIGNADDRESS	alignaddr	%r8, %r9, %r19
	.word 0xa1902003  ! 1394: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8790233f  ! 1395: WRPR_TT_I	wrpr	%r0, 0x033f, %tt
	.word 0x87802004  ! 1396: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x83d02031  ! 1397: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xa1902001  ! 1398: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8d902694  ! 1399: WRPR_PSTATE_I	wrpr	%r0, 0x0694, %pstate
	.word 0xe6c004a0  ! 1400: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
	.word 0x8d902ac4  ! 1401: WRPR_PSTATE_I	wrpr	%r0, 0x0ac4, %pstate
	.word 0xe6ffc029  ! 1402: SWAPA_R	swapa	%r19, [%r31 + %r9] 0x01
	.word 0xa1902003  ! 1403: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x99a409cb  ! 1404: FDIVd	fdivd	%f16, %f42, %f12
	.word 0x81a000cd  ! 1405: FNEGd	fnegd	%f44, %f0
	.word 0x8198209f  ! 1406: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009f, %hpstate
	.word 0x3c700001  ! 1407: BPPOS	<illegal instruction>
	.word 0xc13fc00d  ! 1408: STDF_R	std	%f0, [%r13, %r31]
	.word 0x879021d1  ! 1409: WRPR_TT_I	wrpr	%r0, 0x01d1, %tt
	.word 0x8d802000  ! 1410: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879021b9  ! 1411: WRPR_TT_I	wrpr	%r0, 0x01b9, %tt
	.word 0x8b500000  ! 1412: RDPR_TPC	rdpr	%tpc, %r5
	.word 0xca7fe001  ! 1413: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x85500000  ! 1414: RDPR_TPC	rdpr	%tpc, %r2
	.word 0x879023ae  ! 1415: WRPR_TT_I	wrpr	%r0, 0x03ae, %tt
	.word 0xc4ffc02d  ! 1416: SWAPA_R	swapa	%r2, [%r31 + %r13] 0x01
	.word 0xa1902008  ! 1417: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1418: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_85:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1419: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1420: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa3508000  ! 1421: RDPR_TSTATE	rdpr	%tstate, %r17
change_to_randtl_86:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1422: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x9f802001  ! 1423: SIR	sir	0x0001
	.word 0x93902004  ! 1424: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9f802001  ! 1425: SIR	sir	0x0001
	.word 0x89480000  ! 1426: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x8d9022d4  ! 1427: WRPR_PSTATE_I	wrpr	%r0, 0x02d4, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x86a88018  ! 1429: ANDNcc_R	andncc 	%r2, %r24, %r3
	.word 0xc637c018  ! 1430: STH_R	sth	%r3, [%r31 + %r24]
	.word 0xb1494000  ! 1431: RDHPR_HTBA	rdhpr	%htba, %r24
	.word 0xf1e7c038  ! 1432: CASA_I	casa	[%r31] 0x 1, %r24, %r24
	.word 0x8198239d  ! 1433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x039d, %hpstate
	.word 0x8d902a11  ! 1434: WRPR_PSTATE_I	wrpr	%r0, 0x0a11, %pstate
	.word 0x91d02032  ! 1435: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81982c52  ! 1436: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c52, %hpstate
	.word 0x91d02031  ! 1437: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d902e1a  ! 1438: WRPR_PSTATE_I	wrpr	%r0, 0x0e1a, %pstate
	.word 0x8750c000  ! 1439: RDPR_TT	rdpr	%tt, %r3
	.word 0x87902389  ! 1440: WRPR_TT_I	wrpr	%r0, 0x0389, %tt
	.word 0xc6800ba0  ! 1441: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r3
	.word 0xa9a20dca  ! 1442: FdMULq	fdmulq	
	.word 0x93902002  ! 1443: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d802000  ! 1444: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902007  ! 1445: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x97a00569  ! 1446: FSQRTq	fsqrt	
	.word 0xd64fe001  ! 1447: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0x8d902a15  ! 1448: WRPR_PSTATE_I	wrpr	%r0, 0x0a15, %pstate
	.word 0x8790203e  ! 1449: WRPR_TT_I	wrpr	%r0, 0x003e, %tt
	.word 0xa190200e  ! 1450: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x93902003  ! 1451: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02032  ! 1452: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d802004  ! 1453: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x83d02034  ! 1454: Tcc_I	te	icc_or_xcc, %r0 + 52
DS_87:
	.word 0x22800001  ! 1456: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1456: BG	bg,a	<label_0x1>
	.word 0xd7120013  ! 1456: LDQF_R	-	[%r8, %r19], %f11
	.word 0x9ba24820  ! 1455: FADDs	fadds	%f9, %f0, %f13
	.word 0x8d802004  ! 1456: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8790236c  ! 1457: WRPR_TT_I	wrpr	%r0, 0x036c, %tt
	.word 0x91d02033  ! 1458: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_HPRIV	! macro
DS_88:
	.word 0x32800001  ! 1461: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xc9148000  ! 1461: LDQF_R	-	[%r18, %r0], %f4
	.word 0xa3a14821  ! 1460: FADDs	fadds	%f5, %f1, %f17
DS_89:
	.word 0x34800001  ! 1462: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 1462: BNE	bne,a	<label_0x1>
	.word 0xd110c004  ! 1462: LDQF_R	-	[%r3, %r4], %f8
	.word 0x83a1882b  ! 1461: FADDs	fadds	%f6, %f11, %f1
	.word 0x93902006  ! 1462: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f802001  ! 1463: SIR	sir	0x0001
	.word 0x8d902e96  ! 1464: WRPR_PSTATE_I	wrpr	%r0, 0x0e96, %pstate
	.word 0x8d902a1c  ! 1465: WRPR_PSTATE_I	wrpr	%r0, 0x0a1c, %pstate
	.word 0xc2880e40  ! 1466: LDUBA_R	lduba	[%r0, %r0] 0x72, %r1
	.word 0x93d02033  ! 1467: Tcc_I	tne	icc_or_xcc, %r0 + 51
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1468: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 1469: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802088  ! 1470: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d902e8a  ! 1471: WRPR_PSTATE_I	wrpr	%r0, 0x0e8a, %pstate
	.word 0x81982e98  ! 1472: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e98, %hpstate
	.word 0xc27fe001  ! 1473: SWAP_I	swap	%r1, [%r31 + 0x0001]
	.word 0xc247e001  ! 1474: LDSW_I	ldsw	[%r31 + 0x0001], %r1
	.word 0x81982787  ! 1475: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0787, %hpstate
	.word 0x8d902a1a  ! 1476: WRPR_PSTATE_I	wrpr	%r0, 0x0a1a, %pstate
	.word 0x81982805  ! 1477: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0805, %hpstate
	.word 0x8198221c  ! 1478: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021c, %hpstate
	.word 0x2e800001  ! 1479: BVS	bvs,a	<label_0x1>
	.word 0x91d02032  ! 1480: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902004  ! 1481: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x996a001b  ! 1482: SDIVX_R	sdivx	%r8, %r27, %r12
	.word 0x8790238c  ! 1483: WRPR_TT_I	wrpr	%r0, 0x038c, %tt
	.word 0x8198260e  ! 1484: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060e, %hpstate
DS_90:
	.word 0x32800001  ! 1486: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1485: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902008  ! 1486: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02033  ! 1488: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_randtl_91:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1489: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
DS_92:
	.word 0x34800001  ! 1491: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1490: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x86862001  ! 1491: ADDcc_I	addcc 	%r24, 0x0001, %r3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982c5e  ! 1493: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5e, %hpstate
	.word 0x81982b95  ! 1494: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b95, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1495: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982997  ! 1496: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0997, %hpstate
	.word 0x8d802000  ! 1497: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200f  ! 1498: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x9b504000  ! 1499: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x8b50c000  ! 1500: RDPR_TT	rdpr	%tt, %r5
	.word 0x8ea8400b  ! 1501: ANDNcc_R	andncc 	%r1, %r11, %r7
	.word 0x879021fc  ! 1502: WRPR_TT_I	wrpr	%r0, 0x01fc, %tt
	.word 0x93902003  ! 1503: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902002  ! 1504: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x879023a2  ! 1505: WRPR_TT_I	wrpr	%r0, 0x03a2, %tt
	.word 0x91d02033  ! 1506: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1507: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1508: SIR	sir	0x0001
	.word 0x93902000  ! 1509: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902000  ! 1510: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902001  ! 1511: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f802001  ! 1513: SIR	sir	0x0001
	.word 0x8f902002  ! 1189: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x819822c1  ! 1514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c1, %hpstate
	.word 0x81982a49  ! 1515: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a49, %hpstate
	.word 0x8d802004  ! 1516: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xaba189b0  ! 1517: FDIVs	fdivs	%f6, %f16, %f21
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1518: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902001  ! 1519: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	ta	T_CHANGE_PRIV	! macro
	.word 0xad540000  ! 1521: RDPR_GL	rdpr	%-, %r22
	.word 0xa1902006  ! 1522: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902007  ! 1523: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87802080  ! 1524: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xec8008a0  ! 1525: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90260a  ! 1527: WRPR_PSTATE_I	wrpr	%r0, 0x060a, %pstate
	.word 0xed27c010  ! 1528: STF_R	st	%f22, [%r16, %r31]
	.word 0x8d802000  ! 1529: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1530: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb3a20d28  ! 1531: FsMULd	fsmuld	%f8, %f8, %f56
	.word 0x87802014  ! 1532: WRASI_I	wr	%r0, 0x0014, %asi
	ta	T_CHANGE_NONPRIV	! macro
DS_93:
	.word 0x34800001  ! 1535: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1534: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xb1480000  ! 1535: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x81982c83  ! 1536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c83, %hpstate
	.word 0x8d802000  ! 1537: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02032  ! 1538: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902e44  ! 1539: WRPR_PSTATE_I	wrpr	%r0, 0x0e44, %pstate
	.word 0x93902000  ! 1540: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879022c5  ! 1541: WRPR_TT_I	wrpr	%r0, 0x02c5, %tt
	.word 0xad702001  ! 1542: POPC_I	popc	0x0001, %r22
	.word 0xec1fe001  ! 1543: LDD_I	ldd	[%r31 + 0x0001], %r22
	.word 0xecc00e60  ! 1544: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r22
	.word 0x9f802001  ! 1545: SIR	sir	0x0001
	.word 0x93902006  ! 1546: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d494000  ! 1547: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0x9f802001  ! 1548: SIR	sir	0x0001
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902ed7  ! 1550: WRPR_PSTATE_I	wrpr	%r0, 0x0ed7, %pstate
	.word 0xad702001  ! 1551: POPC_I	popc	0x0001, %r22
	.word 0x879023bf  ! 1552: WRPR_TT_I	wrpr	%r0, 0x03bf, %tt
	.word 0x87902053  ! 1553: WRPR_TT_I	wrpr	%r0, 0x0053, %tt
	.word 0x8d90205a  ! 1554: WRPR_PSTATE_I	wrpr	%r0, 0x005a, %pstate
	.word 0xa1902006  ! 1555: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8198260e  ! 1556: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060e, %hpstate
	.word 0xec8008a0  ! 1557: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1558: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb7500000  ! 1559: RDPR_TPC	rdpr	%tpc, %r27
	.word 0x93902001  ! 1560: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_94:
	.word 0x22800001  ! 1562: BE	be,a	<label_0x1>
	.word 0xc5304018  ! 1562: STQF_R	-	%f2, [%r24, %r1]
	normalw
	.word 0x9b458000  ! 1561: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x879021c3  ! 1562: WRPR_TT_I	wrpr	%r0, 0x01c3, %tt
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1563: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xdb17c000  ! 1564: LDQF_R	-	[%r31, %r0], %f13
	.word 0xda8008a0  ! 1565: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1566: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xaeaa4007  ! 1567: ANDNcc_R	andncc 	%r9, %r7, %r23
	.word 0x8790204d  ! 1568: WRPR_TT_I	wrpr	%r0, 0x004d, %tt
	.word 0x91d02031  ! 1569: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d902493  ! 1570: WRPR_PSTATE_I	wrpr	%r0, 0x0493, %pstate
	.word 0xa36c4005  ! 1571: SDIVX_R	sdivx	%r17, %r5, %r17
	.word 0x819829c8  ! 1572: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c8, %hpstate
	.word 0xe28008a0  ! 1573: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x8d902485  ! 1574: WRPR_PSTATE_I	wrpr	%r0, 0x0485, %pstate
	.word 0xa1902006  ! 1575: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8790210a  ! 1576: WRPR_TT_I	wrpr	%r0, 0x010a, %tt
change_to_randtl_95:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1577: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x91d02030  ! 1578: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa190200b  ! 1579: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d9028c0  ! 1580: WRPR_PSTATE_I	wrpr	%r0, 0x08c0, %pstate
	.word 0x8d902882  ! 1581: WRPR_PSTATE_I	wrpr	%r0, 0x0882, %pstate
	.word 0x83d02033  ! 1582: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xe29004a0  ! 1583: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0xe2ffc025  ! 1584: SWAPA_R	swapa	%r17, [%r31 + %r5] 0x01
	.word 0x83d02034  ! 1585: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x99902005  ! 1586: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1587: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 1588: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xe28008a0  ! 1589: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe21fe001  ! 1590: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0x93902007  ! 1591: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81a01a60  ! 1592: FqTOi	fqtoi	
	.word 0x91d02030  ! 1593: Tcc_I	ta	icc_or_xcc, %r0 + 48
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1594: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x96c2e001  ! 1595: ADDCcc_I	addccc 	%r11, 0x0001, %r11
	.word 0x8d902ac2  ! 1596: WRPR_PSTATE_I	wrpr	%r0, 0x0ac2, %pstate
	.word 0x93902001  ! 1597: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902000  ! 1598: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8f504000  ! 1599: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x819820de  ! 1600: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00de, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xce800c60  ! 1602: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r7
	.word 0x8ec42001  ! 1603: ADDCcc_I	addccc 	%r16, 0x0001, %r7
DS_96:
	.word 0x32800001  ! 1605: BNE	bne,a	<label_0x1>
	.word 0xf131c007  ! 1605: STQF_R	-	%f24, [%r7, %r7]
	normalw
	.word 0x93458000  ! 1604: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xd28008a0  ! 1605: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xb2dd800c  ! 1606: SMULcc_R	smulcc 	%r22, %r12, %r25
	.word 0xa1902005  ! 1607: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xf3e7c02c  ! 1608: CASA_I	casa	[%r31] 0x 1, %r12, %r25
	.word 0xf277e001  ! 1609: STX_I	stx	%r25, [%r31 + 0x0001]
	.word 0x8d802004  ! 1610: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9f802001  ! 1611: SIR	sir	0x0001
	.word 0xf227e001  ! 1612: STW_I	stw	%r25, [%r31 + 0x0001]
	.word 0x87902370  ! 1613: WRPR_TT_I	wrpr	%r0, 0x0370, %tt
	.word 0x87902255  ! 1614: WRPR_TT_I	wrpr	%r0, 0x0255, %tt
	.word 0x8d802000  ! 1615: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802088  ! 1616: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8e6aa001  ! 1617: UDIVX_I	udivx 	%r10, 0x0001, %r7
change_to_tl1_97:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1619: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902189  ! 1620: WRPR_TT_I	wrpr	%r0, 0x0189, %tt
	.word 0xa1902005  ! 1621: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902411  ! 1622: WRPR_PSTATE_I	wrpr	%r0, 0x0411, %pstate
	.word 0x879022fe  ! 1623: WRPR_TT_I	wrpr	%r0, 0x02fe, %tt
	.word 0xce800ba0  ! 1624: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r7
	.word 0x819820d6  ! 1625: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d6, %hpstate
	.word 0x83d02035  ! 1626: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xce9004a0  ! 1627: LDUHA_R	lduha	[%r0, %r0] 0x25, %r7
	.word 0xce800c60  ! 1628: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r7
	.word 0xce900e80  ! 1629: LDUHA_R	lduha	[%r0, %r0] 0x74, %r7
	.word 0x8790205d  ! 1630: WRPR_TT_I	wrpr	%r0, 0x005d, %tt
	.word 0xce97e030  ! 1631: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r7
	.word 0xced004a0  ! 1632: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r7
	.word 0x83d02032  ! 1633: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x93902006  ! 1634: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1635: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 1636: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x83d02034  ! 1637: Tcc_I	te	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x22700001  ! 1639: BPE	<illegal instruction>
	.word 0xce97e020  ! 1640: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r7
	.word 0xb7690006  ! 1641: SDIVX_R	sdivx	%r4, %r6, %r27
	.word 0x81982001  ! 1642: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0001, %hpstate
	.word 0x8d90280f  ! 1643: WRPR_PSTATE_I	wrpr	%r0, 0x080f, %pstate
	.word 0xf6800c20  ! 1644: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r27
	ta	T_CHANGE_HPRIV	! macro
	.word 0xf6c804a0  ! 1646: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r27
	.word 0x81982b40  ! 1647: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b40, %hpstate
	.word 0x8c802001  ! 1648: ADDcc_I	addcc 	%r0, 0x0001, %r6
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1649: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02030  ! 1650: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xcc47e001  ! 1651: LDSW_I	ldsw	[%r31 + 0x0001], %r6
	.word 0x8d902297  ! 1652: WRPR_PSTATE_I	wrpr	%r0, 0x0297, %pstate
	.word 0xa0fcc007  ! 1653: SDIVcc_R	sdivcc 	%r19, %r7, %r16
	.word 0x2c700001  ! 1654: BPNEG	<illegal instruction>
	.word 0x91d02035  ! 1655: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d90201c  ! 1656: WRPR_PSTATE_I	wrpr	%r0, 0x001c, %pstate
	.word 0x85702001  ! 1657: POPC_I	popc	0x0001, %r2
DS_98:
	.word 0x32800001  ! 1659: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1658: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02030  ! 1659: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x87902198  ! 1660: WRPR_TT_I	wrpr	%r0, 0x0198, %tt
	.word 0x97540000  ! 1661: RDPR_GL	rdpr	%-, %r11
	.word 0x9b540000  ! 1662: RDPR_GL	rdpr	%-, %r13
	.word 0x81a01a67  ! 1663: FqTOi	fqtoi	
	.word 0xb1a549a3  ! 1664: FDIVs	fdivs	%f21, %f3, %f24
	.word 0xa1902008  ! 1665: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa190200b  ! 1666: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xa5514000  ! 1667: RDPR_TBA	rdpr	%tba, %r18
	ta	T_CHANGE_PRIV	! macro
	.word 0xe48008a0  ! 1669: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xb350c000  ! 1670: RDPR_TT	<illegal instruction>
	.word 0x8d902cc8  ! 1671: WRPR_PSTATE_I	wrpr	%r0, 0x0cc8, %pstate
	.word 0xa1902004  ! 1672: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x91d02034  ! 1673: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902006  ! 1674: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1675: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1676: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1677: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1679: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa46a2001  ! 1680: UDIVX_I	udivx 	%r8, 0x0001, %r18
	.word 0xe437c003  ! 1681: STH_R	sth	%r18, [%r31 + %r3]
	.word 0x8d902644  ! 1682: WRPR_PSTATE_I	wrpr	%r0, 0x0644, %pstate
	.word 0xe49fc020  ! 1683: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0x819821c4  ! 1684: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c4, %hpstate
	.word 0x91d02035  ! 1685: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0xb2d5a001  ! 1687: UMULcc_I	umulcc 	%r22, 0x0001, %r25
	.word 0xa1902007  ! 1688: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa190200a  ! 1689: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xa3494000  ! 1690: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0x36800001  ! 1691: BGE	bge,a	<label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1692: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91540000  ! 1693: RDPR_GL	rdpr	%-, %r8
	.word 0x91d02034  ! 1694: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd08008a0  ! 1695: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0x879020da  ! 1696: WRPR_TT_I	wrpr	%r0, 0x00da, %tt
	.word 0x93902004  ! 1697: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81982818  ! 1698: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0818, %hpstate
	.word 0x8b51c000  ! 1699: RDPR_TL	rdpr	%tl, %r5
	.word 0x87802014  ! 1700: WRASI_I	wr	%r0, 0x0014, %asi
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1701: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8cfa0004  ! 1702: SDIVcc_R	sdivcc 	%r8, %r4, %r6
	.word 0x8d802004  ! 1703: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1704: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 1705: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902800  ! 1706: WRPR_PSTATE_I	wrpr	%r0, 0x0800, %pstate
	.word 0x8198214b  ! 1707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014b, %hpstate
	.word 0x98f9e001  ! 1708: SDIVcc_I	sdivcc 	%r7, 0x0001, %r12
	.word 0xa1902002  ! 1709: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd8cfe020  ! 1710: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r12
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1711: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9ba289ad  ! 1712: FDIVs	fdivs	%f10, %f13, %f13
	.word 0x819825cf  ! 1713: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cf, %hpstate
	.word 0x38800001  ! 1714: BGU	bgu,a	<label_0x1>
	.word 0x8d902c11  ! 1715: WRPR_PSTATE_I	wrpr	%r0, 0x0c11, %pstate
	.word 0x87a149b3  ! 1716: FDIVs	fdivs	%f5, %f19, %f3
change_to_tl1_99:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d802004  ! 1718: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87902255  ! 1719: WRPR_TT_I	wrpr	%r0, 0x0255, %tt
DS_100:
	.word 0x32800001  ! 1721: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1720: SAVE_R	save	%r31, %r0, %r31
	.word 0x2a800001  ! 1721: BCS	bcs,a	<label_0x1>
	.word 0x8d902ac1  ! 1722: WRPR_PSTATE_I	wrpr	%r0, 0x0ac1, %pstate
	.word 0x8790230c  ! 1723: WRPR_TT_I	wrpr	%r0, 0x030c, %tt
	.word 0xc68fe030  ! 1724: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r3
DS_101:
	.word 0x22800001  ! 1726: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1726: BNE	bne,a	<label_0x1>
	.word 0xd7150008  ! 1726: LDQF_R	-	[%r20, %r8], %f11
	.word 0x95a2c82d  ! 1725: FADDs	fadds	%f11, %f13, %f10
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902001  ! 1727: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982e14  ! 1728: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e14, %hpstate
	.word 0x8790239a  ! 1729: WRPR_TT_I	wrpr	%r0, 0x039a, %tt
	.word 0x93d02033  ! 1730: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x93902002  ! 1731: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xb5b08fe2  ! 1732: FONES	fones	%f26
	.word 0x91d02033  ! 1733: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xb66a2001  ! 1734: UDIVX_I	udivx 	%r8, 0x0001, %r27
	.word 0x87802016  ! 1735: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x99902004  ! 1736: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa190200a  ! 1737: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1738: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1702001  ! 1739: POPC_I	popc	0x0001, %r16
	.word 0x91d02035  ! 1740: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982686  ! 1741: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0686, %hpstate
	.word 0x91d02031  ! 1742: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87902009  ! 1743: WRPR_TT_I	wrpr	%r0, 0x0009, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87902194  ! 1745: WRPR_TT_I	wrpr	%r0, 0x0194, %tt
DS_102:
	.word 0x34800001  ! 1747: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1746: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02032  ! 1747: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02030  ! 1748: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xb7514000  ! 1749: RDPR_TBA	rdpr	%tba, %r27
	.word 0x879022a4  ! 1750: WRPR_TT_I	wrpr	%r0, 0x02a4, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90265c  ! 1752: WRPR_PSTATE_I	wrpr	%r0, 0x065c, %pstate
	.word 0x95a0c9c3  ! 1753: FDIVd	fdivd	%f34, %f34, %f10
	.word 0x819828d6  ! 1754: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d6, %hpstate
	.word 0x93d02031  ! 1755: Tcc_I	tne	icc_or_xcc, %r0 + 49
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1756: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902023  ! 1757: WRPR_TT_I	wrpr	%r0, 0x0023, %tt
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1758: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 1759: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93d02030  ! 1760: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xa190200f  ! 1761: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd48804a0  ! 1762: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
change_to_randtl_103:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 1763: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x9f802001  ! 1764: SIR	sir	0x0001
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1765: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1766: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 1767: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902001  ! 1768: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x85a01a6c  ! 1769: FqTOi	fqtoi	
	.word 0x8d90240a  ! 1770: WRPR_PSTATE_I	wrpr	%r0, 0x040a, %pstate
DS_104:
	.word 0x22800001  ! 1772: BE	be,a	<label_0x1>
	illtrap
	.word 0xcf124016  ! 1772: LDQF_R	-	[%r9, %r22], %f7
	.word 0x89a10828  ! 1771: FADDs	fadds	%f4, %f8, %f4
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1772: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x976a0009  ! 1773: SDIVX_R	sdivx	%r8, %r9, %r11
	.word 0x99902001  ! 1774: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8f902002  ! 1189: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982b53  ! 1775: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b53, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1776: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02033  ! 1777: Tcc_I	te	icc_or_xcc, %r0 + 51
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1778: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1779: SIR	sir	0x0001
	.word 0xd67fe001  ! 1780: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x8d802004  ! 1781: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8790237d  ! 1782: WRPR_TT_I	wrpr	%r0, 0x037d, %tt
	.word 0xa9b10fe4  ! 1783: FONES	fones	%f20
	.word 0xe89fc020  ! 1784: LDDA_R	ldda	[%r31, %r0] 0x01, %r20
	.word 0x93902001  ! 1785: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_105:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1786: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x81982f45  ! 1787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f45, %hpstate
	.word 0x93a0054c  ! 1788: FSQRTd	fsqrt	
	.word 0x8f540000  ! 1789: RDPR_GL	rdpr	%-, %r7
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1790: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1791: SIR	sir	0x0001
	.word 0xab500000  ! 1792: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x91d02030  ! 1793: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8951c000  ! 1794: RDPR_TL	<illegal instruction>
change_to_tl1_106:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x99902000  ! 1796: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x88aec003  ! 1797: ANDNcc_R	andncc 	%r27, %r3, %r4
	.word 0xaa6de001  ! 1798: UDIVX_I	udivx 	%r23, 0x0001, %r21
	.word 0x81982c94  ! 1799: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c94, %hpstate
DS_107:
	.word 0x22800001  ! 1801: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1800: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1801: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 1802: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x81982f00  ! 1803: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f00, %hpstate
DS_108:
	.word 0x22800001  ! 1805: BE	be,a	<label_0x1>
	illtrap
	.word 0xd916c001  ! 1805: LDQF_R	-	[%r27, %r1], %f12
	.word 0x85a04827  ! 1804: FADDs	fadds	%f1, %f7, %f2
	.word 0xab494000  ! 1805: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0x81982a8f  ! 1806: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8f, %hpstate
	.word 0xebe7c027  ! 1807: CASA_I	casa	[%r31] 0x 1, %r7, %r21
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1808: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x93d02031  ! 1810: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x91d02032  ! 1811: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1812: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87a0057b  ! 1813: FSQRTq	fsqrt	
	.word 0xa1902000  ! 1814: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d50c000  ! 1815: RDPR_TT	rdpr	%tt, %r6
	.word 0x81480000  ! 1816: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0xc0dfe000  ! 1817: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r0
	.word 0x9ac0a001  ! 1818: ADDCcc_I	addccc 	%r2, 0x0001, %r13
	.word 0x9afea001  ! 1819: SDIVcc_I	sdivcc 	%r26, 0x0001, %r13
	.word 0x9169c00c  ! 1820: SDIVX_R	sdivx	%r7, %r12, %r8
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1821: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902168  ! 1822: WRPR_TT_I	wrpr	%r0, 0x0168, %tt
	.word 0x9f802001  ! 1823: SIR	sir	0x0001
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1824: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8198298a  ! 1825: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098a, %hpstate
	.word 0xa3702001  ! 1826: POPC_I	popc	0x0001, %r17
	.word 0x8b504000  ! 1827: RDPR_TNPC	rdpr	%tnpc, %r5
	.word 0x8d902e15  ! 1828: WRPR_PSTATE_I	wrpr	%r0, 0x0e15, %pstate
	.word 0x8f504000  ! 1829: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x95b18ffb  ! 1830: FONES	fones	%f10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2a800001  ! 1832: BCS	bcs,a	<label_0x1>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd527c01b  ! 1834: STF_R	st	%f10, [%r27, %r31]
	.word 0x9f802001  ! 1835: SIR	sir	0x0001
	.word 0x91d02035  ! 1836: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1837: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 1838: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902104  ! 1839: WRPR_TT_I	wrpr	%r0, 0x0104, %tt
	.word 0x81982b8a  ! 1840: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8a, %hpstate
	.word 0xd4d804a0  ! 1841: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x91d02032  ! 1842: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x879021e9  ! 1843: WRPR_TT_I	wrpr	%r0, 0x01e9, %tt
	.word 0x83d02035  ! 1844: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x81480000  ! 1845: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0x93902004  ! 1846: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xc08008a0  ! 1847: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x9af8400c  ! 1848: SDIVcc_R	sdivcc 	%r1, %r12, %r13
DS_109:
	.word 0x32800001  ! 1850: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1849: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9f802001  ! 1850: SIR	sir	0x0001
	.word 0xda1fc000  ! 1851: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0xda8fe000  ! 1852: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r13
	.word 0x24800001  ! 1853: BLE	ble,a	<label_0x1>
	.word 0x986e400b  ! 1854: UDIVX_R	udivx 	%r25, %r11, %r12
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1856: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x9b51c000  ! 1858: RDPR_TL	rdpr	%tl, %r13
	.word 0x8d90209d  ! 1859: WRPR_PSTATE_I	wrpr	%r0, 0x009d, %pstate
	.word 0xdad804a0  ! 1860: LDXA_R	ldxa	[%r0, %r0] 0x25, %r13
	.word 0x93902001  ! 1861: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x28800001  ! 1862: BLEU	bleu,a	<label_0x1>
	.word 0x91d02035  ! 1863: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x22800001  ! 1864: BE	be,a	<label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1865: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb06a2001  ! 1866: UDIVX_I	udivx 	%r8, 0x0001, %r24
	.word 0x81982ddf  ! 1867: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddf, %hpstate
	.word 0x81504000  ! 1868: RDPR_TNPC	rdpr	%tnpc, %r0
	.word 0xac49c00c  ! 1869: MULX_R	mulx 	%r7, %r12, %r22
	.word 0xeccfe030  ! 1870: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r22
	.word 0x93902007  ! 1871: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d90205a  ! 1872: WRPR_PSTATE_I	wrpr	%r0, 0x005a, %pstate
	.word 0x8486400d  ! 1873: ADDcc_R	addcc 	%r25, %r13, %r2
	.word 0x98808009  ! 1874: ADDcc_R	addcc 	%r2, %r9, %r12
	.word 0xa190200e  ! 1875: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1876: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8dfe010  ! 1877: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0xd8ffc029  ! 1878: SWAPA_R	swapa	%r12, [%r31 + %r9] 0x01
change_to_tl1_110:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902cd4  ! 1880: WRPR_PSTATE_I	wrpr	%r0, 0x0cd4, %pstate
	.word 0x93902007  ! 1881: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902001  ! 1882: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879023f1  ! 1884: WRPR_TT_I	wrpr	%r0, 0x03f1, %tt
	.word 0x93902004  ! 1885: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d9022d0  ! 1886: WRPR_PSTATE_I	wrpr	%r0, 0x02d0, %pstate
	.word 0x8c4e0012  ! 1887: MULX_R	mulx 	%r24, %r18, %r6
	.word 0x91d02031  ! 1888: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xcc880e80  ! 1889: LDUBA_R	lduba	[%r0, %r0] 0x74, %r6
	.word 0xa190200e  ! 1890: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x91d02031  ! 1891: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81982b10  ! 1892: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b10, %hpstate
	.word 0x93902006  ! 1893: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d802004  ! 1894: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1895: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790202c  ! 1896: WRPR_TT_I	wrpr	%r0, 0x002c, %tt
	.word 0xa1902000  ! 1897: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x93902006  ! 1898: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8482a001  ! 1899: ADDcc_I	addcc 	%r10, 0x0001, %r2
	.word 0xa190200b  ! 1900: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x9f802001  ! 1901: SIR	sir	0x0001
	.word 0xa190200c  ! 1902: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xc48fe000  ! 1903: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r2
	.word 0xb7a309ed  ! 1904: FDIVq	dis not found

	.word 0x8d902888  ! 1905: WRPR_PSTATE_I	wrpr	%r0, 0x0888, %pstate
	.word 0xa1902008  ! 1906: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93902001  ! 1907: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa950c000  ! 1908: RDPR_TT	rdpr	%tt, %r20
	.word 0x93902001  ! 1909: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x22800001  ! 1910: BE	be,a	<label_0x1>
	.word 0xa190200b  ! 1911: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d802004  ! 1912: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x97540000  ! 1913: RDPR_GL	rdpr	%-, %r11
	.word 0x8d802000  ! 1914: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200f  ! 1915: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x81982cca  ! 1916: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cca, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xafa20dc3  ! 1918: FdMULq	fdmulq	
	.word 0x91d02030  ! 1919: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x87902063  ! 1920: WRPR_TT_I	wrpr	%r0, 0x0063, %tt
	.word 0x87902144  ! 1921: WRPR_TT_I	wrpr	%r0, 0x0144, %tt
	.word 0x93902003  ! 1922: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xeec00e40  ! 1923: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r23
	.word 0x87902006  ! 1924: WRPR_TT_I	wrpr	%r0, 0x0006, %tt
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819821c0  ! 1926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c0, %hpstate
	.word 0x8d514000  ! 1927: RDPR_TBA	rdpr	%tba, %r6
	.word 0x93902000  ! 1928: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_111:
	.word 0x20800001  ! 1930: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1929: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982603  ! 1930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0603, %hpstate
	.word 0x81982385  ! 1931: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0385, %hpstate
DS_112:
	.word 0x32800001  ! 1933: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1932: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xccd804a0  ! 1933: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0x87902150  ! 1934: WRPR_TT_I	wrpr	%r0, 0x0150, %tt
	.word 0x91d02035  ! 1935: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_113:
	.word 0x34800001  ! 1937: BG	bg,a	<label_0x1>
	.word 0xcd318008  ! 1937: STQF_R	-	%f6, [%r8, %r6]
	normalw
	.word 0x99458000  ! 1936: RD_SOFTINT_REG	rd	%softint, %r12
	ta	T_CHANGE_PRIV	! macro
DS_114:
	.word 0x20800001  ! 1939: BN	bn,a	<label_0x1>
	illtrap
	.word 0xf7120004  ! 1939: LDQF_R	-	[%r8, %r4], %f27
	.word 0x83a18834  ! 1938: FADDs	fadds	%f6, %f20, %f1
DS_115:
	.word 0x32800001  ! 1940: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1940: BG	bg,a	<label_0x1>
	.word 0xc912c004  ! 1940: LDQF_R	-	[%r11, %r4], %f4
	.word 0x8fa2483b  ! 1939: FADDs	fadds	%f9, %f27, %f7
change_to_tl1_116:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x83514000  ! 1941: RDPR_TBA	rdpr	%tba, %r1
	.word 0x87902369  ! 1942: WRPR_TT_I	wrpr	%r0, 0x0369, %tt
	.word 0x81982804  ! 1943: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0804, %hpstate
	.word 0x87902340  ! 1944: WRPR_TT_I	wrpr	%r0, 0x0340, %tt
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1945: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982c91  ! 1946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c91, %hpstate
	.word 0x9350c000  ! 1947: RDPR_TT	rdpr	%tt, %r9
	.word 0x81982a4a  ! 1948: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4a, %hpstate
	.word 0xb64a8018  ! 1949: MULX_R	mulx 	%r10, %r24, %r27
	.word 0x81a60dc0  ! 1950: FdMULq	fdmulq	
	.word 0x93902007  ! 1951: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1952: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x80d1400c  ! 1953: UMULcc_R	umulcc 	%r5, %r12, %r0
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1954: Tcc_R	tne	icc_or_xcc, %r0 + %r30
change_to_tl1_117:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8198284f  ! 1956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084f, %hpstate
	.word 0x819820da  ! 1957: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00da, %hpstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1958: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93500000  ! 1959: RDPR_TPC	rdpr	%tpc, %r9
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1960: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02030  ! 1961: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xa1902001  ! 1962: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x91d02034  ! 1963: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x879021a7  ! 1964: WRPR_TT_I	wrpr	%r0, 0x01a7, %tt
	.word 0x93902003  ! 1965: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x9f802001  ! 1966: SIR	sir	0x0001
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1967: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_118:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x83d02030  ! 1969: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x9f802001  ! 1970: SIR	sir	0x0001
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd28008a0  ! 1972: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8fa249cd  ! 1973: FDIVd	fdivd	%f40, %f44, %f38
	.word 0x8d802004  ! 1974: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xb3480000  ! 1975: RDHPR_HPSTATE	rdhpr	%hpstate, %r25
	.word 0x986e0016  ! 1976: UDIVX_R	udivx 	%r24, %r22, %r12
	.word 0xa4a94002  ! 1977: ANDNcc_R	andncc 	%r5, %r2, %r18
	.word 0x8d802004  ! 1978: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x83d02032  ! 1979: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x879021ef  ! 1980: WRPR_TT_I	wrpr	%r0, 0x01ef, %tt
	.word 0xb751c000  ! 1981: RDPR_TL	rdpr	%tl, %r27
	.word 0x879023ce  ! 1982: WRPR_TT_I	wrpr	%r0, 0x03ce, %tt
	.word 0xf67fe001  ! 1983: SWAP_I	swap	%r27, [%r31 + 0x0001]
change_to_tl1_119:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa2fa8009  ! 1985: SDIVcc_R	sdivcc 	%r10, %r9, %r17
	.word 0x87a249b7  ! 1986: FDIVs	fdivs	%f9, %f23, %f3
	.word 0x97a34dc7  ! 1987: FdMULq	fdmulq	
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93902003  ! 1990: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x99902001  ! 1991: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xb6d34019  ! 1992: UMULcc_R	umulcc 	%r13, %r25, %r27
	.word 0x92f9c00d  ! 1993: SDIVcc_R	sdivcc 	%r7, %r13, %r9
	.word 0x8d902202  ! 1994: WRPR_PSTATE_I	wrpr	%r0, 0x0202, %pstate
	.word 0x84c5a001  ! 1995: ADDCcc_I	addccc 	%r22, 0x0001, %r2
	.word 0xc527e001  ! 1996: STF_I	st	%f2, [0x0001, %r31]
	.word 0x879023f3  ! 1997: WRPR_TT_I	wrpr	%r0, 0x03f3, %tt
	.word 0xa282a001  ! 1998: ADDcc_I	addcc 	%r10, 0x0001, %r17
	.word 0x81982ad8  ! 1999: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad8, %hpstate
	.word 0xe2c00e60  ! 2000: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r17
	.word 0x93902000  ! 2001: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982bdc  ! 2002: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdc, %hpstate
	.word 0x93902004  ! 2003: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x81982085  ! 2004: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0085, %hpstate
	.word 0xa190200b  ! 2005: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x93902000  ! 2006: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902005  ! 2007: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902004  ! 2008: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02030  ! 2009: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d902499  ! 2010: WRPR_PSTATE_I	wrpr	%r0, 0x0499, %pstate
	.word 0xe28008a0  ! 2011: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xa1902009  ! 2012: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x81982895  ! 2013: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0895, %hpstate
	.word 0xa3514000  ! 2014: RDPR_TBA	rdpr	%tba, %r17
	.word 0x87b50fe9  ! 2015: FONES	fones	%f3
change_to_randtl_120:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 2016: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa1902007  ! 2017: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xc68804a0  ! 2018: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0xc697e020  ! 2019: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902002  ! 2021: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93902005  ! 2023: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x83a149c8  ! 2024: FDIVd	fdivd	%f36, %f8, %f32
	.word 0x93d02033  ! 2025: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa7688007  ! 2026: SDIVX_R	sdivx	%r2, %r7, %r19
	.word 0xe607e001  ! 2027: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0x91d02031  ! 2028: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x92c4a001  ! 2029: ADDCcc_I	addccc 	%r18, 0x0001, %r9
	.word 0x86fa0014  ! 2030: SDIVcc_R	sdivcc 	%r8, %r20, %r3
	.word 0xaba589c6  ! 2031: FDIVd	fdivd	%f22, %f6, %f52
	.word 0xea8008a0  ! 2032: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0xa1902003  ! 2033: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8198269c  ! 2034: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069c, %hpstate
	.word 0x8b514000  ! 2035: RDPR_TBA	rdpr	%tba, %r5
	.word 0x97494000  ! 2036: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0x8198261a  ! 2037: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061a, %hpstate
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 2038: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200b  ! 2039: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d902c03  ! 2040: WRPR_PSTATE_I	wrpr	%r0, 0x0c03, %pstate
	.word 0x87902292  ! 2041: WRPR_TT_I	wrpr	%r0, 0x0292, %tt
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2042: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93902000  ! 2044: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xad494000  ! 2045: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0xa190200a  ! 2046: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87802004  ! 2047: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93902006  ! 2048: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xed37c006  ! 2049: STQF_R	-	%f22, [%r6, %r31]
	.word 0x8ba0c9a5  ! 2050: FDIVs	fdivs	%f3, %f5, %f5
	ta	T_CHANGE_HPRIV	! macro
	.word 0xca880e60  ! 2052: LDUBA_R	lduba	[%r0, %r0] 0x73, %r5
	.word 0x93902006  ! 2053: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8790223b  ! 2054: WRPR_TT_I	wrpr	%r0, 0x023b, %tt
	.word 0xcb3fe001  ! 2055: STDF_I	std	%f5, [0x0001, %r31]
	.word 0x93902002  ! 2056: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902000  ! 2057: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d802000  ! 2058: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x86fc2001  ! 2059: SDIVcc_I	sdivcc 	%r16, 0x0001, %r3
	.word 0x87802088  ! 2060: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902005  ! 2061: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x83d02031  ! 2062: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x879021f4  ! 2063: WRPR_TT_I	wrpr	%r0, 0x01f4, %tt
change_to_randtl_121:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 2064: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa9508000  ! 2065: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x93902006  ! 2066: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa190200b  ! 2067: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xe84fe001  ! 2068: LDSB_I	ldsb	[%r31 + 0x0001], %r20
	.word 0x87902132  ! 2069: WRPR_TT_I	wrpr	%r0, 0x0132, %tt
DS_122:
	.word 0x20800001  ! 2071: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 2070: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe8c004a0  ! 2071: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r20
	.word 0x879023cc  ! 2072: WRPR_TT_I	wrpr	%r0, 0x03cc, %tt
	.word 0x8790221e  ! 2073: WRPR_TT_I	wrpr	%r0, 0x021e, %tt
	.word 0x93902001  ! 2074: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe8d7e000  ! 2075: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r20
	.word 0x8951c000  ! 2076: RDPR_TL	rdpr	%tl, %r4
	.word 0xaa6b0005  ! 2077: UDIVX_R	udivx 	%r12, %r5, %r21
	.word 0x8198298e  ! 2078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098e, %hpstate
	.word 0x879022c0  ! 2079: WRPR_TT_I	wrpr	%r0, 0x02c0, %tt
	.word 0x91a0055a  ! 2080: FSQRTd	fsqrt	
	.word 0x8d802000  ! 2081: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2082: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819824dd  ! 2083: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04dd, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2084: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902696  ! 2085: WRPR_PSTATE_I	wrpr	%r0, 0x0696, %pstate
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 2086: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_123:
	.word 0x22800001  ! 2088: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 2087: RESTORE_R	restore	%r31, %r0, %r31
change_to_randtl_124:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 2088: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x93902004  ! 2089: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902342  ! 2090: WRPR_TT_I	wrpr	%r0, 0x0342, %tt
	.word 0xa1902008  ! 2091: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d902056  ! 2092: WRPR_PSTATE_I	wrpr	%r0, 0x0056, %pstate
	.word 0x91d02033  ! 2093: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87902174  ! 2094: WRPR_TT_I	wrpr	%r0, 0x0174, %tt
	.word 0xb0fc4007  ! 2095: SDIVcc_R	sdivcc 	%r17, %r7, %r24
	.word 0x8d9022de  ! 2096: WRPR_PSTATE_I	wrpr	%r0, 0x02de, %pstate
	.word 0x87902335  ! 2097: WRPR_TT_I	wrpr	%r0, 0x0335, %tt
	ta	T_CHANGE_NONHPRIV	! macro
DS_125:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 2099: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x91d02034  ! 2100: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa190200d  ! 2101: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8198238f  ! 2102: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038f, %hpstate
	.word 0x91d02034  ! 2103: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81982ad6  ! 2104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad6, %hpstate
	.word 0x8950c000  ! 2105: RDPR_TT	rdpr	%tt, %r4
	.word 0x8d902add  ! 2106: WRPR_PSTATE_I	wrpr	%r0, 0x0add, %pstate
	.word 0xc9e7c027  ! 2107: CASA_I	casa	[%r31] 0x 1, %r7, %r4
	.word 0x93902003  ! 2108: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
change_to_randtl_126:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 2109: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xa3a549fa  ! 2110: FDIVq	dis not found

	.word 0x8198269c  ! 2111: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069c, %hpstate
	.word 0x81982891  ! 2112: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0891, %hpstate
	.word 0x91d02034  ! 2113: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902004  ! 2114: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xb5508000  ! 2115: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x819822c2  ! 2116: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c2, %hpstate
	.word 0x86fee001  ! 2117: SDIVcc_I	sdivcc 	%r27, 0x0001, %r3
	.word 0x94d08005  ! 2118: UMULcc_R	umulcc 	%r2, %r5, %r10
	.word 0xd48008a0  ! 2119: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xa190200d  ! 2120: WRPR_GL_I	wrpr	%r0, 0x000d, %-
DS_127:
	.word 0x22800001  ! 2122: BE	be,a	<label_0x1>
	.word 0xd130a001  ! 2122: STQF_I	-	%f8, [0x0001, %r2]
	normalw
	.word 0x9b458000  ! 2121: RD_SOFTINT_REG	rd	%softint, %r13
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 2122: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 2123: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 2124: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93902000  ! 2125: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02031  ! 2126: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902004  ! 2127: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902396  ! 2128: WRPR_TT_I	wrpr	%r0, 0x0396, %tt
	.word 0x91d02035  ! 2129: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902c01  ! 2130: WRPR_PSTATE_I	wrpr	%r0, 0x0c01, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xda800aa0  ! 2132: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r13
	.word 0xa1902009  ! 2133: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2134: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 2135: BPOS	bpos,a	<label_0x1>
	.word 0x9f802001  ! 2136: SIR	sir	0x0001
	.word 0x9af86001  ! 2137: SDIVcc_I	sdivcc 	%r1, 0x0001, %r13
change_to_tl1_128:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902007  ! 2140: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02034  ! 2142: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_129:
	.word 0x22800001  ! 2144: BE	be,a	<label_0x1>
	.word 0x22800001  ! 2144: BE	be,a	<label_0x1>
	.word 0xd9104002  ! 2144: LDQF_R	-	[%r1, %r2], %f12
	.word 0x97a08826  ! 2143: FADDs	fadds	%f2, %f6, %f11
	.word 0x82ab0015  ! 2144: ANDNcc_R	andncc 	%r12, %r21, %r1
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2145: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 2146: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91494000  ! 2147: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x95a149c0  ! 2148: FDIVd	fdivd	%f36, %f0, %f10
	.word 0x93902005  ! 2149: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0xa4494002  ! 2151: MULX_R	mulx 	%r5, %r2, %r18
	.word 0x91d02035  ! 2152: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02035  ! 2153: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x97540000  ! 2154: RDPR_GL	rdpr	%-, %r11
	.word 0x8790216f  ! 2155: WRPR_TT_I	wrpr	%r0, 0x016f, %tt
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd6800c60  ! 2157: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
	.word 0x91d02035  ! 2158: Tcc_I	ta	icc_or_xcc, %r0 + 53
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 2159: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 2160: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x89540000  ! 2161: RDPR_GL	rdpr	%-, %r4
	.word 0xa1902002  ! 2162: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2163: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa84a4015  ! 2164: MULX_R	mulx 	%r9, %r21, %r20
	.word 0x879023dc  ! 2165: WRPR_TT_I	wrpr	%r0, 0x03dc, %tt
	.word 0x8d90280e  ! 2166: WRPR_PSTATE_I	wrpr	%r0, 0x080e, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2167: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 2168: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902a53  ! 2169: WRPR_PSTATE_I	wrpr	%r0, 0x0a53, %pstate
	.word 0xe89fe001  ! 2170: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r20
	.word 0xa1902000  ! 2171: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x81982156  ! 2172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0156, %hpstate
	.word 0x91d02034  ! 2173: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902005  ! 2174: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d9026d0  ! 2175: WRPR_PSTATE_I	wrpr	%r0, 0x06d0, %pstate
	.word 0xa1902000  ! 2176: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_130:
	.word 0x22800001  ! 2178: BE	be,a	<label_0x1>
	.word 0xdb32a001  ! 2178: STQF_I	-	%f13, [0x0001, %r10]
	normalw
	.word 0x93458000  ! 2177: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8d9022d6  ! 2178: WRPR_PSTATE_I	wrpr	%r0, 0x02d6, %pstate
	.word 0xb2c62001  ! 2179: ADDCcc_I	addccc 	%r24, 0x0001, %r25
	.word 0xb3504000  ! 2180: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x8d686001  ! 2181: SDIVX_I	sdivx	%r1, 0x0001, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83494000  ! 2183: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0x93902007  ! 2184: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc29fe001  ! 2185: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x3e800001  ! 2186: BVC	bvc,a	<label_0x1>
	.word 0xc21fc000  ! 2187: LDD_R	ldd	[%r31 + %r0], %r1
	.word 0x8d90284f  ! 2188: WRPR_PSTATE_I	wrpr	%r0, 0x084f, %pstate
	.word 0xa190200b  ! 2189: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x81982c44  ! 2190: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c44, %hpstate
	.word 0x93902007  ! 2191: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902000  ! 2192: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x95a000d1  ! 2193: FNEGd	fnegd	%f48, %f10
DS_131:
	.word 0x32800001  ! 2195: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 2194: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91a1cdc5  ! 2195: FdMULq	fdmulq	
	.word 0xd097e010  ! 2196: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	.word 0xd077e001  ! 2197: STX_I	stx	%r8, [%r31 + 0x0001]
	.word 0x82d08006  ! 2198: UMULcc_R	umulcc 	%r2, %r6, %r1
	.word 0x90de8007  ! 2199: SMULcc_R	smulcc 	%r26, %r7, %r8
	.word 0xa1902003  ! 2200: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd0c804a0  ! 2201: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0x87902226  ! 2202: WRPR_TT_I	wrpr	%r0, 0x0226, %tt
	.word 0xd057c000  ! 2203: LDSH_R	ldsh	[%r31 + %r0], %r8
	.word 0xa1902006  ! 2204: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa190200b  ! 2205: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd097e010  ! 2207: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r8
	.word 0x879022d0  ! 2208: WRPR_TT_I	wrpr	%r0, 0x02d0, %tt
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2209: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_132:
	.word 0x34800001  ! 2211: BG	bg,a	<label_0x1>
	illtrap
	.word 0xaba00557  ! 2211: FSQRTd	fsqrt	
	.word 0xa5a40824  ! 2210: FADDs	fadds	%f16, %f4, %f18
	.word 0xe4ffc024  ! 2211: SWAPA_R	swapa	%r18, [%r31 + %r4] 0x01
	.word 0xada289b2  ! 2212: FDIVs	fdivs	%f10, %f18, %f22
	.word 0x91a089cd  ! 2213: FDIVd	fdivd	%f2, %f44, %f8
	.word 0x819826da  ! 2214: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06da, %hpstate
	.word 0xa1902009  ! 2215: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d9026cc  ! 2216: WRPR_PSTATE_I	wrpr	%r0, 0x06cc, %pstate
	.word 0x99902001  ! 2217: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2219: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982fcb  ! 2220: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcb, %hpstate
	.word 0xaba00542  ! 2221: FSQRTd	fsqrt	
	.word 0xeb3fe001  ! 2222: STDF_I	std	%f21, [0x0001, %r31]
	.word 0x81982082  ! 2223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0082, %hpstate
	.word 0x93902006  ! 2224: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8198298e  ! 2225: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098e, %hpstate
	.word 0x8fb04fe7  ! 2226: FONES	fones	%f7
	.word 0x81982a5d  ! 2227: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5d, %hpstate
	.word 0x8790217c  ! 2228: WRPR_TT_I	wrpr	%r0, 0x017c, %tt
change_to_randtl_133:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 2229: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x93902004  ! 2230: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9081a001  ! 2231: ADDcc_I	addcc 	%r6, 0x0001, %r8
	.word 0x8d9026d1  ! 2232: WRPR_PSTATE_I	wrpr	%r0, 0x06d1, %pstate
	.word 0x83514000  ! 2233: RDPR_TBA	rdpr	%tba, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xb3a000c3  ! 2235: FNEGd	fnegd	%f34, %f56
	.word 0x89b18fec  ! 2236: FONES	fones	%f4
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2237: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90245b  ! 2238: WRPR_PSTATE_I	wrpr	%r0, 0x045b, %pstate
	.word 0x87802014  ! 2239: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d902013  ! 2240: WRPR_PSTATE_I	wrpr	%r0, 0x0013, %pstate
	.word 0x99902005  ! 2241: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x879023df  ! 2242: WRPR_TT_I	wrpr	%r0, 0x03df, %tt
	.word 0xc87fe001  ! 2243: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0xb5500000  ! 2244: RDPR_TPC	rdpr	%tpc, %r26
	.word 0x8d90284d  ! 2245: WRPR_PSTATE_I	wrpr	%r0, 0x084d, %pstate
change_to_randtl_134:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 2246: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x34700001  ! 2247: BPG	<illegal instruction>
	.word 0x8d902c8d  ! 2248: WRPR_PSTATE_I	wrpr	%r0, 0x0c8d, %pstate
DS_135:
	.word 0x34800001  ! 2250: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 2250: BNE	bne,a	<label_0x1>
	.word 0x97a0054d  ! 2250: FSQRTd	fsqrt	
	.word 0x8da5483a  ! 2249: FADDs	fadds	%f21, %f26, %f6
	.word 0xa1902003  ! 2250: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_136:
	.word 0x32800001  ! 2252: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 2251: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xcc800b00  ! 2252: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r6
	.word 0xa9508000  ! 2253: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x32800001  ! 2254: BNE	bne,a	<label_0x1>
	.word 0x9f802001  ! 2255: SIR	sir	0x0001
	.word 0x8d902a15  ! 2256: WRPR_PSTATE_I	wrpr	%r0, 0x0a15, %pstate
	.word 0x8f50c000  ! 2257: RDPR_TT	rdpr	%tt, %r7
	.word 0xce7fe001  ! 2258: SWAP_I	swap	%r7, [%r31 + 0x0001]
	.word 0x9f802001  ! 2259: SIR	sir	0x0001
	.word 0xce8008a0  ! 2260: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
DS_137:
	.word 0x34800001  ! 2262: BG	bg,a	<label_0x1>
	.word 0x22800001  ! 2262: BE	be,a	<label_0x1>
	.word 0xd1114001  ! 2262: LDQF_R	-	[%r5, %r1], %f8
	.word 0xada2082a  ! 2261: FADDs	fadds	%f8, %f10, %f22
	.word 0xa1902008  ! 2262: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d90249c  ! 2263: WRPR_PSTATE_I	wrpr	%r0, 0x049c, %pstate
	.word 0x9a6b4012  ! 2264: UDIVX_R	udivx 	%r13, %r18, %r13
	.word 0x83d02032  ! 2265: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xb26aa001  ! 2266: UDIVX_I	udivx 	%r10, 0x0001, %r25
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2267: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a98  ! 2268: WRPR_PSTATE_I	wrpr	%r0, 0x0a98, %pstate
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 2269: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 2270: SIR	sir	0x0001
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 2272: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93d02033  ! 2273: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x93902004  ! 2274: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xf2c804a0  ! 2275: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r25
	.word 0xf28fe000  ! 2276: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r25
	.word 0x9f802001  ! 2277: SIR	sir	0x0001
	.word 0x83d02034  ! 2278: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x81982b49  ! 2279: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b49, %hpstate
	.word 0x8d90225f  ! 2280: WRPR_PSTATE_I	wrpr	%r0, 0x025f, %pstate
	.word 0xf28804a0  ! 2281: LDUBA_R	lduba	[%r0, %r0] 0x25, %r25
	.word 0x93902002  ! 2282: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8ba01a6c  ! 2283: FqTOi	fqtoi	
	.word 0x93508000  ! 2284: RDPR_TSTATE	rdpr	%tstate, %r9
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_138:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 2286: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x94d50008  ! 2287: UMULcc_R	umulcc 	%r20, %r8, %r10
	.word 0xd4dfe020  ! 2288: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0x8d902241  ! 2289: WRPR_PSTATE_I	wrpr	%r0, 0x0241, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb5702001  ! 2291: POPC_I	popc	0x0001, %r26
	.word 0x93902004  ! 2292: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xf537e001  ! 2293: STQF_I	-	%f26, [0x0001, %r31]
	.word 0x36700001  ! 2294: BPGE	<illegal instruction>
	.word 0x93902002  ! 2295: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa190200f  ! 2296: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x9f802001  ! 2297: SIR	sir	0x0001
	ta	T_CHANGE_PRIV	! macro
	.word 0xf5e7c028  ! 2299: CASA_I	casa	[%r31] 0x 1, %r8, %r26
	.word 0x81982d47  ! 2300: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d47, %hpstate
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2301: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a8d  ! 2302: WRPR_PSTATE_I	wrpr	%r0, 0x0a8d, %pstate
	.word 0xa190200f  ! 2303: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d9026df  ! 2304: WRPR_PSTATE_I	wrpr	%r0, 0x06df, %pstate
	.word 0x8d500000  ! 2305: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x9351c000  ! 2306: RDPR_TL	rdpr	%tl, %r9
	.word 0xd24fc000  ! 2307: LDSB_R	ldsb	[%r31 + %r0], %r9
	.word 0x93902006  ! 2308: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 2309: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x97504000  ! 2310: RDPR_TNPC	rdpr	%tnpc, %r11
DS_139:
	.word 0x20800001  ! 2312: BN	bn,a	<label_0x1>
	pdist %f6, %f26, %f8
	.word 0xa5b34300  ! 2311: ALLIGNADDRESS	alignaddr	%r13, %r0, %r18
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2312: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe4c7e000  ! 2313: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	.word 0xe477e001  ! 2314: STX_I	stx	%r18, [%r31 + 0x0001]
	.word 0xa7a1c9a8  ! 2315: FDIVs	fdivs	%f7, %f8, %f19
	.word 0x83d02033  ! 2316: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x8d9022c7  ! 2317: WRPR_PSTATE_I	wrpr	%r0, 0x02c7, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x30700001  ! 2319: BPA	<illegal instruction>
	.word 0x8d802000  ! 2320: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99902004  ! 2321: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x8d9026c8  ! 2322: WRPR_PSTATE_I	wrpr	%r0, 0x06c8, %pstate
	.word 0x93902000  ! 2323: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x96690006  ! 2324: UDIVX_R	udivx 	%r4, %r6, %r11
	.word 0x87902397  ! 2325: WRPR_TT_I	wrpr	%r0, 0x0397, %tt
	.word 0xa1902002  ! 2326: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902007  ! 2327: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd6ffc026  ! 2328: SWAPA_R	swapa	%r11, [%r31 + %r6] 0x01
	.word 0x8d902813  ! 2329: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	.word 0xb16b4008  ! 2330: SDIVX_R	sdivx	%r13, %r8, %r24
	.word 0x8d802000  ! 2331: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2332: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 2333: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902004  ! 2334: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x96f90016  ! 2335: SDIVcc_R	sdivcc 	%r4, %r22, %r11
	.word 0xad51c000  ! 2336: RDPR_TL	rdpr	%tl, %r22
	.word 0x81982651  ! 2337: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0651, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2338: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_140:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8790205d  ! 2340: WRPR_TT_I	wrpr	%r0, 0x005d, %tt
	.word 0xede7c036  ! 2341: CASA_I	casa	[%r31] 0x 1, %r22, %r22
	.word 0xa1902005  ! 2342: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902ecd  ! 2343: WRPR_PSTATE_I	wrpr	%r0, 0x0ecd, %pstate
	.word 0xec9fe001  ! 2344: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r22
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982796  ! 2346: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0796, %hpstate
	.word 0x83d02034  ! 2347: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x93d02034  ! 2348: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x81982995  ! 2349: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0995, %hpstate
	.word 0x8d802000  ! 2350: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xb7a68dd8  ! 2351: FdMULq	fdmulq	
	.word 0x8fa609a6  ! 2352: FDIVs	fdivs	%f24, %f6, %f7
	.word 0x8d902c56  ! 2353: WRPR_PSTATE_I	wrpr	%r0, 0x0c56, %pstate
	.word 0x879022e9  ! 2354: WRPR_TT_I	wrpr	%r0, 0x02e9, %tt
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902006  ! 2357: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93d02031  ! 2358: Tcc_I	tne	icc_or_xcc, %r0 + 49
change_to_tl1_141:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 2361: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x91d02035  ! 2362: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91d02031  ! 2364: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93a149b4  ! 2365: FDIVs	fdivs	%f5, %f20, %f9
	.word 0xd28008a0  ! 2366: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8d802000  ! 2367: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2368: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200b  ! 2369: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x91d02031  ! 2370: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8f494000  ! 2371: RDHPR_HTBA	rdhpr	%htba, %r7
	.word 0x8198250b  ! 2372: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050b, %hpstate
	.word 0x8d802000  ! 2373: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xaf504000  ! 2374: RDPR_TNPC	rdpr	%tnpc, %r23
	.word 0x93504000  ! 2375: RDPR_TNPC	<illegal instruction>
	.word 0x8d9022d7  ! 2376: WRPR_PSTATE_I	wrpr	%r0, 0x02d7, %pstate
	.word 0x819827cc  ! 2377: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cc, %hpstate
	.word 0x91d02034  ! 2378: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93d02035  ! 2379: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x81982249  ! 2380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0249, %hpstate
	.word 0x83d02032  ! 2381: Tcc_I	te	icc_or_xcc, %r0 + 50
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2382: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02035  ! 2383: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa751c000  ! 2384: RDPR_TL	rdpr	%tl, %r19
	.word 0x8d9026c8  ! 2385: WRPR_PSTATE_I	wrpr	%r0, 0x06c8, %pstate
	.word 0x91702001  ! 2386: POPC_I	popc	0x0001, %r8
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 2387: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 2388: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902ec0  ! 2390: WRPR_PSTATE_I	wrpr	%r0, 0x0ec0, %pstate
	.word 0x87902261  ! 2391: WRPR_TT_I	wrpr	%r0, 0x0261, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87902243  ! 2393: WRPR_TT_I	wrpr	%r0, 0x0243, %tt
	.word 0x83d02032  ! 2394: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d90260e  ! 2395: WRPR_PSTATE_I	wrpr	%r0, 0x060e, %pstate
	.word 0x81982b5a  ! 2396: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5a, %hpstate
	.word 0xa190200d  ! 2397: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d9026cb  ! 2398: WRPR_PSTATE_I	wrpr	%r0, 0x06cb, %pstate
	.word 0x8350c000  ! 2399: RDPR_TT	rdpr	%tt, %r1
	.word 0x9085a001  ! 2400: ADDcc_I	addcc 	%r22, 0x0001, %r8
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87902355  ! 2402: WRPR_TT_I	wrpr	%r0, 0x0355, %tt
	.word 0x8790205b  ! 2403: WRPR_TT_I	wrpr	%r0, 0x005b, %tt
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2404: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02030  ! 2405: Tcc_I	tne	icc_or_xcc, %r0 + 48
DS_142:
	.word 0x32800001  ! 2407: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xafa00542  ! 2407: FSQRTd	fsqrt	
	.word 0x95a4c822  ! 2406: FADDs	fadds	%f19, %f2, %f10
DS_143:
	.word 0x22800001  ! 2408: BE	be,a	<label_0x1>
	.word 0x20800001  ! 2408: BN	bn,a	<label_0x1>
	.word 0xc9134010  ! 2408: LDQF_R	-	[%r13, %r16], %f4
	.word 0x8fa10828  ! 2407: FADDs	fadds	%f4, %f8, %f7
	.word 0x93902003  ! 2408: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d90249f  ! 2409: WRPR_PSTATE_I	wrpr	%r0, 0x049f, %pstate
	.word 0x9f802001  ! 2410: SIR	sir	0x0001
	.word 0x83d02034  ! 2411: Tcc_I	te	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8790214d  ! 2413: WRPR_TT_I	wrpr	%r0, 0x014d, %tt
	.word 0xa9a20dca  ! 2414: FdMULq	fdmulq	
	.word 0x8d9022c7  ! 2415: WRPR_PSTATE_I	wrpr	%r0, 0x02c7, %pstate
	.word 0x87902187  ! 2416: WRPR_TT_I	wrpr	%r0, 0x0187, %tt
	.word 0xa1902001  ! 2417: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_144:
	.word 0x32800001  ! 2419: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 2418: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xe8800ae0  ! 2419: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r20
	.word 0xb44d800c  ! 2420: MULX_R	mulx 	%r22, %r12, %r26
	.word 0x8ba049e5  ! 2421: FDIVq	dis not found

	.word 0x8d902ac2  ! 2422: WRPR_PSTATE_I	wrpr	%r0, 0x0ac2, %pstate
	.word 0xca8008a0  ! 2423: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x92f8a001  ! 2424: SDIVcc_I	sdivcc 	%r2, 0x0001, %r9
	.word 0xa7494000  ! 2425: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0xacdc401a  ! 2426: SMULcc_R	smulcc 	%r17, %r26, %r22
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 2427: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982e10  ! 2428: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e10, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 2429: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x89b2cfe2  ! 2430: FONES	fones	%f4
	.word 0xc937e001  ! 2431: STQF_I	-	%f4, [0x0001, %r31]
	.word 0xc8c004a0  ! 2432: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r4
	.word 0x8d802000  ! 2433: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198299f  ! 2434: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099f, %hpstate
	.word 0xc927e001  ! 2435: STF_I	st	%f4, [0x0001, %r31]
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2436: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982f01  ! 2437: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f01, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879020b5  ! 2439: WRPR_TT_I	wrpr	%r0, 0x00b5, %tt
	.word 0x91d02035  ! 2440: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902005  ! 2441: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81a000c3  ! 2442: FNEGd	fnegd	%f34, %f0
	.word 0x8d802000  ! 2443: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x97500000  ! 2444: RDPR_TPC	rdpr	%tpc, %r11
	.word 0xa190200a  ! 2445: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x91d02032  ! 2446: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 2447: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x2e800001  ! 2448: BVS	bvs,a	<label_0x1>
	.word 0x99504000  ! 2449: RDPR_TNPC	rdpr	%tnpc, %r12
	.word 0x87802089  ! 2450: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8790214d  ! 2451: WRPR_TT_I	wrpr	%r0, 0x014d, %tt
	.word 0x91d02035  ! 2452: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x83d02030  ! 2453: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x93902001  ! 2454: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x95494000  ! 2456: RDHPR_HTBA	rdhpr	%htba, %r10
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982848  ! 2458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0848, %hpstate
	.word 0x879021a5  ! 2459: WRPR_TT_I	wrpr	%r0, 0x01a5, %tt
	.word 0x8d902a0f  ! 2460: WRPR_PSTATE_I	wrpr	%r0, 0x0a0f, %pstate
DS_145:
	.word 0x22800001  ! 2462: BE	be,a	<label_0x1>
	pdist %f28, %f14, %f28
	.word 0xa3b54303  ! 2461: ALLIGNADDRESS	alignaddr	%r21, %r3, %r17
	.word 0x9f802001  ! 2462: SIR	sir	0x0001
	.word 0xa7514000  ! 2463: RDPR_TBA	rdpr	%tba, %r19
	.word 0xb750c000  ! 2464: RDPR_TT	<illegal instruction>
	.word 0x879020d5  ! 2465: WRPR_TT_I	wrpr	%r0, 0x00d5, %tt
	.word 0xf657c000  ! 2466: LDSH_R	ldsh	[%r31 + %r0], %r27
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2467: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982946  ! 2468: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0946, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xf6dfe010  ! 2470: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r27
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2471: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 2472: SIR	sir	0x0001
	.word 0xf68008a0  ! 2473: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
DS_146:
	.word 0x34800001  ! 2475: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 2474: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902000  ! 2475: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x20700001  ! 2476: BPN	<illegal instruction>
	.word 0x93902004  ! 2477: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902089  ! 2478: WRPR_PSTATE_I	wrpr	%r0, 0x0089, %pstate
	.word 0xa3a000d7  ! 2479: FNEGd	fnegd	%f54, %f48
	.word 0x9f802001  ! 2480: SIR	sir	0x0001
	.word 0xe3e7c037  ! 2481: CASA_I	casa	[%r31] 0x 1, %r23, %r17
	.word 0x87802080  ! 2482: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02031  ! 2483: Tcc_I	ta	icc_or_xcc, %r0 + 49
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2484: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x876e6001  ! 2485: SDIVX_I	sdivx	%r25, 0x0001, %r3
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902006  ! 2487: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa5508000  ! 2488: RDPR_TSTATE	rdpr	%tstate, %r18
	.word 0x8198244d  ! 2489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044d, %hpstate
	ta	T_CHANGE_HPRIV	! macro
DS_147:
	.word 0x32800001  ! 2492: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 2491: SAVE_R	save	%r31, %r0, %r31
	.word 0x93d02032  ! 2492: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xa1902002  ! 2493: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xe4d00e80  ! 2494: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r18
	.word 0xe4c7e000  ! 2495: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r18
	ta	T_CHANGE_NONHPRIV	! macro
DS_148:
	.word 0x20800001  ! 2498: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 2497: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802004  ! 2498: WRFPRS_I	wr	%r0, 0x0004, %fprs
	otherw
	mov 0x33, %r30


.global user_data_start
.data
user_data_start:
	.xword	0x9832da9c9c4de37b
	.xword	0x75d137f2ced8a05e
	.xword	0x5e5c28876f4e1214
	.xword	0x0a5967c255a72011
	.xword	0x45c8bc72e8a83c81
	.xword	0x60df77b33a86e34d
	.xword	0x3e4b13109c31ef51
	.xword	0x6e08d6584fa03165
	.xword	0xba16c210fda204ea
	.xword	0x29d6fc8367663951
	.xword	0x84c24abf367c3c1e
	.xword	0x06045837318e41c0
	.xword	0x043470974db0efc6
	.xword	0x64b6c874f4f374f8
	.xword	0xcae0a2fa4175a779
	.xword	0x20d36748a198585c
	.xword	0x459b26e4a416b203
	.xword	0x7f6a9bf473eb5dcf
	.xword	0x2479b0187d087b5b
	.xword	0x532ca220a916679f
	.xword	0x2c60f692eec7b92e
	.xword	0xea3ff386c3b89bdd
	.xword	0xbbb48306d18d958c
	.xword	0x14a3a6324dab2b9e
	.xword	0x51512269b54e582a
	.xword	0xe84e2a909b0207fe
	.xword	0x0a56c3303844488c
	.xword	0xff3c611f35fdcdcb
	.xword	0x8e364defb29b858b
	.xword	0x9c9541a565786375
	.xword	0x5fbb8aa81b110035
	.xword	0xa71e43b18e5446ca
	.xword	0x88d489ef2a59a4fd
	.xword	0x93b0fb19f2700822
	.xword	0xa341483d91c557ad
	.xword	0x0dd7cb4e12eae274
	.xword	0x533383608999c777
	.xword	0xa7e2db2a1c97bdf4
	.xword	0x55aeaf2670d15716
	.xword	0x65c5f4fb141e8a97
	.xword	0xc72b9fa9a3218ea4
	.xword	0xf84fe364b17eb728
	.xword	0x29e00db28bb90fa7
	.xword	0x509ea1c494c163a2
	.xword	0xf9b342d7127803dc
	.xword	0x1c1f8f3188998eb6
	.xword	0x4fd5566394b41eb6
	.xword	0xc146a63b223f4de5
	.xword	0xb1a8d7caca06a2d3
	.xword	0xfb9c598cfa9b1e92
	.xword	0x2d061412483aa116
	.xword	0x22b2182f19d37714
	.xword	0x703056668cc4c7ef
	.xword	0x6b21537c647321ce
	.xword	0x9c07538c682148ee
	.xword	0xb54bc55e95644c55
	.xword	0x2151b4106596f86b
	.xword	0xb2f6ed9d1379f7c5
	.xword	0x17a17bf96d939c08
	.xword	0xf87c7e32cf1ebe9a
	.xword	0x134a74f2ed8a231b
	.xword	0xe77ba596f452b541
	.xword	0x5bb65f7506954458
	.xword	0xe2d44eb4547931da
	.xword	0xb11150e046e18483
	.xword	0xb4b96eb3574e4fa4
	.xword	0xa800247547e1a2bc
	.xword	0xc4a82fc8babc555b
	.xword	0x8aa41efb19d496fa
	.xword	0x56c8507e7e0bd6c4
	.xword	0x8aca4d6e1b1d1563
	.xword	0x540f87a394bb046a
	.xword	0xe50f0a6dd9b86820
	.xword	0x53213f0e603442a4
	.xword	0x97da69ef89ca6af7
	.xword	0x856b25d682b96072
	.xword	0xb2181df5d3391fd3
	.xword	0x0a3ebd9a1cfcdcef
	.xword	0x49eaea4a27d1a930
	.xword	0x4dd574249c913e45
	.xword	0x211f996fa81d0709
	.xword	0x0318e011c195bf66
	.xword	0x2c672ea201217f13
	.xword	0x9e21e653445b16fb
	.xword	0x451a2a576f5b4c01
	.xword	0x3ba531f4909f9723
	.xword	0x86818adbdcb91c26
	.xword	0x99477ebfee0237f7
	.xword	0x957284a2f85af1d0
	.xword	0x74736c7c25c60614
	.xword	0x43a26204a6c1a2b4
	.xword	0xc128aee1c27adea6
	.xword	0x07c53dd94f587554
	.xword	0x953e2a76a126b01b
	.xword	0xa552488e25c2f563
	.xword	0xe29978a033ea74ae
	.xword	0x7f7e4871981cad13
	.xword	0xb1a8e3ec527188b7
	.xword	0xa842bd07ad1300c1
	.xword	0x2bbe631578b52dc5
	.xword	0xd07ad75772b2f853
	.xword	0xadc9a5f0bec30fc6
	.xword	0x0c8a6901cfa01272
	.xword	0x7d8b4fdb6eb18ead
	.xword	0xa8edc37a0342cfcb
	.xword	0x100971da9c615c3d
	.xword	0x3ee1e0e1a0287a39
	.xword	0x2eb4eee729112d84
	.xword	0x84c75d4d9d614644
	.xword	0x3035ea080eb877d4
	.xword	0xa62eaa7f2f987b92
	.xword	0x416a5d4ee051f5b1
	.xword	0xcddd59a017ceff68
	.xword	0x5304b9c5552ad8ab
	.xword	0xc581d4828078ffcc
	.xword	0x00f42cffde4fa6a0
	.xword	0x2fc76d0326aec90b
	.xword	0x93d73829c00c73fd
	.xword	0xc65e2f863ea4bd35
	.xword	0xd314e3a15fa90b59
	.xword	0xb5428c3739d9169a
	.xword	0x4c2e751c0f2830f1
	.xword	0x596573808001a4d6
	.xword	0xc5537b57b4cfe8da
	.xword	0x3884344890efd848
	.xword	0xf4e8dd3c92072e95
	.xword	0x86dc976d96550487
	.xword	0xf20456b2f3b73da1
	.xword	0x1b94e4a6b19e1b6e
	.xword	0xc5f921918300a537
	.xword	0xadacbd8045e1f863
	.xword	0x9f2c596910712d02
	.xword	0x094356202fea952c
	.xword	0xd829d2c61435e147
	.xword	0x7788e89fb14487cd
	.xword	0xb078e95807aa54bb
	.xword	0x99740a98204b7db2
	.xword	0x886c34d9dfd99315
	.xword	0x97c7fa5b1ab905a1
	.xword	0x7cb9d5f934f69bb7
	.xword	0xb452628c3d63c770
	.xword	0x1b2974cf5331a15d
	.xword	0xb3123bacd815ddb5
	.xword	0x38773e49a412a997
	.xword	0x81b84d16bd2cd017
	.xword	0x1023182af46ca03c
	.xword	0x448d67d46282aa59
	.xword	0x61c9fa229eb2361e
	.xword	0x6f056f135f4b3612
	.xword	0x99654d535f0bba31
	.xword	0x801ce8a810435fb1
	.xword	0x5cf69aaa3864236c
	.xword	0x9064236b2edb0b05
	.xword	0x07972a2384a0cdf5
	.xword	0x970faf73721b9b09
	.xword	0xdd9d0480977ce6aa
	.xword	0x4d863321bf80b15f
	.xword	0xc8ee747775fb391d
	.xword	0xe2704fadab3692a2
	.xword	0xe3308536696eb493
	.xword	0x0e083eac902316e4
	.xword	0x6ec3b259f2c750af
	.xword	0xc3a8bbd50ce9b648
	.xword	0x3d0616e9ad4a6e62
	.xword	0x6bff19e48939394e
	.xword	0x3780b49e90b2a1a9
	.xword	0xa3b02727fb5e8fa9
	.xword	0x384d0d357e36cdbb
	.xword	0xe738b7f90536bc5b
	.xword	0xd115e3a990c42122
	.xword	0x619c804b37bf4a4b
	.xword	0xa4efc0a55ebb85e7
	.xword	0x458322fc5843a6d4
	.xword	0xcfd348ad283aea55
	.xword	0x309dbdcccc8ae2f9
	.xword	0x73cfaa6f448ebe7d
	.xword	0xf7ab31478cc98fec
	.xword	0xaee260f9d79bf404
	.xword	0x0d9f6a3d218eee95
	.xword	0x6bea9ea7fcd4b80f
	.xword	0xeec2381420bad67d
	.xword	0x21868b3b5a9c86c5
	.xword	0xfed3d61e8b0e9a9b
	.xword	0xd269e543183c822a
	.xword	0x199ebdde3e6e0e23
	.xword	0x32cf361dc66ca197
	.xword	0x43ced38a080715a6
	.xword	0xa5914069bcd90d92
	.xword	0xdf259418819c3ef1
	.xword	0x6a8fac4ba3f25289
	.xword	0x43548afc82ab20bf
	.xword	0x989ef83e8ed38078
	.xword	0xa4ee9153ea6efa8b
	.xword	0xf93db189561a7844
	.xword	0x3ce0fb5b8baf99cf
	.xword	0x66d802a747552320
	.xword	0xcb63cbc43c63798e
	.xword	0x3b4eec178f909d0e
	.xword	0xa8c236815dd8d37a
	.xword	0xd1afb769b71e3a7e
	.xword	0xd84bba81ab2c95d6
	.xword	0x3df70833c2e77d6e
	.xword	0xfdb107fb0dbf980f
	.xword	0x4978509120b4b6e9
	.xword	0x96fdd3da4b89645c
	.xword	0x259872247625606b
	.xword	0xf4e4b12d51f76111
	.xword	0x2fc59308052ae75b
	.xword	0x1ee94b0f0b94ec55
	.xword	0x939714ee389c76c5
	.xword	0x514bcbe2ac84ccc0
	.xword	0x479bf5b12c98d234
	.xword	0x27d38adc7230ddd9
	.xword	0x03fdd1670bdddc8d
	.xword	0x84818ffd921d7cd4
	.xword	0xe50003945dc80229
	.xword	0xa82be0457648dd03
	.xword	0xca3f81b2f3f4f1d8
	.xword	0x93f0d9adba53f6a4
	.xword	0x38f5d47f3907327f
	.xword	0x84cecd509023cc5e
	.xword	0x6cb7b5ca26d4627a
	.xword	0x483daedf6f09bc57
	.xword	0x9bc970fe48f034f9
	.xword	0x69b2c84d541798e8
	.xword	0x5fdc310910d16a3c
	.xword	0x94a34173c4e4a762
	.xword	0x48e792f78231d641
	.xword	0xbd02c74b38b1da45
	.xword	0x18615026a017036c
	.xword	0xcd7d98cee95a538a
	.xword	0x84b2d4071f3422d6
	.xword	0xc2a0e1e9dc7acf46
	.xword	0x05bba777bf70afb5
	.xword	0xbd2f9286a8a5aad4
	.xword	0x2ad7d535251f9081
	.xword	0xd43ccf8a0608513a
	.xword	0xe8aaa4dfb27da5d8
	.xword	0xeb38caac4eaabbf6
	.xword	0xa8a7b247e881ad40
	.xword	0xe49e7c4947a827cb
	.xword	0xf8b69587f8766201
	.xword	0xbd733df7bc0370fa
	.xword	0x2c5793687408ebf8
	.xword	0x51939ed701bddbcc
	.xword	0xb459f5fd07547080
	.xword	0x8ff61884e82d29a4
	.xword	0x4511b3765955eee2
	.xword	0x345ef2bebcbb0996
	.xword	0x68122975c780fd7f
	.xword	0xbaeed00c0b12e2fe
	.xword	0x17cbbae228233e52
	.xword	0x060983592a265ad7
	.xword	0x27d385518c95b879
	.xword	0x448c495eae5a56e9
	.xword	0x9f8b8c9fda44616c


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Tue Apr 27 11:21:32 2004
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

