/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand05_ind_01.s
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
#define DISABLE_PART_LIMIT_CHECK
# 5 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 24 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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
# 53 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
#define H_HT0_Tag_Overflow
#define My_HT0_Tag_Overflow \
    done;nop;

#define H_T0_Tag_Overflow
#define My_T0_Tag_Overflow \
    done;nop;

#define H_T1_Tag_Overflow_0x23
#define SUN_H_T1_Tag_Overflow_0x23 \
    done;nop;

#define H_T0_Window_Spill_0_Normal_Trap
#define SUN_H_T0_Window_Spill_0_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_1_Normal_Trap
#define SUN_H_T0_Window_Spill_1_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_2_Normal_Trap
#define SUN_H_T0_Window_Spill_2_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_3_Normal_Trap
#define SUN_H_T0_Window_Spill_3_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_4_Normal_Trap
#define SUN_H_T0_Window_Spill_4_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_5_Normal_Trap
#define SUN_H_T0_Window_Spill_5_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_6_Normal_Trap
#define SUN_H_T0_Window_Spill_6_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_7_Normal_Trap
#define SUN_H_T0_Window_Spill_7_Normal_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_0_Other_Trap
#define  SUN_H_T0_Window_Spill_0_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_1_Other_Trap
#define  SUN_H_T0_Window_Spill_1_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_2_Other_Trap
#define  SUN_H_T0_Window_Spill_2_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_3_Other_Trap
#define  SUN_H_T0_Window_Spill_3_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_4_Other_Trap
#define  SUN_H_T0_Window_Spill_4_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_5_Other_Trap
#define  SUN_H_T0_Window_Spill_5_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_6_Other_Trap
#define  SUN_H_T0_Window_Spill_6_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Spill_7_Other_Trap
#define  SUN_H_T0_Window_Spill_7_Other_Trap saved; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_0_Normal_Trap
#define  SUN_H_T0_Window_Fill_0_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_1_Normal_Trap
#define  SUN_H_T0_Window_Fill_1_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_2_Normal_Trap
#define  SUN_H_T0_Window_Fill_2_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_3_Normal_Trap
#define  SUN_H_T0_Window_Fill_3_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_4_Normal_Trap
#define  SUN_H_T0_Window_Fill_4_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_5_Normal_Trap
#define  SUN_H_T0_Window_Fill_5_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_6_Normal_Trap
#define  SUN_H_T0_Window_Fill_6_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

#define H_T0_Window_Fill_7_Normal_Trap
#define  SUN_H_T0_Window_Fill_7_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

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
# 162 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_handlers.s"
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

#define H_T1_Window_Fill_7_Normal_Trap
#define SUN_H_T1_Window_Fill_7_Normal_Trap restored; retry; nop;nop;nop;nop;nop;nop;

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
    mov 0x80, %g3;\
    stxa %g3, [%g3] 0x57;\
    stw %g2, [%i7];\
    done;\
    nop;nop;nop

#define H_HT0_Trap_Instruction_1
#define My_HT0_Trap_Instruction_1 \
    rd %asi, %g2;\
    mov 0x80, %g3;\
    stxa %g3, [%g3] 0x5f;\
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

#define H_HT0_Control_Transfer_Instr_0x74
#define My_H_HT0_Control_Transfer_Instr_0x74 \
    done;nop;

#define H_T0_Control_Transfer_Instr_0x74
#define My_H_T0_Control_Transfer_Instr_0x74 \
    done;nop;

#define H_T1_Control_Transfer_Instr_0x74
#define My_H_T1_Control_Transfer_Instr_0x74 \
    done;nop;

#define  H_HT0_IAE_privilege_violation_0x08
#define  My_HT0_IAE_privilege_violation_0x08 \
    done; nop;
#define  H_HT0_IAE_unauth_access_0x0b
#define  SUN_H_HT0_IAE_unauth_access_0x0b \
    done; nop;

#define H_HT0_data_access_protection_0x6c
#define SUN_H_HT0_data_access_protection_0x6c   ba daccess_prot_handler; nop

!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 12 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!!!!!!!!!!!!!!! START of Interrupt Handlers !!!!!!!!!!!!!!!!!

#define H_HT0_Externally_Initiated_Reset_0x03
#define SUN_H_HT0_Externally_Initiated_Reset_0x03 \
    setx External_Reset_Handler, %g1, %g2; \
    jmp %g2; \
    nop 
    
!!!!! HW interrupt handlers

#define H_HT0_Interrupt_0x60
#define My_HT0_Interrupt_0x60 \
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g1 ;\
    ldxa    [%g0] ASI_SWVR_INTR_R, %g2 ;\
    ldxa    [%g0] ASI_SWVR_INTR_RECEIVE, %g3 ;\
    cmp %g1, %g3 ;\
    nop; \
    retry;

!!!!! Queue interrupt handler
# 30 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
#define H_T0_Cpu_Mondo_Trap_0x7c
#define My_T0_Cpu_Mondo_Trap_0x7c \
	mov	0x3c8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3c0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T0_Dev_Mondo_Trap_0x7d
#define My_T0_Dev_Mondo_Trap_0x7d \
	mov	0x3d8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3d0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T0_Resumable_Error_0x7e
#define My_T0_Resumable_Error_0x7e \
	mov	0x3e8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3e0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T1_Cpu_Mondo_Trap_0x7c
#define My_T1_Cpu_Mondo_Trap_0x7c \
	mov	0x3c8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3c0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T1_Dev_Mondo_Trap_0x7d
#define My_T1_Dev_Mondo_Trap_0x7d \
	mov	0x3d8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3d0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T1_Resumable_Error_0x7e
#define My_T1_Resumable_Error_0x7e \
	mov	0x3e8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3e0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_HT0_Reserved_0x7c
#define SUN_H_HT0_Reserved_0x7c \
	mov	0x3c8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3c0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_HT0_Reserved_0x7d
#define SUN_H_HT0_Reserved_0x7d \
	mov	0x3d8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3d0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop

#define H_HT0_Reserved_0x7e
#define SUN_H_HT0_Reserved_0x7e \
	mov	0x3e8, %g3; \
	ldxa	[%g3] 0x25, %g5; \
	mov	0x3e0, %g3; \
	stxa	%g5, [%g3] 0x25; \
	retry; \
	nop; \
	nop; \
	nop
# 130 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! Hstick-match trap handler
# 133 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
#define H_T0_Reserved_0x5e
#define My_T0_Reserved_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Hstick_Match_0x5e
#define My_HT0_Hstick_Match_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Reserved_0x5e
#define My_T0_Reserved_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Reserved_0x5e
#define My_T1_Reserved_0x5e \
	rdhpr	%hintp, %g3; \
	wrhpr	%g3, %g3, %hintp; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop; \
	nop
# 178 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
!!!!! SW interuupt handlers
# 181 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"
#define H_T0_Interrupt_Level_14_0x4e
#define My_T0_Interrupt_Level_14_0x4e \
	rd	%softint, %g3; \
	sethi	%hi(0x14000), %g3; \
	or	%g3, 0x1, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_1_0x41
#define My_T0_Interrupt_Level_1_0x41 \
	rd	%softint, %g3; \
	or	%g0, 0x2, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_2_0x42
#define My_T0_Interrupt_Level_2_0x42 \
	rd	%softint, %g3; \
	or	%g0, 0x4, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_3_0x43
#define My_T0_Interrupt_Level_3_0x43 \
	rd	%softint, %g3; \
	or	%g0, 0x8, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_4_0x44
#define My_T0_Interrupt_Level_4_0x44 \
	rd	%softint, %g3; \
	or	%g0, 0x10, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_5_0x45
#define My_T0_Interrupt_Level_5_0x45 \
	rd	%softint, %g3; \
	or	%g0, 0x20, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_6_0x46
#define My_T0_Interrupt_Level_6_0x46 \
	rd	%softint, %g3; \
	or	%g0, 0x40, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_7_0x47
#define My_T0_Interrupt_Level_7_0x47 \
	rd	%softint, %g3; \
	or	%g0, 0x80, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_8_0x48
#define My_T0_Interrupt_Level_8_0x48 \
	rd	%softint, %g3; \
	or	%g0, 0x100, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_9_0x49
#define My_T0_Interrupt_Level_9_0x49 \
	rd	%softint, %g3; \
	or	%g0, 0x200, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_10_0x4a
#define My_T0_Interrupt_Level_10_0x4a \
	rd	%softint, %g3; \
	or	%g0, 0x400, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_11_0x4b
#define My_T0_Interrupt_Level_11_0x4b \
	rd	%softint, %g3; \
	or	%g0, 0x800, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_12_0x4c
#define My_T0_Interrupt_Level_12_0x4c \
	rd	%softint, %g3; \
	sethi	%hi(0x1000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_13_0x4d
#define My_T0_Interrupt_Level_13_0x4d \
	rd	%softint, %g3; \
	sethi	%hi(0x2000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T0_Interrupt_Level_15_0x4f
#define My_T0_Interrupt_Level_15_0x4f \
	rd	%softint, %g3; \
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	rd	%pcr, %g3; \
	and	%g3, 0x300, %g5; \
	wr	%g3, %g5, %pcr; \
	retry; \
	nop                                 

#define H_T1_Interrupt_Level_14_0x4e
#define My_T1_Interrupt_Level_14_0x4e \
	rd	%softint, %g3; \
	sethi	%hi(0x14000), %g3; \
	or	%g3, 0x1, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_1_0x41
#define My_T1_Interrupt_Level_1_0x41 \
	rd	%softint, %g3; \
	or	%g0, 0x2, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_2_0x42
#define My_T1_Interrupt_Level_2_0x42 \
	rd	%softint, %g3; \
	or	%g0, 0x4, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_3_0x43
#define My_T1_Interrupt_Level_3_0x43 \
	rd	%softint, %g3; \
	or	%g0, 0x8, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_4_0x44
#define My_T1_Interrupt_Level_4_0x44 \
	rd	%softint, %g3; \
	or	%g0, 0x10, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_5_0x45
#define My_T1_Interrupt_Level_5_0x45 \
	rd	%softint, %g3; \
	or	%g0, 0x20, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_6_0x46
#define My_T1_Interrupt_Level_6_0x46 \
	rd	%softint, %g3; \
	or	%g0, 0x40, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_7_0x47
#define My_T1_Interrupt_Level_7_0x47 \
	rd	%softint, %g3; \
	or	%g0, 0x80, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_8_0x48
#define My_T1_Interrupt_Level_8_0x48 \
	rd	%softint, %g3; \
	or	%g0, 0x100, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_9_0x49
#define My_T1_Interrupt_Level_9_0x49 \
	rd	%softint, %g3; \
	or	%g0, 0x200, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_10_0x4a
#define My_T1_Interrupt_Level_10_0x4a \
	rd	%softint, %g3; \
	or	%g0, 0x400, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_11_0x4b
#define My_T1_Interrupt_Level_11_0x4b \
	rd	%softint, %g3; \
	or	%g0, 0x800, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_12_0x4c
#define My_T1_Interrupt_Level_12_0x4c \
	rd	%softint, %g3; \
	sethi	%hi(0x1000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_13_0x4d
#define My_T1_Interrupt_Level_13_0x4d \
	rd	%softint, %g3; \
	sethi	%hi(0x2000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_T1_Interrupt_Level_15_0x4f
#define My_T1_Interrupt_Level_15_0x4f \
	rd	%softint, %g3; \
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	rd	%pcr, %g3; \
	and	%g3, 0x300, %g5; \
	wr	%g3, %g5, %pcr; \
	retry; \
	nop                                 

#define H_HT0_Interrupt_Level_14_0x4e
#define My_HT0_Interrupt_Level_14_0x4e \
	rd	%softint, %g3; \
	sethi	%hi(0x14000), %g3; \
	or	%g3, 0x1, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_1_0x41
#define My_HT0_Interrupt_Level_1_0x41 \
	rd	%softint, %g3; \
	or	%g0, 0x2, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_2_0x42
#define My_HT0_Interrupt_Level_2_0x42 \
	rd	%softint, %g3; \
	or	%g0, 0x4, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_3_0x43
#define My_HT0_Interrupt_Level_3_0x43 \
	rd	%softint, %g3; \
	or	%g0, 0x8, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_4_0x44
#define My_HT0_Interrupt_Level_4_0x44 \
	rd	%softint, %g3; \
	or	%g0, 0x10, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_5_0x45
#define My_HT0_Interrupt_Level_5_0x45 \
	rd	%softint, %g3; \
	or	%g0, 0x20, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_6_0x46
#define My_HT0_Interrupt_Level_6_0x46 \
	rd	%softint, %g3; \
	or	%g0, 0x40, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_7_0x47
#define My_HT0_Interrupt_Level_7_0x47 \
	rd	%softint, %g3; \
	or	%g0, 0x80, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_8_0x48
#define My_HT0_Interrupt_Level_8_0x48 \
	rd	%softint, %g3; \
	or	%g0, 0x100, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_9_0x49
#define My_HT0_Interrupt_Level_9_0x49 \
	rd	%softint, %g3; \
	or	%g0, 0x200, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_10_0x4a
#define My_HT0_Interrupt_Level_10_0x4a \
	rd	%softint, %g3; \
	or	%g0, 0x400, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_11_0x4b
#define My_HT0_Interrupt_Level_11_0x4b \
	rd	%softint, %g3; \
	or	%g0, 0x800, %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_12_0x4c
#define My_HT0_Interrupt_Level_12_0x4c \
	rd	%softint, %g3; \
	sethi	%hi(0x1000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_13_0x4d
#define My_HT0_Interrupt_Level_13_0x4d \
	rd	%softint, %g3; \
	sethi	%hi(0x2000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	retry; \
	nop; \
	nop; \
	nop; \
	nop

#define H_HT0_Interrupt_Level_15_0x4f
#define My_HT0_Interrupt_Level_15_0x4f \
	rd	%softint, %g3; \
	sethi	%hi(0x8000), %g3; \
	wr	%g3, %g0, %clear_softint; \
	rd	%pcr, %g3; \
	and	%g3, 0x300, %g4; \
	wr	%g3, %g4, %pcr; \
	retry; \
	nop                                
# 677 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_intr_handlers.s"

#define H_HT0_mem_address_range_0x2e
#define SUN_H_HT0_mem_address_range_0x2e \
    done;nop

!!!!!!!!!!!!!!!!!!!!!! END of all handlers !!!!!!!!!!!!!!!!!!!
# 210 "diag.j"

#define H_HT0_Instruction_address_range_0x0d
#define SUN_H_HT0_Instruction_address_range_0x0d \
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
	mov 0xb3, %r14
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
	mov 0x31, %r14
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
	mov 0x33, %r14
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
	mov 0xb1, %r14
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
	mov 0xb4, %r14
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
	mov 0x31, %r14
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
    !! Set TPC/TNPC to diag-finish in case we get to a strange TL ..
    ta T_CHANGE_HPRIV
    setx diag_finish, %r29, %r28
    add %r28, 4, %r29
    wrpr %g0, 1, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
    wrpr %g0, 2, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
    wrpr %g0, 3, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
    wrpr %g0, 4, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
    wrpr %g0, 5, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
    wrpr %g0, 6, %tl
    wrpr %r28, %tpc
    wrpr %r29, %tnpc
    wrpr %g0, 0, %tl

    ta T_CHANGE_HPRIV 

    !Initializing Tick Cmprs
    mov 1, %g2
    sllx %g2, 63, %g2
    or %g1, %g2, %g1
    wrhpr %g1, %g0, %hsys_tick_cmpr
    wr %g1, %g0, %tick_cmpr
    wr %g1, %g0, %sys_tick_cmpr
    ta T_CHANGE_NONHPRIV 

	.word 0xe0dfe010  ! 1: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r16
	.word 0x8790229b  ! 2: WRPR_TT_I	wrpr	%r0, 0x029b, %tt
	.word 0xe0800c40  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r16
	.word 0xa1902005  ! 4: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0xe137e001  ! 5: STQF_I	-	%f16, [0x0001, %r31]
	.word 0x87802063  ! 6: WRASI_I	wr	%r0, 0x0063, %asi
	ta	T_CHANGE_PRIV	! macro
	.word 0xe00fe001  ! 8: LDUB_I	ldub	[%r31 + 0x0001], %r16
	.word 0xa7802001  ! 9: WR_GRAPHICS_STATUS_REG_I	wr	%r0, 0x0001, %-
DS_0_0:
	nop
	not %g0, %g2
	.word 0x9d902004  ! 10: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
splash_lsu_0_1:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 11: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8790206c  ! 12: WRPR_TT_I	wrpr	%r0, 0x006c, %tt
	.word 0xe0c80e60  ! 13: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r16
	ta	T_CHANGE_HPRIV	! macro
	.word 0xe0800aa0  ! 15: LDUWA_R	lduwa	[%r0, %r0] 0x55, %r16
	.word 0xe0c7e030  ! 16: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r16
	.word 0xa1902001  ! 17: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xe197e001  ! 18: LDQFA_I	-	[%r31, 0x0001], %f16
	.word 0x8d9028f2  ! 19: WRPR_PSTATE_I	wrpr	%r0, 0x08f2, %pstate
	.word 0xe04fe001  ! 20: LDSB_I	ldsb	[%r31 + 0x0001], %r16
	.word 0xe197e001  ! 21: LDQFA_I	-	[%r31, 0x0001], %f16
	.word 0xe0c004a0  ! 22: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r16
DS_0_2:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f4, %f30, %f2
	.word 0x93b10312  ! 23: ALIGNADDRESS	alignaddr	%r4, %r18, %r9
	.word 0x8d902019  ! 24: WRPR_PSTATE_I	wrpr	%r0, 0x0019, %pstate
	.word 0x93902001  ! 25: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 27: Tcc_R	ta	icc_or_xcc, %r0 + %r30
tagged_0_3:
	taddcctv %r11, 0x1805, %r6
	.word 0xd207e001  ! 28: LDUW_I	lduw	[%r31 + 0x0001], %r9
DS_0_4:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 29: SAVE_R	save	%r31, %r0, %r31
	.word 0xa4dac002  ! 30: SMULcc_R	smulcc 	%r11, %r2, %r18
	.word 0x95514000  ! 31: RDPR_TBA	rdpr	%tba, %r10
	.word 0x2c800001  ! 32: BNEG	bneg,a	<label_0x1>
	set 0xcf499fc3, %r28
	stxa %r28, [%g0] 0x73
intvec_0_5:
	.word 0x39400001  ! 33: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_6:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 34: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 35: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x91d02034  ! 36: Tcc_I	ta	icc_or_xcc, %r0 + 52
change_to_randtl_0_7:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_7:
	.word 0x8f902003  ! 37: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	.word 0xd51fe001  ! 38: LDDF_I	ldd	[%r31, 0x0001], %f10
	.word 0xd42fe001  ! 39: STB_I	stb	%r10, [%r31 + 0x0001]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_8)) -> intp(0,1,3)
xir_0_8:
	.word 0xa9852001  ! 40: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0xd4d80e60  ! 41: LDXA_R	ldxa	[%r0, %r0] 0x73, %r10
	.word 0xa9500000  ! 42: RDPR_TPC	<illegal instruction>
	.word 0xe847c000  ! 43: LDSW_R	ldsw	[%r31 + %r0], %r20
	.word 0x91932001  ! 44: WRPR_PIL_I	wrpr	%r12, 0x0001, %pil
DS_0_9:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xd9306001  ! 1: STQF_I	-	%f12, [0x0001, %r1]
	normalw
	.word 0x8d458000  ! 45: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0x87802020  ! 46: WRASI_I	wr	%r0, 0x0020, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_10)) -> intp(0,0,2)
intvec_0_10:
	.word 0x39400001  ! 47: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8790233d  ! 48: WRPR_TT_I	wrpr	%r0, 0x033d, %tt
mondo_0_11:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3e0] %asi
	.word 0x9d924001  ! 49: WRPR_WSTATE_R	wrpr	%r9, %r1, %wstate
	.word 0x87902199  ! 50: WRPR_TT_I	wrpr	%r0, 0x0199, %tt
	invalw
	mov 0xb3, %r30
	.word 0x83d0001e  ! 51: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa1902009  ! 52: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xcc1fc000  ! 53: LDD_R	ldd	[%r31 + %r0], %r6
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_12)) -> intp(0,1,3)
xir_0_12:
	.word 0xa9816001  ! 54: WR_SET_SOFTINT_I	wr	%r5, 0x0001, %set_softint
	.word 0x8790228d  ! 55: WRPR_TT_I	wrpr	%r0, 0x028d, %tt
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 56: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200a  ! 57: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8f450000  ! 58: RD_SET_SOFTINT	rd	%set_softint, %r7
	.word 0xcf37e001  ! 59: STQF_I	-	%f7, [0x0001, %r31]
	set 0xac8a656, %r28
	stxa %r28, [%g0] 0x73
