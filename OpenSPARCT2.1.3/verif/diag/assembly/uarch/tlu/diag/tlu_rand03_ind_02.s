/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: tlu_rand03_ind_02.s
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
    restore %i7, %g0, %i7; \
    retry
#define H_T0_Trap_Instruction_1
#define My_T0_Trap_Instruction_1 \
    umul %o4, 2, %o5;\
    inc %o1;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
    wrpr %g2, %tnpc; \
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
    inc %i3;\
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
    inc %o1;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
    add %g2, 4, %g2;\
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
    inc %o1;\
    rdpr %tnpc, %g2; \
    wrpr %g2, %tpc; \
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
    done;\
    nop;nop;nop;nop

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
    inc %o4;\
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
    rdpr %tnpc, %g2; \
    illtrap ;\
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
    wrpr %g2, %tnpc; \
    restore %i7, %g0, %i7; \
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
    done; \
    nop; nop
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
    umul %i5, 4, %g2;\
    restore %i7, %g0, %i7;\
    save %i7, %g0, %i7; \
    done; \
    nop; nop

#define H_HT0_Fp_disabled_0x20
#define My_HT0_Fp_disabled_0x20 \
    mov  0x4, %g2 ;\
    wr %g2, 0x0, %fprs ;\
    sllx %g2, 10, %g3; \
    rdpr %tstate, %g2;\
    or %g2, %g3, %g2 ;\
    wrpr %g2, 0x0, %tstate;\
    retry; nop

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
    retry; nop


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
    call %g2;

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
    done; \
    nop; nop

#define H_HT0_Trap_Level_Zero_0x5f
#define My_HT0_Trap_Level_Zero_0x5f \
    not %g0, %g2; \
    rdhpr %hpstate, %g3;\
    jmp %g2;\
    rdhpr %htstate, %g3;\
    and %g3, 0xfe, %g3;\
    wrhpr %g3, 0, %htstate;\
    retry;nop


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
	ldx [%r31+120], %r15
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
	ldx [%r31+120], %r15
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
	ldx [%r31+120], %r15
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
	ldx [%r31+120], %r15
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
	ldx [%r31+120], %r15
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
	ldx [%r31+120], %r15
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
	ldx [%r31+120], %r15
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
	.word 0x8d90285c  ! 1: WRPR_PSTATE_I	wrpr	%r0, 0x085c, %pstate
	.word 0x87902052  ! 2: WRPR_TT_I	wrpr	%r0, 0x0052, %tt
	.word 0xd6800ac0  ! 3: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r11
	.word 0x8d802000  ! 4: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xd61fc000  ! 5: LDD_R	ldd	[%r31 + %r0], %r11
	.word 0xd6800b40  ! 6: LDUWA_R	lduwa	[%r0, %r0] 0x5a, %r11
DS_0:
	.word 0x32800001  ! 8: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x95a00543  ! 8: FSQRTd	fsqrt	
	.word 0x8fa34822  ! 7: FADDs	fadds	%f13, %f2, %f7
	.word 0x8ad2000e  ! 8: UMULcc_R	umulcc 	%r8, %r14, %r5
	.word 0x93902001  ! 9: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x91d02035  ! 10: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902003  ! 11: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8198248c  ! 12: WRHPR_HPSTATE_I	wrhpr	%r0, 0x048c, %hpstate
	.word 0xa1902000  ! 13: WRPR_GL_I	wrpr	%r0, 0x0000, %-
change_to_tl1_1:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x95696001  ! 15: SDIVX_I	sdivx	%r5, 0x0001, %r10
	.word 0x8d902883  ! 16: WRPR_PSTATE_I	wrpr	%r0, 0x0883, %pstate
	mov 0x31, %r30
	.word 0x93d0001e  ! 17: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902299  ! 18: WRPR_TT_I	wrpr	%r0, 0x0299, %tt
	.word 0x87802014  ! 19: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0xa190200f  ! 20: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa1902004  ! 21: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93d02030  ! 22: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xd4d00e60  ! 23: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r10
	.word 0x83504000  ! 24: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x9af82001  ! 25: SDIVcc_I	sdivcc 	%r0, 0x0001, %r13
DS_2:
	.word 0x22800001  ! 27: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 26: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982148  ! 27: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0148, %hpstate
	.word 0x8eab8007  ! 28: ANDNcc_R	andncc 	%r14, %r7, %r7
	.word 0x91d02035  ! 29: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902004  ! 30: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	mov 0x30, %r30
	.word 0x83d0001e  ! 31: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x91d0001e  ! 32: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8198219b  ! 33: WRHPR_HPSTATE_I	wrhpr	%r0, 0x019b, %hpstate
	.word 0x879020f7  ! 34: WRPR_TT_I	wrpr	%r0, 0x00f7, %tt
	.word 0xa1902000  ! 35: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x9bb1cfee  ! 36: FONES	fones	%f13
	.word 0x879020d3  ! 37: WRPR_TT_I	wrpr	%r0, 0x00d3, %tt
	mov 0x33, %r30
	.word 0x91d0001e  ! 38: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x984b000d  ! 39: MULX_R	mulx 	%r12, %r13, %r12
	.word 0x8d9022d9  ! 40: WRPR_PSTATE_I	wrpr	%r0, 0x02d9, %pstate
	.word 0x8d902c08  ! 41: WRPR_PSTATE_I	wrpr	%r0, 0x0c08, %pstate
	mov 0x30, %r30
	.word 0x83d0001e  ! 42: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9881000d  ! 43: ADDcc_R	addcc 	%r4, %r13, %r12
	.word 0xa190200d  ! 44: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x87902045  ! 45: WRPR_TT_I	wrpr	%r0, 0x0045, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x98828001  ! 47: ADDcc_R	addcc 	%r10, %r1, %r12
	.word 0x886a2001  ! 48: UDIVX_I	udivx 	%r8, 0x0001, %r4
change_to_tl1_3:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x83d02031  ! 50: Tcc_I	te	icc_or_xcc, %r0 + 49
	mov 0x33, %r30
	.word 0x93d0001e  ! 51: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 52: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0xa1902004  ! 53: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x81982a8e  ! 54: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a8e, %hpstate
	mov 0x33, %r30
	.word 0x91d0001e  ! 55: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 56: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982ec9  ! 57: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ec9, %hpstate
	.word 0x8790238d  ! 58: WRPR_TT_I	wrpr	%r0, 0x038d, %tt
	.word 0x88820001  ! 59: ADDcc_R	addcc 	%r8, %r1, %r4
	.word 0x87902024  ! 60: WRPR_TT_I	wrpr	%r0, 0x0024, %tt
	.word 0x93902000  ! 61: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x95682001  ! 62: SDIVX_I	sdivx	%r0, 0x0001, %r10
	.word 0xa1902004  ! 63: WRPR_GL_I	wrpr	%r0, 0x0004, %-
DS_4:
	.word 0x34800001  ! 65: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 64: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982003  ! 65: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0003, %hpstate
	.word 0x81a189a6  ! 66: FDIVs	fdivs	%f6, %f6, %f0
	.word 0x93902004  ! 67: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8b514000  ! 68: RDPR_TBA	rdpr	%tba, %r5
	mov 0x32, %r30
	.word 0x83d0001e  ! 69: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02033  ! 70: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x819820dc  ! 71: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00dc, %hpstate
	.word 0xca7fe001  ! 72: SWAP_I	swap	%r5, [%r31 + 0x0001]
	.word 0x32700001  ! 73: BPNE	<illegal instruction>
	.word 0x8c48400c  ! 74: MULX_R	mulx 	%r1, %r12, %r6
	.word 0x83d02033  ! 75: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x89540000  ! 76: RDPR_GL	rdpr	%-, %r4
	.word 0x87902073  ! 77: WRPR_TT_I	wrpr	%r0, 0x0073, %tt
	.word 0x8d902a55  ! 78: WRPR_PSTATE_I	wrpr	%r0, 0x0a55, %pstate
	mov 0x33, %r30
	.word 0x83d0001e  ! 79: Tcc_R	te	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89a109cc  ! 81: FDIVd	fdivd	%f4, %f12, %f4
	.word 0x93902004  ! 82: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x93902000  ! 83: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x87902076  ! 84: WRPR_TT_I	wrpr	%r0, 0x0076, %tt
	.word 0x9cfb8008  ! 85: SDIVcc_R	sdivcc 	%r14, %r8, %r14
	.word 0x87902086  ! 86: WRPR_TT_I	wrpr	%r0, 0x0086, %tt
	.word 0x81982f5d  ! 87: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f5d, %hpstate
	.word 0x9da309c9  ! 88: FDIVd	fdivd	%f12, %f40, %f14
	.word 0x89702001  ! 89: POPC_I	popc	0x0001, %r4
	mov 0x34, %r30
	.word 0x91d0001e  ! 90: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9d500000  ! 91: RDPR_TPC	rdpr	%tpc, %r14
	.word 0x8198221d  ! 92: WRHPR_HPSTATE_I	wrhpr	%r0, 0x021d, %hpstate
	.word 0x8790214c  ! 93: WRPR_TT_I	wrpr	%r0, 0x014c, %tt
	.word 0x8d90288f  ! 94: WRPR_PSTATE_I	wrpr	%r0, 0x088f, %pstate
	mov 0x34, %r30
	.word 0x83d0001e  ! 95: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xdd37c009  ! 96: STQF_R	-	%f14, [%r9, %r31]
	.word 0xa190200c  ! 97: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x93500000  ! 98: RDPR_TPC	rdpr	%tpc, %r9
	.word 0xd2c00e60  ! 99: LDSWA_R	ldswa	[%r0, %r0] 0x73, %r9
	.word 0x87902140  ! 100: WRPR_TT_I	wrpr	%r0, 0x0140, %tt
	.word 0xa1902008  ! 101: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xd2800c20  ! 102: LDUWA_R	lduwa	[%r0, %r0] 0x61, %r9
	ta	T_CHANGE_NONPRIV	! macro
	.word 0xa190200d  ! 104: WRPR_GL_I	wrpr	%r0, 0x000d, %-
DS_5:
	.word 0x32800001  ! 106: BNE	bne,a	<label_0x1>
	.word 0xbfefc000  ! 105: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x81982b97  ! 106: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b97, %hpstate
	.word 0x879023a8  ! 107: WRPR_TT_I	wrpr	%r0, 0x03a8, %tt
	.word 0xd327c009  ! 108: STF_R	st	%f9, [%r9, %r31]
	.word 0x93902005  ! 109: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xd2dfe010  ! 110: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r9
	.word 0x8d902c8a  ! 111: WRPR_PSTATE_I	wrpr	%r0, 0x0c8a, %pstate
	.word 0xa1902002  ! 112: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x99508000  ! 114: RDPR_TSTATE	rdpr	%tstate, %r12
	mov 0x31, %r30
	.word 0x91d0001e  ! 115: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x80d0c00b  ! 116: UMULcc_R	umulcc 	%r3, %r11, %r0
DS_6:
	.word 0x20800001  ! 118: BN	bn,a	<label_0x1>
	.word 0xc7326001  ! 118: STQF_I	-	%f3, [0x0001, %r9]
	normalw
	.word 0x9b458000  ! 117: RD_SOFTINT_REG	rd	%softint, %r13
	mov 0x33, %r30
	.word 0x93d0001e  ! 118: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d90200f  ! 119: WRPR_PSTATE_I	wrpr	%r0, 0x000f, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x20800001  ! 121: BN	bn,a	<label_0x1>
	.word 0x9350c000  ! 122: RDPR_TT	rdpr	%tt, %r9
	.word 0x819829cc  ! 123: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09cc, %hpstate
	.word 0x8da209ae  ! 124: FDIVs	fdivs	%f8, %f14, %f6
	.word 0x81982e85  ! 125: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e85, %hpstate
	.word 0x91d02033  ! 126: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x879020e9  ! 127: WRPR_TT_I	wrpr	%r0, 0x00e9, %tt
	.word 0x8d902c83  ! 128: WRPR_PSTATE_I	wrpr	%r0, 0x0c83, %pstate
	.word 0xa190200e  ! 129: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x24700001  ! 130: BPLE	<illegal instruction>
	.word 0x8790226c  ! 131: WRPR_TT_I	wrpr	%r0, 0x026c, %tt
	.word 0x8ba1cdc4  ! 132: FdMULq	fdmulq	
	.word 0x91d02033  ! 133: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x9cd00009  ! 134: UMULcc_R	umulcc 	%r0, %r9, %r14
	mov 0x30, %r30
	.word 0x83d0001e  ! 135: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8951c000  ! 136: RDPR_TL	rdpr	%tl, %r4
	.word 0xc9e7c029  ! 137: CASA_I	casa	[%r31] 0x 1, %r9, %r4
	mov 0x33, %r30
	.word 0x83d0001e  ! 138: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 139: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8b50c000  ! 140: RDPR_TT	rdpr	%tt, %r5
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x81982b14  ! 142: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b14, %hpstate
	.word 0x8d902e9c  ! 143: WRPR_PSTATE_I	wrpr	%r0, 0x0e9c, %pstate
	.word 0x8d902cc3  ! 144: WRPR_PSTATE_I	wrpr	%r0, 0x0cc3, %pstate
	.word 0x8b508000  ! 145: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0x80824003  ! 146: ADDcc_R	addcc 	%r9, %r3, %r0
	.word 0x87802010  ! 147: WRASI_I	wr	%r0, 0x0010, %asi
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d90209e  ! 149: WRPR_PSTATE_I	wrpr	%r0, 0x009e, %pstate
	.word 0xa1902000  ! 150: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d02030  ! 151: Tcc_I	ta	icc_or_xcc, %r0 + 48
change_to_tl1_7:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x85494000  ! 153: RDHPR_HTBA	rdhpr	%htba, %r2
	.word 0x8d902297  ! 154: WRPR_PSTATE_I	wrpr	%r0, 0x0297, %pstate
	.word 0x91494000  ! 155: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x879023b7  ! 156: WRPR_TT_I	wrpr	%r0, 0x03b7, %tt
	.word 0xd0d804a0  ! 157: LDXA_R	ldxa	[%r0, %r0] 0x25, %r8
	.word 0x8d802004  ! 158: WRFPRS_I	wr	%r0, 0x0004, %fprs
change_to_tl1_8:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_HPRIV	! macro
change_to_tl1_9:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xd03fe001  ! 162: STD_I	std	%r8, [%r31 + 0x0001]
	.word 0xd0c804a0  ! 163: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0x819822d4  ! 164: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02d4, %hpstate
	.word 0x8d500000  ! 165: RDPR_TPC	rdpr	%tpc, %r6
	.word 0xcccfe010  ! 166: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r6
	.word 0x9afb6001  ! 167: SDIVcc_I	sdivcc 	%r13, 0x0001, %r13
	.word 0x9068c006  ! 168: UDIVX_R	udivx 	%r3, %r6, %r8
	.word 0xd0c804a0  ! 169: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r8
	.word 0x8b51c000  ! 170: RDPR_TL	rdpr	%tl, %r5
	mov 0x32, %r30
	.word 0x91d0001e  ! 171: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x38800001  ! 172: BGU	bgu,a	<label_0x1>
DS_10:
	.word 0x32800001  ! 174: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 173: SAVE_R	save	%r31, %r0, %r31
	.word 0x819828dd  ! 174: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08dd, %hpstate
	.word 0x8198208a  ! 175: WRHPR_HPSTATE_I	wrhpr	%r0, 0x008a, %hpstate
	.word 0xca1fe001  ! 176: LDD_I	ldd	[%r31 + 0x0001], %r5
	.word 0x8198254e  ! 177: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054e, %hpstate
	.word 0x819829dd  ! 178: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09dd, %hpstate
	.word 0xcad7e030  ! 179: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r5
DS_11:
	.word 0x20800001  ! 181: BN	bn,a	<label_0x1>
	pdist %f16, %f4, %f4
	.word 0x89b38309  ! 180: ALLIGNADDRESS	alignaddr	%r14, %r9, %r4
	.word 0x9d702001  ! 181: POPC_I	popc	0x0001, %r14
	mov 0x35, %r30
	.word 0x83d0001e  ! 182: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x2a700001  ! 183: BPCS	<illegal instruction>
	.word 0x91504000  ! 184: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x89514000  ! 185: RDPR_TBA	rdpr	%tba, %r4
	.word 0x83a089e5  ! 186: FDIVq	dis not found

	.word 0x87902364  ! 187: WRPR_TT_I	wrpr	%r0, 0x0364, %tt
	.word 0x81494000  ! 188: RDHPR_HTBA	rdhpr	%htba, %r0
	.word 0x826a2001  ! 189: UDIVX_I	udivx 	%r8, 0x0001, %r1
	.word 0x8d50c000  ! 190: RDPR_TT	rdpr	%tt, %r6
	mov 0x30, %r30
	.word 0x91d0001e  ! 191: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x95514000  ! 192: RDPR_TBA	rdpr	%tba, %r10
DS_12:
	.word 0x34800001  ! 194: BG	bg,a	<label_0x1>
	.word 0xd5324006  ! 194: STQF_R	-	%f10, [%r6, %r9]
	normalw
	.word 0x8f458000  ! 193: RD_SOFTINT_REG	rd	%softint, %r7
	.word 0x8ec22001  ! 194: ADDCcc_I	addccc 	%r8, 0x0001, %r7
	.word 0x93902002  ! 195: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x85a01a6b  ! 196: FqTOi	fqtoi	
	.word 0xc527e001  ! 197: STF_I	st	%f2, [0x0001, %r31]
	.word 0x8c83a001  ! 198: ADDcc_I	addcc 	%r14, 0x0001, %r6
	.word 0xcc17e001  ! 199: LDUH_I	lduh	[%r31 + 0x0001], %r6
	mov 0x34, %r30
	.word 0x93d0001e  ! 200: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91b38fe7  ! 201: FONES	fones	%f8
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9e836001  ! 203: ADDcc_I	addcc 	%r13, 0x0001, %r15
	.word 0x916be001  ! 204: SDIVX_I	sdivx	%r15, 0x0001, %r8
	mov 0x33, %r30
	.word 0x83d0001e  ! 205: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd0c004a0  ! 206: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r8
	.word 0x8468c00c  ! 207: UDIVX_R	udivx 	%r3, %r12, %r2
	.word 0x91d02035  ! 208: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 0x30, %r30
	.word 0x83d0001e  ! 209: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x986bc002  ! 210: UDIVX_R	udivx 	%r15, %r2, %r12
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd8ffc022  ! 212: SWAPA_R	swapa	%r12, [%r31 + %r2] 0x01
	.word 0x8198205c  ! 213: WRHPR_HPSTATE_I	wrhpr	%r0, 0x005c, %hpstate
	.word 0x97b10fe3  ! 214: FONES	fones	%f11
	.word 0x91d02032  ! 215: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902009  ! 216: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0xd68008a0  ! 217: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x819821d3  ! 218: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d3, %hpstate
	.word 0x93902006  ! 219: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0xa190200c  ! 220: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xd6ffc023  ! 221: SWAPA_R	swapa	%r11, [%r31 + %r3] 0x01
	.word 0x86d2a001  ! 222: UMULcc_I	umulcc 	%r10, 0x0001, %r3
	.word 0x9ba01a6f  ! 223: FqTOi	fqtoi	
	.word 0x81982cc7  ! 224: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cc7, %hpstate
	mov 0x33, %r30
	.word 0x91d0001e  ! 225: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83508000  ! 226: RDPR_TSTATE	rdpr	%tstate, %r1
	.word 0xc3e7c02f  ! 227: CASA_I	casa	[%r31] 0x 1, %r15, %r1
	mov 0x30, %r30
	.word 0x91d0001e  ! 228: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902000  ! 229: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0xa1902004  ! 230: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x95a3c9eb  ! 231: FDIVq	dis not found

	.word 0x3e800001  ! 232: BVC	bvc,a	<label_0x1>
	.word 0x93902001  ! 233: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_tl1_13:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200f  ! 236: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0xa1902000  ! 237: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	mov 0x34, %r30
	.word 0x91d0001e  ! 238: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902007  ! 239: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x24700001  ! 241: BPLE	<illegal instruction>
	.word 0x99902005  ! 242: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x81982891  ! 243: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0891, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8b702001  ! 245: POPC_I	popc	0x0001, %r5
	.word 0xa1902004  ! 246: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x83702001  ! 247: POPC_I	popc	0x0001, %r1
	.word 0x91d02030  ! 248: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x9d508000  ! 249: RDPR_TSTATE	rdpr	%tstate, %r14
	mov 0x34, %r30
	.word 0x91d0001e  ! 250: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x879023af  ! 252: WRPR_TT_I	wrpr	%r0, 0x03af, %tt
	.word 0x8b51c000  ! 253: RDPR_TL	rdpr	%tl, %r5
	.word 0x93902003  ! 254: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902005  ! 255: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902002  ! 256: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xcabfc02b  ! 257: STDA_R	stda	%r5, [%r31 + %r11] 0x01
	.word 0xca97e000  ! 258: LDUHA_I	lduha	[%r31, + 0x0000] %asi, %r5
	.word 0x8d90225c  ! 259: WRPR_PSTATE_I	wrpr	%r0, 0x025c, %pstate
	.word 0xcb3fc00b  ! 260: STDF_R	std	%f5, [%r11, %r31]
	.word 0x8d902a00  ! 261: WRPR_PSTATE_I	wrpr	%r0, 0x0a00, %pstate
	.word 0x86fb6001  ! 262: SDIVcc_I	sdivcc 	%r13, 0x0001, %r3
	.word 0x9f500000  ! 263: RDPR_TPC	rdpr	%tpc, %r15
	.word 0x9a4b8002  ! 264: MULX_R	mulx 	%r14, %r2, %r13
	.word 0x8198228b  ! 265: WRHPR_HPSTATE_I	wrhpr	%r0, 0x028b, %hpstate
	.word 0x81514000  ! 266: RDPR_TBA	rdpr	%tba, %r0
	.word 0x81982b90  ! 267: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b90, %hpstate
	.word 0x82f8400f  ! 268: SDIVcc_R	sdivcc 	%r1, %r15, %r1
	.word 0x3a800001  ! 269: BCC	bcc,a	<label_0x1>
	.word 0x9b514000  ! 270: RDPR_TBA	rdpr	%tba, %r13
	.word 0x91d02035  ! 271: Tcc_I	ta	icc_or_xcc, %r0 + 53
