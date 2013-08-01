/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand03_ind_06.s
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
	mov 0x31, %r14
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
	.word 0xab50c000  ! 1: RDPR_TT	rdpr	%tt, %r21
	.word 0xb3a000d7  ! 2: FNEGd	fnegd	%f54, %f56
	.word 0x93902005  ! 3: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 4: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_0:
	.word 0x32800001  ! 6: BNE	bne,a	<label_0x1>
	allclean
	.word 0xafb48319  ! 5: ALLIGNADDRESS	alignaddr	%r18, %r25, %r23
change_to_tl1_1:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x904a000d  ! 7: MULX_R	mulx 	%r8, %r13, %r8
	.word 0x83a00577  ! 8: FSQRTq	fsqrt	
	.word 0xa1902005  ! 9: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x93a64d27  ! 10: FsMULd	fsmuld	%f25, %f38, %f40
	.word 0xa1902009  ! 11: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d02035  ! 12: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02033  ! 14: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802010  ! 15: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x99902003  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x8198231e  ! 17: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031e, %hpstate
	.word 0xa1902002  ! 18: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8cfce001  ! 19: SDIVcc_I	sdivcc 	%r19, 0x0001, %r6
	.word 0x91d02032  ! 20: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87500000  ! 21: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x91d02030  ! 22: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x2a800001  ! 25: BCS	bcs,a	<label_0x1>
	.word 0xa1902008  ! 26: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8ad6401b  ! 27: UMULcc_R	umulcc 	%r25, %r27, %r5
	.word 0x879022a1  ! 28: WRPR_TT_I	wrpr	%r0, 0x02a1, %tt
	.word 0x8e686001  ! 29: UDIVX_I	udivx 	%r1, 0x0001, %r7
	.word 0xada309d2  ! 30: FDIVd	fdivd	%f12, %f18, %f22
	.word 0x93902005  ! 31: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xede7c032  ! 32: CASA_I	casa	[%r31] 0x 1, %r18, %r22
	.word 0x83a48dd4  ! 33: FdMULq	fdmulq	
	.word 0x8d902842  ! 34: WRPR_PSTATE_I	wrpr	%r0, 0x0842, %pstate
	.word 0xc2d004a0  ! 35: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x8d802000  ! 36: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8790208b  ! 37: WRPR_TT_I	wrpr	%r0, 0x008b, %tt
	.word 0xc337e001  ! 38: STQF_I	-	%f1, [0x0001, %r31]
	.word 0x83d02033  ! 39: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xb551c000  ! 40: RDPR_TL	rdpr	%tl, %r26
	.word 0xa190200c  ! 41: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 42: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99a44d2a  ! 43: FsMULd	fsmuld	%f17, %f10, %f12
	.word 0x819825d0  ! 44: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d0, %hpstate
	.word 0x879022ff  ! 45: WRPR_TT_I	wrpr	%r0, 0x02ff, %tt
	.word 0x9551c000  ! 46: RDPR_TL	rdpr	%tl, %r10
	.word 0xa1902003  ! 47: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa1902006  ! 48: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa190200c  ! 49: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902003  ! 50: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902006  ! 51: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d9028ca  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x08ca, %pstate
	.word 0x28700001  ! 53: BPLEU	<illegal instruction>
	.word 0x879021c7  ! 54: WRPR_TT_I	wrpr	%r0, 0x01c7, %tt
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 56: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 57: BPOS	bpos,a	<label_0x1>
	.word 0xd4880e80  ! 58: LDUBA_R	lduba	[%r0, %r0] 0x74, %r10
	.word 0xa190200c  ! 59: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902005  ! 60: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8351c000  ! 61: RDPR_TL	rdpr	%tl, %r1
	.word 0x83d02030  ! 62: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x93902005  ! 63: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 64: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 65: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x94f96001  ! 66: SDIVcc_I	sdivcc 	%r5, 0x0001, %r10
	.word 0x936a800c  ! 67: SDIVX_R	sdivx	%r10, %r12, %r9
	.word 0x93902002  ! 68: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 69: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_2:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 70: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xafa0c9c7  ! 71: FDIVd	fdivd	%f34, %f38, %f54
	.word 0x26800001  ! 72: BL	bl,a	<label_0x1>
	.word 0x879023d1  ! 73: WRPR_TT_I	wrpr	%r0, 0x03d1, %tt
	.word 0xa9494000  ! 74: RDHPR_HTBA	rdhpr	%htba, %r20
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a00577  ! 76: FSQRTq	fsqrt	
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 77: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_3:
	.word 0x20800001  ! 79: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 79: BNE	bne,a	<label_0x1>
	.word 0xa3a00546  ! 79: FSQRTd	fsqrt	
	.word 0x8da2082b  ! 78: FADDs	fadds	%f8, %f11, %f6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x819823c5  ! 80: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c5, %hpstate
	.word 0x91d02031  ! 81: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xcc97e000  ! 82: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r6
	.word 0xb7514000  ! 83: RDPR_TBA	rdpr	%tba, %r27
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902484  ! 85: WRPR_PSTATE_I	wrpr	%r0, 0x0484, %pstate
	.word 0xa86dc014  ! 86: UDIVX_R	udivx 	%r23, %r20, %r20
	.word 0x8790200e  ! 87: WRPR_TT_I	wrpr	%r0, 0x000e, %tt
	.word 0x91d02032  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902004  ! 89: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x84f84008  ! 90: SDIVcc_R	sdivcc 	%r1, %r8, %r2
	.word 0x93902007  ! 91: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x3e700001  ! 92: BPVC	<illegal instruction>
	.word 0x93902003  ! 93: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02031  ! 94: Tcc_I	ta	icc_or_xcc, %r0 + 49
change_to_randtl_4:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 95: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x91d02031  ! 96: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_5:
	.word 0x34800001  ! 98: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 97: SAVE_R	save	%r31, %r0, %r31
	.word 0x8a684004  ! 98: UDIVX_R	udivx 	%r1, %r4, %r5
	.word 0x8d902c5c  ! 99: WRPR_PSTATE_I	wrpr	%r0, 0x0c5c, %pstate
	.word 0x91d02035  ! 100: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8a81400a  ! 101: ADDcc_R	addcc 	%r5, %r10, %r5
	.word 0x879020a4  ! 102: WRPR_TT_I	wrpr	%r0, 0x00a4, %tt
	.word 0x2e800001  ! 103: BVS	bvs,a	<label_0x1>
	.word 0xcad7e020  ! 104: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r5
	.word 0x87902037  ! 105: WRPR_TT_I	wrpr	%r0, 0x0037, %tt
	.word 0x8ba309b4  ! 106: FDIVs	fdivs	%f12, %f20, %f5
	.word 0x90830016  ! 107: ADDcc_R	addcc 	%r12, %r22, %r8
	.word 0x8d90265e  ! 108: WRPR_PSTATE_I	wrpr	%r0, 0x065e, %pstate
	.word 0x97504000  ! 109: RDPR_TNPC	rdpr	%tnpc, %r11
DS_6:
	.word 0x22800001  ! 111: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 110: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 111: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 112: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902001  ! 113: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd6c004a0  ! 114: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r11
	.word 0x87802010  ! 115: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xa1902006  ! 116: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902005  ! 117: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_NONHPRIV	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 119: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982d4f  ! 120: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4f, %hpstate
	.word 0x9f802001  ! 121: SIR	sir	0x0001
	.word 0x81982d4c  ! 122: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4c, %hpstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 123: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_7:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 124: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x8d802000  ! 125: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879023b4  ! 126: WRPR_TT_I	wrpr	%r0, 0x03b4, %tt
	.word 0x91d02031  ! 127: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902001  ! 128: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x34700001  ! 129: BPG	<illegal instruction>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 130: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 131: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902890  ! 132: WRPR_PSTATE_I	wrpr	%r0, 0x0890, %pstate
	.word 0x87902283  ! 133: WRPR_TT_I	wrpr	%r0, 0x0283, %tt
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 134: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902003  ! 136: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x9f802001  ! 137: SIR	sir	0x0001
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd6dfe000  ! 139: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	.word 0x81982999  ! 140: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0999, %hpstate
	.word 0x95a449ac  ! 141: FDIVs	fdivs	%f17, %f12, %f10
	.word 0xa1902000  ! 142: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d902646  ! 143: WRPR_PSTATE_I	wrpr	%r0, 0x0646, %pstate
	.word 0x819828c7  ! 144: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c7, %hpstate
	.word 0x8d902ec6  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x0ec6, %pstate
	.word 0x9169c012  ! 146: SDIVX_R	sdivx	%r7, %r18, %r8
	.word 0x879020a6  ! 147: WRPR_TT_I	wrpr	%r0, 0x00a6, %tt
	.word 0x91d02034  ! 148: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa7540000  ! 149: RDPR_GL	rdpr	%-, %r19
	.word 0xe6dfe020  ! 150: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r19
	.word 0x81982512  ! 151: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0512, %hpstate
	.word 0x8d902613  ! 152: WRPR_PSTATE_I	wrpr	%r0, 0x0613, %pstate
	.word 0x88c06001  ! 153: ADDCcc_I	addccc 	%r1, 0x0001, %r4
	.word 0x81982306  ! 154: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0306, %hpstate
	.word 0x24800001  ! 155: BLE	ble,a	<label_0x1>
	.word 0xa0fb6001  ! 156: SDIVcc_I	sdivcc 	%r13, 0x0001, %r16
	.word 0x30700001  ! 157: BPA	<illegal instruction>
	.word 0x8da00549  ! 158: FSQRTd	fsqrt	
	.word 0x91d02034  ! 159: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 160: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982f56  ! 161: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f56, %hpstate
	.word 0x8d802000  ! 162: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 163: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcc7fe001  ! 164: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x8d902015  ! 165: WRPR_PSTATE_I	wrpr	%r0, 0x0015, %pstate
	.word 0x81982559  ! 166: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0559, %hpstate
	.word 0x91d02031  ! 167: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87902099  ! 168: WRPR_TT_I	wrpr	%r0, 0x0099, %tt
DS_8:
	.word 0x34800001  ! 170: BG	bg,a	<label_0x1>
	illtrap
	.word 0xafa0054c  ! 170: FSQRTd	fsqrt	
	.word 0xb1a2083a  ! 169: FADDs	fadds	%f8, %f26, %f24
	.word 0xa1902009  ! 170: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d90209d  ! 171: WRPR_PSTATE_I	wrpr	%r0, 0x009d, %pstate
	.word 0x83d02033  ! 172: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x81982107  ! 173: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0107, %hpstate
	.word 0x83d02030  ! 174: Tcc_I	te	icc_or_xcc, %r0 + 48
DS_9:
	.word 0x32800001  ! 176: BNE	bne,a	<label_0x1>
	.word 0xf1302001  ! 176: STQF_I	-	%f24, [0x0001, %r0]
	normalw
	.word 0x93458000  ! 175: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x9f802001  ! 176: SIR	sir	0x0001
	.word 0x8790200f  ! 177: WRPR_TT_I	wrpr	%r0, 0x000f, %tt
	.word 0xa1902005  ! 178: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x91d02034  ! 179: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9ba00564  ! 180: FSQRTq	fsqrt	
change_to_randtl_10:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 181: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xa1902006  ! 182: WRPR_GL_I	wrpr	%r0, 0x0006, %-
DS_11:
	.word 0x22800001  ! 184: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 183: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982e4a  ! 184: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4a, %hpstate
	.word 0x93902000  ! 185: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d90281b  ! 186: WRPR_PSTATE_I	wrpr	%r0, 0x081b, %pstate
	.word 0xaf480000  ! 187: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa84d0006  ! 190: MULX_R	mulx 	%r20, %r6, %r20
	.word 0x82fc2001  ! 191: SDIVcc_I	sdivcc 	%r16, 0x0001, %r1
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 192: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 193: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc2dfe010  ! 194: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r1
	.word 0x82a84003  ! 195: ANDNcc_R	andncc 	%r1, %r3, %r1
	.word 0xc21fe001  ! 196: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0xc2d7e010  ! 197: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r1
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 198: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 199: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa0da401b  ! 200: SMULcc_R	smulcc 	%r9, %r27, %r16
	.word 0x8b51c000  ! 201: RDPR_TL	rdpr	%tl, %r5
	.word 0x87902182  ! 202: WRPR_TT_I	wrpr	%r0, 0x0182, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x22800001  ! 204: BE	be,a	<label_0x1>
	.word 0x93d02032  ! 205: Tcc_I	tne	icc_or_xcc, %r0 + 50
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 206: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200d  ! 207: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d902a44  ! 208: WRPR_PSTATE_I	wrpr	%r0, 0x0a44, %pstate
	.word 0x8da249cc  ! 209: FDIVd	fdivd	%f40, %f12, %f6
	.word 0x8790211d  ! 210: WRPR_TT_I	wrpr	%r0, 0x011d, %tt
change_to_tl1_12:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02030  ! 212: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d902411  ! 213: WRPR_PSTATE_I	wrpr	%r0, 0x0411, %pstate
	.word 0x879020de  ! 214: WRPR_TT_I	wrpr	%r0, 0x00de, %tt
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 215: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 216: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_tl1_13:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
change_to_tl1_14:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa190200e  ! 219: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xa1902003  ! 220: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d902859  ! 221: WRPR_PSTATE_I	wrpr	%r0, 0x0859, %pstate
	.word 0xa2dc4018  ! 222: SMULcc_R	smulcc 	%r17, %r24, %r17
	.word 0x819820d9  ! 223: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d9, %hpstate
	.word 0xa9a14d22  ! 224: FsMULd	fsmuld	%f5, %f2, %f20
DS_15:
	.word 0x32800001  ! 226: BNE	bne,a	<label_0x1>
	.word 0xf7362001  ! 226: STQF_I	-	%f27, [0x0001, %r24]
	normalw
	.word 0xab458000  ! 225: RD_SOFTINT_REG	rd	%softint, %r21
	.word 0x87902170  ! 226: WRPR_TT_I	wrpr	%r0, 0x0170, %tt
	.word 0x91d02030  ! 227: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x28800001  ! 228: BLEU	bleu,a	<label_0x1>
	.word 0xea7fe001  ! 229: SWAP_I	swap	%r21, [%r31 + 0x0001]
	.word 0xea1fc000  ! 230: LDD_R	ldd	[%r31 + %r0], %r21
	.word 0x819822de  ! 231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02de, %hpstate
	.word 0x8d9022da  ! 232: WRPR_PSTATE_I	wrpr	%r0, 0x02da, %pstate
	.word 0x99902002  ! 233: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x8d9024d0  ! 234: WRPR_PSTATE_I	wrpr	%r0, 0x04d0, %pstate
	.word 0x8790228b  ! 235: WRPR_TT_I	wrpr	%r0, 0x028b, %tt
	.word 0x81982002  ! 236: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0002, %hpstate
	ta	T_CHANGE_PRIV	! macro
DS_16:
	.word 0x20800001  ! 239: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 238: SAVE_R	save	%r31, %r0, %r31
	.word 0xa190200a  ! 239: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93902003  ! 240: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02031  ! 241: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902007  ! 242: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9950c000  ! 243: RDPR_TT	rdpr	%tt, %r12
	.word 0xd82fc002  ! 244: STB_R	stb	%r12, [%r31 + %r2]
	.word 0xd88008a0  ! 245: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 246: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83d02033  ! 248: Tcc_I	te	icc_or_xcc, %r0 + 51
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 249: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9751c000  ! 250: RDPR_TL	rdpr	%tl, %r11
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 251: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982d02  ! 253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d02, %hpstate
	.word 0x93902006  ! 254: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd737e001  ! 255: STQF_I	-	%f11, [0x0001, %r31]
	.word 0x8d902c03  ! 256: WRPR_PSTATE_I	wrpr	%r0, 0x0c03, %pstate
	.word 0xd7e7c022  ! 257: CASA_I	casa	[%r31] 0x 1, %r2, %r11
	.word 0x8d902688  ! 258: WRPR_PSTATE_I	wrpr	%r0, 0x0688, %pstate
	.word 0x819826d9  ! 259: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d9, %hpstate
	.word 0x83514000  ! 260: RDPR_TBA	rdpr	%tba, %r1
	.word 0xad51c000  ! 261: RDPR_TL	rdpr	%tl, %r22
	.word 0xa1508000  ! 262: RDPR_TSTATE	<illegal instruction>
	.word 0x95a01a79  ! 263: FqTOi	fqtoi	
	.word 0xd48fe010  ! 264: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0xd49004a0  ! 265: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	.word 0x93902004  ! 266: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x879021d1  ! 267: WRPR_TT_I	wrpr	%r0, 0x01d1, %tt
	.word 0xd5e7c039  ! 268: CASA_I	casa	[%r31] 0x 1, %r25, %r10
	.word 0x8d902cce  ! 269: WRPR_PSTATE_I	wrpr	%r0, 0x0cce, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 270: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd5e7c039  ! 271: CASA_I	casa	[%r31] 0x 1, %r25, %r10
	.word 0xd49fe001  ! 272: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r10
	.word 0x9ba509ad  ! 273: FDIVs	fdivs	%f20, %f13, %f13
	.word 0x81982e08  ! 274: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e08, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdac804a0  ! 276: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r13
	.word 0xda8008a0  ! 277: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0xdbe7c02d  ! 278: CASA_I	casa	[%r31] 0x 1, %r13, %r13
	.word 0xaf51c000  ! 279: RDPR_TL	rdpr	%tl, %r23
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 280: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xeec804a0  ! 281: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r23
	.word 0x9f802001  ! 282: SIR	sir	0x0001
	.word 0xee8fe000  ! 283: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r23
	.word 0x87802004  ! 284: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x24800001  ! 285: BLE	ble,a	<label_0x1>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819822cd  ! 287: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cd, %hpstate
	.word 0xa5a309ac  ! 288: FDIVs	fdivs	%f12, %f12, %f18
	.word 0x99902003  ! 289: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x879020dc  ! 290: WRPR_TT_I	wrpr	%r0, 0x00dc, %tt
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 291: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802004  ! 292: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d9028da  ! 293: WRPR_PSTATE_I	wrpr	%r0, 0x08da, %pstate
	.word 0xe437c00c  ! 294: STH_R	sth	%r18, [%r31 + %r12]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90245a  ! 296: WRPR_PSTATE_I	wrpr	%r0, 0x045a, %pstate
	.word 0x93902001  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902a51  ! 298: WRPR_PSTATE_I	wrpr	%r0, 0x0a51, %pstate
	.word 0xaf500000  ! 299: RDPR_TPC	rdpr	%tpc, %r23
	.word 0x87902189  ! 300: WRPR_TT_I	wrpr	%r0, 0x0189, %tt
change_to_tl1_17:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d9024d7  ! 302: WRPR_PSTATE_I	wrpr	%r0, 0x04d7, %pstate
	.word 0x97540000  ! 303: RDPR_GL	rdpr	%-, %r11
	.word 0x93902007  ! 304: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902007  ! 305: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x83d02030  ! 306: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x83d02030  ! 307: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x93902007  ! 308: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81982f4b  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4b, %hpstate
	.word 0x99902000  ! 310: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8d508000  ! 311: RDPR_TSTATE	rdpr	%tstate, %r6
	.word 0xb3540000  ! 312: RDPR_GL	rdpr	%-, %r25
	.word 0xa1902005  ! 313: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xf2ffc02c  ! 314: SWAPA_R	swapa	%r25, [%r31 + %r12] 0x01
	.word 0x8d9020df  ! 315: WRPR_PSTATE_I	wrpr	%r0, 0x00df, %pstate
	.word 0x8d9024d0  ! 316: WRPR_PSTATE_I	wrpr	%r0, 0x04d0, %pstate
	.word 0x81982497  ! 317: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0497, %hpstate
	.word 0xb3494000  ! 318: RDHPR_HTBA	rdhpr	%htba, %r25
	.word 0xa7500000  ! 319: RDPR_TPC	<illegal instruction>
	.word 0x87902204  ! 320: WRPR_TT_I	wrpr	%r0, 0x0204, %tt
	.word 0x82d0e001  ! 321: UMULcc_I	umulcc 	%r3, 0x0001, %r1
	.word 0x8790213c  ! 322: WRPR_TT_I	wrpr	%r0, 0x013c, %tt
	.word 0x819829d3  ! 323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d3, %hpstate
	.word 0x8fa04d22  ! 324: FsMULd	fsmuld	%f1, %f2, %f38
	.word 0x93902005  ! 325: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982d13  ! 326: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d13, %hpstate
	.word 0x9b682001  ! 327: SDIVX_I	sdivx	%r0, 0x0001, %r13
	.word 0xa190200e  ! 328: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x91d02031  ! 329: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xb7514000  ! 330: RDPR_TBA	rdpr	%tba, %r27
	.word 0x8d90228a  ! 331: WRPR_PSTATE_I	wrpr	%r0, 0x028a, %pstate
	.word 0x83d02035  ! 332: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa3508000  ! 333: RDPR_TSTATE	rdpr	%tstate, %r17
	.word 0xb0fc2001  ! 334: SDIVcc_I	sdivcc 	%r16, 0x0001, %r24
	.word 0x93d02034  ! 335: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xf08008a0  ! 336: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x3a700001  ! 337: BPCC	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902491  ! 339: WRPR_PSTATE_I	wrpr	%r0, 0x0491, %pstate
	.word 0x93902001  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa190200e  ! 341: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 342: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 343: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_18:
	.word 0x20800001  ! 345: BN	bn,a	<label_0x1>
	allclean
	.word 0xa5b54302  ! 344: ALLIGNADDRESS	alignaddr	%r21, %r2, %r18