intvec_0_13:
	.word 0x39400001  ! 60: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x30700001  ! 61: BPA	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_14)) -> intp(0,0,5)
intvec_0_14:
	.word 0x39400001  ! 62: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9464000  ! 63: RD_STICK_CMPR_REG	rd	%-, %r20
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x976ae001  ! 64: SDIVX_I	sdivx	%r11, 0x0001, %r11
	.word 0xd64fc000  ! 65: LDSB_R	ldsb	[%r31 + %r0], %r11
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_16)) -> intp(0,0,27)
intvec_0_16:
	.word 0x39400001  ! 66: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_17:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_17:
	.word 0x8f902004  ! 67: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x879020d2  ! 68: WRPR_TT_I	wrpr	%r0, 0x00d2, %tt
tagged_0_18:
	tsubcctv %r21, 0x13e3, %r8
	.word 0xd607e001  ! 69: LDUW_I	lduw	[%r31 + 0x0001], %r11
	.word 0xad816001  ! 70: WR_SOFTINT_REG_I	wr	%r5, 0x0001, %softint
splash_tba_0_19:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 71: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd737c001  ! 72: STQF_R	-	%f11, [%r1, %r31]
splash_lsu_0_20:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 73: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd64fc000  ! 74: LDSB_R	ldsb	[%r31 + %r0], %r11
	.word 0xd797e001  ! 75: LDQFA_I	-	[%r31, 0x0001], %f11
	set 0x89cceac8, %r28
	stxa %r28, [%g0] 0x73
intvec_0_21:
	.word 0x39400001  ! 76: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd68008a0  ! 77: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd737e001  ! 78: STQF_I	-	%f11, [0x0001, %r31]
	.word 0x91d02032  ! 79: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xd6880e80  ! 80: LDUBA_R	lduba	[%r0, %r0] 0x74, %r11
DS_0_22:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xe7334011  ! 1: STQF_R	-	%f19, [%r17, %r13]
	normalw
	.word 0x85458000  ! 81: RD_SOFTINT_REG	rd	%softint, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x2c700001  ! 83: BPNEG	<illegal instruction>
	.word 0xc40fe001  ! 84: LDUB_I	ldub	[%r31 + 0x0001], %r2
	.word 0x99902005  ! 85: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
DS_0_23:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xa5a00553  ! 1: FSQRTd	fsqrt	
	.word 0x97a50834  ! 86: FADDs	fadds	%f20, %f20, %f11
	.word 0xd647e001  ! 87: LDSW_I	ldsw	[%r31 + 0x0001], %r11
	.word 0xd717c000  ! 88: LDQF_R	-	[%r31, %r0], %f11
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_24)) -> intp(0,1,3)
xir_0_24:
	.word 0xa9842001  ! 89: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0x8f480000  ! 90: RDHPR_HPSTATE	rdhpr	%hpstate, %r7
splash_lsu_0_25:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 91: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b2  ! 92: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0x9f802001  ! 93: SIR	sir	0x0001
	.word 0xce77c014  ! 94: STX_R	stx	%r7, [%r31 + %r20]
	.word 0xcf97e001  ! 95: LDQFA_I	-	[%r31, 0x0001], %f7
	.word 0x93902007  ! 96: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xce8008a0  ! 97: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r7
	.word 0x81982a9d  ! 98: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9d, %hpstate
DS_0_26:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f26, %f22, %f24
	.word 0x89b1c300  ! 99: ALIGNADDRESS	alignaddr	%r7, %r0, %r4
	.word 0xa1902006  ! 100: WRPR_GL_I	wrpr	%r0, 0x0006, %-
tagged_0_27:
	taddcctv %r7, 0x1132, %r8
	.word 0xc807e001  ! 101: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0xab840014  ! 102: WR_CLEAR_SOFTINT_R	wr	%r16, %r20, %clear_softint
	.word 0xc917c000  ! 103: LDQF_R	-	[%r31, %r0], %f4
	.word 0x8198235f  ! 104: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035f, %hpstate
	.word 0xc8c7e020  ! 105: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r4
	.word 0xc8c7e010  ! 106: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r4
	.word 0xc8c7e030  ! 107: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r4
	.word 0x87802004  ! 108: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xc91fe001  ! 109: LDDF_I	ldd	[%r31, 0x0001], %f4
	.word 0xc88008a0  ! 110: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r4
splash_tba_0_28:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 111: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	ta	T_CHANGE_HPRIV	! macro
	.word 0x3a800001  ! 113: BCC	bcc,a	<label_0x1>
	.word 0xc81fe001  ! 114: LDD_I	ldd	[%r31 + 0x0001], %r4
mondo_0_29:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d934008  ! 115: WRPR_WSTATE_R	wrpr	%r13, %r8, %wstate
	.word 0xc937c008  ! 116: STQF_R	-	%f4, [%r8, %r31]
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_30)) -> intp(0,0,19)
intvec_0_30:
	.word 0x39400001  ! 117: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x8d832c73, %r28
	stxa %r28, [%g0] 0x73
intvec_0_31:
	.word 0x39400001  ! 118: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb4, %r30
	.word 0x83d0001e  ! 119: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8780201c  ! 120: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x8d902b38  ! 121: WRPR_PSTATE_I	wrpr	%r0, 0x0b38, %pstate
splash_htba_0_32:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 122: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_33)) -> intp(0,1,3)
xir_0_33:
	.word 0xa9836001  ! 123: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0xc91fe001  ! 124: LDDF_I	ldd	[%r31, 0x0001], %f4
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99696001  ! 125: SDIVX_I	sdivx	%r5, 0x0001, %r12
	.word 0xa1902009  ! 126: WRPR_GL_I	wrpr	%r0, 0x0009, %-
mondo_0_35:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r5, [%r0+0x3e8] %asi
	.word 0x9d914013  ! 127: WRPR_WSTATE_R	wrpr	%r5, %r19, %wstate
	.word 0x8d90232a  ! 128: WRPR_PSTATE_I	wrpr	%r0, 0x032a, %pstate
DS_0_36:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd9306001  ! 1: STQF_I	-	%f12, [0x0001, %r1]
	normalw
	.word 0x8b458000  ! 129: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x8da509f1  ! 130: FDIVq	dis not found

	.word 0xcd37c011  ! 131: STQF_R	-	%f6, [%r17, %r31]
	.word 0xcc37c011  ! 132: STH_R	sth	%r6, [%r31 + %r17]
	.word 0x87802016  ! 133: WRASI_I	wr	%r0, 0x0016, %asi
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1804013  ! 134: WR_STICK_REG_R	wr	%r1, %r19, %-
	.word 0x87902254  ! 135: WRPR_TT_I	wrpr	%r0, 0x0254, %tt
	.word 0x99480000  ! 136: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0xa1902003  ! 137: WRPR_GL_I	wrpr	%r0, 0x0003, %-
splash_htba_0_38:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 138: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x93902001  ! 139: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xd82fc013  ! 140: STB_R	stb	%r12, [%r31 + %r19]
	.word 0xd8d80e80  ! 141: LDXA_R	ldxa	[%r0, %r0] 0x74, %r12
	.word 0x83d020b2  ! 142: Tcc_I	te	icc_or_xcc, %r0 + 178
DS_0_39:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 143: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_40)) -> intp(0,1,3)
xir_0_40:
	.word 0xa984a001  ! 144: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
splash_lsu_0_41:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 145: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd84fc000  ! 146: LDSB_R	ldsb	[%r31 + %r0], %r12
	.word 0xd897e000  ! 147: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r12
	.word 0x93902001  ! 148: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_42)) -> intp(0,0,27)
intvec_0_42:
	.word 0x39400001  ! 149: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd91fe001  ! 150: LDDF_I	ldd	[%r31, 0x0001], %f12
	.word 0xd927e001  ! 151: STF_I	st	%f12, [0x0001, %r31]
mondo_0_43:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3e0] %asi
	.word 0x9d944000  ! 152: WRPR_WSTATE_R	wrpr	%r17, %r0, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_44)) -> intp(0,0,12)
intvec_0_44:
	.word 0x39400001  ! 153: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd89fc020  ! 154: LDDA_R	ldda	[%r31, %r0] 0x01, %r12
	.word 0x9f802001  ! 155: SIR	sir	0x0001
	.word 0xd8dfe020  ! 156: LDXA_I	ldxa	[%r31, + 0x0020] %asi, %r12
	.word 0x91d02034  ! 157: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93d020b4  ! 158: Tcc_I	tne	icc_or_xcc, %r0 + 180
	.word 0x8d9028f8  ! 159: WRPR_PSTATE_I	wrpr	%r0, 0x08f8, %pstate
	.word 0x83d020b2  ! 160: Tcc_I	te	icc_or_xcc, %r0 + 178
	set 0x9b35fdfa, %r28
	stxa %r28, [%g0] 0x73
intvec_0_45:
	.word 0x39400001  ! 161: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x99902005  ! 162: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 163: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902168  ! 164: WRPR_TT_I	wrpr	%r0, 0x0168, %tt
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 165: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd84fe001  ! 166: LDSB_I	ldsb	[%r31 + 0x0001], %r12
	.word 0xd8c804a0  ! 167: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r12
splash_lsu_0_46:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 168: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 169: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x83a18dd1  ! 170: FdMULq	fdmulq	
	.word 0x8780201c  ! 171: WRASI_I	wr	%r0, 0x001c, %asi
	.word 0x93902000  ! 172: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
mondo_0_47:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e8] %asi
	.word 0x9d95000b  ! 173: WRPR_WSTATE_R	wrpr	%r20, %r11, %wstate
	.word 0xc28008a0  ! 174: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xc28008a0  ! 175: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
DS_0_48:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.xword 0xdb78349e	! Random illegal ?
	.word 0xd914c010  ! 1: LDQF_R	-	[%r19, %r16], %f12
	.word 0x8da4882c  ! 176: FADDs	fadds	%f18, %f12, %f6
	.word 0xcc8008a0  ! 177: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
