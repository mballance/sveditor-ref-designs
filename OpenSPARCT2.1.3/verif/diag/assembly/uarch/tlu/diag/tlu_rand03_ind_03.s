/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand03_ind_03.s
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

/* File  : tlu_custom_trap_handlers.s

 */

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
	.word 0xcadfe010  ! 1: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r5
DS_0:
	.word 0x34800001  ! 3: BG	bg,a	<label_0x1>
	allclean
	.word 0x87b0c30b  ! 2: ALLIGNADDRESS	alignaddr	%r3, %r11, %r3
	ta	T_CHANGE_TO_TL0	! macro
DS_1:
	.word 0x32800001  ! 5: BNE	bne,a	<label_0x1>
	pdist %f26, %f26, %f30
	.word 0x89b1c319  ! 4: ALLIGNADDRESS	alignaddr	%r7, %r25, %r4
	.word 0x8d50c000  ! 5: RDPR_TT	rdpr	%tt, %r6
	.word 0x93a00575  ! 6: FSQRTq	fsqrt	
	.word 0x9f802001  ! 7: SIR	sir	0x0001
	.word 0x96a88009  ! 8: ANDNcc_R	andncc 	%r2, %r9, %r11
	.word 0x81982dde  ! 9: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dde, %hpstate
	.word 0x93d02034  ! 10: Tcc_I	tne	icc_or_xcc, %r0 + 52
DS_2:
	not %g0, %g2
	jmp %g2
	.word 0x9d902000  ! 11: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8da149e7  ! 12: FDIVq	dis not found

	.word 0x8d90244d  ! 13: WRPR_PSTATE_I	wrpr	%r0, 0x044d, %pstate
	.word 0x93902001  ! 14: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
DS_3:
	.word 0x22800001  ! 16: BE	be,a	<label_0x1>
	.word 0x32800001  ! 16: BNE	bne,a	<label_0x1>
	.word 0xa1a00544  ! 16: FSQRTd	fsqrt	
	.word 0x91a5483b  ! 15: FADDs	fadds	%f21, %f27, %f8
	.word 0x80828009  ! 16: ADDcc_R	addcc 	%r10, %r9, %r0
DS_4:
	.word 0x20800001  ! 18: BN	bn,a	<label_0x1>
	pdist %f22, %f22, %f16
	.word 0x8bb1c310  ! 17: ALLIGNADDRESS	alignaddr	%r7, %r16, %r5
	.word 0x879023ef  ! 18: WRPR_TT_I	wrpr	%r0, 0x03ef, %tt
	.word 0x879023a8  ! 19: WRPR_TT_I	wrpr	%r0, 0x03a8, %tt
	.word 0x8d902a1f  ! 20: WRPR_PSTATE_I	wrpr	%r0, 0x0a1f, %pstate
	.word 0xca8fe030  ! 21: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r5
	.word 0x8d90224b  ! 22: WRPR_PSTATE_I	wrpr	%r0, 0x024b, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 23: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982d4e  ! 24: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d4e, %hpstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 25: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 26: SIR	sir	0x0001
	.word 0x91d02035  ! 27: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902e56  ! 28: WRPR_PSTATE_I	wrpr	%r0, 0x0e56, %pstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 29: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982984  ! 30: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0984, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 31: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8db34fe8  ! 32: FONES	fones	%f6
	.word 0x91d02032  ! 33: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x3a700001  ! 34: BPCC	<illegal instruction>
	.word 0x87902202  ! 35: WRPR_TT_I	wrpr	%r0, 0x0202, %tt
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 37: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1480000  ! 38: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x8ef8e001  ! 39: SDIVcc_I	sdivcc 	%r3, 0x0001, %r7
	.word 0x92682001  ! 40: UDIVX_I	udivx 	%r0, 0x0001, %r9
DS_5:
	.word 0x34800001  ! 42: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 41: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9f802001  ! 42: SIR	sir	0x0001
	.word 0x89504000  ! 43: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x8350c000  ! 44: RDPR_TT	rdpr	%tt, %r1
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc277c008  ! 46: STX_R	stx	%r1, [%r31 + %r8]
	.word 0x8d902acc  ! 47: WRPR_PSTATE_I	wrpr	%r0, 0x0acc, %pstate
	.word 0x8ead8015  ! 48: ANDNcc_R	andncc 	%r22, %r21, %r7
	.word 0x9f802001  ! 49: SIR	sir	0x0001
	.word 0x93902005  ! 50: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x86aa4010  ! 51: ANDNcc_R	andncc 	%r9, %r16, %r3
	.word 0x8d902ec5  ! 52: WRPR_PSTATE_I	wrpr	%r0, 0x0ec5, %pstate
	.word 0x83d02030  ! 53: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x83d02032  ! 54: Tcc_I	te	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982940  ! 56: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0940, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 57: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8b50c000  ! 58: RDPR_TT	rdpr	%tt, %r5
	.word 0x91d02031  ! 59: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x879023a6  ! 60: WRPR_TT_I	wrpr	%r0, 0x03a6, %tt
	.word 0x8d802000  ! 61: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcbe7c030  ! 62: CASA_I	casa	[%r31] 0x 1, %r16, %r5
	.word 0x8afae001  ! 63: SDIVcc_I	sdivcc 	%r11, 0x0001, %r5
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 64: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87902111  ! 65: WRPR_TT_I	wrpr	%r0, 0x0111, %tt
	.word 0x8d802000  ! 66: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 68: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_6:
	.word 0x20800001  ! 70: BN	bn,a	<label_0x1>
	.word 0xef31a001  ! 70: STQF_I	-	%f23, [0x0001, %r6]
	normalw
	.word 0x91458000  ! 69: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0x81982e50  ! 70: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e50, %hpstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 71: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d504000  ! 72: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0x83504000  ! 73: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x93902002  ! 74: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982c0d  ! 75: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0d, %hpstate
	.word 0x879021b4  ! 76: WRPR_TT_I	wrpr	%r0, 0x01b4, %tt
	.word 0x93902000  ! 77: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d702001  ! 78: POPC_I	popc	0x0001, %r6
	.word 0x8790231d  ! 79: WRPR_TT_I	wrpr	%r0, 0x031d, %tt
	.word 0x91d02031  ! 80: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x99504000  ! 81: RDPR_TNPC	rdpr	%tnpc, %r12
	.word 0x81982115  ! 82: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0115, %hpstate
	.word 0x8d9022c9  ! 83: WRPR_PSTATE_I	wrpr	%r0, 0x02c9, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd937c010  ! 85: STQF_R	-	%f12, [%r16, %r31]
	.word 0x8d90240a  ! 86: WRPR_PSTATE_I	wrpr	%r0, 0x040a, %pstate
	.word 0x9f802001  ! 87: SIR	sir	0x0001
	.word 0x9f802001  ! 88: SIR	sir	0x0001
	.word 0x93902007  ! 89: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902697  ! 90: WRPR_PSTATE_I	wrpr	%r0, 0x0697, %pstate
	.word 0x8790203d  ! 91: WRPR_TT_I	wrpr	%r0, 0x003d, %tt
	.word 0x99902003  ! 92: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 93: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 94: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902001  ! 95: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x93902004  ! 96: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xb551c000  ! 97: RDPR_TL	rdpr	%tl, %r26
	.word 0xf48008a0  ! 98: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0x8d802004  ! 99: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902440  ! 100: WRPR_PSTATE_I	wrpr	%r0, 0x0440, %pstate
	.word 0x98fd2001  ! 101: SDIVcc_I	sdivcc 	%r20, 0x0001, %r12
change_to_tl1_7:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa5a01a6d  ! 103: FqTOi	fqtoi	
	.word 0xa8a8c013  ! 104: ANDNcc_R	andncc 	%r3, %r19, %r20
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 105: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 106: SIR	sir	0x0001
	.word 0x8d902a8c  ! 107: WRPR_PSTATE_I	wrpr	%r0, 0x0a8c, %pstate
	.word 0x83d02031  ! 108: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0xe81fc000  ! 109: LDD_R	ldd	[%r31 + %r0], %r20
	.word 0x8f51c000  ! 110: RDPR_TL	rdpr	%tl, %r7
	.word 0x98dd4000  ! 111: SMULcc_R	smulcc 	%r21, %r0, %r12
change_to_tl1_8:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87902147  ! 113: WRPR_TT_I	wrpr	%r0, 0x0147, %tt
	.word 0x83d02034  ! 114: Tcc_I	te	icc_or_xcc, %r0 + 52
DS_9:
	.word 0x32800001  ! 116: BNE	bne,a	<label_0x1>
	.word 0x32800001  ! 116: BNE	bne,a	<label_0x1>
	.word 0x81a00540  ! 116: FSQRTd	fsqrt	
	.word 0x8fa28834  ! 115: FADDs	fadds	%f10, %f20, %f7
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 116: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xce8008a0  ! 117: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x9951c000  ! 118: RDPR_TL	rdpr	%tl, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902337  ! 120: WRPR_TT_I	wrpr	%r0, 0x0337, %tt
	.word 0xab500000  ! 121: RDPR_TPC	rdpr	%tpc, %r21
	.word 0xeb27e001  ! 122: STF_I	st	%f21, [0x0001, %r31]
	.word 0x93902003  ! 123: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x879022a8  ! 124: WRPR_TT_I	wrpr	%r0, 0x02a8, %tt
	.word 0x879020d2  ! 125: WRPR_TT_I	wrpr	%r0, 0x00d2, %tt
	.word 0x93902003  ! 126: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902013  ! 127: WRPR_PSTATE_I	wrpr	%r0, 0x0013, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x87902391  ! 129: WRPR_TT_I	wrpr	%r0, 0x0391, %tt
	.word 0xa1a58d3b  ! 130: FsMULd	fsmuld	%f22, %f58, %f16
	.word 0x91d02031  ! 131: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xe08804a0  ! 132: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
	.word 0x97a000c1  ! 133: FNEGd	fnegd	%f32, %f42
	.word 0x97a0054a  ! 134: FSQRTd	fsqrt	
	.word 0x91d02035  ! 135: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x92f86001  ! 136: SDIVcc_I	sdivcc 	%r1, 0x0001, %r9
	.word 0xd27fe001  ! 137: SWAP_I	swap	%r9, [%r31 + 0x0001]
	.word 0x90d24004  ! 138: UMULcc_R	umulcc 	%r9, %r4, %r8
	.word 0x8568c000  ! 139: SDIVX_R	sdivx	%r3, %r0, %r2
	.word 0xaba00567  ! 140: FSQRTq	fsqrt	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x85a00567  ! 142: FSQRTq	fsqrt	
	.word 0xc44fe001  ! 143: LDSB_I	ldsb	[%r31 + 0x0001], %r2
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 144: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902004  ! 145: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	invalw
	mov 0x31, %r30
	.word 0x83d0001e  ! 146: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc4d804a0  ! 147: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0x91d02033  ! 148: Tcc_I	ta	icc_or_xcc, %r0 + 51
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02032  ! 150: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x9f802001  ! 151: SIR	sir	0x0001
	.word 0x81982802  ! 152: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0802, %hpstate
	.word 0xc4c7e030  ! 153: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r2
	.word 0x8790224e  ! 154: WRPR_TT_I	wrpr	%r0, 0x024e, %tt
	.word 0x8790231c  ! 155: WRPR_TT_I	wrpr	%r0, 0x031c, %tt
change_to_tl1_10:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d9024db  ! 157: WRPR_PSTATE_I	wrpr	%r0, 0x04db, %pstate
	.word 0x8d902892  ! 158: WRPR_PSTATE_I	wrpr	%r0, 0x0892, %pstate
	.word 0x879020d2  ! 159: WRPR_TT_I	wrpr	%r0, 0x00d2, %tt
	.word 0x93d02035  ! 160: Tcc_I	tne	icc_or_xcc, %r0 + 53
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 161: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802016  ! 162: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x81982d9f  ! 163: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9f, %hpstate
	.word 0x9f802001  ! 164: SIR	sir	0x0001
	.word 0x91d02032  ! 165: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8a680001  ! 166: UDIVX_R	udivx 	%r0, %r1, %r5
	.word 0x8d504000  ! 167: RDPR_TNPC	rdpr	%tnpc, %r6
DS_11:
	.word 0x34800001  ! 169: BG	bg,a	<label_0x1>
	.word 0xf1316001  ! 169: STQF_I	-	%f24, [0x0001, %r5]
	normalw
	.word 0xa1458000  ! 168: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0x879021b4  ! 169: WRPR_TT_I	wrpr	%r0, 0x01b4, %tt
	.word 0x93902003  ! 170: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902e45  ! 171: WRPR_PSTATE_I	wrpr	%r0, 0x0e45, %pstate
	.word 0x8d90261a  ! 172: WRPR_PSTATE_I	wrpr	%r0, 0x061a, %pstate
	.word 0x856ea001  ! 173: SDIVX_I	sdivx	%r26, 0x0001, %r2
	.word 0x87902025  ! 174: WRPR_TT_I	wrpr	%r0, 0x0025, %tt
	.word 0x80c56001  ! 175: ADDCcc_I	addccc 	%r21, 0x0001, %r0
	.word 0xc07fe001  ! 176: SWAP_I	swap	%r0, [%r31 + 0x0001]
change_to_tl1_12:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xc07fe001  ! 178: SWAP_I	swap	%r0, [%r31 + 0x0001]
	.word 0xc0c00e60  ! 179: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r0
	.word 0xc0c7e000  ! 180: LDSWA_I	ldswa	[%r31, + 0x0000] %asi, %r0
	.word 0x91d02035  ! 181: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d802000  ! 182: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90260a  ! 183: WRPR_PSTATE_I	wrpr	%r0, 0x060a, %pstate
DS_13:
	.word 0x20800001  ! 185: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 184: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902e17  ! 185: WRPR_PSTATE_I	wrpr	%r0, 0x0e17, %pstate
	.word 0x93902007  ! 186: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d9022cb  ! 187: WRPR_PSTATE_I	wrpr	%r0, 0x02cb, %pstate
	.word 0x879022df  ! 188: WRPR_TT_I	wrpr	%r0, 0x02df, %tt
	.word 0x8ba649c0  ! 189: FDIVd	fdivd	%f56, %f0, %f36
	.word 0x8790233f  ! 190: WRPR_TT_I	wrpr	%r0, 0x033f, %tt
	.word 0xcaffc020  ! 191: SWAPA_R	swapa	%r5, [%r31 + %r0] 0x01
	.word 0x8790220e  ! 192: WRPR_TT_I	wrpr	%r0, 0x020e, %tt
	.word 0x99508000  ! 193: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x8790211c  ! 194: WRPR_TT_I	wrpr	%r0, 0x011c, %tt
DS_14:
	.word 0x32800001  ! 196: BNE	bne,a	<label_0x1>
	pdist %f28, %f24, %f4
	.word 0x95b48316  ! 195: ALLIGNADDRESS	alignaddr	%r18, %r22, %r10
	.word 0x87802004  ! 196: WRASI_I	wr	%r0, 0x0004, %asi
DS_15:
	.word 0x34800001  ! 198: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 197: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02030  ! 198: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x85480000  ! 199: RDHPR_HPSTATE	rdhpr	%hpstate, %r2
DS_16:
	.word 0x34800001  ! 201: BG	bg,a	<label_0x1>
	.word 0xc5364018  ! 201: STQF_R	-	%f2, [%r24, %r25]
	normalw
	.word 0x89458000  ! 200: RD_SOFTINT_REG	rd	%softint, %r4
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 201: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 202: SIR	sir	0x0001
	.word 0x9f802001  ! 203: SIR	sir	0x0001
	.word 0x96ac0017  ! 204: ANDNcc_R	andncc 	%r16, %r23, %r11
	.word 0x9f802001  ! 205: SIR	sir	0x0001
	.word 0x87902223  ! 206: WRPR_TT_I	wrpr	%r0, 0x0223, %tt
	.word 0x8d902cc4  ! 207: WRPR_PSTATE_I	wrpr	%r0, 0x0cc4, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982858  ! 209: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0858, %hpstate
	.word 0x97540000  ! 210: RDPR_GL	rdpr	%-, %r11
	.word 0x879020e6  ! 211: WRPR_TT_I	wrpr	%r0, 0x00e6, %tt
	.word 0x819829d1  ! 212: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d1, %hpstate
	.word 0xd68008a0  ! 213: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0xa151c000  ! 215: RDPR_TL	rdpr	%tl, %r16
	.word 0x8480800d  ! 216: ADDcc_R	addcc 	%r2, %r13, %r2
	.word 0xc4d804a0  ! 217: LDXA_R	ldxa	[%r0, %r0] 0x25, %r2
	.word 0xc48008a0  ! 218: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x99480000  ! 219: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0xb249c006  ! 220: MULX_R	mulx 	%r7, %r6, %r25
DS_17:
	.word 0x22800001  ! 222: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 221: SAVE_R	save	%r31, %r0, %r31
	.word 0x93902007  ! 222: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x9f802001  ! 223: SIR	sir	0x0001
	.word 0x91d02032  ! 224: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x24800001  ! 225: BLE	ble,a	<label_0x1>
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 226: Tcc_R	te	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 227: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8fa18d26  ! 228: FsMULd	fsmuld	%f6, %f6, %f38
	.word 0x93902000  ! 229: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d9028c1  ! 230: WRPR_PSTATE_I	wrpr	%r0, 0x08c1, %pstate
	.word 0x8198298d  ! 231: WRHPR_HPSTATE_I	wrhpr	%r0, 0x098d, %hpstate
	.word 0xa9a009f4  ! 232: FDIVq	dis not found

	.word 0x9f802001  ! 233: SIR	sir	0x0001
	.word 0xafa00541  ! 234: FSQRTd	fsqrt	
	.word 0x8d802004  ! 235: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_PRIV	! macro
	.word 0xeec804a0  ! 237: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r23
	.word 0x91702001  ! 238: POPC_I	popc	0x0001, %r8
DS_18:
	.word 0x32800001  ! 240: BNE	bne,a	<label_0x1>
	illtrap
	.word 0xe512c005  ! 240: LDQF_R	-	[%r11, %r5], %f18
	.word 0x9ba54828  ! 239: FADDs	fadds	%f21, %f8, %f13
	.word 0x28800001  ! 240: BLEU	bleu,a	<label_0x1>
	.word 0x9f802001  ! 241: SIR	sir	0x0001
	.word 0x9950c000  ! 242: RDPR_TT	rdpr	%tt, %r12
	.word 0x8e820018  ! 243: ADDcc_R	addcc 	%r8, %r24, %r7
	.word 0x93902007  ! 244: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xce8008a0  ! 245: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x8790224f  ! 246: WRPR_TT_I	wrpr	%r0, 0x024f, %tt
	.word 0x879023b4  ! 247: WRPR_TT_I	wrpr	%r0, 0x03b4, %tt
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 248: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982e5f  ! 249: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5f, %hpstate
	.word 0xce2fe001  ! 250: STB_I	stb	%r7, [%r31 + 0x0001]
	.word 0x93d02034  ! 251: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x879022fc  ! 252: WRPR_TT_I	wrpr	%r0, 0x02fc, %tt
	.word 0xb5a209e8  ! 253: FDIVq	dis not found

	.word 0x91d02035  ! 254: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902005  ! 255: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xf48008a0  ! 256: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0x8d9028ce  ! 257: WRPR_PSTATE_I	wrpr	%r0, 0x08ce, %pstate
	.word 0x87902113  ! 258: WRPR_TT_I	wrpr	%r0, 0x0113, %tt
	.word 0x8d9022c2  ! 259: WRPR_PSTATE_I	wrpr	%r0, 0x02c2, %pstate
	.word 0x89494000  ! 260: RDHPR_HTBA	rdhpr	%htba, %r4
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 261: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902007  ! 263: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d9022ce  ! 264: WRPR_PSTATE_I	wrpr	%r0, 0x02ce, %pstate
	.word 0x93902004  ! 265: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x91d02033  ! 266: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x85494000  ! 267: RDHPR_HTBA	rdhpr	%htba, %r2
	.word 0x8d902c82  ! 268: WRPR_PSTATE_I	wrpr	%r0, 0x0c82, %pstate
	.word 0x8550c000  ! 269: RDPR_TT	rdpr	%tt, %r2
	.word 0x9f802001  ! 270: SIR	sir	0x0001
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 271: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 272: SIR	sir	0x0001
	.word 0x91d02034  ! 273: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xaa810007  ! 274: ADDcc_R	addcc 	%r4, %r7, %r21
	.word 0x9b480000  ! 275: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x8d802004  ! 276: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9f802001  ! 277: SIR	sir	0x0001
	.word 0xaafd2001  ! 278: SDIVcc_I	sdivcc 	%r20, 0x0001, %r21
	.word 0x8d902804  ! 279: WRPR_PSTATE_I	wrpr	%r0, 0x0804, %pstate
	.word 0xab6b400d  ! 280: SDIVX_R	sdivx	%r13, %r13, %r21
	.word 0x81702001  ! 281: POPC_I	popc	0x0001, %r0
	.word 0x91d02030  ! 282: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xc08008a0  ! 283: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x87902063  ! 284: WRPR_TT_I	wrpr	%r0, 0x0063, %tt
	.word 0x32800001  ! 285: BNE	bne,a	<label_0x1>
	.word 0x87902329  ! 286: WRPR_TT_I	wrpr	%r0, 0x0329, %tt
	.word 0x91d02035  ! 287: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87480000  ! 288: RDHPR_HPSTATE	rdhpr	%hpstate, %r3