change_to_tl1_14:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_HPRIV	! macro
	mov 0x35, %r30
	.word 0x91d0001e  ! 274: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982643  ! 275: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0643, %hpstate
	.word 0x91480000  ! 276: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x87a0056a  ! 277: FSQRTq	fsqrt	
	.word 0x93480000  ! 278: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0xd2d80e40  ! 279: LDXA_R	ldxa	[%r0, %r0] 0x72, %r9
	.word 0x879021e0  ! 280: WRPR_TT_I	wrpr	%r0, 0x01e0, %tt
	.word 0x9351c000  ! 281: RDPR_TL	rdpr	%tl, %r9
	ta	T_CHANGE_PRIV	! macro
	.word 0x8790233d  ! 283: WRPR_TT_I	wrpr	%r0, 0x033d, %tt
	.word 0x91d02034  ! 284: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d802004  ! 285: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x83d02031  ! 286: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x87902059  ! 287: WRPR_TT_I	wrpr	%r0, 0x0059, %tt
	.word 0x81982154  ! 288: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0154, %hpstate
	.word 0x8d802004  ! 289: WRFPRS_I	wr	%r0, 0x0004, %fprs
DS_15:
	.word 0x32800001  ! 291: BNE	bne,a	<label_0x1>
	.word 0xd1300008  ! 291: STQF_R	-	%f8, [%r8, %r0]
	normalw
	.word 0x89458000  ! 290: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xc8c804a0  ! 291: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r4
	.word 0x93902005  ! 292: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	mov 0x30, %r30
	.word 0x91d0001e  ! 293: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021b5  ! 294: WRPR_TT_I	wrpr	%r0, 0x01b5, %tt
	.word 0x8790200d  ! 295: WRPR_TT_I	wrpr	%r0, 0x000d, %tt
	.word 0x95514000  ! 296: RDPR_TBA	rdpr	%tba, %r10
	.word 0x81982dd7  ! 297: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd7, %hpstate
	.word 0x8d9024d4  ! 298: WRPR_PSTATE_I	wrpr	%r0, 0x04d4, %pstate
	.word 0x22800001  ! 299: BE	be,a	<label_0x1>
	.word 0x87540000  ! 300: RDPR_GL	rdpr	%-, %r3
	mov 0x34, %r30
	.word 0x91d0001e  ! 301: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc69004a0  ! 302: LDUHA_R	lduha	[%r0, %r0] 0x25, %r3
	.word 0x8d902ed6  ! 303: WRPR_PSTATE_I	wrpr	%r0, 0x0ed6, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x88d36001  ! 305: UMULcc_I	umulcc 	%r13, 0x0001, %r4
	.word 0x91d02033  ! 306: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902000  ! 307: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x99902002  ! 308: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x81982406  ! 309: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0406, %hpstate
	.word 0xa190200c  ! 310: WRPR_GL_I	wrpr	%r0, 0x000c, %-
DS_16:
	.word 0x34800001  ! 312: BG	bg,a	<label_0x1>
	.word 0xd733e001  ! 312: STQF_I	-	%f11, [0x0001, %r15]
	normalw
	.word 0x97458000  ! 311: RD_SOFTINT_REG	rd	%softint, %r11
	.word 0xa1902008  ! 312: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x879023e8  ! 313: WRPR_TT_I	wrpr	%r0, 0x03e8, %tt
	.word 0x8d902ec9  ! 314: WRPR_PSTATE_I	wrpr	%r0, 0x0ec9, %pstate
	.word 0x9fa389a3  ! 315: FDIVs	fdivs	%f14, %f3, %f15
	.word 0x8f50c000  ! 316: RDPR_TT	rdpr	%tt, %r7
	.word 0xce800c40  ! 317: LDUWA_R	lduwa	[%r0, %r0] 0x62, %r7
	.word 0x81982142  ! 318: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0142, %hpstate
	.word 0x32800001  ! 319: BNE	bne,a	<label_0x1>
	.word 0x99902004  ! 320: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xa1902009  ! 321: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x81982199  ! 322: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0199, %hpstate
	.word 0xa1902004  ! 323: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x81982346  ! 324: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0346, %hpstate
	.word 0x8d902844  ! 325: WRPR_PSTATE_I	wrpr	%r0, 0x0844, %pstate
	.word 0x879020b5  ! 326: WRPR_TT_I	wrpr	%r0, 0x00b5, %tt
	.word 0x91d02033  ! 327: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x956a2001  ! 328: SDIVX_I	sdivx	%r8, 0x0001, %r10
	.word 0xd4d004a0  ! 329: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0xa1902003  ! 330: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0xa1902001  ! 331: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93902001  ! 332: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87902045  ! 333: WRPR_TT_I	wrpr	%r0, 0x0045, %tt
DS_17:
	.word 0x20800001  ! 335: BN	bn,a	<label_0x1>
	.word 0xc131c002  ! 335: STQF_R	-	%f0, [%r2, %r7]
	normalw
	.word 0x8b458000  ! 334: RD_SOFTINT_REG	rd	%softint, %r5
	.word 0x81982d8d  ! 335: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d8d, %hpstate
	.word 0x32700001  ! 336: BPNE	<illegal instruction>
	.word 0x87902029  ! 337: WRPR_TT_I	wrpr	%r0, 0x0029, %tt
	.word 0x93a000c5  ! 338: FNEGd	fnegd	%f36, %f40
	.word 0xd3e7c025  ! 339: CASA_I	casa	[%r31] 0x 1, %r5, %r9
	.word 0x91d02032  ! 340: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200a  ! 341: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	mov 0x33, %r30
	.word 0x93d0001e  ! 342: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x98fb400f  ! 343: SDIVcc_R	sdivcc 	%r13, %r15, %r12
	.word 0x8ba000c1  ! 344: FNEGd	fnegd	%f32, %f36
	.word 0x93902005  ! 345: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa1902008  ! 346: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x91d02035  ! 347: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x9f51c000  ! 348: RDPR_TL	rdpr	%tl, %r15
	.word 0x819828c8  ! 349: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08c8, %hpstate
	.word 0xdecfe000  ! 350: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r15
	.word 0x9351c000  ! 351: RDPR_TL	rdpr	%tl, %r9
	mov 0x32, %r30
	.word 0x83d0001e  ! 352: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x976a0002  ! 353: SDIVX_R	sdivx	%r8, %r2, %r11
	.word 0x8ba0054e  ! 354: FSQRTd	fsqrt	
	.word 0x8cda4001  ! 355: SMULcc_R	smulcc 	%r9, %r1, %r6
	.word 0xa190200e  ! 356: WRPR_GL_I	wrpr	%r0, 0x000e, %-
change_to_tl1_18:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93d02033  ! 358: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x91d02033  ! 359: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x90db0008  ! 360: SMULcc_R	smulcc 	%r12, %r8, %r8
	.word 0x81982592  ! 361: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0592, %hpstate
	.word 0xd0c7e010  ! 362: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r8
	.word 0x9cd36001  ! 363: UMULcc_I	umulcc 	%r13, 0x0001, %r14
	.word 0xdd27c008  ! 364: STF_R	st	%f14, [%r8, %r31]
	.word 0x9150c000  ! 365: RDPR_TT	rdpr	%tt, %r8
	.word 0x8d902a45  ! 366: WRPR_PSTATE_I	wrpr	%r0, 0x0a45, %pstate
	ta	T_CHANGE_HPRIV	! macro
	.word 0x94f9000e  ! 368: SDIVcc_R	sdivcc 	%r4, %r14, %r10
	.word 0x8d802004  ! 369: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xd527e001  ! 370: STF_I	st	%f10, [0x0001, %r31]
	.word 0x8951c000  ! 371: RDPR_TL	rdpr	%tl, %r4
	.word 0x8ed12001  ! 372: UMULcc_I	umulcc 	%r4, 0x0001, %r7
	.word 0x8d902487  ! 373: WRPR_PSTATE_I	wrpr	%r0, 0x0487, %pstate
	.word 0x99480000  ! 374: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x879023bf  ! 375: WRPR_TT_I	wrpr	%r0, 0x03bf, %tt
	.word 0x80814003  ! 376: ADDcc_R	addcc 	%r5, %r3, %r0
	.word 0xa1902004  ! 377: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d90260e  ! 378: WRPR_PSTATE_I	wrpr	%r0, 0x060e, %pstate
	.word 0x87500000  ! 379: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x93d02034  ! 380: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x91702001  ! 381: POPC_I	popc	0x0001, %r8
	.word 0x86c0e001  ! 382: ADDCcc_I	addccc 	%r3, 0x0001, %r3
	.word 0x97494000  ! 383: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0x3c800001  ! 384: BPOS	bpos,a	<label_0x1>
	mov 0x35, %r30
	.word 0x83d0001e  ! 385: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9a4b4006  ! 386: MULX_R	mulx 	%r13, %r6, %r13
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xa1902001  ! 388: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93902002  ! 389: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x3a700001  ! 390: BPCC	<illegal instruction>
	.word 0x91d02032  ! 391: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x879020f6  ! 392: WRPR_TT_I	wrpr	%r0, 0x00f6, %tt
	.word 0x9fa24dc8  ! 393: FdMULq	fdmulq	
	.word 0xa1902006  ! 394: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x9b480000  ! 395: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x91d02032  ! 396: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xdbe7c028  ! 397: CASA_I	casa	[%r31] 0x 1, %r8, %r13
	.word 0x8d9028d5  ! 398: WRPR_PSTATE_I	wrpr	%r0, 0x08d5, %pstate
	mov 0x34, %r30
	.word 0x93d0001e  ! 399: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x89514000  ! 400: RDPR_TBA	rdpr	%tba, %r4
	.word 0xa190200a  ! 401: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8da349c5  ! 402: FDIVd	fdivd	%f44, %f36, %f6
	.word 0x879020b7  ! 403: WRPR_TT_I	wrpr	%r0, 0x00b7, %tt
	.word 0xccc80e80  ! 404: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r6
	.word 0x8d902e1a  ! 405: WRPR_PSTATE_I	wrpr	%r0, 0x0e1a, %pstate
	.word 0x8d9026d8  ! 406: WRPR_PSTATE_I	wrpr	%r0, 0x06d8, %pstate
DS_19:
	.word 0x22800001  ! 408: BE	be,a	<label_0x1>
	.word 0x22800001  ! 408: BE	be,a	<label_0x1>
	.word 0x91a00540  ! 408: FSQRTd	fsqrt	
	.word 0x95a1c822  ! 407: FADDs	fadds	%f7, %f2, %f10
	.word 0x8d902650  ! 408: WRPR_PSTATE_I	wrpr	%r0, 0x0650, %pstate
	.word 0x87902189  ! 409: WRPR_TT_I	wrpr	%r0, 0x0189, %tt
	.word 0x81982013  ! 410: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0013, %hpstate
	.word 0xa190200e  ! 411: WRPR_GL_I	wrpr	%r0, 0x000e, %-
DS_20:
	.word 0x22800001  ! 413: BE	be,a	<label_0x1>
	pdist %f4, %f16, %f12
	.word 0x8db1c309  ! 412: ALLIGNADDRESS	alignaddr	%r7, %r9, %r6
	.word 0x8d802004  ! 413: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902002  ! 414: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9cf8e001  ! 415: SDIVcc_I	sdivcc 	%r3, 0x0001, %r14
	.word 0x91d02033  ! 416: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x844b800a  ! 417: MULX_R	mulx 	%r14, %r10, %r2
	.word 0x81982710  ! 418: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0710, %hpstate
	.word 0x87a000c9  ! 419: FNEGd	fnegd	%f40, %f34
	.word 0xc6d00e60  ! 420: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r3
	.word 0xc6d804a0  ! 421: LDXA_R	ldxa	[%r0, %r0] 0x25, %r3
	.word 0x8d90221f  ! 422: WRPR_PSTATE_I	wrpr	%r0, 0x021f, %pstate
	.word 0x8d802000  ! 423: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x879023d0  ! 424: WRPR_TT_I	wrpr	%r0, 0x03d0, %tt
	.word 0x8d69a001  ! 425: SDIVX_I	sdivx	%r6, 0x0001, %r6
	.word 0x8882c004  ! 426: ADDcc_R	addcc 	%r11, %r4, %r4
	.word 0x879020ad  ! 427: WRPR_TT_I	wrpr	%r0, 0x00ad, %tt
	mov 0x30, %r30
	.word 0x91d0001e  ! 428: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x91d0001e  ! 429: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9da149a5  ! 430: FDIVs	fdivs	%f5, %f5, %f14
	ta	T_CHANGE_NONPRIV	! macro
DS_21:
	not %g0, %g2
	call %g2
	.word 0x9d902001  ! 432: WRPR_WSTATE_I	wrpr	%r0, 0x0001, %wstate
	.word 0xdc7fe001  ! 433: SWAP_I	swap	%r14, [%r31 + 0x0001]
	.word 0x8d50c000  ! 434: RDPR_TT	rdpr	%tt, %r6
	.word 0x87494000  ! 435: RDHPR_HTBA	rdhpr	%htba, %r3
	.word 0x87902148  ! 436: WRPR_TT_I	wrpr	%r0, 0x0148, %tt
change_to_tl1_22:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x83a3c9ac  ! 438: FDIVs	fdivs	%f15, %f12, %f1
	.word 0x8d9020ce  ! 439: WRPR_PSTATE_I	wrpr	%r0, 0x00ce, %pstate
	.word 0x97a389c5  ! 440: FDIVd	fdivd	%f14, %f36, %f42
	.word 0x8198281e  ! 441: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081e, %hpstate
	.word 0x8d802000  ! 442: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02031  ! 443: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xd62fc005  ! 444: STB_R	stb	%r11, [%r31 + %r5]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93902006  ! 446: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93d02031  ! 447: Tcc_I	tne	icc_or_xcc, %r0 + 49
	.word 0x85702001  ! 448: POPC_I	popc	0x0001, %r2
	.word 0x9cd3e001  ! 449: UMULcc_I	umulcc 	%r15, 0x0001, %r14
	.word 0x93902002  ! 450: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x89a01a66  ! 451: FqTOi	fqtoi	
	mov 0x32, %r30
	.word 0x91d0001e  ! 452: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02035  ! 453: Tcc_I	tne	icc_or_xcc, %r0 + 53
DS_23:
	.word 0x22800001  ! 455: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 454: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8d902e15  ! 455: WRPR_PSTATE_I	wrpr	%r0, 0x0e15, %pstate
	.word 0x80f86001  ! 456: SDIVcc_I	sdivcc 	%r1, 0x0001, %r0
	.word 0xc0900e40  ! 457: LDUHA_R	lduha	[%r0, %r0] 0x72, %r0
	.word 0x91d02031  ! 458: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xc03fe001  ! 459: STD_I	std	%r0, [%r31 + 0x0001]
	ta	T_CHANGE_NONPRIV	! macro
	mov 0x35, %r30
	.word 0x91d0001e  ! 461: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 462: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xc07fe001  ! 463: SWAP_I	swap	%r0, [%r31 + 0x0001]
	.word 0x87902149  ! 464: WRPR_TT_I	wrpr	%r0, 0x0149, %tt
	.word 0x99902000  ! 465: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8d902094  ! 466: WRPR_PSTATE_I	wrpr	%r0, 0x0094, %pstate
	.word 0x87902227  ! 467: WRPR_TT_I	wrpr	%r0, 0x0227, %tt
	.word 0x91a089a6  ! 468: FDIVs	fdivs	%f2, %f6, %f8
	mov 0x32, %r30
	.word 0x91d0001e  ! 469: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90200b  ! 470: WRPR_PSTATE_I	wrpr	%r0, 0x000b, %pstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93902004  ! 472: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x9cc26001  ! 473: ADDCcc_I	addccc 	%r9, 0x0001, %r14
	.word 0xdc7fe001  ! 474: SWAP_I	swap	%r14, [%r31 + 0x0001]
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 476: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d540000  ! 477: RDPR_GL	rdpr	%-, %r6
	.word 0xccd804a0  ! 478: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x26700001  ! 480: BPL	<illegal instruction>
	.word 0x81982e93  ! 481: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e93, %hpstate
	.word 0x93902007  ! 482: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d902692  ! 483: WRPR_PSTATE_I	wrpr	%r0, 0x0692, %pstate
	.word 0x93902004  ! 484: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	mov 0x34, %r30
	.word 0x91d0001e  ! 485: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9883e001  ! 486: ADDcc_I	addcc 	%r15, 0x0001, %r12
	.word 0xa1902001  ! 487: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x83d02033  ! 488: Tcc_I	te	icc_or_xcc, %r0 + 51
	.word 0x26700001  ! 489: BPL	<illegal instruction>
	.word 0x819826d8  ! 490: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d8, %hpstate
	.word 0x93d02033  ! 491: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x93902003  ! 492: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
DS_24:
	.word 0x32800001  ! 494: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 493: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02035  ! 494: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x95508000  ! 495: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0xd597e001  ! 496: LDQFA_I	-	[%r31, 0x0001], %f10
	.word 0x93902006  ! 497: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x8d902251  ! 498: WRPR_PSTATE_I	wrpr	%r0, 0x0251, %pstate
	.word 0xd4c804a0  ! 499: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r10
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8c6a4000  ! 501: UDIVX_R	udivx 	%r9, %r0, %r6
	mov 0x31, %r30
	.word 0x91d0001e  ! 502: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8ba249cd  ! 503: FDIVd	fdivd	%f40, %f44, %f36
	.word 0x8d902c46  ! 504: WRPR_PSTATE_I	wrpr	%r0, 0x0c46, %pstate
	mov 0x32, %r30
	.word 0x91d0001e  ! 505: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_25:
	.word 0x22800001  ! 507: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 506: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x8ec0e001  ! 507: ADDCcc_I	addccc 	%r3, 0x0001, %r7
	.word 0x8d902247  ! 508: WRPR_PSTATE_I	wrpr	%r0, 0x0247, %pstate
	mov 0x34, %r30
	.word 0x91d0001e  ! 509: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x38800001  ! 510: BGU	bgu,a	<label_0x1>
	.word 0x91d02032  ! 511: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x97b3cfef  ! 512: FONES	fones	%f11
	.word 0x8d802000  ! 513: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x95a01a62  ! 514: FqTOi	fqtoi	
DS_26:
	.word 0x32800001  ! 516: BNE	bne,a	<label_0x1>
	pdist %f24, %f18, %f8
	.word 0x83b18308  ! 515: ALLIGNADDRESS	alignaddr	%r6, %r8, %r1
	.word 0x93902004  ! 516: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x83d02030  ! 517: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x81982299  ! 518: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0299, %hpstate
	.word 0x93902005  ! 519: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xc327e001  ! 520: STF_I	st	%f1, [0x0001, %r31]
	.word 0x87802010  ! 521: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d802000  ! 522: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 523: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8f514000  ! 524: RDPR_TBA	rdpr	%tba, %r7
	.word 0xce7fe001  ! 525: SWAP_I	swap	%r7, [%r31 + 0x0001]
	.word 0x85a00544  ! 526: FSQRTd	fsqrt	
	.word 0x22800001  ! 527: BE	be,a	<label_0x1>
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d9022da  ! 529: WRPR_PSTATE_I	wrpr	%r0, 0x02da, %pstate
	.word 0x9551c000  ! 530: RDPR_TL	rdpr	%tl, %r10
	.word 0xd48804a0  ! 531: LDUBA_R	lduba	[%r0, %r0] 0x25, %r10
	.word 0x879021a9  ! 532: WRPR_TT_I	wrpr	%r0, 0x01a9, %tt
	.word 0x91d02035  ! 533: Tcc_I	ta	icc_or_xcc, %r0 + 53
	mov 0x34, %r30
	.word 0x93d0001e  ! 534: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0xd4d004a0  ! 535: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r10
	.word 0x87902176  ! 536: WRPR_TT_I	wrpr	%r0, 0x0176, %tt
	.word 0x91504000  ! 537: RDPR_TNPC	rdpr	%tnpc, %r8
	.word 0x93d02035  ! 538: Tcc_I	tne	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902a42  ! 541: WRPR_PSTATE_I	wrpr	%r0, 0x0a42, %pstate
	.word 0x87802089  ! 542: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0xa1902007  ! 543: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x879020aa  ! 544: WRPR_TT_I	wrpr	%r0, 0x00aa, %tt
	.word 0x93902006  ! 545: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x819823d2  ! 546: WRHPR_HPSTATE_I	wrhpr	%r0, 0x03d2, %hpstate
	.word 0x28700001  ! 547: BPLEU	<illegal instruction>
	.word 0x879023ce  ! 548: WRPR_TT_I	wrpr	%r0, 0x03ce, %tt
	.word 0x9ba01a6c  ! 549: FqTOi	fqtoi	
	.word 0x966b6001  ! 550: UDIVX_I	udivx 	%r13, 0x0001, %r11
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x87500000  ! 552: RDPR_TPC	rdpr	%tpc, %r3
	.word 0x82c3e001  ! 553: ADDCcc_I	addccc 	%r15, 0x0001, %r1
	.word 0x91d02032  ! 554: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x81982c1d  ! 555: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c1d, %hpstate
	.word 0xa1902006  ! 556: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0x879020e0  ! 557: WRPR_TT_I	wrpr	%r0, 0x00e0, %tt
	mov 0x35, %r30
	.word 0x91d0001e  ! 558: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819828cf  ! 559: WRHPR_HPSTATE_I	wrhpr	%r0, 0x08cf, %hpstate
	.word 0x9b494000  ! 560: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0x81982c97  ! 561: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c97, %hpstate
	.word 0x87802010  ! 562: WRASI_I	wr	%r0, 0x0010, %asi
	.word 0x8d802004  ! 563: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902007  ! 564: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x9b480000  ! 565: RDHPR_HPSTATE	rdhpr	%hpstate, %r13
	.word 0x9f514000  ! 566: RDPR_TBA	rdpr	%tba, %r15
	.word 0x8d802000  ! 567: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982883  ! 568: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0883, %hpstate
	.word 0x87514000  ! 569: RDPR_TBA	rdpr	%tba, %r3
	.word 0xc6c004a0  ! 570: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0x89480000  ! 571: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d802000  ! 573: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x86d22001  ! 574: UMULcc_I	umulcc 	%r8, 0x0001, %r3
	.word 0xc6d00e80  ! 575: LDSHA_R	ldsha	[%r0, %r0] 0x74, %r3
	.word 0x8d802000  ! 576: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc6d004a0  ! 577: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r3
	.word 0x93d02033  ! 578: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x879021fb  ! 579: WRPR_TT_I	wrpr	%r0, 0x01fb, %tt
	.word 0xc6c004a0  ! 580: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r3
	.word 0xa1902004  ! 581: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x93902003  ! 582: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87902085  ! 583: WRPR_TT_I	wrpr	%r0, 0x0085, %tt
	.word 0x83d02032  ! 584: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x8d802000  ! 585: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8da0054c  ! 586: FSQRTd	fsqrt	
	ta	T_CHANGE_HPRIV	! macro
	mov 0x35, %r30
	.word 0x91d0001e  ! 588: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x83d0001e  ! 589: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x87702001  ! 590: POPC_I	popc	0x0001, %r3