change_to_randtl_0_49:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_49:
	.word 0x8f902003  ! 178: WRPR_TL_I	wrpr	%r0, 0x0003, %tl
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 179: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_50:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 180: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xcc9fc020  ! 181: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0xa9454000  ! 182: RD_CLEAR_SOFTINT	rd	%clear_softint, %r20
	.word 0x87802020  ! 183: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0x99902001  ! 184: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xe807c000  ! 185: LDUW_R	lduw	[%r31 + %r0], %r20
	.word 0x81a00574  ! 186: FSQRTq	fsqrt	
	.word 0x8780204f  ! 187: WRASI_I	wr	%r0, 0x004f, %asi
splash_lsu_0_51:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 188: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 189: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 190: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_0_52:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0xf95178ac	! Random illegal ?
	.word 0x9ba00554  ! 1: FSQRTd	fsqrt	
	.word 0x89a20825  ! 191: FADDs	fadds	%f8, %f5, %f4
	.word 0xc89fe001  ! 192: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r4
	.word 0x91d02032  ! 193: Tcc_I	ta	icc_or_xcc, %r0 + 50
	set 0xef238a28, %r28
	stxa %r28, [%g0] 0x73
intvec_0_53:
	.word 0x39400001  ! 194: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x81a44dc9  ! 195: FdMULq	fdmulq	
	invalw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 196: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc127c009  ! 197: STF_R	st	%f0, [%r9, %r31]
	.word 0xc0dfe010  ! 198: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r0
	.word 0xc08008a0  ! 199: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
	.word 0xc0c004a0  ! 200: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r0
	.word 0x99902000  ! 201: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8d9023d7  ! 202: WRPR_PSTATE_I	wrpr	%r0, 0x03d7, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_54)) -> intp(0,0,5)
intvec_0_54:
	.word 0x39400001  ! 203: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 204: SIR	sir	0x0001
	.word 0x8d9026b7  ! 205: WRPR_PSTATE_I	wrpr	%r0, 0x06b7, %pstate
	.word 0x8ba00542  ! 206: FSQRTd	fsqrt	
	.word 0xa190200c  ! 207: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xcadfe030  ! 208: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r5
	.word 0x83d02032  ! 209: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x84848014  ! 210: ADDcc_R	addcc 	%r18, %r20, %r2
	.word 0x93902006  ! 211: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
splash_lsu_0_55:
	set 0x5, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 212: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_56)) -> intp(0,0,22)
intvec_0_56:
	.word 0x39400001  ! 213: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc48008a0  ! 214: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
tagged_0_57:
	taddcctv %r11, 0x14fc, %r21
	.word 0xc407e001  ! 215: LDUW_I	lduw	[%r31 + 0x0001], %r2
	.word 0xc48008a0  ! 216: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
DS_0_58:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0xcd5efaac	! Random illegal ?
	.word 0x8da00554  ! 1: FSQRTd	fsqrt	
	.word 0x97a28822  ! 217: FADDs	fadds	%f10, %f2, %f11
	.word 0x93902005  ! 218: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902002  ! 219: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
splash_tba_0_59:
	set 0x120000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 220: WRPR_TBA_R	wrpr	%r0, %r2, %tba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_60)) -> intp(0,0,23)
intvec_0_60:
	.word 0x39400001  ! 221: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0xee0917ac, %r28
	stxa %r28, [%g0] 0x73
intvec_0_61:
	.word 0x39400001  ! 222: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_62)) -> intp(0,1,3)
xir_0_62:
	.word 0xa9802001  ! 223: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
splash_cmpr_0_63:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184e001  ! 224: WR_STICK_REG_I	wr	%r19, 0x0001, %-
	.word 0x93902007  ! 225: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xd647c000  ! 226: LDSW_R	ldsw	[%r31 + %r0], %r11
	.word 0xd607c000  ! 227: LDUW_R	lduw	[%r31 + %r0], %r11
	.word 0x87802014  ! 228: WRASI_I	wr	%r0, 0x0014, %asi
	invalw
	mov 0x31, %r30
	.word 0x93d0001e  ! 229: Tcc_R	tne	icc_or_xcc, %r0 + %r30
splash_lsu_0_64:
	set 0x11, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 230: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0xb5, %r30
	.word 0x83d0001e  ! 231: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_lsu_0_65:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 232: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_66:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xcf336001  ! 1: STQF_I	-	%f7, [0x0001, %r13]
	normalw
	.word 0x91458000  ! 233: RD_SOFTINT_REG	rd	%softint, %r8
	ta	T_CHANGE_HPRIV	! macro
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 235: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa190200f  ! 236: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 237: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_67)) -> intp(0,1,3)
xir_0_67:
	.word 0xa9852001  ! 238: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_68)) -> intp(0,0,15)
intvec_0_68:
	.word 0x39400001  ! 239: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902b18  ! 240: WRPR_PSTATE_I	wrpr	%r0, 0x0b18, %pstate
	.word 0x81982306  ! 241: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0306, %hpstate
mondo_0_69:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c8] %asi
	.word 0x9d94400b  ! 242: WRPR_WSTATE_R	wrpr	%r17, %r11, %wstate
	.word 0x879023ff  ! 243: WRPR_TT_I	wrpr	%r0, 0x03ff, %tt
	.word 0xd01fc000  ! 244: LDD_R	ldd	[%r31 + %r0], %r8
	.word 0x81a01a61  ! 245: FqTOi	fqtoi	
	.word 0x8790208b  ! 246: WRPR_TT_I	wrpr	%r0, 0x008b, %tt
	.word 0x36800001  ! 247: BGE	bge,a	<label_0x1>
	.word 0xc08008a0  ! 248: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r0
mondo_0_70:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r1, [%r0+0x3e0] %asi
	.word 0x9d91000c  ! 249: WRPR_WSTATE_R	wrpr	%r4, %r12, %wstate
splash_lsu_0_71:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 250: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93902006  ! 251: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xc097e020  ! 252: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r0
change_to_randtl_0_72:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_72:
	.word 0x8f902001  ! 253: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	.word 0x8790238f  ! 254: WRPR_TT_I	wrpr	%r0, 0x038f, %tt
	set 0x70bc526e, %r28
	stxa %r28, [%g0] 0x73
intvec_0_73:
	.word 0x39400001  ! 255: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_0_74:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 256: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
DS_0_75:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 257: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xc13fe001  ! 258: STDF_I	std	%f0, [0x0001, %r31]
	.word 0x8d902c7d  ! 259: WRPR_PSTATE_I	wrpr	%r0, 0x0c7d, %pstate
	.word 0xc0d80e60  ! 260: LDXA_R	ldxa	[%r0, %r0] 0x73, %r0
	.word 0xad852001  ! 261: WR_SOFTINT_REG_I	wr	%r20, 0x0001, %softint
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 262: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_76)) -> intp(0,0,4)
intvec_0_76:
	.word 0x39400001  ! 263: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_77:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	pdist %f10, %f18, %f4
	.word 0xa9b10314  ! 264: ALIGNADDRESS	alignaddr	%r4, %r20, %r20
change_to_randtl_0_78:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_78:
	.word 0x8f902002  ! 265: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x91d020b3  ! 266: Tcc_I	ta	icc_or_xcc, %r0 + 179
	.word 0x83d020b4  ! 267: Tcc_I	te	icc_or_xcc, %r0 + 180
	.word 0xe847e001  ! 268: LDSW_I	ldsw	[%r31 + 0x0001], %r20
	.word 0x93902001  ! 269: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xe89fe001  ! 270: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r20
	ta	T_CHANGE_HPRIV	! macro
tagged_0_79:
	taddcctv %r22, 0x19f2, %r8
	.word 0xe807e001  ! 272: LDUW_I	lduw	[%r31 + 0x0001], %r20
mondo_0_80:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d940011  ! 273: WRPR_WSTATE_R	wrpr	%r16, %r17, %wstate
	.word 0xe857e001  ! 274: LDSH_I	ldsh	[%r31 + 0x0001], %r20
	.word 0x99902002  ! 275: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0xe8c80e80  ! 276: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r20
tagged_0_81:
	taddcctv %r14, 0x127d, %r24
	.word 0xe807e001  ! 277: LDUW_I	lduw	[%r31 + 0x0001], %r20
	.word 0xe88008a0  ! 278: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x80d24010  ! 279: UMULcc_R	umulcc 	%r9, %r16, %r0
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8568e001  ! 280: SDIVX_I	sdivx	%r3, 0x0001, %r2
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 281: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2c800001  ! 282: BNEG	bneg,a	<label_0x1>
DS_0_83:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 283: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02034  ! 284: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x846c400d  ! 285: UDIVX_R	udivx 	%r17, %r13, %r2
	.word 0x85508000  ! 286: RDPR_TSTATE	rdpr	%tstate, %r2
DS_0_84:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 287: SAVE_R	save	%r31, %r0, %r31
	set 0x27132129, %r28
	stxa %r28, [%g0] 0x73
intvec_0_85:
	.word 0x39400001  ! 288: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902608  ! 289: WRPR_PSTATE_I	wrpr	%r0, 0x0608, %pstate
	.word 0xc447e001  ! 290: LDSW_I	ldsw	[%r31 + 0x0001], %r2
	.word 0xc4cfe030  ! 291: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r2
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 292: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802089  ! 293: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x81460000  ! 294: RD_STICK_REG	stbar
	.word 0x81b01021  ! 295: SIAM	siam	1
DS_0_86:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 296: RESTORE_R	restore	%r31, %r0, %r31
	otherw
	mov 0xb2, %r30
	.word 0x91d0001e  ! 297: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_87)) -> intp(0,1,3)
xir_0_87:
	.word 0xa984e001  ! 298: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0xc41fc000  ! 299: LDD_R	ldd	[%r31 + %r0], %r2
	invalw
	mov 0x33, %r30
	.word 0x91d0001e  ! 300: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_tba_0_88:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 301: WRPR_TBA_R	wrpr	%r0, %r2, %tba
splash_lsu_0_89:
	set 0xd, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 302: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
splash_lsu_0_90:
	set 0x9, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 303: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xc517c000  ! 304: LDQF_R	-	[%r31, %r0], %f2
	.word 0xa66c2001  ! 305: UDIVX_I	udivx 	%r16, 0x0001, %r19
	.word 0xe64fe001  ! 306: LDSB_I	ldsb	[%r31 + 0x0001], %r19
	.word 0xa1902008  ! 307: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x93d02035  ! 308: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa4fa8012  ! 309: SDIVcc_R	sdivcc 	%r10, %r18, %r18
DS_0_91:
	nop
	not %g0, %g2
	.word 0x9d902001  ! 310: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xe40fe001  ! 311: LDUB_I	ldub	[%r31 + 0x0001], %r18
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_92)) -> intp(0,1,3)
xir_0_92:
	.word 0xa9846001  ! 312: WR_SET_SOFTINT_I	wr	%r17, 0x0001, %set_softint
	otherw
	mov 0xb4, %r30
	.word 0x91d0001e  ! 313: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8780204f  ! 314: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xe49fc020  ! 315: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0x8d90271e  ! 316: WRPR_PSTATE_I	wrpr	%r0, 0x071e, %pstate
	.word 0xa190200f  ! 317: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	otherw
	mov 0x34, %r30
	.word 0x91d0001e  ! 318: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe527c012  ! 319: STF_R	st	%f18, [%r18, %r31]
tagged_0_93:
	taddcctv %r2, 0x1a7c, %r14
	.word 0xe407e001  ! 320: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0xe4c00e40  ! 321: LDSWA_R	ldswa	[%r0, %r0] 0x72, %r18
	.word 0xa1902005  ! 322: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x8d802000  ! 323: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93d02034  ! 324: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0xe40fe001  ! 325: LDUB_I	ldub	[%r31 + 0x0001], %r18
	.word 0xe51fe001  ! 326: LDDF_I	ldd	[%r31, 0x0001], %f18
	.word 0x99902003  ! 327: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
DS_0_94:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.xword 0x897ff4d0	! Random illegal ?
	.word 0x89a00550  ! 1: FSQRTd	fsqrt	
	.word 0x93a28821  ! 328: FADDs	fadds	%f10, %f1, %f9
	.word 0xd297e020  ! 329: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r9
splash_htba_0_95:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 330: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x81460000  ! 331: RD_STICK_REG	stbar
	.word 0xd28008a0  ! 332: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0xd317c000  ! 333: LDQF_R	-	[%r31, %r0], %f9
	.word 0xd2cfe030  ! 334: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r9
change_to_randtl_0_96:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_96:
	.word 0x8f902002  ! 335: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
tagged_0_97:
	taddcctv %r12, 0x1104, %r3
	.word 0xd207e001  ! 336: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd2900e80  ! 337: LDUHA_R	lduha	[%r0, %r0] 0x74, %r9
mondo_0_98:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3d0] %asi
	.word 0x9d900009  ! 338: WRPR_WSTATE_R	wrpr	%r0, %r9, %wstate
	.word 0x83500000  ! 339: RDPR_TPC	rdpr	%tpc, %r1
	.word 0x93902007  ! 340: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc28008a0  ! 341: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
splash_cmpr_0_99:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb184a001  ! 342: WR_STICK_REG_I	wr	%r18, 0x0001, %-
	.word 0xc257c000  ! 343: LDSH_R	ldsh	[%r31 + %r0], %r1
splash_tba_0_100:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 344: WRPR_TBA_R	wrpr	%r0, %r2, %tba
DS_0_101:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xd3346001  ! 1: STQF_I	-	%f9, [0x0001, %r17]
	normalw
	.word 0xa3458000  ! 345: RD_SOFTINT_REG	rd	%softint, %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_102)) -> intp(0,0,3)
intvec_0_102:
	.word 0x39400001  ! 346: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe28008a0  ! 347: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
tagged_0_103:
	taddcctv %r13, 0x17bb, %r13
	.word 0xe207e001  ! 348: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0xa1902003  ! 349: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8d902b0c  ! 350: WRPR_PSTATE_I	wrpr	%r0, 0x0b0c, %pstate
mondo_0_104:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r9, [%r0+0x3c0] %asi
	.word 0x9d944014  ! 351: WRPR_WSTATE_R	wrpr	%r17, %r20, %wstate
	.word 0x93902004  ! 352: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
tagged_0_105:
	taddcctv %r8, 0x1261, %r3
	.word 0xe207e001  ! 353: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x87802080  ! 354: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xe317c000  ! 355: LDQF_R	-	[%r31, %r0], %f17
	.word 0x93902007  ! 356: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	invalw
	mov 0x35, %r30
	.word 0x83d0001e  ! 357: Tcc_R	te	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_106)) -> intp(0,0,23)
intvec_0_106:
	.word 0x39400001  ! 358: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
tagged_0_107:
	taddcctv %r6, 0x1a87, %r21
	.word 0xe207e001  ! 359: LDUW_I	lduw	[%r31 + 0x0001], %r17
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1818010  ! 360: WR_STICK_REG_R	wr	%r6, %r16, %-
	.word 0x93902007  ! 361: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
tagged_0_109:
	taddcctv %r25, 0x18a8, %r14
	.word 0xe207e001  ! 362: LDUW_I	lduw	[%r31 + 0x0001], %r17
DS_0_110:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f30, %f28, %f16
	.word 0x8bb50312  ! 363: ALIGNADDRESS	alignaddr	%r20, %r18, %r5
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 366: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902020  ! 367: WRPR_TT_I	wrpr	%r0, 0x0020, %tt
	set 0x40407453, %r28
	stxa %r28, [%g0] 0x73
intvec_0_111:
	.word 0x39400001  ! 368: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_112)) -> intp(0,0,22)