change_to_randtl_19:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 345: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa1902003  ! 346: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xe4bfe001  ! 347: STDA_I	stda	%r18, [%r31 + 0x0001] %asi
	.word 0xa1902009  ! 348: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x879022fe  ! 349: WRPR_TT_I	wrpr	%r0, 0x02fe, %tt
	.word 0x93902006  ! 350: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xb7504000  ! 351: RDPR_TNPC	rdpr	%tnpc, %r27
	.word 0x87902005  ! 352: WRPR_TT_I	wrpr	%r0, 0x0005, %tt
	.word 0x81982444  ! 353: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0444, %hpstate
	.word 0x81982254  ! 354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0254, %hpstate
	.word 0x91d02033  ! 355: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8f902002  ! 505: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982a89  ! 356: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a89, %hpstate
	.word 0x8f68c006  ! 357: SDIVX_R	sdivx	%r3, %r6, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0x879022cc  ! 359: WRPR_TT_I	wrpr	%r0, 0x02cc, %tt
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 360: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9f802001  ! 362: SIR	sir	0x0001
	.word 0xb4f86001  ! 363: SDIVcc_I	sdivcc 	%r1, 0x0001, %r26
	.word 0x83480000  ! 364: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0x8da0057a  ! 365: FSQRTq	fsqrt	
	.word 0x91d02030  ! 366: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x87902022  ! 367: WRPR_TT_I	wrpr	%r0, 0x0022, %tt
	.word 0x83d02033  ! 368: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x87902207  ! 369: WRPR_TT_I	wrpr	%r0, 0x0207, %tt
	.word 0x87500000  ! 370: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x91d02035  ! 371: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x83a14dd1  ! 372: FdMULq	fdmulq	
	.word 0xa7690004  ! 373: SDIVX_R	sdivx	%r4, %r4, %r19
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 374: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 375: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_20:
	.word 0x22800001  ! 377: BE	be,a	<label_0x1>
	.word 0xf532c011  ! 377: STQF_R	-	%f26, [%r17, %r11]
	normalw
	.word 0x8f458000  ! 376: RD_SOFTINT_REG	rd	%softint, %r7
DS_21:
	.word 0x22800001  ! 378: BE	be,a	<label_0x1>
	.word 0xc9322001  ! 378: STQF_I	-	%f4, [0x0001, %r8]
	normalw
	.word 0xb5458000  ! 377: RD_SOFTINT_REG	rd	%softint, %r26
	.word 0x8d902cc1  ! 378: WRPR_PSTATE_I	wrpr	%r0, 0x0cc1, %pstate
	.word 0x8d802000  ! 379: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_22:
	.word 0x34800001  ! 381: BG	bg,a	<label_0x1>
	pdist %f12, %f30, %f8
	.word 0x87b30301  ! 380: ALLIGNADDRESS	alignaddr	%r12, %r1, %r3
	.word 0x81982cc0  ! 381: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc0, %hpstate
	.word 0x89514000  ! 382: RDPR_TBA	rdpr	%tba, %r4
	.word 0xa46b2001  ! 383: UDIVX_I	udivx 	%r12, 0x0001, %r18
DS_23:
	.word 0x20800001  ! 385: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 384: SAVE_R	save	%r31, %r0, %r31
	.word 0x879023d2  ! 385: WRPR_TT_I	wrpr	%r0, 0x03d2, %tt
	.word 0x8d902e4d  ! 386: WRPR_PSTATE_I	wrpr	%r0, 0x0e4d, %pstate
	.word 0x83d02031  ! 387: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xe47fe001  ! 388: SWAP_I	swap	%r18, [%r31 + 0x0001]
	.word 0x81982819  ! 389: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0819, %hpstate
	.word 0x93902005  ! 390: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d02033  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02030  ! 392: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902000  ! 393: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
change_to_tl1_24:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_25:
	.word 0x34800001  ! 396: BG	bg,a	<label_0x1>
	pdist %f14, %f20, %f28
	.word 0x85b6031b  ! 395: ALLIGNADDRESS	alignaddr	%r24, %r27, %r2
	.word 0x91d02031  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81982d54  ! 397: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d54, %hpstate
	.word 0x81508000  ! 398: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x93902004  ! 399: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8ed3401a  ! 400: UMULcc_R	umulcc 	%r13, %r26, %r7
	.word 0x8d902c12  ! 401: WRPR_PSTATE_I	wrpr	%r0, 0x0c12, %pstate
	.word 0x879023cd  ! 402: WRPR_TT_I	wrpr	%r0, 0x03cd, %tt
	.word 0xa8ab4003  ! 403: ANDNcc_R	andncc 	%r13, %r3, %r20
	.word 0x2c800001  ! 404: BNEG	bneg,a	<label_0x1>
	.word 0xe8cfe010  ! 405: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r20
	.word 0xe8c804a0  ! 406: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r20
	.word 0x984c4008  ! 407: MULX_R	mulx 	%r17, %r8, %r12
	.word 0x87802080  ! 408: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902ec1  ! 409: WRPR_PSTATE_I	wrpr	%r0, 0x0ec1, %pstate
	.word 0x87514000  ! 410: RDPR_TBA	rdpr	%tba, %r3
	.word 0x8d902a0a  ! 411: WRPR_PSTATE_I	wrpr	%r0, 0x0a0a, %pstate
	.word 0x81982009  ! 412: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0009, %hpstate
	.word 0x82858002  ! 413: ADDcc_R	addcc 	%r22, %r2, %r1
	.word 0x8198291e  ! 414: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091e, %hpstate
DS_26:
	.word 0x20800001  ! 416: BN	bn,a	<label_0x1>
	illtrap
	.word 0xb3a00541  ! 416: FSQRTd	fsqrt	
	.word 0xa9a3082d  ! 415: FADDs	fadds	%f12, %f13, %f20
	.word 0x904d401b  ! 416: MULX_R	mulx 	%r21, %r27, %r8
	.word 0xb5504000  ! 417: RDPR_TNPC	rdpr	%tnpc, %r26
	.word 0x93a0054d  ! 418: FSQRTd	fsqrt	
DS_27:
	.word 0x20800001  ! 420: BN	bn,a	<label_0x1>
	.word 0x32800001  ! 420: BNE	bne,a	<label_0x1>
	.word 0xd5164002  ! 420: LDQF_R	-	[%r25, %r2], %f10
	.word 0x97a20835  ! 419: FADDs	fadds	%f8, %f21, %f11
	.word 0x9f802001  ! 420: SIR	sir	0x0001
	.word 0x87902110  ! 421: WRPR_TT_I	wrpr	%r0, 0x0110, %tt
	.word 0xa1902004  ! 422: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8fa0c9e4  ! 423: FDIVq	dis not found

	.word 0xb750c000  ! 424: RDPR_TT	rdpr	%tt, %r27
	.word 0x8d802000  ! 425: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902304  ! 426: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
	.word 0x8682a001  ! 427: ADDcc_I	addcc 	%r10, 0x0001, %r3
	.word 0x9f802001  ! 428: SIR	sir	0x0001
DS_28:
	.word 0x34800001  ! 430: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 429: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 430: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc60fe001  ! 431: LDUB_I	ldub	[%r31 + 0x0001], %r3
	.word 0xc68008a0  ! 432: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x81982d84  ! 433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d84, %hpstate
	.word 0x8d902485  ! 434: WRPR_PSTATE_I	wrpr	%r0, 0x0485, %pstate
	.word 0xc6c004a0  ! 435: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0x9681000b  ! 436: ADDcc_R	addcc 	%r4, %r11, %r11
	.word 0x83d02031  ! 437: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xd61fe001  ! 438: LDD_I	ldd	[%r31 + 0x0001], %r11
	.word 0x8d902a87  ! 439: WRPR_PSTATE_I	wrpr	%r0, 0x0a87, %pstate
	.word 0x8d802000  ! 440: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99902004  ! 441: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x8d902452  ! 442: WRPR_PSTATE_I	wrpr	%r0, 0x0452, %pstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x87902158  ! 444: WRPR_TT_I	wrpr	%r0, 0x0158, %tt
	.word 0x87902312  ! 445: WRPR_TT_I	wrpr	%r0, 0x0312, %tt
DS_29:
	.word 0x34800001  ! 447: BG	bg,a	<label_0x1>
	.word 0xd734a001  ! 447: STQF_I	-	%f11, [0x0001, %r18]
	normalw
	.word 0x83458000  ! 446: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x819823c7  ! 447: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c7, %hpstate
	.word 0x34800001  ! 448: BG	bg,a	<label_0x1>
	.word 0x89504000  ! 449: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x8cfd8018  ! 450: SDIVcc_R	sdivcc 	%r22, %r24, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902334  ! 452: WRPR_TT_I	wrpr	%r0, 0x0334, %tt
	.word 0x9b500000  ! 453: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xdabfc038  ! 454: STDA_R	stda	%r13, [%r31 + %r24] 0x01
	.word 0x8790212e  ! 455: WRPR_TT_I	wrpr	%r0, 0x012e, %tt
	.word 0xa9a1cd28  ! 456: FsMULd	fsmuld	%f7, %f8, %f20
	.word 0x93902001  ! 457: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 458: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d9026d4  ! 459: WRPR_PSTATE_I	wrpr	%r0, 0x06d4, %pstate
	.word 0xa1902007  ! 460: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x906d2001  ! 461: UDIVX_I	udivx 	%r20, 0x0001, %r8
	.word 0x826ce001  ! 462: UDIVX_I	udivx 	%r19, 0x0001, %r1
	.word 0x9751c000  ! 463: RDPR_TL	rdpr	%tl, %r11
	.word 0x8198214f  ! 464: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014f, %hpstate
	.word 0x9f802001  ! 465: SIR	sir	0x0001
	.word 0xb3a209d3  ! 466: FDIVd	fdivd	%f8, %f50, %f56
	.word 0xaa81c002  ! 467: ADDcc_R	addcc 	%r7, %r2, %r21
	.word 0x91d02032  ! 468: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa5504000  ! 469: RDPR_TNPC	rdpr	%tnpc, %r18
	.word 0x99500000  ! 470: RDPR_TPC	<illegal instruction>
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x2e800001  ! 472: BVS	bvs,a	<label_0x1>
	.word 0x89514000  ! 473: RDPR_TBA	rdpr	%tba, %r4
	.word 0x88fb6001  ! 474: SDIVcc_I	sdivcc 	%r13, 0x0001, %r4
	.word 0xc88fe030  ! 475: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r4
	.word 0x819821d9  ! 476: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d9, %hpstate
	.word 0xc89fc020  ! 477: LDDA_R	ldda	[%r31, %r0] 0x01, %r4
	.word 0x93d02030  ! 478: Tcc_I	tne	icc_or_xcc, %r0 + 48
DS_30:
	.word 0x34800001  ! 480: BG	bg,a	<label_0x1>
	.word 0xcf336001  ! 480: STQF_I	-	%f7, [0x0001, %r13]
	normalw
	.word 0x8b458000  ! 479: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x879021f5  ! 480: WRPR_TT_I	wrpr	%r0, 0x01f5, %tt
	.word 0xa1902007  ! 481: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x99540000  ! 482: RDPR_GL	rdpr	%-, %r12
	.word 0x83d02033  ! 483: Tcc_I	te	icc_or_xcc, %r0 + 51
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 484: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x92f96001  ! 485: SDIVcc_I	sdivcc 	%r5, 0x0001, %r9
	.word 0xa5494000  ! 486: RDHPR_HTBA	rdhpr	%htba, %r18
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 487: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 488: SIR	sir	0x0001
	.word 0xe417c000  ! 489: LDUH_R	lduh	[%r31 + %r0], %r18
	.word 0xe4800c20  ! 490: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r18
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 491: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe497e000  ! 492: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0x93902000  ! 493: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_31:
	.word 0x34800001  ! 495: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 494: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02033  ! 495: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9f802001  ! 496: SIR	sir	0x0001
	.word 0x87902364  ! 497: WRPR_TT_I	wrpr	%r0, 0x0364, %tt
	.word 0x91a00560  ! 498: FSQRTq	fsqrt	
	.word 0xb1494000  ! 499: RDHPR_HTBA	rdhpr	%htba, %r24
	.word 0x8d902415  ! 500: WRPR_PSTATE_I	wrpr	%r0, 0x0415, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902005  ! 502: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8790238b  ! 503: WRPR_TT_I	wrpr	%r0, 0x038b, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 504: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_32:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 505: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb24ac008  ! 506: MULX_R	mulx 	%r11, %r8, %r25
	.word 0xa3504000  ! 507: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0xe2dfe000  ! 508: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r17
	.word 0xa2d0a001  ! 509: UMULcc_I	umulcc 	%r2, 0x0001, %r17
	.word 0x87902378  ! 510: WRPR_TT_I	wrpr	%r0, 0x0378, %tt
change_to_tl1_33:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d802000  ! 512: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02031  ! 513: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x91d02030  ! 514: Tcc_I	ta	icc_or_xcc, %r0 + 48
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 515: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 516: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe2c804a0  ! 517: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
	.word 0xa1902007  ! 518: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x904d0007  ! 519: MULX_R	mulx 	%r20, %r7, %r8
	.word 0xd0c00e60  ! 520: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r8
	.word 0x8d902642  ! 521: WRPR_PSTATE_I	wrpr	%r0, 0x0642, %pstate
	.word 0xa1902002  ! 522: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd0bfe001  ! 523: STDA_I	stda	%r8, [%r31 + 0x0001] %asi
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 524: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d9028d1  ! 525: WRPR_PSTATE_I	wrpr	%r0, 0x08d1, %pstate
DS_34:
	.word 0x34800001  ! 527: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 526: SAVE_R	save	%r31, %r0, %r31
	.word 0x95a349bb  ! 527: FDIVs	fdivs	%f13, %f27, %f10
	.word 0xa190200d  ! 528: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd4c804a0  ! 529: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	.word 0xa1902008  ! 530: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd43fc01b  ! 531: STD_R	std	%r10, [%r31 + %r27]
	.word 0x85a509cd  ! 532: FDIVd	fdivd	%f20, %f44, %f2
	.word 0x879021e7  ! 533: WRPR_TT_I	wrpr	%r0, 0x01e7, %tt
	.word 0x879021bf  ! 534: WRPR_TT_I	wrpr	%r0, 0x01bf, %tt
	.word 0x81982e88  ! 535: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e88, %hpstate
	.word 0xc4ffc02d  ! 536: SWAPA_R	swapa	%r2, [%r31 + %r13] 0x01
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc48008a0  ! 539: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x8d902882  ! 540: WRPR_PSTATE_I	wrpr	%r0, 0x0882, %pstate
	.word 0xc4cfe010  ! 541: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r2
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x84c6e001  ! 543: ADDCcc_I	addccc 	%r27, 0x0001, %r2
	.word 0xc5e7c02d  ! 544: CASA_I	casa	[%r31] 0x 1, %r13, %r2
	.word 0x8d902e9c  ! 545: WRPR_PSTATE_I	wrpr	%r0, 0x0e9c, %pstate
	.word 0x99902004  ! 546: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x8d902a46  ! 547: WRPR_PSTATE_I	wrpr	%r0, 0x0a46, %pstate
	.word 0x87902124  ! 548: WRPR_TT_I	wrpr	%r0, 0x0124, %tt
	.word 0x884ac006  ! 549: MULX_R	mulx 	%r11, %r6, %r4
	.word 0x93902005  ! 550: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87802010  ! 551: WRASI_I	wr	%r0, 0x0010, %asi
change_to_randtl_35:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 552: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 553: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902657  ! 554: WRPR_PSTATE_I	wrpr	%r0, 0x0657, %pstate
	.word 0x91d02033  ! 555: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87802004  ! 556: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x879023c6  ! 557: WRPR_TT_I	wrpr	%r0, 0x03c6, %tt
	.word 0xaf696001  ! 558: SDIVX_I	sdivx	%r5, 0x0001, %r23
	.word 0x91d02035  ! 559: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902008  ! 560: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xef3fe001  ! 561: STDF_I	std	%f23, [0x0001, %r31]
	.word 0x96d68006  ! 562: UMULcc_R	umulcc 	%r26, %r6, %r11
	.word 0x91d02035  ! 563: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd6bfe001  ! 564: STDA_I	stda	%r11, [%r31 + 0x0001] %asi
	.word 0x93d02030  ! 565: Tcc_I	tne	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d90265b  ! 567: WRPR_PSTATE_I	wrpr	%r0, 0x065b, %pstate
	.word 0x87504000  ! 568: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x93902003  ! 569: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902000  ! 570: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xad494000  ! 571: RDHPR_HTBA	rdhpr	%htba, %r22
	.word 0x8f902002  ! 552: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982f19  ! 572: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f19, %hpstate
	.word 0xecffc026  ! 573: SWAPA_R	swapa	%r22, [%r31 + %r6] 0x01
DS_36:
	.word 0x32800001  ! 575: BNE	bne,a	<label_0x1>
	allclean
	.word 0x85b0c314  ! 574: ALLIGNADDRESS	alignaddr	%r3, %r20, %r2
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 575: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc4c7e030  ! 576: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 577: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902175  ! 578: WRPR_TT_I	wrpr	%r0, 0x0175, %tt
	.word 0xa1902000  ! 579: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 580: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x89494000  ! 581: RDHPR_HTBA	rdhpr	%htba, %r4
	.word 0x93902000  ! 582: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879020a6  ! 583: WRPR_TT_I	wrpr	%r0, 0x00a6, %tt
DS_37:
	.word 0x32800001  ! 585: BNE	bne,a	<label_0x1>
	pdist %f16, %f22, %f8
	.word 0x81b00311  ! 584: ALLIGNADDRESS	alignaddr	%r0, %r17, %r0
	.word 0x91d02032  ! 585: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902002  ! 586: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x819825cb  ! 587: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cb, %hpstate
	.word 0x83d02035  ! 588: Tcc_I	te	icc_or_xcc, %r0 + 53
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 589: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902304  ! 590: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
	.word 0x87802080  ! 591: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa06ec008  ! 592: UDIVX_R	udivx 	%r27, %r8, %r16
	ta	T_CHANGE_PRIV	! macro
	.word 0x83d02030  ! 594: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x9ba24dcd  ! 595: FdMULq	fdmulq	
	.word 0xa1902002  ! 596: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x84fd4013  ! 597: SDIVcc_R	sdivcc 	%r21, %r19, %r2
	.word 0x8d902215  ! 598: WRPR_PSTATE_I	wrpr	%r0, 0x0215, %pstate
	.word 0x879021b9  ! 599: WRPR_TT_I	wrpr	%r0, 0x01b9, %tt
	.word 0x83d02030  ! 600: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x91d02032  ! 601: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902003  ! 602: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902006  ! 603: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982f51  ! 604: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f51, %hpstate
	.word 0xa2f98006  ! 605: SDIVcc_R	sdivcc 	%r6, %r6, %r17
	.word 0x87902053  ! 606: WRPR_TT_I	wrpr	%r0, 0x0053, %tt
	.word 0x81982b04  ! 607: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b04, %hpstate
	.word 0xe227c006  ! 608: STW_R	stw	%r17, [%r31 + %r6]
	.word 0xb3514000  ! 609: RDPR_TBA	rdpr	%tba, %r25
	.word 0x9b508000  ! 610: RDPR_TSTATE	<illegal instruction>
	.word 0x93d02031  ! 611: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x93902002  ! 612: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8e85400c  ! 613: ADDcc_R	addcc 	%r21, %r12, %r7
	.word 0xa1902006  ! 614: WRPR_GL_I	wrpr	%r0, 0x0006, %-
change_to_randtl_38:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 615: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d802000  ! 616: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_39:
	.word 0x20800001  ! 618: BN	bn,a	<label_0x1>
	allclean
	.word 0x87b3430a  ! 617: ALLIGNADDRESS	alignaddr	%r13, %r10, %r3
	.word 0x8790230c  ! 618: WRPR_TT_I	wrpr	%r0, 0x030c, %tt
	.word 0x806b000c  ! 619: UDIVX_R	udivx 	%r12, %r12, %r0
DS_40:
	.word 0x22800001  ! 621: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 620: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02030  ! 621: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x81982d8f  ! 622: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8f, %hpstate
	.word 0x8885a001  ! 623: ADDcc_I	addcc 	%r22, 0x0001, %r4
	.word 0xafa08d2b  ! 624: FsMULd	fsmuld	%f2, %f42, %f54
	.word 0x9a85e001  ! 625: ADDcc_I	addcc 	%r23, 0x0001, %r13
	.word 0x9ba489a7  ! 626: FDIVs	fdivs	%f18, %f7, %f13
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 627: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 628: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902081  ! 629: WRPR_PSTATE_I	wrpr	%r0, 0x0081, %pstate
	.word 0x97a609ad  ! 630: FDIVs	fdivs	%f24, %f13, %f11
	.word 0x93902001  ! 631: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x819820c1  ! 632: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c1, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87802089  ! 634: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa1a14dd1  ! 635: FdMULq	fdmulq	
	.word 0xa8d34001  ! 636: UMULcc_R	umulcc 	%r13, %r1, %r20
	.word 0x93902003  ! 637: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x30700001  ! 638: BPA	<illegal instruction>
	.word 0xb7a349b1  ! 639: FDIVs	fdivs	%f13, %f17, %f27
	.word 0x80842001  ! 640: ADDcc_I	addcc 	%r16, 0x0001, %r0
	.word 0x8d802000  ! 641: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc08008a0  ! 642: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 643: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982b94  ! 644: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b94, %hpstate
	.word 0x816ae001  ! 645: SDIVX_I	sdivx	%r11, 0x0001, %r0
	.word 0x879023c2  ! 646: WRPR_TT_I	wrpr	%r0, 0x03c2, %tt
	.word 0x81508000  ! 647: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x2a800001  ! 648: BCS	bcs,a	<label_0x1>
	.word 0x87802004  ! 649: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa1902009  ! 650: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x81982bc4  ! 651: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc4, %hpstate
	.word 0x94a88006  ! 652: ANDNcc_R	andncc 	%r2, %r6, %r10
	.word 0xa5a289c8  ! 653: FDIVd	fdivd	%f10, %f8, %f18
	.word 0x93902003  ! 654: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa5540000  ! 655: RDPR_GL	rdpr	%-, %r18