DS_27:
	.word 0x20800001  ! 592: BN	bn,a	<label_0x1>
	allclean
	.word 0x8db00306  ! 591: ALLIGNADDRESS	alignaddr	%r0, %r6, %r6
	.word 0xccc804a0  ! 592: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r6
	.word 0x83a00568  ! 593: FSQRTq	fsqrt	
	.word 0x8790216b  ! 594: WRPR_TT_I	wrpr	%r0, 0x016b, %tt
	.word 0x87902038  ! 595: WRPR_TT_I	wrpr	%r0, 0x0038, %tt
	.word 0xa190200f  ! 596: WRPR_GL_I	wrpr	%r0, 0x000f, %-
DS_28:
	not %g0, %g2
	call %g2
	.word 0x9d902002  ! 597: WRPR_WSTATE_I	wrpr	%r0, 0x0002, %wstate
	.word 0xa190200e  ! 598: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x9ba109c6  ! 599: FDIVd	fdivd	%f4, %f6, %f44
	mov 0x31, %r30
	.word 0x91d0001e  ! 600: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdb27e001  ! 601: STF_I	st	%f13, [0x0001, %r31]
	.word 0x9a6b8003  ! 602: UDIVX_R	udivx 	%r14, %r3, %r13
	.word 0x99902001  ! 603: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xa190200b  ! 604: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x8d902885  ! 605: WRPR_PSTATE_I	wrpr	%r0, 0x0885, %pstate
	.word 0x93a01a62  ! 606: FqTOi	fqtoi	
	.word 0x93d02032  ! 607: Tcc_I	tne	icc_or_xcc, %r0 + 50
	mov 0x35, %r30
	.word 0x91d0001e  ! 608: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b500000  ! 609: RDPR_TPC	rdpr	%tpc, %r5
	.word 0x819822cd  ! 610: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cd, %hpstate
	.word 0x93902004  ! 611: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8efae001  ! 613: SDIVcc_I	sdivcc 	%r11, 0x0001, %r7
	.word 0x93902005  ! 614: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x879022fc  ! 615: WRPR_TT_I	wrpr	%r0, 0x02fc, %tt
	.word 0xcf27c002  ! 616: STF_R	st	%f7, [%r2, %r31]
	.word 0xa190200d  ! 617: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x91d02034  ! 618: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x8d90281b  ! 619: WRPR_PSTATE_I	wrpr	%r0, 0x081b, %pstate
	.word 0xa190200c  ! 620: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x81982c5e  ! 621: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c5e, %hpstate
	.word 0x99a00d25  ! 622: FsMULd	fsmuld	%f0, %f36, %f12
	.word 0x36700001  ! 623: BPGE	<illegal instruction>
	mov 0x30, %r30
	.word 0x91d0001e  ! 624: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9751c000  ! 625: RDPR_TL	rdpr	%tl, %r11
	.word 0x8d902e12  ! 626: WRPR_PSTATE_I	wrpr	%r0, 0x0e12, %pstate
	.word 0x9e80c008  ! 627: ADDcc_R	addcc 	%r3, %r8, %r15
	.word 0x91d02034  ! 628: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x30700001  ! 629: BPA	<illegal instruction>
	.word 0x8480000d  ! 630: ADDcc_R	addcc 	%r0, %r13, %r2
	.word 0xc48fe010  ! 631: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r2
	.word 0xa190200c  ! 632: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xc48008a0  ! 633: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x879020ff  ! 634: WRPR_TT_I	wrpr	%r0, 0x00ff, %tt
	.word 0x93480000  ! 635: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	.word 0x91d02033  ! 636: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x38700001  ! 637: BPGU	<illegal instruction>
	ta	T_CHANGE_TO_TL0	! macro
change_to_tl1_29:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xd2cfe030  ! 640: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r9
	.word 0x93902001  ! 641: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x879022dd  ! 642: WRPR_TT_I	wrpr	%r0, 0x02dd, %tt
	.word 0xd297e010  ! 643: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r9
	.word 0xd28008a0  ! 644: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x8198299c  ! 645: WRHPR_HPSTATE_I	wrhpr	%r0, 0x099c, %hpstate
	.word 0x96d84009  ! 646: SMULcc_R	smulcc 	%r1, %r9, %r11
	ta	T_CHANGE_TO_TL0	! macro
	mov 0x30, %r30
	.word 0x83d0001e  ! 648: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902acd  ! 649: WRPR_PSTATE_I	wrpr	%r0, 0x0acd, %pstate
	.word 0x93902002  ! 650: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa190200d  ! 651: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0x8d9020cd  ! 652: WRPR_PSTATE_I	wrpr	%r0, 0x00cd, %pstate
	.word 0x38800001  ! 653: BGU	bgu,a	<label_0x1>
	.word 0x9d500000  ! 654: RDPR_TPC	rdpr	%tpc, %r14
	.word 0x83a00540  ! 655: FSQRTd	fsqrt	
	.word 0x87902371  ! 656: WRPR_TT_I	wrpr	%r0, 0x0371, %tt
	.word 0x8d902895  ! 657: WRPR_PSTATE_I	wrpr	%r0, 0x0895, %pstate
	.word 0x81982d54  ! 658: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d54, %hpstate
	.word 0xc2c804a0  ! 659: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r1
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xc2800c00  ! 661: LDUWA_R	lduwa	[%r0, %r0] 0x60, %r1
	.word 0x87902043  ! 662: WRPR_TT_I	wrpr	%r0, 0x0043, %tt
	.word 0x9880000f  ! 663: ADDcc_R	addcc 	%r0, %r15, %r12
	.word 0xa1902000  ! 664: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	mov 0x32, %r30
	.word 0x91d0001e  ! 665: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 666: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81982c0f  ! 667: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c0f, %hpstate
	.word 0xa1902003  ! 668: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x83d02030  ! 669: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x96c16001  ! 670: ADDCcc_I	addccc 	%r5, 0x0001, %r11
	.word 0x93902004  ! 671: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	ta	T_CHANGE_HPRIV	! macro
	mov 0x30, %r30
	.word 0x91d0001e  ! 673: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91a00545  ! 674: FSQRTd	fsqrt	
DS_30:
	.word 0x32800001  ! 676: BNE	bne,a	<label_0x1>
	.word 0xc131000c  ! 676: STQF_R	-	%f0, [%r12, %r4]
	normalw
	.word 0x89458000  ! 675: RD_SOFTINT_REG	rd	%softint, %r4
	.word 0xc8c004a0  ! 676: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r4
	.word 0x3c800001  ! 677: BPOS	bpos,a	<label_0x1>
	.word 0x966a000f  ! 678: UDIVX_R	udivx 	%r8, %r15, %r11
	.word 0xd6dfe030  ! 679: LDXA_I	ldxa	[%r31, + 0x0030] %asi, %r11
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d9028c2  ! 681: WRPR_PSTATE_I	wrpr	%r0, 0x08c2, %pstate
	.word 0x93d02031  ! 682: Tcc_I	tne	icc_or_xcc, %r0 + 49
DS_31:
	.word 0x34800001  ! 684: BG	bg,a	<label_0x1>
	pdist %f18, %f2, %f14
	.word 0x93b38301  ! 683: ALLIGNADDRESS	alignaddr	%r14, %r1, %r9
	.word 0xa1902003  ! 684: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x99902005  ! 685: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x93902007  ! 686: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d9028d7  ! 688: WRPR_PSTATE_I	wrpr	%r0, 0x08d7, %pstate
DS_32:
	.word 0x32800001  ! 690: BNE	bne,a	<label_0x1>
	illtrap
	.word 0x91a00543  ! 690: FSQRTd	fsqrt	
	.word 0x81a1082f  ! 689: FADDs	fadds	%f4, %f15, %f0
	.word 0x93902004  ! 690: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x879022a7  ! 691: WRPR_TT_I	wrpr	%r0, 0x02a7, %tt
	.word 0x8d9020ce  ! 692: WRPR_PSTATE_I	wrpr	%r0, 0x00ce, %pstate
	mov 0x35, %r30
	.word 0x91d0001e  ! 693: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc0d7e000  ! 694: LDSHA_I	ldsha	[%r31, + 0x0000] %asi, %r0
	.word 0xc0ffc02f  ! 695: SWAPA_R	swapa	%r0, [%r31 + %r15] 0x01
	.word 0x91d02034  ! 696: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87802014  ! 697: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x9350c000  ! 698: RDPR_TT	rdpr	%tt, %r9
	mov 0x34, %r30
	.word 0x91d0001e  ! 699: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd28008a0  ! 700: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x93902005  ! 701: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
DS_33:
	not %g0, %g2
	call %g2
	.word 0x9d902004  ! 702: WRPR_WSTATE_I	wrpr	%r0, 0x0004, %wstate
	.word 0x8a69e001  ! 703: UDIVX_I	udivx 	%r7, 0x0001, %r5
	.word 0x8d9026c2  ! 704: WRPR_PSTATE_I	wrpr	%r0, 0x06c2, %pstate
	.word 0x87902366  ! 705: WRPR_TT_I	wrpr	%r0, 0x0366, %tt
change_to_tl1_34:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_35:
	.word 0x34800001  ! 708: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 707: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d504000  ! 708: RDPR_TNPC	rdpr	%tnpc, %r6
	.word 0x8790212b  ! 709: WRPR_TT_I	wrpr	%r0, 0x012b, %tt
	.word 0xcc9fc020  ! 710: LDDA_R	ldda	[%r31, %r0] 0x01, %r6
	.word 0x81982495  ! 711: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0495, %hpstate
	.word 0xcc9004a0  ! 712: LDUHA_R	lduha	[%r0, %r0] 0x25, %r6
	.word 0x90484000  ! 713: MULX_R	mulx 	%r1, %r0, %r8
	ta	T_CHANGE_PRIV	! macro
	.word 0xd027c000  ! 715: STW_R	stw	%r8, [%r31 + %r0]
	.word 0x8d540000  ! 716: RDPR_GL	rdpr	%-, %r6
	.word 0x93d02034  ! 717: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x93902003  ! 718: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	mov 0x32, %r30
	.word 0x91d0001e  ! 719: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 720: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982340  ! 721: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0340, %hpstate
	.word 0xa1902000  ! 722: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x93540000  ! 723: RDPR_GL	rdpr	%-, %r9
	.word 0x8d802000  ! 724: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8790224b  ! 725: WRPR_TT_I	wrpr	%r0, 0x024b, %tt
	.word 0x8d802004  ! 726: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x35, %r30
	.word 0x91d0001e  ! 727: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x97702001  ! 728: POPC_I	popc	0x0001, %r11
	.word 0xa1902009  ! 729: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d02031  ! 730: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x86d0a001  ! 731: UMULcc_I	umulcc 	%r2, 0x0001, %r3
	.word 0x8ca9400f  ! 732: ANDNcc_R	andncc 	%r5, %r15, %r6
	.word 0x879023f1  ! 733: WRPR_TT_I	wrpr	%r0, 0x03f1, %tt
	.word 0x83d02034  ! 734: Tcc_I	te	icc_or_xcc, %r0 + 52
DS_36:
	.word 0x22800001  ! 736: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 735: RESTORE_R	restore	%r31, %r0, %r31
	.word 0xa1902000  ! 736: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x87902092  ! 737: WRPR_TT_I	wrpr	%r0, 0x0092, %tt
	.word 0xccd804a0  ! 738: LDXA_R	ldxa	[%r0, %r0] 0x25, %r6
	mov 0x34, %r30
	.word 0x93d0001e  ! 739: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x93d02035  ! 740: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0xcc800b20  ! 741: LDUWA_R	lduwa	[%r0, %r0] 0x59, %r6
	.word 0xa1902003  ! 742: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x91d02030  ! 743: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x9ba01a6b  ! 744: FqTOi	fqtoi	
	mov 0x30, %r30
	.word 0x91d0001e  ! 745: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902008  ! 746: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xda7fe001  ! 747: SWAP_I	swap	%r13, [%r31 + 0x0001]
	mov 0x34, %r30
	.word 0x91d0001e  ! 748: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02035  ! 749: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982e5e  ! 750: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5e, %hpstate
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x9ad2c007  ! 752: UMULcc_R	umulcc 	%r11, %r7, %r13
	.word 0x9b514000  ! 753: RDPR_TBA	rdpr	%tba, %r13
	.word 0x91d02032  ! 754: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xdbe7c027  ! 755: CASA_I	casa	[%r31] 0x 1, %r7, %r13
	.word 0xdb27c007  ! 756: STF_R	st	%f13, [%r7, %r31]
	.word 0x9a81a001  ! 757: ADDcc_I	addcc 	%r6, 0x0001, %r13
	.word 0x819829d4  ! 758: WRHPR_HPSTATE_I	wrhpr	%r0, 0x09d4, %hpstate
change_to_tl1_37:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x879023ae  ! 761: WRPR_TT_I	wrpr	%r0, 0x03ae, %tt
	.word 0xdb37e001  ! 762: STQF_I	-	%f13, [0x0001, %r31]
	.word 0x3c700001  ! 763: BPPOS	<illegal instruction>
	.word 0xa190200b  ! 764: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xa1902003  ! 766: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8ed30004  ! 767: UMULcc_R	umulcc 	%r12, %r4, %r7
	.word 0x9f686001  ! 768: SDIVX_I	sdivx	%r1, 0x0001, %r15
	.word 0x9da00567  ! 769: FSQRTq	fsqrt	
	.word 0x93494000  ! 770: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0x81982f98  ! 771: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f98, %hpstate
	ta	T_CHANGE_PRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x30, %r30
	.word 0x83d0001e  ! 774: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd2cfe010  ! 775: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r9
	.word 0x9769e001  ! 776: SDIVX_I	sdivx	%r7, 0x0001, %r11
	.word 0x8d480000  ! 777: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
change_to_tl1_38:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xccffc027  ! 779: SWAPA_R	swapa	%r6, [%r31 + %r7] 0x01
	.word 0x81a3c9ef  ! 780: FDIVq	dis not found

	.word 0x8d802000  ! 781: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902117  ! 782: WRPR_TT_I	wrpr	%r0, 0x0117, %tt
	.word 0xc03fc00f  ! 783: STD_R	std	%r0, [%r31 + %r15]
	.word 0x2c700001  ! 784: BPNEG	<illegal instruction>
	.word 0x80d90002  ! 785: SMULcc_R	smulcc 	%r4, %r2, %r0
	.word 0x91d02035  ! 786: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x81982e12  ! 787: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e12, %hpstate
	.word 0xa1902000  ! 788: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d90261e  ! 789: WRPR_PSTATE_I	wrpr	%r0, 0x061e, %pstate
	mov 0x35, %r30
	.word 0x91d0001e  ! 790: Tcc_R	ta	icc_or_xcc, %r0 + %r30
change_to_tl1_39:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d90240e  ! 792: WRPR_PSTATE_I	wrpr	%r0, 0x040e, %pstate
DS_40:
	not %g0, %g2
	call %g2
	.word 0x9d902003  ! 793: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x9ba389e8  ! 794: FDIVq	dis not found

	.word 0x8d902e11  ! 795: WRPR_PSTATE_I	wrpr	%r0, 0x0e11, %pstate
	.word 0xda8008a0  ! 796: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r13
	.word 0x98d0e001  ! 797: UMULcc_I	umulcc 	%r3, 0x0001, %r12
	mov 0x32, %r30
	.word 0x91d0001e  ! 798: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_TO_TL0	! macro
DS_41:
	not %g0, %g2
	call %g2
	.word 0x9d902000  ! 800: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x8d802000  ! 801: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02030  ! 802: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x34700001  ! 803: BPG	<illegal instruction>
	.word 0x9e498002  ! 804: MULX_R	mulx 	%r6, %r2, %r15
	.word 0x87902356  ! 805: WRPR_TT_I	wrpr	%r0, 0x0356, %tt
	.word 0x8ba000cb  ! 806: FNEGd	fnegd	%f42, %f36
	.word 0x81982694  ! 807: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0694, %hpstate
	.word 0x8d9024d1  ! 808: WRPR_PSTATE_I	wrpr	%r0, 0x04d1, %pstate
	.word 0x97504000  ! 809: RDPR_TNPC	rdpr	%tnpc, %r11
	.word 0xd68008a0  ! 810: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0xd67fe001  ! 811: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0xa190200b  ! 812: WRPR_GL_I	wrpr	%r0, 0x000b, %-
change_to_tl1_42:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xd6d7e010  ! 814: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r11
	.word 0x879022f3  ! 815: WRPR_TT_I	wrpr	%r0, 0x02f3, %tt
	.word 0x81982e11  ! 816: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e11, %hpstate
	.word 0x87802080  ! 817: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x2a700001  ! 818: BPCS	<illegal instruction>
	.word 0xa1902006  ! 819: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	mov 0x30, %r30
	.word 0x91d0001e  ! 820: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902648  ! 821: WRPR_PSTATE_I	wrpr	%r0, 0x0648, %pstate
	.word 0xd68fe000  ! 822: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r11
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd67fe001  ! 824: SWAP_I	swap	%r11, [%r31 + 0x0001]
	.word 0xa1902009  ! 825: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x93902005  ! 826: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0xa190200a  ! 827: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93902001  ! 828: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982606  ! 829: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0606, %hpstate
	.word 0xd68fe000  ! 830: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r11
	.word 0x879020d8  ! 831: WRPR_TT_I	wrpr	%r0, 0x00d8, %tt
	.word 0x8d902a8b  ! 832: WRPR_PSTATE_I	wrpr	%r0, 0x0a8b, %pstate
	.word 0xd737c00b  ! 833: STQF_R	-	%f11, [%r11, %r31]
DS_43:
	.word 0x34800001  ! 835: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 834: SAVE_R	save	%r31, %r0, %r31
DS_44:
	.word 0x22800001  ! 836: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 835: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x91d02034  ! 836: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x88f9e001  ! 837: SDIVcc_I	sdivcc 	%r7, 0x0001, %r4
	.word 0x91d02032  ! 838: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x93902006  ! 839: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
