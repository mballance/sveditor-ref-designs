/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand04_ind_11.s
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
    rdpr %cleanwin, %l1;\
    add %l1,1,%l1;\
    wrpr %l1, %g0, %cleanwin;\
    retry; nop; nop; nop; nop

#define H_T1_Clean_Window_0x25
#define SUN_H_T1_Clean_Window_0x25 \
    rdpr %cleanwin, %l1;\
    add %l1,1,%l1;\
    wrpr %l1, %g0, %cleanwin;\
    retry; nop; nop; nop; nop

#define H_T1_Clean_Window_0x26
#define SUN_H_T1_Clean_Window_0x26 \
    rdpr %cleanwin, %l1;\
    add %l1,1,%l1;\
    wrpr %l1, %g0, %cleanwin;\
    retry; nop; nop; nop; nop

#define H_T1_Clean_Window_0x27
#define SUN_H_T1_Clean_Window_0x27 \
    rdpr %cleanwin, %l1;\
    add %l1,1,%l1;\
    wrpr %l1, %g0, %cleanwin;\
    retry; nop; nop; nop; nop

#define H_HT0_Tag_Overflow
#define My_HT0_Tag_Overflow \
    done;nop;

#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow \
    done;nop;

#define H_T1_Tag_Overflow_0x23
#define SUN_H_T1_Tag_Overflow_0x23 \
    done;nop;

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
    save %i7, %g0, %i7;  \
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    stw %l2, [%i7];\
    restore %i7, %g0, %i7; \
    retry
#define H_T0_Trap_Instruction_1
#define My_T0_Trap_Instruction_1 \
    umul %o4, 2, %o5;\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    stw %l2, [%i7];\
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
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    retry ;\
    illtrap
#define H_T0_Trap_Instruction_5
#define My_T0_Trap_Instruction_5 \
    umul %i7, 2, %l1;\
    inc %o5;\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
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
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    stw %l2, [%i7];\
    wrpr %l2, %tnpc; \
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
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    stw %l2, [%i7];\
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    retry ;\
    illtrap
#define H_T1_Trap_Instruction_5
#define My_T1_Trap_Instruction_5 \
    umul %i7, 2, %l1;\
    inc %o5;\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    sdiv    %r2, %r10, %r0; \
    retry

#define H_HT0_Trap_Instruction_0 
#define My_HT0_Trap_Instruction_0 \
    rd %asi, %l2;\
    mov 8, %l3;\
    stxa %l3, [%g0] 0x57;\
    stw %l2, [%i7];\
    done;\
    nop;nop;nop

#define H_HT0_Trap_Instruction_1
#define My_HT0_Trap_Instruction_1 \
    rd %asi, %l2;\
    mov 8, %l3;\
    stxa %l3, [%g0] 0x5f;\
    done;\
    nop;nop;nop;nop
#define H_HT0_Trap_Instruction_2
#define My_HT0_Trap_Instruction_2 \
    umul %i6, 2, %l4;\
    stw %l4, [%i7];\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    sdiv    %r2, %r0, %r0; \
    retry
#define H_HT0_Trap_Instruction_3
#define My_HT0_Trap_Instruction_3 \
    umul %i5, 3, %l3;\
    inc %o6;\
    illtrap ;\
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    wrpr %l2, %tnpc; \
    retry
#define H_HT0_Trap_Instruction_4
#define My_HT0_Trap_Instruction_4 \
    save %i7, %g0, %i7;  \
    rdpr %tnpc, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 4, %l2;\
    stw %l2, [%i7];\
    wrpr %l2, %tnpc; \
    restore %i7, %g0, %i7 ;\
    retry
#define H_HT0_Trap_Instruction_5
#define My_HT0_Trap_Instruction_5 \
    ba htrap_5_ext;\
    nop; retry;\
    nop; nop; nop; nop; nop

#define H_HT0_Mem_Address_Not_Aligned_0x34
#define My_HT0_Mem_Address_Not_Aligned_0x34 \
    umul %i7, 4, %l1;\
    inc %o6;\
    umul %i4, 3, %l3;\
    inc %l6;\
    save %i7, %g0, %i7 ;\
    restore %i7, %g0, %i7 ;\
    done ;\
    nop; 
#define H_HT0_Illegal_instruction_0x10
#define My_HT0_Illegal_instruction_0x10 \
    umul %i0, 4, %l1;\
    inc %o6;\
    ba 7f; \
    rdhpr %htstate, %l3;\
    8: done; \
    7: ba 8b;\
    wrhpr %l3, 1, %htstate;nop

#define H_HT0_DAE_so_page_0x30
#define My_HT0_DAE_so_page_0x30 \
    umul %i5, 4, %l5;\
    inc %l6;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    rd %fprs, %l2; \
    wr %l2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_DAE_invalid_asi_0x14
#define SUN_H_HT0_DAE_invalid_asi_0x14 \
    umul %i5, 4, %l5;\
    inc %l6;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    rd %fprs, %l2; \
    wr %l2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_DAE_privilege_violation_0x15
#define SUN_H_HT0_DAE_privilege_violation_0x15 \
    umul %i5, 4, %l5;\
    inc %l6;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    rd %fprs, %l2; \
    wr %l2, 0x4, %fprs ;\
    done; \
    nop;
#define H_HT0_Privileged_Action_0x37
#define My_HT0_Privileged_Action_0x37 \
    inc %l5;\
    dec %l3;\
    umul %i5, 4, %l5;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop
#define H_HT0_Lddf_Mem_Address_Not_Aligned_0x35
#define My_HT0_Lddf_Mem_Address_Not_Aligned_0x35 \
    inc %l5;\
    dec %l3;\
    rdpr %tpc, %l2; \
    add %l2, 0x4, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 0x4, %l2; \
    wrpr %l2, %tnpc; \
    retry
#define H_HT0_Stdf_Mem_Address_Not_Aligned_0x36
#define My_HT0_Stdf_Mem_Address_Not_Aligned_0x36 \
    inc %l5;\
    dec %l3;\
    rdpr %tpc, %l2; \
    add %l2, 0x4, %l2; \
    wrpr %l2, %tpc; \
    add %l2, 0x4, %l2; \
    wrpr %l2, %tnpc; \
    retry
#define H_HT0_Fp_exception_other_0x22
#define My_HT0_Fp_exception_other_0x22 \
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    stw %l2, [%i7];\
    done; \
    nop
#define H_HT0_Division_By_Zero
#define My_HT0_Division_By_Zero \
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop
#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero \
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop
#define H_T1_Division_By_Zero_0x28
#define My_H_T1_Division_By_Zero_0x28 \
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop

#define H_T0_Division_By_Zero
#define My_T0_Division_By_Zero\
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop

#define H_T1_Fp_Exception_Other_0x22
#define My_H_T1_Fp_Exception_Other_0x22 \
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    done; \
    nop; nop
#define H_T1_Privileged_Opcode_0x11
#define SUN_H_T1_Privileged_Opcode_0x11 \
    inc %l6;\
    dec %l5;\
    stw %l5, [%i7];\
    umul %i5, 4, %l2;\
    restore %i7, %g0, %i7;\
    save %i7, %g0, %i7; \
    done; \
    nop;

#define H_HT0_Privileged_opcode_0x11
#define My_HT0_Privileged_opcode_0x11 \
    xor %i0, %l1, %l1;\
    and %l1, 0xf, %l1; \
    ba hh11_1; \
    not %g0, %l2; \
    hh11_2: done; \
    hh11_1: xor %l1, %l2, %l2; \
    ba hh11_2; \
    jmp %l2;

#define H_HT0_Fp_disabled_0x20
#define My_HT0_Fp_disabled_0x20 \
    mov  0x4, %l2 ;\
    wr %l2, 0x0, %fprs ;\
    sllx %l2, 10, %l3; \
    rdpr %tstate, %l2;\
    or %l2, %l3, %l2 ;\
    stw %l2, [%i7];\
    wrpr %l2, 0x0, %tstate;\
    retry;

#define H_T0_Fp_disabled_0x20
#define My_T0_Fp_disabled_0x20 \
    mov  0x4, %l2 ;\
    wr %l2, 0x0, %fprs ;\
    sllx %l2, 10, %l3; \
    rdpr %tstate, %l2;\
    or %l2, %l3, %l2 ;\
    wrpr %l2, 0x0, %tstate;\
    retry; nop

#define H_T1_Fp_Disabled_0x20
#define My_H_T1_Fp_Disabled_0x20 \
    mov  0x4, %l2 ;\
    wr %l2, 0x0, %fprs ;\
    sllx %l2, 10, %l3; \
    rdpr %tstate, %l2;\
    or %l2, %l3, %l2 ;\
    wrpr %l2, 0x0, %tstate;\
    stw %l2, [%i7];\
    retry

#define H_HT0_Watchdog_Reset_0x02
#define My_HT0_Watchdog_Reset_0x02 \
    ba wdog_2_ext;\
    nop;retry;nop;nop;nop;nop;nop

#define H_T0_Privileged_opcode_0x11
#define My_T0_Privileged_opcode_0x11 \
    xor %i0, %l1, %l1;\
    and %l1, 0xf, %l1; \
    ba h11_1; \
    not %g0, %l2; \
    h11_2: done; \
    h11_1: xor %l1, %l2, %l2; \
    ba h11_2; \
    jmp %l2;

#define H_T1_Fp_exception_other_0x22
#define My_T1_Fp_exception_other_0x22 \
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    restore %i7, %g0, %i7 ; \
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    ldx [%l2], %l2;\
    done; 

#define H_T0_Fp_exception_other_0x22
#define My_T0_Fp_exception_other_0x22 \
    inc %l6;\
    dec %l5;\
    umul %i5, 4, %l2;\
    save %i7, %g0, %i7; \
    restore %i7, %g0, %i7;\
    stw %l2, [%i7];\
    done; \
    nop

#define H_HT0_Trap_Level_Zero_0x5f
#define My_HT0_Trap_Level_Zero_0x5f \
    not %g0, %l2; \
    rdhpr %hpstate, %l3;\
    jmp %l2;\
    rdhpr %htstate, %l3;\
    and %l3, 0xfe, %l3;\
    wrhpr %l3, 0, %htstate;\
    stw %l2, [%i7];\
    retry

#define My_Watchdog_Reset
#define My_Watchdog_Reset \
    ba wdog_red_ext;\
    nop;retry;nop;nop;nop;nop;nop

#define H_HT0_Control_Transfer_Instr_0x74
#define My_H_HT0_Control_Transfer_Instr_0x74 \
    rdpr %tstate, %l3;\
    and %l3, 0xfff, %l3;\
    wrpr %l3, %tstate ;\
    retry;nop;

#define H_T0_Control_Transfer_Instr_0x74
#define My_H_T0_Control_Transfer_Instr_0x74 \
    rdpr %tstate, %l3;\
    and %l3, 0xfff, %l3;\
    wrpr %l3, %tstate ;\
    retry;nop;

#define H_T1_Control_Transfer_Instr_0x74
#define My_H_T1_Control_Transfer_Instr_0x74 \
    rdpr %tstate, %l3;\
    and %l3, 0xfff, %l3;\
    wrpr %l3, %tstate ;\
    retry;nop;
    

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
	mov 0xb1, %r14
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
	mov 0xb2, %r14
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
	mov 0xb0, %r14
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
	mov 0x32, %r14
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
	mov 0x35, %r14
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
	ta	%icc, T_RD_THID
! fork: source strm = 0xffffffff; target strm = 0x1
	cmp	%o1, 0
	setx	fork_lbl_0_1, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x2
	cmp	%o1, 1
	setx	fork_lbl_0_2, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x4
	cmp	%o1, 2
	setx	fork_lbl_0_3, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x8
	cmp	%o1, 3
	setx	fork_lbl_0_4, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x10
	cmp	%o1, 4
	setx	fork_lbl_0_5, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x20
	cmp	%o1, 5
	setx	fork_lbl_0_6, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x40
	cmp	%o1, 6
	setx	fork_lbl_0_7, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
! fork: source strm = 0xffffffff; target strm = 0x80
	cmp	%o1, 7
	setx	fork_lbl_0_8, %g2, %g3
	be,a	.+8
	jmp	%g3
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_8:
	.word 0x91d020b5  ! 1: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x91d02032  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200c  ! 3: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_lsu_7_0:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 4: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93514000  ! 5: RDPR_TBA	rdpr	%tba, %r9
tagged_7_1:
	taddcctv %r13, 0x10d9, %r9
	.word 0xcc07e001  ! 6: LDUW_I	lduw	[%r31 + 0x0001], %r6
DS_7_2:
	.word 0x22800001  ! 8: BE	be,a	<label_0x1>
	pdist %f4, %f30, %f16
	.word 0x85b14315  ! 7: ALLIGNADDRESS	alignaddr	%r5, %r21, %r2
	.word 0x97514000  ! 8: RDPR_TBA	<illegal instruction>
tagged_7_3:
	taddcctv %r24, 0x1f6c, %r22
	.word 0xc807e001  ! 9: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc81fe001  ! 10: LDD_I	ldd	[%r31 + 0x0001], %r4
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 11: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc8c7e030  ! 12: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r4
	.word 0xc917c000  ! 13: LDQF_R	-	[%r31, %r0], %f4
	.word 0xc89fe001  ! 14: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 15: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x99902001  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xc807c000  ! 17: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0x8d802004  ! 18: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9345c000  ! 19: RD_TICK_CMPR_REG	rd	%-, %r9
	.word 0x91d02034  ! 20: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_7_4:
	.word 0x32800001  ! 22: BNE	bne,a	<label_0x1>
	.word 0xe5368000  ! 22: STQF_R	-	%f18, [%r0, %r26]
	normalw
	.word 0x99458000  ! 21: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x87902093  ! 22: WRPR_TT_I	wrpr	%r0, 0x0093, %tt
DS_7_5:
	.word 0x32800001  ! 24: BNE	bne,a	<label_0x1>
	.word 0xeb314012  ! 24: STQF_R	-	%f21, [%r18, %r5]
	normalw
	.word 0xb5458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r26
tagged_7_6:
	tsubcctv %r12, 0x1334, %r24
	.word 0xd607e001  ! 24: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x87902311  ! 25: WRPR_TT_I	wrpr	%r0, 0x0311, %tt
splash_tba_7_7:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 26: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982ac4  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac4, %hpstate
splash_lsu_7_8:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd65fe001  ! 29: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d7e020  ! 30: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	.word 0x8950c000  ! 31: RDPR_TT	rdpr	%tt, %r4
	.word 0xda07c000  ! 32: LDUW_R	lduw	[%r31 + %r0], %r13
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 33: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982d5d  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d5d, %hpstate
	.word 0xdad7e030  ! 36: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	.word 0xda47c000  ! 37: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0x81982554  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0554, %hpstate
	.word 0x81464000  ! 39: RD_STICK_CMPR_REG	stbar
	.word 0x89464000  ! 40: RD_STICK_CMPR_REG	rd	%-, %r4
	.word 0x8d903912  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x1912, %pstate
	.word 0x87802063  ! 42: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xa190200d  ! 43: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x879021eb  ! 44: WRPR_TT_I	wrpr	%r0, 0x01eb, %tt
DS_7_9:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_7_10:
	.word 0x20800001  ! 47: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 46: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 47: BL	bl,a	<label_0x1>
DS_7_11:
	.word 0x22800001  ! 49: BE	be,a	<label_0x1>
	pdist %f4, %f12, %f6
	.word 0x97b34317  ! 48: ALLIGNADDRESS	alignaddr	%r13, %r23, %r11
	.word 0xa1902005  ! 49: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd65fe001  ! 50: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d804a0  ! 51: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0xd68008a0  ! 52: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x87902348  ! 53: WRPR_TT_I	wrpr	%r0, 0x0348, %tt
splash_htba_7_12:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 54: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902b56  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x0b56, %pstate
	.word 0xd617e001  ! 56: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0x87902335  ! 57: WRPR_TT_I	wrpr	%r0, 0x0335, %tt
	.word 0xd68008a0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_7_13:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790208a  ! 60: WRPR_TT_I	wrpr	%r0, 0x008a, %tt
	.word 0x93d02034  ! 61: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xd68008a0  ! 62: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_7_14:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1836001  ! 63: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0xd6d7e020  ! 64: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	.word 0x8d9038a4  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x18a4, %pstate
	.word 0x26700001  ! 66: BPL	<illegal instruction>
	.word 0x8950c000  ! 67: RDPR_TT	rdpr	%tt, %r4
	.word 0x8d9038ed  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x18ed, %pstate
	.word 0x30800001  ! 69: BA	ba,a	<label_0x1>
splash_lsu_7_15:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 70: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026ad  ! 71: WRPR_PSTATE_I	wrpr	%r0, 0x06ad, %pstate
splash_lsu_7_16:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 72: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 73: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe137c009  ! 74: STQF_R	-	%f16, [%r9, %r31]
	.word 0xe057c000  ! 75: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0x819822cd  ! 76: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cd, %hpstate
splash_tba_7_17:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 77: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802000  ! 78: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_htba_7_18:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_7_19:
	taddcctv %r2, 0x1813, %r21
	.word 0xe007e001  ! 80: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8d90258c  ! 81: WRPR_PSTATE_I	wrpr	%r0, 0x058c, %pstate
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 82: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 83: BNE	bne,a	<label_0x1>
	.word 0x91d02035  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902045  ! 85: WRPR_TT_I	wrpr	%r0, 0x0045, %tt
	.word 0xe0d7e000  ! 86: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	.word 0x97504000  ! 87: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0x91d02034  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x26700001  ! 89: BPL	<illegal instruction>
	.word 0x8d902f91  ! 90: WRPR_PSTATE_I	wrpr	%r0, 0x0f91, %pstate
	.word 0x9f802001  ! 91: SIR	sir	0x0001
	.word 0x91d02033  ! 92: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x819828cf  ! 93: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cf, %hpstate
	.word 0xc24fc000  ! 94: LDSB_R	ldsb	[%r31 + %r0], %r1
DS_7_20:
	.word 0x32800001  ! 96: BNE	bne,a	<label_0x1>
	.xword 0xb7c78248	! Random illegal ?
	.word 0xd111c002  ! 96: LDQF_R	-	[%r7, %r2], %f8
	.word 0xa3a30832  ! 95: FADDs	fadds	%f12, %f18, %f17
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 96: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_7_21:
	taddcctv %r10, 0x14f0, %r25
	.word 0xc007e001  ! 97: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x2a800001  ! 98: BCS	bcs,a	<label_0x1>
	.word 0xc08804a0  ! 99: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0xa1902009  ! 100: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xc017c000  ! 101: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc03fe001  ! 102: STD_I	std	%r0, [%r31 + 0x0001]
	.word 0x93902004  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xc08008a0  ! 104: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x93902001  ! 105: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81460000  ! 106: RD_STICK_REG	stbar
	.word 0xc01fc000  ! 107: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x81982007  ! 108: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0007, %hpstate
	.word 0xc0c7e020  ! 109: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r0
	.word 0x8d902e13  ! 110: WRPR_PSTATE_I	wrpr	%r0, 0x0e13, %pstate
	.word 0x9b500000  ! 111: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xa5500000  ! 112: RDPR_TPC	<illegal instruction>
splash_cmpr_7_22:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 113: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0xe097e030  ! 114: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
tagged_7_23:
	taddcctv %r6, 0x1b8b, %r13
	.word 0xe007e001  ! 115: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe0d7e020  ! 116: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
	.word 0x81982006  ! 117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0006, %hpstate
	.word 0xe0d804a0  ! 118: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	ta	T_CHANGE_HPRIV	! macro
DS_7_24:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 120: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_tba_7_25:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 121: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0d80e40  ! 122: LDXA_R	ldxa	[%r0, %r0] 0x72, %r16
	.word 0x9f802001  ! 123: SIR	sir	0x0001
	.word 0x81982857  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0857, %hpstate
	.word 0xe0dfe010  ! 125: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r16
	.word 0x8790219b  ! 126: WRPR_TT_I	wrpr	%r0, 0x019b, %tt
	.word 0x87902278  ! 127: WRPR_TT_I	wrpr	%r0, 0x0278, %tt
	.word 0xe01fc000  ! 128: LDD_R	ldd	[%r31 + %r0], %r16
change_to_randtl_7_26:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 129: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d9023ff  ! 130: WRPR_PSTATE_I	wrpr	%r0, 0x03ff, %pstate
splash_lsu_7_27:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 133: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1854009  ! 132: WR_STICK_REG_R	wr	%r21, %r9, %-
	.word 0x819820dd  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dd, %hpstate
	.word 0xe08008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
change_to_randtl_7_29:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 135: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xe08008a0  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x93902002  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902685  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x0685, %pstate
	.word 0xb0fd6001  ! 139: SDIVcc_I	sdivcc 	%r21, 0x0001, %r24
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 140: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 141: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xca800ba0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r5
	.word 0x8780201c  ! 143: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8d903658  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x1658, %pstate
	.word 0x8d903168  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x1168, %pstate
	.word 0xcad00e60  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r5
DS_7_30:
	.word 0x20800001  ! 148: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
DS_7_31:
	.word 0x20800001  ! 149: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 148: SAVE_R	save	%r31, %r0, %r31
	.word 0xca8008a0  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xca97e000  ! 150: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r5
	.word 0x986a000c  ! 151: UDIVX_R	udivx 	%r8, %r12, %r12
	.word 0xc84fe001  ! 152: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0xc8c80e40  ! 153: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r4
	.word 0xc89fe001  ! 154: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
splash_tba_7_32:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc827e001  ! 156: STW_I	stw	%r4, [%r31 + 0x0001]
	.word 0xc8d004a0  ! 157: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_lsu_7_33:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad514000  ! 159: RDPR_TBA	rdpr	%tba, %r22
	.word 0xd737c018  ! 160: STQF_R	-	%f11, [%r24, %r31]
	.word 0xd61fc000  ! 161: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd6c7e020  ! 162: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
	.word 0xd6dfe030  ! 163: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0xa345c000  ! 164: RD_TICK_CMPR_REG	rd	%-, %r17
	.word 0x91508000  ! 165: RDPR_TSTATE	<illegal instruction>
	.word 0xd89fe001  ! 166: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 167: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8900e40  ! 169: LDUHA_R	lduha	[%r0, %r0] 0x72, %r12
	.word 0x819820c5  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c5, %hpstate
	.word 0xd84fc000  ! 171: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x81982bdf  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdf, %hpstate
	.word 0x8d902848  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x0848, %pstate
	.word 0x9f802001  ! 174: SIR	sir	0x0001
DS_7_34:
	.word 0x34800001  ! 176: BG	bg,a	<label_0x1>
	pdist %f12, %f8, %f16
	.word 0x93b1430b  ! 175: ALLIGNADDRESS	alignaddr	%r5, %r11, %r9
DS_7_35:
	.word 0x32800001  ! 177: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 176: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_7_36:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 178: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 179: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d9031a0  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x11a0, %pstate
	.word 0x93902003  ! 181: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_7_37:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 182: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 183: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902ff1  ! 184: WRPR_PSTATE_I	wrpr	%r0, 0x0ff1, %pstate
	.word 0x93d02035  ! 185: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xe2d004a0  ! 186: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x81982494  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0494, %hpstate
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90214a  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x014a, %pstate
splash_tba_7_38:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 190: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902002  ! 191: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa190200e  ! 192: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x91d02032  ! 193: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87902231  ! 194: WRPR_TT_I	wrpr	%r0, 0x0231, %tt
	.word 0x83d02035  ! 195: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8f51c000  ! 196: RDPR_TL	rdpr	%tl, %r7
	.word 0x8d902e0d  ! 197: WRPR_PSTATE_I	wrpr	%r0, 0x0e0d, %pstate
	.word 0x91d02033  ! 198: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd607c000  ! 199: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x91d02035  ! 200: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_7_39:
	taddcctv %r25, 0x1ed0, %r14
	.word 0xd607e001  ! 201: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x85508000  ! 202: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0xc48804a0  ! 203: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc48008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc48008a0  ! 205: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
change_to_randtl_7_40:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 206: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xc48008a0  ! 207: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02035  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02034  ! 210: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x32800001  ! 212: BNE	bne,a	<label_0x1>
	.word 0x8198230f  ! 213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030f, %hpstate
	.word 0xa190200f  ! 214: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_7_41:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 215: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_7_42:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc4800b00  ! 217: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r2
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 219: WRASI_I	wr	%r0, 0x0014, %asi
DS_7_43:
	.word 0x22800001  ! 221: BE	be,a	<label_0x1>
	.word 0xc9302001  ! 221: STQF_I	-	%f4, [0x0001, %r0]
	normalw
	.word 0xb1458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r24
splash_lsu_7_44:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 221: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xeec80e80  ! 222: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r23
	.word 0xad50c000  ! 223: RDPR_TT	rdpr	%tt, %r22
	.word 0x8d802000  ! 224: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802004  ! 225: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xce8008a0  ! 226: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x87802020  ! 227: WRASI_I	wr	%r0, 0x0020, %asi
splash_tba_7_45:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 228: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x34700001  ! 229: BPG	<illegal instruction>
	.word 0xa9508000  ! 230: RDPR_TSTATE	rdpr	%tstate, %r20
	.word 0x87902374  ! 231: WRPR_TT_I	wrpr	%r0, 0x0374, %tt
tagged_7_46:
	tsubcctv %r24, 0x1137, %r7
	.word 0xe207e001  ! 232: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x87902121  ! 233: WRPR_TT_I	wrpr	%r0, 0x0121, %tt
	.word 0xe28008a0  ! 234: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x94acc00c  ! 235: ANDNcc_R	andncc 	%r19, %r12, %r10
DS_7_47:
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 236: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982f0f  ! 237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0f, %hpstate
	.word 0x87802020  ! 238: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x879021e2  ! 239: WRPR_TT_I	wrpr	%r0, 0x01e2, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 240: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc61fe001  ! 241: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x2c800001  ! 242: BNEG	bneg,a	<label_0x1>
	.word 0xc6c7e000  ! 243: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r3
	.word 0x8d902628  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x0628, %pstate
	.word 0x8d9024ec  ! 245: WRPR_PSTATE_I	wrpr	%r0, 0x04ec, %pstate
	.word 0x87902348  ! 246: WRPR_TT_I	wrpr	%r0, 0x0348, %tt
splash_lsu_7_48:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x28700001  ! 248: BPLEU	<illegal instruction>
	.word 0xc607c000  ! 249: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0xc68804a0  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 251: LDQF_R	-	[%r31, %r0], %f3
tagged_7_49:
	taddcctv %r10, 0x15b1, %r7
	.word 0xc607e001  ! 252: LDUW_I	lduw	[%r31 + 0x0001], %r3
change_to_randtl_7_50:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 253: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc6800c00  ! 254: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r3
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 255: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 256: SIR	sir	0x0001
change_to_randtl_7_51:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 257: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xc6800b00  ! 258: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r3
	.word 0xc657c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r3
DS_7_52:
	.word 0x32800001  ! 261: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 260: SAVE_R	save	%r31, %r0, %r31
splash_lsu_7_53:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 262: BPN	<illegal instruction>
	.word 0x87802058  ! 263: WRASI_I	wr	%r0, 0x0058, %asi
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 264: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d9020cf  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x00cf, %pstate
	.word 0xc61fc000  ! 266: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xc61fc000  ! 267: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x8d802004  ! 268: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_7_54:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 269: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x8d9036cf  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x16cf, %pstate
	.word 0x819828cc  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cc, %hpstate
	.word 0x87802063  ! 272: WRASI_I	wr	%r0, 0x0063, %asi
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879022ff  ! 274: WRPR_TT_I	wrpr	%r0, 0x02ff, %tt
	.word 0x819824d6  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d6, %hpstate
	.word 0x87902045  ! 276: WRPR_TT_I	wrpr	%r0, 0x0045, %tt
	.word 0x91d020b3  ! 277: Tcc_I	ta	icc_or_xcc, %r0 + 179
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 278: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc68008a0  ! 279: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x93902003  ! 280: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x879022d7  ! 281: WRPR_TT_I	wrpr	%r0, 0x02d7, %tt
splash_tba_7_55:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 282: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc6800ac0  ! 283: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r3
	.word 0xc6c80e80  ! 284: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r3
splash_cmpr_7_56:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181a001  ! 285: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x8d903f58  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x1f58, %pstate
splash_htba_7_57:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 287: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d903958  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x1958, %pstate
	.word 0x34700001  ! 289: BPG	<illegal instruction>
splash_cmpr_7_58:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181a001  ! 290: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x93902002  ! 291: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802014  ! 293: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x91d02032  ! 294: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902007  ! 295: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x83a00562  ! 296: FSQRTq	fsqrt	
	.word 0x93d02034  ! 297: Tcc_I	tne	icc_or_xcc, %r0 + 52
DS_7_59:
	.word 0x20800001  ! 299: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 299: BG	bg,a	<label_0x1>
	.word 0x8ba00548  ! 299: FSQRTd	fsqrt	
	.word 0x87a34831  ! 298: FADDs	fadds	%f13, %f17, %f3
	.word 0xc6800ac0  ! 299: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r3
	.word 0xc6880e80  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x74, %r3
splash_tba_7_60:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 301: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc647e001  ! 302: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x99902004  ! 303: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x93902000  ! 304: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 305: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_7_61:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc68008a0  ! 308: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x81982286  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0286, %hpstate
splash_lsu_7_62:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc69004a0  ! 311: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x87802058  ! 312: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x93d020b2  ! 313: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x8d902f45  ! 314: WRPR_PSTATE_I	wrpr	%r0, 0x0f45, %pstate
	.word 0x8790215c  ! 315: WRPR_TT_I	wrpr	%r0, 0x015c, %tt
	.word 0x91d02035  ! 316: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_7_63:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 317: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc69fc020  ! 318: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
splash_lsu_7_64:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 320: BN	bn,a	<label_0x1>
	.word 0x8d903a1b  ! 321: WRPR_PSTATE_I	wrpr	%r0, 0x1a1b, %pstate
DS_7_65:
	.word 0x20800001  ! 323: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 322: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902000  ! 324: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1824006  ! 323: WR_STICK_REG_R	wr	%r9, %r6, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 324: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_7_67:
	taddcctv %r17, 0x117c, %r18
	.word 0xc607e001  ! 325: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_tba_7_68:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 326: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 328: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1840004  ! 327: WR_STICK_REG_R	wr	%r16, %r4, %-
	.word 0x93508000  ! 328: RDPR_TSTATE	<illegal instruction>
splash_lsu_7_70:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 329: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d802000  ! 331: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02035  ! 332: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902002  ! 333: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 334: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 335: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_7_71:
	.word 0x34800001  ! 337: BG	bg,a	<label_0x1>
	pdist %f14, %f28, %f18
	.word 0xb5b2c313  ! 336: ALLIGNADDRESS	alignaddr	%r11, %r19, %r26
tagged_7_72:
	tsubcctv %r3, 0x1183, %r2
	.word 0xd807e001  ! 337: LDUW_I	lduw	[%r31 + 0x0001], %r12
tagged_7_73:
	taddcctv %r1, 0x1ac0, %r6
	.word 0xd807e001  ! 338: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x87902057  ! 339: WRPR_TT_I	wrpr	%r0, 0x0057, %tt
	.word 0x90d4a001  ! 340: UMULcc_I	umulcc 	%r18, 0x0001, %r8
	.word 0x93902000  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_7_74:
	tsubcctv %r13, 0x1ece, %r6
	.word 0xc407e001  ! 342: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x93902006  ! 343: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc48008a0  ! 344: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc4800c00  ! 345: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r2
tagged_7_75:
	taddcctv %r1, 0x1772, %r14
	.word 0xc407e001  ! 346: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_7_76:
	.word 0x22800001  ! 348: BE	be,a	<label_0x1>
	.xword 0xcdfa0a49	! Random illegal ?
	.word 0xc910c013  ! 348: LDQF_R	-	[%r3, %r19], %f4
	.word 0xb3a68830  ! 347: FADDs	fadds	%f26, %f16, %f25
	.word 0x83d02035  ! 348: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xaf514000  ! 349: RDPR_TBA	rdpr	%tba, %r23
	.word 0x8d903af2  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x1af2, %pstate
	.word 0xd0c804a0  ! 351: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
DS_7_77:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 352: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd017e001  ! 353: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0x99514000  ! 354: RDPR_TBA	rdpr	%tba, %r12
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x3e700001  ! 356: BPVC	<illegal instruction>
	.word 0x879023c6  ! 357: WRPR_TT_I	wrpr	%r0, 0x03c6, %tt
splash_lsu_7_78:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 358: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_7_79:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 359: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 361: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe647c000  ! 362: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x879020a9  ! 363: WRPR_TT_I	wrpr	%r0, 0x00a9, %tt
	.word 0x38800001  ! 364: BGU	bgu,a	<label_0x1>
	.word 0xe69004a0  ! 365: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	.word 0x87802058  ! 366: WRASI_I	wr	%r0, 0x0058, %asi
splash_lsu_7_80:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 367: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d540000  ! 368: RDPR_GL	rdpr	%-, %r6
	.word 0xc8800a80  ! 369: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r4
splash_lsu_7_81:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc81fc000  ! 371: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xa1902001  ! 372: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xc807c000  ! 373: LDUW_R	lduw	[%r31 + %r0], %r4
splash_lsu_7_82:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 374: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb3494000  ! 375: RDHPR_HTBA	rdhpr	%htba, %r25
	.word 0x81982997  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0997, %hpstate
splash_lsu_7_83:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_7_84:
	tsubcctv %r2, 0x1d7a, %r21
	.word 0xc807e001  ! 379: LDUW_I	lduw	[%r31 + 0x0001], %r4
change_to_randtl_7_85:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 380: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x91d02032  ! 381: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc8d004a0  ! 382: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_tba_7_86:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 383: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_7_87:
	.word 0x32800001  ! 386: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 386: BG	bg,a	<label_0x1>
	.word 0xd711c00a  ! 386: LDQF_R	-	[%r7, %r10], %f11
	.word 0x9ba58838  ! 385: FADDs	fadds	%f22, %f24, %f13
	.word 0x9f802001  ! 386: SIR	sir	0x0001
splash_tba_7_88:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 387: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x3c700001  ! 388: BPPOS	<illegal instruction>
DS_7_89:
	.word 0x34800001  ! 390: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 389: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802004  ! 390: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x95508000  ! 391: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x20700001  ! 392: BPN	<illegal instruction>
splash_lsu_7_90:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 394: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd48fe010  ! 395: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x81982f87  ! 396: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f87, %hpstate
	.word 0x32800001  ! 397: BNE	bne,a	<label_0x1>
tagged_7_91:
	taddcctv %r4, 0x17a8, %r21
	.word 0xd407e001  ! 398: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d903d5d  ! 399: WRPR_PSTATE_I	wrpr	%r0, 0x1d5d, %pstate
	.word 0x81982cc5  ! 400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc5, %hpstate
DS_7_92:
	.word 0x20800001  ! 402: BN	bn,a	<label_0x1>
	pdist %f0, %f18, %f22
	.word 0x8bb0c302  ! 401: ALLIGNADDRESS	alignaddr	%r3, %r2, %r5
	.word 0xec8008a0  ! 402: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x93902005  ! 403: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_7_93:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 404: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 405: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d902407  ! 406: WRPR_PSTATE_I	wrpr	%r0, 0x0407, %pstate
	.word 0x8d903024  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x1024, %pstate
tagged_7_94:
	tsubcctv %r5, 0x1e33, %r23
	.word 0xec07e001  ! 408: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x91d02035  ! 409: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_7_95:
	taddcctv %r12, 0x1078, %r10
	.word 0xec07e001  ! 410: LDUW_I	lduw	[%r31 + 0x0001], %r22
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 411: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xecd004a0  ! 412: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r22
	.word 0x87902196  ! 413: WRPR_TT_I	wrpr	%r0, 0x0196, %tt
tagged_7_96:
	tsubcctv %r13, 0x1719, %r9
	.word 0xec07e001  ! 414: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x93902007  ! 415: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91480000  ! 416: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x87902249  ! 417: WRPR_TT_I	wrpr	%r0, 0x0249, %tt
	.word 0xd64fe001  ! 418: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0xd68008a0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x93902003  ! 420: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8b50c000  ! 421: RDPR_TT	rdpr	%tt, %r5
	.word 0x8f902002  ! 423: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89840002  ! 422: WRTICK_R	wr	%r16, %r2, %tick
	.word 0xc6dfe030  ! 423: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r3
	.word 0x99494000  ! 424: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0xa1a489e9  ! 425: FDIVq	dis not found

	.word 0x91514000  ! 426: RDPR_TBA	<illegal instruction>
	.word 0x32700001  ! 427: BPNE	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee07c000  ! 429: LDUW_R	lduw	[%r31 + %r0], %r23
	.word 0x81982e5d  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5d, %hpstate
	.word 0xa190200d  ! 431: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_lsu_7_98:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 432: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xee8008a0  ! 433: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
splash_tba_7_99:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 434: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x2a800001  ! 435: BCS	bcs,a	<label_0x1>
	.word 0x93d02035  ! 436: Tcc_I	tne	icc_or_xcc, %r0 + 53
DS_7_100:
	.word 0x20800001  ! 438: BN	bn,a	<label_0x1>
	.word 0xc9346001  ! 438: STQF_I	-	%f4, [0x0001, %r17]
	normalw
	.word 0xb1458000  ! 437: RD_SOFTINT_REG	rd	%softint, %r24
tagged_7_101:
	taddcctv %r15, 0x1c5f, %r12
	.word 0xcc07e001  ! 438: LDUW_I	lduw	[%r31 + 0x0001], %r6
tagged_7_102:
	tsubcctv %r10, 0x1135, %r3
	.word 0xcc07e001  ! 439: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x87802088  ! 440: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8790237d  ! 441: WRPR_TT_I	wrpr	%r0, 0x037d, %tt
	.word 0x81982d87  ! 442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d87, %hpstate
	.word 0x93902004  ! 443: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_lsu_7_103:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 444: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 445: BPN	<illegal instruction>
splash_lsu_7_104:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 446: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc800b40  ! 447: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r6
splash_lsu_7_105:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 448: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_7_106:
	tsubcctv %r9, 0x131d, %r21
	.word 0xcc07e001  ! 449: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc9fc020  ! 450: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x81982c84  ! 451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c84, %hpstate
	.word 0xccdfe020  ! 452: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
	.word 0x93902000  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_7_107:
	taddcctv %r20, 0x172c, %r2
	.word 0xcc07e001  ! 454: LDUW_I	lduw	[%r31 + 0x0001], %r6
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 455: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 456: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xccc7e000  ! 457: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r6
	.word 0x87802010  ! 458: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x91d020b5  ! 459: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x81982f95  ! 460: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f95, %hpstate
	.word 0x81982107  ! 461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0107, %hpstate
splash_lsu_7_108:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 462: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc800b20  ! 463: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r6
	.word 0x91500000  ! 464: RDPR_TPC	rdpr	%tpc, %r8
	.word 0x91d02035  ! 465: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d90351d  ! 466: WRPR_PSTATE_I	wrpr	%r0, 0x151d, %pstate
	.word 0xc717c000  ! 467: LDQF_R	-	[%r31, %r0], %f3
	.word 0xa1902007  ! 468: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93902004  ! 469: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902001  ! 470: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x89464000  ! 471: RD_STICK_CMPR_REG	rd	%-, %r4
	.word 0x8780201c  ! 472: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd8c004a0  ! 473: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
splash_tba_7_109:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 474: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd88008a0  ! 475: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_7_110:
	.word 0x34800001  ! 477: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 476: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902002  ! 477: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xa1902009  ! 478: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_tba_7_111:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 479: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200f  ! 480: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87802010  ! 481: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd88008a0  ! 482: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x2e800001  ! 483: BVS	bvs,a	<label_0x1>
splash_lsu_7_112:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 484: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8800b40  ! 485: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r12
	.word 0x93902005  ! 486: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902d1c  ! 487: WRPR_PSTATE_I	wrpr	%r0, 0x0d1c, %pstate
splash_tba_7_113:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902001  ! 489: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd8c804a0  ! 490: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd89fe001  ! 491: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x97a01a66  ! 492: FqTOi	fqtoi	
tagged_7_114:
	tsubcctv %r5, 0x19c8, %r18
	.word 0xf607e001  ! 493: LDUW_I	lduw	[%r31 + 0x0001], %r27
DS_7_115:
	.word 0x32800001  ! 495: BNE	bne,a	<label_0x1>
	pdist %f4, %f26, %f22
	.word 0x95b10302  ! 494: ALLIGNADDRESS	alignaddr	%r4, %r2, %r10
	.word 0xda57e001  ! 495: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0x87802020  ! 496: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87802020  ! 497: WRASI_I	wr	%r0, 0x0020, %asi
splash_lsu_7_116:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 498: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 499: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xda9fe001  ! 500: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xdadfe000  ! 501: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
DS_7_117:
	.word 0x20800001  ! 503: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 502: SAVE_R	save	%r31, %r0, %r31
tagged_7_118:
	tsubcctv %r24, 0x133b, %r3
	.word 0xda07e001  ! 503: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdad7e020  ! 504: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 505: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb1500000  ! 506: RDPR_TPC	rdpr	%tpc, %r24
DS_7_119:
	.word 0x20800001  ! 508: BN	bn,a	<label_0x1>
	pdist %f30, %f22, %f14
	.word 0xb7b28302  ! 507: ALLIGNADDRESS	alignaddr	%r10, %r2, %r27
DS_7_120:
	.word 0x32800001  ! 509: BNE	bne,a	<label_0x1>
	.xword 0xe56e4ea0	! Random illegal ?
	.word 0xc3134005  ! 509: LDQF_R	-	[%r13, %r5], %f1
	.word 0xb7a3482c  ! 508: FADDs	fadds	%f13, %f12, %f27
tagged_7_121:
	taddcctv %r11, 0x1aec, %r24
	.word 0xc807e001  ! 509: LDUW_I	lduw	[%r31 + 0x0001], %r4
splash_tba_7_122:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 510: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902002  ! 511: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8790209f  ! 512: WRPR_TT_I	wrpr	%r0, 0x009f, %tt
	.word 0xc817e001  ! 513: LDUH_I	lduh	[%r31 + 0x0001], %r4
	.word 0x879023ed  ! 514: WRPR_TT_I	wrpr	%r0, 0x03ed, %tt
	.word 0xa150c000  ! 515: RDPR_TT	rdpr	%tt, %r16
	.word 0x9b508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0x22700001  ! 517: BPE	<illegal instruction>
change_to_randtl_7_123:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 518: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xa1902004  ! 519: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd88008a0  ! 520: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x81982a54  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a54, %hpstate
	.word 0x8f480000  ! 522: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x91d02034  ! 523: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x819824dc  ! 524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04dc, %hpstate
	.word 0x95504000  ! 525: RDPR_TNPC	rdpr	%tnpc, %r10
splash_htba_7_124:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 526: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe44fc000  ! 527: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe44fe001  ! 528: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02035  ! 530: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe4d7e020  ! 531: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
tagged_7_125:
	taddcctv %r19, 0x133a, %r16
	.word 0xe407e001  ! 532: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x879020d9  ! 533: WRPR_TT_I	wrpr	%r0, 0x00d9, %tt
	.word 0xe4bfc037  ! 534: STDA_R	stda	%r18, [%r31 + %r23] 0x01
	.word 0xe40fe001  ! 535: LDUB_I	ldub	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe527e001  ! 537: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe527e001  ! 538: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe4d7e000  ! 539: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
	.word 0x8198279d  ! 540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079d, %hpstate
tagged_7_126:
	tsubcctv %r4, 0x1694, %r20
	.word 0xe407e001  ! 541: LDUW_I	lduw	[%r31 + 0x0001], %r18
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 542: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_7_127:
	taddcctv %r7, 0x1382, %r3
	.word 0xe407e001  ! 543: LDUW_I	lduw	[%r31 + 0x0001], %r18
splash_tba_7_128:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 544: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 545: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe45fe001  ! 546: LDX_I	ldx	[%r31 + 0x0001], %r18
	.word 0xe497e010  ! 547: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r18
	.word 0xe407c000  ! 548: LDUW_R	lduw	[%r31 + %r0], %r18
DS_7_129:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 549: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xe48008a0  ! 550: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe417c000  ! 551: LDUH_R	lduh	[%r31 + %r0], %r18
	.word 0x91d02034  ! 552: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f802001  ! 553: SIR	sir	0x0001
	.word 0xe49fe001  ! 554: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
DS_7_130:
	.word 0x34800001  ! 556: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 555: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x30700001  ! 556: BPA	<illegal instruction>
	.word 0x87802080  ! 557: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802004  ! 558: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe4c804a0  ! 559: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0xe44fe001  ! 560: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	.word 0x91d02034  ! 561: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_lsu_7_131:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 562: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x87902043  ! 564: WRPR_TT_I	wrpr	%r0, 0x0043, %tt
	.word 0x81982ddc  ! 565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddc, %hpstate
splash_lsu_7_132:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 566: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe42fe001  ! 567: STB_I	stb	%r18, [%r31 + 0x0001]
	.word 0xa1902009  ! 568: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87902307  ! 569: WRPR_TT_I	wrpr	%r0, 0x0307, %tt
	.word 0xe4d00e40  ! 570: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r18
	.word 0x91d020b5  ! 571: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe4880e40  ! 572: LDUBA_R	lduba	[%r0, %r0] 0x72, %r18
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 573: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_7_133:
	.word 0x20800001  ! 575: BN	bn,a	<label_0x1>
	.word 0xd331c00d  ! 575: STQF_R	-	%f9, [%r13, %r7]
	normalw
	.word 0x97458000  ! 574: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x87902156  ! 575: WRPR_TT_I	wrpr	%r0, 0x0156, %tt
	.word 0xf217c000  ! 576: LDUH_R	lduh	[%r31 + %r0], %r25
	.word 0xf2800c00  ! 577: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r25
	.word 0x8f902000  ! 579: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8b692001  ! 578: SDIVX_I	sdivx	%r4, 0x0001, %r5
	.word 0x93d02033  ! 579: Tcc_I	tne	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0x8780204f  ! 581: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x879021d5  ! 582: WRPR_TT_I	wrpr	%r0, 0x01d5, %tt
	.word 0x93902006  ! 583: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe2900e60  ! 584: LDUHA_R	lduha	[%r0, %r0] 0x73, %r17
	.word 0x8780204f  ! 585: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe2880e40  ! 586: LDUBA_R	lduba	[%r0, %r0] 0x72, %r17
	.word 0x87802063  ! 587: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8d9022d1  ! 588: WRPR_PSTATE_I	wrpr	%r0, 0x02d1, %pstate
	.word 0x81982a86  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a86, %hpstate
splash_lsu_7_135:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 590: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe21fe001  ! 591: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0xe28fe010  ! 592: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
tagged_7_136:
	tsubcctv %r17, 0x1ccd, %r10
	.word 0xe207e001  ! 593: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe21fe001  ! 594: LDD_I	ldd	[%r31 + 0x0001], %r17
splash_tba_7_137:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 595: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902b8d  ! 596: WRPR_PSTATE_I	wrpr	%r0, 0x0b8d, %pstate
	.word 0xa190200a  ! 597: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 598: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982a4e  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4e, %hpstate
	.word 0x93902001  ! 600: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe297e010  ! 601: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
	.word 0x8d903e6c  ! 602: WRPR_PSTATE_I	wrpr	%r0, 0x1e6c, %pstate
splash_tba_7_138:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 603: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28fe030  ! 605: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r17
	.word 0x8780204f  ! 606: WRASI_I	wr	%r0, 0x004f, %asi
change_to_randtl_7_139:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 607: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe2800aa0  ! 608: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r17
DS_7_140:
	.word 0x32800001  ! 610: BNE	bne,a	<label_0x1>
	.xword 0x8178b3d9	! Random illegal ?
	.word 0xa3a00550  ! 610: FSQRTd	fsqrt	
	.word 0xb3a24823  ! 609: FADDs	fadds	%f9, %f3, %f25
	.word 0x87802004  ! 610: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d9037a5  ! 611: WRPR_PSTATE_I	wrpr	%r0, 0x17a5, %pstate
	.word 0x879022f1  ! 612: WRPR_TT_I	wrpr	%r0, 0x02f1, %tt
splash_tba_7_141:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 613: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0d004a0  ! 614: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r24
splash_htba_7_142:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 615: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_7_143:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 616: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_7_144:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 617: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 618: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x93902001  ! 619: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d903864  ! 620: WRPR_PSTATE_I	wrpr	%r0, 0x1864, %pstate
	ta	T_CHANGE_HPRIV	! macro
splash_tba_7_145:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 622: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d514000  ! 623: RDPR_TBA	rdpr	%tba, %r6
tagged_7_146:
	tsubcctv %r5, 0x1783, %r15
	.word 0xd207e001  ! 624: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x87802088  ! 625: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x95480000  ! 626: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x87902373  ! 627: WRPR_TT_I	wrpr	%r0, 0x0373, %tt
tagged_7_147:
	taddcctv %r21, 0x1abd, %r23
	.word 0xca07e001  ! 628: LDUW_I	lduw	[%r31 + 0x0001], %r5
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 629: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca47c000  ! 630: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0x91d02032  ! 631: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d90298f  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x098f, %pstate
	.word 0x91d020b4  ! 633: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x91d020b2  ! 634: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x87802089  ! 635: WRASI_I	wr	%r0, 0x0089, %asi
tagged_7_148:
	tsubcctv %r12, 0x163c, %r22
	.word 0xca07e001  ! 636: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x26800001  ! 637: BL	bl,a	<label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 638: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 640: SIR	sir	0x0001
	.word 0x36700001  ! 641: BPGE	<illegal instruction>
	.word 0x8d9036b9  ! 642: WRPR_PSTATE_I	wrpr	%r0, 0x16b9, %pstate
	.word 0xca8008a0  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
splash_lsu_7_149:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 644: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d51c000  ! 645: RDPR_TL	rdpr	%tl, %r6
splash_lsu_7_150:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 646: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902288  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x0288, %pstate
DS_7_151:
	.word 0x22800001  ! 649: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 648: SAVE_R	save	%r31, %r0, %r31
DS_7_152:
	.word 0x32800001  ! 650: BNE	bne,a	<label_0x1>
	.xword 0xaff32dab	! Random illegal ?
	.word 0xc710800a  ! 650: LDQF_R	-	[%r2, %r10], %f3
	.word 0xa7a10837  ! 649: FADDs	fadds	%f4, %f23, %f19
	.word 0x8f902001  ! 651: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb181c013  ! 650: WR_STICK_REG_R	wr	%r7, %r19, %-
	.word 0xd997e001  ! 651: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0xd89fe001  ! 652: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x9f802001  ! 653: SIR	sir	0x0001
	.word 0xd81fc000  ! 654: LDD_R	ldd	[%r31 + %r0], %r12
tagged_7_154:
	tsubcctv %r5, 0x173c, %r16
	.word 0xd807e001  ! 655: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x879020ef  ! 656: WRPR_TT_I	wrpr	%r0, 0x00ef, %tt
splash_tba_7_155:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 657: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_7_156:
	.word 0x32800001  ! 659: BNE	bne,a	<label_0x1>
	.word 0xe1322001  ! 659: STQF_I	-	%f16, [0x0001, %r8]
	normalw
	.word 0xa7458000  ! 658: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xce4fc000  ! 659: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0x8d90323d  ! 660: WRPR_PSTATE_I	wrpr	%r0, 0x123d, %pstate
	.word 0x34800001  ! 661: BG	bg,a	<label_0x1>
	.word 0x8d9039f5  ! 662: WRPR_PSTATE_I	wrpr	%r0, 0x19f5, %pstate
DS_7_157:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 663: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x81982c9e  ! 664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9e, %hpstate
tagged_7_158:
	tsubcctv %r25, 0x105f, %r24
	.word 0xce07e001  ! 665: LDUW_I	lduw	[%r31 + 0x0001], %r7
DS_7_159:
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0x83a00556  ! 667: FSQRTd	fsqrt	
	.word 0x93a00838  ! 666: FADDs	fadds	%f0, %f24, %f9
	.word 0xe49fe001  ! 667: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0x93902000  ! 668: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d802000  ! 669: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xe4800c00  ! 671: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r18
	.word 0x99902001  ! 672: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xa1902004  ! 673: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x9545c000  ! 674: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xecdfe020  ! 675: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r22
tagged_7_160:
	tsubcctv %r18, 0x164b, %r16
	.word 0xec07e001  ! 676: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0xed17c000  ! 677: LDQF_R	-	[%r31, %r0], %f22
	.word 0xa9a50dc5  ! 678: FdMULq	fdmulq	
	.word 0x95500000  ! 679: RDPR_TPC	rdpr	%tpc, %r10
	.word 0xa1902005  ! 680: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8198251e  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051e, %hpstate
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 682: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_7_161:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 683: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc4c7e020  ! 684: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	.word 0x87802063  ! 685: WRASI_I	wr	%r0, 0x0063, %asi
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc4c7e000  ! 687: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r2
	.word 0xc4880e40  ! 688: LDUBA_R	lduba	[%r0, %r0] 0x72, %r2
	.word 0xc49fc020  ! 689: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x81460000  ! 691: RD_STICK_REG	stbar
	.word 0x879023c6  ! 692: WRPR_TT_I	wrpr	%r0, 0x03c6, %tt
	.word 0xc4d80e80  ! 693: LDXA_R	ldxa	[%r0, %r0] 0x74, %r2
	.word 0x8d90361f  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x161f, %pstate
	.word 0xa1902000  ! 695: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_7_162:
	.word 0x22800001  ! 697: BE	be,a	<label_0x1>
	.word 0xd734e001  ! 697: STQF_I	-	%f11, [0x0001, %r19]
	normalw
	.word 0x89458000  ! 696: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x99902004  ! 697: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_tba_7_163:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 698: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc28008a0  ! 699: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc317c000  ! 700: LDQF_R	-	[%r31, %r0], %f1
tagged_7_164:
	tsubcctv %r14, 0x1ca1, %r5
	.word 0xc207e001  ! 701: LDUW_I	lduw	[%r31 + 0x0001], %r1
tagged_7_165:
	taddcctv %r14, 0x19f4, %r12
	.word 0xc207e001  ! 702: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc2800c60  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc29fe001  ! 705: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x8780204f  ! 706: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x819820ce  ! 707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00ce, %hpstate
	.word 0x85480000  ! 708: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0xf08804a0  ! 709: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x93d02033  ! 710: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8790200a  ! 711: WRPR_TT_I	wrpr	%r0, 0x000a, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902005  ! 713: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d903215  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x1215, %pstate
	.word 0xf08fe000  ! 715: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r24
splash_tba_7_166:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf09004a0  ! 717: LDUHA_R	lduha	[%r0, %r0] 0x25, %r24
	.word 0xa1902006  ! 718: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 719: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 721: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9039e5  ! 722: WRPR_PSTATE_I	wrpr	%r0, 0x19e5, %pstate
tagged_7_167:
	taddcctv %r7, 0x17fe, %r26
	.word 0xf007e001  ! 723: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0xf08804a0  ! 724: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0xf02fc009  ! 725: STB_R	stb	%r24, [%r31 + %r9]
	.word 0x879023f2  ! 726: WRPR_TT_I	wrpr	%r0, 0x03f2, %tt
	.word 0xf08804a0  ! 727: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x8780204f  ! 728: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x81982614  ! 729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0614, %hpstate
	.word 0xf08008a0  ! 730: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x2c700001  ! 731: BPNEG	<illegal instruction>
	.word 0x93902006  ! 732: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d020b3  ! 733: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x93902003  ! 734: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x32700001  ! 735: BPNE	<illegal instruction>
	.word 0x87802004  ! 736: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf01fc000  ! 737: LDD_R	ldd	[%r31 + %r0], %r24
	.word 0x93902000  ! 738: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_7_168:
	.word 0x22800001  ! 740: BE	be,a	<label_0x1>
	allclean
	.word 0x9bb0430a  ! 739: ALLIGNADDRESS	alignaddr	%r1, %r10, %r13
	.word 0x91d02035  ! 740: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_7_169:
	.word 0x34800001  ! 742: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 741: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802004  ! 742: WRFPRS_I	wr	%r0, 0x0004, %fprs
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 743: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 744: BPE	<illegal instruction>
	.word 0xc407c000  ! 745: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x93902007  ! 746: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x3a700001  ! 747: BPCC	<illegal instruction>
	.word 0x8198260f  ! 748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060f, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 749: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x89500000  ! 750: RDPR_TPC	rdpr	%tpc, %r4
splash_htba_7_170:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 751: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcc1fc000  ! 752: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x93902002  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902000  ! 754: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_7_171:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 755: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 756: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_7_172:
	.word 0x22800001  ! 758: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 757: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fc000  ! 758: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0xcc8008a0  ! 759: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xa190200b  ! 760: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xcc4fc000  ! 761: LDSB_R	ldsb	[%r31 + %r0], %r6
DS_7_173:
	.word 0x22800001  ! 763: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 762: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fe001  ! 763: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x81982045  ! 764: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0045, %hpstate
splash_tba_7_174:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 765: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcd97e001  ! 766: LDQFA_I	-	[%r31, 0x0001], %f6
	.word 0x93504000  ! 767: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0x87540000  ! 768: RDPR_GL	rdpr	%-, %r3
splash_lsu_7_175:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 769: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200a  ! 770: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x896cc00c  ! 771: SDIVX_R	sdivx	%r19, %r12, %r4
	.word 0x87508000  ! 772: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x8d902b71  ! 773: WRPR_PSTATE_I	wrpr	%r0, 0x0b71, %pstate
	.word 0x3e800001  ! 774: BVC	bvc,a	<label_0x1>
	.word 0xc2d004a0  ! 775: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x93902003  ! 776: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8780204f  ! 777: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8d902a73  ! 778: WRPR_PSTATE_I	wrpr	%r0, 0x0a73, %pstate
	.word 0x91d02035  ! 779: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc217c000  ! 780: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x8790209b  ! 781: WRPR_TT_I	wrpr	%r0, 0x009b, %tt
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 782: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83514000  ! 783: RDPR_TBA	rdpr	%tba, %r1
splash_lsu_7_176:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 784: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 785: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x93902004  ! 786: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91480000  ! 787: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xce17c000  ! 788: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0xcec7e010  ! 789: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r7
DS_7_177:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 790: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x9f802001  ! 791: SIR	sir	0x0001
	.word 0x879020e7  ! 792: WRPR_TT_I	wrpr	%r0, 0x00e7, %tt
splash_tba_7_178:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce8008a0  ! 794: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xcedfe010  ! 795: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r7
	.word 0x9f802001  ! 796: SIR	sir	0x0001
	otherw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 797: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xce1fc000  ! 798: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0xce4fc000  ! 799: LDSB_R	ldsb	[%r31 + %r0], %r7
tagged_7_179:
	taddcctv %r13, 0x14df, %r10
	.word 0xce07e001  ! 800: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x87802080  ! 801: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa1902005  ! 802: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xce8008a0  ! 803: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x91d02033  ! 804: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_tba_7_180:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 805: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_7_181:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 806: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 807: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90269b  ! 808: WRPR_PSTATE_I	wrpr	%r0, 0x069b, %pstate
	.word 0x2e700001  ! 809: BPVS	<illegal instruction>
	.word 0xced7e020  ! 810: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r7
	.word 0x879022c6  ! 811: WRPR_TT_I	wrpr	%r0, 0x02c6, %tt
splash_lsu_7_182:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 812: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 813: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x38800001  ! 814: BGU	bgu,a	<label_0x1>
splash_lsu_7_183:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 815: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 816: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xa1902006  ! 817: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_lsu_7_184:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 818: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcec004a0  ! 819: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xa1902001  ! 820: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_htba_7_185:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 821: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902000  ! 822: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xce800b60  ! 823: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r7
	.word 0xa1902008  ! 824: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_7_186:
	.word 0x34800001  ! 826: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 825: SAVE_R	save	%r31, %r0, %r31
	.word 0x91a149d1  ! 826: FDIVd	fdivd	%f36, %f48, %f8
	.word 0x8f902001  ! 828: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x85a01977  ! 827: FqTOd	dis not found

	.word 0xd647e001  ! 828: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x8790230c  ! 829: WRPR_TT_I	wrpr	%r0, 0x030c, %tt
	.word 0x8f902000  ! 831: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81a01966  ! 830: FqTOd	dis not found

splash_lsu_7_189:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 831: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90255b  ! 832: WRPR_PSTATE_I	wrpr	%r0, 0x055b, %pstate
	.word 0x91500000  ! 833: RDPR_TPC	rdpr	%tpc, %r8
	.word 0x93902002  ! 834: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_7_190:
	.word 0x32800001  ! 836: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 835: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_7_191:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 837: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd01fe001  ! 838: LDD_I	ldd	[%r31 + 0x0001], %r8
splash_tba_7_192:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 839: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd04fe001  ! 840: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0x95a14dd1  ! 841: FdMULq	fdmulq	
	.word 0x87802058  ! 842: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902001  ! 844: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa969e001  ! 843: SDIVX_I	sdivx	%r7, 0x0001, %r20
	.word 0xd41fe001  ! 844: LDD_I	ldd	[%r31 + 0x0001], %r10
splash_cmpr_7_194:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184a001  ! 845: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0x93902006  ! 846: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982054  ! 847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0054, %hpstate
tagged_7_195:
	taddcctv %r3, 0x1b31, %r2
	.word 0xd407e001  ! 848: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd48008a0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4cfe010  ! 850: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r10
	.word 0x30800001  ! 851: BA	ba,a	<label_0x1>
change_to_randtl_7_196:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 852: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802063  ! 853: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x9f802001  ! 854: SIR	sir	0x0001
	.word 0x8198275d  ! 855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075d, %hpstate
DS_7_197:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 856: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x87802089  ! 857: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa1902006  ! 858: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd41fe001  ! 859: LDD_I	ldd	[%r31 + 0x0001], %r10
tagged_7_198:
	tsubcctv %r14, 0x1bed, %r9
	.word 0xd407e001  ! 860: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_tba_7_199:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 861: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802063  ! 862: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8790235f  ! 863: WRPR_TT_I	wrpr	%r0, 0x035f, %tt
	.word 0x8b480000  ! 864: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0xccdfe000  ! 865: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
	.word 0xcc800c40  ! 866: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc1fe001  ! 868: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x819821cf  ! 869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cf, %hpstate
	.word 0x93902001  ! 870: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xccdfe030  ! 871: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
tagged_7_200:
	tsubcctv %r15, 0x1b7e, %r2
	.word 0xcc07e001  ! 872: LDUW_I	lduw	[%r31 + 0x0001], %r6
splash_tba_7_201:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 873: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8780201c  ! 874: WRASI_I	wr	%r0, 0x001c, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc0fc000  ! 876: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x87802089  ! 877: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x879021d4  ! 878: WRPR_TT_I	wrpr	%r0, 0x01d4, %tt
	.word 0xccd7e020  ! 879: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc9004a0  ! 881: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
splash_lsu_7_202:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 882: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 883: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_tba_7_203:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 884: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc8008a0  ! 885: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
DS_7_204:
	.word 0x22800001  ! 887: BE	be,a	<label_0x1>
	.word 0xd535c015  ! 887: STQF_R	-	%f10, [%r21, %r23]
	normalw
	.word 0x83458000  ! 886: RD_SOFTINT_REG	rd	%softint, %r1
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 887: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf28008a0  ! 888: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
DS_7_205:
	.word 0x34800001  ! 890: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 889: RESTORE_R	restore	%r31, %r0, %r31
splash_htba_7_206:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 890: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xf2d804a0  ! 891: LDXA_R	ldxa	[%r0, %r0] 0x25, %r25
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 892: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2c7e030  ! 893: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r25
DS_7_207:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 894: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xf28804a0  ! 895: LDUBA_R	lduba	[%r0, %r0] 0x25, %r25
	.word 0x81982e17  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e17, %hpstate
	.word 0xf217e001  ! 897: LDUH_I	lduh	[%r31 + 0x0001], %r25
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 898: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200d  ! 899: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xf28008a0  ! 900: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 901: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf217c000  ! 902: LDUH_R	lduh	[%r31 + %r0], %r25
change_to_randtl_7_208:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 903: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x32800001  ! 904: BNE	bne,a	<label_0x1>
	.word 0xa1902007  ! 905: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87802014  ! 906: WRASI_I	wr	%r0, 0x0014, %asi
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 907: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xf28008a0  ! 908: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x87802014  ! 909: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xf317c000  ! 910: LDQF_R	-	[%r31, %r0], %f25
	.word 0xa1902007  ! 911: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x93902000  ! 912: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87802004  ! 913: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf28fe020  ! 914: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r25
	.word 0x8d903da0  ! 915: WRPR_PSTATE_I	wrpr	%r0, 0x1da0, %pstate
	.word 0xf2800aa0  ! 916: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r25
	.word 0x8f902002  ! 918: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8b68e001  ! 917: SDIVX_I	sdivx	%r3, 0x0001, %r5
splash_lsu_7_210:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 918: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99464000  ! 919: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0xa1902004  ! 920: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x81982ed5  ! 921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed5, %hpstate
	.word 0xd68008a0  ! 922: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x93902006  ! 923: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
tagged_7_211:
	taddcctv %r11, 0x19ff, %r17
	.word 0xd607e001  ! 924: LDUW_I	lduw	[%r31 + 0x0001], %r11
DS_7_212:
	.word 0x22800001  ! 926: BE	be,a	<label_0x1>
	pdist %f4, %f4, %f24
	.word 0xafb54309  ! 925: ALLIGNADDRESS	alignaddr	%r21, %r9, %r23
	.word 0x8d902f43  ! 926: WRPR_PSTATE_I	wrpr	%r0, 0x0f43, %pstate
tagged_7_213:
	taddcctv %r4, 0x135a, %r21
	.word 0xc607e001  ! 927: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc607c000  ! 928: LDUW_R	lduw	[%r31 + %r0], %r3
splash_tba_7_214:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 929: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68fe000  ! 930: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r3
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 931: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802058  ! 933: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x93902004  ! 934: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xc73fc002  ! 935: STDF_R	std	%f3, [%r2, %r31]
	.word 0xc6d804a0  ! 936: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 937: LDQF_R	-	[%r31, %r0], %f3
tagged_7_215:
	taddcctv %r3, 0x10be, %r14
	.word 0xc607e001  ! 938: LDUW_I	lduw	[%r31 + 0x0001], %r3
DS_7_216:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 939: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
splash_tba_7_217:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 940: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_7_218:
	.word 0x22800001  ! 942: BE	be,a	<label_0x1>
	.xword 0xabd79523	! Random illegal ?
	.word 0xc7134007  ! 942: LDQF_R	-	[%r13, %r7], %f3
	.word 0x8da24837  ! 941: FADDs	fadds	%f9, %f23, %f6
	.word 0x93902004  ! 942: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d903f0b  ! 943: WRPR_PSTATE_I	wrpr	%r0, 0x1f0b, %pstate
	.word 0x8d902803  ! 944: WRPR_PSTATE_I	wrpr	%r0, 0x0803, %pstate
	.word 0x87802016  ! 945: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xc4880e80  ! 946: LDUBA_R	lduba	[%r0, %r0] 0x74, %r2
	.word 0xc49fc020  ! 947: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x91d02034  ! 948: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902003  ! 949: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc517c000  ! 951: LDQF_R	-	[%r31, %r0], %f2
	.word 0x24700001  ! 952: BPLE	<illegal instruction>
	.word 0x8f902000  ! 954: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb184400d  ! 953: WR_STICK_REG_R	wr	%r17, %r13, %-
	.word 0x81982a5f  ! 954: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5f, %hpstate
	.word 0xc417c000  ! 955: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x93902001  ! 956: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa190200c  ! 957: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x81982adf  ! 958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adf, %hpstate
	.word 0x93902004  ! 959: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xc4880e60  ! 960: LDUBA_R	lduba	[%r0, %r0] 0x73, %r2
	.word 0xc48008a0  ! 961: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xa190200a  ! 962: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x95494000  ! 963: RDHPR_HTBA	rdhpr	%htba, %r10
	.word 0xc4d7e000  ! 964: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
	.word 0x93902002  ! 965: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_7_220:
	.word 0x32800001  ! 967: BNE	bne,a	<label_0x1>
	.word 0xe732c00b  ! 967: STQF_R	-	%f19, [%r11, %r11]
	normalw
	.word 0x8f458000  ! 966: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xa1902005  ! 967: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_lsu_7_221:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 969: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x28800001  ! 970: BLEU	bleu,a	<label_0x1>
splash_lsu_7_222:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 971: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 972: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_7_223:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 974: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1822001  ! 973: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	.word 0x91d020b2  ! 974: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xd4d004a0  ! 975: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
tagged_7_224:
	tsubcctv %r22, 0x1ce2, %r10
	.word 0xd407e001  ! 976: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4c004a0  ! 977: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x93902000  ! 978: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x99902003  ! 979: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x8d903382  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x1382, %pstate
	.word 0x93902007  ! 981: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d020b2  ! 982: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x22700001  ! 983: BPE	<illegal instruction>
	.word 0x93902002  ! 984: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 985: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 986: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 987: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd497e030  ! 988: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0xd4dfe020  ! 989: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r10
	.word 0x91d02033  ! 990: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x34800001  ! 991: BG	bg,a	<label_0x1>
	.word 0xa1902002  ! 992: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd48008a0  ! 993: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd597e001  ! 994: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x91d02032  ! 995: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_htba_7_225:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 996: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902001  ! 997: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_7_226:
	.word 0x22800001  ! 999: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 998: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_7_227:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_7:
	.word 0x93d020b5  ! 1: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x91d02033  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902000  ! 3: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_lsu_6_0:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 4: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7514000  ! 5: RDPR_TBA	rdpr	%tba, %r19
tagged_6_1:
	taddcctv %r11, 0x1a96, %r9
	.word 0xcc07e001  ! 6: LDUW_I	lduw	[%r31 + 0x0001], %r6
DS_6_2:
	.word 0x22800001  ! 8: BE	be,a	<label_0x1>
	pdist %f6, %f0, %f2
	.word 0x8db24300  ! 7: ALLIGNADDRESS	alignaddr	%r9, %r0, %r6
	.word 0x97514000  ! 8: RDPR_TBA	<illegal instruction>
tagged_6_3:
	taddcctv %r20, 0x1166, %r14
	.word 0xc807e001  ! 9: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc81fe001  ! 10: LDD_I	ldd	[%r31 + 0x0001], %r4
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 11: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc8c7e020  ! 12: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	.word 0xc917c000  ! 13: LDQF_R	-	[%r31, %r0], %f4
	.word 0xc89fe001  ! 14: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902002  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xc807c000  ! 17: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0x8d802000  ! 18: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9745c000  ! 19: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0x91d02033  ! 20: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_6_4:
	.word 0x32800001  ! 22: BNE	bne,a	<label_0x1>
	.word 0xcf34800c  ! 22: STQF_R	-	%f7, [%r12, %r18]
	normalw
	.word 0xa9458000  ! 21: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x879021c9  ! 22: WRPR_TT_I	wrpr	%r0, 0x01c9, %tt
DS_6_5:
	.word 0x32800001  ! 24: BNE	bne,a	<label_0x1>
	.word 0xc5328016  ! 24: STQF_R	-	%f2, [%r22, %r10]
	normalw
	.word 0xa3458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r17
tagged_6_6:
	tsubcctv %r3, 0x1d75, %r5
	.word 0xd607e001  ! 24: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x8790209e  ! 25: WRPR_TT_I	wrpr	%r0, 0x009e, %tt
splash_tba_6_7:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 26: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8198238d  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x038d, %hpstate
splash_lsu_6_8:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd65fe001  ! 29: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d7e030  ! 30: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0xb550c000  ! 31: RDPR_TT	rdpr	%tt, %r26
	.word 0xda07c000  ! 32: LDUW_R	lduw	[%r31 + %r0], %r13
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 33: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8198260d  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060d, %hpstate
	.word 0xdad7e010  ! 36: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	.word 0xda47c000  ! 37: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0x81982fc5  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc5, %hpstate
	.word 0x91464000  ! 39: RD_STICK_CMPR_REG	rd	%-, %r8
	.word 0xa9464000  ! 40: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0x8d9033d7  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x13d7, %pstate
	.word 0x8780204f  ! 42: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa1902009  ! 43: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x879023bd  ! 44: WRPR_TT_I	wrpr	%r0, 0x03bd, %tt
DS_6_9:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_6_10:
	.word 0x20800001  ! 47: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 46: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 47: BL	bl,a	<label_0x1>
DS_6_11:
	.word 0x22800001  ! 49: BE	be,a	<label_0x1>
	pdist %f16, %f22, %f20
	.word 0x83b08301  ! 48: ALLIGNADDRESS	alignaddr	%r2, %r1, %r1
	.word 0xa190200d  ! 49: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd65fe001  ! 50: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d804a0  ! 51: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0xd68008a0  ! 52: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x879022a4  ! 53: WRPR_TT_I	wrpr	%r0, 0x02a4, %tt
splash_htba_6_12:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 54: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d903276  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x1276, %pstate
	.word 0xd617e001  ! 56: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0x87902055  ! 57: WRPR_TT_I	wrpr	%r0, 0x0055, %tt
	.word 0xd68008a0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_6_13:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790219e  ! 60: WRPR_TT_I	wrpr	%r0, 0x019e, %tt
	.word 0x91d02032  ! 61: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd68008a0  ! 62: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_6_14:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb184e001  ! 63: WR_STICK_REG_I	wr	%r19, 0x0001, %-
	.word 0xd6d7e000  ! 64: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
	.word 0x8d903b82  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x1b82, %pstate
	.word 0x26700001  ! 66: BPL	<illegal instruction>
	.word 0x9350c000  ! 67: RDPR_TT	rdpr	%tt, %r9
	.word 0x8d902b09  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x0b09, %pstate
	.word 0x30800001  ! 69: BA	ba,a	<label_0x1>
splash_lsu_6_15:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 70: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903aff  ! 71: WRPR_PSTATE_I	wrpr	%r0, 0x1aff, %pstate
splash_lsu_6_16:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 72: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 73: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe137c009  ! 74: STQF_R	-	%f16, [%r9, %r31]
	.word 0xe057c000  ! 75: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0x8198250c  ! 76: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050c, %hpstate
splash_tba_6_17:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 77: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802000  ! 78: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_htba_6_18:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_6_19:
	taddcctv %r19, 0x114c, %r5
	.word 0xe007e001  ! 80: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8d903b5f  ! 81: WRPR_PSTATE_I	wrpr	%r0, 0x1b5f, %pstate
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 82: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 83: BNE	bne,a	<label_0x1>
	.word 0x91d02032  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8790236c  ! 85: WRPR_TT_I	wrpr	%r0, 0x036c, %tt
	.word 0xe0d7e010  ! 86: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
	.word 0x85504000  ! 87: RDPR_TNPC	rdpr	%tnpc, %r2
	.word 0x83d020b3  ! 88: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x26700001  ! 89: BPL	<illegal instruction>
	.word 0x8d903601  ! 90: WRPR_PSTATE_I	wrpr	%r0, 0x1601, %pstate
	.word 0x9f802001  ! 91: SIR	sir	0x0001
	.word 0x91d020b3  ! 92: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x81982a47  ! 93: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a47, %hpstate
	.word 0xc24fc000  ! 94: LDSB_R	ldsb	[%r31 + %r0], %r1
DS_6_20:
	.word 0x32800001  ! 96: BNE	bne,a	<label_0x1>
	.xword 0xe5536cbd	! Random illegal ?
	.word 0xcf16401a  ! 96: LDQF_R	-	[%r25, %r26], %f7
	.word 0x89a58828  ! 95: FADDs	fadds	%f22, %f8, %f4
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 96: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_6_21:
	taddcctv %r21, 0x11f1, %r4
	.word 0xc007e001  ! 97: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x2a800001  ! 98: BCS	bcs,a	<label_0x1>
	.word 0xc08804a0  ! 99: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0xa1902004  ! 100: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xc017c000  ! 101: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc03fe001  ! 102: STD_I	std	%r0, [%r31 + 0x0001]
	.word 0x93902007  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc08008a0  ! 104: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x93902003  ! 105: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81460000  ! 106: RD_STICK_REG	stbar
	.word 0xc01fc000  ! 107: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x81982c1f  ! 108: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1f, %hpstate
	.word 0xc0c7e020  ! 109: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r0
	.word 0x8d902f58  ! 110: WRPR_PSTATE_I	wrpr	%r0, 0x0f58, %pstate
	.word 0x8d500000  ! 111: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x9b500000  ! 112: RDPR_TPC	<illegal instruction>
splash_cmpr_6_22:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb1826001  ! 113: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0xe097e000  ! 114: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r16
tagged_6_23:
	taddcctv %r25, 0x1ee1, %r26
	.word 0xe007e001  ! 115: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe0d7e000  ! 116: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	.word 0x81982f95  ! 117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f95, %hpstate
	.word 0xe0d80e80  ! 118: LDXA_R	ldxa	[%r0, %r0] 0x74, %r16
	ta	T_CHANGE_HPRIV	! macro
DS_6_24:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 120: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_tba_6_25:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 121: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0d80e80  ! 122: LDXA_R	ldxa	[%r0, %r0] 0x74, %r16
	.word 0x9f802001  ! 123: SIR	sir	0x0001
	.word 0x81982ade  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ade, %hpstate
	.word 0xe0dfe010  ! 125: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r16
	.word 0x87902346  ! 126: WRPR_TT_I	wrpr	%r0, 0x0346, %tt
	.word 0x87902324  ! 127: WRPR_TT_I	wrpr	%r0, 0x0324, %tt
	.word 0xe01fc000  ! 128: LDD_R	ldd	[%r31 + %r0], %r16
change_to_randtl_6_26:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 129: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d902aa8  ! 130: WRPR_PSTATE_I	wrpr	%r0, 0x0aa8, %pstate
splash_lsu_6_27:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 133: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb182c001  ! 132: WR_STICK_REG_R	wr	%r11, %r1, %-
	.word 0x819824c5  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c5, %hpstate
	.word 0xe08008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
change_to_randtl_6_29:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 135: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe08008a0  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x93902007  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d9020e8  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x00e8, %pstate
	.word 0x8efde001  ! 139: SDIVcc_I	sdivcc 	%r23, 0x0001, %r7
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 140: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 141: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xca8008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x87802010  ! 143: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d903f28  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x1f28, %pstate
	.word 0x8d9027e5  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x07e5, %pstate
	.word 0xcad00e60  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r5
DS_6_30:
	.word 0x20800001  ! 148: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
DS_6_31:
	.word 0x20800001  ! 149: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 148: SAVE_R	save	%r31, %r0, %r31
	.word 0xca8008a0  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xca97e000  ! 150: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r5
	.word 0x9a6a0018  ! 151: UDIVX_R	udivx 	%r8, %r24, %r13
	.word 0xc84fe001  ! 152: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0xc8c80e40  ! 153: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r4
	.word 0xc89fe001  ! 154: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
splash_tba_6_32:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc827e001  ! 156: STW_I	stw	%r4, [%r31 + 0x0001]
	.word 0xc8d004a0  ! 157: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_lsu_6_33:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99514000  ! 159: RDPR_TBA	<illegal instruction>
	.word 0xd737c018  ! 160: STQF_R	-	%f11, [%r24, %r31]
	.word 0xd61fc000  ! 161: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd6c7e010  ! 162: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
	.word 0xd6dfe030  ! 163: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0x8745c000  ! 164: RD_TICK_CMPR_REG	rd	%-, %r3
	.word 0x8d508000  ! 165: RDPR_TSTATE	<illegal instruction>
	.word 0xd89fe001  ! 166: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 167: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 168: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd89004a0  ! 169: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0x81982e5c  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5c, %hpstate
	.word 0xd84fc000  ! 171: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x8198209c  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009c, %hpstate
	.word 0x8d902e56  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x0e56, %pstate
	.word 0x9f802001  ! 174: SIR	sir	0x0001
DS_6_34:
	.word 0x34800001  ! 176: BG	bg,a	<label_0x1>
	pdist %f18, %f14, %f20
	.word 0xb5b34303  ! 175: ALLIGNADDRESS	alignaddr	%r13, %r3, %r26
DS_6_35:
	.word 0x32800001  ! 177: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 176: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_6_36:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 178: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 179: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d902938  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x0938, %pstate
	.word 0x93902000  ! 181: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_6_37:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 182: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 183: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9031ae  ! 184: WRPR_PSTATE_I	wrpr	%r0, 0x11ae, %pstate
	.word 0x91d02032  ! 185: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe2d004a0  ! 186: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x81982544  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0544, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 188: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d903f52  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x1f52, %pstate
splash_tba_6_38:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 190: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902007  ! 191: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa190200c  ! 192: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x83d02035  ! 193: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x879023f7  ! 194: WRPR_TT_I	wrpr	%r0, 0x03f7, %tt
	.word 0x91d02033  ! 195: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9751c000  ! 196: RDPR_TL	rdpr	%tl, %r11
	.word 0x8d9021de  ! 197: WRPR_PSTATE_I	wrpr	%r0, 0x01de, %pstate
	.word 0x91d020b3  ! 198: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xd607c000  ! 199: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x91d02034  ! 200: Tcc_I	ta	icc_or_xcc, %r0 + 52
tagged_6_39:
	taddcctv %r22, 0x1f2a, %r10
	.word 0xd607e001  ! 201: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xb3508000  ! 202: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xc48804a0  ! 203: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc48008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc48008a0  ! 205: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
change_to_randtl_6_40:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 206: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc48008a0  ! 207: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d02033  ! 209: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x91d02035  ! 210: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0x32800001  ! 212: BNE	bne,a	<label_0x1>
	.word 0x81982687  ! 213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0687, %hpstate
	.word 0xa1902000  ! 214: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_tba_6_41:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 215: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_6_42:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc48008a0  ! 217: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 218: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8780204f  ! 219: WRASI_I	wr	%r0, 0x004f, %asi
DS_6_43:
	.word 0x22800001  ! 221: BE	be,a	<label_0x1>
	.word 0xcd332001  ! 221: STQF_I	-	%f6, [0x0001, %r12]
	normalw
	.word 0xb3458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r25
splash_lsu_6_44:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 221: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xeec804a0  ! 222: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r23
	.word 0x8f50c000  ! 223: RDPR_TT	<illegal instruction>
	.word 0x8d802000  ! 224: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802088  ! 225: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xce8008a0  ! 226: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x87802058  ! 227: WRASI_I	wr	%r0, 0x0058, %asi
splash_tba_6_45:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 228: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x34700001  ! 229: BPG	<illegal instruction>
	.word 0x8d508000  ! 230: RDPR_TSTATE	<illegal instruction>
	.word 0x8790229d  ! 231: WRPR_TT_I	wrpr	%r0, 0x029d, %tt
tagged_6_46:
	tsubcctv %r1, 0x1e28, %r15
	.word 0xe207e001  ! 232: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x879022a8  ! 233: WRPR_TT_I	wrpr	%r0, 0x02a8, %tt
	.word 0xe28008a0  ! 234: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x80a8c014  ! 235: ANDNcc_R	andncc 	%r3, %r20, %r0
DS_6_47:
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 236: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982b5f  ! 237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b5f, %hpstate
	.word 0x87802004  ! 238: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87902258  ! 239: WRPR_TT_I	wrpr	%r0, 0x0258, %tt
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 240: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc61fe001  ! 241: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x2c800001  ! 242: BNEG	bneg,a	<label_0x1>
	.word 0xc6c7e020  ! 243: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r3
	.word 0x8d90210b  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x010b, %pstate
	.word 0x8d902fe2  ! 245: WRPR_PSTATE_I	wrpr	%r0, 0x0fe2, %pstate
	.word 0x87902243  ! 246: WRPR_TT_I	wrpr	%r0, 0x0243, %tt
splash_lsu_6_48:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x28700001  ! 248: BPLEU	<illegal instruction>
	.word 0xc607c000  ! 249: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0xc6880e60  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x73, %r3
	.word 0xc717c000  ! 251: LDQF_R	-	[%r31, %r0], %f3
tagged_6_49:
	taddcctv %r13, 0x12f3, %r5
	.word 0xc607e001  ! 252: LDUW_I	lduw	[%r31 + 0x0001], %r3
change_to_randtl_6_50:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 253: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xc68008a0  ! 254: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	otherw
	mov 0xb0, %r30
	.word 0x93d0001e  ! 255: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 256: SIR	sir	0x0001
change_to_randtl_6_51:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 257: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xc68008a0  ! 258: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc657c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r3
DS_6_52:
	.word 0x32800001  ! 261: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 260: SAVE_R	save	%r31, %r0, %r31
splash_lsu_6_53:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 262: BPN	<illegal instruction>
	.word 0x87802014  ! 263: WRASI_I	wr	%r0, 0x0014, %asi
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 264: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d903f44  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x1f44, %pstate
	.word 0xc61fc000  ! 266: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xc61fc000  ! 267: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x8d802000  ! 268: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_6_54:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 269: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8d903898  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x1898, %pstate
	.word 0x819823d5  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d5, %hpstate
	.word 0x87802055  ! 272: WRASI_I	wr	%r0, 0x0055, %asi
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021cd  ! 274: WRPR_TT_I	wrpr	%r0, 0x01cd, %tt
	.word 0x8198285d  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085d, %hpstate
	.word 0x87902149  ! 276: WRPR_TT_I	wrpr	%r0, 0x0149, %tt
	.word 0x91d02033  ! 277: Tcc_I	ta	icc_or_xcc, %r0 + 51
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 278: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6800be0  ! 279: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r3
	.word 0x93902004  ! 280: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902106  ! 281: WRPR_TT_I	wrpr	%r0, 0x0106, %tt
splash_tba_6_55:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 282: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68008a0  ! 283: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc6c804a0  ! 284: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
splash_cmpr_6_56:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb1812001  ! 285: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0x8d903a4d  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x1a4d, %pstate
splash_htba_6_57:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 287: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d903d33  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x1d33, %pstate
	.word 0x34700001  ! 289: BPG	<illegal instruction>
splash_cmpr_6_58:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb1856001  ! 290: WR_STICK_REG_I	wr	%r21, 0x0001, %-
	.word 0x93902003  ! 291: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x8780204f  ! 293: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x91d020b4  ! 294: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa190200e  ! 295: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x95a00565  ! 296: FSQRTq	fsqrt	
	.word 0x91d02035  ! 297: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_6_59:
	.word 0x20800001  ! 299: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 299: BG	bg,a	<label_0x1>
	.word 0x93a00544  ! 299: FSQRTd	fsqrt	
	.word 0x85a0482b  ! 298: FADDs	fadds	%f1, %f11, %f2
	.word 0xc68008a0  ! 299: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc68804a0  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
splash_tba_6_60:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 301: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc647e001  ! 302: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x99902002  ! 303: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x93902001  ! 304: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 305: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_6_61:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xc68008a0  ! 308: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x81982e16  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e16, %hpstate
splash_lsu_6_62:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc69004a0  ! 311: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x87802004  ! 312: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93d02033  ! 313: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8d9031d6  ! 314: WRPR_PSTATE_I	wrpr	%r0, 0x11d6, %pstate
	.word 0x8790231d  ! 315: WRPR_TT_I	wrpr	%r0, 0x031d, %tt
	.word 0x91d02032  ! 316: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_6_63:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 317: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc69fc020  ! 318: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
splash_lsu_6_64:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 320: BN	bn,a	<label_0x1>
	.word 0x8d902ebb  ! 321: WRPR_PSTATE_I	wrpr	%r0, 0x0ebb, %pstate
DS_6_65:
	.word 0x20800001  ! 323: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 322: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902001  ! 324: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb181c012  ! 323: WR_STICK_REG_R	wr	%r7, %r18, %-
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 324: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_6_67:
	taddcctv %r22, 0x103b, %r6
	.word 0xc607e001  ! 325: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_tba_6_68:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 326: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 328: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb182000c  ! 327: WR_STICK_REG_R	wr	%r8, %r12, %-
	.word 0x85508000  ! 328: RDPR_TSTATE	<illegal instruction>
splash_lsu_6_70:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 329: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d802000  ! 331: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d020b3  ! 332: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa1902005  ! 333: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 334: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02035  ! 335: Tcc_I	tne	icc_or_xcc, %r0 + 53
DS_6_71:
	.word 0x34800001  ! 337: BG	bg,a	<label_0x1>
	pdist %f20, %f22, %f18
	.word 0x8bb20300  ! 336: ALLIGNADDRESS	alignaddr	%r8, %r0, %r5
tagged_6_72:
	tsubcctv %r16, 0x1764, %r26
	.word 0xd807e001  ! 337: LDUW_I	lduw	[%r31 + 0x0001], %r12
tagged_6_73:
	taddcctv %r21, 0x1681, %r17
	.word 0xd807e001  ! 338: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8790232c  ! 339: WRPR_TT_I	wrpr	%r0, 0x032c, %tt
	.word 0x86d16001  ! 340: UMULcc_I	umulcc 	%r5, 0x0001, %r3
	.word 0x93902002  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
tagged_6_74:
	tsubcctv %r8, 0x1423, %r2
	.word 0xc407e001  ! 342: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x93902004  ! 343: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xc48008a0  ! 344: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc4800c40  ! 345: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r2
tagged_6_75:
	taddcctv %r6, 0x1416, %r19
	.word 0xc407e001  ! 346: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_6_76:
	.word 0x22800001  ! 348: BE	be,a	<label_0x1>
	.xword 0x8bcb85db	! Random illegal ?
	.word 0xe7124000  ! 348: LDQF_R	-	[%r9, %r0], %f19
	.word 0xa1a00823  ! 347: FADDs	fadds	%f0, %f3, %f16
	.word 0x93d02032  ! 348: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x8d514000  ! 349: RDPR_TBA	<illegal instruction>
	.word 0x8d902db2  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x0db2, %pstate
	.word 0xd0c80e80  ! 351: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r8
DS_6_77:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 352: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xd017e001  ! 353: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0xb1514000  ! 354: RDPR_TBA	rdpr	%tba, %r24
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x3e700001  ! 356: BPVC	<illegal instruction>
	.word 0x87902078  ! 357: WRPR_TT_I	wrpr	%r0, 0x0078, %tt
splash_lsu_6_78:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 358: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_6_79:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 359: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 361: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe647c000  ! 362: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x87902257  ! 363: WRPR_TT_I	wrpr	%r0, 0x0257, %tt
	.word 0x38800001  ! 364: BGU	bgu,a	<label_0x1>
	.word 0xe6900e80  ! 365: LDUHA_R	lduha	[%r0, %r0] 0x74, %r19
	.word 0x87802055  ! 366: WRASI_I	wr	%r0, 0x0055, %asi
splash_lsu_6_80:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 367: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81540000  ! 368: RDPR_GL	rdpr	%-, %r0
	.word 0xc8800c80  ! 369: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r4
splash_lsu_6_81:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc81fc000  ! 371: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xa1902008  ! 372: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xc807c000  ! 373: LDUW_R	lduw	[%r31 + %r0], %r4
splash_lsu_6_82:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 374: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95494000  ! 375: RDHPR_HTBA	rdhpr	%htba, %r10
	.word 0x8198251f  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x051f, %hpstate
splash_lsu_6_83:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_6_84:
	tsubcctv %r23, 0x1553, %r26
	.word 0xc807e001  ! 379: LDUW_I	lduw	[%r31 + 0x0001], %r4
change_to_randtl_6_85:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 380: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x83d020b5  ! 381: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xc8d004a0  ! 382: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_tba_6_86:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 383: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_6_87:
	.word 0x32800001  ! 386: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 386: BG	bg,a	<label_0x1>
	.word 0xeb158019  ! 386: LDQF_R	-	[%r22, %r25], %f21
	.word 0x8ba54823  ! 385: FADDs	fadds	%f21, %f3, %f5
	.word 0x9f802001  ! 386: SIR	sir	0x0001
splash_tba_6_88:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 387: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x3c700001  ! 388: BPPOS	<illegal instruction>
DS_6_89:
	.word 0x34800001  ! 390: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 389: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802014  ! 390: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xb7508000  ! 391: RDPR_TSTATE	rdpr	%tstate, %r27
	.word 0x20700001  ! 392: BPN	<illegal instruction>
splash_lsu_6_90:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 394: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd48fe010  ! 395: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x81982484  ! 396: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0484, %hpstate
	.word 0x32800001  ! 397: BNE	bne,a	<label_0x1>
tagged_6_91:
	taddcctv %r16, 0x1ab2, %r6
	.word 0xd407e001  ! 398: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d902aa2  ! 399: WRPR_PSTATE_I	wrpr	%r0, 0x0aa2, %pstate
	.word 0x8198291f  ! 400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091f, %hpstate
DS_6_92:
	.word 0x20800001  ! 402: BN	bn,a	<label_0x1>
	pdist %f30, %f16, %f16
	.word 0x87b48302  ! 401: ALLIGNADDRESS	alignaddr	%r18, %r2, %r3
	.word 0xec8008a0  ! 402: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x93902004  ! 403: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_lsu_6_93:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 404: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 405: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d903782  ! 406: WRPR_PSTATE_I	wrpr	%r0, 0x1782, %pstate
	.word 0x8d902893  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x0893, %pstate
tagged_6_94:
	tsubcctv %r1, 0x1d6d, %r12
	.word 0xec07e001  ! 408: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x91d020b2  ! 409: Tcc_I	ta	icc_or_xcc, %r0 + 178
tagged_6_95:
	taddcctv %r25, 0x106d, %r17
	.word 0xec07e001  ! 410: LDUW_I	lduw	[%r31 + 0x0001], %r22
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 411: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xecd004a0  ! 412: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r22
	.word 0x879020d3  ! 413: WRPR_TT_I	wrpr	%r0, 0x00d3, %tt
tagged_6_96:
	tsubcctv %r26, 0x1087, %r22
	.word 0xec07e001  ! 414: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x93902003  ! 415: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x95480000  ! 416: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x87902286  ! 417: WRPR_TT_I	wrpr	%r0, 0x0286, %tt
	.word 0xd64fe001  ! 418: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0xd68008a0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x93902001  ! 420: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d50c000  ! 421: RDPR_TT	rdpr	%tt, %r6
	.word 0x8f902002  ! 423: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8986c016  ! 422: WRTICK_R	wr	%r27, %r22, %tick
	.word 0xc6dfe010  ! 423: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r3
	.word 0x8f494000  ! 424: RDHPR_HTBA	rdhpr	%htba, %r7
	.word 0x95a689fb  ! 425: FDIVq	dis not found

	.word 0x91514000  ! 426: RDPR_TBA	<illegal instruction>
	.word 0x32700001  ! 427: BPNE	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee07c000  ! 429: LDUW_R	lduw	[%r31 + %r0], %r23
	.word 0x819823d7  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d7, %hpstate
	.word 0xa190200f  ! 431: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_lsu_6_98:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 432: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xee8008a0  ! 433: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
splash_tba_6_99:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 434: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x2a800001  ! 435: BCS	bcs,a	<label_0x1>
	.word 0x91d020b5  ! 436: Tcc_I	ta	icc_or_xcc, %r0 + 181
DS_6_100:
	.word 0x20800001  ! 438: BN	bn,a	<label_0x1>
	.word 0xe7366001  ! 438: STQF_I	-	%f19, [0x0001, %r25]
	normalw
	.word 0xad458000  ! 437: RD_SOFTINT_REG	rd	%softint, %r22
tagged_6_101:
	taddcctv %r12, 0x1c50, %r9
	.word 0xcc07e001  ! 438: LDUW_I	lduw	[%r31 + 0x0001], %r6
tagged_6_102:
	tsubcctv %r20, 0x14f1, %r18
	.word 0xcc07e001  ! 439: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x87802088  ! 440: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87902392  ! 441: WRPR_TT_I	wrpr	%r0, 0x0392, %tt
	.word 0x81982fc7  ! 442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc7, %hpstate
	.word 0x93902000  ! 443: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_6_103:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 444: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 445: BPN	<illegal instruction>
splash_lsu_6_104:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 446: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc800b20  ! 447: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r6
splash_lsu_6_105:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 448: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_6_106:
	tsubcctv %r23, 0x140e, %r8
	.word 0xcc07e001  ! 449: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc9fc020  ! 450: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x819823d4  ! 451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d4, %hpstate
	.word 0xccdfe020  ! 452: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
	.word 0x93902007  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
tagged_6_107:
	taddcctv %r16, 0x1ded, %r11
	.word 0xcc07e001  ! 454: LDUW_I	lduw	[%r31 + 0x0001], %r6
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 455: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 456: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xccc7e030  ! 457: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	.word 0x87802063  ! 458: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x91d02034  ! 459: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81982586  ! 460: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0586, %hpstate
	.word 0x8198288c  ! 461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x088c, %hpstate
splash_lsu_6_108:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 462: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc800bc0  ! 463: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r6
	.word 0xa9500000  ! 464: RDPR_TPC	rdpr	%tpc, %r20
	.word 0x83d020b4  ! 465: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x8d902186  ! 466: WRPR_PSTATE_I	wrpr	%r0, 0x0186, %pstate
	.word 0xc717c000  ! 467: LDQF_R	-	[%r31, %r0], %f3
	.word 0xa190200d  ! 468: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902005  ! 469: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902003  ! 470: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xb3464000  ! 471: RD_STICK_CMPR_REG	rd	%-, %r25
	.word 0x87802014  ! 472: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd8c004a0  ! 473: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
splash_tba_6_109:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 474: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd8800c40  ! 475: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r12
DS_6_110:
	.word 0x34800001  ! 477: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 476: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902004  ! 477: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa1902002  ! 478: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_tba_6_111:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 479: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902000  ! 480: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87802014  ! 481: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xd88008a0  ! 482: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x2e800001  ! 483: BVS	bvs,a	<label_0x1>
splash_lsu_6_112:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 484: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 485: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x93902004  ! 486: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902f70  ! 487: WRPR_PSTATE_I	wrpr	%r0, 0x0f70, %pstate
splash_tba_6_113:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902001  ! 489: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd8c80e40  ! 490: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r12
	.word 0xd89fe001  ! 491: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x9ba01a71  ! 492: FqTOi	fqtoi	
tagged_6_114:
	tsubcctv %r20, 0x150d, %r10
	.word 0xf607e001  ! 493: LDUW_I	lduw	[%r31 + 0x0001], %r27
DS_6_115:
	.word 0x32800001  ! 495: BNE	bne,a	<label_0x1>
	pdist %f16, %f20, %f20
	.word 0xa7b58306  ! 494: ALLIGNADDRESS	alignaddr	%r22, %r6, %r19
	.word 0xda57e001  ! 495: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0x87802004  ! 496: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802004  ! 497: WRASI_I	wr	%r0, 0x0004, %asi
splash_lsu_6_116:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 498: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902003  ! 499: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xda9fe001  ! 500: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xdadfe010  ! 501: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
DS_6_117:
	.word 0x20800001  ! 503: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 502: SAVE_R	save	%r31, %r0, %r31
tagged_6_118:
	tsubcctv %r20, 0x1dd3, %r7
	.word 0xda07e001  ! 503: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdad7e000  ! 504: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 505: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xab500000  ! 506: RDPR_TPC	<illegal instruction>
DS_6_119:
	.word 0x20800001  ! 508: BN	bn,a	<label_0x1>
	pdist %f30, %f28, %f26
	.word 0xafb50310  ! 507: ALLIGNADDRESS	alignaddr	%r20, %r16, %r23
DS_6_120:
	.word 0x32800001  ! 509: BNE	bne,a	<label_0x1>
	.xword 0xd36e50b6	! Random illegal ?
	.word 0xf516c019  ! 509: LDQF_R	-	[%r27, %r25], %f26
	.word 0xa5a44821  ! 508: FADDs	fadds	%f17, %f1, %f18
tagged_6_121:
	taddcctv %r18, 0x1698, %r20
	.word 0xc807e001  ! 509: LDUW_I	lduw	[%r31 + 0x0001], %r4
splash_tba_6_122:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 510: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902006  ! 511: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x87902108  ! 512: WRPR_TT_I	wrpr	%r0, 0x0108, %tt
	.word 0xc817e001  ! 513: LDUH_I	lduh	[%r31 + 0x0001], %r4
	.word 0x8790215c  ! 514: WRPR_TT_I	wrpr	%r0, 0x015c, %tt
	.word 0xb150c000  ! 515: RDPR_TT	rdpr	%tt, %r24
	.word 0x87508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0x22700001  ! 517: BPE	<illegal instruction>
change_to_randtl_6_123:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 518: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa190200b  ! 519: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd88008a0  ! 520: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x819821c7  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01c7, %hpstate
	.word 0x8f480000  ! 522: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x91d02032  ! 523: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81982085  ! 524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0085, %hpstate
	.word 0x97504000  ! 525: RDPR_TNPC	rdpr	%tnpc, %r11
splash_htba_6_124:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 526: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe44fc000  ! 527: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe44fe001  ! 528: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d02033  ! 530: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xe4d7e030  ! 531: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r18
tagged_6_125:
	taddcctv %r26, 0x19b1, %r16
	.word 0xe407e001  ! 532: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x879023c0  ! 533: WRPR_TT_I	wrpr	%r0, 0x03c0, %tt
	.word 0xe4bfc037  ! 534: STDA_R	stda	%r18, [%r31 + %r23] 0x01
	.word 0xe40fe001  ! 535: LDUB_I	ldub	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe527e001  ! 537: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe527e001  ! 538: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe4d7e020  ! 539: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
	.word 0x8198240c  ! 540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x040c, %hpstate
tagged_6_126:
	tsubcctv %r25, 0x14f6, %r22
	.word 0xe407e001  ! 541: LDUW_I	lduw	[%r31 + 0x0001], %r18
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 542: Tcc_R	te	icc_or_xcc, %r0 + %r30
tagged_6_127:
	taddcctv %r11, 0x1ed1, %r19
	.word 0xe407e001  ! 543: LDUW_I	lduw	[%r31 + 0x0001], %r18
splash_tba_6_128:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 544: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 545: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe45fe001  ! 546: LDX_I	ldx	[%r31 + 0x0001], %r18
	.word 0xe497e030  ! 547: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r18
	.word 0xe407c000  ! 548: LDUW_R	lduw	[%r31 + %r0], %r18
DS_6_129:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 549: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xe4800be0  ! 550: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
	.word 0xe417c000  ! 551: LDUH_R	lduh	[%r31 + %r0], %r18
	.word 0x91d02034  ! 552: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f802001  ! 553: SIR	sir	0x0001
	.word 0xe49fe001  ! 554: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
DS_6_130:
	.word 0x34800001  ! 556: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 555: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x30700001  ! 556: BPA	<illegal instruction>
	.word 0x87802004  ! 557: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802020  ! 558: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4c804a0  ! 559: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0xe44fe001  ! 560: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	.word 0x91d02033  ! 561: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_lsu_6_131:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 562: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe4800b80  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r18
	.word 0x87902070  ! 564: WRPR_TT_I	wrpr	%r0, 0x0070, %tt
	.word 0x81982956  ! 565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0956, %hpstate
splash_lsu_6_132:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 566: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe42fe001  ! 567: STB_I	stb	%r18, [%r31 + 0x0001]
	.word 0xa190200e  ! 568: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x87902383  ! 569: WRPR_TT_I	wrpr	%r0, 0x0383, %tt
	.word 0xe4d004a0  ! 570: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
	.word 0x91d02032  ! 571: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe4880e80  ! 572: LDUBA_R	lduba	[%r0, %r0] 0x74, %r18
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 573: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_6_133:
	.word 0x20800001  ! 575: BN	bn,a	<label_0x1>
	.word 0xf3314000  ! 575: STQF_R	-	%f25, [%r0, %r5]
	normalw
	.word 0xb1458000  ! 574: RD_SOFTINT_REG	rd	%softint, %r24
	.word 0x879022c6  ! 575: WRPR_TT_I	wrpr	%r0, 0x02c6, %tt
	.word 0xf217c000  ! 576: LDUH_R	lduh	[%r31 + %r0], %r25
	.word 0xf28008a0  ! 577: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8f902002  ! 579: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8b6aa001  ! 578: SDIVX_I	sdivx	%r10, 0x0001, %r5
	.word 0x91d020b2  ! 579: Tcc_I	ta	icc_or_xcc, %r0 + 178
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802004  ! 581: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8790238f  ! 582: WRPR_TT_I	wrpr	%r0, 0x038f, %tt
	.word 0x93902001  ! 583: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe29004a0  ! 584: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0x87802080  ! 585: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe28804a0  ! 586: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x87802063  ! 587: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8d903e70  ! 588: WRPR_PSTATE_I	wrpr	%r0, 0x1e70, %pstate
	.word 0x81982f5c  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5c, %hpstate
splash_lsu_6_135:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 590: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe21fe001  ! 591: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0xe28fe020  ! 592: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r17
tagged_6_136:
	tsubcctv %r3, 0x1e4f, %r7
	.word 0xe207e001  ! 593: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe21fe001  ! 594: LDD_I	ldd	[%r31 + 0x0001], %r17
splash_tba_6_137:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 595: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902737  ! 596: WRPR_PSTATE_I	wrpr	%r0, 0x0737, %pstate
	.word 0xa1902001  ! 597: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 598: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198205d  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005d, %hpstate
	.word 0x93902006  ! 600: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe297e000  ! 601: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	.word 0x8d9032f3  ! 602: WRPR_PSTATE_I	wrpr	%r0, 0x12f3, %pstate
splash_tba_6_138:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 603: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28fe010  ! 605: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
	.word 0x87802016  ! 606: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_6_139:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 607: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe28008a0  ! 608: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
DS_6_140:
	.word 0x32800001  ! 610: BNE	bne,a	<label_0x1>
	.xword 0xdf6eb4ca	! Random illegal ?
	.word 0x8ba0054c  ! 610: FSQRTd	fsqrt	
	.word 0xafa40822  ! 609: FADDs	fadds	%f16, %f2, %f23
	.word 0x87802055  ! 610: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8d902636  ! 611: WRPR_PSTATE_I	wrpr	%r0, 0x0636, %pstate
	.word 0x87902391  ! 612: WRPR_TT_I	wrpr	%r0, 0x0391, %tt
splash_tba_6_141:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 613: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0d00e60  ! 614: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r24
splash_htba_6_142:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 615: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_6_143:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 616: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_6_144:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 617: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 618: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93902006  ! 619: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d90211a  ! 620: WRPR_PSTATE_I	wrpr	%r0, 0x011a, %pstate
	ta	T_CHANGE_HPRIV	! macro
splash_tba_6_145:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 622: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x91514000  ! 623: RDPR_TBA	rdpr	%tba, %r8
tagged_6_146:
	tsubcctv %r23, 0x1ece, %r6
	.word 0xd207e001  ! 624: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x87802004  ! 625: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xb1480000  ! 626: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x87902273  ! 627: WRPR_TT_I	wrpr	%r0, 0x0273, %tt
tagged_6_147:
	taddcctv %r19, 0x1e49, %r25
	.word 0xca07e001  ! 628: LDUW_I	lduw	[%r31 + 0x0001], %r5
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 629: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca47c000  ! 630: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0x83d020b3  ! 631: Tcc_I	te	icc_or_xcc, %r0 + 179
	.word 0x8d902c81  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x0c81, %pstate
	.word 0x91d02034  ! 633: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93d020b2  ! 634: Tcc_I	tne	icc_or_xcc, %r0 + 178
	.word 0x8780204f  ! 635: WRASI_I	wr	%r0, 0x004f, %asi
tagged_6_148:
	tsubcctv %r4, 0x11c4, %r23
	.word 0xca07e001  ! 636: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x26800001  ! 637: BL	bl,a	<label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 638: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 640: SIR	sir	0x0001
	.word 0x36700001  ! 641: BPGE	<illegal instruction>
	.word 0x8d902395  ! 642: WRPR_PSTATE_I	wrpr	%r0, 0x0395, %pstate
	.word 0xca800aa0  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r5
splash_lsu_6_149:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 644: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9951c000  ! 645: RDPR_TL	rdpr	%tl, %r12
splash_lsu_6_150:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 646: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903417  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x1417, %pstate
DS_6_151:
	.word 0x22800001  ! 649: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 648: SAVE_R	save	%r31, %r0, %r31
DS_6_152:
	.word 0x32800001  ! 650: BNE	bne,a	<label_0x1>
	.xword 0xf750f149	! Random illegal ?
	.word 0xef114017  ! 650: LDQF_R	-	[%r5, %r23], %f23
	.word 0xa9a18824  ! 649: FADDs	fadds	%f6, %f4, %f20
	.word 0x8f902000  ! 651: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1834002  ! 650: WR_STICK_REG_R	wr	%r13, %r2, %-
	.word 0xd997e001  ! 651: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0xd89fe001  ! 652: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x9f802001  ! 653: SIR	sir	0x0001
	.word 0xd81fc000  ! 654: LDD_R	ldd	[%r31 + %r0], %r12
tagged_6_154:
	tsubcctv %r4, 0x12e2, %r8
	.word 0xd807e001  ! 655: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x87902377  ! 656: WRPR_TT_I	wrpr	%r0, 0x0377, %tt
splash_tba_6_155:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 657: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_6_156:
	.word 0x32800001  ! 659: BNE	bne,a	<label_0x1>
	.word 0xcb36a001  ! 659: STQF_I	-	%f5, [0x0001, %r26]
	normalw
	.word 0xa7458000  ! 658: RD_SOFTINT_REG	rd	%softint, %r19
	.word 0xce4fc000  ! 659: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0x8d9023d7  ! 660: WRPR_PSTATE_I	wrpr	%r0, 0x03d7, %pstate
	.word 0x34800001  ! 661: BG	bg,a	<label_0x1>
	.word 0x8d903e41  ! 662: WRPR_PSTATE_I	wrpr	%r0, 0x1e41, %pstate
DS_6_157:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 663: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x81982b4f  ! 664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4f, %hpstate
tagged_6_158:
	tsubcctv %r1, 0x1b1e, %r7
	.word 0xce07e001  ! 665: LDUW_I	lduw	[%r31 + 0x0001], %r7
DS_6_159:
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0x99a0055a  ! 667: FSQRTd	fsqrt	
	.word 0x91a30822  ! 666: FADDs	fadds	%f12, %f2, %f8
	.word 0xe49fe001  ! 667: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0x93902004  ! 668: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d802004  ! 669: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xe4800a80  ! 671: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r18
	.word 0x99902000  ! 672: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xa1902002  ! 673: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d45c000  ! 674: RD_TICK_CMPR_REG	rd	%-, %r6
	.word 0xecdfe000  ! 675: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r22
tagged_6_160:
	tsubcctv %r10, 0x1d11, %r26
	.word 0xec07e001  ! 676: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0xed17c000  ! 677: LDQF_R	-	[%r31, %r0], %f22
	.word 0xafa4cdda  ! 678: FdMULq	fdmulq	
	.word 0x8b500000  ! 679: RDPR_TPC	rdpr	%tpc, %r5
	.word 0xa1902005  ! 680: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8198269c  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x069c, %hpstate
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 682: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_6_161:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 683: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc4c7e000  ! 684: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r2
	.word 0x8780204f  ! 685: WRASI_I	wr	%r0, 0x004f, %asi
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc4c7e020  ! 687: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	.word 0xc4880e40  ! 688: LDUBA_R	lduba	[%r0, %r0] 0x72, %r2
	.word 0xc49fc020  ! 689: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x81460000  ! 691: RD_STICK_REG	stbar
	.word 0x8790216e  ! 692: WRPR_TT_I	wrpr	%r0, 0x016e, %tt
	.word 0xc4d804a0  ! 693: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0x8d902808  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x0808, %pstate
	.word 0xa190200e  ! 695: WRPR_GL_I	wrpr	%r0, 0x000e, %-
DS_6_162:
	.word 0x22800001  ! 697: BE	be,a	<label_0x1>
	.word 0xf730e001  ! 697: STQF_I	-	%f27, [0x0001, %r3]
	normalw
	.word 0x95458000  ! 696: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0x99902004  ! 697: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
splash_tba_6_163:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 698: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc28008a0  ! 699: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc317c000  ! 700: LDQF_R	-	[%r31, %r0], %f1
tagged_6_164:
	tsubcctv %r8, 0x1023, %r18
	.word 0xc207e001  ! 701: LDUW_I	lduw	[%r31 + 0x0001], %r1
tagged_6_165:
	taddcctv %r25, 0x1161, %r13
	.word 0xc207e001  ! 702: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc28008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc29fe001  ! 705: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x87802089  ! 706: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982f45  ! 707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f45, %hpstate
	.word 0xb1480000  ! 708: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf08804a0  ! 709: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x91d02035  ! 710: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8790234a  ! 711: WRPR_TT_I	wrpr	%r0, 0x034a, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902003  ! 713: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d903a5b  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x1a5b, %pstate
	.word 0xf08fe000  ! 715: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r24
splash_tba_6_166:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf09004a0  ! 717: LDUHA_R	lduha	[%r0, %r0] 0x25, %r24
	.word 0xa190200a  ! 718: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 719: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 721: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d903503  ! 722: WRPR_PSTATE_I	wrpr	%r0, 0x1503, %pstate
tagged_6_167:
	taddcctv %r10, 0x1fc6, %r13
	.word 0xf007e001  ! 723: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0xf0880e40  ! 724: LDUBA_R	lduba	[%r0, %r0] 0x72, %r24
	.word 0xf02fc009  ! 725: STB_R	stb	%r24, [%r31 + %r9]
	.word 0x87902121  ! 726: WRPR_TT_I	wrpr	%r0, 0x0121, %tt
	.word 0xf08804a0  ! 727: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x8780201c  ! 728: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x81982956  ! 729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0956, %hpstate
	.word 0xf0800ba0  ! 730: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r24
	.word 0x2c700001  ! 731: BPNEG	<illegal instruction>
	.word 0x93902006  ! 732: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d020b5  ! 733: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x93902007  ! 734: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x32700001  ! 735: BPNE	<illegal instruction>
	.word 0x87802088  ! 736: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xf01fc000  ! 737: LDD_R	ldd	[%r31 + %r0], %r24
	.word 0x93902001  ! 738: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_6_168:
	.word 0x22800001  ! 740: BE	be,a	<label_0x1>
	allclean
	.word 0xa3b24314  ! 739: ALLIGNADDRESS	alignaddr	%r9, %r20, %r17
	.word 0x91d02034  ! 740: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_6_169:
	.word 0x34800001  ! 742: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 741: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802000  ! 742: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 743: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 744: BPE	<illegal instruction>
	.word 0xc407c000  ! 745: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x93902002  ! 746: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x3a700001  ! 747: BPCC	<illegal instruction>
	.word 0x81982194  ! 748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0194, %hpstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 749: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83500000  ! 750: RDPR_TPC	rdpr	%tpc, %r1
splash_htba_6_170:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 751: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcc1fc000  ! 752: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x93902000  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902005  ! 754: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_6_171:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 755: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902003  ! 756: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_6_172:
	.word 0x22800001  ! 758: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 757: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fc000  ! 758: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0xcc8008a0  ! 759: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xa1902007  ! 760: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xcc4fc000  ! 761: LDSB_R	ldsb	[%r31 + %r0], %r6
DS_6_173:
	.word 0x22800001  ! 763: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 762: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fe001  ! 763: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x8198241f  ! 764: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041f, %hpstate
splash_tba_6_174:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 765: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcd97e001  ! 766: LDQFA_I	-	[%r31, 0x0001], %f6
	.word 0x93504000  ! 767: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0x91540000  ! 768: RDPR_GL	rdpr	%-, %r8
splash_lsu_6_175:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 769: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902006  ! 770: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x956e0012  ! 771: SDIVX_R	sdivx	%r24, %r18, %r10
	.word 0xaf508000  ! 772: RDPR_TSTATE	rdpr	%tstate, %r23
	.word 0x8d90345e  ! 773: WRPR_PSTATE_I	wrpr	%r0, 0x145e, %pstate
	.word 0x3e800001  ! 774: BVC	bvc,a	<label_0x1>
	.word 0xc2d004a0  ! 775: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x93902002  ! 776: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87802089  ! 777: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d90244e  ! 778: WRPR_PSTATE_I	wrpr	%r0, 0x044e, %pstate
	.word 0x93d020b3  ! 779: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0xc217c000  ! 780: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x8790212e  ! 781: WRPR_TT_I	wrpr	%r0, 0x012e, %tt
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 782: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b514000  ! 783: RDPR_TBA	rdpr	%tba, %r5
splash_lsu_6_176:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 784: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 785: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902006  ! 786: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xb5480000  ! 787: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0xce17c000  ! 788: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0xcec7e010  ! 789: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r7
DS_6_177:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 790: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x9f802001  ! 791: SIR	sir	0x0001
	.word 0x879021fe  ! 792: WRPR_TT_I	wrpr	%r0, 0x01fe, %tt
splash_tba_6_178:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce800b20  ! 794: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r7
	.word 0xcedfe020  ! 795: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r7
	.word 0x9f802001  ! 796: SIR	sir	0x0001
	otherw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 797: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xce1fc000  ! 798: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0xce4fc000  ! 799: LDSB_R	ldsb	[%r31 + %r0], %r7
tagged_6_179:
	taddcctv %r8, 0x1f80, %r7
	.word 0xce07e001  ! 800: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x87802080  ! 801: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa190200d  ! 802: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xce800ac0  ! 803: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r7
	.word 0x93d02032  ! 804: Tcc_I	tne	icc_or_xcc, %r0 + 50
splash_tba_6_180:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 805: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_6_181:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 806: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 807: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d903882  ! 808: WRPR_PSTATE_I	wrpr	%r0, 0x1882, %pstate
	.word 0x2e700001  ! 809: BPVS	<illegal instruction>
	.word 0xced7e020  ! 810: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r7
	.word 0x8790204e  ! 811: WRPR_TT_I	wrpr	%r0, 0x004e, %tt
splash_lsu_6_182:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 812: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 813: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x38800001  ! 814: BGU	bgu,a	<label_0x1>
splash_lsu_6_183:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 815: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 816: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xa1902006  ! 817: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_lsu_6_184:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 818: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcec004a0  ! 819: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xa190200d  ! 820: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_htba_6_185:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 821: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902006  ! 822: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xce800c00  ! 823: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r7
	.word 0xa190200f  ! 824: WRPR_GL_I	wrpr	%r0, 0x000f, %-
DS_6_186:
	.word 0x34800001  ! 826: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 825: SAVE_R	save	%r31, %r0, %r31
	.word 0x83a509ca  ! 826: FDIVd	fdivd	%f20, %f10, %f32
	.word 0x8f902001  ! 828: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93a0196a  ! 827: FqTOd	dis not found

	.word 0xd647e001  ! 828: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x879020aa  ! 829: WRPR_TT_I	wrpr	%r0, 0x00aa, %tt
	.word 0x8f902000  ! 831: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x85a0196d  ! 830: FqTOd	dis not found

splash_lsu_6_189:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 831: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9039a1  ! 832: WRPR_PSTATE_I	wrpr	%r0, 0x19a1, %pstate
	.word 0x85500000  ! 833: RDPR_TPC	rdpr	%tpc, %r2
	.word 0x93902006  ! 834: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_6_190:
	.word 0x32800001  ! 836: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 835: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_6_191:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 837: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xd01fe001  ! 838: LDD_I	ldd	[%r31 + 0x0001], %r8
splash_tba_6_192:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 839: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd04fe001  ! 840: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0xada54dcc  ! 841: FdMULq	fdmulq	
	.word 0x87802020  ! 842: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8f902000  ! 844: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb568a001  ! 843: SDIVX_I	sdivx	%r2, 0x0001, %r26
	.word 0xd41fe001  ! 844: LDD_I	ldd	[%r31 + 0x0001], %r10
splash_cmpr_6_194:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb1816001  ! 845: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0x93902002  ! 846: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982846  ! 847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0846, %hpstate
tagged_6_195:
	taddcctv %r7, 0x17cd, %r22
	.word 0xd407e001  ! 848: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd48008a0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4cfe030  ! 850: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
	.word 0x30800001  ! 851: BA	ba,a	<label_0x1>
change_to_randtl_6_196:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 852: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x87802014  ! 853: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9f802001  ! 854: SIR	sir	0x0001
	.word 0x81982a5f  ! 855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5f, %hpstate
DS_6_197:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 856: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8780201c  ! 857: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xa1902009  ! 858: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd41fe001  ! 859: LDD_I	ldd	[%r31 + 0x0001], %r10
tagged_6_198:
	tsubcctv %r17, 0x111a, %r6
	.word 0xd407e001  ! 860: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_tba_6_199:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 861: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802080  ! 862: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x879022ff  ! 863: WRPR_TT_I	wrpr	%r0, 0x02ff, %tt
	.word 0x8f480000  ! 864: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0xccdfe000  ! 865: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
	.word 0xcc800ba0  ! 866: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc1fe001  ! 868: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x81982456  ! 869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0456, %hpstate
	.word 0x93902000  ! 870: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xccdfe030  ! 871: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
tagged_6_200:
	tsubcctv %r6, 0x1f36, %r20
	.word 0xcc07e001  ! 872: LDUW_I	lduw	[%r31 + 0x0001], %r6
splash_tba_6_201:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 873: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802088  ! 874: WRASI_I	wr	%r0, 0x0088, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc0fc000  ! 876: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x87802004  ! 877: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87902120  ! 878: WRPR_TT_I	wrpr	%r0, 0x0120, %tt
	.word 0xccd7e000  ! 879: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc9004a0  ! 881: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
splash_lsu_6_202:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 882: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 883: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_6_203:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 884: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc8008a0  ! 885: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
DS_6_204:
	.word 0x22800001  ! 887: BE	be,a	<label_0x1>
	.word 0xf532c014  ! 887: STQF_R	-	%f26, [%r20, %r11]
	normalw
	.word 0x8d458000  ! 886: RD_SOFTINT_REG	rd	%softint, %r6
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 887: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf28008a0  ! 888: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
DS_6_205:
	.word 0x34800001  ! 890: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 889: RESTORE_R	restore	%r31, %r0, %r31
splash_htba_6_206:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 890: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xf2d804a0  ! 891: LDXA_R	ldxa	[%r0, %r0] 0x25, %r25
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 892: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2c7e000  ! 893: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r25
DS_6_207:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 894: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xf2880e40  ! 895: LDUBA_R	lduba	[%r0, %r0] 0x72, %r25
	.word 0x8198244d  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044d, %hpstate
	.word 0xf217e001  ! 897: LDUH_I	lduh	[%r31 + 0x0001], %r25
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 898: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 899: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xf2800ba0  ! 900: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r25
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 901: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf217c000  ! 902: LDUH_R	lduh	[%r31 + %r0], %r25
change_to_randtl_6_208:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 903: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x32800001  ! 904: BNE	bne,a	<label_0x1>
	.word 0xa190200c  ! 905: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87802063  ! 906: WRASI_I	wr	%r0, 0x0063, %asi
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 907: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2800ae0  ! 908: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r25
	.word 0x87802004  ! 909: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf317c000  ! 910: LDQF_R	-	[%r31, %r0], %f25
	.word 0xa190200d  ! 911: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902001  ! 912: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802004  ! 913: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf28fe020  ! 914: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r25
	.word 0x8d9026e8  ! 915: WRPR_PSTATE_I	wrpr	%r0, 0x06e8, %pstate
	.word 0xf28008a0  ! 916: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8f902000  ! 918: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xaf69a001  ! 917: SDIVX_I	sdivx	%r6, 0x0001, %r23
splash_lsu_6_210:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 918: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81464000  ! 919: RD_STICK_CMPR_REG	stbar
	.word 0xa1902002  ! 920: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x81982096  ! 921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0096, %hpstate
	.word 0xd6800aa0  ! 922: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r11
	.word 0x93902000  ! 923: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_6_211:
	taddcctv %r20, 0x1c5b, %r23
	.word 0xd607e001  ! 924: LDUW_I	lduw	[%r31 + 0x0001], %r11
DS_6_212:
	.word 0x22800001  ! 926: BE	be,a	<label_0x1>
	pdist %f10, %f2, %f14
	.word 0x81b3030d  ! 925: ALLIGNADDRESS	alignaddr	%r12, %r13, %r0
	.word 0x8d90215d  ! 926: WRPR_PSTATE_I	wrpr	%r0, 0x015d, %pstate
tagged_6_213:
	taddcctv %r20, 0x100f, %r10
	.word 0xc607e001  ! 927: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc607c000  ! 928: LDUW_R	lduw	[%r31 + %r0], %r3
splash_tba_6_214:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 929: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68fe000  ! 930: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r3
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 931: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802055  ! 933: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x93902001  ! 934: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc73fc002  ! 935: STDF_R	std	%f3, [%r2, %r31]
	.word 0xc6d80e60  ! 936: LDXA_R	ldxa	[%r0, %r0] 0x73, %r3
	.word 0xc717c000  ! 937: LDQF_R	-	[%r31, %r0], %f3
tagged_6_215:
	taddcctv %r23, 0x1298, %r21
	.word 0xc607e001  ! 938: LDUW_I	lduw	[%r31 + 0x0001], %r3
DS_6_216:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 939: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_tba_6_217:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 940: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_6_218:
	.word 0x22800001  ! 942: BE	be,a	<label_0x1>
	.xword 0xa3eb2959	! Random illegal ?
	.word 0xd9154004  ! 942: LDQF_R	-	[%r21, %r4], %f12
	.word 0x99a2083b  ! 941: FADDs	fadds	%f8, %f27, %f12
	.word 0x93902001  ! 942: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d9022b3  ! 943: WRPR_PSTATE_I	wrpr	%r0, 0x02b3, %pstate
	.word 0x8d902840  ! 944: WRPR_PSTATE_I	wrpr	%r0, 0x0840, %pstate
	.word 0x87802089  ! 945: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xc4880e80  ! 946: LDUBA_R	lduba	[%r0, %r0] 0x74, %r2
	.word 0xc49fc020  ! 947: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x93d02035  ! 948: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x93902004  ! 949: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc517c000  ! 951: LDQF_R	-	[%r31, %r0], %f2
	.word 0x24700001  ! 952: BPLE	<illegal instruction>
	.word 0x8f902000  ! 954: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb182400d  ! 953: WR_STICK_REG_R	wr	%r9, %r13, %-
	.word 0x8198249d  ! 954: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049d, %hpstate
	.word 0xc417c000  ! 955: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x93902004  ! 956: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa190200b  ! 957: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x81982914  ! 958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0914, %hpstate
	.word 0x93902004  ! 959: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xc4880e40  ! 960: LDUBA_R	lduba	[%r0, %r0] 0x72, %r2
	.word 0xc4800bc0  ! 961: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r2
	.word 0xa1902007  ! 962: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xb5494000  ! 963: RDHPR_HTBA	rdhpr	%htba, %r26
	.word 0xc4d7e030  ! 964: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r2
	.word 0x93902007  ! 965: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_6_220:
	.word 0x32800001  ! 967: BNE	bne,a	<label_0x1>
	.word 0xd531800b  ! 967: STQF_R	-	%f10, [%r11, %r6]
	normalw
	.word 0x91458000  ! 966: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xa1902000  ! 967: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_lsu_6_221:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 969: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x28800001  ! 970: BLEU	bleu,a	<label_0x1>
splash_lsu_6_222:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 971: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 972: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_6_223:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 974: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb181a001  ! 973: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x93d020b4  ! 974: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0xd4d00e60  ! 975: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r10
tagged_6_224:
	tsubcctv %r6, 0x1354, %r15
	.word 0xd407e001  ! 976: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4c004a0  ! 977: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x93902002  ! 978: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x99902004  ! 979: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x8d903762  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x1762, %pstate
	.word 0x93902007  ! 981: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d020b3  ! 982: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x22700001  ! 983: BPE	<illegal instruction>
	.word 0x93902007  ! 984: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 985: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 986: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 987: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd497e000  ! 988: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0xd4dfe000  ! 989: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x91d02035  ! 990: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x34800001  ! 991: BG	bg,a	<label_0x1>
	.word 0xa1902009  ! 992: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd48008a0  ! 993: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd597e001  ! 994: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x83d02033  ! 995: Tcc_I	te	icc_or_xcc, %r0 + 51
splash_htba_6_225:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 996: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902001  ! 997: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_6_226:
	.word 0x22800001  ! 999: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 998: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_6_227:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_6:
	.word 0x93d02034  ! 1: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x91d02035  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa190200a  ! 3: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_lsu_5_0:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 4: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8b514000  ! 5: RDPR_TBA	<illegal instruction>
tagged_5_1:
	taddcctv %r14, 0x1038, %r5
	.word 0xcc07e001  ! 6: LDUW_I	lduw	[%r31 + 0x0001], %r6
DS_5_2:
	.word 0x22800001  ! 8: BE	be,a	<label_0x1>
	pdist %f12, %f24, %f30
	.word 0xabb5830b  ! 7: ALLIGNADDRESS	alignaddr	%r22, %r11, %r21
	.word 0x8b514000  ! 8: RDPR_TBA	<illegal instruction>
tagged_5_3:
	taddcctv %r15, 0x1c74, %r16
	.word 0xc807e001  ! 9: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc81fe001  ! 10: LDD_I	ldd	[%r31 + 0x0001], %r4
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 11: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc8c7e020  ! 12: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	.word 0xc917c000  ! 13: LDQF_R	-	[%r31, %r0], %f4
	.word 0xc89fe001  ! 14: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 15: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x99902005  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xc807c000  ! 17: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0x8d802004  ! 18: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8145c000  ! 19: RD_TICK_CMPR_REG	stbar
	.word 0x91d020b4  ! 20: Tcc_I	ta	icc_or_xcc, %r0 + 180
DS_5_4:
	.word 0x32800001  ! 22: BNE	bne,a	<label_0x1>
	.word 0xf7360008  ! 22: STQF_R	-	%f27, [%r8, %r24]
	normalw
	.word 0x85458000  ! 21: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x879022ca  ! 22: WRPR_TT_I	wrpr	%r0, 0x02ca, %tt
DS_5_5:
	.word 0x32800001  ! 24: BNE	bne,a	<label_0x1>
	.word 0xcb308000  ! 24: STQF_R	-	%f5, [%r0, %r2]
	normalw
	.word 0x87458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r3
tagged_5_6:
	tsubcctv %r3, 0x1dbf, %r4
	.word 0xd607e001  ! 24: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x879022c4  ! 25: WRPR_TT_I	wrpr	%r0, 0x02c4, %tt
splash_tba_5_7:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 26: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982ed4  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed4, %hpstate
splash_lsu_5_8:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd65fe001  ! 29: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d7e000  ! 30: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
	.word 0xb750c000  ! 31: RDPR_TT	<illegal instruction>
	.word 0xda07c000  ! 32: LDUW_R	lduw	[%r31 + %r0], %r13
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 33: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982514  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0514, %hpstate
	.word 0xdad7e000  ! 36: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	.word 0xda47c000  ! 37: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0x81982816  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0816, %hpstate
	.word 0xa3464000  ! 39: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0x85464000  ! 40: RD_STICK_CMPR_REG	rd	%-, %r2
	.word 0x8d902193  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x0193, %pstate
	.word 0x87802088  ! 42: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa190200e  ! 43: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x879023e5  ! 44: WRPR_TT_I	wrpr	%r0, 0x03e5, %tt
DS_5_9:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
DS_5_10:
	.word 0x20800001  ! 47: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 46: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 47: BL	bl,a	<label_0x1>
DS_5_11:
	.word 0x22800001  ! 49: BE	be,a	<label_0x1>
	pdist %f12, %f10, %f30
	.word 0x87b0030a  ! 48: ALLIGNADDRESS	alignaddr	%r0, %r10, %r3
	.word 0xa1902000  ! 49: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd65fe001  ! 50: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d804a0  ! 51: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0xd6800c60  ! 52: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
	.word 0x8790216b  ! 53: WRPR_TT_I	wrpr	%r0, 0x016b, %tt
splash_htba_5_12:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 54: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d9032e7  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x12e7, %pstate
	.word 0xd617e001  ! 56: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0x8790201b  ! 57: WRPR_TT_I	wrpr	%r0, 0x001b, %tt
	.word 0xd6800b40  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r11
splash_tba_5_13:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87902383  ! 60: WRPR_TT_I	wrpr	%r0, 0x0383, %tt
	.word 0x83d020b5  ! 61: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xd68008a0  ! 62: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_5_14:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180a001  ! 63: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0xd6d7e000  ! 64: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
	.word 0x8d9029ba  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x09ba, %pstate
	.word 0x26700001  ! 66: BPL	<illegal instruction>
	.word 0x9550c000  ! 67: RDPR_TT	rdpr	%tt, %r10
	.word 0x8d902266  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x0266, %pstate
	.word 0x30800001  ! 69: BA	ba,a	<label_0x1>
splash_lsu_5_15:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 70: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903399  ! 71: WRPR_PSTATE_I	wrpr	%r0, 0x1399, %pstate
splash_lsu_5_16:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 72: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02034  ! 73: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xe137c009  ! 74: STQF_R	-	%f16, [%r9, %r31]
	.word 0xe057c000  ! 75: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0x819828dc  ! 76: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08dc, %hpstate
splash_tba_5_17:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 77: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802000  ! 78: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_htba_5_18:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_5_19:
	taddcctv %r16, 0x1cd6, %r15
	.word 0xe007e001  ! 80: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8d903195  ! 81: WRPR_PSTATE_I	wrpr	%r0, 0x1195, %pstate
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 82: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 83: BNE	bne,a	<label_0x1>
	.word 0x83d02035  ! 84: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x8790224e  ! 85: WRPR_TT_I	wrpr	%r0, 0x024e, %tt
	.word 0xe0d7e020  ! 86: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
	.word 0xa7504000  ! 87: RDPR_TNPC	rdpr	%tnpc, %r19
	.word 0x91d02034  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x26700001  ! 89: BPL	<illegal instruction>
	.word 0x8d9020a7  ! 90: WRPR_PSTATE_I	wrpr	%r0, 0x00a7, %pstate
	.word 0x9f802001  ! 91: SIR	sir	0x0001
	.word 0x93d02034  ! 92: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x81982b4f  ! 93: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4f, %hpstate
	.word 0xc24fc000  ! 94: LDSB_R	ldsb	[%r31 + %r0], %r1
DS_5_20:
	.word 0x32800001  ! 96: BNE	bne,a	<label_0x1>
	.xword 0xc17298cf	! Random illegal ?
	.word 0xc5154002  ! 96: LDQF_R	-	[%r21, %r2], %f2
	.word 0xaba30836  ! 95: FADDs	fadds	%f12, %f22, %f21
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 96: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_5_21:
	taddcctv %r6, 0x187b, %r16
	.word 0xc007e001  ! 97: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x2a800001  ! 98: BCS	bcs,a	<label_0x1>
	.word 0xc08804a0  ! 99: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0xa1902008  ! 100: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xc017c000  ! 101: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc03fe001  ! 102: STD_I	std	%r0, [%r31 + 0x0001]
	.word 0x93902005  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc08008a0  ! 104: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x93902003  ! 105: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81460000  ! 106: RD_STICK_REG	stbar
	.word 0xc01fc000  ! 107: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x819824de  ! 108: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04de, %hpstate
	.word 0xc0c7e010  ! 109: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r0
	.word 0x8d902ed5  ! 110: WRPR_PSTATE_I	wrpr	%r0, 0x0ed5, %pstate
	.word 0xb1500000  ! 111: RDPR_TPC	rdpr	%tpc, %r24
	.word 0x8d500000  ! 112: RDPR_TPC	<illegal instruction>
splash_cmpr_5_22:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181a001  ! 113: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0xe097e020  ! 114: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r16
tagged_5_23:
	taddcctv %r8, 0x1628, %r24
	.word 0xe007e001  ! 115: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe0d7e010  ! 116: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
	.word 0x8198230c  ! 117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030c, %hpstate
	.word 0xe0d80e80  ! 118: LDXA_R	ldxa	[%r0, %r0] 0x74, %r16
	ta	T_CHANGE_HPRIV	! macro
DS_5_24:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 120: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_tba_5_25:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 121: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0d80e40  ! 122: LDXA_R	ldxa	[%r0, %r0] 0x72, %r16
	.word 0x9f802001  ! 123: SIR	sir	0x0001
	.word 0x8198229f  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029f, %hpstate
	.word 0xe0dfe030  ! 125: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r16
	.word 0x8790237e  ! 126: WRPR_TT_I	wrpr	%r0, 0x037e, %tt
	.word 0x87902070  ! 127: WRPR_TT_I	wrpr	%r0, 0x0070, %tt
	.word 0xe01fc000  ! 128: LDD_R	ldd	[%r31 + %r0], %r16
change_to_randtl_5_26:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 129: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d9035a5  ! 130: WRPR_PSTATE_I	wrpr	%r0, 0x15a5, %pstate
splash_lsu_5_27:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1824009  ! 132: WR_STICK_REG_R	wr	%r9, %r9, %-
	.word 0x81982697  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0697, %hpstate
	.word 0xe08008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
change_to_randtl_5_29:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 135: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe08008a0  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x93902007  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902f13  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x0f13, %pstate
	.word 0x98fd6001  ! 139: SDIVcc_I	sdivcc 	%r21, 0x0001, %r12
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 140: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 141: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xca8008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x87802016  ! 143: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d903b9a  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x1b9a, %pstate
	.word 0x8d9027d1  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x07d1, %pstate
	.word 0xcad004a0  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
DS_5_30:
	.word 0x20800001  ! 148: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
DS_5_31:
	.word 0x20800001  ! 149: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 148: SAVE_R	save	%r31, %r0, %r31
	.word 0xca8008a0  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xca97e010  ! 150: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r5
	.word 0xa26a8019  ! 151: UDIVX_R	udivx 	%r10, %r25, %r17
	.word 0xc84fe001  ! 152: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0xc8c80e60  ! 153: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r4
	.word 0xc89fe001  ! 154: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
splash_tba_5_32:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc827e001  ! 156: STW_I	stw	%r4, [%r31 + 0x0001]
	.word 0xc8d004a0  ! 157: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_lsu_5_33:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x85514000  ! 159: RDPR_TBA	<illegal instruction>
	.word 0xd737c018  ! 160: STQF_R	-	%f11, [%r24, %r31]
	.word 0xd61fc000  ! 161: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd6c7e030  ! 162: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
	.word 0xd6dfe000  ! 163: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r11
	.word 0x9145c000  ! 164: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x81508000  ! 165: RDPR_TSTATE	<illegal instruction>
	.word 0xd89fe001  ! 166: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	invalw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 167: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd8900e80  ! 169: LDUHA_R	lduha	[%r0, %r0] 0x74, %r12
	.word 0x819824de  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04de, %hpstate
	.word 0xd84fc000  ! 171: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x8198204f  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x004f, %hpstate
	.word 0x8d902012  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x0012, %pstate
	.word 0x9f802001  ! 174: SIR	sir	0x0001
DS_5_34:
	.word 0x34800001  ! 176: BG	bg,a	<label_0x1>
	pdist %f26, %f24, %f26
	.word 0xb1b28310  ! 175: ALLIGNADDRESS	alignaddr	%r10, %r16, %r24
DS_5_35:
	.word 0x32800001  ! 177: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 176: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_5_36:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 178: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902002  ! 179: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8d902922  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x0922, %pstate
	.word 0x93902000  ! 181: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_5_37:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 182: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 183: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903238  ! 184: WRPR_PSTATE_I	wrpr	%r0, 0x1238, %pstate
	.word 0x83d02035  ! 185: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xe2d004a0  ! 186: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x81982f55  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f55, %hpstate
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 188: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902ee3  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x0ee3, %pstate
splash_tba_5_38:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 190: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902005  ! 191: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa190200d  ! 192: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91d020b2  ! 193: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x87902307  ! 194: WRPR_TT_I	wrpr	%r0, 0x0307, %tt
	.word 0x93d02035  ! 195: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xb551c000  ! 196: RDPR_TL	rdpr	%tl, %r26
	.word 0x8d902fee  ! 197: WRPR_PSTATE_I	wrpr	%r0, 0x0fee, %pstate
	.word 0x91d020b3  ! 198: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xd607c000  ! 199: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x91d02033  ! 200: Tcc_I	ta	icc_or_xcc, %r0 + 51
tagged_5_39:
	taddcctv %r14, 0x1f9d, %r15
	.word 0xd607e001  ! 201: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x97508000  ! 202: RDPR_TSTATE	<illegal instruction>
	.word 0xc48804a0  ! 203: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc4800c00  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r2
	.word 0xc48008a0  ! 205: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
change_to_randtl_5_40:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 206: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc48008a0  ! 207: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02035  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x83d02032  ! 210: Tcc_I	te	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	.word 0x32800001  ! 212: BNE	bne,a	<label_0x1>
	.word 0x8198265e  ! 213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x065e, %hpstate
	.word 0xa1902007  ! 214: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_tba_5_41:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 215: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_5_42:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc48008a0  ! 217: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 219: WRASI_I	wr	%r0, 0x0010, %asi
DS_5_43:
	.word 0x22800001  ! 221: BE	be,a	<label_0x1>
	.word 0xd9302001  ! 221: STQF_I	-	%f12, [0x0001, %r0]
	normalw
	.word 0x91458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r8
splash_lsu_5_44:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 221: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xeec804a0  ! 222: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r23
	.word 0x9350c000  ! 223: RDPR_TT	<illegal instruction>
	.word 0x8d802000  ! 224: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802080  ! 225: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xce8008a0  ! 226: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x87802016  ! 227: WRASI_I	wr	%r0, 0x0016, %asi
splash_tba_5_45:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 228: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x34700001  ! 229: BPG	<illegal instruction>
	.word 0x83508000  ! 230: RDPR_TSTATE	<illegal instruction>
	.word 0x879022b7  ! 231: WRPR_TT_I	wrpr	%r0, 0x02b7, %tt
tagged_5_46:
	tsubcctv %r2, 0x1d78, %r23
	.word 0xe207e001  ! 232: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x879021ed  ! 233: WRPR_TT_I	wrpr	%r0, 0x01ed, %tt
	.word 0xe28008a0  ! 234: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x88a8c01b  ! 235: ANDNcc_R	andncc 	%r3, %r27, %r4
DS_5_47:
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 236: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982d96  ! 237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d96, %hpstate
	.word 0x87802063  ! 238: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x87902392  ! 239: WRPR_TT_I	wrpr	%r0, 0x0392, %tt
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 240: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc61fe001  ! 241: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x2c800001  ! 242: BNEG	bneg,a	<label_0x1>
	.word 0xc6c7e010  ! 243: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
	.word 0x8d90273d  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x073d, %pstate
	.word 0x8d903568  ! 245: WRPR_PSTATE_I	wrpr	%r0, 0x1568, %pstate
	.word 0x879023f2  ! 246: WRPR_TT_I	wrpr	%r0, 0x03f2, %tt
splash_lsu_5_48:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x28700001  ! 248: BPLEU	<illegal instruction>
	.word 0xc607c000  ! 249: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0xc6880e60  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x73, %r3
	.word 0xc717c000  ! 251: LDQF_R	-	[%r31, %r0], %f3
tagged_5_49:
	taddcctv %r15, 0x108c, %r10
	.word 0xc607e001  ! 252: LDUW_I	lduw	[%r31 + 0x0001], %r3
change_to_randtl_5_50:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 253: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xc68008a0  ! 254: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 255: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 256: SIR	sir	0x0001
change_to_randtl_5_51:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 257: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xc68008a0  ! 258: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc657c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r3
DS_5_52:
	.word 0x32800001  ! 261: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 260: SAVE_R	save	%r31, %r0, %r31
splash_lsu_5_53:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 262: BPN	<illegal instruction>
	.word 0x87802016  ! 263: WRASI_I	wr	%r0, 0x0016, %asi
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 264: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9021e7  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x01e7, %pstate
	.word 0xc61fc000  ! 266: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xc61fc000  ! 267: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x8d802000  ! 268: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_5_54:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 269: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8d902961  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0961, %pstate
	.word 0x81982ec4  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec4, %hpstate
	.word 0x87802088  ! 272: WRASI_I	wr	%r0, 0x0088, %asi
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902012  ! 274: WRPR_TT_I	wrpr	%r0, 0x0012, %tt
	.word 0x81982b8d  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8d, %hpstate
	.word 0x879021ee  ! 276: WRPR_TT_I	wrpr	%r0, 0x01ee, %tt
	.word 0x91d02032  ! 277: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 278: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6800c40  ! 279: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r3
	.word 0x93902001  ! 280: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87902240  ! 281: WRPR_TT_I	wrpr	%r0, 0x0240, %tt
splash_tba_5_55:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 282: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc6800c60  ! 283: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r3
	.word 0xc6c80e80  ! 284: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r3
splash_cmpr_5_56:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb184a001  ! 285: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0x8d902e08  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x0e08, %pstate
splash_htba_5_57:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 287: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d90380a  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x180a, %pstate
	.word 0x34700001  ! 289: BPG	<illegal instruction>
splash_cmpr_5_58:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1806001  ! 290: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0x93902007  ! 291: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x8780201c  ! 293: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x83d02032  ! 294: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xa190200f  ! 295: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x83a00575  ! 296: FSQRTq	fsqrt	
	.word 0x91d02033  ! 297: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_5_59:
	.word 0x20800001  ! 299: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 299: BG	bg,a	<label_0x1>
	.word 0xb3a0054b  ! 299: FSQRTd	fsqrt	
	.word 0x8fa64834  ! 298: FADDs	fadds	%f25, %f20, %f7
	.word 0xc68008a0  ! 299: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc68804a0  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
splash_tba_5_60:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 301: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc647e001  ! 302: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x99902005  ! 303: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x93902004  ! 304: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 305: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_5_61:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xc6800c60  ! 308: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r3
	.word 0x81982c4e  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4e, %hpstate
splash_lsu_5_62:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc6900e40  ! 311: LDUHA_R	lduha	[%r0, %r0] 0x72, %r3
	.word 0x87802010  ! 312: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93d02035  ! 313: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8d903358  ! 314: WRPR_PSTATE_I	wrpr	%r0, 0x1358, %pstate
	.word 0x87902030  ! 315: WRPR_TT_I	wrpr	%r0, 0x0030, %tt
	.word 0x91d020b5  ! 316: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_tba_5_63:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 317: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc69fc020  ! 318: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
splash_lsu_5_64:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 320: BN	bn,a	<label_0x1>
	.word 0x8d903367  ! 321: WRPR_PSTATE_I	wrpr	%r0, 0x1367, %pstate
DS_5_65:
	.word 0x20800001  ! 323: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 322: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902002  ! 324: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1824000  ! 323: WR_STICK_REG_R	wr	%r9, %r0, %-
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 324: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_5_67:
	taddcctv %r4, 0x185f, %r21
	.word 0xc607e001  ! 325: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_tba_5_68:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 326: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902002  ! 328: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1828001  ! 327: WR_STICK_REG_R	wr	%r10, %r1, %-
	.word 0xb1508000  ! 328: RDPR_TSTATE	<illegal instruction>
splash_lsu_5_70:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 329: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d802000  ! 331: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02034  ! 332: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa190200a  ! 333: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 334: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 335: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_5_71:
	.word 0x34800001  ! 337: BG	bg,a	<label_0x1>
	pdist %f0, %f20, %f30
	.word 0x95b1c317  ! 336: ALLIGNADDRESS	alignaddr	%r7, %r23, %r10
tagged_5_72:
	tsubcctv %r11, 0x15ca, %r14
	.word 0xd807e001  ! 337: LDUW_I	lduw	[%r31 + 0x0001], %r12
tagged_5_73:
	taddcctv %r26, 0x13f5, %r18
	.word 0xd807e001  ! 338: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8790201b  ! 339: WRPR_TT_I	wrpr	%r0, 0x001b, %tt
	.word 0xb2d36001  ! 340: UMULcc_I	umulcc 	%r13, 0x0001, %r25
	.word 0x93902004  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_5_74:
	tsubcctv %r7, 0x13ac, %r5
	.word 0xc407e001  ! 342: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x93902006  ! 343: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc4800be0  ! 344: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r2
	.word 0xc4800c60  ! 345: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r2
tagged_5_75:
	taddcctv %r12, 0x1e99, %r12
	.word 0xc407e001  ! 346: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_5_76:
	.word 0x22800001  ! 348: BE	be,a	<label_0x1>
	.xword 0xadc1757f	! Random illegal ?
	.word 0xd7120011  ! 348: LDQF_R	-	[%r8, %r17], %f11
	.word 0x8ba20830  ! 347: FADDs	fadds	%f8, %f16, %f5
	.word 0x93d02033  ! 348: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa1514000  ! 349: RDPR_TBA	<illegal instruction>
	.word 0x8d903fb6  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x1fb6, %pstate
	.word 0xd0c804a0  ! 351: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
DS_5_77:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 352: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xd017e001  ! 353: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0x8d514000  ! 354: RDPR_TBA	<illegal instruction>
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x3e700001  ! 356: BPVC	<illegal instruction>
	.word 0x879023b9  ! 357: WRPR_TT_I	wrpr	%r0, 0x03b9, %tt
splash_lsu_5_78:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 358: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_5_79:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 359: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 361: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe647c000  ! 362: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x8790202f  ! 363: WRPR_TT_I	wrpr	%r0, 0x002f, %tt
	.word 0x38800001  ! 364: BGU	bgu,a	<label_0x1>
	.word 0xe6900e80  ! 365: LDUHA_R	lduha	[%r0, %r0] 0x74, %r19
	.word 0x87802058  ! 366: WRASI_I	wr	%r0, 0x0058, %asi
splash_lsu_5_80:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 367: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87540000  ! 368: RDPR_GL	rdpr	%-, %r3
	.word 0xc8800a80  ! 369: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r4
splash_lsu_5_81:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc81fc000  ! 371: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xa190200a  ! 372: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xc807c000  ! 373: LDUW_R	lduw	[%r31 + %r0], %r4
splash_lsu_5_82:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 374: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab494000  ! 375: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0x819823df  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03df, %hpstate
splash_lsu_5_83:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_5_84:
	tsubcctv %r11, 0x1d05, %r12
	.word 0xc807e001  ! 379: LDUW_I	lduw	[%r31 + 0x0001], %r4
change_to_randtl_5_85:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 380: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x91d02032  ! 381: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc8d00e80  ! 382: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r4
splash_tba_5_86:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 383: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 384: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_5_87:
	.word 0x32800001  ! 386: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 386: BG	bg,a	<label_0x1>
	.word 0xd7134014  ! 386: LDQF_R	-	[%r13, %r20], %f11
	.word 0x87a34829  ! 385: FADDs	fadds	%f13, %f9, %f3
	.word 0x9f802001  ! 386: SIR	sir	0x0001
splash_tba_5_88:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 387: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x3c700001  ! 388: BPPOS	<illegal instruction>
DS_5_89:
	.word 0x34800001  ! 390: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 389: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802010  ! 390: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xb7508000  ! 391: RDPR_TSTATE	<illegal instruction>
	.word 0x20700001  ! 392: BPN	<illegal instruction>
splash_lsu_5_90:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802063  ! 394: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xd48fe000  ! 395: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0x81982205  ! 396: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0205, %hpstate
	.word 0x32800001  ! 397: BNE	bne,a	<label_0x1>
tagged_5_91:
	taddcctv %r21, 0x1bc1, %r21
	.word 0xd407e001  ! 398: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d9026ed  ! 399: WRPR_PSTATE_I	wrpr	%r0, 0x06ed, %pstate
	.word 0x81982a9d  ! 400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9d, %hpstate
DS_5_92:
	.word 0x20800001  ! 402: BN	bn,a	<label_0x1>
	pdist %f14, %f30, %f20
	.word 0x83b08315  ! 401: ALLIGNADDRESS	alignaddr	%r2, %r21, %r1
	.word 0xec800aa0  ! 402: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r22
	.word 0x93902004  ! 403: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_lsu_5_93:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 404: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 405: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d903e0c  ! 406: WRPR_PSTATE_I	wrpr	%r0, 0x1e0c, %pstate
	.word 0x8d903cc6  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x1cc6, %pstate
tagged_5_94:
	tsubcctv %r25, 0x1b52, %r25
	.word 0xec07e001  ! 408: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x91d020b3  ! 409: Tcc_I	ta	icc_or_xcc, %r0 + 179
tagged_5_95:
	taddcctv %r22, 0x1943, %r13
	.word 0xec07e001  ! 410: LDUW_I	lduw	[%r31 + 0x0001], %r22
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 411: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xecd00e60  ! 412: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r22
	.word 0x8790235d  ! 413: WRPR_TT_I	wrpr	%r0, 0x035d, %tt
tagged_5_96:
	tsubcctv %r21, 0x1c19, %r5
	.word 0xec07e001  ! 414: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x93902001  ! 415: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x89480000  ! 416: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x8790219d  ! 417: WRPR_TT_I	wrpr	%r0, 0x019d, %tt
	.word 0xd64fe001  ! 418: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0xd68008a0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x93902000  ! 420: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xaf50c000  ! 421: RDPR_TT	rdpr	%tt, %r23
	.word 0x8f902001  ! 423: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89800011  ! 422: WRTICK_R	wr	%r0, %r17, %tick
	.word 0xc6dfe000  ! 423: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r3
	.word 0x8f494000  ! 424: RDHPR_HTBA	rdhpr	%htba, %r7
	.word 0xafa249f5  ! 425: FDIVq	dis not found

	.word 0x99514000  ! 426: RDPR_TBA	<illegal instruction>
	.word 0x32700001  ! 427: BPNE	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee07c000  ! 429: LDUW_R	lduw	[%r31 + %r0], %r23
	.word 0x81982a8e  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8e, %hpstate
	.word 0xa1902001  ! 431: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_lsu_5_98:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 432: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xee8008a0  ! 433: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
splash_tba_5_99:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 434: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x2a800001  ! 435: BCS	bcs,a	<label_0x1>
	.word 0x91d02035  ! 436: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_5_100:
	.word 0x20800001  ! 438: BN	bn,a	<label_0x1>
	.word 0xe3326001  ! 438: STQF_I	-	%f17, [0x0001, %r9]
	normalw
	.word 0x91458000  ! 437: RD_SOFTINT_REG	rd	%softint, %r8
tagged_5_101:
	taddcctv %r10, 0x14f1, %r20
	.word 0xcc07e001  ! 438: LDUW_I	lduw	[%r31 + 0x0001], %r6
tagged_5_102:
	tsubcctv %r13, 0x13dc, %r23
	.word 0xcc07e001  ! 439: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x87802055  ! 440: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8790221b  ! 441: WRPR_TT_I	wrpr	%r0, 0x021b, %tt
	.word 0x81982b86  ! 442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b86, %hpstate
	.word 0x93902001  ! 443: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_5_103:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 444: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 445: BPN	<illegal instruction>
splash_lsu_5_104:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 446: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc8008a0  ! 447: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
splash_lsu_5_105:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 448: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_5_106:
	tsubcctv %r16, 0x1b9d, %r20
	.word 0xcc07e001  ! 449: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc9fc020  ! 450: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x8198219e  ! 451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019e, %hpstate
	.word 0xccdfe020  ! 452: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
	.word 0x93902000  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_5_107:
	taddcctv %r15, 0x1468, %r15
	.word 0xcc07e001  ! 454: LDUW_I	lduw	[%r31 + 0x0001], %r6
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 455: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 456: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xccc7e020  ! 457: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r6
	.word 0x87802063  ! 458: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x93d02033  ! 459: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x81982dd5  ! 460: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd5, %hpstate
	.word 0x8198241d  ! 461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041d, %hpstate
splash_lsu_5_108:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 462: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc8008a0  ! 463: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x91500000  ! 464: RDPR_TPC	<illegal instruction>
	.word 0x93d02034  ! 465: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8d902181  ! 466: WRPR_PSTATE_I	wrpr	%r0, 0x0181, %pstate
	.word 0xc717c000  ! 467: LDQF_R	-	[%r31, %r0], %f3
	.word 0xa1902003  ! 468: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902002  ! 469: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902006  ! 470: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93464000  ! 471: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x87802004  ! 472: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd8c004a0  ! 473: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
splash_tba_5_109:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 474: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd88008a0  ! 475: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_5_110:
	.word 0x34800001  ! 477: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 476: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902000  ! 477: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa190200d  ! 478: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_tba_5_111:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 479: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200e  ! 480: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x87802010  ! 481: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xd8800c40  ! 482: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r12
	.word 0x2e800001  ! 483: BVS	bvs,a	<label_0x1>
splash_lsu_5_112:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 484: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 485: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x93902007  ! 486: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d903c85  ! 487: WRPR_PSTATE_I	wrpr	%r0, 0x1c85, %pstate
splash_tba_5_113:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902007  ! 489: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd8c80e40  ! 490: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r12
	.word 0xd89fe001  ! 491: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x8da01a70  ! 492: FqTOi	fqtoi	
tagged_5_114:
	tsubcctv %r24, 0x128b, %r17
	.word 0xf607e001  ! 493: LDUW_I	lduw	[%r31 + 0x0001], %r27
DS_5_115:
	.word 0x32800001  ! 495: BNE	bne,a	<label_0x1>
	pdist %f18, %f20, %f2
	.word 0x83b24307  ! 494: ALLIGNADDRESS	alignaddr	%r9, %r7, %r1
	.word 0xda57e001  ! 495: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0x87802058  ! 496: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87802010  ! 497: WRASI_I	wr	%r0, 0x0010, %asi
splash_lsu_5_116:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 498: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 499: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xda9fe001  ! 500: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xdadfe030  ! 501: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
DS_5_117:
	.word 0x20800001  ! 503: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 502: SAVE_R	save	%r31, %r0, %r31
tagged_5_118:
	tsubcctv %r17, 0x137e, %r22
	.word 0xda07e001  ! 503: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdad7e000  ! 504: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 505: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa3500000  ! 506: RDPR_TPC	<illegal instruction>
DS_5_119:
	.word 0x20800001  ! 508: BN	bn,a	<label_0x1>
	pdist %f10, %f20, %f26
	.word 0xa1b20315  ! 507: ALLIGNADDRESS	alignaddr	%r8, %r21, %r16
DS_5_120:
	.word 0x32800001  ! 509: BNE	bne,a	<label_0x1>
	.xword 0xefd037bb	! Random illegal ?
	.word 0xeb12c009  ! 509: LDQF_R	-	[%r11, %r9], %f21
	.word 0x97a28832  ! 508: FADDs	fadds	%f10, %f18, %f11
tagged_5_121:
	taddcctv %r14, 0x116a, %r16
	.word 0xc807e001  ! 509: LDUW_I	lduw	[%r31 + 0x0001], %r4
splash_tba_5_122:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 510: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902008  ! 511: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8790234c  ! 512: WRPR_TT_I	wrpr	%r0, 0x034c, %tt
	.word 0xc817e001  ! 513: LDUH_I	lduh	[%r31 + 0x0001], %r4
	.word 0x87902297  ! 514: WRPR_TT_I	wrpr	%r0, 0x0297, %tt
	.word 0x9550c000  ! 515: RDPR_TT	<illegal instruction>
	.word 0x8d508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0x22700001  ! 517: BPE	<illegal instruction>
change_to_randtl_5_123:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 518: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xa1902002  ! 519: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd88008a0  ! 520: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x8198275c  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075c, %hpstate
	.word 0xb1480000  ! 522: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x91d020b4  ! 523: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x81982156  ! 524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0156, %hpstate
	.word 0x81504000  ! 525: RDPR_TNPC	rdpr	%tnpc, %r0
splash_htba_5_124:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 526: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe44fc000  ! 527: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe44fe001  ! 528: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02032  ! 530: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe4d7e030  ! 531: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r18
tagged_5_125:
	taddcctv %r26, 0x1963, %r22
	.word 0xe407e001  ! 532: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x879021e0  ! 533: WRPR_TT_I	wrpr	%r0, 0x01e0, %tt
	.word 0xe4bfc037  ! 534: STDA_R	stda	%r18, [%r31 + %r23] 0x01
	.word 0xe40fe001  ! 535: LDUB_I	ldub	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe527e001  ! 537: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe527e001  ! 538: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe4d7e020  ! 539: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
	.word 0x81982d4c  ! 540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4c, %hpstate
tagged_5_126:
	tsubcctv %r26, 0x18dd, %r13
	.word 0xe407e001  ! 541: LDUW_I	lduw	[%r31 + 0x0001], %r18
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 542: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_5_127:
	taddcctv %r9, 0x104e, %r4
	.word 0xe407e001  ! 543: LDUW_I	lduw	[%r31 + 0x0001], %r18
splash_tba_5_128:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 544: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 545: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe45fe001  ! 546: LDX_I	ldx	[%r31 + 0x0001], %r18
	.word 0xe497e030  ! 547: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r18
	.word 0xe407c000  ! 548: LDUW_R	lduw	[%r31 + %r0], %r18
DS_5_129:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 549: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xe48008a0  ! 550: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe417c000  ! 551: LDUH_R	lduh	[%r31 + %r0], %r18
	.word 0x91d02034  ! 552: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f802001  ! 553: SIR	sir	0x0001
	.word 0xe49fe001  ! 554: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
DS_5_130:
	.word 0x34800001  ! 556: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 555: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x30700001  ! 556: BPA	<illegal instruction>
	.word 0x87802004  ! 557: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87802004  ! 558: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe4c804a0  ! 559: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0xe44fe001  ! 560: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	.word 0x91d02035  ! 561: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_lsu_5_131:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 562: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x87902151  ! 564: WRPR_TT_I	wrpr	%r0, 0x0151, %tt
	.word 0x819820d4  ! 565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d4, %hpstate
splash_lsu_5_132:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 566: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe42fe001  ! 567: STB_I	stb	%r18, [%r31 + 0x0001]
	.word 0xa1902003  ! 568: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87902191  ! 569: WRPR_TT_I	wrpr	%r0, 0x0191, %tt
	.word 0xe4d004a0  ! 570: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
	.word 0x91d02035  ! 571: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe48804a0  ! 572: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 573: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_5_133:
	.word 0x20800001  ! 575: BN	bn,a	<label_0x1>
	.word 0xe336c009  ! 575: STQF_R	-	%f17, [%r9, %r27]
	normalw
	.word 0xad458000  ! 574: RD_SOFTINT_REG	rd	%softint, %r22
	.word 0x879022ef  ! 575: WRPR_TT_I	wrpr	%r0, 0x02ef, %tt
	.word 0xf217c000  ! 576: LDUH_R	lduh	[%r31 + %r0], %r25
	.word 0xf28008a0  ! 577: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8f902002  ! 579: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x956b6001  ! 578: SDIVX_I	sdivx	%r13, 0x0001, %r10
	.word 0x93d02034  ! 579: Tcc_I	tne	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802020  ! 581: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8790202d  ! 582: WRPR_TT_I	wrpr	%r0, 0x002d, %tt
	.word 0x93902000  ! 583: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe29004a0  ! 584: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0x87802020  ! 585: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe28804a0  ! 586: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x87802055  ! 587: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8d902ac4  ! 588: WRPR_PSTATE_I	wrpr	%r0, 0x0ac4, %pstate
	.word 0x8198284d  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084d, %hpstate
splash_lsu_5_135:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 590: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe21fe001  ! 591: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0xe28fe030  ! 592: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r17
tagged_5_136:
	tsubcctv %r24, 0x1a37, %r3
	.word 0xe207e001  ! 593: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe21fe001  ! 594: LDD_I	ldd	[%r31 + 0x0001], %r17
splash_tba_5_137:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 595: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9027cc  ! 596: WRPR_PSTATE_I	wrpr	%r0, 0x07cc, %pstate
	.word 0xa1902005  ! 597: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	invalw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 598: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8198291d  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091d, %hpstate
	.word 0x93902000  ! 600: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe297e000  ! 601: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	.word 0x8d90278d  ! 602: WRPR_PSTATE_I	wrpr	%r0, 0x078d, %pstate
splash_tba_5_138:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 603: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28fe020  ! 605: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r17
	.word 0x87802055  ! 606: WRASI_I	wr	%r0, 0x0055, %asi
change_to_randtl_5_139:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 607: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe28008a0  ! 608: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
DS_5_140:
	.word 0x32800001  ! 610: BNE	bne,a	<label_0x1>
	.xword 0xb5ea9768	! Random illegal ?
	.word 0x97a00556  ! 610: FSQRTd	fsqrt	
	.word 0x95a4082c  ! 609: FADDs	fadds	%f16, %f12, %f10
	.word 0x87802014  ! 610: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d903369  ! 611: WRPR_PSTATE_I	wrpr	%r0, 0x1369, %pstate
	.word 0x87902380  ! 612: WRPR_TT_I	wrpr	%r0, 0x0380, %tt
splash_tba_5_141:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 613: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0d004a0  ! 614: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r24
splash_htba_5_142:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 615: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_5_143:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 616: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_5_144:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 617: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902006  ! 618: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x93902002  ! 619: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d90314c  ! 620: WRPR_PSTATE_I	wrpr	%r0, 0x114c, %pstate
	ta	T_CHANGE_HPRIV	! macro
splash_tba_5_145:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 622: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81514000  ! 623: RDPR_TBA	rdpr	%tba, %r0
tagged_5_146:
	tsubcctv %r8, 0x1708, %r14
	.word 0xd207e001  ! 624: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x87802004  ! 625: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x81480000  ! 626: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0x879022e6  ! 627: WRPR_TT_I	wrpr	%r0, 0x02e6, %tt
tagged_5_147:
	taddcctv %r22, 0x164b, %r1
	.word 0xca07e001  ! 628: LDUW_I	lduw	[%r31 + 0x0001], %r5
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 629: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xca47c000  ! 630: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0x83d02034  ! 631: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d903a9f  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x1a9f, %pstate
	.word 0x91d02033  ! 633: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x83d02034  ! 634: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87802004  ! 635: WRASI_I	wr	%r0, 0x0004, %asi
tagged_5_148:
	tsubcctv %r12, 0x116d, %r13
	.word 0xca07e001  ! 636: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x26800001  ! 637: BL	bl,a	<label_0x1>
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 638: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 640: SIR	sir	0x0001
	.word 0x36700001  ! 641: BPGE	<illegal instruction>
	.word 0x8d90286b  ! 642: WRPR_PSTATE_I	wrpr	%r0, 0x086b, %pstate
	.word 0xca800ba0  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r5
splash_lsu_5_149:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 644: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xab51c000  ! 645: RDPR_TL	rdpr	%tl, %r21
splash_lsu_5_150:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 646: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903b33  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x1b33, %pstate
DS_5_151:
	.word 0x22800001  ! 649: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 648: SAVE_R	save	%r31, %r0, %r31
DS_5_152:
	.word 0x32800001  ! 650: BNE	bne,a	<label_0x1>
	.word 0x00000000	! Random illegal ?
	.word 0xd3144000  ! 650: LDQF_R	-	[%r17, %r0], %f9
	.word 0xa9a6082c  ! 649: FADDs	fadds	%f24, %f12, %f20
	.word 0x8f902000  ! 651: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1834001  ! 650: WR_STICK_REG_R	wr	%r13, %r1, %-
	.word 0xd997e001  ! 651: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0xd89fe001  ! 652: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x9f802001  ! 653: SIR	sir	0x0001
	.word 0xd81fc000  ! 654: LDD_R	ldd	[%r31 + %r0], %r12
tagged_5_154:
	tsubcctv %r10, 0x1d7b, %r10
	.word 0xd807e001  ! 655: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x87902039  ! 656: WRPR_TT_I	wrpr	%r0, 0x0039, %tt
splash_tba_5_155:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 657: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_5_156:
	.word 0x32800001  ! 659: BNE	bne,a	<label_0x1>
	.word 0xf535e001  ! 659: STQF_I	-	%f26, [0x0001, %r23]
	normalw
	.word 0x8b458000  ! 658: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xce4fc000  ! 659: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0x8d903d82  ! 660: WRPR_PSTATE_I	wrpr	%r0, 0x1d82, %pstate
	.word 0x34800001  ! 661: BG	bg,a	<label_0x1>
	.word 0x8d902df8  ! 662: WRPR_PSTATE_I	wrpr	%r0, 0x0df8, %pstate
DS_5_157:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 663: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8198218d  ! 664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018d, %hpstate
tagged_5_158:
	tsubcctv %r8, 0x1fc0, %r14
	.word 0xce07e001  ! 665: LDUW_I	lduw	[%r31 + 0x0001], %r7
DS_5_159:
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0xb1a00549  ! 667: FSQRTd	fsqrt	
	.word 0x89a10829  ! 666: FADDs	fadds	%f4, %f9, %f4
	.word 0xe49fe001  ! 667: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0x93902000  ! 668: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d802000  ! 669: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xe48008a0  ! 671: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x99902000  ! 672: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xa1902003  ! 673: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa945c000  ! 674: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0xecdfe000  ! 675: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r22
tagged_5_160:
	tsubcctv %r25, 0x1e10, %r6
	.word 0xec07e001  ! 676: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0xed17c000  ! 677: LDQF_R	-	[%r31, %r0], %f22
	.word 0x89a20dc3  ! 678: FdMULq	fdmulq	
	.word 0xaf500000  ! 679: RDPR_TPC	rdpr	%tpc, %r23
	.word 0xa1902000  ! 680: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x81982786  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0786, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 682: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_5_161:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 683: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc4c7e010  ! 684: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0x87802014  ! 685: WRASI_I	wr	%r0, 0x0014, %asi
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc4c7e020  ! 687: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	.word 0xc4880e60  ! 688: LDUBA_R	lduba	[%r0, %r0] 0x73, %r2
	.word 0xc49fc020  ! 689: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x81460000  ! 691: RD_STICK_REG	stbar
	.word 0x87902145  ! 692: WRPR_TT_I	wrpr	%r0, 0x0145, %tt
	.word 0xc4d80e80  ! 693: LDXA_R	ldxa	[%r0, %r0] 0x74, %r2
	.word 0x8d903c5d  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x1c5d, %pstate
	.word 0xa1902000  ! 695: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_5_162:
	.word 0x22800001  ! 697: BE	be,a	<label_0x1>
	.word 0xf531a001  ! 697: STQF_I	-	%f26, [0x0001, %r6]
	normalw
	.word 0x93458000  ! 696: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x99902001  ! 697: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_tba_5_163:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 698: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc2800c20  ! 699: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r1
	.word 0xc317c000  ! 700: LDQF_R	-	[%r31, %r0], %f1
tagged_5_164:
	tsubcctv %r9, 0x105e, %r17
	.word 0xc207e001  ! 701: LDUW_I	lduw	[%r31 + 0x0001], %r1
tagged_5_165:
	taddcctv %r26, 0x1385, %r19
	.word 0xc207e001  ! 702: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc28008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc29fe001  ! 705: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x87802063  ! 706: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x8198278f  ! 707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078f, %hpstate
	.word 0x91480000  ! 708: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xf08804a0  ! 709: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x91d020b5  ! 710: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x87902161  ! 711: WRPR_TT_I	wrpr	%r0, 0x0161, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902002  ! 713: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d90395a  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x195a, %pstate
	.word 0xf08fe020  ! 715: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r24
splash_tba_5_166:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0900e60  ! 717: LDUHA_R	lduha	[%r0, %r0] 0x73, %r24
	.word 0xa190200d  ! 718: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 719: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 721: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d903730  ! 722: WRPR_PSTATE_I	wrpr	%r0, 0x1730, %pstate
tagged_5_167:
	taddcctv %r15, 0x187c, %r21
	.word 0xf007e001  ! 723: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0xf0880e40  ! 724: LDUBA_R	lduba	[%r0, %r0] 0x72, %r24
	.word 0xf02fc009  ! 725: STB_R	stb	%r24, [%r31 + %r9]
	.word 0x879022d4  ! 726: WRPR_TT_I	wrpr	%r0, 0x02d4, %tt
	.word 0xf08804a0  ! 727: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x8780204f  ! 728: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x81982d95  ! 729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d95, %hpstate
	.word 0xf08008a0  ! 730: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x2c700001  ! 731: BPNEG	<illegal instruction>
	.word 0x93902003  ! 732: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02035  ! 733: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902006  ! 734: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x32700001  ! 735: BPNE	<illegal instruction>
	.word 0x87802058  ! 736: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xf01fc000  ! 737: LDD_R	ldd	[%r31 + %r0], %r24
	.word 0x93902006  ! 738: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_5_168:
	.word 0x22800001  ! 740: BE	be,a	<label_0x1>
	allclean
	.word 0x93b10308  ! 739: ALLIGNADDRESS	alignaddr	%r4, %r8, %r9
	.word 0x93d02033  ! 740: Tcc_I	tne	icc_or_xcc, %r0 + 51
DS_5_169:
	.word 0x34800001  ! 742: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 741: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802000  ! 742: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 743: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 744: BPE	<illegal instruction>
	.word 0xc407c000  ! 745: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x93902002  ! 746: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x3a700001  ! 747: BPCC	<illegal instruction>
	.word 0x81982d4d  ! 748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4d, %hpstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 749: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d500000  ! 750: RDPR_TPC	rdpr	%tpc, %r6
splash_htba_5_170:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 751: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcc1fc000  ! 752: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x93902004  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902007  ! 754: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_5_171:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 755: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902004  ! 756: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_5_172:
	.word 0x22800001  ! 758: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 757: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fc000  ! 758: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0xcc8008a0  ! 759: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xa190200f  ! 760: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xcc4fc000  ! 761: LDSB_R	ldsb	[%r31 + %r0], %r6
DS_5_173:
	.word 0x22800001  ! 763: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 762: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fe001  ! 763: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x81982894  ! 764: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0894, %hpstate
splash_tba_5_174:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 765: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcd97e001  ! 766: LDQFA_I	-	[%r31, 0x0001], %f6
	.word 0x8d504000  ! 767: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0x8b540000  ! 768: RDPR_GL	rdpr	%-, %r5
splash_lsu_5_175:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 769: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 770: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa96dc00d  ! 771: SDIVX_R	sdivx	%r23, %r13, %r20
	.word 0x91508000  ! 772: RDPR_TSTATE	<illegal instruction>
	.word 0x8d90345b  ! 773: WRPR_PSTATE_I	wrpr	%r0, 0x145b, %pstate
	.word 0x3e800001  ! 774: BVC	bvc,a	<label_0x1>
	.word 0xc2d004a0  ! 775: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x93902001  ! 776: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8780201c  ! 777: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8d903be8  ! 778: WRPR_PSTATE_I	wrpr	%r0, 0x1be8, %pstate
	.word 0x83d02034  ! 779: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xc217c000  ! 780: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x87902055  ! 781: WRPR_TT_I	wrpr	%r0, 0x0055, %tt
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 782: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xaf514000  ! 783: RDPR_TBA	rdpr	%tba, %r23
splash_lsu_5_176:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 784: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 785: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902001  ! 786: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81480000  ! 787: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0xce17c000  ! 788: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0xcec7e030  ! 789: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r7
DS_5_177:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 790: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x9f802001  ! 791: SIR	sir	0x0001
	.word 0x8790203b  ! 792: WRPR_TT_I	wrpr	%r0, 0x003b, %tt
splash_tba_5_178:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce8008a0  ! 794: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xcedfe030  ! 795: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r7
	.word 0x9f802001  ! 796: SIR	sir	0x0001
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 797: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce1fc000  ! 798: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0xce4fc000  ! 799: LDSB_R	ldsb	[%r31 + %r0], %r7
tagged_5_179:
	taddcctv %r2, 0x1b40, %r4
	.word 0xce07e001  ! 800: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x87802016  ! 801: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xa1902003  ! 802: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xce800b60  ! 803: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r7
	.word 0x83d02033  ! 804: Tcc_I	te	icc_or_xcc, %r0 + 51
splash_tba_5_180:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 805: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_5_181:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 806: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 807: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902231  ! 808: WRPR_PSTATE_I	wrpr	%r0, 0x0231, %pstate
	.word 0x2e700001  ! 809: BPVS	<illegal instruction>
	.word 0xced7e020  ! 810: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r7
	.word 0x879020a2  ! 811: WRPR_TT_I	wrpr	%r0, 0x00a2, %tt
splash_lsu_5_182:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 812: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 813: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x38800001  ! 814: BGU	bgu,a	<label_0x1>
splash_lsu_5_183:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 815: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 816: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xa1902002  ! 817: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_lsu_5_184:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 818: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcec004a0  ! 819: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xa1902001  ! 820: WRPR_GL_I	wrpr	%r0, 0x0001, %-
splash_htba_5_185:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 821: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200c  ! 822: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xce8008a0  ! 823: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xa190200d  ! 824: WRPR_GL_I	wrpr	%r0, 0x000d, %-
DS_5_186:
	.word 0x34800001  ! 826: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 825: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1a049c7  ! 826: FDIVd	fdivd	%f32, %f38, %f16
	.word 0x8f902002  ! 828: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa5a0196b  ! 827: FqTOd	dis not found

	.word 0xd647e001  ! 828: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x87902112  ! 829: WRPR_TT_I	wrpr	%r0, 0x0112, %tt
	.word 0x8f902001  ! 831: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01968  ! 830: FqTOd	dis not found

splash_lsu_5_189:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 831: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90357b  ! 832: WRPR_PSTATE_I	wrpr	%r0, 0x157b, %pstate
	.word 0xab500000  ! 833: RDPR_TPC	rdpr	%tpc, %r21
	.word 0x93902002  ! 834: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_5_190:
	.word 0x32800001  ! 836: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 835: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_5_191:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 837: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xd01fe001  ! 838: LDD_I	ldd	[%r31 + 0x0001], %r8
splash_tba_5_192:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 839: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd04fe001  ! 840: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0x87a04dd0  ! 841: FdMULq	fdmulq	
	.word 0x87802088  ! 842: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8f902001  ! 844: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x816ae001  ! 843: SDIVX_I	sdivx	%r11, 0x0001, %r0
	.word 0xd41fe001  ! 844: LDD_I	ldd	[%r31 + 0x0001], %r10
splash_cmpr_5_194:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb181a001  ! 845: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x93902000  ! 846: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982ddc  ! 847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ddc, %hpstate
tagged_5_195:
	taddcctv %r2, 0x1f5b, %r21
	.word 0xd407e001  ! 848: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd48008a0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4cfe000  ! 850: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r10
	.word 0x30800001  ! 851: BA	ba,a	<label_0x1>
change_to_randtl_5_196:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 852: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802088  ! 853: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x9f802001  ! 854: SIR	sir	0x0001
	.word 0x81982317  ! 855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0317, %hpstate
DS_5_197:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 856: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x87802088  ! 857: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa1902000  ! 858: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xd41fe001  ! 859: LDD_I	ldd	[%r31 + 0x0001], %r10
tagged_5_198:
	tsubcctv %r1, 0x18fe, %r12
	.word 0xd407e001  ! 860: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_tba_5_199:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 861: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8780201c  ! 862: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x87902182  ! 863: WRPR_TT_I	wrpr	%r0, 0x0182, %tt
	.word 0x81480000  ! 864: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0xccdfe030  ! 865: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
	.word 0xcc8008a0  ! 866: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc1fe001  ! 868: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x81982896  ! 869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0896, %hpstate
	.word 0x93902004  ! 870: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xccdfe030  ! 871: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
tagged_5_200:
	tsubcctv %r4, 0x172b, %r10
	.word 0xcc07e001  ! 872: LDUW_I	lduw	[%r31 + 0x0001], %r6
splash_tba_5_201:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 873: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802055  ! 874: WRASI_I	wr	%r0, 0x0055, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc0fc000  ! 876: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x87802004  ! 877: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x879021a5  ! 878: WRPR_TT_I	wrpr	%r0, 0x01a5, %tt
	.word 0xccd7e000  ! 879: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc900e60  ! 881: LDUHA_R	lduha	[%r0, %r0] 0x73, %r6
splash_lsu_5_202:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 882: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b4  ! 883: Tcc_I	te	icc_or_xcc, %r0 + 180
splash_tba_5_203:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 884: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc8008a0  ! 885: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
DS_5_204:
	.word 0x22800001  ! 887: BE	be,a	<label_0x1>
	.word 0xcb310006  ! 887: STQF_R	-	%f5, [%r6, %r4]
	normalw
	.word 0xaf458000  ! 886: RD_SOFTINT_REG	rd	%softint, %r23
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 887: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xf28008a0  ! 888: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
DS_5_205:
	.word 0x34800001  ! 890: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 889: RESTORE_R	restore	%r31, %r0, %r31
splash_htba_5_206:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 890: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xf2d804a0  ! 891: LDXA_R	ldxa	[%r0, %r0] 0x25, %r25
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 892: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf2c7e000  ! 893: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r25
DS_5_207:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 894: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xf28804a0  ! 895: LDUBA_R	lduba	[%r0, %r0] 0x25, %r25
	.word 0x81982a8c  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8c, %hpstate
	.word 0xf217e001  ! 897: LDUH_I	lduh	[%r31 + 0x0001], %r25
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 898: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902001  ! 899: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xf28008a0  ! 900: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 901: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf217c000  ! 902: LDUH_R	lduh	[%r31 + %r0], %r25
change_to_randtl_5_208:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 903: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x32800001  ! 904: BNE	bne,a	<label_0x1>
	.word 0xa1902008  ! 905: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x87802063  ! 906: WRASI_I	wr	%r0, 0x0063, %asi
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 907: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf28008a0  ! 908: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x87802004  ! 909: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf317c000  ! 910: LDQF_R	-	[%r31, %r0], %f25
	.word 0xa1902003  ! 911: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93902007  ! 912: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87802088  ! 913: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xf28fe010  ! 914: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r25
	.word 0x8d903d6b  ! 915: WRPR_PSTATE_I	wrpr	%r0, 0x1d6b, %pstate
	.word 0xf2800c00  ! 916: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r25
	.word 0x8f902002  ! 918: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x876c6001  ! 917: SDIVX_I	sdivx	%r17, 0x0001, %r3
splash_lsu_5_210:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 918: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f464000  ! 919: RD_STICK_CMPR_REG	rd	%-, %r7
	.word 0xa190200f  ! 920: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8198298c  ! 921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098c, %hpstate
	.word 0xd68008a0  ! 922: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x93902007  ! 923: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
tagged_5_211:
	taddcctv %r2, 0x13fe, %r4
	.word 0xd607e001  ! 924: LDUW_I	lduw	[%r31 + 0x0001], %r11
DS_5_212:
	.word 0x22800001  ! 926: BE	be,a	<label_0x1>
	pdist %f6, %f26, %f26
	.word 0xa5b0830d  ! 925: ALLIGNADDRESS	alignaddr	%r2, %r13, %r18
	.word 0x8d903f8a  ! 926: WRPR_PSTATE_I	wrpr	%r0, 0x1f8a, %pstate
tagged_5_213:
	taddcctv %r22, 0x1512, %r8
	.word 0xc607e001  ! 927: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc607c000  ! 928: LDUW_R	lduw	[%r31 + %r0], %r3
splash_tba_5_214:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 929: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68fe010  ! 930: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r3
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 931: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802010  ! 933: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93902002  ! 934: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc73fc002  ! 935: STDF_R	std	%f3, [%r2, %r31]
	.word 0xc6d804a0  ! 936: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 937: LDQF_R	-	[%r31, %r0], %f3
tagged_5_215:
	taddcctv %r22, 0x1f2d, %r8
	.word 0xc607e001  ! 938: LDUW_I	lduw	[%r31 + 0x0001], %r3
DS_5_216:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 939: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_tba_5_217:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 940: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_5_218:
	.word 0x22800001  ! 942: BE	be,a	<label_0x1>
	.xword 0xe36fb1d4	! Random illegal ?
	.word 0xcb160005  ! 942: LDQF_R	-	[%r24, %r5], %f5
	.word 0xa3a28839  ! 941: FADDs	fadds	%f10, %f25, %f17
	.word 0x93902000  ! 942: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902e21  ! 943: WRPR_PSTATE_I	wrpr	%r0, 0x0e21, %pstate
	.word 0x8d9026bc  ! 944: WRPR_PSTATE_I	wrpr	%r0, 0x06bc, %pstate
	.word 0x8780204f  ! 945: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xc48804a0  ! 946: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc49fc020  ! 947: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x83d02033  ! 948: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x93902002  ! 949: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc517c000  ! 951: LDQF_R	-	[%r31, %r0], %f2
	.word 0x24700001  ! 952: BPLE	<illegal instruction>
	.word 0x8f902002  ! 954: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1800013  ! 953: WR_STICK_REG_R	wr	%r0, %r19, %-
	.word 0x81982784  ! 954: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0784, %hpstate
	.word 0xc417c000  ! 955: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x93902002  ! 956: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa1902006  ! 957: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x81982d9d  ! 958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9d, %hpstate
	.word 0x93902003  ! 959: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc4880e60  ! 960: LDUBA_R	lduba	[%r0, %r0] 0x73, %r2
	.word 0xc48008a0  ! 961: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xa190200d  ! 962: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xb3494000  ! 963: RDHPR_HTBA	rdhpr	%htba, %r25
	.word 0xc4d7e030  ! 964: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r2
	.word 0x93902000  ! 965: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_5_220:
	.word 0x32800001  ! 967: BNE	bne,a	<label_0x1>
	.word 0xd1348005  ! 967: STQF_R	-	%f8, [%r5, %r18]
	normalw
	.word 0x93458000  ! 966: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xa1902005  ! 967: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_lsu_5_221:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 969: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x28800001  ! 970: BLEU	bleu,a	<label_0x1>
splash_lsu_5_222:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 971: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 972: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_5_223:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 974: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1862001  ! 973: WR_STICK_REG_I	wr	%r24, 0x0001, %-
	.word 0x91d020b4  ! 974: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd4d004a0  ! 975: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
tagged_5_224:
	tsubcctv %r16, 0x1b77, %r5
	.word 0xd407e001  ! 976: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4c00e60  ! 977: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r10
	.word 0x93902006  ! 978: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x99902004  ! 979: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x8d903779  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x1779, %pstate
	.word 0x93902000  ! 981: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d020b4  ! 982: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x22700001  ! 983: BPE	<illegal instruction>
	.word 0x93902001  ! 984: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 985: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 986: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 987: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd497e000  ! 988: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0xd4dfe000  ! 989: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x91d02033  ! 990: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x34800001  ! 991: BG	bg,a	<label_0x1>
	.word 0xa1902001  ! 992: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd48008a0  ! 993: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd597e001  ! 994: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x83d02033  ! 995: Tcc_I	te	icc_or_xcc, %r0 + 51
splash_htba_5_225:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 996: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902005  ! 997: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_5_226:
	.word 0x22800001  ! 999: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 998: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_5_227:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_5:
	.word 0x91d020b5  ! 1: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x91d02034  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa190200d  ! 3: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_lsu_4_0:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 4: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa7514000  ! 5: RDPR_TBA	<illegal instruction>
tagged_4_1:
	taddcctv %r16, 0x1c04, %r15
	.word 0xcc07e001  ! 6: LDUW_I	lduw	[%r31 + 0x0001], %r6
DS_4_2:
	.word 0x22800001  ! 8: BE	be,a	<label_0x1>
	pdist %f26, %f12, %f16
	.word 0x8db30309  ! 7: ALLIGNADDRESS	alignaddr	%r12, %r9, %r6
	.word 0x87514000  ! 8: RDPR_TBA	<illegal instruction>
tagged_4_3:
	taddcctv %r2, 0x14b2, %r8
	.word 0xc807e001  ! 9: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc81fe001  ! 10: LDD_I	ldd	[%r31 + 0x0001], %r4
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 11: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc8c7e020  ! 12: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	.word 0xc917c000  ! 13: LDQF_R	-	[%r31, %r0], %f4
	.word 0xc89fe001  ! 14: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 15: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99902000  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xc807c000  ! 17: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0x8d802000  ! 18: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa745c000  ! 19: RD_TICK_CMPR_REG	rd	%-, %r19
	.word 0x83d020b3  ! 20: Tcc_I	te	icc_or_xcc, %r0 + 179
DS_4_4:
	.word 0x32800001  ! 22: BNE	bne,a	<label_0x1>
	.word 0xf3330004  ! 22: STQF_R	-	%f25, [%r4, %r12]
	normalw
	.word 0x87458000  ! 21: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x879022ae  ! 22: WRPR_TT_I	wrpr	%r0, 0x02ae, %tt
DS_4_5:
	.word 0x32800001  ! 24: BNE	bne,a	<label_0x1>
	.word 0xf7328004  ! 24: STQF_R	-	%f27, [%r4, %r10]
	normalw
	.word 0x8d458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r6
tagged_4_6:
	tsubcctv %r9, 0x148c, %r1
	.word 0xd607e001  ! 24: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x87902035  ! 25: WRPR_TT_I	wrpr	%r0, 0x0035, %tt
splash_tba_4_7:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 26: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982216  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0216, %hpstate
splash_lsu_4_8:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd65fe001  ! 29: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d7e020  ! 30: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	.word 0xad50c000  ! 31: RDPR_TT	<illegal instruction>
	.word 0xda07c000  ! 32: LDUW_R	lduw	[%r31 + %r0], %r13
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 33: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982e5c  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5c, %hpstate
	.word 0xdad7e030  ! 36: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	.word 0xda47c000  ! 37: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0x8198255f  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055f, %hpstate
	.word 0xb7464000  ! 39: RD_STICK_CMPR_REG	rd	%-, %r27
	.word 0x85464000  ! 40: RD_STICK_CMPR_REG	rd	%-, %r2
	.word 0x8d903c28  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x1c28, %pstate
	.word 0x87802004  ! 42: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa190200d  ! 43: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87902285  ! 44: WRPR_TT_I	wrpr	%r0, 0x0285, %tt
DS_4_9:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
DS_4_10:
	.word 0x20800001  ! 47: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 46: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 47: BL	bl,a	<label_0x1>
DS_4_11:
	.word 0x22800001  ! 49: BE	be,a	<label_0x1>
	pdist %f2, %f20, %f6
	.word 0x9bb24304  ! 48: ALLIGNADDRESS	alignaddr	%r9, %r4, %r13
	.word 0xa1902007  ! 49: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xd65fe001  ! 50: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d804a0  ! 51: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0xd68008a0  ! 52: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x879021ae  ! 53: WRPR_TT_I	wrpr	%r0, 0x01ae, %tt
splash_htba_4_12:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 54: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902b63  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x0b63, %pstate
	.word 0xd617e001  ! 56: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0x8790200a  ! 57: WRPR_TT_I	wrpr	%r0, 0x000a, %tt
	.word 0xd6800bc0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r11
splash_tba_4_13:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790208a  ! 60: WRPR_TT_I	wrpr	%r0, 0x008a, %tt
	.word 0x91d02033  ! 61: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd68008a0  ! 62: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_4_14:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb1866001  ! 63: WR_STICK_REG_I	wr	%r25, 0x0001, %-
	.word 0xd6d7e010  ! 64: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0x8d903005  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x1005, %pstate
	.word 0x26700001  ! 66: BPL	<illegal instruction>
	.word 0x8550c000  ! 67: RDPR_TT	rdpr	%tt, %r2
	.word 0x8d9036eb  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x16eb, %pstate
	.word 0x30800001  ! 69: BA	ba,a	<label_0x1>
splash_lsu_4_15:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 70: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9027be  ! 71: WRPR_PSTATE_I	wrpr	%r0, 0x07be, %pstate
splash_lsu_4_16:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 72: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02034  ! 73: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xe137c009  ! 74: STQF_R	-	%f16, [%r9, %r31]
	.word 0xe057c000  ! 75: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0x81982fdc  ! 76: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdc, %hpstate
splash_tba_4_17:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 77: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802004  ! 78: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_htba_4_18:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_4_19:
	taddcctv %r19, 0x1b07, %r24
	.word 0xe007e001  ! 80: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8d902095  ! 81: WRPR_PSTATE_I	wrpr	%r0, 0x0095, %pstate
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 82: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 83: BNE	bne,a	<label_0x1>
	.word 0x91d02032  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87902292  ! 85: WRPR_TT_I	wrpr	%r0, 0x0292, %tt
	.word 0xe0d7e000  ! 86: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	.word 0xb5504000  ! 87: RDPR_TNPC	<illegal instruction>
	.word 0x93d02032  ! 88: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x26700001  ! 89: BPL	<illegal instruction>
	.word 0x8d903b9e  ! 90: WRPR_PSTATE_I	wrpr	%r0, 0x1b9e, %pstate
	.word 0x9f802001  ! 91: SIR	sir	0x0001
	.word 0x93d02033  ! 92: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x8198234f  ! 93: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034f, %hpstate
	.word 0xc24fc000  ! 94: LDSB_R	ldsb	[%r31 + %r0], %r1
DS_4_20:
	.word 0x32800001  ! 96: BNE	bne,a	<label_0x1>
	.xword 0xc3da090b	! Random illegal ?
	.word 0xc7104010  ! 96: LDQF_R	-	[%r1, %r16], %f3
	.word 0x99a50825  ! 95: FADDs	fadds	%f20, %f5, %f12
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 96: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_4_21:
	taddcctv %r17, 0x17d1, %r26
	.word 0xc007e001  ! 97: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x2a800001  ! 98: BCS	bcs,a	<label_0x1>
	.word 0xc08804a0  ! 99: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0xa190200c  ! 100: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xc017c000  ! 101: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc03fe001  ! 102: STD_I	std	%r0, [%r31 + 0x0001]
	.word 0x93902002  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc0800c00  ! 104: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r0
	.word 0x93902000  ! 105: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81460000  ! 106: RD_STICK_REG	stbar
	.word 0xc01fc000  ! 107: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x819828ce  ! 108: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08ce, %hpstate
	.word 0xc0c7e000  ! 109: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
	.word 0x8d902eb8  ! 110: WRPR_PSTATE_I	wrpr	%r0, 0x0eb8, %pstate
	.word 0x89500000  ! 111: RDPR_TPC	<illegal instruction>
	.word 0x93500000  ! 112: RDPR_TPC	<illegal instruction>
splash_cmpr_4_22:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb1862001  ! 113: WR_STICK_REG_I	wr	%r24, 0x0001, %-
	.word 0xe097e030  ! 114: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
tagged_4_23:
	taddcctv %r25, 0x1764, %r14
	.word 0xe007e001  ! 115: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe0d7e010  ! 116: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
	.word 0x81982d4f  ! 117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4f, %hpstate
	.word 0xe0d80e60  ! 118: LDXA_R	ldxa	[%r0, %r0] 0x73, %r16
	ta	T_CHANGE_HPRIV	! macro
DS_4_24:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 120: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
splash_tba_4_25:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 121: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0d804a0  ! 122: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	.word 0x9f802001  ! 123: SIR	sir	0x0001
	.word 0x81982714  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0714, %hpstate
	.word 0xe0dfe030  ! 125: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r16
	.word 0x8790226c  ! 126: WRPR_TT_I	wrpr	%r0, 0x026c, %tt
	.word 0x879023cd  ! 127: WRPR_TT_I	wrpr	%r0, 0x03cd, %tt
	.word 0xe01fc000  ! 128: LDD_R	ldd	[%r31 + %r0], %r16
change_to_randtl_4_26:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 129: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d9030ce  ! 130: WRPR_PSTATE_I	wrpr	%r0, 0x10ce, %pstate
splash_lsu_4_27:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb181c00d  ! 132: WR_STICK_REG_R	wr	%r7, %r13, %-
	.word 0x81982987  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0987, %hpstate
	.word 0xe0800b60  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r16
change_to_randtl_4_29:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 135: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe08008a0  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x93902002  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902c13  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x0c13, %pstate
	.word 0x9afde001  ! 139: SDIVcc_I	sdivcc 	%r23, 0x0001, %r13
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 140: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 141: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xca8008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x8780204f  ! 143: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8d903a5d  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x1a5d, %pstate
	.word 0x8d903ec0  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x1ec0, %pstate
	.word 0xcad00e80  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r5
DS_4_30:
	.word 0x20800001  ! 148: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
DS_4_31:
	.word 0x20800001  ! 149: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 148: SAVE_R	save	%r31, %r0, %r31
	.word 0xca8008a0  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xca97e030  ! 150: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r5
	.word 0x8069000d  ! 151: UDIVX_R	udivx 	%r4, %r13, %r0
	.word 0xc84fe001  ! 152: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0xc8c80e40  ! 153: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r4
	.word 0xc89fe001  ! 154: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
splash_tba_4_32:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc827e001  ! 156: STW_I	stw	%r4, [%r31 + 0x0001]
	.word 0xc8d00e40  ! 157: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r4
splash_lsu_4_33:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93514000  ! 159: RDPR_TBA	<illegal instruction>
	.word 0xd737c018  ! 160: STQF_R	-	%f11, [%r24, %r31]
	.word 0xd61fc000  ! 161: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd6c7e030  ! 162: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
	.word 0xd6dfe030  ! 163: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0x9745c000  ! 164: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0x89508000  ! 165: RDPR_TSTATE	<illegal instruction>
	.word 0xd89fe001  ! 166: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 167: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd89004a0  ! 169: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0x8198299d  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099d, %hpstate
	.word 0xd84fc000  ! 171: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x81982b94  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b94, %hpstate
	.word 0x8d903cf1  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x1cf1, %pstate
	.word 0x9f802001  ! 174: SIR	sir	0x0001
DS_4_34:
	.word 0x34800001  ! 176: BG	bg,a	<label_0x1>
	pdist %f16, %f18, %f6
	.word 0x91b3030d  ! 175: ALLIGNADDRESS	alignaddr	%r12, %r13, %r8
DS_4_35:
	.word 0x32800001  ! 177: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 176: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_4_36:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 178: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200f  ! 179: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d902aff  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x0aff, %pstate
	.word 0x93902007  ! 181: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_4_37:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 182: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 183: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902629  ! 184: WRPR_PSTATE_I	wrpr	%r0, 0x0629, %pstate
	.word 0x93d02033  ! 185: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xe2d004a0  ! 186: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x8198295c  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095c, %hpstate
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903a30  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x1a30, %pstate
splash_tba_4_38:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 190: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902004  ! 191: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa190200a  ! 192: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93d020b5  ! 193: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x879022eb  ! 194: WRPR_TT_I	wrpr	%r0, 0x02eb, %tt
	.word 0x91d020b3  ! 195: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x9551c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0x8d903c2a  ! 197: WRPR_PSTATE_I	wrpr	%r0, 0x1c2a, %pstate
	.word 0x91d02033  ! 198: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd607c000  ! 199: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x91d020b3  ! 200: Tcc_I	ta	icc_or_xcc, %r0 + 179
tagged_4_39:
	taddcctv %r4, 0x18df, %r15
	.word 0xd607e001  ! 201: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x91508000  ! 202: RDPR_TSTATE	<illegal instruction>
	.word 0xc4880e80  ! 203: LDUBA_R	lduba	[%r0, %r0] 0x74, %r2
	.word 0xc4800a60  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r2
	.word 0xc48008a0  ! 205: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
change_to_randtl_4_40:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 206: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc48008a0  ! 207: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02033  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93d02035  ! 210: Tcc_I	tne	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0x32800001  ! 212: BNE	bne,a	<label_0x1>
	.word 0x8198295c  ! 213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x095c, %hpstate
	.word 0xa1902005  ! 214: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_tba_4_41:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 215: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_4_42:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc4800ac0  ! 217: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r2
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 218: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 219: WRASI_I	wr	%r0, 0x0088, %asi
DS_4_43:
	.word 0x22800001  ! 221: BE	be,a	<label_0x1>
	.word 0xd1356001  ! 221: STQF_I	-	%f8, [0x0001, %r21]
	normalw
	.word 0x97458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r11
splash_lsu_4_44:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 221: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xeec80e40  ! 222: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r23
	.word 0x8950c000  ! 223: RDPR_TT	<illegal instruction>
	.word 0x8d802000  ! 224: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802004  ! 225: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xce8008a0  ! 226: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x87802089  ! 227: WRASI_I	wr	%r0, 0x0089, %asi
splash_tba_4_45:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 228: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x34700001  ! 229: BPG	<illegal instruction>
	.word 0x8d508000  ! 230: RDPR_TSTATE	<illegal instruction>
	.word 0x87902157  ! 231: WRPR_TT_I	wrpr	%r0, 0x0157, %tt
tagged_4_46:
	tsubcctv %r25, 0x1858, %r9
	.word 0xe207e001  ! 232: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x879022ee  ! 233: WRPR_TT_I	wrpr	%r0, 0x02ee, %tt
	.word 0xe28008a0  ! 234: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x98a8c005  ! 235: ANDNcc_R	andncc 	%r3, %r5, %r12
DS_4_47:
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 236: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8198224d  ! 237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024d, %hpstate
	.word 0x87802058  ! 238: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87902027  ! 239: WRPR_TT_I	wrpr	%r0, 0x0027, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 240: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc61fe001  ! 241: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x2c800001  ! 242: BNEG	bneg,a	<label_0x1>
	.word 0xc6c7e010  ! 243: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
	.word 0x8d90217a  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x017a, %pstate
	.word 0x8d902c88  ! 245: WRPR_PSTATE_I	wrpr	%r0, 0x0c88, %pstate
	.word 0x879021eb  ! 246: WRPR_TT_I	wrpr	%r0, 0x01eb, %tt
splash_lsu_4_48:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x28700001  ! 248: BPLEU	<illegal instruction>
	.word 0xc607c000  ! 249: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0xc68804a0  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 251: LDQF_R	-	[%r31, %r0], %f3
tagged_4_49:
	taddcctv %r23, 0x1868, %r25
	.word 0xc607e001  ! 252: LDUW_I	lduw	[%r31 + 0x0001], %r3
change_to_randtl_4_50:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 253: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xc68008a0  ! 254: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 255: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 256: SIR	sir	0x0001
change_to_randtl_4_51:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 257: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xc68008a0  ! 258: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc657c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r3
DS_4_52:
	.word 0x32800001  ! 261: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 260: SAVE_R	save	%r31, %r0, %r31
splash_lsu_4_53:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 262: BPN	<illegal instruction>
	.word 0x87802089  ! 263: WRASI_I	wr	%r0, 0x0089, %asi
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 264: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9030db  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x10db, %pstate
	.word 0xc61fc000  ! 266: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xc61fc000  ! 267: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x8d802000  ! 268: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_4_54:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 269: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8d902bf5  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0bf5, %pstate
	.word 0x81982307  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
	.word 0x87802080  ! 272: WRASI_I	wr	%r0, 0x0080, %asi
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879023fe  ! 274: WRPR_TT_I	wrpr	%r0, 0x03fe, %tt
	.word 0x81982b4c  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4c, %hpstate
	.word 0x8790211a  ! 276: WRPR_TT_I	wrpr	%r0, 0x011a, %tt
	.word 0x91d020b2  ! 277: Tcc_I	ta	icc_or_xcc, %r0 + 178
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 278: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc68008a0  ! 279: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x93902002  ! 280: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x879020d2  ! 281: WRPR_TT_I	wrpr	%r0, 0x00d2, %tt
splash_tba_4_55:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 282: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68008a0  ! 283: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc6c804a0  ! 284: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
splash_cmpr_4_56:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb182e001  ! 285: WR_STICK_REG_I	wr	%r11, 0x0001, %-
	.word 0x8d903a88  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x1a88, %pstate
splash_htba_4_57:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 287: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d9029b1  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x09b1, %pstate
	.word 0x34700001  ! 289: BPG	<illegal instruction>
splash_cmpr_4_58:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb180e001  ! 290: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x93902004  ! 291: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802055  ! 293: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x91d02035  ! 294: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902004  ! 295: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x89a00563  ! 296: FSQRTq	fsqrt	
	.word 0x91d020b4  ! 297: Tcc_I	ta	icc_or_xcc, %r0 + 180
DS_4_59:
	.word 0x20800001  ! 299: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 299: BG	bg,a	<label_0x1>
	.word 0x97a00558  ! 299: FSQRTd	fsqrt	
	.word 0xb5a28837  ! 298: FADDs	fadds	%f10, %f23, %f26
	.word 0xc6800b80  ! 299: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r3
	.word 0xc68804a0  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
splash_tba_4_60:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 301: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc647e001  ! 302: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x99902005  ! 303: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x93902001  ! 304: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 305: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_4_61:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc68008a0  ! 308: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x81982e0d  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0d, %hpstate
splash_lsu_4_62:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc69004a0  ! 311: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x87802089  ! 312: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x91d020b4  ! 313: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8d903186  ! 314: WRPR_PSTATE_I	wrpr	%r0, 0x1186, %pstate
	.word 0x879021b7  ! 315: WRPR_TT_I	wrpr	%r0, 0x01b7, %tt
	.word 0x91d020b2  ! 316: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_tba_4_63:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 317: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc69fc020  ! 318: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
splash_lsu_4_64:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 320: BN	bn,a	<label_0x1>
	.word 0x8d902652  ! 321: WRPR_PSTATE_I	wrpr	%r0, 0x0652, %pstate
DS_4_65:
	.word 0x20800001  ! 323: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 322: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902000  ! 324: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1828004  ! 323: WR_STICK_REG_R	wr	%r10, %r4, %-
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 324: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_4_67:
	taddcctv %r17, 0x1645, %r7
	.word 0xc607e001  ! 325: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_tba_4_68:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 326: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 328: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1834000  ! 327: WR_STICK_REG_R	wr	%r13, %r0, %-
	.word 0xa9508000  ! 328: RDPR_TSTATE	<illegal instruction>
splash_lsu_4_70:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 329: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d802000  ! 331: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x83d02035  ! 332: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xa1902006  ! 333: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 334: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d020b5  ! 335: Tcc_I	ta	icc_or_xcc, %r0 + 181
DS_4_71:
	.word 0x34800001  ! 337: BG	bg,a	<label_0x1>
	pdist %f30, %f20, %f30
	.word 0x93b30306  ! 336: ALLIGNADDRESS	alignaddr	%r12, %r6, %r9
tagged_4_72:
	tsubcctv %r22, 0x1940, %r13
	.word 0xd807e001  ! 337: LDUW_I	lduw	[%r31 + 0x0001], %r12
tagged_4_73:
	taddcctv %r16, 0x191c, %r20
	.word 0xd807e001  ! 338: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8790213c  ! 339: WRPR_TT_I	wrpr	%r0, 0x013c, %tt
	.word 0xb0d1a001  ! 340: UMULcc_I	umulcc 	%r6, 0x0001, %r24
	.word 0x93902006  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
tagged_4_74:
	tsubcctv %r25, 0x1f1a, %r7
	.word 0xc407e001  ! 342: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x93902000  ! 343: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc48008a0  ! 344: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc4800be0  ! 345: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r2
tagged_4_75:
	taddcctv %r19, 0x1111, %r1
	.word 0xc407e001  ! 346: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_4_76:
	.word 0x22800001  ! 348: BE	be,a	<label_0x1>
	.xword 0xd1d3f1cb	! Random illegal ?
	.word 0xe312c00c  ! 348: LDQF_R	-	[%r11, %r12], %f17
	.word 0x87a18835  ! 347: FADDs	fadds	%f6, %f21, %f3
	.word 0x93d02035  ! 348: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xad514000  ! 349: RDPR_TBA	<illegal instruction>
	.word 0x8d9037e2  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x17e2, %pstate
	.word 0xd0c804a0  ! 351: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
DS_4_77:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 352: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xd017e001  ! 353: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0x83514000  ! 354: RDPR_TBA	<illegal instruction>
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x3e700001  ! 356: BPVC	<illegal instruction>
	.word 0x879022bf  ! 357: WRPR_TT_I	wrpr	%r0, 0x02bf, %tt
splash_lsu_4_78:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 358: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_79:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 359: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 361: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe647c000  ! 362: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x8790210b  ! 363: WRPR_TT_I	wrpr	%r0, 0x010b, %tt
	.word 0x38800001  ! 364: BGU	bgu,a	<label_0x1>
	.word 0xe69004a0  ! 365: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	.word 0x87802063  ! 366: WRASI_I	wr	%r0, 0x0063, %asi
splash_lsu_4_80:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 367: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xad540000  ! 368: RDPR_GL	rdpr	%-, %r22
	.word 0xc8800c80  ! 369: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r4
splash_lsu_4_81:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc81fc000  ! 371: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xa1902000  ! 372: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xc807c000  ! 373: LDUW_R	lduw	[%r31 + %r0], %r4
splash_lsu_4_82:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 374: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xaf494000  ! 375: RDHPR_HTBA	rdhpr	%htba, %r23
	.word 0x8198284d  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084d, %hpstate
splash_lsu_4_83:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 378: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_4_84:
	tsubcctv %r8, 0x1da9, %r24
	.word 0xc807e001  ! 379: LDUW_I	lduw	[%r31 + 0x0001], %r4
change_to_randtl_4_85:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 380: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x83d02035  ! 381: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xc8d004a0  ! 382: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_tba_4_86:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 383: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_4_87:
	.word 0x32800001  ! 386: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 386: BG	bg,a	<label_0x1>
	.word 0xd5160004  ! 386: LDQF_R	-	[%r24, %r4], %f10
	.word 0x8da20827  ! 385: FADDs	fadds	%f8, %f7, %f6
	.word 0x9f802001  ! 386: SIR	sir	0x0001
splash_tba_4_88:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 387: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x3c700001  ! 388: BPPOS	<illegal instruction>
DS_4_89:
	.word 0x34800001  ! 390: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 389: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802004  ! 390: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xb3508000  ! 391: RDPR_TSTATE	<illegal instruction>
	.word 0x20700001  ! 392: BPN	<illegal instruction>
splash_lsu_4_90:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 394: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd48fe000  ! 395: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0x8198278e  ! 396: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078e, %hpstate
	.word 0x32800001  ! 397: BNE	bne,a	<label_0x1>
tagged_4_91:
	taddcctv %r1, 0x1b76, %r26
	.word 0xd407e001  ! 398: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d903aee  ! 399: WRPR_PSTATE_I	wrpr	%r0, 0x1aee, %pstate
	.word 0x81982dd7  ! 400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd7, %hpstate
DS_4_92:
	.word 0x20800001  ! 402: BN	bn,a	<label_0x1>
	pdist %f4, %f16, %f26
	.word 0xa3b08319  ! 401: ALLIGNADDRESS	alignaddr	%r2, %r25, %r17
	.word 0xec8008a0  ! 402: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x93902005  ! 403: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_4_93:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 404: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 405: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8d9022cf  ! 406: WRPR_PSTATE_I	wrpr	%r0, 0x02cf, %pstate
	.word 0x8d9029de  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x09de, %pstate
tagged_4_94:
	tsubcctv %r14, 0x1172, %r11
	.word 0xec07e001  ! 408: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x91d02032  ! 409: Tcc_I	ta	icc_or_xcc, %r0 + 50
tagged_4_95:
	taddcctv %r20, 0x1ae1, %r9
	.word 0xec07e001  ! 410: LDUW_I	lduw	[%r31 + 0x0001], %r22
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 411: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xecd00e60  ! 412: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r22
	.word 0x879021a7  ! 413: WRPR_TT_I	wrpr	%r0, 0x01a7, %tt
tagged_4_96:
	tsubcctv %r7, 0x1d54, %r1
	.word 0xec07e001  ! 414: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x93902006  ! 415: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x95480000  ! 416: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x87902226  ! 417: WRPR_TT_I	wrpr	%r0, 0x0226, %tt
	.word 0xd64fe001  ! 418: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0xd68008a0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x93902007  ! 420: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8350c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0x8f902000  ! 423: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89814003  ! 422: WRTICK_R	wr	%r5, %r3, %tick
	.word 0xc6dfe020  ! 423: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r3
	.word 0xab494000  ! 424: RDHPR_HTBA	rdhpr	%htba, %r21
	.word 0x91a209f6  ! 425: FDIVq	dis not found

	.word 0x89514000  ! 426: RDPR_TBA	<illegal instruction>
	.word 0x32700001  ! 427: BPNE	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee07c000  ! 429: LDUW_R	lduw	[%r31 + %r0], %r23
	.word 0x8198241c  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041c, %hpstate
	.word 0xa1902000  ! 431: WRPR_GL_I	wrpr	%r0, 0x0000, %-
splash_lsu_4_98:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 432: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xee8008a0  ! 433: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
splash_tba_4_99:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 434: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x2a800001  ! 435: BCS	bcs,a	<label_0x1>
	.word 0x91d02033  ! 436: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_4_100:
	.word 0x20800001  ! 438: BN	bn,a	<label_0x1>
	.word 0xf7336001  ! 438: STQF_I	-	%f27, [0x0001, %r13]
	normalw
	.word 0x99458000  ! 437: RD_SOFTINT_REG	rd	%softint, %r12
tagged_4_101:
	taddcctv %r15, 0x1b2e, %r19
	.word 0xcc07e001  ! 438: LDUW_I	lduw	[%r31 + 0x0001], %r6
tagged_4_102:
	tsubcctv %r4, 0x161e, %r10
	.word 0xcc07e001  ! 439: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x87802016  ! 440: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x87902182  ! 441: WRPR_TT_I	wrpr	%r0, 0x0182, %tt
	.word 0x819821dd  ! 442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01dd, %hpstate
	.word 0x93902006  ! 443: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_4_103:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 444: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 445: BPN	<illegal instruction>
splash_lsu_4_104:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 446: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc800c40  ! 447: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r6
splash_lsu_4_105:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 448: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_4_106:
	tsubcctv %r10, 0x161e, %r8
	.word 0xcc07e001  ! 449: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc9fc020  ! 450: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x819821dc  ! 451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01dc, %hpstate
	.word 0xccdfe030  ! 452: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
	.word 0x93902000  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_4_107:
	taddcctv %r3, 0x1106, %r19
	.word 0xcc07e001  ! 454: LDUW_I	lduw	[%r31 + 0x0001], %r6
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 455: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 456: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xccc7e030  ! 457: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	.word 0x87802004  ! 458: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x93d02035  ! 459: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8198234d  ! 460: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034d, %hpstate
	.word 0x81982097  ! 461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0097, %hpstate
splash_lsu_4_108:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 462: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc8008a0  ! 463: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x85500000  ! 464: RDPR_TPC	<illegal instruction>
	.word 0x91d02035  ! 465: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902934  ! 466: WRPR_PSTATE_I	wrpr	%r0, 0x0934, %pstate
	.word 0xc717c000  ! 467: LDQF_R	-	[%r31, %r0], %f3
	.word 0xa190200e  ! 468: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x93902004  ! 469: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902007  ! 470: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa7464000  ! 471: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0x87802016  ! 472: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd8c004a0  ! 473: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
splash_tba_4_109:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 474: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd8800c60  ! 475: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r12
DS_4_110:
	.word 0x34800001  ! 477: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 476: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902007  ! 477: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1902007  ! 478: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_tba_4_111:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 479: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902005  ! 480: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87802063  ! 481: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xd88008a0  ! 482: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x2e800001  ! 483: BVS	bvs,a	<label_0x1>
splash_lsu_4_112:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 484: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 485: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x93902006  ! 486: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d903e6f  ! 487: WRPR_PSTATE_I	wrpr	%r0, 0x1e6f, %pstate
splash_tba_4_113:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902005  ! 489: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd8c804a0  ! 490: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd89fe001  ! 491: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0xafa01a67  ! 492: FqTOi	fqtoi	
tagged_4_114:
	tsubcctv %r3, 0x1682, %r1
	.word 0xf607e001  ! 493: LDUW_I	lduw	[%r31 + 0x0001], %r27
DS_4_115:
	.word 0x32800001  ! 495: BNE	bne,a	<label_0x1>
	pdist %f26, %f10, %f6
	.word 0xb1b18306  ! 494: ALLIGNADDRESS	alignaddr	%r6, %r6, %r24
	.word 0xda57e001  ! 495: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0x87802063  ! 496: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x87802058  ! 497: WRASI_I	wr	%r0, 0x0058, %asi
splash_lsu_4_116:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 498: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 499: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xda9fe001  ! 500: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xdadfe000  ! 501: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
DS_4_117:
	.word 0x20800001  ! 503: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 502: SAVE_R	save	%r31, %r0, %r31
tagged_4_118:
	tsubcctv %r24, 0x1eaa, %r10
	.word 0xda07e001  ! 503: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdad7e010  ! 504: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 505: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1500000  ! 506: RDPR_TPC	<illegal instruction>
DS_4_119:
	.word 0x20800001  ! 508: BN	bn,a	<label_0x1>
	pdist %f8, %f28, %f12
	.word 0xa5b1030b  ! 507: ALLIGNADDRESS	alignaddr	%r4, %r11, %r18
DS_4_120:
	.word 0x32800001  ! 509: BNE	bne,a	<label_0x1>
	.xword 0xe9e55c1a	! Random illegal ?
	.word 0xd311c019  ! 509: LDQF_R	-	[%r7, %r25], %f9
	.word 0x99a2c82c  ! 508: FADDs	fadds	%f11, %f12, %f12
tagged_4_121:
	taddcctv %r25, 0x159e, %r6
	.word 0xc807e001  ! 509: LDUW_I	lduw	[%r31 + 0x0001], %r4
splash_tba_4_122:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 510: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902008  ! 511: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x879021f3  ! 512: WRPR_TT_I	wrpr	%r0, 0x01f3, %tt
	.word 0xc817e001  ! 513: LDUH_I	lduh	[%r31 + 0x0001], %r4
	.word 0x87902296  ! 514: WRPR_TT_I	wrpr	%r0, 0x0296, %tt
	.word 0xab50c000  ! 515: RDPR_TT	<illegal instruction>
	.word 0xb3508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0x22700001  ! 517: BPE	<illegal instruction>
change_to_randtl_4_123:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 518: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa190200e  ! 519: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xd88008a0  ! 520: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x81982f47  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f47, %hpstate
	.word 0xb1480000  ! 522: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0x91d020b4  ! 523: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8198229f  ! 524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029f, %hpstate
	.word 0x8b504000  ! 525: RDPR_TNPC	rdpr	%tnpc, %r5
splash_htba_4_124:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 526: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe44fc000  ! 527: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe44fe001  ! 528: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83d02034  ! 530: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xe4d7e010  ! 531: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r18
tagged_4_125:
	taddcctv %r23, 0x1ab7, %r6
	.word 0xe407e001  ! 532: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x879020ce  ! 533: WRPR_TT_I	wrpr	%r0, 0x00ce, %tt
	.word 0xe4bfc037  ! 534: STDA_R	stda	%r18, [%r31 + %r23] 0x01
	.word 0xe40fe001  ! 535: LDUB_I	ldub	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe527e001  ! 537: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe527e001  ! 538: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe4d7e010  ! 539: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r18
	.word 0x819827ce  ! 540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07ce, %hpstate
tagged_4_126:
	tsubcctv %r4, 0x15f0, %r1
	.word 0xe407e001  ! 541: LDUW_I	lduw	[%r31 + 0x0001], %r18
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 542: Tcc_R	te	icc_or_xcc, %r0 + %r30
tagged_4_127:
	taddcctv %r19, 0x1587, %r26
	.word 0xe407e001  ! 543: LDUW_I	lduw	[%r31 + 0x0001], %r18
splash_tba_4_128:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 544: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 545: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe45fe001  ! 546: LDX_I	ldx	[%r31 + 0x0001], %r18
	.word 0xe497e020  ! 547: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r18
	.word 0xe407c000  ! 548: LDUW_R	lduw	[%r31 + %r0], %r18
DS_4_129:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 549: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xe4800c60  ! 550: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r18
	.word 0xe417c000  ! 551: LDUH_R	lduh	[%r31 + %r0], %r18
	.word 0x91d020b4  ! 552: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x9f802001  ! 553: SIR	sir	0x0001
	.word 0xe49fe001  ! 554: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
DS_4_130:
	.word 0x34800001  ! 556: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 555: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x30700001  ! 556: BPA	<illegal instruction>
	.word 0x87802058  ! 557: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8780201c  ! 558: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xe4c80e40  ! 559: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r18
	.word 0xe44fe001  ! 560: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	.word 0x91d020b3  ! 561: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_lsu_4_131:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 562: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe4800a60  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r18
	.word 0x87902075  ! 564: WRPR_TT_I	wrpr	%r0, 0x0075, %tt
	.word 0x81982554  ! 565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0554, %hpstate
splash_lsu_4_132:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 566: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe42fe001  ! 567: STB_I	stb	%r18, [%r31 + 0x0001]
	.word 0xa1902002  ! 568: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x879021ea  ! 569: WRPR_TT_I	wrpr	%r0, 0x01ea, %tt
	.word 0xe4d004a0  ! 570: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r18
	.word 0x91d020b5  ! 571: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xe4880e60  ! 572: LDUBA_R	lduba	[%r0, %r0] 0x73, %r18
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 573: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_4_133:
	.word 0x20800001  ! 575: BN	bn,a	<label_0x1>
	.word 0xd933001b  ! 575: STQF_R	-	%f12, [%r27, %r12]
	normalw
	.word 0x81458000  ! 574: RD_SOFTINT_REG	stbar
	.word 0x879022c6  ! 575: WRPR_TT_I	wrpr	%r0, 0x02c6, %tt
	.word 0xf217c000  ! 576: LDUH_R	lduh	[%r31 + %r0], %r25
	.word 0xf28008a0  ! 577: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8f902002  ! 579: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa76a2001  ! 578: SDIVX_I	sdivx	%r8, 0x0001, %r19
	.word 0x91d02033  ! 579: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802004  ! 581: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x879021d0  ! 582: WRPR_TT_I	wrpr	%r0, 0x01d0, %tt
	.word 0x93902001  ! 583: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe2900e60  ! 584: LDUHA_R	lduha	[%r0, %r0] 0x73, %r17
	.word 0x87802058  ! 585: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xe28804a0  ! 586: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x87802004  ! 587: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d903303  ! 588: WRPR_PSTATE_I	wrpr	%r0, 0x1303, %pstate
	.word 0x8198250d  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050d, %hpstate
splash_lsu_4_135:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 590: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe21fe001  ! 591: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0xe28fe020  ! 592: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r17
tagged_4_136:
	tsubcctv %r23, 0x103a, %r10
	.word 0xe207e001  ! 593: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe21fe001  ! 594: LDD_I	ldd	[%r31 + 0x0001], %r17
splash_tba_4_137:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 595: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d903c4c  ! 596: WRPR_PSTATE_I	wrpr	%r0, 0x1c4c, %pstate
	.word 0xa190200c  ! 597: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 598: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819827d7  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d7, %hpstate
	.word 0x93902003  ! 600: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xe297e030  ! 601: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r17
	.word 0x8d9024ab  ! 602: WRPR_PSTATE_I	wrpr	%r0, 0x04ab, %pstate
splash_tba_4_138:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 603: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28fe020  ! 605: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r17
	.word 0x87802080  ! 606: WRASI_I	wr	%r0, 0x0080, %asi
change_to_randtl_4_139:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 607: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe2800a80  ! 608: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r17
DS_4_140:
	.word 0x32800001  ! 610: BNE	bne,a	<label_0x1>
	.xword 0x8970ee3f	! Random illegal ?
	.word 0x95a00542  ! 610: FSQRTd	fsqrt	
	.word 0xb5a4883a  ! 609: FADDs	fadds	%f18, %f26, %f26
	.word 0x87802016  ! 610: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8d90213c  ! 611: WRPR_PSTATE_I	wrpr	%r0, 0x013c, %pstate
	.word 0x879021b2  ! 612: WRPR_TT_I	wrpr	%r0, 0x01b2, %tt
splash_tba_4_141:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 613: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0d004a0  ! 614: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r24
splash_htba_4_142:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 615: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_4_143:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 616: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_4_144:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 617: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 618: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93902000  ! 619: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d903035  ! 620: WRPR_PSTATE_I	wrpr	%r0, 0x1035, %pstate
	ta	T_CHANGE_HPRIV	! macro
splash_tba_4_145:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 622: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93514000  ! 623: RDPR_TBA	rdpr	%tba, %r9
tagged_4_146:
	tsubcctv %r18, 0x1bc2, %r19
	.word 0xd207e001  ! 624: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x87802004  ! 625: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x95480000  ! 626: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x879022e0  ! 627: WRPR_TT_I	wrpr	%r0, 0x02e0, %tt
tagged_4_147:
	taddcctv %r12, 0x1543, %r6
	.word 0xca07e001  ! 628: LDUW_I	lduw	[%r31 + 0x0001], %r5
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 629: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca47c000  ! 630: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0x91d02034  ! 631: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d9026fd  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x06fd, %pstate
	.word 0x91d02035  ! 633: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d020b4  ! 634: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x87802016  ! 635: WRASI_I	wr	%r0, 0x0016, %asi
tagged_4_148:
	tsubcctv %r26, 0x19b0, %r3
	.word 0xca07e001  ! 636: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x26800001  ! 637: BL	bl,a	<label_0x1>
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 638: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 640: SIR	sir	0x0001
	.word 0x36700001  ! 641: BPGE	<illegal instruction>
	.word 0x8d90393c  ! 642: WRPR_PSTATE_I	wrpr	%r0, 0x193c, %pstate
	.word 0xca8008a0  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
splash_lsu_4_149:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 644: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb551c000  ! 645: RDPR_TL	<illegal instruction>
splash_lsu_4_150:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 646: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903d0d  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x1d0d, %pstate
DS_4_151:
	.word 0x22800001  ! 649: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 648: SAVE_R	save	%r31, %r0, %r31
DS_4_152:
	.word 0x32800001  ! 650: BNE	bne,a	<label_0x1>
	.xword 0xb3688861	! Random illegal ?
	.word 0xc5108002  ! 650: LDQF_R	-	[%r2, %r2], %f2
	.word 0xa5a0083a  ! 649: FADDs	fadds	%f0, %f26, %f18
	.word 0x8f902000  ! 651: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1820007  ! 650: WR_STICK_REG_R	wr	%r8, %r7, %-
	.word 0xd997e001  ! 651: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0xd89fe001  ! 652: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x9f802001  ! 653: SIR	sir	0x0001
	.word 0xd81fc000  ! 654: LDD_R	ldd	[%r31 + %r0], %r12
tagged_4_154:
	tsubcctv %r9, 0x16c5, %r11
	.word 0xd807e001  ! 655: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8790217f  ! 656: WRPR_TT_I	wrpr	%r0, 0x017f, %tt
splash_tba_4_155:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 657: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_4_156:
	.word 0x32800001  ! 659: BNE	bne,a	<label_0x1>
	.word 0xd732e001  ! 659: STQF_I	-	%f11, [0x0001, %r11]
	normalw
	.word 0xa1458000  ! 658: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0xce4fc000  ! 659: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0x8d902813  ! 660: WRPR_PSTATE_I	wrpr	%r0, 0x0813, %pstate
	.word 0x34800001  ! 661: BG	bg,a	<label_0x1>
	.word 0x8d902a50  ! 662: WRPR_PSTATE_I	wrpr	%r0, 0x0a50, %pstate
DS_4_157:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 663: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x81982707  ! 664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0707, %hpstate
tagged_4_158:
	tsubcctv %r7, 0x15bc, %r1
	.word 0xce07e001  ! 665: LDUW_I	lduw	[%r31 + 0x0001], %r7
DS_4_159:
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0x95a00557  ! 667: FSQRTd	fsqrt	
	.word 0xb1a00833  ! 666: FADDs	fadds	%f0, %f19, %f24
	.word 0xe49fe001  ! 667: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0x93902003  ! 668: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d802004  ! 669: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xe4800aa0  ! 671: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r18
	.word 0x99902002  ! 672: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa1902006  ! 673: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8745c000  ! 674: RD_TICK_CMPR_REG	rd	%-, %r3
	.word 0xecdfe010  ! 675: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r22
tagged_4_160:
	tsubcctv %r8, 0x132b, %r22
	.word 0xec07e001  ! 676: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0xed17c000  ! 677: LDQF_R	-	[%r31, %r0], %f22
	.word 0xb7a58ddb  ! 678: FdMULq	fdmulq	
	.word 0x8d500000  ! 679: RDPR_TPC	<illegal instruction>
	.word 0xa190200d  ! 680: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8198285d  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085d, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 682: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_tba_4_161:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 683: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc4c7e010  ! 684: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0x87802004  ! 685: WRASI_I	wr	%r0, 0x0004, %asi
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc4c7e000  ! 687: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r2
	.word 0xc48804a0  ! 688: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc49fc020  ! 689: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x81460000  ! 691: RD_STICK_REG	stbar
	.word 0x879021b9  ! 692: WRPR_TT_I	wrpr	%r0, 0x01b9, %tt
	.word 0xc4d804a0  ! 693: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0x8d903169  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x1169, %pstate
	.word 0xa1902003  ! 695: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_4_162:
	.word 0x22800001  ! 697: BE	be,a	<label_0x1>
	.word 0xd3306001  ! 697: STQF_I	-	%f9, [0x0001, %r1]
	normalw
	.word 0xad458000  ! 696: RD_SOFTINT_REG	rd	%softint, %r22
	.word 0x99902002  ! 697: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
splash_tba_4_163:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 698: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc28008a0  ! 699: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc317c000  ! 700: LDQF_R	-	[%r31, %r0], %f1
tagged_4_164:
	tsubcctv %r2, 0x13cc, %r22
	.word 0xc207e001  ! 701: LDUW_I	lduw	[%r31 + 0x0001], %r1
tagged_4_165:
	taddcctv %r1, 0x148d, %r17
	.word 0xc207e001  ! 702: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc28008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc29fe001  ! 705: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x8780201c  ! 706: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8198254d  ! 707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054d, %hpstate
	.word 0xaf480000  ! 708: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	.word 0xf0880e60  ! 709: LDUBA_R	lduba	[%r0, %r0] 0x73, %r24
	.word 0x91d020b3  ! 710: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x879023b1  ! 711: WRPR_TT_I	wrpr	%r0, 0x03b1, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902005  ! 713: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d9035fd  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x15fd, %pstate
	.word 0xf08fe010  ! 715: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r24
splash_tba_4_166:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0900e40  ! 717: LDUHA_R	lduha	[%r0, %r0] 0x72, %r24
	.word 0xa1902004  ! 718: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 719: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 721: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90300d  ! 722: WRPR_PSTATE_I	wrpr	%r0, 0x100d, %pstate
tagged_4_167:
	taddcctv %r12, 0x15f5, %r17
	.word 0xf007e001  ! 723: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0xf08804a0  ! 724: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0xf02fc009  ! 725: STB_R	stb	%r24, [%r31 + %r9]
	.word 0x87902336  ! 726: WRPR_TT_I	wrpr	%r0, 0x0336, %tt
	.word 0xf08804a0  ! 727: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x87802020  ! 728: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x81982407  ! 729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0407, %hpstate
	.word 0xf0800b20  ! 730: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r24
	.word 0x2c700001  ! 731: BPNEG	<illegal instruction>
	.word 0x93902004  ! 732: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02034  ! 733: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902000  ! 734: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x32700001  ! 735: BPNE	<illegal instruction>
	.word 0x87802004  ! 736: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf01fc000  ! 737: LDD_R	ldd	[%r31 + %r0], %r24
	.word 0x93902006  ! 738: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_4_168:
	.word 0x22800001  ! 740: BE	be,a	<label_0x1>
	allclean
	.word 0xb1b04308  ! 739: ALLIGNADDRESS	alignaddr	%r1, %r8, %r24
	.word 0x93d020b4  ! 740: Tcc_I	tne	icc_or_xcc, %r0 + 180
DS_4_169:
	.word 0x34800001  ! 742: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 741: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802000  ! 742: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 743: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 744: BPE	<illegal instruction>
	.word 0xc407c000  ! 745: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x93902000  ! 746: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x3a700001  ! 747: BPCC	<illegal instruction>
	.word 0x81982a94  ! 748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a94, %hpstate
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 749: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8b500000  ! 750: RDPR_TPC	rdpr	%tpc, %r5
splash_htba_4_170:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 751: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcc1fc000  ! 752: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x93902004  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902000  ! 754: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_4_171:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 755: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 756: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_4_172:
	.word 0x22800001  ! 758: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 757: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fc000  ! 758: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0xcc800bc0  ! 759: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r6
	.word 0xa190200e  ! 760: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xcc4fc000  ! 761: LDSB_R	ldsb	[%r31 + %r0], %r6
DS_4_173:
	.word 0x22800001  ! 763: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 762: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fe001  ! 763: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x8198299f  ! 764: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099f, %hpstate
splash_tba_4_174:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 765: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcd97e001  ! 766: LDQFA_I	-	[%r31, 0x0001], %f6
	.word 0x99504000  ! 767: RDPR_TNPC	rdpr	%tnpc, %r12
	.word 0xa9540000  ! 768: RDPR_GL	rdpr	%-, %r20
splash_lsu_4_175:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 769: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 770: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x996c800b  ! 771: SDIVX_R	sdivx	%r18, %r11, %r12
	.word 0xb7508000  ! 772: RDPR_TSTATE	<illegal instruction>
	.word 0x8d90358e  ! 773: WRPR_PSTATE_I	wrpr	%r0, 0x158e, %pstate
	.word 0x3e800001  ! 774: BVC	bvc,a	<label_0x1>
	.word 0xc2d004a0  ! 775: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x93902007  ! 776: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87802080  ! 777: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d9022c6  ! 778: WRPR_PSTATE_I	wrpr	%r0, 0x02c6, %pstate
	.word 0x91d020b2  ! 779: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xc217c000  ! 780: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x8790210c  ! 781: WRPR_TT_I	wrpr	%r0, 0x010c, %tt
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 782: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d514000  ! 783: RDPR_TBA	<illegal instruction>
splash_lsu_4_176:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 784: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 785: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x93902007  ! 786: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8b480000  ! 787: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0xce17c000  ! 788: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0xcec7e020  ! 789: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r7
DS_4_177:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 790: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x9f802001  ! 791: SIR	sir	0x0001
	.word 0x879022b5  ! 792: WRPR_TT_I	wrpr	%r0, 0x02b5, %tt
splash_tba_4_178:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce800ba0  ! 794: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r7
	.word 0xcedfe020  ! 795: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r7
	.word 0x9f802001  ! 796: SIR	sir	0x0001
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 797: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce1fc000  ! 798: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0xce4fc000  ! 799: LDSB_R	ldsb	[%r31 + %r0], %r7
tagged_4_179:
	taddcctv %r1, 0x1801, %r5
	.word 0xce07e001  ! 800: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x87802004  ! 801: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa190200f  ! 802: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xce800b00  ! 803: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r7
	.word 0x93d02034  ! 804: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_tba_4_180:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 805: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_4_181:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 806: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 807: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9020a0  ! 808: WRPR_PSTATE_I	wrpr	%r0, 0x00a0, %pstate
	.word 0x2e700001  ! 809: BPVS	<illegal instruction>
	.word 0xced7e010  ! 810: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r7
	.word 0x879023ff  ! 811: WRPR_TT_I	wrpr	%r0, 0x03ff, %tt
splash_lsu_4_182:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 812: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 813: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x38800001  ! 814: BGU	bgu,a	<label_0x1>
splash_lsu_4_183:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 815: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 816: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xa1902002  ! 817: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_lsu_4_184:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 818: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcec004a0  ! 819: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xa1902004  ! 820: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_htba_4_185:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 821: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902004  ! 822: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xce800b80  ! 823: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r7
	.word 0xa1902001  ! 824: WRPR_GL_I	wrpr	%r0, 0x0001, %-
DS_4_186:
	.word 0x34800001  ! 826: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 825: SAVE_R	save	%r31, %r0, %r31
	.word 0x99a289d5  ! 826: FDIVd	fdivd	%f10, %f52, %f12
	.word 0x8f902002  ! 828: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8da01968  ! 827: FqTOd	dis not found

	.word 0xd647e001  ! 828: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x87902323  ! 829: WRPR_TT_I	wrpr	%r0, 0x0323, %tt
	.word 0x8f902002  ! 831: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x99a01975  ! 830: FqTOd	dis not found

splash_lsu_4_189:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 831: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903795  ! 832: WRPR_PSTATE_I	wrpr	%r0, 0x1795, %pstate
	.word 0xb5500000  ! 833: RDPR_TPC	<illegal instruction>
	.word 0x93902006  ! 834: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_4_190:
	.word 0x32800001  ! 836: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 835: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_4_191:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 837: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xd01fe001  ! 838: LDD_I	ldd	[%r31 + 0x0001], %r8
splash_tba_4_192:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 839: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd04fe001  ! 840: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0x83a48dd0  ! 841: FdMULq	fdmulq	
	.word 0x87802058  ! 842: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8f902001  ! 844: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb56ca001  ! 843: SDIVX_I	sdivx	%r18, 0x0001, %r26
	.word 0xd41fe001  ! 844: LDD_I	ldd	[%r31 + 0x0001], %r10
splash_cmpr_4_194:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb1806001  ! 845: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0x93902001  ! 846: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982785  ! 847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0785, %hpstate
tagged_4_195:
	taddcctv %r5, 0x1d29, %r19
	.word 0xd407e001  ! 848: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd48008a0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4cfe030  ! 850: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
	.word 0x30800001  ! 851: BA	ba,a	<label_0x1>
change_to_randtl_4_196:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 852: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802063  ! 853: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x9f802001  ! 854: SIR	sir	0x0001
	.word 0x819829d6  ! 855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d6, %hpstate
DS_4_197:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 856: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8780201c  ! 857: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xa190200c  ! 858: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd41fe001  ! 859: LDD_I	ldd	[%r31 + 0x0001], %r10
tagged_4_198:
	tsubcctv %r5, 0x15f7, %r11
	.word 0xd407e001  ! 860: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_tba_4_199:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 861: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802089  ! 862: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87902016  ! 863: WRPR_TT_I	wrpr	%r0, 0x0016, %tt
	.word 0x8f480000  ! 864: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0xccdfe020  ! 865: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
	.word 0xcc8008a0  ! 866: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc1fe001  ! 868: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x81982814  ! 869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0814, %hpstate
	.word 0x93902006  ! 870: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xccdfe010  ! 871: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r6
tagged_4_200:
	tsubcctv %r11, 0x16bb, %r6
	.word 0xcc07e001  ! 872: LDUW_I	lduw	[%r31 + 0x0001], %r6
splash_tba_4_201:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 873: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802063  ! 874: WRASI_I	wr	%r0, 0x0063, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc0fc000  ! 876: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x87802004  ! 877: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x879020a3  ! 878: WRPR_TT_I	wrpr	%r0, 0x00a3, %tt
	.word 0xccd7e030  ! 879: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc900e40  ! 881: LDUHA_R	lduha	[%r0, %r0] 0x72, %r6
splash_lsu_4_202:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 882: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 883: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_tba_4_203:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 884: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc8008a0  ! 885: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
DS_4_204:
	.word 0x22800001  ! 887: BE	be,a	<label_0x1>
	.word 0xc530800d  ! 887: STQF_R	-	%f2, [%r13, %r2]
	normalw
	.word 0x87458000  ! 886: RD_SOFTINT_REG	rd	%softint, %r3
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 887: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf28008a0  ! 888: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
DS_4_205:
	.word 0x34800001  ! 890: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 889: RESTORE_R	restore	%r31, %r0, %r31
splash_htba_4_206:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 890: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xf2d804a0  ! 891: LDXA_R	ldxa	[%r0, %r0] 0x25, %r25
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 892: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xf2c7e010  ! 893: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r25
DS_4_207:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 894: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xf2880e40  ! 895: LDUBA_R	lduba	[%r0, %r0] 0x72, %r25
	.word 0x8198204e  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x004e, %hpstate
	.word 0xf217e001  ! 897: LDUH_I	lduh	[%r31 + 0x0001], %r25
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 898: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200b  ! 899: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xf2800c40  ! 900: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r25
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 901: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf217c000  ! 902: LDUH_R	lduh	[%r31 + %r0], %r25
change_to_randtl_4_208:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 903: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x32800001  ! 904: BNE	bne,a	<label_0x1>
	.word 0xa190200a  ! 905: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x87802088  ! 906: WRASI_I	wr	%r0, 0x0088, %asi
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 907: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf28008a0  ! 908: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x87802080  ! 909: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xf317c000  ! 910: LDQF_R	-	[%r31, %r0], %f25
	.word 0xa1902009  ! 911: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902002  ! 912: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8780201c  ! 913: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xf28fe010  ! 914: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r25
	.word 0x8d9021d6  ! 915: WRPR_PSTATE_I	wrpr	%r0, 0x01d6, %pstate
	.word 0xf28008a0  ! 916: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8f902001  ! 918: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x876ea001  ! 917: SDIVX_I	sdivx	%r26, 0x0001, %r3
splash_lsu_4_210:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 918: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x81464000  ! 919: RD_STICK_CMPR_REG	stbar
	.word 0xa1902007  ! 920: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x81982984  ! 921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0984, %hpstate
	.word 0xd6800c80  ! 922: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r11
	.word 0x93902000  ! 923: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_4_211:
	taddcctv %r25, 0x1809, %r14
	.word 0xd607e001  ! 924: LDUW_I	lduw	[%r31 + 0x0001], %r11
DS_4_212:
	.word 0x22800001  ! 926: BE	be,a	<label_0x1>
	pdist %f26, %f28, %f20
	.word 0x93b48300  ! 925: ALLIGNADDRESS	alignaddr	%r18, %r0, %r9
	.word 0x8d902e8b  ! 926: WRPR_PSTATE_I	wrpr	%r0, 0x0e8b, %pstate
tagged_4_213:
	taddcctv %r24, 0x1a02, %r2
	.word 0xc607e001  ! 927: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc607c000  ! 928: LDUW_R	lduw	[%r31 + %r0], %r3
splash_tba_4_214:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 929: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68fe030  ! 930: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r3
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 931: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802088  ! 933: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902007  ! 934: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc73fc002  ! 935: STDF_R	std	%f3, [%r2, %r31]
	.word 0xc6d804a0  ! 936: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 937: LDQF_R	-	[%r31, %r0], %f3
tagged_4_215:
	taddcctv %r13, 0x1b7d, %r5
	.word 0xc607e001  ! 938: LDUW_I	lduw	[%r31 + 0x0001], %r3
DS_4_216:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 939: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_tba_4_217:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 940: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_4_218:
	.word 0x22800001  ! 942: BE	be,a	<label_0x1>
	.xword 0xefd96bda	! Random illegal ?
	.word 0xe5140000  ! 942: LDQF_R	-	[%r16, %r0], %f18
	.word 0xafa0c83b  ! 941: FADDs	fadds	%f3, %f27, %f23
	.word 0x93902001  ! 942: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d9036c6  ! 943: WRPR_PSTATE_I	wrpr	%r0, 0x16c6, %pstate
	.word 0x8d902372  ! 944: WRPR_PSTATE_I	wrpr	%r0, 0x0372, %pstate
	.word 0x8780204f  ! 945: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xc48804a0  ! 946: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc49fc020  ! 947: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x93d020b4  ! 948: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x93902006  ! 949: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc517c000  ! 951: LDQF_R	-	[%r31, %r0], %f2
	.word 0x24700001  ! 952: BPLE	<illegal instruction>
	.word 0x8f902001  ! 954: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1850003  ! 953: WR_STICK_REG_R	wr	%r20, %r3, %-
	.word 0x81982c0d  ! 954: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0d, %hpstate
	.word 0xc417c000  ! 955: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x93902005  ! 956: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902003  ! 957: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8198228d  ! 958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028d, %hpstate
	.word 0x93902003  ! 959: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc48804a0  ! 960: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc48008a0  ! 961: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xa1902003  ! 962: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x99494000  ! 963: RDHPR_HTBA	rdhpr	%htba, %r12
	.word 0xc4d7e000  ! 964: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
	.word 0x93902000  ! 965: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_4_220:
	.word 0x32800001  ! 967: BNE	bne,a	<label_0x1>
	.word 0xeb358019  ! 967: STQF_R	-	%f21, [%r25, %r22]
	normalw
	.word 0x97458000  ! 966: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xa1902007  ! 967: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_lsu_4_221:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902006  ! 969: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x28800001  ! 970: BLEU	bleu,a	<label_0x1>
splash_lsu_4_222:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 971: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802004  ! 972: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_cmpr_4_223:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 974: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184a001  ! 973: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0x91d020b3  ! 974: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xd4d00e60  ! 975: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r10
tagged_4_224:
	tsubcctv %r20, 0x1e11, %r23
	.word 0xd407e001  ! 976: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4c00e60  ! 977: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r10
	.word 0x93902001  ! 978: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x99902004  ! 979: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x8d90396c  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x196c, %pstate
	.word 0x93902004  ! 981: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x83d02032  ! 982: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x22700001  ! 983: BPE	<illegal instruction>
	.word 0x93902006  ! 984: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 985: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 986: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 987: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd497e020  ! 988: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0xd4dfe030  ! 989: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
	.word 0x93d02034  ! 990: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x34800001  ! 991: BG	bg,a	<label_0x1>
	.word 0xa1902004  ! 992: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd48008a0  ! 993: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd597e001  ! 994: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x91d020b5  ! 995: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_htba_4_225:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 996: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902005  ! 997: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_4_226:
	.word 0x22800001  ! 999: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 998: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_4_227:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_4:
	.word 0x91d02034  ! 1: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x83d02033  ! 2: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0xa1902006  ! 3: WRPR_GL_I	wrpr	%r0, 0x0006, %-
splash_lsu_3_0:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 4: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x95514000  ! 5: RDPR_TBA	<illegal instruction>
tagged_3_1:
	taddcctv %r4, 0x13fa, %r22
	.word 0xcc07e001  ! 6: LDUW_I	lduw	[%r31 + 0x0001], %r6
DS_3_2:
	.word 0x22800001  ! 8: BE	be,a	<label_0x1>
	pdist %f20, %f30, %f12
	.word 0x93b30319  ! 7: ALLIGNADDRESS	alignaddr	%r12, %r25, %r9
	.word 0xa5514000  ! 8: RDPR_TBA	<illegal instruction>
tagged_3_3:
	taddcctv %r6, 0x1151, %r8
	.word 0xc807e001  ! 9: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc81fe001  ! 10: LDD_I	ldd	[%r31 + 0x0001], %r4
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 11: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc8c7e010  ! 12: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r4
	.word 0xc917c000  ! 13: LDQF_R	-	[%r31, %r0], %f4
	.word 0xc89fe001  ! 14: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902002  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xc807c000  ! 17: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0x8d802004  ! 18: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa945c000  ! 19: RD_TICK_CMPR_REG	rd	%-, %r20
	.word 0x91d02034  ! 20: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_3_4:
	.word 0x32800001  ! 22: BNE	bne,a	<label_0x1>
	.word 0xd3340002  ! 22: STQF_R	-	%f9, [%r2, %r16]
	normalw
	.word 0x85458000  ! 21: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x879021fb  ! 22: WRPR_TT_I	wrpr	%r0, 0x01fb, %tt
DS_3_5:
	.word 0x32800001  ! 24: BNE	bne,a	<label_0x1>
	.word 0xe9300009  ! 24: STQF_R	-	%f20, [%r9, %r0]
	normalw
	.word 0x89458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r4
tagged_3_6:
	tsubcctv %r6, 0x1c89, %r6
	.word 0xd607e001  ! 24: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x87902201  ! 25: WRPR_TT_I	wrpr	%r0, 0x0201, %tt
splash_tba_3_7:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 26: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x81982216  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0216, %hpstate
splash_lsu_3_8:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd65fe001  ! 29: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d7e020  ! 30: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	.word 0x8b50c000  ! 31: RDPR_TT	<illegal instruction>
	.word 0xda07c000  ! 32: LDUW_R	lduw	[%r31 + %r0], %r13
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 33: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81982b55  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b55, %hpstate
	.word 0xdad7e030  ! 36: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r13
	.word 0xda47c000  ! 37: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0x81982f1e  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1e, %hpstate
	.word 0xa9464000  ! 39: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0xa7464000  ! 40: RD_STICK_CMPR_REG	rd	%-, %r19
	.word 0x8d902173  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x0173, %pstate
	.word 0x87802020  ! 42: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xa1902002  ! 43: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x8790239d  ! 44: WRPR_TT_I	wrpr	%r0, 0x039d, %tt
DS_3_9:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
DS_3_10:
	.word 0x20800001  ! 47: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 46: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 47: BL	bl,a	<label_0x1>
DS_3_11:
	.word 0x22800001  ! 49: BE	be,a	<label_0x1>
	pdist %f0, %f24, %f12
	.word 0xb7b08318  ! 48: ALLIGNADDRESS	alignaddr	%r2, %r24, %r27
	.word 0xa190200c  ! 49: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd65fe001  ! 50: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d804a0  ! 51: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0xd6800ae0  ! 52: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r11
	.word 0x8790220f  ! 53: WRPR_TT_I	wrpr	%r0, 0x020f, %tt
splash_htba_3_12:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 54: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d903307  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x1307, %pstate
	.word 0xd617e001  ! 56: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0x87902370  ! 57: WRPR_TT_I	wrpr	%r0, 0x0370, %tt
	.word 0xd68008a0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_3_13:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8790214a  ! 60: WRPR_TT_I	wrpr	%r0, 0x014a, %tt
	.word 0x91d02032  ! 61: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd6800c00  ! 62: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r11
splash_cmpr_3_14:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1826001  ! 63: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0xd6d7e030  ! 64: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0x8d903700  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x1700, %pstate
	.word 0x26700001  ! 66: BPL	<illegal instruction>
	.word 0xa350c000  ! 67: RDPR_TT	rdpr	%tt, %r17
	.word 0x8d903424  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x1424, %pstate
	.word 0x30800001  ! 69: BA	ba,a	<label_0x1>
splash_lsu_3_15:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 70: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903fec  ! 71: WRPR_PSTATE_I	wrpr	%r0, 0x1fec, %pstate
splash_lsu_3_16:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 72: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02034  ! 73: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe137c009  ! 74: STQF_R	-	%f16, [%r9, %r31]
	.word 0xe057c000  ! 75: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0x81982e14  ! 76: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e14, %hpstate
splash_tba_3_17:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 77: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802004  ! 78: WRFPRS_I	wr	%r0, 0x0004, %fprs
splash_htba_3_18:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_3_19:
	taddcctv %r3, 0x1b74, %r25
	.word 0xe007e001  ! 80: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8d902197  ! 81: WRPR_PSTATE_I	wrpr	%r0, 0x0197, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 82: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 83: BNE	bne,a	<label_0x1>
	.word 0x91d02032  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8790226c  ! 85: WRPR_TT_I	wrpr	%r0, 0x026c, %tt
	.word 0xe0d7e010  ! 86: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
	.word 0x91504000  ! 87: RDPR_TNPC	<illegal instruction>
	.word 0x91d02034  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x26700001  ! 89: BPL	<illegal instruction>
	.word 0x8d903cf7  ! 90: WRPR_PSTATE_I	wrpr	%r0, 0x1cf7, %pstate
	.word 0x9f802001  ! 91: SIR	sir	0x0001
	.word 0x93d020b4  ! 92: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x81982b4d  ! 93: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4d, %hpstate
	.word 0xc24fc000  ! 94: LDSB_R	ldsb	[%r31 + %r0], %r1
DS_3_20:
	.word 0x32800001  ! 96: BNE	bne,a	<label_0x1>
	.xword 0xf5f140bd	! Random illegal ?
	.word 0xcd154000  ! 96: LDQF_R	-	[%r21, %r0], %f6
	.word 0xa7a1c821  ! 95: FADDs	fadds	%f7, %f1, %f19
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 96: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_3_21:
	taddcctv %r5, 0x16cf, %r17
	.word 0xc007e001  ! 97: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x2a800001  ! 98: BCS	bcs,a	<label_0x1>
	.word 0xc08804a0  ! 99: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0xa1902004  ! 100: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xc017c000  ! 101: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc03fe001  ! 102: STD_I	std	%r0, [%r31 + 0x0001]
	.word 0x93902003  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc08008a0  ! 104: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x93902007  ! 105: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81460000  ! 106: RD_STICK_REG	stbar
	.word 0xc01fc000  ! 107: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x81982ed4  ! 108: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed4, %hpstate
	.word 0xc0c7e000  ! 109: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
	.word 0x8d903d7b  ! 110: WRPR_PSTATE_I	wrpr	%r0, 0x1d7b, %pstate
	.word 0x97500000  ! 111: RDPR_TPC	<illegal instruction>
	.word 0xb1500000  ! 112: RDPR_TPC	<illegal instruction>
splash_cmpr_3_22:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1802001  ! 113: WR_STICK_REG_I	wr	%r0, 0x0001, %-
	.word 0xe097e030  ! 114: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
tagged_3_23:
	taddcctv %r24, 0x1c1f, %r22
	.word 0xe007e001  ! 115: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe0d7e000  ! 116: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
	.word 0x819828c6  ! 117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c6, %hpstate
	.word 0xe0d804a0  ! 118: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	ta	T_CHANGE_HPRIV	! macro
DS_3_24:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 120: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
splash_tba_3_25:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 121: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0d804a0  ! 122: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	.word 0x9f802001  ! 123: SIR	sir	0x0001
	.word 0x81982f5d  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5d, %hpstate
	.word 0xe0dfe030  ! 125: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r16
	.word 0x8790208f  ! 126: WRPR_TT_I	wrpr	%r0, 0x008f, %tt
	.word 0x87902047  ! 127: WRPR_TT_I	wrpr	%r0, 0x0047, %tt
	.word 0xe01fc000  ! 128: LDD_R	ldd	[%r31 + %r0], %r16
change_to_randtl_3_26:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 129: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d902609  ! 130: WRPR_PSTATE_I	wrpr	%r0, 0x0609, %pstate
splash_lsu_3_27:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb180800c  ! 132: WR_STICK_REG_R	wr	%r2, %r12, %-
	.word 0x81982a87  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a87, %hpstate
	.word 0xe08008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
change_to_randtl_3_29:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 135: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe0800c60  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r16
	.word 0x93902002  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d90328f  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x128f, %pstate
	.word 0x8efda001  ! 139: SDIVcc_I	sdivcc 	%r22, 0x0001, %r7
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 140: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 141: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xca8008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x87802080  ! 143: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902efb  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x0efb, %pstate
	.word 0x8d903533  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x1533, %pstate
	.word 0xcad004a0  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
DS_3_30:
	.word 0x20800001  ! 148: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
DS_3_31:
	.word 0x20800001  ! 149: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 148: SAVE_R	save	%r31, %r0, %r31
	.word 0xca8008a0  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xca97e020  ! 150: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r5
	.word 0xb66e0015  ! 151: UDIVX_R	udivx 	%r24, %r21, %r27
	.word 0xc84fe001  ! 152: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0xc8c804a0  ! 153: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
	.word 0xc89fe001  ! 154: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
splash_tba_3_32:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc827e001  ! 156: STW_I	stw	%r4, [%r31 + 0x0001]
	.word 0xc8d004a0  ! 157: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_lsu_3_33:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x85514000  ! 159: RDPR_TBA	<illegal instruction>
	.word 0xd737c018  ! 160: STQF_R	-	%f11, [%r24, %r31]
	.word 0xd61fc000  ! 161: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd6c7e020  ! 162: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r11
	.word 0xd6dfe010  ! 163: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0x8345c000  ! 164: RD_TICK_CMPR_REG	rd	%-, %r1
	.word 0xb7508000  ! 165: RDPR_TSTATE	<illegal instruction>
	.word 0xd89fe001  ! 166: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 167: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 168: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd89004a0  ! 169: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0x819829ce  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ce, %hpstate
	.word 0xd84fc000  ! 171: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x81982bc4  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bc4, %hpstate
	.word 0x8d902c08  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x0c08, %pstate
	.word 0x9f802001  ! 174: SIR	sir	0x0001
DS_3_34:
	.word 0x34800001  ! 176: BG	bg,a	<label_0x1>
	pdist %f12, %f12, %f20
	.word 0x87b64302  ! 175: ALLIGNADDRESS	alignaddr	%r25, %r2, %r3
DS_3_35:
	.word 0x32800001  ! 177: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 176: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_3_36:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 178: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902006  ! 179: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d9034fb  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x14fb, %pstate
	.word 0x93902005  ! 181: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_3_37:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 182: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 183: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a80  ! 184: WRPR_PSTATE_I	wrpr	%r0, 0x0a80, %pstate
	.word 0x91d02033  ! 185: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe2d00e60  ! 186: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r17
	.word 0x8198231e  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031e, %hpstate
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902dcc  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x0dcc, %pstate
splash_tba_3_38:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 190: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902001  ! 191: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1902004  ! 192: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x91d02032  ! 193: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87902181  ! 194: WRPR_TT_I	wrpr	%r0, 0x0181, %tt
	.word 0x91d020b2  ! 195: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xa951c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0x8d902797  ! 197: WRPR_PSTATE_I	wrpr	%r0, 0x0797, %pstate
	.word 0x91d020b4  ! 198: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xd607c000  ! 199: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x91d02034  ! 200: Tcc_I	ta	icc_or_xcc, %r0 + 52
tagged_3_39:
	taddcctv %r26, 0x1585, %r21
	.word 0xd607e001  ! 201: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x87508000  ! 202: RDPR_TSTATE	<illegal instruction>
	.word 0xc4880e80  ! 203: LDUBA_R	lduba	[%r0, %r0] 0x74, %r2
	.word 0xc48008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc4800b20  ! 205: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r2
change_to_randtl_3_40:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 206: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc4800b80  ! 207: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x83d02033  ! 209: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x91d02032  ! 210: Tcc_I	ta	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_PRIV	! macro
	.word 0x32800001  ! 212: BNE	bne,a	<label_0x1>
	.word 0x81982117  ! 213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0117, %hpstate
	.word 0xa190200c  ! 214: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_tba_3_41:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 215: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_3_42:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc48008a0  ! 217: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 218: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8780201c  ! 219: WRASI_I	wr	%r0, 0x001c, %asi
DS_3_43:
	.word 0x22800001  ! 221: BE	be,a	<label_0x1>
	.word 0xeb35e001  ! 221: STQF_I	-	%f21, [0x0001, %r23]
	normalw
	.word 0x99458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r12
splash_lsu_3_44:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 221: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xeec804a0  ! 222: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r23
	.word 0x8750c000  ! 223: RDPR_TT	<illegal instruction>
	.word 0x8d802000  ! 224: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802089  ! 225: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xce8008a0  ! 226: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x87802088  ! 227: WRASI_I	wr	%r0, 0x0088, %asi
splash_tba_3_45:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 228: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x34700001  ! 229: BPG	<illegal instruction>
	.word 0x8b508000  ! 230: RDPR_TSTATE	<illegal instruction>
	.word 0x8790239a  ! 231: WRPR_TT_I	wrpr	%r0, 0x039a, %tt
tagged_3_46:
	tsubcctv %r11, 0x1506, %r6
	.word 0xe207e001  ! 232: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x87902200  ! 233: WRPR_TT_I	wrpr	%r0, 0x0200, %tt
	.word 0xe2800c00  ! 234: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r17
	.word 0x98ab400c  ! 235: ANDNcc_R	andncc 	%r13, %r12, %r12
DS_3_47:
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 236: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982b0d  ! 237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0d, %hpstate
	.word 0x8780201c  ! 238: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x879020fc  ! 239: WRPR_TT_I	wrpr	%r0, 0x00fc, %tt
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 240: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc61fe001  ! 241: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x2c800001  ! 242: BNEG	bneg,a	<label_0x1>
	.word 0xc6c7e000  ! 243: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r3
	.word 0x8d903f5d  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x1f5d, %pstate
	.word 0x8d902ca4  ! 245: WRPR_PSTATE_I	wrpr	%r0, 0x0ca4, %pstate
	.word 0x8790232b  ! 246: WRPR_TT_I	wrpr	%r0, 0x032b, %tt
splash_lsu_3_48:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x28700001  ! 248: BPLEU	<illegal instruction>
	.word 0xc607c000  ! 249: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0xc68804a0  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 251: LDQF_R	-	[%r31, %r0], %f3
tagged_3_49:
	taddcctv %r1, 0x11e5, %r5
	.word 0xc607e001  ! 252: LDUW_I	lduw	[%r31 + 0x0001], %r3
change_to_randtl_3_50:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 253: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc68008a0  ! 254: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 255: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 256: SIR	sir	0x0001
change_to_randtl_3_51:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 257: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xc68008a0  ! 258: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc657c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r3
DS_3_52:
	.word 0x32800001  ! 261: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 260: SAVE_R	save	%r31, %r0, %r31
splash_lsu_3_53:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 262: BPN	<illegal instruction>
	.word 0x87802088  ! 263: WRASI_I	wr	%r0, 0x0088, %asi
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 264: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902714  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x0714, %pstate
	.word 0xc61fc000  ! 266: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xc61fc000  ! 267: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x8d802004  ! 268: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_3_54:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 269: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8d903d3f  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x1d3f, %pstate
	.word 0x81982745  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0745, %hpstate
	.word 0x87802004  ! 272: WRASI_I	wr	%r0, 0x0004, %asi
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902041  ! 274: WRPR_TT_I	wrpr	%r0, 0x0041, %tt
	.word 0x81982147  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0147, %hpstate
	.word 0x8790213a  ! 276: WRPR_TT_I	wrpr	%r0, 0x013a, %tt
	.word 0x91d020b3  ! 277: Tcc_I	ta	icc_or_xcc, %r0 + 179
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 278: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc68008a0  ! 279: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x93902006  ! 280: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x879023ee  ! 281: WRPR_TT_I	wrpr	%r0, 0x03ee, %tt
splash_tba_3_55:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 282: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc6800b60  ! 283: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r3
	.word 0xc6c80e60  ! 284: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r3
splash_cmpr_3_56:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1832001  ! 285: WR_STICK_REG_I	wr	%r12, 0x0001, %-
	.word 0x8d90336a  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x136a, %pstate
splash_htba_3_57:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 287: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d90235c  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x035c, %pstate
	.word 0x34700001  ! 289: BPG	<illegal instruction>
splash_cmpr_3_58:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1866001  ! 290: WR_STICK_REG_I	wr	%r25, 0x0001, %-
	.word 0x93902000  ! 291: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802089  ! 293: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x91d02032  ! 294: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902002  ! 295: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xb1a00561  ! 296: FSQRTq	fsqrt	
	.word 0x91d02034  ! 297: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_3_59:
	.word 0x20800001  ! 299: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 299: BG	bg,a	<label_0x1>
	.word 0x89a00549  ! 299: FSQRTd	fsqrt	
	.word 0x89a2082a  ! 298: FADDs	fadds	%f8, %f10, %f4
	.word 0xc6800c40  ! 299: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r3
	.word 0xc68804a0  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
splash_tba_3_60:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 301: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc647e001  ! 302: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x99902005  ! 303: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x93902006  ! 304: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 305: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_3_61:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xc6800ba0  ! 308: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r3
	.word 0x8198259c  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x059c, %hpstate
splash_lsu_3_62:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc69004a0  ! 311: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x87802055  ! 312: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x91d02034  ! 313: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d902b50  ! 314: WRPR_PSTATE_I	wrpr	%r0, 0x0b50, %pstate
	.word 0x87902284  ! 315: WRPR_TT_I	wrpr	%r0, 0x0284, %tt
	.word 0x91d02033  ! 316: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_tba_3_63:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 317: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc69fc020  ! 318: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
splash_lsu_3_64:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 320: BN	bn,a	<label_0x1>
	.word 0x8d902d26  ! 321: WRPR_PSTATE_I	wrpr	%r0, 0x0d26, %pstate
DS_3_65:
	.word 0x20800001  ! 323: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 322: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902002  ! 324: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1864010  ! 323: WR_STICK_REG_R	wr	%r25, %r16, %-
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 324: Tcc_R	tne	icc_or_xcc, %r0 + %r30
tagged_3_67:
	taddcctv %r1, 0x1d22, %r20
	.word 0xc607e001  ! 325: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_tba_3_68:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 326: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902000  ! 328: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1848010  ! 327: WR_STICK_REG_R	wr	%r18, %r16, %-
	.word 0x81508000  ! 328: RDPR_TSTATE	<illegal instruction>
splash_lsu_3_70:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 329: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d802000  ! 331: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02034  ! 332: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902002  ! 333: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 334: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d020b3  ! 335: Tcc_I	ta	icc_or_xcc, %r0 + 179
DS_3_71:
	.word 0x34800001  ! 337: BG	bg,a	<label_0x1>
	pdist %f18, %f4, %f28
	.word 0x8fb4831b  ! 336: ALLIGNADDRESS	alignaddr	%r18, %r27, %r7
tagged_3_72:
	tsubcctv %r9, 0x1edb, %r8
	.word 0xd807e001  ! 337: LDUW_I	lduw	[%r31 + 0x0001], %r12
tagged_3_73:
	taddcctv %r17, 0x1f6f, %r22
	.word 0xd807e001  ! 338: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x879022d2  ! 339: WRPR_TT_I	wrpr	%r0, 0x02d2, %tt
	.word 0xb4d46001  ! 340: UMULcc_I	umulcc 	%r17, 0x0001, %r26
	.word 0x93902001  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
tagged_3_74:
	tsubcctv %r5, 0x1728, %r9
	.word 0xc407e001  ! 342: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x93902007  ! 343: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc48008a0  ! 344: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc48008a0  ! 345: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
tagged_3_75:
	taddcctv %r17, 0x1a56, %r16
	.word 0xc407e001  ! 346: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_3_76:
	.word 0x22800001  ! 348: BE	be,a	<label_0x1>
	.xword 0xd1da466e	! Random illegal ?
	.word 0xe5114006  ! 348: LDQF_R	-	[%r5, %r6], %f18
	.word 0xada60824  ! 347: FADDs	fadds	%f24, %f4, %f22
	.word 0x91d02032  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x99514000  ! 349: RDPR_TBA	<illegal instruction>
	.word 0x8d902d5a  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x0d5a, %pstate
	.word 0xd0c804a0  ! 351: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
DS_3_77:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 352: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd017e001  ! 353: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0x8d514000  ! 354: RDPR_TBA	<illegal instruction>
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x3e700001  ! 356: BPVC	<illegal instruction>
	.word 0x87902013  ! 357: WRPR_TT_I	wrpr	%r0, 0x0013, %tt
splash_lsu_3_78:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 358: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_3_79:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 359: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 360: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 361: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe647c000  ! 362: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x87902323  ! 363: WRPR_TT_I	wrpr	%r0, 0x0323, %tt
	.word 0x38800001  ! 364: BGU	bgu,a	<label_0x1>
	.word 0xe6900e40  ! 365: LDUHA_R	lduha	[%r0, %r0] 0x72, %r19
	.word 0x87802014  ! 366: WRASI_I	wr	%r0, 0x0014, %asi
splash_lsu_3_80:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 367: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x85540000  ! 368: RDPR_GL	<illegal instruction>
	.word 0xc8800ae0  ! 369: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r4
splash_lsu_3_81:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc81fc000  ! 371: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xa190200a  ! 372: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xc807c000  ! 373: LDUW_R	lduw	[%r31 + %r0], %r4
splash_lsu_3_82:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 374: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb7494000  ! 375: RDHPR_HTBA	rdhpr	%htba, %r27
	.word 0x81982f95  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f95, %hpstate
splash_lsu_3_83:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_3_84:
	tsubcctv %r8, 0x110d, %r19
	.word 0xc807e001  ! 379: LDUW_I	lduw	[%r31 + 0x0001], %r4
change_to_randtl_3_85:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 380: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x91d02032  ! 381: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc8d004a0  ! 382: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_tba_3_86:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 383: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_3_87:
	.word 0x32800001  ! 386: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 386: BG	bg,a	<label_0x1>
	.word 0xd710c017  ! 386: LDQF_R	-	[%r3, %r23], %f11
	.word 0x8fa2883a  ! 385: FADDs	fadds	%f10, %f26, %f7
	.word 0x9f802001  ! 386: SIR	sir	0x0001
splash_tba_3_88:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 387: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x3c700001  ! 388: BPPOS	<illegal instruction>
DS_3_89:
	.word 0x34800001  ! 390: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 389: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802010  ! 390: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xad508000  ! 391: RDPR_TSTATE	<illegal instruction>
	.word 0x20700001  ! 392: BPN	<illegal instruction>
splash_lsu_3_90:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780201c  ! 394: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xd48fe020  ! 395: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r10
	.word 0x8198285e  ! 396: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085e, %hpstate
	.word 0x32800001  ! 397: BNE	bne,a	<label_0x1>
tagged_3_91:
	taddcctv %r16, 0x1cbe, %r9
	.word 0xd407e001  ! 398: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d9034a7  ! 399: WRPR_PSTATE_I	wrpr	%r0, 0x14a7, %pstate
	.word 0x81982e5c  ! 400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5c, %hpstate
DS_3_92:
	.word 0x20800001  ! 402: BN	bn,a	<label_0x1>
	pdist %f2, %f0, %f10
	.word 0xb7b5830d  ! 401: ALLIGNADDRESS	alignaddr	%r22, %r13, %r27
	.word 0xec800b20  ! 402: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r22
	.word 0x93902001  ! 403: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_3_93:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 404: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902000  ! 405: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d9029d1  ! 406: WRPR_PSTATE_I	wrpr	%r0, 0x09d1, %pstate
	.word 0x8d90220f  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x020f, %pstate
tagged_3_94:
	tsubcctv %r18, 0x1ef2, %r25
	.word 0xec07e001  ! 408: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x83d020b3  ! 409: Tcc_I	te	icc_or_xcc, %r0 + 179
tagged_3_95:
	taddcctv %r23, 0x1b24, %r2
	.word 0xec07e001  ! 410: LDUW_I	lduw	[%r31 + 0x0001], %r22
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 411: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xecd004a0  ! 412: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r22
	.word 0x8790205d  ! 413: WRPR_TT_I	wrpr	%r0, 0x005d, %tt
tagged_3_96:
	tsubcctv %r2, 0x1076, %r5
	.word 0xec07e001  ! 414: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x93902006  ! 415: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93480000  ! 416: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x87902050  ! 417: WRPR_TT_I	wrpr	%r0, 0x0050, %tt
	.word 0xd64fe001  ! 418: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0xd68008a0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x93902004  ! 420: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8b50c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0x8f902002  ! 423: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89828003  ! 422: WRTICK_R	wr	%r10, %r3, %tick
	.word 0xc6dfe030  ! 423: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r3
	.word 0x83494000  ! 424: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0xb7a5c9f7  ! 425: FDIVq	dis not found

	.word 0x8d514000  ! 426: RDPR_TBA	<illegal instruction>
	.word 0x32700001  ! 427: BPNE	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee07c000  ! 429: LDUW_R	lduw	[%r31 + %r0], %r23
	.word 0x81982ade  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ade, %hpstate
	.word 0xa1902004  ! 431: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_lsu_3_98:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 432: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xee8008a0  ! 433: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
splash_tba_3_99:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 434: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x2a800001  ! 435: BCS	bcs,a	<label_0x1>
	.word 0x91d020b2  ! 436: Tcc_I	ta	icc_or_xcc, %r0 + 178
DS_3_100:
	.word 0x20800001  ! 438: BN	bn,a	<label_0x1>
	.word 0xd732e001  ! 438: STQF_I	-	%f11, [0x0001, %r11]
	normalw
	.word 0xa3458000  ! 437: RD_SOFTINT_REG	rd	%softint, %r17
tagged_3_101:
	taddcctv %r5, 0x1550, %r22
	.word 0xcc07e001  ! 438: LDUW_I	lduw	[%r31 + 0x0001], %r6
tagged_3_102:
	tsubcctv %r5, 0x17e6, %r6
	.word 0xcc07e001  ! 439: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x87802020  ! 440: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x879022ba  ! 441: WRPR_TT_I	wrpr	%r0, 0x02ba, %tt
	.word 0x81982e86  ! 442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e86, %hpstate
	.word 0x93902005  ! 443: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_3_103:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 444: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 445: BPN	<illegal instruction>
splash_lsu_3_104:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 446: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc800c00  ! 447: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r6
splash_lsu_3_105:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 448: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_3_106:
	tsubcctv %r7, 0x1230, %r10
	.word 0xcc07e001  ! 449: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc9fc020  ! 450: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x81982e1e  ! 451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1e, %hpstate
	.word 0xccdfe000  ! 452: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
	.word 0x93902002  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
tagged_3_107:
	taddcctv %r7, 0x176b, %r9
	.word 0xcc07e001  ! 454: LDUW_I	lduw	[%r31 + 0x0001], %r6
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 455: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 456: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xccc7e010  ! 457: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r6
	.word 0x87802063  ! 458: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x91d020b2  ! 459: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8198260d  ! 460: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060d, %hpstate
	.word 0x81982f57  ! 461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f57, %hpstate
splash_lsu_3_108:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 462: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc8008a0  ! 463: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xa1500000  ! 464: RDPR_TPC	<illegal instruction>
	.word 0x93d02035  ! 465: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8d903997  ! 466: WRPR_PSTATE_I	wrpr	%r0, 0x1997, %pstate
	.word 0xc717c000  ! 467: LDQF_R	-	[%r31, %r0], %f3
	.word 0xa190200c  ! 468: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902002  ! 469: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902003  ! 470: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93464000  ! 471: RD_STICK_CMPR_REG	rd	%-, %r9
	.word 0x87802058  ! 472: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd8c004a0  ! 473: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
splash_tba_3_109:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 474: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd88008a0  ! 475: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_3_110:
	.word 0x34800001  ! 477: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 476: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa190200a  ! 477: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xa1902005  ! 478: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_tba_3_111:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 479: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200f  ! 480: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87802080  ! 481: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xd88008a0  ! 482: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x2e800001  ! 483: BVS	bvs,a	<label_0x1>
splash_lsu_3_112:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 484: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8800c20  ! 485: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r12
	.word 0x93902003  ! 486: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d903cbb  ! 487: WRPR_PSTATE_I	wrpr	%r0, 0x1cbb, %pstate
splash_tba_3_113:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902001  ! 489: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd8c804a0  ! 490: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd89fe001  ! 491: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x81a01a6d  ! 492: FqTOi	fqtoi	
tagged_3_114:
	tsubcctv %r6, 0x109a, %r9
	.word 0xf607e001  ! 493: LDUW_I	lduw	[%r31 + 0x0001], %r27
DS_3_115:
	.word 0x32800001  ! 495: BNE	bne,a	<label_0x1>
	pdist %f8, %f12, %f14
	.word 0xb7b1c301  ! 494: ALLIGNADDRESS	alignaddr	%r7, %r1, %r27
	.word 0xda57e001  ! 495: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0x87802088  ! 496: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87802063  ! 497: WRASI_I	wr	%r0, 0x0063, %asi
splash_lsu_3_116:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 498: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 499: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xda9fe001  ! 500: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xdadfe030  ! 501: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
DS_3_117:
	.word 0x20800001  ! 503: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 502: SAVE_R	save	%r31, %r0, %r31
tagged_3_118:
	tsubcctv %r19, 0x1dc3, %r4
	.word 0xda07e001  ! 503: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdad7e000  ! 504: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 505: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb5500000  ! 506: RDPR_TPC	<illegal instruction>
DS_3_119:
	.word 0x20800001  ! 508: BN	bn,a	<label_0x1>
	pdist %f30, %f18, %f16
	.word 0x99b0830d  ! 507: ALLIGNADDRESS	alignaddr	%r2, %r13, %r12
DS_3_120:
	.word 0x32800001  ! 509: BNE	bne,a	<label_0x1>
	.xword 0xd37965c0	! Random illegal ?
	.word 0xeb168007  ! 509: LDQF_R	-	[%r26, %r7], %f21
	.word 0xb1a60823  ! 508: FADDs	fadds	%f24, %f3, %f24
tagged_3_121:
	taddcctv %r18, 0x1465, %r1
	.word 0xc807e001  ! 509: LDUW_I	lduw	[%r31 + 0x0001], %r4
splash_tba_3_122:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 510: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200c  ! 511: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87902120  ! 512: WRPR_TT_I	wrpr	%r0, 0x0120, %tt
	.word 0xc817e001  ! 513: LDUH_I	lduh	[%r31 + 0x0001], %r4
	.word 0x879021c2  ! 514: WRPR_TT_I	wrpr	%r0, 0x01c2, %tt
	.word 0xaf50c000  ! 515: RDPR_TT	<illegal instruction>
	.word 0xb3508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0x22700001  ! 517: BPE	<illegal instruction>
change_to_randtl_3_123:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 518: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa1902004  ! 519: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd8800b60  ! 520: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r12
	.word 0x81982615  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0615, %hpstate
	.word 0x91480000  ! 522: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x93d02032  ! 523: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x819820cd  ! 524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00cd, %hpstate
	.word 0xaf504000  ! 525: RDPR_TNPC	rdpr	%tnpc, %r23
splash_htba_3_124:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 526: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe44fc000  ! 527: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe44fe001  ! 528: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02033  ! 530: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe4d7e030  ! 531: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r18
tagged_3_125:
	taddcctv %r4, 0x1bfc, %r24
	.word 0xe407e001  ! 532: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x87902081  ! 533: WRPR_TT_I	wrpr	%r0, 0x0081, %tt
	.word 0xe4bfc037  ! 534: STDA_R	stda	%r18, [%r31 + %r23] 0x01
	.word 0xe40fe001  ! 535: LDUB_I	ldub	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe527e001  ! 537: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe527e001  ! 538: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe4d7e000  ! 539: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
	.word 0x8198275d  ! 540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075d, %hpstate
tagged_3_126:
	tsubcctv %r6, 0x19cc, %r1
	.word 0xe407e001  ! 541: LDUW_I	lduw	[%r31 + 0x0001], %r18
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 542: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_3_127:
	taddcctv %r16, 0x1707, %r21
	.word 0xe407e001  ! 543: LDUW_I	lduw	[%r31 + 0x0001], %r18
splash_tba_3_128:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 544: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 545: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe45fe001  ! 546: LDX_I	ldx	[%r31 + 0x0001], %r18
	.word 0xe497e030  ! 547: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r18
	.word 0xe407c000  ! 548: LDUW_R	lduw	[%r31 + %r0], %r18
DS_3_129:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 549: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xe48008a0  ! 550: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe417c000  ! 551: LDUH_R	lduh	[%r31 + %r0], %r18
	.word 0x91d02032  ! 552: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9f802001  ! 553: SIR	sir	0x0001
	.word 0xe49fe001  ! 554: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
DS_3_130:
	.word 0x34800001  ! 556: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 555: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x30700001  ! 556: BPA	<illegal instruction>
	.word 0x87802089  ! 557: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802004  ! 558: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe4c80e40  ! 559: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r18
	.word 0xe44fe001  ! 560: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	.word 0x93d02035  ! 561: Tcc_I	tne	icc_or_xcc, %r0 + 53
splash_lsu_3_131:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 562: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe4800b60  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r18
	.word 0x879021e3  ! 564: WRPR_TT_I	wrpr	%r0, 0x01e3, %tt
	.word 0x81982bdc  ! 565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdc, %hpstate
splash_lsu_3_132:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 566: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe42fe001  ! 567: STB_I	stb	%r18, [%r31 + 0x0001]
	.word 0xa190200d  ! 568: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87902145  ! 569: WRPR_TT_I	wrpr	%r0, 0x0145, %tt
	.word 0xe4d00e40  ! 570: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r18
	.word 0x83d02034  ! 571: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xe48804a0  ! 572: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 573: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_3_133:
	.word 0x20800001  ! 575: BN	bn,a	<label_0x1>
	.word 0xd5318008  ! 575: STQF_R	-	%f10, [%r8, %r6]
	normalw
	.word 0x87458000  ! 574: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x87902090  ! 575: WRPR_TT_I	wrpr	%r0, 0x0090, %tt
	.word 0xf217c000  ! 576: LDUH_R	lduh	[%r31 + %r0], %r25
	.word 0xf28008a0  ! 577: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8f902000  ! 579: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x816da001  ! 578: SDIVX_I	sdivx	%r22, 0x0001, %r0
	.word 0x91d020b4  ! 579: Tcc_I	ta	icc_or_xcc, %r0 + 180
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802080  ! 581: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8790214f  ! 582: WRPR_TT_I	wrpr	%r0, 0x014f, %tt
	.word 0x93902004  ! 583: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xe2900e80  ! 584: LDUHA_R	lduha	[%r0, %r0] 0x74, %r17
	.word 0x87802055  ! 585: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xe28804a0  ! 586: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x87802080  ! 587: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d90345e  ! 588: WRPR_PSTATE_I	wrpr	%r0, 0x145e, %pstate
	.word 0x81982985  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0985, %hpstate
splash_lsu_3_135:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 590: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe21fe001  ! 591: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0xe28fe030  ! 592: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r17
tagged_3_136:
	tsubcctv %r5, 0x1977, %r2
	.word 0xe207e001  ! 593: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe21fe001  ! 594: LDD_I	ldd	[%r31 + 0x0001], %r17
splash_tba_3_137:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 595: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d903861  ! 596: WRPR_PSTATE_I	wrpr	%r0, 0x1861, %pstate
	.word 0xa1902005  ! 597: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 598: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x819826c5  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c5, %hpstate
	.word 0x93902006  ! 600: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe297e020  ! 601: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
	.word 0x8d90376b  ! 602: WRPR_PSTATE_I	wrpr	%r0, 0x176b, %pstate
splash_tba_3_138:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 603: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 604: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe28fe020  ! 605: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r17
	.word 0x87802063  ! 606: WRASI_I	wr	%r0, 0x0063, %asi
change_to_randtl_3_139:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 607: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe28008a0  ! 608: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
DS_3_140:
	.word 0x32800001  ! 610: BNE	bne,a	<label_0x1>
	.xword 0xc546446f	! Random illegal ?
	.word 0x8da00542  ! 610: FSQRTd	fsqrt	
	.word 0xa3a1483a  ! 609: FADDs	fadds	%f5, %f26, %f17
	.word 0x87802055  ! 610: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8d903cdc  ! 611: WRPR_PSTATE_I	wrpr	%r0, 0x1cdc, %pstate
	.word 0x87902153  ! 612: WRPR_TT_I	wrpr	%r0, 0x0153, %tt
splash_tba_3_141:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 613: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0d004a0  ! 614: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r24
splash_htba_3_142:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 615: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_3_143:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 616: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_3_144:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 617: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902002  ! 618: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902003  ! 619: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d90360c  ! 620: WRPR_PSTATE_I	wrpr	%r0, 0x160c, %pstate
	ta	T_CHANGE_HPRIV	! macro
splash_tba_3_145:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 622: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x9b514000  ! 623: RDPR_TBA	rdpr	%tba, %r13
tagged_3_146:
	tsubcctv %r20, 0x1f35, %r18
	.word 0xd207e001  ! 624: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x87802014  ! 625: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8b480000  ! 626: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x87902284  ! 627: WRPR_TT_I	wrpr	%r0, 0x0284, %tt
tagged_3_147:
	taddcctv %r13, 0x1c95, %r7
	.word 0xca07e001  ! 628: LDUW_I	lduw	[%r31 + 0x0001], %r5
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 629: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xca47c000  ! 630: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0x91d02034  ! 631: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d90228d  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x028d, %pstate
	.word 0x91d02032  ! 633: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93d02035  ! 634: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8780201c  ! 635: WRASI_I	wr	%r0, 0x001c, %asi
tagged_3_148:
	tsubcctv %r25, 0x1cbc, %r22
	.word 0xca07e001  ! 636: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x26800001  ! 637: BL	bl,a	<label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 638: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 640: SIR	sir	0x0001
	.word 0x36700001  ! 641: BPGE	<illegal instruction>
	.word 0x8d9039c5  ! 642: WRPR_PSTATE_I	wrpr	%r0, 0x19c5, %pstate
	.word 0xca800a80  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r5
splash_lsu_3_149:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 644: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb751c000  ! 645: RDPR_TL	<illegal instruction>
splash_lsu_3_150:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 646: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903be5  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x1be5, %pstate
DS_3_151:
	.word 0x22800001  ! 649: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 648: SAVE_R	save	%r31, %r0, %r31
DS_3_152:
	.word 0x32800001  ! 650: BNE	bne,a	<label_0x1>
	.xword 0xa97a3e28	! Random illegal ?
	.word 0xd111400a  ! 650: LDQF_R	-	[%r5, %r10], %f8
	.word 0x95a18821  ! 649: FADDs	fadds	%f6, %f1, %f10
	.word 0x8f902002  ! 651: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1864014  ! 650: WR_STICK_REG_R	wr	%r25, %r20, %-
	.word 0xd997e001  ! 651: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0xd89fe001  ! 652: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x9f802001  ! 653: SIR	sir	0x0001
	.word 0xd81fc000  ! 654: LDD_R	ldd	[%r31 + %r0], %r12
tagged_3_154:
	tsubcctv %r6, 0x116f, %r19
	.word 0xd807e001  ! 655: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8790212c  ! 656: WRPR_TT_I	wrpr	%r0, 0x012c, %tt
splash_tba_3_155:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 657: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_3_156:
	.word 0x32800001  ! 659: BNE	bne,a	<label_0x1>
	.word 0xcf31a001  ! 659: STQF_I	-	%f7, [0x0001, %r6]
	normalw
	.word 0xa5458000  ! 658: RD_SOFTINT_REG	rd	%softint, %r18
	.word 0xce4fc000  ! 659: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0x8d902b8c  ! 660: WRPR_PSTATE_I	wrpr	%r0, 0x0b8c, %pstate
	.word 0x34800001  ! 661: BG	bg,a	<label_0x1>
	.word 0x8d9038d9  ! 662: WRPR_PSTATE_I	wrpr	%r0, 0x18d9, %pstate
DS_3_157:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 663: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x81982554  ! 664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0554, %hpstate
tagged_3_158:
	tsubcctv %r6, 0x185f, %r15
	.word 0xce07e001  ! 665: LDUW_I	lduw	[%r31 + 0x0001], %r7
DS_3_159:
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0xb7a00542  ! 667: FSQRTd	fsqrt	
	.word 0x89a28830  ! 666: FADDs	fadds	%f10, %f16, %f4
	.word 0xe49fe001  ! 667: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0x93902000  ! 668: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d802004  ! 669: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xe48008a0  ! 671: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x99902001  ! 672: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xa1902000  ! 673: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xab45c000  ! 674: RD_TICK_CMPR_REG	rd	%-, %r21
	.word 0xecdfe010  ! 675: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r22
tagged_3_160:
	tsubcctv %r24, 0x1038, %r25
	.word 0xec07e001  ! 676: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0xed17c000  ! 677: LDQF_R	-	[%r31, %r0], %f22
	.word 0x93a44dd5  ! 678: FdMULq	fdmulq	
	.word 0x89500000  ! 679: RDPR_TPC	<illegal instruction>
	.word 0xa190200b  ! 680: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x819822c6  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c6, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 682: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_3_161:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 683: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc4c7e020  ! 684: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	.word 0x87802063  ! 685: WRASI_I	wr	%r0, 0x0063, %asi
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc4c7e010  ! 687: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0xc48804a0  ! 688: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc49fc020  ! 689: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x81460000  ! 691: RD_STICK_REG	stbar
	.word 0x87902055  ! 692: WRPR_TT_I	wrpr	%r0, 0x0055, %tt
	.word 0xc4d804a0  ! 693: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0x8d902aed  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x0aed, %pstate
	.word 0xa1902009  ! 695: WRPR_GL_I	wrpr	%r0, 0x0009, %-
DS_3_162:
	.word 0x22800001  ! 697: BE	be,a	<label_0x1>
	.word 0xf3342001  ! 697: STQF_I	-	%f25, [0x0001, %r16]
	normalw
	.word 0xa1458000  ! 696: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x99902001  ! 697: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_tba_3_163:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 698: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc28008a0  ! 699: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc317c000  ! 700: LDQF_R	-	[%r31, %r0], %f1
tagged_3_164:
	tsubcctv %r19, 0x1d49, %r22
	.word 0xc207e001  ! 701: LDUW_I	lduw	[%r31 + 0x0001], %r1
tagged_3_165:
	taddcctv %r11, 0x11f8, %r23
	.word 0xc207e001  ! 702: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc2800bc0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc29fe001  ! 705: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x87802010  ! 706: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x81982f96  ! 707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f96, %hpstate
	.word 0x97480000  ! 708: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0xf08804a0  ! 709: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x93d02035  ! 710: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x87902280  ! 711: WRPR_TT_I	wrpr	%r0, 0x0280, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902006  ! 713: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d903082  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x1082, %pstate
	.word 0xf08fe030  ! 715: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r24
splash_tba_3_166:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0900e60  ! 717: LDUHA_R	lduha	[%r0, %r0] 0x73, %r24
	.word 0xa1902000  ! 718: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 719: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 721: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9035bf  ! 722: WRPR_PSTATE_I	wrpr	%r0, 0x15bf, %pstate
tagged_3_167:
	taddcctv %r14, 0x156d, %r22
	.word 0xf007e001  ! 723: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0xf08804a0  ! 724: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0xf02fc009  ! 725: STB_R	stb	%r24, [%r31 + %r9]
	.word 0x8790237f  ! 726: WRPR_TT_I	wrpr	%r0, 0x037f, %tt
	.word 0xf08804a0  ! 727: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x87802020  ! 728: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x81982106  ! 729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0106, %hpstate
	.word 0xf08008a0  ! 730: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x2c700001  ! 731: BPNEG	<illegal instruction>
	.word 0x93902006  ! 732: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02033  ! 733: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902000  ! 734: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x32700001  ! 735: BPNE	<illegal instruction>
	.word 0x87802014  ! 736: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xf01fc000  ! 737: LDD_R	ldd	[%r31 + %r0], %r24
	.word 0x93902004  ! 738: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_3_168:
	.word 0x22800001  ! 740: BE	be,a	<label_0x1>
	allclean
	.word 0xa1b34305  ! 739: ALLIGNADDRESS	alignaddr	%r13, %r5, %r16
	.word 0x83d02032  ! 740: Tcc_I	te	icc_or_xcc, %r0 + 50
DS_3_169:
	.word 0x34800001  ! 742: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 741: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802000  ! 742: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 743: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 744: BPE	<illegal instruction>
	.word 0xc407c000  ! 745: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x93902002  ! 746: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x3a700001  ! 747: BPCC	<illegal instruction>
	.word 0x819829d7  ! 748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d7, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 749: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93500000  ! 750: RDPR_TPC	rdpr	%tpc, %r9
splash_htba_3_170:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 751: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcc1fc000  ! 752: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x93902005  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902000  ! 754: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_3_171:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 755: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902005  ! 756: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_3_172:
	.word 0x22800001  ! 758: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 757: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fc000  ! 758: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0xcc8008a0  ! 759: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xa1902008  ! 760: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xcc4fc000  ! 761: LDSB_R	ldsb	[%r31 + %r0], %r6
DS_3_173:
	.word 0x22800001  ! 763: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 762: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fe001  ! 763: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x8198231f  ! 764: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031f, %hpstate
splash_tba_3_174:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 765: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcd97e001  ! 766: LDQFA_I	-	[%r31, 0x0001], %f6
	.word 0x9b504000  ! 767: RDPR_TNPC	rdpr	%tnpc, %r13
	.word 0x91540000  ! 768: RDPR_GL	<illegal instruction>
splash_lsu_3_175:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 769: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 770: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xad6a0009  ! 771: SDIVX_R	sdivx	%r8, %r9, %r22
	.word 0xa9508000  ! 772: RDPR_TSTATE	<illegal instruction>
	.word 0x8d903005  ! 773: WRPR_PSTATE_I	wrpr	%r0, 0x1005, %pstate
	.word 0x3e800001  ! 774: BVC	bvc,a	<label_0x1>
	.word 0xc2d004a0  ! 775: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x93902004  ! 776: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87802004  ! 777: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d903ea9  ! 778: WRPR_PSTATE_I	wrpr	%r0, 0x1ea9, %pstate
	.word 0x83d020b2  ! 779: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xc217c000  ! 780: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x879021ee  ! 781: WRPR_TT_I	wrpr	%r0, 0x01ee, %tt
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 782: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81514000  ! 783: RDPR_TBA	<illegal instruction>
splash_lsu_3_176:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 784: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02035  ! 785: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x93902003  ! 786: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81480000  ! 787: RDHPR_HPSTATE	rdhpr	%hpstate, %r0
	.word 0xce17c000  ! 788: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0xcec7e000  ! 789: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r7
DS_3_177:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 790: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x9f802001  ! 791: SIR	sir	0x0001
	.word 0x879023b5  ! 792: WRPR_TT_I	wrpr	%r0, 0x03b5, %tt
splash_tba_3_178:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce8008a0  ! 794: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xcedfe010  ! 795: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r7
	.word 0x9f802001  ! 796: SIR	sir	0x0001
	otherw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 797: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xce1fc000  ! 798: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0xce4fc000  ! 799: LDSB_R	ldsb	[%r31 + %r0], %r7
tagged_3_179:
	taddcctv %r12, 0x1c73, %r21
	.word 0xce07e001  ! 800: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x8780201c  ! 801: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xa1902005  ! 802: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xce800a80  ! 803: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r7
	.word 0x93d020b3  ! 804: Tcc_I	tne	icc_or_xcc, %r0 + 179
splash_tba_3_180:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 805: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_3_181:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 806: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 807: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d90229b  ! 808: WRPR_PSTATE_I	wrpr	%r0, 0x029b, %pstate
	.word 0x2e700001  ! 809: BPVS	<illegal instruction>
	.word 0xced7e010  ! 810: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r7
	.word 0x8790235d  ! 811: WRPR_TT_I	wrpr	%r0, 0x035d, %tt
splash_lsu_3_182:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 812: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 813: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x38800001  ! 814: BGU	bgu,a	<label_0x1>
splash_lsu_3_183:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 815: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 816: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa1902003  ! 817: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_lsu_3_184:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 818: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcec004a0  ! 819: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xa190200c  ! 820: WRPR_GL_I	wrpr	%r0, 0x000c, %-
splash_htba_3_185:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 821: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902003  ! 822: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xce8008a0  ! 823: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xa1902000  ! 824: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_3_186:
	.word 0x34800001  ! 826: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 825: SAVE_R	save	%r31, %r0, %r31
	.word 0x83a689d2  ! 826: FDIVd	fdivd	%f26, %f18, %f32
	.word 0x8f902002  ! 828: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89a01965  ! 827: FqTOd	dis not found

	.word 0xd647e001  ! 828: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x879020f6  ! 829: WRPR_TT_I	wrpr	%r0, 0x00f6, %tt
	.word 0x8f902001  ! 831: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81a01971  ! 830: FqTOd	dis not found

splash_lsu_3_189:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 831: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9022a3  ! 832: WRPR_PSTATE_I	wrpr	%r0, 0x02a3, %pstate
	.word 0x89500000  ! 833: RDPR_TPC	<illegal instruction>
	.word 0x93902005  ! 834: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_3_190:
	.word 0x32800001  ! 836: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 835: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_3_191:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 837: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xd01fe001  ! 838: LDD_I	ldd	[%r31 + 0x0001], %r8
splash_tba_3_192:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 839: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd04fe001  ! 840: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0x95a1cdc0  ! 841: FdMULq	fdmulq	
	.word 0x87802004  ! 842: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8f902000  ! 844: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x85682001  ! 843: SDIVX_I	sdivx	%r0, 0x0001, %r2
	.word 0xd41fe001  ! 844: LDD_I	ldd	[%r31 + 0x0001], %r10
splash_cmpr_3_194:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb185e001  ! 845: WR_STICK_REG_I	wr	%r23, 0x0001, %-
	.word 0x93902007  ! 846: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8198218f  ! 847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018f, %hpstate
tagged_3_195:
	taddcctv %r9, 0x149c, %r4
	.word 0xd407e001  ! 848: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4800be0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r10
	.word 0xd4cfe030  ! 850: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
	.word 0x30800001  ! 851: BA	ba,a	<label_0x1>
change_to_randtl_3_196:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 852: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8780204f  ! 853: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x9f802001  ! 854: SIR	sir	0x0001
	.word 0x81982b87  ! 855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b87, %hpstate
DS_3_197:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 856: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x87802010  ! 857: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xa1902001  ! 858: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xd41fe001  ! 859: LDD_I	ldd	[%r31 + 0x0001], %r10
tagged_3_198:
	tsubcctv %r20, 0x13bd, %r8
	.word 0xd407e001  ! 860: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_tba_3_199:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 861: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802020  ! 862: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x879021b3  ! 863: WRPR_TT_I	wrpr	%r0, 0x01b3, %tt
	.word 0x95480000  ! 864: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0xccdfe020  ! 865: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
	.word 0xcc8008a0  ! 866: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc1fe001  ! 868: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x81982505  ! 869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0505, %hpstate
	.word 0x93902007  ! 870: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xccdfe030  ! 871: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
tagged_3_200:
	tsubcctv %r7, 0x1758, %r26
	.word 0xcc07e001  ! 872: LDUW_I	lduw	[%r31 + 0x0001], %r6
splash_tba_3_201:
	ta T_CHANGE_PRIV
	set 0x003d0000, %r2
	.word 0x8b900002  ! 873: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802010  ! 874: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc0fc000  ! 876: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x87802014  ! 877: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8790214a  ! 878: WRPR_TT_I	wrpr	%r0, 0x014a, %tt
	.word 0xccd7e010  ! 879: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc9004a0  ! 881: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
splash_lsu_3_202:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 882: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 883: Tcc_I	ta	icc_or_xcc, %r0 + 180
splash_tba_3_203:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 884: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc800aa0  ! 885: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r6
DS_3_204:
	.word 0x22800001  ! 887: BE	be,a	<label_0x1>
	.word 0xc731801b  ! 887: STQF_R	-	%f3, [%r27, %r6]
	normalw
	.word 0x81458000  ! 886: RD_SOFTINT_REG	stbar
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 887: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xf28008a0  ! 888: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
DS_3_205:
	.word 0x34800001  ! 890: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 889: RESTORE_R	restore	%r31, %r0, %r31
splash_htba_3_206:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 890: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xf2d804a0  ! 891: LDXA_R	ldxa	[%r0, %r0] 0x25, %r25
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 892: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2c7e000  ! 893: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r25
DS_3_207:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 894: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xf2880e80  ! 895: LDUBA_R	lduba	[%r0, %r0] 0x74, %r25
	.word 0x81982315  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0315, %hpstate
	.word 0xf217e001  ! 897: LDUH_I	lduh	[%r31 + 0x0001], %r25
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 898: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 899: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xf2800b80  ! 900: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r25
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 901: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf217c000  ! 902: LDUH_R	lduh	[%r31 + %r0], %r25
change_to_randtl_3_208:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 903: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x32800001  ! 904: BNE	bne,a	<label_0x1>
	.word 0xa1902004  ! 905: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87802058  ! 906: WRASI_I	wr	%r0, 0x0058, %asi
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 907: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2800c20  ! 908: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r25
	.word 0x87802014  ! 909: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xf317c000  ! 910: LDQF_R	-	[%r31, %r0], %f25
	.word 0xa1902005  ! 911: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x93902004  ! 912: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8780201c  ! 913: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xf28fe020  ! 914: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r25
	.word 0x8d903832  ! 915: WRPR_PSTATE_I	wrpr	%r0, 0x1832, %pstate
	.word 0xf28008a0  ! 916: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8f902000  ! 918: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa16da001  ! 917: SDIVX_I	sdivx	%r22, 0x0001, %r16
splash_lsu_3_210:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 918: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb3464000  ! 919: RD_STICK_CMPR_REG	rd	%-, %r25
	.word 0xa190200b  ! 920: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8198250e  ! 921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x050e, %hpstate
	.word 0xd68008a0  ! 922: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x93902001  ! 923: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
tagged_3_211:
	taddcctv %r2, 0x1472, %r1
	.word 0xd607e001  ! 924: LDUW_I	lduw	[%r31 + 0x0001], %r11
DS_3_212:
	.word 0x22800001  ! 926: BE	be,a	<label_0x1>
	pdist %f8, %f20, %f2
	.word 0x89b28318  ! 925: ALLIGNADDRESS	alignaddr	%r10, %r24, %r4
	.word 0x8d9034fc  ! 926: WRPR_PSTATE_I	wrpr	%r0, 0x14fc, %pstate
tagged_3_213:
	taddcctv %r11, 0x16b7, %r23
	.word 0xc607e001  ! 927: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc607c000  ! 928: LDUW_R	lduw	[%r31 + %r0], %r3
splash_tba_3_214:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 929: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68fe000  ! 930: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r3
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 931: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802088  ! 933: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902002  ! 934: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc73fc002  ! 935: STDF_R	std	%f3, [%r2, %r31]
	.word 0xc6d804a0  ! 936: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 937: LDQF_R	-	[%r31, %r0], %f3
tagged_3_215:
	taddcctv %r22, 0x14d9, %r3
	.word 0xc607e001  ! 938: LDUW_I	lduw	[%r31 + 0x0001], %r3
DS_3_216:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 939: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_tba_3_217:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 940: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_3_218:
	.word 0x22800001  ! 942: BE	be,a	<label_0x1>
	.xword 0xbd641e28	! Random illegal ?
	.word 0xc716c019  ! 942: LDQF_R	-	[%r27, %r25], %f3
	.word 0x95a1482a  ! 941: FADDs	fadds	%f5, %f10, %f10
	.word 0x93902007  ! 942: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902b66  ! 943: WRPR_PSTATE_I	wrpr	%r0, 0x0b66, %pstate
	.word 0x8d903135  ! 944: WRPR_PSTATE_I	wrpr	%r0, 0x1135, %pstate
	.word 0x87802020  ! 945: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xc4880e80  ! 946: LDUBA_R	lduba	[%r0, %r0] 0x74, %r2
	.word 0xc49fc020  ! 947: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x93d02033  ! 948: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x93902003  ! 949: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc517c000  ! 951: LDQF_R	-	[%r31, %r0], %f2
	.word 0x24700001  ! 952: BPLE	<illegal instruction>
	.word 0x8f902000  ! 954: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb181c014  ! 953: WR_STICK_REG_R	wr	%r7, %r20, %-
	.word 0x81982707  ! 954: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0707, %hpstate
	.word 0xc417c000  ! 955: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x93902006  ! 956: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902009  ! 957: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x81982a5c  ! 958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a5c, %hpstate
	.word 0x93902001  ! 959: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc48804a0  ! 960: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc48008a0  ! 961: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xa1902000  ! 962: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x9b494000  ! 963: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0xc4d7e020  ! 964: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r2
	.word 0x93902002  ! 965: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_3_220:
	.word 0x32800001  ! 967: BNE	bne,a	<label_0x1>
	.word 0xcf324002  ! 967: STQF_R	-	%f7, [%r2, %r9]
	normalw
	.word 0x97458000  ! 966: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xa1902003  ! 967: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_lsu_3_221:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 969: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x28800001  ! 970: BLEU	bleu,a	<label_0x1>
splash_lsu_3_222:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 971: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 972: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_3_223:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 974: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1826001  ! 973: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0x83d020b5  ! 974: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0xd4d00e40  ! 975: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r10
tagged_3_224:
	tsubcctv %r21, 0x18d4, %r19
	.word 0xd407e001  ! 976: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4c004a0  ! 977: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x93902007  ! 978: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99902003  ! 979: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x8d902c37  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x0c37, %pstate
	.word 0x93902000  ! 981: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93d02035  ! 982: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x22700001  ! 983: BPE	<illegal instruction>
	.word 0x93902007  ! 984: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 985: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 986: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 987: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd497e020  ! 988: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0xd4dfe000  ! 989: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x91d020b5  ! 990: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x34800001  ! 991: BG	bg,a	<label_0x1>
	.word 0xa1902003  ! 992: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd48008a0  ! 993: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd597e001  ! 994: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x91d02034  ! 995: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_htba_3_225:
	ta T_CHANGE_HPRIV
	set 0x00390000, %r2
	.word 0x8b980002  ! 996: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902006  ! 997: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_3_226:
	.word 0x22800001  ! 999: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 998: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_3_227:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_3:
	.word 0x91d020b3  ! 1: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x93d02033  ! 2: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa1902005  ! 3: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_lsu_2_0:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 4: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xaf514000  ! 5: RDPR_TBA	<illegal instruction>
tagged_2_1:
	taddcctv %r15, 0x1b82, %r13
	.word 0xcc07e001  ! 6: LDUW_I	lduw	[%r31 + 0x0001], %r6
DS_2_2:
	.word 0x22800001  ! 8: BE	be,a	<label_0x1>
	pdist %f20, %f26, %f18
	.word 0xb3b24305  ! 7: ALLIGNADDRESS	alignaddr	%r9, %r5, %r25
	.word 0x87514000  ! 8: RDPR_TBA	<illegal instruction>
tagged_2_3:
	taddcctv %r16, 0x1743, %r5
	.word 0xc807e001  ! 9: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc81fe001  ! 10: LDD_I	ldd	[%r31 + 0x0001], %r4
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 11: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc8c7e020  ! 12: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	.word 0xc917c000  ! 13: LDQF_R	-	[%r31, %r0], %f4
	.word 0xc89fe001  ! 14: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902005  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xc807c000  ! 17: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0x8d802000  ! 18: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa145c000  ! 19: RD_TICK_CMPR_REG	rd	%-, %r16
	.word 0x93d02033  ! 20: Tcc_I	tne	icc_or_xcc, %r0 + 51
DS_2_4:
	.word 0x32800001  ! 22: BNE	bne,a	<label_0x1>
	.word 0xc5314016  ! 22: STQF_R	-	%f2, [%r22, %r5]
	normalw
	.word 0xa1458000  ! 21: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x879021a1  ! 22: WRPR_TT_I	wrpr	%r0, 0x01a1, %tt
DS_2_5:
	.word 0x32800001  ! 24: BNE	bne,a	<label_0x1>
	.word 0xd736800d  ! 24: STQF_R	-	%f11, [%r13, %r26]
	normalw
	.word 0xaf458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r23
tagged_2_6:
	tsubcctv %r24, 0x15e1, %r5
	.word 0xd607e001  ! 24: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x879020cd  ! 25: WRPR_TT_I	wrpr	%r0, 0x00cd, %tt
splash_tba_2_7:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 26: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8198294c  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094c, %hpstate
splash_lsu_2_8:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd65fe001  ! 29: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d7e030  ! 30: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0xad50c000  ! 31: RDPR_TT	<illegal instruction>
	.word 0xda07c000  ! 32: LDUW_R	lduw	[%r31 + %r0], %r13
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 33: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x819827cd  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07cd, %hpstate
	.word 0xdad7e010  ! 36: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	.word 0xda47c000  ! 37: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0x81982e47  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e47, %hpstate
	.word 0x81464000  ! 39: RD_STICK_CMPR_REG	stbar
	.word 0x9b464000  ! 40: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x8d9037b6  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x17b6, %pstate
	.word 0x87802088  ! 42: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xa1902004  ! 43: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8790225c  ! 44: WRPR_TT_I	wrpr	%r0, 0x025c, %tt
DS_2_9:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
DS_2_10:
	.word 0x20800001  ! 47: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 46: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 47: BL	bl,a	<label_0x1>
DS_2_11:
	.word 0x22800001  ! 49: BE	be,a	<label_0x1>
	pdist %f24, %f18, %f24
	.word 0xa1b54307  ! 48: ALLIGNADDRESS	alignaddr	%r21, %r7, %r16
	.word 0xa190200d  ! 49: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xd65fe001  ! 50: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d804a0  ! 51: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0xd6800ac0  ! 52: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r11
	.word 0x879022ce  ! 53: WRPR_TT_I	wrpr	%r0, 0x02ce, %tt
splash_htba_2_12:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 54: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d90296a  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x096a, %pstate
	.word 0xd617e001  ! 56: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0x879020a4  ! 57: WRPR_TT_I	wrpr	%r0, 0x00a4, %tt
	.word 0xd6800b60  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r11
splash_tba_2_13:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879021be  ! 60: WRPR_TT_I	wrpr	%r0, 0x01be, %tt
	.word 0x91d02032  ! 61: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd68008a0  ! 62: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_2_14:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb184e001  ! 63: WR_STICK_REG_I	wr	%r19, 0x0001, %-
	.word 0xd6d7e000  ! 64: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r11
	.word 0x8d9023f9  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x03f9, %pstate
	.word 0x26700001  ! 66: BPL	<illegal instruction>
	.word 0xaf50c000  ! 67: RDPR_TT	<illegal instruction>
	.word 0x8d9025cb  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x05cb, %pstate
	.word 0x30800001  ! 69: BA	ba,a	<label_0x1>
splash_lsu_2_15:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 70: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902201  ! 71: WRPR_PSTATE_I	wrpr	%r0, 0x0201, %pstate
splash_lsu_2_16:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 72: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x83d02035  ! 73: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xe137c009  ! 74: STQF_R	-	%f16, [%r9, %r31]
	.word 0xe057c000  ! 75: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0x819826c7  ! 76: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c7, %hpstate
splash_tba_2_17:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 77: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802000  ! 78: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_htba_2_18:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_2_19:
	taddcctv %r10, 0x1d07, %r21
	.word 0xe007e001  ! 80: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8d902add  ! 81: WRPR_PSTATE_I	wrpr	%r0, 0x0add, %pstate
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 82: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 83: BNE	bne,a	<label_0x1>
	.word 0x91d020b3  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x87902368  ! 85: WRPR_TT_I	wrpr	%r0, 0x0368, %tt
	.word 0xe0d7e020  ! 86: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r16
	.word 0x8d504000  ! 87: RDPR_TNPC	<illegal instruction>
	.word 0x93d02033  ! 88: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x26700001  ! 89: BPL	<illegal instruction>
	.word 0x8d903ec8  ! 90: WRPR_PSTATE_I	wrpr	%r0, 0x1ec8, %pstate
	.word 0x9f802001  ! 91: SIR	sir	0x0001
	.word 0x91d020b5  ! 92: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8198215d  ! 93: WRHPR_HPSTATE_I	wrhpr	%r0, 0x015d, %hpstate
	.word 0xc24fc000  ! 94: LDSB_R	ldsb	[%r31 + %r0], %r1
DS_2_20:
	.word 0x32800001  ! 96: BNE	bne,a	<label_0x1>
	.xword 0xd14a396e	! Random illegal ?
	.word 0xd3134018  ! 96: LDQF_R	-	[%r13, %r24], %f9
	.word 0xafa30824  ! 95: FADDs	fadds	%f12, %f4, %f23
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 96: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_2_21:
	taddcctv %r17, 0x1949, %r10
	.word 0xc007e001  ! 97: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x2a800001  ! 98: BCS	bcs,a	<label_0x1>
	.word 0xc08804a0  ! 99: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0xa1902007  ! 100: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xc017c000  ! 101: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc03fe001  ! 102: STD_I	std	%r0, [%r31 + 0x0001]
	.word 0x93902003  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc0800ba0  ! 104: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r0
	.word 0x93902006  ! 105: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81460000  ! 106: RD_STICK_REG	stbar
	.word 0xc01fc000  ! 107: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x8198224c  ! 108: WRHPR_HPSTATE_I	wrhpr	%r0, 0x024c, %hpstate
	.word 0xc0c7e020  ! 109: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r0
	.word 0x8d902eea  ! 110: WRPR_PSTATE_I	wrpr	%r0, 0x0eea, %pstate
	.word 0x81500000  ! 111: RDPR_TPC	<illegal instruction>
	.word 0x9b500000  ! 112: RDPR_TPC	<illegal instruction>
splash_cmpr_2_22:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb185e001  ! 113: WR_STICK_REG_I	wr	%r23, 0x0001, %-
	.word 0xe097e030  ! 114: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
tagged_2_23:
	taddcctv %r16, 0x135f, %r24
	.word 0xe007e001  ! 115: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe0d7e030  ! 116: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
	.word 0x819827d6  ! 117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d6, %hpstate
	.word 0xe0d804a0  ! 118: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	ta	T_CHANGE_HPRIV	! macro
DS_2_24:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 120: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_tba_2_25:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 121: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0d804a0  ! 122: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	.word 0x9f802001  ! 123: SIR	sir	0x0001
	.word 0x8198291c  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x091c, %hpstate
	.word 0xe0dfe010  ! 125: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r16
	.word 0x879023df  ! 126: WRPR_TT_I	wrpr	%r0, 0x03df, %tt
	.word 0x87902263  ! 127: WRPR_TT_I	wrpr	%r0, 0x0263, %tt
	.word 0xe01fc000  ! 128: LDD_R	ldd	[%r31 + %r0], %r16
change_to_randtl_2_26:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 129: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x8d903097  ! 130: WRPR_PSTATE_I	wrpr	%r0, 0x1097, %pstate
splash_lsu_2_27:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902002  ! 133: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb183000b  ! 132: WR_STICK_REG_R	wr	%r12, %r11, %-
	.word 0x8198294e  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x094e, %hpstate
	.word 0xe08008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
change_to_randtl_2_29:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 135: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xe0800c80  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r16
	.word 0x93902000  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d903b8f  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x1b8f, %pstate
	.word 0xa0fb6001  ! 139: SDIVcc_I	sdivcc 	%r13, 0x0001, %r16
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 140: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902008  ! 141: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xca8008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x87802010  ! 143: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d903d78  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x1d78, %pstate
	.word 0x8d90266c  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x066c, %pstate
	.word 0xcad004a0  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
DS_2_30:
	.word 0x20800001  ! 148: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
DS_2_31:
	.word 0x20800001  ! 149: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 148: SAVE_R	save	%r31, %r0, %r31
	.word 0xca8008a0  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xca97e010  ! 150: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r5
	.word 0x8e6d0019  ! 151: UDIVX_R	udivx 	%r20, %r25, %r7
	.word 0xc84fe001  ! 152: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0xc8c804a0  ! 153: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
	.word 0xc89fe001  ! 154: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
splash_tba_2_32:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc827e001  ! 156: STW_I	stw	%r4, [%r31 + 0x0001]
	.word 0xc8d004a0  ! 157: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_lsu_2_33:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb5514000  ! 159: RDPR_TBA	<illegal instruction>
	.word 0xd737c018  ! 160: STQF_R	-	%f11, [%r24, %r31]
	.word 0xd61fc000  ! 161: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd6c7e010  ! 162: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r11
	.word 0xd6dfe010  ! 163: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0x9745c000  ! 164: RD_TICK_CMPR_REG	rd	%-, %r11
	.word 0xb1508000  ! 165: RDPR_TSTATE	<illegal instruction>
	.word 0xd89fe001  ! 166: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 167: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd89004a0  ! 169: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0x81982b55  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b55, %hpstate
	.word 0xd84fc000  ! 171: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x8198289f  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089f, %hpstate
	.word 0x8d9020a5  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x00a5, %pstate
	.word 0x9f802001  ! 174: SIR	sir	0x0001
DS_2_34:
	.word 0x34800001  ! 176: BG	bg,a	<label_0x1>
	pdist %f12, %f26, %f26
	.word 0x9bb30308  ! 175: ALLIGNADDRESS	alignaddr	%r12, %r8, %r13
DS_2_35:
	.word 0x32800001  ! 177: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 176: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_2_36:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 178: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 179: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d90366d  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x166d, %pstate
	.word 0x93902005  ! 181: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_2_37:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 182: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 183: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d903a39  ! 184: WRPR_PSTATE_I	wrpr	%r0, 0x1a39, %pstate
	.word 0x93d02035  ! 185: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xe2d004a0  ! 186: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r17
	.word 0x81982386  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0386, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 188: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d9032ce  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x12ce, %pstate
splash_tba_2_38:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 190: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902000  ! 191: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902009  ! 192: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d02033  ! 193: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8790227d  ! 194: WRPR_TT_I	wrpr	%r0, 0x027d, %tt
	.word 0x91d020b4  ! 195: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8151c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0x8d903769  ! 197: WRPR_PSTATE_I	wrpr	%r0, 0x1769, %pstate
	.word 0x93d02035  ! 198: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xd607c000  ! 199: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x93d02034  ! 200: Tcc_I	tne	icc_or_xcc, %r0 + 52
tagged_2_39:
	taddcctv %r21, 0x12d0, %r21
	.word 0xd607e001  ! 201: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x85508000  ! 202: RDPR_TSTATE	<illegal instruction>
	.word 0xc4880e60  ! 203: LDUBA_R	lduba	[%r0, %r0] 0x73, %r2
	.word 0xc48008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc48008a0  ! 205: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
change_to_randtl_2_40:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 206: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc48008a0  ! 207: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d02034  ! 209: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x91d020b5  ! 210: Tcc_I	ta	icc_or_xcc, %r0 + 181
	ta	T_CHANGE_PRIV	! macro
	.word 0x32800001  ! 212: BNE	bne,a	<label_0x1>
	.word 0x819820c7  ! 213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00c7, %hpstate
	.word 0xa190200f  ! 214: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_tba_2_41:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 215: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_2_42:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc4800bc0  ! 217: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r2
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 218: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 219: WRASI_I	wr	%r0, 0x0016, %asi
DS_2_43:
	.word 0x22800001  ! 221: BE	be,a	<label_0x1>
	.word 0xf3302001  ! 221: STQF_I	-	%f25, [0x0001, %r0]
	normalw
	.word 0x83458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r1
splash_lsu_2_44:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 221: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xeec804a0  ! 222: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r23
	.word 0x8350c000  ! 223: RDPR_TT	<illegal instruction>
	.word 0x8d802000  ! 224: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802063  ! 225: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xce800ae0  ! 226: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r7
	.word 0x87802055  ! 227: WRASI_I	wr	%r0, 0x0055, %asi
splash_tba_2_45:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 228: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x34700001  ! 229: BPG	<illegal instruction>
	.word 0x8d508000  ! 230: RDPR_TSTATE	<illegal instruction>
	.word 0x8790236a  ! 231: WRPR_TT_I	wrpr	%r0, 0x036a, %tt
tagged_2_46:
	tsubcctv %r26, 0x164c, %r14
	.word 0xe207e001  ! 232: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x87902166  ! 233: WRPR_TT_I	wrpr	%r0, 0x0166, %tt
	.word 0xe2800b60  ! 234: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r17
	.word 0xb4aa000a  ! 235: ANDNcc_R	andncc 	%r8, %r10, %r26
DS_2_47:
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 236: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982017  ! 237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0017, %hpstate
	.word 0x87802058  ! 238: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x87902118  ! 239: WRPR_TT_I	wrpr	%r0, 0x0118, %tt
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 240: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc61fe001  ! 241: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x2c800001  ! 242: BNEG	bneg,a	<label_0x1>
	.word 0xc6c7e010  ! 243: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
	.word 0x8d90350f  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x150f, %pstate
	.word 0x8d90368b  ! 245: WRPR_PSTATE_I	wrpr	%r0, 0x168b, %pstate
	.word 0x879020bc  ! 246: WRPR_TT_I	wrpr	%r0, 0x00bc, %tt
splash_lsu_2_48:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x28700001  ! 248: BPLEU	<illegal instruction>
	.word 0xc607c000  ! 249: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0xc68804a0  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 251: LDQF_R	-	[%r31, %r0], %f3
tagged_2_49:
	taddcctv %r14, 0x1005, %r4
	.word 0xc607e001  ! 252: LDUW_I	lduw	[%r31 + 0x0001], %r3
change_to_randtl_2_50:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 253: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xc68008a0  ! 254: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 255: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 256: SIR	sir	0x0001
change_to_randtl_2_51:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 257: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xc68008a0  ! 258: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc657c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r3
DS_2_52:
	.word 0x32800001  ! 261: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 260: SAVE_R	save	%r31, %r0, %r31
splash_lsu_2_53:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 262: BPN	<illegal instruction>
	.word 0x87802010  ! 263: WRASI_I	wr	%r0, 0x0010, %asi
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 264: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903520  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x1520, %pstate
	.word 0xc61fc000  ! 266: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xc61fc000  ! 267: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x8d802004  ! 268: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_2_54:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 269: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8d902c87  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x0c87, %pstate
	.word 0x81982a4d  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4d, %hpstate
	.word 0x8780204f  ! 272: WRASI_I	wr	%r0, 0x004f, %asi
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902190  ! 274: WRPR_TT_I	wrpr	%r0, 0x0190, %tt
	.word 0x81982fc6  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc6, %hpstate
	.word 0x87902089  ! 276: WRPR_TT_I	wrpr	%r0, 0x0089, %tt
	.word 0x91d02032  ! 277: Tcc_I	ta	icc_or_xcc, %r0 + 50
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 278: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc68008a0  ! 279: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x93902000  ! 280: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x879023df  ! 281: WRPR_TT_I	wrpr	%r0, 0x03df, %tt
splash_tba_2_55:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 282: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68008a0  ! 283: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc6c804a0  ! 284: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
splash_cmpr_2_56:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb180e001  ! 285: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x8d90319c  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x119c, %pstate
splash_htba_2_57:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 287: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902bcf  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0bcf, %pstate
	.word 0x34700001  ! 289: BPG	<illegal instruction>
splash_cmpr_2_58:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb1826001  ! 290: WR_STICK_REG_I	wr	%r9, 0x0001, %-
	.word 0x93902006  ! 291: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802055  ! 293: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x91d020b3  ! 294: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0xa1902001  ! 295: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x95a00569  ! 296: FSQRTq	fsqrt	
	.word 0x91d02032  ! 297: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_2_59:
	.word 0x20800001  ! 299: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 299: BG	bg,a	<label_0x1>
	.word 0x93a00546  ! 299: FSQRTd	fsqrt	
	.word 0x85a34821  ! 298: FADDs	fadds	%f13, %f1, %f2
	.word 0xc68008a0  ! 299: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0xc6880e40  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x72, %r3
splash_tba_2_60:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 301: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc647e001  ! 302: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x99902003  ! 303: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x93902000  ! 304: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 305: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_2_61:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93d020b5  ! 307: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xc68008a0  ! 308: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x819829ce  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09ce, %hpstate
splash_lsu_2_62:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc69004a0  ! 311: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x87802088  ! 312: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x91d020b4  ! 313: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8d9024a1  ! 314: WRPR_PSTATE_I	wrpr	%r0, 0x04a1, %pstate
	.word 0x8790200a  ! 315: WRPR_TT_I	wrpr	%r0, 0x000a, %tt
	.word 0x93d02034  ! 316: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_tba_2_63:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 317: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc69fc020  ! 318: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
splash_lsu_2_64:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 320: BN	bn,a	<label_0x1>
	.word 0x8d9039e1  ! 321: WRPR_PSTATE_I	wrpr	%r0, 0x19e1, %pstate
DS_2_65:
	.word 0x20800001  ! 323: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 322: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902001  ! 324: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb181c000  ! 323: WR_STICK_REG_R	wr	%r7, %r0, %-
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 324: Tcc_R	te	icc_or_xcc, %r0 + %r30
tagged_2_67:
	taddcctv %r7, 0x1be4, %r17
	.word 0xc607e001  ! 325: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_tba_2_68:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 326: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 328: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb186c00b  ! 327: WR_STICK_REG_R	wr	%r27, %r11, %-
	.word 0xa7508000  ! 328: RDPR_TSTATE	<illegal instruction>
splash_lsu_2_70:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 329: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902000  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d802004  ! 331: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91d02035  ! 332: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902006  ! 333: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 334: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 335: Tcc_I	te	icc_or_xcc, %r0 + 50
DS_2_71:
	.word 0x34800001  ! 337: BG	bg,a	<label_0x1>
	pdist %f0, %f6, %f18
	.word 0x89b50306  ! 336: ALLIGNADDRESS	alignaddr	%r20, %r6, %r4
tagged_2_72:
	tsubcctv %r16, 0x17b1, %r16
	.word 0xd807e001  ! 337: LDUW_I	lduw	[%r31 + 0x0001], %r12
tagged_2_73:
	taddcctv %r8, 0x1123, %r13
	.word 0xd807e001  ! 338: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x879023a6  ! 339: WRPR_TT_I	wrpr	%r0, 0x03a6, %tt
	.word 0x94d5a001  ! 340: UMULcc_I	umulcc 	%r22, 0x0001, %r10
	.word 0x93902000  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
tagged_2_74:
	tsubcctv %r4, 0x16c4, %r6
	.word 0xc407e001  ! 342: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x93902002  ! 343: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc48008a0  ! 344: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc48008a0  ! 345: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
tagged_2_75:
	taddcctv %r11, 0x1f3a, %r6
	.word 0xc407e001  ! 346: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_2_76:
	.word 0x22800001  ! 348: BE	be,a	<label_0x1>
	.xword 0xcbd38b07	! Random illegal ?
	.word 0xc914800c  ! 348: LDQF_R	-	[%r18, %r12], %f4
	.word 0xa1a28827  ! 347: FADDs	fadds	%f10, %f7, %f16
	.word 0x83d02033  ! 348: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x85514000  ! 349: RDPR_TBA	<illegal instruction>
	.word 0x8d9020f3  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x00f3, %pstate
	.word 0xd0c804a0  ! 351: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
DS_2_77:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 352: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xd017e001  ! 353: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0x85514000  ! 354: RDPR_TBA	<illegal instruction>
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x3e700001  ! 356: BPVC	<illegal instruction>
	.word 0x879023f1  ! 357: WRPR_TT_I	wrpr	%r0, 0x03f1, %tt
splash_lsu_2_78:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 358: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_79:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 359: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 361: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe647c000  ! 362: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x8790215e  ! 363: WRPR_TT_I	wrpr	%r0, 0x015e, %tt
	.word 0x38800001  ! 364: BGU	bgu,a	<label_0x1>
	.word 0xe6900e60  ! 365: LDUHA_R	lduha	[%r0, %r0] 0x73, %r19
	.word 0x87802014  ! 366: WRASI_I	wr	%r0, 0x0014, %asi
splash_lsu_2_80:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 367: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8b540000  ! 368: RDPR_GL	<illegal instruction>
	.word 0xc8800b80  ! 369: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r4
splash_lsu_2_81:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc81fc000  ! 371: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xa1902009  ! 372: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xc807c000  ! 373: LDUW_R	lduw	[%r31 + %r0], %r4
splash_lsu_2_82:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 374: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91494000  ! 375: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x81982914  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0914, %hpstate
splash_lsu_2_83:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_2_84:
	tsubcctv %r3, 0x1bc4, %r8
	.word 0xc807e001  ! 379: LDUW_I	lduw	[%r31 + 0x0001], %r4
change_to_randtl_2_85:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 380: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0x83d020b2  ! 381: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xc8d004a0  ! 382: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_tba_2_86:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 383: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_2_87:
	.word 0x32800001  ! 386: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 386: BG	bg,a	<label_0x1>
	.word 0xd7130000  ! 386: LDQF_R	-	[%r12, %r0], %f11
	.word 0x81a68820  ! 385: FADDs	fadds	%f26, %f0, %f0
	.word 0x9f802001  ! 386: SIR	sir	0x0001
splash_tba_2_88:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 387: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x3c700001  ! 388: BPPOS	<illegal instruction>
DS_2_89:
	.word 0x34800001  ! 390: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 389: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802063  ! 390: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xb1508000  ! 391: RDPR_TSTATE	<illegal instruction>
	.word 0x20700001  ! 392: BPN	<illegal instruction>
splash_lsu_2_90:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8780204f  ! 394: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xd48fe000  ! 395: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0x81982d05  ! 396: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d05, %hpstate
	.word 0x32800001  ! 397: BNE	bne,a	<label_0x1>
tagged_2_91:
	taddcctv %r16, 0x18c6, %r9
	.word 0xd407e001  ! 398: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d902bb5  ! 399: WRPR_PSTATE_I	wrpr	%r0, 0x0bb5, %pstate
	.word 0x81982b07  ! 400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b07, %hpstate
DS_2_92:
	.word 0x20800001  ! 402: BN	bn,a	<label_0x1>
	pdist %f4, %f12, %f2
	.word 0xa1b1c30c  ! 401: ALLIGNADDRESS	alignaddr	%r7, %r12, %r16
	.word 0xec8008a0  ! 402: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x93902007  ! 403: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_2_93:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 404: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 405: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d90387d  ! 406: WRPR_PSTATE_I	wrpr	%r0, 0x187d, %pstate
	.word 0x8d903397  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x1397, %pstate
tagged_2_94:
	tsubcctv %r25, 0x1a17, %r12
	.word 0xec07e001  ! 408: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x93d020b3  ! 409: Tcc_I	tne	icc_or_xcc, %r0 + 179
tagged_2_95:
	taddcctv %r17, 0x1b67, %r7
	.word 0xec07e001  ! 410: LDUW_I	lduw	[%r31 + 0x0001], %r22
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 411: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xecd00e60  ! 412: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r22
	.word 0x8790214f  ! 413: WRPR_TT_I	wrpr	%r0, 0x014f, %tt
tagged_2_96:
	tsubcctv %r4, 0x1d30, %r3
	.word 0xec07e001  ! 414: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x93902006  ! 415: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8f480000  ! 416: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x879020ce  ! 417: WRPR_TT_I	wrpr	%r0, 0x00ce, %tt
	.word 0xd64fe001  ! 418: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0xd68008a0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x93902000  ! 420: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xb350c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0x8f902000  ! 423: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89834017  ! 422: WRTICK_R	wr	%r13, %r23, %tick
	.word 0xc6dfe010  ! 423: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r3
	.word 0x87494000  ! 424: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0xb7a349ec  ! 425: FDIVq	dis not found

	.word 0x91514000  ! 426: RDPR_TBA	<illegal instruction>
	.word 0x32700001  ! 427: BPNE	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee07c000  ! 429: LDUW_R	lduw	[%r31 + %r0], %r23
	.word 0x81982754  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0754, %hpstate
	.word 0xa1902005  ! 431: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_lsu_2_98:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 432: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xee8008a0  ! 433: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
splash_tba_2_99:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 434: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x2a800001  ! 435: BCS	bcs,a	<label_0x1>
	.word 0x91d02033  ! 436: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_2_100:
	.word 0x20800001  ! 438: BN	bn,a	<label_0x1>
	.word 0xcb356001  ! 438: STQF_I	-	%f5, [0x0001, %r21]
	normalw
	.word 0xb5458000  ! 437: RD_SOFTINT_REG	rd	%softint, %r26
tagged_2_101:
	taddcctv %r18, 0x1e0d, %r2
	.word 0xcc07e001  ! 438: LDUW_I	lduw	[%r31 + 0x0001], %r6
tagged_2_102:
	tsubcctv %r25, 0x1e39, %r3
	.word 0xcc07e001  ! 439: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x87802088  ! 440: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x87902136  ! 441: WRPR_TT_I	wrpr	%r0, 0x0136, %tt
	.word 0x81982f8f  ! 442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f8f, %hpstate
	.word 0x93902007  ! 443: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
splash_lsu_2_103:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 444: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 445: BPN	<illegal instruction>
splash_lsu_2_104:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 446: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc8008a0  ! 447: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
splash_lsu_2_105:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 448: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_2_106:
	tsubcctv %r17, 0x1977, %r23
	.word 0xcc07e001  ! 449: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc9fc020  ! 450: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x8198228f  ! 451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028f, %hpstate
	.word 0xccdfe000  ! 452: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
	.word 0x93902006  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
tagged_2_107:
	taddcctv %r7, 0x120f, %r12
	.word 0xcc07e001  ! 454: LDUW_I	lduw	[%r31 + 0x0001], %r6
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 455: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 456: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xccc7e000  ! 457: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r6
	.word 0x87802080  ! 458: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02033  ! 459: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8198218d  ! 460: WRHPR_HPSTATE_I	wrhpr	%r0, 0x018d, %hpstate
	.word 0x8198270e  ! 461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070e, %hpstate
splash_lsu_2_108:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 462: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc800ba0  ! 463: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r6
	.word 0xb5500000  ! 464: RDPR_TPC	<illegal instruction>
	.word 0x91d020b2  ! 465: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x8d902cc4  ! 466: WRPR_PSTATE_I	wrpr	%r0, 0x0cc4, %pstate
	.word 0xc717c000  ! 467: LDQF_R	-	[%r31, %r0], %f3
	.word 0xa1902009  ! 468: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902003  ! 469: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902004  ! 470: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9b464000  ! 471: RD_STICK_CMPR_REG	rd	%-, %r13
	.word 0x87802055  ! 472: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0xd8c004a0  ! 473: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
splash_tba_2_109:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 474: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd8800a60  ! 475: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r12
DS_2_110:
	.word 0x34800001  ! 477: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 476: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902004  ! 477: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xa190200d  ! 478: WRPR_GL_I	wrpr	%r0, 0x000d, %-
splash_tba_2_111:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 479: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902005  ! 480: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x87802016  ! 481: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd88008a0  ! 482: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x2e800001  ! 483: BVS	bvs,a	<label_0x1>
splash_lsu_2_112:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 484: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 485: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x93902002  ! 486: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d903ebb  ! 487: WRPR_PSTATE_I	wrpr	%r0, 0x1ebb, %pstate
splash_tba_2_113:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902007  ! 489: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd8c804a0  ! 490: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd89fe001  ! 491: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x97a01a65  ! 492: FqTOi	fqtoi	
tagged_2_114:
	tsubcctv %r26, 0x169c, %r14
	.word 0xf607e001  ! 493: LDUW_I	lduw	[%r31 + 0x0001], %r27
DS_2_115:
	.word 0x32800001  ! 495: BNE	bne,a	<label_0x1>
	pdist %f22, %f0, %f12
	.word 0x99b1c318  ! 494: ALLIGNADDRESS	alignaddr	%r7, %r24, %r12
	.word 0xda57e001  ! 495: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0x87802089  ! 496: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87802004  ! 497: WRASI_I	wr	%r0, 0x0004, %asi
splash_lsu_2_116:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 498: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 499: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xda9fe001  ! 500: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xdadfe000  ! 501: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r13
DS_2_117:
	.word 0x20800001  ! 503: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 502: SAVE_R	save	%r31, %r0, %r31
tagged_2_118:
	tsubcctv %r24, 0x1d59, %r3
	.word 0xda07e001  ! 503: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdad7e010  ! 504: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 505: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83500000  ! 506: RDPR_TPC	<illegal instruction>
DS_2_119:
	.word 0x20800001  ! 508: BN	bn,a	<label_0x1>
	pdist %f18, %f4, %f24
	.word 0x9bb60307  ! 507: ALLIGNADDRESS	alignaddr	%r24, %r7, %r13
DS_2_120:
	.word 0x32800001  ! 509: BNE	bne,a	<label_0x1>
	.xword 0xadf87832	! Random illegal ?
	.word 0xe5154000  ! 509: LDQF_R	-	[%r21, %r0], %f18
	.word 0xa5a10823  ! 508: FADDs	fadds	%f4, %f3, %f18
tagged_2_121:
	taddcctv %r13, 0x13de, %r5
	.word 0xc807e001  ! 509: LDUW_I	lduw	[%r31 + 0x0001], %r4
splash_tba_2_122:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 510: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200a  ! 511: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8790228c  ! 512: WRPR_TT_I	wrpr	%r0, 0x028c, %tt
	.word 0xc817e001  ! 513: LDUH_I	lduh	[%r31 + 0x0001], %r4
	.word 0x8790218e  ! 514: WRPR_TT_I	wrpr	%r0, 0x018e, %tt
	.word 0xab50c000  ! 515: RDPR_TT	<illegal instruction>
	.word 0x89508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0x22700001  ! 517: BPE	<illegal instruction>
change_to_randtl_2_123:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 518: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa1902005  ! 519: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xd88008a0  ! 520: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x81982b8c  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8c, %hpstate
	.word 0x93480000  ! 522: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x93d02032  ! 523: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x81982e86  ! 524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e86, %hpstate
	.word 0x95504000  ! 525: RDPR_TNPC	<illegal instruction>
splash_htba_2_124:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 526: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe44fc000  ! 527: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe44fe001  ! 528: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02032  ! 530: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe4d7e020  ! 531: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
tagged_2_125:
	taddcctv %r24, 0x1fe8, %r14
	.word 0xe407e001  ! 532: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x87902208  ! 533: WRPR_TT_I	wrpr	%r0, 0x0208, %tt
	.word 0xe4bfc037  ! 534: STDA_R	stda	%r18, [%r31 + %r23] 0x01
	.word 0xe40fe001  ! 535: LDUB_I	ldub	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe527e001  ! 537: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe527e001  ! 538: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe4d7e000  ! 539: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r18
	.word 0x81982f47  ! 540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f47, %hpstate
tagged_2_126:
	tsubcctv %r13, 0x132f, %r12
	.word 0xe407e001  ! 541: LDUW_I	lduw	[%r31 + 0x0001], %r18
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 542: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_2_127:
	taddcctv %r3, 0x1a4a, %r22
	.word 0xe407e001  ! 543: LDUW_I	lduw	[%r31 + 0x0001], %r18
splash_tba_2_128:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 544: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 545: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe45fe001  ! 546: LDX_I	ldx	[%r31 + 0x0001], %r18
	.word 0xe497e010  ! 547: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r18
	.word 0xe407c000  ! 548: LDUW_R	lduw	[%r31 + %r0], %r18
DS_2_129:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 549: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xe48008a0  ! 550: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe417c000  ! 551: LDUH_R	lduh	[%r31 + %r0], %r18
	.word 0x91d02035  ! 552: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9f802001  ! 553: SIR	sir	0x0001
	.word 0xe49fe001  ! 554: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
DS_2_130:
	.word 0x34800001  ! 556: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 555: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x30700001  ! 556: BPA	<illegal instruction>
	.word 0x8780201c  ! 557: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x87802020  ! 558: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4c80e60  ! 559: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r18
	.word 0xe44fe001  ! 560: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	.word 0x83d02032  ! 561: Tcc_I	te	icc_or_xcc, %r0 + 50
splash_lsu_2_131:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 562: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe4800c40  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r18
	.word 0x8790204e  ! 564: WRPR_TT_I	wrpr	%r0, 0x004e, %tt
	.word 0x81982ec4  ! 565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec4, %hpstate
splash_lsu_2_132:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 566: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe42fe001  ! 567: STB_I	stb	%r18, [%r31 + 0x0001]
	.word 0xa1902005  ! 568: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8790206c  ! 569: WRPR_TT_I	wrpr	%r0, 0x006c, %tt
	.word 0xe4d00e80  ! 570: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r18
	.word 0x91d02035  ! 571: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xe48804a0  ! 572: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 573: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_2_133:
	.word 0x20800001  ! 575: BN	bn,a	<label_0x1>
	.word 0xdb36c004  ! 575: STQF_R	-	%f13, [%r4, %r27]
	normalw
	.word 0x8f458000  ! 574: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x87902019  ! 575: WRPR_TT_I	wrpr	%r0, 0x0019, %tt
	.word 0xf217c000  ! 576: LDUH_R	lduh	[%r31 + %r0], %r25
	.word 0xf28008a0  ! 577: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8f902001  ! 579: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8b69a001  ! 578: SDIVX_I	sdivx	%r6, 0x0001, %r5
	.word 0x83d02035  ! 579: Tcc_I	te	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802089  ! 581: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x87902223  ! 582: WRPR_TT_I	wrpr	%r0, 0x0223, %tt
	.word 0x93902000  ! 583: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xe2900e80  ! 584: LDUHA_R	lduha	[%r0, %r0] 0x74, %r17
	.word 0x87802089  ! 585: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xe28804a0  ! 586: LDUBA_R	lduba	[%r0, %r0] 0x25, %r17
	.word 0x87802088  ! 587: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8d902ae6  ! 588: WRPR_PSTATE_I	wrpr	%r0, 0x0ae6, %pstate
	.word 0x81982186  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0186, %hpstate
splash_lsu_2_135:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 590: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe21fe001  ! 591: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0xe28fe010  ! 592: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
tagged_2_136:
	tsubcctv %r17, 0x1810, %r15
	.word 0xe207e001  ! 593: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe21fe001  ! 594: LDD_I	ldd	[%r31 + 0x0001], %r17
splash_tba_2_137:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 595: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902ffb  ! 596: WRPR_PSTATE_I	wrpr	%r0, 0x0ffb, %pstate
	.word 0xa190200f  ! 597: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 598: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982e0f  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0f, %hpstate
	.word 0x93902006  ! 600: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe297e020  ! 601: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r17
	.word 0x8d9028e6  ! 602: WRPR_PSTATE_I	wrpr	%r0, 0x08e6, %pstate
splash_tba_2_138:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 603: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28fe020  ! 605: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r17
	.word 0x87802016  ! 606: WRASI_I	wr	%r0, 0x0016, %asi
change_to_randtl_2_139:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 607: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xe28008a0  ! 608: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
DS_2_140:
	.word 0x32800001  ! 610: BNE	bne,a	<label_0x1>
	.xword 0xc5f55382	! Random illegal ?
	.word 0x87a00544  ! 610: FSQRTd	fsqrt	
	.word 0x87a08834  ! 609: FADDs	fadds	%f2, %f20, %f3
	.word 0x87802020  ! 610: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8d902c89  ! 611: WRPR_PSTATE_I	wrpr	%r0, 0x0c89, %pstate
	.word 0x879022fb  ! 612: WRPR_TT_I	wrpr	%r0, 0x02fb, %tt
splash_tba_2_141:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 613: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0d004a0  ! 614: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r24
splash_htba_2_142:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 615: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_2_143:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 616: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_2_144:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 617: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200c  ! 618: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902005  ! 619: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d903261  ! 620: WRPR_PSTATE_I	wrpr	%r0, 0x1261, %pstate
	ta	T_CHANGE_HPRIV	! macro
splash_tba_2_145:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 622: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa9514000  ! 623: RDPR_TBA	rdpr	%tba, %r20
tagged_2_146:
	tsubcctv %r6, 0x1dac, %r10
	.word 0xd207e001  ! 624: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x87802080  ! 625: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa1480000  ! 626: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x879021f7  ! 627: WRPR_TT_I	wrpr	%r0, 0x01f7, %tt
tagged_2_147:
	taddcctv %r12, 0x1e39, %r4
	.word 0xca07e001  ! 628: LDUW_I	lduw	[%r31 + 0x0001], %r5
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 629: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xca47c000  ! 630: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0x91d02033  ! 631: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d903b5a  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x1b5a, %pstate
	.word 0x83d02033  ! 633: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x91d02032  ! 634: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802014  ! 635: WRASI_I	wr	%r0, 0x0014, %asi
tagged_2_148:
	tsubcctv %r22, 0x125a, %r20
	.word 0xca07e001  ! 636: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x26800001  ! 637: BL	bl,a	<label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 638: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 640: SIR	sir	0x0001
	.word 0x36700001  ! 641: BPGE	<illegal instruction>
	.word 0x8d90354a  ! 642: WRPR_PSTATE_I	wrpr	%r0, 0x154a, %pstate
	.word 0xca8008a0  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
splash_lsu_2_149:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 644: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f51c000  ! 645: RDPR_TL	<illegal instruction>
splash_lsu_2_150:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 646: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903c51  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x1c51, %pstate
DS_2_151:
	.word 0x22800001  ! 649: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 648: SAVE_R	save	%r31, %r0, %r31
DS_2_152:
	.word 0x32800001  ! 650: BNE	bne,a	<label_0x1>
	.xword 0x855f054d	! Random illegal ?
	.word 0xe5104004  ! 650: LDQF_R	-	[%r1, %r4], %f18
	.word 0x8da60821  ! 649: FADDs	fadds	%f24, %f1, %f6
	.word 0x8f902000  ! 651: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1834006  ! 650: WR_STICK_REG_R	wr	%r13, %r6, %-
	.word 0xd997e001  ! 651: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0xd89fe001  ! 652: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x9f802001  ! 653: SIR	sir	0x0001
	.word 0xd81fc000  ! 654: LDD_R	ldd	[%r31 + %r0], %r12
tagged_2_154:
	tsubcctv %r14, 0x1c52, %r21
	.word 0xd807e001  ! 655: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8790205b  ! 656: WRPR_TT_I	wrpr	%r0, 0x005b, %tt
splash_tba_2_155:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 657: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_2_156:
	.word 0x32800001  ! 659: BNE	bne,a	<label_0x1>
	.word 0xd934e001  ! 659: STQF_I	-	%f12, [0x0001, %r19]
	normalw
	.word 0x8d458000  ! 658: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xce4fc000  ! 659: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0x8d902273  ! 660: WRPR_PSTATE_I	wrpr	%r0, 0x0273, %pstate
	.word 0x34800001  ! 661: BG	bg,a	<label_0x1>
	.word 0x8d902ab2  ! 662: WRPR_PSTATE_I	wrpr	%r0, 0x0ab2, %pstate
DS_2_157:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 663: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x819828dc  ! 664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08dc, %hpstate
tagged_2_158:
	tsubcctv %r10, 0x1b84, %r1
	.word 0xce07e001  ! 665: LDUW_I	lduw	[%r31 + 0x0001], %r7
DS_2_159:
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0xa1a00554  ! 667: FSQRTd	fsqrt	
	.word 0x89a04826  ! 666: FADDs	fadds	%f1, %f6, %f4
	.word 0xe49fe001  ! 667: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0x93902002  ! 668: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d802000  ! 669: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xe48008a0  ! 671: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x99902001  ! 672: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xa190200f  ! 673: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8f45c000  ! 674: RD_TICK_CMPR_REG	rd	%-, %r7
	.word 0xecdfe020  ! 675: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r22
tagged_2_160:
	tsubcctv %r16, 0x1185, %r11
	.word 0xec07e001  ! 676: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0xed17c000  ! 677: LDQF_R	-	[%r31, %r0], %f22
	.word 0x91a2cdc0  ! 678: FdMULq	fdmulq	
	.word 0x85500000  ! 679: RDPR_TPC	<illegal instruction>
	.word 0xa190200d  ! 680: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x819820ce  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00ce, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 682: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_2_161:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 683: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc4c7e000  ! 684: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r2
	.word 0x87802088  ! 685: WRASI_I	wr	%r0, 0x0088, %asi
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 686: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc4c7e030  ! 687: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
	.word 0xc48804a0  ! 688: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc49fc020  ! 689: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x81460000  ! 691: RD_STICK_REG	stbar
	.word 0x8790203d  ! 692: WRPR_TT_I	wrpr	%r0, 0x003d, %tt
	.word 0xc4d80e40  ! 693: LDXA_R	ldxa	[%r0, %r0] 0x72, %r2
	.word 0x8d903929  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x1929, %pstate
	.word 0xa190200b  ! 695: WRPR_GL_I	wrpr	%r0, 0x000b, %-
DS_2_162:
	.word 0x22800001  ! 697: BE	be,a	<label_0x1>
	.word 0xc9326001  ! 697: STQF_I	-	%f4, [0x0001, %r9]
	normalw
	.word 0xad458000  ! 696: RD_SOFTINT_REG	rd	%softint, %r22
	.word 0x99902001  ! 697: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
splash_tba_2_163:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 698: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc28008a0  ! 699: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc317c000  ! 700: LDQF_R	-	[%r31, %r0], %f1
tagged_2_164:
	tsubcctv %r20, 0x158b, %r5
	.word 0xc207e001  ! 701: LDUW_I	lduw	[%r31 + 0x0001], %r1
tagged_2_165:
	taddcctv %r1, 0x18e7, %r5
	.word 0xc207e001  ! 702: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc28008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc29fe001  ! 705: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x87802089  ! 706: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81982c45  ! 707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c45, %hpstate
	.word 0xa9480000  ! 708: RDHPR_HPSTATE	rdhpr	%hpstate, %r20
	.word 0xf08804a0  ! 709: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x91d020b4  ! 710: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x87902180  ! 711: WRPR_TT_I	wrpr	%r0, 0x0180, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902000  ! 713: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d903420  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x1420, %pstate
	.word 0xf08fe030  ! 715: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r24
splash_tba_2_166:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf09004a0  ! 717: LDUHA_R	lduha	[%r0, %r0] 0x25, %r24
	.word 0xa1902000  ! 718: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 719: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0xb2, %r30
	.word 0x83d0001e  ! 721: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d903c3f  ! 722: WRPR_PSTATE_I	wrpr	%r0, 0x1c3f, %pstate
tagged_2_167:
	taddcctv %r13, 0x14b2, %r16
	.word 0xf007e001  ! 723: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0xf08804a0  ! 724: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0xf02fc009  ! 725: STB_R	stb	%r24, [%r31 + %r9]
	.word 0x8790225d  ! 726: WRPR_TT_I	wrpr	%r0, 0x025d, %tt
	.word 0xf0880e80  ! 727: LDUBA_R	lduba	[%r0, %r0] 0x74, %r24
	.word 0x8780201c  ! 728: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x819825de  ! 729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05de, %hpstate
	.word 0xf08008a0  ! 730: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x2c700001  ! 731: BPNEG	<illegal instruction>
	.word 0x93902007  ! 732: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d02034  ! 733: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902003  ! 734: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x32700001  ! 735: BPNE	<illegal instruction>
	.word 0x87802004  ! 736: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf01fc000  ! 737: LDD_R	ldd	[%r31 + %r0], %r24
	.word 0x93902005  ! 738: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_2_168:
	.word 0x22800001  ! 740: BE	be,a	<label_0x1>
	allclean
	.word 0x9bb04317  ! 739: ALLIGNADDRESS	alignaddr	%r1, %r23, %r13
	.word 0x91d02032  ! 740: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_2_169:
	.word 0x34800001  ! 742: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 741: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802004  ! 742: WRFPRS_I	wr	%r0, 0x0004, %fprs
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 743: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 744: BPE	<illegal instruction>
	.word 0xc407c000  ! 745: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x93902000  ! 746: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x3a700001  ! 747: BPCC	<illegal instruction>
	.word 0x81982357  ! 748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0357, %hpstate
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 749: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa7500000  ! 750: RDPR_TPC	rdpr	%tpc, %r19
splash_htba_2_170:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 751: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcc1fc000  ! 752: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x93902006  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902006  ! 754: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_2_171:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 755: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 756: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
DS_2_172:
	.word 0x22800001  ! 758: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 757: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fc000  ! 758: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0xcc8008a0  ! 759: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xa1902005  ! 760: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xcc4fc000  ! 761: LDSB_R	ldsb	[%r31 + %r0], %r6
DS_2_173:
	.word 0x22800001  ! 763: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 762: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fe001  ! 763: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x81982ecc  ! 764: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ecc, %hpstate
splash_tba_2_174:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 765: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcd97e001  ! 766: LDQFA_I	-	[%r31, 0x0001], %f6
	.word 0x93504000  ! 767: RDPR_TNPC	rdpr	%tnpc, %r9
	.word 0x99540000  ! 768: RDPR_GL	<illegal instruction>
splash_lsu_2_175:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 769: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 770: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xab684013  ! 771: SDIVX_R	sdivx	%r1, %r19, %r21
	.word 0x8f508000  ! 772: RDPR_TSTATE	<illegal instruction>
	.word 0x8d903c66  ! 773: WRPR_PSTATE_I	wrpr	%r0, 0x1c66, %pstate
	.word 0x3e800001  ! 774: BVC	bvc,a	<label_0x1>
	.word 0xc2d00e40  ! 775: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r1
	.word 0x93902001  ! 776: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8780204f  ! 777: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8d9025ab  ! 778: WRPR_PSTATE_I	wrpr	%r0, 0x05ab, %pstate
	.word 0x91d02034  ! 779: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xc217c000  ! 780: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x879020a3  ! 781: WRPR_TT_I	wrpr	%r0, 0x00a3, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 782: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb7514000  ! 783: RDPR_TBA	<illegal instruction>
splash_lsu_2_176:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 784: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 785: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902001  ! 786: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x85480000  ! 787: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
	.word 0xce17c000  ! 788: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0xcec7e010  ! 789: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r7
DS_2_177:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 790: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x9f802001  ! 791: SIR	sir	0x0001
	.word 0x879023f1  ! 792: WRPR_TT_I	wrpr	%r0, 0x03f1, %tt
splash_tba_2_178:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce8008a0  ! 794: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xcedfe020  ! 795: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r7
	.word 0x9f802001  ! 796: SIR	sir	0x0001
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 797: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce1fc000  ! 798: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0xce4fc000  ! 799: LDSB_R	ldsb	[%r31 + %r0], %r7
tagged_2_179:
	taddcctv %r23, 0x1b77, %r22
	.word 0xce07e001  ! 800: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x87802010  ! 801: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xa190200a  ! 802: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xce800b60  ! 803: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r7
	.word 0x91d02034  ! 804: Tcc_I	ta	icc_or_xcc, %r0 + 52
splash_tba_2_180:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 805: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_2_181:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 806: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 807: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902a5a  ! 808: WRPR_PSTATE_I	wrpr	%r0, 0x0a5a, %pstate
	.word 0x2e700001  ! 809: BPVS	<illegal instruction>
	.word 0xced7e020  ! 810: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r7
	.word 0x8790224b  ! 811: WRPR_TT_I	wrpr	%r0, 0x024b, %tt
splash_lsu_2_182:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 812: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 813: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x38800001  ! 814: BGU	bgu,a	<label_0x1>
splash_lsu_2_183:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 815: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902003  ! 816: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0xa1902003  ! 817: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_lsu_2_184:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 818: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcec00e60  ! 819: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r7
	.word 0xa1902009  ! 820: WRPR_GL_I	wrpr	%r0, 0x0009, %-
splash_htba_2_185:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 821: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa1902003  ! 822: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xce800b20  ! 823: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r7
	.word 0xa190200a  ! 824: WRPR_GL_I	wrpr	%r0, 0x000a, %-
DS_2_186:
	.word 0x34800001  ! 826: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 825: SAVE_R	save	%r31, %r0, %r31
	.word 0x85a009d6  ! 826: FDIVd	fdivd	%f0, %f22, %f2
	.word 0x8f902002  ! 828: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01965  ! 827: FqTOd	dis not found

	.word 0xd647e001  ! 828: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x879020f7  ! 829: WRPR_TT_I	wrpr	%r0, 0x00f7, %tt
	.word 0x8f902001  ! 831: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89a01962  ! 830: FqTOd	dis not found

splash_lsu_2_189:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 831: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f24  ! 832: WRPR_PSTATE_I	wrpr	%r0, 0x0f24, %pstate
	.word 0x97500000  ! 833: RDPR_TPC	<illegal instruction>
	.word 0x93902003  ! 834: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_2_190:
	.word 0x32800001  ! 836: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 835: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_2_191:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 837: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd01fe001  ! 838: LDD_I	ldd	[%r31 + 0x0001], %r8
splash_tba_2_192:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 839: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd04fe001  ! 840: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0x89a10dc9  ! 841: FdMULq	fdmulq	
	.word 0x8780204f  ! 842: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8f902002  ! 844: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x976b2001  ! 843: SDIVX_I	sdivx	%r12, 0x0001, %r11
	.word 0xd41fe001  ! 844: LDD_I	ldd	[%r31 + 0x0001], %r10
splash_cmpr_2_194:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb181a001  ! 845: WR_STICK_REG_I	wr	%r6, 0x0001, %-
	.word 0x93902001  ! 846: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x819823c4  ! 847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03c4, %hpstate
tagged_2_195:
	taddcctv %r15, 0x1785, %r8
	.word 0xd407e001  ! 848: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd48008a0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4cfe010  ! 850: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r10
	.word 0x30800001  ! 851: BA	ba,a	<label_0x1>
change_to_randtl_2_196:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 852: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x87802004  ! 853: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9f802001  ! 854: SIR	sir	0x0001
	.word 0x81982954  ! 855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0954, %hpstate
DS_2_197:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 856: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x87802004  ! 857: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa190200f  ! 858: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd41fe001  ! 859: LDD_I	ldd	[%r31 + 0x0001], %r10
tagged_2_198:
	tsubcctv %r24, 0x16b2, %r11
	.word 0xd407e001  ! 860: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_tba_2_199:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 861: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802014  ! 862: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x879021a8  ! 863: WRPR_TT_I	wrpr	%r0, 0x01a8, %tt
	.word 0x8f480000  ! 864: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0xccdfe020  ! 865: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
	.word 0xcc800c80  ! 866: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc1fe001  ! 868: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x81982a1e  ! 869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1e, %hpstate
	.word 0x93902000  ! 870: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xccdfe030  ! 871: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
tagged_2_200:
	tsubcctv %r24, 0x1cf1, %r26
	.word 0xcc07e001  ! 872: LDUW_I	lduw	[%r31 + 0x0001], %r6
splash_tba_2_201:
	ta T_CHANGE_PRIV
	set 0x003e0000, %r2
	.word 0x8b900002  ! 873: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802063  ! 874: WRASI_I	wr	%r0, 0x0063, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc0fc000  ! 876: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x87802058  ! 877: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8790226e  ! 878: WRPR_TT_I	wrpr	%r0, 0x026e, %tt
	.word 0xccd7e020  ! 879: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc9004a0  ! 881: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
splash_lsu_2_202:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 882: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02035  ! 883: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_2_203:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 884: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc8008a0  ! 885: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
DS_2_204:
	.word 0x22800001  ! 887: BE	be,a	<label_0x1>
	.word 0xe5300000  ! 887: STQF_R	-	%f18, [%r0, %r0]
	normalw
	.word 0x95458000  ! 886: RD_SOFTINT_REG	rd	%softint, %r10
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 887: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2800c60  ! 888: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r25
DS_2_205:
	.word 0x34800001  ! 890: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 889: RESTORE_R	restore	%r31, %r0, %r31
splash_htba_2_206:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 890: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xf2d80e80  ! 891: LDXA_R	ldxa	[%r0, %r0] 0x74, %r25
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 892: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2c7e000  ! 893: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r25
DS_2_207:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 894: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0xf28804a0  ! 895: LDUBA_R	lduba	[%r0, %r0] 0x25, %r25
	.word 0x819822c7  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c7, %hpstate
	.word 0xf217e001  ! 897: LDUH_I	lduh	[%r31 + 0x0001], %r25
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 898: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902008  ! 899: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xf28008a0  ! 900: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 901: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf217c000  ! 902: LDUH_R	lduh	[%r31 + %r0], %r25
change_to_randtl_2_208:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 903: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x32800001  ! 904: BNE	bne,a	<label_0x1>
	.word 0xa1902001  ! 905: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x87802063  ! 906: WRASI_I	wr	%r0, 0x0063, %asi
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 907: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2800c80  ! 908: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r25
	.word 0x87802020  ! 909: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xf317c000  ! 910: LDQF_R	-	[%r31, %r0], %f25
	.word 0xa1902000  ! 911: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x93902004  ! 912: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8780201c  ! 913: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xf28fe010  ! 914: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r25
	.word 0x8d9034f4  ! 915: WRPR_PSTATE_I	wrpr	%r0, 0x14f4, %pstate
	.word 0xf28008a0  ! 916: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8f902002  ! 918: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8b6b2001  ! 917: SDIVX_I	sdivx	%r12, 0x0001, %r5
splash_lsu_2_210:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 918: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1464000  ! 919: RD_STICK_CMPR_REG	rd	%-, %r16
	.word 0xa1902001  ! 920: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x819825c6  ! 921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c6, %hpstate
	.word 0xd6800b80  ! 922: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r11
	.word 0x93902003  ! 923: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
tagged_2_211:
	taddcctv %r19, 0x16f0, %r1
	.word 0xd607e001  ! 924: LDUW_I	lduw	[%r31 + 0x0001], %r11
DS_2_212:
	.word 0x22800001  ! 926: BE	be,a	<label_0x1>
	pdist %f6, %f28, %f8
	.word 0x8db04305  ! 925: ALLIGNADDRESS	alignaddr	%r1, %r5, %r6
	.word 0x8d9035ff  ! 926: WRPR_PSTATE_I	wrpr	%r0, 0x15ff, %pstate
tagged_2_213:
	taddcctv %r13, 0x1752, %r17
	.word 0xc607e001  ! 927: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc607c000  ! 928: LDUW_R	lduw	[%r31 + %r0], %r3
splash_tba_2_214:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 929: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68fe020  ! 930: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r3
	otherw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 931: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802089  ! 933: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x93902005  ! 934: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc73fc002  ! 935: STDF_R	std	%f3, [%r2, %r31]
	.word 0xc6d804a0  ! 936: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 937: LDQF_R	-	[%r31, %r0], %f3
tagged_2_215:
	taddcctv %r5, 0x1b2c, %r15
	.word 0xc607e001  ! 938: LDUW_I	lduw	[%r31 + 0x0001], %r3
DS_2_216:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 939: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_tba_2_217:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 940: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_2_218:
	.word 0x22800001  ! 942: BE	be,a	<label_0x1>
	.xword 0xdfc5d31f	! Random illegal ?
	.word 0xe510c010  ! 942: LDQF_R	-	[%r3, %r16], %f18
	.word 0x87a6c821  ! 941: FADDs	fadds	%f27, %f1, %f3
	.word 0x93902000  ! 942: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d90233b  ! 943: WRPR_PSTATE_I	wrpr	%r0, 0x033b, %pstate
	.word 0x8d90270a  ! 944: WRPR_PSTATE_I	wrpr	%r0, 0x070a, %pstate
	.word 0x87802020  ! 945: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xc48804a0  ! 946: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc49fc020  ! 947: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x93d02035  ! 948: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x93902000  ! 949: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc517c000  ! 951: LDQF_R	-	[%r31, %r0], %f2
	.word 0x24700001  ! 952: BPLE	<illegal instruction>
	.word 0x8f902000  ! 954: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1834017  ! 953: WR_STICK_REG_R	wr	%r13, %r23, %-
	.word 0x81982d9e  ! 954: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9e, %hpstate
	.word 0xc417c000  ! 955: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x93902006  ! 956: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1902005  ! 957: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8198228c  ! 958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028c, %hpstate
	.word 0x93902001  ! 959: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc48804a0  ! 960: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc48008a0  ! 961: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xa1902009  ! 962: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x85494000  ! 963: RDHPR_HTBA	rdhpr	%htba, %r2
	.word 0xc4d7e010  ! 964: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r2
	.word 0x93902006  ! 965: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_2_220:
	.word 0x32800001  ! 967: BNE	bne,a	<label_0x1>
	.word 0xc532000b  ! 967: STQF_R	-	%f2, [%r11, %r8]
	normalw
	.word 0x93458000  ! 966: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0xa190200a  ! 967: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_lsu_2_221:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902003  ! 969: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x28800001  ! 970: BLEU	bleu,a	<label_0x1>
splash_lsu_2_222:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 971: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 972: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_2_223:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 974: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb186a001  ! 973: WR_STICK_REG_I	wr	%r26, 0x0001, %-
	.word 0x91d02034  ! 974: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd4d00e40  ! 975: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r10
tagged_2_224:
	tsubcctv %r3, 0x114b, %r16
	.word 0xd407e001  ! 976: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4c004a0  ! 977: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x93902007  ! 978: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99902000  ! 979: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8d9031a8  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x11a8, %pstate
	.word 0x93902000  ! 981: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02034  ! 982: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x22700001  ! 983: BPE	<illegal instruction>
	.word 0x93902006  ! 984: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 985: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 986: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 987: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd497e030  ! 988: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r10
	.word 0xd4dfe030  ! 989: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
	.word 0x91d02032  ! 990: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x34800001  ! 991: BG	bg,a	<label_0x1>
	.word 0xa1902003  ! 992: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd48008a0  ! 993: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd597e001  ! 994: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x91d02035  ! 995: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_htba_2_225:
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 996: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902001  ! 997: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_2_226:
	.word 0x22800001  ! 999: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 998: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_2_227:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_2:
	.word 0x91d020b2  ! 1: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x91d02034  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902007  ! 3: WRPR_GL_I	wrpr	%r0, 0x0007, %-
splash_lsu_1_0:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 4: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91514000  ! 5: RDPR_TBA	<illegal instruction>
tagged_1_1:
	taddcctv %r7, 0x11d0, %r18
	.word 0xcc07e001  ! 6: LDUW_I	lduw	[%r31 + 0x0001], %r6
DS_1_2:
	.word 0x22800001  ! 8: BE	be,a	<label_0x1>
	pdist %f24, %f24, %f30
	.word 0x95b20306  ! 7: ALLIGNADDRESS	alignaddr	%r8, %r6, %r10
	.word 0xb1514000  ! 8: RDPR_TBA	<illegal instruction>
tagged_1_3:
	taddcctv %r8, 0x1255, %r1
	.word 0xc807e001  ! 9: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc81fe001  ! 10: LDD_I	ldd	[%r31 + 0x0001], %r4
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 11: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc8c7e000  ! 12: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r4
	.word 0xc917c000  ! 13: LDQF_R	-	[%r31, %r0], %f4
	.word 0xc89fe001  ! 14: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 15: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902002  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xc807c000  ! 17: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0x8d802000  ! 18: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9945c000  ! 19: RD_TICK_CMPR_REG	rd	%-, %r12
	.word 0x91d02035  ! 20: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_1_4:
	.word 0x32800001  ! 22: BNE	bne,a	<label_0x1>
	.word 0xc731001b  ! 22: STQF_R	-	%f3, [%r27, %r4]
	normalw
	.word 0xa9458000  ! 21: RD_SOFTINT_REG	rd	%softint, %r20
	.word 0x87902387  ! 22: WRPR_TT_I	wrpr	%r0, 0x0387, %tt
DS_1_5:
	.word 0x32800001  ! 24: BNE	bne,a	<label_0x1>
	.word 0xcf308000  ! 24: STQF_R	-	%f7, [%r0, %r2]
	normalw
	.word 0x8d458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r6
tagged_1_6:
	tsubcctv %r10, 0x1cd7, %r2
	.word 0xd607e001  ! 24: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x87902127  ! 25: WRPR_TT_I	wrpr	%r0, 0x0127, %tt
splash_tba_1_7:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 26: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8198271d  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071d, %hpstate
splash_lsu_1_8:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd65fe001  ! 29: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d7e010  ! 30: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0x9150c000  ! 31: RDPR_TT	<illegal instruction>
	.word 0xda07c000  ! 32: LDUW_R	lduw	[%r31 + %r0], %r13
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 33: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8198284d  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084d, %hpstate
	.word 0xdad7e000  ! 36: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	.word 0xda47c000  ! 37: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0x81982adc  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adc, %hpstate
	.word 0x8b464000  ! 39: RD_STICK_CMPR_REG	rd	%-, %r5
	.word 0x85464000  ! 40: RD_STICK_CMPR_REG	rd	%-, %r2
	.word 0x8d902f99  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x0f99, %pstate
	.word 0x87802020  ! 42: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xa190200c  ! 43: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x879020ce  ! 44: WRPR_TT_I	wrpr	%r0, 0x00ce, %tt
DS_1_9:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
DS_1_10:
	.word 0x20800001  ! 47: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 46: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 47: BL	bl,a	<label_0x1>
DS_1_11:
	.word 0x22800001  ! 49: BE	be,a	<label_0x1>
	pdist %f2, %f0, %f24
	.word 0x99b4c317  ! 48: ALLIGNADDRESS	alignaddr	%r19, %r23, %r12
	.word 0xa1902002  ! 49: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd65fe001  ! 50: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d804a0  ! 51: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0xd68008a0  ! 52: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x879023f8  ! 53: WRPR_TT_I	wrpr	%r0, 0x03f8, %tt
splash_htba_1_12:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 54: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d903a97  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x1a97, %pstate
	.word 0xd617e001  ! 56: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0x87902293  ! 57: WRPR_TT_I	wrpr	%r0, 0x0293, %tt
	.word 0xd6800a80  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r11
splash_tba_1_13:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879021ae  ! 60: WRPR_TT_I	wrpr	%r0, 0x01ae, %tt
	.word 0x91d02032  ! 61: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd68008a0  ! 62: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_1_14:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb182a001  ! 63: WR_STICK_REG_I	wr	%r10, 0x0001, %-
	.word 0xd6d7e020  ! 64: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	.word 0x8d902a73  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x0a73, %pstate
	.word 0x26700001  ! 66: BPL	<illegal instruction>
	.word 0xb750c000  ! 67: RDPR_TT	<illegal instruction>
	.word 0x8d902591  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x0591, %pstate
	.word 0x30800001  ! 69: BA	ba,a	<label_0x1>
splash_lsu_1_15:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 70: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d902a4b  ! 71: WRPR_PSTATE_I	wrpr	%r0, 0x0a4b, %pstate
splash_lsu_1_16:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 72: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 73: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xe137c009  ! 74: STQF_R	-	%f16, [%r9, %r31]
	.word 0xe057c000  ! 75: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0x8198254e  ! 76: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054e, %hpstate
splash_tba_1_17:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 77: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802000  ! 78: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_htba_1_18:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_1_19:
	taddcctv %r1, 0x118b, %r10
	.word 0xe007e001  ! 80: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8d902e3b  ! 81: WRPR_PSTATE_I	wrpr	%r0, 0x0e3b, %pstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 82: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 83: BNE	bne,a	<label_0x1>
	.word 0x91d020b4  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x8790229b  ! 85: WRPR_TT_I	wrpr	%r0, 0x029b, %tt
	.word 0xe0d7e030  ! 86: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
	.word 0xa5504000  ! 87: RDPR_TNPC	<illegal instruction>
	.word 0x91d02035  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x26700001  ! 89: BPL	<illegal instruction>
	.word 0x8d9023ab  ! 90: WRPR_PSTATE_I	wrpr	%r0, 0x03ab, %pstate
	.word 0x9f802001  ! 91: SIR	sir	0x0001
	.word 0x83d020b4  ! 92: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0x819824c7  ! 93: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c7, %hpstate
	.word 0xc24fc000  ! 94: LDSB_R	ldsb	[%r31 + %r0], %r1
DS_1_20:
	.word 0x32800001  ! 96: BNE	bne,a	<label_0x1>
	.xword 0x8f47c60f	! Random illegal ?
	.word 0xd3130005  ! 96: LDQF_R	-	[%r12, %r5], %f9
	.word 0xb3a4c82c  ! 95: FADDs	fadds	%f19, %f12, %f25
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 96: Tcc_R	te	icc_or_xcc, %r0 + %r30
tagged_1_21:
	taddcctv %r18, 0x17cb, %r15
	.word 0xc007e001  ! 97: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x2a800001  ! 98: BCS	bcs,a	<label_0x1>
	.word 0xc08804a0  ! 99: LDUBA_R	lduba	[%r0, %r0] 0x25, %r0
	.word 0xa1902003  ! 100: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xc017c000  ! 101: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc03fe001  ! 102: STD_I	std	%r0, [%r31 + 0x0001]
	.word 0x93902006  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc08008a0  ! 104: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x93902000  ! 105: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81460000  ! 106: RD_STICK_REG	stbar
	.word 0xc01fc000  ! 107: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x81982c15  ! 108: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c15, %hpstate
	.word 0xc0c7e020  ! 109: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r0
	.word 0x8d902884  ! 110: WRPR_PSTATE_I	wrpr	%r0, 0x0884, %pstate
	.word 0x83500000  ! 111: RDPR_TPC	<illegal instruction>
	.word 0x95500000  ! 112: RDPR_TPC	<illegal instruction>
splash_cmpr_1_22:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1806001  ! 113: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0xe097e010  ! 114: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r16
tagged_1_23:
	taddcctv %r24, 0x1ed1, %r10
	.word 0xe007e001  ! 115: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe0d7e030  ! 116: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r16
	.word 0x81982106  ! 117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0106, %hpstate
	.word 0xe0d804a0  ! 118: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	ta	T_CHANGE_HPRIV	! macro
DS_1_24:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 120: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_tba_1_25:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 121: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0d804a0  ! 122: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	.word 0x9f802001  ! 123: SIR	sir	0x0001
	.word 0x81982e56  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e56, %hpstate
	.word 0xe0dfe010  ! 125: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r16
	.word 0x879022a6  ! 126: WRPR_TT_I	wrpr	%r0, 0x02a6, %tt
	.word 0x879022b6  ! 127: WRPR_TT_I	wrpr	%r0, 0x02b6, %tt
	.word 0xe01fc000  ! 128: LDD_R	ldd	[%r31 + %r0], %r16
change_to_randtl_1_26:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 129: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8d903946  ! 130: WRPR_PSTATE_I	wrpr	%r0, 0x1946, %pstate
splash_lsu_1_27:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902001  ! 133: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1810010  ! 132: WR_STICK_REG_R	wr	%r4, %r16, %-
	.word 0x81982816  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0816, %hpstate
	.word 0xe0800a60  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r16
change_to_randtl_1_29:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 135: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe08008a0  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x93902005  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d903cd6  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x1cd6, %pstate
	.word 0x98fe2001  ! 139: SDIVcc_I	sdivcc 	%r24, 0x0001, %r12
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 140: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902004  ! 141: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xca8008a0  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x87802014  ! 143: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8d90366b  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x166b, %pstate
	.word 0x8d9024fb  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x04fb, %pstate
	.word 0xcad004a0  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
DS_1_30:
	.word 0x20800001  ! 148: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
DS_1_31:
	.word 0x20800001  ! 149: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 148: SAVE_R	save	%r31, %r0, %r31
	.word 0xca8008a0  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xca97e010  ! 150: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r5
	.word 0xb26e400a  ! 151: UDIVX_R	udivx 	%r25, %r10, %r25
	.word 0xc84fe001  ! 152: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0xc8c80e60  ! 153: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r4
	.word 0xc89fe001  ! 154: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
splash_tba_1_32:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc827e001  ! 156: STW_I	stw	%r4, [%r31 + 0x0001]
	.word 0xc8d004a0  ! 157: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_lsu_1_33:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x89514000  ! 159: RDPR_TBA	<illegal instruction>
	.word 0xd737c018  ! 160: STQF_R	-	%f11, [%r24, %r31]
	.word 0xd61fc000  ! 161: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd6c7e030  ! 162: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
	.word 0xd6dfe030  ! 163: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	.word 0x9145c000  ! 164: RD_TICK_CMPR_REG	rd	%-, %r8
	.word 0x8b508000  ! 165: RDPR_TSTATE	<illegal instruction>
	.word 0xd89fe001  ! 166: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 167: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 168: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd8900e60  ! 169: LDUHA_R	lduha	[%r0, %r0] 0x73, %r12
	.word 0x81982755  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0755, %hpstate
	.word 0xd84fc000  ! 171: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x819824cc  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cc, %hpstate
	.word 0x8d9021f3  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x01f3, %pstate
	.word 0x9f802001  ! 174: SIR	sir	0x0001
DS_1_34:
	.word 0x34800001  ! 176: BG	bg,a	<label_0x1>
	pdist %f10, %f28, %f6
	.word 0xa3b20305  ! 175: ALLIGNADDRESS	alignaddr	%r8, %r5, %r17
DS_1_35:
	.word 0x32800001  ! 177: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 176: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0xb2, %r30
	.word 0x93d0001e  ! 177: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_1_36:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 178: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902008  ! 179: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d903bb8  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x1bb8, %pstate
	.word 0x93902000  ! 181: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_1_37:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 182: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb0, %r30
	.word 0x83d0001e  ! 183: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d9031da  ! 184: WRPR_PSTATE_I	wrpr	%r0, 0x11da, %pstate
	.word 0x93d02033  ! 185: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xe2d00e80  ! 186: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r17
	.word 0x819824cd  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cd, %hpstate
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 188: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903f15  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x1f15, %pstate
splash_tba_1_38:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 190: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902000  ! 191: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902008  ! 192: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x91d020b5  ! 193: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x879020ff  ! 194: WRPR_TT_I	wrpr	%r0, 0x00ff, %tt
	.word 0x91d02033  ! 195: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9b51c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0x8d902c55  ! 197: WRPR_PSTATE_I	wrpr	%r0, 0x0c55, %pstate
	.word 0x83d02035  ! 198: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xd607c000  ! 199: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x91d02035  ! 200: Tcc_I	ta	icc_or_xcc, %r0 + 53
tagged_1_39:
	taddcctv %r3, 0x1894, %r3
	.word 0xd607e001  ! 201: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x81508000  ! 202: RDPR_TSTATE	<illegal instruction>
	.word 0xc48804a0  ! 203: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc48008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc48008a0  ! 205: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
change_to_randtl_1_40:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 206: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc4800ae0  ! 207: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02035  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x83d020b5  ! 210: Tcc_I	te	icc_or_xcc, %r0 + 181
	ta	T_CHANGE_PRIV	! macro
	.word 0x32800001  ! 212: BNE	bne,a	<label_0x1>
	.word 0x81982f15  ! 213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f15, %hpstate
	.word 0xa1902002  ! 214: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_tba_1_41:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 215: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_1_42:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc48008a0  ! 217: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802055  ! 219: WRASI_I	wr	%r0, 0x0055, %asi
DS_1_43:
	.word 0x22800001  ! 221: BE	be,a	<label_0x1>
	.word 0xc1342001  ! 221: STQF_I	-	%f0, [0x0001, %r16]
	normalw
	.word 0x8f458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r7
splash_lsu_1_44:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 221: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xeec80e60  ! 222: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r23
	.word 0xa750c000  ! 223: RDPR_TT	<illegal instruction>
	.word 0x8d802000  ! 224: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87802020  ! 225: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xce800ae0  ! 226: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r7
	.word 0x87802014  ! 227: WRASI_I	wr	%r0, 0x0014, %asi
splash_tba_1_45:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 228: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x34700001  ! 229: BPG	<illegal instruction>
	.word 0xb7508000  ! 230: RDPR_TSTATE	<illegal instruction>
	.word 0x879020ab  ! 231: WRPR_TT_I	wrpr	%r0, 0x00ab, %tt
tagged_1_46:
	tsubcctv %r19, 0x125a, %r3
	.word 0xe207e001  ! 232: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x87902278  ! 233: WRPR_TT_I	wrpr	%r0, 0x0278, %tt
	.word 0xe28008a0  ! 234: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x8caac004  ! 235: ANDNcc_R	andncc 	%r11, %r4, %r6
DS_1_47:
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 236: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982d9c  ! 237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9c, %hpstate
	.word 0x8780201c  ! 238: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8790226d  ! 239: WRPR_TT_I	wrpr	%r0, 0x026d, %tt
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 240: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc61fe001  ! 241: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x2c800001  ! 242: BNEG	bneg,a	<label_0x1>
	.word 0xc6c7e010  ! 243: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
	.word 0x8d9035df  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x15df, %pstate
	.word 0x8d9024ab  ! 245: WRPR_PSTATE_I	wrpr	%r0, 0x04ab, %pstate
	.word 0x87902162  ! 246: WRPR_TT_I	wrpr	%r0, 0x0162, %tt
splash_lsu_1_48:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x28700001  ! 248: BPLEU	<illegal instruction>
	.word 0xc607c000  ! 249: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0xc68804a0  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 251: LDQF_R	-	[%r31, %r0], %f3
tagged_1_49:
	taddcctv %r7, 0x109c, %r26
	.word 0xc607e001  ! 252: LDUW_I	lduw	[%r31 + 0x0001], %r3
change_to_randtl_1_50:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 253: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc6800ae0  ! 254: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r3
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 255: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 256: SIR	sir	0x0001
change_to_randtl_1_51:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 257: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xc6800b40  ! 258: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r3
	.word 0xc657c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r3
DS_1_52:
	.word 0x32800001  ! 261: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 260: SAVE_R	save	%r31, %r0, %r31
splash_lsu_1_53:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 262: BPN	<illegal instruction>
	.word 0x87802010  ! 263: WRASI_I	wr	%r0, 0x0010, %asi
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 264: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d903ef9  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x1ef9, %pstate
	.word 0xc61fc000  ! 266: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xc61fc000  ! 267: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x8d802000  ! 268: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_1_54:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 269: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8d903ec4  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x1ec4, %pstate
	.word 0x819829dc  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09dc, %hpstate
	.word 0x87802004  ! 272: WRASI_I	wr	%r0, 0x0004, %asi
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 273: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8790210a  ! 274: WRPR_TT_I	wrpr	%r0, 0x010a, %tt
	.word 0x81982f9c  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f9c, %hpstate
	.word 0x879022b7  ! 276: WRPR_TT_I	wrpr	%r0, 0x02b7, %tt
	.word 0x83d02035  ! 277: Tcc_I	te	icc_or_xcc, %r0 + 53
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 278: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xc68008a0  ! 279: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x93902004  ! 280: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902231  ! 281: WRPR_TT_I	wrpr	%r0, 0x0231, %tt
splash_tba_1_55:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 282: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc6800b00  ! 283: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r3
	.word 0xc6c80e40  ! 284: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r3
splash_cmpr_1_56:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1822001  ! 285: WR_STICK_REG_I	wr	%r8, 0x0001, %-
	.word 0x8d902841  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x0841, %pstate
splash_htba_1_57:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 287: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d903893  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x1893, %pstate
	.word 0x34700001  ! 289: BPG	<illegal instruction>
splash_cmpr_1_58:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 290: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0x93902005  ! 291: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802058  ! 293: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x91d020b5  ! 294: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0xa1902003  ! 295: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xb7a00578  ! 296: FSQRTq	fsqrt	
	.word 0x91d02033  ! 297: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_1_59:
	.word 0x20800001  ! 299: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 299: BG	bg,a	<label_0x1>
	.word 0x99a0054d  ! 299: FSQRTd	fsqrt	
	.word 0xb1a3082a  ! 298: FADDs	fadds	%f12, %f10, %f24
	.word 0xc6800c80  ! 299: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r3
	.word 0xc68804a0  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
splash_tba_1_60:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 301: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc647e001  ! 302: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x99902002  ! 303: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x93902007  ! 304: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	otherw
	mov 0xb1, %r30
	.word 0x93d0001e  ! 305: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_1_61:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b4  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xc68008a0  ! 308: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x81982517  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0517, %hpstate
splash_lsu_1_62:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc69004a0  ! 311: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x87802014  ! 312: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x91d02034  ! 313: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d90371d  ! 314: WRPR_PSTATE_I	wrpr	%r0, 0x171d, %pstate
	.word 0x879021e9  ! 315: WRPR_TT_I	wrpr	%r0, 0x01e9, %tt
	.word 0x91d02032  ! 316: Tcc_I	ta	icc_or_xcc, %r0 + 50
splash_tba_1_63:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 317: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc69fc020  ! 318: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
splash_lsu_1_64:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 320: BN	bn,a	<label_0x1>
	.word 0x8d9027f8  ! 321: WRPR_PSTATE_I	wrpr	%r0, 0x07f8, %pstate
DS_1_65:
	.word 0x20800001  ! 323: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 322: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902000  ! 324: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1810011  ! 323: WR_STICK_REG_R	wr	%r4, %r17, %-
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 324: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_1_67:
	taddcctv %r15, 0x1ae7, %r17
	.word 0xc607e001  ! 325: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_tba_1_68:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 326: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 328: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1818011  ! 327: WR_STICK_REG_R	wr	%r6, %r17, %-
	.word 0xaf508000  ! 328: RDPR_TSTATE	<illegal instruction>
splash_lsu_1_70:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 329: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d802000  ! 331: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02035  ! 332: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902004  ! 333: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	otherw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 334: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 335: Tcc_I	ta	icc_or_xcc, %r0 + 53
DS_1_71:
	.word 0x34800001  ! 337: BG	bg,a	<label_0x1>
	pdist %f22, %f14, %f14
	.word 0x97b40300  ! 336: ALLIGNADDRESS	alignaddr	%r16, %r0, %r11
tagged_1_72:
	tsubcctv %r9, 0x153d, %r7
	.word 0xd807e001  ! 337: LDUW_I	lduw	[%r31 + 0x0001], %r12
tagged_1_73:
	taddcctv %r3, 0x1cee, %r6
	.word 0xd807e001  ! 338: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x87902380  ! 339: WRPR_TT_I	wrpr	%r0, 0x0380, %tt
	.word 0x82d22001  ! 340: UMULcc_I	umulcc 	%r8, 0x0001, %r1
	.word 0x93902005  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_1_74:
	tsubcctv %r22, 0x1f1c, %r18
	.word 0xc407e001  ! 342: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x93902005  ! 343: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc48008a0  ! 344: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc4800c80  ! 345: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r2
tagged_1_75:
	taddcctv %r4, 0x1ab5, %r17
	.word 0xc407e001  ! 346: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_1_76:
	.word 0x22800001  ! 348: BE	be,a	<label_0x1>
	.xword 0xad6a4cf9	! Random illegal ?
	.word 0xdb10c005  ! 348: LDQF_R	-	[%r3, %r5], %f13
	.word 0x95a68834  ! 347: FADDs	fadds	%f26, %f20, %f10
	.word 0x91d020b5  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x8f514000  ! 349: RDPR_TBA	<illegal instruction>
	.word 0x8d902ee9  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x0ee9, %pstate
	.word 0xd0c80e40  ! 351: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r8
DS_1_77:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 352: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xd017e001  ! 353: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0xaf514000  ! 354: RDPR_TBA	<illegal instruction>
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x3e700001  ! 356: BPVC	<illegal instruction>
	.word 0x87902236  ! 357: WRPR_TT_I	wrpr	%r0, 0x0236, %tt
splash_lsu_1_78:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 358: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_79:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 359: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902006  ! 361: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe647c000  ! 362: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x87902254  ! 363: WRPR_TT_I	wrpr	%r0, 0x0254, %tt
	.word 0x38800001  ! 364: BGU	bgu,a	<label_0x1>
	.word 0xe6900e80  ! 365: LDUHA_R	lduha	[%r0, %r0] 0x74, %r19
	.word 0x87802014  ! 366: WRASI_I	wr	%r0, 0x0014, %asi
splash_lsu_1_80:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 367: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99540000  ! 368: RDPR_GL	<illegal instruction>
	.word 0xc8800c00  ! 369: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r4
splash_lsu_1_81:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc81fc000  ! 371: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xa190200e  ! 372: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xc807c000  ! 373: LDUW_R	lduw	[%r31 + %r0], %r4
splash_lsu_1_82:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 374: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f494000  ! 375: RDHPR_HTBA	rdhpr	%htba, %r7
	.word 0x81982fd4  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd4, %hpstate
splash_lsu_1_83:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_1_84:
	tsubcctv %r7, 0x1ff0, %r16
	.word 0xc807e001  ! 379: LDUW_I	lduw	[%r31 + 0x0001], %r4
change_to_randtl_1_85:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 380: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x91d02034  ! 381: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xc8d004a0  ! 382: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_tba_1_86:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 383: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_1_87:
	.word 0x32800001  ! 386: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 386: BG	bg,a	<label_0x1>
	.word 0xdb134012  ! 386: LDQF_R	-	[%r13, %r18], %f13
	.word 0xa9a24830  ! 385: FADDs	fadds	%f9, %f16, %f20
	.word 0x9f802001  ! 386: SIR	sir	0x0001
splash_tba_1_88:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 387: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x3c700001  ! 388: BPPOS	<illegal instruction>
DS_1_89:
	.word 0x34800001  ! 390: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 389: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802010  ! 390: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x83508000  ! 391: RDPR_TSTATE	<illegal instruction>
	.word 0x20700001  ! 392: BPN	<illegal instruction>
splash_lsu_1_90:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 394: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0xd48fe000  ! 395: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r10
	.word 0x81982a4e  ! 396: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4e, %hpstate
	.word 0x32800001  ! 397: BNE	bne,a	<label_0x1>
tagged_1_91:
	taddcctv %r17, 0x1f4c, %r7
	.word 0xd407e001  ! 398: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d9024fc  ! 399: WRPR_PSTATE_I	wrpr	%r0, 0x04fc, %pstate
	.word 0x81982f87  ! 400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f87, %hpstate
DS_1_92:
	.word 0x20800001  ! 402: BN	bn,a	<label_0x1>
	pdist %f6, %f0, %f0
	.word 0xafb54311  ! 401: ALLIGNADDRESS	alignaddr	%r21, %r17, %r23
	.word 0xec8008a0  ! 402: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r22
	.word 0x93902000  ! 403: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
splash_lsu_1_93:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 404: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902003  ! 405: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d9023c3  ! 406: WRPR_PSTATE_I	wrpr	%r0, 0x03c3, %pstate
	.word 0x8d90228f  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x028f, %pstate
tagged_1_94:
	tsubcctv %r11, 0x1124, %r7
	.word 0xec07e001  ! 408: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x93d020b2  ! 409: Tcc_I	tne	icc_or_xcc, %r0 + 178
tagged_1_95:
	taddcctv %r20, 0x1ce8, %r8
	.word 0xec07e001  ! 410: LDUW_I	lduw	[%r31 + 0x0001], %r22
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 411: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xecd00e40  ! 412: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r22
	.word 0x879023ad  ! 413: WRPR_TT_I	wrpr	%r0, 0x03ad, %tt
tagged_1_96:
	tsubcctv %r9, 0x1b6c, %r7
	.word 0xec07e001  ! 414: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x93902006  ! 415: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x99480000  ! 416: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x8790217b  ! 417: WRPR_TT_I	wrpr	%r0, 0x017b, %tt
	.word 0xd64fe001  ! 418: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0xd6800c60  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r11
	.word 0x93902000  ! 420: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa150c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0x8f902000  ! 423: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8986400b  ! 422: WRTICK_R	wr	%r25, %r11, %tick
	.word 0xc6dfe030  ! 423: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r3
	.word 0xa3494000  ! 424: RDHPR_HTBA	rdhpr	%htba, %r17
	.word 0x99a4c9ea  ! 425: FDIVq	dis not found

	.word 0xa3514000  ! 426: RDPR_TBA	<illegal instruction>
	.word 0x32700001  ! 427: BPNE	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee07c000  ! 429: LDUW_R	lduw	[%r31 + %r0], %r23
	.word 0x81982f86  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f86, %hpstate
	.word 0xa1902004  ! 431: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_lsu_1_98:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 432: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xee8008a0  ! 433: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r23
splash_tba_1_99:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 434: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x2a800001  ! 435: BCS	bcs,a	<label_0x1>
	.word 0x91d02033  ! 436: Tcc_I	ta	icc_or_xcc, %r0 + 51
DS_1_100:
	.word 0x20800001  ! 438: BN	bn,a	<label_0x1>
	.word 0xc3306001  ! 438: STQF_I	-	%f1, [0x0001, %r1]
	normalw
	.word 0x8b458000  ! 437: RD_SOFTINT_REG	rd	%softint, %r5
tagged_1_101:
	taddcctv %r23, 0x1c53, %r8
	.word 0xcc07e001  ! 438: LDUW_I	lduw	[%r31 + 0x0001], %r6
tagged_1_102:
	tsubcctv %r17, 0x1b9b, %r11
	.word 0xcc07e001  ! 439: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x87802055  ! 440: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8790208e  ! 441: WRPR_TT_I	wrpr	%r0, 0x008e, %tt
	.word 0x819827d7  ! 442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d7, %hpstate
	.word 0x93902004  ! 443: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
splash_lsu_1_103:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 444: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 445: BPN	<illegal instruction>
splash_lsu_1_104:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 446: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc8008a0  ! 447: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
splash_lsu_1_105:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 448: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_1_106:
	tsubcctv %r11, 0x1d7e, %r12
	.word 0xcc07e001  ! 449: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc9fc020  ! 450: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x819825cf  ! 451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cf, %hpstate
	.word 0xccdfe030  ! 452: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
	.word 0x93902003  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
tagged_1_107:
	taddcctv %r19, 0x1480, %r16
	.word 0xcc07e001  ! 454: LDUW_I	lduw	[%r31 + 0x0001], %r6
	invalw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 455: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 456: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xccc7e010  ! 457: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r6
	.word 0x87802020  ! 458: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x91d02032  ! 459: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8198279e  ! 460: WRHPR_HPSTATE_I	wrhpr	%r0, 0x079e, %hpstate
	.word 0x81982c55  ! 461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c55, %hpstate
splash_lsu_1_108:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 462: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc800b60  ! 463: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r6
	.word 0xab500000  ! 464: RDPR_TPC	<illegal instruction>
	.word 0x91d02032  ! 465: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d903198  ! 466: WRPR_PSTATE_I	wrpr	%r0, 0x1198, %pstate
	.word 0xc717c000  ! 467: LDQF_R	-	[%r31, %r0], %f3
	.word 0xa190200d  ! 468: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x93902002  ! 469: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902004  ! 470: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xb1464000  ! 471: RD_STICK_CMPR_REG	rd	%-, %r24
	.word 0x87802016  ! 472: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xd8c004a0  ! 473: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
splash_tba_1_109:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 474: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd88008a0  ! 475: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
DS_1_110:
	.word 0x34800001  ! 477: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 476: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902007  ! 477: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1902003  ! 478: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_tba_1_111:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 479: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902004  ! 480: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87802058  ! 481: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd88008a0  ! 482: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x2e800001  ! 483: BVS	bvs,a	<label_0x1>
splash_lsu_1_112:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 484: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd8800c00  ! 485: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r12
	.word 0x93902002  ! 486: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902630  ! 487: WRPR_PSTATE_I	wrpr	%r0, 0x0630, %pstate
splash_tba_1_113:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902006  ! 489: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd8c80e60  ! 490: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r12
	.word 0xd89fe001  ! 491: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x81a01a69  ! 492: FqTOi	fqtoi	
tagged_1_114:
	tsubcctv %r25, 0x10c4, %r11
	.word 0xf607e001  ! 493: LDUW_I	lduw	[%r31 + 0x0001], %r27
DS_1_115:
	.word 0x32800001  ! 495: BNE	bne,a	<label_0x1>
	pdist %f8, %f12, %f26
	.word 0x93b64316  ! 494: ALLIGNADDRESS	alignaddr	%r25, %r22, %r9
	.word 0xda57e001  ! 495: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0x87802080  ! 496: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802058  ! 497: WRASI_I	wr	%r0, 0x0058, %asi
splash_lsu_1_116:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 498: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902007  ! 499: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xda9fe001  ! 500: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xdadfe030  ! 501: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r13
DS_1_117:
	.word 0x20800001  ! 503: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 502: SAVE_R	save	%r31, %r0, %r31
tagged_1_118:
	tsubcctv %r25, 0x12cf, %r26
	.word 0xda07e001  ! 503: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdad7e010  ! 504: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r13
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 505: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d500000  ! 506: RDPR_TPC	<illegal instruction>
DS_1_119:
	.word 0x20800001  ! 508: BN	bn,a	<label_0x1>
	pdist %f18, %f28, %f28
	.word 0x8bb50307  ! 507: ALLIGNADDRESS	alignaddr	%r20, %r7, %r5
DS_1_120:
	.word 0x32800001  ! 509: BNE	bne,a	<label_0x1>
	.xword 0x91d83a36	! Random illegal ?
	.word 0xf712401b  ! 509: LDQF_R	-	[%r9, %r27], %f27
	.word 0x89a14822  ! 508: FADDs	fadds	%f5, %f2, %f4
tagged_1_121:
	taddcctv %r4, 0x1d24, %r10
	.word 0xc807e001  ! 509: LDUW_I	lduw	[%r31 + 0x0001], %r4
splash_tba_1_122:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 510: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902009  ! 511: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x87902152  ! 512: WRPR_TT_I	wrpr	%r0, 0x0152, %tt
	.word 0xc817e001  ! 513: LDUH_I	lduh	[%r31 + 0x0001], %r4
	.word 0x87902151  ! 514: WRPR_TT_I	wrpr	%r0, 0x0151, %tt
	.word 0x9b50c000  ! 515: RDPR_TT	<illegal instruction>
	.word 0xb5508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0x22700001  ! 517: BPE	<illegal instruction>
change_to_randtl_1_123:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 518: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xa190200c  ! 519: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd8800c80  ! 520: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r12
	.word 0x81982e85  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e85, %hpstate
	.word 0x8f480000  ! 522: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x83d02034  ! 523: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x81982715  ! 524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0715, %hpstate
	.word 0xaf504000  ! 525: RDPR_TNPC	<illegal instruction>
splash_htba_1_124:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 526: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe44fc000  ! 527: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe44fe001  ! 528: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02033  ! 530: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe4d7e030  ! 531: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r18
tagged_1_125:
	taddcctv %r13, 0x1101, %r24
	.word 0xe407e001  ! 532: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x8790206b  ! 533: WRPR_TT_I	wrpr	%r0, 0x006b, %tt
	.word 0xe4bfc037  ! 534: STDA_R	stda	%r18, [%r31 + %r23] 0x01
	.word 0xe40fe001  ! 535: LDUB_I	ldub	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe527e001  ! 537: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe527e001  ! 538: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe4d7e020  ! 539: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r18
	.word 0x81982547  ! 540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0547, %hpstate
tagged_1_126:
	tsubcctv %r24, 0x1f7a, %r18
	.word 0xe407e001  ! 541: LDUW_I	lduw	[%r31 + 0x0001], %r18
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 542: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_1_127:
	taddcctv %r13, 0x19d9, %r5
	.word 0xe407e001  ! 543: LDUW_I	lduw	[%r31 + 0x0001], %r18
splash_tba_1_128:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 544: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 545: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe45fe001  ! 546: LDX_I	ldx	[%r31 + 0x0001], %r18
	.word 0xe497e000  ! 547: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xe407c000  ! 548: LDUW_R	lduw	[%r31 + %r0], %r18
DS_1_129:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 549: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xe48008a0  ! 550: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe417c000  ! 551: LDUH_R	lduh	[%r31 + %r0], %r18
	.word 0x91d020b2  ! 552: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x9f802001  ! 553: SIR	sir	0x0001
	.word 0xe49fe001  ! 554: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
DS_1_130:
	.word 0x34800001  ! 556: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 555: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x30700001  ! 556: BPA	<illegal instruction>
	.word 0x87802014  ! 557: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x8780201c  ! 558: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xe4c804a0  ! 559: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0xe44fe001  ! 560: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	.word 0x91d02035  ! 561: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_lsu_1_131:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 562: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe48008a0  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x879021e8  ! 564: WRPR_TT_I	wrpr	%r0, 0x01e8, %tt
	.word 0x8198234d  ! 565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034d, %hpstate
splash_lsu_1_132:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 566: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe42fe001  ! 567: STB_I	stb	%r18, [%r31 + 0x0001]
	.word 0xa190200c  ! 568: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8790230d  ! 569: WRPR_TT_I	wrpr	%r0, 0x030d, %tt
	.word 0xe4d00e60  ! 570: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r18
	.word 0x91d020b2  ! 571: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe4880e80  ! 572: LDUBA_R	lduba	[%r0, %r0] 0x74, %r18
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 573: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_1_133:
	.word 0x20800001  ! 575: BN	bn,a	<label_0x1>
	.word 0xe5310019  ! 575: STQF_R	-	%f18, [%r25, %r4]
	normalw
	.word 0x97458000  ! 574: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0x879021d2  ! 575: WRPR_TT_I	wrpr	%r0, 0x01d2, %tt
	.word 0xf217c000  ! 576: LDUH_R	lduh	[%r31 + %r0], %r25
	.word 0xf2800b80  ! 577: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r25
	.word 0x8f902000  ! 579: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa36ea001  ! 578: SDIVX_I	sdivx	%r26, 0x0001, %r17
	.word 0x91d020b4  ! 579: Tcc_I	ta	icc_or_xcc, %r0 + 180
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802010  ! 581: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x87902361  ! 582: WRPR_TT_I	wrpr	%r0, 0x0361, %tt
	.word 0x93902005  ! 583: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe2900e80  ! 584: LDUHA_R	lduha	[%r0, %r0] 0x74, %r17
	.word 0x87802004  ! 585: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe2880e80  ! 586: LDUBA_R	lduba	[%r0, %r0] 0x74, %r17
	.word 0x87802058  ! 587: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x8d902adc  ! 588: WRPR_PSTATE_I	wrpr	%r0, 0x0adc, %pstate
	.word 0x81982bdf  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdf, %hpstate
splash_lsu_1_135:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 590: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe21fe001  ! 591: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0xe28fe010  ! 592: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
tagged_1_136:
	tsubcctv %r6, 0x1504, %r22
	.word 0xe207e001  ! 593: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe21fe001  ! 594: LDD_I	ldd	[%r31 + 0x0001], %r17
splash_tba_1_137:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 595: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d902ff6  ! 596: WRPR_PSTATE_I	wrpr	%r0, 0x0ff6, %pstate
	.word 0xa1902002  ! 597: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 598: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982d55  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d55, %hpstate
	.word 0x93902002  ! 600: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xe297e010  ! 601: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r17
	.word 0x8d902a44  ! 602: WRPR_PSTATE_I	wrpr	%r0, 0x0a44, %pstate
splash_tba_1_138:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 603: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28fe000  ! 605: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r17
	.word 0x87802004  ! 606: WRASI_I	wr	%r0, 0x0004, %asi
change_to_randtl_1_139:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 607: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe2800b40  ! 608: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r17
DS_1_140:
	.word 0x32800001  ! 610: BNE	bne,a	<label_0x1>
	.xword 0x93638cf7	! Random illegal ?
	.word 0xb5a00543  ! 610: FSQRTd	fsqrt	
	.word 0xafa20826  ! 609: FADDs	fadds	%f8, %f6, %f23
	.word 0x87802089  ! 610: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902490  ! 611: WRPR_PSTATE_I	wrpr	%r0, 0x0490, %pstate
	.word 0x87902297  ! 612: WRPR_TT_I	wrpr	%r0, 0x0297, %tt
splash_tba_1_141:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 613: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0d004a0  ! 614: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r24
splash_htba_1_142:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 615: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_1_143:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 616: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_1_144:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 617: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902001  ! 618: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93902006  ! 619: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d90200c  ! 620: WRPR_PSTATE_I	wrpr	%r0, 0x000c, %pstate
	ta	T_CHANGE_HPRIV	! macro
splash_tba_1_145:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 622: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xb7514000  ! 623: RDPR_TBA	<illegal instruction>
tagged_1_146:
	tsubcctv %r25, 0x179f, %r7
	.word 0xd207e001  ! 624: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x87802055  ! 625: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8b480000  ! 626: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x87902073  ! 627: WRPR_TT_I	wrpr	%r0, 0x0073, %tt
tagged_1_147:
	taddcctv %r16, 0x1fe1, %r7
	.word 0xca07e001  ! 628: LDUW_I	lduw	[%r31 + 0x0001], %r5
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 629: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca47c000  ! 630: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0x91d02033  ! 631: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902257  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x0257, %pstate
	.word 0x93d020b5  ! 633: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x83d02035  ! 634: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x87802016  ! 635: WRASI_I	wr	%r0, 0x0016, %asi
tagged_1_148:
	tsubcctv %r21, 0x1e3e, %r26
	.word 0xca07e001  ! 636: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x26800001  ! 637: BL	bl,a	<label_0x1>
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 638: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 640: SIR	sir	0x0001
	.word 0x36700001  ! 641: BPGE	<illegal instruction>
	.word 0x8d902b46  ! 642: WRPR_PSTATE_I	wrpr	%r0, 0x0b46, %pstate
	.word 0xca8008a0  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
splash_lsu_1_149:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 644: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x9551c000  ! 645: RDPR_TL	<illegal instruction>
splash_lsu_1_150:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 646: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d903daf  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x1daf, %pstate
DS_1_151:
	.word 0x22800001  ! 649: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 648: SAVE_R	save	%r31, %r0, %r31
DS_1_152:
	.word 0x32800001  ! 650: BNE	bne,a	<label_0x1>
	.xword 0xd1e2eade	! Random illegal ?
	.word 0xcd158002  ! 650: LDQF_R	-	[%r22, %r2], %f6
	.word 0xa7a00820  ! 649: FADDs	fadds	%f0, %f0, %f19
	.word 0x8f902000  ! 651: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1834018  ! 650: WR_STICK_REG_R	wr	%r13, %r24, %-
	.word 0xd997e001  ! 651: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0xd89fe001  ! 652: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x9f802001  ! 653: SIR	sir	0x0001
	.word 0xd81fc000  ! 654: LDD_R	ldd	[%r31 + %r0], %r12
tagged_1_154:
	tsubcctv %r4, 0x1a22, %r22
	.word 0xd807e001  ! 655: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x8790226d  ! 656: WRPR_TT_I	wrpr	%r0, 0x026d, %tt
splash_tba_1_155:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 657: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_1_156:
	.word 0x32800001  ! 659: BNE	bne,a	<label_0x1>
	.word 0xe7346001  ! 659: STQF_I	-	%f19, [0x0001, %r17]
	normalw
	.word 0x8b458000  ! 658: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0xce4fc000  ! 659: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0x8d903663  ! 660: WRPR_PSTATE_I	wrpr	%r0, 0x1663, %pstate
	.word 0x34800001  ! 661: BG	bg,a	<label_0x1>
	.word 0x8d903029  ! 662: WRPR_PSTATE_I	wrpr	%r0, 0x1029, %pstate
DS_1_157:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 663: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x8198205c  ! 664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005c, %hpstate
tagged_1_158:
	tsubcctv %r14, 0x156e, %r15
	.word 0xce07e001  ! 665: LDUW_I	lduw	[%r31 + 0x0001], %r7
DS_1_159:
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0xa3a00544  ! 667: FSQRTd	fsqrt	
	.word 0x95a08824  ! 666: FADDs	fadds	%f2, %f4, %f10
	.word 0xe49fe001  ! 667: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0x93902000  ! 668: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d802000  ! 669: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xe48008a0  ! 671: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x99902000  ! 672: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xa1902001  ! 673: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8f45c000  ! 674: RD_TICK_CMPR_REG	rd	%-, %r7
	.word 0xecdfe000  ! 675: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r22
tagged_1_160:
	tsubcctv %r25, 0x1ea7, %r12
	.word 0xec07e001  ! 676: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0xed17c000  ! 677: LDQF_R	-	[%r31, %r0], %f22
	.word 0xafa2cdc0  ! 678: FdMULq	fdmulq	
	.word 0x97500000  ! 679: RDPR_TPC	<illegal instruction>
	.word 0xa190200b  ! 680: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8198268e  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068e, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 682: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_1_161:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 683: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc4c7e020  ! 684: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r2
	.word 0x87802088  ! 685: WRASI_I	wr	%r0, 0x0088, %asi
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 686: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc4c7e030  ! 687: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
	.word 0xc4880e80  ! 688: LDUBA_R	lduba	[%r0, %r0] 0x74, %r2
	.word 0xc49fc020  ! 689: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x81460000  ! 691: RD_STICK_REG	stbar
	.word 0x879020fd  ! 692: WRPR_TT_I	wrpr	%r0, 0x00fd, %tt
	.word 0xc4d804a0  ! 693: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0x8d90395d  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x195d, %pstate
	.word 0xa1902008  ! 695: WRPR_GL_I	wrpr	%r0, 0x0008, %-
DS_1_162:
	.word 0x22800001  ! 697: BE	be,a	<label_0x1>
	.word 0xd3326001  ! 697: STQF_I	-	%f9, [0x0001, %r9]
	normalw
	.word 0xa1458000  ! 696: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x99902005  ! 697: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
splash_tba_1_163:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 698: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc28008a0  ! 699: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc317c000  ! 700: LDQF_R	-	[%r31, %r0], %f1
tagged_1_164:
	tsubcctv %r19, 0x1bde, %r1
	.word 0xc207e001  ! 701: LDUW_I	lduw	[%r31 + 0x0001], %r1
tagged_1_165:
	taddcctv %r14, 0x1cfa, %r26
	.word 0xc207e001  ! 702: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc28008a0  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc29fe001  ! 705: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x87802080  ! 706: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x81982dde  ! 707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dde, %hpstate
	.word 0x83480000  ! 708: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0xf08804a0  ! 709: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x91d02035  ! 710: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902031  ! 711: WRPR_TT_I	wrpr	%r0, 0x0031, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902005  ! 713: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902db0  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x0db0, %pstate
	.word 0xf08fe000  ! 715: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r24
splash_tba_1_166:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0900e60  ! 717: LDUHA_R	lduha	[%r0, %r0] 0x73, %r24
	.word 0xa190200c  ! 718: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 719: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 721: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90246c  ! 722: WRPR_PSTATE_I	wrpr	%r0, 0x046c, %pstate
tagged_1_167:
	taddcctv %r1, 0x1de7, %r16
	.word 0xf007e001  ! 723: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0xf08804a0  ! 724: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0xf02fc009  ! 725: STB_R	stb	%r24, [%r31 + %r9]
	.word 0x87902078  ! 726: WRPR_TT_I	wrpr	%r0, 0x0078, %tt
	.word 0xf08804a0  ! 727: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x87802089  ! 728: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8198289c  ! 729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089c, %hpstate
	.word 0xf0800ae0  ! 730: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r24
	.word 0x2c700001  ! 731: BPNEG	<illegal instruction>
	.word 0x93902002  ! 732: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x83d02035  ! 733: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x93902002  ! 734: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x32700001  ! 735: BPNE	<illegal instruction>
	.word 0x8780204f  ! 736: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xf01fc000  ! 737: LDD_R	ldd	[%r31 + %r0], %r24
	.word 0x93902001  ! 738: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_1_168:
	.word 0x22800001  ! 740: BE	be,a	<label_0x1>
	allclean
	.word 0x9bb30309  ! 739: ALLIGNADDRESS	alignaddr	%r12, %r9, %r13
	.word 0x91d02032  ! 740: Tcc_I	ta	icc_or_xcc, %r0 + 50
DS_1_169:
	.word 0x34800001  ! 742: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 741: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802000  ! 742: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 743: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 744: BPE	<illegal instruction>
	.word 0xc407c000  ! 745: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x93902001  ! 746: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x3a700001  ! 747: BPCC	<illegal instruction>
	.word 0x8198258e  ! 748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x058e, %hpstate
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 749: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d500000  ! 750: RDPR_TPC	<illegal instruction>
splash_htba_1_170:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 751: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcc1fc000  ! 752: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x93902003  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902001  ! 754: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
splash_lsu_1_171:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 755: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902001  ! 756: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_1_172:
	.word 0x22800001  ! 758: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 757: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fc000  ! 758: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0xcc800c40  ! 759: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r6
	.word 0xa190200d  ! 760: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xcc4fc000  ! 761: LDSB_R	ldsb	[%r31 + %r0], %r6
DS_1_173:
	.word 0x22800001  ! 763: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 762: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fe001  ! 763: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x8198271e  ! 764: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071e, %hpstate
splash_tba_1_174:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 765: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcd97e001  ! 766: LDQFA_I	-	[%r31, 0x0001], %f6
	.word 0x83504000  ! 767: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0xb1540000  ! 768: RDPR_GL	<illegal instruction>
splash_lsu_1_175:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 769: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 770: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x876b0002  ! 771: SDIVX_R	sdivx	%r12, %r2, %r3
	.word 0x83508000  ! 772: RDPR_TSTATE	<illegal instruction>
	.word 0x8d903024  ! 773: WRPR_PSTATE_I	wrpr	%r0, 0x1024, %pstate
	.word 0x3e800001  ! 774: BVC	bvc,a	<label_0x1>
	.word 0xc2d00e80  ! 775: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r1
	.word 0x93902006  ! 776: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8780204f  ! 777: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8d903ee7  ! 778: WRPR_PSTATE_I	wrpr	%r0, 0x1ee7, %pstate
	.word 0x93d020b5  ! 779: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xc217c000  ! 780: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x87902101  ! 781: WRPR_TT_I	wrpr	%r0, 0x0101, %tt
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 782: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb1514000  ! 783: RDPR_TBA	<illegal instruction>
splash_lsu_1_176:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 784: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 785: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x93902004  ! 786: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8f480000  ! 787: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0xce17c000  ! 788: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0xcec7e030  ! 789: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r7
DS_1_177:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 790: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x9f802001  ! 791: SIR	sir	0x0001
	.word 0x87902192  ! 792: WRPR_TT_I	wrpr	%r0, 0x0192, %tt
splash_tba_1_178:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce8008a0  ! 794: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xcedfe000  ! 795: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r7
	.word 0x9f802001  ! 796: SIR	sir	0x0001
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 797: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce1fc000  ! 798: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0xce4fc000  ! 799: LDSB_R	ldsb	[%r31 + %r0], %r7
tagged_1_179:
	taddcctv %r12, 0x11d4, %r5
	.word 0xce07e001  ! 800: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x87802058  ! 801: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xa1902005  ! 802: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xce8008a0  ! 803: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x91d02035  ! 804: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_1_180:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 805: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_1_181:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 806: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 807: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902f5b  ! 808: WRPR_PSTATE_I	wrpr	%r0, 0x0f5b, %pstate
	.word 0x2e700001  ! 809: BPVS	<illegal instruction>
	.word 0xced7e020  ! 810: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r7
	.word 0x8790219b  ! 811: WRPR_TT_I	wrpr	%r0, 0x019b, %tt
splash_lsu_1_182:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 812: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902009  ! 813: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x38800001  ! 814: BGU	bgu,a	<label_0x1>
splash_lsu_1_183:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 815: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902002  ! 816: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa1902008  ! 817: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_lsu_1_184:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 818: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcec004a0  ! 819: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xa190200f  ! 820: WRPR_GL_I	wrpr	%r0, 0x000f, %-
splash_htba_1_185:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 821: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200a  ! 822: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xce800b20  ! 823: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r7
	.word 0xa190200a  ! 824: WRPR_GL_I	wrpr	%r0, 0x000a, %-
DS_1_186:
	.word 0x34800001  ! 826: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 825: SAVE_R	save	%r31, %r0, %r31
	.word 0x81a109c4  ! 826: FDIVd	fdivd	%f4, %f4, %f0
	.word 0x8f902001  ! 828: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93a01977  ! 827: FqTOd	dis not found

	.word 0xd647e001  ! 828: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x879021d3  ! 829: WRPR_TT_I	wrpr	%r0, 0x01d3, %tt
	.word 0x8f902001  ! 831: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa9a01963  ! 830: FqTOd	dis not found

splash_lsu_1_189:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 831: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9021c9  ! 832: WRPR_PSTATE_I	wrpr	%r0, 0x01c9, %pstate
	.word 0x93500000  ! 833: RDPR_TPC	<illegal instruction>
	.word 0x93902001  ! 834: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_1_190:
	.word 0x32800001  ! 836: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 835: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_1_191:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 837: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd01fe001  ! 838: LDD_I	ldd	[%r31 + 0x0001], %r8
splash_tba_1_192:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 839: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd04fe001  ! 840: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0x89a40dcc  ! 841: FdMULq	fdmulq	
	.word 0x87802088  ! 842: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8f902001  ! 844: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x936ee001  ! 843: SDIVX_I	sdivx	%r27, 0x0001, %r9
	.word 0xd41fe001  ! 844: LDD_I	ldd	[%r31 + 0x0001], %r10
splash_cmpr_1_194:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb180a001  ! 845: WR_STICK_REG_I	wr	%r2, 0x0001, %-
	.word 0x93902001  ! 846: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982d9c  ! 847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9c, %hpstate
tagged_1_195:
	taddcctv %r18, 0x142b, %r18
	.word 0xd407e001  ! 848: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd48008a0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4cfe030  ! 850: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r10
	.word 0x30800001  ! 851: BA	ba,a	<label_0x1>
change_to_randtl_1_196:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 852: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8780201c  ! 853: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x9f802001  ! 854: SIR	sir	0x0001
	.word 0x81982347  ! 855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0347, %hpstate
DS_1_197:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 856: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x87802089  ! 857: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa1902004  ! 858: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0xd41fe001  ! 859: LDD_I	ldd	[%r31 + 0x0001], %r10
tagged_1_198:
	tsubcctv %r5, 0x1218, %r2
	.word 0xd407e001  ! 860: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_tba_1_199:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 861: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802080  ! 862: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x879021b8  ! 863: WRPR_TT_I	wrpr	%r0, 0x01b8, %tt
	.word 0x8d480000  ! 864: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0xccdfe010  ! 865: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r6
	.word 0xcc8008a0  ! 866: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc1fe001  ! 868: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x81982dd4  ! 869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd4, %hpstate
	.word 0x93902005  ! 870: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xccdfe030  ! 871: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
tagged_1_200:
	tsubcctv %r5, 0x1273, %r25
	.word 0xcc07e001  ! 872: LDUW_I	lduw	[%r31 + 0x0001], %r6
splash_tba_1_201:
	ta T_CHANGE_PRIV
	set 0x003f0000, %r2
	.word 0x8b900002  ! 873: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802063  ! 874: WRASI_I	wr	%r0, 0x0063, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc0fc000  ! 876: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x87802080  ! 877: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8790230d  ! 878: WRPR_TT_I	wrpr	%r0, 0x030d, %tt
	.word 0xccd7e010  ! 879: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc9004a0  ! 881: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
splash_lsu_1_202:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 882: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02033  ! 883: Tcc_I	ta	icc_or_xcc, %r0 + 51
splash_tba_1_203:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 884: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc8008a0  ! 885: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
DS_1_204:
	.word 0x22800001  ! 887: BE	be,a	<label_0x1>
	.word 0xc931800c  ! 887: STQF_R	-	%f4, [%r12, %r6]
	normalw
	.word 0xa7458000  ! 886: RD_SOFTINT_REG	rd	%softint, %r19
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 887: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xf28008a0  ! 888: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
DS_1_205:
	.word 0x34800001  ! 890: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 889: RESTORE_R	restore	%r31, %r0, %r31
splash_htba_1_206:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 890: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xf2d804a0  ! 891: LDXA_R	ldxa	[%r0, %r0] 0x25, %r25
	otherw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 892: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xf2c7e010  ! 893: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r25
DS_1_207:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 894: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xf28804a0  ! 895: LDUBA_R	lduba	[%r0, %r0] 0x25, %r25
	.word 0x81982585  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0585, %hpstate
	.word 0xf217e001  ! 897: LDUH_I	lduh	[%r31 + 0x0001], %r25
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 898: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 899: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xf28008a0  ! 900: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 901: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf217c000  ! 902: LDUH_R	lduh	[%r31 + %r0], %r25
change_to_randtl_1_208:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 903: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0x32800001  ! 904: BNE	bne,a	<label_0x1>
	.word 0xa190200e  ! 905: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x87802089  ! 906: WRASI_I	wr	%r0, 0x0089, %asi
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 907: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf28008a0  ! 908: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x87802020  ! 909: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xf317c000  ! 910: LDQF_R	-	[%r31, %r0], %f25
	.word 0xa1902002  ! 911: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902003  ! 912: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802014  ! 913: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xf28fe000  ! 914: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r25
	.word 0x8d90325d  ! 915: WRPR_PSTATE_I	wrpr	%r0, 0x125d, %pstate
	.word 0xf2800c40  ! 916: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r25
	.word 0x8f902000  ! 918: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x916da001  ! 917: SDIVX_I	sdivx	%r22, 0x0001, %r8
splash_lsu_1_210:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 918: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8b464000  ! 919: RD_STICK_CMPR_REG	rd	%-, %r5
	.word 0xa1902009  ! 920: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x81982104  ! 921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0104, %hpstate
	.word 0xd6800b60  ! 922: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r11
	.word 0x93902004  ! 923: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_1_211:
	taddcctv %r16, 0x139a, %r21
	.word 0xd607e001  ! 924: LDUW_I	lduw	[%r31 + 0x0001], %r11
DS_1_212:
	.word 0x22800001  ! 926: BE	be,a	<label_0x1>
	pdist %f26, %f2, %f16
	.word 0x99b64314  ! 925: ALLIGNADDRESS	alignaddr	%r25, %r20, %r12
	.word 0x8d902b29  ! 926: WRPR_PSTATE_I	wrpr	%r0, 0x0b29, %pstate
tagged_1_213:
	taddcctv %r6, 0x1d8f, %r7
	.word 0xc607e001  ! 927: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc607c000  ! 928: LDUW_R	lduw	[%r31 + %r0], %r3
splash_tba_1_214:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 929: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68fe000  ! 930: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r3
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 931: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802020  ! 933: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x93902001  ! 934: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc73fc002  ! 935: STDF_R	std	%f3, [%r2, %r31]
	.word 0xc6d804a0  ! 936: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 937: LDQF_R	-	[%r31, %r0], %f3
tagged_1_215:
	taddcctv %r23, 0x1be4, %r7
	.word 0xc607e001  ! 938: LDUW_I	lduw	[%r31 + 0x0001], %r3
DS_1_216:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 939: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
splash_tba_1_217:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 940: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_1_218:
	.word 0x22800001  ! 942: BE	be,a	<label_0x1>
	.xword 0xf3d3e763	! Random illegal ?
	.word 0xd7158018  ! 942: LDQF_R	-	[%r22, %r24], %f11
	.word 0x87a1c82c  ! 941: FADDs	fadds	%f7, %f12, %f3
	.word 0x93902001  ! 942: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d903b3f  ! 943: WRPR_PSTATE_I	wrpr	%r0, 0x1b3f, %pstate
	.word 0x8d90282a  ! 944: WRPR_PSTATE_I	wrpr	%r0, 0x082a, %pstate
	.word 0x87802063  ! 945: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0xc4880e60  ! 946: LDUBA_R	lduba	[%r0, %r0] 0x73, %r2
	.word 0xc49fc020  ! 947: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x91d02034  ! 948: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902003  ! 949: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc517c000  ! 951: LDQF_R	-	[%r31, %r0], %f2
	.word 0x24700001  ! 952: BPLE	<illegal instruction>
	.word 0x8f902001  ! 954: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb180400a  ! 953: WR_STICK_REG_R	wr	%r1, %r10, %-
	.word 0x81982e4d  ! 954: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4d, %hpstate
	.word 0xc417c000  ! 955: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x93902004  ! 956: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xa1902003  ! 957: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x819820de  ! 958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00de, %hpstate
	.word 0x93902002  ! 959: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc48804a0  ! 960: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc48008a0  ! 961: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xa1902003  ! 962: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8b494000  ! 963: RDHPR_HTBA	rdhpr	%htba, %r5
	.word 0xc4d7e010  ! 964: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r2
	.word 0x93902005  ! 965: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_1_220:
	.word 0x32800001  ! 967: BNE	bne,a	<label_0x1>
	.word 0xed30000c  ! 967: STQF_R	-	%f22, [%r12, %r0]
	normalw
	.word 0x81458000  ! 966: RD_SOFTINT_REG	stbar
	.word 0xa190200a  ! 967: WRPR_GL_I	wrpr	%r0, 0x000a, %-
splash_lsu_1_221:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200f  ! 969: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x28800001  ! 970: BLEU	bleu,a	<label_0x1>
splash_lsu_1_222:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 971: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 972: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_1_223:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 974: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb1836001  ! 973: WR_STICK_REG_I	wr	%r13, 0x0001, %-
	.word 0x83d02032  ! 974: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0xd4d00e80  ! 975: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r10
tagged_1_224:
	tsubcctv %r15, 0x18b4, %r3
	.word 0xd407e001  ! 976: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4c004a0  ! 977: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r10
	.word 0x93902002  ! 978: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x99902003  ! 979: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x8d903d17  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x1d17, %pstate
	.word 0x93902000  ! 981: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x91d02034  ! 982: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x22700001  ! 983: BPE	<illegal instruction>
	.word 0x93902003  ! 984: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 985: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 986: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 987: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd497e020  ! 988: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r10
	.word 0xd4dfe000  ! 989: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r10
	.word 0x91d02034  ! 990: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x34800001  ! 991: BG	bg,a	<label_0x1>
	.word 0xa190200a  ! 992: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xd48008a0  ! 993: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd597e001  ! 994: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x91d020b5  ! 995: Tcc_I	ta	icc_or_xcc, %r0 + 181
splash_htba_1_225:
	ta T_CHANGE_HPRIV
	set 0x003b0000, %r2
	.word 0x8b980002  ! 996: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902005  ! 997: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_1_226:
	.word 0x22800001  ! 999: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 998: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_1_227:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	setx	join_lbl_0_0, %g1, %g2
	jmp	%g2
	nop
fork_lbl_0_1:
	.word 0x91d02033  ! 1: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x91d02033  ! 2: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902008  ! 3: WRPR_GL_I	wrpr	%r0, 0x0008, %-
splash_lsu_0_0:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 4: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d514000  ! 5: RDPR_TBA	<illegal instruction>
tagged_0_1:
	taddcctv %r13, 0x1f77, %r14
	.word 0xcc07e001  ! 6: LDUW_I	lduw	[%r31 + 0x0001], %r6
DS_0_2:
	.word 0x22800001  ! 8: BE	be,a	<label_0x1>
	pdist %f30, %f24, %f14
	.word 0xa1b48305  ! 7: ALLIGNADDRESS	alignaddr	%r18, %r5, %r16
	.word 0x89514000  ! 8: RDPR_TBA	<illegal instruction>
tagged_0_3:
	taddcctv %r23, 0x12df, %r21
	.word 0xc807e001  ! 9: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xc81fe001  ! 10: LDD_I	ldd	[%r31 + 0x0001], %r4
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 11: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc8c7e010  ! 12: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r4
	.word 0xc917c000  ! 13: LDQF_R	-	[%r31, %r0], %f4
	.word 0xc89fe001  ! 14: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 15: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x99902000  ! 16: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0xc807c000  ! 17: LDUW_R	lduw	[%r31 + %r0], %r4
	.word 0x8d802000  ! 18: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9b45c000  ! 19: RD_TICK_CMPR_REG	rd	%-, %r13
	.word 0x83d02033  ! 20: Tcc_I	te	icc_or_xcc, %r0 + 51
DS_0_4:
	.word 0x32800001  ! 22: BNE	bne,a	<label_0x1>
	.word 0xc534801a  ! 22: STQF_R	-	%f2, [%r26, %r18]
	normalw
	.word 0xa3458000  ! 21: RD_SOFTINT_REG	rd	%softint, %r17
	.word 0x8790237f  ! 22: WRPR_TT_I	wrpr	%r0, 0x037f, %tt
DS_0_5:
	.word 0x32800001  ! 24: BNE	bne,a	<label_0x1>
	.word 0xc533000a  ! 24: STQF_R	-	%f2, [%r10, %r12]
	normalw
	.word 0x97458000  ! 23: RD_SOFTINT_REG	rd	%softint, %r11
tagged_0_6:
	tsubcctv %r4, 0x1071, %r7
	.word 0xd607e001  ! 24: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x879023bf  ! 25: WRPR_TT_I	wrpr	%r0, 0x03bf, %tt
splash_tba_0_7:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 26: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x819822c7  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c7, %hpstate
splash_lsu_0_8:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 28: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd65fe001  ! 29: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d7e010  ! 30: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0x9b50c000  ! 31: RDPR_TT	<illegal instruction>
	.word 0xda07c000  ! 32: LDUW_R	lduw	[%r31 + %r0], %r13
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 33: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 34: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982e4d  ! 35: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4d, %hpstate
	.word 0xdad7e000  ! 36: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	.word 0xda47c000  ! 37: LDSW_R	ldsw	[%r31 + %r0], %r13
	.word 0x81982806  ! 38: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0806, %hpstate
	.word 0x8f464000  ! 39: RD_STICK_CMPR_REG	rd	%-, %r7
	.word 0xa3464000  ! 40: RD_STICK_CMPR_REG	rd	%-, %r17
	.word 0x8d9029ad  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x09ad, %pstate
	.word 0x87802089  ! 42: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa190200f  ! 43: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x879022ca  ! 44: WRPR_TT_I	wrpr	%r0, 0x02ca, %tt
DS_0_9:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 45: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
DS_0_10:
	.word 0x20800001  ! 47: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 46: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x26800001  ! 47: BL	bl,a	<label_0x1>
DS_0_11:
	.word 0x22800001  ! 49: BE	be,a	<label_0x1>
	pdist %f20, %f2, %f0
	.word 0x97b68309  ! 48: ALLIGNADDRESS	alignaddr	%r26, %r9, %r11
	.word 0xa190200f  ! 49: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd65fe001  ! 50: LDX_I	ldx	[%r31 + 0x0001], %r11
	.word 0xd6d804a0  ! 51: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0xd6800c20  ! 52: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r11
	.word 0x8790225e  ! 53: WRPR_TT_I	wrpr	%r0, 0x025e, %tt
splash_htba_0_12:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 54: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d90287e  ! 55: WRPR_PSTATE_I	wrpr	%r0, 0x087e, %pstate
	.word 0xd617e001  ! 56: LDUH_I	lduh	[%r31 + 0x0001], %r11
	.word 0x8790223f  ! 57: WRPR_TT_I	wrpr	%r0, 0x023f, %tt
	.word 0xd68008a0  ! 58: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_tba_0_13:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 59: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x879023b4  ! 60: WRPR_TT_I	wrpr	%r0, 0x03b4, %tt
	.word 0x91d02034  ! 61: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd68008a0  ! 62: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
splash_cmpr_0_14:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb181e001  ! 63: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0xd6d7e030  ! 64: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r11
	.word 0x8d902f43  ! 65: WRPR_PSTATE_I	wrpr	%r0, 0x0f43, %pstate
	.word 0x26700001  ! 66: BPL	<illegal instruction>
	.word 0xa150c000  ! 67: RDPR_TT	<illegal instruction>
	.word 0x8d903561  ! 68: WRPR_PSTATE_I	wrpr	%r0, 0x1561, %pstate
	.word 0x30800001  ! 69: BA	ba,a	<label_0x1>
splash_lsu_0_15:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 70: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9036b9  ! 71: WRPR_PSTATE_I	wrpr	%r0, 0x16b9, %pstate
splash_lsu_0_16:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 72: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 73: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe137c009  ! 74: STQF_R	-	%f16, [%r9, %r31]
	.word 0xe057c000  ! 75: LDSH_R	ldsh	[%r31 + %r0], %r16
	.word 0x81982606  ! 76: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0606, %hpstate
splash_tba_0_17:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 77: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d802000  ! 78: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_htba_0_18:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 79: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
tagged_0_19:
	taddcctv %r22, 0x1b8a, %r19
	.word 0xe007e001  ! 80: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x8d902b6b  ! 81: WRPR_PSTATE_I	wrpr	%r0, 0x0b6b, %pstate
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 82: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 83: BNE	bne,a	<label_0x1>
	.word 0x91d02035  ! 84: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x879023ee  ! 85: WRPR_TT_I	wrpr	%r0, 0x03ee, %tt
	.word 0xe0d7e010  ! 86: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
	.word 0x83504000  ! 87: RDPR_TNPC	<illegal instruction>
	.word 0x91d020b4  ! 88: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0x26700001  ! 89: BPL	<illegal instruction>
	.word 0x8d90368b  ! 90: WRPR_PSTATE_I	wrpr	%r0, 0x168b, %pstate
	.word 0x9f802001  ! 91: SIR	sir	0x0001
	.word 0x91d02032  ! 92: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81982c96  ! 93: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c96, %hpstate
	.word 0xc24fc000  ! 94: LDSB_R	ldsb	[%r31 + %r0], %r1
DS_0_20:
	.word 0x32800001  ! 96: BNE	bne,a	<label_0x1>
	.xword 0xfd5413ba	! Random illegal ?
	.word 0xe113000b  ! 96: LDQF_R	-	[%r12, %r11], %f16
	.word 0x81a08827  ! 95: FADDs	fadds	%f2, %f7, %f0
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 96: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_21:
	taddcctv %r25, 0x1f47, %r17
	.word 0xc007e001  ! 97: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x2a800001  ! 98: BCS	bcs,a	<label_0x1>
	.word 0xc0880e80  ! 99: LDUBA_R	lduba	[%r0, %r0] 0x74, %r0
	.word 0xa1902000  ! 100: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xc017c000  ! 101: LDUH_R	lduh	[%r31 + %r0], %r0
	.word 0xc03fe001  ! 102: STD_I	std	%r0, [%r31 + 0x0001]
	.word 0x93902002  ! 103: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc0800b20  ! 104: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r0
	.word 0x93902007  ! 105: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81460000  ! 106: RD_STICK_REG	stbar
	.word 0xc01fc000  ! 107: LDD_R	ldd	[%r31 + %r0], %r0
	.word 0x8198230e  ! 108: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030e, %hpstate
	.word 0xc0c7e030  ! 109: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r0
	.word 0x8d90379f  ! 110: WRPR_PSTATE_I	wrpr	%r0, 0x179f, %pstate
	.word 0x8d500000  ! 111: RDPR_TPC	<illegal instruction>
	.word 0xa1500000  ! 112: RDPR_TPC	<illegal instruction>
splash_cmpr_0_22:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb181e001  ! 113: WR_STICK_REG_I	wr	%r7, 0x0001, %-
	.word 0xe097e010  ! 114: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r16
tagged_0_23:
	taddcctv %r15, 0x1a4d, %r25
	.word 0xe007e001  ! 115: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe0d7e010  ! 116: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r16
	.word 0x81982f14  ! 117: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f14, %hpstate
	.word 0xe0d804a0  ! 118: LDXA_R	ldxa	[%r0, %r0] 0x25, %r16
	ta	T_CHANGE_HPRIV	! macro
DS_0_24:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 120: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
splash_tba_0_25:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 121: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xe0d80e80  ! 122: LDXA_R	ldxa	[%r0, %r0] 0x74, %r16
	.word 0x9f802001  ! 123: SIR	sir	0x0001
	.word 0x819829c7  ! 124: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c7, %hpstate
	.word 0xe0dfe000  ! 125: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r16
	.word 0x879022f8  ! 126: WRPR_TT_I	wrpr	%r0, 0x02f8, %tt
	.word 0x87902062  ! 127: WRPR_TT_I	wrpr	%r0, 0x0062, %tt
	.word 0xe01fc000  ! 128: LDD_R	ldd	[%r31 + %r0], %r16
change_to_randtl_0_26:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902002  ! 129: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x8d902222  ! 130: WRPR_PSTATE_I	wrpr	%r0, 0x0222, %pstate
splash_lsu_0_27:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 131: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8f902000  ! 133: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1868005  ! 132: WR_STICK_REG_R	wr	%r26, %r5, %-
	.word 0x8198289d  ! 133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089d, %hpstate
	.word 0xe08008a0  ! 134: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
change_to_randtl_0_29:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 135: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0xe08008a0  ! 136: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x93902002  ! 137: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d9039c5  ! 138: WRPR_PSTATE_I	wrpr	%r0, 0x19c5, %pstate
	.word 0x8afb6001  ! 139: SDIVcc_I	sdivcc 	%r13, 0x0001, %r5
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 140: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902002  ! 141: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xca800c00  ! 142: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r5
	.word 0x8780204f  ! 143: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8d90269f  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x069f, %pstate
	.word 0x8d903a5d  ! 145: WRPR_PSTATE_I	wrpr	%r0, 0x1a5d, %pstate
	.word 0xcad00e40  ! 146: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r5
DS_0_30:
	.word 0x20800001  ! 148: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 147: SAVE_R	save	%r31, %r0, %r31
DS_0_31:
	.word 0x20800001  ! 149: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 148: SAVE_R	save	%r31, %r0, %r31
	.word 0xca800b20  ! 149: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r5
	.word 0xca97e000  ! 150: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r5
	.word 0x886dc018  ! 151: UDIVX_R	udivx 	%r23, %r24, %r4
	.word 0xc84fe001  ! 152: LDSB_I	ldsb	[%r31 + 0x0001], %r4
	.word 0xc8c80e40  ! 153: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r4
	.word 0xc89fe001  ! 154: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
splash_tba_0_32:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 155: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc827e001  ! 156: STW_I	stw	%r4, [%r31 + 0x0001]
	.word 0xc8d004a0  ! 157: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_lsu_0_33:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 158: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97514000  ! 159: RDPR_TBA	<illegal instruction>
	.word 0xd737c018  ! 160: STQF_R	-	%f11, [%r24, %r31]
	.word 0xd61fc000  ! 161: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd6c7e030  ! 162: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r11
	.word 0xd6dfe010  ! 163: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r11
	.word 0x8f45c000  ! 164: RD_TICK_CMPR_REG	rd	%-, %r7
	.word 0x99508000  ! 165: RDPR_TSTATE	<illegal instruction>
	.word 0xd89fe001  ! 166: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 167: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd89004a0  ! 169: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	.word 0x819827d4  ! 170: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d4, %hpstate
	.word 0xd84fc000  ! 171: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0x81982d05  ! 172: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d05, %hpstate
	.word 0x8d90268e  ! 173: WRPR_PSTATE_I	wrpr	%r0, 0x068e, %pstate
	.word 0x9f802001  ! 174: SIR	sir	0x0001
DS_0_34:
	.word 0x34800001  ! 176: BG	bg,a	<label_0x1>
	pdist %f24, %f2, %f8
	.word 0xa3b08305  ! 175: ALLIGNADDRESS	alignaddr	%r2, %r5, %r17
DS_0_35:
	.word 0x32800001  ! 177: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 176: RESTORE_R	restore	%r31, %r0, %r31
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 177: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_36:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 178: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 179: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d903bde  ! 180: WRPR_PSTATE_I	wrpr	%r0, 0x1bde, %pstate
	.word 0x93902003  ! 181: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
splash_lsu_0_37:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 182: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 183: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902b7a  ! 184: WRPR_PSTATE_I	wrpr	%r0, 0x0b7a, %pstate
	.word 0x91d02032  ! 185: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe2d00e40  ! 186: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r17
	.word 0x81982a17  ! 187: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a17, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 188: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902191  ! 189: WRPR_PSTATE_I	wrpr	%r0, 0x0191, %pstate
splash_tba_0_38:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 190: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902006  ! 191: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa190200c  ! 192: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x83d02032  ! 193: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x879020e5  ! 194: WRPR_TT_I	wrpr	%r0, 0x00e5, %tt
	.word 0x93d02033  ! 195: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x9751c000  ! 196: RDPR_TL	<illegal instruction>
	.word 0x8d90384a  ! 197: WRPR_PSTATE_I	wrpr	%r0, 0x184a, %pstate
	.word 0x91d02035  ! 198: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xd607c000  ! 199: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x91d02033  ! 200: Tcc_I	ta	icc_or_xcc, %r0 + 51
tagged_0_39:
	taddcctv %r17, 0x1bd7, %r7
	.word 0xd607e001  ! 201: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0x85508000  ! 202: RDPR_TSTATE	<illegal instruction>
	.word 0xc48804a0  ! 203: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc48008a0  ! 204: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xc48008a0  ! 205: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
change_to_randtl_0_40:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 206: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0xc48008a0  ! 207: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02033  ! 209: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93d02034  ! 210: Tcc_I	tne	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_PRIV	! macro
	.word 0x32800001  ! 212: BNE	bne,a	<label_0x1>
	.word 0x81982e17  ! 213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e17, %hpstate
	.word 0xa1902005  ! 214: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_tba_0_41:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 215: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_0_42:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 216: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc4800b60  ! 217: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r2
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 218: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802010  ! 219: WRASI_I	wr	%r0, 0x0010, %asi
DS_0_43:
	.word 0x22800001  ! 221: BE	be,a	<label_0x1>
	.word 0xd132e001  ! 221: STQF_I	-	%f8, [0x0001, %r11]
	normalw
	.word 0xaf458000  ! 220: RD_SOFTINT_REG	rd	%softint, %r23
splash_lsu_0_44:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 221: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xeec804a0  ! 222: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r23
	.word 0x8f50c000  ! 223: RDPR_TT	<illegal instruction>
	.word 0x8d802000  ! 224: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8780201c  ! 225: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xce8008a0  ! 226: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x87802016  ! 227: WRASI_I	wr	%r0, 0x0016, %asi
splash_tba_0_45:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 228: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x34700001  ! 229: BPG	<illegal instruction>
	.word 0xa3508000  ! 230: RDPR_TSTATE	<illegal instruction>
	.word 0x8790223e  ! 231: WRPR_TT_I	wrpr	%r0, 0x023e, %tt
tagged_0_46:
	tsubcctv %r2, 0x1db6, %r12
	.word 0xe207e001  ! 232: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x879022d6  ! 233: WRPR_TT_I	wrpr	%r0, 0x02d6, %tt
	.word 0xe28008a0  ! 234: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x86ae4009  ! 235: ANDNcc_R	andncc 	%r25, %r9, %r3
DS_0_47:
	.word 0x22800001  ! 237: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 236: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982d8e  ! 237: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8e, %hpstate
	.word 0x87802014  ! 238: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x879020bc  ! 239: WRPR_TT_I	wrpr	%r0, 0x00bc, %tt
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 240: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc61fe001  ! 241: LDD_I	ldd	[%r31 + 0x0001], %r3
	.word 0x2c800001  ! 242: BNEG	bneg,a	<label_0x1>
	.word 0xc6c7e010  ! 243: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r3
	.word 0x8d9033a8  ! 244: WRPR_PSTATE_I	wrpr	%r0, 0x13a8, %pstate
	.word 0x8d903802  ! 245: WRPR_PSTATE_I	wrpr	%r0, 0x1802, %pstate
	.word 0x87902346  ! 246: WRPR_TT_I	wrpr	%r0, 0x0346, %tt
splash_lsu_0_48:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 247: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x28700001  ! 248: BPLEU	<illegal instruction>
	.word 0xc607c000  ! 249: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0xc68804a0  ! 250: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 251: LDQF_R	-	[%r31, %r0], %f3
tagged_0_49:
	taddcctv %r2, 0x132a, %r1
	.word 0xc607e001  ! 252: LDUW_I	lduw	[%r31 + 0x0001], %r3
change_to_randtl_0_50:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902000  ! 253: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xc68008a0  ! 254: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 255: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 256: SIR	sir	0x0001
change_to_randtl_0_51:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 257: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xc6800c20  ! 258: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r3
	.word 0xc657c000  ! 259: LDSH_R	ldsh	[%r31 + %r0], %r3
DS_0_52:
	.word 0x32800001  ! 261: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 260: SAVE_R	save	%r31, %r0, %r31
splash_lsu_0_53:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 261: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 262: BPN	<illegal instruction>
	.word 0x87802020  ! 263: WRASI_I	wr	%r0, 0x0020, %asi
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 264: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d903f51  ! 265: WRPR_PSTATE_I	wrpr	%r0, 0x1f51, %pstate
	.word 0xc61fc000  ! 266: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0xc61fc000  ! 267: LDD_R	ldd	[%r31 + %r0], %r3
	.word 0x8d802000  ! 268: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_0_54:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 269: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0x8d903848  ! 270: WRPR_PSTATE_I	wrpr	%r0, 0x1848, %pstate
	.word 0x81982f95  ! 271: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f95, %hpstate
	.word 0x87802016  ! 272: WRASI_I	wr	%r0, 0x0016, %asi
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 273: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902068  ! 274: WRPR_TT_I	wrpr	%r0, 0x0068, %tt
	.word 0x8198201c  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001c, %hpstate
	.word 0x879021fc  ! 276: WRPR_TT_I	wrpr	%r0, 0x01fc, %tt
	.word 0x91d02034  ! 277: Tcc_I	ta	icc_or_xcc, %r0 + 52
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 278: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc68008a0  ! 279: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x93902004  ! 280: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902263  ! 281: WRPR_TT_I	wrpr	%r0, 0x0263, %tt
splash_tba_0_55:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 282: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc6800b20  ! 283: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r3
	.word 0xc6c804a0  ! 284: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r3
splash_cmpr_0_56:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb1816001  ! 285: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0x8d9037b9  ! 286: WRPR_PSTATE_I	wrpr	%r0, 0x17b9, %pstate
splash_htba_0_57:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 287: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8d902d56  ! 288: WRPR_PSTATE_I	wrpr	%r0, 0x0d56, %pstate
	.word 0x34700001  ! 289: BPG	<illegal instruction>
splash_cmpr_0_58:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb184e001  ! 290: WR_STICK_REG_I	wr	%r19, 0x0001, %-
	.word 0x93902003  ! 291: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802010  ! 293: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x91d020b4  ! 294: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xa1902007  ! 295: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x95a00569  ! 296: FSQRTq	fsqrt	
	.word 0x91d02034  ! 297: Tcc_I	ta	icc_or_xcc, %r0 + 52
DS_0_59:
	.word 0x20800001  ! 299: BN	bn,a	<label_0x1>
	.word 0x34800001  ! 299: BG	bg,a	<label_0x1>
	.word 0x9ba00549  ! 299: FSQRTd	fsqrt	
	.word 0x87a08828  ! 298: FADDs	fadds	%f2, %f8, %f3
	.word 0xc6800a80  ! 299: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r3
	.word 0xc68804a0  ! 300: LDUBA_R	lduba	[%r0, %r0] 0x25, %r3
splash_tba_0_60:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 301: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc647e001  ! 302: LDSW_I	ldsw	[%r31 + 0x0001], %r3
	.word 0x99902000  ! 303: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x93902001  ! 304: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 305: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_61:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 306: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 307: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xc6800aa0  ! 308: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r3
	.word 0x81982ace  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ace, %hpstate
splash_lsu_0_62:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 310: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc69004a0  ! 311: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x87802080  ! 312: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93d02035  ! 313: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8d903d43  ! 314: WRPR_PSTATE_I	wrpr	%r0, 0x1d43, %pstate
	.word 0x8790219a  ! 315: WRPR_TT_I	wrpr	%r0, 0x019a, %tt
	.word 0x91d02035  ! 316: Tcc_I	ta	icc_or_xcc, %r0 + 53
splash_tba_0_63:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 317: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc69fc020  ! 318: LDDA_R	ldda	[%r31, %r0] 0x01, %r3
splash_lsu_0_64:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 319: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20800001  ! 320: BN	bn,a	<label_0x1>
	.word 0x8d90369c  ! 321: WRPR_PSTATE_I	wrpr	%r0, 0x169c, %pstate
DS_0_65:
	.word 0x20800001  ! 323: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 322: SAVE_R	save	%r31, %r0, %r31
	.word 0x8f902002  ! 324: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1808018  ! 323: WR_STICK_REG_R	wr	%r2, %r24, %-
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 324: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_67:
	taddcctv %r1, 0x1c0f, %r13
	.word 0xc607e001  ! 325: LDUW_I	lduw	[%r31 + 0x0001], %r3
splash_tba_0_68:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 326: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8f902001  ! 328: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1830014  ! 327: WR_STICK_REG_R	wr	%r12, %r20, %-
	.word 0x85508000  ! 328: RDPR_TSTATE	<illegal instruction>
splash_lsu_0_70:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 329: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902007  ! 330: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d802004  ! 331: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x91d02033  ! 332: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa1902008  ! 333: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 334: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02032  ! 335: Tcc_I	te	icc_or_xcc, %r0 + 50
DS_0_71:
	.word 0x34800001  ! 337: BG	bg,a	<label_0x1>
	pdist %f2, %f30, %f26
	.word 0x99b08300  ! 336: ALLIGNADDRESS	alignaddr	%r2, %r0, %r12
tagged_0_72:
	tsubcctv %r26, 0x1719, %r6
	.word 0xd807e001  ! 337: LDUW_I	lduw	[%r31 + 0x0001], %r12
tagged_0_73:
	taddcctv %r12, 0x104d, %r12
	.word 0xd807e001  ! 338: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x879020a9  ! 339: WRPR_TT_I	wrpr	%r0, 0x00a9, %tt
	.word 0x84d62001  ! 340: UMULcc_I	umulcc 	%r24, 0x0001, %r2
	.word 0x93902005  ! 341: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
tagged_0_74:
	tsubcctv %r23, 0x15cd, %r1
	.word 0xc407e001  ! 342: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0x93902003  ! 343: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xc4800b20  ! 344: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r2
	.word 0xc4800c00  ! 345: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r2
tagged_0_75:
	taddcctv %r21, 0x1c01, %r6
	.word 0xc407e001  ! 346: LDUW_I	lduw	[%r31 + 0x0001], %r2
DS_0_76:
	.word 0x22800001  ! 348: BE	be,a	<label_0x1>
	.xword 0x93ddd8cc	! Random illegal ?
	.word 0xd5148008  ! 348: LDQF_R	-	[%r18, %r8], %f10
	.word 0x95a00838  ! 347: FADDs	fadds	%f0, %f24, %f10
	.word 0x91d02032  ! 348: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91514000  ! 349: RDPR_TBA	<illegal instruction>
	.word 0x8d902aa7  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x0aa7, %pstate
	.word 0xd0c80e80  ! 351: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r8
DS_0_77:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902002  ! 352: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xd017e001  ! 353: LDUH_I	lduh	[%r31 + 0x0001], %r8
	.word 0xa7514000  ! 354: RDPR_TBA	<illegal instruction>
	.word 0xe647c000  ! 355: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x3e700001  ! 356: BPVC	<illegal instruction>
	.word 0x87902389  ! 357: WRPR_TT_I	wrpr	%r0, 0x0389, %tt
splash_lsu_0_78:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 358: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_79:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 359: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 360: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 361: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe647c000  ! 362: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0x87902047  ! 363: WRPR_TT_I	wrpr	%r0, 0x0047, %tt
	.word 0x38800001  ! 364: BGU	bgu,a	<label_0x1>
	.word 0xe69004a0  ! 365: LDUHA_R	lduha	[%r0, %r0] 0x25, %r19
	.word 0x87802055  ! 366: WRASI_I	wr	%r0, 0x0055, %asi
splash_lsu_0_80:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 367: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x89540000  ! 368: RDPR_GL	<illegal instruction>
	.word 0xc8800b40  ! 369: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r4
splash_lsu_0_81:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 370: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc81fc000  ! 371: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xa190200a  ! 372: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xc807c000  ! 373: LDUW_R	lduw	[%r31 + %r0], %r4
splash_lsu_0_82:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 374: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x89494000  ! 375: RDHPR_HTBA	rdhpr	%htba, %r4
	.word 0x81982e1c  ! 376: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e1c, %hpstate
splash_lsu_0_83:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 377: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 378: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_84:
	tsubcctv %r6, 0x1786, %r4
	.word 0xc807e001  ! 379: LDUW_I	lduw	[%r31 + 0x0001], %r4
change_to_randtl_0_85:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902005  ! 380: WRPR_TL_I	wrpr	%r0, 0x0005, %tl
	.word 0x83d02035  ! 381: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xc8d004a0  ! 382: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
splash_tba_0_86:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 383: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 384: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_87:
	.word 0x32800001  ! 386: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 386: BG	bg,a	<label_0x1>
	.word 0xc1154014  ! 386: LDQF_R	-	[%r21, %r20], %f0
	.word 0xb5a34833  ! 385: FADDs	fadds	%f13, %f19, %f26
	.word 0x9f802001  ! 386: SIR	sir	0x0001
splash_tba_0_88:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 387: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x3c700001  ! 388: BPPOS	<illegal instruction>
DS_0_89:
	.word 0x34800001  ! 390: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 389: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x87802020  ! 390: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x95508000  ! 391: RDPR_TSTATE	<illegal instruction>
	.word 0x20700001  ! 392: BPN	<illegal instruction>
splash_lsu_0_90:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 393: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802089  ! 394: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xd48fe010  ! 395: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r10
	.word 0x81982dcf  ! 396: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dcf, %hpstate
	.word 0x32800001  ! 397: BNE	bne,a	<label_0x1>
tagged_0_91:
	taddcctv %r12, 0x1323, %r24
	.word 0xd407e001  ! 398: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0x8d9029d7  ! 399: WRPR_PSTATE_I	wrpr	%r0, 0x09d7, %pstate
	.word 0x81982955  ! 400: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0955, %hpstate
DS_0_92:
	.word 0x20800001  ! 402: BN	bn,a	<label_0x1>
	pdist %f26, %f0, %f6
	.word 0xadb1831a  ! 401: ALLIGNADDRESS	alignaddr	%r6, %r26, %r22
	.word 0xec800be0  ! 402: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r22
	.word 0x93902006  ! 403: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_0_93:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 404: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902006  ! 405: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8d903c58  ! 406: WRPR_PSTATE_I	wrpr	%r0, 0x1c58, %pstate
	.word 0x8d902f22  ! 407: WRPR_PSTATE_I	wrpr	%r0, 0x0f22, %pstate
tagged_0_94:
	tsubcctv %r18, 0x14ea, %r9
	.word 0xec07e001  ! 408: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x91d02034  ! 409: Tcc_I	ta	icc_or_xcc, %r0 + 52
tagged_0_95:
	taddcctv %r8, 0x19e3, %r16
	.word 0xec07e001  ! 410: LDUW_I	lduw	[%r31 + 0x0001], %r22
	invalw
	mov 0xb1, %r30
	.word 0x83d0001e  ! 411: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xecd00e60  ! 412: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r22
	.word 0x879020ff  ! 413: WRPR_TT_I	wrpr	%r0, 0x00ff, %tt
tagged_0_96:
	tsubcctv %r16, 0x1376, %r26
	.word 0xec07e001  ! 414: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0x93902005  ! 415: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x97480000  ! 416: RDHPR_HPSTATE	rdhpr	%hpstate, %r11
	.word 0x879020ca  ! 417: WRPR_TT_I	wrpr	%r0, 0x00ca, %tt
	.word 0xd64fe001  ! 418: LDSB_I	ldsb	[%r31 + 0x0001], %r11
	.word 0xd68008a0  ! 419: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x93902000  ! 420: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8750c000  ! 421: RDPR_TT	<illegal instruction>
	.word 0x8f902001  ! 423: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89858009  ! 422: WRTICK_R	wr	%r22, %r9, %tick
	.word 0xc6dfe000  ! 423: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r3
	.word 0xa9494000  ! 424: RDHPR_HTBA	rdhpr	%htba, %r20
	.word 0xafa5c9f2  ! 425: FDIVq	dis not found

	.word 0xaf514000  ! 426: RDPR_TBA	<illegal instruction>
	.word 0x32700001  ! 427: BPNE	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xee07c000  ! 429: LDUW_R	lduw	[%r31 + %r0], %r23
	.word 0x8198234e  ! 430: WRHPR_HPSTATE_I	wrhpr	%r0, 0x034e, %hpstate
	.word 0xa1902005  ! 431: WRPR_GL_I	wrpr	%r0, 0x0005, %-
splash_lsu_0_98:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 432: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xee800b00  ! 433: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r23
splash_tba_0_99:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 434: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x2a800001  ! 435: BCS	bcs,a	<label_0x1>
	.word 0x91d020b3  ! 436: Tcc_I	ta	icc_or_xcc, %r0 + 179
DS_0_100:
	.word 0x20800001  ! 438: BN	bn,a	<label_0x1>
	.word 0xe3306001  ! 438: STQF_I	-	%f17, [0x0001, %r1]
	normalw
	.word 0x8d458000  ! 437: RD_SOFTINT_REG	rd	%softint, %r6
tagged_0_101:
	taddcctv %r26, 0x19df, %r10
	.word 0xcc07e001  ! 438: LDUW_I	lduw	[%r31 + 0x0001], %r6
tagged_0_102:
	tsubcctv %r8, 0x16d3, %r23
	.word 0xcc07e001  ! 439: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x87802014  ! 440: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x879020b7  ! 441: WRPR_TT_I	wrpr	%r0, 0x00b7, %tt
	.word 0x81982256  ! 442: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0256, %hpstate
	.word 0x93902002  ! 443: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_lsu_0_103:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 444: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x20700001  ! 445: BPN	<illegal instruction>
splash_lsu_0_104:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 446: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc8008a0  ! 447: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
splash_lsu_0_105:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 448: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_106:
	tsubcctv %r16, 0x146f, %r5
	.word 0xcc07e001  ! 449: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0xcc9fc020  ! 450: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x81982a4c  ! 451: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4c, %hpstate
	.word 0xccdfe000  ! 452: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
	.word 0x93902004  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_0_107:
	taddcctv %r17, 0x1783, %r3
	.word 0xcc07e001  ! 454: LDUW_I	lduw	[%r31 + 0x0001], %r6
	invalw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 455: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 456: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xccc7e030  ! 457: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r6
	.word 0x87802010  ! 458: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x93d020b3  ! 459: Tcc_I	tne	icc_or_xcc, %r0 + 179
	.word 0x81982b14  ! 460: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b14, %hpstate
	.word 0x8198248d  ! 461: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048d, %hpstate
splash_lsu_0_108:
	set 0x7, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 462: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc8008a0  ! 463: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x87500000  ! 464: RDPR_TPC	<illegal instruction>
	.word 0x91d02032  ! 465: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d903c8e  ! 466: WRPR_PSTATE_I	wrpr	%r0, 0x1c8e, %pstate
	.word 0xc717c000  ! 467: LDQF_R	-	[%r31, %r0], %f3
	.word 0xa190200e  ! 468: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x93902004  ! 469: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902000  ! 470: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x99464000  ! 471: RD_STICK_CMPR_REG	rd	%-, %r12
	.word 0x87802004  ! 472: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd8c004a0  ! 473: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r12
splash_tba_0_109:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 474: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd8800b60  ! 475: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r12
DS_0_110:
	.word 0x34800001  ! 477: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 476: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902007  ! 477: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1902002  ! 478: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_tba_0_111:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 479: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa1902001  ! 480: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x87802058  ! 481: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xd8800a80  ! 482: LDUWA_R	lduwa	[%r0, %r0] 0x54, %r12
	.word 0x2e800001  ! 483: BVS	bvs,a	<label_0x1>
splash_lsu_0_112:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 484: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd88008a0  ! 485: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x93902007  ! 486: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902524  ! 487: WRPR_PSTATE_I	wrpr	%r0, 0x0524, %pstate
splash_tba_0_113:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 488: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93902000  ! 489: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd8c804a0  ! 490: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
	.word 0xd89fe001  ! 491: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0xb7a01a73  ! 492: FqTOi	fqtoi	
tagged_0_114:
	tsubcctv %r8, 0x1b39, %r16
	.word 0xf607e001  ! 493: LDUW_I	lduw	[%r31 + 0x0001], %r27
DS_0_115:
	.word 0x32800001  ! 495: BNE	bne,a	<label_0x1>
	pdist %f10, %f28, %f28
	.word 0x9bb28314  ! 494: ALLIGNADDRESS	alignaddr	%r10, %r20, %r13
	.word 0xda57e001  ! 495: LDSH_I	ldsh	[%r31 + 0x0001], %r13
	.word 0x8780201c  ! 496: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x87802088  ! 497: WRASI_I	wr	%r0, 0x0088, %asi
splash_lsu_0_116:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 498: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902005  ! 499: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xda9fe001  ! 500: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r13
	.word 0xdadfe020  ! 501: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r13
DS_0_117:
	.word 0x20800001  ! 503: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 502: SAVE_R	save	%r31, %r0, %r31
tagged_0_118:
	tsubcctv %r12, 0x1d76, %r8
	.word 0xda07e001  ! 503: LDUW_I	lduw	[%r31 + 0x0001], %r13
	.word 0xdad7e000  ! 504: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r13
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 505: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97500000  ! 506: RDPR_TPC	<illegal instruction>
DS_0_119:
	.word 0x20800001  ! 508: BN	bn,a	<label_0x1>
	pdist %f20, %f12, %f28
	.word 0x9bb18305  ! 507: ALLIGNADDRESS	alignaddr	%r6, %r5, %r13
DS_0_120:
	.word 0x32800001  ! 509: BNE	bne,a	<label_0x1>
	.xword 0xcd457a34	! Random illegal ?
	.word 0xdb10800d  ! 509: LDQF_R	-	[%r2, %r13], %f13
	.word 0x89a30837  ! 508: FADDs	fadds	%f12, %f23, %f4
tagged_0_121:
	taddcctv %r22, 0x16ae, %r24
	.word 0xc807e001  ! 509: LDUW_I	lduw	[%r31 + 0x0001], %r4
splash_tba_0_122:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 510: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xa190200c  ! 511: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x879020cc  ! 512: WRPR_TT_I	wrpr	%r0, 0x00cc, %tt
	.word 0xc817e001  ! 513: LDUH_I	lduh	[%r31 + 0x0001], %r4
	.word 0x879022d2  ! 514: WRPR_TT_I	wrpr	%r0, 0x02d2, %tt
	.word 0x8f50c000  ! 515: RDPR_TT	<illegal instruction>
	.word 0x99508000  ! 516: RDPR_TSTATE	<illegal instruction>
	.word 0x22700001  ! 517: BPE	<illegal instruction>
change_to_randtl_0_123:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 518: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xa1902006  ! 519: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xd8800c40  ! 520: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r12
	.word 0x81982697  ! 521: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0697, %hpstate
	.word 0x87480000  ! 522: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
	.word 0x83d02035  ! 523: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x81982ad5  ! 524: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ad5, %hpstate
	.word 0xa5504000  ! 525: RDPR_TNPC	<illegal instruction>
splash_htba_0_124:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 526: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xe44fc000  ! 527: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0xe44fe001  ! 528: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93d020b5  ! 530: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0xe4d7e030  ! 531: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r18
tagged_0_125:
	taddcctv %r12, 0x17e0, %r13
	.word 0xe407e001  ! 532: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x879022c4  ! 533: WRPR_TT_I	wrpr	%r0, 0x02c4, %tt
	.word 0xe4bfc037  ! 534: STDA_R	stda	%r18, [%r31 + %r23] 0x01
	.word 0xe40fe001  ! 535: LDUB_I	ldub	[%r31 + 0x0001], %r18
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe527e001  ! 537: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe527e001  ! 538: STF_I	st	%f18, [0x0001, %r31]
	.word 0xe4d7e010  ! 539: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r18
	.word 0x81982156  ! 540: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0156, %hpstate
tagged_0_126:
	tsubcctv %r3, 0x111a, %r6
	.word 0xe407e001  ! 541: LDUW_I	lduw	[%r31 + 0x0001], %r18
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 542: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_127:
	taddcctv %r22, 0x1c9d, %r7
	.word 0xe407e001  ! 543: LDUW_I	lduw	[%r31 + 0x0001], %r18
splash_tba_0_128:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 544: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 545: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe45fe001  ! 546: LDX_I	ldx	[%r31 + 0x0001], %r18
	.word 0xe497e000  ! 547: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r18
	.word 0xe407c000  ! 548: LDUW_R	lduw	[%r31 + %r0], %r18
DS_0_129:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 549: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xe48008a0  ! 550: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0xe417c000  ! 551: LDUH_R	lduh	[%r31 + %r0], %r18
	.word 0x91d02034  ! 552: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f802001  ! 553: SIR	sir	0x0001
	.word 0xe49fe001  ! 554: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
DS_0_130:
	.word 0x34800001  ! 556: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 555: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x30700001  ! 556: BPA	<illegal instruction>
	.word 0x87802080  ! 557: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x87802020  ! 558: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xe4c804a0  ! 559: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r18
	.word 0xe44fe001  ! 560: LDSB_I	ldsb	[%r31 + 0x0001], %r18
	.word 0x93d02034  ! 561: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_lsu_0_131:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 562: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe4800be0  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r18
	.word 0x87902073  ! 564: WRPR_TT_I	wrpr	%r0, 0x0073, %tt
	.word 0x81982cdc  ! 565: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cdc, %hpstate
splash_lsu_0_132:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 566: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe42fe001  ! 567: STB_I	stb	%r18, [%r31 + 0x0001]
	.word 0xa190200b  ! 568: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x879023d6  ! 569: WRPR_TT_I	wrpr	%r0, 0x03d6, %tt
	.word 0xe4d00e60  ! 570: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r18
	.word 0x91d02033  ! 571: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xe48804a0  ! 572: LDUBA_R	lduba	[%r0, %r0] 0x25, %r18
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 573: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_0_133:
	.word 0x20800001  ! 575: BN	bn,a	<label_0x1>
	.word 0xd334c00b  ! 575: STQF_R	-	%f9, [%r11, %r19]
	normalw
	.word 0xb3458000  ! 574: RD_SOFTINT_REG	rd	%softint, %r25
	.word 0x8790216d  ! 575: WRPR_TT_I	wrpr	%r0, 0x016d, %tt
	.word 0xf217c000  ! 576: LDUH_R	lduh	[%r31 + %r0], %r25
	.word 0xf28008a0  ! 577: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	.word 0x8f902002  ! 579: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa36e6001  ! 578: SDIVX_I	sdivx	%r25, 0x0001, %r17
	.word 0x91d020b5  ! 579: Tcc_I	ta	icc_or_xcc, %r0 + 181
	ta	T_CHANGE_PRIV	! macro
	.word 0x87802020  ! 581: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x87902260  ! 582: WRPR_TT_I	wrpr	%r0, 0x0260, %tt
	.word 0x93902001  ! 583: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe29004a0  ! 584: LDUHA_R	lduha	[%r0, %r0] 0x25, %r17
	.word 0x87802004  ! 585: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe2880e40  ! 586: LDUBA_R	lduba	[%r0, %r0] 0x72, %r17
	.word 0x8780204f  ! 587: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0x8d903ec0  ! 588: WRPR_PSTATE_I	wrpr	%r0, 0x1ec0, %pstate
	.word 0x81982a1c  ! 589: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a1c, %hpstate
splash_lsu_0_135:
	set 0x1, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 590: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe21fe001  ! 591: LDD_I	ldd	[%r31 + 0x0001], %r17
	.word 0xe28fe030  ! 592: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r17
tagged_0_136:
	tsubcctv %r25, 0x12d1, %r18
	.word 0xe207e001  ! 593: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xe21fe001  ! 594: LDD_I	ldd	[%r31 + 0x0001], %r17
splash_tba_0_137:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 595: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8d9032e3  ! 596: WRPR_PSTATE_I	wrpr	%r0, 0x12e3, %pstate
	.word 0xa1902006  ! 597: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 598: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198278e  ! 599: WRHPR_HPSTATE_I	wrhpr	%r0, 0x078e, %hpstate
	.word 0x93902006  ! 600: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe297e000  ! 601: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r17
	.word 0x8d903456  ! 602: WRPR_PSTATE_I	wrpr	%r0, 0x1456, %pstate
splash_tba_0_138:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 603: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 604: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe28fe010  ! 605: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r17
	.word 0x87802089  ! 606: WRASI_I	wr	%r0, 0x0089, %asi
change_to_randtl_0_139:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902004  ! 607: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0xe28008a0  ! 608: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
DS_0_140:
	.word 0x32800001  ! 610: BNE	bne,a	<label_0x1>
	.xword 0xa7d2e575	! Random illegal ?
	.word 0xb3a0054a  ! 610: FSQRTd	fsqrt	
	.word 0xb1a0c829  ! 609: FADDs	fadds	%f3, %f9, %f24
	.word 0x87802004  ! 610: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d903792  ! 611: WRPR_PSTATE_I	wrpr	%r0, 0x1792, %pstate
	.word 0x8790228a  ! 612: WRPR_TT_I	wrpr	%r0, 0x028a, %tt
splash_tba_0_141:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 613: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf0d004a0  ! 614: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r24
splash_htba_0_142:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 615: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_0_143:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 616: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_144:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 617: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902002  ! 618: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902007  ! 619: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902abc  ! 620: WRPR_PSTATE_I	wrpr	%r0, 0x0abc, %pstate
	ta	T_CHANGE_HPRIV	! macro
splash_tba_0_145:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 622: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x93514000  ! 623: RDPR_TBA	<illegal instruction>
tagged_0_146:
	tsubcctv %r12, 0x1319, %r15
	.word 0xd207e001  ! 624: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0x87802055  ! 625: WRASI_I	wr	%r0, 0x0055, %asi
	.word 0x8b480000  ! 626: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0x8790235f  ! 627: WRPR_TT_I	wrpr	%r0, 0x035f, %tt
tagged_0_147:
	taddcctv %r19, 0x1e70, %r3
	.word 0xca07e001  ! 628: LDUW_I	lduw	[%r31 + 0x0001], %r5
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 629: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca47c000  ! 630: LDSW_R	ldsw	[%r31 + %r0], %r5
	.word 0x83d02032  ! 631: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d903125  ! 632: WRPR_PSTATE_I	wrpr	%r0, 0x1125, %pstate
	.word 0x91d02033  ! 633: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93d02034  ! 634: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x87802004  ! 635: WRASI_I	wr	%r0, 0x0004, %asi
tagged_0_148:
	tsubcctv %r16, 0x1d7c, %r12
	.word 0xca07e001  ! 636: LDUW_I	lduw	[%r31 + 0x0001], %r5
	.word 0x26800001  ! 637: BL	bl,a	<label_0x1>
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 638: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x9f802001  ! 640: SIR	sir	0x0001
	.word 0x36700001  ! 641: BPGE	<illegal instruction>
	.word 0x8d902728  ! 642: WRPR_PSTATE_I	wrpr	%r0, 0x0728, %pstate
	.word 0xca800ba0  ! 643: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r5
splash_lsu_0_149:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 644: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xb551c000  ! 645: RDPR_TL	<illegal instruction>
splash_lsu_0_150:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 646: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9023e4  ! 647: WRPR_PSTATE_I	wrpr	%r0, 0x03e4, %pstate
DS_0_151:
	.word 0x22800001  ! 649: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 648: SAVE_R	save	%r31, %r0, %r31
DS_0_152:
	.word 0x32800001  ! 650: BNE	bne,a	<label_0x1>
	.xword 0x8f505b6d	! Random illegal ?
	.word 0xed104015  ! 650: LDQF_R	-	[%r1, %r21], %f22
	.word 0x99a2c823  ! 649: FADDs	fadds	%f11, %f3, %f12
	.word 0x8f902002  ! 651: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1834005  ! 650: WR_STICK_REG_R	wr	%r13, %r5, %-
	.word 0xd997e001  ! 651: LDQFA_I	-	[%r31, 0x0001], %f12
	.word 0xd89fe001  ! 652: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x9f802001  ! 653: SIR	sir	0x0001
	.word 0xd81fc000  ! 654: LDD_R	ldd	[%r31 + %r0], %r12
tagged_0_154:
	tsubcctv %r24, 0x1494, %r20
	.word 0xd807e001  ! 655: LDUW_I	lduw	[%r31 + 0x0001], %r12
	.word 0x87902159  ! 656: WRPR_TT_I	wrpr	%r0, 0x0159, %tt
splash_tba_0_155:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 657: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_156:
	.word 0x32800001  ! 659: BNE	bne,a	<label_0x1>
	.word 0xe9342001  ! 659: STQF_I	-	%f20, [0x0001, %r16]
	normalw
	.word 0x8f458000  ! 658: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0xce4fc000  ! 659: LDSB_R	ldsb	[%r31 + %r0], %r7
	.word 0x8d9035bb  ! 660: WRPR_PSTATE_I	wrpr	%r0, 0x15bb, %pstate
	.word 0x34800001  ! 661: BG	bg,a	<label_0x1>
	.word 0x8d903722  ! 662: WRPR_PSTATE_I	wrpr	%r0, 0x1722, %pstate
DS_0_157:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 663: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x819824de  ! 664: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04de, %hpstate
tagged_0_158:
	tsubcctv %r11, 0x1190, %r24
	.word 0xce07e001  ! 665: LDUW_I	lduw	[%r31 + 0x0001], %r7
DS_0_159:
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0x22800001  ! 667: BE	be,a	<label_0x1>
	.word 0x8fa00554  ! 667: FSQRTd	fsqrt	
	.word 0xa5a10823  ! 666: FADDs	fadds	%f4, %f3, %f18
	.word 0xe49fe001  ! 667: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r18
	.word 0x93902007  ! 668: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d802000  ! 669: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xe48008a0  ! 671: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r18
	.word 0x99902002  ! 672: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa1902005  ! 673: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xad45c000  ! 674: RD_TICK_CMPR_REG	rd	%-, %r22
	.word 0xecdfe010  ! 675: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r22
tagged_0_160:
	tsubcctv %r21, 0x13b1, %r25
	.word 0xec07e001  ! 676: LDUW_I	lduw	[%r31 + 0x0001], %r22
	.word 0xed17c000  ! 677: LDQF_R	-	[%r31, %r0], %f22
	.word 0xb5a10dc9  ! 678: FdMULq	fdmulq	
	.word 0x85500000  ! 679: RDPR_TPC	<illegal instruction>
	.word 0xa190200e  ! 680: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x81982a94  ! 681: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a94, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 682: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_0_161:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 683: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc4c7e010  ! 684: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r2
	.word 0x87802089  ! 685: WRASI_I	wr	%r0, 0x0089, %asi
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 686: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc4c7e000  ! 687: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r2
	.word 0xc4880e80  ! 688: LDUBA_R	lduba	[%r0, %r0] 0x74, %r2
	.word 0xc49fc020  ! 689: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x81460000  ! 691: RD_STICK_REG	stbar
	.word 0x8790206b  ! 692: WRPR_TT_I	wrpr	%r0, 0x006b, %tt
	.word 0xc4d804a0  ! 693: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0x8d902ce7  ! 694: WRPR_PSTATE_I	wrpr	%r0, 0x0ce7, %pstate
	.word 0xa1902000  ! 695: WRPR_GL_I	wrpr	%r0, 0x0000, %-
DS_0_162:
	.word 0x22800001  ! 697: BE	be,a	<label_0x1>
	.word 0xc130e001  ! 697: STQF_I	-	%f0, [0x0001, %r3]
	normalw
	.word 0x83458000  ! 696: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0x99902000  ! 697: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
splash_tba_0_163:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 698: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc28008a0  ! 699: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc317c000  ! 700: LDQF_R	-	[%r31, %r0], %f1
tagged_0_164:
	tsubcctv %r9, 0x1e98, %r22
	.word 0xc207e001  ! 701: LDUW_I	lduw	[%r31 + 0x0001], %r1
tagged_0_165:
	taddcctv %r11, 0x15c7, %r8
	.word 0xc207e001  ! 702: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0xc2800a60  ! 703: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r1
	ta	T_CHANGE_PRIV	! macro
	.word 0xc29fe001  ! 705: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r1
	.word 0x87802014  ! 706: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x819827df  ! 707: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07df, %hpstate
	.word 0xb1480000  ! 708: RDHPR_HPSTATE	rdhpr	%hpstate, %r24
	.word 0xf08804a0  ! 709: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x91d02033  ! 710: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8790235a  ! 711: WRPR_TT_I	wrpr	%r0, 0x035a, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902007  ! 713: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d90371d  ! 714: WRPR_PSTATE_I	wrpr	%r0, 0x171d, %pstate
	.word 0xf08fe030  ! 715: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r24
splash_tba_0_166:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 716: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xf09004a0  ! 717: LDUHA_R	lduha	[%r0, %r0] 0x25, %r24
	.word 0xa1902007  ! 718: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 719: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 721: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902297  ! 722: WRPR_PSTATE_I	wrpr	%r0, 0x0297, %pstate
tagged_0_167:
	taddcctv %r5, 0x1c1c, %r4
	.word 0xf007e001  ! 723: LDUW_I	lduw	[%r31 + 0x0001], %r24
	.word 0xf08804a0  ! 724: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0xf02fc009  ! 725: STB_R	stb	%r24, [%r31 + %r9]
	.word 0x879020b7  ! 726: WRPR_TT_I	wrpr	%r0, 0x00b7, %tt
	.word 0xf08804a0  ! 727: LDUBA_R	lduba	[%r0, %r0] 0x25, %r24
	.word 0x87802058  ! 728: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0x819822d5  ! 729: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d5, %hpstate
	.word 0xf08008a0  ! 730: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x2c700001  ! 731: BPNEG	<illegal instruction>
	.word 0x93902007  ! 732: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d020b5  ! 733: Tcc_I	ta	icc_or_xcc, %r0 + 181
	.word 0x93902006  ! 734: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x32700001  ! 735: BPNE	<illegal instruction>
	.word 0x87802004  ! 736: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xf01fc000  ! 737: LDD_R	ldd	[%r31 + %r0], %r24
	.word 0x93902004  ! 738: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_0_168:
	.word 0x22800001  ! 740: BE	be,a	<label_0x1>
	allclean
	.word 0x85b0030d  ! 739: ALLIGNADDRESS	alignaddr	%r0, %r13, %r2
	.word 0x93d020b5  ! 740: Tcc_I	tne	icc_or_xcc, %r0 + 181
DS_0_169:
	.word 0x34800001  ! 742: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 741: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d802000  ! 742: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 743: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x22700001  ! 744: BPE	<illegal instruction>
	.word 0xc407c000  ! 745: LDUW_R	lduw	[%r31 + %r0], %r2
	.word 0x93902007  ! 746: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x3a700001  ! 747: BPCC	<illegal instruction>
	.word 0x81982b4c  ! 748: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b4c, %hpstate
	invalw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 749: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d500000  ! 750: RDPR_TPC	<illegal instruction>
splash_htba_0_170:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 751: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xcc1fc000  ! 752: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0x93902000  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902005  ! 754: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_0_171:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 755: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 756: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_0_172:
	.word 0x22800001  ! 758: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 757: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fc000  ! 758: LDD_R	ldd	[%r31 + %r0], %r6
	.word 0xcc8008a0  ! 759: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0xa1902008  ! 760: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xcc4fc000  ! 761: LDSB_R	ldsb	[%r31 + %r0], %r6
DS_0_173:
	.word 0x22800001  ! 763: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 762: SAVE_R	save	%r31, %r0, %r31
	.word 0xcc1fe001  ! 763: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x8198248f  ! 764: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048f, %hpstate
splash_tba_0_174:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 765: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcd97e001  ! 766: LDQFA_I	-	[%r31, 0x0001], %f6
	.word 0x8d504000  ! 767: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0x83540000  ! 768: RDPR_GL	<illegal instruction>
splash_lsu_0_175:
	set 0xf, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 769: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200d  ! 770: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x996ac01a  ! 771: SDIVX_R	sdivx	%r11, %r26, %r12
	.word 0x83508000  ! 772: RDPR_TSTATE	<illegal instruction>
	.word 0x8d902708  ! 773: WRPR_PSTATE_I	wrpr	%r0, 0x0708, %pstate
	.word 0x3e800001  ! 774: BVC	bvc,a	<label_0x1>
	.word 0xc2d004a0  ! 775: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r1
	.word 0x93902007  ! 776: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87802010  ! 777: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d902608  ! 778: WRPR_PSTATE_I	wrpr	%r0, 0x0608, %pstate
	.word 0x83d02035  ! 779: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0xc217c000  ! 780: LDUH_R	lduh	[%r31 + %r0], %r1
	.word 0x87902162  ! 781: WRPR_TT_I	wrpr	%r0, 0x0162, %tt
	invalw
	mov 0xb4, %r30
	.word 0x93d0001e  ! 782: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99514000  ! 783: RDPR_TBA	<illegal instruction>
splash_lsu_0_176:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 784: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d02032  ! 785: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902004  ! 786: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8f480000  ! 787: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0xce17c000  ! 788: LDUH_R	lduh	[%r31 + %r0], %r7
	.word 0xcec7e000  ! 789: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r7
DS_0_177:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 790: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x9f802001  ! 791: SIR	sir	0x0001
	.word 0x87902205  ! 792: WRPR_TT_I	wrpr	%r0, 0x0205, %tt
splash_tba_0_178:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 793: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xce8008a0  ! 794: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xcedfe020  ! 795: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r7
	.word 0x9f802001  ! 796: SIR	sir	0x0001
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 797: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xce1fc000  ! 798: LDD_R	ldd	[%r31 + %r0], %r7
	.word 0xce4fc000  ! 799: LDSB_R	ldsb	[%r31 + %r0], %r7
tagged_0_179:
	taddcctv %r9, 0x1269, %r26
	.word 0xce07e001  ! 800: LDUW_I	lduw	[%r31 + 0x0001], %r7
	.word 0x87802004  ! 801: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xa1902006  ! 802: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xce8008a0  ! 803: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x91d020b3  ! 804: Tcc_I	ta	icc_or_xcc, %r0 + 179
splash_tba_0_180:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 805: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_0_181:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 806: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 807: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902a0a  ! 808: WRPR_PSTATE_I	wrpr	%r0, 0x0a0a, %pstate
	.word 0x2e700001  ! 809: BPVS	<illegal instruction>
	.word 0xced7e020  ! 810: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r7
	.word 0x87902341  ! 811: WRPR_TT_I	wrpr	%r0, 0x0341, %tt
splash_lsu_0_182:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 812: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1902006  ! 813: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x38800001  ! 814: BGU	bgu,a	<label_0x1>
splash_lsu_0_183:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 815: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x99902001  ! 816: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xa1902002  ! 817: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_lsu_0_184:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 818: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcec004a0  ! 819: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0xa1902002  ! 820: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_htba_0_185:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 821: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200f  ! 822: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xce8008a0  ! 823: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0xa190200d  ! 824: WRPR_GL_I	wrpr	%r0, 0x000d, %-
DS_0_186:
	.word 0x34800001  ! 826: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 825: SAVE_R	save	%r31, %r0, %r31
	.word 0x9ba609d4  ! 826: FDIVd	fdivd	%f24, %f20, %f44
	.word 0x8f902001  ! 828: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x97a01976  ! 827: FqTOd	dis not found

	.word 0xd647e001  ! 828: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0x8790219e  ! 829: WRPR_TT_I	wrpr	%r0, 0x019e, %tt
	.word 0x8f902002  ! 831: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa3a01975  ! 830: FqTOd	dis not found

splash_lsu_0_189:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 831: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d9026ce  ! 832: WRPR_PSTATE_I	wrpr	%r0, 0x06ce, %pstate
	.word 0x91500000  ! 833: RDPR_TPC	<illegal instruction>
	.word 0x93902006  ! 834: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_0_190:
	.word 0x32800001  ! 836: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 835: RESTORE_R	restore	%r31, %r0, %r31
	ta	T_CHANGE_PRIV	! macro
change_to_randtl_0_191:
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8f902003  ! 837: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd01fe001  ! 838: LDD_I	ldd	[%r31 + 0x0001], %r8
splash_tba_0_192:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 839: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd04fe001  ! 840: LDSB_I	ldsb	[%r31 + 0x0001], %r8
	.word 0xb1a1cdc4  ! 841: FdMULq	fdmulq	
	.word 0x87802020  ! 842: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x8f902000  ! 844: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9568e001  ! 843: SDIVX_I	sdivx	%r3, 0x0001, %r10
	.word 0xd41fe001  ! 844: LDD_I	ldd	[%r31 + 0x0001], %r10
splash_cmpr_0_194:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb1806001  ! 845: WR_STICK_REG_I	wr	%r1, 0x0001, %-
	.word 0x93902006  ! 846: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982654  ! 847: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0654, %hpstate
tagged_0_195:
	taddcctv %r19, 0x152e, %r12
	.word 0xd407e001  ! 848: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd48008a0  ! 849: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd4cfe020  ! 850: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r10
	.word 0x30800001  ! 851: BA	ba,a	<label_0x1>
change_to_randtl_0_196:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 852: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x87802063  ! 853: WRASI_I	wr	%r0, 0x0063, %asi
	.word 0x9f802001  ! 854: SIR	sir	0x0001
	.word 0x8198241d  ! 855: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041d, %hpstate
DS_0_197:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 856: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8780204f  ! 857: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa1902003  ! 858: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xd41fe001  ! 859: LDD_I	ldd	[%r31 + 0x0001], %r10
tagged_0_198:
	tsubcctv %r20, 0x1ef2, %r8
	.word 0xd407e001  ! 860: LDUW_I	lduw	[%r31 + 0x0001], %r10
splash_tba_0_199:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 861: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x8780201c  ! 862: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x879023b0  ! 863: WRPR_TT_I	wrpr	%r0, 0x03b0, %tt
	.word 0x8d480000  ! 864: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0xccdfe020  ! 865: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r6
	.word 0xcc8008a0  ! 866: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	ta	T_CHANGE_HPRIV	! macro
	.word 0xcc1fe001  ! 868: LDD_I	ldd	[%r31 + 0x0001], %r6
	.word 0x81982307  ! 869: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0307, %hpstate
	.word 0x93902003  ! 870: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xccdfe030  ! 871: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r6
tagged_0_200:
	tsubcctv %r25, 0x1120, %r21
	.word 0xcc07e001  ! 872: LDUW_I	lduw	[%r31 + 0x0001], %r6
splash_tba_0_201:
	ta T_CHANGE_PRIV
	set 0x003c0000, %r2
	.word 0x8b900002  ! 873: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x87802058  ! 874: WRASI_I	wr	%r0, 0x0058, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc0fc000  ! 876: LDUB_R	ldub	[%r31 + %r0], %r6
	.word 0x8780201c  ! 877: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x87902327  ! 878: WRPR_TT_I	wrpr	%r0, 0x0327, %tt
	.word 0xccd7e030  ! 879: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r6
	ta	T_CHANGE_PRIV	! macro
	.word 0xcc9004a0  ! 881: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
splash_lsu_0_202:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 882: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 883: Tcc_I	ta	icc_or_xcc, %r0 + 178
splash_tba_0_203:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 884: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xcc8008a0  ! 885: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
DS_0_204:
	.word 0x22800001  ! 887: BE	be,a	<label_0x1>
	.word 0xd3358016  ! 887: STQF_R	-	%f9, [%r22, %r22]
	normalw
	.word 0xb3458000  ! 886: RD_SOFTINT_REG	rd	%softint, %r25
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 887: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2800ba0  ! 888: LDUWA_R	lduwa	[%r0, %r0] 0x5d, %r25
DS_0_205:
	.word 0x34800001  ! 890: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 889: RESTORE_R	restore	%r31, %r0, %r31
splash_htba_0_206:
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 890: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xf2d80e60  ! 891: LDXA_R	ldxa	[%r0, %r0] 0x73, %r25
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 892: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2c7e010  ! 893: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r25
DS_0_207:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 894: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xf28804a0  ! 895: LDUBA_R	lduba	[%r0, %r0] 0x25, %r25
	.word 0x81982b45  ! 896: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b45, %hpstate
	.word 0xf217e001  ! 897: LDUH_I	lduh	[%r31 + 0x0001], %r25
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 898: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa190200e  ! 899: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xf28008a0  ! 900: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 901: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf217c000  ! 902: LDUH_R	lduh	[%r31 + %r0], %r25
change_to_randtl_0_208:
	ta	T_CHANGE_PRIV	! macro
	.word 0x8f902001  ! 903: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x32800001  ! 904: BNE	bne,a	<label_0x1>
	.word 0xa1902004  ! 905: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x87802016  ! 906: WRASI_I	wr	%r0, 0x0016, %asi
	otherw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 907: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xf2800ae0  ! 908: LDUWA_R	lduwa	[%r0, %r0] 0x57, %r25
	.word 0x8780201c  ! 909: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0xf317c000  ! 910: LDQF_R	-	[%r31, %r0], %f25
	.word 0xa190200c  ! 911: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93902001  ! 912: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802058  ! 913: WRASI_I	wr	%r0, 0x0058, %asi
	.word 0xf28fe000  ! 914: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r25
	.word 0x8d90310e  ! 915: WRPR_PSTATE_I	wrpr	%r0, 0x110e, %pstate
	.word 0xf2800c80  ! 916: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r25
	.word 0x8f902001  ! 918: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d686001  ! 917: SDIVX_I	sdivx	%r1, 0x0001, %r6
splash_lsu_0_210:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 918: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x97464000  ! 919: RD_STICK_CMPR_REG	rd	%-, %r11
	.word 0xa190200c  ! 920: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x8198271f  ! 921: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071f, %hpstate
	.word 0xd68008a0  ! 922: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x93902002  ! 923: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
tagged_0_211:
	taddcctv %r23, 0x1b69, %r9
	.word 0xd607e001  ! 924: LDUW_I	lduw	[%r31 + 0x0001], %r11
DS_0_212:
	.word 0x22800001  ! 926: BE	be,a	<label_0x1>
	pdist %f16, %f18, %f0
	.word 0x87b4c302  ! 925: ALLIGNADDRESS	alignaddr	%r19, %r2, %r3
	.word 0x8d903abd  ! 926: WRPR_PSTATE_I	wrpr	%r0, 0x1abd, %pstate
tagged_0_213:
	taddcctv %r26, 0x1806, %r18
	.word 0xc607e001  ! 927: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc607c000  ! 928: LDUW_R	lduw	[%r31 + %r0], %r3
splash_tba_0_214:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 929: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xc68fe000  ! 930: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r3
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 931: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802080  ! 933: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93902002  ! 934: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc73fc002  ! 935: STDF_R	std	%f3, [%r2, %r31]
	.word 0xc6d804a0  ! 936: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0xc717c000  ! 937: LDQF_R	-	[%r31, %r0], %f3
tagged_0_215:
	taddcctv %r20, 0x1b57, %r18
	.word 0xc607e001  ! 938: LDUW_I	lduw	[%r31 + 0x0001], %r3
DS_0_216:
	nop
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 939: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
splash_tba_0_217:
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 940: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_218:
	.word 0x22800001  ! 942: BE	be,a	<label_0x1>
	.xword 0xbfd47561	! Random illegal ?
	.word 0xcb12c000  ! 942: LDQF_R	-	[%r11, %r0], %f5
	.word 0x85a2c82b  ! 941: FADDs	fadds	%f11, %f11, %f2
	.word 0x93902002  ! 942: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d90383a  ! 943: WRPR_PSTATE_I	wrpr	%r0, 0x183a, %pstate
	.word 0x8d902e76  ! 944: WRPR_PSTATE_I	wrpr	%r0, 0x0e76, %pstate
	.word 0x87802004  ! 945: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc48804a0  ! 946: LDUBA_R	lduba	[%r0, %r0] 0x25, %r2
	.word 0xc49fc020  ! 947: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
	.word 0x91d02035  ! 948: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902001  ! 949: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc517c000  ! 951: LDQF_R	-	[%r31, %r0], %f2
	.word 0x24700001  ! 952: BPLE	<illegal instruction>
	.word 0x8f902002  ! 954: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb181400b  ! 953: WR_STICK_REG_R	wr	%r5, %r11, %-
	.word 0x81982c8f  ! 954: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c8f, %hpstate
	.word 0xc417c000  ! 955: LDUH_R	lduh	[%r31 + %r0], %r2
	.word 0x93902005  ! 956: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902002  ! 957: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x81982487  ! 958: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0487, %hpstate
	.word 0x93902005  ! 959: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc4880e40  ! 960: LDUBA_R	lduba	[%r0, %r0] 0x72, %r2
	.word 0xc48008a0  ! 961: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0xa1902006  ! 962: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x85494000  ! 963: RDHPR_HTBA	rdhpr	%htba, %r2
	.word 0xc4d7e000  ! 964: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r2
	.word 0x93902001  ! 965: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_0_220:
	.word 0x32800001  ! 967: BNE	bne,a	<label_0x1>
	.word 0xcf318002  ! 967: STQF_R	-	%f7, [%r2, %r6]
	normalw
	.word 0x95458000  ! 966: RD_SOFTINT_REG	rd	%softint, %r10
	.word 0xa1902002  ! 967: WRPR_GL_I	wrpr	%r0, 0x0002, %-
splash_lsu_0_221:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 968: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa190200e  ! 969: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x28800001  ! 970: BLEU	bleu,a	<label_0x1>
splash_lsu_0_222:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 971: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 972: WRFPRS_I	wr	%r0, 0x0000, %fprs
splash_cmpr_0_223:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 974: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb180e001  ! 973: WR_STICK_REG_I	wr	%r3, 0x0001, %-
	.word 0x83d020b2  ! 974: Tcc_I	te	icc_or_xcc, %r0 + 178
	.word 0xd4d004a0  ! 975: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
tagged_0_224:
	tsubcctv %r23, 0x193a, %r15
	.word 0xd407e001  ! 976: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd4c00e80  ! 977: LDSWA_R	ldswa	[%r0, %r0] 0x74, %r10
	.word 0x93902003  ! 978: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x99902001  ! 979: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8d902e4c  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x0e4c, %pstate
	.word 0x93902000  ! 981: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93d020b5  ! 982: Tcc_I	tne	icc_or_xcc, %r0 + 181
	.word 0x22700001  ! 983: BPE	<illegal instruction>
	.word 0x93902003  ! 984: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 985: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 986: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 987: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd497e000  ! 988: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r10
	.word 0xd4dfe030  ! 989: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
	.word 0x83d020b5  ! 990: Tcc_I	te	icc_or_xcc, %r0 + 181
	.word 0x34800001  ! 991: BG	bg,a	<label_0x1>
	.word 0xa190200f  ! 992: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xd48008a0  ! 993: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0xd597e001  ! 994: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x83d02035  ! 995: Tcc_I	te	icc_or_xcc, %r0 + 53
splash_htba_0_225:
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 996: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902004  ! 997: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_0_226:
	.word 0x22800001  ! 999: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 998: RESTORE_R	restore	%r31, %r0, %r31
splash_lsu_0_227:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL

join_lbl_0_0:


.global user_data_start
.data
user_data_start:
	.xword	0xd73e5ac018cf646e
	.xword	0xc2b8877e391652a1
	.xword	0xef3f18c252f63ff1
	.xword	0xe9adb7af1ff5d279
	.xword	0x43ab43aebd043188
	.xword	0xa1b10cb5e4e4fdd7
	.xword	0xdf9e9bca48e20c65
	.xword	0x052a0ad76e6e6c64
	.xword	0x47bf4f910cc138f3
	.xword	0x8b7ac9df2e8ac025
	.xword	0x09ef9c361bed9e9c
	.xword	0xf0b3ddb4d61dcd45
	.xword	0x0c2d3b97cc451244
	.xword	0x4ab74d260bd2b704
	.xword	0x1be98ba967b61da3
	.xword	0xe73009119e1d4874
	.xword	0x070a32174b21e624
	.xword	0xe92beca8444583ac
	.xword	0x69c3ebd8efc85180
	.xword	0x4dfd60aa97411499
	.xword	0x49515f970a380c36
	.xword	0x59b63ed2b498f38b
	.xword	0xa28497d3f032ffde
	.xword	0x8f2dfe7525c6bb65
	.xword	0xc02aa7aa78c634ce
	.xword	0xacb2ef3714399451
	.xword	0x7e399ac44be6ae08
	.xword	0x92830f08595470b8
	.xword	0xdcc6e135d1355131
	.xword	0x46060b8f9733a2c6
	.xword	0x287f6724321dc257
	.xword	0xb1f9a96e470d99f8
	.xword	0x07e50b8bf925868c
	.xword	0x29a9de8c292d9c47
	.xword	0x8f93a7a4a770cb9b
	.xword	0x8aeefa7d1d3ebc67
	.xword	0xf89d55fad610f82a
	.xword	0xf2326a549c2fc71a
	.xword	0x9193c2b80124bb04
	.xword	0x21c2d94c19420ac6
	.xword	0x6b0e60c5fb89d196
	.xword	0x2d64c28ae312cf65
	.xword	0xe9965b5b035d805b
	.xword	0xff799bb916e202d2
	.xword	0x107b5bcb71fb0084
	.xword	0xcc682fcd897b9f5b
	.xword	0xe4b9550a793e56d1
	.xword	0xf383c3299498229c
	.xword	0x804eade5fc8b3424
	.xword	0xe186ba08057c560f
	.xword	0xf993928d7b3979ea
	.xword	0xddc36961055350cd
	.xword	0x6839f27062f1fdbf
	.xword	0x3b6939095f04497f
	.xword	0x18ab69d9bd00973f
	.xword	0x3a168f93faa942f9
	.xword	0x0efae534e9fa96d1
	.xword	0x3a4d6b0a48e7fcab
	.xword	0xc853a433cad8394d
	.xword	0xcd6a16456f93332d
	.xword	0xe42677e205a2091b
	.xword	0xa71be994c787ecfa
	.xword	0xbf64e3ef2d2c0010
	.xword	0x81a8ec8c809380d8
	.xword	0x1446215a3027767d
	.xword	0x4129de3d4f05d5f2
	.xword	0x84c84272f768db0a
	.xword	0x596c52995141e514
	.xword	0xb56beab946a54d0e
	.xword	0xa9a3fe5fbe6fa596
	.xword	0xb16daaa2bfdc01ce
	.xword	0x88b4f4804d24b936
	.xword	0x415f85052dc5676d
	.xword	0x8c394311dcd03b25
	.xword	0x48ff16273f8ee597
	.xword	0xb3b354c6c86cc3bf
	.xword	0x16945fe4ff99e0c7
	.xword	0x63dfd4bca7cb5ec5
	.xword	0x122d033da4dce858
	.xword	0xf7d2acd4eb8116c5
	.xword	0xf3f93aaf5533df3c
	.xword	0x832f5640bc0f4770
	.xword	0x8d5a46813b913f7f
	.xword	0xcb4f73e042c7c07a
	.xword	0x1d65eaafe445599c
	.xword	0xdb8169e4ce369185
	.xword	0x11ff8e0e090ebab1
	.xword	0x7583d97b4c8e84d4
	.xword	0x82e7bfd7e2e97224
	.xword	0x8a57a0d80bc3e88c
	.xword	0x921c1ee2f691642e
	.xword	0x52c94ce84b25a41c
	.xword	0x5df623e6d633f83d
	.xword	0x9d04158fcf3177fc
	.xword	0x6a4617ea50d628cd
	.xword	0xe090f8249ac82c7a
	.xword	0x0a832eaf40d5dfea
	.xword	0x12664bb02903a762
	.xword	0x45713e29c32f8322
	.xword	0xf15db37baaec95e3
	.xword	0x2b13160174bdde18
	.xword	0x9102a7a6fac5bb55
	.xword	0x7b309899e2446ce3
	.xword	0x18c10e026b5ce2eb
	.xword	0x6a1fde32c04e7704
	.xword	0xc1544653bec7455b
	.xword	0x7e37da56aa92fb7a
	.xword	0xa25c44d57fb6c091
	.xword	0x7eb157d0992204fc
	.xword	0x2ec5429e08ba3197
	.xword	0xbf2df9806d86cdae
	.xword	0xd37a4ca66df82ff5
	.xword	0x76b90a5659864c6d
	.xword	0x83479262147a94a8
	.xword	0x29906ab287951e00
	.xword	0xccac1cdb6fb667d9
	.xword	0x7e7f5570398fef92
	.xword	0xb235dc19a0ed29c0
	.xword	0xd1f280291573a015
	.xword	0xb84fc2842bc83730
	.xword	0xfa6eb047f1d8b38e
	.xword	0xfb6b5bcb7f8a1d98
	.xword	0xae6d24b49bbca060
	.xword	0x2e353806276e68a0
	.xword	0xba2e67d0317b2c80
	.xword	0x9b90a5d02aaff21f
	.xword	0xe5a523c70cf576fc
	.xword	0xd4c686e89076ab5c
	.xword	0xff59c5b7ef60bf2d
	.xword	0x403756366250522f
	.xword	0x1fbd3e6088ae5265
	.xword	0x38b2237d54a031df
	.xword	0x890211387ff93e93
	.xword	0x70fd2de5f041038a
	.xword	0xa29d49afbababf6f
	.xword	0xb1152ef45c4af1f5
	.xword	0x486b273fe8363dff
	.xword	0xaec4ec564866f357
	.xword	0x31af924d89579eb1
	.xword	0x906057c399e73037
	.xword	0x6a335d043475e042
	.xword	0x627ca4501f0a4e29
	.xword	0x51c6b6d64e417e57
	.xword	0x9180f1fe2807ae9e
	.xword	0x7cf902e8bcd9da3f
	.xword	0xf15e114ca7dad01f
	.xword	0x35239aa5c7c34d87
	.xword	0x145a0b42174217f1
	.xword	0x7c09f259f2509d51
	.xword	0xf4aa623636ca9430
	.xword	0x5c4dffc2dba7a3eb
	.xword	0xb828cf2e6da1701e
	.xword	0xbb572fe7c838f795
	.xword	0xbbe98593a534624b
	.xword	0x453d59143b255f25
	.xword	0x895200d791e8e2b2
	.xword	0x5d34abb0645578bc
	.xword	0x9bc5880dd9c28fa9
	.xword	0x544f675c4064bf55
	.xword	0xecf242544af895af
	.xword	0x832885f8ff9cff2e
	.xword	0x037f03df199e8b81
	.xword	0x4a4e6f7eaa2ba384
	.xword	0x4f7b36224ca59db2
	.xword	0x8bf2cfbe489e36e2
	.xword	0xcfea509b83b886e6
	.xword	0x5821f6b9d400be47
	.xword	0x8ca5105196dc9f92
	.xword	0x97ed26ef148462ae
	.xword	0x93064c626efc070a
	.xword	0x443dd20d3f1ea837
	.xword	0xb2c0b8998bdc6331
	.xword	0xf0ca4c965a3da060
	.xword	0x736542ab76c656de
	.xword	0xfe7c94bb3561b03a
	.xword	0xf9760212980657da
	.xword	0x2614f6d633be18e0
	.xword	0x0a8e0c59dc5fc527
	.xword	0xaddcfbefff14a649
	.xword	0x41e2c72a6bee6c1f
	.xword	0xffc7c878bec2947d
	.xword	0x240dbd9becf89fd7
	.xword	0x336b768e5dd37de3
	.xword	0x1e55da76ff2ef5a2
	.xword	0xb81b1672c3c5e979
	.xword	0xb7b72660a289f0c8
	.xword	0x8415195b99f9e355
	.xword	0xbf2cb7d4d671edd0
	.xword	0x6dc10bc437e78585
	.xword	0x83b16136c1ee703d
	.xword	0x1e8d73d766a48daf
	.xword	0xac6cc393aabf37ba
	.xword	0x9bdc09d6d56a9ea6
	.xword	0xd1261d519426fdc1
	.xword	0x395fbd22fcd4dee2
	.xword	0xb3948431c8cbae27
	.xword	0xe6fef14042230973
	.xword	0x469b60abe8688d44
	.xword	0x85cb33a2755a7dbc
	.xword	0x32f70d734453ea5d
	.xword	0x981280da81da300a
	.xword	0x4beef3f920f0b640
	.xword	0xf2b594eea81e52df
	.xword	0x84c4efd08bec59b1
	.xword	0x0037d78ebcba06e2
	.xword	0x9248af3388fc50a4
	.xword	0x76b17d59543f0b38
	.xword	0xe29aa1d59b83e9cc
	.xword	0xcb70b39c28ed7491
	.xword	0x8df1aecdb9d22102
	.xword	0x7071cf02f392579b
	.xword	0xcaae395c2ff9a85a
	.xword	0x938c74b899cf577c
	.xword	0xead2e7bb3f8d65a1
	.xword	0xa3bc2b9c7844d640
	.xword	0x8b4a94f8f097fd17
	.xword	0xb790829151b924f6
	.xword	0x87b8f95feb942336
	.xword	0x0991bba221fc19b0
	.xword	0x8566f14deb2e2dfd
	.xword	0x06a2a12f6115c989
	.xword	0x137f5b218978c4ff
	.xword	0xb258c183863ebc62
	.xword	0xbb40db0e4a503522
	.xword	0x58dc0606186f7202
	.xword	0x0189d16633c59734
	.xword	0x79af0bf61beeb285
	.xword	0x045c6ed28bd6df8e
	.xword	0x3d79308006b404cf
	.xword	0xbb5f7e669d844206
	.xword	0x13c3e808ae60e003
	.xword	0xdfb267190749c0ad
	.xword	0x338f08d95315d9ba
	.xword	0x81b6bc847c7e98ca
	.xword	0xbde56fb7bfc8caea
	.xword	0x8ae954f247e14d2d
	.xword	0x4b9d5a2d52198a9b
	.xword	0xcbdd1924e5c85f6c
	.xword	0x2edb55e1b291d897
	.xword	0x1acfabdaf4911b1f
	.xword	0x300ffa3cf904fc27
	.xword	0x778b58ba3b04c63c
	.xword	0x8ed122c049017601
	.xword	0x5dca434d049b5b11
	.xword	0x214e8555d728f7a5
	.xword	0xb777c92b862e2ddd
	.xword	0xbddc6907567f3af0
	.xword	0xf20b8db55c309bb8
	.xword	0x06192dad69d41261
	.xword	0x31c3f73e99c4c41b
	.xword	0x67ff912b9ffe5054
	.xword	0x1f76a4e1dbc8c826
	.xword	0xb89baf147a94e21e
	.xword	0xd029016982d611dc
	.xword	0x572ce9bcc476c5e6
	.xword	0x32de6d61d9673e78


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
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Wed May 19 17:33:12 2004
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
!!#     IJ_bind_thread_group("diag.j", 51, th_all, 0xff);
!!#     IJ_bind_thread_group("diag.j", 52, th_odd, 0x55);
!!#     IJ_bind_thread_group("diag.j", 53, th_even,0xaa);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 56, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     IJ_set_rvar("diag.j", 59, Rv_pdist_reg,"5'brrrr0");
!!# 
!!#     // TBA/HTBA values 
!!# 
!!#     IJ_set_rvar("diag.j", 63, Rv_tba, "6'b1111kk, 16'{0}");
!!#     IJ_set_rvar("diag.j", 64, Rv_htba, "6'b1110kk, 16'{0}");
!!# 
!!#     // LSU cntl reg ..
!!#     IJ_set_rvar("diag.j", 67, Rv_lsucntl, "5'brrrr1");
!!# 
!!#     // Illegal combos
!!#     IJ_set_rvar("diag.j", 70, Rv_illtrap, "2'b1r,5'brrrr,6'b1r1rrr,19'hrrrrr");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!# 
!!#     IJ_set_ropr_fld("diag.j", 77, ijdefault, Ft_Rs1, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 78, ijdefault, Ft_Rs2, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 79, ijdefault, Ft_Rd, "{0..13,16..27}");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 82, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 85, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 86, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x20, 0x10, 0x14, 0x16, 0x1c, 0x4f, 0x58, 0x55, 0x63, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 89, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x20, 0x14, 0x16, 0x1c, 0x4f, 0x63, 0x55, 0x58, 0x80, 0x88}");
!!#     IJ_set_ropr_fld("diag.j", 90, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 91, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 92, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 94, Ro_nontrap_ldasi_z, Ft_Imm_Asi, "{0x45, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 95, Ro_nontrap_ldasi_z, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 96, Ro_nontrap_ldasi_z, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 97, Ro_nontrap_ldasi_z, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 100, Ro_nontrap_ld, Fm_align_Simm13, "{0x0..0x6:5,0x7:1}");
!!#     IJ_set_ropr_fld("diag.j", 101, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 102, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 105, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 106, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 107, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 108, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     //IJ_set_ropr_fld(Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_ropr_fld("diag.j", 112, Ro_traps_i, Ft_Sw_Trap, "{0x32..0x35, 0xb2..0xb5}");
!!#     IJ_set_ropr_fld("diag.j", 113, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 114, Ro_traps_i, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 115, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 116, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 117, Ro_traps_r, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     //IJ_set_ropr_fld(Ro_traps_r, Ft_Simm13, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_ropr_fld("diag.j", 119, Ro_traps_r, Ft_Simm13, "{0x32..0x35, 0xb2..0xb5}");
!!#     IJ_set_rvar("diag.j", 120, Rv_init_trap, "{0x30..0x35, 0xb0..0xb5}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 123, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 124, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Pstate splash
!!#     IJ_set_ropr_fld("diag.j", 127, Ro_wrpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 128, Ro_wrpstate, Ft_Simm13, "13'brrrrrrrrrrrrr");
!!# 
!!#     // Hpstate splash
!!#     IJ_set_ropr_fld("diag.j", 131, Ro_wrhpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 132, Ro_wrhpstate, Ft_Simm13, "12'brrrrrr0rr1rr");
!!# 
!!#     // TT splash
!!#     IJ_set_ropr_fld("diag.j", 135, Ro_wrtt, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 136, Ro_wrtt, Ft_Simm13, "10'brrrrrrrrrr");
!!# 
!!#     // GL splash
!!#     IJ_set_ropr_fld("diag.j", 139, Ro_wrgl, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 140, Ro_wrgl, Ft_Simm13, "4'brrrr");
!!# 
!!#     // TL splash
!!#     IJ_set_ropr_fld("diag.j", 143, Ro_tl, Ft_Simm13, "{0..5}");
!!#     IJ_set_ropr_fld("diag.j", 144, Ro_tl, Ft_Rs1,    "{0}");
!!# 
!!#     // CWP splash
!!#     IJ_set_ropr_fld("diag.j", 147, Ro_wrcwp, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 148, Ro_wrcwp, Ft_Simm13, "3'brrr");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 150, Ro_save_restore, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 151, Ro_save_restore, Ft_Rd,  "{31}");
!!#     IJ_set_ropr_fld("diag.j", 152, Ro_save_restore, Ft_Rs2, "{0}");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 154, Ro_winops, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 155, Ro_winops, Ft_Simm13, "{0..5}");
!!# 
!!#     // {H}TBA Splash
!!#     IJ_set_ropr_fld("diag.j", 158, Ro_tba, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 159, Ro_tba, Ft_Rs2, "{2}");
!!# 
!!#     // Dest reg is %g0
!!#     IJ_set_ropr_fld("diag.j", 162, Ro_rd0, Ft_Rd, "{0}");
!!# 
!!#     // Weights
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 166,"{10}");
!!#     IJ_set_rvar("diag.j", 167, wt_high, "{90}");
!!#     IJ_set_rvar("diag.j", 168, wt_med,  "{40}");
!!#     IJ_set_rvar("diag.j", 169, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 173, th_all,"!Initializing integer registers\n");
!!#     for (k=0; k<7; k++) {
!!#         for (i = 0; i < 30; i++) {
!!#             if (i==15) {
!!#                 IJ_printf  ("diag.j", 177, th_all,"\tmov %%r31, %%r15\n");
!!#                 continue;
!!#             }
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 181, th_all,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 183, th_all,"\tmov 0x%rx, %%r14\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 184, th_all,"\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 185, th_all,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 188, th_all,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 191, th_all,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 194, th_all,"\tldd [%%r31+%d], %%f%d\n", j,i);
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 197, th_all,"\tta T_CHANGE_HPRIV \n");
!!#     IJ_printf  ("diag.j", 198, th_all,"!Initializing Tick Cmprs \n");
!!#     IJ_printf  ("diag.j", 199, th_all,"\tmov 1, %%g2\n");
!!#     IJ_printf  ("diag.j", 200, th_all,"\tsllx %%g2, 63, %%g2\n");
!!#     IJ_printf  ("diag.j", 201, th_all,"\tor %%g1, %%g2, %%g1\n");
!!#     IJ_printf("diag.j", 202, th_all, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
!!#     IJ_printf("diag.j", 203, th_all, "\twr %%g1, %%g0, %%tick_cmpr\n");
!!#     IJ_printf("diag.j", 204, th_all, "\twr %%g1, %%g0, %%sys_tick_cmpr\n");
!!#     IJ_printf  ("diag.j", 205, th_all,"!Initializing Trap Stack \n");
!!#     for (i = 1; i <=6; i++) {
!!#         IJ_printf  ("diag.j", 207, th_all,"\twrpr 0x%d, %%tl\n", i);
!!#         IJ_printf  ("diag.j", 208, th_all,"\twrpr 0x1, %%tt\n");
!!#         IJ_printf  ("diag.j", 209, th_all,"\twrpr 0x1, %%tpc\n");
!!#         IJ_printf  ("diag.j", 210, th_all,"\twrpr 0x1, %%tnpc\n");
!!#         IJ_printf  ("diag.j", 211, th_all,"\twrpr 0x1, %%tstate\n");
!!#         IJ_printf  ("diag.j", 212, th_all,"\twrhpr 0x1, %%htstate\n");
!!#     }
!!#     IJ_printf  ("diag.j", 214, th_all,"\twrpr 0x0, %%tl\n");
!!#     IJ_printf  ("diag.j", 215, th_all,"\tta T_CHANGE_NONHPRIV \n");
!!# 
!!#     IJ_th_fork_group("diag.j", 217, th_all);
!!# 
!!# }
!!# 
!!# %%
!!# %%section finish
!!# {
!!# 
!!# 
!!#     IJ_th_join_group("diag.j", 265, th_all);
!!# 
!!#     int i;
!!#     IJ_printf  ("diag.j", 268, th_all,"\n\n.global user_data_start\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 270, th_all,"\t.xword\t0x%016llrx\n", Rv_rand_64);
!!#     }
!!# 
!!#     for (i = 0; i < 4; i++) {
!!#         IJ_iseg_printf  ("diag.j", 274,MyHTRAPS, i, th_all, "#include \"htraps.s\"\n");
!!#         IJ_iseg_printf  ("diag.j", 275,MyHTRAPS, i, th_all,"#include \"tlu_htraps_ext.s\"\n");
!!#         IJ_iseg_printf  ("diag.j", 276,MyTRAPS, i, th_all,"#include \"traps.s\"\n");
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
!!#         IJ_generate ("diag.j", 325, th_all, $2);
!!#     };
!!# 
!!# inst:      trap_asr     %rvar  wt_med
!!#         |  trap_asi     %rvar  wt_med
!!#         |  tcc          %rvar  wt_high
!!#         | ldst_excp     %rvar  wt_high
!!#         | ldstasi_excp  %rvar  wt_med
!!#         | ldstasi_excp_z  %rvar  wt_med
!!#         | change_mode   %rvar  wt_med
!!#         | alu           %rvar  wt_low
!!#         | branches      %rvar  wt_high
!!#         | wrasi         %rvar  wt_med
!!#         | splash_fprs   %rvar  wt_low
!!#         | splash_pstate %rvar  wt_med
!!#         | splash_hpstate %rvar  wt_med
!!#         | splash_cwp    %rvar  wt_med
!!#         | splash_gl     %rvar  wt_med
!!#         | splash_tt     %rvar  wt_med
!!#         | stores        %rvar  wt_low
!!#         | sir           %rvar  wt_low
!!#         | splash_cmpr   %rvar  wt_low
!!#         | splash_tba    %rvar  wt_med
!!#         | splash_htba   %rvar  wt_low
!!#         | splash_lsucnt %rvar  wt_med
!!#         //| demap         %rvar wt_med
!!#         | tagged        %rvar  wt_med
!!# ;
!!# 
!!# dummy :tCHANGE_NONHPRIV | tCHANGE_NONPRIV | 
!!#        tWR_STICK_CMPR_REG_R | tWR_TICK_CMPR_REG_R |
!!#        tILLTRAP
!!# ;
!!# 
!!# sir : tSIR ;
!!# 
!!# demap : tLDX_R  %ropr  Ro_nontrap_ld
!!#     {
!!#         IJ_set_rvar("diag.j", 363, Rv_demap, "{0x57, 0x5f}");
!!#         IJ_printf("diag.j", 364, th_odd, "\tmov 0x80, %%g3\n");
!!#         IJ_printf("diag.j", 365, th_odd, "\tstxa %%g3, [%%g0] 0x%rx\n", Rv_demap);
!!#     }
!!# ;
!!# 
!!# tagged: tLDUW_I %ropr  Ro_nontrap_ld
!!#     {
!!#         IJ_printf("diag.j", 371, th_all, "tagged_%y_%d:\n", label);
!!#         IJ_set_rvar("diag.j", 372, Rv_tof_r, "{1..26}");
!!#         IJ_set_rvar("diag.j", 373, Rv_tof_i, "13'b1rrrrrrrrrrrr");
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 375, th_all, "\ttaddcctv %%r%rd, 0x%rx, %%r%rd\n", 
!!#                                 Rv_tof_r, Rv_tof_i, Rv_tof_r);
!!#         } else {
!!#             IJ_printf("diag.j", 378, th_all, "\ttsubcctv %%r%rd, 0x%rx, %%r%rd\n", 
!!#                                 Rv_tof_r, Rv_tof_i, Rv_tof_r);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# 
!!# change_mode :   
!!#     reduce_priv_level
!!#     | tCHANGE_HPRIV 
!!#     | tCHANGE_PRIV 
!!#     //| change_to_tl1
!!#     | change_to_randtl
!!#     //| tCHANGE_TO_TL0 
!!# ;
!!# 
!!# pt1: tFqTOd | tSDIVX_I | tWRTICK_R | tWR_STICK_REG_R
!!# ;
!!# 
!!# reduce_priv_level: pt1 
!!#     {
!!# 
!!#         IJ_set_ropr_fld("diag.j", 401, Ro_tl, Ft_Simm13, "{0..2}");
!!#         IJ_generate_from_token("diag.j", 402,1, th_all, Ro_tl, tWRPR_TL_I, -1);;
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 404,1, th_even, ijdefault, tCHANGE_NONHPRIV, -1);;
!!#             IJ_generate_from_token("diag.j", 405,1, th_odd, ijdefault, tCHANGE_NONPRIV, -1);;
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 407,1, th_even, ijdefault, tCHANGE_NONPRIV, -1);;
!!#             IJ_generate_from_token("diag.j", 408,1, th_odd, ijdefault, tCHANGE_NONHPRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_randtl: tWRPR_TL_I %ropr  Ro_tl
!!#     {
!!#         IJ_printf("diag.j", 416, th_all, "change_to_randtl_%y_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_set_ropr_fld("diag.j", 418, Ro_tl, Ft_Simm13, "{3..5}");
!!#             IJ_generate_from_token("diag.j", 419,1, th_all, ijdefault, tCHANGE_HPRIV, -1);;
!!#         } else {
!!#             IJ_set_ropr_fld("diag.j", 421, Ro_tl, Ft_Simm13, "{0..2}");
!!#             IJ_generate_from_token("diag.j", 422,1, th_all, ijdefault, tCHANGE_PRIV, -1);;
!!#         }
!!#         label++;
!!#     }
!!# ;   
!!# 
!!# change_to_tl1 : tCHANGE_TO_TL1
!!#     {
!!#         IJ_printf("diag.j", 430, th_all, "change_to_tl1_%y_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 432, th_even, "\tta T_CHANGE_HPRIV\n");
!!#             IJ_printf("diag.j", 433, th_odd, "\tta T_CHANGE_PRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 435, th_even, "\tta T_CHANGE_PRIV\n");
!!#             IJ_printf("diag.j", 436, th_odd, "\tta T_CHANGE_HPRIV\n");
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
!!#         IJ_printf("diag.j", 458, th_all, "splash_lsu_%y_%d:\n", label);
!!#         IJ_printf("diag.j", 459, th_all, "\tset 0x%rx, %%r2\n", Rv_lsucntl);
!!#         IJ_printf("diag.j", 460, th_all, "\tstxa %%r2, [%%r0] ASI_LSU_CONTROL\n");
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_tba: tWRPR_TBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 467, th_all, "splash_tba_%y_%d:\n", label);
!!#         IJ_printf("diag.j", 468, th_all, "\tta T_CHANGE_PRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 470, th_all, "\tset 0x120000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 472, th_all, "\tset 0x%08llrx, %%r2\n", Rv_tba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# splash_htba: tWRHPR_HTBA_R %ropr  Ro_tba
!!#     {
!!#         IJ_printf("diag.j", 479, th_all, "splash_htba_%y_%d:\n", label);
!!#         IJ_printf("diag.j", 480, th_all, "\tta T_CHANGE_HPRIV\n");
!!#         if (label%3) {
!!#             IJ_printf("diag.j", 482, th_all, "\tset 0x80000, %%r2\n");
!!#         } else {
!!#             IJ_printf("diag.j", 484, th_all, "\tset 0x%08llrx, %%r2\n", Rv_htba);
!!#         }
!!#         label++;
!!#     }
!!# ;
!!# 
!!# splash_cmpr: tWR_STICK_REG_I
!!#     {
!!#         IJ_printf("diag.j", 492, th_all, "splash_cmpr_%y_%d:\n", label);
!!#         IJ_set_rvar("diag.j", 493, Rv_rand_60,"64'h8rrrrrrr_rrrrrrrr");
!!#         IJ_set_ropr_fld("diag.j", 494, Ro_cmpr, Ft_Rs1, "{0}");
!!#         IJ_set_ropr_fld("diag.j", 495, Ro_cmpr, Ft_Rs2, "{1}");
!!#         IJ_printf  ("diag.j", 496, th_all,"\tnop\n\tmov 1, %%g2\n");
!!#         IJ_printf  ("diag.j", 497, th_all,"\tsllx %%g2, 63, %%g2\n");
!!#         IJ_printf  ("diag.j", 498, th_all,"\tor %%g1, %%g2, %%g1\n");
!!#         if (label%2) {
!!#             IJ_generate_from_token("diag.j", 500,1, th_all, Ro_cmpr, tWR_STICK_CMPR_REG_R, tWR_TICK_CMPR_REG_R, -1);;
!!#         } else {
!!#            IJ_printf("diag.j", 502, th_even, "\twrhpr %%g1, %%g0, %%hsys_tick_cmpr\n");
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
!!#         IJ_printf("diag.j", 540, th_all, "\totherw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      } else {
!!#         IJ_printf("diag.j", 542, th_all, "\tinvalw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!# load_r: tLDSB_R | tLDSH_R | tLDSW_R | tLDUB_R | tLDUH_R | tLDUW_R | tLDQF_R 
!!# ;
!!# 
!!# load_i: tLDSB_I | tLDSH_I | tLDSW_I | tLDUB_I | tLDUH_I | tLDX_I 
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
!!#         IJ_printf("diag.j", 626, th_all, "DS_%y_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 627,1, th_all, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 628,1, th_all, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 629, th_all, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 633, th_all, "DS_%y_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 634,1, th_all, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 636,1, th_all, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 638, th_all, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 640, th_all, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 645, th_all, "DS_%y_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 646,1, th_all, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 648, th_all, "\t.xword 0x%rx\t! Random illegal ?\n", Rv_illtrap);
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 650,1, th_all, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 652,1, th_all, ijdefault, tFSQRTd, tLDQF_R, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 659, th_all, "DS_%y_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 660,1, th_all, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 664, th_all, "DS_%y_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 665,1, th_all, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 669, th_all, "DS_%y_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 670, th_all, "\tnop\n\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 671, th_all, "\tjmp %%g2\n");
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