DS_41:
	.word 0x22800001  ! 657: BE	be,a	<label_0x1>
	.word 0x20800001  ! 657: BN	bn,a	<label_0x1>
	.word 0x99a0054c  ! 657: FSQRTd	fsqrt	
	.word 0xa7a48832  ! 656: FADDs	fadds	%f18, %f18, %f19
	.word 0xe67fe001  ! 657: SWAP_I	swap	%r19, [%r31 + 0x0001]
	.word 0xa7a00553  ! 658: FSQRTd	fsqrt	
	.word 0x85508000  ! 659: RDPR_TSTATE	<illegal instruction>
	.word 0xc40fe001  ! 660: LDUB_I	ldub	[%r31 + 0x0001], %r2
	.word 0x8d802000  ! 661: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 662: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902209  ! 663: WRPR_TT_I	wrpr	%r0, 0x0209, %tt
	.word 0x8d902252  ! 664: WRPR_PSTATE_I	wrpr	%r0, 0x0252, %pstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 665: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 666: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa9a01a73  ! 667: FqTOi	fqtoi	
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 668: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xaba249a4  ! 669: FDIVs	fdivs	%f9, %f4, %f21
	.word 0xa1902008  ! 670: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_42:
	.word 0x32800001  ! 672: BNE	bne,a	<label_0x1>
	allclean
	.word 0x97b5c300  ! 671: ALLIGNADDRESS	alignaddr	%r23, %r0, %r11
	.word 0x24700001  ! 672: BPLE	<illegal instruction>
	.word 0x93d02031  ! 673: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x87902186  ! 674: WRPR_TT_I	wrpr	%r0, 0x0186, %tt
	.word 0x36800001  ! 675: BGE	bge,a	<label_0x1>
	.word 0x91d02033  ! 676: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902007  ! 677: WRPR_GL_I	wrpr	%r0, 0x0007, %-
change_to_randtl_43:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 678: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8d802000  ! 679: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f802001  ! 680: SIR	sir	0x0001
	.word 0x879020d0  ! 681: WRPR_TT_I	wrpr	%r0, 0x00d0, %tt
	.word 0x81982c84  ! 682: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c84, %hpstate
	.word 0x819820c3  ! 683: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c3, %hpstate
	.word 0x8790234a  ! 684: WRPR_TT_I	wrpr	%r0, 0x034a, %tt
DS_44:
	.word 0x20800001  ! 686: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 685: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb7540000  ! 687: RDPR_GL	rdpr	%-, %r27
	.word 0x93902000  ! 688: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_NONHPRIV	! macro
change_to_randtl_45:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 690: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x93902004  ! 691: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902e16  ! 692: WRPR_PSTATE_I	wrpr	%r0, 0x0e16, %pstate
	.word 0xf68fe030  ! 693: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r27
	.word 0x99902005  ! 694: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x93902003  ! 695: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xf68008a0  ! 696: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
	.word 0x8d90261e  ! 697: WRPR_PSTATE_I	wrpr	%r0, 0x061e, %pstate
	.word 0x87494000  ! 698: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0xb550c000  ! 699: RDPR_TT	rdpr	%tt, %r26
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902006  ! 701: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902000  ! 702: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa190200d  ! 703: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xf427e001  ! 704: STW_I	stw	%r26, [%r31 + 0x0001]
	.word 0x8d902606  ! 705: WRPR_PSTATE_I	wrpr	%r0, 0x0606, %pstate
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 706: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902278  ! 707: WRPR_TT_I	wrpr	%r0, 0x0278, %tt
	.word 0xb56c8007  ! 708: SDIVX_R	sdivx	%r18, %r7, %r26
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879022ea  ! 710: WRPR_TT_I	wrpr	%r0, 0x02ea, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 711: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 712: SIR	sir	0x0001
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 713: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9024ce  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x04ce, %pstate
	.word 0x87902276  ! 715: WRPR_TT_I	wrpr	%r0, 0x0276, %tt
	.word 0x9a82e001  ! 716: ADDcc_I	addcc 	%r11, 0x0001, %r13
	.word 0xda800c00  ! 717: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r13
	.word 0x8790201b  ! 718: WRPR_TT_I	wrpr	%r0, 0x001b, %tt
	.word 0x9f802001  ! 719: SIR	sir	0x0001
DS_46:
	.word 0x34800001  ! 721: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 720: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d902880  ! 721: WRPR_PSTATE_I	wrpr	%r0, 0x0880, %pstate
	.word 0x93d02031  ! 722: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x91d02033  ! 723: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 724: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9ba00dc2  ! 725: FdMULq	fdmulq	
	.word 0x91d02034  ! 726: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x83d02030  ! 727: Tcc_I	te	icc_or_xcc, %r0 + 48
DS_47:
	.word 0x34800001  ! 729: BG	bg,a	<label_0x1>
	.word 0xed30c00a  ! 729: STQF_R	-	%f22, [%r10, %r3]
	normalw
	.word 0xb3458000  ! 728: RD_SOFTINT_REG	rd	%softint, %r25
	.word 0x89702001  ! 729: POPC_I	popc	0x0001, %r4
	.word 0xa1540000  ! 730: RDPR_GL	rdpr	%-, %r16
	.word 0x93494000  ! 731: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0x87902139  ! 732: WRPR_TT_I	wrpr	%r0, 0x0139, %tt
	.word 0x91508000  ! 733: RDPR_TSTATE	rdpr	%tstate, %r8
	.word 0x9f802001  ! 734: SIR	sir	0x0001
	.word 0xaf540000  ! 735: RDPR_GL	rdpr	%-, %r23
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 736: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 737: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902006  ! 738: WRPR_PSTATE_I	wrpr	%r0, 0x0006, %pstate
	.word 0xee8fe030  ! 739: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r23
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 740: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x96d1c00b  ! 741: UMULcc_R	umulcc 	%r7, %r11, %r11
	.word 0xa1902001  ! 742: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x81982b43  ! 744: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b43, %hpstate
	.word 0x8d902005  ! 745: WRPR_PSTATE_I	wrpr	%r0, 0x0005, %pstate
	.word 0xd67fe001  ! 746: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0x83d02035  ! 747: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d9020d6  ! 748: WRPR_PSTATE_I	wrpr	%r0, 0x00d6, %pstate
	.word 0x2c800001  ! 749: BNEG	bneg,a	<label_0x1>
	.word 0xa1902006  ! 750: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd7e7c02b  ! 752: CASA_I	casa	[%r31] 0x 1, %r11, %r11
	.word 0x8d902088  ! 753: WRPR_PSTATE_I	wrpr	%r0, 0x0088, %pstate
	.word 0x87902039  ! 754: WRPR_TT_I	wrpr	%r0, 0x0039, %tt
	.word 0x87802088  ! 755: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x99a049ab  ! 756: FDIVs	fdivs	%f1, %f11, %f12
	.word 0x8d902acd  ! 757: WRPR_PSTATE_I	wrpr	%r0, 0x0acd, %pstate
	.word 0x87902034  ! 758: WRPR_TT_I	wrpr	%r0, 0x0034, %tt
	.word 0xb06c800a  ! 759: UDIVX_R	udivx 	%r18, %r10, %r24
	.word 0x8d902a89  ! 760: WRPR_PSTATE_I	wrpr	%r0, 0x0a89, %pstate
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 761: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_48:
	.word 0x22800001  ! 763: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 762: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xf03fc00a  ! 763: STD_R	std	%r24, [%r31 + %r10]
	.word 0x8150c000  ! 764: RDPR_TT	rdpr	%tt, %r0
	.word 0x91d02030  ! 765: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xc0800aa0  ! 766: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r0
	.word 0xa190200d  ! 767: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa190200b  ! 768: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8a6b2001  ! 769: UDIVX_I	udivx 	%r12, 0x0001, %r5
	.word 0xca7fe001  ! 770: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x8d902490  ! 771: WRPR_PSTATE_I	wrpr	%r0, 0x0490, %pstate
	.word 0x28800001  ! 772: BLEU	bleu,a	<label_0x1>
	.word 0xca8008a0  ! 773: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8790239c  ! 774: WRPR_TT_I	wrpr	%r0, 0x039c, %tt
	.word 0x86d22001  ! 775: UMULcc_I	umulcc 	%r8, 0x0001, %r3
	.word 0xc737c00a  ! 776: STQF_R	-	%f3, [%r10, %r31]
	.word 0x96d32001  ! 777: UMULcc_I	umulcc 	%r12, 0x0001, %r11
	.word 0x93d02030  ! 778: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x93d02034  ! 779: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8d902202  ! 780: WRPR_PSTATE_I	wrpr	%r0, 0x0202, %pstate
DS_49:
	.word 0x32800001  ! 782: BNE	bne,a	<label_0x1>
	pdist %f22, %f12, %f22
	.word 0x95b6c302  ! 781: ALLIGNADDRESS	alignaddr	%r27, %r2, %r10
	.word 0xb7494000  ! 782: RDHPR_HTBA	rdhpr	%htba, %r27
	.word 0x81982f4b  ! 783: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4b, %hpstate
	.word 0x8198225c  ! 784: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025c, %hpstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 785: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_50:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 786: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x94d88000  ! 787: SMULcc_R	smulcc 	%r2, %r0, %r10
change_to_tl1_51:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xd4dfe000  ! 789: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x93a209a0  ! 790: FDIVs	fdivs	%f8, %f0, %f9
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 792: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd2d804a0  ! 793: LDXA_R	ldxa	[%r0, %r0] 0x25, %r9
	.word 0x91d02033  ! 794: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x89a01a6b  ! 795: FqTOi	fqtoi	
	.word 0xa6fb400c  ! 796: SDIVcc_R	sdivcc 	%r13, %r12, %r19
	.word 0xe6ffc02c  ! 797: SWAPA_R	swapa	%r19, [%r31 + %r12] 0x01
	.word 0x91d02033  ! 798: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe6800bc0  ! 799: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
	.word 0x91d02031  ! 800: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d902802  ! 801: WRPR_PSTATE_I	wrpr	%r0, 0x0802, %pstate
	.word 0x87902323  ! 802: WRPR_TT_I	wrpr	%r0, 0x0323, %tt
	.word 0x8d90220e  ! 803: WRPR_PSTATE_I	wrpr	%r0, 0x020e, %pstate
	.word 0x8d9026dc  ! 804: WRPR_PSTATE_I	wrpr	%r0, 0x06dc, %pstate
	.word 0x87902370  ! 805: WRPR_TT_I	wrpr	%r0, 0x0370, %tt
	.word 0x3c800001  ! 806: BPOS	bpos,a	<label_0x1>
	.word 0x87902141  ! 807: WRPR_TT_I	wrpr	%r0, 0x0141, %tt
	.word 0x91d02035  ! 808: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8c80a001  ! 809: ADDcc_I	addcc 	%r2, 0x0001, %r6
	.word 0xcc8008a0  ! 810: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x819823d5  ! 811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d5, %hpstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 812: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982f99  ! 813: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f99, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 814: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 815: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81508000  ! 816: RDPR_TSTATE	rdpr	%tstate, %r0
	.word 0x9b480000  ! 817: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x8d802004  ! 818: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x99902004  ! 819: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x8d480000  ! 820: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x93902001  ! 821: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902adb  ! 822: WRPR_PSTATE_I	wrpr	%r0, 0x0adb, %pstate
	.word 0xa1902002  ! 823: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x84dec002  ! 824: SMULcc_R	smulcc 	%r27, %r2, %r2
	.word 0x8d9022d0  ! 825: WRPR_PSTATE_I	wrpr	%r0, 0x02d0, %pstate
	.word 0xa84a4009  ! 826: MULX_R	mulx 	%r9, %r9, %r20
	.word 0x8d902ad9  ! 827: WRPR_PSTATE_I	wrpr	%r0, 0x0ad9, %pstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 828: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe82fe001  ! 830: STB_I	stb	%r20, [%r31 + 0x0001]
	.word 0xa190200d  ! 831: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91d02032  ! 832: Tcc_I	ta	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	.word 0x9882a001  ! 834: ADDcc_I	addcc 	%r10, 0x0001, %r12
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90280c  ! 836: WRPR_PSTATE_I	wrpr	%r0, 0x080c, %pstate
	.word 0xa190200d  ! 837: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902007  ! 838: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93a0cd37  ! 839: FsMULd	fsmuld	%f3, %f54, %f40
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 840: Tcc_R	te	icc_or_xcc, %r0 + %r30
change_to_tl1_52:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93504000  ! 842: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0xae856001  ! 843: ADDcc_I	addcc 	%r21, 0x0001, %r23
	.word 0x93902002  ! 844: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_53:
	.word 0x20800001  ! 846: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 845: RESTORE_R	restore	%r31, %r0, %r31
DS_54:
	.word 0x22800001  ! 847: BE	be,a	<label_0x1>
	illtrap
	.word 0xe714000d  ! 847: LDQF_R	-	[%r16, %r13], %f19
	.word 0x91a00821  ! 846: FADDs	fadds	%f0, %f1, %f8
	.word 0xa1902009  ! 847: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd04fe001  ! 848: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0x81982245  ! 849: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0245, %hpstate
	.word 0x819821df  ! 850: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01df, %hpstate
	.word 0xa190200e  ! 851: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xd137e001  ! 852: STQF_I	-	%f8, [0x0001, %r31]
	.word 0x93902004  ! 853: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d802004  ! 854: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902003  ! 855: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902000  ! 856: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x83d02033  ! 857: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x816ae001  ! 858: SDIVX_I	sdivx	%r11, 0x0001, %r0
	.word 0xc07fe001  ! 859: SWAP_I	swap	%r0, [%r31 + 0x0001]
	.word 0xa1902005  ! 860: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_55:
	.word 0x22800001  ! 862: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 861: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d9028d4  ! 862: WRPR_PSTATE_I	wrpr	%r0, 0x08d4, %pstate
	.word 0xa1902003  ! 863: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xc1e7c021  ! 864: CASA_I	casa	[%r31] 0x 1, %r1, %r0
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 865: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819826c9  ! 866: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c9, %hpstate
	.word 0xa5a01a6d  ! 867: FqTOi	fqtoi	
	.word 0x95a149e6  ! 868: FDIVq	dis not found

	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 869: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 870: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x91d02035  ! 871: Tcc_I	ta	icc_or_xcc, %r0 + 53
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 872: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x85a18d29  ! 873: FsMULd	fsmuld	%f6, %f40, %f2
	.word 0xc47fe001  ! 874: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0x9afe4000  ! 875: SDIVcc_R	sdivcc 	%r25, %r0, %r13
	.word 0x99902002  ! 876: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xdb37e001  ! 877: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x93902007  ! 878: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d9028ce  ! 879: WRPR_PSTATE_I	wrpr	%r0, 0x08ce, %pstate
	.word 0x87902294  ! 880: WRPR_TT_I	wrpr	%r0, 0x0294, %tt
	.word 0x8d9026c1  ! 881: WRPR_PSTATE_I	wrpr	%r0, 0x06c1, %pstate
	.word 0x93902001  ! 882: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02033  ! 883: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xda7fe001  ! 884: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x93d02034  ! 885: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xdb17c000  ! 886: LDQF_R	-	[%r31, %r0], %f13
	.word 0x93902000  ! 887: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x3e700001  ! 888: BPVC	<illegal instruction>
	.word 0x8d90280e  ! 889: WRPR_PSTATE_I	wrpr	%r0, 0x080e, %pstate
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 890: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 891: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902001  ! 892: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xda8fe000  ! 893: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r13
	.word 0x879020bf  ! 894: WRPR_TT_I	wrpr	%r0, 0x00bf, %tt
DS_56:
	.word 0x32800001  ! 896: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xd712c013  ! 896: LDQF_R	-	[%r11, %r19], %f11
	.word 0x83a1c82c  ! 895: FADDs	fadds	%f7, %f12, %f1
	.word 0x9f802001  ! 896: SIR	sir	0x0001
	.word 0x879021df  ! 897: WRPR_TT_I	wrpr	%r0, 0x01df, %tt
	.word 0x93d02030  ! 898: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xc327c00c  ! 899: STF_R	st	%f1, [%r12, %r31]
	.word 0xc28008a0  ! 900: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xa190200b  ! 901: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02035  ! 904: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902cd1  ! 905: WRPR_PSTATE_I	wrpr	%r0, 0x0cd1, %pstate
	.word 0x93902000  ! 906: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982548  ! 907: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0548, %hpstate
	.word 0x8fa0056b  ! 908: FSQRTq	fsqrt	
	.word 0x87902278  ! 909: WRPR_TT_I	wrpr	%r0, 0x0278, %tt
	.word 0x91d02035  ! 910: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9f802001  ! 911: SIR	sir	0x0001
	.word 0x90dac010  ! 912: SMULcc_R	smulcc 	%r11, %r16, %r8
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 913: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 914: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 915: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 916: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x9f802001  ! 917: SIR	sir	0x0001
	.word 0x91d02033  ! 918: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81982291  ! 919: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0291, %hpstate
	.word 0x93902000  ! 920: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xb7508000  ! 921: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x819823db  ! 922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03db, %hpstate
	.word 0xb7702001  ! 923: POPC_I	popc	0x0001, %r27
change_to_tl1_57:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xf69004a0  ! 925: LDUHA_R	lduha	[%r0, %r0] 0x25, %r27
	.word 0x819822dd  ! 926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02dd, %hpstate
	.word 0x84ae4003  ! 927: ANDNcc_R	andncc 	%r25, %r3, %r2
	.word 0x91d02033  ! 928: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8790202c  ! 929: WRPR_TT_I	wrpr	%r0, 0x002c, %tt
	.word 0x81982cd5  ! 930: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd5, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 931: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 932: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8cd4c008  ! 933: UMULcc_R	umulcc 	%r19, %r8, %r6
	.word 0xa190200a  ! 934: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87902350  ! 935: WRPR_TT_I	wrpr	%r0, 0x0350, %tt
	.word 0x879023ec  ! 936: WRPR_TT_I	wrpr	%r0, 0x03ec, %tt
	.word 0x86858004  ! 937: ADDcc_R	addcc 	%r22, %r4, %r3
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 938: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198261d  ! 939: WRHPR_HPSTATE_I	wrhpr	%r0, 0x061d, %hpstate
	.word 0x86822001  ! 940: ADDcc_I	addcc 	%r8, 0x0001, %r3
	.word 0x95a009c2  ! 941: FDIVd	fdivd	%f0, %f2, %f10
	.word 0x8790212f  ! 942: WRPR_TT_I	wrpr	%r0, 0x012f, %tt
	.word 0x879021e0  ! 943: WRPR_TT_I	wrpr	%r0, 0x01e0, %tt
	.word 0xd497e030  ! 944: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
DS_58:
	.word 0x32800001  ! 946: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 945: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 946: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x86c5e001  ! 947: ADDCcc_I	addccc 	%r23, 0x0001, %r3
	.word 0x91d02033  ! 948: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902e87  ! 949: WRPR_PSTATE_I	wrpr	%r0, 0x0e87, %pstate
	.word 0xc69fc020  ! 950: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
	.word 0x8198220f  ! 951: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020f, %hpstate
	.word 0xa190200c  ! 952: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8ba109a7  ! 953: FDIVs	fdivs	%f4, %f7, %f5
	.word 0x8d902e93  ! 954: WRPR_PSTATE_I	wrpr	%r0, 0x0e93, %pstate
	.word 0x93902000  ! 955: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 957: SIR	sir	0x0001
	.word 0x81982a97  ! 958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a97, %hpstate
	.word 0x986aa001  ! 959: UDIVX_I	udivx 	%r10, 0x0001, %r12
	.word 0xd927e001  ! 960: STF_I	st	%f12, [0x0001, %r31]
	.word 0xa190200c  ! 961: WRPR_GL_I	wrpr	%r0, 0x000c, %-
DS_59:
	.word 0x32800001  ! 963: BNE	bne,a	<label_0x1>
	.word 0xeb362001  ! 963: STQF_I	-	%f21, [0x0001, %r24]
	normalw
	.word 0x83458000  ! 962: RD_SOFTINT_REG	rd	%softint, %r1
change_to_randtl_60:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 963: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x81982643  ! 964: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0643, %hpstate
	.word 0x93902003  ! 965: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc28008a0  ! 966: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
DS_61:
	.word 0x34800001  ! 968: BG	bg,a	<label_0x1>
	.word 0x32800001  ! 968: BNE	bne,a	<label_0x1>
	.word 0xf5144003  ! 968: LDQF_R	-	[%r17, %r3], %f26
	.word 0x89a18826  ! 967: FADDs	fadds	%f6, %f6, %f4
	.word 0x81982a86  ! 968: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a86, %hpstate
change_to_randtl_62:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 969: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x879022df  ! 970: WRPR_TT_I	wrpr	%r0, 0x02df, %tt
	.word 0xa5504000  ! 971: RDPR_TNPC	rdpr	%tnpc, %r18
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 972: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x88818003  ! 973: ADDcc_R	addcc 	%r6, %r3, %r4
	.word 0x93902007  ! 974: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1902008  ! 975: WRPR_GL_I	wrpr	%r0, 0x0008, %-
change_to_tl1_63:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8198235a  ! 977: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035a, %hpstate
	.word 0x8790208c  ! 978: WRPR_TT_I	wrpr	%r0, 0x008c, %tt
	.word 0x81982d54  ! 979: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d54, %hpstate
	.word 0xc8900e60  ! 980: LDUHA_R	lduha	[%r0, %r0] 0x73, %r4
	.word 0x8d902c0d  ! 981: WRPR_PSTATE_I	wrpr	%r0, 0x0c0d, %pstate
	.word 0x85a0cd21  ! 982: FsMULd	fsmuld	%f3, %f32, %f2
	.word 0x93a24d38  ! 983: FsMULd	fsmuld	%f9, %f24, %f40
	.word 0xd28008a0  ! 984: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x9f802001  ! 985: SIR	sir	0x0001
	.word 0xa151c000  ! 986: RDPR_TL	rdpr	%tl, %r16
	.word 0x87902376  ! 987: WRPR_TT_I	wrpr	%r0, 0x0376, %tt
	.word 0x8d9020d6  ! 988: WRPR_PSTATE_I	wrpr	%r0, 0x00d6, %pstate
	.word 0x93902004  ! 989: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x95b40fe7  ! 990: FONES	fones	%f10
	.word 0xd49fc020  ! 991: LDDA_R	ldda	[%r31, %r0] 0x01, %r10
	.word 0x93d02034  ! 992: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8750c000  ! 993: RDPR_TT	rdpr	%tt, %r3
	.word 0x879021b4  ! 994: WRPR_TT_I	wrpr	%r0, 0x01b4, %tt
	.word 0x89694002  ! 995: SDIVX_R	sdivx	%r5, %r2, %r4
	.word 0x2c800001  ! 996: BNEG	bneg,a	<label_0x1>
	.word 0xc8c004a0  ! 997: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r4
change_to_tl1_64:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d90289c  ! 999: WRPR_PSTATE_I	wrpr	%r0, 0x089c, %pstate
	.word 0x91d02030  ! 1000: Tcc_I	ta	icc_or_xcc, %r0 + 48