DS_45:
	.word 0x22800001  ! 841: BE	be,a	<label_0x1>
	.word 0xbfefc000  ! 840: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9ba00540  ! 841: FSQRTd	fsqrt	
	.word 0x85b10fee  ! 842: FONES	fones	%f2
	mov 0x35, %r30
	.word 0x91d0001e  ! 843: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 844: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x876b6001  ! 845: SDIVX_I	sdivx	%r13, 0x0001, %r3
	.word 0x93902000  ! 846: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc68008a0  ! 847: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r3
	.word 0x8198254c  ! 848: WRHPR_HPSTATE_I	wrhpr	%r0, 0x054c, %hpstate
	.word 0x99a1c9ae  ! 849: FDIVs	fdivs	%f7, %f14, %f12
	.word 0x93902000  ! 850: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93d02035  ! 851: Tcc_I	tne	icc_or_xcc, %r0 + 53
	.word 0x8198200c  ! 852: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000c, %hpstate
	.word 0xa1902003  ! 853: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_46:
	.word 0x32800001  ! 855: BNE	bne,a	<label_0x1>
	.word 0xd531e001  ! 855: STQF_I	-	%f10, [0x0001, %r7]
	normalw
	.word 0x81458000  ! 854: RD_SOFTINT_REG	stbar
	mov 0x31, %r30
	.word 0x91d0001e  ! 855: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x92d2400b  ! 856: UMULcc_R	umulcc 	%r9, %r11, %r9
	.word 0x8198231a  ! 857: WRHPR_HPSTATE_I	wrhpr	%r0, 0x031a, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8cd2c00b  ! 860: UMULcc_R	umulcc 	%r11, %r11, %r6
	.word 0x91514000  ! 861: RDPR_TBA	rdpr	%tba, %r8
	.word 0x97a00568  ! 862: FSQRTq	fsqrt	
	.word 0x84692001  ! 863: UDIVX_I	udivx 	%r4, 0x0001, %r2
	.word 0xa190200e  ! 864: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d902a45  ! 865: WRPR_PSTATE_I	wrpr	%r0, 0x0a45, %pstate
	.word 0x93902003  ! 866: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x816b6001  ! 867: SDIVX_I	sdivx	%r13, 0x0001, %r0
	.word 0x91d02031  ! 868: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x93902002  ! 869: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8d802000  ! 870: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xc097e010  ! 871: LDUHA_I	lduha	[%r31, + 0x0010] %asi, %r0
	.word 0x95504000  ! 872: RDPR_TNPC	rdpr	%tnpc, %r10
	.word 0x93902001  ! 873: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982f17  ! 874: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f17, %hpstate
	mov 0x30, %r30
	.word 0x91d0001e  ! 875: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x91d0001e  ! 876: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91494000  ! 877: RDHPR_HTBA	rdhpr	%htba, %r8
	.word 0x93902006  ! 878: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982e45  ! 879: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e45, %hpstate
	.word 0xa190200a  ! 880: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x93902001  ! 881: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8198281b  ! 882: WRHPR_HPSTATE_I	wrhpr	%r0, 0x081b, %hpstate
	.word 0xd0bfe001  ! 883: STDA_I	stda	%r8, [%r31 + 0x0001] %asi
	.word 0x9da089aa  ! 884: FDIVs	fdivs	%f2, %f10, %f14
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x819824d1  ! 886: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d1, %hpstate
	.word 0x87802014  ! 887: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x30800001  ! 888: BA	ba,a	<label_0x1>
	.word 0x8198255c  ! 889: WRHPR_HPSTATE_I	wrhpr	%r0, 0x055c, %hpstate
	.word 0x9d50c000  ! 890: RDPR_TT	rdpr	%tt, %r14
	.word 0x83d02032  ! 891: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x98aa8003  ! 892: ANDNcc_R	andncc 	%r10, %r3, %r12
	.word 0x87902145  ! 893: WRPR_TT_I	wrpr	%r0, 0x0145, %tt
	.word 0x8d802000  ! 894: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9afb8000  ! 895: SDIVcc_R	sdivcc 	%r14, %r0, %r13
	.word 0x87698002  ! 896: SDIVX_R	sdivx	%r6, %r2, %r3
	.word 0xa190200e  ! 897: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0x8d902c84  ! 898: WRPR_PSTATE_I	wrpr	%r0, 0x0c84, %pstate
	.word 0x22700001  ! 899: BPE	<illegal instruction>
	ta	T_CHANGE_NONHPRIV	! macro
	mov 0x35, %r30
	.word 0x91d0001e  ! 901: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021f6  ! 902: WRPR_TT_I	wrpr	%r0, 0x01f6, %tt
	.word 0x93902001  ! 903: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc64fe001  ! 904: LDSB_I	ldsb	[%r31 + 0x0001], %r3
	.word 0x8669c004  ! 905: UDIVX_R	udivx 	%r7, %r4, %r3
	.word 0x8198260c  ! 906: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060c, %hpstate
	.word 0x8198260a  ! 907: WRHPR_HPSTATE_I	wrhpr	%r0, 0x060a, %hpstate
	.word 0x8d90284a  ! 908: WRPR_PSTATE_I	wrpr	%r0, 0x084a, %pstate
	.word 0x9d6a6001  ! 909: SDIVX_I	sdivx	%r9, 0x0001, %r14
	.word 0xdcd804a0  ! 910: LDXA_R	ldxa	[%r0, %r0] 0x25, %r14
	.word 0x91d02032  ! 911: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d9026c7  ! 912: WRPR_PSTATE_I	wrpr	%r0, 0x06c7, %pstate
	.word 0x8198275b  ! 913: WRHPR_HPSTATE_I	wrhpr	%r0, 0x075b, %hpstate
	.word 0xdccfe000  ! 914: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r14
	.word 0x8d90289f  ! 915: WRPR_PSTATE_I	wrpr	%r0, 0x089f, %pstate
	.word 0x91a149cb  ! 916: FDIVd	fdivd	%f36, %f42, %f8
	mov 0x31, %r30
	.word 0x91d0001e  ! 917: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x95a01a60  ! 919: FqTOi	fqtoi	
	.word 0xa1902009  ! 920: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x91d02030  ! 921: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8d802000  ! 922: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x30, %r30
	.word 0x93d0001e  ! 923: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d9024cd  ! 924: WRPR_PSTATE_I	wrpr	%r0, 0x04cd, %pstate
	.word 0x93902002  ! 925: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x91d02033  ! 926: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xd48008a0  ! 927: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r10
	.word 0x86da400c  ! 928: SMULcc_R	smulcc 	%r9, %r12, %r3
	.word 0x91a01a6b  ! 929: FqTOi	fqtoi	
DS_47:
	.word 0x22800001  ! 931: BE	be,a	<label_0x1>
	.word 0xc530e001  ! 931: STQF_I	-	%f2, [0x0001, %r3]
	normalw
	.word 0x9f458000  ! 930: RD_SOFTINT_REG	rd	%softint, %r15
	mov 0x35, %r30
	.word 0x91d0001e  ! 931: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x93d0001e  ! 932: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x85504000  ! 933: RDPR_TNPC	rdpr	%tnpc, %r2
DS_48:
	.word 0x32800001  ! 935: BNE	bne,a	<label_0x1>
	allclean
	.word 0x93b0830b  ! 934: ALLIGNADDRESS	alignaddr	%r2, %r11, %r9
	.word 0x8d902298  ! 935: WRPR_PSTATE_I	wrpr	%r0, 0x0298, %pstate
	.word 0x91500000  ! 936: RDPR_TPC	rdpr	%tpc, %r8
	.word 0x8d50c000  ! 937: RDPR_TT	rdpr	%tt, %r6
	.word 0x9751c000  ! 938: RDPR_TL	rdpr	%tl, %r11
	.word 0x87504000  ! 939: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x9b51c000  ! 940: RDPR_TL	rdpr	%tl, %r13
	.word 0x93494000  ! 941: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0x91d02032  ! 942: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902644  ! 943: WRPR_PSTATE_I	wrpr	%r0, 0x0644, %pstate
	mov 0x30, %r30
	.word 0x91d0001e  ! 944: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x32800001  ! 945: BNE	bne,a	<label_0x1>
	.word 0x81982209  ! 946: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0209, %hpstate
	.word 0x8d902007  ! 947: WRPR_PSTATE_I	wrpr	%r0, 0x0007, %pstate
	.word 0x8d902457  ! 948: WRPR_PSTATE_I	wrpr	%r0, 0x0457, %pstate
	mov 0x33, %r30
	.word 0x91d0001e  ! 949: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x91d0001e  ! 950: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x2a700001  ! 951: BPCS	<illegal instruction>
	.word 0x87902249  ! 952: WRPR_TT_I	wrpr	%r0, 0x0249, %tt
	.word 0x93902002  ! 953: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8790224c  ! 954: WRPR_TT_I	wrpr	%r0, 0x024c, %tt
	.word 0x87902093  ! 955: WRPR_TT_I	wrpr	%r0, 0x0093, %tt
	.word 0x8198220b  ! 956: WRHPR_HPSTATE_I	wrhpr	%r0, 0x020b, %hpstate
	.word 0xa1902001  ! 957: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0xa190200b  ! 958: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x87902390  ! 960: WRPR_TT_I	wrpr	%r0, 0x0390, %tt
	.word 0xd28804a0  ! 961: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0x83d02034  ! 962: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x34700001  ! 963: BPG	<illegal instruction>
	.word 0x81982c51  ! 964: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0c51, %hpstate
	.word 0x9d50c000  ! 965: RDPR_TT	rdpr	%tt, %r14
	.word 0x8d802000  ! 966: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x93902003  ! 967: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	mov 0x30, %r30
	.word 0x93d0001e  ! 968: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9ed0a001  ! 969: UMULcc_I	umulcc 	%r2, 0x0001, %r15
	.word 0x99902005  ! 970: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x8d802000  ! 971: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x9951c000  ! 972: RDPR_TL	rdpr	%tl, %r12
	.word 0x93d02030  ! 973: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x93d02032  ! 974: Tcc_I	tne	icc_or_xcc, %r0 + 50
DS_49:
	.word 0x22800001  ! 976: BE	be,a	<label_0x1>
	pdist %f6, %f22, %f24
	.word 0x93b38303  ! 975: ALLIGNADDRESS	alignaddr	%r14, %r3, %r9
	.word 0xa1902007  ! 976: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x8d802000  ! 977: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8aabc006  ! 978: ANDNcc_R	andncc 	%r15, %r6, %r5
	mov 0x32, %r30
	.word 0x91d0001e  ! 979: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9024d9  ! 980: WRPR_PSTATE_I	wrpr	%r0, 0x04d9, %pstate
	mov 0x32, %r30
	.word 0x91d0001e  ! 981: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879020ca  ! 982: WRPR_TT_I	wrpr	%r0, 0x00ca, %tt
	.word 0xa190200f  ! 983: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x93902005  ! 984: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8b494000  ! 985: RDHPR_HTBA	rdhpr	%htba, %r5
DS_50:
	not %g0, %g2
	call %g2
	.word 0x9d902003  ! 986: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x99902001  ! 987: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x8d902298  ! 988: WRPR_PSTATE_I	wrpr	%r0, 0x0298, %pstate
	.word 0x8d902cc7  ! 989: WRPR_PSTATE_I	wrpr	%r0, 0x0cc7, %pstate
	mov 0x32, %r30
	.word 0x83d0001e  ! 990: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xa190200b  ! 991: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xcac004a0  ! 992: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r5
	.word 0x99902001  ! 993: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0x9c4a4007  ! 994: MULX_R	mulx 	%r9, %r7, %r14
	.word 0x8790200e  ! 995: WRPR_TT_I	wrpr	%r0, 0x000e, %tt
	.word 0x8d9026c9  ! 996: WRPR_PSTATE_I	wrpr	%r0, 0x06c9, %pstate
	.word 0x89a14d25  ! 997: FsMULd	fsmuld	%f5, %f36, %f4
	.word 0x9751c000  ! 998: RDPR_TL	rdpr	%tl, %r11
	.word 0x8e81e001  ! 999: ADDcc_I	addcc 	%r7, 0x0001, %r7
	.word 0x22800001  ! 1000: BE	be,a	<label_0x1>
	.word 0x93902001  ! 1001: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x87802004  ! 1002: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802000  ! 1003: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8ba24d2e  ! 1004: FsMULd	fsmuld	%f9, %f14, %f36
	.word 0xa190200b  ! 1005: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x879021ea  ! 1006: WRPR_TT_I	wrpr	%r0, 0x01ea, %tt
	.word 0x91d02033  ! 1007: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0xcb37c00e  ! 1008: STQF_R	-	%f5, [%r14, %r31]
	.word 0xcac804a0  ! 1009: LDSBA_R	ldsba	[%r0, %r0] 0x25, %r5
	.word 0x8a694006  ! 1010: UDIVX_R	udivx 	%r5, %r6, %r5
	.word 0xa1902008  ! 1011: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0x9fa2c9a3  ! 1012: FDIVs	fdivs	%f11, %f3, %f15
	.word 0x8ed84006  ! 1013: SMULcc_R	smulcc 	%r1, %r6, %r7
	.word 0xa190200a  ! 1014: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8fa01a63  ! 1015: FqTOi	fqtoi	
	.word 0x84d0c008  ! 1016: UMULcc_R	umulcc 	%r3, %r8, %r2
	.word 0x9d686001  ! 1017: SDIVX_I	sdivx	%r1, 0x0001, %r14
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdc8008a0  ! 1019: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x8790221f  ! 1020: WRPR_TT_I	wrpr	%r0, 0x021f, %tt
	.word 0xa1902003  ! 1021: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x93d02030  ! 1022: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x93902006  ! 1023: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x80d1c007  ! 1024: UMULcc_R	umulcc 	%r7, %r7, %r0
DS_51:
	.word 0x22800001  ! 1026: BE	be,a	<label_0x1>
	.word 0x32800001  ! 1026: BNE	bne,a	<label_0x1>
	.word 0x85a00547  ! 1026: FSQRTd	fsqrt	
	.word 0x91a0882a  ! 1025: FADDs	fadds	%f2, %f10, %f8
	.word 0x2e700001  ! 1026: BPVS	<illegal instruction>
	mov 0x31, %r30
	.word 0x91d0001e  ! 1027: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x89540000  ! 1028: RDPR_GL	rdpr	%-, %r4
	.word 0x8d90284a  ! 1029: WRPR_PSTATE_I	wrpr	%r0, 0x084a, %pstate
	.word 0x81540000  ! 1030: RDPR_GL	rdpr	%-, %r0
	.word 0x91d02035  ! 1031: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x80c0e001  ! 1032: ADDCcc_I	addccc 	%r3, 0x0001, %r0
	.word 0x85a309c5  ! 1033: FDIVd	fdivd	%f12, %f36, %f2
	.word 0x8d902448  ! 1034: WRPR_PSTATE_I	wrpr	%r0, 0x0448, %pstate
DS_52:
	.word 0x22800001  ! 1036: BE	be,a	<label_0x1>
	.word 0xc530e001  ! 1036: STQF_I	-	%f2, [0x0001, %r3]
	normalw
	.word 0x85458000  ! 1035: RD_SOFTINT_REG	rd	%softint, %r2
	.word 0x82c16001  ! 1036: ADDCcc_I	addccc 	%r5, 0x0001, %r1
	.word 0x93902001  ! 1037: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xc2ffc025  ! 1038: SWAPA_R	swapa	%r1, [%r31 + %r5] 0x01
	.word 0x87902170  ! 1039: WRPR_TT_I	wrpr	%r0, 0x0170, %tt
	.word 0x8d802000  ! 1040: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x32, %r30
	.word 0x91d0001e  ! 1041: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902005  ! 1042: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9fa000ce  ! 1043: FNEGd	fnegd	%f14, %f46
change_to_tl1_53:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x96d26001  ! 1045: UMULcc_I	umulcc 	%r9, 0x0001, %r11
	.word 0x93902001  ! 1046: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x81982607  ! 1047: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0607, %hpstate
	.word 0x3a800001  ! 1048: BCC	bcc,a	<label_0x1>
	.word 0x81982adc  ! 1049: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0adc, %hpstate
	.word 0x97494000  ! 1050: RDHPR_HTBA	rdhpr	%htba, %r11
	.word 0x9da389a4  ! 1051: FDIVs	fdivs	%f14, %f4, %f14
	mov 0x31, %r30
	.word 0x91d0001e  ! 1052: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8b698007  ! 1053: SDIVX_R	sdivx	%r6, %r7, %r5
	.word 0x99902004  ! 1054: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x83d02032  ! 1055: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x97540000  ! 1056: RDPR_GL	rdpr	%-, %r11
	mov 0x31, %r30
	.word 0x91d0001e  ! 1057: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x34, %r30
	.word 0x91d0001e  ! 1058: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802080  ! 1059: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x9c690000  ! 1060: UDIVX_R	udivx 	%r4, %r0, %r14
	.word 0xa190200e  ! 1061: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	mov 0x31, %r30
	.word 0x91d0001e  ! 1062: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x99902004  ! 1063: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0x8d480000  ! 1064: RDHPR_HPSTATE	rdhpr	%hpstate, %r6
	.word 0x80da4009  ! 1065: SMULcc_R	smulcc 	%r9, %r9, %r0
	.word 0x8d802000  ! 1066: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d9020cf  ! 1067: WRPR_PSTATE_I	wrpr	%r0, 0x00cf, %pstate
	.word 0x819820d1  ! 1068: WRHPR_HPSTATE_I	wrhpr	%r0, 0x00d1, %hpstate
change_to_tl1_54:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xc0ffc029  ! 1070: SWAPA_R	swapa	%r0, [%r31 + %r9] 0x01
	.word 0x8d902edc  ! 1071: WRPR_PSTATE_I	wrpr	%r0, 0x0edc, %pstate
	.word 0x98d18009  ! 1072: UMULcc_R	umulcc 	%r6, %r9, %r12
	.word 0x81982e41  ! 1073: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e41, %hpstate
	.word 0x8d90205c  ! 1074: WRPR_PSTATE_I	wrpr	%r0, 0x005c, %pstate
	.word 0xd8dfe010  ! 1075: LDXA_I	ldxa	[%r31, + 0x0010] %asi, %r12
	.word 0x879020c1  ! 1076: WRPR_TT_I	wrpr	%r0, 0x00c1, %tt
	mov 0x31, %r30
	.word 0x93d0001e  ! 1077: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982cd5  ! 1078: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0cd5, %hpstate
	.word 0xd827c009  ! 1079: STW_R	stw	%r12, [%r31 + %r9]
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93514000  ! 1081: RDPR_TBA	rdpr	%tba, %r9
	.word 0xd2ffc029  ! 1082: SWAPA_R	swapa	%r9, [%r31 + %r9] 0x01
	.word 0x9b494000  ! 1083: RDHPR_HTBA	rdhpr	%htba, %r13
	.word 0x8d90288a  ! 1084: WRPR_PSTATE_I	wrpr	%r0, 0x088a, %pstate
	.word 0x8f504000  ! 1085: RDPR_TNPC	rdpr	%tnpc, %r7
	.word 0x93d02034  ! 1086: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x94fb2001  ! 1087: SDIVcc_I	sdivcc 	%r12, 0x0001, %r10
	.word 0xa190200f  ! 1088: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x8d802000  ! 1089: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902003  ! 1090: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x91d02034  ! 1091: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81982bdf  ! 1092: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdf, %hpstate
	.word 0xa1902002  ! 1093: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x91d02032  ! 1094: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa190200c  ! 1095: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0xa1902003  ! 1096: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x9b69c00e  ! 1097: SDIVX_R	sdivx	%r7, %r14, %r13
	mov 0x31, %r30
	.word 0x93d0001e  ! 1098: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x89a0cdc8  ! 1099: FdMULq	fdmulq	
	.word 0x99902002  ! 1100: WRPR_CLEANWIN_I	wrpr	%r0, 0x0002, %cleanwin
	.word 0x8d494000  ! 1101: RDHPR_HTBA	rdhpr	%htba, %r6
	.word 0xa190200f  ! 1102: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902246  ! 1105: WRPR_PSTATE_I	wrpr	%r0, 0x0246, %pstate
	.word 0x81982a9a  ! 1106: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a9a, %hpstate
	.word 0x81982f1c  ! 1107: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f1c, %hpstate
	.word 0x91d02031  ! 1108: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xccdfe000  ! 1109: LDXA_I	ldxa	[%r31, + 0x0000] %asi, %r6
	.word 0x819822cb  ! 1110: WRHPR_HPSTATE_I	wrhpr	%r0, 0x02cb, %hpstate
	.word 0x8d802000  ! 1111: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa190200c  ! 1112: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	mov 0x31, %r30
	.word 0x83d0001e  ! 1113: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8790208b  ! 1114: WRPR_TT_I	wrpr	%r0, 0x008b, %tt
	.word 0x81a00569  ! 1115: FSQRTq	fsqrt	
	.word 0x94aa8006  ! 1116: ANDNcc_R	andncc 	%r10, %r6, %r10
change_to_tl1_55:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
DS_56:
	.word 0x32800001  ! 1119: BNE	bne,a	<label_0x1>
	.word 0xc7338003  ! 1119: STQF_R	-	%f3, [%r3, %r14]
	normalw
	.word 0x8d458000  ! 1118: RD_SOFTINT_REG	rd	%softint, %r6
	.word 0xcc37e001  ! 1119: STH_I	sth	%r6, [%r31 + 0x0001]
	.word 0x89a01a63  ! 1120: FqTOi	fqtoi	
	.word 0x95508000  ! 1121: RDPR_TSTATE	rdpr	%tstate, %r10
	.word 0xa1902008  ! 1122: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	mov 0x31, %r30
	.word 0x93d0001e  ! 1123: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 1124: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d9022d0  ! 1125: WRPR_PSTATE_I	wrpr	%r0, 0x02d0, %pstate
	.word 0x85a349a6  ! 1126: FDIVs	fdivs	%f13, %f6, %f2
	.word 0x93902006  ! 1127: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x9f540000  ! 1128: RDPR_GL	rdpr	%-, %r15
	.word 0x86834000  ! 1129: ADDcc_R	addcc 	%r13, %r0, %r3
	.word 0x83d02035  ! 1130: Tcc_I	te	icc_or_xcc, %r0 + 53
	.word 0x91d02031  ! 1131: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x8d902695  ! 1132: WRPR_PSTATE_I	wrpr	%r0, 0x0695, %pstate
	.word 0x916b0006  ! 1133: SDIVX_R	sdivx	%r12, %r6, %r8
	.word 0x87802014  ! 1134: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x879021f5  ! 1135: WRPR_TT_I	wrpr	%r0, 0x01f5, %tt
	.word 0x93902001  ! 1136: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0xa1902005  ! 1137: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	mov 0x33, %r30
	.word 0x91d0001e  ! 1138: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_57:
	.word 0x22800001  ! 1140: BE	be,a	<label_0x1>
	.word 0x22800001  ! 1140: BE	be,a	<label_0x1>
	.word 0xca6a6001  ! 1140: LDSTUB_I	ldstub	%r5, [%r9 + 0x0001]
	.word 0x81a10821  ! 1139: FADDs	fadds	%f4, %f1, %f0
	.word 0x8d902ed8  ! 1140: WRPR_PSTATE_I	wrpr	%r0, 0x0ed8, %pstate
	.word 0x93902006  ! 1141: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x87902322  ! 1142: WRPR_TT_I	wrpr	%r0, 0x0322, %tt
	.word 0x8d802000  ! 1143: WRFPRS_I	wr	%r0, 0x0000, %fprs
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x93902002  ! 1145: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8790236e  ! 1146: WRPR_TT_I	wrpr	%r0, 0x036e, %tt
	.word 0x87902070  ! 1147: WRPR_TT_I	wrpr	%r0, 0x0070, %tt
	.word 0x99500000  ! 1148: RDPR_TPC	rdpr	%tpc, %r12
	.word 0x879023e3  ! 1149: WRPR_TT_I	wrpr	%r0, 0x03e3, %tt
	.word 0xd88fe030  ! 1150: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r12
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0xd89004a0  ! 1152: LDUHA_R	lduha	[%r0, %r0] 0x25, %r12
	mov 0x35, %r30
	.word 0x83d0001e  ! 1153: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x9c498006  ! 1154: MULX_R	mulx 	%r6, %r6, %r14
	.word 0x8d802000  ! 1155: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x3a700001  ! 1156: BPCC	<illegal instruction>
	.word 0x9da149a6  ! 1157: FDIVs	fdivs	%f5, %f6, %f14
	.word 0x93902007  ! 1158: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x8d802004  ! 1159: WRFPRS_I	wr	%r0, 0x0004, %fprs
	mov 0x32, %r30
	.word 0x91d0001e  ! 1160: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x89702001  ! 1161: POPC_I	popc	0x0001, %r4
	.word 0x93d02032  ! 1162: Tcc_I	tne	icc_or_xcc, %r0 + 50