intvec_0_112:
	.word 0x39400001  ! 369: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_113:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xcb346001  ! 1: STQF_I	-	%f5, [0x0001, %r17]
	normalw
	.word 0xa1458000  ! 370: RD_SOFTINT_REG	rd	%softint, %r16
	.word 0xe05fe001  ! 371: LDX_I	ldx	[%r31 + 0x0001], %r16
	.word 0xa3514000  ! 372: RDPR_TBA	rdpr	%tba, %r17
	.word 0x879023e1  ! 373: WRPR_TT_I	wrpr	%r0, 0x03e1, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_114)) -> intp(0,0,17)
intvec_0_114:
	.word 0x39400001  ! 374: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe397e001  ! 375: LDQFA_I	-	[%r31, 0x0001], %f17
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_115)) -> intp(0,1,3)
xir_0_115:
	.word 0xa9836001  ! 376: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
	.word 0x879022f0  ! 377: WRPR_TT_I	wrpr	%r0, 0x02f0, %tt
	.word 0x93902004  ! 378: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x95500000  ! 379: RDPR_TPC	rdpr	%tpc, %r10
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01971  ! 380: FqTOd	dis not found

!$EV trig_pc_d(1, @VA(.MAIN.xir_0_117)) -> intp(0,1,3)
xir_0_117:
	.word 0xa9842001  ! 381: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_118)) -> intp(0,0,17)
intvec_0_118:
	.word 0x39400001  ! 382: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_119:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd1144007  ! 1: LDQF_R	-	[%r17, %r7], %f8
	.word 0x95a20832  ! 383: FADDs	fadds	%f8, %f18, %f10
	.word 0x93902001  ! 384: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_120)) -> intp(0,0,31)
intvec_0_120:
	.word 0x39400001  ! 385: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4d804a0  ! 386: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x24800001  ! 387: BLE	ble,a	<label_0x1>
	set 0xa61f1564, %r28
	stxa %r28, [%g0] 0x73
intvec_0_121:
	.word 0x39400001  ! 388: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd4c7e030  ! 389: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r10
DS_0_122:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xcf31a001  ! 1: STQF_I	-	%f7, [0x0001, %r6]
	normalw
	.word 0x83458000  ! 390: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xc297e000  ! 391: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r1
	.word 0x81460000  ! 392: RD_STICK_REG	stbar
	.word 0xc28fe020  ! 393: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r1
	.word 0x879023c1  ! 394: WRPR_TT_I	wrpr	%r0, 0x03c1, %tt
splash_lsu_0_123:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 395: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1454000  ! 396: RD_CLEAR_SOFTINT	rd	%clear_softint, %r16
	.word 0xe08008a0  ! 397: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x8d9025c7  ! 398: WRPR_PSTATE_I	wrpr	%r0, 0x05c7, %pstate
	.word 0x91d02035  ! 399: Tcc_I	ta	icc_or_xcc, %r0 + 53
mondo_0_124:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d92400a  ! 400: WRPR_WSTATE_R	wrpr	%r9, %r10, %wstate
	.word 0xe08008a0  ! 401: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0x85450000  ! 402: RD_SET_SOFTINT	rd	%set_softint, %r2
DS_0_125:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f12, %f24, %f0
	.word 0x8bb0c301  ! 403: ALIGNADDRESS	alignaddr	%r3, %r1, %r5
change_to_randtl_0_126:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_126:
	.word 0x8f902002  ! 404: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0x87902352  ! 405: WRPR_TT_I	wrpr	%r0, 0x0352, %tt
	otherw
	mov 0x31, %r30
	.word 0x83d0001e  ! 406: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x95a309c8  ! 407: FDIVd	fdivd	%f12, %f8, %f10
splash_lsu_0_127:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 408: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_128)) -> intp(0,0,12)
intvec_0_128:
	.word 0x39400001  ! 409: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd457c000  ! 410: LDSH_R	ldsh	[%r31 + %r0], %r10
splash_lsu_0_129:
	set 0x13, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 411: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d90277b  ! 412: WRPR_PSTATE_I	wrpr	%r0, 0x077b, %pstate
	.word 0x8780201c  ! 413: WRASI_I	wr	%r0, 0x001c, %asi
DS_0_130:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 414: SAVE_R	save	%r31, %r0, %r31
	.word 0xad812001  ! 415: WR_SOFTINT_REG_I	wr	%r4, 0x0001, %softint
	set 0xfe5d80d, %r28
	stxa %r28, [%g0] 0x73
intvec_0_131:
	.word 0x39400001  ! 416: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x88d0e001  ! 417: UMULcc_I	umulcc 	%r3, 0x0001, %r4
	.word 0xc8800c00  ! 418: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r4
	.word 0xc81fc000  ! 419: LDD_R	ldd	[%r31 + %r0], %r4
	.word 0xc8ffc028  ! 420: SWAPA_R	swapa	%r4, [%r31 + %r8] 0x01
tagged_0_132:
	tsubcctv %r22, 0x1057, %r23
	.word 0xc807e001  ! 421: LDUW_I	lduw	[%r31 + 0x0001], %r4
	set 0x5d3e543b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_133:
	.word 0x39400001  ! 422: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8b520000  ! 423: RDPR_PIL	rdpr	%pil, %r5
	.word 0xa1902008  ! 424: WRPR_GL_I	wrpr	%r0, 0x0008, %-
tagged_0_134:
	tsubcctv %r2, 0x1ed8, %r25
	.word 0xca07e001  ! 425: LDUW_I	lduw	[%r31 + 0x0001], %r5
	set 0x84b86036, %r28
	stxa %r28, [%g0] 0x73
intvec_0_135:
	.word 0x39400001  ! 426: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200f  ! 427: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x91d02032  ! 428: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xca9fe001  ! 429: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r5
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_136)) -> intp(0,0,25)
intvec_0_136:
	.word 0x39400001  ! 430: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d902f9f  ! 431: WRPR_PSTATE_I	wrpr	%r0, 0x0f9f, %pstate
	set 0xfd86ded6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_137:
	.word 0x39400001  ! 432: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_138:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.xword 0x93561550	! Random illegal ?
	.word 0xe310000d  ! 1: LDQF_R	-	[%r0, %r13], %f17
	.word 0xa3a10826  ! 433: FADDs	fadds	%f4, %f6, %f17
	set 0x9938ef87, %r28
	stxa %r28, [%g0] 0x73
intvec_0_139:
	.word 0x39400001  ! 434: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x84488008  ! 435: MULX_R	mulx 	%r2, %r8, %r2
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_140)) -> intp(0,0,21)
intvec_0_140:
	.word 0x39400001  ! 436: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x2a700001  ! 437: BPCS	<illegal instruction>
	.word 0x8780204f  ! 438: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xa190200b  ! 439: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xc4dfe000  ! 440: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r2
splash_htba_0_141:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 441: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xc51fc000  ! 442: LDDF_R	ldd	[%r31, %r0], %f2
	.word 0xa190200a  ! 443: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0xc49fc020  ! 444: LDDA_R	ldda	[%r31, %r0] 0x01, %r2
DS_0_142:
	nop
	not %g0, %g2
	.word 0x9d902005  ! 445: WRPR_WSTATE_I	wrpr	%r0, 0x0005, %wstate
xir_0_143:
	.word 0xa984a001  ! 446: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0xab80c012  ! 447: WR_CLEAR_SOFTINT_R	wr	%r3, %r18, %clear_softint
	.word 0x91d02035  ! 448: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xc41fe001  ! 449: LDD_I	ldd	[%r31 + 0x0001], %r2
	.word 0xc527e001  ! 450: STF_I	st	%f2, [0x0001, %r31]
	.word 0x8790234f  ! 451: WRPR_TT_I	wrpr	%r0, 0x034f, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_144)) -> intp(0,0,23)
intvec_0_144:
	.word 0x39400001  ! 452: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xc49004a0  ! 453: LDUHA_R	lduha	[%r0, %r0] 0x25, %r2
	.word 0xa190200a  ! 454: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93d02033  ! 455: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xc497e020  ! 456: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r2
	set 0x15a9782b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_145:
	.word 0x39400001  ! 457: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
mondo_0_146:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3d8] %asi
	.word 0x9d90c00d  ! 458: WRPR_WSTATE_R	wrpr	%r3, %r13, %wstate
	.word 0x94fc2001  ! 459: SDIVcc_I	sdivcc 	%r16, 0x0001, %r10
	.word 0x8d902ebb  ! 460: WRPR_PSTATE_I	wrpr	%r0, 0x0ebb, %pstate
	.word 0x97500000  ! 461: RDPR_TPC	rdpr	%tpc, %r11
	.word 0xd68008a0  ! 462: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd797e001  ! 463: LDQFA_I	-	[%r31, 0x0001], %f11
	.word 0x87902108  ! 464: WRPR_TT_I	wrpr	%r0, 0x0108, %tt
	.word 0xd637c00d  ! 465: STH_R	sth	%r11, [%r31 + %r13]
xir_0_147:
	.word 0xa982e001  ! 466: WR_SET_SOFTINT_I	wr	%r11, 0x0001, %set_softint
	.word 0x94fb0006  ! 467: SDIVcc_R	sdivcc 	%r12, %r6, %r10
	.word 0xd4d804a0  ! 468: LDXA_R	ldxa	[%r0, %r0] 0x25, %r10
	.word 0x98816001  ! 469: ADDcc_I	addcc 	%r5, 0x0001, %r12
mondo_0_148:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r11, [%r0+0x3c0] %asi
	.word 0x9d920000  ! 470: WRPR_WSTATE_R	wrpr	%r8, %r0, %wstate
	.word 0xd88fe000  ! 471: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0x8d802000  ! 472: WRFPRS_I	wr	%r0, 0x0000, %fprs
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 473: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd88008a0  ! 474: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0x87902028  ! 475: WRPR_TT_I	wrpr	%r0, 0x0028, %tt
	.word 0xa1902006  ! 476: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x8f902002  ! 1: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa769a001  ! 477: SDIVX_I	sdivx	%r6, 0x0001, %r19
	.word 0xa1902004  ! 478: WRPR_GL_I	wrpr	%r0, 0x0004, %-
splash_htba_0_150:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 479: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xa190200b  ! 480: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xe6c004a0  ! 481: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r19
	otherw
	mov 0x31, %r30
	.word 0x93d0001e  ! 482: Tcc_R	tne	icc_or_xcc, %r0 + %r30
mondo_0_151:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3d8] %asi
	.word 0x9d94c012  ! 483: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0xa153c000  ! 484: RDPR_FQ	<illegal instruction>
xir_0_152:
	.word 0xa981e001  ! 485: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	otherw
	mov 0x33, %r30
	.word 0x83d0001e  ! 486: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xe02fc012  ! 487: STB_R	stb	%r16, [%r31 + %r18]
	.word 0x91504000  ! 488: RDPR_TNPC	<illegal instruction>
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd047e001  ! 490: LDSW_I	ldsw	[%r31 + 0x0001], %r8
splash_lsu_0_153:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 491: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x87902303  ! 492: WRPR_TT_I	wrpr	%r0, 0x0303, %tt
	.word 0x8d802000  ! 493: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa945c000  ! 494: RD_TICK_CMPR_REG	rd	%-, %r20
splash_cmpr_0_154:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1832001  ! 495: WR_STICK_REG_I	wr	%r12, 0x0001, %-
	.word 0xe88008a0  ! 496: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
splash_cmpr_0_155:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xb3800001  ! 1: WR_STICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182e001  ! 497: WR_STICK_REG_I	wr	%r11, 0x0001, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_156)) -> intp(0,1,3)
xir_0_156:
	.word 0xa984a001  ! 498: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 499: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe8800c80  ! 500: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r20
DS_0_157:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	pdist %f22, %f30, %f6
	.word 0x81b40310  ! 501: ALIGNADDRESS	alignaddr	%r16, %r16, %r0
	.word 0x91d02034  ! 502: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xc13fe001  ! 503: STDF_I	std	%f0, [0x0001, %r31]
	.word 0xc0cfe000  ! 504: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r0
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_158)) -> intp(0,0,21)
intvec_0_158:
	.word 0x39400001  ! 505: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
DS_0_159:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xd314000d  ! 1: LDQF_R	-	[%r16, %r13], %f9
	.word 0x89a48821  ! 506: FADDs	fadds	%f18, %f1, %f4
splash_htba_0_160:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 507: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
splash_lsu_0_161:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 508: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	ta	T_CHANGE_HPRIV	! macro
tagged_0_162:
	tsubcctv %r20, 0x127a, %r17
	.word 0xc807e001  ! 510: LDUW_I	lduw	[%r31 + 0x0001], %r4
	.word 0x85464000  ! 511: RD_STICK_CMPR_REG	rd	%-, %r2
	.word 0x87802014  ! 512: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa151c000  ! 513: RDPR_TL	rdpr	%tl, %r16
DS_0_163:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f12, %f0, %f10
	.word 0xa5b34302  ! 514: ALIGNADDRESS	alignaddr	%r13, %r2, %r18
	.word 0xe4bfe001  ! 515: STDA_I	stda	%r18, [%r31 + 0x0001] %asi
	.word 0xa190200e  ! 516: WRPR_GL_I	wrpr	%r0, 0x000e, %-
splash_tba_0_164:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 517: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	otherw
	mov 0x30, %r30
	.word 0x93d0001e  ! 518: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x36800001  ! 519: BGE	bge,a	<label_0x1>
	.word 0xe44fc000  ! 520: LDSB_R	ldsb	[%r31 + %r0], %r18
	.word 0x91d020b2  ! 521: Tcc_I	ta	icc_or_xcc, %r0 + 178
	.word 0xe49fc020  ! 522: LDDA_R	ldda	[%r31, %r0] 0x01, %r18
	.word 0xa1902000  ! 523: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xe4d80e80  ! 524: LDXA_R	ldxa	[%r0, %r0] 0x74, %r18
	.word 0x93540000  ! 525: RDPR_GL	rdpr	%-, %r9
mondo_0_165:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3e8] %asi
	.word 0x9d904010  ! 526: WRPR_WSTATE_R	wrpr	%r1, %r16, %wstate
	.word 0xd20fc000  ! 527: LDUB_R	ldub	[%r31 + %r0], %r9
	.word 0x93902000  ! 528: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81460000  ! 529: RD_STICK_REG	stbar
splash_lsu_0_166:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 530: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_167:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 531: SAVE_R	save	%r31, %r0, %r31
splash_lsu_0_168:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 532: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xd23fc010  ! 533: STD_R	std	%r9, [%r31 + %r16]
	.word 0x9545c000  ! 534: RD_TICK_CMPR_REG	rd	%-, %r10
	set 0xc22a26bf, %r28
	stxa %r28, [%g0] 0x73
intvec_0_169:
	.word 0x39400001  ! 535: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802088  ! 536: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x9f802001  ! 537: SIR	sir	0x0001
change_to_randtl_0_170:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_170:
	.word 0x8f902002  ! 538: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
splash_htba_0_171:
	set 0x00390000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x003a0000, %r2
	.word 0x8b980002  ! 539: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_172)) -> intp(0,0,9)
intvec_0_172:
	.word 0x39400001  ! 540: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x83d020b5  ! 541: Tcc_I	te	icc_or_xcc, %r0 + 181
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 542: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa049c00a  ! 543: MULX_R	mulx 	%r7, %r10, %r16
splash_lsu_0_173:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 544: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe11fc000  ! 545: LDDF_R	ldd	[%r31, %r0], %f16
	.word 0x87902237  ! 546: WRPR_TT_I	wrpr	%r0, 0x0237, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_174)) -> intp(0,1,3)