DS_65:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 1001: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x81b14fe0  ! 1002: FONES	fones	%f0
	.word 0x86d1e001  ! 1003: UMULcc_I	umulcc 	%r7, 0x0001, %r3
	.word 0x81982907  ! 1004: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0907, %hpstate
	.word 0xc627e001  ! 1005: STW_I	stw	%r3, [%r31 + 0x0001]
	.word 0x879021ec  ! 1006: WRPR_TT_I	wrpr	%r0, 0x01ec, %tt
	.word 0x91d02032  ! 1007: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93494000  ! 1008: RDHPR_HTBA	rdhpr	%htba, %r9
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xd27fe001  ! 1010: SWAP_I	swap	%r9, [%r31 + 0x0001]
	.word 0xd28008a0  ! 1011: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xa1902005  ! 1012: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d902203  ! 1013: WRPR_PSTATE_I	wrpr	%r0, 0x0203, %pstate
	.word 0xd3e7c020  ! 1014: CASA_I	casa	[%r31] 0x 1, %r0, %r9
	.word 0x879022bb  ! 1015: WRPR_TT_I	wrpr	%r0, 0x02bb, %tt
	.word 0x91d02033  ! 1016: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x819827c5  ! 1017: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c5, %hpstate
	.word 0x9f802001  ! 1018: SIR	sir	0x0001
	.word 0xb6d52001  ! 1019: UMULcc_I	umulcc 	%r20, 0x0001, %r27
	.word 0xaed36001  ! 1020: UMULcc_I	umulcc 	%r13, 0x0001, %r23
	.word 0xee8008a0  ! 1021: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
DS_66:
	.word 0x22800001  ! 1023: BE	be,a	<label_0x1>
	.word 0xd5304011  ! 1023: STQF_R	-	%f10, [%r17, %r1]
	normalw
	.word 0xa7458000  ! 1022: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0x83b0cfec  ! 1023: FONES	fones	%f1
	.word 0x9885000d  ! 1024: ADDcc_R	addcc 	%r20, %r13, %r12
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1025: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982298  ! 1026: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0298, %hpstate
	.word 0xd8c804a0  ! 1027: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0x8d902e84  ! 1028: WRPR_PSTATE_I	wrpr	%r0, 0x0e84, %pstate
	.word 0x9f802001  ! 1029: SIR	sir	0x0001
	.word 0x85500000  ! 1030: RDPR_TPC	rdpr	%tpc, %r2
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1031: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2c800001  ! 1032: BNEG	bneg,a	<label_0x1>
	.word 0x819824cf  ! 1033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cf, %hpstate
	.word 0x8d90221c  ! 1034: WRPR_PSTATE_I	wrpr	%r0, 0x021c, %pstate
	.word 0xad6de001  ! 1035: SDIVX_I	sdivx	%r23, 0x0001, %r22
	.word 0xec8008a0  ! 1036: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1037: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790209c  ! 1038: WRPR_TT_I	wrpr	%r0, 0x009c, %tt
	.word 0x93902000  ! 1039: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa190200f  ! 1040: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d902e51  ! 1041: WRPR_PSTATE_I	wrpr	%r0, 0x0e51, %pstate
	.word 0xec8008a0  ! 1042: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0xa4fdc000  ! 1043: SDIVcc_R	sdivcc 	%r23, %r0, %r18
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1044: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x89480000  ! 1045: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1046: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87a24d2d  ! 1047: FsMULd	fsmuld	%f9, %f44, %f34
	.word 0x83d02031  ! 1048: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xc6c80e40  ! 1049: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r3
	.word 0x8d802000  ! 1050: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90289a  ! 1051: WRPR_PSTATE_I	wrpr	%r0, 0x089a, %pstate
	.word 0xa190200d  ! 1052: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x94f96001  ! 1053: SDIVcc_I	sdivcc 	%r5, 0x0001, %r10
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1054: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd4d80e40  ! 1055: LDXA_R	ldxa	[%r0, %r0] 0x72, %r10
	.word 0x879023cc  ! 1056: WRPR_TT_I	wrpr	%r0, 0x03cc, %tt
	.word 0x2c700001  ! 1057: BPNEG	<illegal instruction>
DS_67:
	.word 0x22800001  ! 1059: BE	be,a	<label_0x1>
	.word 0xd732a001  ! 1059: STQF_I	-	%f11, [0x0001, %r10]
	normalw
	.word 0xa3458000  ! 1058: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x81982546  ! 1059: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0546, %hpstate
	.word 0x87a000cb  ! 1060: FNEGd	fnegd	%f42, %f34
	.word 0xa9a000da  ! 1061: FNEGd	fnegd	%f26, %f20
	.word 0x99902005  ! 1062: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xa1902002  ! 1063: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x879021f7  ! 1064: WRPR_TT_I	wrpr	%r0, 0x01f7, %tt
	.word 0x964b0011  ! 1065: MULX_R	mulx 	%r12, %r17, %r11
	.word 0x8d902e58  ! 1066: WRPR_PSTATE_I	wrpr	%r0, 0x0e58, %pstate
	.word 0x91d02031  ! 1067: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x83d02035  ! 1068: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8d9022dc  ! 1069: WRPR_PSTATE_I	wrpr	%r0, 0x02dc, %pstate
	.word 0x93d02035  ! 1070: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x81982a55  ! 1071: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a55, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1072: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 1073: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d90208a  ! 1074: WRPR_PSTATE_I	wrpr	%r0, 0x008a, %pstate
	.word 0xa3514000  ! 1075: RDPR_TBA	rdpr	%tba, %r17
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1077: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 1078: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xe21fe001  ! 1079: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0x81982cd8  ! 1080: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd8, %hpstate
	.word 0x8d702001  ! 1081: POPC_I	popc	0x0001, %r6
	.word 0x82d56001  ! 1082: UMULcc_I	umulcc 	%r21, 0x0001, %r1
	.word 0x84d1c012  ! 1083: UMULcc_R	umulcc 	%r7, %r18, %r2
	.word 0x98d4e001  ! 1084: UMULcc_I	umulcc 	%r19, 0x0001, %r12
	.word 0xab500000  ! 1085: RDPR_TPC	rdpr	%tpc, %r21
	.word 0xebe7c032  ! 1086: CASA_I	casa	[%r31] 0x 1, %r18, %r21
	.word 0xa3a1c9f5  ! 1087: FDIVq	dis not found

	.word 0x9f802001  ! 1088: SIR	sir	0x0001
	ta	T_CHANGE_PRIV	! macro
	.word 0xe2800a80  ! 1090: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r17
	.word 0x879021a6  ! 1091: WRPR_TT_I	wrpr	%r0, 0x01a6, %tt
	.word 0x85480000  ! 1092: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0xb5514000  ! 1093: RDPR_TBA	rdpr	%tba, %r26
	.word 0x3c700001  ! 1094: BPPOS	<illegal instruction>
	.word 0xaf68c00a  ! 1095: SDIVX_R	sdivx	%r3, %r10, %r23
	.word 0x91d02030  ! 1096: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8790205c  ! 1097: WRPR_TT_I	wrpr	%r0, 0x005c, %tt
	.word 0x93902000  ! 1098: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1902006  ! 1100: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902001  ! 1101: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x89504000  ! 1102: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x8c836001  ! 1103: ADDcc_I	addcc 	%r13, 0x0001, %r6
DS_68:
	.word 0x20800001  ! 1105: BN	bn,a	<label_0x1>
	illtrap
	.word 0xada0055b  ! 1105: FSQRTd	fsqrt	
	.word 0xa3a34827  ! 1104: FADDs	fadds	%f13, %f7, %f17
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1105: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 1106: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0xa190200f  ! 1108: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa950c000  ! 1109: RDPR_TT	rdpr	%tt, %r20
	.word 0x9ba08d2c  ! 1110: FsMULd	fsmuld	%f2, %f12, %f44
	.word 0x8d902642  ! 1111: WRPR_PSTATE_I	wrpr	%r0, 0x0642, %pstate
	.word 0xda1fc000  ! 1112: LDD_R	ldd	[%r31 + %r0], %r13
	.word 0x87a34dd3  ! 1113: FdMULq	fdmulq	
	.word 0xb7a01a6b  ! 1114: FqTOi	fqtoi	
	.word 0x93d02035  ! 1115: Tcc_I	tne	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0x95514000  ! 1117: RDPR_TBA	rdpr	%tba, %r10
	.word 0x93902001  ! 1118: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd48fe030  ! 1119: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0x93902003  ! 1120: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa1902004  ! 1121: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d90200f  ! 1122: WRPR_PSTATE_I	wrpr	%r0, 0x000f, %pstate
	.word 0xd41fe001  ! 1123: LDD_I	ldd	[%r31 + 0x0001], %r10
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1124: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200c  ! 1125: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa350c000  ! 1126: RDPR_TT	rdpr	%tt, %r17
	.word 0x87902061  ! 1127: WRPR_TT_I	wrpr	%r0, 0x0061, %tt
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93902007  ! 1129: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902ec1  ! 1130: WRPR_PSTATE_I	wrpr	%r0, 0x0ec1, %pstate
	.word 0x97702001  ! 1131: POPC_I	popc	0x0001, %r11
DS_69:
	.word 0x34800001  ! 1133: BG	bg,a	<label_0x1>
	.word 0xdb30e001  ! 1133: STQF_I	-	%f13, [0x0001, %r3]
	normalw
	.word 0x81458000  ! 1132: RD_SOFTINT_REG	stbar
	.word 0xb1508000  ! 1133: RDPR_TSTATE	rdpr	%tstate, %r24
	.word 0x879023e3  ! 1134: WRPR_TT_I	wrpr	%r0, 0x03e3, %tt
	.word 0x97a04d2d  ! 1135: FsMULd	fsmuld	%f1, %f44, %f42
	.word 0x81982f8c  ! 1136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8c, %hpstate
	.word 0x879020a4  ! 1137: WRPR_TT_I	wrpr	%r0, 0x00a4, %tt
	.word 0x8d902209  ! 1138: WRPR_PSTATE_I	wrpr	%r0, 0x0209, %pstate
	.word 0xa2f8a001  ! 1139: SDIVcc_I	sdivcc 	%r2, 0x0001, %r17
	.word 0xe24fe001  ! 1140: LDSB_I	ldsb	[%r31 + 0x0001], %r17
	.word 0x91d02033  ! 1141: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe237e001  ! 1142: STH_I	sth	%r17, [%r31 + 0x0001]
	.word 0xa3480000  ! 1143: RDHPR_HPSTATE	rdhpr	%hpstate, %r17
	.word 0xe21fc000  ! 1144: LDD_R	ldd	[%r31 + %r0], %r17
	.word 0xe297e000  ! 1145: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	.word 0xe397e001  ! 1146: LDQFA_I	-	[%r31, 0x0001], %f17
	.word 0x24800001  ! 1147: BLE	ble,a	<label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1148: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902286  ! 1149: WRPR_PSTATE_I	wrpr	%r0, 0x0286, %pstate
	.word 0x87902264  ! 1150: WRPR_TT_I	wrpr	%r0, 0x0264, %tt
	.word 0x99480000  ! 1151: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1152: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x82f9a001  ! 1153: SDIVcc_I	sdivcc 	%r6, 0x0001, %r1
	.word 0x81480000  ! 1154: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0x91d02035  ! 1155: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_70:
	.word 0x22800001  ! 1157: BE	be,a	<label_0x1>
	.word 0xcf334006  ! 1157: STQF_R	-	%f7, [%r6, %r13]
	normalw
	.word 0x9b458000  ! 1156: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0x85540000  ! 1157: RDPR_GL	rdpr	%-, %r2
DS_71:
	.word 0x22800001  ! 1159: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1159: BN	bn,a	<label_0x1>
	.word 0x8ba0054c  ! 1159: FSQRTd	fsqrt	
	.word 0x95a1482a  ! 1158: FADDs	fadds	%f5, %f10, %f10
	.word 0x876ca001  ! 1159: SDIVX_I	sdivx	%r18, 0x0001, %r3
	ta	T_CHANGE_PRIV	! macro
	.word 0xc607c000  ! 1161: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0x856aa001  ! 1162: SDIVX_I	sdivx	%r10, 0x0001, %r2
	.word 0xc47fe001  ! 1163: SWAP_I	swap	%r2, [%r31 + 0x0001]
	ta	T_CHANGE_PRIV	! macro
	.word 0x8790206b  ! 1165: WRPR_TT_I	wrpr	%r0, 0x006b, %tt
	.word 0x8d902c9a  ! 1166: WRPR_PSTATE_I	wrpr	%r0, 0x0c9a, %pstate
	.word 0x93902000  ! 1167: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879020a9  ! 1168: WRPR_TT_I	wrpr	%r0, 0x00a9, %tt
	.word 0x8d802000  ! 1169: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa06a8012  ! 1170: UDIVX_R	udivx 	%r10, %r18, %r16
	.word 0xb7500000  ! 1171: RDPR_TPC	rdpr	%tpc, %r27
	.word 0xf6bfc032  ! 1172: STDA_R	stda	%r27, [%r31 + %r18] 0x01
	.word 0x8790214a  ! 1173: WRPR_TT_I	wrpr	%r0, 0x014a, %tt
	.word 0xa190200b  ! 1174: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xb5508000  ! 1175: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x93902002  ! 1176: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x83d02032  ! 1177: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x83d02035  ! 1178: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x91d02033  ! 1179: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xf4c004a0  ! 1180: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r26
	.word 0x93902007  ! 1181: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
change_to_randtl_72:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1182: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x879021b7  ! 1183: WRPR_TT_I	wrpr	%r0, 0x01b7, %tt
change_to_tl1_73:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9751c000  ! 1185: RDPR_TL	rdpr	%tl, %r11
	.word 0x8790231c  ! 1186: WRPR_TT_I	wrpr	%r0, 0x031c, %tt
	.word 0x8d902e97  ! 1187: WRPR_PSTATE_I	wrpr	%r0, 0x0e97, %pstate
	.word 0x22700001  ! 1188: BPE	<illegal instruction>
	.word 0x8d902a4c  ! 1189: WRPR_PSTATE_I	wrpr	%r0, 0x0a4c, %pstate
DS_74:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1190: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xb3500000  ! 1191: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x91d02033  ! 1192: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87902339  ! 1193: WRPR_TT_I	wrpr	%r0, 0x0339, %tt
	.word 0xf2c7e000  ! 1194: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r25
	.word 0x38800001  ! 1195: BGU	bgu,a	<label_0x1>
	.word 0x8198214a  ! 1196: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014a, %hpstate
	.word 0x97a489ab  ! 1197: FDIVs	fdivs	%f18, %f11, %f11
	.word 0xd67fe001  ! 1198: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0xd6ffc02b  ! 1199: SWAPA_R	swapa	%r11, [%r31 + %r11] 0x01
	.word 0xa1902007  ! 1200: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd65fe001  ! 1201: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0x81982a4a  ! 1202: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4a, %hpstate
change_to_randtl_75:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1203: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x38800001  ! 1204: BGU	bgu,a	<label_0x1>
	.word 0x9f802001  ! 1205: SIR	sir	0x0001
DS_76:
	.word 0x20800001  ! 1207: BN	bn,a	<label_0x1>
	illtrap
	.word 0xb1a00553  ! 1207: FSQRTd	fsqrt	
	.word 0x8fa4c827  ! 1206: FADDs	fadds	%f19, %f7, %f7
	.word 0x91d02033  ! 1207: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8f902002  ! 552: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
DS_77:
	.word 0x34800001  ! 1210: BG	bg,a	<label_0x1>
	.word 0xed306001  ! 1210: STQF_I	-	%f22, [0x0001, %r1]
	normalw
	.word 0x93458000  ! 1209: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x99514000  ! 1210: RDPR_TBA	rdpr	%tba, %r12
	.word 0x8eddc00a  ! 1211: SMULcc_R	smulcc 	%r23, %r10, %r7
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1212: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200d  ! 1213: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xced80e60  ! 1214: LDXA_R	ldxa	[%r0, %r0] 0x73, %r7
	ta	T_CHANGE_PRIV	! macro
	.word 0x85480000  ! 1216: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0x82488003  ! 1217: MULX_R	mulx 	%r2, %r3, %r1
change_to_randtl_78:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1218: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xb480a001  ! 1219: ADDcc_I	addcc 	%r2, 0x0001, %r26
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1220: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99a1cdc2  ! 1221: FdMULq	fdmulq	
	.word 0x9b500000  ! 1222: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xdac7e010  ! 1223: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r13
	.word 0xda8fe030  ! 1224: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xdad00e60  ! 1226: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r13
	.word 0xa2816001  ! 1227: ADDcc_I	addcc 	%r5, 0x0001, %r17
	.word 0xa8806001  ! 1228: ADDcc_I	addcc 	%r1, 0x0001, %r20
change_to_tl1_79:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1230: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x34700001  ! 1231: BPG	<illegal instruction>
	.word 0x91d02035  ! 1232: Tcc_I	ta	icc_or_xcc, %r0 + 53
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1233: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90268b  ! 1234: WRPR_PSTATE_I	wrpr	%r0, 0x068b, %pstate
	.word 0x87802010  ! 1235: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8790223a  ! 1236: WRPR_TT_I	wrpr	%r0, 0x023a, %tt
	.word 0x83d02032  ! 1237: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x81494000  ! 1238: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0x93902003  ! 1239: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x819829cc  ! 1240: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cc, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1241: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb1702001  ! 1242: POPC_I	popc	0x0001, %r24
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1243: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a08  ! 1244: WRPR_PSTATE_I	wrpr	%r0, 0x0a08, %pstate
change_to_randtl_80:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 1245: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x81494000  ! 1246: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0xc02fe001  ! 1247: STB_I	stb	%r0, [%r31 + 0x0001]
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1248: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xafa6c9a8  ! 1250: FDIVs	fdivs	%f27, %f8, %f23
	.word 0x87902351  ! 1251: WRPR_TT_I	wrpr	%r0, 0x0351, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x8198234d  ! 1253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034d, %hpstate
	.word 0x91d02033  ! 1254: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902006  ! 1255: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x81982cd3  ! 1256: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd3, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1257: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879020e8  ! 1258: WRPR_TT_I	wrpr	%r0, 0x00e8, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xeeffc028  ! 1260: SWAPA_R	swapa	%r23, [%r31 + %r8] 0x01
	.word 0x84ac0005  ! 1261: ANDNcc_R	andncc 	%r16, %r5, %r2
	.word 0x96fac006  ! 1262: SDIVcc_R	sdivcc 	%r11, %r6, %r11
	.word 0x956aa001  ! 1263: SDIVX_I	sdivx	%r10, 0x0001, %r10
	.word 0x8d802004  ! 1264: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd5e7c026  ! 1265: CASA_I	casa	[%r31] 0x 1, %r6, %r10
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1266: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90281d  ! 1267: WRPR_PSTATE_I	wrpr	%r0, 0x081d, %pstate
	.word 0x99a01a6c  ! 1268: FqTOi	fqtoi	
	.word 0x83504000  ! 1269: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0xa550c000  ! 1270: RDPR_TT	rdpr	%tt, %r18
	.word 0xe4900e60  ! 1271: LDUHA_R	lduha	[%r0, %r0] 0x73, %r18
change_to_tl1_81:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xb1540000  ! 1273: RDPR_GL	<illegal instruction>
	.word 0xa3508000  ! 1274: RDPR_TSTATE	<illegal instruction>
	.word 0x8da01a76  ! 1275: FqTOi	fqtoi	
	.word 0x8d802004  ! 1276: WRFPRS_I	wr	%r0, 0x0004, %fprs
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1277: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 1278: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xccffc036  ! 1279: SWAPA_R	swapa	%r6, [%r31 + %r22] 0x01
	.word 0xccc7e030  ! 1280: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	.word 0x81982f97  ! 1281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f97, %hpstate
	.word 0x8d902847  ! 1282: WRPR_PSTATE_I	wrpr	%r0, 0x0847, %pstate
	.word 0xcc27e001  ! 1283: STW_I	stw	%r6, [%r31 + 0x0001]
	.word 0x8da0056a  ! 1284: FSQRTq	fsqrt	
	.word 0x36700001  ! 1285: BPGE	<illegal instruction>
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1286: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d90229d  ! 1287: WRPR_PSTATE_I	wrpr	%r0, 0x029d, %pstate
	.word 0x8790214f  ! 1288: WRPR_TT_I	wrpr	%r0, 0x014f, %tt
	.word 0xcc2fc00a  ! 1289: STB_R	stb	%r6, [%r31 + %r10]
	.word 0x8790227b  ! 1290: WRPR_TT_I	wrpr	%r0, 0x027b, %tt
	.word 0xcd17c000  ! 1291: LDQF_R	-	[%r31, %r0], %f6
	.word 0x93a2cd24  ! 1292: FsMULd	fsmuld	%f11, %f4, %f40
	.word 0xa16dc019  ! 1293: SDIVX_R	sdivx	%r23, %r25, %r16
	.word 0x93902000  ! 1294: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02032  ! 1295: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xaf514000  ! 1296: RDPR_TBA	rdpr	%tba, %r23
	.word 0xb3a000da  ! 1297: FNEGd	fnegd	%f26, %f56
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8198255f  ! 1299: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055f, %hpstate
	.word 0x93902003  ! 1300: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902801  ! 1301: WRPR_PSTATE_I	wrpr	%r0, 0x0801, %pstate
	.word 0x83a54d22  ! 1302: FsMULd	fsmuld	%f21, %f2, %f32
	.word 0x93d02033  ! 1303: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d902ed3  ! 1304: WRPR_PSTATE_I	wrpr	%r0, 0x0ed3, %pstate
	.word 0xa1902001  ! 1305: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93902002  ! 1306: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_82:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1307: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xc28fe020  ! 1308: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r1
	.word 0x8198294d  ! 1309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094d, %hpstate
	.word 0xa1902004  ! 1310: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x99494000  ! 1311: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0xd87fe001  ! 1312: SWAP_I	swap	%r12, [%r31 + 0x0001]
	.word 0x87802004  ! 1313: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8fa00572  ! 1314: FSQRTq	fsqrt	
	.word 0x9f802001  ! 1315: SIR	sir	0x0001
	.word 0xce5fc000  ! 1316: LDX_R	ldx	[%r31 + %r0], %r7
	.word 0x8d902a08  ! 1317: WRPR_PSTATE_I	wrpr	%r0, 0x0a08, %pstate
	.word 0xa1902009  ! 1318: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1319: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902008  ! 1320: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_83:
	.word 0x32800001  ! 1322: BNE	bne,a	<label_0x1>
	pdist %f2, %f30, %f20
	.word 0x99b34307  ! 1321: ALLIGNADDRESS	alignaddr	%r13, %r7, %r12
	.word 0x926d2001  ! 1322: UDIVX_I	udivx 	%r20, 0x0001, %r9
	.word 0x81982889  ! 1323: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0889, %hpstate
	.word 0x8d90289a  ! 1324: WRPR_PSTATE_I	wrpr	%r0, 0x089a, %pstate
	.word 0x93902006  ! 1325: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_84:
	.word 0x22800001  ! 1327: BE	be,a	<label_0x1>
	allclean
	.word 0xadb48314  ! 1326: ALLIGNADDRESS	alignaddr	%r18, %r20, %r22
	.word 0x8198258a  ! 1327: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058a, %hpstate
	.word 0xa1902001  ! 1328: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa1902002  ! 1329: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d902086  ! 1330: WRPR_PSTATE_I	wrpr	%r0, 0x0086, %pstate
	.word 0xb4da000b  ! 1331: SMULcc_R	smulcc 	%r8, %r11, %r26
	.word 0x2a800001  ! 1332: BCS	bcs,a	<label_0x1>
	.word 0xf5e7c02b  ! 1333: CASA_I	casa	[%r31] 0x 1, %r11, %r26
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902056  ! 1335: WRPR_PSTATE_I	wrpr	%r0, 0x0056, %pstate
	.word 0x93902005  ! 1336: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1337: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3a549b8  ! 1338: FDIVs	fdivs	%f21, %f24, %f17