change_to_tl1_58:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	mov 0x35, %r30
	.word 0x93d0001e  ! 1164: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x99902000  ! 1165: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	mov 0x31, %r30
	.word 0x91d0001e  ! 1166: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902007  ! 1167: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x91d02034  ! 1168: Tcc_I	ta	icc_or_xcc, %r0 + 52
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x91d02033  ! 1170: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x81982555  ! 1171: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0555, %hpstate
	.word 0x8551c000  ! 1172: RDPR_TL	rdpr	%tl, %r2
	.word 0x93902001  ! 1173: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_tl1_59:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xc4cfe000  ! 1175: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r2
	.word 0x8d802004  ! 1176: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93514000  ! 1177: RDPR_TBA	rdpr	%tba, %r9
DS_60:
	.word 0x32800001  ! 1179: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1178: SAVE_R	save	%r31, %r0, %r31
	.word 0x8550c000  ! 1179: RDPR_TT	rdpr	%tt, %r2
DS_61:
	.word 0x20800001  ! 1181: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1180: SAVE_R	save	%r31, %r0, %r31
	.word 0x93902005  ! 1181: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x8d90249a  ! 1182: WRPR_PSTATE_I	wrpr	%r0, 0x049a, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8790224a  ! 1184: WRPR_TT_I	wrpr	%r0, 0x024a, %tt
	mov 0x34, %r30
	.word 0x91d0001e  ! 1185: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x3c800001  ! 1186: BPOS	bpos,a	<label_0x1>
	.word 0xc47fe001  ! 1187: SWAP_I	swap	%r2, [%r31 + 0x0001]
	.word 0x93902004  ! 1188: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x99a349a6  ! 1189: FDIVs	fdivs	%f13, %f6, %f12
	mov 0x33, %r30
	.word 0x91d0001e  ! 1190: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9e4a0003  ! 1191: MULX_R	mulx 	%r8, %r3, %r15
	.word 0x83d02030  ! 1192: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x87514000  ! 1193: RDPR_TBA	rdpr	%tba, %r3
	.word 0x93494000  ! 1194: RDHPR_HTBA	rdhpr	%htba, %r9
	.word 0xd29fe001  ! 1195: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r9
	.word 0xd28008a0  ! 1196: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r9
	.word 0x81982a49  ! 1197: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a49, %hpstate
	.word 0x93d02033  ! 1198: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0x87902311  ! 1199: WRPR_TT_I	wrpr	%r0, 0x0311, %tt
	.word 0x81982fc2  ! 1200: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fc2, %hpstate
	.word 0xa1902007  ! 1201: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0xa1902006  ! 1202: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xd28804a0  ! 1204: LDUBA_R	lduba	[%r0, %r0] 0x25, %r9
	.word 0x87902188  ! 1205: WRPR_TT_I	wrpr	%r0, 0x0188, %tt
	.word 0x99480000  ! 1206: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x96d04000  ! 1207: UMULcc_R	umulcc 	%r1, %r0, %r11
	.word 0x819827db  ! 1208: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07db, %hpstate
	.word 0x8d90269e  ! 1209: WRPR_PSTATE_I	wrpr	%r0, 0x069e, %pstate
	.word 0xd7e7c020  ! 1210: CASA_I	casa	[%r31] 0x 1, %r0, %r11
	.word 0x8f504000  ! 1211: RDPR_TNPC	rdpr	%tnpc, %r7
DS_62:
	.word 0x22800001  ! 1213: BE	be,a	<label_0x1>
	.word 0xcd30e001  ! 1213: STQF_I	-	%f6, [0x0001, %r3]
	normalw
	.word 0x87458000  ! 1212: RD_SOFTINT_REG	rd	%softint, %r3
	mov 0x31, %r30
	.word 0x93d0001e  ! 1213: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x9c80a001  ! 1214: ADDcc_I	addcc 	%r2, 0x0001, %r14
	.word 0xa1902002  ! 1215: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x87802014  ! 1216: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x95500000  ! 1217: RDPR_TPC	rdpr	%tpc, %r10
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d802004  ! 1219: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902003  ! 1220: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x83a00566  ! 1221: FSQRTq	fsqrt	
	.word 0xa1902009  ! 1222: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x9b6a2001  ! 1223: SDIVX_I	sdivx	%r8, 0x0001, %r13
	ta	T_CHANGE_PRIV	! macro
	.word 0x91480000  ! 1225: RDHPR_HPSTATE	rdhpr	%hpstate, %r8
	.word 0x9150c000  ! 1226: RDPR_TT	rdpr	%tt, %r8
	.word 0x85494000  ! 1227: RDHPR_HTBA	rdhpr	%htba, %r2
change_to_tl1_63:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x81982205  ! 1229: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0205, %hpstate
DS_64:
	.word 0x32800001  ! 1231: BNE	bne,a	<label_0x1>
	.word 0xc732c00f  ! 1231: STQF_R	-	%f3, [%r15, %r11]
	normalw
	.word 0x87458000  ! 1230: RD_SOFTINT_REG	rd	%softint, %r3
	ta	T_CHANGE_HPRIV	! macro
	.word 0x99a000c2  ! 1232: FNEGd	fnegd	%f2, %f12
DS_65:
	.word 0x32800001  ! 1234: BNE	bne,a	<label_0x1>
	.word 0xcb30e001  ! 1234: STQF_I	-	%f5, [0x0001, %r3]
	normalw
	.word 0x91458000  ! 1233: RD_SOFTINT_REG	rd	%softint, %r8
	.word 0xd0800bc0  ! 1234: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r8
	.word 0x93902004  ! 1235: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902650  ! 1236: WRPR_PSTATE_I	wrpr	%r0, 0x0650, %pstate
	.word 0x87802014  ! 1237: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x87702001  ! 1238: POPC_I	popc	0x0001, %r3
	.word 0x81982fdd  ! 1239: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fdd, %hpstate
	.word 0xa1902009  ! 1240: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x99902003  ! 1241: WRPR_CLEANWIN_I	wrpr	%r0, 0x0003, %cleanwin
	.word 0x91d02034  ! 1242: Tcc_I	ta	icc_or_xcc, %r0 + 52
	mov 0x32, %r30
	.word 0x91d0001e  ! 1243: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90244e  ! 1244: WRPR_PSTATE_I	wrpr	%r0, 0x044e, %pstate
	.word 0x804b8009  ! 1245: MULX_R	mulx 	%r14, %r9, %r0
	.word 0x8951c000  ! 1246: RDPR_TL	rdpr	%tl, %r4
	.word 0x9fa18dcc  ! 1247: FdMULq	fdmulq	
	.word 0x91d02034  ! 1248: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x81514000  ! 1249: RDPR_TBA	rdpr	%tba, %r0
	ta	T_CHANGE_HPRIV	! macro
	.word 0xc047c000  ! 1251: LDSW_R	ldsw	[%r31 + %r0], %r0
	.word 0x87902182  ! 1252: WRPR_TT_I	wrpr	%r0, 0x0182, %tt
	.word 0x81982a88  ! 1253: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a88, %hpstate
	.word 0x81982fcd  ! 1254: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcd, %hpstate
	.word 0x85540000  ! 1255: RDPR_GL	rdpr	%-, %r2
	.word 0x8d902ec5  ! 1256: WRPR_PSTATE_I	wrpr	%r0, 0x0ec5, %pstate
	.word 0x8d902495  ! 1257: WRPR_PSTATE_I	wrpr	%r0, 0x0495, %pstate
	.word 0xa1902002  ! 1258: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902007  ! 1259: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0xc5e7c02c  ! 1260: CASA_I	casa	[%r31] 0x 1, %r12, %r2
	.word 0xa1902002  ! 1261: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x93902003  ! 1262: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x93902006  ! 1263: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x879022f6  ! 1264: WRPR_TT_I	wrpr	%r0, 0x02f6, %tt
	.word 0x9fa0c9c0  ! 1265: FDIVd	fdivd	%f34, %f0, %f46
	.word 0x8ac3a001  ! 1266: ADDCcc_I	addccc 	%r14, 0x0001, %r5
	.word 0x91d02031  ! 1267: Tcc_I	ta	icc_or_xcc, %r0 + 49
	mov 0x34, %r30
	.word 0x91d0001e  ! 1268: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x83d0001e  ! 1269: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902895  ! 1270: WRPR_PSTATE_I	wrpr	%r0, 0x0895, %pstate
DS_66:
	.word 0x20800001  ! 1272: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1271: SAVE_R	save	%r31, %r0, %r31
	.word 0xa1902004  ! 1272: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8b540000  ! 1273: RDPR_GL	rdpr	%-, %r5
	.word 0xa1902000  ! 1274: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x91d02031  ! 1275: Tcc_I	ta	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93902000  ! 1277: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
change_to_tl1_67:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x91d02034  ! 1279: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xcac7e010  ! 1280: LDSWA_I	ldswa	[%r31, + 0x0010] %asi, %r5
	.word 0x8d902806  ! 1281: WRPR_PSTATE_I	wrpr	%r0, 0x0806, %pstate
	mov 0x34, %r30
	.word 0x91d0001e  ! 1282: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879021cc  ! 1283: WRPR_TT_I	wrpr	%r0, 0x01cc, %tt
	.word 0x91d02031  ! 1284: Tcc_I	ta	icc_or_xcc, %r0 + 49
	mov 0x32, %r30
	.word 0x91d0001e  ! 1285: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
DS_68:
	.word 0x34800001  ! 1289: BG	bg,a	<label_0x1>
	pdist %f20, %f6, %f6
	.word 0x85b10305  ! 1288: ALLIGNADDRESS	alignaddr	%r4, %r5, %r2
	mov 0x34, %r30
	.word 0x83d0001e  ! 1289: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902284  ! 1290: WRPR_PSTATE_I	wrpr	%r0, 0x0284, %pstate
	.word 0x81982b46  ! 1291: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b46, %hpstate
	mov 0x35, %r30
	.word 0x91d0001e  ! 1292: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d9028dd  ! 1293: WRPR_PSTATE_I	wrpr	%r0, 0x08dd, %pstate
	.word 0x8da0c9c2  ! 1294: FDIVd	fdivd	%f34, %f2, %f6
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9d508000  ! 1296: RDPR_TSTATE	rdpr	%tstate, %r14
DS_69:
	.word 0x34800001  ! 1298: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1297: SAVE_R	save	%r31, %r0, %r31
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x9fa349e0  ! 1299: FDIVq	dis not found

	.word 0xdeffc020  ! 1300: SWAPA_R	swapa	%r15, [%r31 + %r0] 0x01
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x80db8001  ! 1302: SMULcc_R	smulcc 	%r14, %r1, %r0
	.word 0x28800001  ! 1303: BLEU	bleu,a	<label_0x1>
	.word 0x87902136  ! 1304: WRPR_TT_I	wrpr	%r0, 0x0136, %tt
	.word 0x879020de  ! 1305: WRPR_TT_I	wrpr	%r0, 0x00de, %tt
	.word 0x91d02034  ! 1306: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x819826d5  ! 1307: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d5, %hpstate
	.word 0x8d902a0b  ! 1308: WRPR_PSTATE_I	wrpr	%r0, 0x0a0b, %pstate
	.word 0x8d902040  ! 1309: WRPR_PSTATE_I	wrpr	%r0, 0x0040, %pstate
DS_70:
	.word 0x32800001  ! 1311: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1310: SAVE_R	save	%r31, %r0, %r31
	.word 0x93b38fee  ! 1311: FONES	fones	%f9
	.word 0x89480000  ! 1312: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x8d902008  ! 1313: WRPR_PSTATE_I	wrpr	%r0, 0x0008, %pstate
	.word 0x94d3e001  ! 1314: UMULcc_I	umulcc 	%r15, 0x0001, %r10
	.word 0x93902000  ! 1315: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	mov 0x34, %r30
	.word 0x83d0001e  ! 1316: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x35, %r30
	.word 0x91d0001e  ! 1317: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8198200f  ! 1319: WRHPR_HPSTATE_I	wrhpr	%r0, 0x000f, %hpstate
	.word 0x2e700001  ! 1320: BPVS	<illegal instruction>
	.word 0xd407c000  ! 1321: LDUW_R	lduw	[%r31 + %r0], %r10
	.word 0x87802004  ! 1322: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x89a1cd23  ! 1323: FsMULd	fsmuld	%f7, %f34, %f4
	.word 0x93902000  ! 1324: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x93902001  ! 1325: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
change_to_tl1_71:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8f508000  ! 1327: RDPR_TSTATE	rdpr	%tstate, %r7
	.word 0xced7e030  ! 1328: LDSHA_I	ldsha	[%r31, + 0x0030] %asi, %r7
	.word 0x95a01a67  ! 1329: FqTOi	fqtoi	
	.word 0x93902002  ! 1330: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x93902000  ! 1331: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x95514000  ! 1332: RDPR_TBA	rdpr	%tba, %r10
	mov 0x31, %r30
	.word 0x91d0001e  ! 1333: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xd47fe001  ! 1334: SWAP_I	swap	%r10, [%r31 + 0x0001]
	.word 0x8d902c0c  ! 1335: WRPR_PSTATE_I	wrpr	%r0, 0x0c0c, %pstate
DS_72:
	.word 0x20800001  ! 1337: BN	bn,a	<label_0x1>
	.word 0xbfefc000  ! 1336: RESTORE_R	restore	%r31, %r0, %r31
	.word 0x9fa28dce  ! 1337: FdMULq	fdmulq	
	mov 0x33, %r30
	.word 0x83d0001e  ! 1338: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x30, %r30
	.word 0x93d0001e  ! 1339: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x90a90008  ! 1340: ANDNcc_R	andncc 	%r4, %r8, %r8
	.word 0x8d802004  ! 1341: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x8d802000  ! 1342: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x916ae001  ! 1343: SDIVX_I	sdivx	%r11, 0x0001, %r8
	.word 0x26700001  ! 1344: BPL	<illegal instruction>
	mov 0x34, %r30
	.word 0x91d0001e  ! 1345: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87802088  ! 1346: WRASI_I	wr	%r0, 0x0088, %asi
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982993  ! 1348: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0993, %hpstate
	.word 0x819824d2  ! 1349: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04d2, %hpstate
	.word 0x9d540000  ! 1350: RDPR_GL	rdpr	%-, %r14
	.word 0x85540000  ! 1351: RDPR_GL	rdpr	%-, %r2
	.word 0x91d02035  ! 1352: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902005  ! 1353: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x81982a47  ! 1354: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a47, %hpstate
	.word 0x886aa001  ! 1355: UDIVX_I	udivx 	%r10, 0x0001, %r4
	mov 0x30, %r30
	.word 0x91d0001e  ! 1356: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x819825d0  ! 1357: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d0, %hpstate
	.word 0xc837e001  ! 1358: STH_I	sth	%r4, [%r31 + 0x0001]
	.word 0x93d02031  ! 1359: Tcc_I	tne	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8d802004  ! 1361: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x9468c001  ! 1362: UDIVX_R	udivx 	%r3, %r1, %r10
	.word 0x85500000  ! 1363: RDPR_TPC	rdpr	%tpc, %r2
	.word 0x87696001  ! 1364: SDIVX_I	sdivx	%r5, 0x0001, %r3
	.word 0x91508000  ! 1365: RDPR_TSTATE	rdpr	%tstate, %r8
DS_73:
	.word 0x20800001  ! 1367: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1366: SAVE_R	save	%r31, %r0, %r31
	.word 0x81982f4a  ! 1367: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f4a, %hpstate
	.word 0x83504000  ! 1368: RDPR_TNPC	rdpr	%tnpc, %r1
	.word 0x81982f01  ! 1369: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f01, %hpstate
	.word 0xc25fe001  ! 1370: LDX_I	ldx	[%r31 + 0x0001], %r1
	.word 0xa1902003  ! 1371: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8350c000  ! 1373: RDPR_TT	rdpr	%tt, %r1
	mov 0x31, %r30
	.word 0x93d0001e  ! 1374: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x2a800001  ! 1375: BCS	bcs,a	<label_0x1>
	.word 0x87902064  ! 1376: WRPR_TT_I	wrpr	%r0, 0x0064, %tt
	mov 0x35, %r30
	.word 0x83d0001e  ! 1377: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982d84  ! 1378: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d84, %hpstate
	.word 0x81982b0c  ! 1379: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b0c, %hpstate
	.word 0x8fa01a64  ! 1380: FqTOi	fqtoi	
	.word 0x8d90208f  ! 1381: WRPR_PSTATE_I	wrpr	%r0, 0x008f, %pstate
	.word 0x81982e9b  ! 1382: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e9b, %hpstate
	mov 0x32, %r30
	.word 0x91d0001e  ! 1383: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d90224d  ! 1384: WRPR_PSTATE_I	wrpr	%r0, 0x024d, %pstate
	mov 0x35, %r30
	.word 0x91d0001e  ! 1385: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_74:
	.word 0x22800001  ! 1387: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1386: SAVE_R	save	%r31, %r0, %r31
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87902165  ! 1388: WRPR_TT_I	wrpr	%r0, 0x0165, %tt
	.word 0x91d02032  ! 1389: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x819825d0  ! 1390: WRHPR_HPSTATE_I	wrhpr	%r0, 0x05d0, %hpstate
	.word 0x87802004  ! 1391: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x87504000  ! 1392: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x90c32001  ! 1393: ADDCcc_I	addccc 	%r12, 0x0001, %r8
	.word 0x9750c000  ! 1394: RDPR_TT	rdpr	%tt, %r11
	.word 0x89a00563  ! 1395: FSQRTq	fsqrt	
	ta	T_CHANGE_PRIV	! macro
	.word 0xc8d004a0  ! 1397: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r4
	.word 0x8d902cd9  ! 1398: WRPR_PSTATE_I	wrpr	%r0, 0x0cd9, %pstate
	.word 0x8da00dc7  ! 1399: FdMULq	fdmulq	
	.word 0x87802080  ! 1400: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x91d02031  ! 1401: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_75:
	.word 0x22800001  ! 1403: BE	be,a	<label_0x1>
	allclean
	.word 0x87b2030d  ! 1402: ALLIGNADDRESS	alignaddr	%r8, %r13, %r3
	.word 0x3c700001  ! 1403: BPPOS	<illegal instruction>
	.word 0x8198268e  ! 1404: WRHPR_HPSTATE_I	wrhpr	%r0, 0x068e, %hpstate
	.word 0x879022ab  ! 1405: WRPR_TT_I	wrpr	%r0, 0x02ab, %tt
	.word 0xc7e7c02d  ! 1406: CASA_I	casa	[%r31] 0x 1, %r13, %r3
DS_76:
	.word 0x32800001  ! 1408: BNE	bne,a	<label_0x1>
	pdist %f12, %f0, %f12
	.word 0x8db28300  ! 1407: ALLIGNADDRESS	alignaddr	%r10, %r0, %r6
	.word 0x81982f95  ! 1408: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f95, %hpstate
	.word 0x8790223c  ! 1409: WRPR_TT_I	wrpr	%r0, 0x023c, %tt
	.word 0x87902000  ! 1410: WRPR_TT_I	wrpr	%r0, 0x0000, %tt
	.word 0x81982dd0  ! 1411: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0dd0, %hpstate
	.word 0x93902002  ! 1412: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0xa190200e  ! 1413: WRPR_GL_I	wrpr	%r0, 0x000e, %-
	.word 0xcc97e020  ! 1414: LDUHA_I	lduha	[%r31, + 0x0020] %asi, %r6
	.word 0x9ba01a63  ! 1415: FqTOi	fqtoi	
	.word 0x8d902e11  ! 1416: WRPR_PSTATE_I	wrpr	%r0, 0x0e11, %pstate
	.word 0x83d02035  ! 1417: Tcc_I	te	icc_or_xcc, %r0 + 53
change_to_tl1_77:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8b480000  ! 1419: RDHPR_HPSTATE	rdhpr	%hpstate, %r5
	.word 0xcacfe030  ! 1420: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r5
	.word 0x9950c000  ! 1421: RDPR_TT	rdpr	%tt, %r12
	.word 0xd88fe000  ! 1422: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r12
	.word 0x81982817  ! 1423: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0817, %hpstate
	.word 0x93902005  ! 1424: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x24700001  ! 1425: BPLE	<illegal instruction>
	.word 0x8f494000  ! 1426: RDHPR_HTBA	rdhpr	%htba, %r7
	.word 0x819827c3  ! 1427: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07c3, %hpstate
	.word 0x83480000  ! 1428: RDHPR_HPSTATE	rdhpr	%hpstate, %r1
	.word 0xa1902004  ! 1429: WRPR_GL_I	wrpr	%r0, 0x0004, %-
DS_78:
	.word 0x20800001  ! 1431: BN	bn,a	<label_0x1>
	allclean
	.word 0x9db30301  ! 1430: ALLIGNADDRESS	alignaddr	%r12, %r1, %r14
	.word 0x819821d2  ! 1431: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01d2, %hpstate