xir_0_174:
	.word 0xa981a001  ! 547: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
tagged_0_175:
	taddcctv %r12, 0x10c1, %r13
	.word 0xe007e001  ! 548: LDUW_I	lduw	[%r31 + 0x0001], %r16
DS_0_176:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 549: RESTORE_R	restore	%r31, %r0, %r31
	set 0xc5bbd101, %r28
	stxa %r28, [%g0] 0x73
intvec_0_177:
	.word 0x39400001  ! 550: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 551: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe0d7e000  ! 552: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r16
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_178)) -> intp(0,1,3)
xir_0_178:
	.word 0xa980e001  ! 553: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0x9194e001  ! 554: WRPR_PIL_I	wrpr	%r19, 0x0001, %pil
	.word 0xad816001  ! 555: WR_SOFTINT_REG_I	wr	%r5, 0x0001, %softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_179)) -> intp(0,1,3)
xir_0_179:
	.word 0xa9836001  ! 556: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
tagged_0_180:
	tsubcctv %r26, 0x19dc, %r14
	.word 0xe007e001  ! 557: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0x97454000  ! 558: RD_CLEAR_SOFTINT	rd	%clear_softint, %r11
	.word 0xd6d7e020  ! 559: LDSHA_I	ldsha	[%r31, + 0x0020] %asi, %r11
	.word 0xd61fe001  ! 560: LDD_I	ldd	[%r31 + 0x0001], %r11
	otherw
	mov 0x31, %r30
	.word 0x91d0001e  ! 561: Tcc_R	ta	icc_or_xcc, %r0 + %r30
xir_0_181:
	.word 0xa9852001  ! 562: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
	.word 0xd68008a0  ! 563: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x22800001  ! 564: BE	be,a	<label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_182)) -> intp(0,1,3)
xir_0_182:
	.word 0xa9842001  ! 565: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0xd6d804a0  ! 566: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0x81460000  ! 567: RD_STICK_REG	stbar
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_183)) -> intp(0,1,3)
xir_0_183:
	.word 0xa9826001  ! 568: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	ta	T_CHANGE_PRIV	! macro
	.word 0x93902006  ! 570: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	invalw
	mov 0x35, %r30
	.word 0x91d0001e  ! 571: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_184)) -> intp(0,1,3)
xir_0_184:
	.word 0xa9812001  ! 572: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	.word 0xd737e001  ! 573: STQF_I	-	%f11, [0x0001, %r31]
	.word 0x93902000  ! 574: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_185)) -> intp(0,1,3)
xir_0_185:
	.word 0xa984e001  ! 575: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0x93902000  ! 576: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xd727c00a  ! 577: STF_R	st	%f11, [%r10, %r31]
	.word 0x28700001  ! 578: BPLEU	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_186)) -> intp(0,0,1)
intvec_0_186:
	.word 0x39400001  ! 579: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd6d804a0  ! 580: LDXA_R	ldxa	[%r0, %r0] 0x25, %r11
	.word 0xd64fe001  ! 581: LDSB_I	ldsb	[%r31 + 0x0001], %r11
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_187)) -> intp(0,1,3)
xir_0_187:
	.word 0xa981e001  ! 582: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
splash_cmpr_0_188:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1812001  ! 583: WR_STICK_REG_I	wr	%r4, 0x0001, %-
	.word 0x8cc4e001  ! 584: ADDCcc_I	addccc 	%r19, 0x0001, %r6
splash_lsu_0_189:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 585: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_190)) -> intp(0,1,3)
xir_0_190:
	.word 0xa981e001  ! 586: WR_SET_SOFTINT_I	wr	%r7, 0x0001, %set_softint
	.word 0xcc800c80  ! 587: LDUWA_R	lduwa	[%r0, %r0] 0x64, %r6
tagged_0_191:
	taddcctv %r3, 0x1186, %r16
	.word 0xcc07e001  ! 588: LDUW_I	lduw	[%r31 + 0x0001], %r6
	.word 0x8d9021cc  ! 589: WRPR_PSTATE_I	wrpr	%r0, 0x01cc, %pstate
	invalw
	mov 0x32, %r30
	.word 0x93d0001e  ! 590: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 591: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
splash_lsu_0_192:
	set 0x1d, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 592: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x2c700001  ! 593: BPNEG	<illegal instruction>
	.word 0xccd804a0  ! 594: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	.word 0xcc9fe001  ! 595: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r6
	set 0x544f4e0f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_193:
	.word 0x39400001  ! 596: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 597: WRFPRS_I	wr	%r0, 0x0000, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_194)) -> intp(0,1,3)
xir_0_194:
	.word 0xa980e001  ! 598: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0x93a449eb  ! 599: FDIVq	dis not found

	set 0x377896de, %r28
	stxa %r28, [%g0] 0x73
intvec_0_195:
	.word 0x39400001  ! 600: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_0_196:
	set 0x80000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 601: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0xd28804a0  ! 602: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	otherw
	mov 0xb1, %r30
	.word 0x91d0001e  ! 603: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x38800001  ! 604: BGU	bgu,a	<label_0x1>
	.word 0xd28804a0  ! 605: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0xd327c00b  ! 606: STF_R	st	%f9, [%r11, %r31]
DS_0_197:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 607: SAVE_R	save	%r31, %r0, %r31
tagged_0_198:
	tsubcctv %r5, 0x11b9, %r6
	.word 0xd207e001  ! 608: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd2c804a0  ! 609: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r9
	set 0xc3d2a222, %r28
	stxa %r28, [%g0] 0x73
intvec_0_199:
	.word 0x39400001  ! 610: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9020de  ! 611: WRPR_PSTATE_I	wrpr	%r0, 0x00de, %pstate
	.word 0x8d9029e7  ! 612: WRPR_PSTATE_I	wrpr	%r0, 0x09e7, %pstate
	.word 0xd257e001  ! 613: LDSH_I	ldsh	[%r31 + 0x0001], %r9
	.word 0xd28008a0  ! 614: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xb1844001  ! 615: WR_STICK_REG_R	wr	%r17, %r1, %-
	.word 0xa1902007  ! 616: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	otherw
	mov 0xb5, %r30
	.word 0x91d0001e  ! 617: Tcc_R	ta	icc_or_xcc, %r0 + %r30
mondo_0_201:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3e0] %asi
	.word 0x9d94c007  ! 618: WRPR_WSTATE_R	wrpr	%r19, %r7, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_202)) -> intp(0,0,15)
intvec_0_202:
	.word 0x39400001  ! 619: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa1902004  ! 620: WRPR_GL_I	wrpr	%r0, 0x0004, %-
mondo_0_203:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r20, [%r0+0x3c0] %asi
	.word 0x9d90c002  ! 621: WRPR_WSTATE_R	wrpr	%r3, %r2, %wstate
tagged_0_204:
	tsubcctv %r24, 0x14f9, %r21
	.word 0xd207e001  ! 622: LDUW_I	lduw	[%r31 + 0x0001], %r9
splash_htba_0_205:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 623: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8751c000  ! 624: RDPR_TL	rdpr	%tl, %r3
	.word 0xab80c000  ! 625: WR_CLEAR_SOFTINT_R	wr	%r3, %r0, %clear_softint
tagged_0_206:
	tsubcctv %r3, 0x1ea5, %r8
	.word 0xc607e001  ! 626: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0xc60fc000  ! 627: LDUB_R	ldub	[%r31 + %r0], %r3
	.word 0xa1902000  ! 628: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	otherw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 629: Tcc_R	ta	icc_or_xcc, %r0 + %r30
splash_lsu_0_207:
	set 0x19, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 630: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_208)) -> intp(0,1,3)
xir_0_208:
	.word 0xa984e001  ! 631: WR_SET_SOFTINT_I	wr	%r19, 0x0001, %set_softint
	.word 0xc677c000  ! 632: STX_R	stx	%r3, [%r31 + %r0]
mondo_0_209:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c8] %asi
	.word 0x9d918010  ! 633: WRPR_WSTATE_R	wrpr	%r6, %r16, %wstate
tagged_0_210:
	tsubcctv %r24, 0x1073, %r14
	.word 0xc607e001  ! 634: LDUW_I	lduw	[%r31 + 0x0001], %r3
	.word 0x8d902367  ! 635: WRPR_PSTATE_I	wrpr	%r0, 0x0367, %pstate
	.word 0x8d902804  ! 636: WRPR_PSTATE_I	wrpr	%r0, 0x0804, %pstate
	otherw
	mov 0x35, %r30
	.word 0x91d0001e  ! 637: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	set 0x5529f074, %r28
	stxa %r28, [%g0] 0x73
intvec_0_211:
	.word 0x39400001  ! 638: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9b494000  ! 639: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0xa1902001  ! 640: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x8d9028b6  ! 641: WRPR_PSTATE_I	wrpr	%r0, 0x08b6, %pstate
	.word 0xa1902009  ! 642: WRPR_GL_I	wrpr	%r0, 0x0009, %-
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_212)) -> intp(0,0,24)
intvec_0_212:
	.word 0x39400001  ! 643: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 644: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8790231f  ! 645: WRPR_TT_I	wrpr	%r0, 0x031f, %tt
	.word 0xda1fe001  ! 646: LDD_I	ldd	[%r31 + 0x0001], %r13
	.word 0xda57c000  ! 647: LDSH_R	ldsh	[%r31 + %r0], %r13
	.word 0x81460000  ! 648: RD_STICK_REG	stbar
	.word 0x9545c000  ! 649: RD_TICK_CMPR_REG	rd	%-, %r10
	.word 0xd47fe001  ! 650: SWAP_I	swap	%r10, [%r31 + 0x0001]
	.word 0x84c22001  ! 651: ADDCcc_I	addccc 	%r8, 0x0001, %r2
	.word 0xab84c007  ! 652: WR_CLEAR_SOFTINT_R	wr	%r19, %r7, %clear_softint
	.word 0xc4800b00  ! 653: LDUWA_R	lduwa	[%r0, %r0] 0x58, %r2
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc4cfe020  ! 655: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r2
	.word 0xc4cfe020  ! 656: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r2
DS_0_213:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 657: SAVE_R	save	%r31, %r0, %r31
	.word 0xa8c0e001  ! 658: ADDCcc_I	addccc 	%r3, 0x0001, %r20
	.word 0x95508000  ! 659: RDPR_TSTATE	<illegal instruction>
tagged_0_214:
	tsubcctv %r18, 0x16b4, %r6
	.word 0xd407e001  ! 660: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xd407c000  ! 661: LDUW_R	lduw	[%r31 + %r0], %r10
	.word 0xd48008a0  ! 662: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x87902016  ! 663: WRPR_TT_I	wrpr	%r0, 0x0016, %tt
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_215)) -> intp(0,1,3)
xir_0_215:
	.word 0xa980a001  ! 664: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0xd44fe001  ! 665: LDSB_I	ldsb	[%r31 + 0x0001], %r10
	.word 0xa1902004  ! 666: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93902004  ! 667: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0xd527c007  ! 668: STF_R	st	%f10, [%r7, %r31]
	.word 0xa7514000  ! 669: RDPR_TBA	rdpr	%tba, %r19
	.word 0xe6800bc0  ! 670: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r19
	invalw
	mov 0xb3, %r30
	.word 0x93d0001e  ! 671: Tcc_R	tne	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_216)) -> intp(0,1,3)
xir_0_216:
	.word 0xa9812001  ! 672: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	.word 0xe647e001  ! 673: LDSW_I	ldsw	[%r31 + 0x0001], %r19
	.word 0x8f464000  ! 674: RD_STICK_CMPR_REG	rd	%-, %r7
	.word 0x8780204f  ! 675: WRASI_I	wr	%r0, 0x004f, %asi
	.word 0xce77c000  ! 676: STX_R	stx	%r7, [%r31 + %r7]
	.word 0x91902001  ! 677: WRPR_PIL_I	wrpr	%r0, 0x0001, %pil
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_217)) -> intp(0,1,3)
xir_0_217:
	.word 0xa9826001  ! 678: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	.word 0x91d02035  ! 679: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	.word 0x91d020b4  ! 681: Tcc_I	ta	icc_or_xcc, %r0 + 180
	.word 0xce3fe001  ! 682: STD_I	std	%r7, [%r31 + 0x0001]
splash_lsu_0_218:
	set 0x17, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 683: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
DS_0_219:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 684: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902be2  ! 685: WRPR_PSTATE_I	wrpr	%r0, 0x0be2, %pstate
	.word 0x93902000  ! 686: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	invalw
	mov 0x33, %r30
	.word 0x93d0001e  ! 687: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93902002  ! 688: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_220)) -> intp(0,0,31)
intvec_0_220:
	.word 0x39400001  ! 689: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	otherw
	mov 0x34, %r30
	.word 0x93d0001e  ! 690: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	set 0x84db87b6, %r28
	stxa %r28, [%g0] 0x73
intvec_0_221:
	.word 0x39400001  ! 691: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8f50c000  ! 692: RDPR_TT	rdpr	%tt, %r7
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_222)) -> intp(0,1,3)
xir_0_222:
	.word 0xa980e001  ! 693: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
	.word 0xce3fc007  ! 694: STD_R	std	%r7, [%r31 + %r7]
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_223)) -> intp(0,1,3)
xir_0_223:
	.word 0xa9826001  ! 695: WR_SET_SOFTINT_I	wr	%r9, 0x0001, %set_softint
	.word 0xa7454000  ! 696: RD_CLEAR_SOFTINT	rd	%clear_softint, %r19
	invalw
	mov 0x32, %r30
	.word 0x91d0001e  ! 697: Tcc_R	ta	icc_or_xcc, %r0 + %r30
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_224)) -> intp(0,0,10)
intvec_0_224:
	.word 0x39400001  ! 698: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879020b9  ! 699: WRPR_TT_I	wrpr	%r0, 0x00b9, %tt
	.word 0xe647c000  ! 700: LDSW_R	ldsw	[%r31 + %r0], %r19
	.word 0xe6dfe010  ! 701: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r19
	.word 0xe647c000  ! 702: LDSW_R	ldsw	[%r31 + %r0], %r19
DS_0_225:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 703: SAVE_R	save	%r31, %r0, %r31
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_226)) -> intp(0,1,3)
xir_0_226:
	.word 0xa982a001  ! 704: WR_SET_SOFTINT_I	wr	%r10, 0x0001, %set_softint
tagged_0_227:
	taddcctv %r6, 0x1df3, %r5
	.word 0xe607e001  ! 705: LDUW_I	lduw	[%r31 + 0x0001], %r19
	.word 0x95a20dd0  ! 706: FdMULq	fdmulq	
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_228)) -> intp(0,0,16)
intvec_0_228:
	.word 0x39400001  ! 707: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_lsu_0_229:
	set 0x1f, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 708: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xa1514000  ! 709: RDPR_TBA	rdpr	%tba, %r16
	.word 0x8d9024ab  ! 710: WRPR_PSTATE_I	wrpr	%r0, 0x04ab, %pstate
	invalw
	mov 0x34, %r30
	.word 0x91d0001e  ! 711: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe08804a0  ! 712: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
	.word 0xe01fc000  ! 713: LDD_R	ldd	[%r31 + %r0], %r16
	.word 0xe01fe001  ! 714: LDD_I	ldd	[%r31 + 0x0001], %r16
	.word 0xa1902004  ! 715: WRPR_GL_I	wrpr	%r0, 0x0004, %-