DS_85:
	.word 0x20800001  ! 1340: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1339: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902000  ! 1340: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe207c000  ! 1341: LDUW_R	lduw	[%r31 + %r0], %r17
	.word 0x9b51c000  ! 1342: RDPR_TL	rdpr	%tl, %r13
	.word 0xafa00570  ! 1343: FSQRTq	fsqrt	
	.word 0x80dd400c  ! 1344: SMULcc_R	smulcc 	%r21, %r12, %r0
	.word 0xc0cfe010  ! 1345: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r0
	.word 0xb1a00547  ! 1346: FSQRTd	fsqrt	
	.word 0x87802089  ! 1347: WRASI_I	wr	%r0, 0x0089, %asi
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87902076  ! 1349: WRPR_TT_I	wrpr	%r0, 0x0076, %tt
	.word 0x8d90241e  ! 1350: WRPR_PSTATE_I	wrpr	%r0, 0x041e, %pstate
	.word 0x879021b2  ! 1351: WRPR_TT_I	wrpr	%r0, 0x01b2, %tt
	.word 0x8d902cd8  ! 1352: WRPR_PSTATE_I	wrpr	%r0, 0x0cd8, %pstate
	.word 0x90fe6001  ! 1353: SDIVcc_I	sdivcc 	%r25, 0x0001, %r8
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1354: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8da30dd6  ! 1355: FdMULq	fdmulq	
	ta	T_CHANGE_NONHPRIV	! macro
DS_86:
	.word 0x34800001  ! 1358: BG	bg,a	<label_0x1>
	pdist %f22, %f16, %f6
	.word 0x93b6031b  ! 1357: ALLIGNADDRESS	alignaddr	%r24, %r27, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f802001  ! 1359: SIR	sir	0x0001
	.word 0x879020c5  ! 1360: WRPR_TT_I	wrpr	%r0, 0x00c5, %tt
	.word 0x81982d90  ! 1361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d90, %hpstate
	.word 0xd2dfe010  ! 1362: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r9
	.word 0x83480000  ! 1363: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
DS_87:
	.word 0x20800001  ! 1365: BN	bn,a	<label_0x1>
	.word 0xe1346001  ! 1365: STQF_I	-	%f16, [0x0001, %r17]
	normalw
	.word 0x91458000  ! 1364: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x91d02032  ! 1365: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902ed1  ! 1366: WRPR_PSTATE_I	wrpr	%r0, 0x0ed1, %pstate
	.word 0x93902004  ! 1367: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xab50c000  ! 1368: RDPR_TT	rdpr	%tt, %r21
	.word 0x91d02032  ! 1369: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902009  ! 1370: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d02033  ! 1371: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xeac00e80  ! 1372: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r21
	.word 0x83a10dc2  ! 1373: FdMULq	fdmulq	
	.word 0x91d02031  ! 1374: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa1902007  ! 1375: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa190200b  ! 1376: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	ta	T_CHANGE_PRIV	! macro
	.word 0x83a20dc4  ! 1378: FdMULq	fdmulq	
	.word 0x93902007  ! 1379: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1380: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xaba01a64  ! 1381: FqTOi	fqtoi	
DS_88:
	.word 0x22800001  ! 1383: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1382: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902005  ! 1383: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9b51c000  ! 1384: RDPR_TL	rdpr	%tl, %r13
	.word 0x91d02032  ! 1385: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02034  ! 1386: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81982103  ! 1387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0103, %hpstate
	.word 0xdad004a0  ! 1388: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0x8d902613  ! 1389: WRPR_PSTATE_I	wrpr	%r0, 0x0613, %pstate
	.word 0x80c2a001  ! 1390: ADDCcc_I	addccc 	%r10, 0x0001, %r0
	.word 0x95504000  ! 1391: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x8790205c  ! 1392: WRPR_TT_I	wrpr	%r0, 0x005c, %tt
	.word 0xa190200f  ! 1393: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd537e001  ! 1394: STQF_I	-	%f10, [0x0001, %r31]
	.word 0xa190200e  ! 1395: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802004  ! 1397: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902003  ! 1398: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81540000  ! 1399: RDPR_GL	rdpr	%-, %r0
	.word 0x93d02030  ! 1400: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x87702001  ! 1401: POPC_I	popc	0x0001, %r3
	.word 0xa1902004  ! 1402: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x884b400d  ! 1403: MULX_R	mulx 	%r13, %r13, %r4
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x90fd4002  ! 1405: SDIVcc_R	sdivcc 	%r21, %r2, %r8
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1406: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87902022  ! 1408: WRPR_TT_I	wrpr	%r0, 0x0022, %tt
	.word 0x9048c004  ! 1409: MULX_R	mulx 	%r3, %r4, %r8
	.word 0xa1902004  ! 1410: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa190200f  ! 1411: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd0d80e60  ! 1412: LDXA_R	ldxa	[%r0, %r0] 0x73, %r8
	.word 0x94dcc000  ! 1413: SMULcc_R	smulcc 	%r19, %r0, %r10
	.word 0x85a000c7  ! 1414: FNEGd	fnegd	%f38, %f2
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1415: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902c9d  ! 1416: WRPR_PSTATE_I	wrpr	%r0, 0x0c9d, %pstate
DS_89:
	.word 0x22800001  ! 1418: BE	be,a	<label_0x1>
	.word 0xdb35e001  ! 1418: STQF_I	-	%f13, [0x0001, %r23]
	normalw
	.word 0x81458000  ! 1417: RD_SOFTINT_REG	stbar
	.word 0x87802016  ! 1418: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d902edd  ! 1419: WRPR_PSTATE_I	wrpr	%r0, 0x0edd, %pstate
	.word 0x81982b5c  ! 1420: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5c, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1421: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa1902005  ! 1422: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa86d0011  ! 1423: UDIVX_R	udivx 	%r20, %r17, %r20
	.word 0x8d902c01  ! 1424: WRPR_PSTATE_I	wrpr	%r0, 0x0c01, %pstate
	.word 0xe8bfe001  ! 1425: STDA_I	stda	%r20, [%r31 + 0x0001] %asi
	.word 0xa1902001  ! 1426: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x879023f3  ! 1427: WRPR_TT_I	wrpr	%r0, 0x03f3, %tt
	.word 0xa1902008  ! 1428: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xa1a00546  ! 1429: FSQRTd	fsqrt	
	.word 0x87902288  ! 1430: WRPR_TT_I	wrpr	%r0, 0x0288, %tt
	.word 0xa1902001  ! 1431: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x87902014  ! 1432: WRPR_TT_I	wrpr	%r0, 0x0014, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02033  ! 1434: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa190200f  ! 1435: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x93902007  ! 1436: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xe0d804a0  ! 1437: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	.word 0x87902300  ! 1438: WRPR_TT_I	wrpr	%r0, 0x0300, %tt
	.word 0xa190200a  ! 1439: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x98d4001b  ! 1440: UMULcc_R	umulcc 	%r16, %r27, %r12
change_to_tl1_90:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xacab0003  ! 1442: ANDNcc_R	andncc 	%r12, %r3, %r22
	.word 0x85508000  ! 1443: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x88fa401a  ! 1444: SDIVcc_R	sdivcc 	%r9, %r26, %r4
	.word 0x8da409ad  ! 1445: FDIVs	fdivs	%f16, %f13, %f6
	.word 0xa9540000  ! 1446: RDPR_GL	rdpr	%-, %r20
	.word 0x8d902248  ! 1447: WRPR_PSTATE_I	wrpr	%r0, 0x0248, %pstate
	.word 0x8d9028c6  ! 1448: WRPR_PSTATE_I	wrpr	%r0, 0x08c6, %pstate
	.word 0xb1a5c9a7  ! 1449: FDIVs	fdivs	%f23, %f7, %f24
	.word 0x8d802000  ! 1450: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xaaf90004  ! 1451: SDIVcc_R	sdivcc 	%r4, %r4, %r21
	.word 0x8d802000  ! 1452: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8adc400b  ! 1453: SMULcc_R	smulcc 	%r17, %r11, %r5
	.word 0x8d902cc6  ! 1454: WRPR_PSTATE_I	wrpr	%r0, 0x0cc6, %pstate
	.word 0x91d02030  ! 1455: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902007  ! 1456: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x84d60019  ! 1457: UMULcc_R	umulcc 	%r24, %r25, %r2
	.word 0x93902006  ! 1458: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc537c019  ! 1459: STQF_R	-	%f2, [%r25, %r31]
	.word 0x91d02032  ! 1460: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8790231f  ! 1461: WRPR_TT_I	wrpr	%r0, 0x031f, %tt
	.word 0x879023ab  ! 1462: WRPR_TT_I	wrpr	%r0, 0x03ab, %tt
	.word 0x87902030  ! 1463: WRPR_TT_I	wrpr	%r0, 0x0030, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x99902002  ! 1465: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x3a700001  ! 1466: BPCC	<illegal instruction>
	.word 0x87802088  ! 1467: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x3a700001  ! 1468: BPCC	<illegal instruction>
	.word 0x81982c49  ! 1469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c49, %hpstate
	.word 0x93902006  ! 1470: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902004  ! 1471: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_91:
	.word 0x20800001  ! 1473: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1472: SAVE_R	save	%r31, %r0, %r31
	.word 0x81982dd5  ! 1473: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd5, %hpstate
	.word 0xc48008a0  ! 1474: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x81982196  ! 1475: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0196, %hpstate
	.word 0x93902007  ! 1476: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa190200c  ! 1477: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902014  ! 1479: WRPR_TT_I	wrpr	%r0, 0x0014, %tt
	.word 0xa1902006  ! 1480: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xc4bfc039  ! 1481: STDA_R	stda	%r2, [%r31 + %r25] 0x01
	.word 0x9f802001  ! 1482: SIR	sir	0x0001
	.word 0x879023a9  ! 1483: WRPR_TT_I	wrpr	%r0, 0x03a9, %tt
	.word 0x87902006  ! 1484: WRPR_TT_I	wrpr	%r0, 0x0006, %tt
	.word 0x97514000  ! 1485: RDPR_TBA	rdpr	%tba, %r11
	.word 0x8d902883  ! 1486: WRPR_PSTATE_I	wrpr	%r0, 0x0883, %pstate
change_to_tl1_92:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 1488: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9b50c000  ! 1489: RDPR_TT	rdpr	%tt, %r13
	.word 0x8ef9000d  ! 1490: SDIVcc_R	sdivcc 	%r4, %r13, %r7
DS_93:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 1491: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1492: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02030  ! 1493: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xce7fe001  ! 1494: SWAP_I	swap	%r7, [%r31 + 0x0001]
	.word 0x8790213d  ! 1495: WRPR_TT_I	wrpr	%r0, 0x013d, %tt
	.word 0xa7a24dc3  ! 1496: FdMULq	fdmulq	
	.word 0xb369e001  ! 1497: SDIVX_I	sdivx	%r7, 0x0001, %r25
	.word 0x92d44008  ! 1498: UMULcc_R	umulcc 	%r17, %r8, %r9
	.word 0x81982b9e  ! 1499: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9e, %hpstate
	.word 0x85a08d36  ! 1500: FsMULd	fsmuld	%f2, %f22, %f2
	.word 0x8b50c000  ! 1501: RDPR_TT	rdpr	%tt, %r5
	.word 0x93902003  ! 1502: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xca97e020  ! 1503: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r5
	.word 0x87902041  ! 1504: WRPR_TT_I	wrpr	%r0, 0x0041, %tt
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1505: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x819829ca  ! 1506: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ca, %hpstate
	.word 0xaf508000  ! 1507: RDPR_TSTATE	rdpr	%tstate, %r23
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1508: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d90225b  ! 1510: WRPR_PSTATE_I	wrpr	%r0, 0x025b, %pstate
	.word 0x8e69400b  ! 1511: UDIVX_R	udivx 	%r5, %r11, %r7
	.word 0x85a01a75  ! 1512: FqTOi	fqtoi	
	.word 0x91d02034  ! 1513: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f480000  ! 1514: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x879022fd  ! 1515: WRPR_TT_I	wrpr	%r0, 0x02fd, %tt
	.word 0xcfe7c035  ! 1516: CASA_I	casa	[%r31] 0x 1, %r21, %r7
	.word 0x89b4cfe3  ! 1517: FONES	fones	%f4
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1518: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982ed4  ! 1519: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed4, %hpstate
	.word 0xa190200c  ! 1520: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x9ba449b5  ! 1521: FDIVs	fdivs	%f17, %f21, %f13
	.word 0xda7fe001  ! 1522: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x91d02034  ! 1523: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902e0f  ! 1524: WRPR_PSTATE_I	wrpr	%r0, 0x0e0f, %pstate
	.word 0x879023d4  ! 1525: WRPR_TT_I	wrpr	%r0, 0x03d4, %tt
	.word 0xb26dc009  ! 1526: UDIVX_R	udivx 	%r23, %r9, %r25
change_to_tl1_94:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02031  ! 1528: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xb3504000  ! 1529: RDPR_TNPC	rdpr	%tnpc, %r25
	.word 0x8d902052  ! 1530: WRPR_PSTATE_I	wrpr	%r0, 0x0052, %pstate
	.word 0xf2800c40  ! 1531: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r25
	.word 0x8198208e  ! 1532: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008e, %hpstate
	.word 0xb5480000  ! 1533: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xf47fe001  ! 1534: SWAP_I	swap	%r26, [%r31 + 0x0001]
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 1535: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xf4ffc029  ! 1537: SWAPA_R	swapa	%r26, [%r31 + %r9] 0x01
DS_95:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1538: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x93902001  ! 1539: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982d04  ! 1540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d04, %hpstate
	.word 0x8198279c  ! 1541: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079c, %hpstate
	.word 0xf43fe001  ! 1542: STD_I	std	%r26, [%r31 + 0x0001]
	.word 0x93902002  ! 1543: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982c5a  ! 1544: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5a, %hpstate
	.word 0x84fb4007  ! 1545: SDIVcc_R	sdivcc 	%r13, %r7, %r2
	.word 0xc4800ac0  ! 1546: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r2
	.word 0xa3a34dd9  ! 1547: FdMULq	fdmulq	
	.word 0x93902001  ! 1548: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902007  ! 1549: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d90205b  ! 1550: WRPR_PSTATE_I	wrpr	%r0, 0x005b, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879023a5  ! 1552: WRPR_TT_I	wrpr	%r0, 0x03a5, %tt
	.word 0x87a34dda  ! 1553: FdMULq	fdmulq	
	.word 0xb06d000d  ! 1554: UDIVX_R	udivx 	%r20, %r13, %r24
	.word 0x89a589e1  ! 1555: FDIVq	dis not found

	.word 0x81982996  ! 1556: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0996, %hpstate
	.word 0x91d02035  ! 1557: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x97540000  ! 1558: RDPR_GL	rdpr	%-, %r11
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1559: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902007  ! 1561: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87902037  ! 1562: WRPR_TT_I	wrpr	%r0, 0x0037, %tt
DS_96:
	.word 0x22800001  ! 1564: BE	be,a	<label_0x1>
	.word 0xcb318011  ! 1564: STQF_R	-	%f5, [%r17, %r6]
	normalw
	.word 0x95458000  ! 1563: RD_SOFTINT_REG	rd	%softint, %r10
DS_97:
	.word 0x32800001  ! 1565: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1564: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d90205a  ! 1565: WRPR_PSTATE_I	wrpr	%r0, 0x005a, %pstate
	.word 0x81982ac8  ! 1566: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac8, %hpstate
	.word 0xd4ffc031  ! 1567: SWAPA_R	swapa	%r10, [%r31 + %r17] 0x01
	.word 0xa1902000  ! 1568: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8790214b  ! 1569: WRPR_TT_I	wrpr	%r0, 0x014b, %tt
	.word 0xa7504000  ! 1570: RDPR_TNPC	rdpr	%tnpc, %r19
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1571: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982f99  ! 1572: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f99, %hpstate
DS_98:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1573: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
change_to_tl1_99:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1902006  ! 1575: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1576: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1577: SIR	sir	0x0001
	.word 0x8d902a8a  ! 1578: WRPR_PSTATE_I	wrpr	%r0, 0x0a8a, %pstate
	.word 0x906c8007  ! 1579: UDIVX_R	udivx 	%r18, %r7, %r8
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 1580: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x85702001  ! 1581: POPC_I	popc	0x0001, %r2
	.word 0x81982b8a  ! 1582: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8a, %hpstate
	.word 0xc4c00e60  ! 1583: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r2
	.word 0x85a189d2  ! 1584: FDIVd	fdivd	%f6, %f18, %f2
	.word 0xa190200d  ! 1585: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xa9504000  ! 1586: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x87a409ed  ! 1587: FDIVq	dis not found

	.word 0xc7e7c02d  ! 1588: CASA_I	casa	[%r31] 0x 1, %r13, %r3
	.word 0x81982bdc  ! 1589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdc, %hpstate
	.word 0x89a049fa  ! 1590: FDIVq	dis not found

	.word 0xc937c01a  ! 1591: STQF_R	-	%f4, [%r26, %r31]
	.word 0x9069400c  ! 1592: UDIVX_R	udivx 	%r5, %r12, %r8
	.word 0x8d9026c0  ! 1593: WRPR_PSTATE_I	wrpr	%r0, 0x06c0, %pstate
	.word 0x81982d87  ! 1594: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d87, %hpstate
	.word 0x91d02035  ! 1595: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902008  ! 1596: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_100:
	.word 0x20800001  ! 1598: BN	bn,a	<label_0x1>
	illtrap
	.word 0xc5110017  ! 1598: LDQF_R	-	[%r4, %r23], %f2
	.word 0x83a6482d  ! 1597: FADDs	fadds	%f25, %f13, %f1
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1598: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x82d32001  ! 1599: UMULcc_I	umulcc 	%r12, 0x0001, %r1
	.word 0x87902098  ! 1600: WRPR_TT_I	wrpr	%r0, 0x0098, %tt
	.word 0x93902005  ! 1601: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x87802088  ! 1602: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902004  ! 1603: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8790200b  ! 1604: WRPR_TT_I	wrpr	%r0, 0x000b, %tt
	.word 0x93902000  ! 1605: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8790201f  ! 1607: WRPR_TT_I	wrpr	%r0, 0x001f, %tt
	.word 0x8d902694  ! 1608: WRPR_PSTATE_I	wrpr	%r0, 0x0694, %pstate
	.word 0xa1902005  ! 1609: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81982613  ! 1610: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0613, %hpstate
	.word 0xada01a62  ! 1611: FqTOi	fqtoi	
	.word 0x9f802001  ! 1612: SIR	sir	0x0001
	.word 0x8d902494  ! 1613: WRPR_PSTATE_I	wrpr	%r0, 0x0494, %pstate
	.word 0x9b51c000  ! 1614: RDPR_TL	rdpr	%tl, %r13
change_to_randtl_101:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1615: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
DS_102:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1616: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x87902148  ! 1617: WRPR_TT_I	wrpr	%r0, 0x0148, %tt
	.word 0x83d02032  ! 1618: Tcc_I	te	icc_or_xcc, %r0 + 50
change_to_randtl_103:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 1619: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8f902002  ! 552: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982cc2  ! 1621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc2, %hpstate
	.word 0x99902000  ! 1622: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xaf480000  ! 1625: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	.word 0xeeffc022  ! 1626: SWAPA_R	swapa	%r23, [%r31 + %r2] 0x01
	.word 0x8d902cdc  ! 1627: WRPR_PSTATE_I	wrpr	%r0, 0x0cdc, %pstate
	.word 0x9085c00d  ! 1628: ADDcc_R	addcc 	%r23, %r13, %r8
	.word 0x9b50c000  ! 1629: RDPR_TT	rdpr	%tt, %r13
	ta	T_CHANGE_TO_TL0	! macro
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1631: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 1632: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1633: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902852  ! 1634: WRPR_PSTATE_I	wrpr	%r0, 0x0852, %pstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1635: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93a0c9c9  ! 1636: FDIVd	fdivd	%f34, %f40, %f40
	.word 0x89480000  ! 1637: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x9b500000  ! 1638: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x9f802001  ! 1639: SIR	sir	0x0001
	.word 0x8790209a  ! 1640: WRPR_TT_I	wrpr	%r0, 0x009a, %tt
	.word 0xda7fe001  ! 1641: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x879021ba  ! 1642: WRPR_TT_I	wrpr	%r0, 0x01ba, %tt
	.word 0x8d902491  ! 1643: WRPR_PSTATE_I	wrpr	%r0, 0x0491, %pstate