DS_79:
	.word 0x22800001  ! 1433: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1432: SAVE_R	save	%r31, %r0, %r31
	ta	T_CHANGE_TO_TL0	! macro
	.word 0xdc8008a0  ! 1434: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r14
	.word 0x87902034  ! 1435: WRPR_TT_I	wrpr	%r0, 0x0034, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x85508000  ! 1437: RDPR_TSTATE	rdpr	%tstate, %r2
	.word 0xc537e001  ! 1438: STQF_I	-	%f2, [0x0001, %r31]
	.word 0xa1902003  ! 1439: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x87a0c9e1  ! 1440: FDIVq	dis not found

	.word 0x846a4006  ! 1441: UDIVX_R	udivx 	%r9, %r6, %r2
	.word 0x2c800001  ! 1442: BNEG	bneg,a	<label_0x1>
	.word 0x819827d6  ! 1443: WRHPR_HPSTATE_I	wrhpr	%r0, 0x07d6, %hpstate
	.word 0x879023f4  ! 1444: WRPR_TT_I	wrpr	%r0, 0x03f4, %tt
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x83d02030  ! 1446: Tcc_I	te	icc_or_xcc, %r0 + 48
	.word 0x81982b1d  ! 1447: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b1d, %hpstate
	.word 0x93902005  ! 1448: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x879020c5  ! 1449: WRPR_TT_I	wrpr	%r0, 0x00c5, %tt
	.word 0x93902002  ! 1450: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x8790213b  ! 1451: WRPR_TT_I	wrpr	%r0, 0x013b, %tt
	.word 0xc48008a0  ! 1452: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r2
	.word 0x91d02033  ! 1453: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x36700001  ! 1454: BPGE	<illegal instruction>
	.word 0x95a189e3  ! 1455: FDIVq	dis not found

	ta	T_CHANGE_PRIV	! macro
	.word 0x93902006  ! 1457: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x81982b83  ! 1458: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b83, %hpstate
	.word 0x81982b8f  ! 1459: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b8f, %hpstate
	.word 0xa1902003  ! 1460: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	ta	T_CHANGE_HPRIV	! macro
	.word 0xd4d7e010  ! 1462: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r10
	.word 0x879020f0  ! 1463: WRPR_TT_I	wrpr	%r0, 0x00f0, %tt
	.word 0x93902007  ! 1464: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93902001  ! 1465: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8b6b8003  ! 1466: SDIVX_R	sdivx	%r14, %r3, %r5
	.word 0x83d02034  ! 1467: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x91d02031  ! 1468: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x81982612  ! 1469: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0612, %hpstate
	.word 0x9b51c000  ! 1470: RDPR_TL	rdpr	%tl, %r13
DS_80:
	.word 0x22800001  ! 1472: BE	be,a	<label_0x1>
	.word 0xbfe7c000  ! 1471: SAVE_R	save	%r31, %r0, %r31
	.word 0xdac7e020  ! 1472: LDSWA_I	ldswa	[%r31, + 0x0020] %asi, %r13
	mov 0x35, %r30
	.word 0x91d0001e  ! 1473: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8d902893  ! 1474: WRPR_PSTATE_I	wrpr	%r0, 0x0893, %pstate
change_to_tl1_81:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x9fa01a62  ! 1476: FqTOi	fqtoi	
	mov 0x31, %r30
	.word 0x91d0001e  ! 1477: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x91d0001e  ! 1478: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879022ba  ! 1479: WRPR_TT_I	wrpr	%r0, 0x02ba, %tt
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x80d26001  ! 1481: UMULcc_I	umulcc 	%r9, 0x0001, %r0
	.word 0x879021c9  ! 1482: WRPR_TT_I	wrpr	%r0, 0x01c9, %tt
	.word 0xc0ffc022  ! 1483: SWAPA_R	swapa	%r0, [%r31 + %r2] 0x01
	.word 0x8d802000  ! 1484: WRFPRS_I	wr	%r0, 0x0000, %fprs
	mov 0x34, %r30
	.word 0x91d0001e  ! 1485: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902229  ! 1486: WRPR_TT_I	wrpr	%r0, 0x0229, %tt
	.word 0x88d06001  ! 1487: UMULcc_I	umulcc 	%r1, 0x0001, %r4
	.word 0x97702001  ! 1488: POPC_I	popc	0x0001, %r11
	.word 0x81982894  ! 1489: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0894, %hpstate
	.word 0x87a10dc0  ! 1490: FdMULq	fdmulq	
	.word 0x844a4004  ! 1491: MULX_R	mulx 	%r9, %r4, %r2
	ta	T_CHANGE_PRIV	! macro
	.word 0x99540000  ! 1493: RDPR_GL	rdpr	%-, %r12
	.word 0x8d9020d4  ! 1494: WRPR_PSTATE_I	wrpr	%r0, 0x00d4, %pstate
	.word 0xa1902002  ! 1495: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x9e81e001  ! 1496: ADDcc_I	addcc 	%r7, 0x0001, %r15
	.word 0x81982e14  ! 1497: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e14, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x9c814002  ! 1499: ADDcc_R	addcc 	%r5, %r2, %r14
	.word 0x8198230d  ! 1500: WRHPR_HPSTATE_I	wrhpr	%r0, 0x030d, %hpstate
	.word 0x91d02034  ! 1501: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x93902001  ! 1502: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	mov 0x35, %r30
	.word 0x93d0001e  ! 1503: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902352  ! 1504: WRPR_TT_I	wrpr	%r0, 0x0352, %tt
	.word 0x81982308  ! 1505: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0308, %hpstate
	.word 0x8d902cd9  ! 1506: WRPR_PSTATE_I	wrpr	%r0, 0x0cd9, %pstate
	.word 0x93902006  ! 1507: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x91d02030  ! 1508: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x8f514000  ! 1509: RDPR_TBA	rdpr	%tba, %r7
DS_82:
	.word 0x34800001  ! 1511: BG	bg,a	<label_0x1>
	illtrap
	.word 0x8da00540  ! 1511: FSQRTd	fsqrt	
	.word 0x83a30824  ! 1510: FADDs	fadds	%f12, %f4, %f1
	.word 0xc28008a0  ! 1511: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r1
	.word 0x8551c000  ! 1512: RDPR_TL	rdpr	%tl, %r2
	.word 0x8d90244d  ! 1513: WRPR_PSTATE_I	wrpr	%r0, 0x044d, %pstate
	.word 0xc4800ac0  ! 1514: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r2
	.word 0x81982991  ! 1515: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0991, %hpstate
	.word 0x81982d9a  ! 1516: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0d9a, %hpstate
	.word 0x93902002  ! 1517: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	mov 0x33, %r30
	.word 0x93d0001e  ! 1518: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87902133  ! 1519: WRPR_TT_I	wrpr	%r0, 0x0133, %tt
	.word 0x8d902089  ! 1520: WRPR_PSTATE_I	wrpr	%r0, 0x0089, %pstate
	.word 0x93a14dc1  ! 1521: FdMULq	fdmulq	
	.word 0x87902029  ! 1522: WRPR_TT_I	wrpr	%r0, 0x0029, %tt
	.word 0x87802004  ! 1523: WRASI_I	wr	%r0, 0x0004, %asi
	.word 0x8d802000  ! 1524: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d902c89  ! 1525: WRPR_PSTATE_I	wrpr	%r0, 0x0c89, %pstate
	.word 0x93d02033  ! 1526: Tcc_I	tne	icc_or_xcc, %r0 + 51
	.word 0xa190200b  ! 1527: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xd2c80e80  ! 1528: LDSBA_R	ldsba	[%r0, %r0] 0x74, %r9
	.word 0x8790229c  ! 1529: WRPR_TT_I	wrpr	%r0, 0x029c, %tt
	.word 0x93902003  ! 1530: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x83d02034  ! 1531: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8d802000  ! 1532: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x81982a85  ! 1533: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a85, %hpstate
	.word 0x8d902cc8  ! 1534: WRPR_PSTATE_I	wrpr	%r0, 0x0cc8, %pstate
	.word 0x8d802000  ! 1535: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8198235d  ! 1536: WRHPR_HPSTATE_I	wrhpr	%r0, 0x035d, %hpstate
	.word 0x8b702001  ! 1537: POPC_I	popc	0x0001, %r5
	.word 0x91d02032  ! 1538: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8d902255  ! 1539: WRPR_PSTATE_I	wrpr	%r0, 0x0255, %pstate
	.word 0x91d02031  ! 1540: Tcc_I	ta	icc_or_xcc, %r0 + 49
	mov 0x35, %r30
	.word 0x93d0001e  ! 1541: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d902610  ! 1542: WRPR_PSTATE_I	wrpr	%r0, 0x0610, %pstate
	.word 0x96f84004  ! 1543: SDIVcc_R	sdivcc 	%r1, %r4, %r11
	.word 0xd68008a0  ! 1544: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x81b18fed  ! 1545: FONES	fones	%f0
	.word 0x93902002  ! 1546: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9cfb2001  ! 1547: SDIVcc_I	sdivcc 	%r12, 0x0001, %r14
	ta	T_CHANGE_TO_TL0	! macro
change_to_tl1_83:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xdc5fc000  ! 1550: LDX_R	ldx	[%r31 + %r0], %r14
	.word 0x99902004  ! 1551: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	mov 0x35, %r30
	.word 0x93d0001e  ! 1552: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x85a00542  ! 1553: FSQRTd	fsqrt	
	mov 0x31, %r30
	.word 0x91d0001e  ! 1554: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xc4d004a0  ! 1555: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r2
	.word 0x8ba189a6  ! 1556: FDIVs	fdivs	%f6, %f6, %f5
	.word 0x92d3a001  ! 1557: UMULcc_I	umulcc 	%r14, 0x0001, %r9
	.word 0x9fa2cd24  ! 1558: FsMULd	fsmuld	%f11, %f4, %f46
	ta	T_CHANGE_PRIV	! macro
	.word 0x8d902a93  ! 1560: WRPR_PSTATE_I	wrpr	%r0, 0x0a93, %pstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_HPRIV	! macro
	.word 0x87802014  ! 1563: WRASI_I	wr	%r0, 0x0014, %asi
	mov 0x33, %r30
	.word 0x93d0001e  ! 1564: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02031  ! 1565: Tcc_I	ta	icc_or_xcc, %r0 + 49
DS_84:
	not %g0, %g2
	call %g2
	.word 0x9d902000  ! 1566: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x9649000b  ! 1567: MULX_R	mulx 	%r4, %r11, %r11
	.word 0xd68804a0  ! 1568: LDUBA_R	lduba	[%r0, %r0] 0x25, %r11
	.word 0x8198271d  ! 1569: WRHPR_HPSTATE_I	wrhpr	%r0, 0x071d, %hpstate
DS_85:
	.word 0x20800001  ! 1571: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1570: SAVE_R	save	%r31, %r0, %r31
	.word 0xd73fc00b  ! 1571: STDF_R	std	%f11, [%r11, %r31]
	.word 0x9f540000  ! 1572: RDPR_GL	rdpr	%-, %r15
	.word 0x8d902255  ! 1573: WRPR_PSTATE_I	wrpr	%r0, 0x0255, %pstate
	.word 0x93902005  ! 1574: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x93902001  ! 1575: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8b50c000  ! 1576: RDPR_TT	rdpr	%tt, %r5
	.word 0x87902384  ! 1577: WRPR_TT_I	wrpr	%r0, 0x0384, %tt
	.word 0xa190200d  ! 1578: WRPR_GL_I	wrpr	%r0, 0x000d, %-
	.word 0xca1fc000  ! 1579: LDD_R	ldd	[%r31 + %r0], %r5
	.word 0xa1902009  ! 1580: WRPR_GL_I	wrpr	%r0, 0x0009, %-
	.word 0x8d6b6001  ! 1581: SDIVX_I	sdivx	%r13, 0x0001, %r6
	.word 0x81982fcb  ! 1582: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0fcb, %hpstate
	.word 0xccd80e40  ! 1583: LDXA_R	ldxa	[%r0, %r0] 0x72, %r6
	.word 0xcc0fe001  ! 1584: LDUB_I	ldub	[%r31 + 0x0001], %r6
	mov 0x32, %r30
	.word 0x93d0001e  ! 1585: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d902c9d  ! 1587: WRPR_PSTATE_I	wrpr	%r0, 0x0c9d, %pstate
	.word 0x819821cc  ! 1588: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cc, %hpstate
	.word 0xcc6fe001  ! 1589: LDSTUB_I	ldstub	%r6, [%r31 + 0x0001]
	.word 0x8d902042  ! 1590: WRPR_PSTATE_I	wrpr	%r0, 0x0042, %pstate
	.word 0x8b508000  ! 1591: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0xcacfe020  ! 1592: LDSBA_I	ldsba	[%r31, + 0x0020] %asi, %r5
	.word 0x85a01a6c  ! 1593: FqTOi	fqtoi	
	.word 0x879023f6  ! 1594: WRPR_TT_I	wrpr	%r0, 0x03f6, %tt
	.word 0x8b50c000  ! 1595: RDPR_TT	rdpr	%tt, %r5
	.word 0xcb27c00c  ! 1596: STF_R	st	%f5, [%r12, %r31]
	.word 0x83d02032  ! 1597: Tcc_I	te	icc_or_xcc, %r0 + 50
	.word 0x819826d0  ! 1598: WRHPR_HPSTATE_I	wrhpr	%r0, 0x06d0, %hpstate
	.word 0x93902000  ! 1599: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xa1902000  ! 1600: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x8d514000  ! 1601: RDPR_TBA	rdpr	%tba, %r6
DS_86:
	.word 0x22800001  ! 1603: BE	be,a	<label_0x1>
	pdist %f14, %f12, %f10
	.word 0x81b1430a  ! 1602: ALLIGNADDRESS	alignaddr	%r5, %r10, %r0
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93902000  ! 1604: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x81982147  ! 1605: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0147, %hpstate
	.word 0x93902003  ! 1606: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	ta	T_CHANGE_HPRIV	! macro
	.word 0xa190200c  ! 1608: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	.word 0x87802080  ! 1609: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902642  ! 1610: WRPR_PSTATE_I	wrpr	%r0, 0x0642, %pstate
	.word 0x87902336  ! 1611: WRPR_TT_I	wrpr	%r0, 0x0336, %tt
DS_87:
	.word 0x32800001  ! 1613: BNE	bne,a	<label_0x1>
	allclean
	.word 0x81b10302  ! 1612: ALLIGNADDRESS	alignaddr	%r4, %r2, %r0
	.word 0xc007e001  ! 1613: LDUW_I	lduw	[%r31 + 0x0001], %r0
	.word 0x89508000  ! 1614: RDPR_TSTATE	rdpr	%tstate, %r4
	mov 0x33, %r30
	.word 0x91d0001e  ! 1615: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x9d494000  ! 1616: RDHPR_HTBA	rdhpr	%htba, %r14
	.word 0x24700001  ! 1617: BPLE	<illegal instruction>
	.word 0x98fba001  ! 1618: SDIVcc_I	sdivcc 	%r14, 0x0001, %r12
	mov 0x32, %r30
	.word 0x83d0001e  ! 1619: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xd857e001  ! 1620: LDSH_I	ldsh	[%r31 + 0x0001], %r12
	.word 0x93902005  ! 1621: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	mov 0x31, %r30
	.word 0x91d0001e  ! 1622: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02030  ! 1623: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x81982253  ! 1624: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0253, %hpstate
	.word 0x9a69c006  ! 1625: UDIVX_R	udivx 	%r7, %r6, %r13
	.word 0xda800bc0  ! 1626: LDUWA_R	lduwa	[%r0, %r0] 0x5e, %r13
	.word 0x87504000  ! 1627: RDPR_TNPC	rdpr	%tnpc, %r3
	.word 0x97494000  ! 1628: RDHPR_HTBA	rdhpr	%htba, %r11
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8e82000c  ! 1630: ADDcc_R	addcc 	%r8, %r12, %r7
	.word 0x91d02033  ! 1631: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x8d902cca  ! 1632: WRPR_PSTATE_I	wrpr	%r0, 0x0cca, %pstate
	.word 0xcec004a0  ! 1633: LDSWA_R	ldswa	[%r0, %r0] 0x25, %r7
	.word 0x89a2c9a9  ! 1634: FDIVs	fdivs	%f11, %f9, %f4
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d902c97  ! 1636: WRPR_PSTATE_I	wrpr	%r0, 0x0c97, %pstate
	.word 0x87514000  ! 1637: RDPR_TBA	rdpr	%tba, %r3
	.word 0x8790222b  ! 1638: WRPR_TT_I	wrpr	%r0, 0x022b, %tt
	.word 0xc68fe020  ! 1639: LDUBA_I	lduba	[%r31, + 0x0020] %asi, %r3
	.word 0x8d902c9e  ! 1640: WRPR_PSTATE_I	wrpr	%r0, 0x0c9e, %pstate
	.word 0x96d26001  ! 1641: UMULcc_I	umulcc 	%r9, 0x0001, %r11
	.word 0xd6d80e80  ! 1642: LDXA_R	ldxa	[%r0, %r0] 0x74, %r11
	.word 0x879021a9  ! 1643: WRPR_TT_I	wrpr	%r0, 0x01a9, %tt
	.word 0x87902063  ! 1644: WRPR_TT_I	wrpr	%r0, 0x0063, %tt
	.word 0x81a00542  ! 1645: FSQRTd	fsqrt	
	.word 0x93902007  ! 1646: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	.word 0x93d02035  ! 1647: Tcc_I	tne	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_HPRIV	! macro
	.word 0x81982f03  ! 1649: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f03, %hpstate
	.word 0x9ad12001  ! 1650: UMULcc_I	umulcc 	%r4, 0x0001, %r13
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x879021ef  ! 1652: WRPR_TT_I	wrpr	%r0, 0x01ef, %tt
	.word 0xdaffc022  ! 1653: SWAPA_R	swapa	%r13, [%r31 + %r2] 0x01
	.word 0x91d02030  ! 1654: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x9683c000  ! 1655: ADDcc_R	addcc 	%r15, %r0, %r11
	.word 0xd737e001  ! 1656: STQF_I	-	%f11, [0x0001, %r31]
	.word 0x93480000  ! 1657: RDHPR_HPSTATE	rdhpr	%hpstate, %r9
	mov 0x35, %r30
	.word 0x91d0001e  ! 1658: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x87902185  ! 1659: WRPR_TT_I	wrpr	%r0, 0x0185, %tt
	.word 0x8d802000  ! 1660: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0xa1902001  ! 1661: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x87902317  ! 1662: WRPR_TT_I	wrpr	%r0, 0x0317, %tt
	.word 0x85a30d2f  ! 1663: FsMULd	fsmuld	%f12, %f46, %f2
	.word 0xc4900e60  ! 1664: LDUHA_R	lduha	[%r0, %r0] 0x73, %r2
	.word 0x87702001  ! 1665: POPC_I	popc	0x0001, %r3
	.word 0x87902337  ! 1666: WRPR_TT_I	wrpr	%r0, 0x0337, %tt
	.word 0x8d902096  ! 1667: WRPR_PSTATE_I	wrpr	%r0, 0x0096, %pstate
	.word 0x9968000d  ! 1668: SDIVX_R	sdivx	%r0, %r13, %r12
	.word 0xa1902006  ! 1669: WRPR_GL_I	wrpr	%r0, 0x0006, %-
	.word 0xa190200b  ! 1670: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0x87902188  ! 1671: WRPR_TT_I	wrpr	%r0, 0x0188, %tt
	.word 0x8d802004  ! 1672: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x87902008  ! 1673: WRPR_TT_I	wrpr	%r0, 0x0008, %tt
	mov 0x30, %r30
	.word 0x83d0001e  ! 1674: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982046  ! 1675: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0046, %hpstate
	.word 0x83494000  ! 1676: RDHPR_HTBA	rdhpr	%htba, %r1
	.word 0x93500000  ! 1677: RDPR_TPC	rdpr	%tpc, %r9
	.word 0x91d02032  ! 1678: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x884ac00b  ! 1679: MULX_R	mulx 	%r11, %r11, %r4
	.word 0xc88804a0  ! 1680: LDUBA_R	lduba	[%r0, %r0] 0x25, %r4
	.word 0xc87fe001  ! 1681: SWAP_I	swap	%r4, [%r31 + 0x0001]
	mov 0x30, %r30
	.word 0x91d0001e  ! 1682: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x8caac003  ! 1683: ANDNcc_R	andncc 	%r11, %r3, %r6
	.word 0x83b00fe2  ! 1684: FONES	fones	%f1
	.word 0x91d02035  ! 1685: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0xa1902007  ! 1686: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	ta	T_CHANGE_PRIV	! macro
DS_88:
	.word 0x22800001  ! 1689: BE	be,a	<label_0x1>
	.word 0xd1320006  ! 1689: STQF_R	-	%f8, [%r6, %r8]
	normalw
	.word 0x87458000  ! 1688: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x8b508000  ! 1689: RDPR_TSTATE	rdpr	%tstate, %r5
	.word 0x9b514000  ! 1690: RDPR_TBA	rdpr	%tba, %r13
	.word 0x8d9028d8  ! 1691: WRPR_PSTATE_I	wrpr	%r0, 0x08d8, %pstate
	.word 0x93902005  ! 1692: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	mov 0x30, %r30
	.word 0x91d0001e  ! 1693: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_89:
	.word 0x32800001  ! 1695: BNE	bne,a	<label_0x1>
	.word 0xbfe7c000  ! 1694: SAVE_R	save	%r31, %r0, %r31
	.word 0x91d02035  ! 1695: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x87802089  ! 1696: WRASI_I	wr	%r0, 0x0089, %asi
	.word 0x93b20fe9  ! 1697: FONES	fones	%f9
	.word 0xd217c000  ! 1698: LDUH_R	lduh	[%r31 + %r0], %r9
	.word 0x93902005  ! 1699: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x99504000  ! 1700: RDPR_TNPC	rdpr	%tnpc, %r12
	.word 0xd86fe001  ! 1701: LDSTUB_I	ldstub	%r12, [%r31 + 0x0001]
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x8b684001  ! 1703: SDIVX_R	sdivx	%r1, %r1, %r5
	.word 0xca8fe010  ! 1704: LDUBA_I	lduba	[%r31, + 0x0010] %asi, %r5
	.word 0x81982844  ! 1705: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0844, %hpstate
	.word 0xcb37e001  ! 1706: STQF_I	-	%f5, [0x0001, %r31]