tagged_0_230:
	tsubcctv %r18, 0x1354, %r10
	.word 0xe007e001  ! 716: LDUW_I	lduw	[%r31 + 0x0001], %r16
	.word 0xe08008a0  ! 717: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r16
	.word 0xa190200f  ! 718: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x91454000  ! 719: RD_CLEAR_SOFTINT	rd	%clear_softint, %r8
	.word 0xd04fc000  ! 720: LDSB_R	ldsb	[%r31 + %r0], %r8
mondo_0_231:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3d0] %asi
	.word 0x9d92c006  ! 721: WRPR_WSTATE_R	wrpr	%r11, %r6, %wstate
	.word 0x93902004  ! 722: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d802000  ! 724: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99508000  ! 725: RDPR_TSTATE	rdpr	%tstate, %r12
	.word 0x8d802000  ! 726: WRFPRS_I	wr	%r0, 0x0000, %fprs
DS_0_232:
	nop
	not %g0, %g2
	.word 0x9d902000  ! 727: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x87802055  ! 728: WRASI_I	wr	%r0, 0x0055, %asi
mondo_0_233:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r4, [%r0+0x3c0] %asi
	.word 0x9d90400b  ! 729: WRPR_WSTATE_R	wrpr	%r1, %r11, %wstate
	.word 0x8d902320  ! 730: WRPR_PSTATE_I	wrpr	%r0, 0x0320, %pstate
	.word 0x8d802000  ! 731: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902000  ! 732: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_234)) -> intp(0,0,23)
intvec_0_234:
	.word 0x39400001  ! 733: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_235)) -> intp(0,1,3)
xir_0_235:
	.word 0xa9836001  ! 734: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_236)) -> intp(0,1,3)
xir_0_236:
	.word 0xa980a001  ! 735: WR_SET_SOFTINT_I	wr	%r2, 0x0001, %set_softint
	.word 0x93902002  ! 736: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902006  ! 737: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902716  ! 738: WRPR_PSTATE_I	wrpr	%r0, 0x0716, %pstate
	.word 0x8790213b  ! 739: WRPR_TT_I	wrpr	%r0, 0x013b, %tt
	.word 0x8790211c  ! 740: WRPR_TT_I	wrpr	%r0, 0x011c, %tt
	.word 0xd89fe001  ! 741: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r12
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xb1818014  ! 742: WR_STICK_REG_R	wr	%r6, %r20, %-
	.word 0x8790213f  ! 743: WRPR_TT_I	wrpr	%r0, 0x013f, %tt
	invalw
	mov 0xb0, %r30
	.word 0x91d0001e  ! 744: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd88008a0  ! 745: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r12
	.word 0xd83fe001  ! 746: STD_I	std	%r12, [%r31 + 0x0001]
splash_cmpr_0_238:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1816001  ! 747: WR_STICK_REG_I	wr	%r5, 0x0001, %-
splash_lsu_0_239:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 748: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
tagged_0_240:
	tsubcctv %r4, 0x1ab5, %r15
	.word 0xd807e001  ! 749: LDUW_I	lduw	[%r31 + 0x0001], %r12
	set 0x61b18847, %r28
	stxa %r28, [%g0] 0x73
intvec_0_241:
	.word 0x39400001  ! 750: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802004  ! 751: WRASI_I	wr	%r0, 0x0004, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_242)) -> intp(0,0,9)
intvec_0_242:
	.word 0x39400001  ! 752: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91d020b5  ! 753: Tcc_I	ta	icc_or_xcc, %r0 + 181
DS_0_243:
	nop
	not %g0, %g2
	.word 0x9d902003  ! 754: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_244)) -> intp(0,1,3)
xir_0_244:
	.word 0xa9836001  ! 755: WR_SET_SOFTINT_I	wr	%r13, 0x0001, %set_softint
DS_0_245:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xa5a00544  ! 1: FSQRTd	fsqrt	
	.word 0x8ba48829  ! 756: FADDs	fadds	%f18, %f9, %f5
	.word 0x87802055  ! 757: WRASI_I	wr	%r0, 0x0055, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_246)) -> intp(0,0,0)
intvec_0_246:
	.word 0x39400001  ! 758: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xca07c000  ! 759: LDUW_R	lduw	[%r31 + %r0], %r5
	.word 0x81982487  ! 760: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0487, %hpstate
	.word 0x85a489ab  ! 761: FDIVs	fdivs	%f18, %f11, %f2
	.word 0xa5454000  ! 762: RD_CLEAR_SOFTINT	rd	%clear_softint, %r18
	.word 0xe4900e40  ! 763: LDUHA_R	lduha	[%r0, %r0] 0x72, %r18
	.word 0xe4d804a0  ! 764: LDXA_R	ldxa	[%r0, %r0] 0x25, %r18
	.word 0xe597e001  ! 765: LDQFA_I	-	[%r31, 0x0001], %f18
	.word 0x91d02032  ! 766: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x879023aa  ! 767: WRPR_TT_I	wrpr	%r0, 0x03aa, %tt
	.word 0x93d02035  ! 768: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xe4880e80  ! 769: LDUBA_R	lduba	[%r0, %r0] 0x74, %r18
	.word 0x81510000  ! 770: RDPR_TICK	rdpr	%tick, %r0
tagged_0_247:
	taddcctv %r9, 0x19f3, %r6
	.word 0xe407e001  ! 771: LDUW_I	lduw	[%r31 + 0x0001], %r18
	.word 0x38800001  ! 772: BGU	bgu,a	<label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_248)) -> intp(0,0,6)
intvec_0_248:
	.word 0x39400001  ! 773: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_249)) -> intp(0,1,3)
xir_0_249:
	.word 0xa9802001  ! 774: WR_SET_SOFTINT_I	wr	%r0, 0x0001, %set_softint
	.word 0xe4880e80  ! 775: LDUBA_R	lduba	[%r0, %r0] 0x74, %r18
	.word 0x8790225d  ! 776: WRPR_TT_I	wrpr	%r0, 0x025d, %tt
	.word 0xa7a00545  ! 777: FSQRTd	fsqrt	
change_to_randtl_0_250:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_250:
	.word 0x8f902002  ! 778: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
mondo_0_251:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r16, [%r0+0x3c0] %asi
	.word 0x9d948002  ! 779: WRPR_WSTATE_R	wrpr	%r18, %r2, %wstate
	invalw
	mov 0xb3, %r30
	.word 0x91d0001e  ! 780: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xe6c7e030  ! 781: LDSWA_I	ldswa	[%r31, + 0x0030] %asi, %r19
	.word 0xa3500000  ! 782: RDPR_TPC	rdpr	%tpc, %r17
	.word 0x87802080  ! 783: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x93d02035  ! 784: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xe2dfe010  ! 785: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r17
	.word 0x86f86001  ! 786: SDIVcc_I	sdivcc 	%r1, 0x0001, %r3
	.word 0x87802080  ! 787: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x36700001  ! 788: BPGE	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_252)) -> intp(0,1,3)
xir_0_252:
	.word 0xa9842001  ! 789: WR_SET_SOFTINT_I	wr	%r16, 0x0001, %set_softint
	.word 0x93902007  ! 790: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x89514000  ! 791: RDPR_TBA	rdpr	%tba, %r4
mondo_0_253:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r17, [%r0+0x3c0] %asi
	.word 0x9d948010  ! 792: WRPR_WSTATE_R	wrpr	%r18, %r16, %wstate
	.word 0xc91fe001  ! 793: LDDF_I	ldd	[%r31, 0x0001], %f4
tagged_0_254:
	tsubcctv %r16, 0x1225, %r19
	.word 0xc807e001  ! 794: LDUW_I	lduw	[%r31 + 0x0001], %r4
DS_0_255:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xc7334011  ! 1: STQF_R	-	%f3, [%r17, %r13]
	normalw
	.word 0x81458000  ! 795: RD_SOFTINT_REG	stbar
	.word 0x8550c000  ! 796: RDPR_TT	rdpr	%tt, %r2
	.word 0xc48008a0  ! 797: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
change_to_randtl_0_256:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_256:
	.word 0x8f902002  ! 798: WRPR_TL_I	wrpr	%r0, 0x0002, %tl
	.word 0xc48008a0  ! 799: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x8b51c000  ! 800: RDPR_TL	rdpr	%tl, %r5
	set 0x2f9729ff, %r28
	stxa %r28, [%g0] 0x73
intvec_0_257:
	.word 0x39400001  ! 801: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x26800001  ! 802: BL	bl,a	<label_0x1>
	.word 0x90850006  ! 803: ADDcc_R	addcc 	%r20, %r6, %r8
	.word 0xa1902009  ! 804: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd03fe001  ! 805: STD_I	std	%r8, [%r31 + 0x0001]
	.word 0x91d02032  ! 806: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x91504000  ! 807: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x8150c000  ! 808: RDPR_TT	rdpr	%tt, %r0
	.word 0x93d02034  ! 809: Tcc_I	tne	icc_or_xcc, %r0 + 52
splash_lsu_0_258:
	set 0x3, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 810: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x93520000  ! 811: RDPR_PIL	rdpr	%pil, %r9
	set 0x76ed90de, %r28
	stxa %r28, [%g0] 0x73
intvec_0_259:
	.word 0x39400001  ! 812: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x87802016  ! 813: WRASI_I	wr	%r0, 0x0016, %asi
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_260)) -> intp(0,0,30)
intvec_0_260:
	.word 0x39400001  ! 814: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0x9bb84b4f, %r28
	stxa %r28, [%g0] 0x73
intvec_0_261:
	.word 0x39400001  ! 815: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa9818008  ! 816: WR_SET_SOFTINT_R	wr	%r6, %r8, %set_softint
	.word 0xd2bfe001  ! 817: STDA_I	stda	%r9, [%r31 + 0x0001] %asi
	ta	T_CHANGE_PRIV	! macro
tagged_0_262:
	tsubcctv %r13, 0x1158, %r24
	.word 0xd207e001  ! 819: LDUW_I	lduw	[%r31 + 0x0001], %r9
	.word 0xd2cfe020  ! 820: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r9
	.word 0xd247c000  ! 821: LDSW_R	ldsw	[%r31 + %r0], %r9
	.word 0x24800001  ! 822: BLE	ble,a	<label_0x1>
	.word 0x2c700001  ! 823: BPNEG	<illegal instruction>
mondo_0_263:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r6, [%r0+0x3c8] %asi
	.word 0x9d950004  ! 824: WRPR_WSTATE_R	wrpr	%r20, %r4, %wstate
	.word 0xd337c004  ! 825: STQF_R	-	%f9, [%r4, %r31]
	.word 0xd31fe001  ! 826: LDDF_I	ldd	[%r31, 0x0001], %f9
	.word 0xa1464000  ! 827: RD_STICK_CMPR_REG	rd	%-, %r16
change_to_randtl_0_264:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_264:
	.word 0x8f902000  ! 828: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	.word 0xe197e001  ! 829: LDQFA_I	-	[%r31, 0x0001], %f16
splash_lsu_0_265:
	set 0x1b, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 830: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 831: WRFPRS_I	wr	%r0, 0x0000, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_266)) -> intp(0,0,5)
intvec_0_266:
	.word 0x39400001  ! 832: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe047e001  ! 833: LDSW_I	ldsw	[%r31 + 0x0001], %r16
	.word 0xab810001  ! 834: WR_CLEAR_SOFTINT_R	wr	%r4, %r1, %clear_softint
splash_lsu_0_267:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 835: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 836: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe08804a0  ! 837: LDUBA_R	lduba	[%r0, %r0] 0x25, %r16
	.word 0x879022ae  ! 838: WRPR_TT_I	wrpr	%r0, 0x02ae, %tt
splash_cmpr_0_268:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	wrhpr %g1, %g0, %hsys_tick_cmpr
	.word 0xb1816001  ! 839: WR_STICK_REG_I	wr	%r5, 0x0001, %-
	.word 0xa3520000  ! 840: RDPR_PIL	<illegal instruction>
	.word 0x93d020b4  ! 841: Tcc_I	tne	icc_or_xcc, %r0 + 180
splash_cmpr_0_269:
	nop
	mov 1, %g2
	sllx %g2, 63, %g2
	or %g1, %g2, %g1
	.word 0xaf800001  ! 1: WR_TICK_CMPR_REG_R	wr	%r0, %r1, %-
	.word 0xb182a001  ! 842: WR_STICK_REG_I	wr	%r10, 0x0001, %-
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_270)) -> intp(0,1,3)
xir_0_270:
	.word 0xa984a001  ! 843: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0xe2800ac0  ! 844: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r17
mondo_0_271:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d94c012  ! 845: WRPR_WSTATE_R	wrpr	%r19, %r18, %wstate
	.word 0x879021f9  ! 846: WRPR_TT_I	wrpr	%r0, 0x01f9, %tt
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_272)) -> intp(0,0,16)
intvec_0_272:
	.word 0x39400001  ! 847: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x879020ea  ! 848: WRPR_TT_I	wrpr	%r0, 0x00ea, %tt
DS_0_273:
	nop
	not %g0, %g2
	.word 0x9d902003  ! 849: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x836a0004  ! 850: SDIVX_R	sdivx	%r8, %r4, %r1
	.word 0xa190200c  ! 851: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x91d02033  ! 852: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902002  ! 853: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d802000  ! 854: WRFPRS_I	wr	%r0, 0x0000, %fprs
tagged_0_274:
	tsubcctv %r8, 0x1e64, %r17
	.word 0xc207e001  ! 855: LDUW_I	lduw	[%r31 + 0x0001], %r1
	.word 0x87802080  ! 856: WRASI_I	wr	%r0, 0x0080, %asi
	set 0xc5b4fe0b, %r28
	stxa %r28, [%g0] 0x73
intvec_0_275:
	.word 0x39400001  ! 857: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_276)) -> intp(0,1,3)
xir_0_276:
	.word 0xa981a001  ! 858: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
change_to_randtl_0_277:
	ta	T_CHANGE_HPRIV	! macro
done_change_to_randtl_0_277:
	.word 0x8f902004  ! 859: WRPR_TL_I	wrpr	%r0, 0x0004, %tl
	.word 0x87802020  ! 860: WRASI_I	wr	%r0, 0x0020, %asi
	.word 0xc28008a0  ! 861: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0xa190200b  ! 862: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xc2d7e000  ! 863: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r1
	ta	T_CHANGE_HPRIV	! macro
	.word 0x93902000  ! 865: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_278)) -> intp(0,0,23)
intvec_0_278:
	.word 0x39400001  ! 866: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93d02035  ! 867: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xa190200d  ! 868: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x9b520000  ! 869: RDPR_PIL	rdpr	%pil, %r13
DS_0_279:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 870: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9551c000  ! 871: RDPR_TL	rdpr	%tl, %r10
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_280)) -> intp(0,1,3)
xir_0_280:
	.word 0xa980e001  ! 872: WR_SET_SOFTINT_I	wr	%r3, 0x0001, %set_softint
mondo_0_281:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r18, [%r0+0x3c0] %asi
	.word 0x9d93400b  ! 873: WRPR_WSTATE_R	wrpr	%r13, %r11, %wstate
	.word 0xd597e001  ! 874: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x8d902422  ! 875: WRPR_PSTATE_I	wrpr	%r0, 0x0422, %pstate