DS_19:
	.word 0x20800001  ! 290: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 289: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc64fc000  ! 290: LDSB_R	ldsb	[%r31 + %r0], %r3
	.word 0x97a6cd26  ! 291: FsMULd	fsmuld	%f27, %f6, %f42
	.word 0x9f802001  ! 292: SIR	sir	0x0001
	.word 0xa5a00542  ! 293: FSQRTd	fsqrt	
	.word 0x84aa8006  ! 294: ANDNcc_R	andncc 	%r10, %r6, %r2
	.word 0xad504000  ! 295: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x93902006  ! 296: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902000  ! 297: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 298: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91480000  ! 299: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0xd0ffc026  ! 300: SWAPA_R	swapa	%r8, [%r31 + %r6] 0x01
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 301: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 302: SIR	sir	0x0001
	.word 0x91d02034  ! 303: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 304: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_20:
	.word 0x22800001  ! 306: BE	be,a	<label_0x1>
	.word 0xe730a001  ! 306: STQF_I	-	%f19, [0x0001, %r2]
	normalw
	.word 0xa3458000  ! 305: RD_SOFTINT_REG	rd	%softint, %r17
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 306: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819829c8  ! 307: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09c8, %hpstate
	.word 0x83d02034  ! 308: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x9ba1c9b5  ! 309: FDIVs	fdivs	%f7, %f21, %f13
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8f494000  ! 312: RDHPR_HTBA	rdhpr	%htba, %r7
	.word 0x97494000  ! 313: RDHPR_HTBA	rdhpr	%htba, %r11
	ta	T_CHANGE_HPRIV	! macro
	.word 0x879022e9  ! 315: WRPR_TT_I	wrpr	%r0, 0x02e9, %tt
	.word 0x85514000  ! 316: RDPR_TBA	rdpr	%tba, %r2
	.word 0x9f802001  ! 317: SIR	sir	0x0001
	.word 0x8d90228f  ! 318: WRPR_PSTATE_I	wrpr	%r0, 0x028f, %pstate
DS_21:
	.word 0x34800001  ! 320: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 319: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x879021a5  ! 320: WRPR_TT_I	wrpr	%r0, 0x01a5, %tt
	.word 0x9a680005  ! 321: UDIVX_R	udivx 	%r0, %r5, %r13
	.word 0x9f802001  ! 322: SIR	sir	0x0001
	.word 0x8d90261c  ! 323: WRPR_PSTATE_I	wrpr	%r0, 0x061c, %pstate
	.word 0x8d90204b  ! 324: WRPR_PSTATE_I	wrpr	%r0, 0x004b, %pstate
	.word 0xdad7e020  ! 325: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r13
	.word 0x38800001  ! 326: BGU	bgu,a	<label_0x1>
	.word 0x91d02030  ! 327: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8198289d  ! 328: WRHPR_HPSTATE_I	wrhpr	%r0, 0x089d, %hpstate
	.word 0x844c801a  ! 329: MULX_R	mulx 	%r18, %r26, %r2
	.word 0x90828006  ! 330: ADDcc_R	addcc 	%r10, %r6, %r8
	.word 0x9f802001  ! 331: SIR	sir	0x0001
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 332: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879021f2  ! 334: WRPR_TT_I	wrpr	%r0, 0x01f2, %tt
	.word 0xa7a089c2  ! 335: FDIVd	fdivd	%f2, %f2, %f50
	.word 0x836d6001  ! 336: SDIVX_I	sdivx	%r21, 0x0001, %r1
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8951c000  ! 338: RDPR_TL	rdpr	%tl, %r4
	.word 0x84684006  ! 339: UDIVX_R	udivx 	%r1, %r6, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc49004a0  ! 341: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	.word 0x99902002  ! 342: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
DS_22:
	.word 0x22800001  ! 344: BE	be,a	<label_0x1>
	pdist %f14, %f6, %f0
	.word 0xadb2431a  ! 343: ALLIGNADDRESS	alignaddr	%r9, %r26, %r22
DS_23:
	.word 0x34800001  ! 345: BG	bg,a	<label_0x1>
	pdist %f6, %f8, %f4
	.word 0x89b48302  ! 344: ALLIGNADDRESS	alignaddr	%r18, %r2, %r4
	.word 0x91d02035  ! 345: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x91d02032  ! 346: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902496  ! 347: WRPR_PSTATE_I	wrpr	%r0, 0x0496, %pstate
	.word 0x9750c000  ! 348: RDPR_TT	rdpr	%tt, %r11
	.word 0xd727c002  ! 349: STF_R	st	%f11, [%r2, %r31]
	.word 0xd61fc000  ! 350: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0x8d9022d7  ! 351: WRPR_PSTATE_I	wrpr	%r0, 0x02d7, %pstate
	.word 0x97500000  ! 352: RDPR_TPC	rdpr	%tpc, %r11
change_to_tl1_24:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xb1a000cd  ! 354: FNEGd	fnegd	%f44, %f24
	.word 0xb4f86001  ! 355: SDIVcc_I	sdivcc 	%r1, 0x0001, %r26
	.word 0x81982ed3  ! 356: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed3, %hpstate
	.word 0x9f802001  ! 357: SIR	sir	0x0001
	.word 0xf4d7e000  ! 358: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r26
	.word 0x8d802000  ! 359: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02030  ! 360: Tcc_I	ta	icc_or_xcc, %r0 + 48
DS_25:
	.word 0x32800001  ! 362: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 361: SAVE_R	save	%r31, %r0, %r31
	.word 0x9f802001  ! 362: SIR	sir	0x0001
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 363: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902205  ! 364: WRPR_PSTATE_I	wrpr	%r0, 0x0205, %pstate
	.word 0x8d90264e  ! 365: WRPR_PSTATE_I	wrpr	%r0, 0x064e, %pstate
DS_26:
	.word 0x22800001  ! 367: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 366: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x819828d8  ! 367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d8, %hpstate
	.word 0x8790224a  ! 368: WRPR_TT_I	wrpr	%r0, 0x024a, %tt
	.word 0x8f702001  ! 369: POPC_I	popc	0x0001, %r7
	.word 0x879022dc  ! 370: WRPR_TT_I	wrpr	%r0, 0x02dc, %tt
	.word 0x87902398  ! 371: WRPR_TT_I	wrpr	%r0, 0x0398, %tt
	.word 0x93902006  ! 372: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902003  ! 373: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8f6a0012  ! 374: SDIVX_R	sdivx	%r8, %r18, %r7
	.word 0xcf27c012  ! 375: STF_R	st	%f7, [%r18, %r31]
	.word 0x879021cf  ! 376: WRPR_TT_I	wrpr	%r0, 0x01cf, %tt
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 377: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 378: SIR	sir	0x0001
	.word 0x9f802001  ! 379: SIR	sir	0x0001
	.word 0x91d02034  ! 380: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xb6d8400d  ! 381: SMULcc_R	smulcc 	%r1, %r13, %r27
	.word 0x819822c4  ! 382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c4, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0xf6d00e40  ! 384: LDSHA_R	ldsha	[%r0, %r0] 0x72, %r27
	.word 0xf6cfe030  ! 385: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r27
	.word 0xb669e001  ! 386: UDIVX_I	udivx 	%r7, 0x0001, %r27
	.word 0x8d902652  ! 387: WRPR_PSTATE_I	wrpr	%r0, 0x0652, %pstate
	.word 0xf697e030  ! 388: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r27
	.word 0x9f802001  ! 389: SIR	sir	0x0001
	.word 0x879021bc  ! 390: WRPR_TT_I	wrpr	%r0, 0x01bc, %tt
	.word 0x81982b9d  ! 391: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b9d, %hpstate
	.word 0x93902001  ! 392: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x88820006  ! 393: ADDcc_R	addcc 	%r8, %r6, %r4
	.word 0x93d02033  ! 394: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xc8c7e020  ! 395: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	.word 0x8790230e  ! 396: WRPR_TT_I	wrpr	%r0, 0x030e, %tt
	.word 0xc9e7c026  ! 397: CASA_I	casa	[%r31] 0x 1, %r6, %r4
	.word 0xc897e020  ! 398: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r4
	ta	T_CHANGE_NONHPRIV	! macro
DS_27:
	.word 0x32800001  ! 401: BNE	bne,a	<label_0x1>
	.word 0xcf308006  ! 401: STQF_R	-	%f7, [%r6, %r2]
	normalw
	.word 0x93458000  ! 400: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x2c700001  ! 401: BPNEG	<illegal instruction>
	.word 0x86d0c012  ! 402: UMULcc_R	umulcc 	%r3, %r18, %r3
	.word 0x93902004  ! 403: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x819820d6  ! 404: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d6, %hpstate
DS_28:
	.word 0x22800001  ! 406: BE	be,a	<label_0x1>
	.word 0xc5366001  ! 406: STQF_I	-	%f2, [0x0001, %r25]
	normalw
	.word 0x9b458000  ! 405: RD_SOFTINT_REG	rd	%softint, %r13
	.word 0xdb17c000  ! 406: LDQF_R	-	[%r31, %r0], %f13
	.word 0x879022a8  ! 407: WRPR_TT_I	wrpr	%r0, 0x02a8, %tt
	.word 0x9f802001  ! 408: SIR	sir	0x0001
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 409: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c8f  ! 410: WRPR_PSTATE_I	wrpr	%r0, 0x0c8f, %pstate
	.word 0x87504000  ! 411: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x93902005  ! 412: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982c9c  ! 413: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9c, %hpstate
	.word 0x87902166  ! 414: WRPR_TT_I	wrpr	%r0, 0x0166, %tt
	.word 0x8790235b  ! 415: WRPR_TT_I	wrpr	%r0, 0x035b, %tt
change_to_tl1_29:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xc6ffc032  ! 417: SWAPA_R	swapa	%r3, [%r31 + %r18] 0x01
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 418: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982c54  ! 419: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c54, %hpstate
	.word 0x8d902c92  ! 420: WRPR_PSTATE_I	wrpr	%r0, 0x0c92, %pstate
	.word 0x9f802001  ! 421: SIR	sir	0x0001
	.word 0x8d9024da  ! 422: WRPR_PSTATE_I	wrpr	%r0, 0x04da, %pstate
	.word 0xa5a00551  ! 423: FSQRTd	fsqrt	
	.word 0x93480000  ! 424: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x95a109c2  ! 425: FDIVd	fdivd	%f4, %f2, %f10
	.word 0x8198208c  ! 426: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008c, %hpstate
	.word 0x91d02034  ! 427: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81982019  ! 428: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0019, %hpstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 429: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_30:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x83d02033  ! 431: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x9f802001  ! 432: SIR	sir	0x0001
	.word 0x9f802001  ! 433: SIR	sir	0x0001
	.word 0x87802004  ! 434: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x9f802001  ! 435: SIR	sir	0x0001
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd4c80e80  ! 437: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r10
	.word 0x879021dc  ! 438: WRPR_TT_I	wrpr	%r0, 0x01dc, %tt
	.word 0x81982198  ! 439: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0198, %hpstate
	.word 0x8d902049  ! 440: WRPR_PSTATE_I	wrpr	%r0, 0x0049, %pstate
	.word 0xb5508000  ! 441: RDPR_TSTATE	rdpr	%tstate, %r26
	.word 0x87802088  ! 442: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902005  ! 443: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9f802001  ! 444: SIR	sir	0x0001
	.word 0x9f802001  ! 445: SIR	sir	0x0001
	.word 0x9f802001  ! 446: SIR	sir	0x0001
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 447: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 448: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x33, %r30
	.word 0x93d0001e  ! 449: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 450: SIR	sir	0x0001
	.word 0x8d902c08  ! 451: WRPR_PSTATE_I	wrpr	%r0, 0x0c08, %pstate
	.word 0xa1494000  ! 452: RDHPR_HTBA	rdhpr	%htba, %r16
	.word 0x93902002  ! 453: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93d02032  ! 454: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x99514000  ! 455: RDPR_TBA	rdpr	%tba, %r12
	.word 0x81982359  ! 456: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0359, %hpstate
	.word 0xd927e001  ! 457: STF_I	st	%f12, [0x0001, %r31]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81a549ad  ! 459: FDIVs	fdivs	%f21, %f13, %f0
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa6ac400c  ! 461: ANDNcc_R	andncc 	%r17, %r12, %r19
	.word 0x93902006  ! 462: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x879022c1  ! 463: WRPR_TT_I	wrpr	%r0, 0x02c1, %tt
	.word 0x81982f56  ! 464: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f56, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 465: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x26700001  ! 466: BPL	<illegal instruction>
	.word 0x88d20018  ! 467: UMULcc_R	umulcc 	%r8, %r24, %r4
	.word 0xb4498016  ! 468: MULX_R	mulx 	%r6, %r22, %r26
	.word 0x8d902642  ! 469: WRPR_PSTATE_I	wrpr	%r0, 0x0642, %pstate
	.word 0xf527c016  ! 470: STF_R	st	%f26, [%r22, %r31]
	.word 0x91d02031  ! 471: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_31:
	.word 0x34800001  ! 473: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 472: SAVE_R	save	%r31, %r0, %r31
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 473: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf4dfe010  ! 474: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r26
DS_32:
	.word 0x20800001  ! 476: BN	bn,a	<label_0x1>
	.word 0xe7360007  ! 476: STQF_R	-	%f19, [%r7, %r24]
	normalw
	.word 0xb1458000  ! 475: RD_SOFTINT_REG	rd	%softint, %r24
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xf097e010  ! 477: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r24
	.word 0xf0d804a0  ! 478: LDXA_R	ldxa	[%r0, %r0] 0x25, %r24
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 479: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 480: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 481: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x879021d5  ! 482: WRPR_TT_I	wrpr	%r0, 0x01d5, %tt
	.word 0x8d902410  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x0410, %pstate
	.word 0xb151c000  ! 484: RDPR_TL	rdpr	%tl, %r24
	.word 0x8d90288d  ! 485: WRPR_PSTATE_I	wrpr	%r0, 0x088d, %pstate
	.word 0x81982ece  ! 486: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ece, %hpstate
	.word 0x93902004  ! 487: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87a00572  ! 488: FSQRTq	fsqrt	
	.word 0x87902221  ! 489: WRPR_TT_I	wrpr	%r0, 0x0221, %tt
	.word 0xad540000  ! 490: RDPR_GL	rdpr	%-, %r22
	.word 0x98d5c003  ! 491: UMULcc_R	umulcc 	%r23, %r3, %r12
	.word 0x8969c00d  ! 492: SDIVX_R	sdivx	%r7, %r13, %r4
	.word 0x879021ff  ! 493: WRPR_TT_I	wrpr	%r0, 0x01ff, %tt
	.word 0x9f802001  ! 494: SIR	sir	0x0001
	.word 0xc85fc000  ! 495: LDX_R	ldx	[%r31 + %r0], %r4
	.word 0x83500000  ! 496: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x87902374  ! 497: WRPR_TT_I	wrpr	%r0, 0x0374, %tt
	.word 0x94fc0008  ! 498: SDIVcc_R	sdivcc 	%r16, %r8, %r10
	.word 0x9b51c000  ! 499: RDPR_TL	rdpr	%tl, %r13
	.word 0x976a2001  ! 500: SDIVX_I	sdivx	%r8, 0x0001, %r11
	.word 0xd6ffc028  ! 501: SWAPA_R	swapa	%r11, [%r31 + %r8] 0x01
	.word 0xa9a00564  ! 502: FSQRTq	fsqrt	
	.word 0x93902005  ! 503: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_PRIV	! macro
	.word 0x83b14ff3  ! 505: FONES	fones	%f1
	.word 0x80dec016  ! 506: SMULcc_R	smulcc 	%r27, %r22, %r0
	.word 0xc0800c60  ! 507: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r0
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xc02fc016  ! 510: STB_R	stb	%r0, [%r31 + %r22]
	.word 0x8ba01a65  ! 511: FqTOi	fqtoi	
	.word 0xcb3fe001  ! 512: STDF_I	std	%f5, [0x0001, %r31]
	.word 0x9f802001  ! 513: SIR	sir	0x0001
	.word 0x81982715  ! 514: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0715, %hpstate
	.word 0x2e700001  ! 515: BPVS	<illegal instruction>
	.word 0x87802088  ! 516: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x8790215f  ! 517: WRPR_TT_I	wrpr	%r0, 0x015f, %tt
	.word 0x93902004  ! 518: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xabb04ff6  ! 519: FONES	fones	%f21
	.word 0x8ba64dc2  ! 520: FdMULq	fdmulq	
DS_33:
	.word 0x20800001  ! 522: BN	bn,a	<label_0x1>
	allclean
	.word 0x8db0c301  ! 521: ALLIGNADDRESS	alignaddr	%r3, %r1, %r6
	.word 0x9a4b401b  ! 522: MULX_R	mulx 	%r13, %r27, %r13
	.word 0x8d902890  ! 523: WRPR_PSTATE_I	wrpr	%r0, 0x0890, %pstate
	.word 0x93902004  ! 524: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9f802001  ! 525: SIR	sir	0x0001
	.word 0x84c4a001  ! 526: ADDCcc_I	addccc 	%r18, 0x0001, %r2
	.word 0x8790214b  ! 527: WRPR_TT_I	wrpr	%r0, 0x014b, %tt
	.word 0x81982819  ! 528: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0819, %hpstate
	.word 0xc497e020  ! 529: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r2
	.word 0x8198209a  ! 530: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009a, %hpstate
	.word 0x99902000  ! 531: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 532: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 533: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 534: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 535: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xafa40d2a  ! 536: FsMULd	fsmuld	%f16, %f10, %f54
	.word 0x81982e4d  ! 537: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4d, %hpstate
	.word 0x93902005  ! 538: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x91d02034  ! 539: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x879022fe  ! 540: WRPR_TT_I	wrpr	%r0, 0x02fe, %tt
	.word 0xeed004a0  ! 541: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r23
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xb5a10d32  ! 543: FsMULd	fsmuld	%f4, %f18, %f26
	.word 0x83480000  ! 544: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0xc25fe001  ! 545: LDX_I	ldx	[%r31 + 0x0001], %r1
	.word 0x99902005  ! 546: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xc2dfe020  ! 547: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r1
	.word 0x81982f08  ! 548: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f08, %hpstate
	.word 0x8d802004  ! 549: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9f802001  ! 550: SIR	sir	0x0001
	.word 0x91d02031  ! 551: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8ac5e001  ! 552: ADDCcc_I	addccc 	%r23, 0x0001, %r5
	.word 0x8881e001  ! 553: ADDcc_I	addcc 	%r7, 0x0001, %r4
	.word 0x82808005  ! 554: ADDcc_R	addcc 	%r2, %r5, %r1
	.word 0x879020e9  ! 555: WRPR_TT_I	wrpr	%r0, 0x00e9, %tt
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 556: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 557: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 558: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 559: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902252  ! 560: WRPR_TT_I	wrpr	%r0, 0x0252, %tt
	.word 0x91540000  ! 561: RDPR_GL	rdpr	%-, %r8
	.word 0x87802014  ! 562: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x93902003  ! 563: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902005  ! 564: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902003  ! 565: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0xd027c005  ! 566: STW_R	stw	%r8, [%r31 + %r5]
	.word 0xab514000  ! 567: RDPR_TBA	rdpr	%tba, %r21
	.word 0x8d902606  ! 568: WRPR_PSTATE_I	wrpr	%r0, 0x0606, %pstate
	.word 0x8790204d  ! 569: WRPR_TT_I	wrpr	%r0, 0x004d, %tt
	.word 0x83d02034  ! 570: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x87902352  ! 571: WRPR_TT_I	wrpr	%r0, 0x0352, %tt
	.word 0x87902034  ! 572: WRPR_TT_I	wrpr	%r0, 0x0034, %tt
	.word 0x91d02032  ! 573: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xeb27e001  ! 574: STF_I	st	%f21, [0x0001, %r31]
	.word 0x36800001  ! 575: BGE	bge,a	<label_0x1>
	.word 0xa3540000  ! 576: RDPR_GL	rdpr	%-, %r17
	.word 0x8b500000  ! 577: RDPR_TPC	<illegal instruction>
	.word 0x93902002  ! 578: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xac4a800d  ! 579: MULX_R	mulx 	%r10, %r13, %r22
	.word 0x8790220a  ! 580: WRPR_TT_I	wrpr	%r0, 0x020a, %tt