change_to_randtl_104:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 1644: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1645: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x28800001  ! 1646: BLEU	bleu,a	<label_0x1>
	.word 0x97480000  ! 1647: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x8b494000  ! 1648: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0x91d02034  ! 1649: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1650: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902eca  ! 1651: WRPR_PSTATE_I	wrpr	%r0, 0x0eca, %pstate
	.word 0xcac7e030  ! 1652: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r5
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9950c000  ! 1654: RDPR_TT	rdpr	%tt, %r12
	.word 0xd8c80e80  ! 1655: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r12
	.word 0x87494000  ! 1656: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0x32800001  ! 1657: BNE	bne,a	<label_0x1>
	.word 0x92846001  ! 1658: ADDcc_I	addcc 	%r17, 0x0001, %r9
	.word 0x9a488002  ! 1659: MULX_R	mulx 	%r2, %r2, %r13
	.word 0x88c26001  ! 1660: ADDCcc_I	addccc 	%r9, 0x0001, %r4
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1661: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 1662: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc857c000  ! 1663: LDSH_R	ldsh	[%r31 + %r0], %r4
	.word 0x91d02032  ! 1664: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902005  ! 1665: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x91d02034  ! 1666: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d02034  ! 1667: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d480000  ! 1668: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x93b10feb  ! 1669: FONES	fones	%f9
	.word 0xd24fe001  ! 1670: LDSB_I	ldsb	[%r31 + 0x0001], %r9
	.word 0x89514000  ! 1671: RDPR_TBA	rdpr	%tba, %r4
	.word 0x87902315  ! 1672: WRPR_TT_I	wrpr	%r0, 0x0315, %tt
	.word 0xc8d80e80  ! 1673: LDXA_R	ldxa	[%r0, %r0] 0x74, %r4
	.word 0xc9e7c02b  ! 1674: CASA_I	casa	[%r31] 0x 1, %r11, %r4
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1675: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198200d  ! 1676: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000d, %hpstate
	.word 0x879021e1  ! 1677: WRPR_TT_I	wrpr	%r0, 0x01e1, %tt
	.word 0x98dd4004  ! 1678: SMULcc_R	smulcc 	%r21, %r4, %r12
	.word 0x8d9022ce  ! 1679: WRPR_PSTATE_I	wrpr	%r0, 0x02ce, %pstate
	.word 0x87902108  ! 1680: WRPR_TT_I	wrpr	%r0, 0x0108, %tt
	.word 0xd83fc004  ! 1681: STD_R	std	%r12, [%r31 + %r4]
	.word 0x816ec01a  ! 1682: SDIVX_R	sdivx	%r27, %r26, %r0
	.word 0x9bb5cff1  ! 1683: FONES	fones	%f13
	.word 0x87802004  ! 1684: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87902190  ! 1685: WRPR_TT_I	wrpr	%r0, 0x0190, %tt
	.word 0x93d02031  ! 1686: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8d9020ca  ! 1687: WRPR_PSTATE_I	wrpr	%r0, 0x00ca, %pstate
	.word 0x87902244  ! 1688: WRPR_TT_I	wrpr	%r0, 0x0244, %tt
	.word 0xaa6e2001  ! 1689: UDIVX_I	udivx 	%r24, 0x0001, %r21
	.word 0x83d02035  ! 1690: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xebe7c031  ! 1691: CASA_I	casa	[%r31] 0x 1, %r17, %r21
	.word 0xeac7e000  ! 1692: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r21
	.word 0x81982a8b  ! 1693: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8b, %hpstate
	.word 0xa1902007  ! 1694: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879020f8  ! 1696: WRPR_TT_I	wrpr	%r0, 0x00f8, %tt
	.word 0x84fe2001  ! 1697: SDIVcc_I	sdivcc 	%r24, 0x0001, %r2
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1698: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1699: SIR	sir	0x0001
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87a109e6  ! 1701: FDIVq	dis not found

	.word 0x90a8c015  ! 1702: ANDNcc_R	andncc 	%r3, %r21, %r8
	.word 0x2a800001  ! 1703: BCS	bcs,a	<label_0x1>
	.word 0x819820db  ! 1704: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00db, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1705: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02032  ! 1706: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 1707: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 1708: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f802001  ! 1709: SIR	sir	0x0001
	.word 0x93902005  ! 1710: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902004  ! 1711: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902008  ! 1713: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x9b50c000  ! 1714: RDPR_TT	rdpr	%tt, %r13
	.word 0x91d02030  ! 1715: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902002  ! 1716: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x90aa4002  ! 1717: ANDNcc_R	andncc 	%r9, %r2, %r8
	.word 0x98d4a001  ! 1718: UMULcc_I	umulcc 	%r18, 0x0001, %r12
	.word 0xd817c000  ! 1719: LDUH_R	lduh	[%r31 + %r0], %r12
DS_105:
	.word 0x32800001  ! 1721: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1720: SAVE_R	save	%r31, %r0, %r31
	.word 0x3c800001  ! 1721: BPOS	bpos,a	<label_0x1>
	.word 0x8d480000  ! 1722: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x93d02031  ! 1723: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8198279f  ! 1724: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079f, %hpstate
	.word 0xcc8008a0  ! 1725: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x91d02031  ! 1726: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x879023a6  ! 1727: WRPR_TT_I	wrpr	%r0, 0x03a6, %tt
DS_106:
	.word 0x22800001  ! 1729: BE	be,a	<label_0x1>
	illtrap
	.word 0xf1124014  ! 1729: LDQF_R	-	[%r9, %r20], %f24
	.word 0xb3a24836  ! 1728: FADDs	fadds	%f9, %f22, %f25
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1729: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2800c60  ! 1730: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r25
	.word 0x9f802001  ! 1731: SIR	sir	0x0001
	.word 0x93902004  ! 1732: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902006  ! 1733: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902004  ! 1734: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902e80  ! 1735: WRPR_PSTATE_I	wrpr	%r0, 0x0e80, %pstate
	.word 0xf28008a0  ! 1736: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8b6d0000  ! 1737: SDIVX_R	sdivx	%r20, %r0, %r5
DS_107:
	.word 0x32800001  ! 1739: BNE	bne,a	<label_0x1>
	pdist %f8, %f12, %f20
	.word 0x81b64306  ! 1738: ALLIGNADDRESS	alignaddr	%r25, %r6, %r0
	.word 0xc0880e80  ! 1739: LDUBA_R	lduba	[%r0, %r0] 0x74, %r0
	.word 0x87902108  ! 1740: WRPR_TT_I	wrpr	%r0, 0x0108, %tt
	.word 0xc04fc000  ! 1741: LDSB_R	ldsb	[%r31 + %r0], %r0
	.word 0x87802004  ! 1742: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d682001  ! 1743: SDIVX_I	sdivx	%r0, 0x0001, %r6
	.word 0x8d90241a  ! 1744: WRPR_PSTATE_I	wrpr	%r0, 0x041a, %pstate
	.word 0x93902002  ! 1745: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9bb24fe6  ! 1746: FONES	fones	%f13
	.word 0xa1902000  ! 1747: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xda7fe001  ! 1748: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0x8f540000  ! 1749: RDPR_GL	rdpr	%-, %r7
	.word 0x91d02030  ! 1750: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa8d4e001  ! 1751: UMULcc_I	umulcc 	%r19, 0x0001, %r20
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa1902008  ! 1753: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xe80fe001  ! 1754: LDUB_I	ldub	[%r31 + 0x0001], %r20
	.word 0xe8800ba0  ! 1755: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r20
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1756: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 1757: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe8800b60  ! 1758: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r20
	.word 0x8150c000  ! 1759: RDPR_TT	rdpr	%tt, %r0
	.word 0x83d02035  ! 1760: Tcc_I	te	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
DS_108:
	.word 0x32800001  ! 1763: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x9ba0055b  ! 1763: FSQRTd	fsqrt	
	.word 0x99a1082c  ! 1762: FADDs	fadds	%f4, %f12, %f12
	.word 0x8a4dc018  ! 1763: MULX_R	mulx 	%r23, %r24, %r5
	.word 0x34800001  ! 1764: BG	bg,a	<label_0x1>
	.word 0x91d02032  ! 1765: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1500000  ! 1766: RDPR_TPC	rdpr	%tpc, %r16
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1767: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_109:
	.word 0x20800001  ! 1769: BN	bn,a	<label_0x1>
	.word 0x20800001  ! 1769: BN	bn,a	<label_0x1>
	.word 0xd312c004  ! 1769: LDQF_R	-	[%r11, %r4], %f9
	.word 0x95a14838  ! 1768: FADDs	fadds	%f5, %f24, %f10
	.word 0x8d90241e  ! 1769: WRPR_PSTATE_I	wrpr	%r0, 0x041e, %pstate
	.word 0x879021c2  ! 1770: WRPR_TT_I	wrpr	%r0, 0x01c2, %tt
	.word 0x879021d5  ! 1771: WRPR_TT_I	wrpr	%r0, 0x01d5, %tt
	.word 0x81982789  ! 1772: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0789, %hpstate
	.word 0x8790231a  ! 1773: WRPR_TT_I	wrpr	%r0, 0x031a, %tt
	.word 0xa1902008  ! 1774: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x26700001  ! 1775: BPL	<illegal instruction>
	.word 0x819820c4  ! 1776: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c4, %hpstate
	.word 0x87802010  ! 1777: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x876b6001  ! 1778: SDIVX_I	sdivx	%r13, 0x0001, %r3
	.word 0xc73fe001  ! 1779: STDF_I	std	%f3, [0x0001, %r31]
	.word 0xa1902002  ! 1780: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xb151c000  ! 1781: RDPR_TL	rdpr	%tl, %r24
	.word 0x87902304  ! 1782: WRPR_TT_I	wrpr	%r0, 0x0304, %tt
	.word 0x8790222e  ! 1783: WRPR_TT_I	wrpr	%r0, 0x022e, %tt
	.word 0xf0dfe000  ! 1784: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r24
	.word 0x93d02035  ! 1785: Tcc_I	tne	icc_or_xcc, %r0 + 53
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1786: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879020bd  ! 1787: WRPR_TT_I	wrpr	%r0, 0x00bd, %tt
	.word 0xa1902003  ! 1788: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982a14  ! 1790: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a14, %hpstate
	.word 0x83d02031  ! 1791: Tcc_I	te	icc_or_xcc, %r0 + 49
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1792: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902010  ! 1794: WRPR_PSTATE_I	wrpr	%r0, 0x0010, %pstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1795: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02030  ! 1796: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x8790213e  ! 1797: WRPR_TT_I	wrpr	%r0, 0x013e, %tt
	.word 0x3c800001  ! 1798: BPOS	bpos,a	<label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1799: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02035  ! 1800: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xf0800c40  ! 1801: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r24
	.word 0x9ac52001  ! 1802: ADDCcc_I	addccc 	%r20, 0x0001, %r13
	.word 0xdacfe000  ! 1803: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r13
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1804: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1805: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902003  ! 1806: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1808: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb37e001  ! 1809: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x8d902c86  ! 1810: WRPR_PSTATE_I	wrpr	%r0, 0x0c86, %pstate
	.word 0x8198278e  ! 1811: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078e, %hpstate
	.word 0x88c2a001  ! 1812: ADDCcc_I	addccc 	%r10, 0x0001, %r4
	.word 0x89a4cd36  ! 1813: FsMULd	fsmuld	%f19, %f22, %f4
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1814: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 1815: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902003  ! 1816: WRPR_GL_I	wrpr	%r0, 0x0003, %-
change_to_randtl_110:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 1817: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d902c98  ! 1818: WRPR_PSTATE_I	wrpr	%r0, 0x0c98, %pstate
	.word 0x96d28006  ! 1819: UMULcc_R	umulcc 	%r10, %r6, %r11
	.word 0x81982895  ! 1820: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0895, %hpstate
	.word 0x93902000  ! 1821: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
change_to_randtl_111:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1822: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x9350c000  ! 1823: RDPR_TT	rdpr	%tt, %r9
	.word 0x91d02034  ! 1824: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xafa01a76  ! 1825: FqTOi	fqtoi	
	.word 0x91d02032  ! 1826: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xee97e020  ! 1827: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r23
	.word 0xa1540000  ! 1828: RDPR_GL	rdpr	%-, %r16
	.word 0x93902002  ! 1829: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x879020c5  ! 1830: WRPR_TT_I	wrpr	%r0, 0x00c5, %tt
	.word 0x8790200b  ! 1831: WRPR_TT_I	wrpr	%r0, 0x000b, %tt
	.word 0x8eda0001  ! 1832: SMULcc_R	smulcc 	%r8, %r1, %r7
	.word 0xb6d1a001  ! 1833: UMULcc_I	umulcc 	%r6, 0x0001, %r27
DS_112:
	.word 0x20800001  ! 1835: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1834: SAVE_R	save	%r31, %r0, %r31
	.word 0x83d02034  ! 1835: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x91d02030  ! 1836: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d9028da  ! 1837: WRPR_PSTATE_I	wrpr	%r0, 0x08da, %pstate
	.word 0xa190200e  ! 1838: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xf7e7c021  ! 1839: CASA_I	casa	[%r31] 0x 1, %r1, %r27
	.word 0x8d90221f  ! 1840: WRPR_PSTATE_I	wrpr	%r0, 0x021f, %pstate
	.word 0x87902006  ! 1841: WRPR_TT_I	wrpr	%r0, 0x0006, %tt
DS_113:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1842: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xf68fe000  ! 1843: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r27
	.word 0xf68008a0  ! 1844: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r27
	.word 0x81982549  ! 1845: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0549, %hpstate
	.word 0x82dc0009  ! 1846: SMULcc_R	smulcc 	%r16, %r9, %r1
DS_114:
	.word 0x20800001  ! 1848: BN	bn,a	<label_0x1>
	allclean
	.word 0x91b0c30b  ! 1847: ALLIGNADDRESS	alignaddr	%r3, %r11, %r8
	.word 0x8f902002  ! 552: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982e1c  ! 1848: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1c, %hpstate
	.word 0x8d902259  ! 1849: WRPR_PSTATE_I	wrpr	%r0, 0x0259, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1850: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd08008a0  ! 1851: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r8
	.word 0xd0800c80  ! 1852: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r8
	.word 0xd02fc00b  ! 1853: STB_R	stb	%r8, [%r31 + %r11]
	.word 0xa1902003  ! 1854: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87902059  ! 1855: WRPR_TT_I	wrpr	%r0, 0x0059, %tt
	.word 0x91d02030  ! 1856: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902008  ! 1858: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xb3540000  ! 1859: RDPR_GL	rdpr	%-, %r25
	.word 0x8790222a  ! 1860: WRPR_TT_I	wrpr	%r0, 0x022a, %tt
	.word 0x26700001  ! 1861: BPL	<illegal instruction>
	.word 0x97480000  ! 1862: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xd65fe001  ! 1863: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xa1902001  ! 1864: WRPR_GL_I	wrpr	%r0, 0x0001, %-
change_to_tl1_115:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1866: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd6d804a0  ! 1867: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1868: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_116:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1869: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8d9022d2  ! 1870: WRPR_PSTATE_I	wrpr	%r0, 0x02d2, %pstate
	.word 0x9b540000  ! 1871: RDPR_GL	rdpr	%-, %r13
DS_117:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 1872: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xdad004a0  ! 1873: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r13
	.word 0xda37e001  ! 1874: STH_I	sth	%r13, [%r31 + 0x0001]
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1875: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xda7fe001  ! 1876: SWAP_I	swap	%r13, [%r31 + 0x0001]
	.word 0xdb97e001  ! 1877: LDQFA_I	-	[%r31, 0x0001], %f13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87902024  ! 1879: WRPR_TT_I	wrpr	%r0, 0x0024, %tt
	.word 0x91d02033  ! 1880: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902002  ! 1881: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa2d3400c  ! 1882: UMULcc_R	umulcc 	%r13, %r12, %r17
	.word 0x9f802001  ! 1883: SIR	sir	0x0001
	.word 0x85a50dd3  ! 1884: FdMULq	fdmulq	
	.word 0xc537c013  ! 1885: STQF_R	-	%f2, [%r19, %r31]
	.word 0x89a0cdcd  ! 1886: FdMULq	fdmulq	
	.word 0xc9e7c02d  ! 1887: CASA_I	casa	[%r31] 0x 1, %r13, %r4
	.word 0x87902178  ! 1888: WRPR_TT_I	wrpr	%r0, 0x0178, %tt
	.word 0xc8c004a0  ! 1889: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r4
	.word 0xa1902005  ! 1890: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x91d02033  ! 1891: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x87902115  ! 1892: WRPR_TT_I	wrpr	%r0, 0x0115, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x879020f6  ! 1894: WRPR_TT_I	wrpr	%r0, 0x00f6, %tt
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93902004  ! 1896: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_118:
	.word 0x22800001  ! 1898: BE	be,a	<label_0x1>
	.word 0xc130a001  ! 1898: STQF_I	-	%f0, [0x0001, %r2]
	normalw
	.word 0x99458000  ! 1897: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x2e700001  ! 1898: BPVS	<illegal instruction>
	.word 0x93902007  ! 1899: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1900: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd9e7c02d  ! 1901: CASA_I	casa	[%r31] 0x 1, %r13, %r12
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1903: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xad50c000  ! 1904: RDPR_TT	rdpr	%tt, %r22
DS_119:
	.word 0x22800001  ! 1906: BE	be,a	<label_0x1>
	.word 0x20800001  ! 1906: BN	bn,a	<label_0x1>
	.word 0xcd12c00b  ! 1906: LDQF_R	-	[%r11, %r11], %f6
	.word 0x91a20829  ! 1905: FADDs	fadds	%f8, %f9, %f8
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1906: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d514000  ! 1907: RDPR_TBA	<illegal instruction>
	.word 0xcc8fe000  ! 1908: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r6
	.word 0x95540000  ! 1909: RDPR_GL	<illegal instruction>
	.word 0x99902005  ! 1910: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02032  ! 1912: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x80f80000  ! 1913: SDIVcc_R	sdivcc 	%r0, %r0, %r0
	.word 0x819828d7  ! 1914: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d7, %hpstate
	.word 0x9f802001  ! 1915: SIR	sir	0x0001
	.word 0x819822c5  ! 1916: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c5, %hpstate
	.word 0x8d90221f  ! 1917: WRPR_PSTATE_I	wrpr	%r0, 0x021f, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa9508000  ! 1919: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x8d90268f  ! 1920: WRPR_PSTATE_I	wrpr	%r0, 0x068f, %pstate
	.word 0x91d02031  ! 1921: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xa1902005  ! 1922: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1923: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91508000  ! 1924: RDPR_TSTATE	rdpr	%tstate, %r8
	.word 0x93d02032  ! 1925: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd00fe001  ! 1926: LDUB_I	ldub	[%r31 + 0x0001], %r8
	.word 0x8198284b  ! 1927: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084b, %hpstate
	.word 0xa1902005  ! 1928: WRPR_GL_I	wrpr	%r0, 0x0005, %-