tagged_0_282:
	tsubcctv %r15, 0x1288, %r9
	.word 0xd407e001  ! 876: LDUW_I	lduw	[%r31 + 0x0001], %r10
	.word 0xa1902000  ! 877: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x95508000  ! 878: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0x93902006  ! 879: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xd49004a0  ! 880: LDUHA_R	lduha	[%r0, %r0] 0x25, %r10
	.word 0x8d902956  ! 881: WRPR_PSTATE_I	wrpr	%r0, 0x0956, %pstate
DS_0_283:
	.word 0x34800001  ! 1: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 882: SAVE_R	save	%r31, %r0, %r31
	.word 0x83450000  ! 883: RD_SET_SOFTINT	rd	%set_softint, %r1
	.word 0x93902004  ! 884: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x22800001  ! 885: BE	be,a	<label_0x1>
	.word 0x879023f8  ! 886: WRPR_TT_I	wrpr	%r0, 0x03f8, %tt
splash_tba_0_284:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 887: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0x32800001  ! 888: BNE	bne,a	<label_0x1>
splash_lsu_0_285:
	set 0xb, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 889: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
change_to_randtl_0_286:
	ta	T_CHANGE_PRIV	! macro
done_change_to_randtl_0_286:
	.word 0x8f902000  ! 890: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
tagged_0_287:
	taddcctv %r9, 0x1f28, %r11
	.word 0xc207e001  ! 891: LDUW_I	lduw	[%r31 + 0x0001], %r1
DS_0_288:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.xword 0xeb782861	! Random illegal ?
	.word 0xe714c003  ! 1: LDQF_R	-	[%r19, %r3], %f19
	.word 0x91a1c821  ! 892: FADDs	fadds	%f7, %f1, %f8
	.word 0x93902004  ! 893: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
DS_0_289:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	pdist %f20, %f2, %f12
	.word 0xa3b0c30b  ! 894: ALIGNADDRESS	alignaddr	%r3, %r11, %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_290)) -> intp(0,0,24)
intvec_0_290:
	.word 0x39400001  ! 895: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xe2c804a0  ! 896: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
	ta	T_CHANGE_PRIV	! macro
	.word 0x20800001  ! 898: BN	bn,a	<label_0x1>
	.word 0xe28008a0  ! 899: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	set 0x73661c2c, %r28
	stxa %r28, [%g0] 0x73
intvec_0_291:
	.word 0x39400001  ! 900: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d802000  ! 901: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xe2c7e010  ! 902: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r17
	.word 0xe28008a0  ! 903: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe28008a0  ! 904: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r17
	.word 0xe2d7e000  ! 905: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_292)) -> intp(0,0,9)
intvec_0_292:
	.word 0x39400001  ! 906: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0xdad9696a, %r28
	stxa %r28, [%g0] 0x73
intvec_0_293:
	.word 0x39400001  ! 907: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
splash_htba_0_294:
	set 0x003b0000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_HPRIV
	set 0x00380000, %r2
	.word 0x8b980002  ! 908: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_295)) -> intp(0,1,3)
xir_0_295:
	.word 0xa9812001  ! 909: WR_SET_SOFTINT_I	wr	%r4, 0x0001, %set_softint
	.word 0xe237c00b  ! 910: STH_R	sth	%r17, [%r31 + %r11]
	.word 0x93902000  ! 911: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d902be7  ! 912: WRPR_PSTATE_I	wrpr	%r0, 0x0be7, %pstate
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_296)) -> intp(0,1,3)
xir_0_296:
	.word 0xa981a001  ! 913: WR_SET_SOFTINT_I	wr	%r6, 0x0001, %set_softint
splash_lsu_0_297:
	set 0x15, %r2
	stxa %r2, [%r0] ASI_LSU_CONTROL
	.word 0x3d400001  ! 914: FBPULE	fbule,a,pn	%fcc0, <label_0x1>
	.word 0xe2c804a0  ! 915: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r17
	.word 0xe2d804a0  ! 916: LDXA_R	ldxa	[%r0, %r0] 0x25, %r17
	.word 0xe327e001  ! 917: STF_I	st	%f17, [0x0001, %r31]
	.word 0xe2d804a0  ! 918: LDXA_R	ldxa	[%r0, %r0] 0x25, %r17
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_298)) -> intp(0,0,30)
intvec_0_298:
	.word 0x39400001  ! 919: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x8d9023e2  ! 920: WRPR_PSTATE_I	wrpr	%r0, 0x03e2, %pstate
	.word 0xe2cfe000  ! 921: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r17
	.word 0x81460000  ! 922: RD_STICK_REG	stbar
	.word 0x87902024  ! 923: WRPR_TT_I	wrpr	%r0, 0x0024, %tt
DS_0_299:
	.word 0x20800001  ! 1: BN	bn,a	<label_0x1>
	.word 0xc9342001  ! 1: STQF_I	-	%f4, [0x0001, %r16]
	normalw
	.word 0xa9458000  ! 924: RD_SOFTINT_REG	rd	%softint, %r20
mondo_0_300:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r19, [%r0+0x3c0] %asi
	.word 0x9d920008  ! 925: WRPR_WSTATE_R	wrpr	%r8, %r8, %wstate
	.word 0x2c800001  ! 926: BNEG	bneg,a	<label_0x1>
	.word 0x93902005  ! 927: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xad812001  ! 928: WR_SOFTINT_REG_I	wr	%r4, 0x0001, %softint
	set 0xc3cac967, %r28
	stxa %r28, [%g0] 0x73
intvec_0_301:
	.word 0x39400001  ! 929: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xa190200b  ! 930: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	invalw
	mov 0xb5, %r30
	.word 0x93d0001e  ! 931: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xe997e001  ! 932: LDQFA_I	-	[%r31, 0x0001], %f20
	.word 0xe89004a0  ! 933: LDUHA_R	lduha	[%r0, %r0] 0x25, %r20
	.word 0x91946001  ! 934: WRPR_PIL_I	wrpr	%r17, 0x0001, %pil
	.word 0x8d902575  ! 935: WRPR_PSTATE_I	wrpr	%r0, 0x0575, %pstate
	.word 0x2c800001  ! 936: BNEG	bneg,a	<label_0x1>
	.word 0xa1902003  ! 937: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x9f802001  ! 938: SIR	sir	0x0001
	.word 0xe937e001  ! 939: STQF_I	-	%f20, [0x0001, %r31]
	.word 0x87802004  ! 940: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0xe88008a0  ! 941: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r20
	.word 0x8790214e  ! 942: WRPR_TT_I	wrpr	%r0, 0x014e, %tt
	.word 0xe80fc000  ! 943: LDUB_R	ldub	[%r31 + %r0], %r20
	.word 0xe88804a0  ! 944: LDUBA_R	lduba	[%r0, %r0] 0x25, %r20
	.word 0x38800001  ! 945: BGU	bgu,a	<label_0x1>
	.word 0x93902005  ! 946: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xe80fc000  ! 947: LDUB_R	ldub	[%r31 + %r0], %r20
	.word 0x87802088  ! 948: WRASI_I	wr	%r0, 0x0088, %asi
	.word 0x20800001  ! 949: BN	bn,a	<label_0x1>
	.word 0x87494000  ! 950: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0xc64fc000  ! 951: LDSB_R	ldsb	[%r31 + %r0], %r3
	.word 0x22700001  ! 952: BPE	<illegal instruction>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_302)) -> intp(0,0,23)
intvec_0_302:
	.word 0x39400001  ! 953: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x9f802001  ! 954: SIR	sir	0x0001
	.word 0xc6d804a0  ! 955: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_303)) -> intp(0,1,3)
xir_0_303:
	.word 0xa9852001  ! 956: WR_SET_SOFTINT_I	wr	%r20, 0x0001, %set_softint
mondo_0_304:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r12, [%r0+0x3c8] %asi
	.word 0x9d950002  ! 957: WRPR_WSTATE_R	wrpr	%r20, %r2, %wstate
splash_htba_0_305:
	set 0x80000, %r2
	ld [%r2+%r0], %r1
	ta T_CHANGE_HPRIV
	set 0x80000, %r2
	.word 0x8b980002  ! 958: WRHPR_HTBA_R	wrhpr	%r0, %r2, %htba
	.word 0x8f902001  ! 1: WRPR_TL_I	wrpr	%r0, 0x0001, %tl
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x89824002  ! 959: WRTICK_R	wr	%r9, %r2, %tick
	.word 0x8fa000cb  ! 960: FNEGd	fnegd	%f42, %f38
	.word 0xce9fc020  ! 961: LDDA_R	ldda	[%r31, %r0] 0x01, %r7
	.word 0x99902005  ! 962: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0xa190200f  ! 963: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x87802004  ! 964: WRASI_I	wr	%r0, 0x0004, %asi
	set 0x5edf89f8, %r28
	stxa %r28, [%g0] 0x73
intvec_0_307:
	.word 0x39400001  ! 965: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93902002  ! 966: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa980c008  ! 967: WR_SET_SOFTINT_R	wr	%r3, %r8, %set_softint
	.word 0xa1902008  ! 968: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x8d802000  ! 969: WRFPRS_I	wr	%r0, 0x0000, %fprs
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_308)) -> intp(0,0,15)
intvec_0_308:
	.word 0x39400001  ! 970: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	set 0xefdce143, %r28
	stxa %r28, [%g0] 0x73
intvec_0_309:
	.word 0x39400001  ! 971: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x91922001  ! 972: WRPR_PIL_I	wrpr	%r8, 0x0001, %pil
	.word 0x91450000  ! 973: RD_SET_SOFTINT	rd	%set_softint, %r8
	.word 0x91d020b5  ! 974: Tcc_I	ta	icc_or_xcc, %r0 + 181
!$EV trig_pc_d(1, @VA(.MAIN.xir_0_310)) -> intp(0,1,3)
xir_0_310:
	.word 0xa984a001  ! 975: WR_SET_SOFTINT_I	wr	%r18, 0x0001, %set_softint
	.word 0x8d902ceb  ! 976: WRPR_PSTATE_I	wrpr	%r0, 0x0ceb, %pstate
	.word 0xd0c004a0  ! 977: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x93902002  ! 978: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xd0cfe010  ! 979: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r8
	set 0x57971dac, %r28
	stxa %r28, [%g0] 0x73
intvec_0_311:
	.word 0x39400001  ! 980: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0xd01fe001  ! 981: LDD_I	ldd	[%r31 + 0x0001], %r8
	.word 0x9351c000  ! 982: RDPR_TL	rdpr	%tl, %r9
	.word 0xd2d7e030  ! 983: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r9
DS_0_312:
	.word 0x32800001  ! 1: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 984: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d802004  ! 985: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x22700001  ! 986: BPE	<illegal instruction>
mondo_0_313:
	.word 0x87802025  ! 1: WRASI_I	wr	%r0, 0x0025, %asi

    stxa %r7, [%r0+0x3d8] %asi
	.word 0x9d94c00b  ! 987: WRPR_WSTATE_R	wrpr	%r19, %r11, %wstate
	.word 0xd2800a60  ! 988: LDUWA_R	lduwa	[%r0, %r0] 0x53, %r9
	invalw
	mov 0x30, %r30
	.word 0x83d0001e  ! 989: Tcc_R	te	icc_or_xcc, %r0 + %r30
splash_tba_0_314:
	set 0x120000, %r2
	st %r1, [%r2+%r0]
	ta T_CHANGE_PRIV
	set 0x120000, %r2
	.word 0x8b900002  ! 990: WRPR_TBA_R	wrpr	%r0, %r2, %tba
	.word 0xd20fe001  ! 991: LDUB_I	ldub	[%r31 + 0x0001], %r9
	.word 0x8f902000  ! 1: WRPR_TL_I	wrpr	%r0, 0x0000, %tl
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89844003  ! 992: WRTICK_R	wr	%r17, %r3, %tick
	.word 0x91d02032  ! 993: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x28800001  ! 994: BLEU	bleu,a	<label_0x1>
!$EV trig_pc_d(1, @VA(.MAIN.intvec_0_316)) -> intp(0,0,23)
intvec_0_316:
	.word 0x39400001  ! 995: FBPUGE	fbuge,a,pn	%fcc0, <label_0x1>
	.word 0x93a00554  ! 996: FSQRTd	fsqrt	
DS_0_317:
	.word 0x22800001  ! 1: BE	be,a	<label_0x1>
	.word 0xd1326001  ! 1: STQF_I	-	%f8, [0x0001, %r9]
	normalw
	.word 0xa9458000  ! 997: RD_SOFTINT_REG	rd	%softint, %r20
	invalw
	mov 0x30, %r30
	.word 0x91d0001e  ! 998: Tcc_R	ta	icc_or_xcc, %r0 + %r30
SECTION .MAIN
.text
diag_finish:
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