DS_34:
	.word 0x32800001  ! 582: BNE	bne,a	<label_0x1>
	.word 0xd1302001  ! 582: STQF_I	-	%f8, [0x0001, %r0]
	normalw
	.word 0xaf458000  ! 581: RD_SOFTINT_REG	rd	%softint, %r23
	.word 0x87a309d1  ! 582: FDIVd	fdivd	%f12, %f48, %f34
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 583: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_35:
	.word 0x22800001  ! 585: BE	be,a	<label_0x1>
	pdist %f26, %f6, %f10
	.word 0xafb20301  ! 584: ALLIGNADDRESS	alignaddr	%r8, %r1, %r23
	.word 0x87802088  ! 585: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x99a309ca  ! 586: FDIVd	fdivd	%f12, %f10, %f12
	.word 0x87902397  ! 587: WRPR_TT_I	wrpr	%r0, 0x0397, %tt
	.word 0x26700001  ! 588: BPL	<illegal instruction>
	.word 0x91a249a9  ! 589: FDIVs	fdivs	%f9, %f9, %f8
	.word 0xd127c009  ! 590: STF_R	st	%f8, [%r9, %r31]
	.word 0xa2ae400d  ! 591: ANDNcc_R	andncc 	%r25, %r13, %r17
	.word 0x93902001  ! 592: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87902026  ! 593: WRPR_TT_I	wrpr	%r0, 0x0026, %tt
	ta	T_CHANGE_PRIV	! macro
change_to_tl1_36:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 596: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x30, %r30
	.word 0x83d0001e  ! 597: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 598: Tcc_I	ta	icc_or_xcc, %r0 + 48
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 599: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 600: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198285a  ! 601: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085a, %hpstate
	.word 0x8350c000  ! 602: RDPR_TT	rdpr	%tt, %r1
	.word 0x30800001  ! 603: BA	ba,a	<label_0x1>
	.word 0x81982f09  ! 604: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f09, %hpstate
DS_37:
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 605: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8198270f  ! 606: WRHPR_HPSTATE_I	wrhpr	%r0, 0x070f, %hpstate
	.word 0xc2dfe010  ! 607: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r1
	.word 0x8d9026d6  ! 608: WRPR_PSTATE_I	wrpr	%r0, 0x06d6, %pstate
	.word 0xa868c010  ! 609: UDIVX_R	udivx 	%r3, %r16, %r20
	.word 0x93902006  ! 610: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f802001  ! 611: SIR	sir	0x0001
	.word 0x9750c000  ! 612: RDPR_TT	rdpr	%tt, %r11
	.word 0x81982b92  ! 613: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b92, %hpstate
	.word 0x83d02033  ! 614: Tcc_I	te	icc_or_xcc, %r0 + 51
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 615: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93d02033  ! 616: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xd717c000  ! 617: LDQF_R	-	[%r31, %r0], %f11
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802000  ! 619: WRFPRS_I	wr	%r0, 0x0000, %fprs
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 620: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879023bd  ! 621: WRPR_TT_I	wrpr	%r0, 0x03bd, %tt
	.word 0x8790227d  ! 622: WRPR_TT_I	wrpr	%r0, 0x027d, %tt
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 623: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd737c010  ! 624: STQF_R	-	%f11, [%r16, %r31]
	.word 0x879020b0  ! 625: WRPR_TT_I	wrpr	%r0, 0x00b0, %tt
	.word 0x93902001  ! 626: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x83d02031  ! 627: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x8790223d  ! 628: WRPR_TT_I	wrpr	%r0, 0x023d, %tt
DS_38:
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 629: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x91d02035  ! 630: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa9a5c9b8  ! 631: FDIVs	fdivs	%f23, %f24, %f20
	.word 0x95a00567  ! 632: FSQRTq	fsqrt	
	.word 0x9668a001  ! 633: UDIVX_I	udivx 	%r2, 0x0001, %r11
	.word 0x976ca001  ! 634: SDIVX_I	sdivx	%r18, 0x0001, %r11
	.word 0x88f9e001  ! 635: SDIVcc_I	sdivcc 	%r7, 0x0001, %r4
	.word 0x81982a17  ! 636: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a17, %hpstate
	.word 0x93902003  ! 637: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902006  ! 638: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902c96  ! 639: WRPR_PSTATE_I	wrpr	%r0, 0x0c96, %pstate
	.word 0x93902006  ! 640: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87902245  ! 641: WRPR_TT_I	wrpr	%r0, 0x0245, %tt
	.word 0x8198221e  ! 642: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021e, %hpstate
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 643: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93902007  ! 645: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x81982508  ! 646: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0508, %hpstate
	.word 0xc87fe001  ! 647: SWAP_I	swap	%r4, [%r31 + 0x0001]
	.word 0x9f802001  ! 648: SIR	sir	0x0001
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99902002  ! 650: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xa3540000  ! 651: RDPR_GL	rdpr	%-, %r17
	.word 0x81982c9f  ! 652: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c9f, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 654: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 655: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xe28008a0  ! 656: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0x87902245  ! 657: WRPR_TT_I	wrpr	%r0, 0x0245, %tt
	.word 0x93902005  ! 658: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d51c000  ! 659: RDPR_TL	rdpr	%tl, %r6
	.word 0xa9a489c1  ! 660: FDIVd	fdivd	%f18, %f32, %f20
	.word 0x93902001  ! 661: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9f802001  ! 662: SIR	sir	0x0001
	.word 0x879022c0  ! 663: WRPR_TT_I	wrpr	%r0, 0x02c0, %tt
	.word 0x8d802000  ! 664: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 666: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe8d7e030  ! 667: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r20
	.word 0x8d902099  ! 668: WRPR_PSTATE_I	wrpr	%r0, 0x0099, %pstate
	.word 0x91d02034  ! 669: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902006  ! 670: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02032  ! 671: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x83b04fe2  ! 672: FONES	fones	%f1
	.word 0x97500000  ! 673: RDPR_TPC	rdpr	%tpc, %r11
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 674: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 675: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x879022f2  ! 676: WRPR_TT_I	wrpr	%r0, 0x02f2, %tt
	.word 0x91d02035  ! 677: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d902c0a  ! 678: WRPR_PSTATE_I	wrpr	%r0, 0x0c0a, %pstate
	.word 0x93902000  ! 679: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
DS_39:
	.word 0x34800001  ! 681: BG	bg,a	<label_0x1>
	allclean
	.word 0xb1b6c311  ! 680: ALLIGNADDRESS	alignaddr	%r27, %r17, %r24
	.word 0x8d902403  ! 681: WRPR_PSTATE_I	wrpr	%r0, 0x0403, %pstate
	.word 0xf01fe001  ! 682: LDD_I	ldd	[%r31 + 0x0001], %r24
	.word 0x93902001  ! 683: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xf07fe001  ! 684: SWAP_I	swap	%r24, [%r31 + 0x0001]
	.word 0xa1514000  ! 685: RDPR_TBA	rdpr	%tba, %r16
	.word 0x8d9022c7  ! 686: WRPR_PSTATE_I	wrpr	%r0, 0x02c7, %pstate
	.word 0x81982994  ! 687: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0994, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x83d0001e  ! 688: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 689: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xb3514000  ! 690: RDPR_TBA	rdpr	%tba, %r25
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 691: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 692: SIR	sir	0x0001
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 693: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_HPRIV	! macro
DS_40:
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 695: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0xf2900e80  ! 696: LDUHA_R	lduha	[%r0, %r0] 0x74, %r25
	.word 0x9f802001  ! 697: SIR	sir	0x0001
	.word 0x8d802000  ! 698: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982483  ! 699: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0483, %hpstate
	.word 0x91a089a4  ! 700: FDIVs	fdivs	%f2, %f4, %f8
	.word 0xac69e001  ! 701: UDIVX_I	udivx 	%r7, 0x0001, %r22
	.word 0x8150c000  ! 702: RDPR_TT	rdpr	%tt, %r0
	.word 0x8a696001  ! 703: UDIVX_I	udivx 	%r5, 0x0001, %r5
	.word 0x8fa01a76  ! 704: FqTOi	fqtoi	
	.word 0xce27c016  ! 705: STW_R	stw	%r7, [%r31 + %r22]
	.word 0x87802016  ! 706: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x83d02033  ! 707: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x93902004  ! 708: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902360  ! 709: WRPR_TT_I	wrpr	%r0, 0x0360, %tt
	.word 0x26800001  ! 710: BL	bl,a	<label_0x1>
	.word 0x87902398  ! 711: WRPR_TT_I	wrpr	%r0, 0x0398, %tt
	.word 0xce800be0  ! 712: LDUWA_R	lduwa	[%r0, %r0] 0x5f, %r7
	.word 0xa282a001  ! 713: ADDcc_I	addcc 	%r10, 0x0001, %r17
	.word 0x93902006  ! 714: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f802001  ! 715: SIR	sir	0x0001
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 716: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982092  ! 717: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0092, %hpstate
	.word 0x87902118  ! 718: WRPR_TT_I	wrpr	%r0, 0x0118, %tt
	.word 0x83d02034  ! 719: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0xe2c00e40  ! 720: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r17
	.word 0x80f9c013  ! 721: SDIVcc_R	sdivcc 	%r7, %r19, %r0
	.word 0x8198268b  ! 722: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068b, %hpstate
	.word 0xad514000  ! 723: RDPR_TBA	rdpr	%tba, %r22
	.word 0x9a818010  ! 724: ADDcc_R	addcc 	%r6, %r16, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02032  ! 726: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x87802080  ! 727: WRASI_I	wr	%r0, 0x0080, %asi
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8da68dc4  ! 729: FdMULq	fdmulq	
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9f802001  ! 731: SIR	sir	0x0001
	.word 0x81982b87  ! 732: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b87, %hpstate
	.word 0xaba00562  ! 733: FSQRTq	fsqrt	
	.word 0xea47e001  ! 734: LDSW_I	ldsw	[%r31 + 0x0001], %r21
DS_41:
	.word 0x34800001  ! 736: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 735: SAVE_R	save	%r31, %r0, %r31
	.word 0x93d02035  ! 736: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x91d02032  ! 737: Tcc_I	ta	icc_or_xcc, %r0 + 50
change_to_tl1_42:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902cd9  ! 739: WRPR_PSTATE_I	wrpr	%r0, 0x0cd9, %pstate
	.word 0x8d90225f  ! 740: WRPR_PSTATE_I	wrpr	%r0, 0x025f, %pstate
	.word 0x87802016  ! 741: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0xb351c000  ! 742: RDPR_TL	rdpr	%tl, %r25
	.word 0xb3a04d2d  ! 743: FsMULd	fsmuld	%f1, %f44, %f56
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 744: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 745: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902334  ! 746: WRPR_TT_I	wrpr	%r0, 0x0334, %tt
	.word 0xf2800b80  ! 747: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r25
	.word 0x806c6001  ! 748: UDIVX_I	udivx 	%r17, 0x0001, %r0
	.word 0x93902001  ! 749: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x9f802001  ! 750: SIR	sir	0x0001
	.word 0x2a700001  ! 751: BPCS	<illegal instruction>
	.word 0x8d902c4d  ! 752: WRPR_PSTATE_I	wrpr	%r0, 0x0c4d, %pstate
	.word 0x93902007  ! 753: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d02035  ! 754: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8d802004  ! 755: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d902240  ! 756: WRPR_PSTATE_I	wrpr	%r0, 0x0240, %pstate
	.word 0x8d902a8b  ! 757: WRPR_PSTATE_I	wrpr	%r0, 0x0a8b, %pstate
	.word 0xc08008a0  ! 758: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x91d02030  ! 759: Tcc_I	ta	icc_or_xcc, %r0 + 48
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879022fe  ! 761: WRPR_TT_I	wrpr	%r0, 0x02fe, %tt
	.word 0x95a609bb  ! 762: FDIVs	fdivs	%f24, %f27, %f10
	.word 0x9351c000  ! 763: RDPR_TL	rdpr	%tl, %r9
	.word 0x879023a4  ! 764: WRPR_TT_I	wrpr	%r0, 0x03a4, %tt
	.word 0xd327c01b  ! 765: STF_R	st	%f9, [%r27, %r31]
	.word 0x8d902e0b  ! 766: WRPR_PSTATE_I	wrpr	%r0, 0x0e0b, %pstate
change_to_tl1_43:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
change_to_tl1_44:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x35, %r30
	.word 0x83d0001e  ! 769: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d90280a  ! 770: WRPR_PSTATE_I	wrpr	%r0, 0x080a, %pstate
	.word 0x93902002  ! 771: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd257e001  ! 772: LDSH_I	ldsh	[%r31 + 0x0001], %r9
	.word 0x9f802001  ! 773: SIR	sir	0x0001
	.word 0xd2ffc03b  ! 774: SWAPA_R	swapa	%r9, [%r31 + %r27] 0x01
	.word 0x20700001  ! 775: BPN	<illegal instruction>
	.word 0xd2800c60  ! 776: LDUWA_R	lduwa	[%r0, %r0] 0x63, %r9
	.word 0x8d902a17  ! 777: WRPR_PSTATE_I	wrpr	%r0, 0x0a17, %pstate
	.word 0x81494000  ! 778: RDHPR_HTBA	rdhpr	%htba, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d902adf  ! 780: WRPR_PSTATE_I	wrpr	%r0, 0x0adf, %pstate
	.word 0x93902002  ! 781: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8f514000  ! 782: RDPR_TBA	rdpr	%tba, %r7
	.word 0x8198209b  ! 783: WRHPR_HPSTATE_I	wrhpr	%r0, 0x009b, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x93d0001e  ! 784: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8198201f  ! 785: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001f, %hpstate
	.word 0x87802080  ! 786: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902a80  ! 787: WRPR_PSTATE_I	wrpr	%r0, 0x0a80, %pstate
	.word 0x83a2c9d8  ! 788: FDIVd	fdivd	%f42, %f24, %f32
	.word 0x81982216  ! 789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0216, %hpstate
	.word 0x87802080  ! 790: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x83508000  ! 791: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0xa3500000  ! 792: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x8d902499  ! 793: WRPR_PSTATE_I	wrpr	%r0, 0x0499, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa7a209f8  ! 795: FDIVq	dis not found

	.word 0x8d902a1f  ! 796: WRPR_PSTATE_I	wrpr	%r0, 0x0a1f, %pstate
	.word 0xe6ffc038  ! 797: SWAPA_R	swapa	%r19, [%r31 + %r24] 0x01
DS_45:
	.word 0x32800001  ! 799: BNE	bne,a	<label_0x1>
	allclean
	.word 0xb3b2030b  ! 798: ALLIGNADDRESS	alignaddr	%r8, %r11, %r25
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x9f802001  ! 800: SIR	sir	0x0001
	.word 0x89a18d29  ! 801: FsMULd	fsmuld	%f6, %f40, %f4
	.word 0x8198241b  ! 802: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041b, %hpstate
	.word 0xa3a149b2  ! 803: FDIVs	fdivs	%f5, %f18, %f17
	.word 0x8d802000  ! 804: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99902003  ! 805: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x8d902847  ! 806: WRPR_PSTATE_I	wrpr	%r0, 0x0847, %pstate
	.word 0x99500000  ! 807: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x8d902852  ! 808: WRPR_PSTATE_I	wrpr	%r0, 0x0852, %pstate
	.word 0x93902001  ! 809: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81a01a62  ! 810: FqTOi	fqtoi	
	.word 0xac6c0005  ! 811: UDIVX_R	udivx 	%r16, %r5, %r22
	.word 0x83d02035  ! 812: Tcc_I	te	icc_or_xcc, %r0 + 53
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 813: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_46:
	.word 0x32800001  ! 815: BNE	bne,a	<label_0x1>
	pdist %f10, %f4, %f10
	.word 0x85b00302  ! 814: ALLIGNADDRESS	alignaddr	%r0, %r2, %r2
	.word 0x81982adc  ! 815: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adc, %hpstate
	.word 0x83b1cfed  ! 816: FONES	fones	%f1
	.word 0x99902001  ! 817: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x87902044  ! 818: WRPR_TT_I	wrpr	%r0, 0x0044, %tt
	.word 0x8d902a4e  ! 819: WRPR_PSTATE_I	wrpr	%r0, 0x0a4e, %pstate
	.word 0x8d802004  ! 820: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xad480000  ! 821: RDHPR_HPSTATE	rdhpr	%hpstate, %r22
	.word 0x8cd56001  ! 822: UMULcc_I	umulcc 	%r21, 0x0001, %r6
	.word 0x879022e4  ! 823: WRPR_TT_I	wrpr	%r0, 0x02e4, %tt
	.word 0x92c2a001  ! 824: ADDCcc_I	addccc 	%r10, 0x0001, %r9
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x82694015  ! 826: UDIVX_R	udivx 	%r5, %r21, %r1
	.word 0x93902002  ! 827: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9adac00a  ! 828: SMULcc_R	smulcc 	%r11, %r10, %r13
	.word 0xb56ce001  ! 829: SDIVX_I	sdivx	%r19, 0x0001, %r26
	.word 0x93902001  ! 830: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x819822d4  ! 831: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d4, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 832: Tcc_R	te	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 833: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198275a  ! 834: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075a, %hpstate
	.word 0x8198281d  ! 835: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081d, %hpstate
	.word 0x8d9020da  ! 836: WRPR_PSTATE_I	wrpr	%r0, 0x00da, %pstate
	.word 0x87902128  ! 837: WRPR_TT_I	wrpr	%r0, 0x0128, %tt
	.word 0x93d02034  ! 838: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x87902041  ! 839: WRPR_TT_I	wrpr	%r0, 0x0041, %tt
	.word 0x93902004  ! 840: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d802004  ! 841: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xb5540000  ! 842: RDPR_GL	rdpr	%-, %r26
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 843: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x20700001  ! 844: BPN	<illegal instruction>
	.word 0xf4ffc02a  ! 845: SWAPA_R	swapa	%r26, [%r31 + %r10] 0x01
	.word 0xb3508000  ! 846: RDPR_TSTATE	rdpr	%tstate, %r25
	.word 0xf22fe001  ! 847: STB_I	stb	%r25, [%r31 + 0x0001]
	.word 0x83d02030  ! 848: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0xf2c7e020  ! 849: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r25
	.word 0x81982f96  ! 850: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f96, %hpstate
	.word 0x8d902604  ! 851: WRPR_PSTATE_I	wrpr	%r0, 0x0604, %pstate
	.word 0x87902373  ! 852: WRPR_TT_I	wrpr	%r0, 0x0373, %tt
	.word 0x8790226d  ! 853: WRPR_TT_I	wrpr	%r0, 0x026d, %tt
	.word 0xf28008a0  ! 854: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r25
DS_47:
	.word 0x32800001  ! 856: BNE	bne,a	<label_0x1>
	.word 0xd131a001  ! 856: STQF_I	-	%f8, [0x0001, %r6]
	normalw
	.word 0xb5458000  ! 855: RD_SOFTINT_REG	rd	%softint, %r26
	.word 0xab50c000  ! 856: RDPR_TT	rdpr	%tt, %r21
	.word 0x879023c6  ! 857: WRPR_TT_I	wrpr	%r0, 0x03c6, %tt
	.word 0x81982649  ! 858: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0649, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 859: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xead804a0  ! 860: LDXA_R	ldxa	[%r0, %r0] 0x25, %r21
	.word 0x95480000  ! 861: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x9f802001  ! 862: SIR	sir	0x0001
DS_48:
	.word 0x22800001  ! 864: BE	be,a	<label_0x1>
	allclean
	.word 0xa3b1430b  ! 863: ALLIGNADDRESS	alignaddr	%r5, %r11, %r17
	.word 0x89540000  ! 864: RDPR_GL	rdpr	%-, %r4
	.word 0x819828c7  ! 865: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c7, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 866: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902317  ! 867: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
	.word 0x8ba0c9ec  ! 868: FDIVq	dis not found

	.word 0x8151c000  ! 869: RDPR_TL	rdpr	%tl, %r0