DS_90:
	not %g0, %g2
	call %g2
	.word 0x9d902000  ! 1707: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0x91d02035  ! 1708: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x95692001  ! 1709: SDIVX_I	sdivx	%r4, 0x0001, %r10
	.word 0x91d02031  ! 1710: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0xd48fe030  ! 1711: LDUBA_I	lduba	[%r31, + 0x0030] %asi, %r10
	.word 0x8d90289a  ! 1712: WRPR_PSTATE_I	wrpr	%r0, 0x089a, %pstate
	.word 0x9da00548  ! 1713: FSQRTd	fsqrt	
	mov 0x31, %r30
	.word 0x93d0001e  ! 1714: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x81982f99  ! 1715: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0f99, %hpstate
	.word 0xdd3fc008  ! 1716: STDF_R	std	%f14, [%r8, %r31]
	mov 0x33, %r30
	.word 0x91d0001e  ! 1717: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xa1902008  ! 1718: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	.word 0xdcd00e60  ! 1719: LDSHA_R	ldsha	[%r0, %r0] 0x73, %r14
	.word 0x2c800001  ! 1720: BNEG	bneg,a	<label_0x1>
	.word 0x91d02035  ! 1721: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902005  ! 1722: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	mov 0x30, %r30
	.word 0x83d0001e  ! 1723: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d802000  ! 1724: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802004  ! 1725: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902004  ! 1726: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	mov 0x33, %r30
	.word 0x91d0001e  ! 1727: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982a4c  ! 1728: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a4c, %hpstate
	.word 0xdc800ac0  ! 1729: LDUWA_R	lduwa	[%r0, %r0] 0x56, %r14
	.word 0x38800001  ! 1730: BGU	bgu,a	<label_0x1>
	.word 0xdd27e001  ! 1731: STF_I	st	%f14, [0x0001, %r31]
	mov 0x33, %r30
	.word 0x91d0001e  ! 1732: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0xdc5fc000  ! 1733: LDX_R	ldx	[%r31 + %r0], %r14
	.word 0x89508000  ! 1734: RDPR_TSTATE	rdpr	%tstate, %r4
	.word 0x99902000  ! 1735: WRPR_CLEANWIN_I	wrpr	%r0, 0x0000, %cleanwin
	.word 0x8d902c97  ! 1736: WRPR_PSTATE_I	wrpr	%r0, 0x0c97, %pstate
	.word 0x93902000  ! 1737: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xc89fc020  ! 1738: LDDA_R	ldda	[%r31, %r0] 0x01, %r4
	.word 0x87902212  ! 1739: WRPR_TT_I	wrpr	%r0, 0x0212, %tt
	.word 0x30700001  ! 1740: BPA	<illegal instruction>
	.word 0x879022d3  ! 1741: WRPR_TT_I	wrpr	%r0, 0x02d3, %tt
	mov 0x32, %r30
	.word 0x83d0001e  ! 1742: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xc8d7e010  ! 1743: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r4
	.word 0xa1902000  ! 1744: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	mov 0x34, %r30
	.word 0x83d0001e  ! 1745: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 1746: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0xa1902000  ! 1747: WRPR_GL_I	wrpr	%r0, 0x0000, %-
	.word 0x99902001  ! 1748: WRPR_CLEANWIN_I	wrpr	%r0, 0x0001, %cleanwin
	.word 0xc927c008  ! 1749: STF_R	st	%f4, [%r8, %r31]
	.word 0x83540000  ! 1750: RDPR_GL	rdpr	%-, %r1
	.word 0xc2800b80  ! 1751: LDUWA_R	lduwa	[%r0, %r0] 0x5c, %r1
	.word 0x9a480005  ! 1752: MULX_R	mulx 	%r0, %r5, %r13
	.word 0xa1902003  ! 1753: WRPR_GL_I	wrpr	%r0, 0x0003, %-
	.word 0x8790228d  ! 1754: WRPR_TT_I	wrpr	%r0, 0x028d, %tt
	.word 0x879023f1  ! 1755: WRPR_TT_I	wrpr	%r0, 0x03f1, %tt
	mov 0x33, %r30
	.word 0x93d0001e  ! 1756: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x91d02034  ! 1757: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0x87902013  ! 1758: WRPR_TT_I	wrpr	%r0, 0x0013, %tt
	.word 0x87902256  ! 1759: WRPR_TT_I	wrpr	%r0, 0x0256, %tt
	.word 0xa1902002  ! 1760: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0x9f508000  ! 1761: RDPR_TSTATE	rdpr	%tstate, %r15
	.word 0x87802080  ! 1762: WRASI_I	wr	%r0, 0x0080, %asi
change_to_tl1_91:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x8d902a4e  ! 1764: WRPR_PSTATE_I	wrpr	%r0, 0x0a4e, %pstate
	.word 0x8d802000  ! 1765: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x99480000  ! 1766: RDHPR_HPSTATE	rdhpr	%hpstate, %r12
	.word 0x26700001  ! 1767: BPL	<illegal instruction>
	.word 0x93a24dc8  ! 1768: FdMULq	fdmulq	
	.word 0xa1902002  ! 1769: WRPR_GL_I	wrpr	%r0, 0x0002, %-
	.word 0xd2cfe000  ! 1770: LDSBA_I	ldsba	[%r31, + 0x0000] %asi, %r9
	.word 0x91d02030  ! 1771: Tcc_I	ta	icc_or_xcc, %r0 + 48
	.word 0x93902006  ! 1772: WRPR_CWP_I	wrpr	%r0, 0x0006, %cwp
	.word 0x93902002  ! 1773: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x81982b43  ! 1774: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b43, %hpstate
	.word 0x91d02034  ! 1775: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xd2d7e010  ! 1776: LDSHA_I	ldsha	[%r31, + 0x0010] %asi, %r9
change_to_tl1_92:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa190200f  ! 1778: WRPR_GL_I	wrpr	%r0, 0x000f, %-
	.word 0x99902005  ! 1779: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	.word 0x91d02034  ! 1780: Tcc_I	ta	icc_or_xcc, %r0 + 52
	mov 0x35, %r30
	.word 0x91d0001e  ! 1781: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x81982e5a  ! 1782: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0e5a, %hpstate
	.word 0x90fa6001  ! 1783: SDIVcc_I	sdivcc 	%r9, 0x0001, %r8
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x8d90289c  ! 1785: WRPR_PSTATE_I	wrpr	%r0, 0x089c, %pstate
	.word 0x93902003  ! 1786: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x99902004  ! 1787: WRPR_CLEANWIN_I	wrpr	%r0, 0x0004, %cleanwin
	.word 0xd1e7c028  ! 1788: CASA_I	casa	[%r31] 0x 1, %r8, %r8
	.word 0x819824c6  ! 1789: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04c6, %hpstate
	ta	T_CHANGE_PRIV	! macro
	.word 0x97a00565  ! 1791: FSQRTq	fsqrt	
	.word 0xd69004a0  ! 1792: LDUHA_R	lduha	[%r0, %r0] 0x25, %r11
DS_93:
	not %g0, %g2
	call %g2
	.word 0x9d902000  ! 1793: WRPR_WSTATE_I	wrpr	%r0, 0x0000, %wstate
	.word 0xd68008a0  ! 1794: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r11
	.word 0x9fa000cb  ! 1795: FNEGd	fnegd	%f42, %f46
	.word 0x8db20fe6  ! 1796: FONES	fones	%f6
DS_94:
	.word 0x20800001  ! 1798: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1797: SAVE_R	save	%r31, %r0, %r31
	.word 0x8bb24fe9  ! 1798: FONES	fones	%f5
	ta	T_CHANGE_PRIV	! macro
	mov 0x34, %r30
	.word 0x91d0001e  ! 1800: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02031  ! 1801: Tcc_I	te	icc_or_xcc, %r0 + 49
	.word 0x93902005  ! 1802: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x81982506  ! 1803: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0506, %hpstate
	.word 0x8d902010  ! 1804: WRPR_PSTATE_I	wrpr	%r0, 0x0010, %pstate
	.word 0xca8fe000  ! 1805: LDUBA_I	lduba	[%r31, + 0x0000] %asi, %r5
	.word 0x9db14fef  ! 1806: FONES	fones	%f14
	.word 0x89480000  ! 1807: RDHPR_HPSTATE	rdhpr	%hpstate, %r4
	.word 0x86d3c007  ! 1808: UMULcc_R	umulcc 	%r15, %r7, %r3
	.word 0x81982740  ! 1809: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0740, %hpstate
	.word 0xa190200a  ! 1810: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x8d802004  ! 1811: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0x93902001  ! 1812: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d902a95  ! 1813: WRPR_PSTATE_I	wrpr	%r0, 0x0a95, %pstate
	.word 0x8ad3c007  ! 1814: UMULcc_R	umulcc 	%r15, %r7, %r5
	.word 0x9b692001  ! 1815: SDIVX_I	sdivx	%r4, 0x0001, %r13
	.word 0x81982ac5  ! 1816: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac5, %hpstate
DS_95:
	.word 0x34800001  ! 1818: BG	bg,a	<label_0x1>
	pdist %f30, %f20, %f2
	.word 0x81b3430e  ! 1817: ALLIGNADDRESS	alignaddr	%r13, %r14, %r0
	.word 0x81982a87  ! 1818: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0a87, %hpstate
	.word 0x93902002  ! 1819: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x9f500000  ! 1820: RDPR_TPC	rdpr	%tpc, %r15
	.word 0x91d02034  ! 1821: Tcc_I	ta	icc_or_xcc, %r0 + 52
	.word 0xa1902007  ! 1822: WRPR_GL_I	wrpr	%r0, 0x0007, %-
	.word 0x87902392  ! 1823: WRPR_TT_I	wrpr	%r0, 0x0392, %tt
	.word 0x93902004  ! 1824: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
	.word 0x8d902253  ! 1825: WRPR_PSTATE_I	wrpr	%r0, 0x0253, %pstate
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x91d02031  ! 1827: Tcc_I	ta	icc_or_xcc, %r0 + 49
	.word 0x87902326  ! 1828: WRPR_TT_I	wrpr	%r0, 0x0326, %tt
	.word 0x8da000c5  ! 1829: FNEGd	fnegd	%f36, %f6
	.word 0xa1902004  ! 1830: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x8d902441  ! 1831: WRPR_PSTATE_I	wrpr	%r0, 0x0441, %pstate
	.word 0x8790228e  ! 1832: WRPR_TT_I	wrpr	%r0, 0x028e, %tt
	.word 0x87508000  ! 1833: RDPR_TSTATE	rdpr	%tstate, %r3
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x93902003  ! 1835: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x8d902edd  ! 1836: WRPR_PSTATE_I	wrpr	%r0, 0x0edd, %pstate
change_to_tl1_96:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x93902001  ! 1838: WRPR_CWP_I	wrpr	%r0, 0x0001, %cwp
	.word 0x8d90209c  ! 1839: WRPR_PSTATE_I	wrpr	%r0, 0x009c, %pstate
	.word 0x8d802000  ! 1840: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02033  ! 1841: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x83a00dc4  ! 1842: FdMULq	fdmulq	
	.word 0x81982ac2  ! 1843: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac2, %hpstate
	ta	T_CHANGE_TO_TL0	! macro
	ta	T_CHANGE_PRIV	! macro
	.word 0x9cd3e001  ! 1846: UMULcc_I	umulcc 	%r15, 0x0001, %r14
DS_97:
	.word 0x20800001  ! 1848: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1847: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d9024c7  ! 1848: WRPR_PSTATE_I	wrpr	%r0, 0x04c7, %pstate
	.word 0x879023ec  ! 1849: WRPR_TT_I	wrpr	%r0, 0x03ec, %tt
	mov 0x35, %r30
	.word 0x93d0001e  ! 1850: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x879022a5  ! 1851: WRPR_TT_I	wrpr	%r0, 0x02a5, %tt
	.word 0xa190200b  ! 1852: WRPR_GL_I	wrpr	%r0, 0x000b, %-
	.word 0xa1902005  ! 1853: WRPR_GL_I	wrpr	%r0, 0x0005, %-
	.word 0x9b500000  ! 1854: RDPR_TPC	rdpr	%tpc, %r13
	.word 0x8d90248d  ! 1855: WRPR_PSTATE_I	wrpr	%r0, 0x048d, %pstate
	.word 0x8da349a3  ! 1856: FDIVs	fdivs	%f13, %f3, %f6
	.word 0x93902002  ! 1857: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
change_to_tl1_98:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0x879021e7  ! 1859: WRPR_TT_I	wrpr	%r0, 0x01e7, %tt
	ta	T_CHANGE_HPRIV	! macro
	.word 0x8d902601  ! 1861: WRPR_PSTATE_I	wrpr	%r0, 0x0601, %pstate
DS_99:
	.word 0x34800001  ! 1863: BG	bg,a	<label_0x1>
	.word 0xbfe7c000  ! 1862: SAVE_R	save	%r31, %r0, %r31
	.word 0x99a000ce  ! 1863: FNEGd	fnegd	%f14, %f12
	.word 0x9b50c000  ! 1864: RDPR_TT	rdpr	%tt, %r13
	.word 0x93d02032  ! 1865: Tcc_I	tne	icc_or_xcc, %r0 + 50
	.word 0x9a6bc001  ! 1866: UDIVX_R	udivx 	%r15, %r1, %r13
	.word 0x8f51c000  ! 1867: RDPR_TL	rdpr	%tl, %r7
	.word 0xa1902008  ! 1868: WRPR_GL_I	wrpr	%r0, 0x0008, %-
	ta	T_CHANGE_NONHPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x82698008  ! 1871: UDIVX_R	udivx 	%r6, %r8, %r1
	.word 0x99902005  ! 1872: WRPR_CLEANWIN_I	wrpr	%r0, 0x0005, %cleanwin
	mov 0x32, %r30
	.word 0x93d0001e  ! 1873: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x87802014  ! 1874: WRASI_I	wr	%r0, 0x0014, %asi
	.word 0x91d02035  ! 1875: Tcc_I	ta	icc_or_xcc, %r0 + 53
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x36800001  ! 1877: BGE	bge,a	<label_0x1>
	.word 0xa190200a  ! 1878: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x91d02035  ! 1879: Tcc_I	ta	icc_or_xcc, %r0 + 53
	.word 0x93902004  ! 1880: WRPR_CWP_I	wrpr	%r0, 0x0004, %cwp
change_to_tl1_100:
	ta T_CHANGE_PRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xa1902003  ! 1882: WRPR_GL_I	wrpr	%r0, 0x0003, %-
DS_101:
	.word 0x20800001  ! 1884: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1883: SAVE_R	save	%r31, %r0, %r31
	.word 0x8d90244f  ! 1884: WRPR_PSTATE_I	wrpr	%r0, 0x044f, %pstate
	.word 0x93d02030  ! 1885: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0x87902349  ! 1886: WRPR_TT_I	wrpr	%r0, 0x0349, %tt
	.word 0xa190200c  ! 1887: WRPR_GL_I	wrpr	%r0, 0x000c, %-
	mov 0x31, %r30
	.word 0x91d0001e  ! 1888: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	ta	T_CHANGE_NONPRIV	! macro
DS_102:
	not %g0, %g2
	call %g2
	.word 0x9d902003  ! 1890: WRPR_WSTATE_I	wrpr	%r0, 0x0003, %wstate
	.word 0x85500000  ! 1891: RDPR_TPC	rdpr	%tpc, %r2
	mov 0x32, %r30
	.word 0x83d0001e  ! 1892: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x81982b17  ! 1893: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0b17, %hpstate
	ta	T_CHANGE_HPRIV	! macro
	ta	T_CHANGE_NONHPRIV	! macro
	.word 0x89a000cf  ! 1896: FNEGd	fnegd	%f46, %f4
	.word 0x91d02034  ! 1897: Tcc_I	ta	icc_or_xcc, %r0 + 52
	mov 0x31, %r30
	.word 0x91d0001e  ! 1898: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93d02035  ! 1899: Tcc_I	tne	icc_or_xcc, %r0 + 53
	mov 0x30, %r30
	.word 0x91d0001e  ! 1900: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x82d2c00a  ! 1901: UMULcc_R	umulcc 	%r11, %r10, %r1
	.word 0x80fba001  ! 1902: SDIVcc_I	sdivcc 	%r14, 0x0001, %r0
	.word 0x8d902e5e  ! 1903: WRPR_PSTATE_I	wrpr	%r0, 0x0e5e, %pstate
	.word 0x93d02030  ! 1904: Tcc_I	tne	icc_or_xcc, %r0 + 48
	.word 0xc0cfe010  ! 1905: LDSBA_I	ldsba	[%r31, + 0x0010] %asi, %r0
	.word 0x93902003  ! 1906: WRPR_CWP_I	wrpr	%r0, 0x0003, %cwp
	.word 0x87802080  ! 1907: WRASI_I	wr	%r0, 0x0080, %asi
	.word 0x8d902cdf  ! 1908: WRPR_PSTATE_I	wrpr	%r0, 0x0cdf, %pstate
	.word 0x8d504000  ! 1909: RDPR_TNPC	rdpr	%tnpc, %r6
	mov 0x33, %r30
	.word 0x91d0001e  ! 1910: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x93902000  ! 1911: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0xcc8008a0  ! 1912: LDUWA_R	lduwa	[%r0, %r0] 0x45, %r6
	.word 0x8d902c15  ! 1913: WRPR_PSTATE_I	wrpr	%r0, 0x0c15, %pstate
DS_103:
	.word 0x34800001  ! 1915: BG	bg,a	<label_0x1>
	.word 0xbfefc000  ! 1914: RESTORE_R	restore	%r31, %r0, %r31
DS_104:
	.word 0x20800001  ! 1916: BN	bn,a	<label_0x1>
	.word 0xbfe7c000  ! 1915: SAVE_R	save	%r31, %r0, %r31
	.word 0x89b18fe9  ! 1916: FONES	fones	%f4
	.word 0xa190200a  ! 1917: WRPR_GL_I	wrpr	%r0, 0x000a, %-
	.word 0x9b51c000  ! 1918: RDPR_TL	rdpr	%tl, %r13
	.word 0xdac80e60  ! 1919: LDSBA_R	ldsba	[%r0, %r0] 0x73, %r13
	mov 0x31, %r30
	.word 0x83d0001e  ! 1920: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8d902240  ! 1921: WRPR_PSTATE_I	wrpr	%r0, 0x0240, %pstate
	.word 0x819824cb  ! 1922: WRHPR_HPSTATE_I	wrhpr	%r0, 0x04cb, %hpstate
	.word 0x9db20fed  ! 1923: FONES	fones	%f14
	.word 0x819821cb  ! 1924: WRHPR_HPSTATE_I	wrhpr	%r0, 0x01cb, %hpstate
	.word 0xa1902001  ! 1925: WRPR_GL_I	wrpr	%r0, 0x0001, %-
	.word 0x93902002  ! 1926: WRPR_CWP_I	wrpr	%r0, 0x0002, %cwp
	.word 0x87902034  ! 1927: WRPR_TT_I	wrpr	%r0, 0x0034, %tt
	mov 0x34, %r30
	.word 0x91d0001e  ! 1928: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x83d02034  ! 1929: Tcc_I	te	icc_or_xcc, %r0 + 52
	.word 0x8ad9800e  ! 1930: SMULcc_R	smulcc 	%r6, %r14, %r5
	.word 0x87902130  ! 1931: WRPR_TT_I	wrpr	%r0, 0x0130, %tt
	.word 0x8d802004  ! 1932: WRFPRS_I	wr	%r0, 0x0004, %fprs
	.word 0xa1902004  ! 1933: WRPR_GL_I	wrpr	%r0, 0x0004, %-
	.word 0x91d02033  ! 1934: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x93902007  ! 1935: WRPR_CWP_I	wrpr	%r0, 0x0007, %cwp
	ta	T_CHANGE_TO_TL0	! macro
	.word 0x93d02034  ! 1937: Tcc_I	tne	icc_or_xcc, %r0 + 52
	.word 0x34700001  ! 1938: BPG	<illegal instruction>
	.word 0x87902050  ! 1939: WRPR_TT_I	wrpr	%r0, 0x0050, %tt
change_to_tl1_105:
	ta T_CHANGE_HPRIV
	ta	T_CHANGE_TO_TL1	! macro
	.word 0xcad004a0  ! 1941: LDSHA_R	ldsha	[%r0, %r0] 0x25, %r5
	.word 0x8d902052  ! 1942: WRPR_PSTATE_I	wrpr	%r0, 0x0052, %pstate
	.word 0x91d02033  ! 1943: Tcc_I	ta	icc_or_xcc, %r0 + 51
	.word 0x34700001  ! 1944: BPG	<illegal instruction>
	.word 0x87902289  ! 1945: WRPR_TT_I	wrpr	%r0, 0x0289, %tt
	.word 0x8d902cda  ! 1946: WRPR_PSTATE_I	wrpr	%r0, 0x0cda, %pstate
	.word 0xcaffc02e  ! 1947: SWAPA_R	swapa	%r5, [%r31 + %r14] 0x01
	mov 0x30, %r30
	.word 0x83d0001e  ! 1948: Tcc_R	te	icc_or_xcc, %r0 + %r30
	mov 0x33, %r30
	.word 0x91d0001e  ! 1949: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x879022f2  ! 1950: WRPR_TT_I	wrpr	%r0, 0x02f2, %tt
	mov 0x31, %r30
	.word 0x91d0001e  ! 1951: Tcc_R	ta	icc_or_xcc, %r0 + %r30
	.word 0x91d02032  ! 1952: Tcc_I	ta	icc_or_xcc, %r0 + 50
	.word 0x8cd9c005  ! 1953: SMULcc_R	smulcc 	%r7, %r5, %r6
	.word 0x81982ac1  ! 1954: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0ac1, %hpstate