.global user_data_start
.data
user_data_start:

	.xword	0xc16869251896646f
	.xword	0x1a2550c4d4105f74
	.xword	0xa40f4c066197c723
	.xword	0x4fc3b8d0fb546010
	.xword	0x076633668b26c727
	.xword	0x684895a21cd54812
	.xword	0x29e75afffc935c4e
	.xword	0x18892b165ed91d56
	.xword	0xefea599bc33cf760
	.xword	0xcd0de9244f4ea9cd
	.xword	0x2f9388d82de0ab36
	.xword	0xc537c16108dd2b5d
	.xword	0x191c907ae717ed20
	.xword	0x06c09727d33a27ba
	.xword	0x29ff5482f47c6786
	.xword	0x52622392ba03c434
	.xword	0xf83e016851725fad
	.xword	0x89e70721e9faca03
	.xword	0xd746345fbd31faad
	.xword	0xa2c8719fbe68a6bc
	.xword	0x43d8b61a8f732b4f
	.xword	0x15ca939029f306a0
	.xword	0x058f47fa0963683b
	.xword	0x5105bc5f4a22c2c9
	.xword	0x9e7f1d5ffd5ef542
	.xword	0xae53c35d38da025e
	.xword	0x5f7b41b4c8f100e6
	.xword	0x15e4e14da7edb483
	.xword	0xeeffb4e7c1f6b1b4
	.xword	0x8e95272d02153039
	.xword	0x3313b1560be7a7c3
	.xword	0xcf7ade1361fb0b76
	.xword	0xcaf136ed72977b1d
	.xword	0x071be5446e694998
	.xword	0xe9043a982163017a
	.xword	0x36cea78af0d981bf
	.xword	0xf4ca5a3a827f4e51
	.xword	0x724a7ebe9057f1de
	.xword	0x0c663966186458f1
	.xword	0xb6d0d2c0db8aa4e9
	.xword	0xf248ecb88d7a0442
	.xword	0x2c649105363ebdbd
	.xword	0x22016e4f9471703c
	.xword	0x613d5dbad2af341d
	.xword	0x96a6df3329a0806d
	.xword	0x98bfa0b7edfc9f71
	.xword	0xef80edc8694ae9c5
	.xword	0xecffb03ce95a1d33
	.xword	0x69f7808ac1f0797c
	.xword	0x454ab049b52f4919
	.xword	0xbd89fd71d2e2a492
	.xword	0x67dea3b9a3435da8
	.xword	0x14e1d9e34ed9a61f
	.xword	0x75326fa2ff071a2d
	.xword	0x8a750e9a5106da90
	.xword	0x68e47105c9fd1446
	.xword	0x12244d82e1ac58c1
	.xword	0x2d3dc80685f8116c
	.xword	0x36ce37d7484916ed
	.xword	0x5f201dc97e2a9d33
	.xword	0x425c9ef07c70d931
	.xword	0x9139bb3676c8ff80
	.xword	0xb58423800326f6a7
	.xword	0xff5b4153bba5f1b0
	.xword	0x79d0463c8ddf57f3
	.xword	0x1405bce1c51a45dc
	.xword	0xd9958c17a13bceae
	.xword	0x68e075a284e7f3dd
	.xword	0xe518320462f8e836
	.xword	0xdf4d83b823691527
	.xword	0x4357b020cbf93444
	.xword	0xde7f13598d932d85
	.xword	0x30f98db17ca5533c
	.xword	0x044f327584d9388f
	.xword	0xadae8f2674ae4173
	.xword	0xdb1ad5bb1a7666f4
	.xword	0xa1e0a3e11dcd1082
	.xword	0xba4d82876a727ff8
	.xword	0x19962db87b7c18d7
	.xword	0xfa4c5f024902b6cb
	.xword	0x0c8f58c1cc017a7e
	.xword	0x49934305d9ab70a5
	.xword	0xa0b85a145c487ca5
	.xword	0xe5f2951b642a1659
	.xword	0x7b54ba571f266d82
	.xword	0x0466a53f1669d408
	.xword	0x736ed33b16afe83a
	.xword	0x8b8aed3507807812
	.xword	0x033ad63e9e42d891
	.xword	0x7b47d8d23d58f888
	.xword	0x84780efc19e73f1d
	.xword	0xa075eb7dbe45fc53
	.xword	0xc7c9603aacff4084
	.xword	0x7fe081d2a002edde
	.xword	0xc1c91dd6496306ff
	.xword	0x124120b048220adc
	.xword	0xf200ec7bbef369ae
	.xword	0xdee68c908632ff91
	.xword	0x086fe437517d7c1c
	.xword	0x86796640fe875567
	.xword	0x31b52d76622437aa
	.xword	0x15da88f3373bc170
	.xword	0x7d116b1ff41b756d
	.xword	0x7b91375004c1a7f0
	.xword	0xb339b60c9040f452
	.xword	0x7870a047f4034497
	.xword	0x4f08b0f806b35ff3
	.xword	0xd19fcf39e45eb2c7
	.xword	0xe4955ead2db3cebb
	.xword	0x166a33cb93fc33f1
	.xword	0x935f64a222f1247f
	.xword	0x0769a341670b663c
	.xword	0x8c21efe2c96ca14e
	.xword	0x28e9e73f63486390
	.xword	0xd55a9e30343848b6
	.xword	0xf136962fa13e2ea8
	.xword	0xc7885b127e1fd96c
	.xword	0x4b2cd93300da6a42
	.xword	0xd1983ee8795bc8fc
	.xword	0x6405a64db4ce9a09
	.xword	0x0f3ae7b0fa29e76f
	.xword	0x2f76dcbf2fbdd5ac
	.xword	0x0867fdf677cc9216
	.xword	0xb6cae65884024067
	.xword	0x69bd92b9f9669adc
	.xword	0xbe1c1c4e45f516c5
	.xword	0xcecadc6b7b54decb
	.xword	0xe3289117253def23
	.xword	0x7ee26f740c45ff79
	.xword	0x62254c5dff89bdb7
	.xword	0xc493aa53380a136a
	.xword	0xb3fdfc48e936299d
	.xword	0x626e8f99e5ec041c
	.xword	0xcca9a65e175de389
	.xword	0x8b1a9de1499a4142
	.xword	0x5aa7d0f026236c18
	.xword	0x2fae79ce4e255ed4
	.xword	0xbe41771dd00a48b0
	.xword	0xe78aa9373d5210c3
	.xword	0x58084e6a2c7bb7fe
	.xword	0x6d3ea35a16a6181c
	.xword	0x2a12a7f3688cc976
	.xword	0x0bfb52f78c5c4f28
	.xword	0xbdac6b876e71c8a9
	.xword	0xf3bf43bc5a3d0b98
	.xword	0x026ec21d2dbf2588
	.xword	0xdcf5e0061464fc5d
	.xword	0x5516e3ef9de03044
	.xword	0xade829b0a762c411
	.xword	0x0cf6cca9d7897ec2
	.xword	0x796056f9f66ed64f
	.xword	0xc0d7d8156051b8df
	.xword	0x0d7aa0e429eb6df9
	.xword	0xcc32bcc7a38bc9c0
	.xword	0xd6d7755e81aa606e
	.xword	0x56ddbaec5d83d6e9
	.xword	0x3d1835e190aea33c
	.xword	0xe26688c1ffc5641d
	.xword	0xb067b49309f108cb
	.xword	0x993f71a40dea6737
	.xword	0xe5b49f17698c4ab8
	.xword	0x8179da184a91d81d
	.xword	0x1dee86016aefdbc0
	.xword	0xd919dc228c2475e1
	.xword	0x98159c6aa3b12419
	.xword	0xa1d36a1494de0b3c
	.xword	0x05a404ac80440bf6
	.xword	0x06a19446c119a6e3
	.xword	0x95188ff3616929b8
	.xword	0x9dc03f22aafeaf0a
	.xword	0x97b285c0f467fc9b
	.xword	0x7665a74d5b4f1e2c
	.xword	0xcd25a13f07b2d17e
	.xword	0xbd27dd06fbd029cf
	.xword	0x9240eb8dc595e587
	.xword	0x9cb1766e62ae782f
	.xword	0x173eaec8457917a0
	.xword	0x169c53013c3f4327
	.xword	0xb091066c549436b5
	.xword	0xa5a1aab987b33201
	.xword	0x25d70ab180e4a1a7
	.xword	0x72754a8aaad2f6c3
	.xword	0x3504c71bb439abb1
	.xword	0x259302c7cb704ea8
	.xword	0xbd65fc16f70f34ae
	.xword	0x120d4a1ce1a0155d
	.xword	0x9ac53b8b8be9ec95
	.xword	0xe6b0ade1c6bacddf
	.xword	0x53a45a052752c594
	.xword	0xb809d6eab8a29e47
	.xword	0x6d371fb0cf473375
	.xword	0x6c0b47ba6c738500
	.xword	0xb9c339c1a7242cb6
	.xword	0x3b709a4b027536a4
	.xword	0xb256de194eb26dfa
	.xword	0x90faf5053672f822
	.xword	0x0aa690013ff1676a
	.xword	0x15d0b447e93b5bac
	.xword	0x5eb51886860771da
	.xword	0xad025af7505aba92
	.xword	0x35441c8134eb29a7
	.xword	0xf1f4b67ced382ad2
	.xword	0x5f6ab91169608387
	.xword	0xa30e235ed2d12b68
	.xword	0x426557f94141c6fe
	.xword	0x7f4694c89cf31453
	.xword	0x9d7925bf268ab0d4
	.xword	0x197a151527275b90
	.xword	0x75b68066d60ab293
	.xword	0xd7260c069d79b70a
	.xword	0x503184ca22af9c4b
	.xword	0x19e15be8d4cdf361
	.xword	0xea98b50b327c6782
	.xword	0xeb0863a9d0392f0e
	.xword	0x7ee5a9109c8fd371
	.xword	0x82f1d93dec78c9dd
	.xword	0xc548abd116d735b0
	.xword	0x8b47e8131644bfec
	.xword	0xcbaa7797f686f13c
	.xword	0x605731e96e6e03a7
	.xword	0x9a4357c5b935135c
	.xword	0xa751fc218a196cbe
	.xword	0xb454cd252a044e6d
	.xword	0x2b96e382787a0a47
	.xword	0xdddfdff658fb73a4
	.xword	0x2cfc9c2af88e1ea6
	.xword	0xa039394fcbb6c908
	.xword	0x35333b1e337c0fb2
	.xword	0x61f64f41ba09fc71
	.xword	0x2faea98da072b66b
	.xword	0x0ee30630281cccb8
	.xword	0x948b1b2de7da88c2
	.xword	0xcf558500af662fb6
	.xword	0xa8c4e0c02e3ca626
	.xword	0x3706733bdc1cf52c
	.xword	0x46dee1edcef7fb1d
	.xword	0xae9197d28e654f53
	.xword	0x787d158df7a5cd71
	.xword	0xea27feb9ad4ecbf5
	.xword	0x955472d58c6af9e7
	.xword	0xd6c211b00034687c
	.xword	0xff908b2e5bf76cab
	.xword	0x3e93fdb445c81611
	.xword	0xa04e4e5f673a0b8e
	.xword	0xc256ac0cc6a17e89
	.xword	0xb1453c3db2c79418
	.xword	0xff7cdbbe1abaee51
	.xword	0x283c34cfd8aee2d1
	.xword	0x51d8c5e09a825700
	.xword	0x40d6111ca0ba43bb
	.xword	0x57078f2ff05430ee
	.xword	0x235dea02e858092a
	.xword	0xa441fcaeb095daca
	.xword	0xc778352c7adcc047
	.xword	0xb06cdfc0d50430f9
	.xword	0x82ed5f90704392fb

.global wdog_2_ext
# 9 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
.global wdog_2_ext

SECTION .HTRAPS
.text
htrap_5_ext:
    rd %pc, %l2
    inc %l3
    add %l2, htrap_5_ext_done-htrap_5_ext, %l2
    rdpr %tl, %l3
    rdpr %tstate, %l4
    rdhpr %htstate, %l5
    or %l5, 0x4, %l5
    inc %l3
    wrpr %l3, %tl
    wrpr %l2, %tpc
    add %l2, 4, %l2
    wrpr %l2, %tnpc
    wrpr %l4, %tstate
    wrhpr %l5, %htstate
    retry
htrap_5_ext_done:
    done

wdog_2_ext:
    mov 0x1f, %l1
    stxa    %l1, [%g0] ASI_LSU_CTL_REG
    stxa    %g0, [%g0] ASI_ERROR_INJECT
 ! If TT != 2, then goto trap handler
    rdpr %tt, %l1
    cmp %l1, 0x2
    bne wdog_2_goto_handler
    nop
 ! else done
    done
wdog_2_goto_handler:
    rdhpr %htba, %l2
    sllx %l1, 5, %l1
    add %l1, %l2, %l2
    jmp %l2
    nop
# 51 "/import/n2-aus-localdir1/somePerson/n2cdmspp/verif/diag/assembly/include/tlu_custom_trap_extensions.s"
! Red mode other reset handler
! Get htba, and tt and make trap address
! Jump to trap handler ..

SECTION .RED_SEC
.text
red_other_ext:
 ! IF TL=6, shift stack by one ..
    rdpr %tl, %l1
    cmp %l1, 6
    be start_tsa_shift
    nop

continue_red_other:
    mov 0x1f, %l1
    stxa    %l1, [%g0] ASI_LSU_CTL_REG
    stxa    %g0, [%g0] ASI_ERROR_INJECT

    rdpr %tt, %l1
    sllx %l1, 5, %l1
    rdhpr %htba, %l2
    add %l1, %l2, %l2
    rdhpr %hpstate, %l1
    jmp %l2
    wrhpr %l1, 0x20, %hpstate
    nop

wdog_red_ext:
 ! Shift stack down by 1 ...
    rdpr %tl, %l1
start_tsa_shift:
    mov 0x2, %l2

tsa_shift:
    wrpr %l2, %tl
    rdpr %tt, %l3
    rdpr %tpc, %l4
    rdpr %tnpc, %l5
    rdpr %tstate, %l6
    rdhpr %htstate, %l7
    dec %l2
    wrpr %l2, %tl
    wrpr %l3, %tt
    wrpr %l4, %tpc
    wrpr %l5, %tnpc
    wrpr %l6, %tstate
    wrhpr %l7, %htstate
    add %l2, 2, %l2
    cmp %l2, %l1
    ble tsa_shift
    nop
tsa_shift_done:
    dec %l1
    wrpr %l1, %tl

 ! If TT != 2, then goto trap handler
    rdpr %tt, %l1

    cmp %l1, 0x2
    bne continue_red_other
    nop
 ! else done
    mov 0x1f, %l1
    stxa    %l1, [%g0] ASI_LSU_CTL_REG
    stxa    %g0, [%g0] ASI_ERROR_INJECT
    done
# 324 "diag.j"



SECTION .MyHTRAPS_0 TEXT_VA = 0x0000000000380000, DATA_VA = 0x000000000038c000
attr_text {
	Name	 = .MyHTRAPS_0,
	RA	 = 0x0000000000380000,
	PA	 = ra2pa(0x0000000000380000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyHTRAPS_0,
	RA	 = 0x000000000038c000,
	PA	 = ra2pa(0x000000000038c000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0
}


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
	RA	 = 0x0000000000390000,
	PA	 = ra2pa(0x0000000000390000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyHTRAPS_1,
	RA	 = 0x000000000039c000,
	PA	 = ra2pa(0x000000000039c000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0
}


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
	RA	 = 0x00000000003a0000,
	PA	 = ra2pa(0x00000000003a0000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyHTRAPS_2,
	RA	 = 0x00000000003ac000,
	PA	 = ra2pa(0x00000000003ac000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0
}


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
	RA	 = 0x00000000003b0000,
	PA	 = ra2pa(0x00000000003b0000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyHTRAPS_3,
	RA	 = 0x00000000003bc000,
	PA	 = ra2pa(0x00000000003bc000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0
}


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
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyTRAPS_0,
	RA	 = 0x00000000003cc000,
	PA	 = ra2pa(0x00000000003cc000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0
}


attr_text {
	Name	 = .MyTRAPS_0,
	hypervisor
}


attr_data {
	Name	 = .MyTRAPS_0,
	hypervisor
}

#include "traps.s"



SECTION .MyTRAPS_1 TEXT_VA = 0x00000000003d0000, DATA_VA = 0x00000000003dc000
attr_text {
	Name	 = .MyTRAPS_1,
	RA	 = 0x00000000003d0000,
	PA	 = ra2pa(0x00000000003d0000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyTRAPS_1,
	RA	 = 0x00000000003dc000,
	PA	 = ra2pa(0x00000000003dc000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0
}


attr_text {
	Name	 = .MyTRAPS_1,
	hypervisor
}


attr_data {
	Name	 = .MyTRAPS_1,
	hypervisor
}

#include "traps.s"



SECTION .MyTRAPS_2 TEXT_VA = 0x00000000003e0000, DATA_VA = 0x00000000003ec000
attr_text {
	Name	 = .MyTRAPS_2,
	RA	 = 0x00000000003e0000,
	PA	 = ra2pa(0x00000000003e0000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyTRAPS_2,
	RA	 = 0x00000000003ec000,
	PA	 = ra2pa(0x00000000003ec000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0
}


attr_text {
	Name	 = .MyTRAPS_2,
	hypervisor
}


attr_data {
	Name	 = .MyTRAPS_2,
	hypervisor
}

#include "traps.s"



SECTION .MyTRAPS_3 TEXT_VA = 0x00000000003f0000, DATA_VA = 0x00000000003fc000
attr_text {
	Name	 = .MyTRAPS_3,
	RA	 = 0x00000000003f0000,
	PA	 = ra2pa(0x00000000003f0000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0,
	TTE_X	 = 1
}


attr_data {
	Name	 = .MyTRAPS_3,
	RA	 = 0x00000000003fc000,
	PA	 = ra2pa(0x00000000003fc000,0),
	part_0_ctx_zero_tsb_config_0,
	part_0_ctx_nonzero_tsb_config_0,
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
	TTE_W	 = 0
}


attr_text {
	Name	 = .MyTRAPS_3,
	hypervisor
}


attr_data {
	Name	 = .MyTRAPS_3,
	hypervisor
}

#include "traps.s"



#if 0
#endif