change_to_tl1_49:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 871: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8da00542  ! 872: FSQRTd	fsqrt	
	.word 0x93902003  ! 873: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8790216e  ! 876: WRPR_TT_I	wrpr	%r0, 0x016e, %tt
	.word 0xcc9fc020  ! 877: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0xb1a64d29  ! 878: FsMULd	fsmuld	%f25, %f40, %f24
	.word 0x93902000  ! 879: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902007  ! 880: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x99902005  ! 881: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8790234c  ! 882: WRPR_TT_I	wrpr	%r0, 0x034c, %tt
	.word 0xf08008a0  ! 883: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0x8790217c  ! 884: WRPR_TT_I	wrpr	%r0, 0x017c, %tt
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 885: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x966e0015  ! 886: UDIVX_R	udivx 	%r24, %r21, %r11
	.word 0x93902003  ! 887: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x879021ca  ! 888: WRPR_TT_I	wrpr	%r0, 0x01ca, %tt
	.word 0x8d902a17  ! 889: WRPR_PSTATE_I	wrpr	%r0, 0x0a17, %pstate
	.word 0x8da44d29  ! 890: FsMULd	fsmuld	%f17, %f40, %f6
	.word 0x91d02033  ! 891: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xcc2fc009  ! 892: STB_R	stb	%r6, [%r31 + %r9]
	.word 0x83a000d0  ! 893: FNEGd	fnegd	%f16, %f32
	.word 0xc25fc000  ! 894: LDX_R	ldx	[%r31 + %r0], %r1
	.word 0xad702001  ! 895: POPC_I	popc	0x0001, %r22
	.word 0x879020f8  ! 896: WRPR_TT_I	wrpr	%r0, 0x00f8, %tt
	.word 0x879021f8  ! 897: WRPR_TT_I	wrpr	%r0, 0x01f8, %tt
	.word 0x91d02032  ! 898: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902002  ! 899: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d902ad2  ! 900: WRPR_PSTATE_I	wrpr	%r0, 0x0ad2, %pstate
	.word 0xb1514000  ! 901: RDPR_TBA	rdpr	%tba, %r24
	.word 0x8b51c000  ! 902: RDPR_TL	<illegal instruction>
	.word 0x85a0057b  ! 903: FSQRTq	fsqrt	
	.word 0x93902003  ! 904: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x9686e001  ! 905: ADDcc_I	addcc 	%r27, 0x0001, %r11
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 906: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x88d4a001  ! 907: UMULcc_I	umulcc 	%r18, 0x0001, %r4
	.word 0x81982a9a  ! 908: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9a, %hpstate
	.word 0x89a089f9  ! 909: FDIVq	dis not found

	.word 0x8d802004  ! 910: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90240e  ! 911: WRPR_PSTATE_I	wrpr	%r0, 0x040e, %pstate
	.word 0x9f802001  ! 912: SIR	sir	0x0001
	.word 0x93902007  ! 913: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x85b44fe5  ! 914: FONES	fones	%f2
	.word 0x9f802001  ! 915: SIR	sir	0x0001
	.word 0x91d02030  ! 916: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xc417e001  ! 917: LDUH_I	lduh	[%r31 + 0x0001], %r2
	.word 0xc42fe001  ! 918: STB_I	stb	%r2, [%r31 + 0x0001]
	.word 0x83d02032  ! 919: Tcc_I	te	icc_or_xcc, %r0 + 50
change_to_tl1_50:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 921: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02031  ! 922: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x9f802001  ! 923: SIR	sir	0x0001
	.word 0x9f802001  ! 924: SIR	sir	0x0001
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 925: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x30800001  ! 926: BA	ba,a	<label_0x1>
	.word 0x24700001  ! 927: BPLE	<illegal instruction>
	.word 0x81982d88  ! 928: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d88, %hpstate
	.word 0x879023b5  ! 929: WRPR_TT_I	wrpr	%r0, 0x03b5, %tt
	.word 0xb5494000  ! 930: RDHPR_HTBA	rdhpr	%htba, %r26
	.word 0x8ba2cdda  ! 931: FdMULq	fdmulq	
	.word 0x8d902099  ! 932: WRPR_PSTATE_I	wrpr	%r0, 0x0099, %pstate
change_to_tl1_51:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x87902045  ! 934: WRPR_TT_I	wrpr	%r0, 0x0045, %tt
	.word 0x8d902a0c  ! 935: WRPR_PSTATE_I	wrpr	%r0, 0x0a0c, %pstate
	.word 0x87802016  ! 936: WRASI_I	wr	%r0, 0x0016, %asi
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 937: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 938: SIR	sir	0x0001
change_to_tl1_52:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d9028d2  ! 940: WRPR_PSTATE_I	wrpr	%r0, 0x08d2, %pstate
	.word 0x95a689cb  ! 941: FDIVd	fdivd	%f26, %f42, %f10
	.word 0xd5e7c02b  ! 942: CASA_I	casa	[%r31] 0x 1, %r11, %r10
	.word 0x83a000c6  ! 943: FNEGd	fnegd	%f6, %f32
DS_53:
	.word 0x20800001  ! 945: BN	bn,a	<label_0x1>
	.word 0xf131000d  ! 945: STQF_R	-	%f24, [%r13, %r4]
	normalw
	.word 0x85458000  ! 944: RD_SOFTINT_REG	rd	%softint, %r2
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 945: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99a00562  ! 946: FSQRTq	fsqrt	
	.word 0x916ac005  ! 947: SDIVX_R	sdivx	%r11, %r5, %r8
	.word 0x97508000  ! 948: RDPR_TSTATE	rdpr	%tstate, %r11
	.word 0x93902003  ! 949: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802089  ! 950: WRASI_I	wr	%r0, 0x0089, %asi
DS_54:
	.word 0x34800001  ! 952: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 951: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 952: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 953: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x824a000b  ! 954: MULX_R	mulx 	%r8, %r11, %r1
	.word 0x8d902a18  ! 955: WRPR_PSTATE_I	wrpr	%r0, 0x0a18, %pstate
	.word 0xc2d7e030  ! 956: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r1
	.word 0x93902007  ! 957: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87902006  ! 958: WRPR_TT_I	wrpr	%r0, 0x0006, %tt
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 959: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902c0e  ! 960: WRPR_PSTATE_I	wrpr	%r0, 0x0c0e, %pstate
	.word 0x8d9028c1  ! 961: WRPR_PSTATE_I	wrpr	%r0, 0x08c1, %pstate
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 962: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902e88  ! 963: WRPR_PSTATE_I	wrpr	%r0, 0x0e88, %pstate
	.word 0x879023dc  ! 964: WRPR_TT_I	wrpr	%r0, 0x03dc, %tt
	.word 0x93902000  ! 965: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d802000  ! 966: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 967: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879023fa  ! 968: WRPR_TT_I	wrpr	%r0, 0x03fa, %tt
	.word 0x879022ac  ! 969: WRPR_TT_I	wrpr	%r0, 0x02ac, %tt
	.word 0x8d9024c9  ! 970: WRPR_PSTATE_I	wrpr	%r0, 0x04c9, %pstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 971: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 972: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982dc0  ! 973: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dc0, %hpstate
	.word 0x91d02030  ! 974: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d802000  ! 975: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 976: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc2d7e020  ! 977: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r1
	.word 0x91d02031  ! 978: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x819821df  ! 979: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01df, %hpstate
	.word 0x826ac004  ! 980: UDIVX_R	udivx 	%r11, %r4, %r1
	.word 0x8f480000  ! 981: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
	.word 0x8cfb2001  ! 982: SDIVcc_I	sdivcc 	%r12, 0x0001, %r6
	.word 0x879022ac  ! 983: WRPR_TT_I	wrpr	%r0, 0x02ac, %tt
	.word 0xcc8008a0  ! 984: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8d9028db  ! 985: WRPR_PSTATE_I	wrpr	%r0, 0x08db, %pstate
	.word 0x8198244d  ! 986: WRHPR_HPSTATE_I	wrhpr	%r0, 0x044d, %hpstate
	.word 0xa1500000  ! 987: RDPR_TPC	rdpr	%tpc, %r16
	.word 0x8d802000  ! 988: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x819825c7  ! 989: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c7, %hpstate
	.word 0x87902038  ! 990: WRPR_TT_I	wrpr	%r0, 0x0038, %tt
	.word 0xe01fc000  ! 991: LDD_R	ldd	[%r31 + %r0], %r16
	.word 0xa150c000  ! 992: RDPR_TT	rdpr	%tt, %r16
	.word 0x8790221e  ! 993: WRPR_TT_I	wrpr	%r0, 0x021e, %tt
	ta	T_CHANGE_HPRIV	! macro
DS_55:
	not %g0, %g2
	jmp %g2
	.word 0x9d902001  ! 995: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0x81982d04  ! 996: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d04, %hpstate
	.word 0x93902006  ! 997: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xe137e001  ! 998: STQF_I	-	%f16, [0x0001, %r31]
	.word 0x93902000  ! 999: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9f802001  ! 1000: SIR	sir	0x0001
	.word 0x8d902e1d  ! 1001: WRPR_PSTATE_I	wrpr	%r0, 0x0e1d, %pstate
change_to_tl1_56:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9f802001  ! 1003: SIR	sir	0x0001
	.word 0x89a000d6  ! 1004: FNEGd	fnegd	%f22, %f4
	.word 0x91d02030  ! 1005: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa3500000  ! 1006: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x93902002  ! 1007: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x89504000  ! 1008: RDPR_TNPC	rdpr	%tnpc, %r4
	.word 0x8d802000  ! 1009: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1010: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982f5b  ! 1011: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5b, %hpstate
	.word 0x93902006  ! 1012: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_57:
	not %g0, %g2
	jmp %g2
	.word 0x9d902003  ! 1013: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x87902393  ! 1014: WRPR_TT_I	wrpr	%r0, 0x0393, %tt
	.word 0x819822c0  ! 1015: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02c0, %hpstate
	.word 0x95a589b2  ! 1016: FDIVs	fdivs	%f22, %f18, %f10
	.word 0x8d902058  ! 1017: WRPR_PSTATE_I	wrpr	%r0, 0x0058, %pstate
	.word 0x8d9024cd  ! 1018: WRPR_PSTATE_I	wrpr	%r0, 0x04cd, %pstate
	.word 0x90d14019  ! 1019: UMULcc_R	umulcc 	%r5, %r25, %r8
	.word 0x93902005  ! 1020: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x22700001  ! 1021: BPE	<illegal instruction>
	.word 0x91d02033  ! 1022: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xa7494000  ! 1023: RDHPR_HTBA	rdhpr	%htba, %r19
	.word 0x81b6cfea  ! 1024: FONES	fones	%f0
	.word 0x87902202  ! 1025: WRPR_TT_I	wrpr	%r0, 0x0202, %tt
	.word 0x879020ad  ! 1026: WRPR_TT_I	wrpr	%r0, 0x00ad, %tt
	.word 0x8d902e1e  ! 1027: WRPR_PSTATE_I	wrpr	%r0, 0x0e1e, %pstate
	.word 0xb4816001  ! 1028: ADDcc_I	addcc 	%r5, 0x0001, %r26
	.word 0x87902270  ! 1029: WRPR_TT_I	wrpr	%r0, 0x0270, %tt
	.word 0x9f802001  ! 1030: SIR	sir	0x0001
	.word 0x87902050  ! 1031: WRPR_TT_I	wrpr	%r0, 0x0050, %tt
	.word 0x8790221b  ! 1032: WRPR_TT_I	wrpr	%r0, 0x021b, %tt
	invalw
	mov 0x34, %r30
	.word 0x83d0001e  ! 1033: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x8b508000  ! 1035: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0x93902006  ! 1036: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1037: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xca880e80  ! 1038: LDUBA_R	lduba	[%r0, %r0] 0x74, %r5
	.word 0x819828d9  ! 1039: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d9, %hpstate
	.word 0xca8008a0  ! 1040: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0x91d02035  ! 1041: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x8790217f  ! 1042: WRPR_TT_I	wrpr	%r0, 0x017f, %tt
DS_58:
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1043: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	.word 0x8d9028d1  ! 1044: WRPR_PSTATE_I	wrpr	%r0, 0x08d1, %pstate
DS_59:
	.word 0x34800001  ! 1046: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1046: BN	bn,a	<label_0x1>
	.word 0x83a0054c  ! 1046: FSQRTd	fsqrt	
	.word 0x81a24822  ! 1045: FADDs	fadds	%f9, %f2, %f0
	.word 0x9551c000  ! 1046: RDPR_TL	rdpr	%tl, %r10
	.word 0x9f802001  ! 1047: SIR	sir	0x0001
	.word 0x93d02030  ! 1048: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xd48008a0  ! 1049: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x87802080  ! 1050: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x28800001  ! 1051: BLEU	bleu,a	<label_0x1>
	.word 0x8fa289e0  ! 1052: FDIVq	dis not found

	.word 0x87902239  ! 1053: WRPR_TT_I	wrpr	%r0, 0x0239, %tt
	.word 0x93d02034  ! 1054: Tcc_I	tne	icc_or_xcc, %r0 + 52
DS_60:
	.word 0x32800001  ! 1056: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x95a0054c  ! 1056: FSQRTd	fsqrt	
	.word 0x81a0c826  ! 1055: FADDs	fadds	%f3, %f6, %f0
	.word 0xc0dfe000  ! 1056: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r0
	.word 0x87802004  ! 1057: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x2e700001  ! 1058: BPVS	<illegal instruction>
DS_61:
	.word 0x22800001  ! 1060: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 1059: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa46ec015  ! 1060: UDIVX_R	udivx 	%r27, %r21, %r18
	.word 0xad51c000  ! 1061: RDPR_TL	rdpr	%tl, %r22
	.word 0x91d02031  ! 1062: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x91d02033  ! 1063: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x879020d8  ! 1064: WRPR_TT_I	wrpr	%r0, 0x00d8, %tt
	.word 0xec77c015  ! 1065: STX_R	stx	%r22, [%r31 + %r21]
	.word 0x9282c00a  ! 1066: ADDcc_R	addcc 	%r11, %r10, %r9
	.word 0xd277c00a  ! 1067: STX_R	stx	%r9, [%r31 + %r10]
	.word 0xb0d4e001  ! 1068: UMULcc_I	umulcc 	%r19, 0x0001, %r24
	.word 0xafa649c7  ! 1069: FDIVd	fdivd	%f56, %f38, %f54
	.word 0xa4c4e001  ! 1070: ADDCcc_I	addccc 	%r19, 0x0001, %r18
	.word 0xe4bfc027  ! 1071: STDA_R	stda	%r18, [%r31 + %r7] 0x01
	.word 0xe40fe001  ! 1072: LDUB_I	ldub	[%r31 + 0x0001], %r18
DS_62:
	.word 0x32800001  ! 1074: BNE	bne,a	<label_0x1>
	pdist %f10, %f2, %f2
	.word 0x8bb0c302  ! 1073: ALLIGNADDRESS	alignaddr	%r3, %r2, %r5
	.word 0xca800b80  ! 1074: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r5
	.word 0x8d802000  ! 1075: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcad7e030  ! 1076: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
	.word 0xb4d42001  ! 1077: UMULcc_I	umulcc 	%r16, 0x0001, %r26
	.word 0xf48008a0  ! 1078: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0x8d902844  ! 1079: WRPR_PSTATE_I	wrpr	%r0, 0x0844, %pstate
	.word 0x85a1cd26  ! 1080: FsMULd	fsmuld	%f7, %f6, %f2
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1081: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1082: SIR	sir	0x0001
	.word 0x879023d9  ! 1083: WRPR_TT_I	wrpr	%r0, 0x03d9, %tt
	.word 0x93902000  ! 1084: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1085: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1086: SIR	sir	0x0001
	.word 0xafa000cc  ! 1087: FNEGd	fnegd	%f12, %f54
	.word 0xee9fc020  ! 1088: LDDA_R	ldda	[%r31, %r0] 0x01, %r23
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1089: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 1090: Tcc_I	ta	icc_or_xcc, %r0 + 49
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1091: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xeedfe010  ! 1092: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r23
	.word 0x93902002  ! 1093: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
DS_63:
	.word 0x20800001  ! 1095: BN	bn,a	<label_0x1>
	allclean
	.word 0x8bb34304  ! 1094: ALLIGNADDRESS	alignaddr	%r13, %r4, %r5
	.word 0xca5fc000  ! 1095: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x819822d2  ! 1096: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d2, %hpstate
	.word 0x8d50c000  ! 1097: RDPR_TT	rdpr	%tt, %r6
	.word 0xa0c16001  ! 1098: ADDCcc_I	addccc 	%r5, 0x0001, %r16
DS_64:
	.word 0x20800001  ! 1100: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1099: SAVE_R	save	%r31, %r0, %r31
	.word 0x83694004  ! 1100: SDIVX_R	sdivx	%r5, %r4, %r1
	.word 0x87802080  ! 1101: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93902000  ! 1102: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x97a349cc  ! 1103: FDIVd	fdivd	%f44, %f12, %f42
	.word 0x99a089ca  ! 1104: FDIVd	fdivd	%f2, %f10, %f12
	.word 0xd93fc00a  ! 1105: STDF_R	std	%f12, [%r10, %r31]
	.word 0x81982dd3  ! 1106: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd3, %hpstate
	.word 0xa3a000d6  ! 1107: FNEGd	fnegd	%f22, %f48
	.word 0xa66a801b  ! 1108: UDIVX_R	udivx 	%r10, %r27, %r19
	.word 0x9f802001  ! 1109: SIR	sir	0x0001
	.word 0x8d90264a  ! 1110: WRPR_PSTATE_I	wrpr	%r0, 0x064a, %pstate
	.word 0x8d902a4b  ! 1111: WRPR_PSTATE_I	wrpr	%r0, 0x0a4b, %pstate
	.word 0x8d902684  ! 1112: WRPR_PSTATE_I	wrpr	%r0, 0x0684, %pstate
	.word 0x93d02035  ! 1113: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x9f802001  ! 1114: SIR	sir	0x0001
	.word 0xacda4017  ! 1115: SMULcc_R	smulcc 	%r9, %r23, %r22
	.word 0x91d02033  ! 1116: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902855  ! 1117: WRPR_PSTATE_I	wrpr	%r0, 0x0855, %pstate
	.word 0x9f802001  ! 1118: SIR	sir	0x0001
	.word 0xab514000  ! 1119: RDPR_TBA	rdpr	%tba, %r21
	.word 0x9f802001  ! 1120: SIR	sir	0x0001
	.word 0x93902000  ! 1121: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8cdcc000  ! 1122: SMULcc_R	smulcc 	%r19, %r0, %r6
	.word 0x806a2001  ! 1123: UDIVX_I	udivx 	%r8, 0x0001, %r0
	.word 0x8d802000  ! 1124: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9b480000  ! 1125: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
DS_65:
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1126: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x82802001  ! 1127: ADDcc_I	addcc 	%r0, 0x0001, %r1
	.word 0x87902289  ! 1128: WRPR_TT_I	wrpr	%r0, 0x0289, %tt
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1129: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb0c36001  ! 1130: ADDCcc_I	addccc 	%r13, 0x0001, %r24
	.word 0x8b508000  ! 1131: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0x90d0c010  ! 1132: UMULcc_R	umulcc 	%r3, %r16, %r8
	.word 0x81982d93  ! 1133: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d93, %hpstate
	.word 0xd1e7c030  ! 1134: CASA_I	casa	[%r31] 0x 1, %r16, %r8
DS_66:
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1135: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x83d02035  ! 1136: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x9f802001  ! 1137: SIR	sir	0x0001
DS_67:
	.word 0x34800001  ! 1139: BG	bg,a	<label_0x1>
	pdist %f4, %f26, %f18
	.word 0x97b1c309  ! 1138: ALLIGNADDRESS	alignaddr	%r7, %r9, %r11
	.word 0x80aa0001  ! 1139: ANDNcc_R	andncc 	%r8, %r1, %r0
	.word 0x8790203e  ! 1140: WRPR_TT_I	wrpr	%r0, 0x003e, %tt
	.word 0x93902001  ! 1141: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x879021f9  ! 1143: WRPR_TT_I	wrpr	%r0, 0x01f9, %tt
	.word 0xc08008a0  ! 1144: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0x91d02035  ! 1145: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87902009  ! 1146: WRPR_TT_I	wrpr	%r0, 0x0009, %tt
	.word 0x93902002  ! 1147: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x83d02032  ! 1148: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d902a18  ! 1149: WRPR_PSTATE_I	wrpr	%r0, 0x0a18, %pstate
	.word 0x879023f8  ! 1150: WRPR_TT_I	wrpr	%r0, 0x03f8, %tt
	.word 0x93b58fec  ! 1151: FONES	fones	%f9
	.word 0x8790227b  ! 1152: WRPR_TT_I	wrpr	%r0, 0x027b, %tt
	.word 0x8790224c  ! 1153: WRPR_TT_I	wrpr	%r0, 0x024c, %tt
	.word 0x8d802004  ! 1154: WRFPRS_I	wr	%r0, 0x0004, %fprs
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1155: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 1156: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd2cfe030  ! 1157: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r9
	.word 0x81982505  ! 1158: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0505, %hpstate
	.word 0x91d02035  ! 1159: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93d02030  ! 1160: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x93902003  ! 1161: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x81982a56  ! 1162: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a56, %hpstate
	.word 0x9f802001  ! 1163: SIR	sir	0x0001
	.word 0x93d02033  ! 1164: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x87902117  ! 1165: WRPR_TT_I	wrpr	%r0, 0x0117, %tt
	.word 0x9449c00d  ! 1166: MULX_R	mulx 	%r7, %r13, %r10