DS_106:
	.word 0x20800001  ! 1956: BN	bn,a	<label_0x1>
	.word 0xc931a001  ! 1956: STQF_I	-	%f4, [0x0001, %r6]
	normalw
	.word 0x83458000  ! 1955: RD_SOFTINT_REG	rd	%softint, %r1
	.word 0xc29004a0  ! 1956: LDUHA_R	lduha	[%r0, %r0] 0x25, %r1
	.word 0x85514000  ! 1957: RDPR_TBA	rdpr	%tba, %r2
	.word 0xc4c80e40  ! 1958: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r2
	.word 0x83b2cfee  ! 1959: FONES	fones	%f1
	.word 0x9c806001  ! 1960: ADDcc_I	addcc 	%r1, 0x0001, %r14
	mov 0x30, %r30
	.word 0x93d0001e  ! 1961: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	mov 0x32, %r30
	.word 0x93d0001e  ! 1962: Tcc_R	tne	icc_or_xcc, %r0 + %r30
	.word 0x8d9028de  ! 1963: WRPR_PSTATE_I	wrpr	%r0, 0x08de, %pstate
	.word 0x879021fe  ! 1964: WRPR_TT_I	wrpr	%r0, 0x01fe, %tt
	mov 0x35, %r30
	.word 0x83d0001e  ! 1965: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0xdc9fe001  ! 1966: LDDA_I	ldda	[%r31, + 0x0001] %asi, %r14
	.word 0x81982555  ! 1967: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0555, %hpstate
	.word 0x87902190  ! 1968: WRPR_TT_I	wrpr	%r0, 0x0190, %tt
	.word 0x81982bdd  ! 1969: WRHPR_HPSTATE_I	wrhpr	%r0, 0x0bdd, %hpstate
DS_107:
	.word 0x20800001  ! 1971: BN	bn,a	<label_0x1>
	.word 0xdb33e001  ! 1971: STQF_I	-	%f13, [0x0001, %r15]
	normalw
	.word 0x95458000  ! 1970: RD_SOFTINT_REG	rd	%softint, %r10
	mov 0x35, %r30
	.word 0x91d0001e  ! 1971: Tcc_R	ta	icc_or_xcc, %r0 + %r30
DS_108:
	.word 0x20800001  ! 1973: BN	bn,a	<label_0x1>
	.word 0xc130e001  ! 1973: STQF_I	-	%f0, [0x0001, %r3]
	normalw
	.word 0x87458000  ! 1972: RD_SOFTINT_REG	rd	%softint, %r3
	.word 0x87902324  ! 1973: WRPR_TT_I	wrpr	%r0, 0x0324, %tt
	.word 0x93902005  ! 1974: WRPR_CWP_I	wrpr	%r0, 0x0005, %cwp
	.word 0x9b50c000  ! 1975: RDPR_TT	rdpr	%tt, %r13
	.word 0x87902272  ! 1976: WRPR_TT_I	wrpr	%r0, 0x0272, %tt
	.word 0x88d3000b  ! 1977: UMULcc_R	umulcc 	%r12, %r11, %r4
	mov 0x34, %r30
	.word 0x83d0001e  ! 1978: Tcc_R	te	icc_or_xcc, %r0 + %r30
	.word 0x8198285b  ! 1979: WRHPR_HPSTATE_I	wrhpr	%r0, 0x085b, %hpstate
	.word 0x8d902c58  ! 1980: WRPR_PSTATE_I	wrpr	%r0, 0x0c58, %pstate
	.word 0x87902071  ! 1981: WRPR_TT_I	wrpr	%r0, 0x0071, %tt
	.word 0x87508000  ! 1982: RDPR_TSTATE	rdpr	%tstate, %r3
	.word 0x8ba209e7  ! 1983: FDIVq	dis not found

	.word 0x8d9026d8  ! 1984: WRPR_PSTATE_I	wrpr	%r0, 0x06d8, %pstate
	.word 0x8d802000  ! 1985: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x8d802000  ! 1986: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x87902030  ! 1987: WRPR_TT_I	wrpr	%r0, 0x0030, %tt
	.word 0x87902092  ! 1988: WRPR_TT_I	wrpr	%r0, 0x0092, %tt
	.word 0x9151c000  ! 1989: RDPR_TL	rdpr	%tl, %r8
	.word 0xd0cfe030  ! 1990: LDSBA_I	ldsba	[%r31, + 0x0030] %asi, %r8
	.word 0xd0c80e40  ! 1991: LDSBA_R	ldsba	[%r0, %r0] 0x72, %r8
DS_109:
	.word 0x20800001  ! 1993: BN	bn,a	<label_0x1>
	pdist %f2, %f14, %f28
	.word 0x99b0030a  ! 1992: ALLIGNADDRESS	alignaddr	%r0, %r10, %r12
	.word 0x8fb3cfe0  ! 1993: FONES	fones	%f7
	.word 0x93902000  ! 1994: WRPR_CWP_I	wrpr	%r0, 0x0000, %cwp
	.word 0x8d802000  ! 1995: WRFPRS_I	wr	%r0, 0x0000, %fprs
	.word 0x91d02031  ! 1996: Tcc_I	ta	icc_or_xcc, %r0 + 49
	ta	T_CHANGE_NONPRIV	! macro
	.word 0x8d9024d7  ! 1998: WRPR_PSTATE_I	wrpr	%r0, 0x04d7, %pstate


.global user_data_start
.data
user_data_start:
	.xword	0x847b00f5df39d7b7
	.xword	0x912c775b50d40781
	.xword	0x512f5ebe1b389420
	.xword	0x2d62457ade56d05f
	.xword	0xd627d55b32a7516a
	.xword	0xf02548b3a2a6d8ea
	.xword	0x999ae0b29ea4aaa1
	.xword	0x79c690051588f3e3
	.xword	0x99b3c2b8364c1b71
	.xword	0xf0a75e466f1b7e98
	.xword	0x1bd3003b0badfa7c
	.xword	0xc957632cbdd33e96
	.xword	0x960c7aebffe18c3f
	.xword	0x2ec5e0c8ecf1986b
	.xword	0x3412fda518c112e2
	.xword	0xfc1b115d215dea2c
	.xword	0x66113b7d3bb579f6
	.xword	0x5103d776a1937cfe
	.xword	0x474818d6863c26ff
	.xword	0xd3d327820e4e95ed
	.xword	0xe76dc7b1f79fa40e
	.xword	0x4c62c696eccc7130
	.xword	0x89e657b38a8d02c5
	.xword	0xb05ec7dd1eb3f41b
	.xword	0xeed6b767848fb971
	.xword	0xebffc654434f56a4
	.xword	0xd86ab313384dfb84
	.xword	0x1d02226134c2ef8d
	.xword	0xe1aa66536944d95f
	.xword	0x8cf0c251eba0afbb
	.xword	0x1735c81e063c2df3
	.xword	0x875318881490bd2e
	.xword	0xeafaff41c8b7e39a
	.xword	0x769df81aff5e001b
	.xword	0xc2e1f97e727f90ea
	.xword	0xb9c98a3031f1cddd
	.xword	0x1dbea1717f1546de
	.xword	0xbfadba49ea4a117b
	.xword	0x1abd9dc0830054ab
	.xword	0x42a6fbf3e1dcb00c
	.xword	0xed93f71e2756a2d1
	.xword	0xb1554138d2ee0882
	.xword	0x5ef761ea9a9ad795
	.xword	0x97a9569fc84fb831
	.xword	0xccad0cb65f1e89cb
	.xword	0xbf6a28810813ff07
	.xword	0xe53c6419d88d636c
	.xword	0x30629ed69d5dc74a
	.xword	0xfa849a8907370829
	.xword	0x18e4272ad351f844
	.xword	0xa8038996a41bc61b
	.xword	0x8da822ef8ee3e810
	.xword	0xd24ce2e25264c7c3
	.xword	0x719f020d91b02c8a
	.xword	0x9dc90694fbed54cd
	.xword	0x4470fda1e47497ec
	.xword	0x62c51eb66530e27b
	.xword	0x86038d426cbb09a0
	.xword	0x0910fc14d2ed783d
	.xword	0x0bdb1b60516b3853
	.xword	0x17ce0969bdad10c3
	.xword	0x6d36dec4b720aa53
	.xword	0xec6212c2b043708b
	.xword	0xe383286c9575231a
	.xword	0x0702fe74483349ca
	.xword	0xa0a955c782290cf1
	.xword	0xdff7fe0e2cff41c9
	.xword	0x9242b3efd9a3c936
	.xword	0xe8f019be0574d074
	.xword	0x1190db90a101e405
	.xword	0x382a29cfac9487db
	.xword	0x3bbd4c0bc9adbd49
	.xword	0x89360b83f2e3ca2d
	.xword	0x457015cc10605405
	.xword	0x0e2ea296a1033040
	.xword	0xfb2503fff954b7c7
	.xword	0x12d13c6260cd2e78
	.xword	0x175145d6cd46bff8
	.xword	0xa952e5d6ab31aee9
	.xword	0xf066158cd4444d29
	.xword	0x17b7962411a6f79f
	.xword	0xe305038cc83c6eb1
	.xword	0x0e670ee4b50369cd
	.xword	0x293397362eebfeeb
	.xword	0x26e4d620534ab9de
	.xword	0x04710b36f2dc96cd
	.xword	0xbf1d76d702e6f811
	.xword	0x29311d2ec84d70e4
	.xword	0x347ea849cc62662b
	.xword	0xb13c2c7f7f88a8bb
	.xword	0x9af7e5bc9c506074
	.xword	0xd9056ca063acc495
	.xword	0xa559041961fc54bf
	.xword	0xe9bb4192c5673a3c
	.xword	0xaddd23da86145b1d
	.xword	0xb096f48b341c0f77
	.xword	0xeccd883ed43e3e78
	.xword	0xe0affd44f67e8d02
	.xword	0x7b31e19d189bc2aa
	.xword	0x43cd1e36fb98ff55
	.xword	0x57ba6b8af6754f66
	.xword	0xed7b7f6d98b6a156
	.xword	0x0776c94368e3ea13
	.xword	0x3339f2976865d837
	.xword	0x935e6c5a92257004
	.xword	0x07892f5f943dcd01
	.xword	0x0c3edd1cc7e2ad46
	.xword	0xf753f51b48e7fee6
	.xword	0x4abd122ac7e997ce
	.xword	0x11fb67e28a6b53ec
	.xword	0x01ee75e3402981a0
	.xword	0x5ec402a8a22a955d
	.xword	0x05a0400b69d55015
	.xword	0x5eef5965d4b0fdb3
	.xword	0xfa119cf5b4507f05
	.xword	0x4f5bb53a8627a690
	.xword	0xe6ffacb228763bc2
	.xword	0xbe5622576e9a47e2
	.xword	0xf9cabe155d54f6d3
	.xword	0x8d51bc486a9d5ee3
	.xword	0x29f42d79e6d14644
	.xword	0x74193fe490561939
	.xword	0x5f836f232024b2af
	.xword	0xc2ba31ec184c786b
	.xword	0xeaa9a012c724c6f8
	.xword	0x1d87aed02ef3d979
	.xword	0x708e93e7c11e27db
	.xword	0xd91bd8ae0b6405f6
	.xword	0x6a31b410bcc029a7
	.xword	0xbd1b6e021f2919e7
	.xword	0x8db1aec6aa53f3d5
	.xword	0x71ac4c604020a082
	.xword	0x57aa1561e4970284
	.xword	0x9d2d24aca0f768f1
	.xword	0xb7df9086bacd18db
	.xword	0x4ad8ea0731133082
	.xword	0x41eff6b7b23dae99
	.xword	0xcd8f150b7ea04ca5
	.xword	0x932ee52ba83caedd
	.xword	0x04d265d14a454dde
	.xword	0x7f5f6b03251b6b6f
	.xword	0x98a88e37fe8ef075
	.xword	0x1b26ada0819c00a6
	.xword	0xaa558a6e811c0ef4
	.xword	0x21e2b5383a43a9ba
	.xword	0x46add18271bda568
	.xword	0x822c000391c9e9bf
	.xword	0xc58f2c5de4114b0b
	.xword	0x563d6172614d671c
	.xword	0xfe10266212371472
	.xword	0x7838efc219f33c46
	.xword	0x098d70a35ebcadce
	.xword	0xcbe3c3223a47be5d
	.xword	0x39a5f854781b9d86
	.xword	0x8fd72cfe4c28048c
	.xword	0x1dc0f324379118a9
	.xword	0x67d3efa92112de1d
	.xword	0xe7ecd1b64aae0742
	.xword	0xe235d6b63744692f
	.xword	0xd7668cd131f53ded
	.xword	0x38086a36ca6c3f99
	.xword	0x9ac950f93b9e2f6f
	.xword	0xb3303cefa8f38ba0
	.xword	0xf31385e14b05f513
	.xword	0xf56399053d1e9868
	.xword	0x6097cfa5420ee2f2
	.xword	0x82313079e7fa511f
	.xword	0x3abf291fb96ba66b
	.xword	0x3dce5e1714df974a
	.xword	0xb5e1fb285278d548
	.xword	0xb5018654560b2137
	.xword	0xabc00a53775ac175
	.xword	0x8413a96cbc9df567
	.xword	0x1ed3e546f1caebcc
	.xword	0x9f839b41ac2df757
	.xword	0x8fab7815fa669e21
	.xword	0xf450214f7db12987
	.xword	0x258aa1c3c87ccb97
	.xword	0x9524eb2c143e842d
	.xword	0x4a6222b04241a177
	.xword	0xbf3f3782e084dc5f
	.xword	0x6e5d070b92945acd
	.xword	0xa1769601ba6bfb4e
	.xword	0xc423b5786b8bc520
	.xword	0x4c0ef81ba6fa196a
	.xword	0x2021ce5bf1c5c1cc
	.xword	0x6dc35868499735fd
	.xword	0x2a0a0f25d94ca58a
	.xword	0x03ea00a88e7a596c
	.xword	0xea0408c48717d98e
	.xword	0x4cbf2e5f983f5752
	.xword	0x36b6f401062ea31a
	.xword	0x6fa42ee8a206dce2
	.xword	0x887ff01754e414c6
	.xword	0xaa460661da14e449
	.xword	0x9d93fa16d9752867
	.xword	0x99b4e6e8b74ca52f
	.xword	0x5d0e0eb869e7b010
	.xword	0x345ee0536a921526
	.xword	0x5aa7c4d320b41ce8
	.xword	0xd77a56e7a47d3bcb
	.xword	0x5fc878dee4538cd5
	.xword	0xc3c42b5280d104e6
	.xword	0xfb68a4f11f9587cb
	.xword	0x43dfd2cc0963f361
	.xword	0x064d9abf4919df0c
	.xword	0xce314b436aef4016
	.xword	0x1a067b9ad74fdcd5
	.xword	0x80dfb35d8ee6a554
	.xword	0x031e75f6bf05bdec
	.xword	0x500d207c964b68c8
	.xword	0x19fc6fa5a5dc36e6
	.xword	0x4e573f1d3c007170
	.xword	0xc91418f5f7684b22
	.xword	0x609669e79bbb34d2
	.xword	0x7abd87dbe07f7567
	.xword	0x7814137c102343a5
	.xword	0x7558d96433c20371
	.xword	0xa49f3b25e0ffbfc4
	.xword	0x3b8f93c35e96f0ac
	.xword	0x326da5c274505206
	.xword	0x78a7619745b5fa22
	.xword	0x1d8e52b3f2a0db58
	.xword	0x7a3f45016a1c4bb4
	.xword	0x57fb395abaa676af
	.xword	0x4967889188c43a14
	.xword	0x8f253ac1d1180d87
	.xword	0x6ee133fa7e519e0f
	.xword	0xee9b123f72c4aeba
	.xword	0x6beeed0959a2de0d
	.xword	0x771521b4f7a51590
	.xword	0x793b95f8853769e1
	.xword	0x3ad174d0ee3729d5
	.xword	0xcc089ba202fd7d36
	.xword	0x43f18e66efcf2ece
	.xword	0xad0dc679be12791e
	.xword	0xe550a2efe08397a0
	.xword	0x1f2ed76a024e9c85
	.xword	0xa2b439d5a6e28a99
	.xword	0x45b1763970025e1c
	.xword	0xe45a82fca9f10c5f
	.xword	0xabe951da669939af
	.xword	0x06668f80907119c5
	.xword	0x272b8c7c02a0406c
	.xword	0x508ef3e30972a084
	.xword	0x63ffac8354696543
	.xword	0x0339f995fa273dbd
	.xword	0x4204656efbd145f2
	.xword	0x9b2148d3eb3f2ea6
	.xword	0x6e514fa4a2f644f1
	.xword	0x78ad5160ec3ce6c0
	.xword	0x2af2cb5cd56cfb3b
	.xword	0x5c09113cfed41725
	.xword	0xa1ff9130f06d6315
	.xword	0xe83930eed03a4d81
	.xword	0x4ba11a92df310473


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

SECTION .HTRAPS
.text
htrap_5_ext:
    rd %pc, %g2
    inc %g3
    add %g2, htrap_5_ext_done-htrap_5_ext, %g2
    rdpr %tl, %g3
    rdpr %tstate, %g4
    rdhpr %htstate, %g5
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
    ! Lower the Trap Level
    wrpr    %g0, 1, %tl
    ! Skip the instruction
    done


#if 0
!!# /*
!!#  output of /import/bw/tools/local/indra-release/indra,1.4.11/bin/ijpp (indrajal preprocessor) - Sun Apr 11 18:25:04 2004
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
!!#     IJ_set_ropr_fld("diag.j", 46, ijdefault, Ft_Rs1, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 47, ijdefault, Ft_Rs2, "5'b0rrrr");
!!#     IJ_set_ropr_fld("diag.j", 48, ijdefault, Ft_Rd, "5'b0rrrr");
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
!!#             j=i*8;
!!#             IJ_printf  ("diag.j", 136, th0,"\tldx [%%r31+%d], %%r%d\n", j,i);
!!#         }
!!#         IJ_printf  ("diag.j", 138, th0,"\tmov 0x%rx, %%r30\n", Rv_init_trap);
!!#         IJ_printf  ("diag.j", 139, th0,"\tsave %%r31, %%r0, %%r31\n");
!!#     }
!!#     for (k=0; k<3; k++) {
!!#         IJ_printf  ("diag.j", 142, th0,"\trestore\n");
!!#     }
!!# 
!!#     IJ_printf  ("diag.j", 145, th0,"!Initializing float registers\n");
!!#     for (i = 0; i < 31; i=i+2) {
!!#         j=i*8;
!!#         IJ_printf  ("diag.j", 148, th0,"\tldd [%%r31+%d], %%f%d\n", j,i);
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
!!#     IJ_printf  ("diag.j", 154, th0,"\n\n.global user_data_start\n.data\nuser_data_start:\n");
!!#     for (i = 0; i < 256; i++) {
!!#         IJ_printf  ("diag.j", 156, th0,"\t.xword\t0x%016llrx\n", Rv_rand_64);
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
!!#         IJ_generate ("diag.j", 195, th0, $2);
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
!!# ;
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
!!#         IJ_printf("diag.j", 230, th0, "change_to_tl1_%d:\n", label);
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 232, th0, "\tta T_CHANGE_HPRIV\n");
!!#         } else {
!!#             IJ_printf("diag.j", 234, th0, "\tta T_CHANGE_PRIV\n");
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
!!#      IJ_printf("diag.j", 281, th0, "\tmov 0x%rx, %%r30\n", Rv_init_trap);
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
!!#         | tLDQFA_I | tLDSTUB_I
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
!!#         IJ_printf("diag.j", 365, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 366,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         IJ_generate_from_token("diag.j", 367,1, th0, ijdefault, tSTQF_I, tSTQF_R, -1);;
!!#         IJ_printf("diag.j", 368, th0, "\tnormalw\n");
!!#     } 
!!#     | tALLIGNADDRESS
!!#     {
!!#         IJ_printf("diag.j", 372, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 373,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (! label%3) {
!!#             IJ_generate_from_token("diag.j", 375,1, th0, ijdefault,tFDIVd, tPOPC_I, -1);;
!!#         } else if (label%3 == 1) {
!!#             IJ_printf("diag.j", 377, th0, "\tallclean\n");
!!#         } else {
!!#             IJ_printf("diag.j", 379, th0, "\tpdist %%f%rd, %%f%rd, %%f%rd\n", Rv_pdist_reg, Rv_pdist_reg, Rv_pdist_reg);
!!#         }
!!#     } 
!!#     | tFADDs
!!#     {
!!#         IJ_printf("diag.j", 384, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 385,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         if (label%2) {
!!#             IJ_printf("diag.j", 387, th0, "\tilltrap\n");
!!#         } else {
!!#             IJ_generate_from_token("diag.j", 389,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#         }
!!#         IJ_generate_from_token("diag.j", 391,1, th0, ijdefault, tFSQRTd, tLDSTUB_I, -1);;
!!#     } 
!!# 
!!# ;
!!# 
!!# br_longdelay : tSAVE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 398, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 399,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     } 
!!#     | tRESTORE_R %ropr  Ro_save_restore
!!#     {
!!#         IJ_printf("diag.j", 403, th0, "DS_%d:\n", label); label++;
!!#         IJ_generate_from_token("diag.j", 404,1, th0, ijdefault, tBN, tBNE, tBE, tBG, -1);;
!!#     }
!!#     | tWRPR_CLEANWIN_I %ropr  Ro_winops  | tWRPR_WSTATE_I %ropr  Ro_winops
!!#     {
!!#         IJ_printf("diag.j", 408, th0, "DS_%d:\n", label); label++;
!!#         IJ_printf("diag.j", 409, th0, "\tnot %%g0, %%g2\n");
!!#         IJ_printf("diag.j", 410, th0, "\tcall %%g2\n");
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