DS_120:
	.word 0x22800001  ! 1930: BE	be,a	<label_0x1>
	allclean
	.word 0x91b2c311  ! 1929: ALLIGNADDRESS	alignaddr	%r11, %r17, %r8
	.word 0xa1514000  ! 1930: RDPR_TBA	rdpr	%tba, %r16
	.word 0x83d02031  ! 1931: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x97a1c9e8  ! 1932: FDIVq	dis not found

	.word 0xa1902009  ! 1933: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xa1902002  ! 1934: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902001  ! 1935: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd727c008  ! 1936: STF_R	st	%f11, [%r8, %r31]
	.word 0xd737c008  ! 1937: STQF_R	-	%f11, [%r8, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879023a5  ! 1939: WRPR_TT_I	wrpr	%r0, 0x03a5, %tt
	.word 0x82d4a001  ! 1940: UMULcc_I	umulcc 	%r18, 0x0001, %r1
	.word 0x81a049d5  ! 1941: FDIVd	fdivd	%f32, %f52, %f0
	.word 0xb5680016  ! 1942: SDIVX_R	sdivx	%r0, %r22, %r26
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1943: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x38700001  ! 1944: BPGU	<illegal instruction>
	.word 0x806ca001  ! 1945: UDIVX_I	udivx 	%r18, 0x0001, %r0
	.word 0x819820ca  ! 1946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00ca, %hpstate
	.word 0x24800001  ! 1947: BLE	ble,a	<label_0x1>
	.word 0xb2f8000a  ! 1948: SDIVcc_R	sdivcc 	%r0, %r10, %r25
	.word 0x88d54003  ! 1949: UMULcc_R	umulcc 	%r21, %r3, %r4
	.word 0x87902234  ! 1950: WRPR_TT_I	wrpr	%r0, 0x0234, %tt
	.word 0x8d902295  ! 1951: WRPR_PSTATE_I	wrpr	%r0, 0x0295, %pstate
	.word 0x879021de  ! 1952: WRPR_TT_I	wrpr	%r0, 0x01de, %tt
	.word 0xb7480000  ! 1953: RDHPR_HPSTATE	rdhpr	%hpstate, %r27
	.word 0x93d02031  ! 1954: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0xa190200a  ! 1955: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xf63fc003  ! 1956: STD_R	std	%r27, [%r31 + %r3]
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1957: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8790204e  ! 1958: WRPR_TT_I	wrpr	%r0, 0x004e, %tt
	.word 0xacaac001  ! 1959: ANDNcc_R	andncc 	%r11, %r1, %r22
	.word 0x9f802001  ! 1960: SIR	sir	0x0001
	.word 0xa190200b  ! 1961: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_121:
	.word 0x22800001  ! 1963: BE	be,a	<label_0x1>
	pdist %f20, %f22, %f22
	.word 0x91b20301  ! 1962: ALLIGNADDRESS	alignaddr	%r8, %r1, %r8
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1963: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1964: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879023f0  ! 1965: WRPR_TT_I	wrpr	%r0, 0x03f0, %tt
	.word 0x846c4004  ! 1966: UDIVX_R	udivx 	%r17, %r4, %r2
	.word 0x87902182  ! 1967: WRPR_TT_I	wrpr	%r0, 0x0182, %tt
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1968: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_122:
	.word 0x22800001  ! 1970: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1969: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902e15  ! 1970: WRPR_PSTATE_I	wrpr	%r0, 0x0e15, %pstate
	.word 0x8d902852  ! 1971: WRPR_PSTATE_I	wrpr	%r0, 0x0852, %pstate
	.word 0x81a00544  ! 1972: FSQRTd	fsqrt	
	.word 0x83d02032  ! 1973: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8790215e  ! 1974: WRPR_TT_I	wrpr	%r0, 0x015e, %tt
	.word 0xb1a08dcd  ! 1975: FdMULq	fdmulq	
	.word 0x81982d52  ! 1976: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d52, %hpstate
	.word 0x9f802001  ! 1977: SIR	sir	0x0001
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1978: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_randtl_123:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 1979: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xb66ca001  ! 1980: UDIVX_I	udivx 	%r18, 0x0001, %r27
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 1981: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91a01a65  ! 1982: FqTOi	fqtoi	
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f802001  ! 1984: SIR	sir	0x0001
	.word 0x8f902002  ! 552: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x819821c9  ! 1985: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c9, %hpstate
	.word 0x8198200d  ! 1986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000d, %hpstate
	.word 0x93902002  ! 1987: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd0800ac0  ! 1988: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r8
	.word 0x87902120  ! 1989: WRPR_TT_I	wrpr	%r0, 0x0120, %tt
	.word 0x99902002  ! 1990: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x30800001  ! 1991: BA	ba,a	<label_0x1>
	.word 0xd07fe001  ! 1992: SWAP_I	swap	%r8, [%r31 + 0x0001]
	.word 0xa1902006  ! 1993: WRPR_GL_I	wrpr	%r0, 0x0006, %-
DS_124:
	.word 0x34800001  ! 1995: BG	bg,a	<label_0x1>
	pdist %f2, %f24, %f10
	.word 0xa5b14307  ! 1994: ALLIGNADDRESS	alignaddr	%r5, %r7, %r18
	.word 0x8198245b  ! 1995: WRHPR_HPSTATE_I	wrhpr	%r0, 0x045b, %hpstate
DS_125:
	.word 0x34800001  ! 1997: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1996: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d802000  ! 1997: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_HPRIV	! macro
	.word 0x24700001  ! 1999: BPLE	<illegal instruction>
	.word 0x8790235c  ! 2000: WRPR_TT_I	wrpr	%r0, 0x035c, %tt
	.word 0x93540000  ! 2001: RDPR_GL	rdpr	%-, %r9
	.word 0xa1902004  ! 2002: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa8d42001  ! 2003: UMULcc_I	umulcc 	%r16, 0x0001, %r20
	.word 0x8d902cd2  ! 2004: WRPR_PSTATE_I	wrpr	%r0, 0x0cd2, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xab504000  ! 2006: RDPR_TNPC	rdpr	%tnpc, %r21
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 2007: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x99500000  ! 2008: RDPR_TPC	<illegal instruction>
	.word 0x93902000  ! 2009: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9f802001  ! 2010: SIR	sir	0x0001
	.word 0xa1902006  ! 2011: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93d02033  ! 2012: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x9ba34d2d  ! 2013: FsMULd	fsmuld	%f13, %f44, %f44
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x90d00017  ! 2015: UMULcc_R	umulcc 	%r0, %r23, %r8
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 2016: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 2017: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x26800001  ! 2018: BL	bl,a	<label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2019: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 2020: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8db00fe9  ! 2021: FONES	fones	%f6
	.word 0x93902006  ! 2022: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f802001  ! 2023: SIR	sir	0x0001
	.word 0x879023eb  ! 2024: WRPR_TT_I	wrpr	%r0, 0x03eb, %tt
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x946ea001  ! 2026: UDIVX_I	udivx 	%r26, 0x0001, %r10
	.word 0xd44fc000  ! 2027: LDSB_R	ldsb	[%r31 + %r0], %r10
	.word 0x879023e0  ! 2028: WRPR_TT_I	wrpr	%r0, 0x03e0, %tt
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 2029: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd4c80e40  ! 2030: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r10
	.word 0xa190200a  ! 2031: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xa1902002  ! 2032: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x81982204  ! 2033: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0204, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 2034: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 2035: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d802004  ! 2036: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91d02030  ! 2037: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8ed16001  ! 2038: UMULcc_I	umulcc 	%r5, 0x0001, %r7
	.word 0x91d02034  ! 2039: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x91d02033  ! 2040: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xce1fe001  ! 2041: LDD_I	ldd	[%r31 + 0x0001], %r7
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x83d02030  ! 2043: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x91d02032  ! 2044: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xced7e020  ! 2045: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r7
	.word 0x81982303  ! 2046: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0303, %hpstate
DS_126:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 2047: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xa1902003  ! 2048: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa190200c  ! 2049: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xce8008a0  ! 2050: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8d90249f  ! 2051: WRPR_PSTATE_I	wrpr	%r0, 0x049f, %pstate
	.word 0xa1902003  ! 2052: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d902c1f  ! 2053: WRPR_PSTATE_I	wrpr	%r0, 0x0c1f, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x28700001  ! 2055: BPLEU	<illegal instruction>
	.word 0xce37e001  ! 2056: STH_I	sth	%r7, [%r31 + 0x0001]
	.word 0xcec7e020  ! 2057: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r7
	.word 0x93902005  ! 2058: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
change_to_randtl_127:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 2059: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x8d90248e  ! 2060: WRPR_PSTATE_I	wrpr	%r0, 0x048e, %pstate
	.word 0x97a01a76  ! 2061: FqTOi	fqtoi	
	.word 0xb3a00564  ! 2062: FSQRTq	fsqrt	
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2063: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x816d0014  ! 2064: SDIVX_R	sdivx	%r20, %r20, %r0
	.word 0x879022d8  ! 2065: WRPR_TT_I	wrpr	%r0, 0x02d8, %tt
	.word 0x93504000  ! 2066: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0x8d50c000  ! 2067: RDPR_TT	rdpr	%tt, %r6
	.word 0xa3b54ffa  ! 2068: FONES	fones	%f17
	.word 0x8198281f  ! 2069: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081f, %hpstate
	.word 0x3c700001  ! 2070: BPPOS	<illegal instruction>
	.word 0x8f902002  ! 552: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x81982048  ! 2071: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0048, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2073: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879023d2  ! 2074: WRPR_TT_I	wrpr	%r0, 0x03d2, %tt
	.word 0xa1902000  ! 2075: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x93902001  ! 2076: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982216  ! 2077: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0216, %hpstate
	.word 0x81982082  ! 2078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0082, %hpstate
	.word 0x93902005  ! 2079: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902005  ! 2080: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xab500000  ! 2081: RDPR_TPC	rdpr	%tpc, %r21
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x819821d2  ! 2084: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d2, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xeacfe010  ! 2086: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r21
	.word 0x8790226a  ! 2087: WRPR_TT_I	wrpr	%r0, 0x026a, %tt
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 2088: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x3c700001  ! 2089: BPPOS	<illegal instruction>
change_to_tl1_128:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902000  ! 2091: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xea8008a0  ! 2092: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r21
	.word 0x93902006  ! 2093: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d90245c  ! 2094: WRPR_PSTATE_I	wrpr	%r0, 0x045c, %pstate
	.word 0x87902003  ! 2095: WRPR_TT_I	wrpr	%r0, 0x0003, %tt
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2096: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xead80e40  ! 2097: LDXA_R	ldxa	[%r0, %r0] 0x72, %r21
	.word 0x93d02035  ! 2098: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x81982611  ! 2099: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0611, %hpstate
	.word 0x91d02035  ! 2100: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 2101: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902452  ! 2102: WRPR_PSTATE_I	wrpr	%r0, 0x0452, %pstate
	.word 0xa66da001  ! 2103: UDIVX_I	udivx 	%r22, 0x0001, %r19
	.word 0x81982b91  ! 2104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b91, %hpstate
	.word 0xa1902003  ! 2105: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2106: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb550c000  ! 2107: RDPR_TT	rdpr	%tt, %r26
	.word 0x8198255b  ! 2108: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055b, %hpstate
	.word 0xf4d80e80  ! 2109: LDXA_R	ldxa	[%r0, %r0] 0x74, %r26
	ta	T_CHANGE_PRIV	! macro
	.word 0x8cd20015  ! 2111: UMULcc_R	umulcc 	%r8, %r21, %r6
	.word 0x91d02033  ! 2112: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8790218b  ! 2113: WRPR_TT_I	wrpr	%r0, 0x018b, %tt
	.word 0xb3508000  ! 2114: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xf2800c00  ! 2115: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r25
	.word 0xa1902004  ! 2116: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93902007  ! 2117: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81982d88  ! 2118: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d88, %hpstate
	.word 0x93902006  ! 2119: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902000  ! 2120: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xf3e7c035  ! 2121: CASA_I	casa	[%r31] 0x 1, %r21, %r25
	.word 0xb3500000  ! 2122: RDPR_TPC	rdpr	%tpc, %r25
	.word 0x95480000  ! 2123: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x9551c000  ! 2124: RDPR_TL	rdpr	%tl, %r10
	.word 0xd48008a0  ! 2125: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x91d02030  ! 2126: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x819821d2  ! 2127: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d2, %hpstate
	.word 0x93902005  ! 2128: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d02031  ! 2129: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d802004  ! 2130: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8198205c  ! 2131: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005c, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902a91  ! 2133: WRPR_PSTATE_I	wrpr	%r0, 0x0a91, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1902003  ! 2135: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x81982c8e  ! 2136: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8e, %hpstate
	.word 0xa190200e  ! 2137: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x87902251  ! 2138: WRPR_TT_I	wrpr	%r0, 0x0251, %tt
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa190200f  ! 2140: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xaec62001  ! 2141: ADDCcc_I	addccc 	%r24, 0x0001, %r23
	.word 0xeebfe001  ! 2142: STDA_I	stda	%r23, [%r31 + 0x0001] %asi
	.word 0x819823d0  ! 2143: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d0, %hpstate
	.word 0xeecfe030  ! 2144: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r23
	.word 0x81982119  ! 2145: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0119, %hpstate
	.word 0xeed804a0  ! 2146: LDXA_R	ldxa	[%r0, %r0] 0x25, %r23
	.word 0x87902004  ! 2147: WRPR_TT_I	wrpr	%r0, 0x0004, %tt
	.word 0x91d02035  ! 2148: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d504000  ! 2149: RDPR_TNPC	rdpr	%tnpc, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x91d02032  ! 2151: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902007  ! 2152: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xaaf84005  ! 2153: SDIVcc_R	sdivcc 	%r1, %r5, %r21
	.word 0x91d02030  ! 2154: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d514000  ! 2155: RDPR_TBA	rdpr	%tba, %r6
	.word 0x879021a3  ! 2156: WRPR_TT_I	wrpr	%r0, 0x01a3, %tt
	.word 0x91d02031  ! 2157: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xcc800c00  ! 2158: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r6
	.word 0x93a00550  ! 2159: FSQRTd	fsqrt	
	.word 0x9ba00d20  ! 2160: FsMULd	fsmuld	%f0, %f0, %f44
	.word 0xa1b6cfe4  ! 2161: FONES	fones	%f16
	.word 0x81982f5c  ! 2162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5c, %hpstate
DS_129:
	.word 0x32800001  ! 2164: BNE	bne,a	<label_0x1>
	.word 0xed342001  ! 2164: STQF_I	-	%f22, [0x0001, %r16]
	normalw
	.word 0xb1458000  ! 2163: RD_SOFTINT_REG	rd	%softint, %r24
	.word 0x8198225b  ! 2164: WRHPR_HPSTATE_I	wrhpr	%r0, 0x025b, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2165: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 2166: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87802089  ! 2167: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982a8a  ! 2168: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8a, %hpstate
	.word 0xa1902007  ! 2169: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93d02034  ! 2170: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xf0c7e000  ! 2171: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r24
	.word 0x93902004  ! 2172: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902006  ! 2173: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2174: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8cd04013  ! 2175: UMULcc_R	umulcc 	%r1, %r19, %r6
	.word 0x8d902e09  ! 2176: WRPR_PSTATE_I	wrpr	%r0, 0x0e09, %pstate
	.word 0x87802089  ! 2177: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8790212e  ! 2178: WRPR_TT_I	wrpr	%r0, 0x012e, %tt
	.word 0x81982b40  ! 2179: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b40, %hpstate
	.word 0xb7540000  ! 2180: RDPR_GL	rdpr	%-, %r27
	.word 0xf6d804a0  ! 2181: LDXA_R	ldxa	[%r0, %r0] 0x25, %r27
	.word 0x8790200e  ! 2182: WRPR_TT_I	wrpr	%r0, 0x000e, %tt
	.word 0x22800001  ! 2183: BE	be,a	<label_0x1>
	.word 0xa1902001  ! 2184: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8198218d  ! 2185: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018d, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 2186: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 2187: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xf717c000  ! 2188: LDQF_R	-	[%r31, %r0], %f27
	.word 0x82fb0018  ! 2189: SDIVcc_R	sdivcc 	%r12, %r24, %r1
DS_130:
	.word 0x34800001  ! 2191: BG	bg,a	<label_0x1>
	illtrap
	.word 0xcf130002  ! 2191: LDQF_R	-	[%r12, %r2], %f7
	.word 0xa5a18823  ! 2190: FADDs	fadds	%f6, %f3, %f18
	.word 0x8d90244e  ! 2191: WRPR_PSTATE_I	wrpr	%r0, 0x044e, %pstate
	.word 0x36800001  ! 2192: BGE	bge,a	<label_0x1>
	.word 0xe49004a0  ! 2193: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x93d02035  ! 2194: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8790227a  ! 2195: WRPR_TT_I	wrpr	%r0, 0x027a, %tt
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2196: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97a689cd  ! 2197: FDIVd	fdivd	%f26, %f44, %f42
	.word 0x8d802000  ! 2198: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2199: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd6ffc02d  ! 2200: SWAPA_R	swapa	%r11, [%r31 + %r13] 0x01
	.word 0x81a0055a  ! 2201: FSQRTd	fsqrt	
	.word 0xc037c01a  ! 2202: STH_R	sth	%r0, [%r31 + %r26]
	.word 0x87802014  ! 2203: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93540000  ! 2204: RDPR_GL	rdpr	%-, %r9
	.word 0xb6d0000d  ! 2205: UMULcc_R	umulcc 	%r0, %r13, %r27
	.word 0x87802088  ! 2206: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xf7e7c02d  ! 2207: CASA_I	casa	[%r31] 0x 1, %r13, %r27
	.word 0xf657e001  ! 2208: LDSH_I	ldsh	[%r31 + 0x0001], %r27
	.word 0xf727e001  ! 2209: STF_I	st	%f27, [0x0001, %r31]
	.word 0x8d90284d  ! 2210: WRPR_PSTATE_I	wrpr	%r0, 0x084d, %pstate
	.word 0x81982c94  ! 2211: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c94, %hpstate
	.word 0xf6dfe010  ! 2212: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r27
	.word 0xa190200d  ! 2213: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2214: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902174  ! 2215: WRPR_TT_I	wrpr	%r0, 0x0174, %tt
	.word 0x28800001  ! 2216: BLEU	bleu,a	<label_0x1>
	.word 0x91d02033  ! 2217: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90285b  ! 2219: WRPR_PSTATE_I	wrpr	%r0, 0x085b, %pstate
	.word 0x8751c000  ! 2220: RDPR_TL	rdpr	%tl, %r3
	.word 0x87a30dc0  ! 2221: FdMULq	fdmulq	
	ta	T_CHANGE_PRIV	! macro
	.word 0x8ad16001  ! 2223: UMULcc_I	umulcc 	%r5, 0x0001, %r5
	.word 0x8d802004  ! 2224: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_131:
	.word 0x32800001  ! 2226: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 2226: BG	bg,a	<label_0x1>
	.word 0x87a0054d  ! 2226: FSQRTd	fsqrt	
	.word 0xb3a20835  ! 2225: FADDs	fadds	%f8, %f21, %f25
change_to_randtl_132:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 2226: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_PRIV	! macro
	.word 0xa1902005  ! 2228: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xa190200f  ! 2229: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x9f802001  ! 2230: SIR	sir	0x0001
	.word 0x8d802004  ! 2231: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902614  ! 2232: WRPR_PSTATE_I	wrpr	%r0, 0x0614, %pstate
	.word 0x93902000  ! 2233: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89500000  ! 2235: RDPR_TPC	rdpr	%tpc, %r4
	.word 0xc8ffc035  ! 2236: SWAPA_R	swapa	%r4, [%r31 + %r21] 0x01
	.word 0x91d02030  ! 2237: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1902000  ! 2238: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_133:
	.word 0x32800001  ! 2240: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 2239: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x93902006  ! 2240: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc8800c40  ! 2241: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r4
	.word 0x87902241  ! 2242: WRPR_TT_I	wrpr	%r0, 0x0241, %tt
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 2243: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x93d02031  ! 2244: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8d802000  ! 2245: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02034  ! 2246: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x884b0012  ! 2247: MULX_R	mulx 	%r12, %r18, %r4
	.word 0x8d90229c  ! 2248: WRPR_PSTATE_I	wrpr	%r0, 0x029c, %pstate
	.word 0x93902007  ! 2249: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc88008a0  ! 2250: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x93902007  ! 2251: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902004  ! 2252: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2253: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902006  ! 2254: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x3c800001  ! 2255: BPOS	bpos,a	<label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 2256: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 2257: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xa1a0054d  ! 2258: FSQRTd	fsqrt	
	.word 0x88d2e001  ! 2259: UMULcc_I	umulcc 	%r11, 0x0001, %r4
	.word 0x93902007  ! 2260: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_134:
	.word 0x22800001  ! 2262: BE	be,a	<label_0x1>
	pdist %f24, %f16, %f2
	.word 0x8db2830a  ! 2261: ALLIGNADDRESS	alignaddr	%r10, %r10, %r6
	.word 0xcc800a80  ! 2262: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r6
	.word 0xaf540000  ! 2263: RDPR_GL	rdpr	%-, %r23
	.word 0xef37e001  ! 2264: STQF_I	-	%f23, [0x0001, %r31]
	.word 0x93902001  ! 2265: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802014  ! 2266: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d802004  ! 2267: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d68e001  ! 2268: SDIVX_I	sdivx	%r3, 0x0001, %r6
	.word 0x87a00577  ! 2269: FSQRTq	fsqrt	
	.word 0x8d902605  ! 2270: WRPR_PSTATE_I	wrpr	%r0, 0x0605, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 2272: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa190200c  ! 2273: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1902005  ! 2274: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d802000  ! 2275: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2276: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc647c000  ! 2277: LDSW_R	ldsw	[%r31 + %r0], %r3
	.word 0xb5504000  ! 2278: RDPR_TNPC	rdpr	%tnpc, %r26
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982d0f  ! 2280: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d0f, %hpstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99902005  ! 2282: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2283: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 2284: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8790237c  ! 2285: WRPR_TT_I	wrpr	%r0, 0x037c, %tt
	.word 0x87902374  ! 2286: WRPR_TT_I	wrpr	%r0, 0x0374, %tt
	.word 0xb5508000  ! 2287: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x95a08d37  ! 2288: FsMULd	fsmuld	%f2, %f54, %f10
	.word 0x8790224f  ! 2289: WRPR_TT_I	wrpr	%r0, 0x024f, %tt
	.word 0x93902001  ! 2290: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9950c000  ! 2291: RDPR_TT	rdpr	%tt, %r12
	.word 0x9f802001  ! 2292: SIR	sir	0x0001
	.word 0xa7a18ddb  ! 2293: FdMULq	fdmulq	
	.word 0x9f802001  ! 2294: SIR	sir	0x0001
	.word 0x93902006  ! 2295: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_135:
	.word 0x32800001  ! 2297: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 2296: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902000  ! 2297: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2298: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 2299: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902099  ! 2300: WRPR_TT_I	wrpr	%r0, 0x0099, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa190200f  ! 2302: WRPR_GL_I	wrpr	%r0, 0x000f, %-
DS_136:
	.word 0x32800001  ! 2304: BNE	bne,a	<label_0x1>
	pdist %f14, %f16, %f4
	.word 0x93b5431a  ! 2303: ALLIGNADDRESS	alignaddr	%r21, %r26, %r9
	.word 0x976b2001  ! 2304: SDIVX_I	sdivx	%r12, 0x0001, %r11
	.word 0x9ba04d31  ! 2305: FsMULd	fsmuld	%f1, %f48, %f44
	.word 0x81982818  ! 2306: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0818, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 2307: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_137:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 2308: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x81982a9f  ! 2309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9f, %hpstate
	.word 0x87902080  ! 2310: WRPR_TT_I	wrpr	%r0, 0x0080, %tt
	.word 0x93902003  ! 2311: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xa190200e  ! 2312: WRPR_GL_I	wrpr	%r0, 0x000e, %-
DS_138:
	.word 0x32800001  ! 2314: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87a00540  ! 2314: FSQRTd	fsqrt	
	.word 0x95a34821  ! 2313: FADDs	fadds	%f13, %f1, %f10
change_to_randtl_139:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 2314: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x91d02034  ! 2315: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d90285e  ! 2316: WRPR_PSTATE_I	wrpr	%r0, 0x085e, %pstate
	.word 0xa1902007  ! 2317: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8681c002  ! 2318: ADDcc_R	addcc 	%r7, %r2, %r3
	.word 0x80c62001  ! 2319: ADDCcc_I	addccc 	%r24, 0x0001, %r0
	.word 0x8fa01a6b  ! 2320: FqTOi	fqtoi	
	.word 0xa5494000  ! 2321: RDHPR_HTBA	rdhpr	%htba, %r18
	.word 0xe49004a0  ! 2322: LDUHA_R	lduha	[%r0, %r0] 0x25, %r18
	.word 0x87494000  ! 2323: RDHPR_HTBA	rdhpr	%htba, %r3
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 2324: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 2325: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902a5e  ! 2326: WRPR_PSTATE_I	wrpr	%r0, 0x0a5e, %pstate
	.word 0xa190200b  ! 2327: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x87902175  ! 2328: WRPR_TT_I	wrpr	%r0, 0x0175, %tt
	.word 0x8f902002  ! 552: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x819827c2  ! 2329: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c2, %hpstate
	.word 0x87802010  ! 2330: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xb2f8a001  ! 2331: SDIVcc_I	sdivcc 	%r2, 0x0001, %r25
	.word 0x8d902ec1  ! 2332: WRPR_PSTATE_I	wrpr	%r0, 0x0ec1, %pstate
	.word 0x89500000  ! 2333: RDPR_TPC	rdpr	%tpc, %r4
	.word 0x87802014  ! 2334: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xc81fe001  ! 2335: LDD_I	ldd	[%r31 + 0x0001], %r4
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902000  ! 2337: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02032  ! 2338: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87902309  ! 2339: WRPR_TT_I	wrpr	%r0, 0x0309, %tt
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982ed5  ! 2341: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed5, %hpstate
	.word 0x81982ad6  ! 2342: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad6, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 2343: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc937c00b  ! 2344: STQF_R	-	%f4, [%r11, %r31]
	.word 0x93d02033  ! 2345: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x91d02035  ! 2346: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02031  ! 2347: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xc88008a0  ! 2348: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
	.word 0x93902007  ! 2349: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2350: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x85540000  ! 2351: RDPR_GL	rdpr	%-, %r2
	.word 0x38700001  ! 2352: BPGU	<illegal instruction>
	.word 0x87802004  ! 2353: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8790209b  ! 2354: WRPR_TT_I	wrpr	%r0, 0x009b, %tt
	.word 0xc4dfe000  ! 2355: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r2
	.word 0x87a449a7  ! 2356: FDIVs	fdivs	%f17, %f7, %f3
	.word 0x91d02034  ! 2357: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa96b4006  ! 2358: SDIVX_R	sdivx	%r13, %r6, %r20
	.word 0xa190200d  ! 2359: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91d02033  ! 2360: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe84fc000  ! 2361: LDSB_R	ldsb	[%r31 + %r0], %r20
	.word 0x91d02032  ! 2362: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x83b6cfe4  ! 2363: FONES	fones	%f1
	.word 0xa3686001  ! 2364: SDIVX_I	sdivx	%r1, 0x0001, %r17
	.word 0x80f94011  ! 2365: SDIVcc_R	sdivcc 	%r5, %r17, %r0
	.word 0x8e81400b  ! 2366: ADDcc_R	addcc 	%r5, %r11, %r7
	.word 0x879021d6  ! 2367: WRPR_TT_I	wrpr	%r0, 0x01d6, %tt
	.word 0x8198288c  ! 2368: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088c, %hpstate
	.word 0x879023f5  ! 2369: WRPR_TT_I	wrpr	%r0, 0x03f5, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0xb2fa801a  ! 2371: SDIVcc_R	sdivcc 	%r10, %r26, %r25
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 2372: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x26800001  ! 2373: BL	bl,a	<label_0x1>
	.word 0xa1902004  ! 2374: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8ac02001  ! 2375: ADDCcc_I	addccc 	%r0, 0x0001, %r5
DS_140:
	.word 0x34800001  ! 2377: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 2376: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa190200c  ! 2377: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xca2fc01a  ! 2378: STB_R	stb	%r5, [%r31 + %r26]
	.word 0x93902007  ! 2379: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2380: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 2381: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_141:
	.word 0x22800001  ! 2383: BE	be,a	<label_0x1>
	.word 0x20800001  ! 2383: BN	bn,a	<label_0x1>
	.word 0xd715c011  ! 2383: LDQF_R	-	[%r23, %r17], %f11
	.word 0xb3a2082a  ! 2382: FADDs	fadds	%f8, %f10, %f25
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2383: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 2384: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2386: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982fc8  ! 2387: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc8, %hpstate
	.word 0x93902004  ! 2388: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8ef8a001  ! 2389: SDIVcc_I	sdivcc 	%r2, 0x0001, %r7
	.word 0x81a000ca  ! 2390: FNEGd	fnegd	%f10, %f0
	.word 0x93902003  ! 2391: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 2392: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc0d804a0  ! 2393: LDXA_R	ldxa	[%r0, %r0] 0x25, %r0
	.word 0x91d02035  ! 2394: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8a6e2001  ! 2395: UDIVX_I	udivx 	%r24, 0x0001, %r5
	.word 0x8f6a4010  ! 2396: SDIVX_R	sdivx	%r9, %r16, %r7
	.word 0x3e700001  ! 2397: BPVC	<illegal instruction>
	.word 0x91d02030  ! 2398: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d9024d3  ! 2399: WRPR_PSTATE_I	wrpr	%r0, 0x04d3, %pstate
	.word 0x99902002  ! 2400: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x87902273  ! 2401: WRPR_TT_I	wrpr	%r0, 0x0273, %tt
	.word 0x81982b49  ! 2402: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b49, %hpstate
	.word 0x93902006  ! 2403: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902001  ! 2404: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa1902007  ! 2405: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 2406: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879022c8  ! 2407: WRPR_TT_I	wrpr	%r0, 0x02c8, %tt
	.word 0x34800001  ! 2408: BG	bg,a	<label_0x1>
	.word 0x93d02032  ! 2409: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x81982190  ! 2410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0190, %hpstate
	.word 0x8d702001  ! 2411: POPC_I	popc	0x0001, %r6
	.word 0x8d902a99  ! 2412: WRPR_PSTATE_I	wrpr	%r0, 0x0a99, %pstate
	.word 0xb7540000  ! 2413: RDPR_GL	rdpr	%-, %r27
	.word 0x93d02030  ! 2414: Tcc_I	tne	icc_or_xcc, %r0 + 48
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2415: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 2416: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xa1902006  ! 2417: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87802004  ! 2418: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa551c000  ! 2419: RDPR_TL	rdpr	%tl, %r18
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xe4c7e010  ! 2421: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r18
	.word 0x8d802000  ! 2422: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_142:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 2423: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x819828c2  ! 2424: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c2, %hpstate
	.word 0xa1902002  ! 2425: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x956dc016  ! 2426: SDIVX_R	sdivx	%r23, %r22, %r10
	.word 0x8d902484  ! 2427: WRPR_PSTATE_I	wrpr	%r0, 0x0484, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2428: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 2429: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x99a01a77  ! 2430: FqTOi	fqtoi	
	.word 0xd807e001  ! 2431: LDUW_I	lduw	[%r31 + 0x0001], %r12
	ta	T_CHANGE_PRIV	! macro
	.word 0xa7a000d9  ! 2433: FNEGd	fnegd	%f56, %f50
	.word 0x97b20ff3  ! 2434: FONES	fones	%f11
	.word 0x864c000b  ! 2435: MULX_R	mulx 	%r16, %r11, %r3
	.word 0xa1902000  ! 2436: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa190200d  ! 2437: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x26800001  ! 2438: BL	bl,a	<label_0x1>
	.word 0x91d02033  ! 2439: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9f802001  ! 2440: SIR	sir	0x0001
	.word 0x8198218a  ! 2441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018a, %hpstate
	.word 0x8d902614  ! 2442: WRPR_PSTATE_I	wrpr	%r0, 0x0614, %pstate
	.word 0x87902279  ! 2443: WRPR_TT_I	wrpr	%r0, 0x0279, %tt
	.word 0x8d802004  ! 2444: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902006  ! 2445: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902006  ! 2446: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902007  ! 2447: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8790234f  ! 2448: WRPR_TT_I	wrpr	%r0, 0x034f, %tt
	.word 0xa1902002  ! 2449: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d802000  ! 2450: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02030  ! 2451: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x9f802001  ! 2452: SIR	sir	0x0001
	.word 0xaed28002  ! 2453: UMULcc_R	umulcc 	%r10, %r2, %r23
DS_143:
	.word 0x22800001  ! 2455: BE	be,a	<label_0x1>
	.word 0x34800001  ! 2455: BG	bg,a	<label_0x1>
	.word 0xaba00542  ! 2455: FSQRTd	fsqrt	
	.word 0xafa10825  ! 2454: FADDs	fadds	%f4, %f5, %f23
	.word 0x8d802004  ! 2455: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87902204  ! 2456: WRPR_TT_I	wrpr	%r0, 0x0204, %tt
	.word 0x84d4a001  ! 2457: UMULcc_I	umulcc 	%r18, 0x0001, %r2
	.word 0xc4800c80  ! 2458: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r2
	.word 0xaf702001  ! 2459: POPC_I	popc	0x0001, %r23
	.word 0x8d90248b  ! 2460: WRPR_PSTATE_I	wrpr	%r0, 0x048b, %pstate
	.word 0xef27e001  ! 2461: STF_I	st	%f23, [0x0001, %r31]
	.word 0xee5fc000  ! 2462: LDX_R	ldx	[%r31 + %r0], %r23
	.word 0x879023a6  ! 2463: WRPR_TT_I	wrpr	%r0, 0x03a6, %tt
	.word 0xa190200e  ! 2464: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8351c000  ! 2465: RDPR_TL	rdpr	%tl, %r1
	.word 0x806e800c  ! 2466: UDIVX_R	udivx 	%r26, %r12, %r0
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 2467: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa190200b  ! 2468: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xb4c36001  ! 2469: ADDCcc_I	addccc 	%r13, 0x0001, %r26
	.word 0xb46b000b  ! 2470: UDIVX_R	udivx 	%r12, %r11, %r26
	.word 0x8d902656  ! 2471: WRPR_PSTATE_I	wrpr	%r0, 0x0656, %pstate
	.word 0xa1902008  ! 2472: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xf527e001  ! 2473: STF_I	st	%f26, [0x0001, %r31]
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2474: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 2475: WRASI_I	wr	%r0, 0x0016, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02030  ! 2477: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xf4d804a0  ! 2478: LDXA_R	ldxa	[%r0, %r0] 0x25, %r26
	.word 0x26700001  ! 2479: BPL	<illegal instruction>
	.word 0xa1902002  ! 2480: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d902855  ! 2481: WRPR_PSTATE_I	wrpr	%r0, 0x0855, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9f802001  ! 2483: SIR	sir	0x0001
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f702001  ! 2485: POPC_I	popc	0x0001, %r7
	.word 0xa1902008  ! 2486: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93902004  ! 2487: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xcec804a0  ! 2488: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r7
	.word 0x9ba04dda  ! 2489: FdMULq	fdmulq	
	.word 0xda57c000  ! 2490: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x87902063  ! 2491: WRPR_TT_I	wrpr	%r0, 0x0063, %tt
	.word 0x90ac4004  ! 2492: ANDNcc_R	andncc 	%r17, %r4, %r8
	.word 0x8750c000  ! 2493: RDPR_TT	rdpr	%tt, %r3
	.word 0x9f802001  ! 2494: SIR	sir	0x0001
	.word 0x9f802001  ! 2495: SIR	sir	0x0001
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 2496: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 2497: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_tl1_144:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro


.global user_data_start
.data
user_data_start:
	.xword	0x492038e609346266
	.xword	0x238792bdd07b002a
	.xword	0x6be7c240c5f1f96b
	.xword	0x0f5e42e17e8d5203
	.xword	0x96f26d8fd0e481bb
	.xword	0x374bb981f1a12faf
	.xword	0xffc47243ee6255f8
	.xword	0xbac573b10e249761
	.xword	0xe6a6bef327eb77b4
	.xword	0x2605540077174628
	.xword	0x85be0073a2efdc03
	.xword	0xe9e2f2c8b1e68902
	.xword	0x5126f6c7cd60bddd
	.xword	0x03385ddd7c68b168
	.xword	0x4284889e1efcd454
	.xword	0xb53d46e278222b56
	.xword	0x09aa4d19fbe32655
	.xword	0x206b6fbb40e3e0f2
	.xword	0xa325dbb2de355bce
	.xword	0x1d6c8d01d78792fb
	.xword	0xc2b5c5ca3913b722
	.xword	0x815a237c527559b9
	.xword	0x5da120ac743a1940
	.xword	0x4b4a5545a5b9b33b
	.xword	0x01a10bdf96e94c47
	.xword	0xc3d495cfb7744fa1
	.xword	0xc208a4c3092d6ea3
	.xword	0x7606455d3422ccf1
	.xword	0x45af4ce4a2841eef
	.xword	0x7a4acf913751b016
	.xword	0x1af85e5b3baf6674
	.xword	0x2ffb60923e8bcc78
	.xword	0x1120f202c6ee7ed6
	.xword	0xa5c22bf21c071a42
	.xword	0xee79ac0b7d428ee9
	.xword	0x1e93aacada6939b3
	.xword	0x9fd058bfb8ccc653
	.xword	0x02f5f3096214d76b
	.xword	0xc696ac1a8d80083e
	.xword	0x8a9db6ba978aaa06
	.xword	0x23c8f9f2d04ec2ab
	.xword	0xfac1e5bf9ce26ea9
	.xword	0xeea8500c0c3eb356
	.xword	0xfff77a9223a7a90e
	.xword	0xb172f9f25e1ee358
	.xword	0x531bae5baea9071b
	.xword	0x900a7588fac01e87
	.xword	0x7a8723d7f961a85b
	.xword	0x547751969d75b3e3
	.xword	0xead293ca0ca39a19
	.xword	0x399a70affc2087a2
	.xword	0xb37bc834e8da6fb7
	.xword	0x40d93b673230981e
	.xword	0x79d8e00dd35ef683
	.xword	0xc0703cea4b3ebb6e
	.xword	0x70329fbff707f579
	.xword	0x7131569efdd63bc5
	.xword	0xd737f83bdfba4112
	.xword	0xe0592129d161ead9
	.xword	0xe44d8fd3d47ad97a
	.xword	0x2b0980d0b81b213a
	.xword	0xcd9f3f748479b022
	.xword	0x36dbaf59bb12cb2c
	.xword	0xbbc10ebe65526310
	.xword	0x27a9610b02ed4bae
	.xword	0xd5f085292d893b7c
	.xword	0x8ce5dbf05530b34a
	.xword	0xf8433bd649c9151e
	.xword	0x926a56f9842380a9
	.xword	0x42e8dd14d580c5e9
	.xword	0x7424ca380738b3b0
	.xword	0xe0e1c3b8200d860d
	.xword	0xc99fed0a7d6b8b39
	.xword	0x6e085188f7abe833
	.xword	0xc71674b1c519edf4
	.xword	0x574b668ec08675e6
	.xword	0x01608d93a87ea2f8
	.xword	0x0aabccee128e0105
	.xword	0x08ac0ae6e2cf0036
	.xword	0xde47ec47e5cc1fd8
	.xword	0xddaf707df7f2076e
	.xword	0xf4c4b6e30a82bd5d
	.xword	0x4b6069fff80884f5
	.xword	0x59b5c29e60c9e0c0
	.xword	0x244e9931fa0225a7
	.xword	0x237393d0adc52032
	.xword	0x09936c38cdf8277b
	.xword	0xce1d0cba594cbc55
	.xword	0x0966db7e0aeee2e4
	.xword	0x5205bd625ac55293
	.xword	0x767c39dfe87e494f
	.xword	0x576fbcbe15a7ac12
	.xword	0x74847fd2e696137f
	.xword	0x16af3bb1c7cceee3
	.xword	0x46af8e2d5ac944ee
	.xword	0x00a559ecb7f59e7d
	.xword	0x51fe0cf3418f6dd2
	.xword	0x06e15bee44eb66a4
	.xword	0x169c21774e1d239e
	.xword	0xfa9810ba2568e866
	.xword	0xcf2f292ea747e7d5
	.xword	0x5b50926f0ada6224
	.xword	0x9a408938704936a8
	.xword	0xc7ea174f5084811f
	.xword	0x87a4027606570621
	.xword	0xd6dcf08ac7ce91de
	.xword	0xb37eea7d81fa5291
	.xword	0x89198a169ab57d90
	.xword	0x0474e5e1178e9781
	.xword	0x27df6ef27e2dd798
	.xword	0x5e2154e5c1c74e59
	.xword	0x76ef4689bf700b4f
	.xword	0x4cefe11b1f995f70
	.xword	0xc4b61449b67c1053
	.xword	0x49571d8941e54055
	.xword	0x0fa8738c60849491
	.xword	0x1940bfbaeff19a83
	.xword	0x92fcd334a26a819b
	.xword	0xba8cc2578b96fdb9
	.xword	0xae4b87ac6cad076c
	.xword	0xcbb688a87b350dbe
	.xword	0x26d012645ee6a9e4
	.xword	0xd93701239132a983
	.xword	0x486e4b287d7f66ce
	.xword	0xe2e2434b562baaef
	.xword	0x71b5149ad12a774a
	.xword	0x2cd394761de81f86
	.xword	0x01ea9ed07b0da203
	.xword	0xac35218fcfe67da5
	.xword	0x04b8d417a18cbf42
	.xword	0x2dae882e04e3e367
	.xword	0x2f10a5acdefbdffa
	.xword	0xc6109a95754d6675
	.xword	0xa4f7e3d0003f4ab9
	.xword	0xae4373b3ee3302f4
	.xword	0xc2d3b86e370b7f54
	.xword	0x7e5b3e533a40d9c6
	.xword	0xbc373deca9b774e3
	.xword	0x3b75d12c331009e8
	.xword	0x19be250f825c7f3e
	.xword	0x4dbd6e5ab8d0c868
	.xword	0x772c58e84e77b71d
	.xword	0x0b78199bac7f0828
	.xword	0xbefd8e1c2a1610a9
	.xword	0x72a3d41449a45389
	.xword	0x55a9cc47e73380d6
	.xword	0xb3e1eb942640810f
	.xword	0xe9750daa848d1c33
	.xword	0x85c4b1a3a1d142e1
	.xword	0xfc8718e48106d435
	.xword	0x489e1c9ec961fe09
	.xword	0x788982c61f5dd0ce
	.xword	0xc678efd0fa207b63
	.xword	0x5bb9d1ff1b3942fc
	.xword	0xace7f72bd962780f
	.xword	0xb3e177026e8771a2
	.xword	0x5150845bbb499340
	.xword	0x7c955ef4b77bf3e0
	.xword	0xab53e0b185e69df5
	.xword	0x101eba6135fbd1da
	.xword	0xa4743c0e17e3819c
	.xword	0xbc1690d8e565a71d
	.xword	0x35d3792399ce85ee
	.xword	0x8f11066c09373684
	.xword	0xe3e9c70f90da8055
	.xword	0x2082cf0de74e21c4
	.xword	0x09e697d3d5744caa
	.xword	0x38f84f07e939e812
	.xword	0x04e13f1fbe3bcd9f
	.xword	0xdb7228331b8a838a
	.xword	0x7271203366a2a046
	.xword	0x4ef63741227c7edb
	.xword	0xa8f2273f025bc10b
	.xword	0x668a265a710dfca2
	.xword	0xefdc5afe16be96a7
	.xword	0x22de2449cfa8315a
	.xword	0x2f5d09ac10a4e870
	.xword	0x4e3b34da751cafc3
	.xword	0x959638be030c97f8
	.xword	0x454357ddbcf103e7
	.xword	0xb7c4b73e361b214c
	.xword	0x61ccbe1baa3dcde7
	.xword	0x04842fea6238d289
	.xword	0xe9100c2cfc5e578a
	.xword	0x5c59d15a0c390477
	.xword	0xe7cdd0a106ba057b
	.xword	0x0e33f62ef15d1273
	.xword	0x64f14fde7d1595d2
	.xword	0x60e23fc48e3a39c4
	.xword	0xa5cb0acfac4bb391
	.xword	0x0ed0fe7b859329c1
	.xword	0x9a5969871a2004ab
	.xword	0xce80401892fa2a52
	.xword	0xd864b327a2b0dabc
	.xword	0x0449fd38c5cac914
	.xword	0x52f91ac4d0acc6c9
	.xword	0x00b6959670ceb169
	.xword	0xa6186d13f7d6d0d0
	.xword	0xd0e7818703ff9e78
	.xword	0x5358ef1f31c4187f
	.xword	0xd206c962c9b7fc6e
	.xword	0xfe6b524d918e967b
	.xword	0xcf1953ece4bcf03d
	.xword	0x7d1e6f7ee473a264
	.xword	0x1de35792554e89f4
	.xword	0xf3ecd88bb992b584
	.xword	0xd568c273bd9a032c
	.xword	0x3442583650a7b6a0
	.xword	0x106198b05429f0e9
	.xword	0x4cf3d91db12c6e3f
	.xword	0xeb9339db62d3bc5d
	.xword	0x4a9cd054a3a81591
	.xword	0xcccb514539b535cc
	.xword	0x46d82ab60b32d009
	.xword	0x32041843d7499fb2
	.xword	0x3570796fb8582ffb
	.xword	0x4a0373754d1595e5
	.xword	0x7bd55ed79634e8c6
	.xword	0xc363bd888d0a83b4
	.xword	0x5d293d062b4f763a
	.xword	0xbbd8bb5aff6b344a
	.xword	0x824241c58dd6ff59
	.xword	0xf01a0475e974e5b2
	.xword	0x6440c6301919ecc0
	.xword	0xa97abfad8b2d7ff5
	.xword	0xc217ce455c3f24b3
	.xword	0x9a0e6f27e19560ee
	.xword	0x3ef6530b1459d7e2
	.xword	0x1888c73bccd1c0be
	.xword	0xd2e993cc946dc99c
	.xword	0x5d14762ec63cefbc
	.xword	0xd63798e7e8beb498
	.xword	0x53fcbeb100363d53
	.xword	0x863032105b4be289
	.xword	0x56c7c0f19ca9d246
	.xword	0x46bbe5ac1834f265
	.xword	0xed5a74580d13e6ef
	.xword	0xc06fc75c0de101ab
	.xword	0x52806f46f860d957
	.xword	0xfe54ca71963fb150
	.xword	0x062c4fda663d18a6
	.xword	0x96d78815fec0c423
	.xword	0xc0c6cecc3678c032
	.xword	0xa003b702cd2c507c
	.xword	0xdfb53087bfb475b5
	.xword	0x994438cb01f2c425
	.xword	0xe26f4b2a94e146aa
	.xword	0xb6ebcc6f909f79a7
	.xword	0x41671f989cbf7926
	.xword	0x5d451b34e764505d
	.xword	0x4367170097e6a60d
	.xword	0x6221a821d6d24c8b
	.xword	0xe83a6d666be4f333
	.xword	0xa4591b507d84d0c7
	.xword	0x22faeb30929a6e78
	.xword	0xdd1ed9b661174829


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Tue Apr 27 11:14:05 2004
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