DS_68:
	.word 0x22800001  ! 1168: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1167: SAVE_R	save	%r31, %r0, %r31
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1168: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa46e0016  ! 1169: UDIVX_R	udivx 	%r24, %r22, %r18
	.word 0x91d02031  ! 1170: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xe4d804a0  ! 1171: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
change_to_tl1_69:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x81982f0b  ! 1173: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f0b, %hpstate
	.word 0x87a01a78  ! 1174: FqTOi	fqtoi	
	.word 0x81982acc  ! 1175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0acc, %hpstate
DS_70:
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1176: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0xafa649b4  ! 1177: FDIVs	fdivs	%f25, %f20, %f23
	otherw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1178: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8fa00551  ! 1179: FSQRTd	fsqrt	
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1180: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x92d36001  ! 1181: UMULcc_I	umulcc 	%r13, 0x0001, %r9
	.word 0x81982f12  ! 1182: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f12, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1183: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd2cfe020  ! 1184: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
	.word 0x8d540000  ! 1185: RDPR_GL	rdpr	%-, %r6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9f802001  ! 1187: SIR	sir	0x0001
	.word 0x85508000  ! 1188: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0x83a509a9  ! 1189: FDIVs	fdivs	%f20, %f9, %f1
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1190: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_71:
	.word 0x32800001  ! 1192: BNE	bne,a	<label_0x1>
	.word 0xc131000d  ! 1192: STQF_R	-	%f0, [%r13, %r4]
	normalw
	.word 0x93458000  ! 1191: RD_SOFTINT_REG	rd	%softint, %r9
	.word 0x8d902a1a  ! 1192: WRPR_PSTATE_I	wrpr	%r0, 0x0a1a, %pstate
	.word 0x9f802001  ! 1193: SIR	sir	0x0001
	.word 0xd21fc000  ! 1194: LDD_R	ldd	[%r31 + %r0], %r9
	.word 0x93902003  ! 1195: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_72:
	.word 0x22800001  ! 1197: BE	be,a	<label_0x1>
	.word 0xcd30c017  ! 1197: STQF_R	-	%f6, [%r23, %r3]
	normalw
	.word 0x8f458000  ! 1196: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x9f802001  ! 1197: SIR	sir	0x0001
	.word 0x81982ed2  ! 1198: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed2, %hpstate
	.word 0x93902007  ! 1199: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xa1a0056a  ! 1200: FSQRTq	fsqrt	
	.word 0x81982590  ! 1201: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0590, %hpstate
	.word 0x8d902ace  ! 1202: WRPR_PSTATE_I	wrpr	%r0, 0x0ace, %pstate
	.word 0x93902003  ! 1203: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x9f802001  ! 1204: SIR	sir	0x0001
	.word 0x8d802000  ! 1205: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d90289e  ! 1206: WRPR_PSTATE_I	wrpr	%r0, 0x089e, %pstate
	.word 0xa551c000  ! 1207: RDPR_TL	rdpr	%tl, %r18
	.word 0x36700001  ! 1208: BPGE	<illegal instruction>
	.word 0xa86c2001  ! 1209: UDIVX_I	udivx 	%r16, 0x0001, %r20
	.word 0x91d02032  ! 1210: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xe927e001  ! 1211: STF_I	st	%f20, [0x0001, %r31]
	.word 0x9b500000  ! 1212: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x8950c000  ! 1213: RDPR_TT	rdpr	%tt, %r4
	.word 0xb5480000  ! 1214: RDHPR_HPSTATE	rdhpr	%hpstate, %r26
	.word 0x81982b95  ! 1215: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b95, %hpstate
	.word 0x20800001  ! 1216: BN	bn,a	<label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1217: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93902000  ! 1219: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xf48008a0  ! 1220: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r26
	.word 0x91d02031  ! 1221: Tcc_I	ta	icc_or_xcc, %r0 + 49
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1222: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1223: SIR	sir	0x0001
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02031  ! 1225: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x91d02035  ! 1226: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xf4cfe020  ! 1227: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r26
	.word 0x91d02031  ! 1228: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_73:
	not %g0, %g2
	jmp %g2
	.word 0x9d902005  ! 1229: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1230: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xf48fe030  ! 1231: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r26
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1232: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8751c000  ! 1233: RDPR_TL	rdpr	%tl, %r3
	.word 0x87902218  ! 1234: WRPR_TT_I	wrpr	%r0, 0x0218, %tt
	.word 0x8d902854  ! 1235: WRPR_PSTATE_I	wrpr	%r0, 0x0854, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
DS_74:
	.word 0x32800001  ! 1238: BNE	bne,a	<label_0x1>
	.word 0xcf334007  ! 1238: STQF_R	-	%f7, [%r7, %r13]
	normalw
	.word 0xa1458000  ! 1237: RD_SOFTINT_REG	rd	%softint, %r16
DS_75:
	.word 0x32800001  ! 1239: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 1238: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02035  ! 1239: Tcc_I	ta	icc_or_xcc, %r0 + 53
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1240: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 1241: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982317  ! 1242: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0317, %hpstate
	.word 0x9ad2c00a  ! 1243: UMULcc_R	umulcc 	%r11, %r10, %r13
	.word 0xdbe7c02a  ! 1244: CASA_I	casa	[%r31] 0x 1, %r10, %r13
change_to_tl1_76:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93a00542  ! 1246: FSQRTd	fsqrt	
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1247: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d802004  ! 1248: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d90289d  ! 1249: WRPR_PSTATE_I	wrpr	%r0, 0x089d, %pstate
	.word 0x879022ae  ! 1250: WRPR_TT_I	wrpr	%r0, 0x02ae, %tt
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02031  ! 1252: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xd2dfe030  ! 1253: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r9
change_to_tl1_77:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x879021c1  ! 1255: WRPR_TT_I	wrpr	%r0, 0x01c1, %tt
	.word 0x91d02031  ! 1256: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x91d02032  ! 1257: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x83d02031  ! 1258: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x8d9024d3  ! 1259: WRPR_PSTATE_I	wrpr	%r0, 0x04d3, %pstate
	.word 0x93902006  ! 1260: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa1a000c1  ! 1261: FNEGd	fnegd	%f32, %f16
	.word 0x8d90248a  ! 1262: WRPR_PSTATE_I	wrpr	%r0, 0x048a, %pstate
	.word 0xa1a249c9  ! 1263: FDIVd	fdivd	%f40, %f40, %f16
	.word 0x879021ac  ! 1264: WRPR_TT_I	wrpr	%r0, 0x01ac, %tt
	.word 0xaf480000  ! 1265: RDHPR_HPSTATE	rdhpr	%hpstate, %r23
	.word 0x83d02033  ! 1266: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x87802010  ! 1267: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d494000  ! 1268: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0xb1494000  ! 1269: RDHPR_HTBA	rdhpr	%htba, %r24
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1270: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8f702001  ! 1272: POPC_I	popc	0x0001, %r7
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1273: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xa6d84017  ! 1274: SMULcc_R	smulcc 	%r1, %r23, %r19
	.word 0x879020a4  ! 1275: WRPR_TT_I	wrpr	%r0, 0x00a4, %tt
change_to_tl1_78:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_79:
	.word 0x20800001  ! 1278: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1277: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02031  ! 1278: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xe6ffc037  ! 1279: SWAPA_R	swapa	%r19, [%r31 + %r23] 0x01
	.word 0x879023aa  ! 1280: WRPR_TT_I	wrpr	%r0, 0x03aa, %tt
	.word 0x819825cc  ! 1281: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05cc, %hpstate
	.word 0x8d90245d  ! 1282: WRPR_PSTATE_I	wrpr	%r0, 0x045d, %pstate
	.word 0x85494000  ! 1283: RDHPR_HTBA	rdhpr	%htba, %r2
	.word 0x8d902c47  ! 1284: WRPR_PSTATE_I	wrpr	%r0, 0x0c47, %pstate
	.word 0x87802080  ! 1285: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xc437e001  ! 1286: STH_I	sth	%r2, [%r31 + 0x0001]
	.word 0x93902002  ! 1287: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xc43fe001  ! 1288: STD_I	std	%r2, [%r31 + 0x0001]
	.word 0x9f802001  ! 1289: SIR	sir	0x0001
	.word 0xb1a009c3  ! 1290: FDIVd	fdivd	%f0, %f34, %f24
	.word 0x91494000  ! 1291: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x9f802001  ! 1292: SIR	sir	0x0001
	.word 0x8d902a48  ! 1293: WRPR_PSTATE_I	wrpr	%r0, 0x0a48, %pstate
	.word 0x82494012  ! 1294: MULX_R	mulx 	%r5, %r18, %r1
	.word 0x8ba01a6d  ! 1295: FqTOi	fqtoi	
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a009e7  ! 1297: FDIVq	dis not found

	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9b500000  ! 1299: RDPR_TPC	rdpr	%tpc, %r13
	.word 0xa9504000  ! 1300: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x84800000  ! 1301: ADDcc_R	addcc 	%r0, %r0, %r2
	.word 0x91d02033  ! 1302: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x89494000  ! 1303: RDHPR_HTBA	rdhpr	%htba, %r4
	.word 0x93902004  ! 1304: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x879023ab  ! 1305: WRPR_TT_I	wrpr	%r0, 0x03ab, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87902010  ! 1307: WRPR_TT_I	wrpr	%r0, 0x0010, %tt
	.word 0x93902001  ! 1308: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_tl1_80:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8ba2cd24  ! 1310: FsMULd	fsmuld	%f11, %f4, %f36
	.word 0x819822cf  ! 1311: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cf, %hpstate
	.word 0x87902225  ! 1312: WRPR_TT_I	wrpr	%r0, 0x0225, %tt
	.word 0x8d902409  ! 1313: WRPR_PSTATE_I	wrpr	%r0, 0x0409, %pstate
	.word 0xa2c06001  ! 1314: ADDCcc_I	addccc 	%r1, 0x0001, %r17
	ta	T_CHANGE_PRIV	! macro
	.word 0x90dec007  ! 1316: SMULcc_R	smulcc 	%r27, %r7, %r8
	.word 0xd137c007  ! 1317: STQF_R	-	%f8, [%r7, %r31]
	.word 0x81982fc6  ! 1318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc6, %hpstate
	.word 0x8198271f  ! 1319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071f, %hpstate
	.word 0x8f702001  ! 1320: POPC_I	popc	0x0001, %r7
	.word 0x8d802000  ! 1321: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1322: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1323: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa3504000  ! 1324: RDPR_TNPC	rdpr	%tnpc, %r17
	.word 0x2e800001  ! 1325: BVS	bvs,a	<label_0x1>
	.word 0x879022a7  ! 1326: WRPR_TT_I	wrpr	%r0, 0x02a7, %tt
	.word 0x9f802001  ! 1327: SIR	sir	0x0001
	.word 0xe2cfe010  ! 1328: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r17
	.word 0x99692001  ! 1329: SDIVX_I	sdivx	%r4, 0x0001, %r12
	.word 0x819826c9  ! 1330: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c9, %hpstate
	.word 0x9f802001  ! 1331: SIR	sir	0x0001
	.word 0x97508000  ! 1332: RDPR_TSTATE	rdpr	%tstate, %r11
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902a9f  ! 1334: WRPR_PSTATE_I	wrpr	%r0, 0x0a9f, %pstate
	.word 0x8198214f  ! 1335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x014f, %hpstate
	.word 0x8d802000  ! 1336: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902062  ! 1337: WRPR_TT_I	wrpr	%r0, 0x0062, %tt
	.word 0x87a00550  ! 1338: FSQRTd	fsqrt	
	.word 0x93902004  ! 1339: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1340: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc6cfe010  ! 1341: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r3
	.word 0x819820de  ! 1342: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00de, %hpstate
	.word 0xc67fe001  ! 1343: SWAP_I	swap	%r3, [%r31 + 0x0001]
	.word 0xc697e020  ! 1344: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r3
	.word 0x9f802001  ! 1345: SIR	sir	0x0001
	.word 0x879022df  ! 1346: WRPR_TT_I	wrpr	%r0, 0x02df, %tt
	.word 0x8cc1e001  ! 1347: ADDCcc_I	addccc 	%r7, 0x0001, %r6
	.word 0x9f802001  ! 1348: SIR	sir	0x0001
	.word 0x93902001  ! 1349: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802004  ! 1351: WRASI_I	wr	%r0, 0x0004, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0x93d02031  ! 1353: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x879021ad  ! 1354: WRPR_TT_I	wrpr	%r0, 0x01ad, %tt
	.word 0x9b508000  ! 1355: RDPR_TSTATE	rdpr	%tstate, %r13
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1356: Tcc_R	te	icc_or_xcc, %r0 + %r30
DS_81:
	.word 0x20800001  ! 1358: BN	bn,a	<label_0x1>
	allclean
	.word 0x8db1c30c  ! 1357: ALLIGNADDRESS	alignaddr	%r7, %r12, %r6
	.word 0x87802080  ! 1358: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xb3a409b5  ! 1359: FDIVs	fdivs	%f16, %f21, %f25
	.word 0x93902003  ! 1360: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902451  ! 1361: WRPR_PSTATE_I	wrpr	%r0, 0x0451, %pstate
	.word 0x85a00568  ! 1362: FSQRTq	fsqrt	
	.word 0x81982259  ! 1363: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0259, %hpstate
	.word 0x91d02031  ! 1364: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d902880  ! 1365: WRPR_PSTATE_I	wrpr	%r0, 0x0880, %pstate
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1366: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_82:
	.word 0x20800001  ! 1368: BN	bn,a	<label_0x1>
	.word 0xc1324003  ! 1368: STQF_R	-	%f0, [%r3, %r9]
	normalw
	.word 0x89458000  ! 1367: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0x83d02032  ! 1368: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x9ba309cb  ! 1369: FDIVd	fdivd	%f12, %f42, %f44
	.word 0x99a01a6d  ! 1370: FqTOi	fqtoi	
	.word 0xa7540000  ! 1371: RDPR_GL	rdpr	%-, %r19
	.word 0x8d90225b  ! 1372: WRPR_PSTATE_I	wrpr	%r0, 0x025b, %pstate
	.word 0xa26a000c  ! 1373: UDIVX_R	udivx 	%r8, %r12, %r17
	.word 0x9151c000  ! 1374: RDPR_TL	rdpr	%tl, %r8
	.word 0x879023e8  ! 1375: WRPR_TT_I	wrpr	%r0, 0x03e8, %tt
	.word 0x91d02031  ! 1376: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xd0d80e80  ! 1377: LDXA_R	ldxa	[%r0, %r0] 0x74, %r8
	.word 0x81982d8c  ! 1378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8c, %hpstate
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1379: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198241f  ! 1380: WRHPR_HPSTATE_I	wrhpr	%r0, 0x041f, %hpstate
	.word 0x879020fc  ! 1381: WRPR_TT_I	wrpr	%r0, 0x00fc, %tt
	.word 0x8d902e49  ! 1382: WRPR_PSTATE_I	wrpr	%r0, 0x0e49, %pstate
	.word 0x9f802001  ! 1383: SIR	sir	0x0001
DS_83:
	.word 0x34800001  ! 1385: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1384: SAVE_R	save	%r31, %r0, %r31
	.word 0x81982640  ! 1385: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0640, %hpstate
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1386: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_84:
	.word 0x22800001  ! 1388: BE	be,a	<label_0x1>
	allclean
	.word 0x8bb44304  ! 1387: ALLIGNADDRESS	alignaddr	%r17, %r4, %r5
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1388: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 1389: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8790236f  ! 1390: WRPR_TT_I	wrpr	%r0, 0x036f, %tt
	.word 0xa9504000  ! 1391: RDPR_TNPC	rdpr	%tnpc, %r20
	.word 0x9f802001  ! 1392: SIR	sir	0x0001
	.word 0x87902218  ! 1393: WRPR_TT_I	wrpr	%r0, 0x0218, %tt
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87902202  ! 1395: WRPR_TT_I	wrpr	%r0, 0x0202, %tt
	.word 0xe8d004a0  ! 1396: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r20
	.word 0x906b4004  ! 1397: UDIVX_R	udivx 	%r13, %r4, %r8
	.word 0x81982d40  ! 1398: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d40, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02035  ! 1400: Tcc_I	ta	icc_or_xcc, %r0 + 53
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1401: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd0800b20  ! 1402: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r8
	.word 0x8b702001  ! 1403: POPC_I	popc	0x0001, %r5
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x81982a4f  ! 1405: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4f, %hpstate
	.word 0x87902384  ! 1406: WRPR_TT_I	wrpr	%r0, 0x0384, %tt
	.word 0xb469c010  ! 1407: UDIVX_R	udivx 	%r7, %r16, %r26
	.word 0x87902371  ! 1408: WRPR_TT_I	wrpr	%r0, 0x0371, %tt
	.word 0x91d02034  ! 1409: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xf4c7e010  ! 1410: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r26
	.word 0x8d90204e  ! 1411: WRPR_PSTATE_I	wrpr	%r0, 0x004e, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1412: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 1413: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x87902351  ! 1414: WRPR_TT_I	wrpr	%r0, 0x0351, %tt
	.word 0xa3514000  ! 1415: RDPR_TBA	rdpr	%tba, %r17
	.word 0x936a6001  ! 1416: SDIVX_I	sdivx	%r9, 0x0001, %r9
	.word 0xd28008a0  ! 1417: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x95b00fe6  ! 1418: FONES	fones	%f10
	.word 0x93d02032  ! 1419: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0xd4dfe030  ! 1420: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r10
	.word 0x81982649  ! 1421: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0649, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1423: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d02031  ! 1425: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x83d02034  ! 1426: Tcc_I	te	icc_or_xcc, %r0 + 52
DS_85:
	.word 0x20800001  ! 1428: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1428: BE	be,a	<label_0x1>
	.word 0xc511800b  ! 1428: LDQF_R	-	[%r6, %r11], %f2
	.word 0x89a58820  ! 1427: FADDs	fadds	%f22, %f0, %f4
	.word 0x9951c000  ! 1428: RDPR_TL	rdpr	%tl, %r12
	.word 0x81982d17  ! 1429: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d17, %hpstate
	.word 0x99902002  ! 1430: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x8198284b  ! 1431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x084b, %hpstate
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1432: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982fd0  ! 1433: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd0, %hpstate
	.word 0x93d02034  ! 1434: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x93d02032  ! 1435: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x996ac004  ! 1436: SDIVX_R	sdivx	%r11, %r4, %r12
	.word 0x879020c7  ! 1437: WRPR_TT_I	wrpr	%r0, 0x00c7, %tt
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d9022de  ! 1439: WRPR_PSTATE_I	wrpr	%r0, 0x02de, %pstate
	.word 0x9368e001  ! 1440: SDIVX_I	sdivx	%r3, 0x0001, %r9
	.word 0x87902067  ! 1441: WRPR_TT_I	wrpr	%r0, 0x0067, %tt
	.word 0x22700001  ! 1442: BPE	<illegal instruction>
	.word 0x879021ab  ! 1443: WRPR_TT_I	wrpr	%r0, 0x01ab, %tt
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1444: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 1445: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902002  ! 1446: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x86f92001  ! 1447: SDIVcc_I	sdivcc 	%r4, 0x0001, %r3
	.word 0x879023a4  ! 1448: WRPR_TT_I	wrpr	%r0, 0x03a4, %tt
	.word 0xa5a01a7a  ! 1449: FqTOi	fqtoi	
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902092  ! 1451: WRPR_PSTATE_I	wrpr	%r0, 0x0092, %pstate
	.word 0x8d902edb  ! 1452: WRPR_PSTATE_I	wrpr	%r0, 0x0edb, %pstate
	.word 0x9950c000  ! 1453: RDPR_TT	rdpr	%tt, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd84fe001  ! 1455: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0x98da8000  ! 1456: SMULcc_R	smulcc 	%r10, %r0, %r12
	.word 0x93d02034  ! 1457: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x8d902001  ! 1458: WRPR_PSTATE_I	wrpr	%r0, 0x0001, %pstate
	.word 0x8198285d  ! 1459: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085d, %hpstate
	.word 0x816a8009  ! 1460: SDIVX_R	sdivx	%r10, %r9, %r0
	.word 0xc0800bc0  ! 1461: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r0
	.word 0x95a01a73  ! 1462: FqTOi	fqtoi	
	.word 0x819826c2  ! 1463: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06c2, %hpstate
	.word 0x946b2001  ! 1464: UDIVX_I	udivx 	%r12, 0x0001, %r10
	.word 0x87802014  ! 1465: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9f802001  ! 1466: SIR	sir	0x0001
	.word 0x819825c0  ! 1467: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c0, %hpstate
	.word 0xa1540000  ! 1468: RDPR_GL	rdpr	%-, %r16
	.word 0xe097e030  ! 1469: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r16
	.word 0x81a5cd24  ! 1470: FsMULd	fsmuld	%f23, %f4, %f0
	.word 0x9f802001  ! 1471: SIR	sir	0x0001
	.word 0x8d9024c3  ! 1472: WRPR_PSTATE_I	wrpr	%r0, 0x04c3, %pstate
	.word 0x81982c13  ! 1473: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c13, %hpstate
	.word 0xb2fa6001  ! 1474: SDIVcc_I	sdivcc 	%r9, 0x0001, %r25
	.word 0x81540000  ! 1475: RDPR_GL	rdpr	%-, %r0
	.word 0x8d9026c1  ! 1476: WRPR_PSTATE_I	wrpr	%r0, 0x06c1, %pstate
	.word 0xa5a000d1  ! 1477: FNEGd	fnegd	%f48, %f18
	.word 0x91d02034  ! 1478: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xb5a30d21  ! 1479: FsMULd	fsmuld	%f12, %f32, %f26
	invalw
	mov 0x35, %r30
	.word 0x93d0001e  ! 1480: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x22800001  ! 1481: BE	be,a	<label_0x1>
	.word 0x87902103  ! 1482: WRPR_TT_I	wrpr	%r0, 0x0103, %tt
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1483: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819820cb  ! 1484: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00cb, %hpstate
	.word 0x99902005  ! 1485: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xadb50fe8  ! 1486: FONES	fones	%f22
	.word 0x9f802001  ! 1487: SIR	sir	0x0001
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90289a  ! 1489: WRPR_PSTATE_I	wrpr	%r0, 0x089a, %pstate
	.word 0xecffc028  ! 1490: SWAPA_R	swapa	%r22, [%r31 + %r8] 0x01
	.word 0xecc7e010  ! 1491: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r22
	.word 0x87902030  ! 1492: WRPR_TT_I	wrpr	%r0, 0x0030, %tt
	.word 0x93902005  ! 1493: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	ta	T_CHANGE_HPRIV	! macro
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1495: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xed27e001  ! 1496: STF_I	st	%f22, [0x0001, %r31]
	.word 0x9a69a001  ! 1497: UDIVX_I	udivx 	%r6, 0x0001, %r13
	.word 0xdaffc028  ! 1498: SWAPA_R	swapa	%r13, [%r31 + %r8] 0x01
	.word 0x9f802001  ! 1499: SIR	sir	0x0001
	.word 0x2e800001  ! 1500: BVS	bvs,a	<label_0x1>
	.word 0xa4868006  ! 1501: ADDcc_R	addcc 	%r26, %r6, %r18
	.word 0xe41fc000  ! 1502: LDD_R	ldd	[%r31 + %r0], %r18
DS_86:
	.word 0x20800001  ! 1504: BN	bn,a	<label_0x1>
	pdist %f28, %f8, %f10
	.word 0x85b4c30c  ! 1503: ALLIGNADDRESS	alignaddr	%r19, %r12, %r2
	.word 0x879023bd  ! 1504: WRPR_TT_I	wrpr	%r0, 0x03bd, %tt
	.word 0x91a00577  ! 1505: FSQRTq	fsqrt	
	.word 0x87802088  ! 1506: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x93902004  ! 1507: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd01fc000  ! 1508: LDD_R	ldd	[%r31 + %r0], %r8
	.word 0x93902002  ! 1509: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd0c004a0  ! 1510: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x9f802001  ! 1511: SIR	sir	0x0001
	.word 0x81982e4f  ! 1512: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e4f, %hpstate
	.word 0xd007e001  ! 1513: LDUW_I	lduw	[%r31 + 0x0001], %r8
	.word 0xa36c8010  ! 1514: SDIVX_R	sdivx	%r18, %r16, %r17
	.word 0x87902283  ! 1515: WRPR_TT_I	wrpr	%r0, 0x0283, %tt
DS_87:
	.word 0x20800001  ! 1517: BN	bn,a	<label_0x1>
	allclean
	.word 0x93b60307  ! 1516: ALLIGNADDRESS	alignaddr	%r24, %r7, %r9
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f802001  ! 1518: SIR	sir	0x0001
	.word 0x8d902a0e  ! 1519: WRPR_PSTATE_I	wrpr	%r0, 0x0a0e, %pstate
	.word 0x87802089  ! 1520: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x8d902cc1  ! 1521: WRPR_PSTATE_I	wrpr	%r0, 0x0cc1, %pstate
	.word 0x81982406  ! 1522: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0406, %hpstate
	.word 0x93d02030  ! 1523: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xd28008a0  ! 1524: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8c836001  ! 1525: ADDcc_I	addcc 	%r13, 0x0001, %r6
	.word 0x87802004  ! 1526: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02034  ! 1527: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8f50c000  ! 1528: RDPR_TT	rdpr	%tt, %r7
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9351c000  ! 1530: RDPR_TL	rdpr	%tl, %r9
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1531: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902003  ! 1532: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x95a5cd22  ! 1533: FsMULd	fsmuld	%f23, %f2, %f10
	.word 0x8d702001  ! 1534: POPC_I	popc	0x0001, %r6
	.word 0x8d802000  ! 1535: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xcc47c000  ! 1536: LDSW_R	ldsw	[%r31 + %r0], %r6
	.word 0x9a6c800a  ! 1537: UDIVX_R	udivx 	%r18, %r10, %r13
	.word 0x8d902a05  ! 1538: WRPR_PSTATE_I	wrpr	%r0, 0x0a05, %pstate
	.word 0xae698001  ! 1539: UDIVX_R	udivx 	%r6, %r1, %r23
	.word 0x95480000  ! 1540: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
DS_88:
	.word 0x32800001  ! 1542: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1541: SAVE_R	save	%r31, %r0, %r31
	.word 0x93d02035  ! 1542: Tcc_I	tne	icc_or_xcc, %r0 + 53
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1543: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 1544: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xd5e7c021  ! 1545: CASA_I	casa	[%r31] 0x 1, %r1, %r10
	.word 0x8d9020c9  ! 1546: WRPR_PSTATE_I	wrpr	%r0, 0x00c9, %pstate
	.word 0x93d02030  ! 1547: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x81b08ff6  ! 1548: FONES	fones	%f0
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xada24d20  ! 1550: FsMULd	fsmuld	%f9, %f0, %f22
	.word 0x9f802001  ! 1551: SIR	sir	0x0001
	ta	T_CHANGE_HPRIV	! macro
	.word 0x9f802001  ! 1553: SIR	sir	0x0001
	.word 0x9f802001  ! 1554: SIR	sir	0x0001
	.word 0xecc7e030  ! 1555: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r22
	.word 0x93d02033  ! 1556: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x91d02033  ! 1557: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xed37e001  ! 1558: STQF_I	-	%f22, [0x0001, %r31]
	.word 0x91508000  ! 1559: RDPR_TSTATE	rdpr	%tstate, %r8
	.word 0x9f802001  ! 1560: SIR	sir	0x0001
	.word 0x93902003  ! 1561: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902e0d  ! 1562: WRPR_PSTATE_I	wrpr	%r0, 0x0e0d, %pstate
	.word 0x8d802004  ! 1563: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd037c000  ! 1564: STH_R	sth	%r8, [%r31 + %r0]
	.word 0x8d500000  ! 1565: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x9f802001  ! 1566: SIR	sir	0x0001
	.word 0x91d02032  ! 1567: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8da00566  ! 1568: FSQRTq	fsqrt	
	.word 0xcd3fc006  ! 1569: STDF_R	std	%f6, [%r6, %r31]
	.word 0x87802004  ! 1570: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d902e80  ! 1571: WRPR_PSTATE_I	wrpr	%r0, 0x0e80, %pstate
	.word 0x87902253  ! 1572: WRPR_TT_I	wrpr	%r0, 0x0253, %tt
	.word 0x8d902009  ! 1573: WRPR_PSTATE_I	wrpr	%r0, 0x0009, %pstate
	.word 0x93902001  ! 1574: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982712  ! 1575: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0712, %hpstate
	.word 0x8d902e0e  ! 1576: WRPR_PSTATE_I	wrpr	%r0, 0x0e0e, %pstate
	.word 0x81982198  ! 1577: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0198, %hpstate
	.word 0x93902003  ! 1578: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1579: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902606  ! 1580: WRPR_PSTATE_I	wrpr	%r0, 0x0606, %pstate
	.word 0x8d90285b  ! 1581: WRPR_PSTATE_I	wrpr	%r0, 0x085b, %pstate
DS_89:
	.word 0x22800001  ! 1583: BE	be,a	<label_0x1>
	pdist %f30, %f22, %f4
	.word 0xafb34307  ! 1582: ALLIGNADDRESS	alignaddr	%r13, %r7, %r23
	.word 0x8790204c  ! 1583: WRPR_TT_I	wrpr	%r0, 0x004c, %tt
	.word 0x91d02035  ! 1584: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xee3fc007  ! 1585: STD_R	std	%r23, [%r31 + %r7]
	.word 0x8351c000  ! 1586: RDPR_TL	rdpr	%tl, %r1
	.word 0xc247c000  ! 1587: LDSW_R	ldsw	[%r31 + %r0], %r1
	.word 0x8d902248  ! 1588: WRPR_PSTATE_I	wrpr	%r0, 0x0248, %pstate
	.word 0x91d02032  ! 1589: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91d02032  ! 1590: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x3a700001  ! 1591: BPCC	<illegal instruction>
DS_90:
	.word 0x32800001  ! 1593: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x91a00540  ! 1593: FSQRTd	fsqrt	
	.word 0xa3a00829  ! 1592: FADDs	fadds	%f0, %f9, %f17
	.word 0x9ba00560  ! 1593: FSQRTq	fsqrt	
	.word 0x8d9028c7  ! 1594: WRPR_PSTATE_I	wrpr	%r0, 0x08c7, %pstate
	.word 0x87802010  ! 1595: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x81982e0d  ! 1596: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e0d, %hpstate
	.word 0x90d2e001  ! 1597: UMULcc_I	umulcc 	%r11, 0x0001, %r8
	.word 0x9f802001  ! 1598: SIR	sir	0x0001
	.word 0x916de001  ! 1599: SDIVX_I	sdivx	%r23, 0x0001, %r8
	.word 0x87902331  ! 1600: WRPR_TT_I	wrpr	%r0, 0x0331, %tt
	.word 0x93902004  ! 1601: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x87902059  ! 1602: WRPR_TT_I	wrpr	%r0, 0x0059, %tt
	.word 0x936ac015  ! 1603: SDIVX_R	sdivx	%r11, %r21, %r9
	.word 0x90d36001  ! 1604: UMULcc_I	umulcc 	%r13, 0x0001, %r8
DS_91:
	.word 0x32800001  ! 1606: BNE	bne,a	<label_0x1>
	.word 0xcb364006  ! 1606: STQF_R	-	%f5, [%r6, %r25]
	normalw
	.word 0x87458000  ! 1605: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0xb068c00d  ! 1606: UDIVX_R	udivx 	%r3, %r13, %r24
	.word 0x87802080  ! 1607: WRASI_I	wr	%r0, 0x0080, %asi
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 1608: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x956c6001  ! 1609: SDIVX_I	sdivx	%r17, 0x0001, %r10
	.word 0x8151c000  ! 1610: RDPR_TL	rdpr	%tl, %r0
	.word 0x88806001  ! 1611: ADDcc_I	addcc 	%r1, 0x0001, %r4
	.word 0x9f802001  ! 1612: SIR	sir	0x0001
	.word 0x8198229a  ! 1613: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029a, %hpstate
	.word 0x8d902a04  ! 1614: WRPR_PSTATE_I	wrpr	%r0, 0x0a04, %pstate
	.word 0x93d02031  ! 1615: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x8351c000  ! 1616: RDPR_TL	rdpr	%tl, %r1
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1618: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xb5686001  ! 1619: SDIVX_I	sdivx	%r1, 0x0001, %r26
	.word 0x34800001  ! 1620: BG	bg,a	<label_0x1>
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93902005  ! 1622: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8790212d  ! 1623: WRPR_TT_I	wrpr	%r0, 0x012d, %tt
	.word 0x81982ed4  ! 1624: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ed4, %hpstate
	.word 0x96812001  ! 1625: ADDcc_I	addcc 	%r4, 0x0001, %r11
	.word 0x856c4005  ! 1626: SDIVX_R	sdivx	%r17, %r5, %r2
	.word 0x3c800001  ! 1627: BPOS	bpos,a	<label_0x1>
DS_92:
	.word 0x22800001  ! 1629: BE	be,a	<label_0x1>
	illtrap
	.word 0xd311c018  ! 1629: LDQF_R	-	[%r7, %r24], %f9
	.word 0x99a30822  ! 1628: FADDs	fadds	%f12, %f2, %f12
	.word 0xb1a01a66  ! 1629: FqTOi	fqtoi	
	.word 0x8d902ad4  ! 1630: WRPR_PSTATE_I	wrpr	%r0, 0x0ad4, %pstate
	.word 0xf08008a0  ! 1631: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r24
	.word 0xf09fe001  ! 1632: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r24
	.word 0x9f802001  ! 1633: SIR	sir	0x0001
	.word 0xf07fe001  ! 1634: SWAP_I	swap	%r24, [%r31 + 0x0001]
	.word 0x93902001  ! 1635: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87902307  ! 1636: WRPR_TT_I	wrpr	%r0, 0x0307, %tt
change_to_tl1_93:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902259  ! 1638: WRPR_PSTATE_I	wrpr	%r0, 0x0259, %pstate
	.word 0x8198249f  ! 1639: WRHPR_HPSTATE_I	wrhpr	%r0, 0x049f, %hpstate
	.word 0x8d90248e  ! 1640: WRPR_PSTATE_I	wrpr	%r0, 0x048e, %pstate
	.word 0xf0c7e030  ! 1641: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r24
	.word 0x81982d9a  ! 1642: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9a, %hpstate
	.word 0x93d02033  ! 1643: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x93d02031  ! 1644: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x91a0054c  ! 1645: FSQRTd	fsqrt	
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1646: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879022a0  ! 1647: WRPR_TT_I	wrpr	%r0, 0x02a0, %tt
	.word 0x93a109b7  ! 1648: FDIVs	fdivs	%f4, %f23, %f9
	.word 0xad504000  ! 1649: RDPR_TNPC	rdpr	%tnpc, %r22
	.word 0x91d02034  ! 1650: Tcc_I	ta	icc_or_xcc, %r0 + 52
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1651: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9f802001  ! 1652: SIR	sir	0x0001
	.word 0x8b514000  ! 1653: RDPR_TBA	rdpr	%tba, %r5
	.word 0xb6fb6001  ! 1654: SDIVcc_I	sdivcc 	%r13, 0x0001, %r27
	.word 0x8d802000  ! 1655: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d540000  ! 1656: RDPR_GL	rdpr	%-, %r6
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xcde7c037  ! 1658: CASA_I	casa	[%r31] 0x 1, %r23, %r6
	invalw
	mov 0x34, %r30
	.word 0x93d0001e  ! 1659: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x88fcc007  ! 1660: SDIVcc_R	sdivcc 	%r19, %r7, %r4
	.word 0xc897e000  ! 1661: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r4
	.word 0x93902003  ! 1662: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_94:
	.word 0x22800001  ! 1664: BE	be,a	<label_0x1>
	illtrap
	.word 0xcd134008  ! 1664: LDQF_R	-	[%r13, %r8], %f6
	.word 0x89a4082d  ! 1663: FADDs	fadds	%f16, %f13, %f4
	.word 0x91d02031  ! 1664: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x2a700001  ! 1665: BPCS	<illegal instruction>
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1666: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8ba08d25  ! 1667: FsMULd	fsmuld	%f2, %f36, %f36
DS_95:
	.word 0x34800001  ! 1669: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1668: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xab508000  ! 1669: RDPR_TSTATE	rdpr	%tstate, %r21
	.word 0x93902004  ! 1670: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x2a800001  ! 1671: BCS	bcs,a	<label_0x1>
	.word 0xeadfe000  ! 1672: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r21
	.word 0x91d02033  ! 1673: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x85a6cd20  ! 1674: FsMULd	fsmuld	%f27, %f0, %f2
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1675: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1676: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc49fe001  ! 1677: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r2
	.word 0x99902003  ! 1678: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x81982fd8  ! 1679: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd8, %hpstate
	.word 0xc48008a0  ! 1680: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x9f802001  ! 1681: SIR	sir	0x0001
	.word 0x89514000  ! 1682: RDPR_TBA	rdpr	%tba, %r4
	.word 0x9f802001  ! 1683: SIR	sir	0x0001
	.word 0xacd6400c  ! 1684: UMULcc_R	umulcc 	%r25, %r12, %r22
	.word 0xecc804a0  ! 1685: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r22
	.word 0x9f802001  ! 1686: SIR	sir	0x0001
	.word 0x93902005  ! 1687: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d902c5f  ! 1688: WRPR_PSTATE_I	wrpr	%r0, 0x0c5f, %pstate
	.word 0x819823df  ! 1689: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03df, %hpstate
	.word 0x8b51c000  ! 1690: RDPR_TL	rdpr	%tl, %r5
	.word 0xa6832001  ! 1691: ADDcc_I	addcc 	%r12, 0x0001, %r19
	.word 0x93902001  ! 1692: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x22800001  ! 1693: BE	be,a	<label_0x1>
	.word 0xe737e001  ! 1694: STQF_I	-	%f19, [0x0001, %r31]
	.word 0xb751c000  ! 1695: RDPR_TL	rdpr	%tl, %r27
	.word 0x93902006  ! 1696: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02034  ! 1697: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87508000  ! 1698: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x81982a4b  ! 1699: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4b, %hpstate
	.word 0x8d902485  ! 1700: WRPR_PSTATE_I	wrpr	%r0, 0x0485, %pstate
	.word 0x8f500000  ! 1701: RDPR_TPC	rdpr	%tpc, %r7
	.word 0xb1a00570  ! 1702: FSQRTq	fsqrt	
	.word 0x87902010  ! 1703: WRPR_TT_I	wrpr	%r0, 0x0010, %tt
	.word 0x9f802001  ! 1704: SIR	sir	0x0001
	.word 0x93d02035  ! 1705: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8d902006  ! 1706: WRPR_PSTATE_I	wrpr	%r0, 0x0006, %pstate
	.word 0x93902000  ! 1707: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x9f802001  ! 1708: SIR	sir	0x0001
	.word 0x91d02033  ! 1709: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9f802001  ! 1710: SIR	sir	0x0001
	.word 0x9350c000  ! 1711: RDPR_TT	rdpr	%tt, %r9
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87802004  ! 1713: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xd20fe001  ! 1714: LDUB_I	ldub	[%r31 + 0x0001], %r9
	.word 0x91d02032  ! 1715: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902001  ! 1716: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd3e7c030  ! 1717: CASA_I	casa	[%r31] 0x 1, %r16, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0x9ad48003  ! 1719: UMULcc_R	umulcc 	%r18, %r3, %r13
	.word 0xdadfe010  ! 1720: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r13
	.word 0x81982d17  ! 1721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d17, %hpstate
	.word 0xda8fe020  ! 1722: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r13
	.word 0x9f802001  ! 1723: SIR	sir	0x0001
	.word 0x8d902245  ! 1724: WRPR_PSTATE_I	wrpr	%r0, 0x0245, %pstate
	.word 0x2a700001  ! 1725: BPCS	<illegal instruction>
	.word 0x83d02035  ! 1726: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x93902002  ! 1727: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8790213d  ! 1728: WRPR_TT_I	wrpr	%r0, 0x013d, %tt
	.word 0x85a089aa  ! 1729: FDIVs	fdivs	%f2, %f10, %f2
DS_96:
	.word 0x32800001  ! 1731: BNE	bne,a	<label_0x1>
	.word 0xd732c00d  ! 1731: STQF_R	-	%f11, [%r13, %r11]
	normalw
	.word 0x99458000  ! 1730: RD_SOFTINT_REG	rd	%softint, %r12
	.word 0x8d902a1a  ! 1731: WRPR_PSTATE_I	wrpr	%r0, 0x0a1a, %pstate
	.word 0x93902002  ! 1732: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8b500000  ! 1733: RDPR_TPC	rdpr	%tpc, %r5
	.word 0x91d02033  ! 1734: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902e10  ! 1735: WRPR_PSTATE_I	wrpr	%r0, 0x0e10, %pstate
	.word 0xca8008a0  ! 1736: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r5
	.word 0xcb27c00d  ! 1737: STF_R	st	%f5, [%r13, %r31]
	.word 0x81982c4a  ! 1738: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c4a, %hpstate
DS_97:
	.word 0x34800001  ! 1740: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1739: SAVE_R	save	%r31, %r0, %r31
	.word 0x28800001  ! 1740: BLEU	bleu,a	<label_0x1>
	.word 0x9f802001  ! 1741: SIR	sir	0x0001
	.word 0x93902003  ! 1742: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_98:
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1743: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x91d02031  ! 1744: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902000  ! 1745: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8198285b  ! 1746: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085b, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x866e401a  ! 1748: UDIVX_R	udivx 	%r25, %r26, %r3
	.word 0x87902073  ! 1749: WRPR_TT_I	wrpr	%r0, 0x0073, %tt
DS_99:
	.word 0x34800001  ! 1751: BG	bg,a	<label_0x1>
	allclean
	.word 0x81b1c31b  ! 1750: ALLIGNADDRESS	alignaddr	%r7, %r27, %r0
	.word 0x8d9022cd  ! 1751: WRPR_PSTATE_I	wrpr	%r0, 0x02cd, %pstate
	.word 0xab514000  ! 1752: RDPR_TBA	rdpr	%tba, %r21
	.word 0x879021fd  ! 1753: WRPR_TT_I	wrpr	%r0, 0x01fd, %tt
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1754: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95480000  ! 1755: RDHPR_HPSTATE	rdhpr	%hpstate, %r10
	.word 0x8198229a  ! 1756: WRHPR_HPSTATE_I	wrhpr	%r0, 0x029a, %hpstate
	.word 0xd4ffc03b  ! 1757: SWAPA_R	swapa	%r10, [%r31 + %r27] 0x01
	.word 0xd537e001  ! 1758: STQF_I	-	%f10, [0x0001, %r31]
	.word 0xd4ffc03b  ! 1759: SWAPA_R	swapa	%r10, [%r31 + %r27] 0x01
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1760: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x984c0004  ! 1761: MULX_R	mulx 	%r16, %r4, %r12
	.word 0x9ba01a79  ! 1762: FqTOi	fqtoi	
	.word 0x94fc2001  ! 1763: SDIVcc_I	sdivcc 	%r16, 0x0001, %r10
	.word 0xd44fe001  ! 1764: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0xd48008a0  ! 1765: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x944c8004  ! 1766: MULX_R	mulx 	%r18, %r4, %r10
DS_100:
	.word 0x32800001  ! 1768: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1767: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d902ad7  ! 1768: WRPR_PSTATE_I	wrpr	%r0, 0x0ad7, %pstate
	.word 0xb6dd0012  ! 1769: SMULcc_R	smulcc 	%r20, %r18, %r27
	.word 0x91d02035  ! 1770: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xf60fe001  ! 1771: LDUB_I	ldub	[%r31 + 0x0001], %r27
	.word 0xf657c000  ! 1772: LDSH_R	ldsh	[%r31 + %r0], %r27
	.word 0xb7b04fe1  ! 1773: FONES	fones	%f27
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1774: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902001  ! 1775: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x9f802001  ! 1776: SIR	sir	0x0001
	.word 0xa1a000d9  ! 1777: FNEGd	fnegd	%f56, %f16
	.word 0x8c4b4014  ! 1778: MULX_R	mulx 	%r13, %r20, %r6
	.word 0xccffc034  ! 1779: SWAPA_R	swapa	%r6, [%r31 + %r20] 0x01
	.word 0x8b540000  ! 1780: RDPR_GL	rdpr	%-, %r5
	.word 0xca800b60  ! 1781: LDUWA_R	lduwa	[%r0, %r0] 0x5b, %r5
	.word 0x8d802000  ! 1782: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9f802001  ! 1783: SIR	sir	0x0001
	.word 0x8c68e001  ! 1784: UDIVX_I	udivx 	%r3, 0x0001, %r6
	.word 0x81982791  ! 1785: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0791, %hpstate
	.word 0xcc97e030  ! 1786: LDUHA_I	lduha	[%r31, + 0x0030] %asi, %r6
	.word 0x91d02033  ! 1787: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xb6d26001  ! 1788: UMULcc_I	umulcc 	%r9, 0x0001, %r27
	.word 0x819824cc  ! 1789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cc, %hpstate
	.word 0x22800001  ! 1790: BE	be,a	<label_0x1>
	.word 0xb049c010  ! 1791: MULX_R	mulx 	%r7, %r16, %r24
DS_101:
	.word 0x32800001  ! 1793: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1792: SAVE_R	save	%r31, %r0, %r31
	.word 0xb16ea001  ! 1793: SDIVX_I	sdivx	%r26, 0x0001, %r24
	.word 0x879020eb  ! 1794: WRPR_TT_I	wrpr	%r0, 0x00eb, %tt
	.word 0x99902004  ! 1795: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x93902003  ! 1796: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	invalw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1797: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xf1e7c030  ! 1798: CASA_I	casa	[%r31] 0x 1, %r16, %r24
	.word 0x87902362  ! 1799: WRPR_TT_I	wrpr	%r0, 0x0362, %tt
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 1800: Tcc_R	tne	icc_or_xcc, %r0 + %r30
DS_102:
	.word 0x22800001  ! 1802: BE	be,a	<label_0x1>
	illtrap
	.word 0x8ba0054b  ! 1802: FSQRTd	fsqrt	
	.word 0x8ba0c827  ! 1801: FADDs	fadds	%f3, %f7, %f5
	.word 0x92c0a001  ! 1802: ADDCcc_I	addccc 	%r2, 0x0001, %r9
	.word 0x819828d4  ! 1803: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d4, %hpstate
	.word 0xa0f88016  ! 1804: SDIVcc_R	sdivcc 	%r2, %r22, %r16
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x83a249d6  ! 1806: FDIVd	fdivd	%f40, %f22, %f32
	.word 0x81982355  ! 1807: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0355, %hpstate
	.word 0x8d902854  ! 1808: WRPR_PSTATE_I	wrpr	%r0, 0x0854, %pstate
	.word 0x95a00549  ! 1809: FSQRTd	fsqrt	
	.word 0x9f802001  ! 1810: SIR	sir	0x0001
	.word 0x93902000  ! 1811: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	otherw
	mov 0x32, %r30
	.word 0x91d0001e  ! 1813: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9026d8  ! 1814: WRPR_PSTATE_I	wrpr	%r0, 0x06d8, %pstate
	.word 0x8d902845  ! 1815: WRPR_PSTATE_I	wrpr	%r0, 0x0845, %pstate
	.word 0xd49004a0  ! 1816: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	.word 0x8d902e95  ! 1817: WRPR_PSTATE_I	wrpr	%r0, 0x0e95, %pstate
	.word 0x89a349f8  ! 1818: FDIVq	dis not found

	.word 0x8d802004  ! 1819: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_103:
	.word 0x34800001  ! 1821: BG	bg,a	<label_0x1>
	pdist %f26, %f10, %f28
	.word 0x87b58307  ! 1820: ALLIGNADDRESS	alignaddr	%r22, %r7, %r3
	.word 0x87902296  ! 1821: WRPR_TT_I	wrpr	%r0, 0x0296, %tt
	.word 0x93d02034  ! 1822: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xc607c000  ! 1823: LDUW_R	lduw	[%r31 + %r0], %r3
	.word 0xa049800c  ! 1824: MULX_R	mulx 	%r6, %r12, %r16
	.word 0x82812001  ! 1825: ADDcc_I	addcc 	%r4, 0x0001, %r1
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879021c8  ! 1827: WRPR_TT_I	wrpr	%r0, 0x01c8, %tt
	.word 0x8d9024df  ! 1828: WRPR_PSTATE_I	wrpr	%r0, 0x04df, %pstate
	.word 0x8d802000  ! 1829: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879021dc  ! 1830: WRPR_TT_I	wrpr	%r0, 0x01dc, %tt
	.word 0x8d802000  ! 1831: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902003  ! 1832: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902c84  ! 1833: WRPR_PSTATE_I	wrpr	%r0, 0x0c84, %pstate
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 1834: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc327c00c  ! 1836: STF_R	st	%f1, [%r12, %r31]
	.word 0xc2ffc02c  ! 1837: SWAPA_R	swapa	%r1, [%r31 + %r12] 0x01
	.word 0x91d02030  ! 1838: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0xa1480000  ! 1839: RDHPR_HPSTATE	rdhpr	%hpstate, %r16
	.word 0x8d90285c  ! 1840: WRPR_PSTATE_I	wrpr	%r0, 0x085c, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99902005  ! 1842: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x99a000c0  ! 1843: FNEGd	fnegd	%f0, %f12
	ta	T_CHANGE_PRIV	! macro
	invalw
	mov 0x30, %r30
	.word 0x93d0001e  ! 1845: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x91d02033  ! 1848: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902a19  ! 1849: WRPR_PSTATE_I	wrpr	%r0, 0x0a19, %pstate
	.word 0x8790230d  ! 1850: WRPR_TT_I	wrpr	%r0, 0x030d, %tt
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9f802001  ! 1852: SIR	sir	0x0001
	.word 0x83d02032  ! 1853: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x86d06001  ! 1854: UMULcc_I	umulcc 	%r1, 0x0001, %r3
	.word 0x98fb6001  ! 1855: SDIVcc_I	sdivcc 	%r13, 0x0001, %r12
	.word 0x91480000  ! 1856: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x81982c01  ! 1859: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c01, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879023dc  ! 1861: WRPR_TT_I	wrpr	%r0, 0x03dc, %tt
	.word 0xd1e7c020  ! 1862: CASA_I	casa	[%r31] 0x 1, %r0, %r8
	.word 0x93902007  ! 1863: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93d02035  ! 1864: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x93508000  ! 1865: RDPR_TSTATE	rdpr	%tstate, %r9
	.word 0x81982f99  ! 1866: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f99, %hpstate
	.word 0x896b6001  ! 1867: SDIVX_I	sdivx	%r13, 0x0001, %r4
	.word 0x90c5e001  ! 1868: ADDCcc_I	addccc 	%r23, 0x0001, %r8
	.word 0x91d02032  ! 1869: Tcc_I	ta	icc_or_xcc, %r0 + 50
	ta	T_CHANGE_NONPRIV	! macro
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 1871: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa2c2e001  ! 1873: ADDCcc_I	addccc 	%r11, 0x0001, %r17
	.word 0xb5a009d4  ! 1874: FDIVd	fdivd	%f0, %f20, %f26
	.word 0xf49fc020  ! 1875: LDDA_R	ldda	[%r31, %r0] 0x01, %r26
	.word 0x83a00578  ! 1876: FSQRTq	fsqrt	
	.word 0x93902003  ! 1877: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x91d02034  ! 1878: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f802001  ! 1879: SIR	sir	0x0001
	.word 0x819821cd  ! 1880: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cd, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0xc21fe001  ! 1882: LDD_I	ldd	[%r31 + 0x0001], %r1
	.word 0x36700001  ! 1883: BPGE	<illegal instruction>
	.word 0x87902024  ! 1884: WRPR_TT_I	wrpr	%r0, 0x0024, %tt
	.word 0x81982fd3  ! 1885: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fd3, %hpstate
	.word 0x91d02035  ! 1886: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x819825c4  ! 1887: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05c4, %hpstate
	.word 0xc2dfe000  ! 1888: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r1
	.word 0xc2dfe020  ! 1889: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r1
	.word 0x97a48dd0  ! 1890: FdMULq	fdmulq	
	.word 0x9afb6001  ! 1891: SDIVcc_I	sdivcc 	%r13, 0x0001, %r13
	.word 0x819828d3  ! 1892: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08d3, %hpstate
DS_104:
	.word 0x34800001  ! 1894: BG	bg,a	<label_0x1>
	pdist %f28, %f28, %f30
	.word 0x87b60314  ! 1893: ALLIGNADDRESS	alignaddr	%r24, %r20, %r3
	.word 0xc68fe000  ! 1894: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r3
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1895: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 1896: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d90221f  ! 1897: WRPR_PSTATE_I	wrpr	%r0, 0x021f, %pstate
	.word 0x93d02034  ! 1898: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xb4c36001  ! 1899: ADDCcc_I	addccc 	%r13, 0x0001, %r26
	.word 0x85540000  ! 1900: RDPR_GL	rdpr	%-, %r2
DS_105:
	.word 0x20800001  ! 1902: BN	bn,a	<label_0x1>
	.word 0xc932e001  ! 1902: STQF_I	-	%f4, [0x0001, %r11]
	normalw
	.word 0x8d458000  ! 1901: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x8d902ac4  ! 1902: WRPR_PSTATE_I	wrpr	%r0, 0x0ac4, %pstate
	.word 0x93902001  ! 1903: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d494000  ! 1904: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0x93902004  ! 1905: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xcc7fe001  ! 1906: SWAP_I	swap	%r6, [%r31 + 0x0001]
	.word 0x93d02030  ! 1907: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x879022d9  ! 1908: WRPR_TT_I	wrpr	%r0, 0x02d9, %tt
	.word 0x83d02030  ! 1909: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x879021d7  ! 1910: WRPR_TT_I	wrpr	%r0, 0x01d7, %tt
	.word 0xcc8008a0  ! 1911: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x93902005  ! 1912: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xb1540000  ! 1913: RDPR_GL	rdpr	%-, %r24
	.word 0x93902006  ! 1914: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87902302  ! 1915: WRPR_TT_I	wrpr	%r0, 0x0302, %tt
	.word 0x85500000  ! 1916: RDPR_TPC	rdpr	%tpc, %r2
	.word 0x8d802000  ! 1917: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc4900e40  ! 1918: LDUHA_R	lduha	[%r0, %r0] 0x72, %r2
	invalw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1919: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 1920: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x9f802001  ! 1921: SIR	sir	0x0001
	.word 0xc48008a0  ! 1922: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
DS_106:
	.word 0x20800001  ! 1924: BN	bn,a	<label_0x1>
	pdist %f10, %f30, %f24
	.word 0xb5b04305  ! 1923: ALLIGNADDRESS	alignaddr	%r1, %r5, %r26
	.word 0x93902007  ! 1924: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d90289a  ! 1925: WRPR_PSTATE_I	wrpr	%r0, 0x089a, %pstate
	.word 0x81982087  ! 1926: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0087, %hpstate
	.word 0x24700001  ! 1927: BPLE	<illegal instruction>
	.word 0x8d9024d1  ! 1928: WRPR_PSTATE_I	wrpr	%r0, 0x04d1, %pstate
	.word 0x8b50c000  ! 1929: RDPR_TT	rdpr	%tt, %r5
	.word 0x8d802004  ! 1930: WRFPRS_I	wr	%r0, 0x0004, %fprs
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0xca3fe001  ! 1933: STD_I	std	%r5, [%r31 + 0x0001]
	.word 0xca5fc000  ! 1934: LDX_R	ldx	[%r31 + %r0], %r5
	.word 0x83504000  ! 1935: RDPR_TNPC	rdpr	%tnpc, %r1
	otherw
	mov 0x32, %r30
	.word 0x83d0001e  ! 1936: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc2cfe030  ! 1937: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r1
	.word 0x91d02033  ! 1938: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xc327c005  ! 1939: STF_R	st	%f1, [%r5, %r31]
	.word 0xc2ffc025  ! 1940: SWAPA_R	swapa	%r1, [%r31 + %r5] 0x01
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 1941: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902125  ! 1942: WRPR_TT_I	wrpr	%r0, 0x0125, %tt
	.word 0x91d02030  ! 1943: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x87902283  ! 1944: WRPR_TT_I	wrpr	%r0, 0x0283, %tt
	.word 0x91d02030  ! 1945: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d902297  ! 1946: WRPR_PSTATE_I	wrpr	%r0, 0x0297, %pstate
	.word 0x93902007  ! 1947: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x88698012  ! 1948: UDIVX_R	udivx 	%r6, %r18, %r4
	.word 0x87902211  ! 1949: WRPR_TT_I	wrpr	%r0, 0x0211, %tt
	.word 0x87902387  ! 1950: WRPR_TT_I	wrpr	%r0, 0x0387, %tt
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1951: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 1952: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x3a700001  ! 1953: BPCC	<illegal instruction>
	.word 0xc8d7e020  ! 1954: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r4
	.word 0x9f802001  ! 1955: SIR	sir	0x0001
	.word 0x8790221e  ! 1956: WRPR_TT_I	wrpr	%r0, 0x021e, %tt
	.word 0x91d02033  ! 1957: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d9020c7  ! 1958: WRPR_PSTATE_I	wrpr	%r0, 0x00c7, %pstate
	.word 0x83500000  ! 1959: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x91d02032  ! 1960: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d90204c  ! 1961: WRPR_PSTATE_I	wrpr	%r0, 0x004c, %pstate
	otherw
	mov 0x33, %r30
	.word 0x91d0001e  ! 1962: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8ba449fb  ! 1963: FDIVq	dis not found

	.word 0x9f802001  ! 1964: SIR	sir	0x0001
	.word 0xa5a20d26  ! 1965: FsMULd	fsmuld	%f8, %f6, %f18
	.word 0x8790224d  ! 1966: WRPR_TT_I	wrpr	%r0, 0x024d, %tt
	.word 0xe4ffc026  ! 1967: SWAPA_R	swapa	%r18, [%r31 + %r6] 0x01
	.word 0x8198264d  ! 1968: WRHPR_HPSTATE_I	wrhpr	%r0, 0x064d, %hpstate
	.word 0x93902006  ! 1969: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87902250  ! 1970: WRPR_TT_I	wrpr	%r0, 0x0250, %tt
	.word 0x9f802001  ! 1971: SIR	sir	0x0001
	.word 0xe4dfe030  ! 1972: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r18
	.word 0x9f802001  ! 1973: SIR	sir	0x0001
	.word 0x87802010  ! 1974: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0xb3a5c9e3  ! 1975: FDIVq	dis not found

	.word 0x93902005  ! 1976: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x95a049e1  ! 1977: FDIVq	dis not found

	.word 0x8d90244c  ! 1978: WRPR_PSTATE_I	wrpr	%r0, 0x044c, %pstate
DS_107:
	not %g0, %g2
	jmp %g2
	.word 0x9d902004  ! 1979: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x879020e0  ! 1980: WRPR_TT_I	wrpr	%r0, 0x00e0, %tt
	.word 0x9f802001  ! 1981: SIR	sir	0x0001
	.word 0x91d02034  ! 1982: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x83d02031  ! 1983: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x8198201a  ! 1984: WRHPR_HPSTATE_I	wrhpr	%r0, 0x001a, %hpstate
	.word 0x93d02032  ! 1985: Tcc_I	tne	icc_or_xcc, %r0 + 50
DS_108:
	.word 0x22800001  ! 1987: BE	be,a	<label_0x1>
	.word 0xcf324007  ! 1987: STQF_R	-	%f7, [%r7, %r9]
	normalw
	.word 0x87458000  ! 1986: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x91d02033  ! 1987: Tcc_I	ta	icc_or_xcc, %r0 + 51
change_to_tl1_109:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_110:
	.word 0x32800001  ! 1990: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x87a00549  ! 1990: FSQRTd	fsqrt	
	.word 0x97a24836  ! 1989: FADDs	fadds	%f9, %f22, %f11
	.word 0x93d02032  ! 1990: Tcc_I	tne	icc_or_xcc, %r0 + 50
	otherw
	mov 0x30, %r30
	.word 0x91d0001e  ! 1991: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 1992: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d500000  ! 1993: RDPR_TPC	rdpr	%tpc, %r6
	.word 0x8d90269a  ! 1994: WRPR_PSTATE_I	wrpr	%r0, 0x069a, %pstate
	.word 0x81982a09  ! 1995: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a09, %hpstate
	.word 0x93902004  ! 1996: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8198255e  ! 1997: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055e, %hpstate
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 1998: Tcc_R	ta	icc_or_xcc, %r0 + %r30


.global user_data_start
.data
user_data_start:
	.xword	0x5ad0137cc31c7c9c
	.xword	0x53a8bc9ecb07e997
	.xword	0x2dfaffae98380b9f
	.xword	0x7c3189612a126a90
	.xword	0xbe4f04c6e0396e20
	.xword	0xaabf8a20c2c57cfe
	.xword	0xee2d1bb1d54ce54b
	.xword	0x29eee60dd6d1979c
	.xword	0x8bb4c7da8057e844
	.xword	0xef0ee3e438338270
	.xword	0x2ca506a61032932e
	.xword	0x6dd1931069a64bbb
	.xword	0xae83d6cf3459223d
	.xword	0xc0ab85461e4a6461
	.xword	0x076b5962840bbc3d
	.xword	0x245763c918bb032f
	.xword	0x418e5395a94d9f24
	.xword	0x693ed8cd1823f268
	.xword	0xa822231942ed17fc
	.xword	0xe5b64dbe3d1102c3
	.xword	0x21d8d0fa0fcb88ad
	.xword	0xc3dc13a3ecd702d9
	.xword	0x6fa43e2ef9233e5b
	.xword	0xd185e22ba55d46f9
	.xword	0xa7e8a055cc1d7f63
	.xword	0xbaab2c1551e6b83f
	.xword	0x7e155da5db397e99
	.xword	0x3ce756e9cc3880d8
	.xword	0xd1f3b0eb9d0d61a3
	.xword	0xde1b619903a6966c
	.xword	0x9354d861feba9945
	.xword	0x1e8a0b21b9b18620
	.xword	0xe84f33ddc90c613b
	.xword	0x701eee3e5842182c
	.xword	0xc8383f5a909be22d
	.xword	0x0a5ecb9149101188
	.xword	0xc08dc2306b0331c3
	.xword	0x9cb7ff9f7f796f69
	.xword	0xc6e28cb864e32c2b
	.xword	0x71a7f1a76796a9f9
	.xword	0xfec43d559877699a
	.xword	0x0f4f54f19c11f6ad
	.xword	0x39159aa5bfbe7c65
	.xword	0x9f9bb3d3ae375bd2
	.xword	0x196edcb33d7295fa
	.xword	0xbd3192b5b4c2e56a
	.xword	0x421d245a4da95649
	.xword	0x733323c309a2418b
	.xword	0xf2b73d9ddf96b699
	.xword	0x71d143b10b4e3c12
	.xword	0xf2d26a55d2da7271
	.xword	0x86b947e1673c1713
	.xword	0x85fa2e8df35989c4
	.xword	0x81978c765aa6b77a
	.xword	0x071889e9515f10e2
	.xword	0x51c5013aef8195bd
	.xword	0x00ce1e8e818e6a66
	.xword	0xadf7981a89b9ccad
	.xword	0x5c98472c6596e446
	.xword	0x7366601a1aede55d
	.xword	0xd32fefbaa1e85cd4
	.xword	0x2ca7e813bb7b1a50
	.xword	0x50d0b1d2c3721ebf
	.xword	0xf8ee076b90f35361
	.xword	0xa5e3484202d09881
	.xword	0xe0c37055eb2fd94d
	.xword	0x1695ceeb89070479
	.xword	0x3ed30a04cee4ff60
	.xword	0xfd39dc10e12bbc3b
	.xword	0x671696c53e32d009
	.xword	0xda597a611b00c235
	.xword	0x661128daca0d349c
	.xword	0xd18d24fa432d678e
	.xword	0x8e31bcc36b890c9d
	.xword	0x81fb2d136f88daab
	.xword	0x610e6856b8891a5f
	.xword	0xae66acf2fc377667
	.xword	0x540063cbb5f70874
	.xword	0x09af3959fac1fbdb
	.xword	0x78edcce1d94d228a
	.xword	0x4e6d7086af09e2cd
	.xword	0xb0525a9456629f47
	.xword	0x678e77f7e4ac148b
	.xword	0x6a5b755cc2dfe4c3
	.xword	0xa594b24faf37c4af
	.xword	0x6f370dbc48ed614d
	.xword	0xaff3490e9f4d7b7c
	.xword	0xf609ff113f807d16
	.xword	0x9191ec93d1732ad6
	.xword	0xc37fe306f9baf14c
	.xword	0x1cd1a7205bcc4ee1
	.xword	0x4cc27dd975d1af3d
	.xword	0xab6ec3c0efbf6b5c
	.xword	0x579e76a00e7eac76
	.xword	0x24fa86aef9113f5a
	.xword	0xb6dae1c60d97108e
	.xword	0x52c60a85fa046e9f
	.xword	0x2e869d9b9285a07c
	.xword	0x126800f2643356f7
	.xword	0xdd60721147bd6918
	.xword	0x136067710e0756e9
	.xword	0x2eff2d2f3630cb3e
	.xword	0x8f0d4ff3d2ef88d6
	.xword	0x16b77cdff19dfa7c
	.xword	0x1eb0c33bd8969ecd
	.xword	0x5a462a832e575497
	.xword	0x91e913ab4f5409db
	.xword	0x1becb9fbe753c7a4
	.xword	0xe401254311946f2b
	.xword	0x68999b7d7a67d8f6
	.xword	0xabe00e71a27dec3a
	.xword	0x066b0ef7d078d1ee
	.xword	0xd96fca5c01a97322
	.xword	0x682ca9f7ab6b3347
	.xword	0x0b27876a8dc2ed64
	.xword	0x879a0d3f1cfbd716
	.xword	0xd1a1cbbfaefc117f
	.xword	0xa7a7d35473440343
	.xword	0x9e251a83cafa27b9
	.xword	0x20bc2f738c4b0c81
	.xword	0x82f64b9b9ec199dc
	.xword	0x2a06d4a60dabdde1
	.xword	0x7894b9894a992acd
	.xword	0xe74d1030125d217d
	.xword	0xd289ff28c69cecd2
	.xword	0x53a3c2b7282a4aa1
	.xword	0x9fc0be179c2a1612
	.xword	0x26140caa76d455d1
	.xword	0xa3764a8283b023f3
	.xword	0xf49c2f02674b2450
	.xword	0x6a36eb072184e9ca
	.xword	0x4c5e3852c0cc2457
	.xword	0x2a3601dbf66c106e
	.xword	0x58760c0d7093eb26
	.xword	0x0a234050ad07181c
	.xword	0x32bc7bd742efd314
	.xword	0x2c68e76f633f68e4
	.xword	0x23b53acc0fcc1147
	.xword	0xf3800d2ced674bc7
	.xword	0xb0bb7927576f6b6b
	.xword	0xd2c9c2a0f7d9ec42
	.xword	0xd5e9dbd52081d5e2
	.xword	0x888ba819064a9537
	.xword	0x626c09871322298e
	.xword	0x7d544e478e53cd92
	.xword	0xe525d7a5d1085fbe
	.xword	0x90a18c90be228603
	.xword	0x2aa3c1b173f8550f
	.xword	0x0e971c65e73bba97
	.xword	0x29ee39d4f78bbc47
	.xword	0x70b75e8bb982e5c6
	.xword	0xff00a2a23f52ad03
	.xword	0xffcada883653a861
	.xword	0xf7acfd6c25a15631
	.xword	0x0f65b3de2e5c677e
	.xword	0x855b8abdb7afad8b
	.xword	0xe8813a4eb808bdcb
	.xword	0x48b96367909d3c10
	.xword	0x5b040b6549f40e5c
	.xword	0xabd222cbf85f84f8
	.xword	0xd2879d1414aa4a70
	.xword	0x450e34e3d477a917
	.xword	0x94696d74c2d647a2
	.xword	0x87239869986c122f
	.xword	0xdd6251ee3a3bbb7d
	.xword	0x324612e54c194622
	.xword	0xd78821c1e9d3dec9
	.xword	0xdaaeca41db3c9838
	.xword	0x515ac91712d62323
	.xword	0x922d987519f0024e
	.xword	0xaaa74473dad7613c
	.xword	0xefee737ce03485d3
	.xword	0xfcede0b26b4591ef
	.xword	0x9a072fb516deb763
	.xword	0x957cabeb576474a9
	.xword	0x851d729c56f54c90
	.xword	0xbae9c55fc92b4ac9
	.xword	0x40b58fe184a9fe85
	.xword	0x32311ae592926ac2
	.xword	0xb4664cd098d94ac9
	.xword	0x4d2137ac273661fd
	.xword	0x12829b007d17c9bc
	.xword	0xd6f33adfcf789df3
	.xword	0xf566e7dd64d59bf5
	.xword	0x13df773359adeb09
	.xword	0xb052578d1a855d87
	.xword	0xe342f9bad74595f3
	.xword	0xbfa2dae5f5f4dd03
	.xword	0xbfd1c1db2ef94b4b
	.xword	0x8b50f79227745d2a
	.xword	0xea6a1d1517dd383a
	.xword	0x4415c04a89e3520e
	.xword	0x7a85b1c90c0ee2c4
	.xword	0x72d825d99fb8aa10
	.xword	0x7b54b8266aeb656d
	.xword	0xd833ae3dccdffb03
	.xword	0x1ff62d5ce2492366
	.xword	0xdbc0b29cb4b9ba05
	.xword	0x149d62acc73a1247
	.xword	0xc80d18323f0018b7
	.xword	0x67a9b3b1aa19b954
	.xword	0xbd2899436b45e73a
	.xword	0x6a45868cb941bfdf
	.xword	0xcd5be553678509df
	.xword	0x3bd328b9074a9556
	.xword	0x42b7736ce5591a04
	.xword	0x09adf74a06191adb
	.xword	0xdfa734bccf4a1352
	.xword	0x67bf1e1e1e7eb822
	.xword	0xf523ad0c0473b8a9
	.xword	0x5348f8d1d6ade422
	.xword	0x38404207f9d5e4b7
	.xword	0xa0d928139492c150
	.xword	0x802804f9db5d637c
	.xword	0xc350d7b727b4bcc9
	.xword	0xfcbd2065a02fad2c
	.xword	0xf3f69fba990e06e6
	.xword	0x914fff576a02f041
	.xword	0xe0d7a534ba06a20d
	.xword	0xfd6a5a968a56cc9d
	.xword	0xf9fe509be9c0acc2
	.xword	0xf4f407d328bbeaaa
	.xword	0xca5a4a7f5e1f5ed1
	.xword	0xca3c1ef8d286048e
	.xword	0x0fdf49e42100f861
	.xword	0x20541d21d936bb43
	.xword	0x1ed0a8fda772c7f3
	.xword	0x3ef1083386f0f52a
	.xword	0xf7c878af12ec5d2b
	.xword	0xfa6acb698046ae76
	.xword	0x427725229613aaa0
	.xword	0x9f0fa7db9dd61a19
	.xword	0x03e6b722c8454958
	.xword	0x8a40f3745432ac91
	.xword	0x82f6919db6f2df71
	.xword	0x169ed450b8415d6b
	.xword	0x2a31d75cb7a3da1a
	.xword	0x61687e66432762f8
	.xword	0xe98e72dff5c87693
	.xword	0xfc69d977569c3f81
	.xword	0x4648898695bc1b52
	.xword	0xcfa0179e14eca6db
	.xword	0x817c57176b7cb5e0
	.xword	0x833b7c46f18571a4
	.xword	0x3bdee19650a65ae8
	.xword	0x42a969886bab224f
	.xword	0x94766243cf048dd5
	.xword	0xb914099c82731d17
	.xword	0x8a0d5b9c0f03d5eb
	.xword	0xd84a21d8348da0b5
	.xword	0x0abbad8bd514385e
	.xword	0xb029553f0dff508f
	.xword	0xce161050c7174c35
	.xword	0x5818694a0df53869
	.xword	0x3774093a082b0d4c
	.xword	0x193298fe2890d2fd


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

#include "tlu_custom_trap_extensions.s"

#if 0
!!# /*
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Tue Apr 13 10:51:57 2004
!!#  */
!!# 
!!# %%section c_declarations
!!# 
!!#     int label = 0;
!!# 
!!# 
!!# %%
!!# %%section control
!!# 
!!# %%
!!# %%section init
!!# {
!!# 
!!# 
!!#     IJ_bind_thread_group("diag.j", 33, th0, 0x01);
!!# 
!!#     // Random 64 bits //
!!#     IJ_set_rvar("diag.j", 36, Rv_rand_64,"64'hrrrrrrrr_rrrrrrrr");
!!# 
!!#     IJ_set_rvar("diag.j", 39, Rv_pdist_reg,"5'brrrr0");
!!# 
!!#     // Register usage - use 0-27 //
!!#     // R31 is memory pointer
!!#     // R30 is trap number register
!!#     //
!!# 
!!#     IJ_set_ropr_fld("diag.j", 46, ijdefault, Ft_Rs1, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 47, ijdefault, Ft_Rs2, "{0..13,16..27}");
!!#     IJ_set_ropr_fld("diag.j", 48, ijdefault, Ft_Rd, "{0..13,16..27}");
!!# 
!!#     // Load/Store pointer = r31
!!#     IJ_set_ropr_fld("diag.j", 51, Ro_ldst_ptr, Ft_Rs1, "{31}");
!!# 
!!#     // ASI register values 
!!#     IJ_set_ropr_fld("diag.j", 54, Ro_wrasi_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 55, Ro_wrasi_i, Ft_Simm13, "{0x4, 0x10, 0x14, 0x16, 0x80, 0x88, 0x89}");
!!# 
!!#     // General Ldst ASIs to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 58, Ro_nontrap_ldasi, Ft_Imm_Asi, "{0x12,0x14, 0x16, 0x80, 0x88}");
!!#     IJ_set_ropr_fld("diag.j", 59, Ro_nontrap_ldasi, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 60, Ro_nontrap_ldasi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 61, Ro_nontrap_ldasi, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 63, Ro_nontrap_ldasi_z, Ft_Imm_Asi, "{0x45, 0x53..0x64}");
!!#     IJ_set_ropr_fld("diag.j", 64, Ro_nontrap_ldasi_z, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 65, Ro_nontrap_ldasi_z, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 66, Ro_nontrap_ldasi_z, Ft_Simm13, "{0x0}, 6'brr0000");
!!# 
!!#     // General Ldst alignment to use .. 50% should be illegal ..
!!#     IJ_set_ropr_fld("diag.j", 69, Ro_nontrap_ld, Fm_align_Simm13, "{0x0..0x6:5,0x7:1}");
!!#     IJ_set_ropr_fld("diag.j", 70, Ro_nontrap_ld, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 71, Ro_nontrap_ld, Ft_Rs2, "{0}");
!!# 
!!#     // Trap ASI operands
!!#     IJ_set_ropr_fld("diag.j", 74, Ro_traps_asi, Ft_Imm_Asi, "{0x25, 0x72..0x74}");
!!#     IJ_set_ropr_fld("diag.j", 75, Ro_traps_asi, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 76, Ro_traps_asi, Ft_Rs2, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 77, Ro_traps_asi, Ft_Simm13, "{0x25, 0x72..0x74}");
!!# 
!!#     // Trap #s to use
!!#     //IJ_set_ropr_fld(Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_ropr_fld("diag.j", 81, Ro_traps_i, Ft_Sw_Trap, "{0x30..0x35}");
!!#     IJ_set_ropr_fld("diag.j", 82, Ro_traps_i, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 83, Ro_traps_i, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 84, Ro_traps_r, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 85, Ro_traps_r, Ft_Rs2, "{30}");
!!#     IJ_set_ropr_fld("diag.j", 86, Ro_traps_r, Ft_Cond_f2, "{0x8:3, 0x9, 0x1}");
!!#     IJ_set_ropr_fld("diag.j", 87, Ro_traps_r, Ft_Simm13, "{0x30..0x35}");
!!#     //IJ_set_ropr_fld(Ro_traps_r, Ft_Simm13, "{0x30..0x35, 0xb0..0xb5}");
!!#     IJ_set_rvar("diag.j", 89, Rv_init_trap, "{0x30..0x35}");
!!#     //IJ_set_rvar(Rv_init_trap, "{0x30..0x35, 0xb0..0xb5}");
!!# 
!!#     // FPRS splash
!!#     IJ_set_ropr_fld("diag.j", 93, Ro_wrfprs, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 94, Ro_wrfprs, Ft_Simm13, "{0, 4}");
!!# 
!!#     // Pstate splash
!!#     IJ_set_ropr_fld("diag.j", 97, Ro_wrpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 98, Ro_wrpstate, Ft_Simm13, "12'b0rrr0rr0rrrrr");
!!# 
!!#     // Hpstate splash
!!#     IJ_set_ropr_fld("diag.j", 101, Ro_wrhpstate, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 102, Ro_wrhpstate, Ft_Simm13, "12'brrrrrr0rrrrr");
!!# 
!!#     // TT splash
!!#     IJ_set_ropr_fld("diag.j", 105, Ro_wrtt, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 106, Ro_wrtt, Ft_Simm13, "10'brrrrrrrrrr");
!!# 
!!#     // GL splash
!!#     IJ_set_ropr_fld("diag.j", 109, Ro_wrgl, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 110, Ro_wrgl, Ft_Simm13, "4'brrrr");
!!# 
!!#     // CWP splash
!!#     IJ_set_ropr_fld("diag.j", 114, Ro_wrcwp, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 115, Ro_wrcwp, Ft_Simm13, "3'brrr");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 117, Ro_save_restore, Ft_Rs1, "{31}");
!!#     IJ_set_ropr_fld("diag.j", 118, Ro_save_restore, Ft_Rd,  "{31}");
!!#     IJ_set_ropr_fld("diag.j", 119, Ro_save_restore, Ft_Rs2, "{0}");
!!# 
!!#     IJ_set_ropr_fld("diag.j", 121, Ro_winops, Ft_Rs1, "{0}");
!!#     IJ_set_ropr_fld("diag.j", 122, Ro_winops, Ft_Simm13, "{0..5}");
!!# 
!!#     // Weights
!!#     IJ_set_default_rule_wt_rvar ("diag.j", 125,"{10}");
!!#     IJ_set_rvar("diag.j", 126, wt_high, "{90}");
!!#     IJ_set_rvar("diag.j", 127, wt_med,  "{40}");
!!#     IJ_set_rvar("diag.j", 128, wt_low,  "{10}");
!!# 
!!#     // Initialize registers ..
!!#     int i, j, k;
!!#     IJ_printf  ("diag.j", 132, th0,"!Initializing integer registers\n");
!!#     for (k=0; k<7; k++) {
!!#         for (i = 0; i < 30; i++) {
!!#             if (i==15) {
!!#                 IJ_printf  ("diag.j", 136, th0,"\tmov %%r31, %%r15\n");
!!#                 continue;
!!#             }
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 140, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 142, th0,"\tmov 0x%rx, %%r14\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 143, th0,"\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 144, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 147, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 150, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 153, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
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
!!#     IJ_printf  ("diag.j", 159, th0,"\n\n.global user_data_start\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 161, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
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
!!#         IJ_generate ("diag.j", 200, th0, $2);
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
!!#         | sir           %rvar  wt_med
!!# ;
!!# 
!!# sir : tSIR ;
!!# 
!!# change_mode :   
!!#       tCHANGE_NONPRIV 
!!#     | tCHANGE_PRIV 
!!#     | tCHANGE_NONHPRIV
!!#     | tCHANGE_HPRIV 
!!#     | change_to_tl1
!!#     | tCHANGE_TO_TL0 
!!# ;
!!# 
!!# change_to_tl1 : tCHANGE_TO_TL1
!!#     {
!!#         IJ_printf("diag.j", 237, th0, "change_to_tl1_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 239, th0, "\tta T_CHANGE_HPRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 241, th0, "\tta T_CHANGE_PRIV\n");
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
!!#         IJ_printf("diag.j", 289, th0, "\totherw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#      } else {
!!#         IJ_printf("diag.j", 291, th0, "\tinvalw\n\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!#         IJ_printf("diag.j", 376, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 377,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 378,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 379, th0, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 383, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 384,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 386,1, th0, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 388, th0, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 390, th0, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 395, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 396,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 398, th0, "\tilltrap\n");
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 400,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 402,1, th0, ijdefault, tFSQRTd, tLDQF_R, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 409, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 410,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 414, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 415,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 419, th0, "DS_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 420, th0, "\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 421, th0, "\tjmp %%g2\n");
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
